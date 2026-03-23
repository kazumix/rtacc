
#include <stdio.h>
#include <stdlib.h>

#include <limits.h>
#include <float.h>
#include <math.h>

#include "common.h"		//共通ヘッダ
#include "PLCPIEC.h"


/// <summary>
/// 例外発生時処理
/// </summary>
/// <param name="ExceptCode">例外コード</param>
/// <param name="*Hint">例外発生場所を特定出来る文字列予報</param>
void Eexception_Post(int ExceptCode, char *Hint)
{

	//------------------
	//現段階では正式な処理無し
	//------------------
	Exception_Set(ExceptCode, Hint, 0);


}


// 非数( Not A Number )検出する関数
extern int ChckNaN_REAL(T_REAL IN1);
extern int ChckNaN_LREAL(T_LREAL IN1);

// 無限大（Infinity）検出する関数
extern int ChckInf_REAL(T_REAL IN1);
extern int ChckInf_LREAL(T_LREAL IN1);

// ------------------------------------ 
//　共通関数群
//-------------------------------------

/// <summary>
/// 現在の動作モードを取得します。
/// 戻り値 TRUE: 詳細モード	 FALSE: 非詳細モード
/// </summary>
T_BOOL IsDetailMode()
{
	// TBD: エンジン側で設定したモードを指定する変数の値を返すようにする
	return TRUE;
}


//--------------------------------------
// REAL型変数の値が有効か確認する関数
//--------------------------------------
int ChckREAL(T_REAL IN1)
{
	//非数( Not A Number )検出
	if (ChckNaN_REAL(IN1))
	{
		return 1; // 値はNaNです
	}
	//無限大（Infinity）検出
	if (ChckInf_REAL(IN1))
	{
		return 1; // 値は無限大です
	}
	return 0; // 有効な値です。
}

//--------------------------------------
// LREAL型変数の値が有効か確認する関数
//--------------------------------------
int ChckLREAL(T_LREAL IN1)
{
	//非数( Not A Number )検出
	if (ChckNaN_LREAL(IN1))
	{
		return 1; // 値はNaNです
	}
	//無限大（Infinity）検出
	if (ChckInf_LREAL(IN1))
	{
		return 1; // 値は無限大です
	}
	return 0; // 有効な値です。
}

//--------------------------------------
// 非数( Not A Number )検出する関数
//--------------------------------------
int ChckNaN_REAL(T_REAL IN1)
{
	//※T_REAL result = sqrt(-1.0); // 負の数の平方根はNaN

	if (isnan(IN1))
	{
		return 1; // 結果はNaNです
	}
	return 0; // 結果はNaNではありません
}

int ChckNaN_LREAL(T_LREAL IN1)
{
	//※T_REAL result = sqrt(-1.0); // 負の数の平方根はNaN

	if (isnan(IN1))
	{
		return 1; // 結果はNaNです
	}
	return 0; // 結果はNaNではありません
}

//--------------------------------------
// 無限大（Infinity）検出する関数
//--------------------------------------
int ChckInf_REAL(T_REAL IN1)
{

	if (isinf(IN1))
	{
		return 1; // 結果は無限大です
	}
	return 0; // 結果は無限大ではありません
}

int ChckInf_LREAL(T_LREAL IN1)
{
	if (isinf(IN1))
	{
		return 1; // 結果は無限大です
	}
	return 0; // 結果は無限大ではありません
}

// --------------------------------------
// 加算のオーバーフローを検出する関数
//--------------------------------------
int ADD_Overflow_SINT(T_SINT a, T_SINT b) 
{
	if ((b > 0 && a > CHAR_MAX - b) || (b < 0 && a < CHAR_MIN - b))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int ADD_Overflow_DINT(T_DINT a, T_DINT b) 
{
	if ((b > 0 && a > LONG_MAX - b) || (b < 0 && a < LONG_MIN - b))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int ADD_Overflow_INT(T_INT a, T_INT b) 
{
	if ((b > 0 && a > SHRT_MAX - b) || (b < 0 && a < SHRT_MIN - b))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int ADD_Overflow_LINT(T_LINT a, T_LINT b) 
{
	if ((b > 0 && a > LLONG_MAX - b) || (b < 0 && a < LLONG_MIN - b))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int ADD_Overflow_UDINT(T_UDINT a, T_UDINT b) 
{
	if (b > 0 && a > ULONG_MAX - b)
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int ADD_Overflow_UINT(T_UINT a, T_UINT b) 
{
	if (b > 0 && a > USHRT_MAX - b)
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int ADD_Overflow_USINT(T_USINT a, T_USINT b) 
{
	if (b > 0 && a > UCHAR_MAX - b)
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int ADD_Overflow_ULINT(T_ULINT a, T_ULINT b) 
{
	if ((b > 0 && a > ULLONG_MAX - b) || (b < 0 && a < 0 - b))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int ADD_Overflow_TIME(T_TIME a, T_TIME b)
{
	if (b > 0 && a > ULONG_MAX - b)
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
// --------------------------------------
// 減算のオーバーフローを検出する関数
// 符号ありの場合、判定は以下の通り
// 　① a > 0 > bの場合，a > 変数型の最大値 + bならばオーバーフロー
//   ② b > 0 > aの場合，a < 変数型の最小値 + bならばオーバーフロー
//   ③ a == 0かつb = 変数型の最小値 のときオーバーフロー
//--------------------------------------
int SUB_Overflow_SINT(T_SINT a, T_SINT b)
{
	if (((a > 0 && 0 > b) && (a > CHAR_MAX + b)) || ((b > 0 && 0 > a) && a < CHAR_MIN + b)
		|| (a == 0 && b == CHAR_MIN))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}

int SUB_Overflow_INT(T_INT a, T_INT b)
{
	if (((a > 0 && 0 > b) && (a > SHRT_MAX + b)) || ((b > 0 && 0 > a) && a < SHRT_MIN + b)
		|| (a == 0 && b == SHRT_MIN))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}

int SUB_Overflow_DINT(T_DINT a, T_DINT b)
{
	if (((a > 0 && 0 > b) && (a > LONG_MAX + b)) || ((b > 0 && 0 > a) && a < LONG_MIN + b)
		|| (a == 0 && b == LONG_MIN))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}

int SUB_Overflow_LINT(T_LINT a, T_LINT b)
{
	if (((a > 0 && 0 > b) && (a > LLONG_MAX + b)) || ((b > 0 && 0 > a) && a < LLONG_MIN + b)
		|| (a == 0 && b == LLONG_MIN))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
// --------------------------------------
// 減算のオーバーフローを検出する関数
// 符号なしの場合、判定は以下の通り
// 　① a < bならばオーバーフロー
//--------------------------------------
int SUB_Overflow_USINT(T_USINT a, T_USINT b)
{
	if (a < b)
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int SUB_Overflow_UINT(T_UINT a, T_UINT b)
{
	if (a < b)
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int SUB_Overflow_UDINT(T_UDINT a, T_UDINT b)
{
	if (a < b)
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int SUB_Overflow_ULINT(T_ULINT a, T_ULINT b)
{
	if (a < b)
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int SUB_Overflow_TIME(T_TIME a, T_TIME b)
{
	if (a < b)
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
// --------------------------------------
// 乗算のオーバーフローを検出する関数
// 符号ありの場合、判定は以下の通り
// 　① a >  0 , b >  0 の場合, 変数型の最大値 / b > a ならばオーバーフロー
//   ② a >  0 , b <= 0 の場合, 変数型の最小値 / a > b ならばオーバーフロー
//   ③ a <= 0 , b >  0 の場合, 変数型の最小値 / b > a ならばオーバーフロー
//   ④ a <= 0 , b <= 0 の場合, aが0でなく、かつ 変数型の最大値 / a > b ならばオーバーフロー
//--------------------------------------
int MUL_Overflow_SINT(T_SINT a, T_SINT b)
{
	if (   ((a >  0 && b >  0) && ((CHAR_MAX / b) < a)) 
		|| ((a >  0 && b <= 0) && ((CHAR_MIN / a) > b))
		|| ((a <= 0 && b >  0) && ((CHAR_MIN / b) > a))
		|| ((a <= 0 && b <= 0) && (a != 0 && (CHAR_MAX / a) > b)))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int MUL_Overflow_INT(T_INT a, T_INT b)
{
	if (   ((a >  0 && b >  0) && ((SHRT_MAX / b) < a))
		|| ((a >  0 && b <= 0) && ((SHRT_MIN / a) > b))
		|| ((a <= 0 && b >  0) && ((SHRT_MIN / b) > a))
		|| ((a <= 0 && b <= 0) && (a != 0 && (SHRT_MAX / a) > b)))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int MUL_Overflow_DINT(T_DINT a, T_DINT b)
{
	if (   ((a >  0 && b >  0) && ((LONG_MAX / b) < a))
		|| ((a >  0 && b <= 0) && ((LONG_MIN / a) > b))
		|| ((a <= 0 && b >  0) && ((LONG_MIN / b) > a))
		|| ((a <= 0 && b <= 0) && (a != 0 && (LONG_MAX / a) > b)))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int MUL_Overflow_LINT(T_LINT a, T_LINT b)
{
	if (   ((a >  0 && b >  0) && ((LLONG_MAX / b) < a))
		|| ((a >  0 && b <= 0) && ((LLONG_MIN / a) > b))
		|| ((a <= 0 && b >  0) && ((LLONG_MIN / b) > a))
		|| ((a <= 0 && b <= 0) && (a != 0 && (LLONG_MAX / a) > b)))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}

// --------------------------------------
// 乗算のオーバーフローを検出する関数
// 符号なしの場合、判定は以下の通り
// 　b != 0 のとき、a > 整数の最大値 / b ならば オーバーフロー
//--------------------------------------
int MUL_Overflow_USINT(T_USINT a, T_USINT b)
{
	if ((b != 0) && (a > (UCHAR_MAX / b)))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int MUL_Overflow_UINT(T_UINT a, T_UINT b)
{
	if ((b != 0) && (a > (USHRT_MAX / b)))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int MUL_Overflow_UDINT(T_UDINT a, T_UDINT b)
{
	if ((b != 0) && (a > (ULONG_MAX / b)))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int MUL_Overflow_ULINT(T_ULINT a, T_ULINT b)
{
	if ((b != 0) && (a > (ULLONG_MAX / b)))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int MUL_Overflow_TIME(T_TIME a, T_TIME b)
{
	if ((b != 0) && (a > (ULONG_MAX / b)))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int MUL_Overflow_TIME_UDINT(T_TIME a, T_UDINT b)
{
	if ((b != 0) && (a > (ULONG_MAX / b)))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
// --------------------------------------
// 除算のオーバーフローを検出する関数
// 符号ありの場合、判定は以下の通り
// 　aが整数の最大値 かつ b == -1 ならば オーバーフロー
//--------------------------------------
int DIV_Overflow_SINT(T_SINT a, T_SINT b)
{
	if ((a == CHAR_MIN) && (b == -1))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int DIV_Overflow_INT(T_INT a, T_INT b)
{
	if ((a == SHRT_MIN) && (b == -1))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int DIV_Overflow_DINT(T_DINT a, T_DINT b)
{
	if ((a == LONG_MIN) && (b == -1))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
int DIV_Overflow_LINT(T_LINT a, T_LINT b)
{
	if ((a == LLONG_MIN) && (b == -1))
	{
		return 1; // オーバーフローが発生した
	}
	return 0; // オーバーフローが発生していない
}
