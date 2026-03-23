#pragma once

#include <stddef.h>

/**
 * LED2Check.st（--memory=rtedge）のタグ登録と llst のグローバルスロット初期化。
 * 処理順は examples/IL/rtedge_tags.h と同様。
 */
void IlRtedgeTags_Init(void);

void IlRtedgeSlots_BindEgEntry(void);

unsigned IlRtedgeTags_GetRegisteredCount(void);

int IlRtedgeTags_GetRegisteredSpec(unsigned index, char *out, size_t outsz);
