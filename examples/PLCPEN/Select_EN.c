#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "common.h"
#include "PLCPEN.h"
#include "PLCPIEC.h"

#pragma pack(push,1)

//
// 選択ファンクション実装
//

/*
* 2つの入力値のうち、大きい方を返します
*/
PLCPEN_API void MAX_EN(PVOID instance)
{
	struct MAX_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 入力1と入力2の大きい方の値
	} *pin = (struct MAX_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		MAX(pin->IN1, pin->IN2, NULL, NULL);	// MAX呼出

		if (pin->ENO = GetSelectEno())	// SELECT実行結果ENO設定
		{
			switch (pin->IN1->Type)
			{
				// データ型に応じて結果をキャストして格納
			case D_REAL:	*pin->OUT->pReal = *pin->IN1->pReal;	break;
			case D_LREAL:	*pin->OUT->pLreal = *pin->IN1->pLreal;	break;
			case D_SINT:	*pin->OUT->pSint = *pin->IN1->pSint;	break;
			case D_INT:		*pin->OUT->pInt = *pin->IN1->pInt;	break;
			case D_DINT:	*pin->OUT->pDint = *pin->IN1->pDint;	break;
			case D_LINT:	*pin->OUT->pLint = *pin->IN1->pLint;	break;
			case D_USINT:
			case D_BYTE:	*pin->OUT->pUsint = *pin->IN1->pUsint;	break;
			case D_UINT:
			case D_WORD:	*pin->OUT->pUint = *pin->IN1->pUint;	break;
			case D_TIME:
			case D_UDINT:
			case D_DWORD:	*pin->OUT->pUdint = *pin->IN1->pUdint;	break;
			case D_ULINT:	*pin->OUT->pUlint = *pin->IN1->pUlint;	break;
			case D_STRING:  *pin->OUT->pString = *pin->IN1->pString;	break;
			}
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 2つの入力値のうち、大きい方を返します(REAL型)
*/
PLCPEN_API void MAX_REAL_EN(PVOID instance)
{
	struct MAX_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 入力1と入力2の大きい方の値
	} *pin = (struct MAX_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		MAX_REAL(pin->IN1, pin->IN2, NULL, NULL);	// MAX_REAL呼出

		if (pin->ENO = GetSelectEno())	// SELECT実行結果ENO設定
		{
			*pin->OUT->pReal = *pin->IN1->pReal;
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 2つの入力値のうち、大きい方を返します(LREAL型)
*/
PLCPEN_API void MAX_LREAL_EN(PVOID instance)
{
	struct MAX_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 入力1と入力2の大きい方の値
	} *pin = (struct MAX_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		MAX_LREAL(pin->IN1, pin->IN2, NULL, NULL);	// MAX_LREAL呼出

		if (pin->ENO = GetSelectEno())	// SELECT実行結果ENO設定
		{
			*pin->OUT->pLreal = *pin->IN1->pLreal;
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 2つの入力値のうち、大きい方を返します(SINT型)
*/
PLCPEN_API void MAX_SINT_EN(PVOID instance)
{
	struct MAX_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の大きいほうの値
	} *pin = (struct MAX_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		MAX_SINT(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pSint = *pin->IN1->pSint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/*
* 2つの入力値のうち、大きい方を返します(INT型)
*/
PLCPEN_API void MAX_INT_EN(PVOID instance)
{
	struct MAX_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の大きいほうの値
	} *pin = (struct MAX_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		MAX_INT(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pInt = *pin->IN1->pInt;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/*
* 2つの入力値のうち、大きい方を返します(DINT型)
*/
PLCPEN_API void MAX_DINT_EN(PVOID instance)
{
	struct MAX_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の大きいほうの値
	} *pin = (struct MAX_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		MAX_DINT(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pDint = *pin->IN1->pDint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/*
* 2つの入力値のうち、大きい方を返します(LINT型)
*/
PLCPEN_API void MAX_LINT_EN(PVOID instance)
{
	struct MAX_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の大きいほうの値
	} *pin = (struct MAX_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		MAX_LINT(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pLint = *pin->IN1->pLint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}


/*
* 2つの入力値のうち、大きい方を返します(STRING型)
* (STRING型用)
*/
PLCPEN_API void MAX_STR_EN(PVOID instance)
{
	struct MAX_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の大きいほうの値
	} *pin = (struct MAX_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		MAX_STR(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}


/*
* 2つの入力値のうち、小さい方を返します
*/
PLCPEN_API void MIN_EN(PVOID instance)
{
	struct MIN_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 入力1と入力2の小さい方の値
	} *pin = (struct MIN_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		MIN(pin->IN1, pin->IN2, NULL, NULL);	// MIN呼出

		if (pin->ENO = GetSelectEno())	// SELECT実行結果ENO設定
		{
			switch (pin->IN1->Type)
			{
				// データ型に応じて結果をキャストして格納
			case D_REAL:	*pin->OUT->pReal = *pin->IN1->pReal;	break;
			case D_LREAL:	*pin->OUT->pLreal = *pin->IN1->pLreal;	break;
			case D_SINT:	*pin->OUT->pSint = *pin->IN1->pSint;	break;
			case D_INT:		*pin->OUT->pInt = *pin->IN1->pInt;	break;
			case D_DINT:	*pin->OUT->pDint = *pin->IN1->pDint;	break;
			case D_LINT:	*pin->OUT->pLint = *pin->IN1->pLint;	break;
			case D_USINT:
			case D_BYTE:	*pin->OUT->pUsint = *pin->IN1->pUsint;	break;
			case D_UINT:
			case D_WORD:	*pin->OUT->pUint = *pin->IN1->pUint;	break;
			case D_TIME:
			case D_UDINT:
			case D_DWORD:	*pin->OUT->pUdint = *pin->IN1->pUdint;	break;
			case D_ULINT:	*pin->OUT->pUlint = *pin->IN1->pUlint;	break;
			case D_STRING:  *pin->OUT->pString = *pin->IN1->pString;	break;
			}
		}			
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 2つの入力値のうち、小さい方を返します(REAL型)
*/
PLCPEN_API void MIN_REAL_EN(PVOID instance)
{
	struct MIN_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 入力1と入力2の小さい方の値
	} *pin = (struct MIN_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		MIN_REAL(pin->IN1, pin->IN2, NULL, NULL);	// MIN_REAL呼出

		if (pin->ENO = GetSelectEno())	// SELECT実行結果ENO設定
		{
			*pin->OUT->pReal = *pin->IN1->pReal;
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 2つの入力値のうち、小さい方を返します(LREAL型)
*/
PLCPEN_API void MIN_LREAL_EN(PVOID instance)
{
	struct MIN_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 入力1と入力2の小さい方の値
	} *pin = (struct MIN_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		MIN_LREAL(pin->IN1, pin->IN2, NULL, NULL);	// MIN_LREAL呼出

		if (pin->ENO = GetSelectEno())	// SELECT実行結果ENO設定
		{
			*pin->OUT->pLreal = *pin->IN1->pLreal;
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 2つの入力値のうち、小さい方を返します(SINT型)
*/
PLCPEN_API void MIN_SINT_EN(PVOID instance)
{
	struct MIN_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の小さいほうの値
	} *pin = (struct MIN_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		MIN_SINT(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pSint = *pin->IN1->pSint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/*
* 2つの入力値のうち、小さい方を返します(INT型)
*/
PLCPEN_API void MIN_INT_EN(PVOID instance)
{
	struct MIN_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の小さいほうの値
	} *pin = (struct MIN_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		MIN_INT(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pInt = *pin->IN1->pInt;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/*
* 2つの入力値のうち、小さい方を返します(DINT型)
*/
PLCPEN_API void MIN_DINT_EN(PVOID instance)
{
	struct MIN_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の小さいほうの値
	} *pin = (struct MIN_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		MIN_DINT(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pDint = *pin->IN1->pDint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/*
* 2つの入力値のうち、小さい方を返します(LINT型)
*/
PLCPEN_API void MIN_LINT_EN(PVOID instance)
{
	struct MIN_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の小さいほうの値
	} *pin = (struct MIN_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		MIN_LINT(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pLint = *pin->IN1->pLint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* 2つの入力値のうち、小さい方を返します(STRING型)
*/
PLCPEN_API void MIN_STR_EN(PVOID instance)
{
	struct MIN_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の小さいほうの値
	} *pin = (struct MIN_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		MIN_STR(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します
*/
PLCPEN_API void SEL_EN(PVOID instance)
{
	struct SEL_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 入力2もしくは入力3
	} *pin = (struct SEL_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SEL(pin->IN1, pin->IN2, pin->IN3, NULL);	// SEL呼出

		if (pin->ENO = GetSelectEno())	// SELECT実行結果ENO設定
		{
			switch (pin->IN2->Type)
			{
				// データ型に応じて結果をキャストして格納
			case D_REAL:	*pin->OUT->pReal = *pin->IN1->pReal;	break;
			case D_LREAL:	*pin->OUT->pLreal = *pin->IN1->pLreal;	break;
			case D_SINT:	*pin->OUT->pSint = *pin->IN1->pSint;	break;
			case D_INT:		*pin->OUT->pInt = *pin->IN1->pInt;	break;
			case D_DINT:	*pin->OUT->pDint = *pin->IN1->pDint;	break;
			case D_LINT:	*pin->OUT->pLint = *pin->IN1->pLint;	break;
			case D_USINT:
			case D_BYTE:	*pin->OUT->pUsint = *pin->IN1->pUsint;	break;
			case D_UINT:
			case D_WORD:	*pin->OUT->pUint = *pin->IN1->pUint;	break;
			case D_TIME:
			case D_UDINT:
			case D_DWORD:	*pin->OUT->pUdint = *pin->IN1->pUdint;	break;
			case D_ULINT:	*pin->OUT->pUlint = *pin->IN1->pUlint;	break;
			case D_STRING:  *pin->OUT->pString = *pin->IN1->pString;	break;
			}
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(BOOL型)
*/
PLCPEN_API void SEL_BOOL_EN(PVOID instance)
{
	struct SEL_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 入力2もしくは入力3
	} *pin = (struct SEL_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SEL_BOOL(pin->IN1, pin->IN2, pin->IN3, NULL);
		*pin->OUT->pBool = *pin->IN1->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(BYTE型)
*/
PLCPEN_API void SEL_BYTE_EN(PVOID instance)
{
	struct SEL_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 入力2もしくは入力3
	} *pin = (struct SEL_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SEL_BYTE(pin->IN1, pin->IN2, pin->IN3, NULL);
		*pin->OUT->pByte = *pin->IN1->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(WORD型)
*/
PLCPEN_API void SEL_WORD_EN(PVOID instance)
{
	struct SEL_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 入力2もしくは入力3
	} *pin = (struct SEL_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SEL_WORD(pin->IN1, pin->IN2, pin->IN3, NULL);
		*pin->OUT->pWord = *pin->IN1->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(DWORD型)
*/
PLCPEN_API void SEL_DWORD_EN(PVOID instance)
{
	struct SEL_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 入力2もしくは入力3
	} *pin = (struct SEL_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SEL_DWORD(pin->IN1, pin->IN2, pin->IN3, NULL);
		*pin->OUT->pDword = *pin->IN1->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(TIME型)
*/
PLCPEN_API void SEL_TIME_EN(PVOID instance)
{
	struct SEL_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 入力2もしくは入力3
	} *pin = (struct SEL_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SEL_TIME(pin->IN1, pin->IN2, pin->IN3, NULL);
		*pin->OUT->pTime = *pin->IN1->pTime;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(SINT型)
*/
PLCPEN_API void SEL_SINT_EN(PVOID instance)
{
	struct SEL_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 入力2もしくは入力3
	} *pin = (struct SEL_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SEL_SINT(pin->IN1, pin->IN2, pin->IN3, NULL);
		*pin->OUT->pSint = *pin->IN1->pSint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(INT型)
*/
PLCPEN_API void SEL_INT_EN(PVOID instance)
{
	struct SEL_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 入力2もしくは入力3
	} *pin = (struct SEL_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SEL_INT(pin->IN1, pin->IN2, pin->IN3, NULL);
		*pin->OUT->pInt = *pin->IN1->pInt;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(DINT型)
*/
PLCPEN_API void SEL_DINT_EN(PVOID instance)
{
	struct SEL_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 入力2もしくは入力3
	} *pin = (struct SEL_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SEL_DINT(pin->IN1, pin->IN2, pin->IN3, NULL);
		*pin->OUT->pDint = *pin->IN1->pDint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(LINT型)
*/
PLCPEN_API void SEL_LINT_EN(PVOID instance)
{
	struct SEL_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 入力2もしくは入力3
	} *pin = (struct SEL_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SEL_LINT(pin->IN1, pin->IN2, pin->IN3, NULL);	
		*pin->OUT->pLint = *pin->IN1->pLint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(REAL型)
*/
PLCPEN_API void SEL_REAL_EN(PVOID instance)
{
	struct SEL_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 入力2もしくは入力3
	} *pin = (struct SEL_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SEL_REAL(pin->IN1, pin->IN2, pin->IN3, NULL);

		if (pin->ENO = GetSelectEno())	// SELECT実行結果ENO設定
		{
			*pin->OUT->pReal = *pin->IN1->pReal;
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}
/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(LREAL型)
*/
PLCPEN_API void SEL_LREAL_EN(PVOID instance)
{
	struct SEL_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 入力2もしくは入力3
	} *pin = (struct SEL_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SEL_LREAL(pin->IN1, pin->IN2, pin->IN3, NULL);

		if (pin->ENO = GetSelectEno())	// SELECT実行結果ENO設定
		{
			*pin->OUT->pLreal = *pin->IN1->pLreal;
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
*/
PLCPEN_API void LIMIT_EN(PVOID instance)
{
	struct LIMIT_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 最小値～最大値
	} *pin = (struct LIMIT_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LIMIT(pin->IN1, pin->IN2, pin->IN3, NULL);	// LIMIT呼出

		if (pin->ENO = GetSelectEno())	// SELECT実行結果ENO設定
		{
			switch (pin->IN2->Type)
			{
				// データ型に応じて結果をキャストして格納
			case D_REAL:	*pin->OUT->pReal = *pin->IN1->pReal;	break;
			case D_LREAL:	*pin->OUT->pLreal = *pin->IN1->pLreal;	break;
			case D_SINT:	*pin->OUT->pSint = *pin->IN1->pSint;	break;
			case D_INT:		*pin->OUT->pInt = *pin->IN1->pInt;	break;
			case D_DINT:	*pin->OUT->pDint = *pin->IN1->pDint;	break;
			case D_LINT:	*pin->OUT->pLint = *pin->IN1->pLint;	break;
			case D_USINT:
			case D_BYTE:	*pin->OUT->pUsint = *pin->IN1->pUsint;	break;
			case D_UINT:
			case D_WORD:	*pin->OUT->pUint = *pin->IN1->pUint;	break;
			case D_TIME:
			case D_UDINT:
			case D_DWORD:	*pin->OUT->pUdint = *pin->IN1->pUdint;	break;
			case D_ULINT:	*pin->OUT->pUlint = *pin->IN1->pUlint;	break;
			case D_STRING:  *pin->OUT->pString = *pin->IN1->pString;	break;
			}
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}



/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(STRING型)
*/
PLCPEN_API void SEL_STRING_EN(PVOID instance)
{
	struct SEL_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 入力2もしくは入力3
	} *pin = (struct SEL_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SEL_STRING(pin->IN1, pin->IN2, pin->IN3, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
* (SINT型用)
*/
PLCPEN_API void LIMIT_SINT_EN(PVOID instance)
{
	struct LIMIT_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 最小値～最大値
	} *pin = (struct LIMIT_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LIMIT_SINT(pin->IN1, pin->IN2, pin->IN3, NULL);

		if (pin->ENO = GetSelectEno())	// SELECT実行結果ENO設定
		{
			*pin->OUT->pSint = *pin->IN1->pSint;
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
* (INT型用)
*/
PLCPEN_API void LIMIT_INT_EN(PVOID instance)
{
	struct LIMIT_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 最小値～最大値
	} *pin = (struct LIMIT_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LIMIT_INT(pin->IN1, pin->IN2, pin->IN3, NULL);

		if (pin->ENO = GetSelectEno())	// SELECT実行結果ENO設定
		{
			*pin->OUT->pInt = *pin->IN1->pInt;
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
* (DINT型用)
*/
PLCPEN_API void LIMIT_DINT_EN(PVOID instance)
{
	struct LIMIT_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 最小値～最大値
	} *pin = (struct LIMIT_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LIMIT_DINT(pin->IN1, pin->IN2, pin->IN3, NULL);

		if (pin->ENO = GetSelectEno())	// SELECT実行結果ENO設定
		{
			*pin->OUT->pDint = *pin->IN1->pDint;
		}			
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
* (LINT型用)
*/
PLCPEN_API void LIMIT_LINT_EN(PVOID instance)
{
	struct LIMIT_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 最小値～最大値
	} *pin = (struct LIMIT_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LIMIT_LINT(pin->IN1, pin->IN2, pin->IN3, NULL);

		if (pin->ENO = GetSelectEno())	// SELECT実行結果ENO設定
		{
			*pin->OUT->pLint = *pin->IN1->pLint;
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
* (REAL型用)
*/
PLCPEN_API void LIMIT_REAL_EN(PVOID instance)
{
	struct LIMIT_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 最小値～最大値
	} *pin = (struct LIMIT_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LIMIT_REAL(pin->IN1, pin->IN2, pin->IN3, NULL);

		if (pin->ENO = GetSelectEno())	// SELECT実行結果ENO設定
		{
			*pin->OUT->pReal = *pin->IN1->pReal;
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
* (LREAL型用)
*/
PLCPEN_API void LIMIT_LREAL_EN(PVOID instance)
{
	struct LIMIT_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 最小値～最大値
	} *pin = (struct LIMIT_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LIMIT_LREAL(pin->IN1, pin->IN2, pin->IN3, NULL);

		if (pin->ENO = GetSelectEno())	// SELECT実行結果ENO設定
		{
			*pin->OUT->pLreal = *pin->IN1->pLreal;
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
* (STRING型用)
*/
PLCPEN_API void LIMIT_STRING_EN(PVOID instance)
{
	struct LIMIT_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		P_ANY		IN3;        // 入力3
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 最小値～最大値
	} *pin = (struct LIMIT_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LIMIT_STRING(pin->IN1, pin->IN2, pin->IN3, NULL);
		*pin->OUT->pString = *pin->IN1->pString;
		pin->ENO = GetSelectEno();	// SELECT実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}