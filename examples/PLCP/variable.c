#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"
#include <emmintrin.h>


// 変数機能
DWORD	status_variable = STATUS_STOP;

/// <summary>
/// 編集中のPLC変数リスト
/// </summary>
struct VARIABLE*	variablelist = NULL;
struct VARIABLE*	variableBottom = NULL;

/// <summary>
/// 実行中のPLC変数リスト
/// </summary>
struct VARIABLE*	RUNvariablelist = NULL;

/// <summary>
/// 変数管理にエントリを１つ追加します
/// </summary>
/// <param name="name">名前。コピーされた文字列バッファが用意されます</param>
/// <param name="entry"></param>
P_ANY Variable_Add(char* name ,T_TYPE type )
{
	struct VARIABLE* current;
	// リストエントリ用のメモリの確保
	struct VARIABLE* new_node = (struct VARIABLE*)Heap_Alloc(sizeof(struct VARIABLE) ,__FUNCTION__":entry");
	// リストエントリに名前を保持
	int		length = strlen(name) + 1;
	new_node->name = (char*)Heap_Alloc(length, __FUNCTION__":name");
	strcpy(new_node->name, name);
	// リストエントリに値を保持
	new_node->value.Type = type;
	new_node->next = NULL;
	// 最初のエントリの場合
	if (variablelist == NULL) {
		variablelist = new_node;
		variableBottom = new_node;
		goto success;
	}
	// ２つ目以降のエントリの場合、終端に加える
	current = variableBottom;
	current->next = new_node;
	variableBottom = new_node;

success:
	// 本機能の動作状態を更新（llvm 検証時は無効化）
	// status_variable = STATUS_READY;
	// このエントリが持つT_ANYのポインタ(P_ANY)を返す
	return &new_node->value;
}

/// <summary>
/// 変数管理のメモリを全解放してクリアします
/// </summary>
void Variable_Clear(void)
{
	struct VARIABLE* current = variablelist;
	// 全てのエントリメモリを解放します
	while (current != NULL) {

		// 変数定義で確保されたボディは解放します(エッジタグでない場合)
		if (current->value.link == NULL)
		{
			// D_FUNCTIONは関数エントリポイントを示しているので除外
			if (current->value.Type != D_FUNCTION)
				Heap_Free(current->value.pVal);
		}

		// 変数メモリを解放して次のエントリへ進めます
		current = current->next;
		Heap_Free(variablelist);
		variablelist = current;
	}

	// リストを空にする
	variablelist = variableBottom = NULL;

	// 本機能の動作状態を更新（llvm 検証時は無効化）
	// status_variable = STATUS_STOP;
}

/// <summary>
/// 変数リストをダンプ表示します
/// </summary>
void Variable_Display(void)
{
	printf("PLC variable list\n");
	struct VARIABLE* current = RUNvariablelist;
	int line = 1;

	// 空の場合
	if (current == NULL) {
		printf("  N/A\n");
		return;
	}

	// 全てのエントリを表示します
	while (current != NULL) {
		printf("  Variable(%03d) %p %-24s  %-10s %s %s\n"
			, line
			, &current->value
			, current->name
			, Type_GetName(current->value.Type)
			, (current->value.realonly) ? "RO" : "  "
			, (current->value.link) ? "EG" : "  "
		);
		current = current->next;
		line++;
	}
}

/// <summary>
/// PLC変数リストから指定の名前を探して P_ANY を取り出します
/// </summary>
/// <param name="name"></param>
/// <returns></returns>
P_ANY Variable_Search(char* name)
{
	struct VARIABLE* current = variablelist;
	// 全てのエントリメモリをサーチします
	while (current != NULL) {
		// 同じ名称のPLC変数を探して一致した P_ANY を返します
		if (strcmp(current->name, name) == 0)
			return &current->value;
		// 次のエントリへ進む
		current = current->next;
	}

	// 見つかりませんでした
	return NULL;
}

/// <summary>
/// VARIANTが持つイ文字列ポインタを得ます
/// </summary>
/// <param name="name"></param>
/// <returns></returns>
char* Variable_SearchName(char* name)
{
	struct VARIABLE* current = variablelist;
	// 全てのエントリメモリをサーチします
	while (current != NULL) {
		// 同じ名称のPLC変数を探して一致した char* を返します
		if (strcmp(current->name, name) == 0)
			return current->name;
		// 次のエントリへ進む
		current = current->next;
	}
	// 見つかりませんでした
	return NULL;
}


/// <summary>
/// PLC変数を新たに作ります
/// </summary>
/// <param name="type"></param>
/// <returns></returns>
P_ANY Variable_Create(T_TYPE type)
{
	// 変数格納容器のメモリの確保
	P_ANY		variable = (P_ANY)Heap_Alloc(sizeof(T_ANY), __FUNCTION__);

	variable->link = 0;		// エッジとの接続関連性なし
	variable->Type = type;
	variable->pVal = 0;		// ボディ関連性なし

	// P_ANYを返します
	return variable;
}

/// <summary>
/// PLC変数値ボディを新たに作ります
/// </summary>
/// <param name="size"></param>
/// <returns></returns>
union ANYVAL* Variable_Body(size_t size)
{
	// 値ボディを確保します
	union ANYVAL *body = (union ANYVAL*)Heap_Alloc(size, __FUNCTION__);
	return body;
}

/// <summary>
/// PLC変数にエッジタグをリンクします
/// </summary>
/// <param name="container"></param>
/// <param name="edgetag"></param>
/// <returns></returns>
union ANYVAL* Variable_LinkBody(P_ANY container, char* edgetag)
{
	union ANYVAL *body;
	// エッジタグの型 etype を取り出します
	T_TYPE			etype;
	etype = Rtedge_TagGetIecType(edgetag);
	// 値ボディ body を取り出します
	RTEDGEVARIANT*	etag;
	etag = Rtedge_TagGetPointer(edgetag);

	if (etag)
	{
		body = (union ANYVAL *) Rtedge_GetPointer(etag, etype);
		// P_ANYを組み立てます
		container->link = etag;
		container->Type = etype;
		container->pVal = body;
		return body;
	}
	else
		return NULL;
}

/// PLC変数のデータバイトサイズを返します
/// </summary>
/// <param name="name"></param>
/// <returns></returns>
WORD Variable_GetSize(char* name)
{
	// PLC変数リストから指定の名前を見つけます
	P_ANY	target = Variable_Search(name);
	if (!target)
	{
		// 見つけることができなかった
		Errorlog_Add(0, TAG_NOTFOUND_ERR, __FUNCTION__);
		return 0;
	}
	// データ型からバイトサイズを返します
	WORD size = Rtedge_SizeOf(target);
	return size;
}

/// <summary>
/// PLC変数の値をコピーします
/// </summary>
/// <param name="dst"></param>
/// <param name="src"></param>
void Variable_Copy64(union ANYVAL *dst, union ANYVAL *src)
{
	// 64bit 値を「壊れて見えない」形で更新したいので、
	// 代表フィールドとして ullVal をアトミックに書き換える。
#if defined(_MSC_VER)
	_InterlockedExchange64((__int64*)&dst->ullVal, (__int64)src->ullVal);
#else
	// clang / gcc 系: __atomic_store_n で 64bit アトミックストア
	__atomic_store_n(&dst->ullVal, src->ullVal, __ATOMIC_SEQ_CST);
#endif
}

/// <summary>
/// PLC変数のデータ型を返します
/// </summary>
/// <param name="name"></param>
/// <returns></returns>
T_TYPE Variable_GetType(char* name)
{
	// PLC変数リストから指定の名前を見つけます
	P_ANY	target = Variable_Search(name);
	if (!target)
	{
		// 見つけることができなかった
		Errorlog_Add(0, TAG_NOTFOUND_ERR, __FUNCTION__);
		return D_EMPTY;
	}
	// データ型を返します
	T_TYPE		type = target->Type;
	return type;
}

/// <summary>
/// ゼロ値が格納されたPLC定数
/// </summary>
T_STRING _Variable_Zero_Body_String = { 0 };
T_ARRAY _Variable_Zero_Body_Array = { 0 };
union ANYVAL _Variable_Zero_Body = { 0 };

T_ANY _Variable_Zero_BOOL = { &_Variable_Zero_Body ,D_BOOL	,NULL ,FALSE };
T_ANY _Variable_Zero_SINT = { &_Variable_Zero_Body ,D_SINT	,NULL ,FALSE };
T_ANY _Variable_Zero_INT = { &_Variable_Zero_Body ,D_INT		,NULL ,FALSE };
T_ANY _Variable_Zero_DINT = { &_Variable_Zero_Body ,D_DINT	,NULL ,FALSE };
T_ANY _Variable_Zero_LINT = { &_Variable_Zero_Body ,D_LINT	,NULL ,FALSE };
T_ANY _Variable_Zero_USINT = { &_Variable_Zero_Body ,D_USINT	,NULL ,FALSE };
T_ANY _Variable_Zero_UINT = { &_Variable_Zero_Body ,D_UINT	,NULL ,FALSE };
T_ANY _Variable_Zero_UDINT = { &_Variable_Zero_Body ,D_UDINT	,NULL ,FALSE };
T_ANY _Variable_Zero_ULINT = { &_Variable_Zero_Body ,D_ULINT	,NULL ,FALSE };
T_ANY _Variable_Zero_TIME = { &_Variable_Zero_Body ,D_TIME	,NULL ,FALSE };
T_ANY _Variable_Zero_BYTE = { &_Variable_Zero_Body ,D_BYTE	,NULL ,FALSE };
T_ANY _Variable_Zero_WORD = { &_Variable_Zero_Body ,D_WORD	,NULL ,FALSE };
T_ANY _Variable_Zero_DWORD = { &_Variable_Zero_Body ,D_DWORD	,NULL ,FALSE };
T_ANY _Variable_Zero_QWORD = { &_Variable_Zero_Body ,D_QWORD	,NULL ,FALSE };
T_ANY _Variable_Zero_FUNCTION = { Functionblock_Dummy ,D_FUNCTION	,NULL ,FALSE };
T_ANY _Variable_Zero_STRING = { &_Variable_Zero_Body_String ,D_STRING	,NULL ,FALSE };
T_ANY _Variable_Zero_ARRAY = { &_Variable_Zero_Body_Array ,D_ARRAY	,NULL ,FALSE };
T_ANY _Variable_Zero_STRUCT = { &_Variable_Zero_Body_Array ,D_STRUCT	,NULL ,FALSE };
T_ANY _Variable_Zero_ANY = { &_Variable_Zero_Body ,D_LINT	,NULL ,FALSE };
T_ANY _Variable_Zero_REAL = { &_Variable_Zero_Body ,D_REAL	,NULL ,FALSE };
T_ANY _Variable_Zero_LREAL = { &_Variable_Zero_Body ,D_LREAL	,NULL ,FALSE };

/// <summary>
/// ゼロ値を持った固定定数を返す
/// </summary>
/// <param name="type"></param>
/// <returns></returns>
P_ANY Variable_Zero(T_TYPE type)
{
	switch (type)
	{
	case D_BOOL:		return &_Variable_Zero_BOOL;
	case D_SINT:		return &_Variable_Zero_SINT;
	case D_INT:			return &_Variable_Zero_INT;
	case D_DINT:		return &_Variable_Zero_DINT;
	case D_LINT:		return &_Variable_Zero_LINT;
	case D_USINT:		return &_Variable_Zero_USINT;
	case D_UINT:		return &_Variable_Zero_UINT;
	case D_UDINT:		return &_Variable_Zero_UDINT;
	case D_ULINT:		return &_Variable_Zero_ULINT;
	case D_TIME:		return &_Variable_Zero_TIME;
	case D_REAL:		return &_Variable_Zero_REAL;
	case D_LREAL:		return &_Variable_Zero_LREAL;
	case D_BYTE:		return &_Variable_Zero_BYTE;
	case D_WORD:		return &_Variable_Zero_WORD;
	case D_DWORD:		return &_Variable_Zero_DWORD;
	case D_QWORD:		return &_Variable_Zero_QWORD;
	case D_FUNCTION:	return &_Variable_Zero_FUNCTION;
	case D_STRING:		return &_Variable_Zero_STRING;
	case D_ARRAY:		return &_Variable_Zero_ARRAY;
	case D_STRUCT:		return &_Variable_Zero_STRUCT;
	case D_ANY:			return &_Variable_Zero_ANY;
	}
	// 
	return NULL;
}

/// <summary>
/// 全てのPLC変数を初期化します
/// </summary>
void Variable_Reset_All(void)
{
	P_ANY tmp;
	void *tmp2;
	WORD size;
	struct VARIABLE* current = RUNvariablelist;
	// 全てのPLC変数を処理します
	while (current != NULL) {
		// 書換禁止の場合はスキップします
		BOOL	readonly = current->value.realonly;
		if (readonly)
			goto next;
		// 割り当てが無いならスキップ
		if (current->value.pVal == NULL)
			goto next;
		// データ型に応じて分岐し、ゼロクリアする
		T_TYPE	type = current->value.Type;
		switch (type)
		{
		case D_BOOL:		*current->value.pBool = FALSE;			break;
		case D_SINT:		*current->value.pSint = 0;				break;
		case D_INT:			*current->value.pInt = 0;				break;
		case D_DINT:		*current->value.pDint = 0;				break;
		case D_LINT:		*current->value.pLint = 0;				break;
		case D_USINT:		*current->value.pUsint = 0;				break;
		case D_UINT:		*current->value.pUint = 0;				break;
		case D_UDINT:		*current->value.pUdint = 0;				break;
		case D_ULINT:		*current->value.pUlint = 0;				break;
		case D_TIME:		*current->value.pTime = 0;				break;
		case D_REAL:		*current->value.pReal = 0.0F;			break;
		case D_LREAL:		*current->value.pLreal = 0.0F;			break;
		case D_BYTE:		*current->value.pByte = 0;				break;
		case D_WORD:		*current->value.pWord = 0;				break;
		case D_DWORD:		*current->value.pDword = 0;				break;
		case D_QWORD:		*current->value.pQword = 0;				break;
		case D_FUNCTION:
			// FUNCTIONはゼロクリアの対象外です
			break;
		case D_ARRAY:
		case D_STRUCT:
			// RT-edge ARRAYをゼロクリアします
			size = current->value.link->size;
			memset(current->value.pVal, 0, size);
			break;
		case D_STRING:
			// STRINGをゼロクリアします
			memset(current->value.pString, 0, sizeof(T_STRING));
			break;
		case D_ANY:
			// ANYはT_ANYポインタ値をだかえているので書き換えず、
			tmp = (P_ANY)*current->value.pDword;
			// 更にBODYポインタを取り出して、その中の値をクリアする
			tmp2 = tmp->pVal;
			memset(tmp2, 0, sizeof(T_STRING));
			break;
		}

next:
		// 次のエントリに進む
		current = current->next;
	}
}

/// <summary>
/// 編集中PLC変数リストと、実行中PLC変数リストを入れ替えます
/// </summary>
void Variable_Swap(void)
{
	// 編集中PLC変数リストと、実行中PLC変数リストを入れ替えます
	struct VARIABLE* tmp;

	tmp = RUNvariablelist;
	RUNvariablelist = variablelist;
	variablelist = tmp;

	// 使わなくなるPLC変数を開放します
	Variable_Clear();
	variablelist = NULL;
}
