/*
 * rtedgelink.c — RTEdge タグ（EgApi）と IL/rtedge スロット連携を提供する。
 *
 * llil が生成する rtedge glue（例: out/inc_rtedge_glue.c）は project.json の sources に含めてコンパイルする。
 */

/* IL_EGAPI 実処理の有効状態を 1 つに畳む */
#if defined(IL_USE_ETAG_RTEDGE)
#define IL_USE_PLCP_RTEDGE 1
#define IL_USE_EGAPI 1
#endif

#if defined(IL_EGAPI_STUB) && IL_EGAPI_STUB
#define IL_EGAPI_PLCP_RTEDGE 0
#elif defined(IL_USE_PLCP_RTEDGE) && defined(IL_USE_EGAPI)
#define IL_EGAPI_PLCP_RTEDGE 1
#else
#define IL_EGAPI_PLCP_RTEDGE 0
#endif

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

#ifndef IL_RTEDGE_REGISTRY_H
#define IL_RTEDGE_REGISTRY_H

/*
 * rtedge_tags.c 等が保持する命令書式レジストリへ 1 件追加（EgApi 成否の記録用）。
 */
unsigned char il_rtedge_registry_push(char *string, unsigned char hidden);

/*
 * llil / llst が --memory=rtedge の slots_init で登録する
 * 「命令書式文字列 → il_slot グローバル」対応表。
 * IlRtedgeRegistry_BindAllSlots で EgTagGetProperty(Entry) により実データポインタへ置換する。
 */
void il_rtedge_registry_clear(void);
void il_rtedge_registry_record_binding(const char *spec, void **slot_pp);
void IlRtedgeRegistry_BindAllSlots(void);

#endif

#ifndef PLCP_RTEDGE_BRIDGE_H
#define PLCP_RTEDGE_BRIDGE_H

#include <stddef.h>

/*
 * Rust クレート plcp_rtedge と同じ FFI（C 実装をデフォルトリンク）。
 */
void plcp_rtedge_after_segment(const char *instname, const char *fbname);
void plcp_rtedge_clear_instances(void);

unsigned plcp_rtedge_fb_segment_bytes_by_name(const char *fbname);
int plcp_rtedge_fb_member_offset(const char *fbname, const char *member);
int plcp_rtedge_parse_fb_pin(const char *full, char *inst_out, size_t inst_out_sz, char *member_out,
			     size_t member_out_sz);

/* TON 互換 */
int plcp_rtedge_parse_ton_pin(const char *full, char *inst_out, size_t inst_out_sz, char *member_out,
			      size_t member_out_sz);
int plcp_rtedge_ton_member_offset(const char *member);
unsigned plcp_rtedge_ton_segment_bytes(void);

#endif

/* ========== il_rtedge_registry_core ========== */
/*
 * EgApi 経路の il_rtedge_registry_push（命令書式レジストリ）。
 * llil が VAR / FUNCTION から生成する *_slots_init が参照する
 * il_rtedge_registry_clear / record_binding は本サンプルでは未使用のため no-op。
 */
#include <stddef.h>
#include <string.h>

#define IL_RTEDGE_TAG_MAX 4096
#define IL_RTEDGE_TAG_MAX_LEN 112

static char il_rtedge_tag_storage[IL_RTEDGE_TAG_MAX][IL_RTEDGE_TAG_MAX_LEN];
static unsigned char il_rtedge_tag_hidden[IL_RTEDGE_TAG_MAX];
static unsigned il_rtedge_tag_count;

static size_t il_rtedge_str_len_bounded(const char *s, size_t max)
{
	size_t n = 0;

	while (n < max && s[n])
		n++;
	return n;
}

unsigned char il_rtedge_registry_push(char *string, unsigned char hidden)
{
	size_t len;

	if (string == NULL)
		return 0;
	if (il_rtedge_tag_count >= IL_RTEDGE_TAG_MAX)
		return 0;
	len = il_rtedge_str_len_bounded(string, IL_RTEDGE_TAG_MAX_LEN - 1);
	memcpy(il_rtedge_tag_storage[il_rtedge_tag_count], string, len);
	il_rtedge_tag_storage[il_rtedge_tag_count][len] = '\0';
	il_rtedge_tag_hidden[il_rtedge_tag_count] = hidden ? 1 : 0;
	il_rtedge_tag_count++;
	return 1;
}

void il_rtedge_registry_clear(void)
{
	il_rtedge_tag_count = 0;
}

void il_rtedge_registry_record_binding(const char *spec, void **slot_pp)
{
	(void)spec;
	(void)slot_pp;
}

void IlRtedgeRegistry_BindAllSlots(void) {}

/* ========== plcp_rtedge_bridge ========== */
/*
 * PLCP Functionblock_Register / Structure_CreateCatalog（オフセット）相当。
 * 数値は plcp_rtedge/src/fb_layout.rs / plcp_ton_segment_layout.h と一致させること。
 */
#include <stddef.h>
#include <stdint.h>
#include <string.h>

#define PLCP_MAX_FB 256

static char g_fb_inst[PLCP_MAX_FB][80];
static char g_fb_family[PLCP_MAX_FB][32];
static unsigned g_fb_count;

static int fb_index(const char *inst)
{
	unsigned i;

	for (i = 0; i < g_fb_count; i++) {
		if (strcmp(g_fb_inst[i], inst) == 0)
			return (int)i;
	}
	return -1;
}

void plcp_rtedge_clear_instances(void)
{
	g_fb_count = 0;
}

void plcp_rtedge_after_segment(const char *instname, const char *fbname)
{
	if (instname == NULL || fbname == NULL)
		return;
	if (g_fb_count >= PLCP_MAX_FB)
		return;
	if (fb_index(instname) >= 0)
		return;
	strncpy(g_fb_inst[g_fb_count], instname, sizeof(g_fb_inst[0]) - 1);
	g_fb_inst[g_fb_count][sizeof(g_fb_inst[0]) - 1] = '\0';
	strncpy(g_fb_family[g_fb_count], fbname, sizeof(g_fb_family[0]) - 1);
	g_fb_family[g_fb_count][sizeof(g_fb_family[0]) - 1] = '\0';
	g_fb_count++;
}

static const char *family_for_inst(const char *inst)
{
	int i = fb_index(inst);

	if (i < 0)
		return NULL;
	return g_fb_family[(unsigned)i];
}

/* plcp_rtedge fb_layout.rs family_is_type_conversion_en と一致 */
static int family_is_type_conversion_en(const char *fbname)
{
	if (fbname == NULL)
		return 0;
	return strncmp(fbname, "WORD_TO_", 8) == 0 || strncmp(fbname, "DWORD_TO_", 9) == 0
	    || strncmp(fbname, "UDINT_TO_", 9) == 0 || strncmp(fbname, "INT_TO_", 7) == 0
	    || strncmp(fbname, "REAL_TO_", 8) == 0 || strncmp(fbname, "LREAL_TO_", 9) == 0
	    || strncmp(fbname, "BOOL_TO_", 8) == 0 || strncmp(fbname, "BYTE_TO_", 8) == 0
	    || strncmp(fbname, "SINT_TO_", 8) == 0 || strncmp(fbname, "UINT_TO_", 8) == 0
	    || strncmp(fbname, "USINT_TO_", 9) == 0;
}

unsigned plcp_rtedge_fb_segment_bytes_by_name(const char *fbname)
{
	if (fbname == NULL)
		return 0;
	if (family_is_type_conversion_en(fbname))
		return 16;
	if (strncmp(fbname, "R_TRIG", 6) == 0 || strncmp(fbname, "F_TRIG", 6) == 0)
		return 12;
	if (strncmp(fbname, "TON", 3) == 0 || strncmp(fbname, "TOF", 3) == 0)
		return PLCP_TON_SEGMENT_BYTES;
	if (strncmp(fbname, "TP", 2) == 0)
		return 40;
	if (strncmp(fbname, "CTUD", 4) == 0)
		return 48;
	if (strncmp(fbname, "CTU", 3) == 0 || strncmp(fbname, "CTD", 3) == 0)
		return 32;
	if (strncmp(fbname, "ADD", 3) == 0 || strncmp(fbname, "SUB", 3) == 0 || strncmp(fbname, "MUL", 3) == 0
	    || strncmp(fbname, "DIV", 3) == 0 || strncmp(fbname, "MOD", 3) == 0)
		return 16;
	/* LogicOpe_EN LOGIC_OPE_PIN / EQ_EN EQ_PIN — ADD_PIN と同型 16B（未登録時は il_fb が 64 になるのを防ぐ） */
	if (strcmp(fbname, "AND") == 0 || strcmp(fbname, "OR") == 0 || strcmp(fbname, "XOR") == 0
	    || strcmp(fbname, "ANDN") == 0 || strcmp(fbname, "ORN") == 0 || strcmp(fbname, "XORN") == 0)
		return 16;
	if (strcmp(fbname, "EQ") == 0 || strcmp(fbname, "NE") == 0 || strcmp(fbname, "GT") == 0
	    || strcmp(fbname, "GE") == 0 || strcmp(fbname, "LT") == 0 || strcmp(fbname, "LE") == 0)
		return 16;
	if (strcmp(fbname, "NOT") == 0)
		return 16;
	if (strcmp(fbname, "MOVE") == 0 || strcmp(fbname, "LN") == 0 || strcmp(fbname, "LOG") == 0
	    || strcmp(fbname, "EXP") == 0 || strcmp(fbname, "EXPT") == 0)
		return 16;
	if (strcmp(fbname, "SHR") == 0 || strcmp(fbname, "SHL") == 0 || strcmp(fbname, "ROL") == 0
	    || strcmp(fbname, "BIT_TEST") == 0)
		return 16;
	return 0;
}

static int arith_member_offset(const char *m)
{
	if (strcmp(m, "EN") == 0)
		return 0;
	if (strcmp(m, "IN1") == 0)
		return 1;
	if (strcmp(m, "IN2") == 0)
		return 5;
	if (strcmp(m, "ENO") == 0)
		return 9;
	if (strcmp(m, "OUT") == 0)
		return 10;
	return -1;
}

static int not_en_member_offset(const char *m)
{
	if (strcmp(m, "EN") == 0)
		return 0;
	if (strcmp(m, "IN") == 0)
		return 1;
	if (strcmp(m, "ENO") == 0)
		return 5;
	if (strcmp(m, "OUT") == 0)
		return 6;
	return -1;
}

static int ton_like_offset(const char *m)
{
	if (strcmp(m, "EN") == 0)
		return PLCP_TON_OFS_EN;
	if (strcmp(m, "IN") == 0)
		return PLCP_TON_OFS_IN;
	if (strcmp(m, "PT") == 0)
		return PLCP_TON_OFS_PT;
	if (strcmp(m, "ET") == 0)
		return PLCP_TON_OFS_ET;
	if (strcmp(m, "Q") == 0)
		return PLCP_TON_OFS_Q;
	if (strcmp(m, "_IN_") == 0)
		return PLCP_TON_OFS__IN_;
	if (strcmp(m, "_STTIME_") == 0)
		return PLCP_TON_OFS__STTIME_;
	return -1;
}

static int trig_edge_member_offset(const char *m)
{
	if (strcmp(m, "CLK") == 0)
		return 0;
	if (strcmp(m, "Q") == 0)
		return 1;
	if (strcmp(m, "_prev_clk") == 0 || strcmp(m, "_PREV_CLK") == 0)
		return 2;
	return -1;
}

int plcp_rtedge_fb_member_offset(const char *fbname, const char *member)
{
	if (fbname == NULL || member == NULL)
		return -1;
	if (family_is_type_conversion_en(fbname))
		return not_en_member_offset(member);
	if (strncmp(fbname, "R_TRIG", 6) == 0 || strncmp(fbname, "F_TRIG", 6) == 0)
		return trig_edge_member_offset(member);
	if (strcmp(fbname, "MOVE") == 0 || strcmp(fbname, "LN") == 0 || strcmp(fbname, "LOG") == 0
	    || strcmp(fbname, "EXP") == 0)
		return not_en_member_offset(member);
	if (strcmp(fbname, "EXPT") == 0 || strcmp(fbname, "SHR") == 0 || strcmp(fbname, "SHL") == 0
	    || strcmp(fbname, "ROL") == 0 || strcmp(fbname, "BIT_TEST") == 0)
		return arith_member_offset(member);
	if (strncmp(fbname, "TON", 3) == 0 || strncmp(fbname, "TOF", 3) == 0)
		return ton_like_offset(member);
	if (strncmp(fbname, "TP", 2) == 0)
		return ton_like_offset(member);
	if (strncmp(fbname, "CTUD", 4) == 0) {
		if (strcmp(member, "CU") == 0)
			return 0;
		if (strcmp(member, "CD") == 0)
			return 1;
		if (strcmp(member, "RESET") == 0)
			return 2;
		if (strcmp(member, "LOAD") == 0)
			return 3;
		if (strcmp(member, "PV") == 0)
			return 4;
		if (strcmp(member, "QU") == 0)
			return 6;
		if (strcmp(member, "QD") == 0)
			return 7;
		if (strcmp(member, "CV") == 0)
			return 8;
		if (strcmp(member, "_CU_") == 0 || strcmp(member, "_prev_cu") == 0)
			return 10;
		if (strcmp(member, "_CD_") == 0 || strcmp(member, "_prev_cd") == 0)
			return 11;
		return -1;
	}
	if (strncmp(fbname, "CTU", 3) == 0) {
		if (strcmp(member, "CU") == 0)
			return 0;
		if (strcmp(member, "RESET") == 0)
			return 1;
		if (strcmp(member, "PV") == 0)
			return 2;
		if (strcmp(member, "Q") == 0)
			return 4;
		if (strcmp(member, "CV") == 0)
			return 5;
		if (strcmp(member, "_CU_") == 0 || strcmp(member, "_prev_cu") == 0)
			return 7;
		return -1;
	}
	if (strncmp(fbname, "CTD", 3) == 0) {
		if (strcmp(member, "CD") == 0)
			return 0;
		if (strcmp(member, "LOAD") == 0)
			return 1;
		if (strcmp(member, "PV") == 0)
			return 2;
		if (strcmp(member, "Q") == 0)
			return 4;
		if (strcmp(member, "CV") == 0)
			return 5;
		if (strcmp(member, "_CD_") == 0 || strcmp(member, "_prev_cd") == 0)
			return 7;
		return -1;
	}
	if (strncmp(fbname, "ADD", 3) == 0 || strncmp(fbname, "SUB", 3) == 0 || strncmp(fbname, "MUL", 3) == 0
	    || strncmp(fbname, "DIV", 3) == 0 || strncmp(fbname, "MOD", 3) == 0)
		return arith_member_offset(member);
	if (strcmp(fbname, "AND") == 0 || strcmp(fbname, "OR") == 0 || strcmp(fbname, "XOR") == 0
	    || strcmp(fbname, "ANDN") == 0 || strcmp(fbname, "ORN") == 0 || strcmp(fbname, "XORN") == 0)
		return arith_member_offset(member);
	if (strcmp(fbname, "EQ") == 0 || strcmp(fbname, "NE") == 0 || strcmp(fbname, "GT") == 0
	    || strcmp(fbname, "GE") == 0 || strcmp(fbname, "LT") == 0 || strcmp(fbname, "LE") == 0)
		return arith_member_offset(member);
	if (strcmp(fbname, "NOT") == 0)
		return not_en_member_offset(member);
	return -1;
}

int plcp_rtedge_ton_member_offset(const char *member)
{
	return plcp_rtedge_fb_member_offset("TON", member);
}

unsigned plcp_rtedge_ton_segment_bytes(void)
{
	return PLCP_TON_SEGMENT_BYTES;
}

int plcp_rtedge_parse_fb_pin(const char *full, char *inst_out, size_t inst_out_sz, char *member_out,
			     size_t member_out_sz)
{
	const char *dot;
	size_t ilen;
	const char *fam;

	if (full == NULL || inst_out == NULL || member_out == NULL || inst_out_sz == 0 || member_out_sz == 0)
		return 0;
	dot = strrchr(full, '.');
	if (dot == NULL || dot == full)
		return 0;
	ilen = (size_t)(dot - full);
	if (ilen >= inst_out_sz)
		return 0;
	memcpy(inst_out, full, ilen);
	inst_out[ilen] = '\0';
	fam = family_for_inst(inst_out);
	if (fam == NULL)
		return 0;
	strncpy(member_out, dot + 1, member_out_sz - 1);
	member_out[member_out_sz - 1] = '\0';
	if (plcp_rtedge_fb_member_offset(fam, member_out) < 0)
		return 0;
	return 1;
}

int plcp_rtedge_parse_ton_pin(const char *full, char *inst_out, size_t inst_out_sz, char *member_out,
			      size_t member_out_sz)
{
	return plcp_rtedge_parse_fb_pin(full, inst_out, inst_out_sz, member_out, member_out_sz);
}

/* ========== il_rtedge_egapi ========== */
/*
 * examples/PLCP/rtedge.c の Rtedge_TagCreateByInstruction と同じ流れで EgApi を呼ぶ（縮小版）。
 *
 * PLCP 本流での FUNCTION#TON#TON_1 の流れ（実体セグメント＋ピンリンク）:
 *   rtedge.c: Rtedge_TagCreateByInstruction → strrchr で instname="TON_1" を取り出し
 *   → Rtedge_TagCreate → EgTagCreateSegment(name=TON_1, bufsize=Functionblock_GetSize("TON"), …)
 *   → Functionblock_Register("TON_1") → functionblock.c: Structure_CreateCatalog
 *   → structure.c: セグメント上のオフセットと TON_1.EN 等の PLC 変数を link する（親子関係の「リンク」）
 *
 * 本ファイルには Variable_* / Heap_* は無い。
 * - plcp_rtedge_after_segment: PLCP の Functionblock_Register 前段（TON インスタンス登録）
 * - il_rtedge_structure_create_catalog_*: PLCP structure.c Structure_CreateCatalog に相当し、
 *   Rtedge_TagGetPointer(inst) と同じ親 link を前提にメンバを「論理タグ」（命令書式文字列）として
 *   il_rtedge_registry に積む。実体アドレスは Variable の pVal ではなく、IlRtedgeSlots_BindEgEntry で
 *   link->pSegment + offset（plcp_rtedge_ton_member_offset）に il_slot を合わせる。
 * llil は FUNCTION セグメントのピンに対して EgTagCreateEx（別バッファ）を出さない。
 *
 * IL_USE_EGAPI && IL_USE_PLCP_RTEDGE のときのみ Rtedge_TagCreateByInstruction を定義。
 * IL_EGAPI_STUB=1: EgTag* は本ファイル内スタブ（単体ビルド用。本番では defines に含めない）。
 */
#if IL_EGAPI_PLCP_RTEDGE


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

typedef unsigned char BOOL;
#define FALSE 0
#define TRUE 1

#define D_INT 0x0105
#define D_UINT 0x0201
#define D_DWORD 0x0203
#define D_TIME 0x0543
#define D_FUNCTION 0x0423
#define D_STRING 0x0542
#define D_BOOL 0x0600

/* egapi.h の EgVtSegment/EgVtNull と名前衝突しないようリテラル使用（SDK 列挙と一致） */
#define IL_EGVT_SEGMENT 13
#define IL_EGVT_NULL 99

struct IlKeywordMatch {
	const char *keyword;
	uint16_t iectype;
	int edgetype;
	int size;
};

static const struct IlKeywordMatch il_kw[] = {
	{"BOOL#", D_BOOL, 1, 1},
	{"INT#", D_INT, 4, 2},
	{"UINT#", D_UINT, 5, 2},
	/* edgetype: EgVtUInt32 (=7)。4 は EgVtInt16（INT#）と同じ誤りを避ける */
	{"DWORD#", D_DWORD, 7, 4},
	{"TIME#", D_TIME, 7, 4},
	{"FUNCTION#", D_FUNCTION, IL_EGVT_SEGMENT, -1},
	{"STRING#", D_STRING, IL_EGVT_SEGMENT, 83},
	{NULL, 0, 0, 0},
};

static uint16_t il_iec_to_edge(uint16_t iec)
{
	const struct IlKeywordMatch *p;

	for (p = il_kw; p->keyword; p++) {
		if (p->iectype == iec)
			return (uint16_t)p->edgetype;
	}
	return IL_EGVT_NULL;
}

static uint16_t il_fb_segment_size_bytes(const char *fbname)
{
	unsigned sz;

	if (fbname == NULL)
		return 64;
	sz = plcp_rtedge_fb_segment_bytes_by_name(fbname);
	if (sz != 0)
		return (uint16_t)sz;
	return 64;
}

/*
 * examples/PLCP/structure.c Structure_CreateCatalog の TON 分岐相当:
 * メンバ名を instname.pin として命令書式で登録（親は呼び出し側で先に push 済み）。
 * オフセット順は plcp_rtedge_bridge / llil の expand_fb_instance_to_pins（EN…_IN_）と一致。
 */
static void il_rtedge_structure_create_catalog_ton(const char *instname)
{
	static const struct {
		const char *mem;
		const char *prefix;
	} rows[] = {
		{ "EN", "BOOL" },
		{ "IN", "BOOL" },
		{ "PT", "TIME" },
		{ "ET", "TIME" },
		{ "Q", "BOOL" },
		{ "_IN_", "BOOL" },
	};
	char buf[112];
	size_t i;

	if (instname == NULL)
		return;
	for (i = 0; i < sizeof(rows) / sizeof(rows[0]); i++) {
		if (snprintf(buf, sizeof buf, "%s#%s.%s", rows[i].prefix, instname, rows[i].mem) >= (int)sizeof buf)
			continue;
		(void)il_rtedge_registry_push(buf, 0);
	}
}

static void il_rtedge_structure_create_catalog_arith(const char *instname)
{
	static const struct {
		const char *mem;
		const char *prefix;
	} rows[] = {
		{ "EN", "BOOL" },
		{ "IN1", "INT" },
		{ "IN2", "INT" },
		{ "ENO", "BOOL" },
		{ "OUT", "INT" },
	};
	char buf[112];
	size_t i;

	if (instname == NULL)
		return;
	for (i = 0; i < sizeof(rows) / sizeof(rows[0]); i++) {
		if (snprintf(buf, sizeof buf, "%s#%s.%s", rows[i].prefix, instname, rows[i].mem) >= (int)sizeof buf)
			continue;
		(void)il_rtedge_registry_push(buf, 0);
	}
}

static void il_rtedge_structure_create_catalog_ctu(const char *instname)
{
	static const struct {
		const char *mem;
		const char *prefix;
	} rows[] = {
		{ "CU", "BOOL" },
		{ "RESET", "BOOL" },
		{ "PV", "INT" },
		{ "Q", "BOOL" },
		{ "CV", "INT" },
		{ "_prev_cu", "BOOL" },
	};
	char buf[112];
	size_t i;

	if (instname == NULL)
		return;
	for (i = 0; i < sizeof(rows) / sizeof(rows[0]); i++) {
		if (snprintf(buf, sizeof buf, "%s#%s.%s", rows[i].prefix, instname, rows[i].mem) >= (int)sizeof buf)
			continue;
		(void)il_rtedge_registry_push(buf, 0);
	}
}

static BOOL il_rtedge_fb_has_structure_catalog(const char *FBname)
{
	if (FBname == NULL)
		return FALSE;
	if (strncmp(FBname, "TON", 3) == 0 || strncmp(FBname, "TOF", 3) == 0 || strncmp(FBname, "TP", 2) == 0)
		return TRUE;
	if (strncmp(FBname, "CTU", 3) == 0)
		return TRUE;
	if (strncmp(FBname, "ADD", 3) == 0 || strncmp(FBname, "SUB", 3) == 0 || strncmp(FBname, "MUL", 3) == 0
	    || strncmp(FBname, "DIV", 3) == 0 || strncmp(FBname, "MOD", 3) == 0)
		return TRUE;
	return FALSE;
}

/* 親 FUNCTION#… は呼び出し側で先に push 済み。ここではピンだけ。 */
static void il_rtedge_structure_create_catalog_members(const char *FBname, const char *instname)
{
	if (FBname == NULL || instname == NULL)
		return;
	if (strncmp(FBname, "TON", 3) == 0 || strncmp(FBname, "TOF", 3) == 0 || strncmp(FBname, "TP", 2) == 0) {
		il_rtedge_structure_create_catalog_ton(instname);
		return;
	}
	if (strncmp(FBname, "CTU", 3) == 0) {
		il_rtedge_structure_create_catalog_ctu(instname);
		return;
	}
	if (strncmp(FBname, "ADD", 3) == 0 || strncmp(FBname, "SUB", 3) == 0 || strncmp(FBname, "MUL", 3) == 0
	    || strncmp(FBname, "DIV", 3) == 0 || strncmp(FBname, "MOD", 3) == 0)
		il_rtedge_structure_create_catalog_arith(instname);
}

#if defined(IL_EGAPI_STUB) && IL_EGAPI_STUB

#ifndef EDGE_SUCCESS
#define EDGE_SUCCESS 0
#endif

static int32_t EgTagCreateEx(char *name, uint16_t tag_type, char *srcaddressinfo, char *commentinfo)
{
	(void)name;
	(void)tag_type;
	(void)srcaddressinfo;
	(void)commentinfo;
	return EDGE_SUCCESS;
}

static int32_t EgTagCreateSegment(char *name, uint16_t tag_type, uint16_t bufsize,
				  char *srcaddressinfo, char *commentinfo, char *regname,
				  uint16_t regnamesize, uint16_t *islink)
{
	(void)name;
	(void)tag_type;
	(void)bufsize;
	(void)srcaddressinfo;
	(void)commentinfo;
	(void)regname;
	(void)regnamesize;
	(void)islink;
	return EDGE_SUCCESS;
}

static int32_t EgTagWriteSegment(char *name, uint32_t offset, void *buf, uint32_t size)
{
	(void)name;
	(void)offset;
	(void)buf;
	(void)size;
	return EDGE_SUCCESS;
}

#else

#if defined(__has_include) && __has_include(<egAPI.h>)
#include <egAPI.h>
#elif defined(__has_include) && __has_include(<egapi.h>)
#include <egapi.h>
#else
#include "egapi_min.h"
#endif
#ifndef EDGE_SUCCESS
#define EDGE_SUCCESS 0
#endif

#endif /* IL_EGAPI_STUB */

BOOL Rtedge_TagCreateByInstruction(char *string, BOOL hidden)
{
	BOOL result = FALSE;
	BOOL registry_done = FALSE;
	size_t keywordlength;
	size_t stringlength;
	char *source;
	char *instname;
	char *FBname;
	uint16_t iectype;
	uint16_t edge_ty;
	int32_t eg;
	char regname[256];
	uint16_t islink;
	uint16_t regnamesize;

	if (string == NULL)
		return FALSE;

	stringlength = strlen(string) + 1;

	const struct IlKeywordMatch *current = il_kw;
	while (current->keyword) {
		keywordlength = strlen(current->keyword);
		if (strncmp(string, current->keyword, keywordlength) == 0) {
			source = (char *)malloc(stringlength);
			if (source == NULL)
				return FALSE;
			memcpy(source, string, stringlength);
			iectype = current->iectype;

			/* PLCP rtedge.c D_FUNCTION 分岐と同じ: エッジ上の名前は instname のみ（例: TON_1）。 */
			if (iectype == D_FUNCTION) {
				instname = strrchr(source, '#');
				if (instname == NULL) {
					free(source);
					return FALSE;
				}
				*instname = '\0';
				instname += 1;
				FBname = source + keywordlength;
				regnamesize = (uint16_t)sizeof(regname);
				islink = 0;

				eg = EgTagCreateSegment(
					instname,
					(uint16_t)il_iec_to_edge(iectype),
					il_fb_segment_size_bytes(FBname),
					source,
					"",
					regname,
					regnamesize,
					&islink);

				if (eg == EDGE_SUCCESS) {
					uint16_t bufsize = il_fb_segment_size_bytes(FBname);
					void *z = calloc(1, bufsize);

					if (z) {
						(void)EgTagWriteSegment(instname, 0, z, (uint32_t)bufsize);
						free(z);
					}
					plcp_rtedge_after_segment(instname, FBname);
					/* PLCP: Functionblock_Register → Structure_CreateCatalog */
					if (il_rtedge_fb_has_structure_catalog(FBname)) {
						(void)il_rtedge_registry_push(string, (unsigned char)hidden);
						il_rtedge_structure_create_catalog_members(FBname, instname);
						registry_done = TRUE;
					}
					result = TRUE;
				}
			} else if (iectype == D_STRING) {
				instname = source + keywordlength;
				regnamesize = (uint16_t)sizeof(regname);
				islink = 0;
				if (!hidden) {
					eg = EgTagCreateSegment(
						instname,
						(uint16_t)il_iec_to_edge(iectype),
						83,
						"STRING#",
						"",
						regname,
						regnamesize,
						&islink);
					if (eg == EDGE_SUCCESS) {
						void *z = calloc(1, 83);

						if (z) {
							(void)EgTagWriteSegment(instname, 0, z, 83);
							free(z);
						}
						result = TRUE;
					}
				} else {
					result = TRUE;
				}
			} else {
				instname = source + keywordlength;
				edge_ty = il_iec_to_edge(iectype);
				if (!hidden) {
					/* Source: malloc 済みの命令書式（IlRtedgeTags_Init のスタック buf を渡さない） */
					eg = EgTagCreateEx(instname, edge_ty, source, "");
					result = (eg == EDGE_SUCCESS) ? TRUE : FALSE;
				} else {
					result = TRUE;
				}
			}

			free(source);
			break;
		}
		current++;
	}

	if (result && !registry_done)
		(void)il_rtedge_registry_push(string, (unsigned char)hidden);
	return result;
}

#endif /* IL_EGAPI_PLCP_RTEDGE */

/* ========== il_rtedge_slot_bind_egapi ========== */
/*
 * llil 生成 IR が参照する IlRtedge_BindTonPinSlot（FUNCTION ピン → Entry+offset）。
 */
#if IL_EGAPI_PLCP_RTEDGE

#include <egAPI.h>
#include <stddef.h>
#include <stdint.h>

#ifndef EDGE_SUCCESS
#define EDGE_SUCCESS 0
#endif

#ifndef EgVtSegment
#define EgVtSegment 13
#endif

static void *il_rtedge_dataptr_from_tagdesc(TagsDesc *td)
{
	uint16_t vt = td->var.vt;

	if (vt == EgVtSegment || td->SHM.InUse == 1)
		return (void *)(uintptr_t)td->var.pSegment;
	return (void *)&td->var.val;
}

void IlRtedge_BindTonPinSlot(void **slot_pp, const char *inst_z, int32_t byte_offset)
{
	TagsDesc *td = NULL;
	void *base;

	if (slot_pp == NULL || inst_z == NULL)
		return;
	if (EgTagGetProperty(inst_z, "Entry", &td, sizeof(td)) != EDGE_SUCCESS || td == NULL)
		return;
	base = il_rtedge_dataptr_from_tagdesc(td);
	if (base == NULL)
		return;
	*slot_pp = (unsigned char *)base + (unsigned)byte_offset;
}

#else

#include <stddef.h>
#include <stdint.h>

void IlRtedge_BindTonPinSlot(void **slot_pp, const char *inst_z, int32_t byte_offset)
{
	(void)slot_pp;
	(void)inst_z;
	(void)byte_offset;
}

#endif

/* glue 側（IlRtedgeTags_Init / IlRtedgeSlots_BindEgEntry）は別翻訳単位で提供される */
