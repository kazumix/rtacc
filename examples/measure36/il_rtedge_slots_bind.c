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

/*
 * llil が生成する *_slots_init から呼ばれる。
 * PLCP structure.c: pVal = (BYTE *)link->pSegment + offset に相当。
 */
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

IL_SLOT_EXT(ECAT_Slave5_DI1);
IL_SLOT_EXT(ECAT_Slave5_DO1);
IL_SLOT_EXT(ECAT_Slave4_AO1);
IL_SLOT_EXT(CT_Reset);
IL_SLOT_EXT(IL_UintCounterHead);
IL_SLOT_EXT(IL_UintCounterTail);

/* TON ピン（TON_x: IN / PT / ET / Q） */
IL_SLOT_EXT(TON_1_IN);
IL_SLOT_EXT(TON_1_PT);
IL_SLOT_EXT(TON_1_ET);
IL_SLOT_EXT(TON_1_Q);
IL_SLOT_EXT(TON_2_IN);
IL_SLOT_EXT(TON_2_PT);
IL_SLOT_EXT(TON_2_ET);
IL_SLOT_EXT(TON_2_Q);
IL_SLOT_EXT(TON_3_IN);
IL_SLOT_EXT(TON_3_PT);
IL_SLOT_EXT(TON_3_ET);
IL_SLOT_EXT(TON_3_Q);
IL_SLOT_EXT(TON_4_IN);
IL_SLOT_EXT(TON_4_PT);
IL_SLOT_EXT(TON_4_ET);
IL_SLOT_EXT(TON_4_Q);
IL_SLOT_EXT(TON_5_IN);
IL_SLOT_EXT(TON_5_PT);
IL_SLOT_EXT(TON_5_ET);
IL_SLOT_EXT(TON_5_Q);
IL_SLOT_EXT(TON_6_IN);
IL_SLOT_EXT(TON_6_PT);
IL_SLOT_EXT(TON_6_ET);
IL_SLOT_EXT(TON_6_Q);
IL_SLOT_EXT(TON_7_IN);
IL_SLOT_EXT(TON_7_PT);
IL_SLOT_EXT(TON_7_ET);
IL_SLOT_EXT(TON_7_Q);

/* CTU ピン（CTU_x: CU / RESET / PV / Q / CV / _prev_cu） */
IL_SLOT_EXT(CTU_1_CU);
IL_SLOT_EXT(CTU_1_RESET);
IL_SLOT_EXT(CTU_1_PV);
IL_SLOT_EXT(CTU_1_Q);
IL_SLOT_EXT(CTU_1_CV);
IL_SLOT_EXT(CTU_1__prev_cu);
IL_SLOT_EXT(CTU_2_CU);
IL_SLOT_EXT(CTU_2_RESET);
IL_SLOT_EXT(CTU_2_PV);
IL_SLOT_EXT(CTU_2_Q);
IL_SLOT_EXT(CTU_2_CV);
IL_SLOT_EXT(CTU_2__prev_cu);
IL_SLOT_EXT(CTU_3_CU);
IL_SLOT_EXT(CTU_3_RESET);
IL_SLOT_EXT(CTU_3_PV);
IL_SLOT_EXT(CTU_3_Q);
IL_SLOT_EXT(CTU_3_CV);
IL_SLOT_EXT(CTU_3__prev_cu);
IL_SLOT_EXT(CTU_4_CU);
IL_SLOT_EXT(CTU_4_RESET);
IL_SLOT_EXT(CTU_4_PV);
IL_SLOT_EXT(CTU_4_Q);
IL_SLOT_EXT(CTU_4_CV);
IL_SLOT_EXT(CTU_4__prev_cu);
IL_SLOT_EXT(CTU_5_CU);
IL_SLOT_EXT(CTU_5_RESET);
IL_SLOT_EXT(CTU_5_PV);
IL_SLOT_EXT(CTU_5_Q);
IL_SLOT_EXT(CTU_5_CV);
IL_SLOT_EXT(CTU_5__prev_cu);
IL_SLOT_EXT(CTU_6_CU);
IL_SLOT_EXT(CTU_6_RESET);
IL_SLOT_EXT(CTU_6_PV);
IL_SLOT_EXT(CTU_6_Q);
IL_SLOT_EXT(CTU_6_CV);
IL_SLOT_EXT(CTU_6__prev_cu);
IL_SLOT_EXT(CTU_7_CU);
IL_SLOT_EXT(CTU_7_RESET);
IL_SLOT_EXT(CTU_7_PV);
IL_SLOT_EXT(CTU_7_Q);
IL_SLOT_EXT(CTU_7_CV);
IL_SLOT_EXT(CTU_7__prev_cu);

/* R_TRIG / F_TRIG ピン（CLK / Q / _prev） */
IL_SLOT_EXT(R_TRIG_1_CLK);
IL_SLOT_EXT(R_TRIG_1_Q);
IL_SLOT_EXT(R_TRIG_1__prev_clk);
IL_SLOT_EXT(F_TRIG_1_CLK);
IL_SLOT_EXT(F_TRIG_1_Q);
IL_SLOT_EXT(F_TRIG_1__prev_clk);

static const struct {
	const char *tag;
	void **pstore;
} il_slot_binds[] = {
	IL_BIND(ECAT_Slave5_DI1),
	IL_BIND(ECAT_Slave5_DO1),
	IL_BIND(ECAT_Slave4_AO1),
	IL_BIND(CT_Reset),
	IL_BIND(IL_UintCounterHead),
	IL_BIND(IL_UintCounterTail),

	IL_BIND(TON_1_IN),
	IL_BIND(TON_1_PT),
	IL_BIND(TON_1_ET),
	IL_BIND(TON_1_Q),
	IL_BIND(TON_2_IN),
	IL_BIND(TON_2_PT),
	IL_BIND(TON_2_ET),
	IL_BIND(TON_2_Q),
	IL_BIND(TON_3_IN),
	IL_BIND(TON_3_PT),
	IL_BIND(TON_3_ET),
	IL_BIND(TON_3_Q),
	IL_BIND(TON_4_IN),
	IL_BIND(TON_4_PT),
	IL_BIND(TON_4_ET),
	IL_BIND(TON_4_Q),
	IL_BIND(TON_5_IN),
	IL_BIND(TON_5_PT),
	IL_BIND(TON_5_ET),
	IL_BIND(TON_5_Q),
	IL_BIND(TON_6_IN),
	IL_BIND(TON_6_PT),
	IL_BIND(TON_6_ET),
	IL_BIND(TON_6_Q),
	IL_BIND(TON_7_IN),
	IL_BIND(TON_7_PT),
	IL_BIND(TON_7_ET),
	IL_BIND(TON_7_Q),

	IL_BIND(CTU_1_CU),
	IL_BIND(CTU_1_RESET),
	IL_BIND(CTU_1_PV),
	IL_BIND(CTU_1_Q),
	IL_BIND(CTU_1_CV),
	IL_BIND(CTU_1__prev_cu),
	IL_BIND(CTU_2_CU),
	IL_BIND(CTU_2_RESET),
	IL_BIND(CTU_2_PV),
	IL_BIND(CTU_2_Q),
	IL_BIND(CTU_2_CV),
	IL_BIND(CTU_2__prev_cu),
	IL_BIND(CTU_3_CU),
	IL_BIND(CTU_3_RESET),
	IL_BIND(CTU_3_PV),
	IL_BIND(CTU_3_Q),
	IL_BIND(CTU_3_CV),
	IL_BIND(CTU_3__prev_cu),
	IL_BIND(CTU_4_CU),
	IL_BIND(CTU_4_RESET),
	IL_BIND(CTU_4_PV),
	IL_BIND(CTU_4_Q),
	IL_BIND(CTU_4_CV),
	IL_BIND(CTU_4__prev_cu),
	IL_BIND(CTU_5_CU),
	IL_BIND(CTU_5_RESET),
	IL_BIND(CTU_5_PV),
	IL_BIND(CTU_5_Q),
	IL_BIND(CTU_5_CV),
	IL_BIND(CTU_5__prev_cu),
	IL_BIND(CTU_6_CU),
	IL_BIND(CTU_6_RESET),
	IL_BIND(CTU_6_PV),
	IL_BIND(CTU_6_Q),
	IL_BIND(CTU_6_CV),
	IL_BIND(CTU_6__prev_cu),
	IL_BIND(CTU_7_CU),
	IL_BIND(CTU_7_RESET),
	IL_BIND(CTU_7_PV),
	IL_BIND(CTU_7_Q),
	IL_BIND(CTU_7_CV),
	IL_BIND(CTU_7__prev_cu),

	IL_BIND(R_TRIG_1_CLK),
	IL_BIND(R_TRIG_1_Q),
	IL_BIND(R_TRIG_1__prev_clk),
	IL_BIND(F_TRIG_1_CLK),
	IL_BIND(F_TRIG_1_Q),
	IL_BIND(F_TRIG_1__prev_clk),
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

