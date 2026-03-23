#include "common.h"
#include "PLCPIEC.h"

const T_DINT LINT_TO_REAL_EXACT_LIMIT_MAX = 16777216L; //LINT_TO_REAL範囲チェック用定数
const T_DINT LINT_TO_REAL_EXACT_LIMIT_MIN = -16777216L; //LINT_TO_REAL範囲チェック用定数
const T_LINT LREAL_EXACT_LIMIT_MAX = 9007199254740992LL; //LINT_TO_LREAL範囲チェック用定数
const T_LINT LREAL_EXACT_LIMIT_MIN = -9007199254740992LL; //LINT_TO_LREAL範囲チェック用定数

T_BOOL STAT_ENO_LINT_TO;	// LINT_TO用ENO状態保持変数(シングルスレッド用)

/// <summary>
/// LINT_TO処理結果のENOを設定します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ書込みへ変更する必要あり
/// </summary>
/// <param name="eno">ENOの値</param>
/// <returns> (なし) </returns>
PLCPIEC_API void SetLIntToEno(T_BOOL eno)
{
	STAT_ENO_LINT_TO = eno;
}

/// <summary>
/// LINT_TO処理結果のENOを返却します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ参照へ変更する必要あり
/// </summary>
/// <returns></returns>
PLCPIEC_API T_BOOL GetLIntToEno()
{
	return STAT_ENO_LINT_TO;
}

// ------------------------------------ 
//　型変換 LINT型から各型へ
//-------------------------------------

/// <summary>
/// （型変換）LINTの値をB_BCD型に変換します。
/// 例　(LINT)0x0000000000000000   0 → (B_BCD)0x00
///     (LINT)0x0000000000000001   1 → (B_BCD)0x01
///     (LINT)0x0000000000000063  99 → (B_BCD)0x99
///     (LINT)0x0000000000000064 100 → (B_BCD)0xFF
///     (LINT)0xFFFFFFFFFFFFFFFF  -1 → (B_BCD)0xFF
/// </summary>
/// <param name="a1">戻り値(B_BCD型)</param>
/// <param name="a2">変換対象(LINT型)</param>
PLCPIEC_API P_ANY LINT_TO_B_BCD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_BYTE digit1 = 0;
	T_BYTE digit10 = 0;

	a1->Type = D_BYTE;

	// 入力値の範囲チェック
	if (*a1->pLint > 99 || *a1->pLint < 0)
		// 範囲外の場合は戻り値に0xFFをセット
		*a1->pByte = 0xFF;
	else
	{
		// 範囲内の場合は整数を2進化10進2桁に変換
		digit10 = (T_BYTE)((*a1->pLint / 10) << 4);	// 10の位
		digit1  = (T_BYTE) (*a1->pLint % 10);		// 1の位
		*a1->pByte = digit10
				   + digit1;
	}
	return a1;
}
/// <summary>
/// （型変換）LINTの値をBOOL型に変換します。
/// 例　(LINT)0x0000000000000000        0  → (D_BOOL)0x00	FALSE
///     (LINT)0x0000000000000001        1  → (D_BOOL)0x01	TRUE
///     (LINT)0xFFFFFFFFFFFFFFFF        -1 → (D_BOOL)0x01	TRUE
/// </summary>
/// <param name="a1">戻り値(BOOL型)</param>
/// <param name="a2">変換対象(LINT型)</param>
PLCPIEC_API P_ANY LINT_TO_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_BOOL;
	*a1->pBool = (T_BOOL)(*a1->pLint != 0) ? TRUE : FALSE;

	return a1;
}

/// <summary>
/// （型変換）LINTの値をBYTE型に変換します。
/// 例　(LINT)0x0000000000000000        0  → (D_BYTE)0x00	  0
///     (LINT)0x0000000000000001        1  → (D_BYTE)0x01	  1
///     (LINT)0x00000000000000FF      255  → (D_BYTE)0xFF	255
///     (LINT)0x0000000000000100      256  → (D_BYTE)0x00	  0
///     (LINT)0xFFFFFFFFFFFFFFFF       -1  → (D_BYTE)0xFF	255
/// </summary>
/// <param name="a1">戻り値(BYTE型)</param>
/// <param name="a2">変換対象(LINT型)</param>
PLCPIEC_API P_ANY LINT_TO_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_INT wk = 0;

	a1->Type = D_BYTE;
	wk = (T_INT)*a1->pLint;

	// パラメータの下位1バイトを戻り値にセット
	wk = wk <<= 8;
	wk = wk >>= 8;
	*a1->pByte = (T_BYTE)(wk & 0x00FF);	// 下位1バイトをマスクして取得

	return a1;
}
/// <summary>
/// （型変換）LINTの値をD_BCD型に変換します。
/// 例　(LINT)0x0000000000000000         0 → (D_BCD)0x00000000
///     (LINT)0x0000000000000001         1 → (D_BCD)0x00000001
///     (LINT)0x0000000005F5E0FF  99999999 → (D_BCD)0x99999999
///     (LINT)0x0000000005F5E100 100000000 → (D_BCD)0xFFFFFFFF
///     (LINT)0xFFFFFFFFFFFFFFFF        -1 → (D_BCD)0xFFFFFFFF
/// </summary>
/// <param name="a1">戻り値(D_BCD型)</param>
/// <param name="a2">変換対象(LINT型)</param>
PLCPIEC_API P_ANY LINT_TO_D_BCD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_DINT digit1 = 0;
	T_DINT digit10 = 0;
	T_DINT digit100 = 0;
	T_DINT digit1000 = 0;
	T_DINT digit10000 = 0;
	T_DINT digit100000 = 0;
	T_DINT digit1000000 = 0;
	T_DINT digit10000000 = 0;

	a1->Type = D_DWORD;

	// 入力値の範囲チェック
	if (*a1->pLint > 99999999 || *a1->pLint < 0)
		// 範囲外の場合は戻り値に固定値をセット
		*a1->pDword = 0xFFFFFFFF;
	else
	{
		// 範囲内の場合は整数を2進化10進2桁に変換
		digit10000000 = (T_DINT)(( *a1->pLint / 10000000)            << 28);	// 10000000の位
		digit1000000  = (T_DINT)(((*a1->pLint % 10000000) / 1000000) << 24);	// 1000000の位
		digit100000   = (T_DINT)(((*a1->pLint % 1000000)  /  100000) << 20);	// 100000の位
		digit10000    = (T_DINT)(((*a1->pLint % 100000)   / 10000)   << 16);	// 10000の位
		digit1000     = (T_DINT)(((*a1->pLint % 10000)    / 1000)    << 12);	// 1000の位
		digit100      = (T_DINT)(((*a1->pLint % 1000)     / 100)     << 8);		// 100の位
		digit10       = (T_DINT)(((*a1->pLint % 100)      / 10)      << 4);		// 10の位
		digit1        = (T_DINT)(( *a1->pLint % 10));							// 1の位

		*a1->pDword = digit10000000
			        + digit1000000
			        + digit100000
			        + digit10000
			        + digit1000
			        + digit100
			        + digit10
			        + digit1;
	}

	return a1;
}

/// <summary>
/// （型変換）LINT型の値をDINT型に変換します。
/// 例　(LINT)0x0000000000000000            0  → (DINT)0x00000000            0
///     (LINT)0x0000000000000001            1  → (DINT)0x00000001            1
///     (LINT)0x000000007FFFFFFF   2147483647  → (DINT)0x00007FFF   2147483647
///     (LINT)0x0000000080000000   2147483648  → (DINT)0xFFFF8000  -2147483648
///     (LINT)0x00000000FFFFFFFF   4294967295  → (DINT)0xFFFFFFFF           -1
///     (LINT)0x0000000100000000   4294967296  → (DINT)0x00000000            0
///     (LINT)0xFFFFFFFFFFFFFFFF           -1  → (DINT)0xFFFFFFFF           -1
/// </summary>
/// <param name="a1">戻り値(W_BCD型)</param>
/// <param name="a2">変換対象(LINT型)</param>
PLCPIEC_API P_ANY LINT_TO_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_DINT;

	*a1->pDint = (T_DINT)*a1->pLint;

	return a1;
}

/// <summary>
/// （型変換）LINT型の値をDWORD型に変換します。
/// 例　(LINT)0x0000000000000000            0  → (DWORD)0x00000000
///     (LINT)0x0000000000000001            1  → (DWORD)0x00000001
///     (LINT)0x000000007FFFFFFF   2147483647  → (DWORD)0x7FFFFFFF
///     (LINT)0x0000000080000000   2147483648  → (DWORD)0x80000000
///     (LINT)0x00000000FFFFFFFF   4294967295  → (DWORD)0xFFFFFFFF
///     (LINT)0x0000000100000000   4294967296  → (DWORD)0x00000000
///     (LINT)0xFFFFFFFFFFFFFFFF           -1  → (DWORD)0xFFFFFFFF
/// </summary>
/// <param name="a1">戻り値(DWORD型)</param>
/// <param name="a2">変換対象(LINT型)</param>
PLCPIEC_API P_ANY LINT_TO_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_DWORD;
	*a1->pDword = (T_DWORD)*a1->pLint;

	return a1;
}

/// <summary>
/// （型変換）LINT型の値をINT型に変換します。
/// 例　(LINT)0x0000000000000000            0  → (INT)0x0000      0
///     (LINT)0x0000000000000001            1  → (INT)0x0001      1
///     (LINT)0x0000000000007FFF        32767  → (INT)0x7FFF  32767
///     (LINT)0x0000000000008000        32768  → (INT)0x8000 -32768
///     (LINT)0x000000000000FFFF        65535  → (INT)0xFFFF     -1
///     (LINT)0x0000000000010000        65536  → (INT)0x0000      0
///     (LINT)0xFFFFFFFFFFFFFFFF           -1  → (INT)0xFFFF     -1
/// </summary>
/// <param name="a1">戻り値(INT型)</param>
/// <param name="a2">変換対象(LINT型)</param>
PLCPIEC_API P_ANY LINT_TO_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_INT;
	*a1->pInt = (T_INT)*a1->pLint;

	return a1;
}

/// <summary>
/// （型変換）LINT型の値をLREAL型に変換します。
/// 例　(LINT)0x0000000000000000                     0  → (LREAL)0.0000000E+000
///     (LINT)0x0000000000000001                     1  → (LREAL)1.0000000E+000
///     (LINT)0x7FFFFFFFFFFFFFFF   9223372036854775807  → (LREAL) 9223372036854775800.0
///     (LINT)0xFFFFFFFFFFFFFFFF                    -1  → (LREAL)-1.0
///     (LINT)0x8000000000000000  -9223372036854775808  → (LREAL)-9223372036854775800.0
/// </summary>
/// <param name="a1">戻り値(LREAL型)</param>
/// <param name="a2">変換対象(LINT型)</param>
PLCPIEC_API P_ANY LINT_TO_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLIntToEno(TRUE);	// ENOフラグのリセット

		//パラメータが-2の53乗～2の53乗の範囲を超えるか(超えた場合丸め誤差が発生する)
	if (*a1->pLint < LREAL_EXACT_LIMIT_MIN || *a1->pLint > LREAL_EXACT_LIMIT_MAX)
	{
		Eexception_Post(FUK_LIMIT_OVER_ERR, "LINT_TO_LREAL"); //丸め誤差発生
		SetLIntToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	a1->Type = D_LREAL;
	*a1->pLreal = (T_LREAL)*a1->pLint;

	return a1;
}

/// <summary>
/// （型変換）LINT型の値をREAL型に変換します。
/// 例　(LINT)0x0000000000000000                     0  → (REAL)0.0000000E+000
///     (LINT)0x0000000000000001                     1  → (REAL)1.0000000E+000
///     (LINT)0x7FFFFFFFFFFFFFFF   9223372036854775807  → (REAL) 9223372036854775800.0
///     (LINT)0xFFFFFFFFFFFFFFFF                    -1  → (REAL)-1.0
///     (LINT)0x8000000000000000  -9223372036854775808  → (REAL)-9223372036854775800.0
/// </summary>
/// <param name="a1">戻り値(REAL型)</param>
/// <param name="a2">変換対象(LINT型)</param>
PLCPIEC_API P_ANY LINT_TO_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLIntToEno(TRUE);	// ENOフラグのリセット

	//パラメータが-2の24乗～2の24乗の範囲を超えるか(超えた場合丸め誤差が発生する)
	if (*a1->pLint < LINT_TO_REAL_EXACT_LIMIT_MIN || *a1->pLint > LINT_TO_REAL_EXACT_LIMIT_MAX)
	{
		Eexception_Post(FUK_LIMIT_OVER_ERR, "LINT_TO_REAL"); //丸め誤差発生
		SetLIntToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	a1->Type = D_REAL;
	*a1->pReal = (T_REAL)*a1->pLint;

	return a1;
}

/// <summary>
/// （型変換）LINT型の値をSINT型に変換します。
/// 例　(LINT)0x0000000000000000                     0  → (SINT)0x00      0
///     (LINT)0x0000000000000001                     1  → (SINT)0x00      1
///     (LINT)0x000000000000007F                   127  → (SINT)0x7F    127
///     (LINT)0x0000000000000080                   128  → (SINT)0x80   -128
///     (LINT)0x00000000000000FF                   255  → (SINT)0xFF     -1
///     (LINT)0x0000000000000100                   256  → (SINT)0x00      0
///     (LINT)0x7FFFFFFFFFFFFFFF   9223372036854775807  → (SINT)0xFF     -1
///     (LINT)0xFFFFFFFFFFFFFFFF                    -1  → (SINT)0xFF     -1
///     (LINT)0x8000000000000000  -9223372036854775808  → (SINT)0x00      0
/// </summary>
/// <param name="a1">戻り値(SINT型)</param>
/// <param name="a2">変換対象(lINT型)</param>
PLCPIEC_API P_ANY LINT_TO_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_SINT;
	*a1->pSint = (T_SINT)*a1->pLint;

	return a1;
}

/// <summary>
/// （型変換）LINT型の値をUDINT型に変換します。
/// 例　(LINT)0x0000000000000000            0  → (UDINT)0x00000000          0
///     (LINT)0x0000000000000001            1  → (UDINT)0x00000001          1
///     (LINT)0x000000007FFFFFFF   2147483647  → (UDINT)0x7FFFFFFF 2147483647
///     (LINT)0x0000000080000000   2147483648  → (UDINT)0x80000000 2147483648
///     (LINT)0x00000000FFFFFFFF   4294967925  → (UDINT)0xFFFFFFFF 4294967925
///     (LINT)0x0000000100000000   4294967926  → (UDINT)0x00000000          0
///     (LINT)0xFFFFFFFFFFFFFFFF           -1  → (UDINT)0xFFFFFFFF 4294967925
/// </summary>
/// <param name="a1">戻り値(UDINT型)</param>
/// <param name="a2">変換対象(LINT型)</param>
PLCPIEC_API P_ANY LINT_TO_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_UDINT;
	*a1->pUdint = (T_UDINT)*a1->pLint;

	return a1;
}

/// <summary>
/// （型変換）LINT型の値をUINT型に変換します。
/// 例　(LINT)0x0000000000000000            0  → (UINT)0x0000     0
///     (LINT)0x0000000000000001            1  → (UINT)0x0001     1
///     (LINT)0x0000000000008000        32767  → (UINT)0x8000 32767
///     (LINT)0x000000000000FFFF        65535  → (UINT)0xFFFF 65535
///     (LINT)0x0000000000010000        65536  → (UINT)0x0000     0
///     (LINT)0xFFFFFFFFFFFFFFFF           -1  → (UINT)0xFFFF 65535
/// </summary>
/// <param name="a1">戻り値(UINT型)</param>
/// <param name="a2">変換対象(LINT型)</param>
PLCPIEC_API P_ANY LINT_TO_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_UINT;

	*a1->pUint = (T_UINT)*a1->pLint;		// LINT値をUINT変数に代入

	return a1;
}

/// <summary>
/// （型変換）LINT型の値をUSINT型に変換します。
/// 例　(LINT)0x0000000000000000                     0  → (USINT)0x00      0
///     (LINT)0x0000000000000001                     1  → (USINT)0x00      1
///     (LINT)0x000000000000007F                   127  → (USINT)0x7F    127
///     (LINT)0x0000000000000080                   128  → (USINT)0x80    128
///     (LINT)0x00000000000000FF                   255  → (USINT)0xFF    255
///     (LINT)0x0000000000000100                   256  → (USINT)0x00      0
///     (LINT)0x7FFFFFFFFFFFFFFF   9223372036854775807  → (USINT)0xFF    255
///     (LINT)0xFFFFFFFFFFFFFFFF                    -1  → (USINT)0xFF    255
///     (LINT)0x8000000000000000  -9223372036854775808  → (USINT)0x00      0
/// </summary>
/// <param name="a1">戻り値(USINT型)</param>
/// <param name="a2">変換対象(LINT型)</param>
PLCPIEC_API P_ANY LINT_TO_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_USINT;
	*a1->pUsint = (T_USINT)*a1->pLint;

	return a1;
}

/// <summary>
/// （型変換）LINTの値をW_BCD型に変換します。
/// 例　(LINT)0x0000000000000000        0  → (W_BCD)0x0000
///     (LINT)0x0000000000000001        1  → (W_BCD)0x0001
///     (LINT)0x000000000000270F     9999  → (W_BCD)0x9999
///     (LINT)0x0000000000002710    10000  → (W_BCD)0xFFFF
///     (LINT)0xFFFFFFFFFFFFFFFF       -1  → (W_BCD)0xFFFF
/// </summary>
/// <param name="a1">戻り値(USINT型)</param>
/// <param name="a2">変換対象(LINT型)</param>
PLCPIEC_API P_ANY LINT_TO_W_BCD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_DINT digit1 = 0;
	T_DINT digit10 = 0;
	T_DINT digit100 = 0;
	T_DINT digit1000 = 0;

	a1->Type = D_WORD;

	// 入力値の範囲チェック
	if (*a1->pLint > 9999 || *a1->pLint < 0)
		// 範囲外の場合は戻り値に固定値をセット
		*a1->pWord = 0xFFFF;
	else
	{
		// 範囲内の場合は整数を2進化10進2桁に変換
		digit1000 = (T_DINT)(((*a1->pLint % 10000) / 1000) << 12);	// 1000の位
		digit100  = (T_DINT)(((*a1->pLint % 1000)  / 100)  << 8);	// 100の位
		digit10   = (T_DINT)(((*a1->pLint % 100)   / 10)   << 4);	// 10の位
		digit1    = (T_DINT)(( *a1->pLint % 10));					// 1の位

		*a1->pWord = (T_WORD)
			(digit1000
				+ digit100
				+ digit10
				+ digit1);
	}

	return a1;
}

/// <summary>
/// （型変換）LINT型の値をWORD型に変換します。
/// 例　(LINT)0x0000000000000000            0  → (WORD)0x0000
///     (LINT)0x0000000000000001            1  → (WORD)0x0001
///     (LINT)0x000000000000FFFF        65535  → (WORD)0xFFFF
///     (LINT)0x0000000000010000        65536  → (WORD)0x0000
///     (LINT)0xFFFFFFFFFFFFFFFF           -1  → (WORD)0xFFFF
/// </summary>
/// <param name="a1">戻り値(WORD型)</param>
/// <param name="a2">変換対象(LINT型)</param>
PLCPIEC_API P_ANY LINT_TO_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_WORD;

	*a1->pWord = (T_WORD)*a1->pLint;		// LINT値をWORD変数に代入

	return a1;
}