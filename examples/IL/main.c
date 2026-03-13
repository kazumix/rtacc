#include <rt.h>

/* IL で定義されたロジックのエントリポイント（llil 側の公開名に合わせる） */
extern void test(void);

int main(int argc, char* argv[])
{
	/* 必要であればここで初期化処理などを行う */
	test();
	return 0;
}

