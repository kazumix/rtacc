#include "common.h"
#include "PLCPIEC.h"

// ------------------------------------ 
//　型変換 UINT型から～型へ
//-------------------------------------

/// <summary>
/// （型変換）UINT型の値をBOOL型に変換します。
/// 例　(UINT)0x0000     0 → (BOOL)0x0000  FALSE
///     (UINT)0x0001     1 → (BOOL)0x0001  TRUE
///		(UINT)0xFFFF 65535 → (BOOL)0x0001  TRUE
/// </summary>
/// <param name="a1">戻り値(BOOL型)</param>
/// <param name="a2">変換対象(UINT型)</param>
PLCPIEC_API P_ANY UINT_TO_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_BOOL;

	*a1->pBool = (T_BOOL)(*a1->pUint != 0) ? TRUE : FALSE;	// 1以上ならばTRUE

	return a1;
}

/// <summary>
/// （型変換）UINTの値をBYTE型に変換します。
/// 例　(UINT)0x0000     0  → (D_BYTE)0x00	  0
///     (UINT)0x0001     1  → (D_BYTE)0x01	  1
///     (UINT)0x00FF   255  → (D_BYTE)0xFF	255
///     (UINT)0x0100   256  → (D_BYTE)0x00	  0
///     (UINT)0xFFFF 65535  → (D_BYTE)0xFF	255
/// </summary>
/// <param name="a1">戻り値(BYTE型)</param>
/// <param name="a2">変換対象(UINT型)</param>
PLCPIEC_API P_ANY UINT_TO_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_BYTE;

	*a1->pByte = (T_BYTE)*a1->pUint;	// BYTE型にキャスト

	return a1;
}

/// <summary>
/// （型変換）UINT型の値をDINT型に変換します。
/// 例　(UINT)0x0000     0 → (DINT)0x00000000      0
///   　(UINT)0x7FFF 32767 → (DINT)0x00007FFF  32767
///     (UINT)0x8000 32768 → (DINT)0xFFFF8000 -32768
///     (UINT)0xFFFF 65535 → (DINT)0xFFFFFFFF     -1
/// </summary>
/// <param name="a1">戻り値(DINT型)</param>
/// <param name="a2">変換対象(UINT型)</param>
PLCPIEC_API P_ANY UINT_TO_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_DINT;
	*a1->pDint = (T_DINT)*a1->pUint;			// DINT型にキャスト

	return a1;
}

/// <summary>
/// （型変換）UINT型の値をDWORD型に変換します。
/// 例　(UINT)0x0000      0  → (DWORD)0x00000000
///     (UINT)0x0001      1  → (DWORD)0x00000001
///     (UINT)0x7FFF  32767  → (DWORD)0x00007FFF
///     (UINT)0x8000  32768  → (DWORD)0x00008000
///     (UINT)0xFFFF  65535  → (DWORD)0x0000FFFF
/// </summary>
/// <param name="a1">戻り値(DWORD型)</param>
/// <param name="a2">変換対象(UINT型)</param>
PLCPIEC_API P_ANY UINT_TO_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_DWORD;
	*a1->pDword = (T_DWORD)*a1->pUint;

	return a1;
}

/// <summary>
/// （型変換）UINT型の値をINT型に変換します。
/// 例　(UINT)0x0000          0 → (INT)0x0000     0
///   　(UINT)0x7FFF      32767 → (INT)0x7FFF  32767
///     (UINT)0x8000      32768 → (INT)0x8000 -32768
///     (UINT)0xFFFF      65535 → (INT)0xFFFF     -1
/// </summary>
/// <param name="a1">戻り値(INT型)</param>
/// <param name="a2">変換対象(UINT型)</param>
PLCPIEC_API P_ANY UINT_TO_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_INT;

	*a1->pInt = (T_INT)*a1->pUint;	// INT型にキャスト

	return a1;
}

/// <summary>
/// （型変換）UINT型の値をLINT型に変換します。
/// 例　(UINT)0x0000      0 → (LINT)0x0000000000000000       0
///     (UINT)0x0001      1 → (LINT)0x0000000000000001       1
///     (UINT)0x7FFF  32767 → (LINT)0x0000000000007FFF   32767
///     (UINT)0x8000  32768 → (LINT)0xFFFFFFFFFFFF8000  -32768
///     (UINT)0xFFFF  65535 → (LINT)0xFFFFFFFFFFFFFFFF      -1
/// </summary>
/// <param name="a1">戻り値(LINT型)</param>
/// <param name="a2">変換対象(UINT型)</param>
PLCPIEC_API P_ANY UINT_TO_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_LINT;
	*a1->pLint = (T_LINT)*a1->pUint;	// LINT型にキャスト

	return a1;
}

/// <summary>
/// （型変換）UINT型の値をLREAL型に変換します。
/// 例　(UINT)0x0000      0  → (LREAL)     0.0
///     (UINT)0x0001      1  → (LREAL)     1.0
///     (UINT)0x7FFF  32767  → (LREAL) 32767.0
///     (UINT)0x8000  32768  → (LREAL)-32768.0
///     (UINT)0xFFFF  65535  → (LREAL)    -1.0
/// </summary>
/// <param name="a1">戻り値(LREAL型)</param>
/// <param name="a2">変換対象(UINT型)</param>
PLCPIEC_API P_ANY UINT_TO_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_LREAL;
	*a1->pLreal = (T_LREAL)*a1->pUint;	// LREAL型にキャスト

	return a1;
}

/// <summary>
/// （型変換）UINT型の値をREAL型に変換します。
/// 例　(USINT)0x0000      0  → (REAL)     0.0
///     (USINT)0x0001      1  → (REAL)     1.0
///     (USINT)0x7FFF  32767  → (REAL) 32767.0
///     (USINT)0x8000  32768  → (REAL)-32768.0
///     (USINT)0xFFFF  65535  → (REAL)    -1.0
/// </summary>
/// <param name="a1">戻り値(REAL型)</param>
/// <param name="a2">変換対象(UINT型)</param>
PLCPIEC_API P_ANY UINT_TO_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_REAL;
	*a1->pReal = (T_REAL)*a1->pUint;	// REAL型にキャスト

	return a1;
}

/// <summary>
/// （型変換）UINT型の値をSINT型に変換します。
/// 例　(UINT)0x0000     0 → (SINT)0x00      0
///   　(UINT)0x007F   127 → (SINT)0x7F    127
///     (UINT)0x0080  -128 → (SINT)0x80   -128
///     (UINT)0x00FF   255 → (SINT)0xFF     -1
///     (UINT)0x0100   256 → (SINT)0x00      0
///     (UINT)0xFFFF 65535 → (SINT)0xFF     -1
/// </summary>
/// <param name="a1">戻り値(SINT型)</param>
/// <param name="a2">変換対象(UINT型)</param>
PLCPIEC_API P_ANY UINT_TO_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_SINT;

	*a1->pSint = (T_SINT)*a1->pUint;	// SINT型にキャスト

	return a1;
}

/// <summary>
/// （型変換）UINT型の値をUDINT型に変換します。
/// 例　(UINT)0x0000      0  → (UDINT)0x00000000     0
///     (UINT)0x0001      1  → (UDINT)0x00000001     1
///     (UINT)0x7FFF  32767  → (UDINT)0x00007FFF 32767
///     (UINT)0x8000  32768  → (UDINT)0x00008000 32768
///     (UINT)0xFFFF  65535  → (UDINT)0x0000FFFF 65535
/// </summary>
/// <param name="a1">戻り値(UDINT型)</param>
/// <param name="a2">変換対象(UINT型)</param>
PLCPIEC_API P_ANY UINT_TO_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_UDINT;
	*a1->pUdint = (T_UDINT)*a1->pUint;

	return a1;
}

/// <summary>
/// （型変換）UINTの値をUSINT型に変換します。
/// 例　(UINT)0x0000     0  → (USINT)0x00	  0
///     (UINT)0x0001     1  → (USINT)0x01	  1
///     (UINT)0x00FF   255  → (USINT)0xFF	255
///     (UINT)0x0100   256  → (USINT)0x00	  0
///     (UINT)0xFFFF 65535  → (USINT)0xFF	255
/// </summary>
/// <param name="a1">戻り値(USINT型)</param>
/// <param name="a2">変換対象(UINT型)</param>
PLCPIEC_API P_ANY UINT_TO_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_USINT;

	*a1->pUsint = (T_USINT)*a1->pUint;	// USINT型にキャスト

	return a1;
}

/// <summary>
/// （型変換）UINT型の値をWORD型に変換します。
/// 例　(UINT)0x0000     0 → (WORD)0x0000
///   　(UINT)0x7FFF 32767 → (WORD)0x7FFF
///     (UINT)0x8000 32768 → (WORD)0x8000
///     (UINT)0xFFFF 65535 → (WORD)0xFFFF
/// </summary>
/// <param name="a1">戻り値(WORD型)</param>
/// <param name="a2">変換対象(UINT型)</param>
PLCPIEC_API P_ANY UINT_TO_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_WORD;

	*a1->pWord = (T_WORD)*a1->pUint;	// WORD型にキャスト

	return a1;
}
