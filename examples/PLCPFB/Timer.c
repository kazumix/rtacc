#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "common.h"
#include "PLCPFB.h"


#pragma pack(push,1)

//egapi.h無くし必要な宣言だけ分離
#define EDGE_SUCCESS							0x00000000	// 正常終了
__declspec(dllimport) int32_t EgTagGetProperty(const char *Name, const char *propName, void* Value, int32_t dwSize);	// EgTagのProperty(Size, Type, Source等読み込み)



//タイマー関連に使用するタグポインター変数の初期値用(取得出来なかった場合利用)
uint32_t DmmyTASK_Period = 500000;	//ダミータスク周期(デフォルト500ms)
uint32_t DmmySYSTICK_CNT = 0;		//ダミータスク周期

//タイマー関連に使用するタグポインター変数
uint32_t *pTASK_Period_us = &DmmyTASK_Period;	//タスク周期タグポインター(単位μs)
uint32_t *pSYSTICK_CNT = &DmmySYSTICK_CNT;		//タスク実行回数タグポインター


/// <summary>
/// エッジタグのデータポインタ(TagsDesc *Entry)を入手
/// </summary>
/// <param name="name"></param>
/// <returns></returns>
RTEDGEVARIANT* Rtedge_TagGetPointer(char* name)
{
	int32_t		result;
	RTEDGEVARIANT	*tagdescriptor = 0;
	// タグのデータポインタを返します
	result = EgTagGetProperty(name, "Entry", &tagdescriptor, sizeof(tagdescriptor));

	if (result == EDGE_SUCCESS)
		return tagdescriptor;
	else
		return NULL;
}


/// <summary>
/// 名前でエッジタグの存在を確認
/// </summary>
/// <param name="name"></param>
/// <param name="type"></param>
/// <returns></returns>
BOOL Rtedge_TagIsExist(char* name)
{
	// 空白は無視
	if (name == 0)
	{
		return FALSE;
	}
	// タグの存在確認（エッジデータ型が取得できるなら存在と判断）
	int32_t		result;
	uint16_t	tagtype;
	result = EgTagGetProperty(name, "Type", &tagtype, sizeof(tagtype));
	return (result == EDGE_SUCCESS);
}

///// <summary>
///// エッジタグのデータポインタ(TagsDesc *Entry)を入手
///// </summary>
///// <param name="name"></param>
///// <returns></returns>
//RTEDGEVARIANT* Rtedge_TagGetPointer(char* name)
//{
//	int32_t		result;
//	RTEDGEVARIANT	*tagdescriptor = 0;
//	// タグのデータポインタを返します
//	result = EgTagGetProperty(name, "Entry", &tagdescriptor, sizeof(tagdescriptor));
//
//	if (result == EDGE_SUCCESS)
//		return tagdescriptor;
//	else
//		return NULL;
//}
//---------------------------------------------
// 見直しが必要　↑
//---------------------------------------------

/// <summary>
/// タグポインタを取得（"TASK_Period_us","SYSTICK_CNT"用）
/// </summary>
/// <param name="name"></param>
/// <returns></returns>

T_UINT* GetTAG_Pointer(char* name)
{
	BOOL			success;
	RTEDGEVARIANT	*etag;

	success = Rtedge_TagIsExist(name);		//名前でエッジタグの存在を確認
	if (success)
	{
		etag = Rtedge_TagGetPointer(name);	//エッジタグのデータポインタ(TagsDesc *Entry)を入手
		return (T_UINT*)&etag->val;			//タグ内の値のポインター返却
	}
	return NULL;
}

/// <summary>
/// 時間算出に必要なタグのポインターを取得します（初期処理）
/// </summary>
void Time_GetTAG_Pointer(void)
{
	uint32_t *pReturn;

	//タスク実行回数タグポインター取得済みか？
	if (pTASK_Period_us == &DmmyTASK_Period)
	{
		pReturn = (uint32_t *)GetTAG_Pointer("SERVICE.PLC.TASK_Period_us");	//タスク周期タグポインター取得
		
		//正常に取得出来たか？
		if (pReturn != NULL)
		{
			pTASK_Period_us = pReturn;	//取得ポインターを設定
		}
	}
	
	//タスク実行回数タグポインター取得済みか？
	if (pSYSTICK_CNT == &DmmySYSTICK_CNT)
	{
		pReturn = (uint32_t *)GetTAG_Pointer("SERVICE.PLC.SYSTICK_CNT");	//タスク実行回数タグポインター取得

		//正常に取得出来たか？
		if (pReturn != NULL)
		{
			pSYSTICK_CNT = pReturn;	//取得ポインターを設定
		}
	}
}

/*
/// <summary>
/// カーネル周期を算出します（初期処理）
/// </summary>
void Timer_CalcCpuSpeed(void)
{
	SYSINFO         sysinfo;

	// 低レベルティック値（マイクロ秒単位）を取得します
	CopyRtSystemInfo(&sysinfo);
	dwKtickInUsecs = 10000 / sysinfo.KernelTickRatio;
	dwKtickInMsecs = 1000 / dwKtickInUsecs;
}
*/

/// <summary>
/// タイマー満了カウント算出
/// </summary>
T_QWORD getEndCount(T_TIME PT)
{
	if ((pSYSTICK_CNT == NULL) || (pTASK_Period_us == NULL))
	{
		return 0;
	}

	//μs単位でカウント値を扱う
	//(PT*1000)　←　プリセット時間をmsからusへ
	// - *pTASK_Period_us　←　タスク周期で割る(単位μs)結果、プリセット時間満了まで何回回るか算出
	//　*pSYSTICK_CNT +　←　偏在の実行回数にプリセット時間回数を加算し満了のカウンタ回数を算出
	return *pSYSTICK_CNT + ((PT*1000) / *pTASK_Period_us);
}
///// <summary>
///// 経過時間取得
///// </summary>
//T_TIME GetElapsed_Time(T_TIME PT, T_QWORD _STTIME_)
//{
//	T_TIME Elapsed_Time;
//
//	//目標カウンター値よりも現座のカウンターが大きい
//	if (*pSYSTICK_CNT > (T_TIME)_STTIME_)
//	{
//		Elapsed_Time = ((0xFFFF - *pSYSTICK_CNT) + (T_TIME)_STTIME_)*(*pTASK_Period_us / 1000);
//	}
//	//目標カウンター値よりも現座のカウンターが小きい
//	else
//	{
//		Elapsed_Time = PT - (((T_TIME)_STTIME_ - *pSYSTICK_CNT)*(*pTASK_Period_us / 1000));
//	}
//
//	return Elapsed_Time;
//}

//-----------------------------------
//オンディレイタイマ
//-----------------------------------
PLCPFB_API void TON(PVOID instance)
{
	struct TON_PIN {
		T_BOOL		IN;			//オンディレイ タイミング信号
		T_TIME		PT;			//遅延用プリセット時間
		T_BOOL		Q;			//遅延時間満了
		T_TIME		ET;			//経過時間
		T_BOOL		_IN_;		//内部保持 前回値
		T_QWORD		_STTIME_;	//内部保持 満了時のシステムカウンタ

	} *pin = (struct TON_PIN*)instance;

	//T_QWORD NOW_TIME;		//現在時刻

	//無効状態
	if (pin->IN == FALSE)
	{
		Time_GetTAG_Pointer();	//タグポインターの取得

		pin->Q = FALSE;		//ディレイ結果：無効
		pin->ET = 0;		//経過時間：無し
		pin->_STTIME_ = 0;	//満了時のシステムカウンタクリア
	}
	else
	{
		//現在時刻の取得
		//knGetKernelTime((LPKNTIME)&NOW_TIME);

		//立上り検出
		if (!pin->_IN_)
		{
			pin->Q = FALSE;							//ディレイ結果：初期化
			pin->ET = 0;							//経過時間：初期化
			pin->_STTIME_ = getEndCount(pin->PT);	//満了時のシステムカウンタを保持
		}
		else
		{
			//ディレイ結果は満了では無いか？
			if (!pin->Q)
			{
				//pin->ET = (T_TIME)((NOW_TIME - pin->_STTIME_) / dwKtickInMsecs);	//経過時間算出

				//経過時間 = プリセット時間-((満了時のカウント-現在カウント)*時間に変換)
				pin->ET = pin->PT - (T_TIME)(((pin->_STTIME_ - *pSYSTICK_CNT) * *pTASK_Period_us) / 1000);

				//経過時間がプリセットを超えているか？
				if (pin->ET > pin->PT)
				{
					pin->ET = pin->PT;	//ETをプリセット値止まりにする
					pin->Q = TRUE;	//ディレイ結果：満了
				}
				
				//現在のカウントの方が満了予定カウント以上か？
				if (*pSYSTICK_CNT >= (uint32_t)pin->_STTIME_)	// 条件一致のチェック
				{
					pin->Q = TRUE;	//ディレイ結果：満了
				}

			}
		}
	}
	pin->_IN_ = pin->IN;	//今回の信号を保持
}

//-----------------------------------
//オフディレイタイマ
//-----------------------------------
PLCPFB_API void TOF(PVOID instance)
{
	struct TOF_PIN {
		T_BOOL		IN;
		T_TIME		PT;
		T_BOOL		Q;
		T_TIME		ET;
		T_BOOL		_IN_;		//内部保持
		T_QWORD		_STTIME_;	//内部保持　満了時のシステムカウンタ
	} *pin = (struct TOF_PIN*)instance;

	//T_QWORD NOW_TIME;		//現在時刻


	//現在時刻の取得
	//knGetKernelTime((LPKNTIME)&NOW_TIME);

	// 立上り検出
	if (!pin->_IN_ && pin->IN) {
		pin->Q = FALSE;
		pin->ET = 0;
		Time_GetTAG_Pointer();	//タグポインターの取得

	}
	// 立下り検出
	else if (pin->_IN_ && !pin->IN) {
		//pin->_STTIME_ = NOW_TIME; // 現時間を保持
		pin->_STTIME_ = getEndCount(pin->PT);	//完了時間を算出
	}
	// カウントダウン中
	else if (!pin->IN && pin->Q) {

		// 経過時間算出
		//pin->ET = (T_TIME)((NOW_TIME - pin->_STTIME_) / dwKtickInMsecs);

		//経過時間 = プリセット時間-((満了時のカウント-現在カウント)*時間に変換)
		pin->ET = pin->PT - (T_TIME)(((pin->_STTIME_ - *pSYSTICK_CNT) * *pTASK_Period_us) / 1000);

		//経過時間がプリセットを超えているか？
		if (pin->ET > pin->PT)
		{
			pin->ET = pin->PT;	//ETをプリセット値止まりにする
			pin->Q = TRUE;		//ディレイ結果：満了
		}

		// 条件一致したか？
		if (*pSYSTICK_CNT >= (uint32_t)pin->_STTIME_) {
			pin->Q = FALSE;
		}
	}

	// 信号が立ち上がらなければ常にTRUEにする
	if (pin->IN || (pin->ET < pin->PT)) {
		pin->Q = TRUE;
	}

	// 今回の信号を保持
	pin->_IN_ = pin->IN;

}

//-----------------------------------
//パルス
//-----------------------------------
PLCPFB_API void TP(PVOID instance)
{
	struct TP_PIN {
		T_BOOL		IN;
		T_TIME		PT;
		T_BOOL		Q;
		T_TIME		ET;
		T_BOOL		_IN_;		//内部保持
		T_QWORD		_STTIME_;	//内部保持
	} *pin = (struct TP_PIN*)instance;
	//T_QWORD NOW_TIME;		//現在時刻


	//現在時刻の取得
	//knGetKernelTime((LPKNTIME)&NOW_TIME);

	//立上り検出
	if ((pin->_IN_ == FALSE) && (pin->IN == TRUE))
	{
		pin->Q = TRUE;
		if (pin->ET == 0)
		{
			//pin->_STTIME_ = NOW_TIME;	//現時間を保持
			pin->_STTIME_ = getEndCount(pin->PT);	//完了時間を算出
		}
	}

	//経過時間算出
	if (pin->Q == TRUE)
	{
		//pin->ET = (T_TIME)((NOW_TIME - pin->_STTIME_) / dwKtickInMsecs);
		pin->ET = pin->PT - (T_TIME)(((pin->_STTIME_ - *pSYSTICK_CNT) * *pTASK_Period_us) / 1000);
	}

	//条件一致したか？
	//if (pin->ET >= pin->PT)
	if (*pSYSTICK_CNT >= (uint32_t)pin->_STTIME_)
	{
		pin->Q = FALSE;
		pin->ET = 0;
	}

	//今回の信号を保持
	pin->_IN_ = pin->IN;


}

//-----------------------------------
//オンディレイタイマ 30秒固定
//-----------------------------------
PLCPFB_API void TON_30S(PVOID instance)
{
	struct TON_PIN {
		T_BOOL		IN;			//オンディレイ タイミング信号
		T_BOOL		Q;			//遅延時間満了
		T_BOOL		_IN_;		//内部保持 前回値
		T_QWORD		_STTIME_;	//内部保持 タイマ満了時ティックカウンタ値	(8Byte)

	} *pin = (struct TON_PIN*)instance;

	//無効状態
	if (pin->IN == FALSE)
	{
		Time_GetTAG_Pointer();	//タグポインターの取得
		pin->Q = FALSE;		//ディレイ結果：無効
		pin->_STTIME_ = 0;	//スタート時間クリア
	}
	//有効状態
	else
	{
		// タイマ満了してない場合
		if (!pin->Q)
		{
			//立上り検出
			if (!pin->_IN_)
			{
				//pin->Q = FALSE;						//ディレイ結果：初期化
				pin->_STTIME_ = getEndCount(30000);	    //満了時のティックカウンタ値を算出 (30秒後のカウンタ値)
			}
			// 立上り済み
			else
			{
				//固定カウンタの場合は経過時間を出力しないので経過時間ETの算出は削除

				if (*pSYSTICK_CNT >= (uint32_t)pin->_STTIME_)	// 条件一致のチェック 現在のティックカウントが満了時の値を超えたか
				{
					pin->Q = TRUE;	//ディレイ結果：満了
				}
			}
		}
	}
	pin->_IN_ = pin->IN;	//今回の信号を保持
}

#pragma pack(pop)
