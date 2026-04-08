/*
 * RSI-ECAT (EH-API): マスタを Pre-OP にし、Vendor ID = Omron (0x83 = 131) のスレーブだけ
 * CoE オブジェクト 0x3000 を読み取ってコンソールに表示する。
 *
 * 各スレーブの INIT→PREOP 遷移をモニタリングし、全員が PREOP に達してから 0x3000 を一括リードする。
 *
 * 前提: INtime 上で RSI-ECAT EtherCAT ハンドラが起動済みで、ENI がマスタ側で読み込まれていること。
 * ハンドラのカタログ名を環境変数 ECAT_EH_NODE（未設定時は NodeA）で指定する（EhOpen に渡す）。
 * スレーブ走査は EhFindSlaveByAlias のみ（BRD 一覧ではない）。既定 alias 5〜14（ECAT_ALIAS_START/END で変更）。
 * ECAT_OD_PREOP_ONLY … 非0 ならマスタ/スレーブは PREOP のみ（SDO 試験用。SAFEOP 遷移が長引く場合の切り分け）。
 * ECAT_SLAVE_SAFEOP_BEFORE_OD … 非0 なら全スレーブ PREOP 同期後に SAFEOP へ上げてから 0x3000 を読む。
 * ECAT_ALIAS_SCAN_MAX … EhFindSlaveByAlias を掛ける alias 上限（既定 128）。接続スレーブ一覧用。
 * ECAT_SLAVE_PREOP_WAIT_MS … 全スレーブ PREOP 待ちのタイムアウト(ms)。0 なら待ちをスキップして SDO 読みへ。
 * ECAT_SLAVE_SAFEOP_WAIT_MS … SAFEOP 待ちのタイムアウト(ms)。ECAT_SLAVE_SAFEOP_BEFORE_OD 使用時。0 で待ちスキップ。
 * ECAT_SLAVE_ERR_ESC_DUMP … 非0 なら、モニタ中に actual が AL error ビット(0x10)付きに遷移した直後、
 *   EhReadRegister で ESC 0x0130(AL Status) / 0x0134(AL Status Code) を表示する。
 */

#include <rt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "ehapi.h"

#define OMRON_VENDOR_ID 131u

#ifndef ECAT_DEFAULT_NODE
#define ECAT_DEFAULT_NODE "NodeA"
#endif

static void print_eh_status(const char *what, WORD st) {
  printf("%s: status 0x%04X\n", what, (unsigned)st);
}

static const char *ehapi_rc_str(WORD rc) {
  switch (rc) {
  case ER_EHAPI_OK:
    return "ER_EHAPI_OK";
  case ER_EHAPI_STATE_I:
    return "ER_EHAPI_STATE_I (master in INIT)";
  case ER_EHAPI_STATE_P:
    return "ER_EHAPI_STATE_P";
  case ER_EHAPI_STATE_S:
    return "ER_EHAPI_STATE_S";
  case ER_EHAPI_STATE_O:
    return "ER_EHAPI_STATE_O";
  case ER_EHAPI_NOITEM:
    return "ER_EHAPI_NOITEM (OD item not found)";
  case ER_EHAPI_INDEX:
    return "ER_EHAPI_INDEX (OD index not exist)";
  case ER_EHAPI_SUBINDEX:
    return "ER_EHAPI_SUBINDEX (OD subindex not exist)";
  case ER_EHAPI_LENGTH:
    return "ER_EHAPI_LENGTH (OD length mismatch)";
  case ER_EHAPI_ENIFILE:
    return "ER_EHAPI_ENIFILE (ENI load failure)";
  case ER_EHAPI_OFFLINE:
    return "ER_EHAPI_OFFLINE (slave offline)";
  case ER_EHAPI_NO_RESPONSE:
    return "ER_EHAPI_NO_RESPONSE (no response)";
  case ER_EHAPI_READONLY:
    return "ER_EHAPI_READONLY";
  default:
    if (rc == ER_EHAPI_TIMEOUT) {
      return "ER_EHAPI_TIMEOUT";
    }
    return "UNKNOWN_RC";
  }
}

/* EhGetState / EhGetSlaveState の数値（ETG と同様 1/2/4/8）を表示用に */
static char g_state_str_buf[40];

static const char *mst_short(WORD w) {
  switch (w) {
  case 1:
    return "INIT";
  case 2:
    return "PREOP";
  case 4:
    return "SAFEOP";
  case 8:
    return "OP";
  default:
    /* 例: 0x11 = INIT(1) + AL error bit(0x10) */
    if ((w & 0xFu) == 1u && (w & 0x10u) != 0) {
      snprintf(g_state_str_buf, sizeof(g_state_str_buf), "INIT+ERR(0x%02X)", (unsigned)(w & 0xFFu));
      return g_state_str_buf;
    }
    snprintf(g_state_str_buf, sizeof(g_state_str_buf), "raw(0x%04X)", (unsigned)w);
    return g_state_str_buf;
  }
}

static DWORD env_u32_ms(const char *name, DWORD default_ms) {
  const char *e = getenv(name);
  if (e == NULL || e[0] == '\0') {
    return default_ms;
  }
  int v = atoi(e);
  if (v < 0) {
    return default_ms;
  }
  return (DWORD)v;
}

/* 非0 / 未設定=有効 / "0"=無効 */
static int env_flag_enabled(const char *name, int default_enabled) {
  const char *e = getenv(name);
  if (e == NULL || e[0] == '\0') {
    return default_enabled;
  }
  return e[0] != '0';
}

#define ESC_REG_AL_STATUS 0x0130u
#define ESC_REG_AL_STATUS_CODE 0x0134u

/*
 * ESC レジスタ読み（EhReadRegister: alias, offset, size, buffer）。
 * AL Status Code は ETG 0x0134（1 バイト）。INIT+ERR 切り分け用。
 */
static void dump_esc_al_registers(EHHANDLE h, WORD alias) {
  BYTE al_st = 0;
  BYTE al_code = 0;
  WORD rc0 = EhReadRegister(h, alias, ESC_REG_AL_STATUS, 1u, &al_st);
  WORD rc1 = EhReadRegister(h, alias, ESC_REG_AL_STATUS_CODE, 1u, &al_code);
  printf("      ESC registers: 0x0130(AL Status)=");
  if (rc0 == ER_EHAPI_OK) {
    printf("0x%02X", (unsigned)al_st);
  } else {
    printf("EhReadRegister rc=0x%04X (%s)", (unsigned)rc0, ehapi_rc_str(rc0));
  }
  printf("  0x0134(AL Status Code)=");
  if (rc1 == ER_EHAPI_OK) {
    printf("0x%02X\n", (unsigned)al_code);
  } else {
    printf("EhReadRegister rc=0x%04X (%s)\n", (unsigned)rc1, ehapi_rc_str(rc1));
  }
}

static void print_all_connected_slave_states(EHHANDLE h, const char *prefix);

/*
 * マスタが目標ステートに達するまで待つ。マスタが INIT のまま止まっていても、
 * スレーブ単体では既に PREOP などに進んでいることがあるため、待機中も定期的に
 * 全スレーブの rq/actual を出す（print_all_connected_slave_states）。
 */
static WORD wait_master_state(EHHANDLE h, WORD desired_state, DWORD timeout_ms) {
  const unsigned step = 100;
  const unsigned log_every_ms = 5000;
  DWORD waited = 0;
  DWORD since_log = 0;
  WORD rq = 0, st = 0;
  while (waited < timeout_ms) {
    WORD g = EhGetState(h, &rq, &st);
    if (g != ER_EHAPI_OK) {
      return g;
    }
    if (st == desired_state) {
      return ER_EHAPI_OK;
    }
    since_log += step;
    /* t=0 でも1回出す（マスタは INIT のままでもスレーブは PREOP の可能性がある） */
    if (waited == 0 || since_log >= log_every_ms) {
      if (since_log >= log_every_ms) {
        since_log = 0;
      }
      printf("  [master wait %lums] rq=%s(%u) actual=%s(%u)\n", (unsigned long)waited,
             mst_short(rq), (unsigned)rq, mst_short(st), (unsigned)st);
      print_all_connected_slave_states(h, "  ");
      fflush(stdout);
    }
    RtSleep((unsigned char)(step > 255u ? 255u : step));
    waited += step;
  }
  return ER_EHAPI_TIMEOUT;
}

static WORD wait_slave_state(EHHANDLE h, WORD alias, WORD desired_state, DWORD timeout_ms) {
  const unsigned step = 100;
  const unsigned log_every_ms = 5000;
  DWORD waited = 0;
  DWORD since_log = 0;
  WORD rq = 0, st = 0;
  while (waited < timeout_ms) {
    WORD rc = EhGetSlaveState(h, alias, &rq, &st);
    if (rc != ER_EHAPI_OK) return rc;
    if (st == desired_state) return ER_EHAPI_OK;
    since_log += step;
    if (since_log >= log_every_ms) {
      since_log = 0;
      printf("  [slave alias=%u wait %lums] rq=%s(%u) actual=%s(%u)\n", (unsigned)alias,
             (unsigned long)waited, mst_short(rq), (unsigned)rq, mst_short(st), (unsigned)st);
    }
    RtSleep((unsigned char)(step > 255u ? 255u : step));
    waited += step;
  }
  return ER_EHAPI_TIMEOUT;
}

#define MAX_OMRON_SLAVES 32

typedef struct {
  SLAVE_DETAIL d;
  WORD prev_rq;
  WORD prev_st;
} OmronSlaveEntry;

static void print_master_state_snapshot(EHHANDLE h) {
  WORD rq = 0, st = 0;
  WORD g = EhGetState(h, &rq, &st);
  if (g == ER_EHAPI_OK) {
    printf("      master: rq=%s(%u)  actual=%s(%u)\n", mst_short(rq), (unsigned)rq, mst_short(st), (unsigned)st);
  } else {
    printf("      master: EhGetState rc=0x%04X (%s)\n", (unsigned)g, ehapi_rc_str(g));
  }
}

static int is_sdo_read_ready_state(WORD st) {
  WORD base = (WORD)(st & 0x0Fu);
  if ((st & 0x10u) != 0u) {
    return 0;
  }
  return (base == MST_PRE_OPERATIONAL || base == MST_SAFE_OPERATIONAL || base == MST_OPERATIONAL);
}

#ifndef ECAT_ALIAS_SCAN_MAX_DEFAULT
#define ECAT_ALIAS_SCAN_MAX_DEFAULT 15
#endif

static unsigned alias_scan_max_from_env(void) {
  const char *e = getenv("ECAT_ALIAS_SCAN_MAX");
  unsigned v = ECAT_ALIAS_SCAN_MAX_DEFAULT;
  if (e != NULL && e[0] != '\0') {
    int x = atoi(e);
    if (x > 0 && x <= 512) {
      v = (unsigned)x;
    }
  }
  return v;
}

/*
 * ENI に存在するスレーブを alias 1..max で走査し、接続ごとの rq / actual を表示する。
 * prefix は行頭に付ける（モニタ内は "      "、main 直後は ""）。
 */
static void print_all_connected_slave_states(EHHANDLE h, const char *prefix) {
  const char *pre = prefix ? prefix : "";
  unsigned amax = alias_scan_max_from_env();
  WORD a;
  int nfound = 0;
  SLAVE_DETAIL d;

  printf("%s[all ENI slaves] alias 1..%u  (rq=requested  actual=current)\n", pre, amax);
  for (a = 1; a <= (WORD)amax; a++) {
    memset(&d, 0, sizeof(d));
    d.dwSize = sizeof(d);
    d.woAlias = a;
    if (EhFindSlaveByAlias(h, &d) != ER_EHAPI_OK) {
      continue;
    }
    nfound++;
    WORD rq = 0, st = 0;
    WORD rs = EhGetSlaveState(h, a, &rq, &st);
    if (rs == ER_EHAPI_OK) {
      printf("%s  alias=%2u  slaveNo=%-4lu  phys=%-4lu  vendor=%lu  rq=%s(%u)  actual=%s(%u)\n", pre,
             (unsigned)a, (unsigned long)d.dwSlaveNo, (unsigned long)d.dwPhysicalAddr,
             (unsigned long)d.dwVendorID, mst_short(rq), (unsigned)rq, mst_short(st), (unsigned)st);
    } else {
      printf("%s  alias=%2u  slaveNo=%-4lu  phys=%-4lu  vendor=%lu  EhGetSlaveState rc=0x%04X (%s)\n", pre,
             (unsigned)a, (unsigned long)d.dwSlaveNo, (unsigned long)d.dwPhysicalAddr,
             (unsigned long)d.dwVendorID, (unsigned)rs, ehapi_rc_str(rs));
    }
  }
  if (nfound == 0) {
    printf("%s  (no slave matched in this scan - raise ECAT_ALIAS_SCAN_MAX if needed)\n", pre);
  } else {
    printf("%s  (%d slave(s) in ENI)\n", pre, nfound);
  }
}

/*
 * 遷移の進行が見えるようにする:
 * - 開始直後に全スレーブ＋マスタのスナップショット
 * - rq/actual が変わったら即 1 行
 * - 変化がなくても heartbeat_ms ごとにスナップショット（止まっているのか API が動いているのか判別）
 */
static WORD wait_all_slaves_state_monitored(EHHANDLE h, OmronSlaveEntry *slaves, int n, WORD desired_state,
                                            DWORD timeout_ms) {
  const unsigned step = 100;
  const unsigned heartbeat_ms = 1000;
  DWORD waited = 0;
  DWORD since_heartbeat = 0;
  unsigned poll = 0;
  int i;

  if (n <= 0) {
    return ER_EHAPI_OK;
  }

  printf("Monitor %d slave(s) until all reach state %s(%u)\n", n, mst_short(desired_state),
         (unsigned)desired_state);
  printf("  (poll interval %ums; heartbeat + full snapshot every %ums; immediate line on any change)\n", step,
         heartbeat_ms);

  /* 初回: 現在値を prev に取り込みつつ、その場で表示（ここまで無出力だと「動いていない」ように見える） */
  printf("  [t=%lums] initial snapshot:\n", (unsigned long)waited);
  for (i = 0; i < n; i++) {
    WORD rq = 0, st = 0;
    WORD rc = EhGetSlaveState(h, slaves[i].d.woAlias, &rq, &st);
    if (rc != ER_EHAPI_OK) {
      printf("      alias=%u  EhGetSlaveState rc=0x%04X (%s)\n", (unsigned)slaves[i].d.woAlias, (unsigned)rc,
             ehapi_rc_str(rc));
      slaves[i].prev_rq = 0xFFFFu;
      slaves[i].prev_st = 0xFFFFu;
    } else {
      slaves[i].prev_rq = rq;
      slaves[i].prev_st = st;
      printf("      alias=%u  rq=%s(%u)  actual=%s(%u)  %s\n", (unsigned)slaves[i].d.woAlias, mst_short(rq),
             (unsigned)rq, mst_short(st), (unsigned)st, (st == desired_state) ? "OK" : "---");
    }
  }
  print_all_connected_slave_states(h, "      ");
  print_master_state_snapshot(h);
  fflush(stdout);

  while (waited < timeout_ms) {
    int all_ok = 1;

    poll++;
    for (i = 0; i < n; i++) {
      WORD rq = 0, st = 0;
      WORD rc = EhGetSlaveState(h, slaves[i].d.woAlias, &rq, &st);
      if (rc != ER_EHAPI_OK) {
        printf("  [alias=%u] EhGetSlaveState rc=0x%04X (%s)\n", (unsigned)slaves[i].d.woAlias, (unsigned)rc,
               ehapi_rc_str(rc));
        fflush(stdout);
        all_ok = 0;
        continue;
      }
      if (rq != slaves[i].prev_rq || st != slaves[i].prev_st) {
        printf("  [t=%lums alias=%u] CHANGED: rq %s(%u) -> %s(%u) | actual %s(%u) -> %s(%u)\n",
               (unsigned long)waited, (unsigned)slaves[i].d.woAlias, mst_short(slaves[i].prev_rq),
               (unsigned)slaves[i].prev_rq, mst_short(rq), (unsigned)rq, mst_short(slaves[i].prev_st),
               (unsigned)slaves[i].prev_st, mst_short(st), (unsigned)st);
        if (env_flag_enabled("ECAT_SLAVE_ERR_ESC_DUMP", 1) && (st & 0x10u) != 0u) {
          dump_esc_al_registers(h, slaves[i].d.woAlias);
        }
        slaves[i].prev_rq = rq;
        slaves[i].prev_st = st;
        fflush(stdout);
      }
      if (st != desired_state) {
        all_ok = 0;
      }
    }

    if (all_ok) {
      printf("All %d slave(s) reached %s(%u).\n", n, mst_short(desired_state), (unsigned)desired_state);
      fflush(stdout);
      return ER_EHAPI_OK;
    }

    since_heartbeat += step;
    if (since_heartbeat >= heartbeat_ms) {
      since_heartbeat = 0;
      printf("  [t=%lums poll#%u] heartbeat (no change in last %ums - current snapshot):\n", (unsigned long)waited,
             poll, heartbeat_ms);
      for (i = 0; i < n; i++) {
        WORD rq = 0, st = 0;
        if (EhGetSlaveState(h, slaves[i].d.woAlias, &rq, &st) == ER_EHAPI_OK) {
          printf("      alias=%u  rq=%s(%u)  actual=%s(%u)  %s\n", (unsigned)slaves[i].d.woAlias, mst_short(rq),
                 (unsigned)rq, mst_short(st), (unsigned)st, (st == desired_state) ? "OK" : "---");
        }
      }
      print_all_connected_slave_states(h, "      ");
      print_master_state_snapshot(h);
      fflush(stdout);
    }

    RtSleep((unsigned char)(step > 255u ? 255u : step));
    waited += step;
  }

  printf("Timeout waiting for all slaves -> %s(%u).\n", mst_short(desired_state), (unsigned)desired_state);
  fflush(stdout);
  return ER_EHAPI_TIMEOUT;
}

static int count_sdo_ready_slaves(EHHANDLE h, OmronSlaveEntry *slaves, int n) {
  int i;
  int ready = 0;
  for (i = 0; i < n; i++) {
    WORD rq = 0, st = 0;
    if (EhGetSlaveState(h, slaves[i].d.woAlias, &rq, &st) != ER_EHAPI_OK) {
      continue;
    }
    if (is_sdo_read_ready_state(st)) {
      ready++;
    }
  }
  return ready;
}

static WORD read_od_u8_try(EHHANDLE h, WORD slaveNo, WORD alias, WORD idx, BYTE sub, BYTE *out) {
  WORD rc = EhReadOD(h, slaveNo, idx, sub, out, 1);
  if (rc == ER_EHAPI_OK) return rc;
  return EhReadODByAlias(h, alias, idx, sub, out, 1);
}

static WORD read_od_u16_try(EHHANDLE h, WORD slaveNo, WORD alias, WORD idx, BYTE sub, WORD *out) {
  WORD rc = EhReadOD(h, slaveNo, idx, sub, out, 2);
  if (rc == ER_EHAPI_OK) return rc;
  return EhReadODByAlias(h, alias, idx, sub, out, 2);
}

static WORD read_od_u32_try(EHHANDLE h, WORD slaveNo, WORD alias, WORD idx, BYTE sub, DWORD *out) {
  WORD rc = EhReadOD(h, slaveNo, idx, sub, out, 4);
  if (rc == ER_EHAPI_OK) return rc;
  return EhReadODByAlias(h, alias, idx, sub, out, 4);
}

static WORD read_od_u8_byalias(EHHANDLE h, WORD alias, WORD idx, BYTE sub, BYTE *out) {
  return EhReadODByAlias(h, alias, idx, sub, out, 1);
}

static WORD read_od_u16_byalias(EHHANDLE h, WORD alias, WORD idx, BYTE sub, WORD *out) {
  return EhReadODByAlias(h, alias, idx, sub, out, 2);
}

static WORD read_od_u32_byalias(EHHANDLE h, WORD alias, WORD idx, BYTE sub, DWORD *out) {
  return EhReadODByAlias(h, alias, idx, sub, out, 4);
}

static void dump_object_3000_byalias(EHHANDLE h, const SLAVE_DETAIL *d) {
  BYTE v0 = 0;
  BYTE v1 = 0;
  WORD rc0;
  WORD rc1;
  WORD rq = 0, st = 0;
  WORD rs = 0;

  printf("--- alias=%u slaveNo=%lu phys=%lu product=0x%08lX ---\n",
         (unsigned)d->woAlias, (unsigned long)d->dwSlaveNo,
         (unsigned long)d->dwPhysicalAddr,
         (unsigned long)d->dwProductCode);

  rs = EhGetSlaveState(h, d->woAlias, &rq, &st);
  if (rs == ER_EHAPI_OK) {
    printf("  Slave state: rq=%s(%u) actual=%s(%u)\n", mst_short(rq), (unsigned)rq, mst_short(st), (unsigned)st);
    if (env_flag_enabled("ECAT_SLAVE_ERR_ESC_DUMP", 1) && (st & 0x10u) != 0u) {
      dump_esc_al_registers(h, d->woAlias);
    }
  } else {
    printf("  EhGetSlaveState failed rc=0x%04X (%s)\n", (unsigned)rs, ehapi_rc_str(rs));
  }

  // 取説に合わせて 0x3000 のサイズは 1バイト(u8)として読む
  // サブインデックスが 0/1 のどちらに「値」が入る機種があるので両方出す
  rc0 = read_od_u8_byalias(h, d->woAlias, 0x3000, 0, &v0);
  if (rc0 == ER_EHAPI_OK) {
    printf("  0x3000:0 (u8) = 0x%02X\n", (unsigned)v0);
  } else {
    printf("  0x3000:0 read failed rc=0x%04X (%s)\n", (unsigned)rc0, ehapi_rc_str(rc0));
  }

  rc1 = read_od_u8_byalias(h, d->woAlias, 0x3000, 1, &v1);
  if (rc1 == ER_EHAPI_OK) {
    printf("  0x3000:1 (u8) = 0x%02X\n", (unsigned)v1);
  } else {
    printf("  0x3000:1 read failed rc=0x%04X (%s)\n", (unsigned)rc1, ehapi_rc_str(rc1));
  }
}

int main(void) {
  WORD st;
  WORD rc;
  char node[128];
  EHHANDLE h;
  WORD nslaves = 0;
  WORD sn;
  SLAVE_DETAIL detail;
  const char *env = getenv("ECAT_EH_NODE");
  int used_env = (env != NULL && env[0] != '\0');

  /* INtime 等で printf が溜まり「先頭2行だけ」と見えるのを防ぐ */
  setvbuf(stdout, NULL, _IONBF, 0);

  strncpy(node, used_env ? env : ECAT_DEFAULT_NODE, sizeof(node) - 1);
  node[sizeof(node) - 1] = 0;

  printf("Omron SDO 0x3000 reader (RSI-ECAT EhOpen + EhRqState + EhReadOD)\n");
  printf("EH node name: %s (env ECAT_EH_NODE %s)\n", node, used_env ? "used" : "not set");

  h = EhOpen(node, &st);
  if (h == 0 || st != ER_EHAPI_OK) {
    print_eh_status("EhOpen", st);
    return 1;
  }
  printf("EhOpen OK. Next: EhSetTimeoutForOD, EhRqState, EhGetSlaveCount.\n");

  // OD 読み出し応答までのタイムアウトを延ばす（NO_RESPONSE を避ける狙い）
  // dwWriteOdTimeout は今回は未使用だが関数が2引数要求のため同値にしておく。
  rc = EhSetTimeoutForOD(h, 60000u, 60000u);
  if (rc != ER_EHAPI_OK) {
    print_eh_status("EhSetTimeoutForOD", rc);
  }

  {
    /* mailbox/SDO 読みだけなら PREOP で十分。SAFEOP は明示要求時のみ。 */
    int od_preop_only = 1;
    const char *po = getenv("ECAT_OD_PREOP_ONLY");
    const char *rs = getenv("ECAT_REQUIRE_SAFEOP");
    if (po != NULL && po[0] != '\0') {
      od_preop_only = (po[0] != '0');
    }
    if (rs != NULL && rs[0] != '\0' && rs[0] != '0') {
      od_preop_only = 0;
    }
    if (od_preop_only) {
      printf("PREOP mode: read SDO in PREOP (no SAFEOP request).\n");
    } else {
      printf("SAFEOP mode: ECAT_REQUIRE_SAFEOP is enabled.\n");
    }

    /* INIT→PREOP→SAFEOP の順が一般的。SAFEOP だけ要求すると実機で遷移しない／タイムアウトしやすい。 */
    printf("EhRqState(master -> PREOP) ...\n");
    rc = EhRqState(h, MST_PRE_OPERATIONAL);
    if (rc != ER_EHAPI_OK) {
      print_eh_status("EhRqState(PREOP)", rc);
      EhClose(h);
      return 1;
    }
    printf("wait_master_state(PREOP, timeout 180s) ...\n");
    rc = wait_master_state(h, MST_PRE_OPERATIONAL, 180000u);
    if (rc != ER_EHAPI_OK) {
      print_eh_status("wait_master_state(PREOP)", rc);
    }

    if (!od_preop_only) {
      printf("EhRqState(master -> SAFEOP) ...\n");
      rc = EhRqState(h, MST_SAFE_OPERATIONAL);
      if (rc != ER_EHAPI_OK) {
        print_eh_status("EhRqState(SAFEOP)", rc);
        EhClose(h);
        return 1;
      }
      printf("wait_master_state(SAFEOP, timeout 180s) ...\n");
      rc = wait_master_state(h, MST_SAFE_OPERATIONAL, 180000u);
      if (rc != ER_EHAPI_OK) {
        print_eh_status("wait_master_state(SAFEOP)", rc);
        /* SAFEOP に到達しきれなくても、次のスレーブ単位要求は試す。 */
      }
    }
  }

  {
    WORD rq2 = 0, st2 = 0;
    WORD g = EhGetState(h, &rq2, &st2);
    if (g == ER_EHAPI_OK) {
      printf("Master state after wait: rq=%s(%u) actual=%s(%u)\n", mst_short(rq2), (unsigned)rq2,
             mst_short(st2), (unsigned)st2);
    } else {
      printf("EhGetState after wait failed: rc=0x%04X (%s)\n", (unsigned)g, ehapi_rc_str(g));
    }
  }

  rc = EhGetSlaveCount(h, &nslaves);
  if (rc != ER_EHAPI_OK) {
    print_eh_status("EhGetSlaveCount", rc);
    EhClose(h);
    return 1;
  }

  printf("Configured slaves (count): %u\n", (unsigned)nslaves);
  print_all_connected_slave_states(h, "");

  {
    int od_preop_only = 1;
    int slave_safeop_before_od = 0;
    const char *po = getenv("ECAT_OD_PREOP_ONLY");
    const char *ss = getenv("ECAT_SLAVE_SAFEOP_BEFORE_OD");
    const char *rs = getenv("ECAT_REQUIRE_SAFEOP");
    if (po != NULL && po[0] != '\0') {
      od_preop_only = (po[0] != '0');
    }
    if (rs != NULL && rs[0] != '\0' && rs[0] != '0') {
      od_preop_only = 0;
    }
    if (ss != NULL && ss[0] != '\0' && ss[0] != '0') {
      slave_safeop_before_od = 1;
    }

    OmronSlaveEntry omron[MAX_OMRON_SLAVES];
    int nomron = 0;
    WORD alias_start = 5;
    WORD alias_end = 14;
    const char *es = getenv("ECAT_ALIAS_START");
    const char *ee = getenv("ECAT_ALIAS_END");
    if (es && es[0]) alias_start = (WORD)atoi(es);
    if (ee && ee[0]) alias_end = (WORD)atoi(ee);

    /* 1) 指定 Alias 範囲から Omron スレーブを列挙 */
    for (sn = alias_start; sn <= alias_end; sn++) {
      memset(&detail, 0, sizeof(detail));
      detail.dwSize = sizeof(detail);
      detail.woAlias = (WORD)sn;

      rc = EhFindSlaveByAlias(h, &detail);
      if (rc != ER_EHAPI_OK) {
        printf("EhFindSlaveByAlias(alias=%u): rc=0x%04X (skip)\n", (unsigned)sn, (unsigned)rc);
        continue;
      }
      if (detail.dwVendorID != OMRON_VENDOR_ID) {
        printf("Alias=%u vendor mismatch: vendor=%lu (skip)\n", (unsigned)sn, (unsigned long)detail.dwVendorID);
        continue;
      }

      if (nomron >= MAX_OMRON_SLAVES) {
        printf("Omron slave list full (%d), skipping alias=%u\n", MAX_OMRON_SLAVES, (unsigned)sn);
        break;
      }

      omron[nomron].d = detail;
      omron[nomron].prev_rq = 0xFFFFu;
      omron[nomron].prev_st = 0xFFFFu;
      nomron++;

      printf("Found Omron alias=%u slaveNo=%lu phys=%lu product=0x%08lX\n",
             (unsigned)detail.woAlias, (unsigned long)detail.dwSlaveNo,
             (unsigned long)detail.dwPhysicalAddr, (unsigned long)detail.dwProductCode);
    }

    if (nomron == 0) {
      printf("No Omron slaves in alias range %u..%u - nothing to read.\n", (unsigned)alias_start,
             (unsigned)alias_end);
    } else {
      int i;

      /* 2) 全スレーブに PREOP を要求 */
      printf("Request PREOP for %d Omron slave(s) ...\n", nomron);
      for (i = 0; i < nomron; i++) {
        rc = EhRqSlaveState(h, omron[i].d.woAlias, MST_PRE_OPERATIONAL);
        if (rc != ER_EHAPI_OK) {
          printf("EhRqSlaveState(alias=%u PREOP) rc=0x%04X (%s)\n", (unsigned)omron[i].d.woAlias, (unsigned)rc,
                 ehapi_rc_str(rc));
        }
      }

      /* 3) PREOP 待機ポリシー（既定:any=1台でも準備できたら進む） */
      {
        DWORD preop_wait_ms = env_u32_ms("ECAT_SLAVE_PREOP_WAIT_MS", 180000u);
        const char *preop_policy = getenv("ECAT_PREOP_WAIT_POLICY"); /* all / any / none */
        int min_ready = 1;
        const char *min_ready_env = getenv("ECAT_PREOP_READY_MIN");
        if (min_ready_env != NULL && min_ready_env[0] != '\0') {
          int t = atoi(min_ready_env);
          if (t > 0) {
            min_ready = t;
          }
        }
        if (min_ready > nomron) {
          min_ready = nomron;
        }

        if (preop_policy == NULL || preop_policy[0] == '\0') {
          preop_policy = "any";
        }

        if (strcmp(preop_policy, "none") == 0 || preop_wait_ms == 0u) {
          printf("PREOP wait policy=none: skip wait and go to SDO read.\n");
        } else if (strcmp(preop_policy, "all") == 0) {
          printf("PREOP wait policy=all: wait_all_slaves_state_monitored(timeout %lums) ...\n",
                 (unsigned long)preop_wait_ms);
          rc = wait_all_slaves_state_monitored(h, omron, nomron, MST_PRE_OPERATIONAL, preop_wait_ms);
          if (rc != ER_EHAPI_OK) {
            print_eh_status("wait_all_slaves_state_monitored(PREOP)", rc);
          }
        } else {
          /* any: 1台(または ECAT_PREOP_READY_MIN 台)でも PREOP/SAFEOP/OP かつ非ERRなら先に読む */
          const unsigned step = 100;
          const unsigned heartbeat_ms = 1000;
          DWORD waited = 0;
          DWORD since_hb = 0;
          int ready = count_sdo_ready_slaves(h, omron, nomron);
          printf("PREOP wait policy=any: wait until ready >= %d (timeout %lums). current ready=%d/%d\n",
                 min_ready, (unsigned long)preop_wait_ms, ready, nomron);
          while (waited < preop_wait_ms && ready < min_ready) {
            RtSleep((unsigned char)(step > 255u ? 255u : step));
            waited += step;
            since_hb += step;
            ready = count_sdo_ready_slaves(h, omron, nomron);
            if (since_hb >= heartbeat_ms) {
              since_hb = 0;
              printf("  [preop-any wait %lums] ready=%d/%d (target >= %d)\n",
                     (unsigned long)waited, ready, nomron, min_ready);
            }
          }
          if (ready >= min_ready) {
            printf("PREOP wait policy=any: proceed (ready=%d/%d).\n", ready, nomron);
          } else {
            printf("PREOP wait policy=any: timeout, proceed with currently ready slaves (%d/%d).\n", ready, nomron);
          }
        }
      }

      /* 4) オプション: 0x3000 読む前に SAFEOP へ（従来の動作） */
      if (slave_safeop_before_od && !od_preop_only) {
        printf("ECAT_SLAVE_SAFEOP_BEFORE_OD: request SAFEOP for %d slave(s) ...\n", nomron);
        for (i = 0; i < nomron; i++) {
          rc = EhRqSlaveState(h, omron[i].d.woAlias, MST_SAFE_OPERATIONAL);
          if (rc != ER_EHAPI_OK) {
            printf("EhRqSlaveState(alias=%u SAFEOP) rc=0x%04X (%s)\n", (unsigned)omron[i].d.woAlias, (unsigned)rc,
                   ehapi_rc_str(rc));
          }
        }
        {
          DWORD safe_wait_ms = env_u32_ms("ECAT_SLAVE_SAFEOP_WAIT_MS", 180000u);
          if (safe_wait_ms == 0u) {
            printf("ECAT_SLAVE_SAFEOP_WAIT_MS=0: skip wait for all slaves SAFEOP.\n");
          } else {
            rc = wait_all_slaves_state_monitored(h, omron, nomron, MST_SAFE_OPERATIONAL, safe_wait_ms);
            if (rc != ER_EHAPI_OK) {
              print_eh_status("wait_all_slaves_state_monitored(SAFEOP)", rc);
            }
          }
        }
      }

      /* 5) PREOP 到達済み（または SAFEOP/OP）スレーブのみ 0x3000 を表示 */
      printf("Reading SDO 0x3000 for slaves currently in PREOP/SAFEOP/OP ...\n");
      for (i = 0; i < nomron; i++) {
        WORD rq_now = 0, st_now = 0;
        WORD gs = EhGetSlaveState(h, omron[i].d.woAlias, &rq_now, &st_now);
        if (gs != ER_EHAPI_OK) {
          printf("Skip alias=%u: EhGetSlaveState rc=0x%04X (%s)\n",
                 (unsigned)omron[i].d.woAlias, (unsigned)gs, ehapi_rc_str(gs));
          continue;
        }
        if (!is_sdo_read_ready_state(st_now)) {
          printf("Skip alias=%u: current state %s(%u) not ready for SDO read.\n",
                 (unsigned)omron[i].d.woAlias, mst_short(st_now), (unsigned)st_now);
          continue;
        }
        dump_object_3000_byalias(h, &omron[i].d);
      }
    }
  }

  EhClose(h);
  printf("Done.\n");
  return 0;
}
