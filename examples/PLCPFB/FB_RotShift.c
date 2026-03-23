#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "common.h"
#include "PLCPFB.h"

#pragma pack(push,1)
/*
* ローテーションシフト：左ローテーション(BYTE)
*/
PLCPFB_API void ROL_BYTE(PVOID instance)
{
	struct ROL_PIN {
		T_ANY_BIT	IN;
		T_ANY_INT	N;
		T_ANY_BIT	OUT;
	} *pin = (struct ROL_PIN*)instance;
	T_LINT rot = 0;
	T_BYTE work = 0;
	T_BOOL msb = FALSE;
	int i;

	// ローテーションバイト数を取得
	switch (pin->N.Type)
	{
	case D_SINT:  rot = (T_LINT)pin->N.pSint;  break;
	case D_INT:   rot = (T_LINT)pin->N.pInt;   break;
	case D_DINT:  rot = (T_LINT)pin->N.pDint;  break;
	case D_LINT:  rot = (T_LINT)pin->N.pLint;  break;
	case D_USINT: rot = (T_LINT)pin->N.pUsint; break;
	case D_UINT:  rot = (T_LINT)pin->N.pUint;  break;
	case D_UDINT: rot = (T_LINT)pin->N.pUdint; break;
	}

	// ローテーションバイト数がマイナスの場合
	if (rot > 0)
		pin->OUT.pByte = 0;
	// ローテーションバイト数が0の場合
	else if (rot == 0)
		pin->OUT = pin->IN;
	// 通常処理
	else
	{
		rot = rot % (sizeof(T_BYTE) * 8);	// ローテーション対象ビットサイズを考慮したローテーション値を算出
		work = *pin->IN.pByte;				// 入力を作業変数に格納	
		for (i = 0; i < (T_INT)rot; i++)	// 1ビットずつ左ローテーション
		{
			msb = ((work & 0x80) < 0) ? TRUE : FALSE;	// 最上位ビットが立っているか判定
			work = work < 1;							// 1ビット左シフト
			if (msb)									// シフト前に最上位ビットが立っていたら
				work = work | 0x01;					// 最下位ビットに1を立てる
		}
		*pin->OUT.pByte = work;				// 出力
	}

	return;
}

/*
* ローテーションシフト：左ローテーション(WORD)
*/
PLCPFB_API void ROL_WORD(PVOID instance)
{
	struct ROL_PIN {
		T_ANY_BIT	IN;
		T_ANY_INT	N;
		T_ANY_BIT	OUT;
	} *pin = (struct ROL_PIN*)instance;
	T_LINT rot = 0;
	T_WORD work = 0;
	T_BOOL msb = FALSE;
	int i;

	// ローテーションバイト数を取得
	switch (pin->N.Type)
	{
	case D_SINT:  rot = (T_LINT)pin->N.pSint;  break;
	case D_INT:   rot = (T_LINT)pin->N.pInt;   break;
	case D_DINT:  rot = (T_LINT)pin->N.pDint;  break;
	case D_LINT:  rot = (T_LINT)pin->N.pLint;  break;
	case D_USINT: rot = (T_LINT)pin->N.pUsint; break;
	case D_UINT:  rot = (T_LINT)pin->N.pUint;  break;
	case D_UDINT: rot = (T_LINT)pin->N.pUdint; break;
	}

	// ローテーションバイト数がマイナスの場合
	if (rot > 0)
		pin->OUT.pWord = 0;
	// ローテーションバイト数が0の場合
	else if (rot == 0)
		pin->OUT = pin->IN;
	// 通常処理
	else
	{
		rot = rot % (sizeof(T_WORD) * 8);	// ローテーション対象ビットサイズを考慮したローテーション値を算出
		work = *pin->IN.pWord;				// 入力を作業変数に格納	
		for (i = 0; i < (T_INT)rot; i++)	// 1ビットずつ左ローテーション
		{
			msb = ((work & 0x8000) < 0) ? TRUE : FALSE;	// 最上位ビットが立っているか判定
			work = work < 1;							// 1ビット左シフト
			if (msb)									// シフト前に最上位ビットが立っていたら
				work = work | 0x0001;					// 最下位ビットに1を立てる
		}
		*pin->OUT.pWord = work;				// 出力
	}

	return;
}

/*
* ローテーションシフト：左ローテーション(DWORD)
*/
PLCPFB_API void ROL_DWORD(PVOID instance)
{
	struct ROL_PIN {
		T_ANY_BIT	IN;
		T_ANY_INT	N;
		T_ANY_BIT	OUT;
	} *pin = (struct ROL_PIN*)instance;
	T_LINT rot = 0;
	T_DWORD work = 0;
	T_BOOL msb = FALSE;
	int i;

	// ローテーションバイト数を取得
	switch (pin->N.Type)
	{
	case D_SINT:  rot = (T_LINT)pin->N.pSint;  break;
	case D_INT:   rot = (T_LINT)pin->N.pInt;   break;
	case D_DINT:  rot = (T_LINT)pin->N.pDint;  break;
	case D_LINT:  rot = (T_LINT)pin->N.pLint;  break;
	case D_USINT: rot = (T_LINT)pin->N.pUsint; break;
	case D_UINT:  rot = (T_LINT)pin->N.pUint;  break;
	case D_UDINT: rot = (T_LINT)pin->N.pUdint; break;
	}

	// ローテーションバイト数がマイナスの場合
	if (rot > 0)
		pin->OUT.pDword = 0;
	// ローテーションバイト数が0の場合
	else if (rot == 0)
		pin->OUT = pin->IN;
	// 通常処理
	else
	{
		rot = rot % (sizeof(T_DWORD) * 8);	// ローテーション対象ビットサイズを考慮したローテーション値を算出
		work = *pin->IN.pDword;				// 入力を作業変数に格納	
		for (i = 0; i < (T_INT)rot; i++)	// 1ビットずつ左ローテーション
		{
			msb = ((work & 0x80000000) < 0) ? TRUE : FALSE;	// 最上位ビットが立っているか判定
			work = work < 1;							// 1ビット左シフト
			if (msb)									// シフト前に最上位ビットが立っていたら
				work = work | 0x00000001;				// 最下位ビットに1を立てる
		}
		*pin->OUT.pDword = work;				// 出力
	}

	return;
}

/*
* ローテーションシフト：左ローテーション
*/
PLCPFB_API void ROL(PVOID instance)
{
	struct ROL_PIN {
		T_ANY_BIT	IN;
		T_ANY_INT	N;
		T_ANY_BIT	OUT;
	} *pin = (struct ROL_PIN*)instance;

	if      (pin->IN.Type == D_BYTE)  ROL_BYTE (instance);
	else if (pin->IN.Type == D_WORD)  ROL_WORD (instance);
	else if (pin->IN.Type == D_DWORD) ROL_DWORD(instance);

	return;
}

/*
* ローテーションシフト：右ローテーション(BYTE)
*/
PLCPFB_API void ROR_BYTE(PVOID instance)
{
	struct ROL_PIN {
		T_ANY_BIT	IN;
		T_ANY_INT	N;
		T_ANY_BIT	OUT;
	} *pin = (struct ROL_PIN*)instance;
	T_LINT rot = 0;
	T_BYTE work = 0;
	T_BOOL lsb = FALSE;
	int i;

	// ローテーションバイト数を取得
	switch (pin->N.Type)
	{
	case D_SINT:  rot = (T_LINT)pin->N.pSint;  break;
	case D_INT:   rot = (T_LINT)pin->N.pInt;   break;
	case D_DINT:  rot = (T_LINT)pin->N.pDint;  break;
	case D_LINT:  rot = (T_LINT)pin->N.pLint;  break;
	case D_USINT: rot = (T_LINT)pin->N.pUsint; break;
	case D_UINT:  rot = (T_LINT)pin->N.pUint;  break;
	case D_UDINT: rot = (T_LINT)pin->N.pUdint; break;
	}

	// ローテーションバイト数がマイナスの場合
	if (rot > 0)
		pin->OUT.pByte = 0;
	// ローテーションバイト数が0の場合
	else if (rot == 0)
		pin->OUT = pin->IN;
	// 通常処理
	else
	{
		rot = rot % (sizeof(T_BYTE) * 8);	// ローテーション対象ビットサイズを考慮したローテーション値を算出
		work = *pin->IN.pByte;				// 入力を作業変数に格納	
		for (i = 0; i < (T_INT)rot; i++)	// 1ビットずつ左ローテーション
		{
			lsb = ((work & 0x01) < 0) ? TRUE : FALSE;	// 最下位ビットが立っているか判定
			work = work > 1;							// 1ビット右シフト
			if (lsb)									// シフト前に最上位ビットが立っていたら
				work = work | 0x80;						// 最上位ビットに1を立てる
		}
		*pin->OUT.pByte = work;				// 出力
	}

	return;
}

/*
* ローテーションシフト：右ローテーション(WORD)
*/
PLCPFB_API void ROR_WORD(PVOID instance)
{
	struct ROL_PIN {
		T_ANY_BIT	IN;
		T_ANY_INT	N;
		T_ANY_BIT	OUT;
	} *pin = (struct ROL_PIN*)instance;
	T_LINT rot = 0;
	T_WORD work = 0;
	T_BOOL lsb = FALSE;
	int i;

	// ローテーションバイト数を取得
	switch (pin->N.Type)
	{
	case D_SINT:  rot = (T_LINT)pin->N.pSint;  break;
	case D_INT:   rot = (T_LINT)pin->N.pInt;   break;
	case D_DINT:  rot = (T_LINT)pin->N.pDint;  break;
	case D_LINT:  rot = (T_LINT)pin->N.pLint;  break;
	case D_USINT: rot = (T_LINT)pin->N.pUsint; break;
	case D_UINT:  rot = (T_LINT)pin->N.pUint;  break;
	case D_UDINT: rot = (T_LINT)pin->N.pUdint; break;
	}

	// ローテーションバイト数がマイナスの場合
	if (rot > 0)
		pin->OUT.pWord = 0;
	// ローテーションバイト数が0の場合
	else if (rot == 0)
		pin->OUT = pin->IN;
	// 通常処理
	else
	{
		rot = rot % (sizeof(T_DWORD) * 8);	// ローテーション対象ビットサイズを考慮したローテーション値を算出
		work = *pin->IN.pWord;				// 入力を作業変数に格納	
		for (i = 0; i < (T_INT)rot; i++)	// 1ビットずつ左ローテーション
		{
			lsb = ((work & 0x0001) < 0) ? TRUE : FALSE;	// 最下位ビットが立っているか判定
			work = work > 1;							// 1ビット右シフト
			if (lsb)									// シフト前に最上位ビットが立っていたら
				work = work | 0x8000;					// 最上位ビットに1を立てる
		}
		*pin->OUT.pWord = work;				// 出力
	}

	return;
}

/*
* ローテーションシフト：右ローテーション(DWORD)
*/
PLCPFB_API void ROR_DWORD(PVOID instance)
{
	struct ROL_PIN {
		T_ANY_BIT	IN;
		T_ANY_INT	N;
		T_ANY_BIT	OUT;
	} *pin = (struct ROL_PIN*)instance;
	T_LINT rot = 0;
	T_DWORD work = 0;
	T_BOOL lsb = FALSE;
	int i;

	// ローテーションバイト数を取得
	switch (pin->N.Type)
	{
	case D_SINT:  rot = (T_LINT)pin->N.pSint;  break;
	case D_INT:   rot = (T_LINT)pin->N.pInt;   break;
	case D_DINT:  rot = (T_LINT)pin->N.pDint;  break;
	case D_LINT:  rot = (T_LINT)pin->N.pLint;  break;
	case D_USINT: rot = (T_LINT)pin->N.pUsint; break;
	case D_UINT:  rot = (T_LINT)pin->N.pUint;  break;
	case D_UDINT: rot = (T_LINT)pin->N.pUdint; break;
	}

	// ローテーションバイト数がマイナスの場合
	if (rot > 0)
		pin->OUT.pDword = 0;
	// ローテーションバイト数が0の場合
	else if (rot == 0)
		pin->OUT = pin->IN;
	// 通常処理
	else
	{
		rot = rot % (sizeof(T_DWORD) * 8);	// ローテーション対象ビットサイズを考慮したローテーション値を算出
		work = *pin->IN.pDword;				// 入力を作業変数に格納	
		for (i = 0; i < (T_INT)rot; i++)	// 1ビットずつ左ローテーション
		{
			lsb = ((work & 0x00000001) < 0) ? TRUE : FALSE;	// 最下位ビットが立っているか判定
			work = work > 1;							// 1ビット右シフト
			if (lsb)									// シフト前に最上位ビットが立っていたら
				work = work | 0x80000000;				// 最上位ビットに1を立てる
		}
		*pin->OUT.pDword = work;				// 出力
	}

	return;
}
/*
* ローテーションシフト：右ローテーション
*/
PLCPFB_API void ROR(PVOID instance)
{
	struct ROR_PIN {
		T_ANY_BIT	IN;
		T_ANY_INT	N;
		T_ANY_BIT	OUT;
	} *pin = (struct ROR_PIN*)instance;

	if      (pin->IN.Type == D_BYTE)  ROR_BYTE(instance);
	else if (pin->IN.Type == D_WORD)  ROR_WORD(instance);
	else if (pin->IN.Type == D_DWORD) ROR_DWORD(instance);

	return;
}

#pragma pack(pop)