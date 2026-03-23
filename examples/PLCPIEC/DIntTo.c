#include "common.h"
#include "PLCPIEC.h"

const T_DINT REAL_EXACT_LIMIT_MAX = 16777216L; //DINT_TO_REAL範囲チェック用定数
const T_DINT REAL_EXACT_LIMIT_MIN = -16777216L; //DINT_TO_REAL範囲チェック用定数

T_BOOL STAT_ENO_DINT_TO;	// DINT_TO用ENO状態保持変数(シングルスレッド用)

/// <summary>
/// DINT_TO処理結果のENOを設定します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ書込みへ変更する必要あり
/// </summary>
/// <param name="eno">ENOの値</param>
/// <returns> (なし) </returns>
PLCPIEC_API void SetDIntToEno(T_BOOL eno)
{
	STAT_ENO_DINT_TO = eno;
}

/// <summary>
/// DINT_TO処理結果のENOを返却します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ参照へ変更する必要あり
/// </summary>
/// <returns></returns>
PLCPIEC_API T_BOOL GetDIntToEno()
{
	return STAT_ENO_DINT_TO;
}

// ------------------------------------ 
//　型変換 DINT型から各型へ
//-------------------------------------

/// <summary>
/// （型変換）DINTの値をB_BCD型に変換します。
/// 例　(DINT)0x00000000   0 → (B_BCD)0x00
///     (DINT)0x00000001   1 → (B_BCD)0x01
///     (DINT)0x00000063  99 → (B_BCD)0x99
///     (DINT)0x00000064 100 → (B_BCD)0xFF
///     (DINT)0xFFFFFFFF  -1 → (B_BCD)0xFF
/// </summary>
/// <param name="a1">戻り値(B_BCD型)</param>
/// <param name="a2">変換対象(DINT型)</param>
PLCPIEC_API P_ANY DINT_TO_B_BCD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_BYTE digit1  = 0;
	T_BYTE digit10 = 0;
	
	a1->Type = D_BYTE;

	// 入力値の範囲チェック
	if (*a1->pDint > 99 || *a1->pDint < 0)
		// 範囲外の場合は戻り値に0xFFをセット
		*a1->pByte = 0xFF;
	else
	{
		// 範囲内の場合は整数を2進化10進2桁に変換
		digit10 = (T_BYTE)((*a1->pDint / 10) << 4);	// 10の位
		digit1  = (T_BYTE)( *a1->pDint % 10);		// 1の位
		*a1->pByte = digit10
				   + digit1;
	}
	return a1;
}

/// <summary>
/// （型変換）DINTの値をD_BCD型に変換します。
/// 例　(DINT)0x00000000        0  → (D_BCD)0x00000000
///     (DINT)0x00000001        1  → (D_BCD)0x00000001
///     (DINT)0x05F5E0FF  99999999 → (D_BCD)0x99999999
///     (DINT)0x05F5E100 100000000 → (D_BCD)0xFFFFFFFF
///     (DINT)0xFFFFFFFF        -1 → (D_BCD)0xFFFFFFFF
/// </summary>
/// <param name="a1">戻り値(D_BCD型)</param>
/// <param name="a2">変換対象(DINT型)</param>
PLCPIEC_API P_ANY DINT_TO_BCD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
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
	if (*a1->pDint > 99999999 || *a1->pDint < 0)
		// 範囲外の場合は戻り値に固定値をセット
		*a1->pDword = 0xFFFFFFFF;
	else
	{
		// 範囲内の場合は整数を2進化10進2桁に変換
		digit10000000 = (T_DINT)(( *a1->pDint / 10000000)             << 28);	// 10000000の位
		digit1000000  = (T_DINT)(((*a1->pDint % 10000000)  / 1000000) << 24);	// 1000000の位
		digit100000   = (T_DINT)(((*a1->pDint % 1000000)   / 100000)  << 20);	// 100000の位
		digit10000    = (T_DINT)(((*a1->pDint % 100000)    / 10000)   << 16);	// 10000の位
		digit1000     = (T_DINT)(((*a1->pDint % 10000)     / 1000)	  << 12);	// 1000の位
		digit100      = (T_DINT)(((*a1->pDint % 1000)      / 100)	  << 8);	// 100の位
		digit10       = (T_DINT)(((*a1->pDint % 100)       / 10)	  << 4);	// 10の位
		digit1        = (T_DINT)(( *a1->pDint % 10));							// 1の位

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
/// （型変換）DINTの値をBOOL型に変換します。
/// 例　(DINT)0x00000000        0  → (D_BOOL)0x00	FALSE
///     (DINT)0x00000001        1  → (D_BOOL)0x01	TRUE
///     (DINT)0x05F5E0FF  99999999 → (D_BOOL)0x01	TRUE
///     (DINT)0x05F5E100 100000000 → (D_BOOL)0x01	TRUE
///     (DINT)0xFFFFFFFF        -1 → (D_BOOL)0x01	TRUE
/// </summary>
/// <param name="a1">戻り値(BOOL型)</param>
/// <param name="a2">変換対象(DINT型)</param>
PLCPIEC_API P_ANY DINT_TO_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_BOOL;
	*a1->pBool = (T_BOOL)(*a1->pDint != 0) ? TRUE : FALSE;

	return a1;
}

/// <summary>
/// （型変換）DINTの値をBYTE型に変換します。
/// 例　(DINT)0x00000000        0  → (D_BYTE)0x00	  0
///     (DINT)0x00000001        1  → (D_BYTE)0x01	  1
///     (DINT)0x000000FF      255  → (D_BYTE)0xFF	255
///     (DINT)0x00000100      256  → (D_BYTE)0x00	  0
///     (DINT)0xFFFFFFFF       -1  → (D_BYTE)0xFF	255
/// </summary>
/// <param name="a1">戻り値(BYTE型)</param>
/// <param name="a2">変換対象(DINT型)</param>
PLCPIEC_API P_ANY DINT_TO_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_INT wk = 0;

	a1->Type = D_BYTE;
	wk = (T_INT)*a1->pDint;

	// パラメータの下位1バイトを戻り値にセット
	wk = wk <<= 8;
	wk = wk >>= 8;
	*a1->pByte = (T_BYTE)(wk & 0x00FF);	// 下位1バイトをマスクして取得

	return a1;
}

/// <summary>
/// （型変換）DINTの値をD_BCD型に変換します。
///           ※ DINT_TO_BCDと同じ動作をします。
/// 例　(DINT)0x00000000        0  → (D_BCD)0x00000000
///     (DINT)0x00000001        1  → (D_BCD)0x00000001
///     (DINT)0x05F5E0FF  99999999 → (D_BCD)0x99999999
///     (DINT)0x05F5E100 100000000 → (D_BCD)0xFFFFFFFF
///     (DINT)0xFFFFFFFF        -1 → (D_BCD)0xFFFFFFFF
/// </summary>
/// <param name="a1">戻り値(D_BCD型)</param>
/// <param name="a2">変換対象(DINT型)</param>
PLCPIEC_API P_ANY DINT_TO_D_BCD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	// 関数名のみ異なり、処理は同じため、DINT_TO_BCDを呼び出します
	return DINT_TO_BCD( a1, a2, a3, a4);
}

/// <summary>
/// （型変換）DINT型の値をDWORD型に変換します。
/// 例　(DINT)0x00000000            0  → (DWORD)0x00000000
///     (DINT)0x00000001            1  → (DWORD)0x00000001
///     (DINT)0x7FFFFFFF   2147483647  → (DWORD)0x7FFFFFFF
///     (DINT)0xFFFFFFFF           -1  → (DWORD)0xFFFFFFFF
///     (DINT)0x80000000  -2147483648  → (DWORD)0x80000000
/// </summary>
/// <param name="a1">戻り値(DWORD型)</param>
/// <param name="a2">変換対象(DINT型)</param>
PLCPIEC_API P_ANY DINT_TO_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_DWORD;
	*a1->pDword = (T_DWORD)*a1->pDint;

	return a1;
}

/// <summary>
/// （型変換）DINT型の値をINT型に変換します。
/// 例　(DINT)0x00000000            0  → (INT)0x0000      0
///     (DINT)0x00000001            1  → (INT)0x0001      1
///     (DINT)0x00007FFF        32767  → (INT)0x7FFF  32767
///     (DINT)0x7FFFFFFF   2147483647  → (INT)0xFFFF     -1
///     (DINT)0xFFFFFFFF           -1  → (INT)0xFFFF     -1
///     (DINT)0x00008000       -32768  → (INT)0x8000 -32768
///     (DINT)0x80000000  -2147483648  → (INT)0x0000      0
/// </summary>
/// <param name="a1">戻り値(DWORD型)</param>
/// <param name="a2">変換対象(DINT型)</param>
PLCPIEC_API P_ANY DINT_TO_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_INT;
	*a1->pInt = (T_INT)*a1->pDint;

	return a1;
}

/// <summary>
/// （型変換）DINT型の値をLINT型に変換します。
/// 例　(DINT)0x00000000            0  → (LINT)0x0000000000000000            0
///     (DINT)0x00000001            1  → (LINT)0x0000000000000001            1
///     (DINT)0x7FFFFFFF   2147483647  → (LINT)0x000000007FFFFFFF   2147483647
///     (DINT)0xFFFFFFFF           -1  → (LINT)0xFFFFFFFFFFFFFFFF           -1
///     (DINT)0x80000000  -2147483648  → (LINT)0xFFFFFFFF80000000  -2147483648
/// </summary>
/// <param name="a1">戻り値(LINT型)</param>
/// <param name="a2">変換対象(DINT型)</param>
PLCPIEC_API P_ANY DINT_TO_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_LINT;
	*a1->pLint = (T_LINT)*a1->pDint;

	return a1;
}

/// <summary>
/// （型変換）DINT型の値をLREAL型に変換します。
/// 例　(DINT)0x00000000            0  → (LREAL)0.0000000E+000
///     (DINT)0x00000001            1  → (LREAL)1.0000000E+000
///     (DINT)0x7FFFFFFF   2147483647  → (LREAL)2.147483647E+009
///     (DINT)0xFFFFFFFF           -1  → (LREAL)-1.0000000E+000
///     (DINT)0x80000000  -2147483648  → (LREAL)-2.147483648E+009
/// </summary>
/// <param name="a1">戻り値(LREAL型)</param>
/// <param name="a2">変換対象(DINT型)</param>
PLCPIEC_API P_ANY DINT_TO_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_LREAL;
	*a1->pLreal = (T_LREAL)*a1->pDint;

	return a1;
}

/// <summary>
/// （型変換）DINT型の値をREAL型に変換します。
/// 例　(DINT)0x00000000            0  → (LREAL)0.0000000E+000
///     (DINT)0x00000001            1  → (LREAL)1.0000000E+000
///     (DINT)0x7FFFFFFF   2147483647  → (LREAL)2147483647.00000000
///     (DINT)0xFFFFFFFF           -1  → (LREAL)-1.0000000E+000
///     (DINT)0x80000000  -2147483648  → (LREAL)-2147483648.00000000
/// </summary>
/// <param name="a1">戻り値(REAL型)</param>
/// <param name="a2">変換対象(DINT型)</param>
PLCPIEC_API P_ANY DINT_TO_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDIntToEno(TRUE);	// ENOフラグのリセット

	//パラメータが-2の24乗～2の24乗の範囲を超えるか(超えた場合丸め誤差が発生する)
	if (*a1->pDint < REAL_EXACT_LIMIT_MIN || *a1->pDint > REAL_EXACT_LIMIT_MAX)
	{
		Eexception_Post(FUK_LIMIT_OVER_ERR, "DINT_TO_REAL"); //丸め誤差発生
		SetDIntToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	a1->Type = D_REAL;
	*a1->pReal = (T_REAL)*a1->pDint;

	return a1;
}

/// <summary>
/// （型変換）DINT型の値をSINT型に変換します。
/// 例　(DINT)0x00000000            0  → (SINT)0x00      0
///     (DINT)0x00000001            1  → (SINT)0x00      1
///     (DINT)0x0000007F          127  → (SINT)0x7F    127
///     (DINT)0x00000080          128  → (SINT)0x80   -128
///     (DINT)0x7FFFFFFF   2147483647  → (SINT)0xFF     -1
///     (DINT)0xFFFFFFFF           -1  → (SINT)0xFF     -1
///     (DINT)0x80000000  -2147483648  → (SINT)0x00      0
/// </summary>
/// <param name="a1">戻り値(SINT型)</param>
/// <param name="a2">変換対象(DINT型)</param>
PLCPIEC_API P_ANY DINT_TO_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_SINT;
	*a1->pSint = (T_SINT)*a1->pDint;

	return a1;
}

/// <summary>
/// （型変換）DINT型の値をTIME型(単位:msec)に変換します。
/// 例　(DINT)0x00000000            0  → (TIME)          0
///     (DINT)0x00000001            1  → (TIME)          1
///     (DINT)0x7FFFFFFF   2147483647  → (TIME) 2147483647
///     (DINT)0xFFFFFFFF           -1  → (TIME) 4294967925
///     (DINT)0x80000000  -2147483648  → (TIME) 2147483648
/// </summary>
/// <param name="a1">戻り値(TIME型)</param>
/// <param name="a2">変換対象(DINT型)</param>
PLCPIEC_API P_ANY DINT_TO_TIME(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_TIME;
	*a1->pTime = (T_TIME)*a1->pDint;

	return a1;
}

/// <summary>
/// （型変換）DINT型の値をUDINT型に変換します。
/// 例　(DINT)0x00000000            0  → (UDINT)0x00000000          0
///     (DINT)0x00000001            1  → (UDINT)0x00000001          1
///     (DINT)0x7FFFFFFF   2147483647  → (UDINT)0x7FFFFFFF 2147483647
///     (DINT)0xFFFFFFFF           -1  → (UDINT)0xFFFFFFFF 4294967925
///     (DINT)0x80000000  -2147483648  → (UDINT)0x80000000 2147483648
/// </summary>
/// <param name="a1">戻り値(UDINT型)</param>
/// <param name="a2">変換対象(DINT型)</param>
PLCPIEC_API P_ANY DINT_TO_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_UDINT;
	*a1->pUdint = (T_UDINT)*a1->pDint;

	return a1;
}

/// <summary>
/// （型変換）DINT型の値をUSINT型に変換します。
/// 例　(DINT)0x00000000            0  → (USINT)0x00   0
///     (DINT)0x00000001            1  → (USINT)0x01   1
///     (DINT)0x00000080          128  → (USINT)0x80 128
///     (DINT)0x000000FF          255  → (USINT)0xFF 255
///     (DINT)0x7FFFFFFF   2147483647  → (USINT)0xFF 255
///     (DINT)0xFFFFFFFF           -1  → (USINT)0xFF 255
///     (DINT)0x80000000  -2147483648  → (USINT)0x00   0
/// </summary>
/// <param name="a1">戻り値(USINT型)</param>
/// <param name="a2">変換対象(DINT型)</param>
PLCPIEC_API P_ANY DINT_TO_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_USINT;
	*a1->pUsint = (T_USINT)*a1->pDint;

	return a1;
}

/// <summary>
/// （型変換）DINTの値をW_BCD型に変換します。
/// 例　(DINT)0x00000000        0  → (W_BCD)0x0000
///     (DINT)0x00000001        1  → (W_BCD)0x0001
///     (DINT)0x0000270F     9999  → (W_BCD)0x9999
///     (DINT)0x00002710    10000  → (W_BCD)0xFFFF
///     (DINT)0xFFFFFFFF       -1  → (W_BCD)0xFFFF
/// </summary>
/// <param name="a1">戻り値(USINT型)</param>
/// <param name="a2">変換対象(DINT型)</param>
PLCPIEC_API P_ANY DINT_TO_W_BCD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_DINT digit1 = 0;
	T_DINT digit10 = 0;
	T_DINT digit100 = 0;
	T_DINT digit1000 = 0;

	a1->Type = D_WORD;

	// 入力値の範囲チェック
	if (*a1->pDint > 9999 || *a1->pDint < 0)
		// 範囲外の場合は戻り値に固定値をセット
		*a1->pWord = 0xFFFF;
	else
	{
		// 範囲内の場合は整数を2進化10進2桁に変換
		digit1000 = (T_DINT)(((*a1->pDint % 10000) / 1000) << 12);	// 1000の位
		digit100  = (T_DINT)(((*a1->pDint % 1000)  / 100)  << 8);	// 100の位
		digit10   = (T_DINT)(((*a1->pDint % 100)   / 10)   << 4);	// 10の位
		digit1    = (T_DINT)(( *a1->pDint % 10));					// 1の位

		*a1->pWord = (T_WORD)
					 (digit1000
					 + digit100
					 + digit10
					 + digit1);
	}

	return a1;
}

/// <summary>
/// （型変換）DINT型の値をUINT型に変換します。
/// 例　(DINT)0x00000000            0  → (UINT)0x0000     0
///     (DINT)0x00000001            1  → (UINT)0x0001     1
///     (DINT)0x00008000        32767  → (UINT)0x8000 32767
///     (DINT)0x0000FFFF        65535  → (UINT)0xFFFF 65535
///     (DINT)0x00010000        65536  → (UINT)0x0000     0
///     (DINT)0x7FFFFFFF   2147483647  → (UINT)0xFFFF 65535
///     (DINT)0xFFFFFFFF           -1  → (UINT)0xFFFF 65535
///     (DINT)0x80000000  -2147483648  → (UINT)0x0000     0
/// </summary>
/// <param name="a1">戻り値(UINT型)</param>
/// <param name="a2">変換対象(DINT型)</param>
PLCPIEC_API P_ANY DINT_TO_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_UINT;

	*a1->pUint = (T_UINT)*a1->pDint;		// DINT値をUINT変数に代入

	return a1;
}

/// <summary>
/// （型変換）DINT型の値をWORD型に変換します。
/// 例　(DINT)0x00000000            0  → (WORD)0x0000
///     (DINT)0x00000001            1  → (WORD)0x0001
///     (DINT)0x00008000        32767  → (WORD)0x8000
///     (DINT)0x0000FFFF        65535  → (WORD)0xFFFF
///     (DINT)0x00010000        65536  → (WORD)0x0000
///     (DINT)0x7FFFFFFF   2147483647  → (WORD)0xFFFF
///     (DINT)0xFFFFFFFF           -1  → (WORD)0xFFFF
///     (DINT)0x80000000  -2147483648  → (WORD)0x0000
/// </summary>
/// <param name="a1">戻り値(WORD型)</param>
/// <param name="a2">変換対象(DINT型)</param>
PLCPIEC_API P_ANY DINT_TO_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_WORD;

	*a1->pWord = (T_WORD)*a1->pDint;		// DINT値をWORD変数に代入

	return a1;
}