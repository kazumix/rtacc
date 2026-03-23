#include "rtedge_tags.h"
#include "il_rtedge_registry.h"

#include <stddef.h>
#include <stdint.h>
#include <string.h>

/*
 * 本番のタグ生成: examples/PLCP/rtedge.c の Rtedge_TagCreateByInstruction（L116 付近）。
 *
 * - IL_USE_PLCP_RTEDGE 未定義: static な内部実装（rt_bool）でレジストリに登録。
 * - IL_USE_PLCP_RTEDGE 定義: PLCP と同じ BOOL シグネチャのグローバル
 *   Rtedge_TagCreateByInstruction を本ファイルで定義し、同じレジストリへ登録。
 *   後から PLCP の rtedge.obj だけ差し替える場合は、この .c をリンク対象から外すか
 *   重複シンボルに注意。
 */

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

/* 共通: 1 件登録。成功 1 / 失敗 0（il_rtedge_egapi.c からも呼ぶ） */
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
/* IL_USE_PLCP_RTEDGE && IL_USE_EGAPI: 実装は il_rtedge_egapi.c */
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

/*
 * llil が test.il から生成する POU 名 test に対応するスロット初期化。
 * --memory=rtedge 時のみリンクされる（@test_slots_init）。
 */
extern void test_slots_init(void);

/* test.IL のスカラー VAR（FUNCTION 行を除く） */
static const char *const k_il_rtedge_scalar_specs[] = {
	"BOOL#StartSW",
	"BOOL#EndSW",
	"UINT#AI_1",
	"BOOL#Active",
	"BOOL#LimitOver",
	"INT#LimitOverCount",
	"BOOL#Err",
	"BOOL#TP1_Q",
	"BOOL#TP2_Q",
	"BOOL#TP3_Q",
	"BOOL#TP4_Q",
	"BOOL#LED1",
	"BOOL#LED2",
};

/*
 * FB ピンは llil の @il_mem_* 名（ドットは _）に合わせたタグ名。
 * PLCP の Functionblock_Register で展開されるメンバに相当。
 */
static const char *const k_il_rtedge_ctu1_pin_tags[] = {
	"BOOL#CTU_1_CU",
	"BOOL#CTU_1_RESET",
	"INT#CTU_1_PV",
	"BOOL#CTU_1_Q",
	"INT#CTU_1_CV",
	"BOOL#CTU_1__prev_cu",
};

static const char *const k_il_rtedge_tp1_pin_tags[] = {
	"BOOL#TP_1_IN",
	"INT#TP_1_PT",
	"INT#TP_1__elapsed",
	"BOOL#TP_1__running",
	"BOOL#TP_1_Q",
};

static const char *const k_il_rtedge_tp2_pin_tags[] = {
	"BOOL#TP_2_IN",
	"INT#TP_2_PT",
	"INT#TP_2__elapsed",
	"BOOL#TP_2__running",
	"BOOL#TP_2_Q",
};

static const char *const k_il_rtedge_tp3_pin_tags[] = {
	"BOOL#TP_3_IN",
	"INT#TP_3_PT",
	"INT#TP_3__elapsed",
	"BOOL#TP_3__running",
	"BOOL#TP_3_Q",
};

static const char *const k_il_rtedge_tp4_pin_tags[] = {
	"BOOL#TP_4_IN",
	"INT#TP_4_PT",
	"INT#TP_4__elapsed",
	"BOOL#TP_4__running",
	"BOOL#TP_4_Q",
};

struct il_fb_instance_desc {
	const char *instance_spec;
	const char *const *pin_tags;
	size_t pin_count;
};

static const struct il_fb_instance_desc k_il_fb_instances[] = {
	{ "FUNCTION#CTU#CTU_1", k_il_rtedge_ctu1_pin_tags,
	  sizeof(k_il_rtedge_ctu1_pin_tags) / sizeof(k_il_rtedge_ctu1_pin_tags[0]) },
	{ "FUNCTION#TP#TP_1", k_il_rtedge_tp1_pin_tags,
	  sizeof(k_il_rtedge_tp1_pin_tags) / sizeof(k_il_rtedge_tp1_pin_tags[0]) },
	{ "FUNCTION#TP#TP_2", k_il_rtedge_tp2_pin_tags,
	  sizeof(k_il_rtedge_tp2_pin_tags) / sizeof(k_il_rtedge_tp2_pin_tags[0]) },
	{ "FUNCTION#TP#TP_3", k_il_rtedge_tp3_pin_tags,
	  sizeof(k_il_rtedge_tp3_pin_tags) / sizeof(k_il_rtedge_tp3_pin_tags[0]) },
	{ "FUNCTION#TP#TP_4", k_il_rtedge_tp4_pin_tags,
	  sizeof(k_il_rtedge_tp4_pin_tags) / sizeof(k_il_rtedge_tp4_pin_tags[0]) },
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

/*
 * -O2 で extern の test_slots_init が消えないよう、別 TU と同様の呼び出しを
 * noinline ラッパに閉じる（IPA で空とみなされにくくする）。
 */
__attribute__((noinline)) static void il_rtedge_invoke_slots_init(void)
{
	test_slots_init();
}

#if defined(__clang__)
#pragma clang optimize off
#endif
void IlRtedgeTags_Init(void)
{
	size_t i;

	/* 1) スカラー・配列相当: RTedge タグ（命令書式） */
	for (i = 0; i < sizeof(k_il_rtedge_scalar_specs) / sizeof(k_il_rtedge_scalar_specs[0]); i++)
		il_rtedge_apply_instruction_spec(k_il_rtedge_scalar_specs[i]);

	/* 2) FUNCTION インスタンス: 親タグ + ピン（メンバ）タグ */
	for (i = 0; i < sizeof(k_il_fb_instances) / sizeof(k_il_fb_instances[0]); i++) {
		const struct il_fb_instance_desc *fb = &k_il_fb_instances[i];
		size_t p;

		il_rtedge_apply_instruction_spec(fb->instance_spec);
		for (p = 0; p < fb->pin_count; p++)
			il_rtedge_apply_instruction_spec(fb->pin_tags[p]);
	}

	/*
	 * 3) グローバルスロット割り当て: llil --memory=rtedge の @il_slot_* ← @il_mem_*
	 *    実 RTedge ではタグ解決したアドレスを store する想定。現状 llil は il_mem を指す。
	 */
	il_rtedge_invoke_slots_init();

#if defined(IL_USE_PLCP_RTEDGE) && defined(IL_USE_EGAPI) && !(defined(IL_EGAPI_STUB) && IL_EGAPI_STUB)
	/*
	 * 4) EgApi で作成したタグの Entry から実データアドレスを取得し、@il_slot_* を上書き。
	 *    上書きしないと il_slot は il_mem のみを指し、RTedge 上のタグ値と乖離する。
	 */
	IlRtedgeSlots_BindEgEntry();
#endif
}
#if defined(__clang__)
#pragma clang optimize on
#endif
