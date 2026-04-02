#ifndef PLCP_TON_SEGMENT_LAYOUT_H
#define PLCP_TON_SEGMENT_LAYOUT_H

/*
 * TON セグメント内のバイトオフセットと総サイズ（単一の定義源）。
 * llil / plcp_rtedge_bridge.c / plcp_rtedge クレートの数値はここと一致させること。
 *
 * 参照した「テーブル」形式の定義:
 *   - examples/PLCPFB/PLCPFB.c  Ton（FUNCTIONBLOCKDEFINE）のコネクタ列と
 *     (1Byte) / (4Byte) / (8Byte) コメント — PLCPEN の FUNCTIONBLOCKDEFINE と同じスタイル。
 *   - examples/PLCPFB/Timer.c  struct TON_PIN（実装メンバ順・#pragma pack(push,1)）
 *
 * IL（llil）は IEC の EN を先頭に追加。可視ピンは EN, IN, PT, ET, Q, _IN_（expand_fb_instance_to_pins）。
 * TIME（D_TIME）は 4 バイト境界、内部 _STTIME_（D_QWORD）は 8 バイト境界に配置し、
 * Eg セグメントゼロクリア長と Structure_CreateCatalog 系の累算と齟齬が出ないようにする。
 *
 * 注: Timer.c の TON_PIN はメンバ順が IN→PT→Q→ET→… であり、IL セグメントの「ET が Q より前」
 *     （オフセット ET=8, Q=12）とは順序が異なる。ここでは llil の CAL/スロット名と実バッファを一致させる。
 */
#define PLCP_TON_SEGMENT_BYTES 24u

#define PLCP_TON_OFS_EN 0
#define PLCP_TON_OFS_IN 1
/* IN の直後は TIME 用に 4 バイト境界までパディング（バイト 2〜3） */
#define PLCP_TON_OFS_PT 4
#define PLCP_TON_OFS_ET 8
#define PLCP_TON_OFS_Q 12
#define PLCP_TON_OFS__IN_ 13
/* _IN_ の後は QWORD 用に 8 バイト境界までパディング（バイト 14〜15） */
#define PLCP_TON_OFS__STTIME_ 16

#endif
