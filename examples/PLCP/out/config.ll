; ModuleID = 'config.c'
source_filename = "config.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_0N@COHPKCOK@EgRetain_001?$AA@" = comdat any

$"??_C@_01KMDKNFGN@?1?$AA@" = comdat any

$"??_C@_09OABCBDAM@C?3?2INplc?2?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@bStepMode = dso_local local_unnamed_addr global i8 0, align 1
@bPrintMode = dso_local local_unnamed_addr global i8 1, align 1
@bRemote = dso_local local_unnamed_addr global i8 0, align 1
@bTraceMode = dso_local local_unnamed_addr global i8 0, align 1
@byRunMode = dso_local local_unnamed_addr global i8 0, align 1
@bBasePriority = dso_local local_unnamed_addr global i8 0, align 1
@dwScanFreq = dso_local local_unnamed_addr global i32 0, align 4
@dwOverRunCnt = dso_local local_unnamed_addr global i32 0, align 4
@WorkFolder = dso_local global [128 x i8] zeroinitializer, align 1
@RslFolder = dso_local global [128 x i8] zeroinitializer, align 1
@RtaFolder = dso_local global [128 x i8] zeroinitializer, align 1
@BaseName = dso_local global [128 x i8] zeroinitializer, align 1
@RtaFilePath = dso_local global [128 x i8] zeroinitializer, align 1
@MnmFilePath = dso_local global [128 x i8] zeroinitializer, align 1
@IniFilePath = dso_local global [128 x i8] zeroinitializer, align 1
@RetainInstName = dso_local global [128 x i8] zeroinitializer, align 1
@"??_C@_0N@COHPKCOK@EgRetain_001?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"EgRetain_001\00", comdat, align 1
@"??_C@_01KMDKNFGN@?1?$AA@" = linkonce_odr dso_local unnamed_addr constant [2 x i8] c"/\00", comdat, align 1
@"??_C@_09OABCBDAM@C?3?2INplc?2?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"C:\\INplc\\\00", comdat, align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Config_Init() local_unnamed_addr #0 {
  store i8 0, ptr @bStepMode, align 1
  store i8 1, ptr @bPrintMode, align 1
  store i8 0, ptr @bRemote, align 1
  store i8 0, ptr @bTraceMode, align 1
  store i8 0, ptr @byRunMode, align 1
  store i8 -116, ptr @bBasePriority, align 1
  store i32 1000, ptr @dwScanFreq, align 4
  store i32 0, ptr @dwOverRunCnt, align 4
  store i8 0, ptr @WorkFolder, align 1
  store i8 0, ptr @BaseName, align 1
  store i8 0, ptr @RslFolder, align 1
  store i8 0, ptr @RtaFolder, align 1
  store i8 0, ptr @RtaFilePath, align 1
  store i8 0, ptr @MnmFilePath, align 1
  tail call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(13) @IniFilePath, ptr noundef nonnull align 1 dereferenceable(13) @"??_C@_0N@COHPKCOK@EgRetain_001?$AA@", i32 13, i1 false) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Config_Set_StepMode(i8 noundef zeroext %0) local_unnamed_addr #1 {
  store i8 %0, ptr @bStepMode, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Config_Set_PrintMode(i8 noundef zeroext %0) local_unnamed_addr #1 {
  store i8 %0, ptr @bPrintMode, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Config_Set_RemoteMode(i8 noundef zeroext %0) local_unnamed_addr #1 {
  store i8 %0, ptr @bRemote, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Config_Set_TraceMode(i8 noundef zeroext %0) local_unnamed_addr #1 {
  store i8 %0, ptr @bTraceMode, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Config_Set_RunMode(i8 noundef zeroext %0) local_unnamed_addr #1 {
  store i8 %0, ptr @byRunMode, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Config_Set_BasePriority(i8 noundef zeroext %0) local_unnamed_addr #1 {
  store i8 %0, ptr @bBasePriority, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Config_Set_ScanFreq(i32 noundef %0) local_unnamed_addr #1 {
  store i32 %0, ptr @dwScanFreq, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Config_Set_Overrun(i32 noundef %0) local_unnamed_addr #1 {
  store i32 %0, ptr @dwOverRunCnt, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Config_Set_WorkFolder(ptr noundef readonly captures(none) %0) local_unnamed_addr #2 {
  %2 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) @WorkFolder, ptr noundef nonnull dereferenceable(1) %0) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Config_Set_BaseName(ptr noundef readonly captures(none) %0) local_unnamed_addr #2 {
  %2 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) @BaseName, ptr noundef nonnull dereferenceable(1) %0) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Config_Set_RslFolder(ptr noundef readonly captures(none) %0) local_unnamed_addr #2 {
  %2 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) @RslFolder, ptr noundef nonnull dereferenceable(1) %0) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Config_Set_RtaFolder(ptr noundef readonly captures(none) %0) local_unnamed_addr #2 {
  %2 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) @RtaFolder, ptr noundef nonnull dereferenceable(1) %0) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Config_Set_RtaFilePath(ptr noundef readonly captures(none) %0) local_unnamed_addr #2 {
  %2 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) @RtaFilePath, ptr noundef nonnull dereferenceable(1) %0) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Config_Set_IniFilePath(ptr noundef readonly captures(none) %0) local_unnamed_addr #2 {
  %2 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) @IniFilePath, ptr noundef nonnull dereferenceable(1) %0) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Config_Set_MnmFilePath(ptr noundef readonly captures(none) %0) local_unnamed_addr #2 {
  %2 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) @MnmFilePath, ptr noundef nonnull dereferenceable(1) %0) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Config_Set_RetainInstName(ptr noundef readonly captures(none) %0) local_unnamed_addr #2 {
  %2 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) @IniFilePath, ptr noundef nonnull dereferenceable(1) %0) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local zeroext i8 @Config_Get_StepMode() local_unnamed_addr #3 {
  %1 = load i8, ptr @bStepMode, align 1
  ret i8 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local zeroext i8 @Config_Get_PrintMode() local_unnamed_addr #3 {
  %1 = load i8, ptr @bPrintMode, align 1
  ret i8 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local zeroext i8 @Config_Get_RemoteMode() local_unnamed_addr #3 {
  %1 = load i8, ptr @bRemote, align 1
  ret i8 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local zeroext i8 @Config_Get_TraceMode() local_unnamed_addr #3 {
  %1 = load i8, ptr @bTraceMode, align 1
  ret i8 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local zeroext i8 @Config_Get_RunMode() local_unnamed_addr #3 {
  %1 = load i8, ptr @byRunMode, align 1
  ret i8 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local zeroext i8 @Config_Get_BasePriority() local_unnamed_addr #3 {
  %1 = load i8, ptr @bBasePriority, align 1
  ret i8 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local i32 @Config_Get_ScanFreq() local_unnamed_addr #3 {
  %1 = load i32, ptr @dwScanFreq, align 4
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local i32 @Config_Get_Overrun() local_unnamed_addr #3 {
  %1 = load i32, ptr @dwOverRunCnt, align 4
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef nonnull ptr @Config_Get_WorkFolder() local_unnamed_addr #4 {
  ret ptr @WorkFolder
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef nonnull ptr @Config_Get_BaseName() local_unnamed_addr #4 {
  ret ptr @BaseName
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef nonnull ptr @Config_Get_RslFolder() local_unnamed_addr #4 {
  ret ptr @RslFolder
}

; Function Attrs: nounwind
define dso_local nonnull ptr @Config_Get_RslFolder_Default() local_unnamed_addr #5 {
  %1 = tail call zeroext i16 @INtime_CheckDRTOS() #9
  %2 = icmp eq i16 %1, 0
  %3 = select i1 %2, ptr @"??_C@_09OABCBDAM@C?3?2INplc?2?$AA@", ptr @"??_C@_01KMDKNFGN@?1?$AA@"
  ret ptr %3
}

declare dso_local zeroext i16 @INtime_CheckDRTOS() local_unnamed_addr #6

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef nonnull ptr @Config_Get_RtaFolder() local_unnamed_addr #4 {
  ret ptr @RtaFolder
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef nonnull ptr @Config_Get_RtaFilePath() local_unnamed_addr #4 {
  ret ptr @RtaFilePath
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef nonnull ptr @Config_Get_IniFilePath() local_unnamed_addr #4 {
  ret ptr @IniFilePath
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef nonnull ptr @Config_Get_MnmFilePath() local_unnamed_addr #4 {
  ret ptr @MnmFilePath
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef nonnull ptr @Config_Get_RetainInstName() local_unnamed_addr #4 {
  ret ptr @RetainInstName
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none)) local_unnamed_addr #7

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #8

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "config.c", directory: "D:\\work\\rtacc\\examples\\PLCP")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)"}
