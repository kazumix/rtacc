#include "common.h"
#include "PLCPIEC.h"

// ------------------------------------ 
//　型変換 Bool型から～型へ
//-------------------------------------

/// <summary>
/// （型変換）BOOL型の値をBYTE型に変換します。
///   　(BOOL)0x00 FALSE → (BYTE)0x0000  0
///     (BOOL)0x01 TRUE  → (BYTE)0x0001  1
/// </summary>
/// <param name="a1">戻り値(BYTE型)</param>
/// <param name="a2">変換対象(BOOL型)</param>
PLCPIEC_API P_ANY BOOL_TO_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)

	a1->Type = D_BYTE;
	*a1->pByte = (T_BYTE)*a1->pBool;

	return a1;
}

/// <summary>
/// （型変換）BOOL型の値をDINT型に変換します。
///   　(BOOL)0x00 FALSE → (DINT)0x00000000  0
///     (BOOL)0x01 TRUE  → (DINT)0x00000001  1
/// </summary>
/// <param name="a1">戻り値(DINT型)</param>
/// <param name="a2">変換対象(BOOL型)</param>
PLCPIEC_API P_ANY BOOL_TO_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)

	a1->Type = D_DINT;
	*a1->pDint = (T_DINT)*a1->pBool;

	return a1;
}

/// <summary>
/// （型変換）BOOL型の値をDWORD型に変換します。
///   　(BOOL)0x00 FALSE → (DWORD)0x00000000  0
///     (BOOL)0x01 TRUE  → (DWORD)0x00000001  1
/// </summary>
/// <param name="a1">戻り値(DWORD型)</param>
/// <param name="a2">変換対象(BOOL型)</param>
PLCPIEC_API P_ANY BOOL_TO_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)

	a1->Type = D_DWORD;
	*a1->pDword = (T_DWORD)*a1->pBool;

	return a1;
}

/// <summary>
/// （型変換）BOOL型の値をINT型に変換します。
///   　(BOOL)0x00 FALSE → (INT)0x0000  0
///     (BOOL)0x01 TRUE  → (INT)0x0001  1
/// </summary>
/// <param name="a1">戻り値(INT型)</param>
/// <param name="a2">変換対象(BOOL型)</param>
PLCPIEC_API P_ANY BOOL_TO_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)

	a1->Type = D_INT;
	*a1->pInt = (T_INT)*a1->pBool;

	return a1;
}

/// <summary>
/// （型変換）BOOL型の値をLINT型に変換します。
///   　(BOOL)0x00 FALSE → (LINT)0x0000000000000000  0
///     (BOOL)0x01 TRUE  → (LINT)0x0000000000000001  1
/// </summary>
/// <param name="a1">戻り値(LINT型)</param>
/// <param name="a2">変換対象(BOOL型)</param>
PLCPIEC_API P_ANY BOOL_TO_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)

	a1->Type = D_LINT;
	*a1->pLint = (T_LINT)*a1->pBool;

	return a1;
}

/// <summary>
/// （型変換）BOOL型の値をLREAL型に変換します。
///   　(BOOL)0x00 FALSE → (LREAL)0.00000000
///     (BOOL)0x01 TRUE  → (LREAL)1.00000000
/// </summary>
/// <param name="a1">戻り値(LREAL型)</param>
/// <param name="a2">変換対象(BOOL型)</param>
PLCPIEC_API P_ANY BOOL_TO_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)

	a1->Type = D_LREAL;
	*a1->pLreal = (T_LREAL)*a1->pBool;

	return a1;
}

/// <summary>
/// （型変換）BOOL型の値をREAL型に変換します。
///   　(BOOL)0x00 FALSE → (REAL)0.00000000
///     (BOOL)0x01 TRUE  → (REAL)1.00000000
/// </summary>
/// <param name="a1">戻り値(REAL型)</param>
/// <param name="a2">変換対象(BOOL型)</param>
PLCPIEC_API P_ANY BOOL_TO_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)

	a1->Type = D_REAL;
	*a1->pReal = (T_REAL)*a1->pBool;

	return a1;
}

/// <summary>
/// （型変換）BOOL型の値をSINT型に変換します。
///   　(BOOL)0x00 FALSE → (SINT)0x00 0
///     (BOOL)0x01 TRUE  → (SINT)0x01 1
/// </summary>
/// <param name="a1">戻り値(SINT型)</param>
/// <param name="a2">変換対象(BOOL型)</param>
PLCPIEC_API P_ANY BOOL_TO_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)

	a1->Type = D_SINT;
	*a1->pSint = (T_SINT)*a1->pBool;

	return a1;
}

/// <summary>
/// （型変換）BOOL型の値をUDINT型に変換します。
///   　(BOOL)0x00 FALSE → (UDINT)0x00000000 0
///     (BOOL)0x01 TRUE  → (UDINT)0x00000001 1
/// </summary>
/// <param name="a1">戻り値(UDINT型)</param>
/// <param name="a2">変換対象(BOOL型)</param>
PLCPIEC_API P_ANY BOOL_TO_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)

	a1->Type = D_UDINT;
	*a1->pUdint = (T_UDINT)*a1->pBool;

	return a1;
}

/// <summary>
/// （型変換）BOOL型の値をUINT型に変換します。
///   　(BOOL)0x00 FALSE → (UINT)0x0000 0
///     (BOOL)0x01 TRUE  → (UINT)0x0001 1
/// </summary>
/// <param name="a1">戻り値(UINT型)</param>
/// <param name="a2">変換対象(BOOL型)</param>
PLCPIEC_API P_ANY BOOL_TO_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)

	a1->Type = D_UINT;
	*a1->pUint = (T_UINT)*a1->pBool;

	return a1;
}

/// <summary>
/// （型変換）BOOL型の値をUSINT型に変換します。
///   　(BOOL)0x00 FALSE → (USINT)0x00 0
///     (BOOL)0x01 TRUE  → (USINT)0x01 1
/// </summary>
/// <param name="a1">戻り値(USINT型)</param>
/// <param name="a2">変換対象(BOOL型)</param>
PLCPIEC_API P_ANY BOOL_TO_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)

	a1->Type = D_USINT;
	*a1->pUsint = (T_USINT)*a1->pBool;

	return a1;
}

/// <summary>
/// （型変換）BOOL型の値をWORD型に変換します。
///   　(BOOL)0x00 FALSE → (WORD)0x0000 0
///     (BOOL)0x01 TRUE  → (WORD)0x0001 1
/// </summary>
/// <param name="a1">戻り値(WORD型)</param>
/// <param name="a2">変換対象(BOOL型)</param>
PLCPIEC_API P_ANY BOOL_TO_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)

	a1->Type = D_WORD;
	*a1->pWord = (T_WORD)*a1->pBool;

	return a1;
}