#ifndef IL_RTEDGE_REGISTRY_H
#define IL_RTEDGE_REGISTRY_H

/*
 * rtedge_tags.c が保持する命令書式レジストリへ 1 件追加（EgApi 成否の記録用）。
 */
unsigned char il_rtedge_registry_push(char *string, unsigned char hidden);

/* llil slots_init 用（本サンプルは静的 bind のみ。実装は rtedge_tags.c 末尾の no-op） */
void il_rtedge_registry_clear(void);
void il_rtedge_registry_record_binding(const char *spec, void **slot_pp);
void IlRtedgeRegistry_BindAllSlots(void);

#endif

