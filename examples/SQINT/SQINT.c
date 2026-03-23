/*****************************************************************************
*
* FILE NAME:		SQINT.c
*
* DESCRIPTION:		メインプログラムモジュール
*
\*****************************************************************************/
#include "common.h"

#if DYNAMIC_LOAD_IEC
#elif defined(_MSC_VER)
#pragma comment(lib,"Debug\\PLCPIEC.lib")		// スタティック一体リンク時は不要（LLVM/rtacc では sources で取り込む）
#endif

#if DYNAMIC_LOAD_FB
#elif defined(_MSC_VER)
#pragma comment(lib,"Debug\\PLCPFB.lib")
#endif

extern int main2(int argc, char *argv[]);

int main(int argc, char* argv[])
{
//	main2(0, 0);
	return plcmain(argc, argv);
}


/// <summary>
/// インタプリタ実行では使用されない。リンクを通すためのダミーです
/// </summary>
void seq_control(void)
{
	// not use in interpriter mode
}


