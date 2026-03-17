#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"
#include "egapi.h"


/// <summary>
/// IECデータ型とエッジタグデータ型のマッチングテーブル
///		Sourceに指定できる強制データ型キーワードも含む
/// </summary>
struct TYPEMATCH typematch[] =
{
	{"BOOL#"		,D_BOOL			,EgVtBoolean	,sizeof(T_BOOL)			},
	{"SINT#"		,D_SINT			,EgVtSByte		,sizeof(T_SINT)			},		// エッジに実在しないデータ型
	{"INT#"			,D_INT			,EgVtInt16		,sizeof(T_INT)			},
	{"DINT#"		,D_DINT			,EgVtInt32		,sizeof(T_DINT)			},
	{"LINT#"		,D_LINT			,EgVtInt64		,sizeof(T_LINT)			},
	{"USINT#"		,D_USINT		,EgVtByte		,sizeof(T_USINT)		},		// エッジに実在しないデータ型
	{"UINT#"		,D_UINT			,EgVtUInt16		,sizeof(T_UINT)			},
	{"UDINT#"		,D_UDINT		,EgVtUInt32		,sizeof(T_UDINT)		},
	{"ULINT#"		,D_ULINT		,EgVtUInt64		,sizeof(T_ULINT)		},
	{"TIME#"		,D_TIME			,EgVtUInt32		,sizeof(T_TIME)			},		// エッジに実在しないデータ型
	{"REAL#"		,D_REAL			,EgVtFloat		,sizeof(T_REAL)			},
	{"LREAL#"		,D_LREAL		,EgVtDouble		,sizeof(T_LREAL)		},
	{"BYTE#"		,D_BYTE			,EgVtByte		,sizeof(T_BYTE)			},
	{"WORD#"		,D_WORD			,EgVtUInt16		,sizeof(T_WORD)			},		// エッジに実在しないデータ型
	{"DWORD#"		,D_DWORD		,EgVtUInt32		,sizeof(T_DWORD)		},		// エッジに実在しないデータ型
	{"QWORD#"		,D_QWORD		,EgVtUInt64		,sizeof(T_QWORD)		},		// エッジに実在しないデータ型
	{"FUNCTION#"	,D_FUNCTION		,EgVtSegment	,-1						},		// エッジに実在しないデータ型 ,サイズはval->link->sizeを読むこと
	{"STRING#"		,D_STRING		,EgVtSegment	,83						},		// エッジに実在しないデータ型 ,サイズはval->link->sizeを読むこと
	{"ARRAY#"		,D_ARRAY		,EgVtSegment	,-1						},		// エッジに実在しないデータ型 ,サイズはval->link->sizeを読むこと
	{"STRUCT#"		,D_STRUCT		,EgVtSegment	,-1						},		// エッジに実在しないデータ型 ,サイズはval->link->sizeを読むこと
	{"ANY#"			,D_ANY			,EgVtUInt32		,sizeof(T_DWORD)		},		// P_ANYを持てるサイズ(32bit)
	{0}
};

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


/// <summary>
/// PLCデータ型番号から型名の文字列を得ます
/// </summary>
/// <param name="type"></param>
/// <returns></returns>
char* Type_GetName(T_TYPE type)
{
	struct TYPEMATCH *current = typematch;
	while (current->keyword)
	{
		// テーブルから一致するPLCデータ型をサーチ
		if (type == current->iectype)
		{
			// 一致したのでIECデータ型を返す
			return current->keyword;
		}
		// 次のキーワードエントリへ進める
		current++;
	}
	// 一致しなかったので無効な値を返す
	return D_EMPTY;
}