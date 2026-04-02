#include "rtedge_tags.h"
#include "il_rtedge_registry.h"

#include <stddef.h>
#include <stdint.h>
#include <string.h>

#define IL_RTEDGE_TAG_MAX 128
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

#if !defined(IL_USE_PLCP_RTEDGE)

typedef unsigned char rt_bool;
#define RT_FALSE ((rt_bool)0)
#define RT_TRUE ((rt_bool)1)

__attribute__((noinline)) static rt_bool Rtedge_TagCreateByInstruction(char *string, rt_bool hidden)
{
	return (rt_bool)il_rtedge_registry_push(string, (unsigned char)hidden);
}

#elif !defined(IL_USE_EGAPI)

typedef unsigned char BOOL;
#define FALSE 0
#define TRUE 1

BOOL Rtedge_TagCreateByInstruction(char *string, BOOL hidden)
{
	return il_rtedge_registry_push(string, (unsigned char)hidden) ? TRUE : FALSE;
}

#else
#endif

#if defined(IL_USE_PLCP_RTEDGE) && defined(IL_USE_EGAPI)
typedef unsigned char BOOL;
BOOL Rtedge_TagCreateByInstruction(char *string, BOOL hidden);
#endif

unsigned IlRtedgeTags_GetRegisteredCount(void)
{
	return il_rtedge_tag_count;
}

int IlRtedgeTags_GetRegisteredSpec(unsigned index, char *out, size_t outsz)
{
	size_t len;

	if (out == NULL || outsz == 0)
		return -1;
	if (index >= il_rtedge_tag_count)
		return -1;
	len = il_rtedge_str_len_bounded(il_rtedge_tag_storage[index], IL_RTEDGE_TAG_MAX_LEN - 1);
	if (len + 1 > outsz)
		return -1;
	memcpy(out, il_rtedge_tag_storage[index], len);
	out[len] = '\0';
	return 0;
}

extern void LED2Check_slots_init(void);

static const char *const k_st2_rtedge_scalar_specs[] = {
	"BOOL#SW1",
	"BOOL#SW2",
	"BOOL#SW3",
	"INT#MsTick",
	"BOOL#LED1",
	"BOOL#LED2",
};

__attribute__((noinline)) static void il_rtedge_apply_instruction_spec(const char *src)
{
	char buf[112];
	size_t j = 0;
	while (src[j] != '\0' && j + 1 < sizeof(buf)) {
		buf[j] = src[j];
		j++;
	}
	buf[j] = '\0';
	(void)Rtedge_TagCreateByInstruction(buf, 0);
}

__attribute__((noinline)) static void st2_rtedge_invoke_slots_init(void)
{
	LED2Check_slots_init();
}

#if defined(__clang__)
#pragma clang optimize off
#endif
void IlRtedgeTags_Init(void)
{
	size_t i;

	for (i = 0; i < sizeof(k_st2_rtedge_scalar_specs) / sizeof(k_st2_rtedge_scalar_specs[0]); i++)
		il_rtedge_apply_instruction_spec(k_st2_rtedge_scalar_specs[i]);

	st2_rtedge_invoke_slots_init();

#if defined(IL_USE_PLCP_RTEDGE) && defined(IL_USE_EGAPI) && !(defined(IL_EGAPI_STUB) && IL_EGAPI_STUB)
	IlRtedgeSlots_BindEgEntry();
#endif
}

void il_rtedge_registry_clear(void) {}
void il_rtedge_registry_record_binding(const char *spec, void **slot_pp)
{
	(void)spec;
	(void)slot_pp;
}
void IlRtedgeRegistry_BindAllSlots(void) {}

#if defined(__clang__)
#pragma clang optimize on
#endif
