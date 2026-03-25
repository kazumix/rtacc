/*
 * melsec.ll と等価な C（ビット類・タイマ・scan ロジック）。
 */
#include <stdbool.h>
#include <stdint.h>

/* ビット類（.ll の global と同様に外部リンケージ） */
bool M621;
bool M133;
bool M145;
bool M400;
bool M517;
bool M516;
bool M520;
bool M521;

/* Timer: { preset_ms, elapsed_ms, running, done } */
typedef struct {
	int32_t preset_ms;
	int32_t elapsed_ms;
	bool running;
	bool done;
} Timer;

Timer T26 = { 0, 0, false, false }; /* preset 不明のため一旦 0 */
Timer T28 = { 80, 0, false, false }; /* K80（ms想定） */
/* melsec.ll との整合: T27=K5, T28=K80（ms想定） */
Timer T27 = { 5, 0, false, false }; /* K5（ms想定） */

static void timer_start(Timer *t)
{
	t->elapsed_ms = 0;
	t->done = false;
	t->running = true;
}

static void timer_reset(Timer *t)
{
	t->elapsed_ms = 0;
	t->running = false;
	t->done = false;
}

void update_timer(Timer *t, int32_t dt_ms)
{
	if (!t->running)
		return;

	t->elapsed_ms += dt_ms;
	if (t->elapsed_ms >= t->preset_ms) {
		t->done = true;
		t->running = false;
	}
}

void scan(int32_t dt_ms)
{
	update_timer(&T26, dt_ms);
	update_timer(&T27, dt_ms);
	update_timer(&T28, dt_ms);

	bool M621_val = M621;
	bool M133_val = M133;
	bool M400_val = M400;

	/* ラダー: M621 && M133 && !M400 -> M400 ON */
	if (M621_val && M133_val && !M400_val) {
		M400 = true;

		/* T26 は画像上は接点として M517 条件に直列。
		 * T26 の K が不明なので preset=0 扱いで即時 done=true にして挙動を壊さない。
		 */
		T26.elapsed_ms = 0;
		T26.running = false;
		T26.done = true;
	}

	bool M400_now = M400;
	if (M400_now) {
		/* ラダー: M517 は「!M520 && M621 && M133 && T26(done) && !M516」で成立。 */
		bool not_M520 = !M520;
		bool not_M516 = !M516;
		M517 = not_M520 && M621_val && M133_val && T26.done && not_M516;

		/* after_lift: M145 かつ T27 未計測 -> T27 計測開始 */
		if (M145 && !T27.running && !T27.done)
			timer_start(&T27);

		/* T27.done -> 爪パルス & M520 ON & T28 計測開始 */
		if (T27.done) {
			M521 = true;
			M521 = false;

			M520 = true;

			timer_reset(&T27);
			timer_start(&T28);
		}

		/* T28.done -> 停止パルス & 終了 */
		if (T28.done) {
			M516 = true;
			M516 = false;

			M400 = false;
			M520 = false;

			timer_reset(&T27);
			timer_reset(&T28);

			T26.elapsed_ms = 0;
			T26.running = false;
			T26.done = false;
		}
	}
}
