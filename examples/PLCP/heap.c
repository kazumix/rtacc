#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

// ヒープ管理
DWORD	status_heap = STATUS_STOP;

/// <summary>
/// ヒープリスト
/// </summary>
struct HEAP*	heaplist = NULL;		// 先頭のヒープ
struct HEAP*	heapbottom = NULL;		// 末端のヒープ

uint32_t	orderNo;					// オーダー番号：確保通番


/// /// <summary>
/// 管理ヒープエントリを１つ加える
///		mallocを含みます
/// </summary>
void Heap_Add(void *entry ,size_t size ,char *tag)
{
	struct HEAP* current;
	// メモリの確保と値の保持
	struct HEAP* new_node = (struct HEAP*)malloc(sizeof(struct HEAP));		// ※唯一ここだけはmallocです
	new_node->entry = entry;
	new_node->size = size;
	new_node->tag = tag;
	new_node->order = ++orderNo;
	new_node->next = NULL;
	// 最初のエントリの場合
	if (heaplist == NULL) {
		heaplist = new_node;
		heapbottom = new_node;
		goto success;
	}
	// ２つ目以降のエントリの場合、末端に加える
	current = heapbottom;
	current->next = new_node;
	heapbottom = new_node;

success:
	// 本機能の動作状態を更新
	status_heap = STATUS_READY;
}

/// <summary>
/// ヒープ管理のメモリを全解放してクリアします
/// </summary>
void Heap_Clear(void)
{
	struct HEAP* current = heaplist;
	// 全てのエントリメモリを開放します
	while (current != NULL) {
		current = current->next;
		free(heaplist);			// ※ここは明確にfreeです
		heaplist = current;
	}

	// リストが空の状態にする
	heaplist = NULL;
	heapbottom = NULL;

	// 本機能の動作状態を更新
	status_heap = STATUS_STOP;
}

/// <summary>
/// ヒープ管理から指定のエントリを消去、、メモリ解放します
/// </summary>
void Heap_Del(void* entry)
{
	struct HEAP* current = heaplist;
	struct HEAP* prev = heaplist;
	struct HEAP* next;
	// 一致しているエントリをサーチします
	while (current != NULL) {
		if (current->entry == entry)
		{
			// 一致した場合のnextを取り出す
			next = current->next;
			if (next == NULL)
			{
				if (prev == current)
				{
					// 末端であり最後のエントリだった場合はリストが空になります
					heaplist = NULL;
					heapbottom = NULL;
				}
				else
				{
					// 末端なので1つ前のエントリが末端になります
					prev->next = NULL;
					heapbottom = prev;
				}
			}
			else
			{
				// 末端で無いなら1つ前のエントリのnextを書き換えて連結
				prev->next = next;
			}
			break;
		}
		else
		{
			// 次のエントリに進みます
			prev = current;
			next = current->next;
			current = next;
		}
	}
	// エントリを開放します
	if( current )
		free(current);			// ここは明確にfreeです。

	return;
}

/// <summary>
/// ヒープのリスト表示
/// </summary>
/// <param name="ipath"></param>
void Heap_Display(void)
{
	printf("Heap list\n");
	struct HEAP* current = heaplist;
	int line = 1;

	// 空の場合
	if (current == NULL) {
		printf("  N/A\n");
		return;
	}

	// 全てのエントリを表示します
	while (current != NULL) {
		printf("  Heap(%03d) %p  Order#%d %d bytes  %s\n"
			, line
			, current->entry
			, current->order
			, current->size
			, current->tag);
		current = current->next;
		line++;
	}
}

/// <summary>
/// ヒープを確保します、ヒープ管理にエントリが登録されます
/// </summary>
/// <param name="size"></param>
/// <param name="tag"></param>
/// <returns></returns>
void* Heap_Alloc(size_t size ,char* tag )
{
	// ヒープを確保します
	void*		heap;
	heap = malloc(size);		// ※唯一ここだけはmallocです
	if (heap == NULL)
	{
		// メモリが不足していたエラー
		Errorlog_Add(0, SYS_MEM_EMPTY, tag);
		return NULL;
	}
	// 内容をゼロクリアします
	memset(heap, 0, size);
	// ヒープ管理に登録します
	Heap_Add(heap, size, tag);
	// メモリポインタを返します
	return heap;
}

/// <summary>
/// ヒープを開放します。ヒープ管理のエントリは抹消されます
/// </summary>
/// <param name="entry"></param>
void Heap_Free(void* entry)
{
	// 空を指定された場合は無視です
	if (!entry)
		return;
	// ヒープ管理から抹消します
	Heap_Del(entry);
	// ヒープを開放します
	free(entry);			// 明確にfreeです
}
