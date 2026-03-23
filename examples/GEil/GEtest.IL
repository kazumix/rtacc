(* 最小例: UINT 加算の結果が閾値「以上」かを GE で判定 *)
VAR BOOL#GeResult

LD UINT#10
ADD UINT#5
GE UINT#14
ST GeResult
