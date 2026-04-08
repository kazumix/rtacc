/*
 * Windows + Npcap: リンク層で EtherCAT (Ethertype 0x88A4) を送受信。
 * Npcap インストールと SDK（Include/Lib）が必要。build_ezcat.cmd を参照。
 */

#include "ezcat_lowsock.h"

#include <pcap.h>

#include <iphlpapi.h>
#include <windows.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static char g_last_io_msg[512];

static int env_truthy(const char *v) {
  return v && (v[0] == '1' || v[0] == 'y' || v[0] == 'Y');
}

static int g_last_open_errno;
static int g_last_open_detail;

int ezcat_lowsock_last_open_errno(void) {
  return g_last_open_errno;
}

int ezcat_lowsock_last_open_detail(void) {
  return g_last_open_detail;
}

const char *ezcat_lowsock_last_io_msg(void) {
  return g_last_io_msg;
}

void ezcat_lowsock_list_devices(void) {
  pcap_if_t *all = NULL;
  char err[PCAP_ERRBUF_SIZE];
  if (pcap_findalldevs(&all, err) != 0) {
    printf("ezcat: pcap_findalldevs: %s\n", err);
    return;
  }
  printf("ezcat: Npcap devices (set EZCAT_IF to substring of name or description):\n");
  for (pcap_if_t *d = all; d; d = d->next) {
    printf("  %s\n", d->name ? d->name : "(null)");
    if (d->description && d->description[0]) {
      printf("    %s\n", d->description);
    }
  }
  pcap_freealldevs(all);
}

static int ascii_tolower(int c) {
  if (c >= 'A' && c <= 'Z') {
    return c + 32;
  }
  return c;
}

static int stri_contains(const char *hay, const char *needle) {
  size_t i, j;
  if (!hay || !needle || !needle[0]) {
    return 0;
  }
  for (i = 0; hay[i]; i++) {
    for (j = 0;; j++) {
      if (!needle[j]) {
        return 1;
      }
      if (!hay[i + j]) {
        return 0;
      }
      if (ascii_tolower((unsigned char)hay[i + j]) != ascii_tolower((unsigned char)needle[j])) {
        break;
      }
    }
  }
  return 0;
}

static int ez_win_mac_for_pcap_name(const char *pcap_dev_name, uint8_t mac[6]) {
  ULONG sz = 0;
  DWORD st;
  PIP_ADAPTER_ADDRESSES list, a;

  if (!pcap_dev_name || !mac) {
    return -1;
  }
  st = GetAdaptersAddresses(AF_UNSPEC, GAA_FLAG_INCLUDE_PREFIX, NULL, NULL, &sz);
  if (st != ERROR_BUFFER_OVERFLOW) {
    return -1;
  }
  list = (PIP_ADAPTER_ADDRESSES)malloc(sz);
  if (!list) {
    return -1;
  }
  st = GetAdaptersAddresses(AF_UNSPEC, GAA_FLAG_INCLUDE_PREFIX, NULL, list, &sz);
  if (st != ERROR_SUCCESS) {
    free(list);
    return -1;
  }
  for (a = list; a; a = a->Next) {
    if (a->PhysicalAddressLength != 6) {
      continue;
    }
    if (strstr(pcap_dev_name, a->AdapterName) == NULL) {
      continue;
    }
    memcpy(mac, a->PhysicalAddress, 6);
    free(list);
    return 0;
  }
  free(list);
  return -1;
}

static int desc_skip(const char *desc) {
  if (!desc || !desc[0]) {
    return 0;
  }
  return stri_contains(desc, "loopback") || stri_contains(desc, "NdisWan") ||
         stri_contains(desc, "Bluetooth") || stri_contains(desc, "VirtualBox") ||
         stri_contains(desc, "VMware") || stri_contains(desc, "Hyper-V");
}

static int desc_wifi(const char *desc) {
  if (!desc || !desc[0]) {
    return 0;
  }
  return stri_contains(desc, "Wireless") || stri_contains(desc, "Wi-Fi") ||
         stri_contains(desc, "802.11");
}

static int desc_wired_ethernet(const char *desc) {
  if (!desc || !desc[0]) {
    return 0;
  }
  return stri_contains(desc, "Ethernet") || stri_contains(desc, "Gigabit") ||
         stri_contains(desc, "10 Gigabit");
}

/* ターゲット: 「イーサネット 2」「Ethernet 2」（21/22 等と誤一致しない） */
static int cmp_prefix_ci(const char *s, const char *pre, size_t n) {
  size_t i;
  for (i = 0; i < n; i++) {
    unsigned char a;
    unsigned char b;
    if (s[i] == '\0') {
      return 0;
    }
    a = (unsigned char)s[i];
    b = (unsigned char)pre[i];
    if (a >= 'A' && a <= 'Z') {
      a = (unsigned char)(a + 32u);
    }
    if (b >= 'A' && b <= 'Z') {
      b = (unsigned char)(b + 32u);
    }
    if (a != b) {
      return 0;
    }
  }
  return 1;
}

static int desc_has_en_ethernet_2(const char *desc) {
  size_t i;
  if (!desc) {
    return 0;
  }
  for (i = 0; desc[i]; i++) {
    size_t j;
    if (!cmp_prefix_ci(desc + i, "ethernet", 8u)) {
      continue;
    }
    j = i + 8u;
    while (desc[j] == ' ' || desc[j] == '\t') {
      j++;
    }
    /* Intel 「Ethernet Connection (2) I219」は Windows の「イーサネット 2」とは別物 */
    if (cmp_prefix_ci(desc + j, "connection", 10u)) {
      continue;
    }
    if (desc[j] != '2') {
      continue;
    }
    j++;
    if (desc[j] >= '0' && desc[j] <= '9') {
      continue;
    }
    return 1;
  }
  return 0;
}

static int desc_has_ja_ethernet_2(const char *desc) {
  static const char pat[] = u8"イーサネット 2";
  const char *q;
  size_t plen;
  unsigned char c;
  if (!desc) {
    return 0;
  }
  plen = sizeof(pat) - 1u;
  q = strstr(desc, pat);
  if (!q) {
    return 0;
  }
  c = (unsigned char)q[plen];
  if (c >= '0' && c <= '9') {
    return 0;
  }
  return 1;
}

static int desc_is_ezcat_target_line(const char *desc) {
  return desc_has_en_ethernet_2(desc) || desc_has_ja_ethernet_2(desc);
}

/* Intel PRO/1000 系など（オンボード I219 より EtherCAT 用に使いやすいデュアルポート想定） */
static int desc_is_pro_gbe_pci(const char *desc) {
  if (!desc || !desc[0]) {
    return 0;
  }
  if (stri_contains(desc, "I219") || stri_contains(desc, "I218") || stri_contains(desc, "I217")) {
    return 0;
  }
  return stri_contains(desc, "PRO/1000") || stri_contains(desc, "82571") || stri_contains(desc, "82576") ||
         stri_contains(desc, "82580") || stri_contains(desc, "I350") || stri_contains(desc, "82599") ||
         stri_contains(desc, "X540") || stri_contains(desc, "X550");
}

static pcap_if_t *pick_default_pcap_dev(pcap_if_t *all) {
  pcap_if_t *d;
  pcap_if_t *target_line = NULL;
  pcap_if_t *pro_first = NULL;
  pcap_if_t *pro_second = NULL;
  int pro_n = 0;
  pcap_if_t *eth_nowifi = NULL;
  pcap_if_t *eth_any = NULL;
  pcap_if_t *any_ok = NULL;

  for (d = all; d; d = d->next) {
    const char *desc = d->description;
    if (!d->name) {
      continue;
    }
    if (desc_skip(desc)) {
      continue;
    }
    if (!target_line && desc_is_ezcat_target_line(desc)) {
      target_line = d;
    }
    if (desc_is_pro_gbe_pci(desc) && !desc_wifi(desc)) {
      pro_n++;
      if (pro_n == 1) {
        pro_first = d;
      } else if (pro_n == 2) {
        pro_second = d;
      }
    }
    if (!any_ok) {
      any_ok = d;
    }
    if (desc_wired_ethernet(desc)) {
      if (!eth_any) {
        eth_any = d;
      }
      if (!desc_wifi(desc) && !eth_nowifi) {
        eth_nowifi = d;
      }
    }
  }
  if (target_line) {
    return target_line;
  }
  /*
   * Npcap 一覧は「イーサネット 2」のフレンドリ名を出さないことが多い。
   * PRO/1000 デュアルなら 2 エントリ目を EtherCAT 側（イーサネット 2）とみなす。
   */
  if (pro_second) {
    return pro_second;
  }
  if (pro_first) {
    return pro_first;
  }
  if (eth_nowifi) {
    return eth_nowifi;
  }
  if (eth_any) {
    return eth_any;
  }
  if (any_ok) {
    return any_ok;
  }
  for (d = all; d; d = d->next) {
    if (d->name) {
      return d;
    }
  }
  return NULL;
}

/* 0=ok, -1=pcap_findalldevs 失敗(errbuf), -2=一致なし, -3=デバイス無し */
static int pick_pcap_device(char *out, size_t outcap, const char *want, char *errbuf) {
  pcap_if_t *all = NULL;
  pcap_if_t *d;

  if (pcap_findalldevs(&all, errbuf) != 0) {
    return -1;
  }
  if (!all) {
    strncpy(errbuf, "no pcap devices", PCAP_ERRBUF_SIZE - 1);
    errbuf[PCAP_ERRBUF_SIZE - 1] = '\0';
    return -3;
  }

  if (!want || !want[0]) {
    d = pick_default_pcap_dev(all);
    if (!d || !d->name) {
      pcap_freealldevs(all);
      strncpy(errbuf, "no usable pcap device", PCAP_ERRBUF_SIZE - 1);
      errbuf[PCAP_ERRBUF_SIZE - 1] = '\0';
      return -3;
    }
    strncpy(out, d->name, outcap);
    out[outcap - 1] = '\0';
    pcap_freealldevs(all);
    return 0;
  }

  for (d = all; d; d = d->next) {
    if (!d->name) {
      continue;
    }
    if (stri_contains(d->name, want)) {
      strncpy(out, d->name, outcap);
      out[outcap - 1] = '\0';
      pcap_freealldevs(all);
      return 0;
    }
    if (d->description && stri_contains(d->description, want)) {
      strncpy(out, d->name, outcap);
      out[outcap - 1] = '\0';
      pcap_freealldevs(all);
      return 0;
    }
  }
  pcap_freealldevs(all);
  strncpy(errbuf, "no Npcap device matches EZCAT_IF", PCAP_ERRBUF_SIZE - 1);
  errbuf[PCAP_ERRBUF_SIZE - 1] = '\0';
  return -2;
}

static void ez_copy_pcap_description(const char *devnm, char *out, size_t cap) {
  pcap_if_t *all = NULL;
  char ebuf[PCAP_ERRBUF_SIZE];
  pcap_if_t *d;

  if (!out || cap == 0) {
    return;
  }
  out[0] = '\0';
  if (!devnm || pcap_findalldevs(&all, ebuf) != 0) {
    return;
  }
  for (d = all; d; d = d->next) {
    if (d->name && strcmp(d->name, devnm) == 0 && d->description && d->description[0]) {
      strncpy(out, d->description, cap - 1u);
      out[cap - 1u] = '\0';
      break;
    }
  }
  pcap_freealldevs(all);
}

int ezcat_lowsock_open(ezcat_lowsock_t *ls, const char *ifname) {
  char err[PCAP_ERRBUF_SIZE];
  char dev[512];
  pcap_t *p;
  struct bpf_program fp;

  g_last_open_errno = 0;
  g_last_open_detail = EZCAT_OPEN_DETAIL_NONE;

  if (!ls) {
    return -1;
  }
  memset(ls, 0, sizeof(*ls));
  ls->handle = 0;

  {
    int pr = pick_pcap_device(dev, sizeof(dev), ifname, err);
    if (pr != 0) {
      g_last_open_detail = (pr == -2) ? EZCAT_OPEN_NO_IFACE : EZCAT_OPEN_PCAP_ENUM;
      return -1;
    }
  }

  strncpy(ls->dev_name, dev, sizeof(ls->dev_name) - 1u);
  ls->dev_name[sizeof(ls->dev_name) - 1u] = '\0';
  ez_copy_pcap_description(dev, ls->dev_desc, sizeof(ls->dev_desc));

  if (ez_win_mac_for_pcap_name(dev, ls->mac) != 0) {
    g_last_open_detail = EZCAT_OPEN_WIN_MAC;
    return -1;
  }

  p = pcap_open_live(dev, 65536, 1, 1, err);
  if (!p) {
    g_last_open_detail = EZCAT_OPEN_SOCKET_FAIL;
    return -1;
  }

  if (pcap_setnonblock(p, 1, err) != 0) {
    pcap_close(p);
    g_last_open_detail = EZCAT_OPEN_SOCKET_FAIL;
    return -1;
  }

  /*
   * カーネルキャプチャバッファ拡大（既定 1MB 前後）。高レートや短い間隔のポーリングで
   * スレーブ応答が捨てられるのを減らす。失敗しても無視。
   */
  (void)pcap_setbuff(p, 16 * 1024 * 1024);

  /* pcap_set_immediate_mode は新しめの wpcap.dll のみ。古い Npcap で実行時エラーになるため呼ばない */

  /*
   * 既定はカーネル BPF なし（Intel 等で 0x88A4 応答が BPF で取りこぼされる事例のため）。
   * ソフトで pkt_is_ecat 判定。混雑 LAN では EZCAT_USE_BPF=1 でカーネル絞り込み可。
   */
  if (env_truthy(getenv("EZCAT_USE_BPF")) && !env_truthy(getenv("EZCAT_NO_BPF"))) {
    if (pcap_compile(p, &fp, "(ether proto 0x88a4) or (vlan and ether proto 0x88a4)", 1,
                     PCAP_NETMASK_UNKNOWN) == 0) {
      (void)pcap_setfilter(p, &fp);
      pcap_freecode(&fp);
    }
  }

  /*
   * pcap の既定（INOUT）のままにする。PRO/1000 等で PCAP_D_IN だけにすると
   * 0x88A4 応答が一切届かない事例があった。
   * 受信のみにしたい場合のみ EZCAT_PCAP_IN=1。
   */
  if (env_truthy(getenv("EZCAT_PCAP_IN"))) {
    (void)pcap_setdirection(p, PCAP_D_IN);
  }

#if EZCAT_DEBUG_ALL
  printf("ezcat: debug: open USE_BPF=%d NO_BPF=%d PCAP_IN=%d\n",
         env_truthy(getenv("EZCAT_USE_BPF")) ? 1 : 0, env_truthy(getenv("EZCAT_NO_BPF")) ? 1 : 0,
         env_truthy(getenv("EZCAT_PCAP_IN")) ? 1 : 0);
#endif

  ls->handle = (intptr_t)p;
  return 0;
}

void ezcat_lowsock_close(ezcat_lowsock_t *ls) {
  if (!ls || ls->handle == 0) {
    return;
  }
  pcap_close((pcap_t *)ls->handle);
  ls->handle = 0;
}

int ezcat_lowsock_send(ezcat_lowsock_t *ls, uint8_t *frame, int tx_len) {
  pcap_t *p;

  g_last_io_msg[0] = '\0';
  if (!ls || ls->handle == 0 || !frame || tx_len <= 0) {
    snprintf(g_last_io_msg, sizeof(g_last_io_msg), "invalid send args");
    return -1;
  }
  p = (pcap_t *)ls->handle;
  if (pcap_sendpacket(p, frame, tx_len) != 0) {
    const char *pe = pcap_geterr(p);
    snprintf(g_last_io_msg, sizeof(g_last_io_msg), "%s", pe ? pe : "pcap_sendpacket failed");
    return -1;
  }
#if EZCAT_DEBUG_ALL
  printf("ezcat: debug: pcap_sendpacket ok len=%d\n", tx_len);
#endif
  return 0;
}

int ezcat_lowsock_recv_ecat(ezcat_lowsock_t *ls, uint8_t *frame, int rx_max, unsigned timeout_ms) {
  pcap_t *p;
  DWORD t0;
  struct pcap_pkthdr *hdr;
  const u_char *pkt;
  int r;
  int dbg_rx;
  unsigned dbg_other;
  uint16_t dbg_et0;
  uint16_t dbg_et1;
  uint16_t dbg_et2;

  g_last_io_msg[0] = '\0';
  dbg_rx = (EZCAT_DEBUG_ALL != 0) || env_truthy(getenv("EZCAT_DEBUG_RX"));
  dbg_other = 0;
  dbg_et0 = 0;
  dbg_et1 = 0;
  dbg_et2 = 0;

  if (!ls || ls->handle == 0 || !frame || rx_max < 14) {
    snprintf(g_last_io_msg, sizeof(g_last_io_msg), "invalid recv args");
    return -1;
  }
  p = (pcap_t *)ls->handle;

  t0 = GetTickCount();
  for (;;) {
    DWORD elapsed;
    if (GetTickCount() - t0 >= timeout_ms) {
      struct pcap_stat pst;
      snprintf(g_last_io_msg, sizeof(g_last_io_msg),
               "timeout: no EtherCAT (0x88A4) frame in %ums (wrong EZCAT_IF / no slaves?)", timeout_ms);
      if (dbg_rx) {
        if (pcap_stats(p, &pst) == 0) {
#if defined(_WIN32)
          /* Windows: ps_ifdrop は未対応で無意味な値になりがち。ps_capt 等を参照 */
          printf("ezcat: EZCAT_DEBUG_RX pcap_stats recv=%u drop=%u capt=%u sent=%u netdrop=%u\n",
                 pst.ps_recv, pst.ps_drop, pst.ps_capt, pst.ps_sent, pst.ps_netdrop);
#else
          printf("ezcat: EZCAT_DEBUG_RX pcap_stats recv=%u drop=%u ifdrop=%u\n", pst.ps_recv, pst.ps_drop,
                 pst.ps_ifdrop);
#endif
        }
        printf("ezcat: EZCAT_DEBUG_RX other L2 frames (caplen>=14, not 0x88A4): %u\n", dbg_other);
        if (dbg_other > 0u) {
          printf("ezcat: EZCAT_DEBUG_RX sample ethertype@12 (BE): %04x %04x %04x\n", (unsigned)dbg_et0,
                 (unsigned)dbg_et1, (unsigned)dbg_et2);
        }
      }
      return -2;
    }
    r = pcap_next_ex(p, &hdr, &pkt);
    if (r == PCAP_ERROR_BREAK || r == PCAP_ERROR) {
      const char *pe = pcap_geterr(p);
      snprintf(g_last_io_msg, sizeof(g_last_io_msg), "%s", pe ? pe : "pcap_next_ex error");
      return -1;
    }
    if (r != 1 || !hdr || !pkt) {
      elapsed = GetTickCount() - t0;
      if (elapsed < 50u) {
        /* 応答が早い場合の取りこぼし低減 */
      } else {
        Sleep(1);
      }
      continue;
    }
    if (hdr->caplen < 14) {
      continue;
    }
    if (!ezcat_frame_is_ecat(hdr->caplen, pkt)) {
      if (dbg_rx && dbg_other < 3u) {
        uint16_t et = ezcat_ethertype_be_at(pkt + 12);
        if (dbg_other == 0u) {
          dbg_et0 = et;
        } else if (dbg_other == 1u) {
          dbg_et1 = et;
        } else {
          dbg_et2 = et;
        }
      }
      dbg_other++;
      continue;
    }
    if ((int)hdr->caplen > rx_max) {
      snprintf(g_last_io_msg, sizeof(g_last_io_msg), "rx frame too large (%u > %d)", (unsigned)hdr->caplen,
               rx_max);
      return -1;
    }
    memcpy(frame, pkt, (size_t)hdr->caplen);
#if EZCAT_DEBUG_ALL
    printf("ezcat: debug: pcap recv ECAT caplen=%u\n", (unsigned)hdr->caplen);
#endif
    return (int)hdr->caplen;
  }
}

int ezcat_lowsock_txrx(ezcat_lowsock_t *ls, uint8_t *frame, int tx_len, int rx_max,
                       unsigned timeout_ms) {
  if (!ls || !frame || tx_len <= 0 || rx_max < tx_len) {
    snprintf(g_last_io_msg, sizeof(g_last_io_msg), "invalid txrx args");
    return -1;
  }
  if (ezcat_lowsock_send(ls, frame, tx_len) != 0) {
    return -1;
  }
  return ezcat_lowsock_recv_ecat(ls, frame, rx_max, timeout_ms);
}
