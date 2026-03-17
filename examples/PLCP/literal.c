#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

/// <summary>
/// タイム型リテラル(T#)の解釈
/// </summary>
/// <param name="string"></param>
/// <returns></returns>
union ANYVAL Literal_StrTime(char* string)
{
	union ANYVAL	val = { 0 };
	struct LITERALTIME
	{
		char*			name;
		int				msecs;
	} keyword[] = {
		{"d"			,24*60*60*1000		},
		{"D"			,24 * 60 * 60 * 1000		},
		{"h"			,60*60*1000		},
		{"H"			,60 * 60 * 1000		},
		{"m"			,60*1000	},
		{"M"			,60 * 1000	},
		{"s"			,1*1000	},
		{"S"			,1 * 1000	},
		{"ms"			,1		},
		{"MS"			,1		},
		{0}
	};
	struct LITERALTIME*		current;
	char clone1[80];
	char clone2[80];
	strcpy(clone1, string);
	strcpy(clone2, string);
	char *element1[5] = { 0 };
	char *element2[5] = { 0 };
	int	numelement1 = 0;
	int numelement2 = 0;
	char* tok;
	char* target;
	int	lp1;

	// 数値トークンを抽出します
	target = clone1;
	for (lp1 = 0; lp1 < sizeof(element1) / sizeof(char*); lp1++)
	{
		// デリミタ"d-m-s-ms"を指定して数値トークンを抽出します
		tok = strtok(target, "dDhHmMsS");
		// 見つからないならブレイク
		if (tok == NULL)
			break;
		// element1へトークンを記憶しておきます max [0]～[4]
		element1[numelement1] = tok;
		numelement1++;
		target = NULL;
	}
	// 単位トークンを抽出します
	target = clone2;
	for (lp1 = 0; lp1 < sizeof(element2) / sizeof(char*); lp1++)
	{
		// デリミタ"0～9"を指定して単位トークンを抽出します
		tok = strtok(target, "0123456789");
		// 見つからないならブレイク
		if (tok == NULL)
			break;
		// element2へトークンをしておきます max [0]～[4]
		element2[numelement2] = tok;
		numelement2++;
		target = NULL;
	}
	// 一つも検出できないのはおかしい
	if((numelement1 == 0) || (numelement2==0))
	{
		Errorlog_Add(0, TIMEFORMAT_ERR, "time format unit not found error.");
		return val;
	}
	// 数値と単位はペア(例"3ms")なので、数値トークンと単位トークンの数が合わないとおかしい
	if (numelement1 != numelement2)
	{
		Errorlog_Add(0, TIMEFORMAT_ERR, "time format unit pair error.");
		return val;
	}
	// トークン0～4の有効リストと、マッチ対象リストを照合してtime値を作り上げます
	current = &keyword[0];
	for (lp1 = 0; (lp1 < sizeof(element1) / sizeof(char*)) && (element1[lp1] != NULL); lp1++)
	{
		// マッチ対象リストすべてと照合する
		while (current->name != 0)
		{
			// 単位がキーワードにマッチしたら
			if (strcmp(element2[lp1], current->name) == 0)
			{
				// マッチしたら、単位ごとの倍率をかけます
				val.ullVal += (atoi(element1[lp1]) * current->msecs);
				// マッチしたので次のトークンを処理（d-h-m-s-msの順なのでマッチ対象リスト先頭には戻らないcurrentの値は維持する）
				break;
			}
			// 次のマッチ対象のリストエントリへ進める
			current++;
		}
		// 単位がマッチ対象リストと一致しなかった（リストの終端を示す）場合は書式エラーです
		if (current->name == 0)
		{
			Errorlog_Add(0, TIMEFORMAT_ERR, "time format unknown unit error.");
			return val;
		}
	}
	// 値を返す
	return val;
}


/// <summary>
/// 進数指定リテラルの解釈。"16#FFFF"など。進数指定の次の文字ポインタ(nextstring)を返します
/// </summary>
/// <param name="string"></param>
/// <param name="nextstring"></param>
/// <returns>2,8,10,16(進数)を返します</returns>
int Literal_StrBase(char* string, char **nextstring)
{
	int		base;
	size_t	length;
	struct LITERALBASE
	{
		char*			name;
		int				base;
	} keyword[] = {
		{"2#"			,2		},
		{"8#"			,8		},
		{"10#"			,10		},
		{"16#"			,16		},
		{0}
	};
	struct LITERALBASE*	current = &keyword[0];

	// ヒットしない時の戻り情報
	base = 10;						// デフォルト１０進数です
	*nextstring = string;

	// リストのすべてをサーチします
	while (current->name != 0)
	{
		// キーワード文字長を取得します
		length = strlen(current->name);
		// キーワードにマッチしたら
		if (strncmp(string, current->name, length) == 0)
		{
			// 進数
			base = current->base;
			// 次の文字ポインタに進める
			*nextstring = string + length;
			// マッチしたので終了
			break;
		}
		// 次のエントリ
		current++;
	}

	// 判定した数字の進数を返します
	return base;
}

union ANYVAL Literal_Strbool(char* src)
{
	union ANYVAL val = { 0 };
	if (strcmp(src, "TRUE") == 0)
		val.boolVal = 1;
	else if (strcmp(src, "true") == 0)
		val.boolVal = 1;
	else if (strcmp(src, "FALSE") == 0)
		val.boolVal = 0;
	else if (strcmp(src, "false") == 0)
		val.boolVal = 0;
	else if (strcmp(src, "1") == 0)
		val.boolVal = 1;
	else if (strcmp(src, "0") == 0)
		val.boolVal = 0;
	else
		val.boolVal = 0;
	return val;
}

union ANYVAL Literal_Strtoq(char* src)
{
	union ANYVAL val = { 0 };
	char			*endptr;
	int				base;
	base = Literal_StrBase(src, &src);
	val.llVal = strtoll(src, &endptr, base);
	return val;
}

union ANYVAL Literal_Strtouq(char* src)
{
	union ANYVAL val = { 0 };
	char			*endptr;
	int				base;
	base = Literal_StrBase(src, &src);
	val.ullVal = strtoull(src, &endptr, base);
	return val;
}

union ANYVAL Literal_Strtol(char* src )
{
	union ANYVAL val = { 0 };
	char			*endptr;
	int				base;
	base = Literal_StrBase(src, &src);
	val.llVal = (long)strtol(src, &endptr, base);
	return val;
}

union ANYVAL Literal_Strtoul(char* src)
{
	union ANYVAL val = { 0 };
	char			*endptr;
	int				base;
	base = Literal_StrBase(src, &src);
	val.ullVal = (unsigned long)strtoul(src, &endptr, base);
	return val;
}

union ANYVAL Literal_Strtoi(char* src)
{
	union ANYVAL val = { 0 };
	char			*endptr;
	int				base;
	base = Literal_StrBase(src, &src);
	val.llVal = (short)strtol(src, &endptr, base);
	return val;
}

union ANYVAL Literal_Strtoui(char* src)
{
	union ANYVAL val = { 0 };
	char			*endptr;
	int				base;
	base = Literal_StrBase(src, &src);
	val.ullVal = (unsigned short)strtoul(src, &endptr, base);
	return val;
}

union ANYVAL Literal_Strtos(char* src)
{
	union ANYVAL val = { 0 };
	char			*endptr;
	int				base;
	base = Literal_StrBase(src, &src);
	val.llVal = (char)strtol(src, &endptr, base);
	return val;
}

union ANYVAL Literal_Strtous(char* src)
{
	union ANYVAL val = { 0 };
	char			*endptr;
	int				base;
	base = Literal_StrBase(src, &src);
	val.ullVal = (unsigned char)strtoul(src, &endptr, base);
	return val;
}

union ANYVAL Literal_Strtod(char* src)
{
	union ANYVAL val = { 0 };
	char			*endptr;
	val.dblVal = strtod(src, &endptr);
	return val;
}

union ANYVAL Literal_Strtof(char* src)
{
	union ANYVAL val = { 0 };
	char			*endptr;
	val.fltVal = strtof(src, &endptr);
	return val;
}

union ANYVAL Literal_True(char* src)
{
	union ANYVAL val = { 0 };
	val.ullVal = (BOOL)TRUE;
	return val;
}

union ANYVAL Literal_False(char* src)
{
	union ANYVAL val = { 0 };
	val.ullVal = (BOOL)FALSE;
	return val;
}

union ANYVAL Literal_String(char* src)
{
	int	len;
	union ANYVAL val = { 0 };
	// 文字長の計算
	len = strlen(src) -1 ;		// 文字列リテラル終端ブラケット(')を差し引きます
	len = (len > STRING_MAX) ? STRING_MAX : len;
	// 文字列バッファヒープを新たに確保します
	val.pStr = (T_STRING*)Variable_Body( sizeof(T_STRING) );
	// 文字列をコピーして保持します
	strncpy(val.pStr->string, src ,len);
	// 文字長を保持します
	val.pStr->length = len;
	return val;
}

/// <summary>
/// リテラルに該当するが判定して、該当ならば分岐処理します
/// </summary>
/// <param name="string"></param>
/// <param name="out"></param>
/// <returns>返却されるP_ANYは定数なので書換禁止！</returns>
P_ANY Literal_Compile(char* string)
{
	// 空白なら無処理
	if (string == 0)
	{
		// マッチしませんでした
		return (P_ANY)NULL;
	}

	// 整数リテラル		　			-12	0  123456  +986
	// 実数リテラル					-12.0  0.0  0.4560  3.1415926
	// 指数付き実数リテラル　			-1.34E-12  -1.34e-12  1.0E+6
	// ブール FALSE 0 と 1			0  1

	// ロング実数リテラル				LREAL#-12.0  lreal#+13.1
	// 指数付きロング実数リテラル		LREAL#2.3E-89  lreal#-2.31e-8
	// ２進リテラル					INT#2#11111111  int#2#011
	// ８進リテラル					INT#8#377
	// 16進数リテラル					INT#16#FF  SINT#16#ff
	// ブール FALSE と TRUE			FALSE  TRUE
	// 文字列リテラル					空文字列''  空白付き文字列' ' 空でない文字列'これは文字です'
	// 短い接頭語持続リテラル			T#14ms  t#14ms  t#12h  t#18s  t#2.5ms  T#25h_15m  t#25h_15m
	// 長い接頭語持続リテラル			TIME#14ms  time#14ms  TIME#25h_15m  time#25h_15m	
	// 日付リテラル
	//								DATE#1996-01-24
	//								date#1996-01-24
	//								D#1996-01-24
	//								d#1996-01-24
	// 時刻リテラル
	//								TIME_OF_DAY#15:36:55.36
	//								time_of_day#15:36:55.36
	//								TOD#15:36:55.36
	//								tod#15:36:55.36
	// 日付と時刻
	//								DATE_AND_TIME#1996-01-24-15:36:55.36
	//								date_and_time#1996-01-24-15:36:55.36
	//								DT#1996-01-24-15:36:55.36
	//								dt#1996-01-24-15:36:55.36

	BOOL			matchliteral = FALSE;
	T_TYPE			type;
	union ANYVAL	localval = { 0 };
	size_t			length;
	struct LITERALKEYWORD
	{
		char*			name;
		T_TYPE			type;
		union ANYVAL	(*compile)(char* string);
	} keyword[] = {
		{"BOOL#"			,D_BOOL		,Literal_Strbool	},
		{"LINT#"			,D_LINT		,Literal_Strtoq		},
		{"DINT#"			,D_DINT		,Literal_Strtol		},
		{"INT#"				,D_INT		,Literal_Strtoi		},
		{"SINT#"			,D_SINT		,Literal_Strtos		},
		{"ULINT#"			,D_ULINT	,Literal_Strtouq	},
		{"UDINT#"			,D_UDINT	,Literal_Strtoul	},
		{"UINT#"			,D_UINT		,Literal_Strtoui	},
		{"USINT#"			,D_USINT	,Literal_Strtous	},
		{"QWORD#"			,D_QWORD	,Literal_Strtouq	},
		{"DWORD#"			,D_DWORD	,Literal_Strtoul	},
		{"WORD#"			,D_WORD		,Literal_Strtoui	},
		{"BYTE#"			,D_BYTE		,Literal_Strtous	},
		{"LREAL#"			,D_LREAL	,Literal_Strtod		},
		{"REAL#"			,D_REAL		,Literal_Strtof		},
		{"TIME#"			,D_TIME		,Literal_StrTime	},
		{"T#"				,D_TIME		,Literal_StrTime	},
		{"TRUE"				,D_BOOL		,Literal_True		},
		{"FALSE"			,D_BOOL		,Literal_False		},
		{"STRING#'"			,D_STRING	,Literal_String		},
		{"bool#"			,D_BOOL		,Literal_Strbool	},
		{"lint#"			,D_LINT		,Literal_Strtoq		},
		{"dint#"			,D_DINT		,Literal_Strtol		},
		{"int#"				,D_INT		,Literal_Strtoi		},
		{"sint#"			,D_SINT		,Literal_Strtos		},
		{"ulint#"			,D_ULINT	,Literal_Strtouq	},
		{"udint#"			,D_UDINT	,Literal_Strtoul	},
		{"uint#"			,D_UINT		,Literal_Strtoui	},
		{"usint#"			,D_USINT	,Literal_Strtous	},
		{"qword#"			,D_QWORD	,Literal_Strtouq	},
		{"dword#"			,D_DWORD	,Literal_Strtoul	},
		{"word#"			,D_WORD		,Literal_Strtoui	},
		{"byte#"			,D_BYTE		,Literal_Strtous	},
		{"lreal#"			,D_LREAL	,Literal_Strtod		},
		{"real#"			,D_REAL		,Literal_Strtof		},
		{"time#"			,D_TIME		,Literal_StrTime	},
		{"t#"				,D_TIME		,Literal_StrTime	},
		{"true"				,D_BOOL		,Literal_True		},
		{"false"			,D_BOOL		,Literal_False		},
		{"string#'"			,D_STRING	,Literal_String		},
		{0}
	};
	struct LITERALKEYWORD	*current = &keyword[0];

	// キーワードリストのすべてとの一致をサーチします
	while (current->name != 0)
	{
		// キーワード文字長を取得します
		length = strlen(current->name);
		// キーワードにマッチしたら
		if( strncmp(string ,current->name ,length) == 0 )
		{
			// 定数なのに変数スコープ付きになることがある。だったらそれは読み飛ばします　"myUF.33" → "33"
			size_t	scopelen = strlen(Scope_get());
			if (scopelen > 0)
				length = length + scopelen + 1;		// "."も加味します

			// 一致したキーワードごとの変換関数をコール
			matchliteral = TRUE;
			type = current->type;
			localval = current->compile(string + length);
			// マッチしたので終了
			break;
		}
		// 次のエントリ
		current++;
	}

	// リテラルキーワードに一致しましたか？
	if (matchliteral)
	{
		// PLC変数を追加します。書換禁止の固定値を持ちます
		P_ANY newliteral = Variable_Add(string ,type);
		newliteral->realonly = TRUE;
		// 文字列では既に body が作られているので分岐します
		if (type == D_STRING)
		{
			// 値ボディを参照
			newliteral->pString = localval.pStr;
		}
		else
		{
			// 値ボディを作る
			union ANYVAL* body = Variable_Body(sizeof(union ANYVAL));
			// 値を格納する
			Variable_Copy64(body, &localval);
			// 値ボディを結合する
			newliteral->pVal = body;
		}
		// 生成したリテラルを返します
		return newliteral;
	}

	// マッチしませんでした
	return (P_ANY)NULL;
}
