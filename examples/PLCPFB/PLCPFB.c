/// <summary>
/// PLC plus Function Block
/// 
/// このモジュールは、このライブラリが含むファンクションブロック
/// をテーブルで定義します
/// </summary>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "common.h"
#include "PLCPFB.h"

// このモジュールの構造体定義は1バイトアラインが必要です
#pragma pack(push,1)

/// <summary>
/// タイマ関連 Timer.c
/// </summary>
//extern void Timer_CalcCpuSpeed(void);
extern void Time_GetTAG_Pointer(void);
PLCPFB_API void TON(PVOID instance);
PLCPFB_API void TOF(PVOID instance);
PLCPFB_API void TP(PVOID instance);
PLCPFB_API void TON_30S(PVOID instance);	  // 試製固定タイマ 30秒

/// <summary>
/// カウンタ関連 Counter.c
/// </summary>
PLCPFB_API void CTU(PVOID instance);
PLCPFB_API void CTD(PVOID instance);
PLCPFB_API void CTUD(PVOID instance);
PLCPFB_API void CTU_5000(PVOID instance);    // 試製固定カウンタ 5000回
/// <summary>
/// ファイル操作関連 File.c
/// </summary>
PLCPFB_API void FileWrite(PVOID instance);
PLCPFB_API void FileRead (PVOID instance);
/// <summary>
/// バイステーブル関連 bistable.c
/// </summary>
PLCPFB_API void SR(PVOID instance);
PLCPFB_API void RS(PVOID instance);
/// <summary>
/// エッジ検出関連 SenseEdge.c
/// </summary>
PLCPFB_API void F_TRIG(PVOID instance);
PLCPFB_API void R_TRIG(PVOID instance);
/// <summary>
/// PID関連 PID.c
/// </summary>
PLCPFB_API void MN_AT_LmtCyc(PVOID instance);
PLCPFB_API void MN_PID(PVOID instance);
PLCPFB_API void MN_PI_D(PVOID instance);
PLCPFB_API void MN_I_PD(PVOID instance);
PLCPFB_API void MN_Gain(PVOID instance);
PLCPFB_API void MN_Bias(PVOID instance);
PLCPFB_API void MN_Filter(PVOID instance);
PLCPFB_API void MN_EngCnv(PVOID instance);
PLCPFB_API void MN_LmtChk(PVOID instance);
PLCPFB_API void MN_ClearATBuf(PVOID instance);
PLCPFB_API void MN_ClearPIDBuf(PVOID instance);

/// <summary>
/// このファンクションブロックを動作させるために必要な初期化処理（１度だけ実施）
/// </summary>
void Initialize(void)
{
	//Timer_CalcCpuSpeed();
	Time_GetTAG_Pointer();	//時間算出用タグポインター取得
}


//-----------------------------------
//オンディレイタイマ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Ton = {
	"TON",
	TON,
	{
		{D_BOOL		,"IN"		,PIN_IN},		//立上り検出			(1Byte)
		{D_TIME		,"PT"		,PIN_IN},		//遅延用プリセット時間	(4Byte)
		{D_BOOL		,"Q"		,PIN_OUT},		//ET > PT				(1Byte)
		{D_TIME		,"ET"		,PIN_OUT},		//経過時間				(4Byte)
		{D_BOOL		,"_IN_"		,PIN_NON},		// 内部保持				(1Byte)
		{D_QWORD	,"_STTIME_"	,PIN_NON},		// 内部保持　開始時間	(8Byte)
		{0}
	}
};

//-----------------------------------
//オフディレイタイマ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Tof = {
	"TOF",
	TOF,
	{
		{D_BOOL		,"IN"		,PIN_IN},		//立下り検出						(1Byte)
		{D_TIME		,"PT"		,PIN_IN},		//遅延用プリセット時間				(4Byte)
		{D_BOOL		,"Q"		,PIN_OUT},		//IN = TRUE で、ET < PT なら TRUE	(1Byte)
										//IN = FALSE で、ET > PT なら TRUE
		{D_TIME		,"ET"		,PIN_OUT},		//経過時間							(4Byte)
		{D_BOOL		,"_IN_"		,PIN_NON},		// 内部保持							(1Byte)
		{D_QWORD	,"_STTIME_"	,PIN_NON},		// 内部保持　開始時間				(8Byte)
		{0}
	}
};

//-----------------------------------
//パルス
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Tp = {
	"TP",
	TP,
	{
		{D_BOOL		,"IN"		,PIN_IN},		//立上り検出				(1Byte)
		{D_TIME		,"PT"		,PIN_IN},		//パルス用プリセット時間	(4Byte)
		{D_BOOL		,"Q"		,PIN_OUT},		//							(1Byte)
		{D_TIME		,"ET"		,PIN_OUT},		//経過時間					(4Byte)
		{D_BOOL		,"_IN_"		,PIN_NON},		// 内部保持					(1Byte)
		{D_QWORD	,"_STTIME_"	,PIN_NON},		// 内部保持　開始時間		(8Byte)
		{0}
	}
};

//-----------------------------------
//オンディレイタイマ 30秒固定
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Ton_30s = {
	"TON_30S",
	TON_30S,
	{
		{D_BOOL		,"IN"		,PIN_IN},		//立上り検出			(1Byte)
		{D_BOOL		,"Q"		,PIN_OUT},		//ET > PT				(1Byte)
		{D_BOOL		,"_IN_"		,PIN_NON},		// 内部保持				(1Byte)
		{D_QWORD	,"_STTIME_"	,PIN_NON},		// 内部保持　タイマ満了時ティックカウンタ値	(8Byte)
		{0}
	}
};

//-----------------------------------
//カウントアップ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Ctu = {
	"CTU",
	CTU,
	{
		{D_BOOL		,"CU"		,PIN_IN},		//(1Byte)
		{D_BOOL		,"RESET"	,PIN_IN},		//(1Byte)
		{D_INT		,"PV"		,PIN_IN},		//(2Byte)
		{D_BOOL		,"Q"		,PIN_OUT},		//(1Byte)
		{D_INT		,"CV"		,PIN_OUT},		//(2Byte)
		{D_BOOL		,"_CU_"		,PIN_NON},		// 内部保持 (1Byte)
		{0}
	}
};

/**/
//-----------------------------------
//カウントダウン
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Ctd = {
	"CTD",
	CTD,
	{
		{D_BOOL		,"CD"		,PIN_IN},		//(1Byte)
		{D_BOOL		,"LOAD"		,PIN_IN},		//(1Byte)
		{D_INT		,"PV"		,PIN_IN},		//(2Byte)
		{D_BOOL		,"Q"		,PIN_OUT},		//(1Byte)
		{D_INT		,"CV"		,PIN_OUT},		//(2Byte)
		{D_BOOL		,"_CD_"		,PIN_NON},		// 内部保持
		{0}
	}
};


//-----------------------------------
//カウントアップダウン
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Ctud = {
	"CTUD",
	CTUD,
	{
		{D_BOOL		,"CU"		,PIN_IN},		//			(1Byte)
		{D_BOOL		,"CD"		,PIN_IN},		//			(1Byte)
		{D_BOOL		,"RESET"	,PIN_IN},		//			(1Byte)
		{D_BOOL		,"LOAD"		,PIN_IN},		//			(1Byte)
		{D_INT		,"PV"		,PIN_IN},		//			(2Byte)
		{D_BOOL		,"QU"		,PIN_OUT},		//			(1Byte)
		{D_BOOL		,"QD"		,PIN_OUT},		//			(1Byte)
		{D_INT		,"CV"		,PIN_OUT},		//			(2Byte)
		{D_BOOL		,"_CU_"		,PIN_NON},		// 内部保持	(1Byte)
		{D_BOOL		,"_CD_"		,PIN_NON},		// 内部保持	(1Byte)
		{0}
	}
};

//-----------------------------------
//カウントアップ 5000
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Ctu_5000 = {
	"CTU_5000",
	CTU_5000,
	{
		{D_BOOL		,"CU"		,PIN_IN},		// 立上りビット				(1Byte)
		{D_BOOL		,"RESET"	,PIN_IN},		// リセットビット			(1Byte)
		{D_BOOL		,"Q"		,PIN_OUT},		// カウンタ出力				(1Byte)
		{D_INT		,"_CV_"		,PIN_NON},		// (内部変数)現在カウント値	(2Byte)
		{D_BOOL		,"_CU_"		,PIN_NON},		// (内部変数)前回立上りビット(1Byte)
		{0}
	}
};

//-----------------------------------
//ファイル書き込み
//-----------------------------------
struct FUNCTIONBLOCKDEFINE filewrite = {
	"FileWrite",
	FileWrite,
	{
		{D_BOOL		,"Execute"		,PIN_IN},		//			(1Byte)
		{D_STRING	,"FileName"		,PIN_IN},		//			(83Byte)
		{D_ANY		,"WriteData"	,PIN_IN},		//			(4Byte)
		{D_UDINT	,"Size"			,PIN_IN},		//			(4Byte)
		{D_BOOL		,"Done"			,PIN_OUT},		//			(1Byte)
		{D_BOOL		,"Busy"			,PIN_OUT},		//			(1Byte)
		{D_BOOL		,"Err"			,PIN_OUT},		//			(1Byte)
		{D_UINT		,"ErrID"		,PIN_OUT},		//			(2Byte)
		{D_BOOL		,"_Execute_"	,PIN_NON},		// 内部保持	(1Byte)
		{D_UDINT	,"_Work_"		,PIN_NON},		// 内部保持	(4Byte)
		{0}
	}
};

//-----------------------------------
//ファイル読み込み
//-----------------------------------
struct FUNCTIONBLOCKDEFINE fileread = {
	"FileRead",
	FileRead,
	{
		{D_BOOL		,"Execute"		,PIN_IN},		//			(1Byte)
		{D_STRING	,"FileName"		,PIN_IN},		//			(83Byte)
		{D_UDINT	,"Offset"		,PIN_IN},		//			(4Byte)
		{D_UDINT	,"Size"			,PIN_IN},		//			(4Byte)
		{D_BOOL		,"Done"			,PIN_OUT},		//			(1Byte)
		{D_BOOL		,"Busy"			,PIN_OUT},		//			(1Byte)
		{D_BOOL		,"Err"			,PIN_OUT},		//			(1Byte)
		{D_UINT		,"ErrID"		,PIN_OUT},		//			(2Byte)
		{D_ANY		,"ReadData"		,PIN_OUT},		//			(4Byte)
		{D_BOOL		,"_Execute_"	,PIN_NON},		// 内部保持	(1Byte)
		{D_UDINT	,"_Work_"		,PIN_NON},		// 内部保持	(4Byte)
		{0}
	}
};

//-----------------------------------
//優先セット
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Sr = {
	"SR",
	SR,
	{
		{D_BOOL		,"SET1"			,PIN_IN},		//			(1Byte)
		{D_BOOL		,"RESET"		,PIN_IN},		//			(1Byte)
		{D_BOOL		,"Q1"			,PIN_OUT},		//			(1Byte)
		{D_BOOL		,"_CALL_"		,PIN_NON},		//内部保持	(1Byte)
		{0}
	}
};

//-----------------------------------
//優先リセット
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Rs = {
	"RS",
	RS,
	{
		{D_BOOL		,"SET"			,PIN_IN},		//			(1Byte)
		{D_BOOL		,"RESET1"		,PIN_IN},		//			(1Byte)
		{D_BOOL		,"Q1"			,PIN_OUT},		//			(1Byte)
		{D_BOOL		,"_CALL_"		,PIN_NON},		//内部保持	(1Byte)
		{0}
	}
};

//-----------------------------------
//立下りエッジ検出
//-----------------------------------
struct FUNCTIONBLOCKDEFINE F_Trig = {
	"F_TRIG",
	F_TRIG,
	{
		{D_BOOL		,"CLK"			,PIN_IN},		//			(1Byte)
		{D_BOOL		,"Q"			,PIN_OUT},		//			(1Byte)
		{D_BOOL		,"_CLK_"		,PIN_NON},		//内部保持	(1Byte)
		{0}
	}
};

//-----------------------------------
//立上りエッジ検出
//-----------------------------------
struct FUNCTIONBLOCKDEFINE R_Trig = {
	"R_TRIG",
	R_TRIG,
	{
		{D_BOOL		,"CLK"			,PIN_IN},		//			(1Byte)
		{D_BOOL		,"Q"			,PIN_OUT},		//			(1Byte)
		{D_BOOL		,"_CLK_"		,PIN_NON},		//内部保持	(1Byte)
		{0}
	}
};

//-----------------------------------
//オートチューニング
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Mn_At_LmtCyc = {
	"MN_AT_LmtCyc",
	MN_AT_LmtCyc,
	{
		// 入力
		{D_BOOL	,	"RUN"		,PIN_IN},	//			(1Byte)
		{D_LREAL,	"PV"		,PIN_IN},	//			(8Byte)
		{D_LREAL,	"SV"		,PIN_IN},	//			(8Byte)
		{D_LREAL,	"Unit"		,PIN_IN},	//			(8Byte)
		{D_LREAL,	"SVCross"	,PIN_IN},	//			(8Byte)
		{D_LREAL,	"PVCyc"		,PIN_IN},	//			(8Byte)
		{D_LREAL,	"ATCyc"		,PIN_IN},	//			(8Byte)
		{D_LREAL,	"MV_Max"	,PIN_IN},	//			(8Byte)
		// 出力
		{D_BOOL	,	"NG"		,PIN_OUT},	//			(1Byte)
		{D_INT	,	"ErrSts"	,PIN_OUT},	//			(2Byte)
		{D_BOOL	,	"AT_Run"	,PIN_OUT},	//			(1Byte)
		{D_BOOL	,	"AT_Fin"	,PIN_OUT},	//			(1Byte)
		{D_LREAL,	"MV_Flg"	,PIN_OUT},	//			(8Byte)
		{D_INT	,	"ID"		,PIN_OUT},	//			(2Byte)
		{D_LREAL,	"P"			,PIN_OUT},	//			(8Byte)
		{D_LREAL,	"I"			,PIN_OUT},	//			(8Byte)
		{D_LREAL,	"D"			,PIN_OUT},	//			(8Byte)
		// 内部変数
		{D_BOOL,	"_INIT_"	,PIN_NON},	//			(1Byte)
		{0}
	}
};

//-----------------------------------
//偏差PID制御
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Mn_Pid = {
	"MN_PID",
	MN_PID,
	{
		{D_BOOL		,"RUN"			,PIN_IN},		//			(1Byte)
		{D_LREAL	,"PV"			,PIN_IN},		//			(8Byte)
		// 以下構造体ST_PIDの分解
		{D_LREAL	,"Dir"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"Unit"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"SV"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"PVCyc"		,PIN_IN},		//			(8Byte)
		{D_LREAL	,"DifGain"		,PIN_IN},		//			(8Byte)
		{D_LREAL	,"P"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"I"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"D"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"MV_Max"		,PIN_IN},		//			(8Byte)
		{D_LREAL	,"MV_Min"		,PIN_IN},		//			(8Byte)
		// 以上
		{D_BOOL		,"NG"			,PIN_OUT},		//			(1Byte)
		{D_INT		,"ID"			,PIN_OUT},		//			(2Byte)
		{D_INT		,"ErrSts"		,PIN_OUT},		//			(2Byte)
		{D_LREAL	,"MV"			,PIN_OUT},		//			(8Byte)
		{D_BOOL		,"_INIT_"		,PIN_NON},		//内部保持	(1Byte)
		{0}
	}
};

//-----------------------------------
//微分先行型PID制御
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Mn_Pi_D = {
	"MN_PI_D",
	MN_PI_D,
	{
		{D_BOOL		,"RUN"			,PIN_IN},		//			(1Byte)
		{D_LREAL	,"PV"			,PIN_IN},		//			(8Byte)
		// 以下構造体ST_PIDの分解
		{D_LREAL	,"Dir"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"Unit"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"SV"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"PVCyc"		,PIN_IN},		//			(8Byte)
		{D_LREAL	,"DifGain"		,PIN_IN},		//			(8Byte)
		{D_LREAL	,"P"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"I"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"D"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"MV_Max"		,PIN_IN},		//			(8Byte)
		{D_LREAL	,"MV_Min"		,PIN_IN},		//			(8Byte)
		// 以上
		{D_BOOL		,"NG"			,PIN_OUT},		//			(1Byte)
		{D_INT		,"ID"			,PIN_OUT},		//			(2Byte)
		{D_INT		,"ErrSts"		,PIN_OUT},		//			(2Byte)
		{D_LREAL	,"MV"			,PIN_OUT},		//			(8Byte)
		{D_BOOL		,"_INIT_"		,PIN_NON},		//内部保持	(1Byte)
		{0}
	}
};
//-----------------------------------
//比例微分先行型PID制御
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Mn_I_Pd = {
	"MN_I_PD",
	MN_I_PD,
	{
		{D_BOOL		,"RUN"			,PIN_IN},		//			(1Byte)
		{D_LREAL	,"PV"			,PIN_IN},		//			(8Byte)
		// 以下構造体ST_PIDの分解
		{D_LREAL	,"Dir"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"Unit"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"SV"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"PVCyc"		,PIN_IN},		//			(8Byte)
		{D_LREAL	,"DifGain"		,PIN_IN},		//			(8Byte)
		{D_LREAL	,"P"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"I"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"D"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"MV_Max"		,PIN_IN},		//			(8Byte)
		{D_LREAL	,"MV_Min"		,PIN_IN},		//			(8Byte)
		// 以上
		{D_BOOL		,"NG"			,PIN_OUT},		//			(1Byte)
		{D_INT		,"ID"			,PIN_OUT},		//			(2Byte)
		{D_INT		,"ErrSts"		,PIN_OUT},		//			(2Byte)
		{D_LREAL	,"MV"			,PIN_OUT},		//			(8Byte)
		{D_BOOL		,"_INIT_"		,PIN_NON},		//内部保持	(1Byte)
		{0}
	}
};
//-----------------------------------
//ゲイン値返却
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Mn_Gain = {
	"MN_Gain",
	MN_Gain,
	{
		{D_BOOL		,"RUN"			,PIN_IN},		//			(1Byte)
		{D_LREAL	,"Val"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"Gain"			,PIN_IN},		//			(8Byte)
		{D_BOOL		,"NG"			,PIN_OUT},		//			(1Byte)
		{D_LREAL	,"GainVal"		,PIN_OUT},		//			(8Byte)
		{0}
	}
};
//-----------------------------------
//バイアス値返却
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Mn_Bias = {
	"MN_Bias",
	MN_Bias,
	{
		{D_BOOL		,"RUN"			,PIN_IN},		//			(1Byte)
		{D_LREAL	,"Val"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"Bias"			,PIN_IN},		//			(8Byte)
		{D_BOOL		,"NG"			,PIN_OUT},		//			(1Byte)
		{D_LREAL	,"BiasVal"		,PIN_OUT},		//			(8Byte)
		{0}
	}
};
//-----------------------------------
//一次遅れフィルタ適用
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Mn_Filter = {
	"MN_Filter",
	MN_Filter,
	{
		{D_BOOL		,"RUN"			,PIN_IN},		//			(1Byte)
		{D_LREAL	,"Val"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"Filter"		,PIN_IN},		//			(8Byte)
		{D_BOOL		,"NG"			,PIN_OUT},		//			(1Byte)
		{D_LREAL	,"FilterVal"	,PIN_OUT},		//			(8Byte)
		{D_BOOL		,"_INIT_"		,PIN_NON},		//			(1Byte)
		{D_LREAL	,"_OldVal_"		,PIN_NON},		//			(8Byte)
		{0}
	}
};
//-----------------------------------
//指定値の単位変換
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Mn_EngCnv = {
	"MN_EngCnv",
	MN_EngCnv,
	{
		{D_BOOL		,"RUN"			,PIN_IN},		//			(1Byte)
		{D_LREAL	,"Val"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"Max"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"Min"			,PIN_IN},		//			(8Byte)
		{D_LREAL	,"SclMax"		,PIN_IN},		//			(8Byte)
		{D_LREAL	,"SclMin"		,PIN_IN},		//			(8Byte)
		{D_BOOL		,"NG"			,PIN_OUT},		//			(1Byte)
		{D_INT		,"ErrSts"		,PIN_OUT},		//			(2Byte)
		{D_LREAL	,"EngVal"		,PIN_OUT},		//			(8Byte)
		{0}
	}
};
//-----------------------------------
//入力値の上下限判定
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Mn_LmtChk = {
	"MN_LmtChk",
	MN_LmtChk,
	{
		{D_BOOL		,"RUN"			,PIN_IN},		//			(1Byte)
		{D_LINT		,"Val"			,PIN_IN},		//			(8Byte)
		{D_LINT		,"Max"			,PIN_IN},		//			(8Byte)
		{D_LINT		,"Min"			,PIN_IN},		//			(8Byte)
		{D_BOOL		,"NG"			,PIN_OUT},		//			(1Byte)
		{D_BOOL		,"Hi"			,PIN_OUT},		//			(1Byte)
		{D_BOOL		,"Low"			,PIN_OUT},		//			(1Byte)
		{D_LINT		,"ChkVal"		,PIN_OUT},		//			(8Byte)
		{0}
	}
};
//-----------------------------------
//PID制御用バッファクリア
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Mn_ClearPidBuf = {
	"MN_ClearPIDBuf",
	MN_ClearPIDBuf,
	{
		{D_BOOL		,"RUN"			,PIN_IN},		//			(1Byte)
		{D_INT		,"ID"			,PIN_IN},		//			(2Byte)
		{D_BOOL		,"NG"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//AT用バッファクリア
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Mn_ClearATBuf = {
	"MN_ClearATBuf",
	MN_ClearATBuf,
	{
		{D_BOOL		,"RUN"			,PIN_IN},		//			(1Byte)
		{D_INT		,"ID"			,PIN_IN},		//			(2Byte)
		{D_BOOL		,"NG"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
/// <summary>
/// ファンクションブロックリスト
/// 外部参照宣言"__dllexport"を取り付けてください
/// </summary>
PLCPFB_API struct FUNCTIONBLOCKDEFINE		*FunctionBlocks[] =
{

	&Ton,
	&Tof,
	&Tp,
	&Ton_30s,
	&Ctu,
	&Ctd,
	&Ctud,
	&Ctu_5000,
	&filewrite,
	&fileread,
	&Sr,
	&Rs,
	&F_Trig,
	&R_Trig,
	&Mn_Pid,
	&Mn_At_LmtCyc,
	&Mn_Pi_D,
	&Mn_I_Pd,
	&Mn_Gain,
	&Mn_Bias,
	&Mn_Filter,
	&Mn_EngCnv,
	&Mn_LmtChk,
	&Mn_ClearPidBuf,
	&Mn_ClearATBuf
};

/// <summary>
/// エントリーの個数
/// 外部参照宣言"__dllexport"を取り付けてください
/// </summary>
PLCPFB_API WORD NumFunctionBlocks = sizeof(FunctionBlocks) / sizeof(struct FUNCTIONBLOCKDEFINE*);


// このモジュールの構造体定義は1バイトアラインが必要です
#pragma pack(pop)
