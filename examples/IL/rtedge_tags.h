#pragma once

#include <stddef.h>

/**
 * test.IL の VAR と整合する RTedge タグ登録と、llil のグローバルスロット初期化。
 *
 * PLCP 側の対応: instruction.c の VAR() が Rtedge_TagCreateByInstruction を呼ぶ
 *（ニーモニック解釈時・ロジックリストには積まない）。rtedge.c に実体。
 *
 * 処理順（PLCP の Rtedge_TagCreateByInstruction / Functionblock_Register に準拠）:
 *  1. スカラー等の型付きタグ
 *  2. FUNCTION インスタンス（FUNCTION#型#名）および各ピン（@il_mem_* と同名の命令書式）
 *  3. test_slots_init（--memory=rtedge 時の @il_slot_* ← @il_mem_* の仮割当）
 *  4. IlRtedgeSlots_BindEgEntry（本番 EgApi: EgTagGetProperty Entry で RTedge 実体を il_slot に再割当）
 *
 * 参照実装: examples/PLCP/rtedge.c の Rtedge_TagCreateByInstruction。
 *
 * - IL_USE_EGAPI: il_rtedge_egapi.c が EgTagCreateEx / EgTagCreateSegment（EgApi）を呼ぶ。
 * - IL_EGAPI_STUB=1: EgApi はスタブ（本番は defines から IL_EGAPI_STUB を外し RTedge ライブラリをリンク）。
 * - IL_USE_PLCP_RTEDGE かつ IL_USE_EGAPI なし: レジストリのみの BOOL 版。
 * test_slots_init は llil --memory=rtedge の IR からリンク。
 */
void IlRtedgeTags_Init(void);

/** 本番 EgApi 時: 各タグ名で Entry を取得し @il_slot_* を RTedge データへ向ける（スタブ時は no-op）。 */
void IlRtedgeSlots_BindEgEntry(void);

/** IlRtedgeTags_Init でレジストリに積んだ件数。 */
unsigned IlRtedgeTags_GetRegisteredCount(void);

/** 登録済み命令書式をコピー（例 "BOOL#StartSW"）。成功 0、失敗 -1。 */
int IlRtedgeTags_GetRegisteredSpec(unsigned index, char *out, size_t outsz);
