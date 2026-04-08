#ifndef EZCAT_LOWSOCK_H
#define EZCAT_LOWSOCK_H

#include <stddef.h>
#include <stdint.h>

/*
 * 1: 起動時 Npcap 一覧、RX 診断、WKC フィルタの捨てログ等をまとめて有効。
 * 1 にすると Npcap 一覧・送受信詳細・状態遷移の逐次表示など（ビルド -DEZCAT_DEBUG_ALL=1）。
 */
#ifndef EZCAT_DEBUG_ALL
#define EZCAT_DEBUG_ALL 0
#endif

typedef struct ezcat_lowsock {
  /*
   * Windows: (intptr_t)pcap_t *、未オープンは 0。
   * INtime: ソケット fd（>=0）、未オープンは -1。
   */
  intptr_t handle;
  uint8_t mac[6];
  char dev_name[260]; /* Windows: Npcap デバイス名。INtime: 要求 ifname のコピー */
  char dev_desc[384]; /* Windows: Npcap の description（一覧と同じ。切り分け用） */
} ezcat_lowsock_t;

/* INtime は _WIN32 だが fd>=0（0 もあり得る）なので Npcap と同じ判定にしない */
#if defined(_WIN32) && !defined(__INTIME__)
#define ezcat_lowsock_is_open(ls) ((ls) != NULL && (ls)->handle != (intptr_t)0)
#else
#define ezcat_lowsock_is_open(ls) ((ls) != NULL && (ls)->handle >= (intptr_t)0)
#endif

/* ezcat_lowsock_open 失敗理由（errno とは別。main のメッセージ用） */
#define EZCAT_OPEN_DETAIL_NONE 0
#define EZCAT_OPEN_NETLIB_NOT_FOUND 1
#define EZCAT_OPEN_NETLIB_SYMBOL 2
#define EZCAT_OPEN_CLIB_GETIFADDRS 3
#define EZCAT_OPEN_NO_IFACE 4
#define EZCAT_OPEN_SOCKET_FAIL 5
#define EZCAT_OPEN_BIND_FAIL 6
#define EZCAT_OPEN_CLIB_NOT_FOUND 7
/* Windows / Npcap */
#define EZCAT_OPEN_PCAP_ENUM 8
#define EZCAT_OPEN_WIN_MAC 9

void ezcat_lowsock_list_devices(void);

int ezcat_lowsock_open(ezcat_lowsock_t *ls, const char *ifname);
void ezcat_lowsock_close(ezcat_lowsock_t *ls);

/* 送信のみ。0 / -1 */
int ezcat_lowsock_send(ezcat_lowsock_t *ls, uint8_t *frame, int tx_len);
/* 0x88A4 1 フレーム受信のみ（同一 timeout 内）。成功時は長さ、タイムアウト -2、エラー -1 */
int ezcat_lowsock_recv_ecat(ezcat_lowsock_t *ls, uint8_t *frame, int rx_max, unsigned timeout_ms);

/* 1 フレーム送受信。成功時は受信長を返す。タイムアウトは -2、エラーは -1。 */
int ezcat_lowsock_txrx(ezcat_lowsock_t *ls, uint8_t *frame, int tx_len, int rx_max,
                       unsigned timeout_ms);

int ezcat_lowsock_last_open_errno(void);
int ezcat_lowsock_last_open_detail(void);

/* 直近の txrx 失敗メッセージ（Windows: pcap 等）。成功時や未設定は "" */
const char *ezcat_lowsock_last_io_msg(void);

/*
 * IEEE 802.3 Ethertype はオンザワイヤでビッグエンディアン（0x88A4 → バイト 0x88, 0xA4）。
 * 旧コードが LE で書いていたため、エコーだけ一致しスレーブ応答を取りこぼしていた。
 */
static inline uint16_t ezcat_ethertype_be_at(const uint8_t *p) {
  return (uint16_t)(((uint16_t)p[0] << 8) | (uint16_t)p[1]);
}

static inline int ezcat_frame_is_ecat(unsigned caplen, const uint8_t *pkt) {
  uint16_t et0;
  if (caplen < 14 || !pkt) {
    return 0;
  }
  et0 = ezcat_ethertype_be_at(pkt + 12);
  if (et0 == 0x88A4u) {
    return 1;
  }
  if ((et0 == 0x8100u || et0 == 0x88a8u || et0 == 0x9100u) && caplen >= 18) {
    if (ezcat_ethertype_be_at(pkt + 16) == 0x88A4u) {
      return 1;
    }
  }
  return 0;
}

#endif
