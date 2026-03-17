#include "common.h"

// SQINT から参照されるが、UI 検証では実体不要なウォッチドッグ関連のみスタブにする。

// ウォッチドッグ関連は検証用途では無効化する。
void Watchdog_Init(void) {}
void Watchdog_Reset(void) {}
QWORD WatchDog_GetPentiumCounter(void) { return 0; }
double Watchdog_Calc(QWORD uiBegin, QWORD uiEnd) { return 0.0; }
void WatchDog_Action_OverRun(void) {}
void Watchdog_Process(QWORD start, QWORD end) {}

// ステータス管理用のウォッチドッグ状態もローカルに持つ。
DWORD status_watchdog = STATUS_STOP;


