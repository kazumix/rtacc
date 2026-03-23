; llil: IL -> LLVM IR (BOOL/INT/UINT/TIME, ADD/GT/GE, CTU/TP) memory=rtedge
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc"
@il_mem_StartSW = global i1 false, align 1
@il_slot_StartSW = global ptr null, align 4
@il_mem_EndSW = global i1 false, align 1
@il_slot_EndSW = global ptr null, align 4
@il_mem_AI_1 = global i32 0, align 4
@il_slot_AI_1 = global ptr null, align 4
@il_mem_Active = global i1 false, align 1
@il_slot_Active = global ptr null, align 4
@il_mem_LimitOver = global i1 false, align 1
@il_slot_LimitOver = global ptr null, align 4
@il_mem_LimitOverCount = global i32 0, align 4
@il_slot_LimitOverCount = global ptr null, align 4
@il_mem_Err = global i1 false, align 1
@il_slot_Err = global ptr null, align 4
@il_mem_TP1_Q = global i1 false, align 1
@il_slot_TP1_Q = global ptr null, align 4
@il_mem_TP2_Q = global i1 false, align 1
@il_slot_TP2_Q = global ptr null, align 4
@il_mem_LED1 = global i1 false, align 1
@il_slot_LED1 = global ptr null, align 4
@il_mem_CTU_1_CU = global i1 false, align 1
@il_slot_CTU_1_CU = global ptr null, align 4
@il_mem_CTU_1_RESET = global i1 false, align 1
@il_slot_CTU_1_RESET = global ptr null, align 4
@il_mem_CTU_1_PV = global i32 0, align 4
@il_slot_CTU_1_PV = global ptr null, align 4
@il_mem_CTU_1__prev_cu = global i1 false, align 1
@il_slot_CTU_1__prev_cu = global ptr null, align 4
@il_mem_CTU_1_Q = global i1 false, align 1
@il_slot_CTU_1_Q = global ptr null, align 4
@il_mem_CTU_1_CV = global i32 0, align 4
@il_slot_CTU_1_CV = global ptr null, align 4
@il_mem_TP_1_IN = global i1 false, align 1
@il_slot_TP_1_IN = global ptr null, align 4
@il_mem_TP_1_PT = global i32 0, align 4
@il_slot_TP_1_PT = global ptr null, align 4
@il_mem_TP_1__elapsed = global i32 0, align 4
@il_slot_TP_1__elapsed = global ptr null, align 4
@il_mem_TP_1__running = global i1 false, align 1
@il_slot_TP_1__running = global ptr null, align 4
@il_mem_TP_1_Q = global i1 false, align 1
@il_slot_TP_1_Q = global ptr null, align 4
@il_mem_TP_2_IN = global i1 false, align 1
@il_slot_TP_2_IN = global ptr null, align 4
@il_mem_TP_2_PT = global i32 0, align 4
@il_slot_TP_2_PT = global ptr null, align 4
@il_mem_TP_2__elapsed = global i32 0, align 4
@il_slot_TP_2__elapsed = global ptr null, align 4
@il_mem_TP_2__running = global i1 false, align 1
@il_slot_TP_2__running = global ptr null, align 4
@il_mem_TP_2_Q = global i1 false, align 1
@il_slot_TP_2_Q = global ptr null, align 4
define void @test_slots_init() {
entry:
  ; rtedge: 将来はタグ解決。当面は stack と同じく @il_mem_* を指して動作させる。
  store ptr @il_mem_StartSW, ptr @il_slot_StartSW
  store ptr @il_mem_EndSW, ptr @il_slot_EndSW
  store ptr @il_mem_AI_1, ptr @il_slot_AI_1
  store ptr @il_mem_Active, ptr @il_slot_Active
  store ptr @il_mem_LimitOver, ptr @il_slot_LimitOver
  store ptr @il_mem_LimitOverCount, ptr @il_slot_LimitOverCount
  store ptr @il_mem_Err, ptr @il_slot_Err
  store ptr @il_mem_TP1_Q, ptr @il_slot_TP1_Q
  store ptr @il_mem_TP2_Q, ptr @il_slot_TP2_Q
  store ptr @il_mem_LED1, ptr @il_slot_LED1
  store ptr @il_mem_CTU_1_CU, ptr @il_slot_CTU_1_CU
  store ptr @il_mem_CTU_1_RESET, ptr @il_slot_CTU_1_RESET
  store ptr @il_mem_CTU_1_PV, ptr @il_slot_CTU_1_PV
  store ptr @il_mem_CTU_1__prev_cu, ptr @il_slot_CTU_1__prev_cu
  store ptr @il_mem_CTU_1_Q, ptr @il_slot_CTU_1_Q
  store ptr @il_mem_CTU_1_CV, ptr @il_slot_CTU_1_CV
  store ptr @il_mem_TP_1_IN, ptr @il_slot_TP_1_IN
  store ptr @il_mem_TP_1_PT, ptr @il_slot_TP_1_PT
  store ptr @il_mem_TP_1__elapsed, ptr @il_slot_TP_1__elapsed
  store ptr @il_mem_TP_1__running, ptr @il_slot_TP_1__running
  store ptr @il_mem_TP_1_Q, ptr @il_slot_TP_1_Q
  store ptr @il_mem_TP_2_IN, ptr @il_slot_TP_2_IN
  store ptr @il_mem_TP_2_PT, ptr @il_slot_TP_2_PT
  store ptr @il_mem_TP_2__elapsed, ptr @il_slot_TP_2__elapsed
  store ptr @il_mem_TP_2__running, ptr @il_slot_TP_2__running
  store ptr @il_mem_TP_2_Q, ptr @il_slot_TP_2_Q
  ret void
}
define void @ctu_step(ptr %cu, ptr %reset, ptr %pv, ptr %q, ptr %cv, ptr %prev_cu) {
entry:
  %cu_val = load i1, ptr %cu
  %reset_val = load i1, ptr %reset
  %pv_val = load i32, ptr %pv
  %cv_old = load i32, ptr %cv
  %prev = load i1, ptr %prev_cu
  ; if reset then cv_new = 0
  %cv_after_reset = select i1 %reset_val, i32 0, i32 %cv_old
  ; rising edge: cu and !prev
  %prev_not = xor i1 %prev, true
  %rise = and i1 %cu_val, %prev_not
  %cv_inc = add i32 %cv_after_reset, 1
  %cv_new = select i1 %rise, i32 %cv_inc, i32 %cv_after_reset
  store i32 %cv_new, ptr %cv
  store i1 %cu_val, ptr %prev_cu
  ; Q = (CV >= PV)
  %q_val = icmp sge i32 %cv_new, %pv_val
  store i1 %q_val, ptr %q
  ret void
}
define void @tp_step(ptr %in, ptr %pt, ptr %q, ptr %elapsed, ptr %running) {
entry:
  %in_val = load i1, ptr %in
  %pt_val = load i32, ptr %pt
  %elapsed_val = load i32, ptr %elapsed
  %running_val = load i1, ptr %running
  ; running and in: elapsed++
  %el_inc = add i32 %elapsed_val, 1
  %el_new = select i1 %in_val, i32 %el_inc, i32 %elapsed_val
  ; Q = (elapsed >= pt) while running
  %done = icmp sge i32 %el_new, %pt_val
  %q_val = and i1 %in_val, %done
  store i32 %el_new, ptr %elapsed
  store i1 %q_val, ptr %q
  ; running = in (簡易: 毎周期 in が true ならカウント続行)
  store i1 %in_val, ptr %running
  ret void
}
define i32 @test() {
entry:
  %ptr_StartSW = load ptr, ptr @il_slot_StartSW
  %ptr_EndSW = load ptr, ptr @il_slot_EndSW
  %ptr_AI_1 = load ptr, ptr @il_slot_AI_1
  %ptr_Active = load ptr, ptr @il_slot_Active
  %ptr_LimitOver = load ptr, ptr @il_slot_LimitOver
  %ptr_LimitOverCount = load ptr, ptr @il_slot_LimitOverCount
  %ptr_Err = load ptr, ptr @il_slot_Err
  %ptr_TP1_Q = load ptr, ptr @il_slot_TP1_Q
  %ptr_TP2_Q = load ptr, ptr @il_slot_TP2_Q
  %ptr_LED1 = load ptr, ptr @il_slot_LED1
  %ptr_CTU_1_CU = load ptr, ptr @il_slot_CTU_1_CU
  %ptr_CTU_1_RESET = load ptr, ptr @il_slot_CTU_1_RESET
  %ptr_CTU_1_PV = load ptr, ptr @il_slot_CTU_1_PV
  %ptr_CTU_1__prev_cu = load ptr, ptr @il_slot_CTU_1__prev_cu
  %ptr_CTU_1_Q = load ptr, ptr @il_slot_CTU_1_Q
  %ptr_CTU_1_CV = load ptr, ptr @il_slot_CTU_1_CV
  %ptr_TP_1_IN = load ptr, ptr @il_slot_TP_1_IN
  %ptr_TP_1_PT = load ptr, ptr @il_slot_TP_1_PT
  %ptr_TP_1__elapsed = load ptr, ptr @il_slot_TP_1__elapsed
  %ptr_TP_1__running = load ptr, ptr @il_slot_TP_1__running
  %ptr_TP_1_Q = load ptr, ptr @il_slot_TP_1_Q
  %ptr_TP_2_IN = load ptr, ptr @il_slot_TP_2_IN
  %ptr_TP_2_PT = load ptr, ptr @il_slot_TP_2_PT
  %ptr_TP_2__elapsed = load ptr, ptr @il_slot_TP_2__elapsed
  %ptr_TP_2__running = load ptr, ptr @il_slot_TP_2__running
  %ptr_TP_2_Q = load ptr, ptr @il_slot_TP_2_Q
  %acc = alloca i1
  store i1 false, ptr %acc
  %int_acc = alloca i32
  store i32 0, ptr %int_acc
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
  %t10 = load i32, ptr %ptr_AI_1
  store i32 %t10, ptr %int_acc
  %t11 = load i32, ptr %int_acc
  %t12 = add i32 %t11, 100
  store i32 %t12, ptr %int_acc
  %t13 = load i32, ptr %int_acc
  %t14 = icmp ugt i32 %t13, 1000
  store i1 %t14, ptr %acc
  %t15 = load i1, ptr %acc
  store i1 %t15, ptr %ptr_LimitOver
  %t16 = load i1, ptr %ptr_Active
  store i1 %t16, ptr %acc
  %t17 = load i1, ptr %acc
  %t18 = load i1, ptr %ptr_LimitOver
  %t19 = and i1 %t17, %t18
  store i1 %t19, ptr %acc
  %t20 = load i1, ptr %acc
  store i1 %t20, ptr %ptr_CTU_1_CU
  %t21 = load i1, ptr %ptr_EndSW
  store i1 %t21, ptr %acc
  %t22 = load i1, ptr %acc
  store i1 %t22, ptr %ptr_CTU_1_RESET
  store i32 5, ptr %int_acc
  %t23 = load i32, ptr %int_acc
  store i32 %t23, ptr %ptr_CTU_1_PV
  call void @ctu_step(ptr %ptr_CTU_1_CU, ptr %ptr_CTU_1_RESET, ptr %ptr_CTU_1_PV, ptr %ptr_CTU_1_Q, ptr %ptr_CTU_1_CV, ptr %ptr_CTU_1__prev_cu)
  %t24 = load i1, ptr %ptr_CTU_1_Q
  store i1 %t24, ptr %acc
  %t25 = load i1, ptr %acc
  store i1 %t25, ptr %ptr_Err
  %t26 = load i32, ptr %ptr_CTU_1_CV
  store i32 %t26, ptr %int_acc
  %t27 = load i32, ptr %int_acc
  store i32 %t27, ptr %ptr_LimitOverCount
  %t28 = load i1, ptr %ptr_TP2_Q
  %t29 = xor i1 %t28, true
  store i1 %t29, ptr %acc
  %t30 = load i1, ptr %acc
  store i1 %t30, ptr %ptr_TP_1_IN
  store i32 1000, ptr %int_acc
  %t31 = load i32, ptr %int_acc
  store i32 %t31, ptr %ptr_TP_1_PT
  call void @tp_step(ptr %ptr_TP_1_IN, ptr %ptr_TP_1_PT, ptr %ptr_TP_1_Q, ptr %ptr_TP_1__elapsed, ptr %ptr_TP_1__running)
  %t32 = load i1, ptr %ptr_TP_1_Q
  store i1 %t32, ptr %acc
  %t33 = load i1, ptr %acc
  store i1 %t33, ptr %ptr_TP1_Q
  %t34 = load i1, ptr %ptr_TP_1_Q
  %t35 = xor i1 %t34, true
  store i1 %t35, ptr %acc
  %t36 = load i1, ptr %acc
  store i1 %t36, ptr %ptr_TP_2_IN
  store i32 1000, ptr %int_acc
  %t37 = load i32, ptr %int_acc
  store i32 %t37, ptr %ptr_TP_2_PT
  call void @tp_step(ptr %ptr_TP_2_IN, ptr %ptr_TP_2_PT, ptr %ptr_TP_2_Q, ptr %ptr_TP_2__elapsed, ptr %ptr_TP_2__running)
  %t38 = load i1, ptr %ptr_TP_2_Q
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