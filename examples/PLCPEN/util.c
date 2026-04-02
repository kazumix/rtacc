#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "common.h"
#include "PLCPEN.h"
#include <emmintrin.h>

//-----------------------------------------
// CPUクロックカウンタの取得（SpeedStep機能のあるCPUでは利用できません）
//-----------------------------------------
_inline QWORD WatchDog_GetPentiumCounter(void)
{
	_asm    rdtsc
}

//-----------------------------------------
// CPU速度の計測( Hz )
//-----------------------------------------
DWORD fbWatchDog_GetCPUSpeed(void)
{
	SYSINFO         sSysInfo;
	DWORD           PentiumTicksPerUsec;
	DWORD           dwResult;

	CopyRtSystemInfo(&sSysInfo);
	PentiumTicksPerUsec = sSysInfo.PentiumTicksPerUsec;
	dwResult = PentiumTicksPerUsec * 1000000;
	return dwResult;
}

//-----------------------------------------
// 処理時間の算出( nano second )
//-----------------------------------------
double CalcTime(QWORD start, QWORD end)
{
	double  dblCPUspeed;
	dblCPUspeed = (double)1000000000 / (double)fbWatchDog_GetCPUSpeed();
	return ((double)(end - start) * dblCPUspeed);
}

/// <summary>
/// RSL main
/// </summary>
/// <param name="hModule"></param>
/// <param name="ul_reason_for_call"></param>
/// <param name="lpReserved"></param>
/// <returns></returns>
BOOLEAN __stdcall RslMain(RTHANDLE hModule,
	DWORD  ul_reason_for_call,
	LPVOID lpReserved
)
{
	switch (ul_reason_for_call) {
	case RSL_PROCESS_ATTACH:
		break;
	case RSL_THREAD_ATTACH:
	case RSL_THREAD_DETACH:
	case RSL_PROCESS_DETACH:
		break;
	}

	return TRUE;
}

/// <summary>
/// PLC変数の値をコピーします
/// </summary>
/// <param name="dst"></param>
/// <param name="src"></param>
void Variable_Copy64(union ANYVAL *dst, union ANYVAL *src)
{
	__m128i xmm_reg;
	// メモリからXMMレジスタにロード
	_mm_store_si128(&xmm_reg, _mm_loadl_epi64((__m128i*)src));
	// XMMレジスタからメモリにストア
	_mm_storel_epi64((__m128i*)dst, xmm_reg);
}

/// <summary>
/// ANY型のデータサイズを取得します
/// </summary>
/// <param name="val"></param>
/// <returns></returns>
int Type_GetSize(P_ANY val)
{
	switch (val->Type)
	{
	case D_BOOL: return sizeof(T_BOOL); break;
	case D_SINT: return sizeof(T_SINT); break;
	case D_INT: return sizeof(T_INT); break;
	case D_DINT: return sizeof(T_DINT); break;
	case D_LINT: return sizeof(T_LINT); break;
	case D_USINT: return sizeof(T_USINT); break;
	case D_UINT: return sizeof(T_UINT); break;
	case D_UDINT: return sizeof(T_UDINT); break;
	case D_ULINT: return sizeof(T_ULINT); break;
	case D_TIME: return sizeof(T_TIME); break;
	case D_REAL: return sizeof(T_REAL); break;
	case D_LREAL: return sizeof(T_LREAL); break;
	case D_BYTE: return sizeof(T_BYTE); break;
	case D_WORD: return sizeof(T_WORD); break;
	case D_DWORD: return sizeof(T_DWORD); break;
	case D_QWORD: return sizeof(T_QWORD); break;
	case D_ANY: return sizeof(T_DWORD); break;
	case D_STRING:	return sizeof(T_STRING); break;
	case D_FUNCTION:
	case D_ARRAY:
	case D_STRUCT:
		// エッジに実在しないデータ型 ,サイズはval->link->sizeを読むこと
		// エッジタグへのリンクをたどります
		if (val->link)
			return (int)val->link->size;
		else
			return 0;					// エッジタグへのリンクがない（異常）
	}
	return 0;
}