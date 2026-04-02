; llil: IL -> LLVM IR (LD/LDN/AND/ANDN/OR/ORN/ST/STN/S/R, ADD/GT/GE, CTU/TP/TON/R_TRIG/F_TRIG, .Xn) memory=rtedge
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc"
declare i8 @Rtedge_TagCreateByInstruction(ptr, i8)
declare void @il_rtedge_registry_clear()
declare void @il_rtedge_registry_record_binding(ptr, ptr)
declare void @IlRtedge_BindTonPinSlot(ptr, ptr, i32)
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
@il_mem_TP3_Q = global i1 false, align 1
@il_slot_TP3_Q = global ptr null, align 4
@il_mem_TP4_Q = global i1 false, align 1
@il_slot_TP4_Q = global ptr null, align 4
@il_mem_LED1 = global i1 false, align 1
@il_slot_LED1 = global ptr null, align 4
@il_mem_LED2 = global i1 false, align 1
@il_slot_LED2 = global ptr null, align 4
@il_mem_CTU_1_CU = global i1 false, align 1
@il_slot_CTU_1_CU = global ptr null, align 4
@il_mem_CTU_1_RESET = global i1 false, align 1
@il_slot_CTU_1_RESET = global ptr null, align 4
@il_mem_CTU_1_PV = global i32 0, align 4
@il_slot_CTU_1_PV = global ptr null, align 4
@il_mem_CTU_1_Q = global i1 false, align 1
@il_slot_CTU_1_Q = global ptr null, align 4
@il_mem_CTU_1_CV = global i32 0, align 4
@il_slot_CTU_1_CV = global ptr null, align 4
@il_mem_CTU_1__prev_cu = global i1 false, align 1
@il_slot_CTU_1__prev_cu = global ptr null, align 4
@il_mem_TP_1_EN = global i1 false, align 1
@il_slot_TP_1_EN = global ptr null, align 4
@il_mem_TP_1_IN = global i1 false, align 1
@il_slot_TP_1_IN = global ptr null, align 4
@il_mem_TP_1_PT = global i32 0, align 4
@il_slot_TP_1_PT = global ptr null, align 4
@il_mem_TP_1_ET = global i32 0, align 4
@il_slot_TP_1_ET = global ptr null, align 4
@il_mem_TP_1_Q = global i1 false, align 1
@il_slot_TP_1_Q = global ptr null, align 4
@il_mem_TP_1__IN_ = global i1 false, align 1
@il_slot_TP_1__IN_ = global ptr null, align 4
@il_mem_TP_2_EN = global i1 false, align 1
@il_slot_TP_2_EN = global ptr null, align 4
@il_mem_TP_2_IN = global i1 false, align 1
@il_slot_TP_2_IN = global ptr null, align 4
@il_mem_TP_2_PT = global i32 0, align 4
@il_slot_TP_2_PT = global ptr null, align 4
@il_mem_TP_2_ET = global i32 0, align 4
@il_slot_TP_2_ET = global ptr null, align 4
@il_mem_TP_2_Q = global i1 false, align 1
@il_slot_TP_2_Q = global ptr null, align 4
@il_mem_TP_2__IN_ = global i1 false, align 1
@il_slot_TP_2__IN_ = global ptr null, align 4
@il_mem_TP_3_EN = global i1 false, align 1
@il_slot_TP_3_EN = global ptr null, align 4
@il_mem_TP_3_IN = global i1 false, align 1
@il_slot_TP_3_IN = global ptr null, align 4
@il_mem_TP_3_PT = global i32 0, align 4
@il_slot_TP_3_PT = global ptr null, align 4
@il_mem_TP_3_ET = global i32 0, align 4
@il_slot_TP_3_ET = global ptr null, align 4
@il_mem_TP_3_Q = global i1 false, align 1
@il_slot_TP_3_Q = global ptr null, align 4
@il_mem_TP_3__IN_ = global i1 false, align 1
@il_slot_TP_3__IN_ = global ptr null, align 4
@il_mem_TP_4_EN = global i1 false, align 1
@il_slot_TP_4_EN = global ptr null, align 4
@il_mem_TP_4_IN = global i1 false, align 1
@il_slot_TP_4_IN = global ptr null, align 4
@il_mem_TP_4_PT = global i32 0, align 4
@il_slot_TP_4_PT = global ptr null, align 4
@il_mem_TP_4_ET = global i32 0, align 4
@il_slot_TP_4_ET = global ptr null, align 4
@il_mem_TP_4_Q = global i1 false, align 1
@il_slot_TP_4_Q = global ptr null, align 4
@il_mem_TP_4__IN_ = global i1 false, align 1
@il_slot_TP_4__IN_ = global ptr null, align 4
@il_mem_TP_1__elapsed = global i32 0, align 4
@il_slot_TP_1__elapsed = global ptr null, align 4
@il_mem_TP_1__running = global i1 false, align 1
@il_slot_TP_1__running = global ptr null, align 4
@il_mem_TP_2__elapsed = global i32 0, align 4
@il_slot_TP_2__elapsed = global ptr null, align 4
@il_mem_TP_2__running = global i1 false, align 1
@il_slot_TP_2__running = global ptr null, align 4
@il_mem_TP_3__elapsed = global i32 0, align 4
@il_slot_TP_3__elapsed = global ptr null, align 4
@il_mem_TP_3__running = global i1 false, align 1
@il_slot_TP_3__running = global ptr null, align 4
@il_mem_TP_4__elapsed = global i32 0, align 4
@il_slot_TP_4__elapsed = global ptr null, align 4
@il_mem_TP_4__running = global i1 false, align 1
@il_slot_TP_4__running = global ptr null, align 4
@il_spec_fbseg_CTU_1 = private unnamed_addr constant [19 x i8] c"FUNCTION#CTU#CTU_1\00"
@il_spec_fbseg_TP_1 = private unnamed_addr constant [17 x i8] c"FUNCTION#TP#TP_1\00"
@il_spec_fbseg_TP_2 = private unnamed_addr constant [17 x i8] c"FUNCTION#TP#TP_2\00"
@il_spec_fbseg_TP_3 = private unnamed_addr constant [17 x i8] c"FUNCTION#TP#TP_3\00"
@il_spec_fbseg_TP_4 = private unnamed_addr constant [17 x i8] c"FUNCTION#TP#TP_4\00"
@il_fb_z_CTU_1 = private unnamed_addr constant [6 x i8] c"CTU_1\00"
@il_fb_z_TP_1 = private unnamed_addr constant [5 x i8] c"TP_1\00"
@il_fb_z_TP_2 = private unnamed_addr constant [5 x i8] c"TP_2\00"
@il_fb_z_TP_3 = private unnamed_addr constant [5 x i8] c"TP_3\00"
@il_fb_z_TP_4 = private unnamed_addr constant [5 x i8] c"TP_4\00"
@il_spec_StartSW = private unnamed_addr constant [13 x i8] c"BOOL#StartSW\00"
@il_spec_EndSW = private unnamed_addr constant [11 x i8] c"BOOL#EndSW\00"
@il_spec_AI_1 = private unnamed_addr constant [10 x i8] c"UINT#AI_1\00"
@il_spec_Active = private unnamed_addr constant [12 x i8] c"BOOL#Active\00"
@il_spec_LimitOver = private unnamed_addr constant [15 x i8] c"BOOL#LimitOver\00"
@il_spec_LimitOverCount = private unnamed_addr constant [19 x i8] c"INT#LimitOverCount\00"
@il_spec_Err = private unnamed_addr constant [9 x i8] c"BOOL#Err\00"
@il_spec_TP1_Q = private unnamed_addr constant [11 x i8] c"BOOL#TP1_Q\00"
@il_spec_TP2_Q = private unnamed_addr constant [11 x i8] c"BOOL#TP2_Q\00"
@il_spec_TP3_Q = private unnamed_addr constant [11 x i8] c"BOOL#TP3_Q\00"
@il_spec_TP4_Q = private unnamed_addr constant [11 x i8] c"BOOL#TP4_Q\00"
@il_spec_LED1 = private unnamed_addr constant [10 x i8] c"BOOL#LED1\00"
@il_spec_LED2 = private unnamed_addr constant [10 x i8] c"BOOL#LED2\00"
@il_spec_TP_1__elapsed = private unnamed_addr constant [18 x i8] c"INT#TP_1._elapsed\00"
@il_spec_TP_1__running = private unnamed_addr constant [19 x i8] c"BOOL#TP_1._running\00"
@il_spec_TP_2__elapsed = private unnamed_addr constant [18 x i8] c"INT#TP_2._elapsed\00"
@il_spec_TP_2__running = private unnamed_addr constant [19 x i8] c"BOOL#TP_2._running\00"
@il_spec_TP_3__elapsed = private unnamed_addr constant [18 x i8] c"INT#TP_3._elapsed\00"
@il_spec_TP_3__running = private unnamed_addr constant [19 x i8] c"BOOL#TP_3._running\00"
@il_spec_TP_4__elapsed = private unnamed_addr constant [18 x i8] c"INT#TP_4._elapsed\00"
@il_spec_TP_4__running = private unnamed_addr constant [19 x i8] c"BOOL#TP_4._running\00"
define void @test_slots_init() {
entry:
  call void @il_rtedge_registry_clear()
  ; rtedge: FUNCTION セグメント → FB ピンは Eg Entry+offset → il_slot（IlRtedge_BindTonPinSlot）→ スカラータグ
  %spec_fbseg_CTU_1 = getelementptr inbounds [19 x i8], ptr @il_spec_fbseg_CTU_1, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_fbseg_CTU_1, i8 0)
  %spec_fbseg_TP_1 = getelementptr inbounds [17 x i8], ptr @il_spec_fbseg_TP_1, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_fbseg_TP_1, i8 0)
  %spec_fbseg_TP_2 = getelementptr inbounds [17 x i8], ptr @il_spec_fbseg_TP_2, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_fbseg_TP_2, i8 0)
  %spec_fbseg_TP_3 = getelementptr inbounds [17 x i8], ptr @il_spec_fbseg_TP_3, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_fbseg_TP_3, i8 0)
  %spec_fbseg_TP_4 = getelementptr inbounds [17 x i8], ptr @il_spec_fbseg_TP_4, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_fbseg_TP_4, i8 0)
  ; FB: PLCP Structure_CreateCatalog 相当 — EgTagGetProperty(inst,Entry)→pSegment + offset
  %fbp_CTU_1_CU = getelementptr inbounds [6 x i8], ptr @il_fb_z_CTU_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_CTU_1_CU, ptr %fbp_CTU_1_CU, i32 0)
  %fbp_CTU_1_RESET = getelementptr inbounds [6 x i8], ptr @il_fb_z_CTU_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_CTU_1_RESET, ptr %fbp_CTU_1_RESET, i32 1)
  %fbp_CTU_1_PV = getelementptr inbounds [6 x i8], ptr @il_fb_z_CTU_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_CTU_1_PV, ptr %fbp_CTU_1_PV, i32 2)
  %fbp_CTU_1_Q = getelementptr inbounds [6 x i8], ptr @il_fb_z_CTU_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_CTU_1_Q, ptr %fbp_CTU_1_Q, i32 4)
  %fbp_CTU_1_CV = getelementptr inbounds [6 x i8], ptr @il_fb_z_CTU_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_CTU_1_CV, ptr %fbp_CTU_1_CV, i32 5)
  %fbp_CTU_1__prev_cu = getelementptr inbounds [6 x i8], ptr @il_fb_z_CTU_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_CTU_1__prev_cu, ptr %fbp_CTU_1__prev_cu, i32 7)
  %fbp_TP_1_EN = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_1_EN, ptr %fbp_TP_1_EN, i32 0)
  %fbp_TP_1_IN = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_1_IN, ptr %fbp_TP_1_IN, i32 1)
  %fbp_TP_1_PT = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_1_PT, ptr %fbp_TP_1_PT, i32 4)
  %fbp_TP_1_ET = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_1_ET, ptr %fbp_TP_1_ET, i32 8)
  %fbp_TP_1_Q = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_1_Q, ptr %fbp_TP_1_Q, i32 12)
  %fbp_TP_1__IN_ = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_1, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_1__IN_, ptr %fbp_TP_1__IN_, i32 13)
  %fbp_TP_2_EN = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_2, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_2_EN, ptr %fbp_TP_2_EN, i32 0)
  %fbp_TP_2_IN = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_2, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_2_IN, ptr %fbp_TP_2_IN, i32 1)
  %fbp_TP_2_PT = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_2, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_2_PT, ptr %fbp_TP_2_PT, i32 4)
  %fbp_TP_2_ET = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_2, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_2_ET, ptr %fbp_TP_2_ET, i32 8)
  %fbp_TP_2_Q = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_2, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_2_Q, ptr %fbp_TP_2_Q, i32 12)
  %fbp_TP_2__IN_ = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_2, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_2__IN_, ptr %fbp_TP_2__IN_, i32 13)
  %fbp_TP_3_EN = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_3, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_3_EN, ptr %fbp_TP_3_EN, i32 0)
  %fbp_TP_3_IN = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_3, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_3_IN, ptr %fbp_TP_3_IN, i32 1)
  %fbp_TP_3_PT = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_3, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_3_PT, ptr %fbp_TP_3_PT, i32 4)
  %fbp_TP_3_ET = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_3, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_3_ET, ptr %fbp_TP_3_ET, i32 8)
  %fbp_TP_3_Q = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_3, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_3_Q, ptr %fbp_TP_3_Q, i32 12)
  %fbp_TP_3__IN_ = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_3, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_3__IN_, ptr %fbp_TP_3__IN_, i32 13)
  %fbp_TP_4_EN = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_4, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_4_EN, ptr %fbp_TP_4_EN, i32 0)
  %fbp_TP_4_IN = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_4, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_4_IN, ptr %fbp_TP_4_IN, i32 1)
  %fbp_TP_4_PT = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_4, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_4_PT, ptr %fbp_TP_4_PT, i32 4)
  %fbp_TP_4_ET = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_4, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_4_ET, ptr %fbp_TP_4_ET, i32 8)
  %fbp_TP_4_Q = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_4, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_4_Q, ptr %fbp_TP_4_Q, i32 12)
  %fbp_TP_4__IN_ = getelementptr inbounds [5 x i8], ptr @il_fb_z_TP_4, i32 0, i32 0
  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_TP_4__IN_, ptr %fbp_TP_4__IN_, i32 13)
  %spec_StartSW = getelementptr inbounds [13 x i8], ptr @il_spec_StartSW, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_StartSW, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_StartSW, ptr @il_slot_StartSW)
  %spec_EndSW = getelementptr inbounds [11 x i8], ptr @il_spec_EndSW, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_EndSW, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_EndSW, ptr @il_slot_EndSW)
  %spec_AI_1 = getelementptr inbounds [10 x i8], ptr @il_spec_AI_1, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_AI_1, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_AI_1, ptr @il_slot_AI_1)
  %spec_Active = getelementptr inbounds [12 x i8], ptr @il_spec_Active, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_Active, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_Active, ptr @il_slot_Active)
  %spec_LimitOver = getelementptr inbounds [15 x i8], ptr @il_spec_LimitOver, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_LimitOver, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_LimitOver, ptr @il_slot_LimitOver)
  %spec_LimitOverCount = getelementptr inbounds [19 x i8], ptr @il_spec_LimitOverCount, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_LimitOverCount, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_LimitOverCount, ptr @il_slot_LimitOverCount)
  %spec_Err = getelementptr inbounds [9 x i8], ptr @il_spec_Err, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_Err, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_Err, ptr @il_slot_Err)
  %spec_TP1_Q = getelementptr inbounds [11 x i8], ptr @il_spec_TP1_Q, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_TP1_Q, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_TP1_Q, ptr @il_slot_TP1_Q)
  %spec_TP2_Q = getelementptr inbounds [11 x i8], ptr @il_spec_TP2_Q, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_TP2_Q, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_TP2_Q, ptr @il_slot_TP2_Q)
  %spec_TP3_Q = getelementptr inbounds [11 x i8], ptr @il_spec_TP3_Q, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_TP3_Q, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_TP3_Q, ptr @il_slot_TP3_Q)
  %spec_TP4_Q = getelementptr inbounds [11 x i8], ptr @il_spec_TP4_Q, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_TP4_Q, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_TP4_Q, ptr @il_slot_TP4_Q)
  %spec_LED1 = getelementptr inbounds [10 x i8], ptr @il_spec_LED1, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_LED1, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_LED1, ptr @il_slot_LED1)
  %spec_LED2 = getelementptr inbounds [10 x i8], ptr @il_spec_LED2, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_LED2, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_LED2, ptr @il_slot_LED2)
  %spec_TP_1__elapsed = getelementptr inbounds [18 x i8], ptr @il_spec_TP_1__elapsed, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_TP_1__elapsed, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_TP_1__elapsed, ptr @il_slot_TP_1__elapsed)
  %spec_TP_1__running = getelementptr inbounds [19 x i8], ptr @il_spec_TP_1__running, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_TP_1__running, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_TP_1__running, ptr @il_slot_TP_1__running)
  %spec_TP_2__elapsed = getelementptr inbounds [18 x i8], ptr @il_spec_TP_2__elapsed, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_TP_2__elapsed, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_TP_2__elapsed, ptr @il_slot_TP_2__elapsed)
  %spec_TP_2__running = getelementptr inbounds [19 x i8], ptr @il_spec_TP_2__running, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_TP_2__running, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_TP_2__running, ptr @il_slot_TP_2__running)
  %spec_TP_3__elapsed = getelementptr inbounds [18 x i8], ptr @il_spec_TP_3__elapsed, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_TP_3__elapsed, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_TP_3__elapsed, ptr @il_slot_TP_3__elapsed)
  %spec_TP_3__running = getelementptr inbounds [19 x i8], ptr @il_spec_TP_3__running, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_TP_3__running, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_TP_3__running, ptr @il_slot_TP_3__running)
  %spec_TP_4__elapsed = getelementptr inbounds [18 x i8], ptr @il_spec_TP_4__elapsed, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_TP_4__elapsed, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_TP_4__elapsed, ptr @il_slot_TP_4__elapsed)
  %spec_TP_4__running = getelementptr inbounds [19 x i8], ptr @il_spec_TP_4__running, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_TP_4__running, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %spec_TP_4__running, ptr @il_slot_TP_4__running)
  ; フォールバック: Entry バインド前は il_mem を指す（FB ピンは上で Entry+offset 済み）。
  store ptr @il_mem_StartSW, ptr @il_slot_StartSW
  store ptr @il_mem_EndSW, ptr @il_slot_EndSW
  store ptr @il_mem_AI_1, ptr @il_slot_AI_1
  store ptr @il_mem_Active, ptr @il_slot_Active
  store ptr @il_mem_LimitOver, ptr @il_slot_LimitOver
  store ptr @il_mem_LimitOverCount, ptr @il_slot_LimitOverCount
  store ptr @il_mem_Err, ptr @il_slot_Err
  store ptr @il_mem_TP1_Q, ptr @il_slot_TP1_Q
  store ptr @il_mem_TP2_Q, ptr @il_slot_TP2_Q
  store ptr @il_mem_TP3_Q, ptr @il_slot_TP3_Q
  store ptr @il_mem_TP4_Q, ptr @il_slot_TP4_Q
  store ptr @il_mem_LED1, ptr @il_slot_LED1
  store ptr @il_mem_LED2, ptr @il_slot_LED2
  store ptr @il_mem_TP_1__elapsed, ptr @il_slot_TP_1__elapsed
  store ptr @il_mem_TP_1__running, ptr @il_slot_TP_1__running
  store ptr @il_mem_TP_2__elapsed, ptr @il_slot_TP_2__elapsed
  store ptr @il_mem_TP_2__running, ptr @il_slot_TP_2__running
  store ptr @il_mem_TP_3__elapsed, ptr @il_slot_TP_3__elapsed
  store ptr @il_mem_TP_3__running, ptr @il_slot_TP_3__running
  store ptr @il_mem_TP_4__elapsed, ptr @il_slot_TP_4__elapsed
  store ptr @il_mem_TP_4__running, ptr @il_slot_TP_4__running
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
define i32 @test() {
entry:
  %acc = alloca i1
  store i1 false, ptr %acc
  %int_acc = alloca i32
  store i32 0, ptr %int_acc
  %t1 = load ptr, ptr @il_slot_StartSW
  %t2 = load i1, ptr %t1
  store i1 %t2, ptr %acc
  %t3 = load i1, ptr %acc
  %t4 = load ptr, ptr @il_slot_Active
  %t5 = load i1, ptr %t4
  %t6 = or i1 %t3, %t5
  store i1 %t6, ptr %acc
  %t7 = load i1, ptr %acc
  %t8 = load ptr, ptr @il_slot_EndSW
  %t9 = load i1, ptr %t8
  %t10 = xor i1 %t9, true
  %t11 = and i1 %t7, %t10
  store i1 %t11, ptr %acc
  %t12 = load ptr, ptr @il_slot_Active
  %t13 = load i1, ptr %acc
  store i1 %t13, ptr %t12
  %t14 = load ptr, ptr @il_slot_AI_1
  %t15 = load i32, ptr %t14
  store i32 %t15, ptr %int_acc
  %t16 = load i32, ptr %int_acc
  %t17 = add i32 %t16, 100
  store i32 %t17, ptr %int_acc
  %t18 = load i32, ptr %int_acc
  %t19 = icmp ugt i32 %t18, 1000
  store i1 %t19, ptr %acc
  %t20 = load ptr, ptr @il_slot_LimitOver
  %t21 = load i1, ptr %acc
  store i1 %t21, ptr %t20
  %t22 = load ptr, ptr @il_slot_Active
  %t23 = load i1, ptr %t22
  store i1 %t23, ptr %acc
  %t24 = load i1, ptr %acc
  %t25 = load ptr, ptr @il_slot_LimitOver
  %t26 = load i1, ptr %t25
  %t27 = and i1 %t24, %t26
  store i1 %t27, ptr %acc
  %t28 = load ptr, ptr @il_slot_CTU_1_CU
  %t29 = load i1, ptr %acc
  store i1 %t29, ptr %t28
  %t30 = load ptr, ptr @il_slot_EndSW
  %t31 = load i1, ptr %t30
  store i1 %t31, ptr %acc
  %t32 = load ptr, ptr @il_slot_CTU_1_RESET
  %t33 = load i1, ptr %acc
  store i1 %t33, ptr %t32
  store i32 5, ptr %int_acc
  %t34 = load ptr, ptr @il_slot_CTU_1_PV
  %t35 = load i32, ptr %int_acc
  store i32 %t35, ptr %t34
  %t36 = load ptr, ptr @il_slot_CTU_1_CU
  %t37 = load ptr, ptr @il_slot_CTU_1_RESET
  %t38 = load ptr, ptr @il_slot_CTU_1_PV
  %t39 = load ptr, ptr @il_slot_CTU_1_Q
  %t40 = load ptr, ptr @il_slot_CTU_1_CV
  %t41 = load ptr, ptr @il_slot_CTU_1__prev_cu
  call void @ctu_step(ptr %t36, ptr %t37, ptr %t38, ptr %t39, ptr %t40, ptr %t41)
  %t42 = load ptr, ptr @il_slot_CTU_1_Q
  %t43 = load i1, ptr %t42
  store i1 %t43, ptr %acc
  %t44 = load ptr, ptr @il_slot_Err
  %t45 = load i1, ptr %acc
  store i1 %t45, ptr %t44
  %t46 = load ptr, ptr @il_slot_CTU_1_CV
  %t47 = load i32, ptr %t46
  store i32 %t47, ptr %int_acc
  %t48 = load ptr, ptr @il_slot_LimitOverCount
  %t49 = load i32, ptr %int_acc
  store i32 %t49, ptr %t48
  %t50 = load ptr, ptr @il_slot_TP2_Q
  %t51 = load i1, ptr %t50
  %t52 = xor i1 %t51, true
  store i1 %t52, ptr %acc
  %t53 = load ptr, ptr @il_slot_TP_1_IN
  %t54 = load i1, ptr %acc
  store i1 %t54, ptr %t53
  store i32 1000, ptr %int_acc
  %t55 = load ptr, ptr @il_slot_TP_1_PT
  %t56 = load i32, ptr %int_acc
  store i32 %t56, ptr %t55
  %t57 = load ptr, ptr @il_slot_TP_1_IN
  %t58 = load ptr, ptr @il_slot_TP_1_PT
  %t59 = load ptr, ptr @il_slot_TP_1_Q
  %t60 = load ptr, ptr @il_slot_TP_1__elapsed
  %t61 = load ptr, ptr @il_slot_TP_1__running
  call void @tp_step(ptr %t57, ptr %t58, ptr %t59, ptr %t60, ptr %t61)
  %t62 = load ptr, ptr @il_slot_TP_1_Q
  %t63 = load i1, ptr %t62
  store i1 %t63, ptr %acc
  %t64 = load ptr, ptr @il_slot_TP1_Q
  %t65 = load i1, ptr %acc
  store i1 %t65, ptr %t64
  %t66 = load ptr, ptr @il_slot_TP_1_Q
  %t67 = load i1, ptr %t66
  %t68 = xor i1 %t67, true
  store i1 %t68, ptr %acc
  %t69 = load ptr, ptr @il_slot_TP_2_IN
  %t70 = load i1, ptr %acc
  store i1 %t70, ptr %t69
  store i32 1000, ptr %int_acc
  %t71 = load ptr, ptr @il_slot_TP_2_PT
  %t72 = load i32, ptr %int_acc
  store i32 %t72, ptr %t71
  %t73 = load ptr, ptr @il_slot_TP_2_IN
  %t74 = load ptr, ptr @il_slot_TP_2_PT
  %t75 = load ptr, ptr @il_slot_TP_2_Q
  %t76 = load ptr, ptr @il_slot_TP_2__elapsed
  %t77 = load ptr, ptr @il_slot_TP_2__running
  call void @tp_step(ptr %t73, ptr %t74, ptr %t75, ptr %t76, ptr %t77)
  %t78 = load ptr, ptr @il_slot_TP_2_Q
  %t79 = load i1, ptr %t78
  store i1 %t79, ptr %acc
  %t80 = load ptr, ptr @il_slot_TP2_Q
  %t81 = load i1, ptr %acc
  store i1 %t81, ptr %t80
  %t82 = load ptr, ptr @il_slot_StartSW
  %t83 = load i1, ptr %t82
  store i1 %t83, ptr %acc
  %t84 = load i1, ptr %acc
  %t85 = load ptr, ptr @il_slot_TP4_Q
  %t86 = load i1, ptr %t85
  %t87 = xor i1 %t86, true
  %t88 = and i1 %t84, %t87
  store i1 %t88, ptr %acc
  %t89 = load ptr, ptr @il_slot_TP_3_IN
  %t90 = load i1, ptr %acc
  store i1 %t90, ptr %t89
  store i32 500, ptr %int_acc
  %t91 = load ptr, ptr @il_slot_TP_3_PT
  %t92 = load i32, ptr %int_acc
  store i32 %t92, ptr %t91
  %t93 = load ptr, ptr @il_slot_TP_3_IN
  %t94 = load ptr, ptr @il_slot_TP_3_PT
  %t95 = load ptr, ptr @il_slot_TP_3_Q
  %t96 = load ptr, ptr @il_slot_TP_3__elapsed
  %t97 = load ptr, ptr @il_slot_TP_3__running
  call void @tp_step(ptr %t93, ptr %t94, ptr %t95, ptr %t96, ptr %t97)
  %t98 = load ptr, ptr @il_slot_TP_3_Q
  %t99 = load i1, ptr %t98
  store i1 %t99, ptr %acc
  %t100 = load ptr, ptr @il_slot_TP3_Q
  %t101 = load i1, ptr %acc
  store i1 %t101, ptr %t100
  %t102 = load ptr, ptr @il_slot_StartSW
  %t103 = load i1, ptr %t102
  store i1 %t103, ptr %acc
  %t104 = load i1, ptr %acc
  %t105 = load ptr, ptr @il_slot_TP3_Q
  %t106 = load i1, ptr %t105
  %t107 = xor i1 %t106, true
  %t108 = and i1 %t104, %t107
  store i1 %t108, ptr %acc
  %t109 = load ptr, ptr @il_slot_TP_4_IN
  %t110 = load i1, ptr %acc
  store i1 %t110, ptr %t109
  store i32 500, ptr %int_acc
  %t111 = load ptr, ptr @il_slot_TP_4_PT
  %t112 = load i32, ptr %int_acc
  store i32 %t112, ptr %t111
  %t113 = load ptr, ptr @il_slot_TP_4_IN
  %t114 = load ptr, ptr @il_slot_TP_4_PT
  %t115 = load ptr, ptr @il_slot_TP_4_Q
  %t116 = load ptr, ptr @il_slot_TP_4__elapsed
  %t117 = load ptr, ptr @il_slot_TP_4__running
  call void @tp_step(ptr %t113, ptr %t114, ptr %t115, ptr %t116, ptr %t117)
  %t118 = load ptr, ptr @il_slot_TP_4_Q
  %t119 = load i1, ptr %t118
  store i1 %t119, ptr %acc
  %t120 = load ptr, ptr @il_slot_TP4_Q
  %t121 = load i1, ptr %acc
  store i1 %t121, ptr %t120
  %t122 = load ptr, ptr @il_slot_StartSW
  %t123 = load i1, ptr %t122
  store i1 %t123, ptr %acc
  %t124 = load i1, ptr %acc
  %t125 = load ptr, ptr @il_slot_TP3_Q
  %t126 = load i1, ptr %t125
  %t127 = and i1 %t124, %t126
  store i1 %t127, ptr %acc
  %t128 = load ptr, ptr @il_slot_LED2
  %t129 = load i1, ptr %acc
  store i1 %t129, ptr %t128
  %t130 = load ptr, ptr @il_slot_Err
  %t131 = load i1, ptr %t130
  store i1 %t131, ptr %acc
  %t132 = load i1, ptr %acc
  %t133 = load ptr, ptr @il_slot_TP2_Q
  %t134 = load i1, ptr %t133
  %t135 = and i1 %t132, %t134
  store i1 %t135, ptr %acc
  %t136 = load ptr, ptr @il_slot_LED1
  %t137 = load i1, ptr %acc
  store i1 %t137, ptr %t136
  ret i32 0
}