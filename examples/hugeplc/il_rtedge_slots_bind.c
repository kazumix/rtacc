/*
 * llil が hugeplc_ascii2_slots_init から呼ぶ IlRtedge_BindTonPinSlot。
 * iltimer/il_rtedge_slots_bind.c から ILT 専用の IlRtedgeSlots_BindEgEntry 表を除いたもの。
 */
#include "../iltimer/rtedge_tags.h"
#include <egAPI.h>
#include <stddef.h>
#include <stdint.h>

#ifndef EDGE_SUCCESS
#define EDGE_SUCCESS 0
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

void IlRtedgeSlots_BindEgEntry(void) {}
