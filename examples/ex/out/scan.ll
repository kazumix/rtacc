; llil: IL -> LLVM IR (BOOL/INT/UINT/TIME, ADD/GT/GE, CTU/TP) memory=rtedge
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc"
@il_mem_SW1 = global i1 false, align 1
@il_slot_SW1 = global ptr null, align 4
@il_mem_SW2 = global i1 false, align 1
@il_slot_SW2 = global ptr null, align 4
@il_mem_ANS = global i32 0, align 4
@il_slot_ANS = global ptr null, align 4
@il_mem_CycleMs = global i32 0, align 4
@il_slot_CycleMs = global ptr null, align 4
@il_mem_Sub100 = global i32 0, align 4
@il_slot_Sub100 = global ptr null, align 4
@il_mem_R = global i1 false, align 1
@il_slot_R = global ptr null, align 4
@il_mem_Cm1 = global i32 0, align 4
@il_slot_Cm1 = global ptr null, align 4
@il_mem_G10 = global i1 false, align 1
@il_slot_G10 = global ptr null, align 4
@il_mem_Sb_inc = global i32 0, align 4
@il_slot_Sb_inc = global ptr null, align 4
@il_mem_Sb_ge = global i1 false, align 1
@il_slot_Sb_ge = global ptr null, align 4
@il_mem_AnsP1 = global i32 0, align 4
@il_slot_AnsP1 = global ptr null, align 4
@il_mem_Ans_mid = global i32 0, align 4
@il_slot_Ans_mid = global ptr null, align 4
@il_mem_Ans_mid2 = global i32 0, align 4
@il_slot_Ans_mid2 = global ptr null, align 4
@il_mem_tmpSb = global i32 0, align 4
@il_slot_tmpSb = global ptr null, align 4
@il_mem_tmpSb2 = global i32 0, align 4
@il_slot_tmpSb2 = global ptr null, align 4
define void @scan_slots_init() {
entry:
  ; rtedge: 将来はタグ解決。当面は stack と同じく @il_mem_* を指して動作させる。
  store ptr @il_mem_SW1, ptr @il_slot_SW1
  store ptr @il_mem_SW2, ptr @il_slot_SW2
  store ptr @il_mem_ANS, ptr @il_slot_ANS
  store ptr @il_mem_CycleMs, ptr @il_slot_CycleMs
  store ptr @il_mem_Sub100, ptr @il_slot_Sub100
  store ptr @il_mem_R, ptr @il_slot_R
  store ptr @il_mem_Cm1, ptr @il_slot_Cm1
  store ptr @il_mem_G10, ptr @il_slot_G10
  store ptr @il_mem_Sb_inc, ptr @il_slot_Sb_inc
  store ptr @il_mem_Sb_ge, ptr @il_slot_Sb_ge
  store ptr @il_mem_AnsP1, ptr @il_slot_AnsP1
  store ptr @il_mem_Ans_mid, ptr @il_slot_Ans_mid
  store ptr @il_mem_Ans_mid2, ptr @il_slot_Ans_mid2
  store ptr @il_mem_tmpSb, ptr @il_slot_tmpSb
  store ptr @il_mem_tmpSb2, ptr @il_slot_tmpSb2
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
define i32 @scan() {
entry:
  %ptr_SW1 = load ptr, ptr @il_slot_SW1
  %ptr_SW2 = load ptr, ptr @il_slot_SW2
  %ptr_ANS = load ptr, ptr @il_slot_ANS
  %ptr_CycleMs = load ptr, ptr @il_slot_CycleMs
  %ptr_Sub100 = load ptr, ptr @il_slot_Sub100
  %ptr_R = load ptr, ptr @il_slot_R
  %ptr_Cm1 = load ptr, ptr @il_slot_Cm1
  %ptr_G10 = load ptr, ptr @il_slot_G10
  %ptr_Sb_inc = load ptr, ptr @il_slot_Sb_inc
  %ptr_Sb_ge = load ptr, ptr @il_slot_Sb_ge
  %ptr_AnsP1 = load ptr, ptr @il_slot_AnsP1
  %ptr_Ans_mid = load ptr, ptr @il_slot_Ans_mid
  %ptr_Ans_mid2 = load ptr, ptr @il_slot_Ans_mid2
  %ptr_tmpSb = load ptr, ptr @il_slot_tmpSb
  %ptr_tmpSb2 = load ptr, ptr @il_slot_tmpSb2
  %acc = alloca i1
  store i1 false, ptr %acc
  %int_acc = alloca i32
  store i32 0, ptr %int_acc
  %t1 = load i1, ptr %ptr_SW1
  store i1 %t1, ptr %acc
  %t2 = load i1, ptr %acc
  %t3 = load i1, ptr %ptr_SW2
  %t4 = and i1 %t2, %t3
  store i1 %t4, ptr %acc
  %t5 = load i1, ptr %acc
  store i1 %t5, ptr %ptr_R
  %t6 = load i32, ptr %ptr_CycleMs
  store i32 %t6, ptr %int_acc
  %t7 = load i32, ptr %int_acc
  %t8 = add i32 %t7, 1
  store i32 %t8, ptr %int_acc
  %t9 = load i32, ptr %int_acc
  store i32 %t9, ptr %ptr_Cm1
  %t10 = load i1, ptr %ptr_R
  %t11 = load i32, ptr %ptr_Cm1
  %t12 = select i1 %t10, i32 %t11, i32 0
  store i32 %t12, ptr %ptr_CycleMs
  %t13 = load i32, ptr %ptr_CycleMs
  store i32 %t13, ptr %int_acc
  %t14 = load i32, ptr %int_acc
  %t15 = icmp uge i32 %t14, 10000
  store i1 %t15, ptr %acc
  %t16 = load i1, ptr %acc
  store i1 %t16, ptr %ptr_G10
  %t17 = load i1, ptr %ptr_G10
  %t18 = load i32, ptr %ptr_CycleMs
  %t19 = select i1 %t17, i32 0, i32 %t18
  store i32 %t19, ptr %ptr_CycleMs
  %t20 = load i32, ptr %ptr_Sub100
  store i32 %t20, ptr %int_acc
  %t21 = load i32, ptr %int_acc
  %t22 = add i32 %t21, 1
  store i32 %t22, ptr %int_acc
  %t23 = load i32, ptr %int_acc
  store i32 %t23, ptr %ptr_Sb_inc
  %t24 = load i32, ptr %ptr_Sb_inc
  store i32 %t24, ptr %int_acc
  %t25 = load i32, ptr %int_acc
  %t26 = icmp uge i32 %t25, 100
  store i1 %t26, ptr %acc
  %t27 = load i1, ptr %acc
  store i1 %t27, ptr %ptr_Sb_ge
  %t28 = load i1, ptr %ptr_Sb_ge
  %t29 = load i32, ptr %ptr_Sb_inc
  %t30 = select i1 %t28, i32 0, i32 %t29
  store i32 %t30, ptr %ptr_tmpSb
  %t31 = load i1, ptr %ptr_G10
  %t32 = load i32, ptr %ptr_tmpSb
  %t33 = select i1 %t31, i32 0, i32 %t32
  store i32 %t33, ptr %ptr_tmpSb2
  %t34 = load i1, ptr %ptr_R
  %t35 = load i32, ptr %ptr_tmpSb2
  %t36 = select i1 %t34, i32 %t35, i32 0
  store i32 %t36, ptr %ptr_Sub100
  %t37 = load i32, ptr %ptr_ANS
  store i32 %t37, ptr %int_acc
  %t38 = load i32, ptr %int_acc
  %t39 = add i32 %t38, 1
  store i32 %t39, ptr %int_acc
  %t40 = load i32, ptr %int_acc
  store i32 %t40, ptr %ptr_AnsP1
  %t41 = load i1, ptr %ptr_Sb_ge
  %t42 = load i32, ptr %ptr_AnsP1
  %t43 = load i32, ptr %ptr_ANS
  %t44 = select i1 %t41, i32 %t42, i32 %t43
  store i32 %t44, ptr %ptr_Ans_mid
  %t45 = load i1, ptr %ptr_G10
  %t46 = load i32, ptr %ptr_Ans_mid
  %t47 = select i1 %t45, i32 0, i32 %t46
  store i32 %t47, ptr %ptr_Ans_mid2
  %t48 = load i1, ptr %ptr_R
  %t49 = load i32, ptr %ptr_Ans_mid2
  %t50 = select i1 %t48, i32 %t49, i32 0
  store i32 %t50, ptr %ptr_ANS
  ret i32 0
}