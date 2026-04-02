#pragma once

#include <stddef.h>
#include <stdint.h>

/* llil が scan_slots_init から呼ぶ: EgTagGetProperty(inst,\"Entry\") の pSegment + byte_offset → *slot_pp */
void IlRtedge_BindTonPinSlot(void **slot_pp, const char *inst_z, int32_t byte_offset);

void IlRtedgeTags_Init(void);
void IlRtedgeSlots_BindEgEntry(void);
void scan_slots_init(void);

extern void *il_slot_ILT_Enable;
extern void *il_slot_ILT_LampOut;
extern void *il_slot_ILT_EtMon1;
extern void *il_slot_ILT_EtMon2;
extern void *il_slot_TON_1_EN;
extern void *il_slot_TON_1_IN;
extern void *il_slot_TON_1_PT;
extern void *il_slot_TON_1_ET;
extern void *il_slot_TON_1_Q;
extern void *il_slot_TON_2_EN;
extern void *il_slot_TON_2_IN;
extern void *il_slot_TON_2_PT;
extern void *il_slot_TON_2_ET;
extern void *il_slot_TON_2_Q;
