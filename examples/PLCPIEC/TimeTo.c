#include "common.h"
#include "PLCPIEC.h"

// ------------------------------------ 
//　その他 型変換
//-------------------------------------

/// <summary>
/// （型変換）TIME型の値をDINT型に変換します。
/// 例　(TIME)0x00000000          0 → (DINT)0x00000000           0
///   　(TIME)0x7FFFFFFF 2147483647 → (DINT)0x7FFFFFFF  2147483647
///     (TIME)0x80000000 2147483648 → (DINT)0x80000000 -2147483648
///     (TIME)0xFFFFFFFF 4294967925 → (DINT)0xFFFFFFFF          -1
/// </summary>
/// <param name="a1">戻り値(DINT型)</param>
/// <param name="a2">変換対象(TIME型)</param>
PLCPIEC_API P_ANY TIME_TO_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = D_TIME;

	*a1->pDint = (T_DINT)*a1->pTime;	// DINT型にキャスト

	return a1;
}