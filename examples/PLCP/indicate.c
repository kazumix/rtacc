/// <summary>
/// RT-edge エッジシステムコンテナ
/// 
///		インジケータタグ機能 indicate.c
/// 
///	Base programming K.Machii
/// 
/// </summary>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "egapi.h"

#include "common.h"


/// <summary>
/// エッジタグの定義
/// </summary>
struct CONTAINER_TAGS		indicate[] =
{
	{"Status"					,EgVtByte		,0	,TRUE},
	{"Error"					,EgVtBoolean	,0	,TRUE},
	{"Run"						,EgVtBoolean	,1	,TRUE},
	{"Live"						,EgVtUInt32		,0	,TRUE},
	{"STATE_ON"					,EgVtBoolean	,0	,TRUE},
	{"STATE_LOADING"			,EgVtBoolean	,0	,TRUE},
	{"STATE_STOP"				,EgVtBoolean	,0	,TRUE},
	{"STATE_RUN"				,EgVtBoolean	,0	,TRUE},
	{"STATE_STEP"				,EgVtBoolean	,0	,TRUE},
	{"STATE_HALT"				,EgVtBoolean	,0	,TRUE},
	{"TASK_Period_us"			,EgVtUInt32		,0	,TRUE},
	{"TASK_Watchdog_us"			,EgVtUInt32		,0	,TRUE},
	{"TASK_Stack"				,EgVtUInt32		,0	,TRUE},
	{"TASK_Prio"				,EgVtUInt32		,0	,TRUE},
	{"TASK_MinDuration_ns"		,EgVtUInt32		,0	,TRUE},
	{"TASK_MaxDuration_ns"		,EgVtUInt32		,0	,TRUE},
	{"TASK_CurDuration_ns"		,EgVtUInt32		,0	,TRUE},
	{"TASK_MinDelay_ns"			,EgVtUInt32		,0	,TRUE},
	{"TASK_MaxDelay_ns"			,EgVtUInt32		,0	,TRUE},
	{"TASK_CurDelay_ns"			,EgVtUInt32		,0	,TRUE},
	{"DEBUG_FORCE"				,EgVtBoolean	,0	,TRUE},
	{"DEBUG_BPSET"				,EgVtBoolean	,0	,TRUE},
	{"DEBUG_EXCEPTIONCODE"		,EgVtUInt32		,0	,TRUE},
	{"SYSTICK_CNT"				,EgVtUInt32		,0	,TRUE},
	{"ERRORS"					,EgVtUInt32		,0	,TRUE},
	{0}
};

typedef enum CONTAINER_TAGINDEX
{
	Status,
	Error,
	Run,
	Live,
	MODE_ON,
	MODE_LOADING,
	MODE_STOP,
	MODE_RUN,
	MODE_STEP,
	MODE_HALT,
	TASK_Period_us,
	TASK_Watchdog_us,
	TASK_Stack,
	TASK_Prio,
	TASK_MinDuration_ns,
	TASK_MaxDuration_ns,
	TASK_CurDuration_ns,
	TASK_MinDelay_ns,
	TASK_MaxDelay_ns,
	TASK_CurDelay_ns,
	DEBUG_FORCE,
	DEBUG_BPSET,
	DEBUG_EXCEPTICODE,
	SYSTICK_CNT,
	ERRORS,
}dic;



void Indicate_Status(BYTE statuscode)
{
	int32_t		result;
	LPEDGE_INDEX	Tag = indicate[Status].index;
	result = EgTagWriteByIndex(Tag, &statuscode, sizeof(statuscode));
}

void Indicate_Error(BOOL error)
{
	int32_t		result;
	LPEDGE_INDEX	Tag = indicate[Error].index;
	result = EgTagWriteByIndex(Tag, &error, sizeof(errno));
}

void Indicate_Run(BOOL running)
{
	int32_t		result;
	LPEDGE_INDEX	Tag = indicate[Run].index;
	result = EgTagWriteByIndex(Tag, &running, sizeof(running));
}

BOOL Indicate_Run_Get(void)
{
	int32_t		result;
	BOOL		running = FALSE;
	LPEDGE_INDEX	Tag = indicate[Run].index;
	result = EgTagReadByIndex(Tag, &running, sizeof(running));
	return running;
}

void Indicate_Live(void)
{
	// インクリメントします
	static uint32_t	live;
	int32_t		result;
	live++;
	LPEDGE_INDEX	Tag = indicate[Live].index;
	result = EgTagWriteByIndex(Tag, &live, sizeof(live));
}

void Indicate_STATE_ON(BOOL on)
{
	union ANYVAL*		Tag = indicate[MODE_ON].pvalue;
	Tag->boolVal = on;
}

void Indicate_STATE_LOADING(BOOL loading)
{
	union ANYVAL*		Tag = indicate[MODE_LOADING].pvalue;
	Tag->boolVal = loading;
}

void Indicate_STATE_STOP(BOOL stop)
{
	union ANYVAL*		Tag = indicate[MODE_STOP].pvalue;
	Tag->boolVal = stop;
}

void Indicate_STATE_RUN(BOOL run)
{
	union ANYVAL*		Tag = indicate[MODE_RUN].pvalue;
	Tag->boolVal = run;
}

void Indicate_STATE_STEP(BOOL step)
{
	union ANYVAL*		Tag = indicate[MODE_STEP].pvalue;
	Tag->boolVal = step;
}

void Indicate_STATE_HALT(BOOL halt)
{
	union ANYVAL*		Tag = indicate[MODE_HALT].pvalue;
	Tag->boolVal = halt;
}

void Indicate_TASK_Period_us(uint32_t priod)
{
	union ANYVAL*		Tag = indicate[TASK_Period_us].pvalue;
	Tag->intVal = priod;
}

void Indicate_TASK_Watchdog_us(uint32_t watchdog)
{
	union ANYVAL*		Tag = indicate[TASK_Watchdog_us].pvalue;
	Tag->intVal = watchdog;
}

void Indicate_TASK_Stack(uint32_t stack)
{
	union ANYVAL*		Tag = indicate[TASK_Stack].pvalue;
	Tag->intVal = stack;
}

void Indicate_TASK_Prio(uint32_t prio)
{
	union ANYVAL*		Tag = indicate[TASK_Prio].pvalue;
	Tag->intVal = prio;
}

void Indicate_TASK_MinDuration_ns(uint32_t minduration)
{
	union ANYVAL*		Tag = indicate[TASK_MinDuration_ns].pvalue;
	Tag->intVal = minduration;
}

void Indicate_TASK_MaxDuration_ns(uint32_t maxduration)
{
	union ANYVAL*		Tag = indicate[TASK_MaxDuration_ns].pvalue;
	Tag->intVal = maxduration;
}

void Indicate_TASK_CurDuration_ns(uint32_t curduration)
{
	union ANYVAL*		Tag = indicate[TASK_CurDuration_ns].pvalue;
	Tag->intVal = curduration;
}

void Indicate_TASK_MinDelay_ns(uint32_t mindelay)
{
	union ANYVAL*		Tag = indicate[TASK_MinDelay_ns].pvalue;
	Tag->intVal = mindelay;
}

void Indicate_TASK_MaxDelay_ns(uint32_t maxdelay)
{
	union ANYVAL*		Tag = indicate[TASK_MaxDelay_ns].pvalue;
	Tag->intVal = maxdelay;
}

void Indicate_TASK_CurDelay_ns(uint32_t curdelay)
{
	union ANYVAL*		Tag = indicate[TASK_CurDelay_ns].pvalue;
	Tag->intVal = curdelay;
}

void Indicate_DEBUG_FORCE(BOOL debug)
{
	union ANYVAL*		Tag = indicate[DEBUG_FORCE].pvalue;
	Tag->boolVal = debug;
}

void Indicate_DEBUG_BPSET(BOOL bpset)
{
	union ANYVAL*		Tag = indicate[DEBUG_BPSET].pvalue;
	Tag->boolVal = bpset;
}

void Indicate_DEBUG_EXCEPTICODE(uint32_t exceptcode)
{
	union ANYVAL*		Tag = indicate[DEBUG_EXCEPTICODE].pvalue;
	Tag->intVal = exceptcode;
}

void Indicate_SYSTICK_CNT(uint32_t systickcnt)
{
	union ANYVAL*		Tag = indicate[SYSTICK_CNT].pvalue;
	Tag->intVal = systickcnt;
}

void Indicate_ERRORS(uint32_t errors)
{
	union ANYVAL*		Tag = indicate[ERRORS].pvalue;
	Tag->intVal = errors;
}

/// <summary>
/// インジケータ機能を初期化します
/// </summary>
/// <returns></returns>
BOOL Indicate_Init(void)
{
	// タグリストを与えてエッジタグを生成します
	BOOL result;
	result = Container_CreateTagsFromList(indicate);
	return result;
}
