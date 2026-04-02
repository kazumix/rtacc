#ifndef IL_RTEDGE_REGISTRY_H
#define IL_RTEDGE_REGISTRY_H

/*
 * rtedge_tags.c 等が保持する命令書式レジストリへ 1 件追加（EgApi 成否の記録用）。
 */
unsigned char il_rtedge_registry_push(char *string, unsigned char hidden);

/*
 * llil / llst が --memory=rtedge の slots_init で登録する
 * 「命令書式文字列 → il_slot グローバル」対応表。
 * IlRtedgeRegistry_BindAllSlots で EgTagGetProperty(Entry) により実データポインタへ置換する。
 */
void il_rtedge_registry_clear(void);
void il_rtedge_registry_record_binding(const char *spec, void **slot_pp);
void IlRtedgeRegistry_BindAllSlots(void);

#endif
