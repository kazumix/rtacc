; ModuleID = '..\PLCP\plccontrol.c'
source_filename = "..\\PLCP\\plccontrol.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@status_plccontrol = dso_local local_unnamed_addr global i32 0, align 4

; Function Attrs: nounwind
define dso_local void @PLCcontrol_Start() local_unnamed_addr #0 {
  %1 = tail call zeroext i8 @Engine_IsStart() #2
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %3, label %4

3:                                                ; preds = %0
  tail call void @Logic_Begin() #2
  tail call void @Engine_Start() #2
  store i32 6, ptr @status_plccontrol, align 4
  br label %4

4:                                                ; preds = %3, %0
  tail call void @Indicate_STATE_RUN(i8 noundef zeroext 1) #2
  tail call void @Indicate_STATE_STOP(i8 noundef zeroext 0) #2
  tail call void @Indicate_STATE_STEP(i8 noundef zeroext 0) #2
  tail call void @Indicate_STATE_HALT(i8 noundef zeroext 0) #2
  tail call void @Indicate_DEBUG_EXCEPTICODE(i32 noundef 0) #2
  ret void
}

declare dso_local zeroext i8 @Engine_IsStart() local_unnamed_addr #1

declare dso_local void @Logic_Begin() local_unnamed_addr #1

declare dso_local void @Engine_Start() local_unnamed_addr #1

declare dso_local void @Indicate_STATE_RUN(i8 noundef zeroext) local_unnamed_addr #1

declare dso_local void @Indicate_STATE_STOP(i8 noundef zeroext) local_unnamed_addr #1

declare dso_local void @Indicate_STATE_STEP(i8 noundef zeroext) local_unnamed_addr #1

declare dso_local void @Indicate_STATE_HALT(i8 noundef zeroext) local_unnamed_addr #1

declare dso_local void @Indicate_DEBUG_EXCEPTICODE(i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @PLCcontrol_Stop() local_unnamed_addr #0 {
  %1 = tail call zeroext i8 @Engine_IsStart() #2
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %5, label %3

3:                                                ; preds = %0
  tail call void @Engine_Stop() #2
  tail call void @Engine_WaitStop() #2
  tail call void @Logic_Final() #2
  %4 = tail call zeroext i8 @Retain_Save() #2
  store i32 0, ptr @status_plccontrol, align 4
  br label %5

5:                                                ; preds = %3, %0
  tail call void @Indicate_STATE_RUN(i8 noundef zeroext 0) #2
  tail call void @Indicate_STATE_STOP(i8 noundef zeroext 1) #2
  tail call void @Indicate_STATE_STEP(i8 noundef zeroext 0) #2
  tail call void @Indicate_STATE_HALT(i8 noundef zeroext 0) #2
  tail call void @Indicate_DEBUG_EXCEPTICODE(i32 noundef 0) #2
  ret void
}

declare dso_local void @Engine_Stop() local_unnamed_addr #1

declare dso_local void @Engine_WaitStop() local_unnamed_addr #1

declare dso_local void @Logic_Final() local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @PLCcontrol_RetainSave() local_unnamed_addr #0 {
  %1 = tail call zeroext i8 @Retain_Save() #2
  ret void
}

; Function Attrs: nounwind
define dso_local void @PLCcontrol_Halt(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call zeroext i8 @Engine_IsStart() #2
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %6, label %4

4:                                                ; preds = %1
  tail call void @Engine_Stop() #2
  %5 = tail call zeroext i8 @Retain_Save() #2
  store i32 8, ptr @status_plccontrol, align 4
  br label %6

6:                                                ; preds = %4, %1
  tail call void @Indicate_STATE_RUN(i8 noundef zeroext 0) #2
  tail call void @Indicate_STATE_STOP(i8 noundef zeroext 0) #2
  tail call void @Indicate_STATE_STEP(i8 noundef zeroext 0) #2
  tail call void @Indicate_STATE_HALT(i8 noundef zeroext 1) #2
  tail call void @Indicate_DEBUG_EXCEPTICODE(i32 noundef %0) #2
  ret void
}

; Function Attrs: nounwind
define dso_local void @PLCcontrol_Reset() local_unnamed_addr #0 {
  %1 = tail call zeroext i8 @Retain_Save() #2
  tail call void @Variable_Reset_All() #2
  %2 = tail call zeroext i8 @Rtedge_SetTagDefaultValue() #2
  %3 = tail call zeroext i8 @Retain_Load() #2
  ret void
}

declare dso_local void @Variable_Reset_All() local_unnamed_addr #1

declare dso_local zeroext i8 @Rtedge_SetTagDefaultValue() local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @PLCcontrol_RetainLoad() local_unnamed_addr #0 {
  %1 = tail call zeroext i8 @Retain_Load() #2
  ret void
}

; Function Attrs: nounwind
define dso_local void @PLCcontrol_ColdStart() local_unnamed_addr #0 {
  %1 = tail call zeroext i8 @Retain_Save() #2
  tail call void @Variable_Reset_All() #2
  %2 = tail call zeroext i8 @Rtedge_SetTagDefaultValue() #2
  %3 = tail call zeroext i8 @Retain_Load() #2
  tail call void @PLCcontrol_Start()
  ret void
}

; Function Attrs: nounwind
define dso_local void @PLCcontrol_HotStart() local_unnamed_addr #0 {
  tail call void @PLCcontrol_Start()
  ret void
}

; Function Attrs: nounwind
define dso_local void @PLCcontrol_Download() local_unnamed_addr #0 {
  %1 = tail call i32 @Project_Load() #2
  tail call void @Indicate_STATE_LOADING(i8 noundef zeroext 1) #2
  %2 = tail call zeroext i8 @Retain_Load() #2
  ret void
}

declare dso_local i32 @Project_Load() local_unnamed_addr #1

declare dso_local void @Indicate_STATE_LOADING(i8 noundef zeroext) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @PLCcontrol_Swap() local_unnamed_addr #0 {
  tail call void @Logic_Swap() #2
  tail call void @Variable_Swap() #2
  ret void
}

declare dso_local void @Logic_Swap() local_unnamed_addr #1

declare dso_local void @Variable_Swap() local_unnamed_addr #1

declare dso_local zeroext i8 @Retain_Save() local_unnamed_addr #1

declare dso_local zeroext i8 @Retain_Load() local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @PLCcontrol_StepEnable() local_unnamed_addr #0 {
  tail call void @Step_Enable() #2
  ret void
}

declare dso_local void @Step_Enable() local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @PLCcontrol_StepDisable() local_unnamed_addr #0 {
  tail call void @Step_Disable() #2
  ret void
}

declare dso_local void @Step_Disable() local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @PLCcontrol_StepStep() local_unnamed_addr #0 {
  tail call void @Step_Trigger() #2
  ret void
}

declare dso_local void @Step_Trigger() local_unnamed_addr #1

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\plccontrol.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
