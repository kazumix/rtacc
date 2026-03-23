#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "common.h"
#include "PLCPFB.h"

#pragma pack(push,1)

/*
* エッジ検出：立下り
*/
PLCPFB_API void F_TRIG(PVOID instance)
{
	struct FTRIG_PIN {
		T_BOOL		CLK;		// エッジ
		T_BOOL		Q;			// 出力
		T_BOOL		_CLK_;		// 内部保持:前回エッジ
	} *pin = (struct FTRIG_PIN*)instance;
	
	// 立下がり発生時
	pin->Q = (pin->CLK == FALSE) && (pin->_CLK_ == TRUE);
	pin->_CLK_ = pin->CLK; // 今回値保存

	return;
}

/*
* エッジ検出：立上り
*/
PLCPFB_API void R_TRIG(PVOID instance)
{
	struct RTRIG_PIN {
		T_BOOL		CLK;		// エッジ
		T_BOOL		Q;			// 出力
		T_BOOL		_CLK_;		// 内部保持:前回エッジ
	} *pin = (struct RTRIG_PIN*)instance;

	// 立上り発生時
	pin->Q = (pin->CLK == TRUE) && (pin->_CLK_ == FALSE);
	pin->_CLK_ = pin->CLK; // 今回値保存

	return;
}

#pragma pack(pop)