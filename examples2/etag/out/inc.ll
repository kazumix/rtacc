; llil: IL -> LLVM IR (LD/LDN/AND/ANDN/OR/ORN/ST/STN/S/R, ADD/GT/GE, CTU/TP/TON/R_TRIG/F_TRIG, .Xn) memory=rtedge
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc"
declare i8 @Rtedge_TagCreateByInstruction(ptr, i8)
declare void @il_rtedge_registry_clear()
declare void @il_rtedge_registry_record_binding(ptr, ptr)
declare void @IlRtedge_BindTonPinSlot(ptr, ptr, i32)
@il_mem_MOI = global i32 0, align 4
@il_slot_MOI = global ptr null, align 4
@il_spec_MOI = private unnamed_addr constant [10 x i8] c"DWORD#MOI\00"
define void @inc_slots_init() {
entry:
  call void @il_rtedge_registry_clear()
  ; rtedge: FUNCTION セグメント → FB ピンは Eg Entry+offset → il_slot（IlRtedge_BindTonPinSlot）→ スカラータグ
  ; FB: PLCP Structure_CreateCatalog 相当 — EgTagGetProperty(inst,Entry)→pSegment + offset
  %spec_MOI = getelementptr inbounds [10 x i8], ptr @il_spec_MOI, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_MOI, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_MOI, ptr @il_slot_MOI)
  ; フォールバック: Entry バインド前は il_mem を指す（FB ピンは上で Entry+offset 済み）。
  store ptr @il_mem_MOI, ptr @il_slot_MOI
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
define i32 @inc() {
entry:
  %acc = alloca i1
  store i1 false, ptr %acc
  %int_acc = alloca i32
  store i32 0, ptr %int_acc
  %t1 = load ptr, ptr @il_slot_MOI
  %t2 = load i32, ptr %t1
  store i32 %t2, ptr %int_acc
  %t3 = load i32, ptr %int_acc
  %t4 = add i32 %t3, 1
  store i32 %t4, ptr %int_acc
  %t5 = load ptr, ptr @il_slot_MOI
  %t6 = load i32, ptr %int_acc
  store i32 %t6, ptr %t5
  ret i32 0
}