#pragma once

#include <stddef.h>

void IlRtedgeTags_Init(void);
void IlRtedgeSlots_BindEgEntry(void);
void scan_slots_init(void);

extern void *il_slot_SW1;
extern void *il_slot_SW2;
extern void *il_slot_ANS;
