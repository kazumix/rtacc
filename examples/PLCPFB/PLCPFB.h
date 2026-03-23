#ifndef _PLCPFB_H_
#define _PLCPFB_H_

#ifdef  PLCPFB_EXPORTS
#define PLCPFB_API __declspec(dllexport)
#else
#define PLCPFB_API __declspec(dllimport)
#endif


/// <summary>
/// 全体に関係する処理 PLCPFB.c
/// </summary>
extern void Initialize(void);

/// <summary>
/// ユーティリティ関連 util.c
/// </summary>
extern DWORD fbWatchDog_GetCPUSpeed(void);
extern double CalcTime(QWORD start, QWORD end);


#endif
