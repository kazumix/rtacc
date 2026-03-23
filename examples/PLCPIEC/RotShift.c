#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "common.h"
#include "PLCPIEC.h"

#pragma pack(push,1)
/*
* ローテーションシフト：左ローテーション(BYTE)
*/
PLCPIEC_API P_ANY ROL_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_LINT rot = 0;
	T_BYTE work = 0;
	T_BOOL msb = FALSE;
	T_LINT i;

	// ローテーションバイト数を取得
	switch (a2->Type)
	{
	case D_SINT:  rot = (T_LINT)*a2->pSint;  break;
	case D_INT:   rot = (T_LINT)*a2->pInt;   break;
	case D_DINT:  rot = (T_LINT)*a2->pDint;  break;
	case D_LINT:  rot = (T_LINT)*a2->pLint;  break;
	case D_USINT: rot = (T_LINT)*a2->pUsint; break;
	case D_UINT:  rot = (T_LINT)*a2->pUint;  break;
	case D_UDINT: rot = (T_LINT)*a2->pUdint; break;
	}

	// ローテーションバイト数がマイナスの場合
	if (rot < 0)
	{
		*a1->pByte = 0;
		return a1;
	}

	rot = rot % 8;

	// 通常処理
	// ※ ローテーションバイト数が0の場合は何もしない
	if(rot != 0)
	{
		work = *a1->pByte;					// 入力を作業変数に格納	
		for (i = 0; i < (T_LINT)rot; i++)	// 1ビットずつ左ローテーション
		{
			msb = ((work & 0x80) > 0) ? TRUE : FALSE;	// 最上位ビットが立っているか判定
			work = work << 1;							// 1ビット左シフト
			if (msb)									// シフト前に最上位ビットが立っていたら
				work = work | 0x01;						// 最下位ビットに1を立てる
		}
		*a1->pByte = work;				// 出力
	}
	
	return a1;
}

/*
* ローテーションシフト：左ローテーション(WORD)
*/
PLCPIEC_API P_ANY ROL_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_LINT rot = 0;
	T_WORD work = 0;
	T_BOOL msb = FALSE;
	T_LINT i;

	// ローテーションバイト数を取得
	switch (a2->Type)
	{
	case D_SINT:  rot = (T_LINT)*a2->pSint;  break;
	case D_INT:   rot = (T_LINT)*a2->pInt;   break;
	case D_DINT:  rot = (T_LINT)*a2->pDint;  break;
	case D_LINT:  rot = (T_LINT)*a2->pLint;  break;
	case D_USINT: rot = (T_LINT)*a2->pUsint; break;
	case D_UINT:  rot = (T_LINT)*a2->pUint;  break;
	case D_UDINT: rot = (T_LINT)*a2->pUdint; break;
	}

	// ローテーションバイト数がマイナスの場合
	if (rot < 0)
	{
		*a1->pWord = 0;
		return a1;
	}

	rot = rot % 16;	// ローテーション対象ビットサイズを考慮したローテーション値を算出
	// 通常処理
	// ※ ローテーションバイト数が0の場合は何もしない
	if (rot != 0)
	{		
		work = *a1->pWord;				// 入力を作業変数に格納	
		for (i = 0; i < (T_LINT)rot; i++)	// 1ビットずつ左ローテーション
		{
			msb = ((work & 0x8000) > 0) ? TRUE : FALSE;	// 最上位ビットが立っているか判定
			work = work << 1;							// 1ビット左シフト
			if (msb)									// シフト前に最上位ビットが立っていたら
				work = work | 0x0001;					// 最下位ビットに1を立てる
		}
		*a1->pWord = work;				// 出力
	}

	return a1;
}

/*
* ローテーションシフト：左ローテーション(DWORD)
*/
PLCPIEC_API P_ANY ROL_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_LINT rot = 0;
	T_DWORD work = 0;
	T_BOOL msb = FALSE;
	T_LINT i;

	// ローテーションバイト数を取得
	switch (a2->Type)
	{
	case D_SINT:  rot = (T_LINT)*a2->pSint;  break;
	case D_INT:   rot = (T_LINT)*a2->pInt;   break;
	case D_DINT:  rot = (T_LINT)*a2->pDint;  break;
	case D_LINT:  rot = (T_LINT)*a2->pLint;  break;
	case D_USINT: rot = (T_LINT)*a2->pUsint; break;
	case D_UINT:  rot = (T_LINT)*a2->pUint;  break;
	case D_UDINT: rot = (T_LINT)*a2->pUdint; break;
	}

	// ローテーションバイト数がマイナスの場合
	if (rot < 0)
	{
		*a1->pDword = 0;
		return a1;
	}

	rot = rot % 32;	// ローテーション対象ビットサイズを考慮したローテーション値を算出
	// 通常処理
	// ※ ローテーションバイト数が0の場合は何もしない
	if (rot != 0)
	{
		work = *a1->pDword;				// 入力を作業変数に格納	
		for (i = 0; i < (T_LINT)rot; i++)	// 1ビットずつ左ローテーション
		{
			msb = ((work & 0x80000000) > 0) ? TRUE : FALSE;	// 最上位ビットが立っているか判定
			work = work << 1;								// 1ビット左シフト
			if (msb)										// シフト前に最上位ビットが立っていたら
				work = work | 0x00000001;					// 最下位ビットに1を立てる
		}
		*a1->pDword = work;				// 出力
	}

	return a1;
}

/*
* ローテーションシフト：左ローテーション
*/
PLCPIEC_API P_ANY ROL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//a1がANY_BITか？
	switch (a1->Type)
	{
	case D_BYTE:
	case D_WORD:
	case DWORD:
		break;
	default:
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "ROL:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
	//a2がANY_INTか？
	switch (a2->Type)
	{
	case D_SINT:
	case D_INT:
	case D_DINT:
	case D_LINT:
	case D_USINT:
	case D_UINT:
	case D_UDINT:
		break;
	default:
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "ROL:Data type unsuitable: a2");	//パラメータエラー発生
		return a1;
	}
#endif

	switch (a1->Type)
	{
	case D_SINT:
	case D_USINT:
	case D_BYTE:
		ROL_BYTE(a1, a2, a3, a4);
		break;
	case D_INT:
	case D_UINT:
	case D_WORD:
		ROL_WORD(a1, a2, a3, a4);
		break;
	case D_DINT:
	case D_UDINT:
	case D_DWORD:
		ROL_DWORD(a1, a2, a3, a4);
		break;
	}

	return a1;
}

/*
* ローテーションシフト：右ローテーション(BYTE)
*/
PLCPIEC_API P_ANY ROR_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_LINT rot = 0;
	T_BYTE work = 0;
	T_BOOL lsb = FALSE;
	T_LINT i;

	// ローテーションバイト数を取得
	switch (a2->Type)
	{
	case D_SINT:  rot = (T_LINT)*a2->pSint;  break;
	case D_INT:   rot = (T_LINT)*a2->pInt;   break;
	case D_DINT:  rot = (T_LINT)*a2->pDint;  break;
	case D_LINT:  rot = (T_LINT)*a2->pLint;  break;
	case D_USINT: rot = (T_LINT)*a2->pUsint; break;
	case D_UINT:  rot = (T_LINT)*a2->pUint;  break;
	case D_UDINT: rot = (T_LINT)*a2->pUdint; break;
	}

	// ローテーションバイト数がマイナスの場合
	if (rot < 0)
		*a1->pByte = 0;

	rot = rot % 8;	// ローテーション対象ビットサイズを考慮したローテーション値を算出
	// 通常処理
	// ※ ローテーションバイト数が0の場合は何もしない
	if (rot != 0)
	{
		work = *a1->pByte;					// 入力を作業変数に格納	
		for (i = 0; i < (T_LINT)rot; i++)	// 1ビットずつ左ローテーション
		{
			lsb = ((work & 0x01) > 0) ? TRUE : FALSE;	// 最下位ビットが立っているか判定
			work = work >> 1;							// 1ビット左シフト
			if (lsb)									// シフト前に最上位ビットが立っていたら
				work = work | 0x80;						// 最上位ビットに1を立てる
		}
		*a1->pByte = work;				// 出力
	}

	return a1;
}

/*
* ローテーションシフト：右ローテーション(WORD)
*/
PLCPIEC_API P_ANY ROR_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_LINT rot = 0;
	T_WORD work = 0;
	T_BOOL lsb = FALSE;
	T_INT i;

	// ローテーションバイト数を取得
	switch (a2->Type)
	{
	case D_SINT:  rot = (T_LINT)*a2->pSint;  break;
	case D_INT:   rot = (T_LINT)*a2->pInt;   break;
	case D_DINT:  rot = (T_LINT)*a2->pDint;  break;
	case D_LINT:  rot = (T_LINT)*a2->pLint;  break;
	case D_USINT: rot = (T_LINT)*a2->pUsint; break;
	case D_UINT:  rot = (T_LINT)*a2->pUint;  break;
	case D_UDINT: rot = (T_LINT)*a2->pUdint; break;
	}

	// ローテーションバイト数がマイナスの場合
	if (rot < 0)
	{
		*a1->pWord = 0;
		return a1;
	}

	rot = rot % 16;	// ローテーション対象ビットサイズを考慮したローテーション値を算出
	// 通常処理
	// ※ ローテーションバイト数が0の場合は何もしない
	if (rot != 0)
	{	
		work = *a1->pWord;					// 入力を作業変数に格納	
		for (i = 0; i < (T_LINT)rot; i++)	// 1ビットずつ左ローテーション
		{
			lsb = ((work & 0x0001) > 0) ? TRUE : FALSE;	// 最下位ビットが立っているか判定
			work = work >> 1;							// 1ビット左シフト
			if (lsb)									// シフト前に最上位ビットが立っていたら
				work = work | 0x8000;					// 最上位ビットに1を立てる
		}
		*a1->pWord = work;				// 出力
	}

	return a1;
}

/*
* ローテーションシフト：右ローテーション(DWORD)
*/
PLCPIEC_API P_ANY ROR_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_LINT rot = 0;
	T_DWORD work = 0;
	T_BOOL lsb = FALSE;
	T_LINT i;

	// ローテーションバイト数を取得
	switch (a2->Type)
	{
	case D_SINT:  rot = (T_LINT)*a2->pSint;  break;
	case D_INT:   rot = (T_LINT)*a2->pInt;   break;
	case D_DINT:  rot = (T_LINT)*a2->pDint;  break;
	case D_LINT:  rot = (T_LINT)*a2->pLint;  break;
	case D_USINT: rot = (T_LINT)*a2->pUsint; break;
	case D_UINT:  rot = (T_LINT)*a2->pUint;  break;
	case D_UDINT: rot = (T_LINT)*a2->pUdint; break;
	}

	// ローテーションバイト数がマイナスの場合
	if (rot < 0)
	{
		*a1->pDword = 0;
		return a1;
	}

	rot = rot % 32;	// ローテーション対象ビットサイズを考慮したローテーション値を算出
	// 通常処理
	// ※ ローテーションバイト数が0の場合は何もしない
	if (rot != 0)
	{
		work = *a1->pDword;					// 入力を作業変数に格納	
		for (i = 0; i < (T_LINT)rot; i++)	// 1ビットずつ左ローテーション
		{
			lsb = ((work & 0x00000001) > 0) ? TRUE : FALSE;	// 最下位ビットが立っているか判定
			work = work >> 1;							// 1ビット左シフト
			if (lsb)									// シフト前に最上位ビットが立っていたら
				work = work | 0x80000000;				// 最上位ビットに1を立てる
		}
		*a1->pDword = work;				// 出力
	}

	return a1;
}
/*
* ローテーションシフト：右ローテーション
*/
PLCPIEC_API P_ANY ROR(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//a1がANY_BITか？
	switch (a1->Type)
	{
	case D_BYTE:
	case D_WORD:
	case DWORD:
		break;
	default:
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "ROR:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
	//a2がANY_INTか？
	switch (a2->Type)
	{
	case D_SINT:
	case D_INT:
	case D_DINT:
	case D_LINT:
	case D_USINT:
	case D_UINT:
	case D_UDINT:
		break;
	default:
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "ROR:Data type unsuitable: a2");	//パラメータエラー発生
		return a1;
	}
#endif


	switch (a1->Type)
	{
	case D_SINT:
	case D_USINT:
	case D_BYTE:
		ROR_BYTE(a1, a2, a3, a4);
		break;
	case D_INT:
	case D_UINT:
	case D_WORD:
		ROR_WORD(a1, a2, a3, a4);
		break;
	case D_DINT:
	case D_UDINT:
	case D_DWORD:
		ROR_DWORD(a1, a2, a3, a4);
		break;
	}

	return a1;
}

/*
* ローテーションシフト：左シフト(BYTE)
*/
PLCPIEC_API P_ANY SHL_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_LINT rot = 0;

	// シフトバイト数を取得
	switch (a2->Type)
	{
	case D_SINT:  rot = (T_LINT)*a2->pSint;  break;
	case D_INT:   rot = (T_LINT)*a2->pInt;   break;
	case D_DINT:  rot = (T_LINT)*a2->pDint;  break;
	case D_LINT:  rot = (T_LINT)*a2->pLint;  break;
	case D_USINT: rot = (T_LINT)*a2->pUsint; break;
	case D_UINT:  rot = (T_LINT)*a2->pUint;  break;
	case D_UDINT: rot = (T_LINT)*a2->pUdint; break;
	}

	// シフトバイト数がマイナスの場合
	if (rot < 0)
	{
		*a1->pByte = 0;
		return a1;
	}
	// 通常処理
	// ※ シフトバイト数が0の場合は何もしない
	else if (rot != 0)
	{
		*a1->pByte = *a1->pByte << rot;	// 出力
	}

	return a1;
}

/*
* ローテーションシフト：左シフト(WORD)
*/
PLCPIEC_API P_ANY SHL_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_LINT rot = 0;

	// シフトバイト数を取得
	switch (a2->Type)
	{
	case D_SINT:  rot = (T_LINT)*a2->pSint;  break;
	case D_INT:   rot = (T_LINT)*a2->pInt;   break;
	case D_DINT:  rot = (T_LINT)*a2->pDint;  break;
	case D_LINT:  rot = (T_LINT)*a2->pLint;  break;
	case D_USINT: rot = (T_LINT)*a2->pUsint; break;
	case D_UINT:  rot = (T_LINT)*a2->pUint;  break;
	case D_UDINT: rot = (T_LINT)*a2->pUdint; break;
	}

	// シフトバイト数がマイナスの場合
	if (rot < 0)
	{
		*a1->pWord = 0;
	}
	// 通常処理
	// ※ シフトバイト数が0の場合は何もしない
	else if (rot != 0)
	{

		*a1->pWord = *a1->pWord << rot;	// 出力
	}

	return a1;
}
/*
* ローテーションシフト：左シフト(DWORD)
*/
PLCPIEC_API P_ANY SHL_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_ULINT tmp = 0;
	T_LINT rot = 0;

	// シフトバイト数を取得
	switch (a2->Type)
	{
	case D_SINT:  rot = (T_LINT)*a2->pSint;  break;
	case D_INT:   rot = (T_LINT)*a2->pInt;   break;
	case D_DINT:  rot = (T_LINT)*a2->pDint;  break;
	case D_LINT:  rot = (T_LINT)*a2->pLint;  break;
	case D_USINT: rot = (T_LINT)*a2->pUsint; break;
	case D_UINT:  rot = (T_LINT)*a2->pUint;  break;
	case D_UDINT: rot = (T_LINT)*a2->pUdint; break;
	}

	// シフトバイト数がマイナスの場合
	if (rot < 0)
	{
		*a1->pDword = 0;
	}
	// 通常処理
	// ※ シフトバイト数が0の場合は何もしない
	else if (rot != 0)
	{
		tmp = (T_ULINT)*a1->pDword;
		*a1->pDword  = (T_DWORD)(tmp << rot);	// 出力
	}

	return a1;
}

/*
* ローテーションシフト：左シフト
*/
PLCPIEC_API P_ANY SHL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//a1がANY_BITか？
	switch (a1->Type)
	{
	case D_BYTE:
	case D_WORD:
	case DWORD:
		break;
	default:
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "SHL:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
	//a2がANY_INTか？
	switch (a2->Type)
	{
	case D_SINT:
	case D_INT:
	case D_DINT:
	case D_LINT:
	case D_USINT:
	case D_UINT:
	case D_UDINT:
		break;
	default:
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "SHL:Data type unsuitable: a2");	//パラメータエラー発生
		return a1;
	}
#endif


	switch (a1->Type)
	{
	case D_SINT:
	case D_USINT:
	case D_BYTE:
		SHL_BYTE(a1, a2, a3, a4);
		break;
	case D_INT:
	case D_UINT:
	case D_WORD:
		SHL_WORD(a1, a2, a3, a4);
		break;
	case D_DINT:
	case D_UDINT:
	case D_DWORD:
		SHL_DWORD(a1, a2, a3, a4);
		break;
	}

	return a1;
}

/*
* ローテーションシフト：右シフト(BYTE)
*/
PLCPIEC_API P_ANY SHR_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_LINT rot = 0;

	// シフトバイト数を取得
	switch (a2->Type)
	{
	case D_SINT:  rot = (T_LINT)*a2->pSint;  break;
	case D_INT:   rot = (T_LINT)*a2->pInt;   break;
	case D_DINT:  rot = (T_DINT)*a2->pDint;  break;
	case D_LINT:  rot = (T_LINT)*a2->pLint;  break;
	case D_USINT: rot = (T_LINT)*a2->pUsint; break;
	case D_UINT:  rot = (T_LINT)*a2->pUint;  break;
	case D_UDINT: rot = (T_LINT)*a2->pUdint; break;
	}

	// ローテーションバイト数がマイナスの場合
	if (rot < 0)
	{
		*a1->pByte = 0;
		return a1;
	}

	// 通常処理
	// ※ ローテーションバイト数が0の場合は何もしない
	else if (rot != 0)
	{
		*a1->pByte = *a1->pByte >> rot;	// 出力
	}

	return a1;
}

/*
* ローテーションシフト：右シフト(WORD)
*/
PLCPIEC_API P_ANY SHR_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_LINT rot = 0;

	// シフトバイト数を取得
	switch (a2->Type)
	{
	case D_SINT:  rot = (T_LINT)*a2->pSint;  break;
	case D_INT:   rot = (T_LINT)*a2->pInt;   break;
	case D_DINT:  rot = (T_DINT)*a2->pDint;  break;
	case D_LINT:  rot = (T_LINT)*a2->pLint;  break;
	case D_USINT: rot = (T_LINT)*a2->pUsint; break;
	case D_UINT:  rot = (T_LINT)*a2->pUint;  break;
	case D_UDINT: rot = (T_LINT)*a2->pUdint; break;
	}

	// ローテーションバイト数がマイナスの場合
	if (rot < 0)
	{
		*a1->pWord = 0;
	}
	// 通常処理
	// ※ ローテーションバイト数が0の場合は何もしない
	else if (rot != 0)
	{
		*a1->pWord = *a1->pWord >> rot;	// 出力
	}

	return a1;
}

/*
* ローテーションシフト：右シフト(DWORD)
*/
PLCPIEC_API P_ANY SHR_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_DWORD tmp = 0;
	T_LINT rot = 0;
	T_LINT i;
	T_BOOL lsb = FALSE;

	// シフトバイト数を取得
	switch (a2->Type)
	{
	case D_SINT:  rot = (T_LINT)*a2->pSint;  break;
	case D_INT:   rot = (T_LINT)*a2->pInt;   break;
	case D_DINT:  rot = (T_LINT)*a2->pDint;  break;
	case D_LINT:  rot = (T_LINT)*a2->pLint;  break;
	case D_USINT: rot = (T_LINT)*a2->pUsint; break;
	case D_UINT:  rot = (T_LINT)*a2->pUint;  break;
	case D_UDINT: rot = (T_LINT)*a2->pUdint; break;
	}

	// シフトバイト数がマイナスの場合
	if (rot < 0)
	{
		*a1->pDword = 0;
	}
	// シフトバイト数が32ビット以上の場合
	else if (rot > 32)
		*a1->pDword = 0x00000000;
	// 通常処理
	// ※ シフトバイト数が0の場合は何もしない
	else if (rot != 0)
	{
		tmp = *a1->pDword;					// 入力を作業変数に格納	
		for (i = 0; i < (T_LINT)rot; i++)	// 1ビットずつ右ローテーション
		{
			// 最下位ビットが立っている場合は下げる
			// これからビットシフトであふれるので問題なし
			tmp = tmp & 0xFFFFFFFE;
			tmp = tmp >> 1;
		}
		*a1->pDword = tmp;				// 出力
	}

	return a1;
}

/*
* ローテーションシフト：右シフト
*/
PLCPIEC_API P_ANY SHR(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//a1がANY_BITか？
	switch (a1->Type)
	{
	case D_BYTE:
	case D_WORD:
	case DWORD:
		break;
	default:
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "SHR:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
	//a2がANY_INTか？
	switch (a2->Type)
	{
	case D_SINT:
	case D_INT:
	case D_DINT:
	case D_LINT:
	case D_USINT:
	case D_UINT:
	case D_UDINT:
		break;
	default:
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "SHR:Data type unsuitable: a2");	//パラメータエラー発生
		return a1;
	}
#endif


	switch (a1->Type)
	{
	case D_SINT:
	case D_USINT:
	case D_BYTE:
		SHR_BYTE(a1, a2, a3, a4);
		break;
	case D_INT:
	case D_UINT:
	case D_WORD:
		SHR_WORD(a1, a2, a3, a4);
		break;
	case D_DINT:
	case D_UDINT:
	case D_DWORD:
		SHR_DWORD(a1, a2, a3, a4);
		break;
	}

	return a1;
}

/*
* 入力サイズ判定
*/
PLCPIEC_API P_ANY SIZEOF(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	switch(a1->Type)
	{
	case D_BOOL:
	case D_BYTE:
	case D_SINT:
	case D_USINT:
		*a1->pUdint = 1;
		break;
	case D_INT:
	case D_UINT:
	case D_WORD:
		*a1->pUdint = 2;
		break;
	case D_DINT:
	case D_UDINT:
	case D_DWORD:
	case D_REAL:
	case D_TIME:
		*a1->pUdint = 4;
		break;
	case D_LINT:
	case D_ULINT:
	case D_QWORD:
	case D_LREAL:
		*a1->pUdint = 8;
		break;
	case D_STRING:
		*a1->pUdint = 83;
		break;
	case D_ARRAY:
		// TBD:エンジン側対応後に実装
		*a1->pUdint = 0; // 暫定
		break;
	case D_STRUCT:
		// TBD:エンジン側対応後に実装
		*a1->pUdint = 0; // 暫定
		break;
	}
	a1->Type = D_UDINT;
	return a1;
}

/*
* ユーザ定義配列の要素のうち、下限値を返す
*/
PLCPIEC_API P_ANY LOWER_BOUND(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	// TBD:エンジン側で配列の実装が完了してから処理を追記

	return  a1;
}

#pragma pack(pop)