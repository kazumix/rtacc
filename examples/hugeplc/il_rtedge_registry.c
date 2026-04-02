#include "../IL/il_rtedge_registry.h"

/*
 * hugeplc の Edge 本番実行では、命令書式レジストリの保持は必須ではないため、
 * ここでは常に成功扱いの最小実装を使う。
 */
unsigned char il_rtedge_registry_push(char *string, unsigned char hidden)
{
    (void)string;
    (void)hidden;
    return 1;
}
