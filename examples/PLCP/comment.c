#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"


// コメント構文のネスト深さ管理用、ロード前（オープン時）にゼロクリアすること
static int	commentnest;


void Comment_ClearNest(void)
{
	// ネスト深さをゼロクリアしておく
	commentnest = 0;
}

/// <summary>
/// 渡された文字列のコメントブラケット'(*'または'*)'の出現を探します
///		0 = コメントブラケット見つからない
///		1 = コメントブラケットのスタート、strはブラケットの後ろを示します
///		2 = コメントブラケットのエンド、strはブラケットの後ろを示します
/// </summary>
/// <param name="str"></param>
/// <returns></returns>
int Comment_SearchBracket(char *str, char **found)
{
	while (*str != '\0')
	{
		// コメントスタートブラケットの検索
		if (*str == '(')
		{
			if (*(str + 1) == '*')
			{
				// 検出位置を記録
				*found = str;
				return 1;
			}
		}
		// コメントエンドブラケットの検索
		else if (*str == '*')
		{
			if (*(str + 1) == ')')
			{
				// 検出位置を記録
				*found = str;
				return 2;
			}
		}
		// 次の文字へ進める
		str++;
	}
	// 合致しませんでした
	*found = NULL;
	return 0;
}

/// <summary>
/// 文字列行内のコメント構文を解釈・処理します
/// </summary>
/// <param name="str"></param>
void Comment_ProcessBracket(char *str)
{
	char		*line = str;		// オリジナルstrは保持して作業にはこちらを使用
	char		*hit;
	int			match;
	char		*common, *commoff;
	int			len;
	common = commoff = NULL;
	while (1)
	{
		// コメントブラケットを探します
		match = Comment_SearchBracket(line, &hit);
		if (match == 0)
		{
			// 行内にコメントブラケットはこれ以上ありませんのでブレイク
			break;
		}
		else if (match == 1)
		{
			// ネスト深さcommentnest増加
			commentnest++;
			// ネスト１スタートブラケットが見つかった
			if (commentnest == 1)
			{
				// コメントの開始位置を記録
				common = hit;
			}
			// 次の処理開始位置を調整、ブラケットキャップ２文字加える
			line = hit + 2;
		}
		else if (match == 2)
		{
			// ネスト深さcommentnest減少
			commentnest--;
			// ネスト０エンドブラケットが見つかった
			if (commentnest == 0)
			{
				// コメントの終了位置を記録、ブラケット'*)'の後ろ１文字を示す
				commoff = hit + 1;
			}
			// 次の処理開始位置を調整、ブラケットキャップ２文字加える
			line = hit + 2;
		}

		if (common && commoff)
		{
			// 行内にコメントスタートとコメントエンドが揃った場合、区間を空白で埋めます
			len = commoff - common + 1;
			memset(common, ' ', len);
			//
			common = commoff = NULL;
		}
	}
	// 行内の処理が終わった。以前の行までのコメントネスト状況を見て反映する
	if (common)
	{
		// コメントスタートだけ見つかった場合、行末迄無効なので、切り詰める
		*common = '\0';
	}
	else if (commoff)
	{
		// コメントエンドだけ見つかった場合、行頭からエンド迄無効なので、空白で埋める
		len = commoff - str + 1;
		memset(str, ' ', len);
	}
	else if (commentnest > 0)
	{
		// コメントスタートもエンドも見つからず、ネスト区間中の行はすべて無視
		*str = '\0';
	}
}

