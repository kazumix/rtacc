(* RTedge タグ用 VAR 宣言（サンプル） *)
VAR BOOL#ECAT_Slave5_DI1
VAR BOOL#ECAT_Slave5_DO1
VAR INT#ECAT_Slave4_AO1
VAR BOOL#CT_Reset
VAR UINT#IL_UintCounterHead
VAR UINT#IL_UintCounterTail

VAR FUNCTION#TON#TON_1
VAR FUNCTION#TON#TON_2
VAR FUNCTION#TON#TON_3
VAR FUNCTION#TON#TON_4
VAR FUNCTION#TON#TON_5
VAR FUNCTION#TON#TON_6
VAR FUNCTION#TON#TON_7

VAR FUNCTION#CTU#CTU_1
VAR FUNCTION#CTU#CTU_2
VAR FUNCTION#CTU#CTU_3
VAR FUNCTION#CTU#CTU_4
VAR FUNCTION#CTU#CTU_5
VAR FUNCTION#CTU#CTU_6
VAR FUNCTION#CTU#CTU_7

VAR FUNCTION#R_TRIG#R_TRIG_1
VAR FUNCTION#F_TRIG#F_TRIG_1

(**** 全命令テスト ****)
(**** 回路ON ****)
(* ILロジック先頭: UINTカウンタ +1 *)
LD  IL_UintCounterHead
ADD UINT#1
ST  IL_UintCounterHead
LD  ECAT_Slave5_DI1
ST  input01
ST  inBia0101
ST  inBia0102
ST  inBia0202
ST  inBia0203
ST  inBia0303
ST  inBIa0404
ST  inBIa0504
ST  inCLR01
ST  inCLR02
ST  inCLR03
ST  inCLR0401
ST  inCLR0402
ST  inCounter
ST  inCounter2
ST  inCounter3
ST  inCounter04
ST  inCounter05
ST  inCounter06
ST  inDIFU
ST  inDIFD
ST  inTIMER01
ST  inTimER02
ST  inTimeR03
ST  inTimer05
ST  inTimer06
ST  inTimer07
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(*■LD命令*)
LD  input01
ST  resLD
(*■LDB命令*)
LDN  input01
STN  resLDB
(*■AND命令*)
LDN  C005
AND  input01
ST  resAND
(*■ANB命令*)
LDN  C007
ANDN  input01
STN  resANB
(*■OR命令*)
LD  C010
OR  input01
ST  resOR
(*■ORB命令*)
LD  C015
ORN  input01
STN  resORB
(*■OUT命令*)
LD  input01
ST  resOUT
(*■OUB命令*)
LDN  input01
STN  resOUB
(*■SET命令*)
LD  input01
ANDN  resSET
S  resSET
(*■RES命令*)
LD  input01
S  C024
LD  input01
R  C024
LDN  C024
ST  resRES
(*■LD_T命令*)
LD  inTIMER01
ST  TON_1.IN
ST  TON_2.IN
LD  TIME#30s
ST  TON_1.PT
CAL  TON_1
LD  TON_1.Q
ST  resTimer01
LD  TON_1.ET
ST  passed01
LD  TIME#1m
ST  TON_2.PT
CAL  TON_2
LD  TON_2.Q
ST  resTimer02
LD  TON_2.ET
ST  passed02
LD  resTimer01
ST  resLD_T01
LD  resTimer02
ST  resLD_T02
(*■LD_C命令*)
LD  inCounter
ST  CTU_1.CU
LD  enableCnt
ST  CTU_1.RESET
LD  INT#5000
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  outConter
LD  CTU_1.CV
ST  valCounter
LD  outConter
ST  resLD_C
(*■LDB_T命令*)
LD  inTimER02
ST  TON_3.IN
LD  TIME#30s
ST  TON_3.PT
CAL  TON_3
LD  TON_3.Q
ST  resT5
LD  TON_3.ET
ST  passed03
LDN  resT5
STN  resLDB_T
(*■LDB_C命令*)
LD  inCounter2
ST  CTU_2.CU
LD  enableCnt
ST  CTU_2.RESET
LD  INT#5000
ST  CTU_2.PV
CAL  CTU_2
LD  CTU_2.Q
ST  outConter2
LD  CTU_2.CV
ST  valCounter2
LDN  outConter2
STN  resLDB_C
(*■AND_T命令*)
LD  inTimeR03
ST  TON_4.IN
LD  TIME#30s
ST  TON_4.PT
CAL  TON_4
LD  TON_4.Q
ST  outTimer
LD  TON_4.ET
ST  passed04
LDN  C046
AND  outTimer
ST  resAND_T
(*■AND_C命令*)
LD  inCounter3
ST  CTU_3.CU
LD  enableCnt
ST  CTU_3.RESET
LD  INT#5000
ST  CTU_3.PV
CAL  CTU_3
LD  CTU_3.Q
ST  outCounter3
LD  CTU_3.CV
ST  valCounter3
LDN  C052
AND  outCounter3
ST  resAND_C
(*■ANB_T命令*)
LD  inTimer05
ST  TON_5.IN
LD  TIME#30s
ST  TON_5.PT
CAL  TON_5
LD  TON_5.Q
ST  outTimer05
LD  TON_5.ET
ST  passed05
LDN  C055
ANDN  outTimer05
STN  resANB_T
(*■ANB_C命令*)
LD  inCounter04
ST  CTU_4.CU
LD  enableCnt
ST  CTU_4.RESET
LD  INT#5000
ST  CTU_4.PV
CAL  CTU_4
LD  CTU_4.Q
ST  outConter04
LD  CTU_4.CV
ST  valCounter04
LDN  C061
ANDN  outConter04
STN  resANB_C
(*■OR_T命令*)
LD  inTimer06
ST  TON_6.IN
LD  TIME#30s
ST  TON_6.PT
CAL  TON_6
LD  TON_6.Q
ST  outTimer06
LD  TON_6.ET
ST  passed06
LD  C065
OR  outTimer06
ST  resOR_T
(*■OR_C命令*)
LD  inCounter05
ST  CTU_5.CU
LD  enableCnt
ST  CTU_5.RESET
LD  INT#5000
ST  CTU_5.PV
CAL  CTU_5
LD  CTU_5.Q
ST  outCounter05
LD  CTU_5.CV
ST  valCounter05
LD  C069
OR  outCounter05
ST  resOR_C
(*■ORB_T命令*)
LD  inTimer07
ST  TON_7.IN
LD  TIME#30s
ST  TON_7.PT
CAL  TON_7
LD  TON_7.Q
ST  outTimer07
LD  TON_7.ET
ST  passed07
LD  C075
ORN  outTimer07
STN  resORB_T
(*■ORB_C命令*)
LD  inCounter06
ST  CTU_6.CU
LD  enableCnt
ST  CTU_6.RESET
LD  INT#5000
ST  CTU_6.PV
CAL  CTU_6
LD  CTU_6.Q
ST  outCounter06
LD  CTU_6.CV
ST  valCounter06
LD  C078
ORN  outCounter06
STN  resORB_C
(*■ANL命令*)
LD  input01
OR  C083
ST  IL変数_1
LD  input01
OR  C085
AND  IL変数_1
ST  resANL
(*■ORL命令*)
LD  input01
AND  input01
ST  IL変数_2
LD  C089
AND  C091
OR  IL変数_2
ST  resORL
(*■MPS、MPP、MRD命令*)
LD  setten0101
AND  setten0102
ST  IL変数_3
LD  IL変数_3
AND  setten0103
ST  IL変数_4
LD  IL変数_4
AND  setten0104
ST  resCoil01
LD  IL変数_4
AND  setten0204
ST  resCoil02
LD  IL変数_4
AND  setten0304
ST  resCoil03
LD  IL変数_3
AND  setten0403
ST  resCoil04
LD  IL変数_3
AND  setten0503
ST  resCoil05
LD  IL変数_3
AND  setten0603
ST  resCoil06
LD  setten0101
AND  setten0702
ST  resCoil07
LD  setten0101
AND  setten0802
ST  resCoil08
LD  setten0101
AND  setten0902
ST  resCoil09
(*■ビアメカ問題発生ロジック*)
LD  inBia0102
OR  inBia0202
AND  inBia0101
ST  resBia01
LD  resBia01
AND  inBia0203
ST  resBia02
LD  inBIa0404
OR  inBIa0504
ST  IL変数_5
LD  resBia01
AND  inBia0303
AND  IL変数_5
ST  resBia03
(*■CLR命令*)
(*実行されるパターン*)
LD  inCLR01
ST  resCLR01
LD  inCLR02
ST  resCLR02
(*実行されないパターン*)
LD  inCLR03
ST  resCLR03
AND  inCLR0401
AND  inCLR0402
ST  resCLR04
(*■DIFU(TRIGON)命令*)
LD  inDIFU
ST  R_TRIG_1.CLK
CAL  R_TRIG_1
LD  R_TRIG_1.Q
ST  outDIFU
LD  outDIFU
OR  holdDIFU
ST  holdDIFU
LDN  outDIFU
AND  holdDIFU
ST  resDIFU
(*■DIFD(TRIGOFF)命令*)
LD  inDIFD
ST  F_TRIG_1.CLK
CAL  F_TRIG_1
LD  F_TRIG_1.Q
ST  outDIFD
LD  outDIFD
OR  holdDIFD
ST  holdDIFD
(*-----ここまで-----------------------------------------------------
*)
LD  holdDIFD
ANDN  outDIFD
ST  resDIFD
(**** IO処理 ****)
LD  ECAT_Slave5_DI1
ST  ECAT_Slave5_DO1
(**** テストここまで ****)
LD  ECAT_Slave5_DI1
ST  CTU_7.CU
LD  CT_Reset
ST  CTU_7.RESET
LD  INT#32767
ST  CTU_7.PV
CAL  CTU_7
LD  CTU_7.Q
ST  CT_Reset
LD  CTU_7.CV
ST  ECAT_Slave4_AO1
(* ILロジック末尾: UINTカウンタ +1 *)
LD  IL_UintCounterTail
ADD UINT#1
ST  IL_UintCounterTail
