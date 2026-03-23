#include "common.h"
#include "PLCPIEC.h"

// ------------------------------------ 
//　型変換 SINT型から各型へ
//-------------------------------------

/// <summary>
/// （型変換）SINTの値をB_BCD型に変換します。
/// 例　(SINT)0x00   0 → (B_BCD)0x00
///     (SINT)0x01   1 → (B_BCD)0x01
///     (SINT)0x63  99 → (B_BCD)0x99
///     (SINT)0x64 100 → (B_BCD)0xFF
///     (SINT)0xFF  -1 → (B_BCD)0xFF
/// </summary>
/// <param name="a1">戻り値(B_BCD型)</param>
/// <param name="a2">変換対象(SINT型)</param>
PLCPIEC_API P_ANY SINT_TO_B_BCD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_BYTE digit1 = 0;
	T_BYTE digit10 = 0;

	a1->Type = D_BYTE;

	// 入力値の範囲チェック
	if (*a1->pSint > 99 || *a1->pSint < 0)
		// 範囲外の場合は戻り値に0xFFをセット
		*a1->pByte = 0xFF;
	else
	{
		// 範囲内の場合は整数を2進化10進2桁に変換
		digit10 = (T_BYTE)((*a1->pSint / 10) << 4);	// 10の位
		digit1  = (T_BYTE)( *a1->pSint % 10);		// 1の位
		*a1->pByte = digit10
				   + digit1;
	}
	return a1;
}

/// <summary>
/// （型変換）SINTの値をBOOL型に変換します。
/// 例　(SINT)0x00   0  → (D_BOOL)0x00	FALSE
///     (SINT)0x01   1  → (D_BOOL)0x01	TRUE
///     (SINT)0xFF  -1  → (D_BOOL)0x01	TRUE
/// </summary>
/// <param name="a1">戻り値(BOOL型)</param>
/// <param name="a2">変換対象(SINT型)</param>
PLCPIEC_API P_ANY SINT_TO_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_BOOL;
	*a1->pBool = (T_BOOL)(*a1->pSint != 0) ? TRUE : FALSE;

	return a1; 
}

/// <summary>
/// （型変換）SINTの値をBYTE型に変換します。
/// 例　(SINT)0x00        0  → (D_BYTE)0x00
///     (SINT)0x01        1  → (D_BYTE)0x01
///     (SINT)0x7F      127  → (D_BYTE)0x7F
///     (SINT)0x80     -128  → (D_BYTE)0x7F
///     (SINT)0xFF       -1  → (D_BYTE)0xFF
/// </summary>
/// <param name="a1">戻り値(BYTE型)</param>
/// <param name="a2">変換対象(SINT型)</param>
PLCPIEC_API P_ANY SINT_TO_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_BYTE;
	*a1->pByte = (T_BYTE)*a1->pSint;

	return a1;
}

/// <summary>
/// （型変換）SINTの値をD_BCD型に変換します。
/// 例　(SINT)0x00    0 → (D_BCD)0x00000000
///     (SINT)0x01    1 → (D_BCD)0x00000001
///     (SINT)0x7F  127 → (D_BCD)0x00000127
///     (SINT)0xFF   -1 → (D_BCD)0xFFFFFFFF
///     (SINT)0x80 -128 → (D_BCD)0xFFFFFFFF
/// </summary>
/// <param name="a1">戻り値(D_BCD型)</param>
/// <param name="a2">変換対象(SINT型)</param>
PLCPIEC_API P_ANY SINT_TO_D_BCD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_INT digit1 = 0;
	T_INT digit10 = 0;
	T_INT digit100 = 0;

	a1->Type = D_DWORD;

	// 入力値の範囲チェック
	if (*a1->pSint < 0)
		// 範囲外の場合は戻り値に固定値をセット
		*a1->pDword = 0xFFFFFFFF;
	else
	{
		// 範囲内の場合は整数を2進化10進2桁に変換
		digit100 = (T_INT)(((*a1->pSint % 1000) / 100) << 8);		// 100の位
		digit10  = (T_INT)(((*a1->pSint % 100) / 10)   << 4);		// 10の位
		digit1   = (T_INT)(( *a1->pSint % 10));						// 1の位

		*a1->pDword = (T_DWORD)
					( digit100
					+ digit10
					+ digit1);
	}

	return a1;
}

/// <summary>
/// （型変換）SINT型の値をDINT型に変換します。
/// 例　(SINT)0x00     0  → (DINT)0x00000000     0
///     (SINT)0x01     1  → (DINT)0x00000001     1
///     (SINT)0x7F   127  → (DINT)0x0000007F   127
///     (SINT)0xFF    -1  → (DINT)0xFFFFFFFF    -1
///     (SINT)0x80  -128  → (DINT)0xFFFFFF80  -128
/// </summary>
/// <param name="a1">戻り値(W_BCD型)</param>
/// <param name="a2">変換対象(SINT型)</param>
PLCPIEC_API P_ANY SINT_TO_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_DINT;

	*a1->pDint = (T_DINT)*a1->pSint;

	return a1;
}

/// <summary>
/// （型変換）SINT型の値をDWORD型に変換します。
/// 例　(SINT)0x00     0  → (DWORD)0x00000000
///     (SINT)0x01     1  → (DWORD)0x00000001
///     (SINT)0x7F   127  → (DWORD)0x0000007F
///     (SINT)0x80  -128  → (DWORD)0x00000080
///     (SINT)0xFF    -1  → (DWORD)0x000000FF
/// </summary>
/// <param name="a1">戻り値(DWORD型)</param>
/// <param name="a2">変換対象(SINT型)</param>
PLCPIEC_API P_ANY SINT_TO_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_BYTE wk = 0;

	wk = (T_BYTE)*a1->pSint;		// 符号なし整数にキャスト
	a1->Type = D_DWORD;
	*a1->pDword = (T_DWORD)wk;		// DWORD型に変換

	return a1;
}

/// <summary>
/// （型変換）SINT型の値をINT型に変換します。
/// 例　(SINT)0x00     0  → (INT)0x0000      0
///     (SINT)0x00     1  → (INT)0x0001      1
///     (SINT)0x7F   127  → (INT)0x007F    127
///     (SINT)0x80  -128  → (INT)0xFF80   -128
///     (SINT)0xFF    -1  → (INT)0xFFFF     -1
/// </summary>
/// <param name="a1">戻り値(INT型)</param>
/// <param name="a2">変換対象(LINT型)</param>
PLCPIEC_API P_ANY SINT_TO_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_INT;
	*a1->pInt = (T_INT)*a1->pSint;

	return a1;
}

/// <summary>
/// （型変換）SINT型の値をLINT型に変換します。
/// 例　(SINT)0x00     0  → (LINT)0x0000000000000000     0
///     (SINT)0x00     1  → (LINT)0x0000000000000001     1
///     (SINT)0x7F   127  → (LINT)0x000000000000007F   127
///     (SINT)0x80  -128  → (LINT)0xFFFFFFFFFFFFFF80  -128
///     (SINT)0xFF    -1  → (LINT)0xFFFFFFFFFFFFFFFF    -1
/// </summary>
/// <param name="a1">戻り値(INT型)</param>
/// <param name="a2">変換対象(LINT型)</param>
PLCPIEC_API P_ANY SINT_TO_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_LINT;
	*a1->pLint = (T_LINT)*a1->pSint;

	return a1;
}

/// <summary>
/// （型変換）SINT型の値をLREAL型に変換します。
/// 例　(SINT)0x00     0  → (LREAL)   0.0
///     (SINT)0x00     1  → (LREAL)   1.0
///     (SINT)0x7F   127  → (LREAL) 127.0
///     (SINT)0xFF    -1  → (LREAL)  -1.0
///     (SINT)0x80  -128  → (LREAL)-128.0
/// </summary>
/// <param name="a1">戻り値(LREAL型)</param>
/// <param name="a2">変換対象(SINT型)</param>
PLCPIEC_API P_ANY SINT_TO_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_LREAL;
	*a1->pLreal = (T_LREAL)*a1->pSint;

	return a1;
}

/// <summary>
/// （型変換）SINT型の値をREAL型に変換します。
/// 例　(SINT)0x00     0  → (REAL)   0.0
///     (SINT)0x00     1  → (REAL)   1.0
///     (SINT)0x7F   127  → (REAL) 127.0
///     (SINT)0xFF    -1  → (REAL)  -1.0
///     (SINT)0x80  -128  → (REAL)-128.0
/// </summary>
/// <param name="a1">戻り値(REAL型)</param>
/// <param name="a2">変換対象(SINT型)</param>
PLCPIEC_API P_ANY SINT_TO_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_REAL;
	*a1->pReal = (T_REAL)*a1->pSint;

	return a1;
}

/// <summary>
/// （型変換）SINT型の値をUDINT型に変換します。
/// 例　(SINT)0x00     0  → (UDINT)0x00000000    0
///     (SINT)0x01     1  → (UDINT)0x00000001    1
///     (SINT)0x7F   127  → (UDINT)0x0000007F  127
///     (SINT)0x80  -128  → (UDINT)0x00000080 -128
///     (SINT)0xFF    -1  → (UDINT)0x000000FF  255
/// </summary>
/// <param name="a1">戻り値(UDINT型)</param>
/// <param name="a2">変換対象(SINT型)</param>
PLCPIEC_API P_ANY SINT_TO_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_BYTE wk = 0;

	wk = (T_BYTE)*a1->pSint;		// SINT値を符号なし整数にキャスト
	a1->Type = D_UDINT;
	*a1->pUdint = wk;				// UDINT変数に変換

	return a1;
}

/// <summary>
/// （型変換）SINT型の値をUINT型に変換します。
/// 例　(SINT)0x00     0  → (UINT)0x0000    0
///     (SINT)0x01     1  → (UINT)0x0001    1
///     (SINT)0x7F   127  → (UINT)0x007F  127
///     (SINT)0x80  -128  → (UINT)0x0080  128
///     (SINT)0xFF    -1  → (UINT)0x00FF  255
/// </summary>
/// <param name="a1">戻り値(UINT型)</param>
/// <param name="a2">変換対象(SINT型)</param>
PLCPIEC_API P_ANY SINT_TO_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_BYTE wk = 0;

	wk = (T_BYTE)*a1->pSint;		// SINT値を符号なし整数にキャスト
	a1->Type = D_UINT;
	*a1->pUint = (T_UINT)wk;		// UINT変数に変換

	return a1;
}

/// <summary>
/// （型変換）SINT型の値をUSINT型に変換します。
/// 例　(SINT)0x00     0  → (USINT)0x00    0
///     (SINT)0x01     1  → (USINT)0x01    1
///     (SINT)0x7F   127  → (USINT)0x7F  127
///     (SINT)0x80  -128  → (USINT)0x80  128
///     (SINT)0xFF    -1  → (USINT)0xFF  255
/// </summary>
/// <param name="a1">戻り値(USINT型)</param>
/// <param name="a2">変換対象(SINT型)</param>
PLCPIEC_API P_ANY SINT_TO_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_USINT;
	*a1->pUsint = (T_USINT)*a1->pSint;

	return a1;
}

/// <summary>
/// （型変換）LINTの値をW_BCD型に変換します。
/// 例　(SINT)0x00    0 → (W_BCD)0x0000
///     (SINT)0x01    1 → (W_BCD)0x0001
///     (SINT)0x7F  127 → (W_BCD)0x0127
///     (SINT)0xFF   -1 → (W_BCD)0xFFFF
///     (SINT)0x80 -128 → (W_BCD)0xFFFF
/// </summary>
/// <param name="a1">戻り値(USINT型)</param>
/// <param name="a2">変換対象(LINT型)</param>
PLCPIEC_API P_ANY SINT_TO_W_BCD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_INT digit1 = 0;
	T_INT digit10 = 0;
	T_INT digit100 = 0;

	a1->Type = D_WORD;

	// 入力値の範囲チェック
	if (*a1->pSint < 0)
		// 範囲外の場合は戻り値に固定値をセット
		*a1->pWord = 0xFFFF;
	else
	{
		// 範囲内の場合は整数を2進化10進2桁に変換
		digit100 = (T_INT)(((*a1->pSint % 1000) / 100) << 8);	// 100の位
		digit10  = (T_INT)(((*a1->pSint % 100)  / 10)  << 4);	// 10の位
		digit1   = (T_INT)(( *a1->pSint % 10));					// 1の位

		*a1->pWord = (T_WORD)
				   ( digit100
				   + digit10
				   + digit1);
	}

	return a1;
}

/// <summary>
/// （型変換）LINT型の値をWORD型に変換します。
/// 例　(SINT)0x00    0 → (W_BCD)0x0000
///     (SINT)0x01    1 → (W_BCD)0x0001
///     (SINT)0x7F  127 → (W_BCD)0x007F
///     (SINT)0xFF   -1 → (W_BCD)0x00FF
///     (SINT)0x80 -128 → (W_BCD)0x0080
/// </summary>
/// <param name="a1">戻り値(WORD型)</param>
/// <param name="a2">変換対象(SINT型)</param>
PLCPIEC_API P_ANY SINT_TO_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_BYTE wk = 0;

	wk = (T_BYTE)*a1->pSint;		// SINT値を符号なし整数にキャスト
	a1->Type = D_WORD;

	*a1->pWord = (T_WORD)wk;		// WORD変数に代入

	return a1;
}