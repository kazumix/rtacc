; llil: IL -> LLVM IR (LD/LDN/AND/ANDN/OR/ORN/ST/STN/S/R, ADD/GT/GE, CTU/TP/TON/R_TRIG/F_TRIG, .Xn) memory=stack
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc"
@il_mem_NOT1 = global i1 false, align 1
@il_slot_NOT1 = global ptr @il_mem_NOT1, align 4
@il_mem_patturn6_1 = global i1 false, align 1
@il_slot_patturn6_1 = global ptr @il_mem_patturn6_1, align 4
@il_mem_FALSE = global i1 false, align 1
@il_slot_FALSE = global ptr @il_mem_FALSE, align 4
@il_mem_TRUE = global i32 0, align 4
@il_slot_TRUE = global ptr @il_mem_TRUE, align 4
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
define void @ton_step(ptr %in, ptr %pt, ptr %et, ptr %q, ptr %prev_in) {
entry:
  %iv = load i1, ptr %in
  br i1 %iv, label %ton_in_on, label %ton_in_off

ton_in_off:
  store i32 0, ptr %et
  store i1 false, ptr %q
  store i1 false, ptr %prev_in
  ret void

ton_in_on:
  %pv = load i1, ptr %prev_in
  %pv_n = xor i1 %pv, true
  %rise = and i1 %iv, %pv_n
  br i1 %rise, label %ton_rise, label %ton_hold

ton_rise:
  store i32 0, ptr %et
  store i1 false, ptr %q
  store i1 true, ptr %prev_in
  ret void

ton_hold:
  %pt_val = load i32, ptr %pt
  %et_old = load i32, ptr %et
  %et_inc = add i32 %et_old, 1
  %below_pt = icmp slt i32 %et_inc, %pt_val
  %et_new = select i1 %below_pt, i32 %et_inc, i32 %pt_val
  store i32 %et_new, ptr %et
  %q_val = icmp sge i32 %et_new, %pt_val
  store i1 %q_val, ptr %q
  store i1 true, ptr %prev_in
  ret void
}
define void @r_trig_step(ptr %clk, ptr %q, ptr %prev_clk) {
entry:
  %clk_v = load i1, ptr %clk
  %prev_v = load i1, ptr %prev_clk
  %prev_not = xor i1 %prev_v, true
  %rise = and i1 %clk_v, %prev_not
  store i1 %rise, ptr %q
  store i1 %clk_v, ptr %prev_clk
  ret void
}
define void @f_trig_step(ptr %clk, ptr %q, ptr %prev_clk) {
entry:
  %clk_v = load i1, ptr %clk
  %prev_v = load i1, ptr %prev_clk
  %clk_not = xor i1 %clk_v, true
  %fall = and i1 %clk_not, %prev_v
  store i1 %fall, ptr %q
  store i1 %clk_v, ptr %prev_clk
  ret void
}
define i32 @EQtest() {
entry:
  %acc = alloca i1
  store i1 false, ptr %acc
  %int_acc = alloca i32
  store i32 0, ptr %int_acc
  %t1 = load i1, ptr @il_mem_FALSE
  %t2 = xor i1 %t1, true
  store i1 %t2, ptr %acc
  %t3 = load i1, ptr %acc
  %t4 = load i1, ptr @il_mem_FALSE
  %t5 = xor i1 %t4, true
  %t6 = or i1 %t3, %t5
  store i1 %t6, ptr %acc
  %t7 = load i1, ptr %acc
  store i1 %t7, ptr @il_mem_NOT1
  %t8 = load i32, ptr %int_acc
  %t9 = load i32, ptr @il_mem_TRUE
  %t10 = icmp eq i32 %t8, %t9
  store i1 %t10, ptr %acc
  %t11 = load i1, ptr %acc
  store i1 %t11, ptr @il_mem_patturn6_1
  ret i32 0
}