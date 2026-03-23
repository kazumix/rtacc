#include "common.h"
#include "PLCPIEC.h"
#include "limits.h"

const T_DINT TRUNC_TO_EXACT_LIMIT_MAX = 16777216L; //TRUNC_TO_DINT,TRUNC_TO_LINTパラメータ範囲チェック用定数
const T_DINT TRUNC_TO_EXACT_LIMIT_MIN = -16777216L; //TRUNC_TO_DINT,TRUNC_TO_LINTパラメータ範囲チェック用定数

T_BOOL STAT_ENO_TRUNC;	// TRUNC用ENO状態保持変数(シングルスレッド用)

/// <summary>
/// TRUNC処理結果のENOを設定します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ書込みへ変更する必要あり
/// </summary>
/// <param name="eno">ENOの値</param>
/// <returns> (なし) </returns>
PLCPIEC_API void SetTruncEno(T_BOOL eno)
{
	STAT_ENO_TRUNC = eno;
}

/// <summary>
/// TRUNC処理結果のENOを返却します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ参照へ変更する必要あり
/// </summary>
/// <returns></returns>
PLCPIEC_API T_BOOL GetTruncEno()
{
	return STAT_ENO_TRUNC;
}
// ------------------------------------ 
//　小数点以下切り捨て
//-------------------------------------

/// <summary>
/// （型変換）REAL型の小数点以下を切り捨てて、SINT型に変換します。
/// 例　(REAL)    0.0    → (SINT)0x00    0
///     (REAL)    0.49   → (SINT)0x00    0
///     (REAL)    0.50   → (SINT)0x00    0
///     (REAL)    1.0    → (SINT)0x00    1
///     (REAL)  127.0    → (SINT)0x80 -128
///     (REAL)  127.49   → (SINT)0x80 -128
///     (REAL)  127.50   → (SINT)0x80 -128
///     (REAL)   -0.49   → (SINT)0x00    0
///     (REAL)   -0.50   → (SINT)0xFF   -1
///     (REAL)   -1.00   → (SINT)0xFF   -1
///     (REAL) -128.00   → (SINT)0x80 -128
///     (REAL) -128.49   → (SINT)0x80 -128
///     (REAL) -128.50   → (SINT)0x80 -128
///     (REAL)  DBL_MAX  → (SINT)0x00    0
///     (REAL)  DBL_MIN  → (SINT)0x00    0
///     (REAL) -DBL_MAX  → (SINT)0x00    0
///     (REAL) -DBL_MIN  → (SINT)0x00    0
/// </summary>
/// <param name="a1">戻り値(SINT型)</param>
/// <param name="a2">変換対象(REAL型)</param>
PLCPIEC_API P_ANY TRUNC_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetTruncEno(TRUE);	// ENOリセット

	a1->Type = D_SINT;
	// REAL型の値が有効か
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "TRUNC_SINT:IN");	//値が無効値です。
		SetTruncEno(FALSE);	// パラメータエラーのためENOをFALSE
		*a1->pSint = 0x00;	// NaN,Inf時 0
	}
	else
	{
		if ((T_LINT)*a1->pReal < SCHAR_MIN || (T_LINT)*a1->pReal > SCHAR_MAX)// データ範囲チェック
		{
			SetTruncEno(FALSE);	// オーバフロー発生のためENOをFALSE
			*a1->pSint = 0x00;	// 戻り値 0
		}
		else
			*a1->pSint = (T_SINT)*a1->pReal;				// REAL型にキャスト
	}
	return a1;
}

/// <summary>
/// （型変換）REAL型の小数点以下を切り捨てて、INT型に変換します。
/// 例　(REAL)      0.0   → (INT)0x0000      0
///     (REAL)      0.49  → (INT)0x0000      0
///     (REAL)      0.50  → (INT)0x0000      0
///     (REAL)      1.0   → (INT)0x0001      1
///     (REAL)  32767.0   → (INT)0x7FFF  32767
///     (REAL)  32767.49  → (INT)0x7FFF  32767
///     (REAL)  32767.50  → (INT)0x7FFF  32767
///     (REAL)     -0.49  → (INT)0x0000      0
///     (REAL)     -0.50  → (INT)0xFFFF     -1
///     (REAL)     -1.00  → (INT)0xFFFF     -1
///     (REAL) -32768.00  → (INT)0x8000 -32768
///     (REAL) -32768.49  → (INT)0x8000 -32768
///     (REAL) -32768.50  → (INT)0x8000 -32768
///     (REAL)   DBL_MAX  → (INT)0x0000      0
///     (REAL)   DBL_MIN  → (INT)0x0000      0
///     (REAL)  -DBL_MAX  → (INT)0x0000      0
///     (REAL)  -DBL_MIN  → (INT)0x0000      0
/// </summary>
/// <param name="a1">戻り値(INT型)</param>
/// <param name="a2">変換対象(REAL型)</param>
PLCPIEC_API P_ANY TRUNC_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetTruncEno(TRUE);	// ENOリセット

	a1->Type = D_INT;
	// REAL型の値が有効か
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "TRUNC_INT:IN");	//値が無効値です。
		SetTruncEno(FALSE);	// パラメータエラーのためENOをFALSE
		*a1->pInt = 0x0000;	// NaN,Inf時 0
	}
	else
	{
		if ((T_LINT)*a1->pReal < SHRT_MIN || (T_LINT)*a1->pReal > SHRT_MAX)// データ範囲チェック
		{
			SetTruncEno(FALSE);	// オーバフロー発生のためENOをFALSE
			*a1->pInt = 0x00;	// 戻り値 0
		}
		else
			*a1->pInt = (T_INT)*a1->pReal;	// INT型へキャスト
	}
	return a1;
}

/// <summary>
/// （型変換）REAL型の小数点以下を切り捨てて、DINT型に変換します。
/// 例　(REAL)           0.0   → (DINT)0x00000000           0
///     (REAL)           0.49  → (DINT)0x00000000           0
///     (REAL)           0.50  → (DINT)0x00000000           0
///     (REAL)           1.0   → (DINT)0x00000001           1
///     (REAL)  2147483647.0   → (DINT)0x7FFFFFFF  2147483647
///     (REAL)  2147483647.50  → (DINT)0x7FFFFFFF  2147483647
///     (REAL)          -0.49  → (DINT)0x00000000           0
///     (REAL)          -0.50  → (DINT)0x00000000           0
///     (REAL)          -1.00  → (DINT)0xFFFFFFFF          -1
///     (REAL) -2147483648.00  → (DINT)0x80000000 -2147483648
///     (REAL) -2147483648.49  → (DINT)0x80000000 -2147483648
///     (REAL) -2147483648.50  → (DINT)0x80000000 -2147483648
///     (REAL)        DBL_MAX  → (DINT)0x80000000 -2147483648
///     (REAL)        DBL_MIN  → (DINT)0x00000000           0
///     (REAL)       -DBL_MAX  → (DINT)0x80000000 -2147483648
///     (REAL)       -DBL_MIN  → (DINT)0x00000000           0
/// </summary>
/// <param name="a1">戻り値(DINT型)</param>
/// <param name="a2">変換対象(REAL型)</param>
PLCPIEC_API P_ANY TRUNC_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetTruncEno(TRUE);	// ENOリセット

	a1->Type = D_DINT;
	// REAL型の値が有効か
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "TRUNC_DINT:IN");	//値が無効値です。
		SetTruncEno(FALSE);	// パラメータエラーのためENOをFALSE
		*a1->pDint = 0x80000000;	// NaN,Inf時 負の最大数
	}
	else
	{
		if ((T_LINT)*a1->pReal <= TRUNC_TO_EXACT_LIMIT_MIN || (T_LINT)*a1->pReal >= TRUNC_TO_EXACT_LIMIT_MAX)// データ範囲チェック
		{
			SetTruncEno(FALSE);	// オーバフロー発生のためENOをFALSE
			*a1->pDint = 0x00;	// 戻り値 0
		}
		else
			*a1->pDint = (T_DINT)*a1->pReal;		// DINT型へキャスト
	}
	return a1;
}

/// <summary>
/// （型変換）REAL型の小数点以下を切り捨てて、LINT型に変換します。
/// 例　(REAL)                    0.0   → (LINT)0x00000000000000000000                    0
///     (REAL                     0.49  → (LINT)0x00000000000000000000                    0
///     (REAL)                    0.50  → (LINT)0x00000000000000000000                    0
///     (REAL)                    1.0   → (LINT)0x00000000000000000001                    1
///     (REAL)  9223372036854775807.0   → (LINT)0x80000000000000000000 -9223372036854775808
///     (REAL)  9223372036854775807.49  → (LINT)0x80000000000000000000 -9223372036854775808
///     (REAL)  9223372036854775807.50  → (LINT)0x80000000000000000000 -9223372036854775808
///     (REAL)                   -0.49  → (LINT)0x00000000000000000000                    0
///     (REAL)                   -0.50  → (LINT)0x00000000000000000000                    0
///     (REAL)                   -1.00  → (LINT)0xFFFFFFFFFFFFFFFFFFFF                   -1
///     (REAL) -9223372036854775808.00  → (LINT)0x80000000000000000000 -9223372036854775808
///     (REAL) -9223372036854775808.49  → (LINT)0x80000000000000000000 -9223372036854775808
///     (REAL) -9223372036854775808.50  → (LINT)0x80000000000000000000 -9223372036854775808
///     (REAL)                 DBL_MAX  → (LINT)0x80000000000000000000 -9223372036854775808
///     (REAL)                 DBL_MIN  → (LINT)0x80000000000000000000 -9223372036854775808
///     (REAL)                -DBL_MAX  → (LINT)0x80000000000000000000 -9223372036854775808
///     (REAL)                -DBL_MIN  → (LINT)0x80000000000000000000 -9223372036854775808
/// </summary>
/// <param name="a1">戻り値(LINT型)</param>
/// <param name="a2">変換対象(REAL型)</param>
PLCPIEC_API P_ANY TRUNC_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetTruncEno(TRUE);	// ENOリセット

	a1->Type = D_LINT;
	// REAL型の値が有効か
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "TRUNC_LREAL:IN");	//値が無効値です。
		SetTruncEno(FALSE);	// パラメータエラーのためENOをFALSE
		*a1->pLint = 0x8000000000000000;	// NaN,Inf時 最小値
	}
	else
	{
		if ((T_LINT)*a1->pReal <= TRUNC_TO_EXACT_LIMIT_MIN || (T_LINT)*a1->pReal >= TRUNC_TO_EXACT_LIMIT_MAX)// データ範囲チェック
		{
			SetTruncEno(FALSE);	// オーバフロー発生のためENOをFALSE
			*a1->pLint = 0x00;	// 戻り値 0
		}
		else
		*a1->pLint = (T_LINT)*a1->pReal;				// LINT型にキャスト
	}
	return a1;
}
