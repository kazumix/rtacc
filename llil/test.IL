(* RTedge タグ（IL 内で参照される名前と型）*)
VAR BOOL#StartSW
VAR BOOL#EndSW
VAR UINT#AI_1
VAR BOOL#Active
VAR BOOL#LimitOver
VAR INT#LimitOverCount
VAR BOOL#Err
VAR BOOL#TP1_Q
VAR BOOL#TP2_Q
VAR BOOL#TP3_Q
VAR BOOL#TP4_Q
VAR BOOL#LED1
VAR BOOL#LED2
VAR FUNCTION#CTU#CTU_1
VAR FUNCTION#TP#TP_1
VAR FUNCTION#TP#TP_2
VAR FUNCTION#TP#TP_3
VAR FUNCTION#TP#TP_4

(*■■概要■■
SWにより制御がアクティブにされた状態でアナログ値が上限値を
5回越えたらエラーLEDを１秒毎に点滅出力します。
I/OはDIO、AIを使用します。
■■処理内容■■
①スタート信号(DI1)がONで処理のアクティブ状態を保持します。
　保持は終了信号(DI2)がONになるまで続きます。
②2つのアナログ値(AI1,固定値)の加算結果が上限値越えチェックします。
③アクティブ状態時、5回以上上限を越えた場合はエラー判定とします。
④1秒おきに点滅させる為の信号作るフリッカー回路です。
⑤エラー判定時、1秒おきに点滅出力を行います。
⑥StartSWがONの間、LED2を500ms周期で点滅させます。
*)
(*①アクティブ状態保持回路*)
LD  StartSW
OR  Active
ANDN  EndSW
ST  Active
(*②アナログ値の加算と上限チェック回路*)
LD  AI_1
ADD  UINT#100
GT  UINT#1000
ST  LimitOver
(*③上限値オーバーのカウント(5回)回路*)
LD  Active
AND  LimitOver
ST  CTU_1.CU
LD  EndSW
ST  CTU_1.RESET
LD  INT#5
ST  CTU_1.PV
CAL  CTU_1
LD  CTU_1.Q
ST  Err
LD  CTU_1.CV
ST  LimitOverCount
(*③１秒おきに点滅するフリッカー回路*)
LDN  TP2_Q
ST  TP_1.IN
LD  TIME#1s
ST  TP_1.PT
CAL  TP_1
LD  TP_1.Q
ST  TP1_Q
LDN  TP_1.Q
ST  TP_2.IN
LD  TIME#1s
ST  TP_2.PT
CAL  TP_2
LD  TP_2.Q
ST  TP2_Q
(*⑥StartSW中のみ500msアスタブルでLED2点滅*)
LD  StartSW
ANDN  TP4_Q
ST  TP_3.IN
LD  TIME#500ms
ST  TP_3.PT
CAL  TP_3
LD  TP_3.Q
ST  TP3_Q
LD  StartSW
ANDN  TP3_Q
ST  TP_4.IN
LD  TIME#500ms
ST  TP_4.PT
CAL  TP_4
LD  TP_4.Q
ST  TP4_Q
LD  StartSW
AND  TP3_Q
ST  LED2
(*⑤エラー出力回路*)
LD  Err
AND  TP2_Q
ST  LED1
