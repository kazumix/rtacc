#pragma once

#include <stddef.h>

/**
 * measure36.IL の VAR と整合する RTedge タグ登録と、
 * llil のグローバルスロット初期化。
 *
 * PLCP 側の対応: instruction.c の VAR() が Rtedge_TagCreateByInstruction を呼ぶ
 * （ニーモニック解釈時・ロジックリストには積まない）。rtedge.c に実体。
 */
void IlRtedgeTags_Init(void);

/** 本番 EgApi 時: 各タグ名で Entry を取得し @il_slot_* を RTedge データへ向ける（スタブ時は no-op）。 */
void IlRtedgeSlots_BindEgEntry(void);

/** IlRtedgeTags_Init でレジストリに積んだ件数。 */
unsigned IlRtedgeTags_GetRegisteredCount(void);

/** 登録済み命令書式をコピー（例 "BOOL#StartSW"）。成功 0、失敗 -1。 */
int IlRtedgeTags_GetRegisteredSpec(unsigned index, char *out, size_t outsz);

