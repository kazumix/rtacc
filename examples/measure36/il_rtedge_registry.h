#ifndef IL_RTEDGE_REGISTRY_H
#define IL_RTEDGE_REGISTRY_H

/*
 * rtedge_tags.c が保持する命令書式レジストリへ 1 件追加（EgApi 成否の記録用）。
 */
unsigned char il_rtedge_registry_push(char *string, unsigned char hidden);

#endif

