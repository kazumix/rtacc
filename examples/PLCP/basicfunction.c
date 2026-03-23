#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

// 基本ファンクション管理
DWORD	status_basicfunc = STATUS_STOP;


#if DYNAMIC_LOAD_IEC

static RTHANDLE		hBasicFuncRSL;
struct MNMTEMPLATE*	BasicFunctions = NULL;
WORD				NumBasicFunctions = 0;

#else

extern struct MNMTEMPLATE	BasicFunctions[];
extern WORD					NumBasicFunctions;

#endif

/// <summary>
/// 基本ファンクションRSLをロードします
/// </summary>
/// <param name="RslName"></param>
void Basicfunction_Load(char* RslName)
{
#if DYNAMIC_LOAD_IEC

	WORD		*pWord;

	// RSLの読み込み
	hBasicFuncRSL = INtime_RslLoad(RslName);

	if (hBasicFuncRSL != NULL_RTHANDLE)
	{
		// エントリリストの取得
		BasicFunctions = (struct MNMTEMPLATE*)GetRtProcAddress(hBasicFuncRSL, "BasicFunctions");
		// エントリ数の取得
		pWord = (WORD*)GetRtProcAddress(hBasicFuncRSL, "NumBasicFunctions");

		// 判定
		if ((BasicFunctions == NULL) || (pWord == 0))
		{
			// エラーログの記録
			Errorlog_Add(0, FUNC_LOAD_WARNING, RslName);
		}
		else
		{
			// エントリ数の取り出し
			NumBasicFunctions = *pWord;
			// 本機能の動作状態を更新
			status_basicfunc = STATUS_RUN;

			return;
		}
	}

#else

	(void)RslName;
	if (NumBasicFunctions != 0)
		status_basicfunc = STATUS_RUN;

#endif

}

/// <summary>
/// 基本ファンクションRSLをアンロードします
/// </summary>
void Basicfunction_Unload(void)
{
#if DYNAMIC_LOAD_IEC

	// RSLのアンロード
	if (hBasicFuncRSL != NULL_RTHANDLE) {
		FreeRtLibrary(hBasicFuncRSL);
		hBasicFuncRSL = NULL_RTHANDLE;
	}

	// 本機能の動作状態を更新
	status_basicfunc = STATUS_STOP;

#else

	status_basicfunc = STATUS_STOP;

#endif
}

/// <summary>
/// 基本ファンクション命令ハッシュテーブルの新規構築
/// </summary>
/// <returns></returns>
int Basicfunction_CreateCatalog(void)
{
	WORD	hashindex;
	int lp1;
	// 全ての基本ファンクション命令ぶん実施する
	for (lp1 = 0; lp1 < NumBasicFunctions; lp1++)
	{
#if DYNAMIC_LOAD_IEC
		struct MNMTEMPLATE		*basic = &BasicFunctions[lp1];
#else
		struct MNMTEMPLATE		*basic = &BasicFunctions[lp1];
#endif
		// ファンクション名称
		char* basicfuncname;
		basicfuncname = basic->name;

		// ハッシュ値算出
		hashindex = Instruction_CalcHash(basicfuncname);
		// 通常はあってはならない、既に埋まっていた場合
		if (InstructionCatalog[hashindex] != 0)
		{
			printf("instruction hash conflict! %s. skipped.\n" , BasicFunctions[lp1].name);
			continue;
		}
		// 命令カタログに登録
		InstructionCatalog[hashindex] = &BasicFunctions[lp1];
	}

	// 本機能の動作状態を更新
	status_basicfunc = STATUS_READY;
	return 0;
}

/// <summary>
/// 基本ファンクションのリストアップ
/// </summary>
void Basicfunction_Display(void)
{
	printf("Basicfunction list\n");
	int line = 1;

	// 空の場合
	if (NumBasicFunctions == 0) {
		printf("  N/A\n");
		return;
	}

	// 全ての基本ファンクション命令ぶん実施する
	int lp1;
	for (lp1 = 0; lp1 < NumBasicFunctions; lp1++)
	{
#if DYNAMIC_LOAD_IEC
		struct MNMTEMPLATE		*basic = &BasicFunctions[lp1];
#else
		struct MNMTEMPLATE		*basic = &BasicFunctions[lp1];
#endif
		// ファンクション名称
		char* basicfuncname;
		basicfuncname = basic->name;

		// 関数エントリーポイント
		void* entrypoint;
		entrypoint = basic->lpMnmInstruct;

		// 表示
		printf("  function(%03d) %-14s  %p\n"
			, line
			, basicfuncname
			, entrypoint);
		line++;
	}
}

