(* ScanThread 本体: SW1∧SW2 が真の間、ANS を 100ms ごとに +1。10 秒で ANS=0 に戻す。 *)
(* 1ms 周期は scan_thread.c の RtSleepEx(1) + 本 POU 呼び出しで実現 *)

VAR BOOL#SW1
VAR BOOL#SW2
VAR INT#ANS
VAR INT#CycleMs
VAR INT#Sub100
VAR BOOL#R
VAR INT#Cm1
VAR BOOL#G10
VAR INT#Sb_inc
VAR BOOL#Sb_ge
VAR INT#AnsP1
VAR INT#Ans_mid
VAR INT#Ans_mid2
VAR INT#tmpSb
VAR INT#tmpSb2

LD SW1
AND SW2
ST R

LD CycleMs
ADD INT#1
ST Cm1

SEL R Cm1 INT#0 CycleMs

LD CycleMs
GE INT#10000
ST G10

SEL G10 INT#0 CycleMs CycleMs

LD Sub100
ADD INT#1
ST Sb_inc

LD Sb_inc
GE INT#100
ST Sb_ge

SEL Sb_ge INT#0 Sb_inc tmpSb

SEL G10 INT#0 tmpSb tmpSb2

SEL R tmpSb2 INT#0 Sub100

LD ANS
ADD INT#1
ST AnsP1

SEL Sb_ge AnsP1 ANS Ans_mid

SEL G10 INT#0 Ans_mid Ans_mid2

SEL R Ans_mid2 INT#0 ANS
