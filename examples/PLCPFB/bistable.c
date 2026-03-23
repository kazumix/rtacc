#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "common.h"
#include "PLCPFB.h"

#pragma pack(push,1)

/*
* バイステーブル：優先セット
*/
PLCPFB_API void SR(PVOID instance)
{
	struct SR_PIN {
		T_BOOL		SET1;		// 優先セット
		T_BOOL		RESET;		// リセット
		T_BOOL		Q1;			// 出力
		T_BOOL		_CALL_;		// 内部保持:呼出状態
	} *pin = (struct SR_PIN*)instance;

	// 初回呼出時
	if (pin->_CALL_ == TRUE)
	{
		pin->Q1 = FALSE;		// Q1は必ずFALSE
		pin->_CALL_ = TRUE;		// 呼出済みとする
		return;
	}

	if (pin->SET1 == TRUE)			// 優先セットが立っている
		pin->Q1 = TRUE;
	else if(pin->RESET == TRUE)		// リセットが立っている
		pin->Q1 = FALSE;
	
	return;
}

/*
* バイステーブル：優先リセット
*/
PLCPFB_API void RS(PVOID instance)
{
	struct SR_PIN {
		T_BOOL		SET;		// セット
		T_BOOL		RESET1;		// 優先リセット
		T_BOOL		Q1;			// 出力
		T_BOOL		_CALL_;		// 内部保持:呼出状態
	} *pin = (struct SR_PIN*)instance;

	// 初回呼出時
	if (pin->_CALL_ == TRUE)
	{
		pin->Q1 = FALSE;		// Q1は必ずFALSE
		pin->_CALL_ = TRUE;		// 呼出済みとする
		return;
	}

	if (pin->RESET1 == TRUE)			// 優先リセットが立っている
		pin->Q1 = FALSE;
	else if (pin->SET == TRUE)			// セットが立っている
		pin->Q1 = TRUE;

	return;
}

#pragma pack(pop)