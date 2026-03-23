#if defined(IL_USE_PLCP_RTEDGE) && defined(IL_USE_EGAPI) && !(defined(IL_EGAPI_STUB) && IL_EGAPI_STUB)

#include <egAPI.h>
#include <stdint.h>
#include <stddef.h>

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

#define IL_SLOT_EXT(name) extern void *il_slot_##name
#define IL_BIND(name) { #name, (void **)&il_slot_##name }

IL_SLOT_EXT(SW1);
IL_SLOT_EXT(SW2);
IL_SLOT_EXT(SW3);
IL_SLOT_EXT(MsTick);
IL_SLOT_EXT(LED1);
IL_SLOT_EXT(LED2);

static const struct {
	const char *tag;
	void **pstore;
} il_slot_binds[] = {
	IL_BIND(SW1),
	IL_BIND(SW2),
	IL_BIND(SW3),
	IL_BIND(MsTick),
	IL_BIND(LED1),
	IL_BIND(LED2),
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

void IlRtedgeSlots_BindEgEntry(void) {}

#endif
