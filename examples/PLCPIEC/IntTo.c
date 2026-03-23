#include "common.h"
#include "PLCPIEC.h"

// ------------------------------------ 
//　型変換 INT型から～型へ
//-------------------------------------

/// <summary>
/// （型変換）INT型の値をBOOL型に変換します。
/// 例　(INT)0x0000      0  → (BOOL)0x00 FALSE
///     (INT)0x0001      1  → (BOOL)0x01 TRUE
///     (INT)0xFFFF     -1  → (BOOL)0x01 TRUE
///     (INT)0x7FFF  32767  → (BOOL)0x01 TRUE
/// </summary>
/// <param name="a1">戻り値(BOOL型)</param>
/// <param name="a2">変換対象(INT型)</param>
PLCPIEC_API P_ANY INT_TO_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_BOOL;
	*a1->pBool = (T_BOOL)(*a1->pInt != 0) ? TRUE : FALSE;

	return a1;
}

//-------------------------------------
/// <summary>
/// （型変換）INT型の値をBYTE型に変換します。
/// 例　(INT)0x0000       0  → (BYTE)0x00 0
///     (INT)0x0001       1  → (BYTE)0x01 1
///     (INT)0xFFFF      -1  → (BYTE)0xFF 255
///     (INT)0x7FFF   32767  → (BYTE)0xFF 255
///     (INT)0x8000  -32768  → (BYTE)0x00 0
/// </summary>
/// <param name="a1">戻り値(BYTE型)</param>
/// <param name="a2">変換対象(INT型)</param>
PLCPIEC_API P_ANY INT_TO_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_INT wk = 0;

	a1->Type = D_BYTE;
	wk = *a1->pInt;

	// パラメータの下位1バイトを戻り値にセット
	wk = wk <<= 8;
	wk = wk >>= 8;
	*a1->pByte = (T_BYTE)(wk & 0x00FF);	// 下位1バイトをマスクして取得

	return a1;
}

/// <summary>
/// （型変換）INT型の値をB_BCD型に変換します。
///           範囲:0-99を2進化10進数に変換。
///			　負の値、および100以上は0xFFに変換。
/// 例　(INT)0x0000       0  → (B_BCD)0x00
///     (INT)0x0001       1  → (B_BCD)0x01
///     (INT)0x0063      99  → (B_BCD)0x99
///     (INT)0x0064     100  → (B_BCD)0xFF
///     (INT)0x7FFF   32767  → (B_BCD)0xFF
///     (INT)0xFFFF      -1  → (B_BCD)0xFF
///     (INT)0x8000  -32768  → (B_BCD)0xFF
/// </summary>
/// <param name="a1">戻り値(B_BCD型)</param>
/// <param name="a2">変換対象(INT型)</param>
PLCPIEC_API P_ANY INT_TO_B_BCD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_BYTE  digit1  = 0;
	T_BYTE  digit10 = 0;

	a1->Type = D_BYTE;

	// 入力値の範囲チェック
	if (*a1->pInt > 99 || *a1->pInt < 0)
		// 範囲外の場合は戻り値に0xFFをセット
		*a1->pByte = 0xFF;
	else
	{
		// 範囲内の場合は整数を2進化10進2桁に変換
		digit1  = (T_BYTE)( *a1->pInt % 10);			// 1の位
		digit10 = (T_BYTE)((*a1->pInt / 10) << 4);		// 10の位
		*a1->pByte = digit1
				   + digit10;
	}

	return a1;
}

/// <summary>
/// （型変換）INT型の値をD_BCD型に変換します。
///           範囲:0-32767を2進化10進数に変換。
///			　負の値は0xFFFFFFFFに変換。
/// 例　(INT)0x0000       0  → (D_BCD)0x00000000
///     (INT)0x0001       1  → (D_BCD)0x00000001
///     (INT)0x7FFF   32767  → (D_BCD)0x00032767
///     (INT)0xFFFF      -1  → (D_BCD)0xFFFFFFFF
///     (INT)0x8000  -32768  → (D_BCD)0xFFFFFFFF
/// </summary>
/// <param name="a1">戻り値(D_BCD型)</param>
/// <param name="a2">変換対象(INT型)</param>
PLCPIEC_API P_ANY INT_TO_D_BCD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_DWORD digit1 = 0;
	T_DWORD digit10 = 0;
	T_DWORD digit100 = 0;
	T_DWORD digit1000 = 0;
	T_DWORD digit10000 = 0;

	a1->Type = D_DWORD;

	// 入力値の範囲チェック
	if (*a1->pInt < 0)
		// 範囲外の場合は戻り値に0xFFFFFFFFをセット
		*a1->pDword = 0xFFFFFFFF;
	else
	{	
		// 範囲内の場合は整数を2進化10進2桁に変換
		digit10000 = (T_DWORD)(( *a1->pInt / 10000)         << 16);	// 10000の位
		digit1000  = (T_DWORD)(((*a1->pInt % 10000) / 1000) << 12);	// 1000の位
		digit100   = (T_DWORD)(((*a1->pInt % 1000)  / 100)  << 8);	// 100の位
		digit10    = (T_DWORD)(((*a1->pInt % 100)   / 10)   << 4);	// 10の位
		digit1     = (T_DWORD)(( *a1->pInt % 10));					// 1の位
		
		*a1->pDword = digit10000
					+ digit1000
					+ digit100
					+ digit10
					+ digit1;
	}

	return a1;
}

/// <summary>
/// （型変換）INT型の値をW_BCD型に変換します。
///           範囲:0-9999を2進化10進数に変換。
///			　10000以上、負の値は0xFFFFに変換。
/// 例　(INT)0x0000       0  → (W_BCD)0x0000
///     (INT)0x0001       1  → (W_BCD)0x0001
///     (INT)0x270F    9999  → (W_BCD)0x9999
///     (INT)0x2710   10000  → (W_BCD)0xFFFF
///     (INT)0x7FFF   32767  → (W_BCD)0xFFFF
///     (INT)0xFFFF      -1  → (W_BCD)0xFFFF
///     (INT)0x8000  -32768  → (W_BCD)0xFFFF
/// </summary>
/// <param name="a1">戻り値(W_BCD型)</param>
/// <param name="a2">変換対象(INT型)</param>
PLCPIEC_API P_ANY INT_TO_W_BCD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_INT digit1 = 0;
	T_INT digit10 = 0;
	T_INT digit100 = 0;
	T_INT digit1000 = 0;

	a1->Type = D_WORD;

	// 入力値の範囲チェック
	if (*a1->pInt > 9999 || *a1->pInt < 0)
		// 範囲外の場合は戻り値に0xFFFFをセット
		*a1->pWord = 0xFFFF;
	else
	{
		// 範囲内の場合は整数を2進化10進2桁に変換
		digit1    = (T_INT)(( *a1->pInt / 1000)        << 12);	// 1000の位
		digit10   = (T_INT)(((*a1->pInt % 1000) / 100) << 8);	// 100の位
		digit100  = (T_INT)(((*a1->pInt % 100)  / 10)  << 4);	// 10の位
		digit1000 = (T_INT)(  *a1->pInt % 10);					// 1の位
		*a1->pWord = digit1
				   + digit10
				   + digit100
				   + digit1000;
	}	
		 
	return a1;
}

/// <summary>
/// （型変換）INT型の値をDINT型に変換します。
/// 例　(INT)0x0000       0  → (DINT)0x00000000       0
///     (INT)0x0001       1  → (DINT)0x00000001       1
///     (INT)0x7FFF   32767  → (DINT)0x00007FFF   32767
///     (INT)0xFFFF      -1  → (DINT)0xFFFFFFFF      -1
///     (INT)0x8000  -32768  → (DINT)0xFFFF8000  -32768
/// </summary>
/// <param name="a1">戻り値(W_BCD型)</param>
/// <param name="a2">変換対象(INT型)</param>
PLCPIEC_API P_ANY INT_TO_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_DINT;

	*a1->pDint = (T_DINT)*a1->pInt;

	return a1;
}

/// （型変換）INT型の値をWORD型に変換します。
/// 例　(INT)0x0000       0  → (WORD)0x0000
///     (INT)0x0001       1  → (WORD)0x0001
///     (INT)0x7FFF   32767  → (WORD)0x7FFF
///     (INT)0xFFFF      -1  → (WORD)0xFFFF
///     (INT)0x8000  -32768  → (WORD)0x8000
/// </summary>
/// <param name="a1">戻り値(WORD型)</param>
/// <param name="a2">変換対象(INT型)</param>
PLCPIEC_API P_ANY INT_TO_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_WORD wk = 0;
	a1->Type = D_WORD;

	*a1->pWord = (T_WORD)*a1->pInt;		// INT値をWORD変数に代入
	
	return a1;
}

/// <summary>
/// （型変換）INT型の値をDWORD型に変換します。
/// 例　(INT)0x0000       0  → (DWORD)0x00000000
///     (INT)0x0001       1  → (DWORD)0x00000001
///     (INT)0x7FFF   32767  → (DWORD)0x00007FFF
///     (INT)0xFFFF      -1  → (DWORD)0x0000FFFF
///     (INT)0x8000  -32768  → (DWORD)0x00008000
/// </summary>
/// <param name="a1">戻り値(DWORD型)</param>
/// <param name="a2">変換対象(INT型)</param>
PLCPIEC_API P_ANY INT_TO_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_DWORD wk = 0;
	a1->Type = D_DWORD;

	wk = (T_DWORD)*a1->pInt;		// INT値をDINT変数に代入
	*a1->pDword = wk & 0x0000FFFF;	// 代入された値のうち、INT型のサイズ範囲のみマスクする
		
	return a1;
}

/// <summary>
/// （型変換）INT型の値をLINT型に変換します。
/// 例　(INT)0x0000       0  → (LINT)0x0000000000000000       0
///     (INT)0x0001       1  → (LINT)0x0000000000000001       1
///     (INT)0x7FFF   32767  → (LINT)0x0000000000007FFF   32767
///     (INT)0xFFFF      -1  → (LINT)0xFFFFFFFFFFFFFFFF      -1
///     (INT)0x8000  -32768  → (LINT)0xFFFFFFFFFFFF8000  -32768
/// </summary>
/// <param name="a1">戻り値(LINT型)</param>
/// <param name="a2">変換対象(INT型)</param>
PLCPIEC_API P_ANY INT_TO_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_LINT;

	*a1->pLint = (T_LINT)*a1->pInt;	// INT値をLINT変数に代入

	return a1;
}

/// <summary>
/// （型変換）INT型の値をLREAL型に変換します。
/// 例　(INT)0x0000       0  → (LREAL)0.0000000E+000
///     (INT)0x0001       1  → (LREAL)1.0000000E+000
///     (INT)0x7FFF   32767  → (LREAL)3.2767000E+004
///     (INT)0xFFFF      -1  → (LREAL)-1.0000000E+000
///     (INT)0x8000  -32768  → (LREAL)-3.2768000E+004
/// </summary>
/// <param name="a1">戻り値(LREAL型)</param>
/// <param name="a2">変換対象(INT型)</param>
PLCPIEC_API P_ANY INT_TO_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_LREAL;

	*a1->pLreal = (T_LREAL)*a1->pInt;	// INT値をLREAL変数に代入

	return a1;
}

/// <summary>
/// （型変換）INT型の値をREAL型に変換します。
/// 例　(INT)0x0000       0  → (REAL)0.0000000E+000
///     (INT)0x0001       1  → (REAL)1.0000000E+000
///     (INT)0x7FFF   32767  → (REAL)3.2767000E+004
///     (INT)0xFFFF      -1  → (REAL)-1.0000000E+000
///     (INT)0x8000  -32768  → (REAL)-3.2768000E+004
/// </summary>
/// <param name="a1">戻り値(REAL型)</param>
/// <param name="a2">変換対象(INT型)</param>
PLCPIEC_API P_ANY INT_TO_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_REAL;

	*a1->pReal = (T_REAL)*a1->pInt;	// INT値をREAL変数に代入

	return a1;
}

/// <summary>
/// （型変換）INT型の値をSINT型に変換します。
/// 例　(INT)0x0000       0  → (SINT)0x00       0
///     (INT)0x0001       1  → (SINT)0x01       1
///     (INT)0x007F     127  → (SINT)0x7F     127
///     (INT)0x0080    -128  → (SINT)0x80    -128
///     (INT)0x7FFF   32767  → (SINT)0xFF      -1
///     (INT)0xFFFF      -1  → (SINT)0xFF      -1
///     (INT)0x8000  -32768  → (SINT)0x00       0
/// </summary>
/// <param name="a1">戻り値(SINT型)</param>
/// <param name="a2">変換対象(INT型)</param>
PLCPIEC_API P_ANY INT_TO_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_SINT;

	*a1->pSint = (T_SINT)*a1->pInt;	// INT値をSINT変数に代入

	return a1;
}

/// <summary>
/// （型変換）INT型の値をUDINT型に変換します。
/// 例　(INT)0x0000       0  → (UDINT)0x00000000       0
///     (INT)0x0001       1  → (UDINT)0x00000001       1
///     (INT)0x7FFF   32767  → (UDINT)0x00007FFF   32767
///     (INT)0xFFFF      -1  → (UDINT)0x0000FFFF   65535
///     (INT)0x8000  -32768  → (UDINT)0x00008000   32768
/// </summary>
/// <param name="a1">戻り値(UDINT型)</param>
/// <param name="a2">変換対象(INT型)</param>
PLCPIEC_API P_ANY INT_TO_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_UDINT wk = 0;

	a1->Type = D_UDINT;
	wk = (T_UDINT)*a1->pInt;		// INT値をUDINT変数に代入
	*a1->pUdint = wk & 0x0000FFFF;	// 代入された値のうち、INT型のサイズ範囲のみマスクする

	return a1;
}

/// <summary>
/// （型変換）INT型の値をUINT型に変換します。
/// 例　(INT)0x0000       0  → (UINT)0x0000       0
///     (INT)0x0001       1  → (UINT)0x0001       1
///     (INT)0x7FFF   32767  → (UINT)0x7FFF   32767
///     (INT)0xFFFF      -1  → (UINT)0xFFFF   65535
///     (INT)0x8000  -32768  → (UINT)0x8000   32768
/// </summary>
/// <param name="a1">戻り値(UINT型)</param>
/// <param name="a2">変換対象(INT型)</param>
PLCPIEC_API P_ANY INT_TO_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_UINT;

	*a1->pUint = (T_UINT)*a1->pInt;	// INT値をUINT変数に代入

	return a1;
}

/// <summary>
/// （型変換）INT型の値をUSINT型に変換します。
/// 例　(INT)0x0000       0  → (USINT)0x00       0
///     (INT)0x0001       1  → (USINT)0x01       1
///     (INT)0x007F     127  → (USINT)0x7F     127
///     (INT)0x7FFF   32767  → (USINT)0xFF     255
///     (INT)0xFFFF      -1  → (USINT)0xFF     255
///     (INT)0x0080    -128  → (USINT)0x80     128
///     (INT)0x8000  -32768  → (USINT)0x00       0
/// </summary>
/// <param name="a1">戻り値(USINT型)</param>
/// <param name="a2">変換対象(INT型)</param>
PLCPIEC_API P_ANY INT_TO_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_USINT;

	*a1->pUsint = (T_USINT)*a1->pInt;	// INT値をUSINT変数に代入

	return a1;
}