#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

// ファンクションブロック管理
DWORD	status_funcblock = STATUS_STOP;


static RTHANDLE					hBlockFuncRSL;


/// <summary>
/// RSLとユーザファンクションブロックも含む、ファンクションブロックのリスト
/// </summary>
struct FBENTRY			*FbList = NULL;
struct FBENTRY			*FbBottom = NULL;



/// <summary>
/// 安全用の無処理ダミーファンクション(エントリが取れなかった場合などに使用)
/// </summary>
/// <param name=""></param>
void Functionblock_Dummy(P_ANY x)
{
	// 無処理
}

/// <summary>
/// ファンクションブロックのリストに新しいエントリを加える
/// </summary>
/// <param name="FBname"></param>
struct FBENTRY* Functionblock_Add(char* FBname)
{
	struct FBENTRY* current;
	// メモリの確保と値の保持
	struct FBENTRY* new_node = (struct FBENTRY*)Heap_Alloc(sizeof(struct FBENTRY), __FUNCTION__":entry");
	new_node->next = NULL;
	// 名称を保持します
	int		namelen = strlen(FBname) +1;
	new_node->name = (char*)Heap_Alloc(namelen ,__FUNCTION__":name");
	strcpy_s(new_node->name, namelen, FBname);
	// 最初のエントリの場合
	if (FbList == NULL) {
		FbList = new_node;
		FbBottom = new_node;
		goto success;
	}
	// ２つ目以降のエントリの場合、末端に加える
	current = FbBottom;
	current->next = new_node;
	FbBottom = new_node;

success:
	// 本機能の動作状態を更新
	status_funcblock = STATUS_READY;

	// 戻り値に新しいエントリを返します
	return new_node;
}

/// <summary>
/// ファンクションブロックのリストにピン構造定義からピンのリストを作ります
/// </summary>
/// <param name="target"></param>
/// <param name="pin"></param>
void Functionblock_AddConnector(struct FBENTRY* target , struct STRUCTDEFINE* pin)
{
	size_t		size = 0;
	struct FBPINENTRY* current;
	// メモリの確保と値の保持
	struct FBPINENTRY* new_node = (struct FBPINENTRY*)Heap_Alloc(sizeof(struct FBPINENTRY), __FUNCTION__);
	new_node->next = NULL;
	new_node->pin = *pin;
	// 最初のエントリの場合
	if (target->ConnectorList == NULL) {
		target->ConnectorList = new_node;
		goto success;
	}
	// ２つ目以降のエントリの場合
	current = target->ConnectorList;
	while (current->next != NULL) {
		current = current->next;
	}
	current->next = new_node;

success:
	// 本機能の動作状態を更新
	status_funcblock = STATUS_READY;
}

/// <summary>
/// ファンクションブロックのリストから指定名のエントリを探します
/// </summary>
struct FBENTRY* Functionblock_Search(char* name)
{
	// FB正式名、またはインスタンス名をサーチします
	struct FBENTRY* current = FbList;
	// 全てのエントリから該当をサーチします
	while (current != NULL) {
		// 名称の一致を比較します
		if (strcmp(current->name, name) == 0)
		{
			// 一致したのでエントリを返します
			return current;
		}
		current = current->next;
	}
	// 見つかりませんでした
	return NULL;
}

/// <summary>
/// ファンクションブロックのリストをクリアします
/// </summary>
void Functionblock_Clear(void)
{
	struct FBENTRY* current = FbList;
	// 全てのエントリメモリを開放します
	while (current != NULL) {
		// 名称の解放
		Heap_Free(current->name);
		// エントリの解放
		current = current->next;
		Heap_Free(FbList);
		FbList = current;
	}

	// リストを空にする
	FbList = FbBottom = NULL;

	// 本機能の動作状態を更新
	status_funcblock = STATUS_STOP;
}

/// <summary>
/// ファンクションのインスタンス名から関数エントリポイントを取得します
/// </summary>
/// <param name="instancename"></param>
/// <returns></returns>
P_FUNCTIONBLOCK Functionblock_GetEntry(char *instancename)
{
	char					*originalname;

	// インスタンス名からオリジナル名を得ます
	originalname = Rtedge_GetStructureName(instancename);
#if DYNAMIC_LOAD_FB

	// ダイナミックロードの場合は関数エントリを名前から取り出す
	return (P_FUNCTIONBLOCK)GetRtProcAddress(hBlockFuncRSL, originalname);

#else
	WORD					lp1;

	// スタティックロードの場合はテーブルをサーチして関数エントリを名前から取り出す
	struct FUNCTIONBLOCKDEFINE	**fb = FunctionBlocks;
	// ファンクションブロックリストから、名称（オリジナル構造体名）の一致するものを探して
	for (lp1 = 0; lp1 < NumFunctionBlocks; lp1++)
	{
		// 一致したら
		if (strcmp(fb[lp1]->name, originalname) == 0)
		{
			return fb[lp1]->entry;
		}
	}
	// 万が一見つからなかったら
	return NULL;

#endif

}

/// <summary>
/// 基本ファンクションRSLをロードします
/// </summary>
/// <param name="RslName"></param>
void Functionblock_Load(char* RslName)
{
	/// /// <summary>
	/// ファンクションブロックRSLから取り出したリスト
	/// </summary>
#if DYNAMIC_LOAD_FB

	struct FUNCTIONBLOCKDEFINE**	FunctionBlocks = NULL;
	WORD							NumFunctionBlocks = 0;

#else

	__declspec(dllimport) struct FUNCTIONBLOCKDEFINE	*FunctionBlocks[];
	__declspec(dllimport) WORD							NumFunctionBlocks;

#endif

#if DYNAMIC_LOAD_FB

	WORD				*pWord;
	struct FBENTRY		*FBentry;

	// RSLの読み込み
	hBlockFuncRSL = INtime_RslLoad(RslName);

	if (hBlockFuncRSL != NULL_RTHANDLE)
	{
		// エントリリストの取得
		FunctionBlocks = (struct FUNCTIONBLOCKDEFINE**)GetRtProcAddress(hBlockFuncRSL, "FunctionBlocks");
		// エントリ数の取得
		pWord = (WORD*)GetRtProcAddress(hBlockFuncRSL, "NumFunctionBlocks");

		// 判定
		if ((FunctionBlocks == NULL) || (pWord == 0))
		{
			// エラーログの記録
			Errorlog_Add(0, FUNC_LOAD_WARNING, RslName);
		}
		else
		{
			// エントリ数を格納する
			NumFunctionBlocks = *pWord;
			// 本機能の動作状態を更新
			status_funcblock = STATUS_RUN;
		}

		// RSL二定義されているすべてのファンクションブロックを処理します
		int						lp1;
		struct STRUCTDEFINE*	connector;
		for (lp1 = 0; lp1 < NumFunctionBlocks; lp1++)
		{
			// ファンクションブロックを記憶します
			FBentry = Functionblock_Add(FunctionBlocks[lp1]->name);

			// エントリーポイントをセットします
			FBentry->entry = FunctionBlocks[lp1]->entry;

			// 全てのファンクションブロックのすべてのコネクタを処理
			connector = &FunctionBlocks[lp1]->connectors[0];
			while (connector->name)
			{
				// コネクタを記録
				Functionblock_AddConnector(FBentry, connector);

				// 次のエントリへ進む
				connector++;
			}
		}
	}

#endif

}

/// <summary>
/// 基本ファンクションRSLをアンロードします
/// </summary>
void Functionblock_Unload(void)
{
#if DYNAMIC_LOAD_FB

	// RSLのアンロード
	if (hBlockFuncRSL != NULL_RTHANDLE) {
		FreeRtLibrary(hBlockFuncRSL);
		hBlockFuncRSL = NULL_RTHANDLE;
	}

	// 本機能の動作状態を更新
	status_funcblock = STATUS_STOP;

#endif
}

/// <summary>
/// ファンクションブロックのインスタンスを登録します
/// </summary>
/// <param name="instancename"></param>
void Functionblock_Register(char* instancename)
{
	struct FBENTRY*			match;

	// インスタンス名からオリジナル名を得ます
	char					*originalname;
	originalname = Rtedge_GetStructureName(instancename);
	if (originalname == NULL)
		originalname = instancename;

	// ファンクションブロックリストから、名称（オリジナル構造体名）の一致するものを探して
	match = Functionblock_Search(originalname);
	if(match)
	{
		// オリジナル名のPLC変数が存在しないならPLC変数を作る必要がある
		if (Variable_Search(originalname) == NULL)
		{
			// オリジナル名でPLC変数を作ります。内容は関数エントリーポイントを示す
			P_ANY fnentry = Variable_Add(originalname, D_FUNCTION);
			fnentry->pFB = match->entry;
			// この辺数は書換禁止です
			fnentry->realonly = TRUE;
		}

		// 構造体インスタンスで構造体メンバ全部をカタログします (PID_1.Q、PID_1.PV など)
		Structure_CreateCatalog(instancename, match->ConnectorList);
	}
}

/// <summary>
/// ファンクションブロック名を指定してコネクタ構造体のバイトサイズを取得します
/// </summary>
/// <param name="FBname"></param>
/// <returns></returns>
size_t Functionblock_GetSize(char* FBname)
{
	size_t					bytesize = 0;
	struct FBENTRY*			match;
	struct FBPINENTRY*		connector;

	// ファンクションブロックリストから、名称（オリジナル構造体名）の一致するものを探して
	match = Functionblock_Search(FBname);
	if (match)
	{
		// コネクターリストを入手します
		connector = match->ConnectorList;
		// リスト終端迄ループ処理します
		while (connector)
		{
			bytesize += Rtedge_TypeSize(connector->pin.type);

			// 次のエントリへ進める
			connector = connector->next;
		}
	}
	// 構造体バイトサイズを返します
	return bytesize;
}

/// <summary>
/// ファンクションブロックをリストアップする
/// </summary>
void Functionblock_Display(void)
{
	printf("Functionblock list\n");
	int line = 1;

	// 全てのファンクションブロックぶん実施する
	struct FBENTRY *fb = FbList;
	while(fb)
	{
		// ファンクション名称
		char* funcblockname = fb->name;

		// 関数エントリーポイント
		void* entrypoint = fb->entry;

		// 表示
		printf("  FB(%03d) %-14s  %p\n"
			, line
			, funcblockname
			, entrypoint);
		line++;

		// 次のエントリに進める
		fb = fb->next;
	}
}

