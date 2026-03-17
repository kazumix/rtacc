/*****************************************************************************
*
* FILE NAME:		SQINT.c
*
* DESCRIPTION:		メインプログラムモジュール
*
\*****************************************************************************/
#include "common.h"

#if	(DYNAMIC_LOAD_IEC != 1)
#pragma comment(lib,"Debug\\PLCPIEC.lib")		// 効いてないので、しかたなくリンクライブラリを設定してます..
#endif

#if	(DYNAMIC_LOAD_FB != 1)
#pragma comment(lib,"Debug\\PLCPFB.lib")		// 効いてないので、しかたなくリンクライブラリを設定してます..
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


