/*
 * ezcat: リンク層 raw で EtherCAT を送受信する最小マスタ。
 *   Windows: Npcap（build_ezcat.cmd）。環境変数 EZCAT_IF はデバイス名／説明の部分一致。
 *   INtime:  netlib/clib + PF_LINK raw（ezcat_lowsock_intime.c をリンクする rtacc 等のビルド）。
 *
 * 環境変数:
 *   EZCAT_IF      インタフェース。Windows は Npcap 名の部分一致。
 *                 未設定時は「イーサネット 2」説明、次に PRO/1000 等が 2 件なら 2 番目（I219 より優先）。
 *                 INtime 既定は ie1e0。
 *   EZCAT_TMO     各状態のタイムアウト [ms]。未設定時は 5000。
 *   EZCAT_LISTIF  1 で起動時に利用可能インタフェース一覧（Windows は Npcap デバイス）
 *   EZCAT_USE_BPF 1 でカーネル BPF 有効（既定オフ。混雑 LAN 向け）
 *   EZCAT_NO_BPF  1 で BPF 強制オフ（USE_BPF より優先）
 *   EZCAT_PCAP_IN   1 で pcap 受信方向を IN のみ（既定は INOUT＝ライブラリ既定）
 *   EZCAT_DEBUG_RX 1 でタイムアウト時に pcap 統計（EZCAT_DEBUG_ALL=1 なら recv ループ内も）
 *   EZCAT_DEBUG_ALL ビルド時マクロ: 1 で Npcap 一覧・IF/MAC 表示・マスタ詳細ログ
 *   EZCAT_NO_SII   1 でスレーブ一覧の SII(EEPROM) 読み取りを省略（起動を速く）
 *   EZCAT_SII_WORDS 読む SII ワード数（既定 96、16〜256）。デバイス名が出ない場合に増やす
 *   終了時: Ctrl+C / コンソール終了で OP->SAFEOP->PREOP->INIT の後に Npcap を閉じる
 *   EZCAT_POST_SII_MS  PREOP 成立後の在庫(SII)読み直後の待ち ms（既定 400）。SAFEOP 前に ESC を落ち着かせる
 *   EZCAT_NO_COE=1     PREOP 成立後の CoE SDO 読み取りを省略
 *   EZCAT_COE_TMO      SDO 応答待ち ms（50〜10000、未設定時は ap タイムアウトの約 3 倍）
 *   EZCAT_SDO_IDX      SDO インデックス 16 進 0x.... または 10 進（既定 0x3000）
 *   EZCAT_SDO_SUB      SDO サブインデックス（既定 0）
 *   EZCAT_SDO_DUMP_BYTES  CoE で読み取ってダンプする最大バイト数（1〜1024、既定 512）
 *
 * INtime 専用（rtacc + ezcat_lowsock_intime.c のとき）:
 *   EZCAT_NETLIB, EZCAT_CLIB, INTIME など（従来どおり）
 */

#include "ezcat_master.h"
#include "ezcat_lowsock.h"

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
 * rtacc は __INTIME__ + i386-pc-windows-msvc のため _WIN32 が立つが、
 * デスクトップ用 windows.h（コンソールハンドラ等）は使えない。INtime は RTOS 側と同じ経路にする。
 */
#if defined(_WIN32) && !defined(__INTIME__)
#include <windows.h>
static volatile LONG g_ezcat_stop;
static BOOL WINAPI ezcat_ctrl_handler(DWORD ctrl_type) {
  if (ctrl_type == CTRL_C_EVENT || ctrl_type == CTRL_BREAK_EVENT || ctrl_type == CTRL_CLOSE_EVENT) {
    InterlockedExchange(&g_ezcat_stop, 1);
    return TRUE;
  }
  return FALSE;
}
#else
#include <rt.h>
#include <signal.h>
static volatile sig_atomic_t g_ezcat_stop;
static void ezcat_sig_int(int sig) {
  (void)sig;
  g_ezcat_stop = 1;
}
#endif

#if defined(_WIN32) && !defined(__INTIME__)
#ifndef EZCAT_DEFAULT_IF
#define EZCAT_DEFAULT_IF ""
#endif
#else
#ifndef EZCAT_DEFAULT_IF
#define EZCAT_DEFAULT_IF "ie1e0"
#endif
#endif

static unsigned ezcat_parse_u(const char *s) {
  unsigned v = 0;
  if (!s) {
    return 0;
  }
  while (*s >= '0' && *s <= '9') {
    v = v * 10u + (unsigned)(*s - '0');
    if (v > 300000u) {
      break;
    }
    s++;
  }
  return v;
}

int main(void) {
  ezcat_master_t m;
  const char *ifname = getenv("EZCAT_IF");

#if defined(_WIN32) && !defined(__INTIME__)
  /* 日本語メッセージを文字化けさせない（cmd 既定 CP932 対策） */
  SetConsoleOutputCP(65001);
  SetConsoleCP(65001);
#endif
  const char *tmos = getenv("EZCAT_TMO");
#if !EZCAT_DEBUG_ALL
  const char *listif = getenv("EZCAT_LISTIF");
#endif
  unsigned tmo = 5000u;

  if (!ifname) {
    ifname = EZCAT_DEFAULT_IF;
  }
  if (tmos && tmos[0]) {
    unsigned v = ezcat_parse_u(tmos);
    if (v > 0u && v < 300000u) {
      tmo = v;
    }
  }

#if EZCAT_DEBUG_ALL
  printf("ezcat: debug: EZCAT_DEBUG_ALL=1 (Npcap device list follows)\n");
  ezcat_lowsock_list_devices();
#else
  if (listif && listif[0] == '1') {
    ezcat_lowsock_list_devices();
  }
#endif

#if EZCAT_DEBUG_ALL
#  if defined(_WIN32) && !defined(__INTIME__)
  printf("ezcat: EZCAT_IF=%s state_timeout_ms=%u\n",
         (ifname && ifname[0]) ? ifname
                               : u8"(unset: イーサネット 2 / PRO/1000 2nd / not I219)",
         tmo);
#  else
  printf("ezcat: EZCAT_IF=%s state_timeout_ms=%u\n", ifname, tmo);
#  endif
#endif

  if (ezcat_master_init(&m, ifname) != 0) {
    int en = ezcat_lowsock_last_open_errno();
    int det = ezcat_lowsock_last_open_detail();
    printf("ezcat: open failed (if=\"%s\"", ifname);
    if (en != 0) {
      printf(", errno=%d", en);
      if (strerror(en) != NULL && strerror(en)[0] != '\0') {
        printf(" (%s)", strerror(en));
      }
    }
    printf(", detail=%d)\n", det);
#if defined(_WIN32) && !defined(__INTIME__)
    if (det == EZCAT_OPEN_PCAP_ENUM || det == EZCAT_OPEN_NO_IFACE) {
      printf("ezcat: Npcap のデバイスを確認するには EZCAT_LISTIF=1 を付けて実行してください。\n");
    }
    if (det == EZCAT_OPEN_WIN_MAC) {
      printf("ezcat: アダプタの MAC を GetAdaptersAddresses で取得できませんでした。\n");
    }
#else
    if (det == EZCAT_OPEN_NETLIB_NOT_FOUND) {
      printf("ezcat: netlib.rsl not loaded. Expected: %%INTIME%%\\bin\\netlib.rsl\n");
      printf("ezcat:   set INTIME to SDK root, or EZCAT_NETLIB=C:\\path\\to\\netlib.rsl\n");
    } else if (det == EZCAT_OPEN_CLIB_NOT_FOUND) {
      printf("ezcat: clib.rsl not loaded (needed for ioctl/close). Set INTIME or EZCAT_CLIB\n");
    } else if (det == EZCAT_OPEN_NETLIB_SYMBOL) {
      printf("ezcat: netlib/clib loaded but a required symbol missing ");
      printf("(netlib: socket,bind,send,recv; clib: ioctl,close)\n");
    } else if (det == EZCAT_OPEN_CLIB_GETIFADDRS) {
      printf("ezcat: getifaddrs/freeifaddrs missing. Try EZCAT_CLIB=...\\clib.rsl\n");
    } else if (det == EZCAT_OPEN_NO_IFACE || en == ENXIO) {
      printf("ezcat: no AF_LINK+MAC for ifname (case-insensitive + ifindex tried)\n");
      printf("ezcat:   EZCAT_LISTIF=1 then rerun to print interface names\n");
    }
    printf("ezcat: hint: EZCAT_IF=ie1e0\n");
#endif
    return 1;
  }

#if EZCAT_DEBUG_ALL && defined(_WIN32) && !defined(__INTIME__)
  if (m.link.dev_name[0]) {
    printf("ezcat: opened Npcap: %s\n", m.link.dev_name);
  }
  if (m.link.dev_desc[0]) {
    printf("ezcat: Npcap description: %s\n", m.link.dev_desc);
  }
#endif
#if EZCAT_DEBUG_ALL
  printf("ezcat: TX Ethernet src %02x:%02x:%02x:%02x:%02x:%02x\n", m.link.mac[0], m.link.mac[1],
         m.link.mac[2], m.link.mac[3], m.link.mac[4], m.link.mac[5]);
#endif

  if (ezcat_master_bringup_op(&m, tmo) != 0) {
    printf("ezcat: bringup failed (INIT→PREOP 等で止まりました)。SII 一覧・CoE SDO ダンプは PREOP 成功後のみです。\n");
    ezcat_master_fini(&m);
    return 1;
  }

#if defined(__INTIME__)
  printf("ezcat: OP, %d slave(s). Ctrl+C でスレーブを段階停止して終了します。\n", m.slave_count);
#else
  printf("ezcat: OP, %d slave(s). Ctrl+C またはウィンドウ終了でスレーブを段階停止して終了します。\n",
         m.slave_count);
#endif

#if defined(_WIN32) && !defined(__INTIME__)
  SetConsoleCtrlHandler(ezcat_ctrl_handler, TRUE);
#else
  g_ezcat_stop = 0;
  (void)signal(SIGINT, ezcat_sig_int);
#endif

  for (;;) {
#if defined(_WIN32) && !defined(__INTIME__)
    if (InterlockedCompareExchange(&g_ezcat_stop, 0, 0) != 0) {
      break;
    }
    Sleep(100);
#else
    if (g_ezcat_stop) {
      break;
    }
    RtSleepEx(100);
#endif
  }

  printf("ezcat: shutting down EtherCAT...\n");
  ezcat_master_shutdown_slaves(&m, tmo);
  ezcat_master_fini(&m);
  printf("ezcat: done.\n");
  return 0;
}
