#include "ezcat_master.h"

#if defined(__INTIME__)
#ifndef __C99__
#define __C99__ 1
#endif
#endif

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#if defined(_WIN32) && !defined(__INTIME__)
#include <windows.h>
#else
#include <rt.h>
#include <net/ethernet.h>
#endif

#if !defined(ETHERTYPE_ETHERCAT)
#define ETHERTYPE_ETHERCAT 0x88A4u
#endif

static void ezcat_ms_sleep(unsigned ms) {
#if defined(_WIN32) && !defined(__INTIME__)
  Sleep(ms);
#else
  for (;;) {
    unsigned chunk = ms > 255u ? 255u : ms;
    if (chunk == 0) {
      break;
    }
    RtSleep((unsigned char)chunk);
    if (ms <= chunk) {
      break;
    }
    ms -= chunk;
  }
#endif
}

/* EtherCAT DL レジスタ (ETG.1000) */
#define EC_REG_TYPE 0x0000u
#define EC_REG_REVISION 0x0002u
#define EC_REG_BUILD 0x0004u
#define EC_REG_STADR 0x0010u /* Configured station address */
#define EC_REG_ALIAS 0x0012u /* Configured station alias */
#define EC_REG_ALCTL 0x0120u
#define EC_REG_ALSTAT 0x0130u
/* SII EEPROM インタフェース（ET1100 系 ESC と同一番地が多い） */
#define EC_REG_EEPCTL 0x0502u
#define EC_REG_EEPADR 0x0504u
#define EC_REG_EEPDAT 0x0508u
#define EC_EEP_BUSY 0x8000u
#define EC_EEP_CMD_READ 0x0100u

/* ETG.1020 SII カテゴリ型 */
#define SII_CAT_STRINGS 0x000Au
#define SII_CAT_GENERAL 0x001Eu
#define SII_CAT_SM 0x0004u      /* ETG.1020 Sync Manager チャンネル列 */
#define SII_CAT_SM_ALT 0x0029u /* 一部 ESI で 41(0x29) */
#define SII_CAT_END 0xFFFFu

#define EC_MBXTYPE_COE 0x03u
#define EC_COE_HDR_REQ 0x10u /* SDO request */
#define EC_COE_HDR_RES 0x30u /* SDO response */
#define EC_SDO_UPLOAD_REQ 0x40u    /* Initiate Upload Request */
#define EC_SDO_UPLOAD_NORMAL 0x41u /* normal upload initiate response (size + data / segments) */
#define EC_SDO_EXP_UPL_1 0x4Fu     /* Expedited upload 1 byte */
#define EC_SDO_SEG_UP_REQ 0x60u    /* Upload Segment Request (+ toggle bit 4) */
#define EC_SDO_ABORT 0x80u

#define EC_CMD_APRD 0x01u
#define EC_CMD_APWR 0x02u
#define EC_CMD_BRD 0x07u
#define EC_CMD_BWR 0x08u

#define EC_STATE_INIT 0x0001u
#define EC_STATE_PREOP 0x0002u
#define EC_STATE_SAFEOP 0x0004u
#define EC_STATE_OP 0x0008u

/* AL Control 0x0120 bit4: Acknowledge（遷移要求の確認。未設定だと INIT から動かない実機あり） */
#define EC_ALCTL_ACK 0x0010u

#define EC_ECATTYPE 0x1000u /* EtherCAT PDU タイプ (bits 12..15) */

/* BRD タイムアウト時: WKC=0 のフレームだけ見た（送信エコーのみでスレーブ応答なし） */
static int s_ecat_saw_wkc0_only;
/* print_slave_inventory と同じ APRD/EEPROM タイムアウトを PREOP 後の CoE に使う */
static unsigned s_inv_ap_tmo_ms = 120u;

static void wle16(uint8_t *p, uint16_t v) {
  p[0] = (uint8_t)(v & 0xffu);
  p[1] = (uint8_t)((v >> 8) & 0xffu);
}

static void wbe16(uint8_t *p, uint16_t v) {
  p[0] = (uint8_t)((v >> 8) & 0xffu);
  p[1] = (uint8_t)(v & 0xffu);
}

static uint16_t rle16(const uint8_t *p) {
  return (uint16_t)p[0] | ((uint16_t)p[1] << 8);
}

static int env_truthy(const char *v) {
  return v && (v[0] == '1' || v[0] == 'y' || v[0] == 'Y');
}

static unsigned ezcat_parse_u(const char *s) {
  unsigned n = 0;
  if (!s) {
    return 0;
  }
  while (*s >= '0' && *s <= '9') {
    n = n * 10u + (unsigned)(*s - '0');
    if (n > 10000u) {
      break;
    }
    s++;
  }
  return n;
}

static void eth_broadcast(uint8_t *dst) {
  memset(dst, 0xFF, 6);
}

static int ecat_pdu_offset(const uint8_t *frame) {
  uint16_t et;
  if (!frame) {
    return 16;
  }
  et = ezcat_ethertype_be_at(frame + 12);
  /* 802.1Q / QinQ 外側: EtherCAT は内側 Ethertype の後ろから */
  if (et == 0x8100u || et == 0x88a8u || et == 0x9100u) {
    return 18;
  }
  return 16;
}

/*
 * 単一 datagram を ECAT PDU 先頭に配置 (frame[16] から pdu_len バイト)
 * datagram: 10 バイトヘッダ + data_len + 2 バイト WKC
 */
/*
 * APRD/APWR 等のオートインクリメント物理アドレス（ETG.1000）:
 * マスタ直後の先頭スレーブは ADP=0、2 番目は 0xFFFF（-1）、3 番目は 0xFFFE …
 * 誤って ADP=pos とすると先頭以外へ届かない。
 */
static uint16_t ecat_ap_adp_for_position(int pos) {
  return (uint16_t)(0u - (unsigned)pos);
}

static int build_1dg(uint8_t *pdu, uint8_t cmd, uint8_t idx, uint16_t adp, uint16_t ado,
                     uint16_t data_len, const uint8_t *wr_data) {
  uint16_t len_flags = (uint16_t)(data_len & 0x07ffu);
  pdu[0] = cmd;
  pdu[1] = idx;
  wle16(pdu + 2, adp);
  wle16(pdu + 4, ado);
  wle16(pdu + 6, len_flags);
  wle16(pdu + 8, 0);
  if (wr_data && data_len) {
    memcpy(pdu + 10, wr_data, data_len);
  } else if (data_len) {
    memset(pdu + 10, 0, (size_t)data_len);
  }
  wle16(pdu + 10 + data_len, 0);
  return 10 + (int)data_len + 2;
}

static uint16_t read_wkc_1dg(const uint8_t *frame, int data_len) {
  int off = ecat_pdu_offset(frame);
  const uint8_t *p = frame + off + 10 + data_len;
  return rle16(p);
}

static void read_data_1dg(const uint8_t *frame, int data_len, uint8_t *out) {
  int off = ecat_pdu_offset(frame);
  memcpy(out, frame + off + 10, (size_t)data_len);
}

/*
 * 送信 1 回のあと、WKC が min_wkc 未満の 0x88A4（自分の TX のエコー等）は捨てて受信を続ける。
 * Npcap で先に WKC=0 の同一フレームが返ることがある。
 */
static int ecat_send_then_recv_min_wkc(ezcat_master_t *m, int pdu_len, unsigned tmo_ms, int data_len,
                                       uint16_t min_wkc) {
  int eth_len = 14 + 2 + pdu_len;
  unsigned used = 0;
#if EZCAT_DEBUG_ALL
  unsigned dbg_pass = 0;
#endif

  if (eth_len > EZCAT_FRAME_MAX) {
    return -1;
  }
  s_ecat_saw_wkc0_only = 0;
#if EZCAT_DEBUG_ALL
  printf("ezcat: debug: send ECAT eth_len=%d pdu_payload=%d min_wkc=%u tmo_ms=%u\n", eth_len, pdu_len,
         (unsigned)min_wkc, (unsigned)tmo_ms);
#endif
  if (ezcat_lowsock_send(&m->link, m->tx, eth_len) != 0) {
    return -1;
  }
  while (used < tmo_ms) {
    unsigned slice = tmo_ms - used;
    int tr;
    if (slice > 200u) {
      slice = 200u;
    }
    tr = ezcat_lowsock_recv_ecat(&m->link, m->tx, EZCAT_FRAME_MAX, slice);
    if (tr == -1) {
      return -1;
    }
    if (tr == -2) {
      used += slice;
#if EZCAT_DEBUG_ALL
      printf("ezcat: debug: recv slice timeout used=%u/%u\n", used, (unsigned)tmo_ms);
#endif
      continue;
    }
    {
      uint16_t wkc = read_wkc_1dg(m->tx, data_len);
#if EZCAT_DEBUG_ALL
      if (wkc >= min_wkc) {
        printf("ezcat: debug: accept ECAT rx_len=%d WKC=%u\n", tr, (unsigned)wkc);
      } else if (dbg_pass < 16u) {
        printf("ezcat: debug: discard ECAT rx_len=%d WKC=%u (need >= %u)\n", tr, (unsigned)wkc,
               (unsigned)min_wkc);
        dbg_pass++;
      }
#endif
      if (wkc >= min_wkc) {
        s_ecat_saw_wkc0_only = 0;
        return tr;
      }
      if (min_wkc >= 1u && wkc == 0u) {
        s_ecat_saw_wkc0_only = 1;
      }
    }
    used += 1u;
  }
#if EZCAT_DEBUG_ALL
  printf("ezcat: debug: ecat_send_then_recv_min_wkc total timeout used>=%u\n", (unsigned)tmo_ms);
#endif
  return -3; /* 総待ち tmo_ms 超過（recv の slice 用メッセージと区別） */
}

static int frame_build_eth_ecat(ezcat_master_t *m, int pdu_len) {
  uint16_t eh = (uint16_t)((unsigned)pdu_len & 0x07ffu) | EC_ECATTYPE;
  if (14 + 2 + pdu_len > EZCAT_FRAME_MAX) {
    return -1;
  }
  eth_broadcast(m->tx);
  memcpy(m->tx + 6, m->link.mac, 6);
  wbe16(m->tx + 12, ETHERTYPE_ETHERCAT);
  wle16(m->tx + 14, eh);
  return 0;
}

static int brd_register(ezcat_master_t *m, uint16_t reg_ado, int data_len, unsigned tmo_ms,
                        uint16_t *wkc_out, uint8_t *data_out) {
  int pdu_len = build_1dg(m->tx + 16, EC_CMD_BRD, 0, 0, reg_ado, (uint16_t)data_len, NULL);
  if (frame_build_eth_ecat(m, pdu_len) != 0) {
    return -1;
  }
  {
    int tr = ecat_send_then_recv_min_wkc(m, pdu_len, tmo_ms, data_len, 1u);
    if (tr < 0) {
      if (tr == -3) {
        printf("ezcat: BRD slave scan failed (timeout: no WKC>=1 EtherCAT reply within %u ms)\n",
               (unsigned)tmo_ms);
        if (s_ecat_saw_wkc0_only) {
          printf(
              "ezcat: hint: saw only WKC=0 EtherCAT (TX echo). Check RJ45/cable/slave power; if other "
              "L2 traffic is visible but never WKC>=1, ensure build uses IEEE Ethertype 0x88A4 (BE on "
              "wire).\n");
        }
      } else {
        printf("ezcat: BRD slave scan failed (%s)\n", tr == -2 ? "recv slice timeout" : "error");
        {
          const char *im = ezcat_lowsock_last_io_msg();
          if (im && im[0]) {
            printf("ezcat: %s\n", im);
          }
        }
      }
#if defined(_WIN32) && !defined(__INTIME__)
      printf("ezcat: hint: EZCAT_IF=NIC substring (EZCAT_LISTIF=1); wrong port = no 0x88A4 reply\n");
      printf("ezcat: hint: slaves powered, cable closed ring/line to port, EZCAT_TMO=15000\n");
      printf("ezcat: hint: EZCAT_USE_BPF=1 / EZCAT_DEBUG_RX=1 for experiments\n");
#endif
      return -1;
    }
  }
  if (wkc_out) {
    *wkc_out = read_wkc_1dg(m->tx, data_len);
  }
  if (data_out) {
    read_data_1dg(m->tx, data_len, data_out);
  }
  return 0;
}

static int apwr_register(ezcat_master_t *m, uint16_t adp, uint16_t reg_ado, int data_len,
                         const uint8_t *wr_data, unsigned tmo_ms, uint16_t *wkc_out) {
  int pdu_len = build_1dg(m->tx + 16, EC_CMD_APWR, 0, adp, reg_ado, (uint16_t)data_len, wr_data);
  if (frame_build_eth_ecat(m, pdu_len) != 0) {
    return -1;
  }
  if (ecat_send_then_recv_min_wkc(m, pdu_len, tmo_ms, data_len, 1u) < 0) {
    return -1;
  }
  if (wkc_out) {
    *wkc_out = read_wkc_1dg(m->tx, data_len);
  }
  return 0;
}

static int aprd_register(ezcat_master_t *m, uint16_t adp, uint16_t reg_ado, int data_len,
                         unsigned tmo_ms, uint16_t *wkc_out, uint8_t *data_out) {
  int pdu_len = build_1dg(m->tx + 16, EC_CMD_APRD, 0, adp, reg_ado, (uint16_t)data_len, NULL);
  if (frame_build_eth_ecat(m, pdu_len) != 0) {
    return -1;
  }
  if (ecat_send_then_recv_min_wkc(m, pdu_len, tmo_ms, data_len, 1u) < 0) {
    return -1;
  }
  if (wkc_out) {
    *wkc_out = read_wkc_1dg(m->tx, data_len);
  }
  if (data_out) {
    read_data_1dg(m->tx, data_len, data_out);
  }
  return 0;
}

static int bwr_register(ezcat_master_t *m, uint16_t reg_ado, int data_len, const uint8_t *data,
                        unsigned tmo_ms, uint16_t *wkc_out) {
  int pdu_len = build_1dg(m->tx + 16, EC_CMD_BWR, 0, 0, reg_ado, (uint16_t)data_len, data);
  if (frame_build_eth_ecat(m, pdu_len) != 0) {
    return -1;
  }
  if (ecat_send_then_recv_min_wkc(m, pdu_len, tmo_ms, data_len, (uint16_t)m->slave_count) < 0) {
    return -1;
  }
  if (wkc_out) {
    *wkc_out = read_wkc_1dg(m->tx, data_len);
  }
  return 0;
}

static int eep_wait_idle(ezcat_master_t *m, uint16_t adp, unsigned tmo_ms) {
  unsigned waited = 0;
  while (waited < tmo_ms) {
    uint8_t st[2];
    uint16_t wkc = 0;
    if (aprd_register(m, adp, EC_REG_EEPCTL, 2, 80, &wkc, st) != 0 || wkc != 1u) {
      return -1;
    }
    if ((rle16(st) & EC_EEP_BUSY) == 0u) {
      return 0;
    }
    ezcat_ms_sleep(1);
    waited += 1u;
  }
  return -1;
}

static void eeprom_quiesce_all_slaves(ezcat_master_t *m, unsigned tmo_ms) {
  int i;
  for (i = 0; i < m->slave_count; i++) {
    (void)eep_wait_idle(m, ecat_ap_adp_for_position(i), tmo_ms);
  }
}

static int ecat_eeprom_read_u16(ezcat_master_t *m, int pos, uint16_t word_addr, uint16_t *out,
                                unsigned tmo_ms) {
  uint16_t adp = ecat_ap_adp_for_position(pos);
  uint8_t wbuf[2];
  uint8_t dbuf[4];
  uint16_t wkc = 0;
  uint16_t cmd = EC_EEP_CMD_READ;

  if (!out) {
    return -1;
  }
  if (eep_wait_idle(m, adp, tmo_ms) != 0) {
    return -1;
  }
  wle16(wbuf, word_addr);
  if (apwr_register(m, adp, EC_REG_EEPADR, 2, wbuf, tmo_ms, &wkc) != 0 || wkc != 1u) {
    return -1;
  }
  wle16(wbuf, cmd);
  if (apwr_register(m, adp, EC_REG_EEPCTL, 2, wbuf, tmo_ms, &wkc) != 0 || wkc != 1u) {
    return -1;
  }
  if (eep_wait_idle(m, adp, tmo_ms) != 0) {
    return -1;
  }
  if (aprd_register(m, adp, EC_REG_EEPDAT, 4, tmo_ms, &wkc, dbuf) != 0 || wkc != 1u) {
    return -1;
  }
  *out = rle16(dbuf);
  return 0;
}

static int sii_string_by_index(const uint8_t *p, unsigned nbytes, unsigned want_idx, char *out,
                               size_t outsz) {
  unsigned i = 0;
  unsigned pos = 0;
  if (!p || nbytes == 0 || !out || outsz < 2) {
    return -1;
  }
  while (pos < nbytes) {
    unsigned len = (unsigned)p[pos];
    if (len == 0u) {
      pos += 1u;
      i++;
      if (i > 512u) {
        break;
      }
      continue;
    }
    if (pos + 1u + len > nbytes) {
      break;
    }
    if (i == want_idx) {
      size_t cpy = len;
      if (cpy >= outsz) {
        cpy = outsz - 1u;
      }
      memcpy(out, p + pos + 1, cpy);
      out[cpy] = '\0';
      return 0;
    }
    pos += 1u + len;
    i++;
    if (i > 512u) {
      break;
    }
  }
  return -1;
}

static void sanitize_print_str(char *s) {
  unsigned char *p;
  if (!s) {
    return;
  }
  for (p = (unsigned char *)s; *p; p++) {
    if (*p < 0x20u || *p == 0x7Fu) {
      *p = (unsigned char)'?';
    }
  }
}

/*
 * SII 先頭から nwords 分を走査し、General のデバイス名ストリングインデックスと
 * Strings カテゴリから UTF-8 名を取り出す（ETG.1020）。
 */
static int sii_extract_device_name(const uint16_t *w, unsigned nwords, char *out, size_t outsz) {
  unsigned idx = 0;
  const uint8_t *str_cat = NULL;
  unsigned str_bytes = 0;
  uint16_t dev_str_idx = 0;
  uint8_t gen_dev8 = 0;
  int have_gen = 0;

  while (idx + 2u <= nwords) {
    uint16_t typ = w[idx];
    uint16_t sz = w[idx + 1];
    const uint8_t *payload;

    if (typ == SII_CAT_END) {
      break;
    }
    if (sz > nwords || idx + 2u + sz > nwords) {
      break;
    }
    payload = (const uint8_t *)(w + idx + 2);
    if (typ == SII_CAT_STRINGS) {
      str_cat = payload;
      str_bytes = (unsigned)sz * 2u;
    }
    if (typ == SII_CAT_GENERAL && (unsigned)sz * 2u >= 10u) {
      gen_dev8 = payload[8];
      dev_str_idx = (uint16_t)payload[8] | ((uint16_t)payload[9] << 8);
      have_gen = 1;
    }
    idx += 2u + sz;
  }
  if (!have_gen || !str_cat || str_bytes == 0u) {
    return -1;
  }
  /* 一般的に byte8 がストリングインデックス（byte9 は別フィールド）。UINT16 になる実装もある */
  if (sii_string_by_index(str_cat, str_bytes, (unsigned)gen_dev8, out, outsz) == 0) {
    sanitize_print_str(out);
    return 0;
  }
  if (dev_str_idx != (uint16_t)gen_dev8 && dev_str_idx != 0xFFFFu) {
    if (sii_string_by_index(str_cat, str_bytes, (unsigned)dev_str_idx, out, outsz) == 0) {
      sanitize_print_str(out);
      return 0;
    }
  }
  return -1;
}

/* SII の Sync Manager カテゴリからメールボックス SM0(マスタ→スレーブ) / SM1(返信) の先頭と長さ */
static int sii_parse_sm_mailbox(const uint16_t *w, unsigned nwords, uint16_t *mbx_out_sa, uint16_t *mbx_out_sz,
                                uint16_t *mbx_in_sa, uint16_t *mbx_in_sz) {
  unsigned idx = 0;
  if (!mbx_out_sa || !mbx_out_sz || !mbx_in_sa || !mbx_in_sz) {
    return -1;
  }
  *mbx_out_sa = *mbx_out_sz = *mbx_in_sa = *mbx_in_sz = 0;
  while (idx + 2u <= nwords) {
    uint16_t typ = w[idx];
    uint16_t sz = w[idx + 1];
    const uint8_t *payload;
    unsigned plen;
    if (typ == SII_CAT_END) {
      break;
    }
    if (sz > nwords || idx + 2u + sz > nwords) {
      break;
    }
    if (typ == SII_CAT_SM || typ == SII_CAT_SM_ALT) {
      plen = (unsigned)sz * 2u;
      if (plen >= 16u) {
        payload = (const uint8_t *)(w + idx + 2);
        *mbx_out_sa = (uint16_t)payload[0] | ((uint16_t)payload[1] << 8);
        *mbx_out_sz = (uint16_t)payload[2] | ((uint16_t)payload[3] << 8);
        *mbx_in_sa = (uint16_t)payload[8] | ((uint16_t)payload[9] << 8);
        *mbx_in_sz = (uint16_t)payload[10] | ((uint16_t)payload[11] << 8);
        if (*mbx_out_sa != 0u && *mbx_out_sz >= 16u && *mbx_in_sa != 0u && *mbx_in_sz >= 16u) {
          return 0;
        }
      }
    }
    idx += 2u + sz;
  }
  return -1;
}

static void ecat_coe_fill_mbx_init_upload(uint8_t *tx, uint16_t index, uint8_t subindex) {
  memset(tx, 0, 256);
  tx[0] = 10;
  tx[5] = EC_MBXTYPE_COE;
  tx[6] = EC_COE_HDR_REQ;
  tx[7] = 0;
  tx[8] = EC_SDO_UPLOAD_REQ;
  tx[9] = (uint8_t)(index & 0xffu);
  tx[10] = (uint8_t)(index >> 8);
  tx[11] = subindex;
}

static void ecat_coe_fill_mbx_seg_upload(uint8_t *tx, uint16_t index, uint8_t subindex, uint8_t toggle) {
  memset(tx, 0, 256);
  tx[0] = 10;
  tx[5] = EC_MBXTYPE_COE;
  tx[6] = EC_COE_HDR_REQ;
  tx[7] = 0;
  tx[8] = (uint8_t)(EC_SDO_SEG_UP_REQ | (toggle & 0x10u));
  tx[9] = (uint8_t)(index & 0xffu);
  tx[10] = (uint8_t)(index >> 8);
  tx[11] = subindex;
}

/*
 * CoE SDO Upload（expedited / normal / segmented）。SOEM ecx_SDOread と同様のコマンド解釈。
 * out / out_len: 成功時に実長（max_out で打ち切り可）。
 * 戻り値: 0 成功, -1 タイムアウト/失敗, -2 SDO Abort
 */
static int ecat_coe_sdo_upload(ezcat_master_t *m, int pos, uint16_t index, uint8_t subindex,
                               uint16_t mbx_out_sa, uint16_t mbx_out_len, uint16_t mbx_in_sa,
                               uint16_t mbx_in_len, uint8_t *out, size_t *out_len, size_t max_out,
                               unsigned tmo_ms) {
  uint16_t adp = ecat_ap_adp_for_position(pos);
  uint8_t tx[256];
  uint8_t rx[256];
  unsigned waited;
  int read_len;
  uint16_t wkc;
  unsigned chunk_tmo;
  int seg_guard;

  if (!out || !out_len || max_out == 0u || mbx_out_len < 16u || mbx_in_len < 16u) {
    return -1;
  }
  *out_len = 0;
  chunk_tmo = tmo_ms / 8u + 40u;
  if (chunk_tmo > 500u) {
    chunk_tmo = 500u;
  }
  read_len = (int)mbx_in_len;
  if (read_len > (int)sizeof(rx)) {
    read_len = (int)sizeof(rx);
  }

  ecat_coe_fill_mbx_init_upload(tx, index, subindex);
  (void)aprd_register(m, adp, mbx_in_sa, read_len, 80, &wkc, rx);
  if (apwr_register(m, adp, mbx_out_sa, (int)mbx_out_len, tx, chunk_tmo, &wkc) != 0 || wkc != 1u) {
    return -1;
  }

  for (waited = 0; waited < tmo_ms; waited += 5u) {
    ezcat_ms_sleep(2);
    if (aprd_register(m, adp, mbx_in_sa, read_len, 80, &wkc, rx) != 0 || wkc != 1u) {
      continue;
    }
    if (rx[5] != EC_MBXTYPE_COE) {
      continue;
    }
    for (int k = 6; k + 8 <= read_len; k++) {
      uint8_t cmd = rx[k];
      if (rx[k + 1] != (uint8_t)(index & 0xffu) || rx[k + 2] != (uint8_t)(index >> 8) ||
          rx[k + 3] != subindex) {
        if (cmd == EC_SDO_ABORT) {
          return -2;
        }
        continue;
      }
      if (cmd == EC_SDO_ABORT) {
        return -2;
      }
      /* expedited: CiA301 / SOEM (cmd & 0x02) */
      if ((cmd & 0x02u) != 0u) {
        unsigned nbytes = 4u - (((unsigned)cmd >> 2) & 3u);
        if (nbytes > max_out) {
          nbytes = (unsigned)max_out;
        }
        if (k + 4 + (int)nbytes > read_len) {
          return -1;
        }
        memcpy(out, rx + k + 4, nbytes);
        *out_len = (size_t)nbytes;
        return 0;
      }
      if (cmd == EC_SDO_UPLOAD_NORMAL) {
        uint32_t total;
        uint16_t mbx_len;
        int framed;
        size_t got;
        uint8_t toggle;

        if (k + 8 > read_len) {
          return -1;
        }
        total = (uint32_t)rx[k + 4] | ((uint32_t)rx[k + 5] << 8) | ((uint32_t)rx[k + 6] << 16) |
                ((uint32_t)rx[k + 7] << 24);
        if (total > max_out) {
          total = (uint32_t)max_out;
        }
        mbx_len = rle16(rx);
        framed = (int)mbx_len - 10;
        if (framed < 0) {
          framed = 0;
        }
        if (k + 8 + framed > read_len) {
          framed = read_len - (k + 8);
          if (framed < 0) {
            framed = 0;
          }
        }
        got = (size_t)framed;
        if (got > total) {
          got = total;
        }
        memcpy(out, rx + k + 8, got);
        if (got >= total) {
          *out_len = got;
          return 0;
        }
        toggle = 0;
        for (seg_guard = 0; seg_guard < 128 && got < total; seg_guard++) {
          unsigned wseg;
          int found_seg = 0;
          int si;
          ecat_coe_fill_mbx_seg_upload(tx, index, subindex, toggle);
          (void)aprd_register(m, adp, mbx_in_sa, read_len, 80, &wkc, rx);
          if (apwr_register(m, adp, mbx_out_sa, (int)mbx_out_len, tx, chunk_tmo, &wkc) != 0 ||
              wkc != 1u) {
            return -1;
          }
          for (wseg = 0; wseg < tmo_ms; wseg += 5u) {
            ezcat_ms_sleep(2);
            if (aprd_register(m, adp, mbx_in_sa, read_len, 80, &wkc, rx) != 0 || wkc != 1u) {
              continue;
            }
            if (rx[5] != EC_MBXTYPE_COE) {
              continue;
            }
            for (si = 6; si + 2 < read_len; si++) {
              uint8_t sc = rx[si];
              if ((sc & 0xE0u) != 0u) {
                continue;
              }
              mbx_len = rle16(rx);
              framed = (int)mbx_len - 3;
              if (framed < 0) {
                framed = 0;
              }
              if ((sc & 0x01u) != 0u && framed == 7) {
                framed -= ((sc & 0x0Eu) >> 1);
              }
              if (si + 1 + framed > read_len) {
                framed = read_len - (si + 1);
                if (framed < 0) {
                  framed = 0;
                }
              }
              {
                size_t take = (size_t)framed;
                if (take > total - got) {
                  take = total - got;
                }
                memcpy(out + got, rx + si + 1, take);
                got += take;
              }
              toggle = (uint8_t)(toggle ^ 0x10u);
              found_seg = 1;
              if ((sc & 0x01u) != 0u || got >= total) {
                *out_len = got;
                return 0;
              }
              break;
            }
            if (found_seg) {
              break;
            }
          }
          if (!found_seg) {
            return -1;
          }
        }
        *out_len = got;
        return (got > 0) ? 0 : -1;
      }
      break;
    }
  }
  return -1;
}

/* ESI の VendorId/ProductCode を突き合わせる場合はここに表を足す */
static const char *lookup_known_product(uint32_t vid, uint32_t pid) {
  (void)vid;
  (void)pid;
  return NULL;
}

static int ecat_read_vid_pid(ezcat_master_t *m, int pos, unsigned tmo_ms, uint32_t *vid_out,
                             uint32_t *pid_out) {
  uint16_t w8, w9, w10, w11;
  if (ecat_eeprom_read_u16(m, pos, 8u, &w8, tmo_ms) != 0) {
    return -1;
  }
  if (ecat_eeprom_read_u16(m, pos, 9u, &w9, tmo_ms) != 0) {
    return -1;
  }
  if (ecat_eeprom_read_u16(m, pos, 10u, &w10, tmo_ms) != 0) {
    return -1;
  }
  if (ecat_eeprom_read_u16(m, pos, 11u, &w11, tmo_ms) != 0) {
    return -1;
  }
  if (vid_out) {
    *vid_out = (uint32_t)w8 | ((uint32_t)w9 << 16);
  }
  if (pid_out) {
    *pid_out = (uint32_t)w10 | ((uint32_t)w11 << 16);
  }
  return 0;
}

static int slaves_al_status_ok(ezcat_master_t *m, uint16_t want_state, unsigned tmo_ms) {
  unsigned step = 10;
  unsigned waited = 0;
  int i;
  while (waited < tmo_ms) {
    int ok = 1;
    for (i = 0; i < m->slave_count; i++) {
      uint8_t st[2];
      uint16_t wkc = 0;
      uint16_t raw = 0;
      if (aprd_register(m, ecat_ap_adp_for_position(i), EC_REG_ALSTAT, 2, 50, &wkc, st) != 0 ||
          wkc != 1) {
        ok = 0;
        break;
      }
      raw = rle16(st);
      if ((raw & 0x000Fu) != (want_state & 0x000Fu)) {
        ok = 0;
        break;
      }
    }
    if (ok) {
      return 0;
    }
    ezcat_ms_sleep(step > 255u ? 255u : step);
    waited += step;
  }
  return -1;
}

static const char *esc_chip_name(uint16_t typ) {
  switch (typ) {
  case 0x0001u:
    return "FPGA";
  case 0x0004u:
    return "ET1100";
  case 0x0009u:
    return "ET1200";
  case 0x000Cu:
    return "LAN9252";
  case 0x0011u:
    return "ET181x";
  case 0x0012u:
    return "ET181x";
  default:
    return "";
  }
}

#define EZCAT_SII_MAX_WORDS 256

/*
 * 検出直後（各スレーブの物理アドレス 0..N-1）に APRD で ESC 識別レジスタを読み一覧表示。
 * SII EEPROM からデバイス名（ETG.1020 General + Strings）を読む。EZCAT_NO_SII=1 で省略。
 * EZCAT_SII_WORDS で読み込むワード数（既定 96、16〜256）。
 */
static void ezcat_print_sdo_hex_dump(int slave_pos, const uint8_t *p, size_t n) {
  size_t off;
  printf("ezcat:   slave %d: SDO data (%zu byte%s)\n", slave_pos, n, n == 1u ? "" : "s");
  for (off = 0; off < n; off += 16u) {
    size_t j;
    printf("ezcat:     %04zu:", off);
    for (j = 0; j < 16u && off + j < n; j++) {
      printf(" %02X", (unsigned)p[off + j]);
    }
    printf("\n");
  }
}

/*
 * PREOP 以降で有効になるメールボックス経由 CoE SDO（INIT では多くのスレーブで不可）。
 * SII を再読して SM を取り、SDO Upload 全文を16進ダンプ（既定 0x3000:0、EZCAT_SDO_IDX/SUB で変更可）。
 */
static void print_slave_coe_sdo_after_preop(ezcat_master_t *m, unsigned ap_tmo_ms) {
  int i;
  unsigned sii_nw = 96;
  const char *es;
  int skip_sii = env_truthy(getenv("EZCAT_NO_SII"));
  uint16_t sdo_ix = 0x3000u;
  uint8_t sdo_sub = 0;
  unsigned ctm;
  const char *ct;
  const char *ixe;
  size_t dump_max = 512u;

  if (env_truthy(getenv("EZCAT_NO_COE"))) {
    return;
  }
  if (!skip_sii) {
    es = getenv("EZCAT_SII_WORDS");
    if (es && es[0]) {
      unsigned v = ezcat_parse_u(es);
      if (v >= 16u && v <= (unsigned)EZCAT_SII_MAX_WORDS) {
        sii_nw = v;
      }
    }
  }
  ctm = ap_tmo_ms * 3u;
  if (ctm < 400u) {
    ctm = 400u;
  }
  if (ctm > 4000u) {
    ctm = 4000u;
  }
  ct = getenv("EZCAT_COE_TMO");
  if (ct && ct[0]) {
    unsigned x = ezcat_parse_u(ct);
    if (x >= 50u && x <= 10000u) {
      ctm = x;
    }
  }
  ixe = getenv("EZCAT_SDO_IDX");
  if (ixe && ixe[0]) {
    if (ixe[0] == '0' && (ixe[1] == 'x' || ixe[1] == 'X')) {
      sdo_ix = (uint16_t)strtoul(ixe, NULL, 16);
    } else {
      sdo_ix = (uint16_t)ezcat_parse_u(ixe);
    }
  }
  ct = getenv("EZCAT_SDO_SUB");
  if (ct && ct[0]) {
    unsigned su = ezcat_parse_u(ct);
    if (su <= 255u) {
      sdo_sub = (uint8_t)su;
    }
  }
  ct = getenv("EZCAT_SDO_DUMP_BYTES");
  if (ct && ct[0]) {
    unsigned dm = ezcat_parse_u(ct);
    if (dm >= 1u && dm <= 1024u) {
      dump_max = (size_t)dm;
    }
  }
  if (dump_max > 1024u) {
    dump_max = 1024u;
  }

  printf("ezcat: CoE SDO (PREOP 済み・メールボックス利用可能な状態)\n");
  printf("ezcat:   object %#06x sub %u (upload, max %zu bytes dumped)\n", (unsigned)sdo_ix,
         (unsigned)sdo_sub, dump_max);

  for (i = 0; i < m->slave_count; i++) {
    uint16_t sii[256];
    unsigned j;
    int all_ok = 1;
    uint8_t dumpbuf[1024];

    if (skip_sii) {
      printf("ezcat: %4d  (no SII: cannot locate mailbox SM)\n", i);
      continue;
    }
    for (j = 0; j < sii_nw; j++) {
      if (ecat_eeprom_read_u16(m, i, (uint16_t)j, &sii[j], ap_tmo_ms) != 0) {
        all_ok = 0;
        break;
      }
    }
    if (!all_ok) {
      printf("ezcat: %4d  SII read failed\n", i);
      continue;
    }
    {
      uint16_t oa, osz, ia, isz;
      size_t got = 0;
      int cr;
      if (sii_parse_sm_mailbox(sii, sii_nw, &oa, &osz, &ia, &isz) != 0) {
        printf("ezcat: %4d  no SM in SII\n", i);
        continue;
      }
      cr = ecat_coe_sdo_upload(m, i, sdo_ix, sdo_sub, oa, osz, ia, isz, dumpbuf, &got, dump_max, ctm);
      if (cr == 0 && got > 0u) {
        ezcat_print_sdo_hex_dump(i, dumpbuf, got);
      } else if (cr == -2) {
        printf("ezcat:   slave %d: SDO abort\n", i);
      } else {
        printf("ezcat:   slave %d: CoE tmo or empty\n", i);
      }
    }
  }
}

static void print_slave_inventory(ezcat_master_t *m, unsigned ap_tmo_ms) {
  int i;
  unsigned sii_nw = 96;
  const char *es;
  int skip_sii = env_truthy(getenv("EZCAT_NO_SII"));

  if (!skip_sii) {
    es = getenv("EZCAT_SII_WORDS");
    if (es && es[0]) {
      unsigned v = ezcat_parse_u(es);
      if (v >= 16u && v <= (unsigned)EZCAT_SII_MAX_WORDS) {
        sii_nw = v;
      }
    }
  }

  printf("ezcat: slaves (%d): (PREOP 後・SII/EEPROM 読み)\n", m->slave_count);
  printf("ezcat: (CoE SDO はこの表の直後に別行で表示)\n");
  printf("ezcat: %4s  %6s  %6s  %6s  %6s  %-7s  %s\n", "pos", "type", "rev", "build", "alias", "ESC",
         "device");
  for (i = 0; i < m->slave_count; i++) {
    uint8_t tbuf[2];
    uint8_t rbuf[2];
    uint8_t bbuf[2];
    uint8_t abuf[2];
    uint16_t wkc_t = 0, wkc_r = 0, wkc_b = 0, wkc_a = 0;
    uint16_t typ, rev, bld, aliasv = 0;
    const char *nm;
    char dev[96];
    uint32_t vid = 0, pid = 0;
    uint16_t sii[256];
    unsigned j;
    int all_ok = 0;
    int ok_alias =
        aprd_register(m, ecat_ap_adp_for_position(i), EC_REG_ALIAS, 2, ap_tmo_ms, &wkc_a, abuf) == 0 &&
        wkc_a == 1u;
    int ok_t = aprd_register(m, ecat_ap_adp_for_position(i), EC_REG_TYPE, 2, ap_tmo_ms, &wkc_t, tbuf) == 0 &&
               wkc_t == 1u;
    int ok_r =
        aprd_register(m, ecat_ap_adp_for_position(i), EC_REG_REVISION, 2, ap_tmo_ms, &wkc_r, rbuf) == 0 &&
        wkc_r == 1u;
    int ok_b =
        aprd_register(m, ecat_ap_adp_for_position(i), EC_REG_BUILD, 2, ap_tmo_ms, &wkc_b, bbuf) == 0 &&
        wkc_b == 1u;
    dev[0] = '\0';

    if (!skip_sii) {
      all_ok = 1;
      for (j = 0; j < sii_nw; j++) {
        if (ecat_eeprom_read_u16(m, i, (uint16_t)j, &sii[j], ap_tmo_ms) != 0) {
          all_ok = 0;
          break;
        }
      }
      if (all_ok && sii_extract_device_name(sii, sii_nw, dev, sizeof dev) == 0) {
        /* filled */
      } else if (ecat_read_vid_pid(m, i, ap_tmo_ms, &vid, &pid) == 0) {
        const char *kn = lookup_known_product(vid, pid);
        if (kn) {
          snprintf(dev, sizeof dev, "%s", kn);
        } else {
          snprintf(dev, sizeof dev, "vid %#08x pid %#08x", (unsigned)vid, (unsigned)pid);
        }
      } else {
        snprintf(dev, sizeof dev, "(no SII)");
      }
    } else {
      snprintf(dev, sizeof dev, "-");
    }

    if (ok_alias) {
      aliasv = rle16(abuf);
    }

    if (!ok_t && !ok_r && !ok_b) {
      printf("ezcat: %4d  (APRD failed)\n", i);
      continue;
    }
    typ = ok_t ? rle16(tbuf) : 0u;
    rev = ok_r ? rle16(rbuf) : 0u;
    bld = ok_b ? rle16(bbuf) : 0u;
    nm = ok_t ? esc_chip_name(typ) : "";
    printf("ezcat: %4d  ", i);
    if (ok_t) {
      printf("0x%04X  ", (unsigned)typ);
    } else {
      printf("   --  ");
    }
    if (ok_r) {
      printf("0x%04X  ", (unsigned)rev);
    } else {
      printf("   --  ");
    }
    if (ok_b) {
      printf("0x%04X  ", (unsigned)bld);
    } else {
      printf("   --  ");
    }
    if (ok_alias) {
      printf("0x%04X  ", (unsigned)aliasv);
    } else {
      printf("   --  ");
    }
    if (nm && nm[0]) {
      printf("%-7s  %s\n", nm, dev[0] ? dev : "-");
    } else {
      printf("%-7s  %s\n", "-", dev[0] ? dev : "-");
    }
  }
}

static int request_state_all_ex(ezcat_master_t *m, uint16_t state, unsigned tmo_ms, int verbose_fail) {
  uint8_t data[2];
  uint16_t wkc = 0;
  uint16_t ctl = (uint16_t)(state | EC_ALCTL_ACK);
  wle16(data, ctl);
  if (bwr_register(m, EC_REG_ALCTL, 2, data, tmo_ms, &wkc) != 0) {
    if (verbose_fail) {
      printf("ezcat: BWR AL Control state=0x%04X ctl=0x%04X failed (send error)\n", (unsigned)state,
             (unsigned)ctl);
    } else {
      printf("ezcat: shutdown: BWR AL Control 0x%04X failed (send), continuing\n", (unsigned)state);
    }
    return -1;
  }
  if ((int)wkc != m->slave_count) {
#if EZCAT_DEBUG_ALL
    printf("ezcat: BWR AL Control WKC=%u expect %d\n", (unsigned)wkc, m->slave_count);
#endif
    if (verbose_fail) {
      printf("ezcat: BWR AL Control state=0x%04X ctl=0x%04X: WKC=%u (expected %d)\n", (unsigned)state,
             (unsigned)ctl, (unsigned)wkc, m->slave_count);
    } else {
      printf("ezcat: shutdown: WKC=%u for state 0x%04X (expected %d), continuing\n", (unsigned)wkc,
             (unsigned)state, m->slave_count);
    }
    return -1;
  }
  if (slaves_al_status_ok(m, state, tmo_ms) != 0) {
    if (verbose_fail) {
      printf("ezcat: timeout waiting AL Status 0x%04X for all slaves.\n", (unsigned)state);
      printf("ezcat: hint: state=0x1 is INIT. CoE needs PREOP. SII は PREOP 後に読みます。"
             " EZCAT_POST_SII_MS / EZCAT_NO_SII=1. AL ctl uses ACK (|0x10).\n");
      printf("ezcat: per-slave AL status:\n");
      for (int i = 0; i < m->slave_count; i++) {
        uint8_t st[2];
        uint16_t wkc2 = 0;
        if (aprd_register(m, ecat_ap_adp_for_position(i), EC_REG_ALSTAT, 2, 100, &wkc2, st) == 0 &&
            wkc2 == 1) {
          uint16_t raw = rle16(st);
          printf(
              "ezcat:   slave %d: raw=0x%04X  state=0x%X  AL-code(byte1)=0x%02X  low-byte-high-nibble=0x%X\n",
              i, (unsigned)raw, (unsigned)(raw & 0x000Fu), (unsigned)((raw >> 8) & 0xFFu),
              (unsigned)((raw >> 4) & 0x0Fu));
        } else {
          printf("ezcat:   slave %d: (APRD failed)\n", i);
        }
      }
    } else {
      printf("ezcat: shutdown: AL Status 0x%04X not confirmed in time (next step anyway)\n",
             (unsigned)state);
    }
    return -1;
  }
  return 0;
}

static int request_state_all(ezcat_master_t *m, uint16_t state, unsigned tmo_ms) {
  return request_state_all_ex(m, state, tmo_ms, 1);
}

int ezcat_master_init(ezcat_master_t *m, const char *ifname) {
  if (!m) {
    return -1;
  }
#if defined(_WIN32) && !defined(__INTIME__)
  if (!ifname) {
    ifname = "";
  }
#else
  if (!ifname || !ifname[0]) {
    return -1;
  }
#endif
  memset(m, 0, sizeof(*m));
  if (ezcat_lowsock_open(&m->link, ifname) != 0) {
    return -1;
  }
  return 0;
}

void ezcat_master_shutdown_slaves(ezcat_master_t *m, unsigned timeout_per_state_ms) {
  unsigned tmo;
  if (!m || !ezcat_lowsock_is_open(&m->link) || m->slave_count <= 0) {
    return;
  }
  if (!m->slaves_op) {
    return;
  }
  tmo = timeout_per_state_ms;
  if (tmo == 0u) {
    tmo = 3000u;
  }
  printf("ezcat: stopping EtherCAT: OP -> SAFEOP -> PREOP -> INIT\n");
  (void)request_state_all_ex(m, EC_STATE_SAFEOP, tmo, 0);
  (void)request_state_all_ex(m, EC_STATE_PREOP, tmo, 0);
  (void)request_state_all_ex(m, EC_STATE_INIT, tmo, 0);
  m->slaves_op = 0;
}

void ezcat_master_fini(ezcat_master_t *m) {
  if (!m) {
    return;
  }
  if (m->slaves_op && ezcat_lowsock_is_open(&m->link) && m->slave_count > 0) {
    ezcat_master_shutdown_slaves(m, m->state_tmo_ms ? m->state_tmo_ms : 3000u);
  }
  ezcat_lowsock_close(&m->link);
  m->slave_count = 0;
  m->slaves_op = 0;
  m->state_tmo_ms = 0;
}

int ezcat_master_bringup_op(ezcat_master_t *m, unsigned timeout_per_state_ms) {
  uint16_t wkc;
  uint8_t dummy[2];

  if (!m || !ezcat_lowsock_is_open(&m->link)) {
    return -1;
  }
  m->state_tmo_ms = timeout_per_state_ms;
  m->slaves_op = 0;

  if (brd_register(m, EC_REG_TYPE, 2, timeout_per_state_ms, &wkc, dummy) != 0) {
    return -1;
  }
  m->slave_count = (int)wkc;
#if EZCAT_DEBUG_ALL
  printf("ezcat: debug: BRD TYPE register bytes=%02x %02x WKC=%u\n", dummy[0], dummy[1], (unsigned)wkc);
#endif
  if (m->slave_count <= 0 || m->slave_count > EZCAT_MAX_SLAVES) {
    printf("ezcat: invalid slave count %d (BRD WKC; 0 often means TX echo only, no slave path)\n",
           m->slave_count);
    return -1;
  }
#if EZCAT_DEBUG_ALL
  printf("ezcat: detected %d slave(s)\n", m->slave_count);
#endif

  {
    unsigned inv_ap_tmo = timeout_per_state_ms / 4u;
    if (inv_ap_tmo < 80u) {
      inv_ap_tmo = 80u;
    }
    if (inv_ap_tmo > 400u) {
      inv_ap_tmo = 400u;
    }
    s_inv_ap_tmo_ms = inv_ap_tmo;
  }
  printf(
      "ezcat: %d slave(s). SII/EEPROM の在庫一覧は PREOP 成功後に行います（INIT 前の長時間 EEPROM が AL "
      "遷移を阻害する事例があります）。\n",
      m->slave_count);

  if (request_state_all(m, EC_STATE_INIT, timeout_per_state_ms) != 0) {
    return -1;
  }
#if EZCAT_DEBUG_ALL
  printf("ezcat: all slaves in INIT\n");
#endif

  if (request_state_all(m, EC_STATE_PREOP, timeout_per_state_ms) != 0) {
    return -1;
  }
#if EZCAT_DEBUG_ALL
  printf("ezcat: all slaves in PREOP\n");
#endif

  {
    unsigned inv_ap_tmo = s_inv_ap_tmo_ms;
    print_slave_inventory(m, inv_ap_tmo);
    if (!env_truthy(getenv("EZCAT_NO_SII"))) {
      unsigned q_tmo = inv_ap_tmo;
      if (q_tmo < 150u) {
        q_tmo = 150u;
      }
      eeprom_quiesce_all_slaves(m, q_tmo);
    }
    {
      unsigned pause_ms = 400u;
      const char *ps = getenv("EZCAT_POST_SII_MS");
      if (ps && ps[0]) {
        unsigned v = ezcat_parse_u(ps);
        if (v <= 30000u) {
          pause_ms = v;
        }
      }
      if (pause_ms > 0u) {
        ezcat_ms_sleep(pause_ms);
      }
    }
  }

  print_slave_coe_sdo_after_preop(m, s_inv_ap_tmo_ms);

  if (request_state_all(m, EC_STATE_SAFEOP, timeout_per_state_ms) != 0) {
    return -1;
  }
#if EZCAT_DEBUG_ALL
  printf("ezcat: all slaves in SAFEOP\n");
#endif

  if (request_state_all(m, EC_STATE_OP, timeout_per_state_ms) != 0) {
    return -1;
  }
#if EZCAT_DEBUG_ALL
  printf("ezcat: all slaves in OP\n");
#endif

  m->slaves_op = 1;
  return 0;
}
