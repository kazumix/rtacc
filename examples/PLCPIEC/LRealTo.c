#include "common.h"
#include "PLCPIEC.h"
#include <math.h>
#include <limits.h>
#include <float.h>

T_BOOL STAT_ENO_LREAL_TO;	// LREAL_TO用ENO状態保持変数(シングルスレッド用)

/// <summary>
/// LREAL_TO処理結果のENOを設定します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ書込みへ変更する必要あり
/// </summary>
/// <param name="eno">ENOの値</param>
/// <returns> (なし) </returns>
PLCPIEC_API void SetLRealToEno(T_BOOL eno)
{
	STAT_ENO_LREAL_TO = eno;
}

/// <summary>
/// LREAL_TO処理結果のENOを返却します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ参照へ変更する必要あり
/// </summary>
/// <returns></returns>
PLCPIEC_API T_BOOL GetLRealToEno()
{
	return STAT_ENO_LREAL_TO;
}

// ------------------------------------ 
//　型変換 LREAL型から～型へ
//  小数点第一を四捨五入して近似値に丸めます
//  (MULTIPROG動作と同じ)
//-------------------------------------

/// <summary>
/// （型変換）LREAL型の値をBOOL型に変換します。
/// 例　(LREAL)     0.0  → (BOOL)0x00 FALSE
///     (LREAL)     1.0  → (BOOL)0x01 TRUE
///     (LREAL) DBL_MAX  → (BOOL)0x01 TRUE
///     (LREAL) DBL_MIN  → (BOOL)0x01 TRUE
///     (LREAL)-DBL_MAX  → (BOOL)0x01 TRUE
///     (LREAL)-DBL_MIN  → (BOOL)0x01 TRUE
/// </summary>
/// <param name="a1">戻り値(BOOL型)</param>
/// <param name="a2">変換対象(LREAL型)</param>
PLCPIEC_API P_ANY LREAL_TO_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLRealToEno(TRUE);	// ENOフラグのリセット

	a1->Type = D_BOOL;
	// LREAL型の値が有効か
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "LREAL_TO_BOOL:IN");	//値が無効値です。
		SetLRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pBool = TRUE;	// NaN,Inf時 TRUE
	}
	else
		*a1->pBool = (T_BOOL)(*a1->pLreal != 0.0) ? TRUE : FALSE;

	return a1;
}

/// <summary>
/// （型変換）LREAL値をBYTE型に変換します。
/// 例　(LREAL)     0.0   → (BYTE)0x00   0
///     (LREAL)     0.49  → (BYTE)0x00   0
///     (LREAL)     0.50  → (BYTE)0x00   0
///     (LREAL)     1.0   → (BYTE)0x01   1
///     (LREAL)   255.0   → (BYTE)0xFF 255
///     (LREAL)   255.49  → (BYTE)0xFF 255
///     (LREAL)   255.50  → (BYTE)0x00   0
///     (LREAL)  -128.00  → (BYTE)0x80 128
///     (LREAL)  -128.49  → (BYTE)0x80 128
///     (LREAL)  -128.50  → (BYTE)0x81 129
///     (LREAL)  DBL_MAX  → (BYTE)0x00   0
///     (LREAL)  DBL_MIN  → (BYTE)0x00   0
///     (LREAL) -DBL_MAX  → (BYTE)0x00   0
///     (LREAL) -DBL_MIN  → (BYTE)0x00   0
/// </summary>
/// <param name="a1">戻り値(BYTE型)</param>
/// <param name="a2">変換対象(LREAL型)</param>
PLCPIEC_API P_ANY LREAL_TO_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLRealToEno(TRUE);	// ENOフラグのリセット

	a1->Type = D_BYTE;
	// LREAL型の値が有効か
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "LREAL_TO_BYTE:IN");	//値が無効値です。
		SetLRealToEno(FALSE);	// オーバフロー発生のためENOをFALSEにする
		return 0x00;	// NaN,Inf時 0
	}
	if(round(*a1->pLreal) > UCHAR_MAX || round(*a1->pLreal) < 0)	// データ範囲チェック
		SetLRealToEno(FALSE);	// オーバフロー発生のためENOをFALSEにする
	*a1->pByte = (T_BYTE)round(*a1->pLreal);	// T_BYTEにキャスト

	return a1;
}

/// <summary>
/// （型変換）LREAL型の値をDINT型に変換します。
/// 例　(LREAL)           0.0   → (DINT)0x00000000           0
///     (LREAL)           0.49  → (DINT)0x00000000           0
///     (LREAL)           0.50  → (DINT)0x00000000           0
///     (LREAL)           1.0   → (DINT)0x00000001           1
///     (LREAL)  2147483647.0   → (DINT)0x7FFFFFFF  2147483647
///     (LREAL)  2147483647.50  → (DINT)0x80000000 -2147483648
///     (LREAL)          -0.49  → (DINT)0x00000000           0
///     (LREAL)          -0.50  → (DINT)0x00000000           0
///     (LREAL)          -1.00  → (DINT)0xFFFFFFFF          -1
///     (LREAL) -2147483648.00  → (DINT)0x80000000 -2147483648
///     (LREAL) -2147483648.49  → (DINT)0x80000000 -2147483648
///     (LREAL) -2147483648.50  → (DINT)0x7FFFFFFF  2147483647
///     (LREAL)        DBL_MAX  → (DINT)0x80000000 -2147483648
///     (LREAL)        DBL_MIN  → (DINT)0x00000000           0
///     (LREAL)       -DBL_MAX  → (DINT)0x80000000 -2147483648
///     (LREAL)       -DBL_MIN  → (DINT)0x00000000           0
/// </summary>
/// <param name="a1">戻り値(DINT型)</param>
/// <param name="a2">変換対象(LREAL型)</param>
PLCPIEC_API P_ANY LREAL_TO_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLRealToEno(TRUE);	// ENOフラグのリセット

	T_DINT wk = 0;
	T_LREAL decimal = 0.0;
	T_LREAL ip = 0.0;

	a1->Type = D_DINT;
	// LREAL型の値が有効か
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "LREAL_TO_DINT:IN");	//値が無効値です。
		SetLRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pDint = 0x80000000;	// NaN,Inf時 負の最大数
	}
	else
	{
		if (*a1->pLreal < 0)			// 負の値の場合
		{
			decimal = modf((*a1->pLreal), &ip);			// 小数点以下取得
			wk = (fabs(decimal) >= 0.50) ? 1 : 0;		// 丸めた後に加算する値を設定
			if(((*a1->pLreal) - wk) < INT_MIN)
				SetLRealToEno(FALSE);	//オーバーフロー発生のためENOをFALSEにする
			*a1->pDint = (T_DINT)(*a1->pLreal) - wk;	// 小数点以下を丸めて戻り値へ代入
		}
		else							// 正の値の場合
		{
			if(round(*a1->pLreal) > INT_MAX)
				SetLRealToEno(FALSE);	//オーバーフロー発生のためENOをFALSEにする
			*a1->pDint = (T_DINT)round(*a1->pLreal);		// 小数点以下を丸めて戻り値へ代入
		}
	}
	return a1;
}

/// <summary>
/// （型変換）LREAL型の値をDWORD型に変換します。
/// 例　(LREAL)           0.0   → (DWORD)0x00000000
///     (LREAL)           0.49  → (DWORD)0x00000000
///     (LREAL)           0.50  → (DWORD)0x00000000
///     (LREAL)           1.0   → (DWORD)0x00000001
///     (LREAL)  2147483647.0   → (DWORD)0x7FFFFFFF
///     (LREAL)  2147483647.50  → (DWORD)0x7FFFFFFF
///     (LREAL)          -0.49  → (DWORD)0x00000000
///     (LREAL)          -0.50  → (DWORD)0xFFFFFFFF
///     (LREAL)          -1.00  → (DWORD)0xFFFFFFFF
///     (LREAL)  4294967295.0   → (DWORD)0xFFFFFFFF
///     (LREAL)  4294967295.49  → (DWORD)0xFFFFFFFF
///     (LREAL) -2147483648.00  → (DWORD)0x80000000
///     (LREAL) -2147483648.49  → (DWORD)0x80000000
///     (LREAL) -2147483648.50  → (DWORD)0x80000000
///     (LREAL)      DBL_MAX    → (DWORD)0x00000000
///     (LREAL)      DBL_MIN    → (DWORD)0x00000000
///     (LREAL)     -DBL_MAX    → (DWORD)0x00000000
///     (LREAL)     -DBL_MIN    → (DWORD)0x00000000
/// </summary>
/// <param name="a1">戻り値(DWORD型)</param>
/// <param name="a2">変換対象(LREAL型)</param>
PLCPIEC_API P_ANY LREAL_TO_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLRealToEno(TRUE);	// ENOフラグのリセット

	a1->Type = D_DWORD;
	// LREAL型の値が有効か
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "LREAL_TO_DWORD:IN");	//値が無効値です。
		SetLRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pDword = 0x00000000;	// NaN,Inf時 0
	}
	else
	{
		if (round(*a1->pLreal) > UINT_MAX || round(*a1->pLreal) < 0)	// データ範囲チェック
			SetLRealToEno(FALSE);	// オーバーフロー発生のためENOをFALSEにする
		*a1->pDword = (T_DWORD)round(*a1->pLreal);
	}

	return a1;
}

/// <summary>
/// （型変換）LREAL型の値をINT型に変換します。
/// 例　(LREAL)      0.0   → (INT)0x0000      0
///     (LREAL)      0.49  → (INT)0x0000      0
///     (LREAL)      0.50  → (INT)0x0000      0
///     (LREAL)      1.0   → (INT)0x0001      1
///     (LREAL)  32767.0   → (INT)0x7FFF  32767
///     (LREAL)  32767.49  → (INT)0x7FFF  32767
///     (LREAL)  32767.50  → (INT)0x8000 -32768
///     (LREAL)     -0.49  → (INT)0x0000      0
///     (LREAL)     -0.50  → (INT)0xFFFF     -1
///     (LREAL)     -1.00  → (INT)0xFFFF     -1
///     (LREAL) -32768.00  → (INT)0x8000 -32768
///     (LREAL) -32768.49  → (INT)0x8000 -32768
///     (LREAL) -32768.50  → (INT)0x7FFF  32767
///     (LREAL)   DBL_MAX  → (INT)0x0000      0
///     (LREAL)   DBL_MIN  → (INT)0x0000      0
///     (LREAL)  -DBL_MAX  → (INT)0x0000      0
///     (LREAL)  -DBL_MIN  → (INT)0x0000      0
/// </summary>
/// <param name="a1">戻り値(INT型)</param>
/// <param name="a2">変換対象(LREAL型)</param>
PLCPIEC_API P_ANY LREAL_TO_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLRealToEno(TRUE);	// ENOフラグのリセット

	T_INT wk = 0;
	T_LREAL decimal = 0.0;
	T_LREAL ip = 0.0;

	a1->Type = D_INT;
	// LREAL型の値が有効か
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "LREAL_TO_INT:IN");	//値が無効値です。
		SetLRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pInt = 0x0000;	// NaN,Inf時 0
	}
	else
	{
		if (*a1->pLreal < 0)			// 負の値の場合
		{
			decimal = modf((*a1->pLreal), &ip);		// 小数点以下取得
			wk = (fabs(decimal) >= 0.50) ? 1 : 0;	// 丸めた後に加算する値を設定
			if(((*a1->pLreal) - wk) < SHRT_MIN)	// データ範囲チェック
				SetLRealToEno(FALSE);	// オーバフローのためENOをFALSEにする
			*a1->pInt = (T_INT)(*a1->pLreal) - wk;	// 小数点以下を丸めて戻り値へ代入
		}
		else							// 正の値の場合
		{
			if(round(*a1->pLreal) > SHRT_MAX)	// データ範囲チェック
				SetLRealToEno(FALSE);	// オーバフローのためENOをFALSEにする
			*a1->pInt = (T_INT)round(*a1->pLreal);		// 小数点以下を丸めて戻り値へ代入
		}
	}

	return a1;
}

/// <summary>
/// （型変換）LREAL型の値をLINT型に変換します。
/// 例　(LREAL)                    0.0   → (LINT)0x00000000000000000000                    0
///     (LREAL                     0.49  → (LINT)0x00000000000000000000                    0
///     (LREAL)                    0.50  → (LINT)0x00000000000000000000                    0
///     (LREAL)                    1.0   → (LINT)0x00000000000000000001                    1
///     (LREAL)  9223372036854775807.0   → (LINT)0x80000000000000000000 -9223372036854775808
///     (LREAL)  9223372036854775807.49  → (LINT)0x80000000000000000000 -9223372036854775808
///     (LREAL)  9223372036854775807.50  → (LINT)0x80000000000000000000 -9223372036854775808
///     (LREAL)                   -0.49  → (LINT)0x00000000000000000000                    0
///     (LREAL)                   -0.50  → (LINT)0x00000000000000000000                    0
///     (LREAL)                   -1.00  → (LINT)0xFFFFFFFFFFFFFFFFFFFF                   -1
///     (LREAL) -9223372036854775808.00  → (LINT)0x80000000000000000000 -9223372036854775808
///     (LREAL) -9223372036854775808.49  → (LINT)0x80000000000000000000 -9223372036854775808
///     (LREAL) -9223372036854775808.50  → (LINT)0x80000000000000000000 -9223372036854775808
///     (LREAL)                 DBL_MAX  → (LINT)0x80000000000000000000 -9223372036854775808
///     (LREAL)                 DBL_MIN  → (LINT)0x80000000000000000000 -9223372036854775808
///     (LREAL)                -DBL_MAX  → (LINT)0x80000000000000000000 -9223372036854775808
///     (LREAL)                -DBL_MIN  → (LINT)0x80000000000000000000 -9223372036854775808
/// </summary>
/// <param name="a1">戻り値(LINT型)</param>
/// <param name="a2">変換対象(LREAL型)</param>
PLCPIEC_API P_ANY LREAL_TO_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLRealToEno(TRUE);	// ENOフラグのリセット

	T_LINT wk = 0;
	T_LREAL decimal = 0.0;
	T_LREAL ip = 0.0;

	a1->Type = D_LINT;
	// LREAL型の値が有効か
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "LREAL_TO_LINT:IN");	//値が無効値です。
		SetLRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pLint = 0x8000000000000000;	// NaN,Inf時 最小値
	}
	else
	{
		if (*a1->pLreal < 0)			// 負の値の場合
		{
			decimal = modf((*a1->pLreal), &ip);			// 小数点以下取得
			wk = (fabs(decimal) >= 0.50) ? 1 : 0;		// 丸めた後に加算する値を設定
			if (((*a1->pLreal) - wk) < LLONG_MIN)	// データ範囲チェック
			{
				SetLRealToEno(FALSE);	// オーバフロー発生のためENOをFALSEにする
				*a1->pLint = 0x8000000000000000;	// 固定値返却
			}
			else
				*a1->pLint = (T_LINT)(*a1->pLreal) - wk;	// 小数点以下を丸めて戻り値へ
		}
		else							// 正の値の場合
		{
			if(round(*a1->pLreal) > LLONG_MAX)
			{
				SetLRealToEno(FALSE);	// オーバフロー発生のためENOをFALSEにする
				*a1->pLint = 0x8000000000000000;	// 固定値返却
			}
			else
				*a1->pLint = (T_LINT)round(*a1->pLreal);		// 小数点以下を丸めて戻り値へ代入
		}
	}

	return a1;
}

/// <summary>
/// （型変換）LREAL型の値をREAL型に変換します。
/// 例　(LREAL)             0.0   → (REAL)            0.0
///     (LREAL              0.49  → (REAL)            0.49
///     (LREAL)             0.50  → (REAL)            0.50
///     (LREAL)             1.0   → (REAL)            1.0
///     (LREAL)     3.402823e+38  → (REAL)    3.402823e+38
///     (LREAL)            -0.49  → (REAL)           -0.49
///     (LREAL)            -0.50  → (REAL)           -0.50
///     (LREAL)            -1.00  → (REAL)           -1.0
///     (LREAL)     1.175494e-38  → (REAL)    1.175494e-38
///     (LREAL)          DBL_MAX  → (REAL)			   NaN
///     (LREAL)          DBL_MIN  → (REAL)            0.0
///     (LREAL)         -DBL_MAX  → (REAL)			   NaN
///     (LREAL)         -DBL_MIN  → (REAL)			   NaN
/// </summary>
/// <param name="a1">戻り値(REAL型)</param>
/// <param name="a2">変換対象(LREAL型)</param>
PLCPIEC_API P_ANY LREAL_TO_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLRealToEno(TRUE);	// ENOフラグのリセット

	a1->Type = D_REAL;
	// LREAL型の値が有効か
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "LREAL_TO_REAL:IN");	//値が無効値です。
		SetLRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else if(*a1->pLreal > FLT_MAX || *a1->pLreal < -FLT_MAX)	// データ範囲チェック
	{
		SetLRealToEno(FALSE);	// オーバーフロー発生のためENOをFALSEにする
		*a1->pReal = NAN;		// NaNを返す
	}
	else
		*a1->pReal = (T_REAL)*a1->pLreal;				// REAL型にキャスト

	return a1;
}

/// <summary>
/// （型変換）LREAL型の値をSINT型に変換します。
/// 例　(LREAL)    0.0    → (SINT)0x00    0
///     (LREAL)    0.49   → (SINT)0x00    0
///     (LREAL)    0.50   → (SINT)0x00    0
///     (LREAL)    1.0    → (SINT)0x00    1
///     (LREAL)  127.0    → (SINT)0x80 -128
///     (LREAL)  127.49   → (SINT)0x80 -128
///     (LREAL)  127.50   → (SINT)0x80 -128
///     (LREAL)   -0.49   → (SINT)0x00    0
///     (LREAL)   -0.50   → (SINT)0xFF   -1
///     (LREAL)   -1.00   → (SINT)0xFF   -1
///     (LREAL) -128.00   → (SINT)0x80 -128
///     (LREAL) -128.49   → (SINT)0x80 -128
///     (LREAL) -128.50   → (SINT)0x7F  127
///     (LREAL)  DBL_MAX  → (SINT)0x00    0
///     (LREAL)  DBL_MIN  → (SINT)0x00    0
///     (LREAL) -DBL_MAX  → (SINT)0x00    0
///     (LREAL) -DBL_MIN  → (SINT)0x00    0
/// </summary>
/// <param name="a1">戻り値(SINT型)</param>
/// <param name="a2">変換対象(LREAL型)</param>
PLCPIEC_API P_ANY LREAL_TO_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLRealToEno(TRUE);	// ENOフラグのリセット

	T_SINT wk = 0;
	T_LREAL decimal = 0.0;
	T_LREAL ip = 0.0;

	a1->Type = D_SINT;
	// LREAL型の値が有効か
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "LREAL_TO_SINT:IN");	//値が無効値です。
		SetLRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pSint = 0x00;	// NaN,Inf時 0
	}
	else
	{
		if (*a1->pLreal < 0)			// 負の値の場合
		{
			decimal = modf((*a1->pLreal), &ip);			// 小数点以下取得
			wk = (fabs(decimal) >= 0.50) ? 1 : 0;		// 丸めた後に加算する値を設定
			if(((*a1->pLreal) - wk) < SCHAR_MIN)	// データ範囲チェック
				SetLRealToEno(FALSE);	// オーバーフロー発生のためENOをFALSEにする
			*a1->pSint = (T_SINT)(*a1->pLreal) - wk;	// 小数点以下を丸めて戻り値へ代入
		}
		else							// 正の値の場合
		{
			if (round(*a1->pLreal) > SCHAR_MAX)	// データ範囲チェック
				SetLRealToEno(FALSE);	// オーバーフロー発生のためENOをFALSEにする
			*a1->pSint = (T_SINT)round(*a1->pLreal);	// 小数点以下を丸めて戻り値へ代入
		}
	}

	return a1;
}

/// <summary>
/// （型変換）LREAL型の値をUDINT型に変換します。
/// 例　(LREAL)           0.0   → (UDINT)0x00000000			 0
///     (LREAL)           0.49  → (UDINT)0x00000000			 0
///     (LREAL)           0.50  → (UDINT)0x00000000			 0
///     (LREAL)           1.0   → (UDINT)0x00000001			 1
///     (LREAL)  2147483647.0   → (UDINT)0x7FFFFFFF	2147483647
///     (LREAL)  2147483647.50  → (UDINT)0x80000000	2147483648
///     (LREAL)          -0.49  → (UDINT)0x00000000			 0
///     (LREAL)          -0.50  → (UDINT)0x00000000			 0
///     (LREAL)          -1.00  → (UDINT)0xFFFFFFFF	4294967295
///     (LREAL)  4294967295.0   → (UDINT)0xFFFFFFFF	4294967295
///     (LREAL)  4294967295.49  → (UDINT)0xFFFFFFFF	4294967295
///     (LREAL)  4294967295.50  → (UDINT)0x00000000	         0
///     (LREAL) -2147483648.00  → (UDINT)0x80000000	2147483648
///     (LREAL) -2147483648.49  → (UDINT)0x80000000	2147483648
///     (LREAL) -2147483648.50  → (UDINT)0x80000001	2147483649
///     (LREAL)      DBL_MAX    → (UDINT)0x00000000			 0
///     (LREAL)      DBL_MIN    → (UDINT)0x00000000			 0
///     (LREAL)     -DBL_MAX    → (UDINT)0x00000000			 0
///     (LREAL)     -DBL_MIN    → (UDINT)0x00000000			 0
/// </summary>
/// <param name="a1">戻り値(UDINT型)</param>
/// <param name="a2">変換対象(LREAL型)</param>
PLCPIEC_API P_ANY LREAL_TO_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLRealToEno(TRUE);	// ENOフラグのリセット

	a1->Type = D_UDINT;
	// LREAL型の値が有効か
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "LREAL_TO_UDINT:IN");	//値が無効値です。
		SetLRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pUdint = 0x00000000;	// NaN,Inf時 0
	}
	else 
	{
		if (round(*a1->pLreal) > UINT_MAX || round(*a1->pLreal) < 0)	// データ範囲チェック
			SetLRealToEno(FALSE);	// オーバフロー発生のためENOをFALSEにする
		*a1->pUdint = (T_UDINT)round(*a1->pLreal);		// UDINT型へキャスト
	}
	return a1;
}

/// <summary>
/// （型変換）LREAL型の値をUINT型に変換します。
/// 例　(LREAL)           0.0   → (UINT)0x0000		 0
///     (LREAL)           0.49  → (UINT)0x0000		 0
///     (LREAL)           0.50  → (UINT)0x0000		 0
///     (LREAL)           1.0   → (UINT)0x0001		 1
///     (LREAL)       65535.0   → (UINT)0xFFFF	 65535
///     (LREAL)       65535.50  → (UINT)0x0000		 0
///     (LREAL)       65536.0   → (UINT)0x0000		 0
///     (LREAL)          -0.49  → (UINT)0x0000		 0
///     (LREAL)          -0.50  → (UINT)0xFFFF	 65535
///     (LREAL)          -1.00  → (UINT)0xFFFF	 65535
///     (LREAL)      DBL_MAX    → (UINT)0x0000		 0
///     (LREAL)      DBL_MIN    → (UINT)0x0000		 0
///     (LREAL)     -DBL_MAX    → (UINT)0x0000		 0
///     (LREAL)     -DBL_MIN    → (UINT)0x0000		 0
/// </summary>
/// <param name="a1">戻り値(UINT型)</param>
/// <param name="a2">変換対象(LREAL型)</param>
PLCPIEC_API P_ANY LREAL_TO_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLRealToEno(TRUE);	// ENOフラグのリセット

	a1->Type = D_UINT;
	// LREAL型の値が有効か
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "LREAL_TO_UINT:IN");	//値が無効値です。
		SetLRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pUint = 0x0000;	// NaN,Inf時 0
	}
	else 
	{
		if (round(*a1->pLreal) > USHRT_MAX || round(*a1->pLreal) < 0)	// データ範囲チェック
			SetLRealToEno(FALSE);	// オーバフロー発生のためENOをFALSEにする
		*a1->pUint = (T_UINT)round(*a1->pLreal);		// UINT型へキャスト
	}
	return a1;
}

/// <summary>
/// （型変換）LREAL型の値をUSINT型に変換します。
/// 例　(LREAL)         0.0   → (USINT)0x00       0
///     (LREAL)         0.49  → (USINT)0x00       0
///     (LREAL)         0.50  → (USINT)0x00       0
///     (LREAL)         1.0   → (USINT)0x01       1
///     (LREAL)       255.0   → (USINT)0xFF	 255
///     (LREAL)       255.50  → (USINT)0x00       0
///     (LREAL)       256.0   → (USINT)0x00       0
///     (LREAL)        -0.49  → (USINT)0x00       0
///     (LREAL)        -0.50  → (USINT)0xFF	 255
///     (LREAL)        -1.00  → (USINT)0xFF	 255
///     (LREAL)      DBL_MAX  → (USINT)0x00	   0
///     (LREAL)      DBL_MIN  → (USINT)0x00	   0
///     (LREAL)     -DBL_MAX  → (USINT)0x00	   0
///     (LREAL)     -DBL_MIN  → (USINT)0x00	   0
/// </summary>
/// <param name="a1">戻り値(USINT型)</param>
/// <param name="a2">変換対象(LREAL型)</param>
PLCPIEC_API P_ANY LREAL_TO_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLRealToEno(TRUE);	// ENOフラグのリセット

	a1->Type = D_USINT;
	// LREAL型の値が有効か
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "LREAL_TO_USINT:IN");	//値が無効値です。
		SetLRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pSint = 0x00;	// NaN,Inf時 0
	}
	else 
	{
		if (round(*a1->pLreal) > UCHAR_MAX || round(*a1->pLreal) < 0)	// データ範囲チェック
			SetLRealToEno(FALSE);	// オーバフロー発生のためENOをFALSEにする
		*a1->pUsint = (T_USINT)round(*a1->pLreal);		// USINT型へキャスト
	}
	return a1;
}

/// <summary>
/// （型変換）LREAL型の値をWORD型に変換します。
/// 例　(LREAL)           0.0   → (WORD)0x0000
///     (LREAL)           0.49  → (WORD)0x0000
///     (LREAL)           0.50  → (WORD)0x0000
///     (LREAL)           1.0   → (WORD)0x0001
///     (LREAL)       65535.0   → (WORD)0xFFFF
///     (LREAL)       65535.50  → (WORD)0x0000
///     (LREAL)       65536.0   → (WORD)0x0000
///     (LREAL)          -0.49  → (WORD)0x0000
///     (LREAL)          -0.50  → (WORD)0xFFFF
///     (LREAL)          -1.00  → (WORD)0xFFFF
///     (LREAL)      DBL_MAX    → (WORD)0x0000
///     (LREAL)      DBL_MIN    → (WORD)0x0000
///     (LREAL)     -DBL_MAX    → (WORD)0x0000
///     (LREAL)     -DBL_MIN    → (WORD)0x0000
/// </summary>
/// <param name="a1">戻り値(WORD型)</param>
/// <param name="a2">変換対象(LREAL型)</param>
PLCPIEC_API P_ANY LREAL_TO_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLRealToEno(TRUE);	// ENOフラグのリセット

	a1->Type = D_WORD;
	// LREAL型の値が有効か
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "LREAL_TO_WORD:IN");	//値が無効値です。
		SetLRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pWord = 0x0000;	// NaN,Inf時 0
	}
	else
	{
		if (round(*a1->pLreal) > USHRT_MAX || round(*a1->pLreal) < 0)	// データ範囲チェック
			SetLRealToEno(FALSE);	// オーバーフロー発生のためENOをFALSEにする
		*a1->pWord = (T_WORD)round(*a1->pLreal);		// WORD型へキャスト
	}
	return a1;
}
