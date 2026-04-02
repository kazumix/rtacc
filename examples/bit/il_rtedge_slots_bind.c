#if defined(IL_USE_PLCP_RTEDGE) && defined(IL_USE_EGAPI) && !(defined(IL_EGAPI_STUB) && IL_EGAPI_STUB)

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

#define IL_SLOT_EXT(name) extern void *il_slot_##name
#define IL_BIND(name) { #name, (void **)&il_slot_##name }

IL_SLOT_EXT(dw1);
IL_SLOT_EXT(dw2);
IL_SLOT_EXT(dw3);

static const struct {
	const char *tag;
	void **pstore;
} il_slot_binds[] = {
	IL_BIND(dw1),
	IL_BIND(dw2),
	IL_BIND(dw3),
};

void IlRtedgeSlots_BindEgEntry(void)
{
	size_t i;

	for (i = 0; i < sizeof(il_slot_binds) / sizeof(il_slot_binds[0]); i++) {
		TagsDesc *td = NULL;
		const char *tag = il_slot_binds[i].tag;

		if (EgTagGetProperty(tag, "Entry", &td, sizeof(td)) != EDGE_SUCCESS || td == NULL)
			continue;
		*il_slot_binds[i].pstore = il_rtedge_dataptr_from_tagdesc(td);
	}
}

#else

void IlRtedge_BindTonPinSlot(void **slot_pp, const char *inst_z, int32_t byte_offset)
{
	(void)slot_pp;
	(void)inst_z;
	(void)byte_offset;
}

void IlRtedgeSlots_BindEgEntry(void) {}

#endif
