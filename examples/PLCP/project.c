#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"


/// <summary>
/// PLCプロジェクトのリセットを行います
/// </summary>
void Project_Reset(void)
{
	// ラベルの消去
	Label_Clear();

	// ユーザファンクション、ユーザファンクションブロックの削除
	Userfunction_Clear();
	UserFB_Clear();
	Instruction_FUFBReset();

	// 命令ハッシュテーブルの構築
	Instruction_CreateCatalog();
	Basicfunction_CreateCatalog();

	// エントリポイントの削除
	Logic_SetEntrypoint(NULL);
	Logic_SetBeginpoint(NULL);
	Logic_SetFinalpoint(NULL);
}

/// <summary>
/// PLCプロジェクトのローディングを行う
/// </summary>
/// <returns>エラー数</returns>
int Project_Load(void)
{
	int		errors = 0;
	char*	scopename;

	// Main POU指定が無いならローディングは行われません
	char*	MainPouName = Config_Get_MnmFilePath();
	BOOL	MainPouOK = (strlen(MainPouName) > 0);
	if (!MainPouOK)
		return 0;

	// プロジェクトのリセット（プロジェクトのリロードによってリソース解放される）
	Project_Reset();

	//
	// POUファイルニーモニックの指定があれば全て処理します
	// MAINよりも先に解釈できる順番で処理できるように配置すること
	//
	char*	PouFile = Poufile_First();
	while (PouFile != NULL)
	{
		// FU宣言 FB宣言をリセットします
		Instruction_FUFBReset();

		// ローカル変数スコープとして処理します
		scopename = MnmFile_Base(PouFile);
		Scope_set(scopename);

		// ILファイルをすべて処理します
		errors += MnmFile_Load(PouFile);
		if (errors == 0)
		{
			if (Instruction_IsUF())			// 'FU'宣言のあるユーザファンクションPOUだった場合
			{
				// ユーザファンクション名を記憶する
				int ufnamelength = strlen(scopename) + 1;
				char* ufname = (char*)Heap_Alloc(ufnamelength, __FUNCTION__":ufuncname");
				strcpy_s(ufname, ufnamelength, scopename);

				// 新しい命令として追加になります
				struct MNMTEMPLATE *ufdef = (struct MNMTEMPLATE*)Heap_Alloc(sizeof(struct MNMTEMPLATE), __FUNCTION__"instructiontemplateentry");
				ufdef->precode = TRUE;		// MNM解釈時に処理される命令と宣言します
				ufdef->name = ufname;

				// MNM解釈時に、命令（ユーザファンクション名）呼び出しが現れると命令置換事前処理が働くように登録します
				ufdef->lpMnmInstruct = Userfunction_ReplaceInstruction;

				// 命令ハッシュテーブルにユーザ定義ファンクションを加える
				Instruction_CreateUserfunctionCatalog(scopename, ufdef);
			}
			if (Instruction_IsUFB())		// 'FB'宣言のあるユーザファンクションPOUだった場合
			{
			}
		}

		// 次のPOUファイル
		PouFile = Poufile_Next();
	}

	// FU宣言 FB宣言をリセットします
	Instruction_FUFBReset();

	// グローバル変数スコープとして処理します
	Scope_set("");

	char*	MnmFile;
	// ビギンPOUのニーモニックを処理します
	MnmFile = Poufile_Get_Begin();
	if (strlen(MnmFile) > 0)
		errors += MnmFile_Load(MnmFile);

	// ファイナルPOUのニーモニックを処理します
	MnmFile = Poufile_Get_Final();
	if (strlen(MnmFile) > 0)
		errors += MnmFile_Load(MnmFile);

	// グローバル変数スコープとして処理します
	Scope_set("");

	// MAIN のPOUのニーモニックを処理します
	MnmFile = Config_Get_MnmFilePath();
	if (strlen(MnmFile) > 0)
		errors += MnmFile_Load(MnmFile);

	// PLCロジックのエントリポイントをMAINで設定します
	char* entrypointname = Config_Get_BaseName();
	struct PLCLABEL* main = Label_Search(entrypointname);
	if (main)
		Logic_SetEntrypoint(main->anchor);
	else
	{
		// エントリポイントが見つからないエラー(致命的)
		Errorlog_Add(0, MNM_ENTRYPOINT_NOTFOUND, entrypointname);
		errors++;
	}

	// ビギンPOUのエントリポイントを登録します
	struct PLCLABEL* begin = Label_Search("BEGIN");
	if (begin)
		Logic_SetBeginpoint(begin->anchor);

	// ファイナルPOUのエントリポイントを登録します
	struct PLCLABEL* final = Label_Search("FINAL");
	if (final)
		Logic_SetFinalpoint(final->anchor);

	// エラー数を返す
	return errors;
}