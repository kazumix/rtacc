/*
 * INtime RTA: 2 スレッド + 共有メモリ (Rust スレッドエントリ)
 * rt.h の CreateRtThread() で Rust の rust_thread1_entry / rust_thread2_entry を起動する。
 */
#include <stdio.h>
#include <rt.h>

/* Rust の Shared と同じレイアウト (repr(C)) */
typedef struct {
	volatile int counter;
	volatile int done;  /* 0=実行中, 1=スレッド1完了, 2=両方完了 */
} shared_t;

/* Rust 静的ライブラリからエクスポート */
extern void rust_thread1_entry(void* lp_param);
extern void rust_thread2_entry(void* lp_param);

int main(int argc, char* argv[])
{
	shared_t shared = { 0, 0 };
	RTHANDLE h1, h2;

	(void)argc;
	(void)argv;

	/* スレッド1: 優先度0(プロセス最大), スタック 4KB, 共有メモリを lpParam で渡す */
	h1 = CreateRtThread(0, (LPPROC)rust_thread1_entry, 4096, (LPVOID)&shared);
	if (h1 == BAD_RTHANDLE) {
		printf("CreateRtThread(1) failed\n");
		return 1;
	}

	/* スレッド2 */
	h2 = CreateRtThread(0, (LPPROC)rust_thread2_entry, 4096, (LPVOID)&shared);
	if (h2 == BAD_RTHANDLE) {
		printf("CreateRtThread(2) failed\n");
		return 1;
	}

	/* 両スレッドが done をインクリメントするまで待機 */
	while (shared.done < 2) {
		RtSleep(100);
	}

	printf("RustRta: shared.counter = %d (expected 10)\n", shared.counter);
	return 0;
}
