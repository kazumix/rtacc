#include "common.h"
#include "PLCPIEC.h"

#define  CONV_ERR_NUM 0xFFFFFFFFFFFFFFFF
#define  CONV_ERR_BCD 0xFFFFFFFF

T_BOOL STAT_ENO_BCD_TO;	// BCD_TO用ENO状態保持変数(シングルスレッド用)

/// <summary>
/// BCD_TO処理結果のENOを設定します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ書込みへ変更する必要あり
/// </summary>
/// <param name="eno">ENOの値</param>
/// <returns> (なし) </returns>
PLCPIEC_API void SetBcdToEno(T_BOOL eno)
{
	STAT_ENO_BCD_TO = eno;
}

/// <summary>
/// BCD_TO処理結果のENOを返却します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ参照へ変更する必要あり
/// </summary>
/// <returns></returns>
PLCPIEC_API T_BOOL GetBcdToEno()
{
	return STAT_ENO_BCD_TO;
}

// ------------------------------------ 
//　型変換 BCD型から数値型へ
//-------------------------------------

/// <summary>
/// （型変換）B_BCD型の値をDINT型に変換します。
/// 例　(B_BCD)0x00  → (DINT)0x00000000   0
///     (B_BCD)0x01  → (DINT)0x00000001   1
///     (B_BCD)0x99  → (DINT)0x00000063  99
///     (B_BCD)0xFF  → (DINT)0xFFFFFFFF  -1
///     (B_BCD)0x0A  → (DINT)0xFFFFFFFF  -1
///     (B_BCD)0xA0  → (DINT)0xFFFFFFFF  -1
/// </summary>
/// <param name="a1">戻り値(DINT型)</param>
/// <param name="a2">変換対象(B_BCD型)</param>
PLCPIEC_API P_ANY B_BCD_TO_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetBcdToEno(TRUE);	// ENOフラグのリセット

	T_BYTE wk1 = 0;
	T_BYTE wk2 = 0;
	T_DINT digit1  = 0;
	T_DINT digit10 = 0;

	a1->Type = D_DINT;

	// 各桁が0 - 9の範囲であるか判定
	wk1 = (*a1->pByte & 0xF0) >> 4;		// 上位4ビット取得
	wk2 =  *a1->pByte & 0x0F;			// 下位4ビット取得
	if (wk1 > 9 || wk2 > 9)
	{
		*a1->pDint = 0xFFFFFFFF;		// 範囲外の値が入力された場合は固定値-1を返す
		SetBcdToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		digit10  = (T_DINT)(wk1 * 10);	// 10の位の値を算出
		digit1   = (T_DINT) wk2;		// 1の位の値を算出

		*a1->pDint = digit10 + digit1;	// 2進化10進数2桁を整数値に変換
	}
	return a1;
}

/// <summary>
/// （型変換）B_BCD型の値をINT型に変換します。
/// 例　(B_BCD)0x00  → (INT)0x0000   0
///     (B_BCD)0x01  → (INT)0x0001   1
///     (B_BCD)0x99  → (INT)0x0063  99
///     (B_BCD)0xFF  → (INT)0xFFFF  -1
///     (B_BCD)0x0A  → (INT)0xFFFF  -1
///     (B_BCD)0xA0  → (INT)0xFFFF  -1
/// </summary>
/// <param name="a1">戻り値(INT型)</param>
/// <param name="a2">変換対象(B_BCD型)</param>
PLCPIEC_API P_ANY B_BCD_TO_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetBcdToEno(TRUE);	// ENOフラグのリセット

	T_BYTE wk1 = 0;
	T_BYTE wk2 = 0;
	T_INT digit1 = 0;
	T_INT digit10 = 0;

	a1->Type = D_INT;

	// 各桁が0 - 9の範囲であるか判定
	wk1 = (*a1->pByte & 0xF0) >> 4;		// 上位4ビット取得
	wk2 =  *a1->pByte & 0x0F;			// 下位4ビット取得
	if (wk1 > 9 || wk2 > 9)
	{
		*a1->pInt = 0xFFFF;			// 範囲外の値が入力された場合は固定値-1を返す
		SetBcdToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		digit10  = (T_INT)(wk1 * 10);	// 10の位の値を算出
		digit1   = (T_INT) wk2;			// 1の位の値を算出

		*a1->pInt = digit10 + digit1;	// 2進化10進数2桁を整数値に変換
	}

	return a1;
}

/// <summary>
/// （型変換）B_BCD型の値をLINT型に変換します。
/// 例　(B_BCD)0x00  → (LINT)0x0000000000000000   0
///     (B_BCD)0x01  → (LINT)0x0000000000000001   1
///     (B_BCD)0x99  → (LINT)0x0000000000000063  99
///     (B_BCD)0xFF  → (LINT)0xFFFFFFFFFFFFFFFF  -1
///     (B_BCD)0x0A  → (LINT)0xFFFFFFFFFFFFFFFF  -1
///     (B_BCD)0xA0  → (LINT)0xFFFFFFFFFFFFFFFF  -1
/// </summary>
/// <param name="a1">戻り値(LINT型)</param>
/// <param name="a2">変換対象(B_BCD型)</param>
PLCPIEC_API P_ANY B_BCD_TO_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetBcdToEno(TRUE);	// ENOフラグのリセット

	T_BYTE wk1 = 0;
	T_BYTE wk2 = 0;
	T_LINT digit1 = 0;
	T_LINT digit10 = 0;

	a1->Type = D_LINT;

	// 各桁が0 - 9の範囲であるか判定
	wk1 = (*a1->pByte & 0xF0) >> 4;		// 上位4ビット取得
	wk2 =  *a1->pByte & 0x0F;			// 下位4ビット取得
	if (wk1 > 9 || wk2 > 9)
	{		
		*a1->pLint = 0xFFFFFFFFFFFFFFFF;		// 範囲外の値が入力された場合は固定値-1を返す
		SetBcdToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
		
	else
	{
		digit10 = (T_INT)(wk1 * 10);	// 10の位の値を算出
		digit1  = (T_INT) wk2;			// 1の位の値を算出

		*a1->pLint = digit10 + digit1;	// 2進化10進数2桁を整数値に変換
	}

	return a1;
}

/// <summary>
/// （型変換）B_BCD型の値をSINT型に変換します。
/// 例　(B_BCD)0x00  → (SINT)0x00   0
///     (B_BCD)0x01  → (SINT)0x01   1
///     (B_BCD)0x99  → (SINT)0x63  99
///     (B_BCD)0xFF  → (SINT)0xFF  -1
///     (B_BCD)0x0A  → (SINT)0xFF  -1
///     (B_BCD)0xA0  → (SINT)0xFF  -1
/// </summary>
/// <param name="a1">戻り値(SINT型)</param>
/// <param name="a2">変換対象(B_BCD型)</param>
PLCPIEC_API P_ANY B_BCD_TO_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetBcdToEno(TRUE);	// ENOフラグのリセット

	T_BYTE wk1 = 0;
	T_BYTE wk2 = 0;
	T_SINT digit1  = 0;
	T_SINT digit10 = 0;

	a1->Type = D_SINT;

	// 各桁が0 - 9の範囲であるか判定
	wk1 = (*a1->pByte & 0xF0) >> 4;		// 上位4ビット取得
	wk2 =  *a1->pByte & 0x0F;			// 下位4ビット取得
	if (wk1 > 9 || wk2 > 9)
	{
		*a1->pSint = 0xFF;				// 範囲外の値が入力された場合は固定値-1を返す
		SetBcdToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		digit10 = (T_INT)(wk1 * 10);	// 10の位の値を算出
		digit1  = (T_INT) wk2;			// 1の位の値を算出

		*a1->pSint = digit10 + digit1;	// 2進化10進数2桁を整数値に変換
	}

	return a1;
}

/// <summary>
/// （型変換）D_BCD型の値をDINT型に変換します。
/// 例　(D_BCD)0x00000000  → (DINT)0x00000000         0
///     (D_BCD)0x00000001  → (DINT)0x00000001         1
///     (D_BCD)0x99999999  → (DINT)0x05F5E0FF  99999999
///     (D_BCD)0xFFFFFFFF  → (DINT)0xFFFFFFFF        -1
///     (D_BCD)0x0000000A  → (DINT)0xFFFFFFFF        -1
///     (D_BCD)0xA0000000  → (DINT)0xFFFFFFFF        -1
/// </summary>
/// <param name="a1">戻り値(DINT型)</param>
/// <param name="a2">変換対象(D_BCD型)</param>
PLCPIEC_API P_ANY BCD_TO_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetBcdToEno(TRUE);	// ENOフラグのリセット

	T_BYTE wk1 = 0;
	T_BYTE wk2 = 0;
	T_BYTE wk3 = 0;
	T_BYTE wk4 = 0;
	T_BYTE wk5 = 0;
	T_BYTE wk6 = 0;
	T_BYTE wk7 = 0;
	T_BYTE wk8 = 0;
	T_DINT digit1         = 0;
	T_DINT digit10        = 0;
	T_DINT digit100       = 0;
	T_DINT digit1000      = 0;
	T_DINT digit10000     = 0;
	T_DINT digit100000    = 0;
	T_DINT digit1000000   = 0;
	T_DINT digit10000000  = 0;
	T_DINT digit100000000 = 0;

	a1->Type = D_DINT;

	// 各桁が0 - 9の範囲であるか判定
	wk1 = (T_BYTE)((*a1->pDword & 0xF0000000) >> 28);	// 0-4ビット取得
	wk2 = (T_BYTE)((*a1->pDword & 0x0F000000) >> 24);	// 5-8ビット取得
	wk3 = (T_BYTE)((*a1->pDword & 0x00F00000) >> 20);	// 9-12ビット取得
	wk4 = (T_BYTE)((*a1->pDword & 0x000F0000) >> 16);	// 13-16ビット取得
	wk5 = (T_BYTE)((*a1->pDword & 0x0000F000) >> 12);	// 17-20ビット取得
	wk6 = (T_BYTE)((*a1->pDword & 0x00000F00) >> 8 );	// 21-24ビット取得
	wk7 = (T_BYTE)((*a1->pDword & 0x000000F0) >> 4 );	// 25-28ビット取得
	wk8 = (T_BYTE)( *a1->pDword & 0x0000000F);			// 29-32ビット取得
	if (wk1 > 9 || wk2 > 9 || wk3 > 9 || wk4 > 9
		|| wk5 > 9 || wk6 > 9 || wk7 > 9 || wk8 > 9)
	{
		*a1->pDint = 0xFFFFFFFF;		// 範囲外の値が入力された場合は固定値-1を返す
		SetBcdToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
		
	else
	{
		digit1         = (T_DINT) wk8;				// 1の位
		digit10		   = (T_DINT)(wk7 * 10);		// 10の位
		digit100       = (T_DINT)(wk6 * 100);		// 100の位
		digit1000      = (T_DINT)(wk5 * 1000);		// 1000の位
		digit10000     = (T_DINT)(wk4 * 10000);		// 10000の位
		digit100000    = (T_DINT)(wk3 * 100000);	// 100000の位
		digit1000000   = (T_DINT)(wk2 * 1000000);	// 1000000の位
		digit100000000 = (T_DINT)(wk1 * 10000000);	// 10000000の位の整数値を算出
		*a1->pDint = digit1
				   + digit10
				   + digit100
				   + digit1000
				   + digit10000
				   + digit100000
				   + digit1000000
				   + digit100000000;		// 2進化10進数2桁を整数値に変換
	}
	return a1;
}

/// <summary>
/// （型変換）D_BCD型の値をDINT型に変換します。
///           ※ BCD_TO_DINTと関数名のみ異なる
/// 例　(D_BCD)0x00000000  → (DINT)0x00000000         0
///     (D_BCD)0x00000001  → (DINT)0x00000001         1
///     (D_BCD)0x99999999  → (DINT)0x05F5E0FF  99999999
///     (D_BCD)0xFFFFFFFF  → (DINT)0xFFFFFFFF        -1
///     (D_BCD)0x0000000A  → (DINT)0xFFFFFFFF        -1
///     (D_BCD)0xA0000000  → (DINT)0xFFFFFFFF        -1
/// </summary>
/// <param name="a1">戻り値(DINT型)</param>
/// <param name="a2">変換対象(D_BCD型)</param>
PLCPIEC_API P_ANY D_BCD_TO_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	return BCD_TO_DINT( a1, a2, a3, a4);		// BCD_TO_DINTと同じ処理のため、内部で呼び出す
}

/// <summary>
/// （型変換）D_BCD型の値をINT型に変換します。
/// 例　(D_BCD)0x00000000  → (INT)0x0000         0
///     (D_BCD)0x00000001  → (INT)0x0001         1
///     (D_BCD)0x00032767  → (INT)0x7FFF     32767
///     (D_BCD)0x00032768  → (INT)0xFFFF        -1
///     (D_BCD)0xFFFFFFFF  → (INT)0xFFFF        -1
///     (D_BCD)0x0000000A  → (INT)0xFFFF        -1
///     (D_BCD)0xA0000000  → (INT)0xFFFF        -1
/// </summary>
/// <param name="a1">戻り値(INT型)</param>
/// <param name="a2">変換対象(D_BCD型)</param>
PLCPIEC_API P_ANY D_BCD_TO_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetBcdToEno(TRUE);	// ENOフラグのリセット

	T_DINT wkTotal = 0;
	T_BYTE wk1 = 0;
	T_BYTE wk2 = 0;
	T_BYTE wk3 = 0;
	T_BYTE wk4 = 0;
	T_BYTE wk5 = 0;
	T_BYTE wk6 = 0;
	T_BYTE wk7 = 0;
	T_BYTE wk8 = 0;
	T_DINT digit1 = 0;
	T_DINT digit10 = 0;
	T_DINT digit100 = 0;
	T_DINT digit1000 = 0;
	T_DINT digit10000 = 0;
	T_DINT digit100000 = 0;
	T_DINT digit1000000 = 0;
	T_DINT digit10000000 = 0;
	T_DINT digit100000000 = 0;

	a1->Type = D_INT;

	// 各桁が0 - 9の範囲であるか判定
	wk1 = (T_BYTE)((*a1->pDword & 0xF0000000) >> 28);	// 0-4ビット取得
	wk2 = (T_BYTE)((*a1->pDword & 0x0F000000) >> 24);	// 5-8ビット取得
	wk3 = (T_BYTE)((*a1->pDword & 0x00F00000) >> 20);	// 9-12ビット取得
	wk4 = (T_BYTE)((*a1->pDword & 0x000F0000) >> 16);	// 13-16ビット取得
	wk5 = (T_BYTE)((*a1->pDword & 0x0000F000) >> 12);	// 17-20ビット取得
	wk6 = (T_BYTE)((*a1->pDword & 0x00000F00) >> 8 );	// 21-24ビット取得
	wk7 = (T_BYTE)((*a1->pDword & 0x000000F0) >> 4 );	// 25-28ビット取得
	wk8 = (T_BYTE)( *a1->pDword & 0x0000000F);			// 29-32ビット取得
	if (wk1 > 9 || wk2 > 9 || wk3 > 9 || wk4 > 9
		|| wk5 > 9 || wk6 > 9 || wk7 > 9 || wk8 > 9)
	{
		*a1->pInt = 0xFFFF;		// 範囲外の値が入力された場合は固定値-1を返す
		SetBcdToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		digit1			= (T_DINT)wk8;				// 1の位
		digit10			= (T_DINT)(wk7 * 10);		// 10の位
		digit100		= (T_DINT)(wk6 * 100);		// 100の位
		digit1000		= (T_DINT)(wk5 * 1000);		// 1000の位
		digit10000		= (T_DINT)(wk4 * 10000);	// 10000の位
		digit100000		= (T_DINT)(wk3 * 100000);	// 100000の位
		digit1000000	= (T_DINT)(wk2 * 1000000);	// 1000000の位
		digit100000000	= (T_DINT)(wk1 * 10000000);	// 10000000の位の整数値を算出
		wkTotal = digit1
				+ digit10
				+ digit100
				+ digit1000
				+ digit10000
				+ digit100000
				+ digit1000000
				+ digit100000000;		// 2進化10進数2桁を整数値に変換 (DINT型に一次受け)

		// 変換した整数値がINT型の最大値より大きい(オーバーフローする)場合
		if (wkTotal > 0x00007FFF)
		{
			*a1->pInt = 0xFFFF;				// オーバーフローする場合は固定値-1を返す
			SetBcdToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		}
		else
			*a1->pInt = (T_INT)wkTotal;		// INT型にキャストして戻り値にセット
	}

	return a1;
}

/// <summary>
/// （型変換）D_BCD型の値をLINT型に変換します。
/// 例　(D_BCD)0x00000000  → (LINT)0x0000000000000000         0
///     (D_BCD)0x00000001  → (LINT)0x0000000000000001         1
///     (D_BCD)0x99999999  → (LINT)0x0000000005F5E0FF  99999999
///     (D_BCD)0xFFFFFFFF  → (LINT)0xFFFFFFFFFFFFFFFF        -1
///     (D_BCD)0x0000000A  → (LINT)0xFFFFFFFFFFFFFFFF        -1
///     (D_BCD)0xA0000000  → (LINT)0xFFFFFFFFFFFFFFFF        -1
/// </summary>
/// <param name="a1">戻り値(LINT型)</param>
/// <param name="a2">変換対象(D_BCD型)</param>
PLCPIEC_API P_ANY D_BCD_TO_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetBcdToEno(TRUE);	// ENOフラグのリセット

	T_BYTE wk1 = 0;
	T_BYTE wk2 = 0;
	T_BYTE wk3 = 0;
	T_BYTE wk4 = 0;
	T_BYTE wk5 = 0;
	T_BYTE wk6 = 0;
	T_BYTE wk7 = 0;
	T_BYTE wk8 = 0;
	T_DINT digit1 = 0;
	T_DINT digit10 = 0;
	T_DINT digit100 = 0;
	T_DINT digit1000 = 0;
	T_DINT digit10000 = 0;
	T_DINT digit100000 = 0;
	T_DINT digit1000000 = 0;
	T_DINT digit10000000 = 0;
	T_DINT digit100000000 = 0;

	a1->Type = D_LINT;

	// 各桁が0 - 9の範囲であるか判定
	wk1 = (T_BYTE)((*a1->pDword & 0xF0000000) >> 28);	// 0-4ビット取得
	wk2 = (T_BYTE)((*a1->pDword & 0x0F000000) >> 24);	// 5-8ビット取得
	wk3 = (T_BYTE)((*a1->pDword & 0x00F00000) >> 20);	// 9-12ビット取得
	wk4 = (T_BYTE)((*a1->pDword & 0x000F0000) >> 16);	// 13-16ビット取得
	wk5 = (T_BYTE)((*a1->pDword & 0x0000F000) >> 12);	// 17-20ビット取得
	wk6 = (T_BYTE)((*a1->pDword & 0x00000F00) >> 8 );	// 21-24ビット取得
	wk7 = (T_BYTE)((*a1->pDword & 0x000000F0) >> 4 );	// 25-28ビット取得
	wk8 = (T_BYTE)( *a1->pDword & 0x0000000F);			// 29-32ビット取得
	if (wk1 > 9 || wk2 > 9 || wk3 > 9 || wk4 > 9
		|| wk5 > 9 || wk6 > 9 || wk7 > 9 || wk8 > 9)
	{
		*a1->pLint = 0xFFFFFFFFFFFFFFFF;		// 範囲外の値が入力された場合は固定値-1を返す
		SetBcdToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		digit1         = (T_DINT) wk8;				// 1の位
		digit10		   = (T_DINT)(wk7 * 10);		// 10の位
		digit100       = (T_DINT)(wk6 * 100);		// 100の位
		digit1000      = (T_DINT)(wk5 * 1000);		// 1000の位
		digit10000     = (T_DINT)(wk4 * 10000);		// 10000の位
		digit100000    = (T_DINT)(wk3 * 100000);	// 100000の位
		digit1000000   = (T_DINT)(wk2 * 1000000);	// 1000000の位
		digit100000000 = (T_DINT)(wk1 * 10000000);	// 10000000の位の整数値を算出
		*a1->pLint = digit1
			       + digit10
			       + digit100
			       + digit1000
			       + digit10000
			       + digit100000
			       + digit1000000
			       + digit100000000;		// 2進化10進数2桁を整数値に変換
	}
	return a1;
}

/// <summary>
/// （型変換）D_BCD型の値をSINT型に変換します。
/// 例　(D_BCD)0x00000000  → (INT)0x00         0
///     (D_BCD)0x00000001  → (INT)0x01         1
///     (D_BCD)0x00000127  → (INT)0x7F       127
///     (D_BCD)0x00000128  → (INT)0xFF        -1
///     (D_BCD)0xFFFFFFFF  → (INT)0xFF        -1
///     (D_BCD)0x0000000A  → (INT)0xFF        -1
///     (D_BCD)0xA0000000  → (INT)0xFF        -1
/// </summary>
/// <param name="a1">戻り値(SINT型)</param>
/// <param name="a2">変換対象(D_BCD型)</param>
PLCPIEC_API P_ANY D_BCD_TO_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetBcdToEno(TRUE);	// ENOフラグのリセット

	T_DINT wkTotal = 0;
	T_BYTE wk1 = 0;
	T_BYTE wk2 = 0;
	T_BYTE wk3 = 0;
	T_BYTE wk4 = 0;
	T_BYTE wk5 = 0;
	T_BYTE wk6 = 0;
	T_BYTE wk7 = 0;
	T_BYTE wk8 = 0;
	T_DINT digit1 = 0;
	T_DINT digit10 = 0;
	T_DINT digit100 = 0;
	T_DINT digit1000 = 0;
	T_DINT digit10000 = 0;
	T_DINT digit100000 = 0;
	T_DINT digit1000000 = 0;
	T_DINT digit10000000 = 0;
	T_DINT digit100000000 = 0;

	a1->Type = D_SINT;

	// 各桁が0 - 9の範囲であるか判定
	wk1 = (T_BYTE)((*a1->pDword & 0xF0000000) >> 28);	// 0-4ビット取得
	wk2 = (T_BYTE)((*a1->pDword & 0x0F000000) >> 24);	// 5-8ビット取得
	wk3 = (T_BYTE)((*a1->pDword & 0x00F00000) >> 20);	// 9-12ビット取得
	wk4 = (T_BYTE)((*a1->pDword & 0x000F0000) >> 16);	// 13-16ビット取得
	wk5 = (T_BYTE)((*a1->pDword & 0x0000F000) >> 12);	// 17-20ビット取得
	wk6 = (T_BYTE)((*a1->pDword & 0x00000F00) >> 8 );	// 21-24ビット取得
	wk7 = (T_BYTE)((*a1->pDword & 0x000000F0) >> 4 );	// 25-28ビット取得
	wk8 = (T_BYTE)( *a1->pDword & 0x0000000F);			// 29-32ビット取得
	if (wk1 > 9 || wk2 > 9 || wk3 > 9 || wk4 > 9
		|| wk5 > 9 || wk6 > 9 || wk7 > 9 || wk8 > 9)
	{
		*a1->pSint = 0xFF;		// 範囲外の値が入力された場合は固定値-1を返す
		SetBcdToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		digit1			 = (T_DINT)wk8;				// 1の位
		digit10			 = (T_DINT)(wk7 * 10);		// 10の位
		digit100		 = (T_DINT)(wk6 * 100);		// 100の位
		digit1000		 = (T_DINT)(wk5 * 1000);	// 1000の位
		digit10000		 = (T_DINT)(wk4 * 10000);	// 10000の位
		digit100000		 = (T_DINT)(wk3 * 100000);	// 100000の位
		digit1000000	 = (T_DINT)(wk2 * 1000000);	// 1000000の位
		digit100000000	 = (T_DINT)(wk1 * 10000000);// 10000000の位の整数値を算出
		wkTotal = digit1
			    + digit10
			    + digit100
			    + digit1000
			    + digit10000
			    + digit100000
			    + digit1000000
			    + digit100000000;		// 2進化10進数2桁を整数値に変換 (DINT型に一次受け)

		// 変換した整数値がSINT型の最大値より大きい(オーバーフローする)場合
		if (wkTotal > 127)
		{
			*a1->pSint = 0xFF;					// オーバーフローする場合は固定値-1を返す
			SetBcdToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		}
		else
			*a1->pSint = (T_SINT)wkTotal;		// INT型にキャストして戻り値にセット
	}

	return a1;
}

/// <summary>
/// （型変換）W_BCD型の値をDINT型に変換します。
/// 例　(W_BCD)0x0000  → (DINT)0x00000000         0
///     (W_BCD)0x0001  → (DINT)0x00000001         1
///     (W_BCD)0x9999  → (DINT)0x0000270F      9999
///     (W_BCD)0xFFFF  → (DINT)0xFFFFFFFF        -1
///     (W_BCD)0x000A  → (DINT)0xFFFFFFFF        -1
///     (W_BCD)0xA000  → (DINT)0xFFFFFFFF        -1
/// </summary>
/// <param name="a1">戻り値(DINT型)</param>
/// <param name="a2">変換対象(W_BCD型)</param>
PLCPIEC_API P_ANY W_BCD_TO_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetBcdToEno(TRUE);	// ENOフラグのリセット

	T_BYTE wk1 = 0;
	T_BYTE wk2 = 0;
	T_BYTE wk3 = 0;
	T_BYTE wk4 = 0;
	T_DINT digit1 = 0;
	T_DINT digit10 = 0;
	T_DINT digit100 = 0;
	T_DINT digit1000 = 0;

	a1->Type = D_DINT;

	// 各桁が0 - 9の範囲であるか判定
	wk1 = (*a1->pWord & 0xF000) >> 12;	// 0-4ビット取得
	wk2 = (*a1->pWord & 0x0F00) >> 8;	// 5-8ビット取得
	wk3 = (*a1->pWord & 0x00F0) >> 4;	// 9-12ビット取得
	wk4 = (*a1->pWord & 0x000F);		// 13-16ビット取得
	if (wk1 > 9 || wk2 > 9 || wk3 > 9 || wk4 > 9)
	{
		*a1->pDint = 0xFFFFFFFF;		// 範囲外の値が入力された場合は固定値-1を返す
		SetBcdToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		digit1		 = (T_DINT) wk4;			// 1の位
		digit10		 = (T_DINT)(wk3 * 10);		// 10の位
		digit100	 = (T_DINT)(wk2 * 100);		// 100の位
		digit1000	 = (T_DINT)(wk1 * 1000);	// 1000の位

		*a1->pDint = digit1
				   + digit10
				   + digit100
				   + digit1000;	// 2進化10進数2桁を整数値に変換
	}

	return a1;
}

/// <summary>
/// （型変換）W_BCD型の値をINT型に変換します。
/// 例　(W_BCD)0x0000  → (INT)0x0000         0
///     (W_BCD)0x0001  → (INT)0x0001         1
///     (W_BCD)0x9999  → (INT)0x270F      9999
///     (W_BCD)0xFFFF  → (INT)0xFFFF        -1
///     (W_BCD)0x000A  → (INT)0xFFFF        -1
///     (W_BCD)0xA000  → (INT)0xFFFF        -1
/// </summary>
/// <param name="a1">戻り値(INT型)</param>
/// <param name="a2">変換対象(W_BCD型)</param>
PLCPIEC_API P_ANY W_BCD_TO_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetBcdToEno(TRUE);	// ENOフラグのリセット

	T_BYTE wk1 = 0;
	T_BYTE wk2 = 0;
	T_BYTE wk3 = 0;
	T_BYTE wk4 = 0;
	T_INT digit1 = 0;
	T_INT digit10 = 0;
	T_INT digit100 = 0;
	T_INT digit1000 = 0;

	a1->Type = D_INT;

	// 各桁が0 - 9の範囲であるか判定
	wk1 = (*a1->pWord & 0xF000) >> 12;	// 0-4ビット取得
	wk2 = (*a1->pWord & 0x0F00) >> 8;	// 5-8ビット取得
	wk3 = (*a1->pWord & 0x00F0) >> 4;	// 9-12ビット取得
	wk4 = (*a1->pWord & 0x000F);		// 13-16ビット取得
	if (wk1 > 9 || wk2 > 9 || wk3 > 9 || wk4 > 9)
	{
		*a1->pInt = 0xFFFF;		// 範囲外の値が入力された場合は固定値-1を返す
		SetBcdToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		digit1		= (T_INT) wk4;			// 1の位
		digit10		= (T_INT)(wk3 * 10);	// 10の位
		digit100	= (T_INT)(wk2 * 100);	// 100の位
		digit1000	= (T_INT)(wk1 * 1000);	// 1000の位

		*a1->pInt = digit1
				  + digit10
				  + digit100
				  + digit1000;	// 2進化10進数2桁を整数値に変換
	}

	return a1;
}

/// <summary>
/// （型変換）W_BCD型の値をLINT型に変換します。
/// 例　(W_BCD)0x0000  → (LINT)0x0000000000000000         0
///     (W_BCD)0x0001  → (LINT)0x0000000000000001         1
///     (W_BCD)0x9999  → (LINT)0x000000000000270F      9999
///     (W_BCD)0xFFFF  → (LINT)0xFFFFFFFFFFFFFFFF        -1
///     (W_BCD)0x000A  → (LINT)0xFFFFFFFFFFFFFFFF        -1
///     (W_BCD)0xA000  → (LINT)0xFFFFFFFFFFFFFFFF        -1
/// </summary>
/// <param name="a1">戻り値(LINT型)</param>
/// <param name="a2">変換対象(W_BCD型)</param>
PLCPIEC_API P_ANY W_BCD_TO_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetBcdToEno(TRUE);	// ENOフラグのリセット

	T_BYTE wk1 = 0;
	T_BYTE wk2 = 0;
	T_BYTE wk3 = 0;
	T_BYTE wk4 = 0;
	T_DINT digit1 = 0;
	T_DINT digit10 = 0;
	T_DINT digit100 = 0;
	T_DINT digit1000 = 0;

	a1->Type = D_LINT;

	// 各桁が0 - 9の範囲であるか判定
	wk1 = (*a1->pWord & 0xF000) >> 12;	// 0-4ビット取得
	wk2 = (*a1->pWord & 0x0F00) >> 8;	// 5-8ビット取得
	wk3 = (*a1->pWord & 0x00F0) >> 4;	// 9-12ビット取得
	wk4 = (*a1->pWord & 0x000F);		// 13-16ビット取得
	if (wk1 > 9 || wk2 > 9 || wk3 > 9 || wk4 > 9)
	{
		*a1->pLint = 0xFFFFFFFFFFFFFFFF;	// 範囲外の値が入力された場合は固定値-1を返す
		SetBcdToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		digit1		= (T_DINT) wk4;			// 1の位
		digit10		= (T_DINT)(wk3 * 10);	// 10の位
		digit100	= (T_DINT)(wk2 * 100);	// 100の位
		digit1000	= (T_DINT)(wk1 * 1000);	// 1000の位

		*a1->pLint = digit1
			       + digit10
			       + digit100
			       + digit1000;	// 2進化10進数2桁を整数値に変換
	}

	return a1;
}

/// <summary>
/// （型変換）W_BCD型の値をSINT型に変換します。
/// 例　(W_BCD)0x0000  → (SINT)0x00         0
///     (W_BCD)0x0001  → (SINT)0x01         1
///     (W_BCD)0x0127  → (SINT)0x7F       127
///     (W_BCD)0x0128  → (SINT)0xFF        -1
///     (W_BCD)0xFFFF  → (SINT)0xFF        -1
///     (W_BCD)0x000A  → (SINT)0xFF        -1
///     (W_BCD)0xA000  → (SINT)0xFF        -1
/// </summary>
/// <param name="a1">戻り値(SINT型)</param>
/// <param name="a2">変換対象(W_BCD型)</param>
PLCPIEC_API P_ANY W_BCD_TO_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetBcdToEno(TRUE);	// ENOフラグのリセット

	T_INT  wkTotal = 0;
	T_BYTE wk1 = 0;
	T_BYTE wk2 = 0;
	T_BYTE wk3 = 0;
	T_BYTE wk4 = 0;
	T_INT digit1 = 0;
	T_INT digit10 = 0;
	T_INT digit100 = 0;
	T_INT digit1000 = 0;

	a1->Type = D_SINT;

	// 各桁が0 - 9の範囲であるか判定
	wk1 = (*a1->pWord & 0xF000) >> 12;	// 0-4ビット取得
	wk2 = (*a1->pWord & 0x0F00) >> 8;	// 5-8ビット取得
	wk3 = (*a1->pWord & 0x00F0) >> 4;	// 9-12ビット取得
	wk4 = (*a1->pWord & 0x000F);		// 13-16ビット取得
	if (wk1 > 9 || wk2 > 9 || wk3 > 9 || wk4 > 9)
	{
		*a1->pSint = 0xFF;			// 範囲外の値が入力された場合は固定値-1を返す
		SetBcdToEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		digit1	  = (T_INT) wk4;			// 1の位
		digit10	  = (T_INT)(wk3 * 10);		// 10の位
		digit100  = (T_INT)(wk2 * 100);		// 100の位
		digit1000 = (T_INT)(wk1 * 1000);	// 1000の位

		wkTotal = digit1
				+ digit10
				+ digit100
				+ digit1000;	// 2進化10進数2桁を整数値(INT型)に一次受け

		// オーバーフローチェック
		if (wkTotal > 0x007F)
		{
			// オーバーフロー時、戻り値を-1をセット
			*a1->pSint = 0xFF;
			SetBcdToEno(FALSE);	    // パラメータエラーのためENOをFALSEにする
		}
		else
			// 変換値をSINT型にキャストして戻り値にセット
			*a1->pSint = (T_SINT)wkTotal;
	}
	return a1;
}