; ModuleID = '..\PLCP\apif.c'
source_filename = "..\\PLCP\\apif.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.PLCAPIMSG = type { i32, i32, [1 x i32] }

$LibVersion_0x0701 = comdat any

$"??_C@_06GNHHIIJE@APIREQ?$AA@" = comdat any

$"??_C@_03LABEMFEH@API?$AA@" = comdat any

$"??_C@_09BGEIHPFA@APITHREAD?$AA@" = comdat any

$"??_C@_0N@OKJONGND@Api_Dispatch?$AA@" = comdat any

$"??_C@_00CNPNBAHC@?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@status_api = dso_local local_unnamed_addr global i32 0, align 4
@hAPImbx = dso_local local_unnamed_addr global i16 0, align 2
@hAPImbxRES = dso_local local_unnamed_addr global i16 0, align 2
@hAPIthread = dso_local local_unnamed_addr global i16 0, align 2
@letter = dso_local local_unnamed_addr global ptr null, align 4
@"??_C@_06GNHHIIJE@APIREQ?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"APIREQ\00", comdat, align 1
@"??_C@_03LABEMFEH@API?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"API\00", comdat, align 1
@"??_C@_09BGEIHPFA@APITHREAD?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"APITHREAD\00", comdat, align 1
@"??_C@_0N@OKJONGND@Api_Dispatch?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"Api_Dispatch\00", comdat, align 1
@"??_C@_00CNPNBAHC@?$AA@" = linkonce_odr dso_local unnamed_addr constant [1 x i8] zeroinitializer, comdat, align 1

; Function Attrs: nounwind
define dso_local void @Api_Init() local_unnamed_addr #0 {
  %1 = load i16, ptr @hAPImbx, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %3, label %6

3:                                                ; preds = %0
  %4 = tail call zeroext i16 @CreateRtMailbox(i16 noundef zeroext 0) #6
  store i16 %4, ptr @hAPImbx, align 2
  %5 = tail call zeroext i8 @Catalog(i16 noundef zeroext 0, i16 noundef zeroext %4, ptr noundef nonnull @"??_C@_06GNHHIIJE@APIREQ?$AA@") #6
  br label %6

6:                                                ; preds = %3, %0
  %7 = load i16, ptr @hAPImbxRES, align 2
  %8 = icmp eq i16 %7, 0
  br i1 %8, label %9, label %17

9:                                                ; preds = %6
  %10 = tail call zeroext i16 @CreateRtMailbox(i16 noundef zeroext 0) #6
  store i16 %10, ptr @hAPImbxRES, align 2
  %11 = tail call zeroext i8 @Catalog(i16 noundef zeroext 0, i16 noundef zeroext %10, ptr noundef nonnull @"??_C@_03LABEMFEH@API?$AA@") #6
  %12 = tail call ptr @AllocateRtMemory(i32 noundef 4096) #6
  store ptr %12, ptr @letter, align 4
  tail call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(4096) %12, i8 0, i32 4096, i1 false)
  %13 = tail call zeroext i16 @CreateRtMemoryHandle(ptr noundef nonnull %12, i32 noundef 4096) #6
  %14 = load i16, ptr @hAPImbx, align 2
  %15 = load i16, ptr @hAPImbxRES, align 2
  %16 = tail call zeroext i8 @SendRtHandle(i16 noundef zeroext %15, i16 noundef zeroext %13, i16 noundef zeroext %14) #6
  br label %17

17:                                               ; preds = %9, %6
  %18 = load i16, ptr @hAPIthread, align 2
  %19 = icmp eq i16 %18, 0
  br i1 %19, label %20, label %25

20:                                               ; preds = %17
  %21 = tail call zeroext i8 @Config_Get_BasePriority() #6
  %22 = add i8 %21, 4
  %23 = tail call zeroext i16 @CreateRtThread(i8 noundef zeroext %22, ptr noundef nonnull @Api_Thread, i32 noundef 8192, ptr noundef null) #6
  store i16 %23, ptr @hAPIthread, align 2
  %24 = tail call zeroext i8 @Catalog(i16 noundef zeroext 0, i16 noundef zeroext %23, ptr noundef nonnull @"??_C@_09BGEIHPFA@APITHREAD?$AA@") #6
  br label %25

25:                                               ; preds = %20, %17
  store i32 6, ptr @status_api, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

declare dso_local zeroext i16 @CreateRtMailbox(i16 noundef zeroext) local_unnamed_addr #2

declare dso_local zeroext i8 @Catalog(i16 noundef zeroext, i16 noundef zeroext, ptr noundef) local_unnamed_addr #2

declare dso_local ptr @AllocateRtMemory(i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #3

declare dso_local zeroext i16 @CreateRtMemoryHandle(ptr noundef, i32 noundef) local_unnamed_addr #2

declare dso_local zeroext i8 @SendRtHandle(i16 noundef zeroext, i16 noundef zeroext, i16 noundef zeroext) local_unnamed_addr #2

declare dso_local zeroext i16 @CreateRtThread(i8 noundef zeroext, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
define dso_local void @Api_Thread() #4 {
  %1 = alloca i16, align 2
  %2 = alloca %struct.PLCAPIMSG, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #6
  %3 = load ptr, ptr @letter, align 4
  br label %4

4:                                                ; preds = %10, %0
  %5 = load i16, ptr @hAPImbx, align 2
  %6 = call zeroext i16 @ReceiveRtHandle(i16 noundef zeroext %5, i32 noundef -1, ptr noundef nonnull %1) #6
  %7 = call zeroext i16 @GetRtHandleType(i16 noundef zeroext %6) #6
  %8 = icmp eq i16 %7, 6
  br i1 %8, label %11, label %9

9:                                                ; preds = %4
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #6
  store i32 200, ptr %2, align 4
  call void @Api_Dispatch(ptr noundef nonnull %2)
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #6
  br label %10

10:                                               ; preds = %9, %11
  br label %4

11:                                               ; preds = %4
  call void @Api_Dispatch(ptr noundef %3)
  %12 = load i16, ptr @hAPImbx, align 2
  %13 = load i16, ptr %1, align 2
  %14 = call zeroext i8 @SendRtHandle(i16 noundef zeroext %13, i16 noundef zeroext %6, i16 noundef zeroext %12) #6
  br label %10
}

declare dso_local zeroext i8 @Config_Get_BasePriority() local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

declare dso_local zeroext i16 @ReceiveRtHandle(i16 noundef zeroext, i32 noundef, ptr noundef) local_unnamed_addr #2

declare dso_local zeroext i16 @GetRtHandleType(i16 noundef zeroext) local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @Api_Dispatch(ptr noundef %0) local_unnamed_addr #0 {
  %2 = load i32, ptr %0, align 1
  switch i32 %2, label %21 [
    i32 200, label %3
    i32 100, label %4
    i32 101, label %5
    i32 110, label %6
    i32 111, label %7
    i32 121, label %8
    i32 120, label %14
    i32 122, label %18
    i32 123, label %19
    i32 201, label %20
  ]

3:                                                ; preds = %1
  tail call void @Status_DetailDisplay() #6
  br label %23

4:                                                ; preds = %1
  tail call void @PLCcontrol_Stop() #6
  br label %23

5:                                                ; preds = %1
  tail call void @PLCcontrol_Reset() #6
  br label %23

6:                                                ; preds = %1
  tail call void @PLCcontrol_ColdStart() #6
  br label %23

7:                                                ; preds = %1
  tail call void @PLCcontrol_HotStart() #6
  br label %23

8:                                                ; preds = %1
  %9 = getelementptr inbounds nuw i8, ptr %0, i32 8
  %10 = load i32, ptr %9, align 1
  %11 = getelementptr inbounds nuw i8, ptr %0, i32 12
  %12 = load i32, ptr %11, align 1
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 16
  tail call void @PLCcontrol_Halt(i32 noundef %10) #6
  tail call void @Errorlog_Add(i32 noundef %12, i32 noundef %10, ptr noundef nonnull %13) #6
  tail call void @Errorlog_Add(i32 noundef 0, i32 noundef 65518, ptr noundef nonnull @"??_C@_0N@OKJONGND@Api_Dispatch?$AA@") #6
  br label %23

14:                                               ; preds = %1
  tail call void @PLCcontrol_Download() #6
  tail call void @PLCcontrol_Swap() #6
  %15 = tail call zeroext i8 @Config_Get_PrintMode() #6
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %23, label %17

17:                                               ; preds = %14
  tail call void @Status_DetailDisplay() #6
  br label %23

18:                                               ; preds = %1
  tail call void @PLCcontrol_RetainSave() #6
  br label %23

19:                                               ; preds = %1
  tail call void @PLCcontrol_RetainLoad() #6
  br label %23

20:                                               ; preds = %1
  tail call void @Logic_Disasm() #6
  br label %23

21:                                               ; preds = %1
  tail call void @Errorlog_Add(i32 noundef 0, i32 noundef 256, ptr noundef nonnull @"??_C@_00CNPNBAHC@?$AA@") #6
  %22 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i32 0, ptr %22, align 1
  br label %23

23:                                               ; preds = %17, %14, %21, %20, %19, %18, %8, %7, %6, %5, %4, %3
  ret void
}

; Function Attrs: nounwind
define dso_local void @Api_DumpLog() local_unnamed_addr #0 {
  tail call void @Status_DetailDisplay() #6
  ret void
}

declare dso_local void @Status_DetailDisplay() local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @Api_PlcStop() local_unnamed_addr #0 {
  tail call void @PLCcontrol_Stop() #6
  ret void
}

declare dso_local void @PLCcontrol_Stop() local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @Api_PlcReset() local_unnamed_addr #0 {
  tail call void @PLCcontrol_Reset() #6
  ret void
}

declare dso_local void @PLCcontrol_Reset() local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @Api_PlcStartCold() local_unnamed_addr #0 {
  tail call void @PLCcontrol_ColdStart() #6
  ret void
}

declare dso_local void @PLCcontrol_ColdStart() local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @Api_PlcStartWarm() local_unnamed_addr #0 {
  tail call void @PLCcontrol_HotStart() #6
  ret void
}

declare dso_local void @PLCcontrol_HotStart() local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @Api_PlcHalt(i32 noundef %0) local_unnamed_addr #0 {
  tail call void @PLCcontrol_Halt(i32 noundef %0) #6
  ret void
}

declare dso_local void @PLCcontrol_Halt(i32 noundef) local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @Api_PlcDownload() local_unnamed_addr #0 {
  tail call void @PLCcontrol_Download() #6
  tail call void @PLCcontrol_Swap() #6
  %1 = tail call zeroext i8 @Config_Get_PrintMode() #6
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %4, label %3

3:                                                ; preds = %0
  tail call void @Status_DetailDisplay() #6
  br label %4

4:                                                ; preds = %3, %0
  ret void
}

declare dso_local void @PLCcontrol_Download() local_unnamed_addr #2

declare dso_local void @PLCcontrol_Swap() local_unnamed_addr #2

declare dso_local zeroext i8 @Config_Get_PrintMode() local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @Api_PlcRetainSave() local_unnamed_addr #0 {
  tail call void @PLCcontrol_RetainSave() #6
  ret void
}

declare dso_local void @PLCcontrol_RetainSave() local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @Api_PlcRetainLoad() local_unnamed_addr #0 {
  tail call void @PLCcontrol_RetainLoad() #6
  ret void
}

declare dso_local void @PLCcontrol_RetainLoad() local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @Api_PlcDisasm() local_unnamed_addr #0 {
  tail call void @Logic_Disasm() #6
  ret void
}

declare dso_local void @Logic_Disasm() local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @Api_StepEnable() local_unnamed_addr #0 {
  tail call void @PLCcontrol_StepEnable() #6
  ret void
}

declare dso_local void @PLCcontrol_StepEnable() local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @Api_StepDisable() local_unnamed_addr #0 {
  tail call void @PLCcontrol_StepDisable() #6
  ret void
}

declare dso_local void @PLCcontrol_StepDisable() local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @Api_StepStep() local_unnamed_addr #0 {
  tail call void @PLCcontrol_StepStep() #6
  ret void
}

declare dso_local void @PLCcontrol_StepStep() local_unnamed_addr #2

declare dso_local void @Errorlog_Add(i32 noundef, i32 noundef, ptr noundef) local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local i32 @Api_Request(i32 noundef %0, i32 noundef %1, ptr noundef readonly captures(none) %2, i32 noundef %3, ptr noundef writeonly captures(address_is_null) %4, i32 noundef %5) local_unnamed_addr #0 {
  %7 = alloca i16, align 2
  %8 = icmp eq ptr %4, null
  br i1 %8, label %10, label %9

9:                                                ; preds = %6
  store i32 0, ptr %4, align 4
  br label %10

10:                                               ; preds = %9, %6
  %11 = trunc i32 %0 to i16
  %12 = tail call zeroext i16 @LookupRtHandle(i16 noundef zeroext %11, ptr noundef nonnull @"??_C@_03LABEMFEH@API?$AA@", i32 noundef 0) #6
  %13 = icmp eq i16 %12, -1
  br i1 %13, label %49, label %14

14:                                               ; preds = %10
  call void @llvm.lifetime.start.p0(ptr nonnull %7) #6
  %15 = call zeroext i16 @ReceiveRtHandle(i16 noundef zeroext %12, i32 noundef 0, ptr noundef nonnull %7) #6
  %16 = icmp eq i16 %15, -1
  br i1 %16, label %47, label %17

17:                                               ; preds = %14
  %18 = call ptr @MapRtSharedMemory(i16 noundef zeroext %15) #6
  %19 = icmp eq ptr %18, null
  br i1 %19, label %47, label %20

20:                                               ; preds = %17
  store i32 %1, ptr %18, align 4
  %21 = getelementptr inbounds nuw i8, ptr %18, i32 4
  store i32 %3, ptr %21, align 4
  %22 = icmp eq i32 %3, 0
  br i1 %22, label %26, label %23

23:                                               ; preds = %20
  %24 = shl i32 %3, 2
  %25 = getelementptr inbounds nuw i8, ptr %18, i32 8
  call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 4 %25, ptr align 4 %2, i32 %24, i1 false)
  br label %26

26:                                               ; preds = %23, %20
  %27 = load i16, ptr %7, align 2
  %28 = call zeroext i8 @SendRtHandle(i16 noundef zeroext %27, i16 noundef zeroext %15, i16 noundef zeroext %12) #6
  %29 = call zeroext i16 @ReceiveRtHandle(i16 noundef zeroext %12, i32 noundef -1, ptr noundef nonnull %7) #6
  %30 = load i32, ptr %21, align 4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %42, label %32

32:                                               ; preds = %26
  %33 = shl i32 %30, 2
  %34 = add i32 %33, 4
  %35 = shl i32 %5, 2
  %36 = icmp ugt i32 %34, %35
  br i1 %36, label %37, label %39

37:                                               ; preds = %32
  %38 = add i32 %5, -1
  store i32 %38, ptr %21, align 4
  br label %39

39:                                               ; preds = %37, %32
  %40 = phi i32 [ %35, %37 ], [ %34, %32 ]
  %41 = phi i32 [ %38, %37 ], [ %30, %32 ]
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %4, ptr nonnull align 4 %21, i32 %40, i1 false)
  br label %42

42:                                               ; preds = %39, %26
  %43 = phi i32 [ %41, %39 ], [ 0, %26 ]
  %44 = call i32 @FreeRtMemory(ptr noundef nonnull %18) #6
  %45 = load i16, ptr %7, align 2
  %46 = call zeroext i8 @SendRtHandle(i16 noundef zeroext %12, i16 noundef zeroext %29, i16 noundef zeroext %45) #6
  br label %47

47:                                               ; preds = %42, %17, %14
  %48 = phi i32 [ -1, %14 ], [ %43, %42 ], [ -1, %17 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %7) #6
  br label %49

49:                                               ; preds = %10, %47
  %50 = phi i32 [ %48, %47 ], [ -1, %10 ]
  ret i32 %50
}

declare dso_local zeroext i16 @LookupRtHandle(i16 noundef zeroext, ptr noundef, i32 noundef) local_unnamed_addr #2

declare dso_local ptr @MapRtSharedMemory(i16 noundef zeroext) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #5

declare dso_local i32 @FreeRtMemory(ptr noundef) local_unnamed_addr #2

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { noreturn nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\apif.c", directory: "C:\\D_DRV\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)"}
