#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

// POUファイル管理
DWORD	status_pou = STATUS_STOP;


/// <summary>
/// POUファイルの管理 poufile.c
/// </summary>
struct POUFILE
{
	char				*filepath;
	struct POUFILE*		next;
};

/// <summary>
/// POUファイルリスト
/// </summary>
struct POUFILE*		poulist = NULL;
struct POUFILE*		pouBottom = NULL;

/// <summary>
/// リセット後に一度だけ実行されるPOU
/// </summary>
struct POUFILE*		poubegin = NULL;

/// <summary>
/// ストップ後に一度だけ実行されるPOU
/// </summary>
struct POUFILE*		poufinal = NULL;


/// <summary>
/// POUファイルのエントリを加えます
/// </summary>
struct POUFILE* Poufile_Add(char* filepath)
{
	struct POUFILE* current;
	// メモリの確保と値の保持
	struct POUFILE* new_node = (struct POUFILE*)Heap_Alloc(sizeof(struct POUFILE),__FUNCTION__);
	// ファイルパス用のメモリを確保してコピーを保持します
	int	length = strlen(filepath) +1;
	new_node->filepath = (char*)Heap_Alloc(length,__FUNCTION__":filepath");
	strcpy_s(new_node->filepath, length, filepath);
	new_node->next = NULL;
	// 最初のエントリの場合
	if (poulist == NULL) {
		poulist = new_node;
		pouBottom = new_node;
		goto success;
	}
	// ２つ目以降のエントリの場合、末端に加える
	current = pouBottom;
	current->next = new_node;
	pouBottom = new_node;

success:
	// 本機能の動作状態を更新
	status_pou = STATUS_READY;
	// エントリを返却します
	return new_node;
}

/// <summary>
/// POUファイルのエントリを消去します
/// </summary>
void Poufile_Clear()
{
	struct POUFILE* current = poulist;
	// 全てのエントリメモリを開放します
	while (current != NULL) {
		// ファイルパスのバッファを開放
		if (current->filepath)
			Heap_Free(current->filepath);
		// エントリの解放
		current = current->next;
		Heap_Free(poulist);			// ※ここは明確にfreeです
		poulist = current;
	}

	// リストを空にする
	poulist = pouBottom = NULL;

	// 本機能の動作状態を更新
	status_pou = STATUS_STOP;
}

/// <summary>
/// POUファイルのリストをダンプ表示します
/// </summary>
void Poufile_Display(void)
{
	printf("POU file list\n");
	struct POUFILE* current = poulist;
	int line = 1;

	// 空の場合
	if (current == NULL) {
		printf("  N/A\n");
		return;
	}

	// 全てのエントリを表示します
	while (current != NULL) {
		printf("  POUfile(%03d) %s\n"
			, line
			, current->filepath);
		current = current->next;
		line++;
	}
}


/// <summary>
/// Poufile_Next,Poufile_First処理用（スレッドセーフでない）
/// </summary>
struct POUFILE*		pouenum = NULL;

/// <summary>
/// 次のPOUファイルのエントリ
/// </summary>
/// <returns></returns>
char* Poufile_Next(void)
{
	char*		path;
	// エントリがない
	if (pouenum == NULL)
		return NULL;
	// パスを取り出します
	path = pouenum->filepath;
	// 次のエントリへシフトします
	pouenum = pouenum->next;
	return path;
}

/// <summary>
/// 最初のPOUファイルのエントリ
/// </summary>
/// <returns></returns>
char* Poufile_First(void)
{
	pouenum = poulist;
	// パスを取り出します
	return Poufile_Next();
}

/// <summary>
/// ビギンPOUを登録します
/// </summary>
struct POUFILE* Poufile_Set_Begin(char* filepath)
{
	// メモリの確保と値の保持
	struct POUFILE* new_node = (struct POUFILE*)Heap_Alloc(sizeof(struct POUFILE),__FUNCTION__);
	// ファイルパス用のメモリを確保してコピーを保持します
	int	length = strlen(filepath) + 1;
	new_node->filepath = (char*)Heap_Alloc(length,__FUNCTION__":filepath");
	strcpy_s(new_node->filepath, length, filepath);
	new_node->next = NULL;
	// エントリの登録
	poubegin = new_node;
	return poubegin;
}

/// <summary>
/// ビギンPOUを取り出します
/// </summary>
char* Poufile_Get_Begin(void)
{
	return (poubegin) ? poubegin->filepath : "";
}

/// <summary>
/// ファイナルPOUを登録します
/// </summary>
struct POUFILE* Poufile_Set_Final(char* filepath)
{
	// メモリの確保と値の保持
	struct POUFILE* new_node = (struct POUFILE*)Heap_Alloc(sizeof(struct POUFILE),__FUNCTION__);
	// ファイルパス用のメモリを確保してコピーを保持します
	int	length = strlen(filepath) + 1;
	new_node->filepath = (char*)Heap_Alloc(length,__FUNCTION__":filepath");
	strcpy_s(new_node->filepath, length, filepath);
	new_node->next = NULL;
	// エントリの登録
	poufinal = new_node;
	return poufinal;
}

/// <summary>
/// ファイナルPOUを取り出します
/// </summary>
char* Poufile_Get_Final(void)
{
	return (poufinal) ? poufinal->filepath : "";
}
