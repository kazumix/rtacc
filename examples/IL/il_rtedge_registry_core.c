/*
 * EgApi 経路の il_rtedge_registry_push（命令書式レジストリ）。
 * llil が VAR / FUNCTION から生成する *_slots_init が参照する
 * il_rtedge_registry_clear / record_binding は本サンプルでは未使用のため no-op。
 */
#include "il_rtedge_registry.h"

#include <stddef.h>
#include <string.h>

#define IL_RTEDGE_TAG_MAX 4096
#define IL_RTEDGE_TAG_MAX_LEN 112

static char il_rtedge_tag_storage[IL_RTEDGE_TAG_MAX][IL_RTEDGE_TAG_MAX_LEN];
static unsigned char il_rtedge_tag_hidden[IL_RTEDGE_TAG_MAX];
static unsigned il_rtedge_tag_count;

static size_t il_rtedge_str_len_bounded(const char *s, size_t max)
{
	size_t n = 0;

	while (n < max && s[n])
		n++;
	return n;
}

unsigned char il_rtedge_registry_push(char *string, unsigned char hidden)
{
	size_t len;

	if (string == NULL)
		return 0;
	if (il_rtedge_tag_count >= IL_RTEDGE_TAG_MAX)
		return 0;
	len = il_rtedge_str_len_bounded(string, IL_RTEDGE_TAG_MAX_LEN - 1);
	memcpy(il_rtedge_tag_storage[il_rtedge_tag_count], string, len);
	il_rtedge_tag_storage[il_rtedge_tag_count][len] = '\0';
	il_rtedge_tag_hidden[il_rtedge_tag_count] = hidden ? 1 : 0;
	il_rtedge_tag_count++;
	return 1;
}

void il_rtedge_registry_clear(void)
{
	il_rtedge_tag_count = 0;
}

void il_rtedge_registry_record_binding(const char *spec, void **slot_pp)
{
	(void)spec;
	(void)slot_pp;
}

void IlRtedgeRegistry_BindAllSlots(void) {}
