#ifndef IL_RTEDGE_REGISTRY_H
#define IL_RTEDGE_REGISTRY_H

unsigned char il_rtedge_registry_push(char *string, unsigned char hidden);

void il_rtedge_registry_clear(void);
void il_rtedge_registry_record_binding(const char *spec, void **slot_pp);
void IlRtedgeRegistry_BindAllSlots(void);

#endif
