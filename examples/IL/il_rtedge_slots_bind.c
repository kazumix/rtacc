/*
 * llil の @il_slot_* は既定で @il_mem_* を指す。本番 EgApi では RTedge タグの実体は
 * TagsDesc（Entry）側にあるため、PLCP rtedge.c の Rtedge_TagGetPointer と同様に
 * EgTagGetProperty(name, "Entry", ...) で得たディスクリプタからデータポインタを求め、
 * il_slot_* を上書きする。
 */
#if defined(IL_USE_PLCP_RTEDGE) && defined(IL_USE_EGAPI) && !(defined(IL_EGAPI_STUB) && IL_EGAPI_STUB)

#include <egAPI.h>
#include <stdint.h>
#include <stddef.h>

#ifndef EDGE_SUCCESS
#define EDGE_SUCCESS 0
#endif

/* TagsDesc は egAPI.h の tTagsDesc（typedef TagsDesc） */

static void *il_rtedge_dataptr_from_tagdesc(TagsDesc *td)
{
	uint16_t vt = td->var.vt;

	/* PLCP Rtedge_GetPointer / Rtedge_IsDirectMemory に準拠 */
	if (vt == EgVtSegment || td->SHM.InUse == 1)
		return (void *)(uintptr_t)td->var.pSegment;
	return (void *)&td->var.val;
}

#define IL_SLOT_EXT(name) extern void *il_slot_##name
#define IL_BIND(name) { #name, (void **)&il_slot_##name }

IL_SLOT_EXT(StartSW);
IL_SLOT_EXT(EndSW);
IL_SLOT_EXT(AI_1);
IL_SLOT_EXT(Active);
IL_SLOT_EXT(LimitOver);
IL_SLOT_EXT(LimitOverCount);
IL_SLOT_EXT(Err);
IL_SLOT_EXT(TP1_Q);
IL_SLOT_EXT(TP2_Q);
IL_SLOT_EXT(TP3_Q);
IL_SLOT_EXT(TP4_Q);
IL_SLOT_EXT(LED1);
IL_SLOT_EXT(LED2);
IL_SLOT_EXT(CTU_1_CU);
IL_SLOT_EXT(CTU_1_RESET);
IL_SLOT_EXT(CTU_1_PV);
IL_SLOT_EXT(CTU_1__prev_cu);
IL_SLOT_EXT(CTU_1_Q);
IL_SLOT_EXT(CTU_1_CV);
IL_SLOT_EXT(TP_1_IN);
IL_SLOT_EXT(TP_1_PT);
IL_SLOT_EXT(TP_1__elapsed);
IL_SLOT_EXT(TP_1__running);
IL_SLOT_EXT(TP_1_Q);
IL_SLOT_EXT(TP_2_IN);
IL_SLOT_EXT(TP_2_PT);
IL_SLOT_EXT(TP_2__elapsed);
IL_SLOT_EXT(TP_2__running);
IL_SLOT_EXT(TP_2_Q);
IL_SLOT_EXT(TP_3_IN);
IL_SLOT_EXT(TP_3_PT);
IL_SLOT_EXT(TP_3__elapsed);
IL_SLOT_EXT(TP_3__running);
IL_SLOT_EXT(TP_3_Q);
IL_SLOT_EXT(TP_4_IN);
IL_SLOT_EXT(TP_4_PT);
IL_SLOT_EXT(TP_4__elapsed);
IL_SLOT_EXT(TP_4__running);
IL_SLOT_EXT(TP_4_Q);

static const struct {
	const char *tag;
	void **pstore;
} il_slot_binds[] = {
	IL_BIND(StartSW),
	IL_BIND(EndSW),
	IL_BIND(AI_1),
	IL_BIND(Active),
	IL_BIND(LimitOver),
	IL_BIND(LimitOverCount),
	IL_BIND(Err),
	IL_BIND(TP1_Q),
	IL_BIND(TP2_Q),
	IL_BIND(TP3_Q),
	IL_BIND(TP4_Q),
	IL_BIND(LED1),
	IL_BIND(LED2),
	IL_BIND(CTU_1_CU),
	IL_BIND(CTU_1_RESET),
	IL_BIND(CTU_1_PV),
	IL_BIND(CTU_1__prev_cu),
	IL_BIND(CTU_1_Q),
	IL_BIND(CTU_1_CV),
	IL_BIND(TP_1_IN),
	IL_BIND(TP_1_PT),
	IL_BIND(TP_1__elapsed),
	IL_BIND(TP_1__running),
	IL_BIND(TP_1_Q),
	IL_BIND(TP_2_IN),
	IL_BIND(TP_2_PT),
	IL_BIND(TP_2__elapsed),
	IL_BIND(TP_2__running),
	IL_BIND(TP_2_Q),
	IL_BIND(TP_3_IN),
	IL_BIND(TP_3_PT),
	IL_BIND(TP_3__elapsed),
	IL_BIND(TP_3__running),
	IL_BIND(TP_3_Q),
	IL_BIND(TP_4_IN),
	IL_BIND(TP_4_PT),
	IL_BIND(TP_4__elapsed),
	IL_BIND(TP_4__running),
	IL_BIND(TP_4_Q),
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
