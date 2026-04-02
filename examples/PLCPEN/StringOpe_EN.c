#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "common.h"
#include "PLCPEN.h"
#include "PLCPIEC.h"

#pragma pack(push,1)

/*
* 文字列操作ファンクション
*/

/*
* 文字列が等しいか判定します
*/
PLCPEN_API void EQ_STRING_EN(PVOID instance)
{
	struct STRING_COMP_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の比較結果
	} *pin = (struct STRING_COMP_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		EQ_STRING(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pBool = *pin->IN1->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/*
* 文字列が等しくないか判定します
*/
PLCPEN_API void NE_STRING_EN(PVOID instance)
{
	struct STRING_COMP_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の比較結果
	} *pin = (struct STRING_COMP_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		NE_STRING(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pBool = *pin->IN1->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/*
* 文字列が大きいか判定します
*/
PLCPEN_API void GT_STRING_EN(PVOID instance)
{
	struct STRING_COMP_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の比較結果
	} *pin = (struct STRING_COMP_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		GT_STRING(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pBool = *pin->IN1->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/*
* 文字列が等しい または大きいか判定します
*/
PLCPEN_API void GE_STRING_EN(PVOID instance)
{
	struct STRING_COMP_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の比較結果
	} *pin = (struct STRING_COMP_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		GE_STRING(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pBool = *pin->IN1->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/*
* 文字列が小さいか判定します
*/
PLCPEN_API void LT_STRING_EN(PVOID instance)
{
	struct STRING_COMP_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の比較結果
	} *pin = (struct STRING_COMP_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LT_STRING(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pBool = *pin->IN1->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/*
* 文字列が等しい または小さいか判定します
*/
PLCPEN_API void LE_STRING_EN(PVOID instance)
{
	struct STRING_COMP_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の比較結果
	} *pin = (struct STRING_COMP_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LE_STRING(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pBool = *pin->IN1->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* BYTE値を文字列に変換します
*/
PLCPEN_API void BYTE_TO_STRING_EN(PVOID instance)
{
	struct TO_STRING_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY       OUT;		// 変換後文字列
	} *pin = (struct TO_STRING_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		BYTE_TO_STRING(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
		pin->ENO = GetStringOpeEno();	// STRING_OPE実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* WORD値を文字列に変換します
*/
PLCPEN_API void WORD_TO_STRING_EN(PVOID instance)
{
	struct TO_STRING_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY       OUT;		// 変換後文字列
	} *pin = (struct TO_STRING_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		WORD_TO_STRING(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
		pin->ENO = GetStringOpeEno();	// STRING_OPE実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* DWORD値を文字列に変換します
*/
PLCPEN_API void DWORD_TO_STRING_EN(PVOID instance)
{
	struct TO_STRING_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY       OUT;		// 変換後文字列
	} *pin = (struct TO_STRING_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DWORD_TO_STRING(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
		pin->ENO = GetStringOpeEno();	// STRING_OPE実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* SINT値を文字列に変換します
*/
PLCPEN_API void SINT_TO_STRING_EN(PVOID instance)
{
	struct TO_STRING_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY       OUT;		// 変換後文字列
	} *pin = (struct TO_STRING_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SINT_TO_STRING(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
		pin->ENO = GetStringOpeEno();	// STRING_OPE実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* INT値を文字列に変換します
*/
PLCPEN_API void INT_TO_STRING_EN(PVOID instance)
{
	struct TO_STRING_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY       OUT;		// 変換後文字列
	} *pin = (struct TO_STRING_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		INT_TO_STRING(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
		pin->ENO = GetStringOpeEno();	// STRING_OPE実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* DINT値を文字列に変換します
*/
PLCPEN_API void DINT_TO_STRING_EN(PVOID instance)
{
	struct TO_STRING_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY       OUT;		// 変換後文字列
	} *pin = (struct TO_STRING_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DINT_TO_STRING(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
		pin->ENO = GetStringOpeEno();	// STRING_OPE実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* LINT値を文字列に変換します
*/
PLCPEN_API void LINT_TO_STRING_EN(PVOID instance)
{
	struct TO_STRING_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY       OUT;		// 変換後文字列
	} *pin = (struct TO_STRING_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LINT_TO_STRING(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
		pin->ENO = GetStringOpeEno();	// STRING_OPE実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* USINT値を文字列に変換します
*/
PLCPEN_API void USINT_TO_STRING_EN(PVOID instance)
{
	struct TO_STRING_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY       OUT;		// 変換後文字列
	} *pin = (struct TO_STRING_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		USINT_TO_STRING(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
		pin->ENO = GetStringOpeEno();	// STRING_OPE実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* UINT値を文字列に変換します
*/
PLCPEN_API void UINT_TO_STRING_EN(PVOID instance)
{
	struct TO_STRING_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY       OUT;		// 変換後文字列
	} *pin = (struct TO_STRING_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UINT_TO_STRING(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
		pin->ENO = GetStringOpeEno();	// STRING_OPE実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* UDINT値を文字列に変換します
*/
PLCPEN_API void UDINT_TO_STRING_EN(PVOID instance)
{
	struct TO_STRING_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY       OUT;		// 変換後文字列
	} *pin = (struct TO_STRING_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UDINT_TO_STRING(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
		pin->ENO = GetStringOpeEno();	// STRING_OPE実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* REALを文字列に変換します
*/
PLCPEN_API void REAL_TO_STRING_EN(PVOID instance)
{
	struct TO_STRING_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY       OUT;		// 変換後文字列
	} *pin = (struct TO_STRING_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		REAL_TO_STRING(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
		pin->ENO = GetStringOpeEno();	// STRING_OPE実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* LREAL値を文字列に変換します
*/
PLCPEN_API void LREAL_TO_STRING_EN(PVOID instance)
{
	struct TO_STRING_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY       OUT;		// 変換後文字列
	} *pin = (struct TO_STRING_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LREAL_TO_STRING(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
		pin->ENO = GetStringOpeEno();	// STRING_OPE実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* TIME値を文字列に変換します
*/
PLCPEN_API void TIME_TO_STRING_EN(PVOID instance)
{
	struct TO_STRING_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY       OUT;		// 変換後文字列
	} *pin = (struct TO_STRING_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		TIME_TO_STRING(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
		pin->ENO = GetStringOpeEno();	// STRING_OPE実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 文字列を連結します
*/
PLCPEN_API void CONCAT_EN(PVOID instance)
{
	struct CONCAT_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY       OUT;		// 連結後文字列
	} *pin = (struct CONCAT_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		CONCAT(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
		pin->ENO = GetStringOpeEno();	// STRING_OPE実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 文字列の指定箇所を削除します
*/
PLCPEN_API void DELETE_STR_EN(PVOID instance)
{
	struct DELETE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY       OUT;		// 削除後文字列
	} *pin = (struct DELETE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DELETE_STR(pin->IN1, pin->IN2, pin->IN3, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
		pin->ENO = GetStringOpeEno();	// STRING_OPE実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 文字列を指定箇所に挿入します
*/
PLCPEN_API void INSERT_EN(PVOID instance)
{
	struct INSERT_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY       OUT;		// 挿入後文字列
	} *pin = (struct INSERT_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		INSERT(pin->IN1, pin->IN2, pin->IN3, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
		pin->ENO = GetStringOpeEno();	// STRING_OPE実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 文字列の左から指定文字数コピーします
*/
PLCPEN_API void LEFT_EN(PVOID instance)
{
	struct LEFT_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY       OUT;		// コピー文字列
	} *pin = (struct LEFT_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LEFT(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
		pin->ENO = GetStringOpeEno();	// STRING_OPE実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 文字列の右から指定文字数コピーします
*/
PLCPEN_API void RIGHT_EN(PVOID instance)
{
	struct LEFT_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY       OUT;		// コピー文字列
	} *pin = (struct LEFT_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		RIGHT(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
		pin->ENO = GetStringOpeEno();	// STRING_OPE実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 文字列の一部を置換します
*/
PLCPEN_API void REPLACE_EN(PVOID instance)
{
	struct REPLACE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		P_ANY		IN4;        // 入力4
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY       OUT;		// 置換後文字列
	} *pin = (struct REPLACE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		REPLACE(pin->IN1, pin->IN2, pin->IN3, pin->IN4);
		*pin->OUT->pString = *pin->IN1->pString;
		pin->ENO = GetStringOpeEno();	// STRING_OPE実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 文字列内に指定文字列があるか検索します
*/
PLCPEN_API void FIND_EN(PVOID instance)
{
	struct FIND_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 検出文字列が最初に現われる文字の位置
	} *pin = (struct FIND_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		FIND(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pInt = *pin->IN1->pInt;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* 文字列の長さを返します
*/
PLCPEN_API void LEN_EN(PVOID instance)
{
	struct LEN_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 文字列の長さ
	} *pin = (struct LEN_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LEN(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pInt = *pin->IN->pInt;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* 文字列の中央から指定文字数コピーします
*/
PLCPEN_API void MID_EN(PVOID instance)
{
	struct MID_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY       OUT;		// コピー文字列
	} *pin = (struct MID_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		MID(pin->IN1, pin->IN2, pin->IN3, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
		pin->ENO = GetStringOpeEno();	// STRING_OPE実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}