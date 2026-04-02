; llst: simple ST BOOL function -> LLVM IR memory=rtedge
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc"
declare i8 @Rtedge_TagCreateByInstruction(ptr, i8)
declare void @il_rtedge_registry_clear()
declare void @il_rtedge_registry_record_binding(ptr, ptr)
@il_spec_SW1 = private unnamed_addr constant [9 x i8] c"BOOL#SW1\00"
@il_mem_SW1 = global i1 false, align 1
@il_slot_SW1 = global ptr null, align 4
@il_spec_SW2 = private unnamed_addr constant [9 x i8] c"BOOL#SW2\00"
@il_mem_SW2 = global i1 false, align 1
@il_slot_SW2 = global ptr null, align 4
@il_spec_SW3 = private unnamed_addr constant [9 x i8] c"BOOL#SW3\00"
@il_mem_SW3 = global i1 false, align 1
@il_slot_SW3 = global ptr null, align 4
@il_spec_MsTick = private unnamed_addr constant [11 x i8] c"INT#MsTick\00"
@il_mem_MsTick = global i32 0, align 4
@il_slot_MsTick = global ptr null, align 4
@il_spec_LED1 = private unnamed_addr constant [10 x i8] c"BOOL#LED1\00"
@il_mem_LED1 = global i1 false, align 1
@il_slot_LED1 = global ptr null, align 4
@il_spec_LED2 = private unnamed_addr constant [10 x i8] c"BOOL#LED2\00"
@il_mem_LED2 = global i1 false, align 1
@il_slot_LED2 = global ptr null, align 4
define void @LED2Check_slots_init() {
entry:
  call void @il_rtedge_registry_clear()
  ; BOOL#/INT# 命令書式で Eg タグ生成し、il_slot をレジストリに登録。
  %sp_SW1 = getelementptr inbounds [9 x i8], ptr @il_spec_SW1, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %sp_SW1, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %sp_SW1, ptr @il_slot_SW1)
  %sp_SW2 = getelementptr inbounds [9 x i8], ptr @il_spec_SW2, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %sp_SW2, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %sp_SW2, ptr @il_slot_SW2)
  %sp_SW3 = getelementptr inbounds [9 x i8], ptr @il_spec_SW3, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %sp_SW3, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %sp_SW3, ptr @il_slot_SW3)
  %sp_MsTick = getelementptr inbounds [11 x i8], ptr @il_spec_MsTick, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %sp_MsTick, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %sp_MsTick, ptr @il_slot_MsTick)
  %so_LED1 = getelementptr inbounds [10 x i8], ptr @il_spec_LED1, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %so_LED1, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %so_LED1, ptr @il_slot_LED1)
  %so_LED2 = getelementptr inbounds [10 x i8], ptr @il_spec_LED2, i32 0, i32 0
  call i8 @Rtedge_TagCreateByInstruction(ptr %so_LED2, i8 0)
  call void @il_rtedge_registry_record_binding(ptr %so_LED2, ptr @il_slot_LED2)
  ; フォールバック: IlRtedgeRegistry_BindAllSlots まで il_mem を指す。
  store ptr @il_mem_SW1, ptr @il_slot_SW1
  store ptr @il_mem_SW2, ptr @il_slot_SW2
  store ptr @il_mem_SW3, ptr @il_slot_SW3
  store ptr @il_mem_MsTick, ptr @il_slot_MsTick
  store ptr @il_mem_LED1, ptr @il_slot_LED1
  store ptr @il_mem_LED2, ptr @il_slot_LED2
  ret void
}
define void @LED2Check() {
entry:
  %b1 = load ptr, ptr @il_slot_SW1
  %b2 = load i1, ptr %b1
  %b3 = load ptr, ptr @il_slot_SW2
  %b4 = load i1, ptr %b3
  %b5 = load ptr, ptr @il_slot_SW3
  %b6 = load i1, ptr %b5
  %b7 = load ptr, ptr @il_slot_MsTick
  %b8 = load i32, ptr %b7
  %b9 = and i1 %b2, %b4
  %b10 = or i1 %b9, %b6
  %b11 = load ptr, ptr @il_slot_LED1
  store i1 %b10, ptr %b11
  %b12 = srem i32 %b8, 600
  %b13 = icmp slt i32 %b12, 300
  %b14 = and i1 %b10, %b13
  %b15 = load ptr, ptr @il_slot_LED2
  store i1 %b14, ptr %b15
  ret void
}