(*
  EN 付き TON を2個使ったフリッカ（点滅）例。
  - ILT_Enable: TRUE の間だけ点滅（各 TON の EN に相当する BOOL を毎スキャン書き込み）。
  - ILT_LampOut: ランプ／DO 用の出力ビット。
  - TON_1: 消灯中 (!ILT_LampOut) の経過で点灯 (S)。
  - TON_2: 点灯中の経過で消灯 (R)。
  PT は llil の TON 実装では「スキャン回数」と PT（TIME# の数値）を比較するため、
  周期は scan_thread.c の RtSleepEx とセットで調整すること。
  RTedge のタグ名は llil の scan_slots_init が出力する命令書式と一致（例: TON_1.EN、TON_1.PT）。
  VAR FUNCTION#TON#TON_x … llil が scan_slots_init で先に FUNCTION#TON#TON_x（親・Eg 名は TON_x）、
  続けて BOOL#TON_x.EN 等を出力。PLCP の Functionblock_Register によるピンとセグメントのリンクは無い。
  参照: examples/PLCP/rtedge.c（Rtedge_TagCreateByInstruction）, functionblock.c（Functionblock_Register）。
*)
VAR BOOL#ILT_Enable
VAR BOOL#ILT_LampOut
VAR UINT#ILT_EtMon1
VAR UINT#ILT_EtMon2
VAR FUNCTION#TON#TON_1
VAR FUNCTION#TON#TON_2
(* 非 TON FB: slots_init で FUNCTION#ADD#… と IlRtedge_BindTonPinSlot（オフセットは plcp_rtedge fb_layout と一致） *)
VAR FUNCTION#ADD#ADD_1

(* TON ピン: .EN は IEC の EN 相当（本ランタイムでは IN と AND してゲート） *)

(* --- TON_1: 消灯が PT 続いたら Q → 点灯セット --- *)
LD ILT_Enable
ST TON_1.EN
LDN ILT_LampOut
AND TON_1.EN
ST TON_1.IN
LD TIME#10
ST TON_1.PT
CAL TON_1
LD TON_1.ET
ST ILT_EtMon1
LD TON_1.Q
S ILT_LampOut

(* --- TON_2: 点灯が PT 続いたら Q → 消灯リセット --- *)
LD ILT_Enable
ST TON_2.EN
LD ILT_LampOut
AND TON_2.EN
ST TON_2.IN
LD TIME#10
ST TON_2.PT
CAL TON_2
LD TON_2.ET
ST ILT_EtMon2
LD TON_2.Q
R ILT_LampOut

(* --- ADD_1: 算術 FB のセグメント／ピンスロット生成確認用 --- *)
LD ILT_Enable
ST ADD_1.EN
LD INT#1
ST ADD_1.IN1
LD INT#2
ST ADD_1.IN2
CAL ADD_1
