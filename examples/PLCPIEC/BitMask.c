#include <stdio.h>
#include "common.h"
#include "PLCPIEC.h"

///
/// FU・FBのパラメータのビット指定対応
/// any    : ビット指定対象パラメータ
/// result : ビット指定処理結果
void MaskBitfield(void* any)
{
	P_ANY a = (P_ANY)any;	// パラメータを作業用ポインタにセット

	if (!a->bitfield.use)	// ビット指定フラグがOFF
		return;				// 何もしない

	switch (a->Type)	// パラメータのタイプごとに処理を変更
	{
	case D_BYTE:	// BYTE型
		*(BYTE*)any = (*a->pByte >> a->bitfield.offset) & 0x01;		// マスク結果をBYTE型で扱う
		((P_ANY)any)->Type = D_BOOL;	// データ型をBOOL型にする	
		break;
	case D_WORD:	// WORD型
		*(WORD*)any = (*a->pWord >> a->bitfield.offset) & 0x01;		// マスク結果をWORD型で扱う
		((P_ANY)any)->Type = D_BOOL;	// データ型をBOOL型にする
		break;
	case D_DWORD:	// DWORD型
		*(DWORD*)any = (*a->pDword >> a->bitfield.offset) & 0x01;	// マスク結果をDWORD型で扱う
		((P_ANY)any)->Type = D_BOOL;	// データ型をBOOL型にする
		break;
	default:		// その他(ビット指定はANY_BIT型のみのためここには来ないはず)
		any = a;	// ビット指定は行わず、パラメータをそのまま返す
	}
}