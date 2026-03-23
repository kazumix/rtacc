#include "common.h"
#include "PLCPIEC.h"

// ------------------------------------ 
//　型変換 USINT型から～型へ
//-------------------------------------

/// <summary>
/// （型変換）USINT型の値をBOOL型に変換します。
/// 例　(USINT)0x00   0 → (BOOL)0x0000  FALSE
///     (USINT)0x01   1 → (BOOL)0x0001  TRUE
///		(USINT)0xFF 255 → (BOOL)0x0001  TRUE
/// </summary>
/// <param name="a1">戻り値(BOOL型)</param>
/// <param name="a2">変換対象(USINT型)</param>
PLCPIEC_API P_ANY USINT_TO_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_BOOL;

	*a1->pBool = (T_BOOL)(*a1->pUsint != 0) ? TRUE : FALSE;	// 1以上ならばTRUE

	return a1;
}

/// <summary>
/// （型変換）USINTの値をBYTE型に変換します。
/// 例　(UDINT)0x00     0  → (D_BYTE)0x00	  0
///     (UDINT)0x01     1  → (D_BYTE)0x01	  1
///     (UDINT)0xFF   255  → (D_BYTE)0xFF	255
/// </summary>
/// <param name="a1">戻り値(BYTE型)</param>
/// <param name="a2">変換対象(USINT型)</param>
PLCPIEC_API P_ANY USINT_TO_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_BYTE;

	*a1->pByte = (T_BYTE)*a1->pUsint;	// BYTE型にキャスト

	return a1;
}

/// <summary>
/// （型変換）USINT型の値をDINT型に変換します。
/// 例　(USINT)0x00   0 → (DINT)0x00000000    0
///   　(USINT)0x7F 127 → (DINT)0x0000007F  127
///     (USINT)0x80 128 → (DINT)0xFFFFFF80 -128
///     (USINT)0xFF 255 → (DINT)0xFFFFFFFF   -1
/// </summary>
/// <param name="a1">戻り値(DINT型)</param>
/// <param name="a2">変換対象(USINT型)</param>
PLCPIEC_API P_ANY USINT_TO_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_INT wk = 0;

	a1->Type = D_DINT;
	wk = (T_INT)*a1->pUsint;	// USINT値を符号あり整数にキャスト	
	wk = wk <<= 8;				// 左シフトして代入したUSINT値を最上位へ移動
	wk = wk >>= 8;				// 右シフトで符号考慮したINT値へ変換

	*a1->pDint = (T_DINT)wk;	// DINT型にキャスト

	return a1;
}

/// <summary>
/// （型変換）USINT型の値をDWORD型に変換します。
/// 例　(USINT)0x00    0  → (DWORD)0x00000000
///     (USINT)0x01    1  → (DWORD)0x00000001
///     (USINT)0x7F  127  → (DWORD)0x0000007F
///     (USINT)0x80  128  → (DWORD)0x00000080
///     (USINT)0xFF  255  → (DWORD)0x000000FF
/// </summary>
/// <param name="a1">戻り値(DWORD型)</param>
/// <param name="a2">変換対象(USINT型)</param>
PLCPIEC_API P_ANY USINT_TO_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_DWORD;
	*a1->pDword = (T_DWORD)*a1->pUsint;
    
	return a1;
}

/// <summary>
/// （型変換）USINT型の値をINT型に変換します。
/// 例　(USINT)0x00    0 → (INT)0x0000    0
///   　(USINT)0x7F  127 → (INT)0x007F  127
///     (USINT)0x80  128 → (INT)0xFF80 -128
///     (USINT)0xFF  255 → (INT)0xFFFF   -1
/// </summary>
/// <param name="a1">戻り値(INT型)</param>
/// <param name="a2">変換対象(UINT型)</param>
PLCPIEC_API P_ANY USINT_TO_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_INT;

	*a1->pInt = (T_INT)*a1->pUsint;	// INT型にキャスト
	*a1->pInt = *a1->pInt <<= 8;	// 左シフトして代入したUSINT値を最上位へ移動
	*a1->pInt = *a1->pInt >>= 8;	// 右シフトで符号考慮したINT値へ変換
	return a1;
}

/// <summary>
/// （型変換）USINT型の値をLINT型に変換します。
/// 例　(USINT)0x00    0 → (LINT)0x0000000000000000     0
///     (USINT)0x00    1 → (LINT)0x0000010000000000     1
///     (USINT)0x7F  127 → (LINT)0x000000000000007F   127
///     (USINT)0x80  128 → (LINT)0xFFFFFFFFFFFFFF80  -128
///     (USINT)0xFF  255 → (LINT)0xFFFFFFFFFFFFFFFF    -1
/// </summary>
/// <param name="a1">戻り値(LINT型)</param>
/// <param name="a2">変換対象(UINT型)</param>
PLCPIEC_API P_ANY USINT_TO_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_INT wk = 0;

	a1->Type = D_LINT;
	wk = (T_INT)*a1->pUsint;	// USINT型を符号あり整数にキャスト
	wk = wk <<= 8;				// 左シフトして代入したUSINT値を最上位へ移動
	wk = wk >>= 8;				// 右シフトで符号考慮したINT値へ変換
	*a1->pLint = (T_LINT)wk;	// LINT型にキャスト

	return a1;
}

/// <summary>
/// （型変換）USINT型の値をLREAL型に変換します。
/// 例　(USINT)0x00   0  → (LREAL)    0.0
///     (USINT)0x01   1  → (LREAL)    1.0
///     (USINT)0x7F 127  → (LREAL)  127.0
///     (USINT)0x80 128  → (LREAL) -128.0
///     (USINT)0xFF 255  → (LREAL)   -1.0
/// </summary>
/// <param name="a1">戻り値(LREAL型)</param>
/// <param name="a2">変換対象(USINT型)</param>
PLCPIEC_API P_ANY USINT_TO_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_INT wk = 0;

	a1->Type = D_LREAL;
	wk = (T_INT)*a1->pUsint;	// USINT型を符号あり整数にキャスト
	wk = wk <<= 8;				// 左シフトして代入したUSINT値を最上位へ移動
	wk = wk >>= 8;				// 右シフトで符号考慮したINT値へ変換
	*a1->pLreal = (T_LREAL)wk;	// LREAL型にキャスト

	return a1;
}


/// <summary>
/// （型変換）USINT型の値をREAL型に変換します。
/// 例　(USINT)0x00   0  → (REAL)   0.0
///     (USINT)0x01   1  → (REAL)   1.0
///     (USINT)0x7F 127  → (REAL) 127.0
///     (USINT)0x80 128  → (REAL)-128.0
///     (USINT)0xFF 255  → (REAL)  -1.0
/// </summary>
/// <param name="a1">戻り値(REAL型)</param>
/// <param name="a2">変換対象(USINT型)</param>
PLCPIEC_API P_ANY USINT_TO_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_INT wk = 0;

	a1->Type = D_REAL;
	wk = (T_INT)*a1->pUsint;	// USINT型を符号あり整数にキャスト
	wk = wk <<= 8;				// 左シフトして代入したUSINT値を最上位へ移動
	wk = wk >>= 8;				// 右シフトで符号考慮したINT値へ変換
	*a1->pReal = (T_REAL)wk;	// REAL型にキャスト

	return a1;
}

/// <summary>
/// （型変換）USINT型の値をSINT型に変換します。
/// 例　(USINT)0x00     0 → (SINT)0x00      0
///   　(USINT)0x7F   127 → (SINT)0x7F    127
///     (USINT)0x80   128 → (SINT)0x80   -128
///     (USINT)0xFF   255 → (SINT)0xFF     -1
/// </summary>
/// <param name="a1">戻り値(SINT型)</param>
/// <param name="a2">変換対象(USINT型)</param>
PLCPIEC_API P_ANY USINT_TO_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_SINT;

	*a1->pSint = (T_SINT)*a1->pUsint;	// SINT型にキャスト

	return a1;
}

/// <summary>
/// （型変換）USINT型の値をUDINT型に変換します。
/// 例　(USINT)0x00    0  → (UDINT)0x00000000   0
///     (USINT)0x00    1  → (UDINT)0x00000000   1
///     (USINT)0x7F  127  → (UDINT)0x0000007F 127
///     (USINT)0x80  128  → (UDINT)0x00000080 128
///     (USINT)0xFF  255  → (UDINT)0x000000FF 255
/// </summary>
/// <param name="a1">戻り値(UDINT型)</param>
/// <param name="a2">変換対象(USINT型)</param>
PLCPIEC_API P_ANY USINT_TO_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_UDINT;
	*a1->pUdint = (T_UDINT)*a1->pUsint;

	return a1;
}

/// <summary>
/// （型変換）USINT型の値をUINT型に変換します。
/// 例　(USINT)0x00   0 → (UINT)0x0000    0
///   　(USINT)0x7F 127 → (UINT)0x007F  127
///     (USINT)0x80 128 → (UINT)0x0080  128
///     (USINT)0xFF 255 → (UINT)0x00FF  255
/// </summary>
/// <param name="a1">戻り値(UINT型)</param>
/// <param name="a2">変換対象(USINT型)</param>
PLCPIEC_API P_ANY USINT_TO_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_UINT;

	*a1->pUint = (T_UINT)*a1->pUsint;	// UINT型にキャスト

	return a1;
}

/// <summary>
/// （型変換）USINT型の値をWORD型に変換します。
/// 例　(USINT)0x00   0 → (WORD)0x0000
///   　(USINT)0x7F 127 → (WORD)0x007F
///     (USINT)0x80 128 → (WORD)0x0080
///     (USINT)0xFF 255 → (WORD)0x00FF
/// </summary>
/// <param name="a1">戻り値(WORD型)</param>
/// <param name="a2">変換対象(USINT型)</param>
PLCPIEC_API P_ANY USINT_TO_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_WORD;

	*a1->pWord = (T_WORD)*a1->pUsint;	// WORD型にキャスト

	return a1;
}