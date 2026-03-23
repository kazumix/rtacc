#include "common.h"
#include "PLCPIEC.h"

// ------------------------------------ 
//　型変換 WORD型から～型へ
//-------------------------------------

/// <summary>
/// （型変換）WORD型の値をBOOL型に変換します。
/// 例　(WORD)0x0000 → (BOOL)0x0000  FALSE
///     (WORD)0x0001 → (BOOL)0x0001  TRUE
///		(WORD)0xFFFF → (BOOL)0x0001  TRUE
/// </summary>
/// <param name="a1">戻り値(BOOL型)</param>
/// <param name="a2">変換対象(WORD型)</param>
PLCPIEC_API P_ANY WORD_TO_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_BOOL;

	*a1->pBool = (*a1->pWord != 0) ? TRUE : FALSE;	// 1以上ならばTRUE

	return a1;
}

/// <summary>
/// （型変換）WORDの値をBYTE型に変換します。
/// 例　(WORD)0x0000 → (D_BYTE)0x00	  0
///     (WORD)0x0001 → (D_BYTE)0x01	  1
///     (WORD)0x00FF → (D_BYTE)0xFF	255
///     (WORD)0x0100 → (D_BYTE)0x00	  0
///     (WORD)0xFFFF → (D_BYTE)0xFF	255
/// </summary>
/// <param name="a1">戻り値(BYTE型)</param>
/// <param name="a2">変換対象(WORD型)</param>
PLCPIEC_API P_ANY WORD_TO_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_BYTE;

	*a1->pByte = (T_BYTE)*a1->pWord;	// BYTE型にキャスト

	return a1;
}

/// <summary>
/// （型変換）WORD型の値をDINT型に変換します。
/// 例　(WORD)0x0000 → (DINT)0x00000000      0
///   　(WORD)0x7FFF → (DINT)0x00007FFF  32767
///     (WORD)0x8000 → (DINT)0xFFFF8000 -32768
///     (WORD)0xFFFF → (DINT)0xFFFFFFFF     -1
/// </summary>
/// <param name="a1">戻り値(DINT型)</param>
/// <param name="a2">変換対象(WORD型)</param>
PLCPIEC_API P_ANY WORD_TO_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_INT wk = 0;
	
	a1->Type = D_DINT;
	wk = (T_INT)*a1->pWord;		// WORD値を符号あり整数にキャスト
	*a1->pDint = (T_DINT)wk;	// DINT型にキャスト

	return a1;
}

/// <summary>
/// （型変換）WORD型の値をDWORD型に変換します。
/// 例　(WORD)0x0000  → (DWORD)0x00000000
///     (WORD)0x0001  → (DWORD)0x00000001
///     (WORD)0x7FFF  → (DWORD)0x00007FFF
///     (WORD)0x8000  → (DWORD)0x00008000
///     (WORD)0xFFFF  → (DWORD)0x0000FFFF
/// </summary>
/// <param name="a1">戻り値(DWORD型)</param>
/// <param name="a2">変換対象(WORD型)</param>
PLCPIEC_API P_ANY WORD_TO_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_DWORD;
	*a1->pDword = (T_DWORD)*a1->pWord;

	return a1;
}

/// <summary>
/// （型変換）WORD型の値をINT型に変換します。
/// 例　(WORD)0x0000 → (INT)0x0000     0
///   　(WORD)0x7FFF → (INT)0x7FFF  32767
///     (WORD)0x8000 → (INT)0x8000 -32768
///     (WORD)0xFFFF → (INT)0xFFFF     -1
/// </summary>
/// <param name="a1">戻り値(INT型)</param>
/// <param name="a2">変換対象(WORD型)</param>
PLCPIEC_API P_ANY WORD_TO_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_INT;

	*a1->pInt = (T_INT)*a1->pWord;	// INT型にキャスト

	return a1;
}

/// <summary>
/// （型変換）WORD型の値をLINT型に変換します。
/// 例　(WORD)0x0000 → (LINT)0x0000000000000000       0
///     (WORD)0x0001 → (LINT)0x0000000000000001       1
///     (WORD)0x7FFF → (LINT)0x0000000000007FFF   32767
///     (WORD)0x8000 → (LINT)0xFFFFFFFFFFFF8000  -32768
///     (WORD)0xFFFF → (LINT)0xFFFFFFFFFFFFFFFF      -1
/// </summary>
/// <param name="a1">戻り値(LINT型)</param>
/// <param name="a2">変換対象(WORD型)</param>
PLCPIEC_API P_ANY WORD_TO_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_INT wk = 0;

	a1->Type = D_LINT;
	wk = (T_INT)*a1->pWord;		// WORD型を符号あり整数にキャスト
	*a1->pLint = (T_LINT)wk;	// LINT型にキャスト

	return a1;
}

/// <summary>
/// （型変換）WORD型の値をLREAL型に変換します。
/// 例　(WORD)0x0000 → (LREAL)     0.0
///     (WORD)0x0001 → (LREAL)     1.0
///     (WORD)0x7FFF → (LREAL) 32767.0
///     (WORD)0x8000 → (LREAL)-32768.0
///     (WORD)0xFFFF → (LREAL)    -1.0
/// </summary>
/// <param name="a1">戻り値(LREAL型)</param>
/// <param name="a2">変換対象(WORD型)</param>
PLCPIEC_API P_ANY WORD_TO_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_INT wk = 0;

	a1->Type = D_LREAL;
	wk = (T_INT)*a1->pWord;		// WORD型を符号あり整数にキャスト
	*a1->pLreal = (T_LREAL)wk;	// LREAL型にキャスト

	return a1;
}

/// <summary>
/// （型変換）WORD型の値をREAL型に変換します。
/// 例　(WORD)0x0000 → (REAL)     0.0
///     (WORD)0x0001 → (REAL)     1.0
///     (WORD)0x7FFF → (REAL) 32767.0
///     (WORD)0x8000 → (REAL)-32768.0
///     (WORD)0xFFFF → (REAL)    -1.0
/// </summary>
/// <param name="a1">戻り値(REAL型)</param>
/// <param name="a2">変換対象(WORD型)</param>
PLCPIEC_API P_ANY WORD_TO_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_INT wk = 0;

	a1->Type = D_REAL;
	wk = (T_INT)*a1->pWord;		// WORD型を符号あり整数にキャスト
	*a1->pReal = (T_REAL)wk;	// REAL型にキャスト

	return a1;
}

/// <summary>
/// （型変換）WORD型の値をSINT型に変換します。
/// 例　(WORD)0x0000 → (SINT)0x00      0
///   　(WORD)0x007F → (SINT)0x7F    127
///     (WORD)0x0080 → (SINT)0x80   -128
///     (WORD)0x00FF → (SINT)0xFF     -1
///     (WORD)0x0100 → (SINT)0x00      0
///     (WORD)0xFFFF → (SINT)0xFF     -1
/// </summary>
/// <param name="a1">戻り値(SINT型)</param>
/// <param name="a2">変換対象(WORD型)</param>
PLCPIEC_API P_ANY WORD_TO_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_SINT;

	*a1->pSint = (T_SINT)*a1->pWord;	// SINT型にキャスト

	return a1;
}

/// <summary>
/// （型変換）WORD型の値をUDINT型に変換します。
/// 例　(WORD)0x0000 → (UDINT)0x00000000     0
///     (WORD)0x0001 → (UDINT)0x00000001     1
///     (WORD)0x7FFF → (UDINT)0x00007FFF 32767
///     (WORD)0x8000 → (UDINT)0x00008000 32768
///     (WORD)0xFFFF → (UDINT)0x0000FFFF 65535
/// </summary>
/// <param name="a1">戻り値(UDINT型)</param>
/// <param name="a2">変換対象(WORD型)</param>
PLCPIEC_API P_ANY WORD_TO_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_UDINT;
	*a1->pUdint = (T_UDINT)*a1->pWord;

	return a1;
}

/// <summary>
/// （型変換）WORD型の値をUINT型に変換します。
/// 例　(WORD)0x0000  → (UINT)0x0000      0
///   　(WORD)0x7FFF  → (UINT)0x7FFF  32767
///     (WORD)0x8000  → (UINT)0x8000  32768
///     (WORD)0xFFFF  → (UINT)0xFFFF  65535
/// </summary>
/// <param name="a1">戻り値(UINT型)</param>
/// <param name="a2">変換対象(WORD型)</param>
PLCPIEC_API P_ANY WORD_TO_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_UINT;

	*a1->pUint = (T_UINT)*a1->pWord;	// UINT型にキャスト

	return a1;
}

/// <summary>
/// （型変換）WORDの値をUSINT型に変換します。
/// 例　(WORD)0x0000     0  → (USINT)0x00	  0
///     (WORD)0x0001     1  → (USINT)0x01	  1
///     (WORD)0x00FF   255  → (USINT)0xFF	255
///     (WORD)0x0100   256  → (USINT)0x00	  0
///     (WORD)0xFFFF 65535  → (USINT)0xFF	255
/// </summary>
/// <param name="a1">戻り値(USINT型)</param>
/// <param name="a2">変換対象(WORD型)</param>
PLCPIEC_API P_ANY WORD_TO_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_USINT;

	*a1->pUsint = (T_USINT)*a1->pWord;	// USINT型にキャスト

	return a1;
}
