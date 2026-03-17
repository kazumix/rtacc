#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

// ユーザファンクションブロック管理
DWORD	status_userFB = STATUS_STOP;


struct FBENTRY			*UserFBList = NULL;
struct FBENTRY			*UserFBBottom = NULL;


/// <summary>
/// ユーザファンクションブロックのリストに新しいエントリを加える
/// </summary>
/// <param name="FBname"></param>
void UserFB_Add(char* FBname)
{
	struct FBENTRY* current;
	// メモリの確保と値の保持
	struct FBENTRY* new_node = (struct FBENTRY*)Heap_Alloc(sizeof(struct FBENTRY), __FUNCTION__);
	new_node->next = NULL;
	new_node->name = FBname;
	// 最初のエントリの場合
	if (UserFBList == NULL) {
		UserFBList = new_node;
		UserFBBottom = new_node;
		goto success;
	}
	// ２つ目以降のエントリの場合、末端に加える
	current = UserFBBottom;
	current->next = new_node;
	UserFBBottom = new_node;

success:
	// 本機能の動作状態を更新
	status_userFB = STATUS_READY;
}

/// <summary>
/// ユーザファンクションブロックのリストにピン構造定義からピンのリストを作ります
/// </summary>
/// <param name="target"></param>
/// <param name="pin"></param>
void UserFB_AddConnector(struct FBENTRY* target, struct STRUCTDEFINE* pin)
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
	status_userFB = STATUS_READY;
}

/// <summary>
/// ユーザファンクションブロックのリストから指定の名前ののエントリを探します
/// </summary>
struct FBENTRY* UserFB_Search(char* name)
{
	// FB正式名、またはインスタンス名をサーチします
	struct FBENTRY* current = UserFBList;
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
/// ユーザファンクションブロックのリストをクリアします
/// </summary>
void UserFB_Clear(void)
{
	struct FBENTRY* current = UserFBList;
	// 全てのエントリメモリを開放します
	while (current != NULL) {
		current = current->next;
		Heap_Free(UserFBList);
		UserFBList = current;
	}

	// リストを空にする
	UserFBList = UserFBBottom = NULL;

	// 本機能の動作状態を更新
	status_userFB = STATUS_STOP;
}

/// <summary>
/// ファンクションのインスタンス名から関数エントリポイントを取得します
/// </summary>
/// <param name="instancename"></param>
/// <returns></returns>
struct PLCLOGIC* UserFB_GetEntry(char *instancename)
{
	char					*originalname;

	// インスタンス名からオリジナル名を得ます
	originalname = Rtedge_GetStructureName(instancename);

	// 
	return NULL;
}

size_t UserFB_GetSize(char* FBname)
{
	//struct FUNCTIONBLOCKDEFINE	**fb = FunctionBlocks;

	//WORD					lp1;
	size_t					bytesize = 0;
	//struct STRUCTDEFINE*	connector;

	//// ファンクションブロックリストから、名称（オリジナル構造体名）の一致するものを探して
	//for (lp1 = 0; lp1 < NumFunctionBlocks; lp1++)
	//{
	//	// 一致したら
	//	if (strcmp(fb[lp1]->name, FBname) == 0)
	//	{
	//		// コネクターリストを入手します
	//		connector = fb[lp1]->connectors;
	//		// リスト終端迄ループ処理します
	//		while (connector->name)
	//		{
	//			bytesize += Rtedge_TypeSize(connector->type);
	//			// 次のエントリへ進める
	//			connector++;
	//		}
	//		break;
	//	}
	//}
	// 構造体バイトサイズを返します
	return bytesize;
}

/// <summary>
/// ユーザファンクションブロックのインスタンスでエッジタグを生成します
/// ※このコール以前に UserFB_Add、UserFB_AddConnector が済んでいる必要があります
/// </summary>
/// <param name="instname"></param>
/// <param name="type"></param>
/// <param name="opt1"></param>
/// <param name="opt2"></param>
/// <returns></returns>
BOOL UserFB_TagCreate(char* instname, T_TYPE type, LPVOID opt1, LPVOID opt2)
{
	//// Segmentのバイトサイズはファンクションブロックごとの構造体サイスになる
	//opt1 = (LPVOID)UserFB_GetSize(FBname);

	//// Sourceは固定 ("FUNCTION#name")
	//opt2 = (LPVOID)source;

	//// エッジタグを生成します
	//result = Rtedge_TagCreate(instname, type, opt1, opt2);

	//return result;
	return TRUE;
}

/// <summary>
/// ユーザファンクションブロックのインスタンスを登録します
/// </summary>
/// <param name="instancename"></param>
void UserFB_Register(char* instancename)
{
	//struct FUNCTIONBLOCKDEFINE	**fb = FunctionBlocks;
	//WORD					lp1;

	//// インスタンス名からオリジナル名を得ます
	//char					*originalname;
	//originalname = Rtedge_GetStructureName(instancename);
	//if (originalname == NULL)
	//	originalname = instancename;
	//// ファンクションブロックリストから、名称（オリジナル構造体名）の一致するものを探して
	//for (lp1 = 0; lp1 < NumFunctionBlocks; lp1++)
	//{
	//	// 一致したら
	//	if (strcmp(fb[lp1]->name, originalname) == 0)
	//	{
	//		// オリジナル名のPLC変数が存在しないならPLC変数を作る必要がある
	//		if (Variable_Search(originalname) == NULL)
	//		{
	//			// オリジナル名でPLC変数を作ります。内容は関数エントリーポイントを示す
	//			P_ANY fnentry = Variable_Add(originalname, D_FUNCTION);
	//			fnentry->pFB = fb[lp1]->entry;
	//		}
	//		// 構造体インスタンスで構造体メンバ全部をカタログします
	//		Structure_CreateCatalog(instancename, fb[lp1]->connectors);

	//		// 一致してカタログが終わったのでブレイク
	//		break;
	//	}
	//}
}
