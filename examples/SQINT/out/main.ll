; ModuleID = '..\PLCP\main.c'
source_filename = "..\\PLCP\\main.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_0M@OKMJOFGL@PLCPIEC?4rsl?$AA@" = comdat any

$"??_C@_0L@NJCAICAP@PLCPEN?4rsl?$AA@" = comdat any

$"??_C@_0L@JPAKFIOJ@PLCPFB?4rsl?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@"??_C@_0M@OKMJOFGL@PLCPIEC?4rsl?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"PLCPIEC.rsl\00", comdat, align 1
@"??_C@_0L@NJCAICAP@PLCPEN?4rsl?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"PLCPEN.rsl\00", comdat, align 1
@"??_C@_0L@JPAKFIOJ@PLCPFB?4rsl?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"PLCPFB.rsl\00", comdat, align 1

; Function Attrs: nounwind
define dso_local noundef i32 @plcmain(i32 noundef %0, ptr noundef %1) local_unnamed_addr #0 {
  tail call void @Heap_Clear() #2
  tail call void @Config_Init() #2
  tail call void @Argument_Init(i32 noundef %0, ptr noundef %1) #2
  tail call void @INtime_ProcessInitialize() #2
  %3 = tail call i32 @SQTBL_Create() #2
  tail call void @Api_Init() #2
  tail call void @Pause_Init() #2
  tail call void @Step_Init() #2
  tail call void @Watchdog_Init() #2
  tail call void @Exception_Init() #2
  tail call void @Errorlog_Clear() #2
  tail call void @Poufile_Clear() #2
  %4 = tail call ptr @Config_Get_IniFilePath() #2
  %5 = tail call i32 @IniFile_Load(ptr noundef %4) #2
  tail call void @Argument_Process(i32 noundef %0, ptr noundef %1) #2
  tail call void @Container_Init() #2
  tail call void @INtime_ProcessCatalog() #2
  tail call void @ExitEvent_Init() #2
  tail call void @SQTBL_Initialize() #2
  tail call void @Basicfunction_Load(ptr noundef nonnull @"??_C@_0M@OKMJOFGL@PLCPIEC?4rsl?$AA@") #2
  tail call void @Functionblock_Load(ptr noundef nonnull @"??_C@_0L@NJCAICAP@PLCPEN?4rsl?$AA@") #2
  tail call void @Functionblock_Load(ptr noundef nonnull @"??_C@_0L@JPAKFIOJ@PLCPFB?4rsl?$AA@") #2
  %6 = tail call i32 @Reservedword_CreateCatalog() #2
  tail call void @Engine_Init() #2
  tail call void @Logic_Clear() #2
  tail call void @Variable_Clear() #2
  tail call void @Label_Clear() #2
  %7 = tail call ptr @Config_Get_MnmFilePath() #2
  %8 = load i8, ptr %7, align 1
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %15, label %10

10:                                               ; preds = %2
  tail call void @PLCcontrol_Download() #2
  tail call void @PLCcontrol_Swap() #2
  %11 = tail call zeroext i8 @Config_Get_PrintMode() #2
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %14, label %13

13:                                               ; preds = %10
  tail call void @Status_DetailDisplay() #2
  br label %14

14:                                               ; preds = %13, %10
  tail call void @PLCcontrol_ColdStart() #2
  br label %15

15:                                               ; preds = %14, %2
  tail call void @ExitEvent_Wait() #2
  tail call void @PLCcontrol_Stop() #2
  %16 = tail call zeroext i8 @RtSleep(i32 noundef 100) #2
  tail call void @INtime_ProcessFinalize() #2
  tail call void @Container_Finish() #2
  ret i32 0
}

declare dso_local void @Heap_Clear() local_unnamed_addr #1

declare dso_local void @Config_Init() local_unnamed_addr #1

declare dso_local void @Argument_Init(i32 noundef, ptr noundef) local_unnamed_addr #1

declare dso_local void @INtime_ProcessInitialize() local_unnamed_addr #1

declare dso_local i32 @SQTBL_Create() local_unnamed_addr #1

declare dso_local void @Api_Init() local_unnamed_addr #1

declare dso_local void @Pause_Init() local_unnamed_addr #1

declare dso_local void @Step_Init() local_unnamed_addr #1

declare dso_local void @Watchdog_Init() local_unnamed_addr #1

declare dso_local void @Exception_Init() local_unnamed_addr #1

declare dso_local void @Errorlog_Clear() local_unnamed_addr #1

declare dso_local void @Poufile_Clear(...) local_unnamed_addr #1

declare dso_local i32 @IniFile_Load(ptr noundef) local_unnamed_addr #1

declare dso_local ptr @Config_Get_IniFilePath() local_unnamed_addr #1

declare dso_local void @Argument_Process(i32 noundef, ptr noundef) local_unnamed_addr #1

declare dso_local void @Container_Init() local_unnamed_addr #1

declare dso_local void @INtime_ProcessCatalog() local_unnamed_addr #1

declare dso_local void @ExitEvent_Init() local_unnamed_addr #1

declare dso_local void @SQTBL_Initialize() local_unnamed_addr #1

declare dso_local void @Basicfunction_Load(ptr noundef) local_unnamed_addr #1

declare dso_local void @Functionblock_Load(ptr noundef) local_unnamed_addr #1

declare dso_local i32 @Reservedword_CreateCatalog() local_unnamed_addr #1

declare dso_local void @Engine_Init() local_unnamed_addr #1

declare dso_local void @Logic_Clear() local_unnamed_addr #1

declare dso_local void @Variable_Clear() local_unnamed_addr #1

declare dso_local void @Label_Clear() local_unnamed_addr #1

declare dso_local ptr @Config_Get_MnmFilePath() local_unnamed_addr #1

declare dso_local void @PLCcontrol_Download() local_unnamed_addr #1

declare dso_local void @PLCcontrol_Swap() local_unnamed_addr #1

declare dso_local zeroext i8 @Config_Get_PrintMode() local_unnamed_addr #1

declare dso_local void @Status_DetailDisplay() local_unnamed_addr #1

declare dso_local void @PLCcontrol_ColdStart() local_unnamed_addr #1

declare dso_local void @ExitEvent_Wait() local_unnamed_addr #1

declare dso_local void @PLCcontrol_Stop() local_unnamed_addr #1

declare dso_local zeroext i8 @RtSleep(i32 noundef) local_unnamed_addr #1

declare dso_local void @INtime_ProcessFinalize() local_unnamed_addr #1

declare dso_local void @Container_Finish() local_unnamed_addr #1

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\main.c", directory: "C:\\D_DRV\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)"}
