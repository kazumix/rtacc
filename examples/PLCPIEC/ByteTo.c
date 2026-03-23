#include "common.h"
#include "PLCPIEC.h"

// ------------------------------------ 
//　型変換 BYTE型から～型へ
//-------------------------------------

/// <summary>
/// （型変換）BYTE型の値をDINT型に変換します。
/// 例　(BYTE)0x7F 127 → (DINT)0x0000007F  127
///     (BYTE)0x80 128 → (DINT)0xFFFFFF80 -128
///     (BYTE)0xFF 255 → (DINT)0xFFFFFFFF -  1
/// </summary>
/// <param name="a1">戻り値(DINT型)</param>
/// <param name="a2">変換対象(BYTE型)</param>
PLCPIEC_API P_ANY BYTE_TO_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_DINT;
	*a1->pDint = (T_DINT)*a1->pByte;

	*a1->pDint = *a1->pDint <<= 24;		// 左シフトして代入したBYTE値を最上位へ移動
	*a1->pDint = *a1->pDint >>= 24;		// 右シフトで符号考慮したDINT値へ変換

	return a1;
}

/// <summary>
/// （型変換）BYTE型の値をDWORD型に変換します。
/// 例　(BYTE)0x7F 127 → (DWORD)0x0000007F  127
///     (BYTE)0x80 128 → (DWORD)0x00000080  128
///     (BYTE)0xFF 255 → (DWORD)0x000000FF  255
/// </summary>
/// <param name="a1">戻り値(DWORD型)</param>
/// <param name="a2">変換対象(BYTE型)</param>
PLCPIEC_API P_ANY BYTE_TO_DWORD(P_ANY a1,P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_DWORD;
	*a1->pDword = (T_DWORD)*a1->pByte;

	return a1;
}

/// <summary>
/// （型変換）BYTE型の値をINT型に変換します。
/// 例　(BYTE)0x7F 127 → (INT)0x007F  127
///     (BYTE)0x80 128 → (INT)0xFF80 -128
///     (BYTE)0xFF 255 → (INT)0xFFFF -  1
/// </summary>
/// <param name="a1">戻り値(INT型)</param>
/// <param name="a2">変換対象(BYTE型)</param>
PLCPIEC_API P_ANY BYTE_TO_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_INT;
	*a1->pInt = (T_INT)*a1->pByte;

	*a1->pInt = *a1->pInt <<= 8;	// 左シフトして代入したBYTE値を最上位へ移動
	*a1->pInt = *a1->pInt >>= 8;	// 右シフトで符号考慮したINT値へ変換

	return a1;
}


/// <summary>
/// （型変換）BYTE型の値をLINT型に変換します。
/// 例　(BYTE)0x7F 127 → (LINT)0x000000000000007F  127
///     (BYTE)0x80 128 → (LINT)0xFFFFFFFFFFFFFF80 -128
///     (BYTE)0xFF 255 → (LINT)0xFFFFFFFFFFFFFFFF -  1
/// </summary>
/// <param name="a1">戻り値(LINT型)</param>
/// <param name="a2">変換対象(BYTE型)</param>
PLCPIEC_API P_ANY BYTE_TO_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_LINT;
	*a1->pLint = (T_LINT)*a1->pByte;

	*a1->pLint = *a1->pLint <<= 56;	// 左シフトして代入したBYTE値を最上位へ移動
	*a1->pLint = *a1->pLint >>= 56;	// 右シフトで符号考慮したLINT値へ変換

	return a1;
}

/// <summary>
/// （型変換）BYTE型の値をSINT型に変換します。
/// 例　(BYTE)0x7F 127 → (SINT)0x7F  127
///     (BYTE)0x80 128 → (SINT)0x80 -128
///     (BYTE)0xFF 255 → (SINT)0xFF -  1
/// </summary>
/// <param name="a1">戻り値(SINT型)</param>
/// <param name="a2">変換対象(BYTE型)</param>
PLCPIEC_API P_ANY BYTE_TO_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_SINT;
	*a1->pSint = (T_SINT)*a1->pByte;

	return a1;
}

/// <summary>
/// （型変換）BYTE型の値をUDINT型に変換します。
/// 例　(BYTE)0x7F 127 → (UDINT)0x0000007F  127
///     (BYTE)0x80 128 → (UDINT)0x00000080  128
///     (BYTE)0xFF 255 → (UDINT)0x000000FF  255
/// </summary>
/// <param name="a1">戻り値(UDINT型)</param>
/// <param name="a2">変換対象(BYTE型)</param>
PLCPIEC_API P_ANY BYTE_TO_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_UDINT;
	*a1->pUdint = (T_UDINT)*a1->pByte;

	return a1;
}

/// <summary>
/// （型変換）BYTE型の値をUINT型に変換します。
/// 例　(BYTE)0x7F 127 → (UINT)0x007F  127
///     (BYTE)0x80 128 → (UINT)0x0080  128
///     (BYTE)0xFF 255 → (UINT)0x00FF  255
/// </summary>
/// <param name="a1">戻り値(UINT型)</param>
/// <param name="a2">変換対象(BYTE型)</param>
PLCPIEC_API P_ANY BYTE_TO_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_UINT;
	*a1->pUint = (T_UINT)*a1->pByte;

	return a1;
}

/// <summary>
/// （型変換）BYTE型の値をUSINT型に変換します。
/// 例　(BYTE)0x7F 127 → (USINT)0x7F  127
///     (BYTE)0x80 128 → (USINT)0x80  128
///     (BYTE)0xFF 255 → (USINT)0xFF  255
/// </summary>
/// <param name="a1">戻り値(USINT型)</param>
/// <param name="a2">変換対象(BYTE型)</param>
PLCPIEC_API P_ANY BYTE_TO_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_USINT;
	*a1->pUsint = (T_USINT)*a1->pByte;

	return a1;
}

/// <summary>
/// （型変換）BYTE型の値をWORD型に変換します。
/// 例　(BYTE)0x7F 127 → (WORD)0x007F  127
///     (BYTE)0x80 128 → (WORD)0x0080  128
///     (BYTE)0xFF 255 → (WORD)0x00FF  255
/// </summary>
/// <param name="a1">戻り値(WORD型)</param>
/// <param name="a2">変換対象(BYTE型)</param>
PLCPIEC_API P_ANY BYTE_TO_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_WORD;
	*a1->pWord = (T_WORD)*a1->pByte;

	return a1;
}

/// <summary>
/// （型変換）BYTE型の値をBOOL型に変換します。
/// 例　(BYTE)0x00   0 → (BOOL)0x0000  FALSE
///		(BYTE)0x7F 127 → (BOOL)0x0001  TRUE
///     (BYTE)0x80 128 → (BOOL)0x0001  TRUE
///     (BYTE)0xFF 255 → (BOOL)0x0001  TRUE
/// </summary>
/// <param name="a1">戻り値(WORD型)</param>
/// <param name="a2">変換対象(BOOL型)</param>
PLCPIEC_API P_ANY BYTE_TO_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_BOOL;
	*a1->pBool = (T_BOOL)(*a1->pByte != 0) ? TRUE : FALSE;

	return a1;
}

/// <summary>
/// （型変換）BYTE型の値をREAL型に変換します。
/// 例　(BYTE)0x7F 127 → (REAL)-1.0000000E+000
///     (BYTE)0x80 128 → (REAL) 1.2700000E+002
///     (BYTE)0xFF 255 → (REAL)-1.2800000E+002
/// </summary>
/// <param name="a1">戻り値(WORD型)</param>
/// <param name="a2">変換対象(REAL型)</param>
PLCPIEC_API P_ANY BYTE_TO_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_DINT work = 0;

	a1->Type = D_REAL;
	// 変換① BYTE値をREALと同サイズの符号あり整数(DINT)に変換
	work = *a1->pByte;	// BYTE値をDINT変数に代入
	work = work <<= 24;	// 左シフトして代入したBYTE値を最上位へ移動
	work = work >>= 24;	// 右シフトで符号考慮したDINT値へ変換
	// 変換② 符号あり整数をREAL型にキャスト
	*a1->pReal = (T_REAL)work;

	return a1;
}

/// <summary>
/// （型変換）BYTE型の値をLREAL型に変換します。
/// 例　(BYTE)0x7F 127 → (REAL)-1.0000000E+000
///     (BYTE)0x80 128 → (REAL) 1.2700000E+002
///     (BYTE)0xFF 255 → (REAL)-1.2800000E+002
/// </summary>
/// <param name="a1">戻り値(WORD型)</param>
/// <param name="a2">変換対象(LREAL型)</param>
PLCPIEC_API P_ANY BYTE_TO_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_LINT work = 0;

	a1->Type = D_LREAL;
	// 変換① BYTE値をREALと同サイズの符号あり整数(LINT)に変換
	work = *a1->pByte;	// BYTE値をLINT変数に代入
	work = work <<= 56;	// 左シフトして代入したBYTE値を最上位へ移動
	work = work >>= 56;	// 右シフトで符号考慮したLINT値へ変換
	// 変換② 符号あり整数をLREAL型にキャスト
	*a1->pLreal = (T_LREAL)work;

	return a1;
}