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
#if defined(IL_USE_EGAPI) && defined(IL_USE_PLCP_RTEDGE)

#include "il_rtedge_registry.h"
#include "plcp_rtedge_bridge.h"

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
	{"DWORD#", D_DWORD, 4, 4},
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

#endif /* IL_USE_EGAPI && IL_USE_PLCP_RTEDGE */
