#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

// ロジックラベル管理
DWORD	status_label = STATUS_STOP;


/// <summary>
/// ロジックラベルリスト
/// </summary>
struct PLCLABEL*	plcLabel = NULL;
struct PLCLABEL*	plcLabelBottom = NULL;

/// <summary>
/// ロジックラベル用ハッシュテーブル
/// </summary>
#define LABEL_HASHSIZE		0xfff
struct PLCLABEL*	LabelCatalog[LABEL_HASHSIZE] = { 0 };


// 内部
WORD Label_CalcHash(char *cmdname)
{
	HASHCODE x;
	WORD	hashindex;
	// 名前からハッシュ値算出
	x = _Hash(cmdname);
	hashindex = x.code2 & LABEL_HASHSIZE;
	return hashindex;
}

/// <summary>
/// ラベルのリストにエントリを追加します
/// </summary>
/// <param name="name">ラベル名文字列</param>
/// <param name="ip">行番号</param>
/// <param name="anchor">ロジックリストのエントリの位置ポインタ</param>
struct PLCLABEL* Label_Add(char* name ,DWORD ip , struct PLCLOGIC* anchor)
{
	WORD		hashindex;
	struct PLCLABEL* current;
	// メモリの確保と値の保持
	struct PLCLABEL* new_node = (struct PLCLABEL*)Heap_Alloc(sizeof(struct PLCLABEL), __FUNCTION__);
	// ラベル名称のバッファを作ってコピーを保持します
	int LabelLength = strlen(name) +1;
	new_node->name = (char*)Heap_Alloc(LabelLength, __FUNCTION__":labelname");		// 解放されない
	strcpy_s(new_node->name, LabelLength, name);
	// 行番号と、ロジックリストエントリポイントを保持します
	new_node->ip = ip;
	new_node->anchor = anchor;
	new_node->next = NULL;
	// 最初のエントリの場合
	if (plcLabel == NULL) {
		plcLabel = new_node;
		plcLabelBottom = new_node;
		goto success;
	}
	// ２つ目以降のエントリの場合、末端に加える
	current = plcLabelBottom;
	current->next = new_node;
	plcLabelBottom = new_node;

success:
	// ハッシュ値算出
	hashindex = Label_CalcHash(name);
	// 通常はあってはならない、既に埋まっていた場合
	if (LabelCatalog[hashindex] != 0)
	{
		printf("label hash conflict! %s. skipped.\n", name);
	}
	else {
		// 命令カタログに登録
//		LabelCatalog[hashindex]->
	}

	// 本機能の動作状態を更新
	status_label = STATUS_READY;
	// エントリを返す
	return new_node;
}

/// <summary>
/// ロジックラベルのメモリを全解放してクリアします
/// </summary>
void Label_Clear(void)
{
	struct PLCLABEL* current = plcLabel;
	// 全てのエントリメモリを開放します
	while (current != NULL) {
		current = current->next;
		Heap_Free(plcLabel);
		plcLabel = current;
	}

	// リストを空にする
	plcLabel = plcLabelBottom = NULL;

	// 本機能の動作状態を更新
	status_label = STATUS_STOP;
}

/// <summary>
/// ロジックラベルのリスト表示
/// </summary>
/// <param name="ipath"></param>
void Label_Display(void)
{
	printf("Label list\n");
	struct PLCLABEL* current = plcLabel;
	int line = 1;

	// 空の場合
	if (current == NULL) {
		printf("  N/A\n");
		return;
	}

	// 全てのエントリを表示します
	while (current != NULL) {
		printf("  label(%03d) %14s  %p\n"
			, line							// ステップ番号
			, current->name
			, current->anchor				// ロジックのエントリポイント
		);
		current = current->next;
		line++;
	}
}

/// <summary>
/// 指定ラベル名を取得します
/// </summary>
struct PLCLABEL* Label_Search(char* name)
{
	struct PLCLABEL* current = plcLabel;

	// 全てのエントリをサーチします
	while (current != NULL) {
		// 一致を確認
		if( strcmp( name ,current->name) == 0 )
		{
			// 一致したロジックポインタを返却します
			return current;
		}
		// 次のエントリに進む
		current = current->next;
	}
	// 見つからなかった場合
	return NULL;
}

/// <summary>
/// 指定ラベル名のアンカー（ロジックポインタ）を上書きします
/// </summary>
/// <param name="name"></param>
/// <param name="ip"></param>
/// <param name="anchor"></param>
void Label_SetAnchor(char* name, DWORD ip, struct PLCLOGIC* anchor)
{
	// 指定された名称のラベルのエントリを探します
	struct PLCLABEL*	target;
	target = Label_Search(name);
	// セットします
	if (target)
	{
		target->ip = ip;
		target->anchor = anchor;
	}
}
