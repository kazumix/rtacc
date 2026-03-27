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
 * --memory=rtedge 時のみリンクされる（@measure36_slots_init）。
 */
extern void measure36_slots_init(void);

/*
 * measure36.IL の VAR（宣言されるスカラー等）:
 * - ECAT / CT_Reset はスカラータグとして登録
 * - TON / CTU / (R_TRIG, F_TRIG) は FUNCTION インスタンスとして登録（ピンは命令書式）
 */
static const char *const k_il_rtedge_scalar_specs[] = {
	"BOOL#ECAT_Slave5_DI1",
	"BOOL#ECAT_Slave5_DO1",
	"INT#ECAT_Slave4_AO1",
	"BOOL#CT_Reset",
	"UINT#IL_UintCounterHead",
	"UINT#IL_UintCounterTail",
};

static const char *const k_il_rtedge_ton1_pin_tags[] = {
	"BOOL#TON_1_IN",
	"INT#TON_1_PT",
	"INT#TON_1_ET",
	"BOOL#TON_1_Q",
};
static const char *const k_il_rtedge_ton2_pin_tags[] = {
	"BOOL#TON_2_IN",
	"INT#TON_2_PT",
	"INT#TON_2_ET",
	"BOOL#TON_2_Q",
};
static const char *const k_il_rtedge_ton3_pin_tags[] = {
	"BOOL#TON_3_IN",
	"INT#TON_3_PT",
	"INT#TON_3_ET",
	"BOOL#TON_3_Q",
};
static const char *const k_il_rtedge_ton4_pin_tags[] = {
	"BOOL#TON_4_IN",
	"INT#TON_4_PT",
	"INT#TON_4_ET",
	"BOOL#TON_4_Q",
};
static const char *const k_il_rtedge_ton5_pin_tags[] = {
	"BOOL#TON_5_IN",
	"INT#TON_5_PT",
	"INT#TON_5_ET",
	"BOOL#TON_5_Q",
};
static const char *const k_il_rtedge_ton6_pin_tags[] = {
	"BOOL#TON_6_IN",
	"INT#TON_6_PT",
	"INT#TON_6_ET",
	"BOOL#TON_6_Q",
};
static const char *const k_il_rtedge_ton7_pin_tags[] = {
	"BOOL#TON_7_IN",
	"INT#TON_7_PT",
	"INT#TON_7_ET",
	"BOOL#TON_7_Q",
};

static const char *const k_il_rtedge_ctu1_pin_tags[] = {
	"BOOL#CTU_1_CU",
	"BOOL#CTU_1_RESET",
	"INT#CTU_1_PV",
	"BOOL#CTU_1_Q",
	"INT#CTU_1_CV",
	"BOOL#CTU_1__prev_cu",
};
static const char *const k_il_rtedge_ctu2_pin_tags[] = {
	"BOOL#CTU_2_CU",
	"BOOL#CTU_2_RESET",
	"INT#CTU_2_PV",
	"BOOL#CTU_2_Q",
	"INT#CTU_2_CV",
	"BOOL#CTU_2__prev_cu",
};
static const char *const k_il_rtedge_ctu3_pin_tags[] = {
	"BOOL#CTU_3_CU",
	"BOOL#CTU_3_RESET",
	"INT#CTU_3_PV",
	"BOOL#CTU_3_Q",
	"INT#CTU_3_CV",
	"BOOL#CTU_3__prev_cu",
};
static const char *const k_il_rtedge_ctu4_pin_tags[] = {
	"BOOL#CTU_4_CU",
	"BOOL#CTU_4_RESET",
	"INT#CTU_4_PV",
	"BOOL#CTU_4_Q",
	"INT#CTU_4_CV",
	"BOOL#CTU_4__prev_cu",
};
static const char *const k_il_rtedge_ctu5_pin_tags[] = {
	"BOOL#CTU_5_CU",
	"BOOL#CTU_5_RESET",
	"INT#CTU_5_PV",
	"BOOL#CTU_5_Q",
	"INT#CTU_5_CV",
	"BOOL#CTU_5__prev_cu",
};
static const char *const k_il_rtedge_ctu6_pin_tags[] = {
	"BOOL#CTU_6_CU",
	"BOOL#CTU_6_RESET",
	"INT#CTU_6_PV",
	"BOOL#CTU_6_Q",
	"INT#CTU_6_CV",
	"BOOL#CTU_6__prev_cu",
};
static const char *const k_il_rtedge_ctu7_pin_tags[] = {
	"BOOL#CTU_7_CU",
	"BOOL#CTU_7_RESET",
	"INT#CTU_7_PV",
	"BOOL#CTU_7_Q",
	"INT#CTU_7_CV",
	"BOOL#CTU_7__prev_cu",
};

static const char *const k_il_rtedge_r_trig1_pin_tags[] = {
	"BOOL#R_TRIG_1_CLK",
	"BOOL#R_TRIG_1_Q",
	"BOOL#R_TRIG_1__prev_clk",
};

static const char *const k_il_rtedge_f_trig1_pin_tags[] = {
	"BOOL#F_TRIG_1_CLK",
	"BOOL#F_TRIG_1_Q",
	"BOOL#F_TRIG_1__prev_clk",
};

struct il_fb_instance_desc {
	const char *instance_spec;
	const char *const *pin_tags;
	size_t pin_count;
};

static const struct il_fb_instance_desc k_il_fb_instances[] = {
	{ "FUNCTION#TON#TON_1", k_il_rtedge_ton1_pin_tags,
	  sizeof(k_il_rtedge_ton1_pin_tags) / sizeof(k_il_rtedge_ton1_pin_tags[0]) },
	{ "FUNCTION#TON#TON_2", k_il_rtedge_ton2_pin_tags,
	  sizeof(k_il_rtedge_ton2_pin_tags) / sizeof(k_il_rtedge_ton2_pin_tags[0]) },
	{ "FUNCTION#TON#TON_3", k_il_rtedge_ton3_pin_tags,
	  sizeof(k_il_rtedge_ton3_pin_tags) / sizeof(k_il_rtedge_ton3_pin_tags[0]) },
	{ "FUNCTION#TON#TON_4", k_il_rtedge_ton4_pin_tags,
	  sizeof(k_il_rtedge_ton4_pin_tags) / sizeof(k_il_rtedge_ton4_pin_tags[0]) },
	{ "FUNCTION#TON#TON_5", k_il_rtedge_ton5_pin_tags,
	  sizeof(k_il_rtedge_ton5_pin_tags) / sizeof(k_il_rtedge_ton5_pin_tags[0]) },
	{ "FUNCTION#TON#TON_6", k_il_rtedge_ton6_pin_tags,
	  sizeof(k_il_rtedge_ton6_pin_tags) / sizeof(k_il_rtedge_ton6_pin_tags[0]) },
	{ "FUNCTION#TON#TON_7", k_il_rtedge_ton7_pin_tags,
	  sizeof(k_il_rtedge_ton7_pin_tags) / sizeof(k_il_rtedge_ton7_pin_tags[0]) },

	{ "FUNCTION#CTU#CTU_1", k_il_rtedge_ctu1_pin_tags,
	  sizeof(k_il_rtedge_ctu1_pin_tags) / sizeof(k_il_rtedge_ctu1_pin_tags[0]) },
	{ "FUNCTION#CTU#CTU_2", k_il_rtedge_ctu2_pin_tags,
	  sizeof(k_il_rtedge_ctu2_pin_tags) / sizeof(k_il_rtedge_ctu2_pin_tags[0]) },
	{ "FUNCTION#CTU#CTU_3", k_il_rtedge_ctu3_pin_tags,
	  sizeof(k_il_rtedge_ctu3_pin_tags) / sizeof(k_il_rtedge_ctu3_pin_tags[0]) },
	{ "FUNCTION#CTU#CTU_4", k_il_rtedge_ctu4_pin_tags,
	  sizeof(k_il_rtedge_ctu4_pin_tags) / sizeof(k_il_rtedge_ctu4_pin_tags[0]) },
	{ "FUNCTION#CTU#CTU_5", k_il_rtedge_ctu5_pin_tags,
	  sizeof(k_il_rtedge_ctu5_pin_tags) / sizeof(k_il_rtedge_ctu5_pin_tags[0]) },
	{ "FUNCTION#CTU#CTU_6", k_il_rtedge_ctu6_pin_tags,
	  sizeof(k_il_rtedge_ctu6_pin_tags) / sizeof(k_il_rtedge_ctu6_pin_tags[0]) },
	{ "FUNCTION#CTU#CTU_7", k_il_rtedge_ctu7_pin_tags,
	  sizeof(k_il_rtedge_ctu7_pin_tags) / sizeof(k_il_rtedge_ctu7_pin_tags[0]) },

	{ "FUNCTION#R_TRIG#R_TRIG_1", k_il_rtedge_r_trig1_pin_tags,
	  sizeof(k_il_rtedge_r_trig1_pin_tags) / sizeof(k_il_rtedge_r_trig1_pin_tags[0]) },
	{ "FUNCTION#F_TRIG#F_TRIG_1", k_il_rtedge_f_trig1_pin_tags,
	  sizeof(k_il_rtedge_f_trig1_pin_tags) / sizeof(k_il_rtedge_f_trig1_pin_tags[0]) },
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
 * -O2 で extern の measure36_slots_init が消えないよう、別 TU と同様の呼び出しを
 * noinline ラッパに閉じる（IPA で空とみなされにくくする）。
 */
__attribute__((noinline)) static void il_rtedge_invoke_slots_init(void)
{
	measure36_slots_init();
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

	/* 3) グローバルスロット割り当て */
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

