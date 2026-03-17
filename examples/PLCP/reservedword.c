#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

// IEC61131-3予約語の管理


// IEC 61131-3には、予約語（Reserved Words）と呼ばれる特別なキーワードが存在します。
// これらの予約語は、プログラムの構文や制御フロー、データ型などを定義するために使用
// されるため、変数名や関数名として使用することはできません。

char* reservedwords[] =
{
	"VAR",
	"END_VAR",
	"BOOL",
	"BYTE",
	"INT",
	"REAL",
	"TIME",
	"STRING",
	"IF",
	"THEN",
	"ELSE",
	"CASE",
	"OF",
	"FOR",
	"TO",
	"DO",
	"STEP",
	"WHILE",
	"REPEAT",
	"UNTIL",
	"AND",
	"OR",
	"XOR",
	"NOT",
//	"TRUE",
//	"FALSE",
	"RETURN",
	"PROGRAM",
	"END_PROGRAM",
	"FUNCTION",
	"END_FUNCTION"
};	// NULL終端にしないこと！


/// <summary>
/// 予約語ハッシュテーブル
/// </summary>
#define RESERVEDWORD_HASHSIZE		0xff
struct RESERVEDWORDTEMPLATE	ReservedwordCatalog[RESERVEDWORD_HASHSIZE] = { 0 };

// 内部
WORD Reservedword_CalcHash(char *string)
{
	HASHCODE x;
	WORD	hashindex;
	// 名前からハッシュ値算出
	x = _Hash(string);
	hashindex = x.code2 & RESERVEDWORD_HASHSIZE;
	return hashindex;
}

/// <summary>
/// 予約補ハッシュテーブルを作ります
/// </summary>
/// <returns></returns>
int Reservedword_CreateCatalog(void)
{
	WORD	hashindex;
	int		lp1;
	char*	entry;
	// 全リストぶん実施する
	for( lp1=0 ;lp1< sizeof(reservedwords)/sizeof(char*) ;lp1++ )
	{
		entry = reservedwords[lp1];
		// ハッシュ値算出
		hashindex = Reservedword_CalcHash(entry);
		// 通常はあってはならない、既に埋まっていた場合
		if (ReservedwordCatalog[hashindex].name != 0)
		{
			printf("reservedword hash conflict! %s. skipped.\n", entry);
			continue;
		}
		// カタログに登録
		ReservedwordCatalog[hashindex].name = entry;
	}
	return 0;
}

/// <summary>
/// 文字列が予約語にヒットしていないかチェックします
/// </summary>
/// <param name="string">チェック対象の文字列</param>
/// <returns>TRUE = それは予約語です</returns>
BOOL Reservedword_Check(char* string)
{
	// 空の文字は無視
	if( string == 0 )
		return FALSE;
	// ハッシュ値算出
	WORD	hashindex;
	hashindex = Reservedword_CalcHash(string);
	// 予約語にヒットしていないのでOK
	if (ReservedwordCatalog[hashindex].name == 0)
		return FALSE;
	// 予約語にヒットしている可能性があるので判定します
	return (strcmp(ReservedwordCatalog[hashindex].name, string) == 0);
}

