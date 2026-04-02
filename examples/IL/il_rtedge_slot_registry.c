/*
 * RTedge: 命令書式 spec と @il_slot_* を対応づけ、EgApi Entry から実ポインタをバインドする。
 * IL_USE_PLCP_RTEDGE && IL_USE_EGAPI かつ IL_EGAPI_STUB でないときのみ EgApi を使用。
 */
#include "il_rtedge_registry.h"

#include <stdlib.h>
#include <string.h>

typedef struct {
	const char *spec;
	void **slot_pp;
} IlRtedgeSlotRec;

static IlRtedgeSlotRec *g_rec = NULL;
static size_t g_n = 0;
static size_t g_cap = 0;

void il_rtedge_registry_clear(void)
{
	g_n = 0;
}

void il_rtedge_registry_record_binding(const char *spec, void **slot_pp)
{
	if (spec == NULL || slot_pp == NULL)
		return;
	if (g_n >= g_cap) {
		size_t ncap = g_cap ? g_cap * 2 : 512u;
		IlRtedgeSlotRec *p =
		    (IlRtedgeSlotRec *)realloc(g_rec, ncap * sizeof(IlRtedgeSlotRec));
		if (p == NULL)
			return;
		g_rec = p;
		g_cap = ncap;
	}
	g_rec[g_n].spec = spec;
	g_rec[g_n].slot_pp = slot_pp;
	g_n++;
}

#if defined(IL_USE_PLCP_RTEDGE) && defined(IL_USE_EGAPI) && !(defined(IL_EGAPI_STUB) && IL_EGAPI_STUB)

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

/* "BOOL#A.B" → タグ名 "A.B"（先頭の keyword# を除去） */
static void tag_name_from_spec(const char *spec, char *out, size_t cap)
{
	const char *p = strchr(spec, '#');

	if (p == NULL || p[1] == '\0') {
		if (cap > 0)
			out[0] = '\0';
		return;
	}
	strncpy(out, p + 1, cap - 1);
	out[cap - 1] = '\0';
}

void IlRtedgeRegistry_BindAllSlots(void)
{
	size_t i;
	char name[512];

	for (i = 0; i < g_n; i++) {
		TagsDesc *td = NULL;

		tag_name_from_spec(g_rec[i].spec, name, sizeof(name));
		if (name[0] == '\0')
			continue;
		if (EgTagGetProperty(name, "Entry", &td, sizeof(td)) != EDGE_SUCCESS
		    || td == NULL)
			continue;
		*g_rec[i].slot_pp = il_rtedge_dataptr_from_tagdesc(td);
	}
}

#else

void IlRtedgeRegistry_BindAllSlots(void) {}

#endif
