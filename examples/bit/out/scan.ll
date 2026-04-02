; llil: IL -> LLVM IR (LD/LDN/AND/ANDN/OR/ORN/ST/STN/S/R, ADD/GT/GE, CTU/TP/TON/R_TRIG/F_TRIG, .Xn) memory=rtedge
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc"
declare i8 @Rtedge_TagCreateByInstruction(ptr, i8)
declare void @il_rtedge_registry_clear()
declare void @il_rtedge_registry_record_binding(ptr, ptr)
declare void @IlRtedge_BindTonPinSlot(ptr, ptr, i32)
@il_mem_dw1 = global i32 0, align 4
@il_slot_dw1 = global ptr null, align 4
@il_mem_dw2 = global i32 0, align 4
@il_slot_dw2 = global ptr null, align 4
@il_mem_dw3 = global i32 0, align 4
@il_slot_dw3 = global ptr null, align 4
@il_spec_dw1 = private unnamed_addr constant [10 x i8] c"DWORD#dw1\00"
@il_spec_dw2 = private unnamed_addr constant [10 x i8] c"DWORD#dw2\00"
@il_spec_dw3 = private unnamed_addr constant [10 x i8] c"DWORD#dw3\00"
define void @scan_slots_init() {
entry:
  call void @il_rtedge_registry_clear()
  ; rtedge: FUNCTION セグメント → FB ピンは Eg Entry+offset → il_slot（IlRtedge_BindTonPinSlot）→ スカラータグ
  ; FB: PLCP Structure_CreateCatalog 相当 — EgTagGetProperty(inst,Entry)→pSegment + offset
  %spec_dw1 = getelementptr inbounds [10 x i8], ptr @il_spec_dw1, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_dw1, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_dw1, ptr @il_slot_dw1)
  %spec_dw2 = getelementptr inbounds [10 x i8], ptr @il_spec_dw2, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_dw2, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_dw2, ptr @il_slot_dw2)
  %spec_dw3 = getelementptr inbounds [10 x i8], ptr @il_spec_dw3, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_dw3, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_dw3, ptr @il_slot_dw3)
  ; フォールバック: Entry バインド前は il_mem を指す（FB ピンは上で Entry+offset 済み）。
  store ptr @il_mem_dw1, ptr @il_slot_dw1
  store ptr @il_mem_dw2, ptr @il_slot_dw2
  store ptr @il_mem_dw3, ptr @il_slot_dw3
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
define i32 @scan() {
entry:
  %acc = alloca i1
  store i1 false, ptr %acc
  %int_acc = alloca i32
  store i32 0, ptr %int_acc
  %t2 = load ptr, ptr @il_slot_dw1
  %t1 = load i32, ptr %t2
  %t3 = lshr i32 %t1, 1
  %t4 = and i32 %t3, 1
  %t5 = icmp ne i32 %t4, 0
  store i1 %t5, ptr %acc
  %t6 = load i1, ptr %acc
  %t8 = load ptr, ptr @il_slot_dw2
  %t7 = load i32, ptr %t8
  %t9 = lshr i32 %t7, 1
  %t10 = and i32 %t9, 1
  %t11 = icmp ne i32 %t10, 0
  %t12 = and i1 %t6, %t11
  store i1 %t12, ptr %acc
  %t13 = load ptr, ptr @il_slot_dw3
  %t14 = load i1, ptr %acc
  %t15 = load i32, ptr %t13
  %t16 = shl i32 1, 8
  %t17 = xor i32 %t16, -1
  %t18 = and i32 %t15, %t17
  %t19 = zext i1 %t14 to i32
  %t20 = shl i32 %t19, 8
  %t21 = or i32 %t18, %t20
  store i32 %t21, ptr %t13
  ret i32 0
}