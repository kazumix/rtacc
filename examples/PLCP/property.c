/// <summary>
/// RT-edge エッジシステムコンテナ
/// 
///		プロパティタグ機能 property.c
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


extern void Property_Process_Nop(struct PROPERTY_TAGS* my);
extern void Property_Process_Priority(struct PROPERTY_TAGS* my);
extern void Property_Process_Intprt(struct PROPERTY_TAGS* my);
extern void Property_Process_Pou(struct PROPERTY_TAGS* my);
extern void Property_Process_PouBegin(struct PROPERTY_TAGS* my);
extern void Property_Process_PouFinal(struct PROPERTY_TAGS* my);
extern void Property_Process_NoPrint(struct PROPERTY_TAGS* my);
extern void Property_Process_Remote(struct PROPERTY_TAGS* my);
extern void Property_Process_Step(struct PROPERTY_TAGS* my);
extern void Property_Process_Scanrate(struct PROPERTY_TAGS* my);
extern void Property_Process_Retain(struct PROPERTY_TAGS* my);


/// <summary>
/// エッジタグの定義
/// </summary>
struct PROPERTY_TAGS		property[] =
{
	{"Priority"		,EgVtUInt32		,DEFAULT_PRIORITY					,FALSE	,Property_Process_Priority},	// エッジコンテナ標準
	{"Interval"		,EgVtUInt32		,DEFAULT_INTERVAL					,FALSE	,Property_Process_Nop},			// エッジコンテナ標準
	{"PouMain"		,EgVtString		,(DWORD)""							,FALSE	,Property_Process_Intprt},		// 
	{"Pou"			,EgVtString		,(DWORD)""							,FALSE	,Property_Process_Pou},			// 
	{"PouBegin"		,EgVtString		,(DWORD)""							,FALSE	,Property_Process_PouBegin},	// 
	{"PouFinal"		,EgVtString		,(DWORD)""							,FALSE	,Property_Process_PouFinal},	// 
	{"NoPrint"		,EgVtBoolean	,FALSE								,FALSE	,Property_Process_NoPrint},		// DEFAULT_PRINTはTRUEです。NoPrint指定があるとFALSEになります
	{"Remote"		,EgVtBoolean	,DEFAULT_REMOTE						,FALSE	,Property_Process_Remote},		// 
	{"Step"			,EgVtBoolean	,DEFAULT_STEP						,FALSE	,Property_Process_Step},		// 
	{"Scanfreq"		,EgVtUInt32		,DEFAULT_SCANFREQ					,FALSE	,Property_Process_Scanrate},	// 
	{"RetainInst"	,EgVtString		,(DWORD)DEFAULT_RETAININST			,FALSE	,Property_Process_Retain},		// 対応するリテインコンテナインスタンス名
	{0}
};

void Property_Process_Nop(struct PROPERTY_TAGS* my)
{

}

void Property_Process_Priority(struct PROPERTY_TAGS* my)
{
	char*		Tag;
	int32_t		result;
	int32_t		value;
	Tag = Container_GetTagName(my->name);
	result = EgTagRead(Tag, &value, sizeof(value));
	if (result == EDGE_SUCCESS)
	{
		Config_Set_BasePriority(value);
	}
}

void Property_Process_Intprt(struct PROPERTY_TAGS* my)
{
	char*		Tag;
	int32_t		result;
	char		value[80];

	Tag = Container_GetTagName(my->name);
	result = EgTagReadString(Tag, value, sizeof(value));
	if (result == EDGE_SUCCESS)
	{
		char	path[128], base[128];
		Config_Set_RunMode(RUNMODE_INTERPRIT);

		// MNMファイル名算出の処理
		Config_Set_MnmFilePath(value);

		// ワークフォルダ算出の処理
		Argument_PathFromFolder(Config_Get_MnmFilePath(), path, sizeof(path));
		Config_Set_WorkFolder(path);

		// ベースファイル名算出の処理
		Argument_PathFromBase(Config_Get_MnmFilePath(), base, sizeof(base));
		Config_Set_BaseName(base);
	}
}

void Property_Process_Pou(struct PROPERTY_TAGS* my)
{
	char*		Tag;
	int32_t		result;
	char		value[1024];

	Tag = Container_GetTagName(my->name);
	result = EgTagReadString(Tag, value, sizeof(value));
	if (result == EDGE_SUCCESS)
	{
		Argument_PouFiles(value);
	}
}

void Property_Process_PouBegin(struct PROPERTY_TAGS* my)
{
	char*		Tag;
	int32_t		result;
	char		value[80];

	Tag = Container_GetTagName(my->name);
	result = EgTagReadString(Tag, value, sizeof(value));
	if (result == EDGE_SUCCESS)
	{
		Poufile_Set_Begin(value);
	}
}

void Property_Process_PouFinal(struct PROPERTY_TAGS* my)
{
	char*		Tag;
	int32_t		result;
	char		value[80];

	Tag = Container_GetTagName(my->name);
	result = EgTagReadString(Tag, value, sizeof(value));
	if (result == EDGE_SUCCESS)
	{
		Poufile_Set_Final(value);
	}
}

void Property_Process_NoPrint(struct PROPERTY_TAGS* my)
{
	char*		Tag;
	int32_t		result;
	int32_t		value;
	Tag = Container_GetTagName(my->name);
	result = EgTagRead(Tag, &value, sizeof(value));
	if (result == EDGE_SUCCESS)
	{
		if( value == TRUE)
			Config_Set_PrintMode(FALSE);
	}
}

void Property_Process_Remote(struct PROPERTY_TAGS* my)
{
	char*		Tag;
	int32_t		result;
	int32_t		value;
	Tag = Container_GetTagName(my->name);
	result = EgTagRead(Tag, &value, sizeof(value));
	if (result == EDGE_SUCCESS)
	{
		Config_Set_RemoteMode(value);
	}
}

void Property_Process_Step(struct PROPERTY_TAGS* my)
{
	char*		Tag;
	int32_t		result;
	int32_t		value;
	Tag = Container_GetTagName(my->name);
	result = EgTagRead(Tag, &value, sizeof(value));
	if (result == EDGE_SUCCESS)
	{
		Config_Set_StepMode(value);
	}
}

void Property_Process_Scanrate(struct PROPERTY_TAGS* my)
{
	char*		Tag;
	int32_t		result;
	uint32_t	value32;
	Tag = Container_GetTagName(my->name);
	result = EgTagRead(Tag, &value32, sizeof(value32));
	if (result == EDGE_SUCCESS)
	{
		Config_Set_ScanFreq(value32);
	}
}

void Property_Process_Retain(struct PROPERTY_TAGS* my)
{
	char* Tag;
	int32_t		result;
	char		value[80];

	Tag = Container_GetTagName(my->name);
	result = EgTagReadString(Tag, value, sizeof(value));
	if (result == EDGE_SUCCESS)
	{
		// リテイン要求トリガタグ名設定
		Retain_Set_Tagname(value);
	}
}


/// <summary>
/// プロパティタグの設定を読み取って、処理関数を使って設定を取り込みます
/// </summary>
void Property_Process(void)
{
	struct PROPERTY_TAGS*		current = &property[0];

	// テーブルの終端迄処理します
	while (current->name)
	{
		// それぞれの処理関数をコールします
		current->function(current);
		// 次のエントリーに進みます
		current++;
	}
}

uint32_t Property_Get_Priority(void)
{
	int32_t		result;
	uint32_t	value = DEFAULT_PRIORITY;
	char*	Tag = Container_GetTagName("Priority");
	result = EgTagRead(Tag, &value, sizeof(value));
	return value;
}

/// <summary>
/// エッジコンテナ標準 Interval タグの取得
/// </summary>
/// <returns></returns>
uint32_t Property_Get_Interval(void)
{
	int32_t		result;
	uint32_t	value = DEFAULT_INTERVAL;
	char*	Tag = Container_GetTagName("Interval");
	result = EgTagRead(Tag, &value, sizeof(value));
	return value;
}

/// <summary>
/// エッジコンテナ標準 AutoRun タグの取得
/// </summary>
/// <returns></returns>
BOOL Property_Get_Autorun(void)
{
	int32_t		result;
	BOOL		value = DEFAULT_AUTORUN;
	char*	Tag = Container_GetTagName("AutoRun");
	result = EgTagRead(Tag, &value, sizeof(value));
	return value;
}

/// <summary>
/// プロパティ機能を初期化します
/// </summary>
/// <returns></returns>
BOOL Property_Init(void)
{
	// プロパティタグを読み込んですべて設定を処理します
	Property_Process();
	return TRUE;

	// タグリストを与えてエッジタグを生成します
	//BOOL result;
	//result = Container_CreateTagsFromList(property);
	//return result;
}