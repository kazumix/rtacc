#ifndef EZCAT_MASTER_H
#define EZCAT_MASTER_H

#include "ezcat_lowsock.h"

#include <stdint.h>

#define EZCAT_MAX_SLAVES 128
#define EZCAT_FRAME_MAX 1536

typedef struct ezcat_master {
  ezcat_lowsock_t link;
  uint8_t tx[EZCAT_FRAME_MAX];
  int slave_count;
  int slaves_op;        /* bringup OP 成功後 1（終了時に段階的停止の対象） */
  unsigned state_tmo_ms; /* bringup で使った各状態タイムアウト（shutdown で再利用） */
} ezcat_master_t;

int ezcat_master_init(ezcat_master_t *m, const char *ifname);
void ezcat_master_fini(ezcat_master_t *m);

/* スレーブ数を BRD で検出し、INIT→PREOP→SAFEOP→OP まで遷移（各段で AL Status をポーリング） */
int ezcat_master_bringup_op(ezcat_master_t *m, unsigned timeout_per_state_ms);

/*
 * OP から ETG 推奨どおり段階的に下げる: SAFEOP → PREOP → INIT。
 * リンクを閉じる前に呼ぶ。slaves_op でない場合は何もしない。
 */
void ezcat_master_shutdown_slaves(ezcat_master_t *m, unsigned timeout_per_state_ms);

#endif
