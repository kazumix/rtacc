/*
 * examples/PLCP/rtedge.c の Rtedge_TagCreateByInstruction と同じ流れで EgApi を呼ぶ。
 * Variable_* / Heap_* / Functionblock_Register は省略。FUNCTION はセグメントサイズを簡易推定。
 *
 * IL_USE_EGAPI && IL_USE_PLCP_RTEDGE のときのみ Rtedge_TagCreateByInstruction を定義。
 * IL_EGAPI_STUB=1: EgTag* は本ファイル内スタブ（単体ビルド用。本番では defines に含めない）。
 */
#if defined(IL_USE_EGAPI) && defined(IL_USE_PLCP_RTEDGE)

#include "il_rtedge_registry.h"

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
	if (fbname == NULL)
		return 64;
	if (strncmp(fbname, "CTU", 3) == 0)
		return 32;
	if (strncmp(fbname, "TP", 2) == 0)
		return 40;
	return 64;
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

	if (result)
		(void)il_rtedge_registry_push(string, (unsigned char)hidden);
	return result;
}

#endif /* IL_USE_EGAPI && IL_USE_PLCP_RTEDGE */
