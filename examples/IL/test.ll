; llil: simple IL (BOOL subset) -> LLVM IR
define i32 @main() {
entry:
  %LimitOverCount
  %ptr_LimitOverCount = alloca i32
  store i32 0, ptr %ptr_LimitOverCount
  %ADD_Data
  %ptr_ADD_Data = alloca i32
  store i32 0, ptr %ptr_ADD_Data
  %Start
  %ptr_Start = alloca i1
  store i1 false, ptr %ptr_Start
  %End
  %ptr_End = alloca i1
  store i1 false, ptr %ptr_End
  %Err
  %ptr_Err = alloca i1
  store i1 false, ptr %ptr_Err
  %TP1_Q
  %ptr_TP1_Q = alloca i1
  store i1 false, ptr %ptr_TP1_Q
  %TP2_Q
  %ptr_TP2_Q = alloca i1
  store i1 false, ptr %ptr_TP2_Q
  %StartSW
  %ptr_StartSW = alloca i1
  store i1 false, ptr %ptr_StartSW
  %Active
  %ptr_Active = alloca i1
  store i1 false, ptr %ptr_Active
  %EndSW
  %ptr_EndSW = alloca i1
  store i1 false, ptr %ptr_EndSW
  %AI_1
  %ptr_AI_1 = alloca i1
  store i1 false, ptr %ptr_AI_1
  %LimitOver
  %ptr_LimitOver = alloca i1
  store i1 false, ptr %ptr_LimitOver
  %CTU_1.CU
  %ptr_CTU_1.CU = alloca i1
  store i1 false, ptr %ptr_CTU_1.CU
  %CTU_1.RESET
  %ptr_CTU_1.RESET = alloca i1
  store i1 false, ptr %ptr_CTU_1.RESET
  %INT#5
  %ptr_INT#5 = alloca i1
  store i1 false, ptr %ptr_INT#5
  %CTU_1.PV
  %ptr_CTU_1.PV = alloca i1
  store i1 false, ptr %ptr_CTU_1.PV
  %CTU_1.Q
  %ptr_CTU_1.Q = alloca i1
  store i1 false, ptr %ptr_CTU_1.Q
  %CTU_1.CV
  %ptr_CTU_1.CV = alloca i1
  store i1 false, ptr %ptr_CTU_1.CV
  %TP_1.IN
  %ptr_TP_1.IN = alloca i1
  store i1 false, ptr %ptr_TP_1.IN
  %TIME#1s
  %ptr_TIME#1s = alloca i1
  store i1 false, ptr %ptr_TIME#1s
  %TP_1.PT
  %ptr_TP_1.PT = alloca i1
  store i1 false, ptr %ptr_TP_1.PT
  %TP_1.Q
  %ptr_TP_1.Q = alloca i1
  store i1 false, ptr %ptr_TP_1.Q
  %TP_2.IN
  %ptr_TP_2.IN = alloca i1
  store i1 false, ptr %ptr_TP_2.IN
  %TP_2.PT
  %ptr_TP_2.PT = alloca i1
  store i1 false, ptr %ptr_TP_2.PT
  %TP_2.Q
  %ptr_TP_2.Q = alloca i1
  store i1 false, ptr %ptr_TP_2.Q
  %LED1
  %ptr_LED1 = alloca i1
  store i1 false, ptr %ptr_LED1
  %acc = alloca i1
  store i1 false, ptr %acc
  %t1 = load i1, ptr %ptr_StartSW
  store i1 %t1, ptr %acc
  %t2 = load i1, ptr %acc
  %t3 = load i1, ptr %ptr_Active
  %t4 = or i1 %t2, %t3
  store i1 %t4, ptr %acc
  %t5 = load i1, ptr %acc
  %t6 = load i1, ptr %ptr_EndSW
  %t7 = xor i1 %t6, true
  %t8 = and i1 %t5, %t7
  store i1 %t8, ptr %acc
  %t9 = load i1, ptr %acc
  store i1 %t9, ptr %ptr_Active
  %t10 = load i1, ptr %ptr_AI_1
  store i1 %t10, ptr %acc
  %t11 = load i1, ptr %acc
  store i1 %t11, ptr %ptr_LimitOver
  %t12 = load i1, ptr %ptr_Active
  store i1 %t12, ptr %acc
  %t13 = load i1, ptr %acc
  %t14 = load i1, ptr %ptr_LimitOver
  %t15 = and i1 %t13, %t14
  store i1 %t15, ptr %acc
  %t16 = load i1, ptr %acc
  store i1 %t16, ptr %ptr_CTU_1.CU
  %t17 = load i1, ptr %ptr_EndSW
  store i1 %t17, ptr %acc
  %t18 = load i1, ptr %acc
  store i1 %t18, ptr %ptr_CTU_1.RESET
  %t19 = load i1, ptr %ptr_INT#5
  store i1 %t19, ptr %acc
  %t20 = load i1, ptr %acc
  store i1 %t20, ptr %ptr_CTU_1.PV
  %t21 = load i1, ptr %ptr_CTU_1.Q
  store i1 %t21, ptr %acc
  %t22 = load i1, ptr %acc
  store i1 %t22, ptr %ptr_Err
  %t23 = load i1, ptr %ptr_CTU_1.CV
  store i1 %t23, ptr %acc
  %t24 = load i1, ptr %acc
  %t25 = zext i1 %t24 to i32
  store i32 %t25, ptr %ptr_LimitOverCount
  %t26 = load i1, ptr %ptr_TP2_Q
  %t27 = xor i1 %t26, true
  store i1 %t27, ptr %acc
  %t28 = load i1, ptr %acc
  store i1 %t28, ptr %ptr_TP_1.IN
  %t29 = load i1, ptr %ptr_TIME#1s
  store i1 %t29, ptr %acc
  %t30 = load i1, ptr %acc
  store i1 %t30, ptr %ptr_TP_1.PT
  %t31 = load i1, ptr %ptr_TP_1.Q
  store i1 %t31, ptr %acc
  %t32 = load i1, ptr %acc
  store i1 %t32, ptr %ptr_TP1_Q
  %t33 = load i1, ptr %ptr_TP_1.Q
  %t34 = xor i1 %t33, true
  store i1 %t34, ptr %acc
  %t35 = load i1, ptr %acc
  store i1 %t35, ptr %ptr_TP_2.IN
  %t36 = load i1, ptr %ptr_TIME#1s
  store i1 %t36, ptr %acc
  %t37 = load i1, ptr %acc
  store i1 %t37, ptr %ptr_TP_2.PT
  %t38 = load i1, ptr %ptr_TP_2.Q
  store i1 %t38, ptr %acc
  %t39 = load i1, ptr %acc
  store i1 %t39, ptr %ptr_TP2_Q
  %t40 = load i1, ptr %ptr_Err
  store i1 %t40, ptr %acc
  %t41 = load i1, ptr %acc
  %t42 = load i1, ptr %ptr_TP2_Q
  %t43 = and i1 %t41, %t42
  store i1 %t43, ptr %acc
  %t44 = load i1, ptr %acc
  store i1 %t44, ptr %ptr_LED1
  ret i32 0
}