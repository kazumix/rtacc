#include "common.h"
#include "PLCPIEC.h"
#include <math.h>
#include <limits.h>

const T_DINT REAL_TO_EXACT_LIMIT_MAX = 16777216L; //REAL_TO_DWORD, REAL_TO_DINT_, REAL_TO_UDINT範囲チェック用定数
const T_DINT REAL_TO_EXACT_LIMIT_MIN = -16777216L; //REAL_TO_DWORD, REAL_TO_DINT_, REAL_TO_UDINT範囲チェック用定数

T_BOOL STAT_ENO_REAL_TO;	// REAL_TO用ENO状態保持変数(シングルスレッド用)

/// <summary>
/// REAL_TO処理結果のENOを設定します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ書込みへ変更する必要あり
/// </summary>
/// <param name="eno">ENOの値</param>
/// <returns> (なし) </returns>
PLCPIEC_API void SetRealToEno(T_BOOL eno)
{
	STAT_ENO_REAL_TO = eno;
}

/// <summary>
/// REAL_TO処理結果のENOを返却します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ参照へ変更する必要あり
/// </summary>
/// <returns></returns>
PLCPIEC_API T_BOOL GetRealToEno()
{
	return STAT_ENO_REAL_TO;
}

// ------------------------------------ 
//　型変換 REAL型から～型へ
//  小数点第一を四捨五入して近似値に丸めます
//  (MULTIPROG動作と同じ)
//-------------------------------------

/// <summary>
/// （型変換）REAL型の値をBOOL型に変換します。
/// 例　(REAL)     0.0  → (BOOL)0x00 FALSE
///     (REAL)     1.0  → (BOOL)0x01 TRUE
///     (REAL) FLT_MAX  → (BOOL)0x01 TRUE
///     (REAL) FLT_MIN  → (BOOL)0x01 TRUE
///     (REAL)-FLT_MAX  → (BOOL)0x01 TRUE
///     (REAL)-FLT_MIN  → (BOOL)0x01 TRUE
/// </summary>
/// <param name="a1">戻り値(BOOL型)</param>
/// <param name="a2">変換対象(REAL型)</param>
PLCPIEC_API P_ANY REAL_TO_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetRealToEno(TRUE);	// ENOフラグのリセット

	a1->Type = D_BOOL;
	// REAL型の値が有効か
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "REAL_TO_BOOL:IN");	//値が無効値です。
		SetRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pBool = TRUE;	// NaN,Inf時 TRUE
	}
	else
	{
		*a1->pBool = (T_BOOL)(*a1->pReal != 0.0) ? TRUE : FALSE;
	}
	return a1;
}

/// <summary>
/// （型変換）REAL値をBYTE型に変換します。
/// 例　(REAL)     0.0   → (BYTE)0x00   0
///     (REAL)     0.49  → (BYTE)0x00   0
///     (REAL)     0.50  → (BYTE)0x00   0
///     (REAL)     1.0   → (BYTE)0x01   1
///     (REAL)   255.0   → (BYTE)0xFF 255
///     (REAL)   255.49  → (BYTE)0xFF 255
///     (REAL)   255.50  → (BYTE)0x00   0
///     (REAL)  -128.00  → (BYTE)0x80 128
///     (REAL)  -128.49  → (BYTE)0x80 128
///     (REAL)  -128.50  → (BYTE)0x81 129
///     (REAL)  FLT_MAX  → (BYTE)0x00   0
///     (REAL)  FLT_MIN  → (BYTE)0x00   0
///     (REAL) -FLT_MAX  → (BYTE)0x00   0
///     (REAL) -FLT_MIN  → (BYTE)0x00   0
/// </summary>
/// <param name="a1">戻り値(BYTE型)</param>
/// <param name="a2">変換対象(REAL型)</param>
PLCPIEC_API P_ANY REAL_TO_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetRealToEno(TRUE);	// ENOフラグのリセット

	a1->Type = D_BYTE;
	// REAL型の値が有効か
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "REAL_TO_BYTE:IN");	//値が無効値です。
		SetRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pByte = 0x00;	// NaN,Inf時 0
	}
	else
	{
		if (round(*a1->pReal) > UCHAR_MAX || round(*a1->pReal) < 0)	// 変換値がデータ型の表現範囲内であるか
			SetRealToEno(FALSE);	// オーバフロー発生のためENOをFALSEにする
		*a1->pByte = (T_BYTE)round(*a1->pReal);	// T_BYTEにキャスト
	}
	return a1;
}

/// <summary>
/// （型変換）REAL型の値をDINT型に変換します。
/// 例　(REAL)           0.0   → (DINT)0x00000000           0
///     (REAL)           0.49  → (DINT)0x00000000           0
///     (REAL)           0.50  → (DINT)0x00000000           0
///     (REAL)           1.0   → (DINT)0x00000001           1
///     (REAL)      524287.0   → (DINT)0x0007FFFF      524287
///     (REAL)  2147483647.0   → (DINT)0x80000000 -2147483648
///     (REAL)  2147483647.50  → (DINT)0x80000000 -2147483648
///     (REAL)          -0.49  → (DINT)0x00000000           0
///     (REAL)          -0.50  → (DINT)0xFFFFFFFF          -1
///     (REAL)          -1.00  → (DINT)0xFFFFFFFF          -1
///     (REAL)     -524288.0   → (DINT)0xFFF80000     -524288
///     (REAL) -2147483648.0   → (DINT)0x80000000 -2147483648
///     (REAL) -2147483648.49  → (DINT)0x80000000 -2147483648
///     (REAL) -2147483648.50  → (DINT)0x80000000 -2147483648
///     (REAL)        FLT_MAX  → (DINT)0x80000000 -2147483648
///     (REAL)        FLT_MIN  → (DINT)0x00000000           0
///     (REAL)       -FLT_MAX  → (DINT)0x80000000 -2147483648
///     (REAL)       -FLT_MIN  → (DINT)0x00000000           0
/// </summary>
/// <param name="a1">戻り値(DINT型)</param>
/// <param name="a2">変換対象(REAL型)</param>
PLCPIEC_API P_ANY REAL_TO_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetRealToEno(TRUE);	// ENOフラグのリセット

	T_DINT wk = 0;
	T_REAL decimal = 0.0;
	T_REAL ip = 0.0;

	a1->Type = D_DINT;
	// REAL型の値が有効か
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "REAL_TO_DINT:IN");	//値が無効値です。
		SetRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pDint = LONG_MIN;	// NaN,Inf時 負の最大数
	}
	else
	{
		if (*a1->pReal < 0)			// 負の値の場合
		{
			decimal = modff((*a1->pReal), &ip);				// 小数点以下取得
			wk = (fabsf(decimal) >= 0.50) ? 1 : 0;			// 丸めた後に加算する値を設定
			if(((*a1->pReal) - wk) <= REAL_TO_EXACT_LIMIT_MIN)		// データ範囲チェック
				SetRealToEno(FALSE);	// オーバフロー発生のためENOをFALSEにする
			*a1->pDint = (T_DINT)(*a1->pReal) - wk;			// 小数点以下を丸めて戻り値へ代入
		}
		else							// 正の値の場合
		{
			if(round(*a1->pReal) >= REAL_TO_EXACT_LIMIT_MAX)// データ範囲チェック
				SetRealToEno(FALSE);	// オーバフロー発生のためENOをFALSEにする
			*a1->pDint = (T_DINT) round(*a1->pReal);		// 小数点以下を丸めて戻り値へ代入
		}
	}

	return a1;
}

/// <summary>
/// （型変換）REAL型の値をDWORD型に変換します。
/// 例　(REAL)           0.0   → (DWORD)0x00000000
///     (REAL)           0.49  → (DWORD)0x00000000
///     (REAL)           0.50  → (DWORD)0x00000000
///     (REAL)           1.0   → (DWORD)0x00000001
///     (REAL)      524287.0   → (DWORD)0x0007FFFF
///     (REAL)  2147483647.0   → (DWORD)0x80000000
///     (REAL)  2147483647.50  → (DWORD)0x80000000
///     (REAL)          -0.49  → (DWORD)0x00000000
///     (REAL)          -0.50  → (DWORD)0x00000000
///     (REAL)          -1.00  → (DWORD)0xFFFFFFFF
///     (REAL)  4294967295.0   → (DWORD)0x80000000
///     (REAL)  4294967295.49  → (DWORD)0x80000000
///     (REAL)     -524288.0   → (DWORD)0xFFF80000
///     (REAL) -2147483648.00  → (DWORD)0x80000000
///     (REAL) -2147483648.49  → (DWORD)0x80000000
///     (REAL) -2147483648.50  → (DWORD)0x80000000
///     (REAL)      FLT_MAX    → (DWORD)0x00000000
///     (REAL)      FLT_MIN    → (DWORD)0x00000000
///     (REAL)     -FLT_MAX    → (DWORD)0x00000000
///     (REAL)     -FLT_MIN    → (DWORD)0x00000000
/// </summary>
/// <param name="a1">戻り値(DWORD型)</param>
/// <param name="a2">変換対象(REAL型)</param>
PLCPIEC_API P_ANY REAL_TO_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetRealToEno(TRUE);	// ENOフラグのリセット

	a1->Type = D_DWORD;
	// REAL型の値が有効か
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "REAL_TO_DWORD:IN");	//値が無効値です。
		SetRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pDword = 0x00000000;	// NaN,Inf時 0
	}
	else if (round(*a1->pReal) >= REAL_TO_EXACT_LIMIT_MAX || round(*a1->pReal) < 0)	// MULTIPROG動作に合わせて、DWORD最大値以上の場合は固定値を返す
	{
		SetRealToEno(FALSE);	// オーバフロー発生のためENOをFALSEにする
		*a1->pDword = UINT_MAX;
	}
	else
		*a1->pDword = (T_DWORD)round(*a1->pReal);		// DWORD型へキャスト

	return a1;
}

/// <summary>
/// （型変換）REAL型の値をINT型に変換します。
/// 例　(REAL)      0.0   → (INT)0x0000      0
///     (REAL)      0.49  → (INT)0x0000      0
///     (REAL)      0.50  → (INT)0x0000      0
///     (REAL)      1.0   → (INT)0x0001      1
///     (REAL)  32767.0   → (INT)0x7FFF  32767
///     (REAL)  32767.49  → (INT)0x7FFF  32767
///     (REAL)  32767.50  → (INT)0x8000 -32768
///     (REAL)  65536.00  → (INT)0x0000      0
///     (REAL)     -0.49  → (INT)0x0000      0
///     (REAL)     -0.50  → (INT)0xFFFF     -1
///     (REAL)     -1.00  → (INT)0xFFFF     -1
///     (REAL) -32768.00  → (INT)0x8000 -32768
///     (REAL) -32768.49  → (INT)0x8000 -32768
///     (REAL) -32768.50  → (INT)0x7FFF  32767
///     (REAL)   FLT_MAX  → (INT)0x0000      0
///     (REAL)   FLT_MIN  → (INT)0x0000      0
///     (REAL)  -FLT_MAX  → (INT)0x0000      0
///     (REAL)  -FLT_MIN  → (INT)0x0000      0
/// </summary>
/// <param name="a1">戻り値(INT型)</param>
/// <param name="a2">変換対象(LREAL型)</param>
PLCPIEC_API P_ANY REAL_TO_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetRealToEno(TRUE);	// ENOフラグのリセット

	T_INT wk = 0;
	T_REAL decimal = 0.0;
	T_REAL ip = 0.0;

	a1->Type = D_INT;
	// REAL型の値が有効か
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "REAL_TO_INT:IN");	//値が無効値です。
		SetRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pInt = 0;	// NaN,Inf時 0
	}
	else
	{
		if (*a1->pReal < 0)			// 負の値の場合
		{
			decimal = modff((*a1->pReal), &ip);				// 小数点以下取得
			wk = (fabsf(decimal) >= 0.50) ? 1 : 0;			// 丸めた後に加算する値を設定
			if(((*a1->pReal) - wk) < SHRT_MIN)		// 範囲チェック
				SetRealToEno(FALSE);	// オーバフロー発生のためENOをFALSEにする

			*a1->pInt = (T_INT)(*a1->pReal) - wk;			// 小数点以下を丸めて戻り値へ代入
		}
		else							// 正の値の場合
		{
			if (*a1->pReal > SHRT_MAX)		// 範囲チェック
				SetRealToEno(FALSE);	// オーバフロー発生のためENOをFALSEにする
			*a1->pInt = (T_INT)round(*a1->pReal);		// 小数点以下を丸めて戻り値へ代入
		}
	}

	return a1;
}

/// <summary>
/// （型変換）REAL型の値をLINT型に変換します。
/// 例　(REAL)         0.0   → (LINT)0x00000000000000000000                    0
///     (REAL          0.49  → (LINT)0x00000000000000000000                    0
///     (REAL)         0.50  → (LINT)0x00000000000000000000                    0
///     (REAL)         1.0   → (LINT)0x00000000000000000001                    1
///     (REAL)        -0.49  → (LINT)0x00000000000000000000                    0
///     (REAL)        -0.50  → (LINT)0x00000000000000000001                   -1
///     (REAL)        -1.00  → (LINT)0xFFFFFFFFFFFFFFFFFFFF                   -1
///     (REAL)      FLT_MAX  → (LINT)0x80000000000000000000 -9223372036854775808
///     (REAL)      FLT_MIN  → (LINT)0x80000000000000000000 -9223372036854775808
///     (REAL)     -FLT_MAX  → (LINT)0x80000000000000000000 -9223372036854775808
///     (REAL)     -FLT_MIN  → (LINT)0x80000000000000000000 -9223372036854775808
/// </summary>
/// <param name="a1">戻り値(LINT型)</param>
/// <param name="a2">変換対象(REAL型)</param>
PLCPIEC_API P_ANY REAL_TO_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetRealToEno(TRUE);	// ENOフラグのリセット

	T_LINT wk = 0;
	T_REAL decimal = 0.0;
	T_REAL ip = 0.0;

	a1->Type = D_LINT;
	// REAL型の値が有効か
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "REAL_TO_LINT:IN");	//値が無効値です。
		SetRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pLint = 0x8000000000000000;	// NaN,Inf時 最小値
	}
	else
	{
		if (*a1->pReal < 0)			// 負の値の場合
		{
			decimal = modff((*a1->pReal), &ip);				// 小数点以下取得
			wk = (fabsf(decimal) >= 0.50) ? 1 : 0;			// 丸めた後に加算する値を設定
			if (((*a1->pReal) - wk) <= REAL_TO_EXACT_LIMIT_MIN)		// 範囲チェック
			{
				SetRealToEno(FALSE);	// オーバフロー発生のためENOをFALSEにする
				*a1->pLint = 0x8000000000000000;	// 固定値返却
			}
			else
			{
				*a1->pLint = (T_LINT)(*a1->pReal) - wk;			// 小数点以下を丸めて戻り値へ代入
			}
			   
		}
		else							// 正の値の場合
		{
			if (((*a1->pReal) - wk) >= REAL_TO_EXACT_LIMIT_MAX)		// 範囲チェック
			{
				SetRealToEno(FALSE);	// オーバフロー発生のためENOをFALSEにする
				*a1->pLint = 0x8000000000000000;	// 固定値返却
			}
			else
			{
				*a1->pLint = (T_LINT)round(*a1->pReal);		// 小数点以下を丸めて戻り値へ代入
			}
		}
	}

	return a1;
}

/// <summary>
/// （型変換）REAL型の値をLREAL型に変換します。
/// 例　(REAL)             0.0   → (LREAL)            0.0
///     (REAL              0.49  → (LREAL)            0.49
///     (REAL)             0.50  → (LREAL)            0.50
///     (REAL)             1.0   → (LREAL)            1.0
///     (REAL)            -0.49  → (LREAL)           -0.49
///     (REAL)            -0.50  → (LREAL)           -0.50
///     (REAL)            -1.00  → (LREAL)           -1.0
///     (REAL)          FLT_MAX  → (LREAL)		    FLT_MAX
///     (REAL)          FLT_MIN  → (LREAL)         FLT_MIN
///     (REAL)         -FLT_MAX  → (LREAL)		   -FLT_MAX
///     (REAL)         -FLT_MIN  → (LREAL)		   -FLT_MIN
/// </summary>
/// <param name="a1">戻り値(LREAL型)</param>
/// <param name="a2">変換対象(REAL型)</param>
PLCPIEC_API P_ANY REAL_TO_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetRealToEno(TRUE);	// ENOフラグのリセット

	a1->Type = D_LREAL;
	// REAL型の値が有効か
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "REAL_TO_LREAL:IN");	//値が無効値です。
		SetRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	*a1->pLreal = (T_LREAL)*a1->pReal;				// LREAL型にキャスト

	return a1;
}

/// <summary>
/// （型変換）REAL型の値をSINT型に変換します。
/// 例　(REAL)     0.0    → (SINT)0x00    0
///     (REAL)     0.49   → (SINT)0x00    0
///     (REAL)     0.50   → (SINT)0x00    0
///     (REAL)     1.0    → (SINT)0x00    1
///     (REAL)   127.0    → (SINT)0x80 -128
///     (REAL)   127.49   → (SINT)0x80 -128
///     (REAL)   127.50   → (SINT)0x80 -128
///     (REAL)   256.00   → (SINT)0x00    0
///     (REAL)    -0.49   → (SINT)0x00    0
///     (REAL)    -0.50   → (SINT)0xFF   -1
///     (REAL)    -1.00   → (SINT)0xFF   -1
///     (REAL)  -128.00   → (SINT)0x80 -128
///     (REAL)  -128.49   → (SINT)0x80 -128
///     (REAL)  -128.50   → (SINT)0xFF  127
///     (REAL)   FLT_MAX  → (SINT)0x00    0
///     (REAL)   FLT_MIN  → (SINT)0x00    0
///     (REAL)  -FLT_MAX  → (SINT)0x00    0
///     (REAL)  -FLT_MIN  → (SINT)0x00    0
/// </summary>
/// <param name="a1">戻り値(SINT型)</param>
/// <param name="a2">変換対象(REAL型)</param>
PLCPIEC_API P_ANY REAL_TO_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetRealToEno(TRUE);	// ENOフラグのリセット

	T_SINT wk = 0;
	T_REAL decimal = 0.0;
	T_REAL ip = 0.0;

	a1->Type = D_SINT;
	// REAL型の値が有効か
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "REAL_TO_SINT:IN");	//値が無効値です。
		SetRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pSint = 0x00;	// NaN,Inf時 0
	}
	else
	{
		if (*a1->pReal < 0)			// 負の値の場合
		{
			decimal = modff((*a1->pReal), &ip);				// 小数点以下取得
			wk = (fabsf(decimal) >= 0.50) ? 1 : 0;			// 丸めた後に加算する値を設定
			if (((*a1->pReal) - wk) < SCHAR_MIN)	// データ範囲チェック
				SetRealToEno(FALSE);	// オーバフロー発生のためENOをFALSEにする
			*a1->pSint = (T_SINT)(*a1->pReal) - wk;			// 小数点以下を丸めて戻り値へ代入
		}
		else							// 正の値の場合
		{
			if (round(*a1->pReal) > SCHAR_MAX)	// データ範囲チェック
				SetRealToEno(FALSE);	// オーバフロー発生のためENOをFALSEにする
			*a1->pSint = (T_SINT)round(*a1->pReal);		// 小数点以下を丸めて戻り値へ代入
		}
	}

	return a1;
}

/// <summary>
/// （型変換）REAL型の値をUDINT型に変換します。
/// 例　(REAL)           0.0   → (UDINT)0x00000000           0
///     (REAL)           0.49  → (UDINT)0x00000000           0
///     (REAL)           0.50  → (UDINT)0x00000000           0
///     (REAL)           1.0   → (UDINT)0x00000001           1
///     (REAL)      524287.0   → (UDINT)0x0007FFFF      524287
///     (REAL)  2147483647.0   → (UDINT)0x80000000  2147483648
///     (REAL)  2147483647.50  → (UDINT)0x80000000  2147483648
///     (REAL)          -0.49  → (UDINT)0x00000000           0
///     (REAL)          -0.50  → (UDINT)0x00000000           0
///     (REAL)          -1.00  → (UDINT)0xFFFFFFFF	 4294967295	   
///     (REAL)  4294967295.0   → (UDINT)0x80000000  2147483648
///     (REAL)  4294967295.49  → (UDINT)0x80000000  2147483648
///     (REAL)     -524288.0   → (UDINT)0xFFF80000      524288
///     (REAL) -2147483648.00  → (UDINT)0x80000000  2147483648
///     (REAL) -2147483648.49  → (UDINT)0x80000000  2147483648
///     (REAL) -2147483648.50  → (UDINT)0x80000000  2147483648
///     (REAL)      FLT_MAX    → (UDINT)0x00000000
///     (REAL)      FLT_MIN    → (UDINT)0x00000000
///     (REAL)     -FLT_MAX    → (UDINT)0x00000000
///     (REAL)     -FLT_MIN    → (UDINT)0x00000000
/// </summary>
/// <param name="a1">戻り値(UDINT型)</param>
/// <param name="a2">変換対象(REAL型)</param>
PLCPIEC_API P_ANY REAL_TO_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetRealToEno(TRUE);	// ENOフラグのリセット

	a1->Type = D_UDINT;
	// REAL型の値が有効か
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "REAL_TO_UDINT:IN");	//値が無効値です。
		SetRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pUdint = 0x00000000;	// NaN,Inf時 0
	}
	else if (round(*a1->pReal) >= REAL_TO_EXACT_LIMIT_MAX || round(*a1->pReal) < 0)	// MULTIPROG動作に合わせて、DWORD最大値以上の場合は固定値を返す
	{
		SetRealToEno(FALSE);	// オーバフロー発生のためENOをFALSEにする
		*a1->pUdint = 0x80000000;
	}
	else
		*a1->pUdint = (T_UDINT)round(*a1->pReal);		// UDINT型へキャスト

	return a1;
}

/// <summary>
/// （型変換）REAL型の値をUINT型に変換します。
/// 例　(REAL)           0.0   → (UINT)0x0000		 0
///     (REAL)           0.49  → (UINT)0x0000		 0
///     (REAL)           0.50  → (UINT)0x0000		 0
///     (REAL)           1.0   → (UINT)0x0001		 1
///     (REAL)       65535.0   → (UINT)0xFFFF	 65535
///     (REAL)       65535.50  → (UINT)0x0000		 0
///     (REAL)       65536.0   → (UINT)0x0000		 0
///     (REAL)          -0.49  → (UINT)0x0000		 0
///     (REAL)          -0.50  → (UINT)0xFFFF	 65535
///     (REAL)          -1.00  → (UINT)0xFFFF	 65535
///     (REAL)      FLT_MAX    → (UINT)0x0000		 0
///     (REAL)      FLT_MIN    → (UINT)0x0000		 0
///     (REAL)     -FLT_MAX    → (UINT)0x0000		 0
///     (REAL)     -FLT_MIN    → (UINT)0x0000		 0
/// </summary>
/// <param name="a1">戻り値(UDINT型)</param>
/// <param name="a2">変換対象(REAL型)</param>
PLCPIEC_API P_ANY REAL_TO_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetRealToEno(TRUE);	// ENOフラグのリセット

	a1->Type = D_UINT;
	// REAL型の値が有効か
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "REAL_TO_UINT:IN");	//値が無効値です。
		SetRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pUint = 0x0000;	// NaN,Inf時 0
	}
	else
	{	
		if(round(*a1->pReal) > USHRT_MAX || round(*a1->pReal) < 0)	// データ範囲チェック
			SetRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pUint = (T_UINT)round(*a1->pReal);		// UINT型へキャスト
	}
	return a1;
}

/// <summary>
/// （型変換）REAL型の値をUSINT型に変換します。
/// 例　(REAL)         0.0   → (USINT)0x00    0
///     (REAL)         0.49  → (USINT)0x00    0
///     (REAL)         0.50  → (USINT)0x00    0
///     (REAL)         1.0   → (USINT)0x01    1
///     (REAL)       255.0   → (USINT)0xFF	 255
///     (REAL)       255.50  → (USINT)0x00    0
///     (REAL)       256.0   → (USINT)0x00    0
///     (REAL)        -0.49  → (USINT)0x00    0
///     (REAL)        -0.50  → (USINT)0xFF	 255
///     (REAL)        -1.00  → (USINT)0xFF	 255
///     (REAL)      FLT_MAX  → (USINT)0x00	   0
///     (REAL)      FLT_MIN  → (USINT)0x00	   0
///     (REAL)     -FLT_MAX  → (USINT)0x00	   0
///     (REAL)     -FLT_MIN  → (USINT)0x00	   0
/// </summary>
/// <param name="a1">戻り値(USINT型)</param>
/// <param name="a2">変換対象(REAL型)</param>
PLCPIEC_API P_ANY REAL_TO_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetRealToEno(TRUE);	// ENOフラグのリセット

	a1->Type = D_USINT;
	// REAL型の値が有効か
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "REAL_TO_USINT:IN");	//値が無効値です。
		SetRealToEno(FALSE);	// オーバフロー発生のためENOをFALSEにする
		*a1->pUsint = 0x00;	// NaN,Inf時 0
	}
	else
	{
		if(round(*a1->pReal) > UCHAR_MAX || round(*a1->pReal) < 0)		// データ範囲チェック
			SetRealToEno(FALSE);	// オーバフロー発生のためENOをFALSEにする
		*a1->pUsint = (T_USINT)round(*a1->pReal);		// USINT型へキャスト
	}
	return a1;
}

/// <summary>
/// （型変換）REAL型の値をWORD型に変換します。
/// 例　(REAL)           0.0   → (WORD)0x0000
///     (REAL)           0.49  → (WORD)0x0000
///     (REAL)           0.50  → (WORD)0x0000
///     (REAL)           1.0   → (WORD)0x0001
///     (REAL)       65535.0   → (WORD)0xFFFF
///     (REAL)       65535.50  → (WORD)0x0000
///     (REAL)       65536.0   → (WORD)0x0000
///     (REAL)          -0.49  → (WORD)0x0000
///     (REAL)          -0.50  → (WORD)0xFFFF
///     (REAL)          -1.00  → (WORD)0xFFFF
///     (REAL)      FLT_MAX    → (WORD)0x0000
///     (REAL)      FLT_MIN    → (WORD)0x0000
///     (REAL)     -FLT_MAX    → (WORD)0x0000
///     (REAL)     -FLT_MIN    → (WORD)0x0000
/// </summary>
/// <param name="a1">戻り値(UDINT型)</param>
/// <param name="a2">変換対象(REAL型)</param>
PLCPIEC_API P_ANY REAL_TO_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetRealToEno(TRUE);	// ENOフラグのリセット

	a1->Type = D_WORD;
	// REAL型の値が有効か
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "REAL_TO_WORD:IN");	//値が無効値です。
		SetRealToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pWord = 0x0000;	// NaN,Inf時 0
	}
	else
	{
		if (round(*a1->pReal) > USHRT_MAX || round(*a1->pReal) < 0)	// 変換値がデータ型の表現範囲内であるか
		{
			SetRealToEno(FALSE);	// オーバフロー発生のためENOをFALSEにする
		}
		*a1->pWord = (T_WORD)round(*a1->pReal);		// WORD型へキャスト
	}
	return a1;
}
