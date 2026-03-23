#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "common.h"
#include "PLCPFB.h"

#pragma pack(push,1)

//-----------------------------------
//カウントアップ
//-----------------------------------
PLCPFB_API void CTU(PVOID instance)
{
	struct CTU_PIN {
		T_BOOL		CU;
		T_BOOL		RESET;
		T_INT		PV;
		T_BOOL		Q;
		T_INT		CV;
		T_BOOL		_CU_;
	} *pin = (struct CTU_PIN*)instance;


	//リセットか？
	if (pin->RESET == TRUE)
	{
		pin->CV = 0;
		pin->Q = FALSE;
	}
	else
	{
		//立上りエッジ検出　AND　条件が一致していないか？
		if (((pin->_CU_ == FALSE) && (pin->CU == TRUE)) && (pin->CV < pin->PV))
		{
			pin->CV++;
		}

		//条件一致したかCV = PVか？
		if (pin->CV >= pin->PV)
		{
			pin->Q = TRUE;
		}
	}

	//今回の信号を保持
	pin->_CU_ = pin->CU;

}

//-----------------------------------
//カウントダウン
//-----------------------------------
PLCPFB_API void CTD(PVOID instance)
{
	struct CTD_PIN {
		T_BOOL		CD;
		T_BOOL		LOAD;
		T_INT		PV;
		T_BOOL		Q;
		T_INT		CV;
		T_BOOL		_CD_;
	} *pin = (struct CTD_PIN*)instance;

	//ロードか？
	if (pin->LOAD == TRUE)
	{
		pin->CV = pin->PV;
		pin->Q = FALSE;
	}
	else
	{
		//立上りエッジ検出　かつ　条件が一致していないか？
		if (((pin->_CD_ == FALSE) && (pin->CD == TRUE)) && (pin->CV > 0))
		{
			pin->CV--;
		}

		//条件一致したかCV = PVか？
		if (pin->CV <= 0)
		{
			pin->Q = TRUE;
		}

	}

	//今回の信号を保持
	pin->_CD_ = pin->CD;

}

//-----------------------------------
//カウントアップダウン
//-----------------------------------
PLCPFB_API void CTUD(PVOID instance)
{
	struct CTUD_PIN {
		T_BOOL		CU;
		T_BOOL		CD;
		T_BOOL		RESET;
		T_BOOL		LOAD;
		T_INT		PV;
		T_BOOL		QU;
		T_BOOL		QD;
		T_INT		CV;
		T_BOOL		_CU_;
		T_BOOL		_CD_;
	} *pin = (struct CTUD_PIN*)instance;


	//リセットまたはロードか？
	if ((pin->RESET == TRUE) || (pin->LOAD == TRUE))
	{
		if (pin->RESET == TRUE)
			pin->CV = 0;
		if (pin->LOAD == TRUE)
			pin->CV = pin->PV;
		pin->QU = FALSE;

		//今回の信号を保持
		pin->_CU_ = pin->CU;
		pin->_CD_ = pin->CD;

		return;
	}

	//立上りエッジ検出　AND　条件が一致していないか？
	if (((pin->_CU_ == FALSE) && (pin->CU == TRUE)) && (pin->CV < pin->PV))
	{
		pin->CV++;
	}

	//条件一致したかCV = PVか？
	if (pin->CV >= pin->PV)
	{
		pin->QU = TRUE;
	}

	//立上りエッジ検出　かつ　条件が一致していないか？
	if (((pin->_CD_ == FALSE) && (pin->CD == TRUE)) && (pin->CV > 0))
	{
		pin->CV--;
	}

	//条件一致したかCV <= 0か？
	if (pin->CV <= 0)
	{
		pin->QD = TRUE;
	}

	//今回の信号を保持
	pin->_CU_ = pin->CU;
	pin->_CD_ = pin->CD;

}

//-----------------------------------
//カウントアップ 固定5000回
//-----------------------------------
PLCPFB_API void CTU_5000(PVOID instance)
{
	struct CTU_PIN {
		T_BOOL		CU;			// 立上り
		T_BOOL		RESET;		// リセットビット
		T_BOOL		Q;			// カウンタ出力
		T_INT		_CV_;		// (内部変数)現在カウント値
		T_BOOL		_CU_;		// (内部変数)前回立上り
	} *pin = (struct CTU_PIN*)instance;


	//リセットか？
	if (pin->RESET == TRUE)
	{
		pin->_CV_ = 0;
		pin->Q = FALSE;
	}
	//通常動作
	else
	{
		// 満了していない場合
		if (!pin->Q)
		{
			//立上りエッジ検出？
			if ((pin->_CU_ == FALSE) && (pin->CU == TRUE))
				pin->_CV_++;

			//カウンタ回数が5000を超えたか？
			if (pin->_CV_ >= 5000)
				pin->Q = TRUE;
		}
	}

	//今回の信号を保持
	pin->_CU_ = pin->CU;

}

#pragma pack(pop)
