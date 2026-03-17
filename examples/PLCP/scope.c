#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

// 変数スコープの管理


char		scope[128] = "";
char		scopedvariable[128] = "";

/// <summary>
/// 変数スコープの設定、戻りはスレッドセーフではない
/// </summary>
/// <param name="string"></param>
/// <returns></returns>
char* Scope_set(char* string)
{
	if (string == NULL)
	{
		// グオーバルスコープをセット
		strcpy_s(scope, sizeof(scope), "");
	}
	else
	{
		// スコープをセット
		strcpy_s(scope, sizeof(scope), string);
	}
	// 現在のスコープを返す
	return Scope_get();
}

/// <summary>
/// 現在の変数スコープを返す、戻りはスレッドセーフではない
/// </summary>
/// <returns></returns>
char* Scope_get(void)
{
	return scope;
}

/// <summary>
/// 与えられた変数名にスコープを連結した文字列を返します。
/// 戻りバッファは一時的なもので、しかもスレッドセーフではない
/// 
///  global → global									グローバルスコープに居る時は変わりません
///  INT#global → INT#global							変数型指定付きでもグローバルスコープに居る時は変わりません
///  FUNCTION#TON#test → FUCTION#TON#test				ファンクションブロックの場合でも、グローバルスコープに居る時は変わりません
/// 
///  variable → scope.variable							スコープ内に居る時、スコープが連結されます
///  INT#variable → INT#scope.variable					変数型指定付きの場合は、このような挿入になります
///  FUNCTION#TON#test → FUCTION#TON#scope.test			ファンクションブロックの場合は、このような挿入になります
/// 
/// </summary>
/// <param name="name"></param>
/// <returns></returns>
char* Scope_variable(char* name)
{
	char* result;
	// グローバルスコープとそれ以外で分岐します
	if (strlen(scope) != 0)
	{
		result = scopedvariable;
		// 変数型指定付きを想定して、最後の # を探します
		char* insertpoint = strrchr(name, '#');
		if (insertpoint)
		{
			// ベース部分の文字長を算出
			int		baselength = insertpoint + 1 - name;
			// ベース部分をコピーします
			strncpy_s(scopedvariable, sizeof(scopedvariable), name, baselength);
			scopedvariable[baselength] = '\0';
			// 挿入する文字列
			strcat_s(scopedvariable, sizeof(scopedvariable), scope);
			// スコープのドット区切り
			strcat_s(scopedvariable, sizeof(scopedvariable), ".");
			// 残りの文字列を連結
			strcat_s(scopedvariable, sizeof(scopedvariable), name + baselength );
		}
		else
		{
			// グローバルスコープ以外では、受け取った変数名にスコープを連結した文字列を作ります
			strcpy_s(scopedvariable, sizeof(scopedvariable), scope);
			// スコープのドット区切り
			strcat_s(scopedvariable, sizeof(scopedvariable), ".");
			// 元々の変数名
			strcat_s(scopedvariable, sizeof(scopedvariable), name);
		}
	}
	else
	{
		// グローバルスコープの場合、そのまま加工せずに返します
		result = name;
	}

	return result;
}
