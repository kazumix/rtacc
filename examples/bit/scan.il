(* 100ms スキャンは scan_thread.c の RtSleepEx(100) + scan() 呼び出し。 *)
(* dw1 のビット 1 AND dw2 のビット 1 → dw3 のビット 8 に反映 *)

VAR DWORD#dw1
VAR DWORD#dw2
VAR DWORD#dw3

LD dw1.X1
AND dw2.X1
ST dw3.X8
