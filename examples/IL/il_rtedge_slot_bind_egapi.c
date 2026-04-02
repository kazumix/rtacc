/*
 * llil 生成 IR が参照する IlRtedge_BindTonPinSlot（FUNCTION ピン → Entry+offset）。
 */
#if defined(IL_USE_PLCP_RTEDGE) && defined(IL_USE_EGAPI) && !(defined(IL_EGAPI_STUB) && IL_EGAPI_STUB)

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
