#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "common.h"
#include "PLCPFB.h"
#include "MN_PID2.h"
#include "PIDFunctions.h"

#pragma pack(push,1)

#define		SIZE_OF_ARRAY MAX_CH * 2			// [配列数 MAX_CH(WORD) * 2Byte]

static T_WORD			wPIDCnt;				// PID関連FB用カウント数
static T_WORD			wATCnt;					// AT用FBカウント数
static T_WORD			wReqSts[MAX_CH];
static T_WORD			wATReqSts[MAX_CH];
static T_WORD			wReqIni[MAX_CH];
static T_WORD			wReqATIni[MAX_CH];
static PID_CALCBUFFER	pidCbuf[MAX_CH];		// 演算用バッファ
static AT_CALCBUFFER	ATCbuf[MAX_CH];			// オートチューニング用バッファ
// PID制御用パラメータ構造体
typedef struct {
	T_BOOL		RUN;		// 入力01:実行信号
	T_LREAL		PV;			// 入力02:現在の測定値
	// 以下ST_PIDの分解
	T_LREAL		Dir;		// 入力03:動作 (0:逆動作 1:正動作) 
	T_LREAL		Unit;		// 入力04:(将来用:0固定)
	T_LREAL		SV;			// 入力05:目標値
	T_LREAL		PVCyc;		// 入力06:測定値取得周期(秒)
	T_LREAL		DifGain;	// 入力07:微分ゲイン
	T_LREAL		P;			// 入力08:比例帯
	T_LREAL		I;			// 入力09:積分時間(秒)
	T_LREAL		D;			// 入力10:微分時間(秒)
	T_LREAL		MV_Max;		// 入力11:出力値最大値
	T_LREAL		MV_Min;		// 入力12:出力値最大値
	// 以上
	T_BOOL		NG;			// 出力01:エラー信号
	T_INT		ID;			// 出力02:FBインスタンスID
	T_INT		ErrSts;		// 出力03:エラーステータス
	T_LREAL		MV;			// 出力04:MV出力値(PID制御結果)
	// 内部変数
	T_BOOL		_INIT_;		// 内部変数：初期化フラグ
}MN_PID_PIN;
// オートチューニング用パラメータ構造体
typedef struct {
	T_BOOL		RUN;		// 入力01:実行信号
	T_LREAL		PV;			// 入力02:現在の測定値
	T_LREAL		SV;			// 入力03:オートチューニング目標温度
	T_LREAL		Unit;		// 入力04:(将来用:0固定)
	T_LREAL		SVCross;	// 入力05:目標値クロス判定カウンタ値
	T_LREAL		PVCyc;		// 入力06:測定値取得周期(秒)
	T_LREAL		ATCyc;		// 入力07:オートチューニング終了判定回数
	T_LREAL		MV_Max;		// 入力08:出力値最大値(%)
	T_BOOL		NG;			// 出力01:エラー信号
	T_INT		ErrSts;		// 出力02:エラーステータス
	T_BOOL		AT_Run;		// 出力03:実行中信号
	T_BOOL		AT_Fin;		// 出力04:実行終了信号
	T_LREAL		MV_Flg;		// 出力05:MV出力値
	T_INT		ID;			// 出力06:FBインスタンスID
	T_LREAL		P;			// 出力07:オートチューニング正常終了自に算出する比例帯
	T_LREAL		I;			// 出力08:オートチューニング正常終了自に算出する積分時間(秒)
	T_LREAL		D;			// 出力09:オートチューニング正常終了自に算出する微分時間(秒)

	// 内部変数
	T_BOOL		_INIT_;		// 内部変数：初期化フラグ
}AT_LMTCYC_PIN;

// 内部関数：PID制御FBのパラメータを構造体にセットする
void SetStructPID(MN_PID_PIN* param, ST_PIDEx* pStr)
{
	pStr->doDir       = param->Dir;	 
	pStr->doUnit	  = param->Unit;	
	pStr->doSV		  = param->SV;		
	pStr->doPVCyc	  = param->PVCyc;	
	pStr->doDifGain   = param->DifGain;
	pStr->doP		  = param->P;		
	pStr->doI		  = param->I;		
	pStr->doD		  = param->D;		
	pStr->doMV_Max	  = param->MV_Max;	
	pStr->doMV_Min	  = param->MV_Min;	
	pStr->dwLogEnable = FALSE;
}
// 内部関数：オートチューニングFBのパラメータを構造体にセットする
void SetStructAT(AT_LMTCYC_PIN* param, ST_ATEx* pStr)
{
	pStr->doUnit    = param->Unit;
	pStr->doATCyc   = param->ATCyc;
	pStr->doPVCyc   = param->PVCyc;
	pStr->doMV_Max  = param->MV_Max;
	pStr->doSV      = param->SV;
	pStr->doSVCross = param->SVCross;
	pStr->doP       = param->P;
	pStr->doI       = param->I;
	pStr->doD       = param->D;
	pStr->dwLogEnable = FALSE;
}

//-----------------------------------
//オートチューニング
//-----------------------------------
PLCPFB_API void MN_AT_LmtCyc(PVOID instance)
{
	AT_LMTCYC_PIN* pin = (AT_LMTCYC_PIN*)instance;
	
	int		inRtn;
	ST_ATEx	sAT = { 0 };
	BYTE	byATCyc;
	BYTE	byMV;
	BYTE	byATRun;
	int		inCyc;
	double	*doMV = &pin->MV_Flg;
	double	*doPV = &pin->PV;
	WORD	woReqID;

	// 初期化
	if (!pin->_INIT_)
	{
		pin->ID = wATCnt;		// FBのインスタンスID設定
		wATCnt++;				// FBのインスタンスID連番を更新
		wATReqSts[pin->ID] = 0;	// 起動要求クリア

		pin->_INIT_ = TRUE;		// 初期化済み
	}

	// 未要求時
	if (!pin->RUN)
	{
		pin->NG = FALSE;
		pin->AT_Run = FALSE;
		pin->AT_Fin = FALSE;
		pin->ErrSts = 0;
		pin->MV_Flg = 0.0;
		wATReqSts[pin->ID] = 0;				// 起動要求クリア
		return;
	}
	// IDの確認
	if (pin->ID > MAX_ID)
	{
		// FBが最大数を超過した場合、NGとする
		pin->NG = TRUE;
		pin->ErrSts = ERR_FB_MAX;
		wATReqSts[pin->ID] = 0;				// 起動要求クリア
		return;
	}
	// パラメータサイズ判定はスキップ

	// 立上り判定
	if (wATReqSts[pin->ID] == FALSE) 
	{				// 起動要求クリア
		wATReqSts[pin->ID] = TRUE;			// 起動中とする。
		woReqID = pin->ID + MAX_CH;			// MAX_CH加算ID時は、初期化要求 
	}
	else 
	{
		woReqID = pin->ID;
	}

	SetStructAT(pin, &sAT);		// FBパラメータを構造体にセット

	byATCyc = (BYTE)sAT.doATCyc;
	inCyc = (int)sAT.doSVCross;

	// オートチューニング実行
	inRtn = mnc_PidAutoTuningByLimitCycle(woReqID, &byMV, &byATRun, sAT.doSV, *doPV, sAT.doPVCyc, byATCyc, sAT.doMV_Max, inCyc, (double*)&sAT.doP, (double*)&sAT.doI, (double*)&sAT.doD, &ATCbuf[pin->ID]);
	if (inRtn != 0)
	{
		pin->NG = TRUE;
		pin->ErrSts = inRtn;
		*doMV = 0.0;
	}
	else
	{
		pin->NG = FALSE;
		pin->ErrSts = 0;

		if (byMV != 0) {
			*doMV = 1.0;
		}
		else {
			*doMV = 0.0;
		}

		if (byATRun == 1) {
			pin->AT_Run = TRUE;
			pin->AT_Fin = FALSE;
		}
		else if (byATRun == 2) {
			pin->AT_Run = FALSE;
			pin->AT_Fin = TRUE;
		}

		// PID演算結果トレース機能は移植しない
	}

}

//-----------------------------------
//偏差PID制御
//-----------------------------------
PLCPFB_API void MN_PID(PVOID instance)
{
	MN_PID_PIN *pin = (MN_PID_PIN*)instance;

	int			inRtn;
	ST_PIDEx	sPID = { 0 };
	double		*doPV;
	WORD		woReqID;

	// 初期化
	if (!pin->_INIT_)
	{
		pin->ID = wPIDCnt;		// FBのインスタンスID設定
		wPIDCnt++;				// FBのインスタンスID連番を更新
		wReqSts[pin->ID] = 0;	// 起動要求クリア

		pin->_INIT_ = TRUE;		// 初期化済み
	}
	// 未要求時
	if (!pin->RUN)
	{
		pin->NG = FALSE;
		pin->ErrSts = 0;
		pin->MV     = 0.0;
		wReqSts[pin->ID] = 0;				// 起動要求クリア
		return;
	}
	// IDの確認
	if (pin->ID > MAX_ID)
	{
		// FBが最大数を超過した場合、NGとする
		pin->NG = TRUE;
		pin->ErrSts = ERR_FB_MAX;
		wATReqSts[pin->ID] = 0;				// 起動要求クリア
		return;
	}

	// 立上り判定
	if (wReqSts[pin->ID] == FALSE)
	{
		// 起動要求クリア
		wReqSts[pin->ID] = TRUE;			// 起動中とする。
		woReqID = pin->ID + MAX_CH;			// MAX_CH加算ID時は、初期化要求 
	}
	else
	{
		woReqID = pin->ID;
	}
	// パラメータセット
	SetStructPID(pin, &sPID);

	doPV = &pin->PV;
	inRtn = mnc_PID_Control(woReqID, (BYTE)sPID.doDir, sPID.doSV, *doPV, sPID.doPVCyc, sPID.doP, sPID.doI, sPID.doD, sPID.doDifGain, sPID.doMV_Max, sPID.doMV_Min, &pin->MV, &pidCbuf[pin->ID]);
	if (inRtn != 0)
	{
		pin->NG = TRUE;
		pin->ErrSts = inRtn;
	}
	else
	{
		pin->NG = FALSE;
		pin->ErrSts = 0;
	}
	
	// PID演算結果トレース機能は移植しない

	return;
}
//-----------------------------------
//微分先行型PID制御
//-----------------------------------
PLCPFB_API void MN_PI_D(PVOID instance)
{
	MN_PID_PIN *pin = (MN_PID_PIN*)instance;

	int			inRtn;
	ST_PIDEx	sPID = { 0 };
	double		*doPV;
	WORD		woReqID;

	// 初期化
	if (!pin->_INIT_)
	{
		pin->ID = wPIDCnt;		// FBのインスタンスID設定
		wPIDCnt++;				// FBのインスタンスID連番を更新
		wReqSts[pin->ID] = 0;	// 起動要求クリア

		pin->_INIT_ = TRUE;		// 初期化済み
	}
	// 未要求時
	if (!pin->RUN)
	{
		pin->NG = FALSE;
		pin->ErrSts = 0;
		pin->MV = 0.0;
		wReqSts[pin->ID] = 0;				// 起動要求クリア
		return;
	}
	// IDの確認
	if (pin->ID > MAX_ID)
	{
		// FBが最大数を超過した場合、NGとする
		pin->NG = TRUE;
		pin->ErrSts = ERR_FB_MAX;
		wATReqSts[pin->ID] = 0;				// 起動要求クリア
		return;
	}

	// 立上り判定
	if (wReqSts[pin->ID] == FALSE)
	{
		// 起動要求クリア
		wReqSts[pin->ID] = TRUE;			// 起動中とする。
		woReqID = pin->ID + MAX_CH;			// MAX_CH加算ID時は、初期化要求 
	}
	else
	{
		woReqID = pin->ID;
	}
	// パラメータセット
	SetStructPID(pin, &sPID);

	doPV = &pin->PV;
	inRtn = mnc_PID_Control(woReqID, (BYTE)sPID.doDir, sPID.doSV, *doPV, sPID.doPVCyc, sPID.doP, sPID.doI, sPID.doD, sPID.doDifGain, sPID.doMV_Max, sPID.doMV_Min, (double*)&pin->MV, &pidCbuf[pin->ID]);
	
	if (inRtn != 0)
	{
		pin->NG = TRUE;
		pin->ErrSts = inRtn;
	}
	else
	{
		pin->NG = FALSE;
		pin->ErrSts = 0;
	}

	// PID演算結果トレース機能は移植しない
}
//-----------------------------------
//比例微分先行型PID制御
//-----------------------------------
PLCPFB_API void MN_I_PD(PVOID instance)
{
	MN_PID_PIN *pin = (MN_PID_PIN*)instance;

	int			inRtn;
	ST_PIDEx	sPID = { 0 };
	double		*doPV;
	WORD		woReqID;

	// 初期化
	if (!pin->_INIT_)
	{
		pin->ID = wPIDCnt;		// FBのインスタンスID設定
		wPIDCnt++;				// FBのインスタンスID連番を更新
		wReqSts[pin->ID] = 0;	// 起動要求クリア

		pin->_INIT_ = TRUE;		// 初期化済み
	}
	// 未要求時
	if (!pin->RUN)
	{
		pin->NG = FALSE;
		pin->ErrSts = 0;
		pin->MV = 0.0;
		wReqSts[pin->ID] = 0;				// 起動要求クリア
		return;
	}
	// IDの確認
	if (pin->ID > MAX_ID)
	{
		// FBが最大数を超過した場合、NGとする
		pin->NG = TRUE;
		pin->ErrSts = ERR_FB_MAX;
		wATReqSts[pin->ID] = 0;				// 起動要求クリア
		return;
	}

	// 立上り判定
	if (wReqSts[pin->ID] == FALSE)
	{
		// 起動要求クリア
		wReqSts[pin->ID] = TRUE;			// 起動中とする。
		woReqID = pin->ID + MAX_CH;			// MAX_CH加算ID時は、初期化要求 
	}
	else
	{
		woReqID = pin->ID;
	}
	// パラメータセット
	SetStructPID(pin, &sPID);

	doPV = &pin->PV;
	inRtn = mnc_I_PD_Control(woReqID, (BYTE)sPID.doDir, sPID.doSV, *doPV, sPID.doPVCyc, sPID.doP, sPID.doI, sPID.doD, sPID.doDifGain, sPID.doMV_Max, sPID.doMV_Min, (double*)&pin->MV, &pidCbuf[pin->ID]);

	if (inRtn != 0)
	{
		pin->NG = TRUE;
		pin->ErrSts = inRtn;
	}
	else
	{
		pin->NG = FALSE;
		pin->ErrSts = 0;
	}

	// PID演算結果トレース機能は移植しない
}
//-----------------------------------
//ゲイン値返却
//-----------------------------------
PLCPFB_API void MN_Gain(PVOID instance)
{
	struct MN_GAIN_PIN {
		T_BOOL		RUN;		// 入力01:実行信号
		T_LREAL		Val;		// 入力02:被加算値
		T_LREAL		Gain;		// 入力03:加算値
		T_BOOL		NG;			// 出力01:エラー信号
		T_LREAL		GainVal;	// 出力02:ゲイン値
	} *pin = (struct MN_GAIN_PIN*)instance;

	// 未要求時
	if (!pin->RUN)
	{
		pin->NG = FALSE;
		pin->GainVal = 0.0;
		return;
	}
	pin->GainVal = mnc_ApplyRatio(pin->Val, pin->Gain);	// ゲイン値取得

	return;
}
//-----------------------------------
//バイアス値返却
//-----------------------------------
PLCPFB_API void MN_Bias(PVOID instance)
{
	struct MN_GAIN_PIN {
		T_BOOL		RUN;		// 入力01:実行信号
		T_LREAL		Val;		// 入力02:被乗算値
		T_LREAL		Bias;		// 入力03:乗算値
		T_BOOL		NG;			// 出力01:エラー信号
		T_LREAL		BiasVal;	// 出力02:バイアス値
	} *pin = (struct MN_GAIN_PIN*)instance;

	// 未要求時
	if (!pin->RUN)
	{
		pin->NG = FALSE;
		pin->BiasVal = 0.0;
		return;
	}

	pin->BiasVal = mnc_ApplyBias(pin->Val, pin->Bias);

	return;
}
//-----------------------------------
//一次遅れフィルタ適用
//-----------------------------------
PLCPFB_API void MN_Filter(PVOID instance)
{
	struct MN_FILTER_PIN {
		T_BOOL		RUN;		// 入力01:実行信号
		T_LREAL		Val;		// 入力02:フィルタ対象値
		T_LREAL		Filter;		// 入力03:フィルタ値
		T_BOOL		NG;			// 出力01:エラー信号
		T_LREAL		FilterVal;	// 出力02:フィルタ適応値
		T_BOOL		_INIT_;		// 内部変数：初期化フラグ
		T_LREAL		_OldVal_;	// 内部変数：前回値
	} *pin = (struct MN_FILTER_PIN*)instance;

	// 初期化
	if (!pin->_INIT_)
	{
		pin->_OldVal_ = 0.0;
	}
	// 未要求時
	if (!pin->RUN)
	{
		pin->NG = FALSE;
		pin->FilterVal = 0.0;
		return;
	}
	pin->FilterVal = mnc_PrimaryDelayFilter(pin->Val, pin->_OldVal_, pin->Filter);
	pin->_OldVal_ = pin->FilterVal;

	return;
}
//-----------------------------------
//指定値の単位変換
//-----------------------------------
PLCPFB_API void MN_EngCnv(PVOID instance)
{

	struct MN_ENGCNV_PIN {
		T_BOOL		RUN;		// 入力01:実行信号
		T_LREAL		Val;		// 入力02:変換元の値
		T_LREAL		Max;		// 入力03:変換元の最大値
		T_LREAL		Min;		// 入力04:変換元の最小値
		T_LREAL		SclMax;		// 入力05:変換後の最大値
		T_LREAL		SclMin;		// 入力06:変換後の最小値
		T_BOOL		NG;			// 出力01:エラー信号
		T_INT		ErrSts;		// 出力02:エラーステータス
		T_LREAL		EngVal;		// 出力03:変換後の値
	} *pin = (struct MN_ENGCNV_PIN*)instance;

	int		inRtn;

	// 未要求時
	if (!pin->RUN)
	{
		pin->NG = FALSE;
		pin->ErrSts = 0;
		return;
	}
	inRtn = mnc_ConvertDimension(pin->Val, pin->Min, pin->SclMin, pin->Max, pin->SclMax, &pin->EngVal);

	if (inRtn != 0)
	{
		pin->NG = TRUE;
		pin->ErrSts = inRtn;
	}
	else
	{
		pin->NG = FALSE;
		pin->ErrSts = 0;
	}

	return;
}
//-----------------------------------
//入力値の上下限判定
//-----------------------------------
PLCPFB_API void MN_LmtChk(PVOID instance)
{

	struct MN_LMTCHK_PIN {
		T_BOOL		RUN;		// 入力01:実行信号
		T_LINT		Val;		// 出力02:判定対象値
		T_LINT		Max;		// 出力03:最大値
		T_LINT		Min;		// 出力04:最小値
		T_BOOL		NG;			// 出力01:エラー信号
		T_BOOL		Hi;			// 出力02:最大判定
		T_BOOL		Low;		// 出力03:最小判定
		T_LINT		ChkVal;		// 出力04:判定結果
	} *pin = (struct MN_LMTCHK_PIN*)instance;

	pin->NG = FALSE;
	pin->Hi = FALSE;
	pin->Low = FALSE;
	pin->ChkVal = 0;

	// 未要求時
	if (pin->RUN != TRUE) {
		return;
	}

	// 上下限チェック
	if (pin->Val < pin->Min)	//下限値未満の場合
	{
		pin->NG = FALSE;
		pin->Low = FALSE;
		pin->ChkVal = pin->Min;
	}
	else if (pin->Val > pin->Max) // 上限値以上の場合
	{
		pin->NG = FALSE;
		pin->Hi = TRUE;
		pin->ChkVal = pin->Max;
	}
	else						// 範囲内の場合
	{
		pin->NG = FALSE;
		pin->ChkVal = pin->Val;
	}

	return;
}
//-----------------------------------
//PID制御用バッファのクリア
//-----------------------------------
PLCPFB_API void MN_ClearPIDBuf(PVOID instance)
{
	struct MN_CLRBUF_PIN {
		T_BOOL		RUN;		// 入力01:実行信号
		T_INT		ID;			// 入力02:クリア対象インスタンスID
		T_BOOL		NG;			// 出力01:エラー信号
	} *pin = (struct MN_CLRBUF_PIN*)instance;
	
	int inRtn = 0;

	// 出力クリア
	pin->NG  = FALSE;

	// 引数確認　最大値より大きい場合はNG
	if (pin->ID >= MAX_ID) 
	{
		pin->NG = TRUE;
		wReqIni[pin->ID] = 0;				// 起動要求クリア
		return;
	}
	// 引数確認　0未満の場合はNG
	if (pin->ID < 0) 
	{
		pin->NG = TRUE;
		wReqIni[pin->ID] = 0;				// 起動要求クリア
		return;
	}
	// 未要求時
	if (pin->RUN != TRUE) 
	{
		pin->NG = FALSE;
		wReqIni[pin->ID] = 0;				// 起動要求クリア
		return;
	}
	// 立上り判定
	if (wReqIni[pin->ID] == 0) 
	{
		// 起動要求クリア
		wReqIni[pin->ID] = 1;				// 起動中とする。

		// 初期化要求
		inRtn = mnc_ClearPidCalcBuffer(pin->ID, &pidCbuf[pin->ID]);
		if (inRtn != 0)
		{
			pin->NG = TRUE;
		}
		else
		{
			pin->NG = FALSE;
		}
		return;
	}
	return;
}
//-----------------------------------
//AT用バッファのクリア
//-----------------------------------
PLCPFB_API void MN_ClearATBuf(PVOID instance)
{
	struct MN_CLRBUF_PIN {
		T_BOOL		RUN;		// 入力01:実行信号
		T_INT		ID;			// 入力02:クリア対象インスタンスID
		T_BOOL		NG;			// 出力01:エラー信号
	} *pin = (struct MN_CLRBUF_PIN*)instance;

	int inRtn = 0;

	// 出力クリア
	pin->NG = FALSE;

	// 引数確認　最大値より大きい場合はNG
	if (pin->ID >= MAX_ID)
	{
		pin->NG = TRUE;
		wReqIni[pin->ID] = 0;				// 起動要求クリア
		return;
	}
	// 引数確認　0未満の場合はNG
	if (pin->ID < 0)
	{
		pin->NG = TRUE;
		wReqIni[pin->ID] = 0;				// 起動要求クリア
		return;
	}
	// 未要求時
	if (pin->RUN != TRUE)
	{
		pin->NG = FALSE;
		wReqIni[pin->ID] = 0;				// 起動要求クリア
		return;
	}
	// 立上り判定
	if (wReqIni[pin->ID] == 0)
	{
		// 起動要求クリア
		wReqIni[pin->ID] = 1;				// 起動中とする。

		// 初期化要求
		inRtn = mnc_ClearATCalcBuffer(pin->ID, &pidCbuf[pin->ID]);
		if (inRtn != 0)
		{
			pin->NG = TRUE;
		}
		else
		{
			pin->NG = FALSE;
		}
		return;
	}
	return;


}
#pragma pack(pop)