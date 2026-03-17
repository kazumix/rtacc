#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "md5.h"

#include "common.h"

// STRING型 管理
DWORD	status_string = STATUS_STOP;

/// <summary>
/// 文字列型の内容をクリアします
/// </summary>
/// <param name="dst"></param>
void String_Clear(P_STRING dst)
{
	// 文字長をゼロにします
	dst->length = 0;
	// 空の文字列になります
	strcpy(dst->string, "");
}

/// <summary>
/// 文字列型にC言語文字列を格納します
///  dst->stringが適切なバッファを指し示している必要があります
/// </summary>
/// <param name="dst"></param>
/// <param name="src"></param>
void String_Set(P_STRING dst, char* src)
{
	// ソース文字長の確認とセット
	int			len = strlen(src);
	dst->length = (len > STRING_MAX) ? STRING_MAX : len;
	// 最大長を超えないこと
	strncpy(dst->string, src ,STRING_MAX);			// 終端NULL文字も格納される
}

/// <summary>
/// C言語文字列から一時的なT_STRINGを用意します
/// </summary>
/// <param name="src"></param>
/// <returns></returns>
T_STRING String_Create(char*src)
{
	T_STRING		temporary;
	// ソースの文字長
	int			len = strlen(src);
	temporary.length = (len > STRING_MAX) ? STRING_MAX : len;
	// ソース文字をコピーします
	strncpy(temporary.string, src, len);
	// T_STRING型を返します
	return temporary;
}

/// <summary>
/// 文字列型からC言語文字列ポインタを取得します
/// </summary>
/// <param name="src"></param>
/// <returns></returns>
char* String_Get(P_STRING src)
{
	// 文字列ポインタを返します、終端NULL文字の想定です
	return src->string;
}

/// <summary>
/// 文字列型同士でコピーします
/// </summary>
/// <param name="dst"></param>
/// <param name="src"></param>
void String_Copy(P_STRING dst, P_STRING src)
{
	// 内容を複製します
	if(dst && src)
		*dst = *src;
}

/// <summary>
/// ニーモニック中の文字列宣言は命令解釈の障害になるのでパッキング加工をします
///   シングル(')又はダブルクォート(")で表現された文字列を
///   １つのトークンとして扱えるように加工処理します
/// </summary>
/// <param name="target"></param>
/// <returns>エラーコード</returns>
int String_Packing(char* target)
{
	// 文字列冒頭(')を STX(02)に置換
	// 文字列末端(')を ETX(03)に置換
	// 文字中の空白文字を SOH(01)に置換
	// 冒頭(')と末端(')が存在しないと書式がおかしいです

	// 空白行なら無処理
	if (target == 0)
		return 0;
	// 文字長を取得するが、ゼロか、１文字だけ(ブラケット片方しかないということになる)なら終了
	int		len = strlen(target);
	if (len <= 1)
		return 0;
	// 文字列冒頭ブラケットをサーチする
	char*	hit = target;
	char	*start, *end;
	start = end = NULL;
	while (*hit != '\0')
	{
		if ((*hit == '\'') || (*hit == '"'))
		{
			// 文字列冒頭ブラケットを検出したので記憶する
			start = hit;
			// 文字列終端ブラケットをバックサーチする（見つかっているスタートの１つ後ろまでの範囲）
			hit = target + len - 1;
			while (hit >= start + 1)
			{
				if ((*hit == '\'') || (*hit == '"'))
				{
					// 文字列終端ブラケットを検出したので記憶する
					end = hit;
					// 文字列ブラケット、スタート～エンドを見つけたのでサーチを終了します
					break;
				}
				// 逆方向サーチのために1文字戻る
				hit--;
			}
			// 文字列冒頭ブラケットはあったが、終端ブラケットが見つからなかったという書式エラーの状態
			if (!end)
				return STRING_FORMAT_ERR;
			// 文字列冒頭ブラケットと、終端ブラケットブレイクが見つかったのでブレイクします
			break;
		}
		// 順方向サーチのために１文字進める
		hit++;
	}
	// 文字列冒頭ブラケットと、終端ブラケットの両方が見つかった時は
	// ブラケット区間について空白文字を置換処理します
	if (start && end)
	{
		// 文字列冒頭ブラケットは STX(02)に置換します
		*start = '\x02';
		// 文字列終端ブラケットは ETX(03)に置換します
		*end = '\x03';
		// ブラケット内の空白文字を見つけてすべて SOH(01)に置換します
		hit = start + 1;
		while (hit < end)
		{
			// 空白文字を見つける
			if (*hit == ' ')
			{
				// SOH(01)に置換します
				*hit = '\x01';
			}
			// 順方向サーチのために１文字進める
			hit++;
		}
	}
	// 正常終了
	return 0;
}

/// <summary>
/// パッキングされたニーモニック中の文字列宣言をオリジナル文字列に戻します
/// </summary>
/// <param name="target"></param>
/// <returns></returns>
int String_Unpacking(char* target)
{
	// 文字列冒頭STX(02)を(')に 置換
	// 文字列末端ETX(03)を(')に置換
	// 文字中のSOH(01)を空白文字に置換

	// 空白行なら無処理
	if (target == 0)
		return 0;
	// 文字長を取得するが、ゼロか、１文字だけ(ブラケット片方しかないということになる)なら終了
	int		len = strlen(target);
	if (len <= 1)
		return 0;
	// 文字列冒頭ブラケットをサーチする
	char*	hit = target;
	char	*start, *end;
	start = end = NULL;
	while (*hit != '\0')
	{
		if (*hit == '\x02')
		{
			// 文字列冒頭ブラケットを検出したので記憶する
			start = hit;
			// 文字列終端ブラケットをバックサーチする（見つかっているスタートの１つ後ろまでの範囲）
			hit = target + len - 1;
			while (hit >= start + 1)
			{
				if (*hit == '\x03')
				{
					// 文字列終端ブラケットを検出したので記憶する
					end = hit;
					// 文字列ブラケット、スタート～エンドを見つけたのでサーチを終了します
					break;
				}
				// 逆方向サーチのために1文字戻る
				hit--;
			}
			// 文字列冒頭ブラケットはあったが、終端ブラケットが見つからなかったという書式エラーの状態
			if (!end)
				return STRING_FORMAT_ERR;
			// 文字列冒頭ブラケットと、終端ブラケットブレイクが見つかったのでブレイクします
			break;
		}
		// 順方向サーチのために１文字進める
		hit++;
	}
	// 文字列冒頭ブラケットと、終端ブラケットの両方が見つかった時は
	// ブラケット区間について空白文字を置換処理します
	if (start && end)
	{
		// 文字列冒頭ブラケットは シングルクォートに復元します
		*start = '\'';
		// 文字列終端ブラケットは シングルクォートに復元します
		*end = '\'';
		// ブラケット内の空白文字を見つけてすべて ' 'に復元します
		hit = start + 1;
		while (hit < end)
		{
			// 空白文字を見つける
			if (*hit == '\x01')
			{
				// スペース文字に復元します
				*hit = ' ';
			}
			// 順方向サーチのために１文字進める
			hit++;
		}
	}
	// 正常終了
	return 0;
}
