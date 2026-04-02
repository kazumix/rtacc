; llil: IL -> LLVM IR (LD/LDN/AND/ANDN/OR/ORN/ST/STN/S/R, ADD/GT/GE, CTU/TP/TON/R_TRIG/F_TRIG, .Xn) memory=rtedge
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc"
declare i8 @Rtedge_TagCreateByInstruction(ptr, i8)
declare void @il_rtedge_registry_clear()
declare void @il_rtedge_registry_record_binding(ptr, ptr)
declare void @IlRtedge_BindTonPinSlot(ptr, ptr, i32)
@il_mem_ILT_Enable = global i1 false, align 1
@il_slot_ILT_Enable = global ptr null, align 4
@il_mem_ILT_LampOut = global i1 false, align 1
@il_slot_ILT_LampOut = global ptr null, align 4
@il_mem_ILT_EtMon1 = global i32 0, align 4
@il_slot_ILT_EtMon1 = global ptr null, align 4
@il_mem_ILT_EtMon2 = global i32 0, align 4
@il_slot_ILT_EtMon2 = global ptr null, align 4
@il_mem_TON_1_EN = global i1 false, align 1
@il_slot_TON_1_EN = global ptr null, align 4
@il_mem_TON_1_IN = global i1 false, align 1
@il_slot_TON_1_IN = global ptr null, align 4
@il_mem_TON_1_PT = global i32 0, align 4
@il_slot_TON_1_PT = global ptr null, align 4
@il_mem_TON_1_ET = global i32 0, align 4
@il_slot_TON_1_ET = global ptr null, align 4
@il_mem_TON_1_Q = global i1 false, align 1
@il_slot_TON_1_Q = global ptr null, align 4
@il_mem_TON_1__IN_ = global i1 false, align 1
@il_slot_TON_1__IN_ = global ptr null, align 4
@il_mem_TON_2_EN = global i1 false, align 1
@il_slot_TON_2_EN = global ptr null, align 4
@il_mem_TON_2_IN = global i1 false, align 1
@il_slot_TON_2_IN = global ptr null, align 4
@il_mem_TON_2_PT = global i32 0, align 4
@il_slot_TON_2_PT = global ptr null, align 4
@il_mem_TON_2_ET = global i32 0, align 4
@il_slot_TON_2_ET = global ptr null, align 4
@il_mem_TON_2_Q = global i1 false, align 1
@il_slot_TON_2_Q = global ptr null, align 4
@il_mem_TON_2__IN_ = global i1 false, align 1
@il_slot_TON_2__IN_ = global ptr null, align 4
@il_mem_ADD_1_EN = global i1 false, align 1
@il_slot_ADD_1_EN = global ptr null, align 4
@il_mem_ADD_1_IN1 = global i32 0, align 4
@il_slot_ADD_1_IN1 = global ptr null, align 4
@il_mem_ADD_1_IN2 = global i32 0, align 4
@il_slot_ADD_1_IN2 = global ptr null, align 4
@il_mem_ADD_1_ENO = global i1 false, align 1
@il_slot_ADD_1_ENO = global ptr null, align 4
@il_mem_ADD_1_OUT = global i32 0, align 4
@il_slot_ADD_1_OUT = global ptr null, align 4
@il_spec_fbseg_TON_1 = private unnamed_addr constant [19 x i8] c"FUNCTION#TON#TON_1\00"
@il_spec_fbseg_TON_2 = private unnamed_addr constant [19 x i8] c"FUNCTION#TON#TON_2\00"
@il_spec_fbseg_ADD_1 = private unnamed_addr constant [19 x i8] c"FUNCTION#ADD#ADD_1\00"
@il_fb_z_ADD_1 = private unnamed_addr constant [6 x i8] c"ADD_1\00"
@il_fb_z_TON_1 = private unnamed_addr constant [6 x i8] c"TON_1\00"
@il_fb_z_TON_2 = private unnamed_addr constant [6 x i8] c"TON_2\00"
@il_spec_ILT_Enable = private unnamed_addr constant [16 x i8] c"BOOL#ILT_Enable\00"
@il_spec_ILT_LampOut = private unnamed_addr constant [17 x i8] c"BOOL#ILT_LampOut\00"
@il_spec_ILT_EtMon1 = private unnamed_addr constant [16 x i8] c"UINT#ILT_EtMon1\00"
@il_spec_ILT_EtMon2 = private unnamed_addr constant [16 x i8] c"UINT#ILT_EtMon2\00"
define void @scan_slots_init() {
entry:
  call void @il_rtedge_registry_clear()
  ; rtedge: FUNCTION セグメント → FB ピンは Eg Entry+offset → il_slot（IlRtedge_BindTonPinSlot）→ スカラータグ
  %spec_fbseg_TON_1 = getelementptr inbounds [19 x i8], ptr @il_spec_fbseg_TON_1, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_fbseg_TON_1, i8 0)
  %spec_fbseg_TON_2 = getelementptr inbounds [19 x i8], ptr @il_spec_fbseg_TON_2, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_fbseg_TON_2, i8 0)
  %spec_fbseg_ADD_1 = getelementptr inbounds [19 x i8], ptr @il_spec_fbseg_ADD_1, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_fbseg_ADD_1, i8 0)
  ; FB: PLCP Structure_CreateCatalog 相当 — EgTagGetProperty(inst,Entry)→pSegment + offset
  %fbp_TON_1_EN = getelementptr inbounds [6 x i8], ptr @il_fb_z_TON_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TON_1_EN, ptr %fbp_TON_1_EN, i32 0)
  %fbp_TON_1_IN = getelementptr inbounds [6 x i8], ptr @il_fb_z_TON_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TON_1_IN, ptr %fbp_TON_1_IN, i32 1)
  %fbp_TON_1_PT = getelementptr inbounds [6 x i8], ptr @il_fb_z_TON_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TON_1_PT, ptr %fbp_TON_1_PT, i32 4)
  %fbp_TON_1_ET = getelementptr inbounds [6 x i8], ptr @il_fb_z_TON_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TON_1_ET, ptr %fbp_TON_1_ET, i32 8)
  %fbp_TON_1_Q = getelementptr inbounds [6 x i8], ptr @il_fb_z_TON_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TON_1_Q, ptr %fbp_TON_1_Q, i32 12)
  %fbp_TON_1__IN_ = getelementptr inbounds [6 x i8], ptr @il_fb_z_TON_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TON_1__IN_, ptr %fbp_TON_1__IN_, i32 13)
  %fbp_TON_2_EN = getelementptr inbounds [6 x i8], ptr @il_fb_z_TON_2, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TON_2_EN, ptr %fbp_TON_2_EN, i32 0)
  %fbp_TON_2_IN = getelementptr inbounds [6 x i8], ptr @il_fb_z_TON_2, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TON_2_IN, ptr %fbp_TON_2_IN, i32 1)
  %fbp_TON_2_PT = getelementptr inbounds [6 x i8], ptr @il_fb_z_TON_2, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TON_2_PT, ptr %fbp_TON_2_PT, i32 4)
  %fbp_TON_2_ET = getelementptr inbounds [6 x i8], ptr @il_fb_z_TON_2, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TON_2_ET, ptr %fbp_TON_2_ET, i32 8)
  %fbp_TON_2_Q = getelementptr inbounds [6 x i8], ptr @il_fb_z_TON_2, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TON_2_Q, ptr %fbp_TON_2_Q, i32 12)
  %fbp_TON_2__IN_ = getelementptr inbounds [6 x i8], ptr @il_fb_z_TON_2, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TON_2__IN_, ptr %fbp_TON_2__IN_, i32 13)
  %fbp_ADD_1_EN = getelementptr inbounds [6 x i8], ptr @il_fb_z_ADD_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_ADD_1_EN, ptr %fbp_ADD_1_EN, i32 0)
  %fbp_ADD_1_IN1 = getelementptr inbounds [6 x i8], ptr @il_fb_z_ADD_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_ADD_1_IN1, ptr %fbp_ADD_1_IN1, i32 1)
  %fbp_ADD_1_IN2 = getelementptr inbounds [6 x i8], ptr @il_fb_z_ADD_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_ADD_1_IN2, ptr %fbp_ADD_1_IN2, i32 5)
  %fbp_ADD_1_ENO = getelementptr inbounds [6 x i8], ptr @il_fb_z_ADD_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_ADD_1_ENO, ptr %fbp_ADD_1_ENO, i32 9)
  %fbp_ADD_1_OUT = getelementptr inbounds [6 x i8], ptr @il_fb_z_ADD_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_ADD_1_OUT, ptr %fbp_ADD_1_OUT, i32 10)
  %spec_ILT_Enable = getelementptr inbounds [16 x i8], ptr @il_spec_ILT_Enable, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_ILT_Enable, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_ILT_Enable, ptr @il_slot_ILT_Enable)
  %spec_ILT_LampOut = getelementptr inbounds [17 x i8], ptr @il_spec_ILT_LampOut, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_ILT_LampOut, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_ILT_LampOut, ptr @il_slot_ILT_LampOut)
  %spec_ILT_EtMon1 = getelementptr inbounds [16 x i8], ptr @il_spec_ILT_EtMon1, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_ILT_EtMon1, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_ILT_EtMon1, ptr @il_slot_ILT_EtMon1)
  %spec_ILT_EtMon2 = getelementptr inbounds [16 x i8], ptr @il_spec_ILT_EtMon2, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_ILT_EtMon2, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_ILT_EtMon2, ptr @il_slot_ILT_EtMon2)
  ; フォールバック: Entry バインド前は il_mem を指す（FB ピンは上で Entry+offset 済み）。
  store ptr @il_mem_ILT_Enable, ptr @il_slot_ILT_Enable
  store ptr @il_mem_ILT_LampOut, ptr @il_slot_ILT_LampOut
  store ptr @il_mem_ILT_EtMon1, ptr @il_slot_ILT_EtMon1
  store ptr @il_mem_ILT_EtMon2, ptr @il_slot_ILT_EtMon2
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
  %t1 = load ptr, ptr @il_slot_ILT_Enable
  %t2 = load i1, ptr %t1
  store i1 %t2, ptr %acc
  %t3 = load ptr, ptr @il_slot_TON_1_EN
  %t4 = load i1, ptr %acc
  store i1 %t4, ptr %t3
  %t5 = load ptr, ptr @il_slot_ILT_LampOut
  %t6 = load i1, ptr %t5
  %t7 = xor i1 %t6, true
  store i1 %t7, ptr %acc
  %t8 = load i1, ptr %acc
  %t9 = load ptr, ptr @il_slot_TON_1_EN
  %t10 = load i1, ptr %t9
  %t11 = and i1 %t8, %t10
  store i1 %t11, ptr %acc
  %t12 = load ptr, ptr @il_slot_TON_1_IN
  %t13 = load i1, ptr %acc
  store i1 %t13, ptr %t12
  store i32 10, ptr %int_acc
  %t14 = load ptr, ptr @il_slot_TON_1_PT
  %t15 = load i32, ptr %int_acc
  store i32 %t15, ptr %t14
  %t16 = load ptr, ptr @il_slot_TON_1_IN
  %t17 = load ptr, ptr @il_slot_TON_1_PT
  %t18 = load ptr, ptr @il_slot_TON_1_ET
  %t19 = load ptr, ptr @il_slot_TON_1_Q
  %t20 = load ptr, ptr @il_slot_TON_1__IN_
  call void @ton_step(ptr %t16, ptr %t17, ptr %t18, ptr %t19, ptr %t20)
  %t21 = load ptr, ptr @il_slot_TON_1_ET
  %t22 = load i32, ptr %t21
  store i32 %t22, ptr %int_acc
  %t23 = load ptr, ptr @il_slot_ILT_EtMon1
  %t24 = load i32, ptr %int_acc
  store i32 %t24, ptr %t23
  %t25 = load ptr, ptr @il_slot_TON_1_Q
  %t26 = load i1, ptr %t25
  store i1 %t26, ptr %acc
  %t27 = load ptr, ptr @il_slot_ILT_LampOut
  %t28 = load i1, ptr %acc
  %t29 = load i1, ptr %t27
  %t30 = select i1 %t28, i1 true, i1 %t29
  store i1 %t30, ptr %t27
  %t31 = load ptr, ptr @il_slot_ILT_Enable
  %t32 = load i1, ptr %t31
  store i1 %t32, ptr %acc
  %t33 = load ptr, ptr @il_slot_TON_2_EN
  %t34 = load i1, ptr %acc
  store i1 %t34, ptr %t33
  %t35 = load ptr, ptr @il_slot_ILT_LampOut
  %t36 = load i1, ptr %t35
  store i1 %t36, ptr %acc
  %t37 = load i1, ptr %acc
  %t38 = load ptr, ptr @il_slot_TON_2_EN
  %t39 = load i1, ptr %t38
  %t40 = and i1 %t37, %t39
  store i1 %t40, ptr %acc
  %t41 = load ptr, ptr @il_slot_TON_2_IN
  %t42 = load i1, ptr %acc
  store i1 %t42, ptr %t41
  store i32 10, ptr %int_acc
  %t43 = load ptr, ptr @il_slot_TON_2_PT
  %t44 = load i32, ptr %int_acc
  store i32 %t44, ptr %t43
  %t45 = load ptr, ptr @il_slot_TON_2_IN
  %t46 = load ptr, ptr @il_slot_TON_2_PT
  %t47 = load ptr, ptr @il_slot_TON_2_ET
  %t48 = load ptr, ptr @il_slot_TON_2_Q
  %t49 = load ptr, ptr @il_slot_TON_2__IN_
  call void @ton_step(ptr %t45, ptr %t46, ptr %t47, ptr %t48, ptr %t49)
  %t50 = load ptr, ptr @il_slot_TON_2_ET
  %t51 = load i32, ptr %t50
  store i32 %t51, ptr %int_acc
  %t52 = load ptr, ptr @il_slot_ILT_EtMon2
  %t53 = load i32, ptr %int_acc
  store i32 %t53, ptr %t52
  %t54 = load ptr, ptr @il_slot_TON_2_Q
  %t55 = load i1, ptr %t54
  store i1 %t55, ptr %acc
  %t56 = load ptr, ptr @il_slot_ILT_LampOut
  %t57 = load i1, ptr %acc
  %t58 = load i1, ptr %t56
  %t59 = select i1 %t57, i1 false, i1 %t58
  store i1 %t59, ptr %t56
  %t60 = load ptr, ptr @il_slot_ILT_Enable
  %t61 = load i1, ptr %t60
  store i1 %t61, ptr %acc
  %t62 = load ptr, ptr @il_slot_ADD_1_EN
  %t63 = load i1, ptr %acc
  store i1 %t63, ptr %t62
  store i32 1, ptr %int_acc
  %t64 = load ptr, ptr @il_slot_ADD_1_IN1
  %t65 = load i32, ptr %int_acc
  store i32 %t65, ptr %t64
  store i32 2, ptr %int_acc
  %t66 = load ptr, ptr @il_slot_ADD_1_IN2
  %t67 = load i32, ptr %int_acc
  store i32 %t67, ptr %t66
  %t68 = load ptr, ptr @il_slot_ADD_1_IN1
  %t69 = load ptr, ptr @il_slot_ADD_1_IN1
  %t70 = load i32, ptr %t69
  %t71 = load ptr, ptr @il_slot_ADD_1_IN2
  %t72 = load ptr, ptr @il_slot_ADD_1_IN2
  %t73 = load i32, ptr %t72
  %t74 = add i32 %t70, %t73
  %t75 = load ptr, ptr @il_slot_ADD_1_OUT
  store i32 %t74, ptr %t75
  ret i32 0
}