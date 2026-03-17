#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

// ラダーロジック管理
DWORD	status_logic = STATUS_STOP;

/// <summary>
/// 編集中のラダーロジックリスト
/// </summary>
struct PLCLOGIC*	plcLogic = NULL;			// ロジック全体のリスト
struct PLCLOGIC*	plcLogicBottom = NULL;		// ロジック全体のリストの終端
struct PLCLOGIC*	plcentrypoint = NULL;		// サイクルエントリポイント
struct PLCLOGIC*	plcbeginpoint = NULL;		// ビギンPOUエントリポイント
struct PLCLOGIC*	plcfinalpoint = NULL;		// ファイナルPOUエントリポイント

/// <summary>
/// 実行中のラダーロジックリスト
/// </summary>
struct PLCLOGIC*	RUNplcLogic = NULL;			// ロジック全体のリスト
struct PLCLOGIC*	RUNplcentrypoint = NULL;	// サイクルエントリポイント
struct PLCLOGIC*	RUNplcbeginpoint = NULL;	// ビギンPOUエントリポイント
struct PLCLOGIC*	RUNplcfinalpoint = NULL;	// ファイナルPOUエントリポイント


/// /// <summary>
/// ロジックに命令を１つ加える
///		mallocを含みます
/// </summary>
struct PLCLOGIC* Logic_Add(struct MNMTEMPLATE *cmddef, P_ANY iArg1, P_ANY iArg2, P_ANY iArg3)
{
	struct PLCLOGIC* current;
	// メモリの確保と値の保持
	struct PLCLOGIC* new_node = (struct PLCLOGIC*)Heap_Alloc(sizeof(struct PLCLOGIC) ,__FUNCTION__);
	new_node->instruction = cmddef;
	new_node->Arg1 = iArg1;
	new_node->Arg2 = iArg2;
	new_node->Arg3 = iArg3;
	new_node->next = NULL;
	// 最初のエントリの場合
	if (plcLogic == NULL) {
		plcLogic = new_node;
		plcLogicBottom = new_node;
		goto success;
	}
	// ２つ目以降のエントリの場合、終端に加える
	current = plcLogicBottom;
	current->next = new_node;
	plcLogicBottom = new_node;

success:
	// 本機能の動作状態を更新
	status_logic = STATUS_READY;
	// エントリポイントを返します
	return new_node;
}

/// <summary>
/// ロジックのメモリを全解放してクリアします
/// </summary>
void Logic_Clear(void)
{
	struct PLCLOGIC* current = plcLogic;
	// 全てのエントリメモリを開放します
	while (current != NULL) {
		current = current->next;
		Heap_Free(plcLogic);			// TODO: アーギュメントのリテラルも開放する必要あり
		plcLogic = current;
	}

	// リストを空にする
	plcLogic = NULL;
	plcLogicBottom = NULL;

	// 本機能の動作状態を更新
	status_logic = STATUS_STOP;
}

/// <summary>
/// ロジックのリスト表示
/// </summary>
/// <param name="ipath"></param>
void Logic_Display(void)
{
	printf("Logic list\n");
	struct PLCLOGIC* current = RUNplcLogic;
	int line = 1;

	// 空の場合
	if (current == NULL) {
		printf("  N/A\n");
		return;
	}

	// 全てのエントリを表示します
	while (current != NULL) {
		printf("  line(%03d) %p %14s  %p %p %p   %p\n"
			, line										// ステップ番号
			, current									// リストエントリーポイント
			, current->instruction->name				// 命令名
			, (current->Arg1 != &VARIANT_EMPTY) ? current->Arg1 : 0x00000000
			, (current->Arg2 != &VARIANT_EMPTY) ? current->Arg2 : 0x00000000
			, (current->Arg3 != &VARIANT_EMPTY) ? current->Arg3 : 0x00000000
			, current->instruction->lpMnmInstruct);		// 関数エントリポイント
		current = current->next;
		line++;
	}

	//
	printf("Logic entrypoint\n");
	// 空の場合
	if (RUNplcentrypoint == NULL) {
		printf("  N/A\n");
		return;
	}
	printf("  entry point:  %p\n", RUNplcentrypoint);
}

/// <summary>
/// ロジックからC言語ソースコードを作り出す
/// </summary>
/// <param name="fp"></param>
void Logic_Convert_To_Clanguage(FILE *fp)
{
	struct PLCLOGIC* current = plcLogic;
	int line = 1;
	// ヘッダ部
	fprintf(fp, "#include <PLCINST.h>\nint main(int argc, char* argv[])\n{\n\treturn plcmain(argc, argv);\n}\nvoid seq_control(void)\n{\n\tBYTE\ta=0;\n");
	// 全てのエントリを処理します
	while (current != NULL) {
		fprintf(fp, "\ta=%s( a ,%p, %p, %p);\n", current->instruction->name, current->Arg1, current->Arg2, current->Arg3);
		current = current->next;
		line++;
	}
	// フッダ部
	fprintf(fp, "}\n");
}

/// <summary>
/// インタプリタ実行におけるロジックの１POUあたりの実行
/// </summary>
/// <param name="Arg0"></param>
/// <param name="name"></param>
/// <returns></returns>
P_ANY Logic_RunPOU(P_ANY Arg0, P_ANY a2, P_ANY a3, P_ANY a4)
{
	// a2 にロジックリストをもらっているのでキャストして使う
	struct PLCLOGIC* current = (struct PLCLOGIC*)a2;
	PLCINSTRUCTION instruction;

	// Arg0 はラダー回路図上でいうところの接続線（データの引継ぎ）を意味します
	// Arg0 を命令に引き渡し、命令戻りをArg0として受け取る、そして次の命令へ。

	// 指定されたロジック位置から終端まで
	while (current != NULL) {

		// 実行するIL命令の取り出し
		instruction = current->instruction->lpMnmInstruct;
		// 命令コール、引数1～３、戻り値の循環利用
		Arg0 = (instruction)(Arg0, current->Arg1, current->Arg2, current->Arg3);

#ifdef _DEBUG
		// デバッグモニタ目的で処理結果をロジックリストに保持する（バッファポインタ先は複写しないので注意）
		if(Arg0->pQword)
			current->laststate.llVal = *Arg0->pQword;
#endif

		// 戻りにbreakのフラグが指定されていればループを中断します。RET命令が該当します
		if (Arg0->brk == TRUE)
		{
			// breakのフラグを落とします
			Arg0->brk = FALSE;
			// ループ中止。
			break;
		}

		current = current->next;
	}
	// POUの終了
	return Arg0;
}

/// <summary>
/// インタプリタ実行におけるロジックの１スキャン実行
/// </summary>
void Logic_Scan(void)
{
	// エントリーポイント
	struct PLCLOGIC*	entry = RUNplcentrypoint;

	// エントリーポイントが設定されていないなら無処理
	if (entry == NULL)
		return;

	// Arg0 はラダー回路図上でいうところの接続線（データの引継ぎ）を意味します
	// Arg0 を命令に引き渡し、命令戻りをArg0として受け取る、そして次の命令へ。

	T_ANY		al = { 0 };			// 初期値はゼロクリア
	P_ANY		Arg0 = &al;

	union VALUEBODY					// 値保持
	{
		union ANYVAL	any;		// 結果値の実体
		T_STRING		string;		// 結果文字列の実体
	} val = { 0 };
	Arg0->pVal = &val;				// 値保持へのポインタ

	// ロジック先頭からの実行
	Arg0 = Logic_RunPOU(Arg0, (P_ANY)entry, 0 ,0);
}

/// <summary>
/// PLCビギン処理を実行します
/// </summary>
void Logic_Begin(void)
{
	// エントリーポイント
	struct PLCLOGIC*	entry = RUNplcbeginpoint;

	// エントリーポイントが設定されていないなら無処理
	if (entry == NULL)
		return;

	T_ANY		al = { 0 };			// 初期値はゼロクリア
	P_ANY		Arg0 = &al;

	union VALUEBODY					// 値保持
	{
		union ANYVAL	any;		// 結果値の実体
		T_STRING		string;		// 結果文字列の実体
	} val = { 0 };
	Arg0->pVal = &val;				// 値保持へのポインタ

	// ロジック先頭からの実行
	Arg0 = Logic_RunPOU(Arg0, (P_ANY)entry, 0, 0);
}

/// <summary>
/// PLCファイナル処理を実行します
/// </summary>
void Logic_Final(void)
{
	// エントリーポイント
	struct PLCLOGIC*	entry = RUNplcfinalpoint;

	// エントリーポイントが設定されていないなら無処理
	if (entry == NULL)
		return;

	T_ANY		al = { 0 };			// 初期値はゼロクリア
	P_ANY		Arg0 = &al;

	union VALUEBODY					// 値保持
	{
		union ANYVAL	any;		// 結果値の実体
		T_STRING		string;		// 結果文字列の実体
	} val = { 0 };
	Arg0->pVal = &val;				// 値保持へのポインタ

	// ロジック先頭からの実行
	Arg0 = Logic_RunPOU(Arg0, (P_ANY)entry, 0, 0);
}

/// <summary>
/// ロジックのエントリーポイントを設定します
/// </summary>
/// <param name="start"></param>
void Logic_SetEntrypoint(struct PLCLOGIC* start)
{
	// ロジックは毎スキャンごとに、この位置からスタートします
	plcentrypoint = start;
}

/// <summary>
/// PLCビギン処理を登録します
/// </summary>
/// <param name="start"></param>
void Logic_SetBeginpoint(struct PLCLOGIC* start)
{
	// リセット直後の変数初期化などに、この位置からスタートします
	plcbeginpoint = start;
}

/// <summary>
/// PLCファイナル処理を登録します
/// </summary>
/// <param name="start"></param>
void Logic_SetFinalpoint(struct PLCLOGIC* start)
{
	// リセット直後の変数初期化などに、この位置からスタートします
	plcfinalpoint = start;
}

/// <summary>
/// 編集ロジックと、実行ロジックを入れ替えます
/// </summary>
void Logic_Swap(void)
{
	// 編集ロジックと、実行ロジックを入れ替えます
	struct PLCLOGIC* tmp;
	
	tmp = RUNplcLogic;
	RUNplcLogic = plcLogic;
	plcLogic = tmp;

	// 使わなくなるロジックを開放します
	Logic_Clear();
	plcLogic = NULL;

	// エントリーポイントを入れ替えます
	RUNplcentrypoint = plcentrypoint;
	plcentrypoint = NULL;

	RUNplcbeginpoint = plcbeginpoint;
	plcbeginpoint = NULL;

	RUNplcfinalpoint = plcfinalpoint;
	plcfinalpoint = NULL;
}

/// <summary>
/// ロジックの逆アセンブリ表示
/// </summary>
void Logic_Disasm(void)
{
	printf("Logic Disasm\n");
	struct PLCLOGIC* current = RUNplcLogic;
	int line = 1;

	// 空の場合
	if (current == NULL) {
		printf("  N/A\n");
		return;
	}

	// 全てのエントリを表示します
	while (current != NULL) {
		printf("  line(%03d) %14s  %p %p %p   %016I64x\n"
			, line										// ステップ番号
			, current->instruction->name				// 命令名
			, (current->Arg1 != &VARIANT_EMPTY) ? current->Arg1 : 0x00000000
			, (current->Arg2 != &VARIANT_EMPTY) ? current->Arg2 : 0x00000000
			, (current->Arg3 != &VARIANT_EMPTY) ? current->Arg3 : 0x00000000
			, current->laststate.llVal);
		current = current->next;
		line++;
	}
}