; ModuleID = '..\PLCP\engine.c'
source_filename = "..\\PLCP\\engine.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_05IAHGNKDM@PULSE?$AA@" = comdat any

$"??_C@_0BM@MDFECNNP@Cannot?5create?5Engine_Thread?$AA@" = comdat any

$"??_C@_0CB@FNKGDICM@Cannot?5create?5Engine_PulseThread@" = comdat any

$"??_C@_06LKDHJJCH@ENGINE?$AA@" = comdat any

$"??_C@_09LJDFFONP@PACEMAKER?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@status_engine = dso_local local_unnamed_addr global i32 0, align 4
@hSQengineThread = dso_local local_unnamed_addr global i16 0, align 2
@hPulseThread = dso_local local_unnamed_addr global i16 0, align 2
@hPulseSem = dso_local local_unnamed_addr global i16 0, align 2
@"??_C@_05IAHGNKDM@PULSE?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"PULSE\00", comdat, align 1
@"??_C@_0BM@MDFECNNP@Cannot?5create?5Engine_Thread?$AA@" = linkonce_odr dso_local unnamed_addr constant [28 x i8] c"Cannot create Engine_Thread\00", comdat, align 1
@"??_C@_0CB@FNKGDICM@Cannot?5create?5Engine_PulseThread@" = linkonce_odr dso_local unnamed_addr constant [33 x i8] c"Cannot create Engine_PulseThread\00", comdat, align 1
@"??_C@_06LKDHJJCH@ENGINE?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"ENGINE\00", comdat, align 1
@"??_C@_09LJDFFONP@PACEMAKER?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"PACEMAKER\00", comdat, align 1
@Engine_PhaseStop = dso_local local_unnamed_addr global i8 0, align 1
@systickcount = internal unnamed_addr global i32 0, align 4
@curdelay = internal unnamed_addr global double 0.000000e+00, align 8
@maxdelay = internal unnamed_addr global double 0.000000e+00, align 8
@mindelay = internal unnamed_addr global double 0.000000e+00, align 8
@uiEnd = internal unnamed_addr global i64 0, align 8
@uiBegin = internal unnamed_addr global i64 0, align 8
@sqtbl = external dso_local local_unnamed_addr global ptr, align 4
@lpfnSeq_Ctrl = dso_local local_unnamed_addr global ptr null, align 4

; Function Attrs: nounwind
define dso_local void @Engine_Init() local_unnamed_addr #0 {
  store i8 0, ptr @Engine_PhaseStop, align 1
  store i32 0, ptr @systickcount, align 4
  store double 0.000000e+00, ptr @curdelay, align 8
  store double 0.000000e+00, ptr @maxdelay, align 8
  store double 0.000000e+00, ptr @mindelay, align 8
  store i64 0, ptr @uiEnd, align 8
  store i64 0, ptr @uiBegin, align 8
  %1 = load i16, ptr @hPulseSem, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %3, label %6

3:                                                ; preds = %0
  %4 = tail call zeroext i16 @CreateRtSemaphore(i16 noundef zeroext 0, i16 noundef zeroext 1, i16 noundef zeroext 0) #7
  store i16 %4, ptr @hPulseSem, align 2
  %5 = tail call zeroext i8 @Catalog(i16 noundef zeroext 0, i16 noundef zeroext %4, ptr noundef nonnull @"??_C@_05IAHGNKDM@PULSE?$AA@") #7
  br label %6

6:                                                ; preds = %3, %0
  %7 = tail call zeroext i8 @Config_Get_BasePriority() #7
  %8 = zext i8 %7 to i32
  %9 = add nuw nsw i32 %8, 2
  %10 = load i16, ptr @hSQengineThread, align 2
  %11 = icmp eq i16 %10, 0
  br i1 %11, label %12, label %17

12:                                               ; preds = %6
  %13 = trunc i32 %9 to i8
  %14 = tail call zeroext i16 @CreateRtThread(i8 noundef zeroext %13, ptr noundef nonnull @Engine_Thread, i32 noundef 32768, ptr noundef null) #7
  store i16 %14, ptr @hSQengineThread, align 2
  %15 = icmp eq i16 %14, -1
  br i1 %15, label %16, label %17

16:                                               ; preds = %12
  store i16 0, ptr @hSQengineThread, align 2
  tail call void (ptr, ...) @Fail(ptr noundef nonnull @"??_C@_0BM@MDFECNNP@Cannot?5create?5Engine_Thread?$AA@") #7
  br label %17

17:                                               ; preds = %12, %16, %6
  tail call void @Indicate_TASK_Prio(i32 noundef %9) #7
  tail call void @Indicate_TASK_Stack(i32 noundef 32768) #7
  %18 = tail call zeroext i8 @Config_Get_BasePriority() #7
  %19 = load i16, ptr @hPulseThread, align 2
  %20 = icmp eq i16 %19, 0
  br i1 %20, label %21, label %25

21:                                               ; preds = %17
  %22 = tail call zeroext i16 @CreateRtThread(i8 noundef zeroext %18, ptr noundef nonnull @Engine_PulseThread, i32 noundef 8192, ptr noundef null) #7
  store i16 %22, ptr @hPulseThread, align 2
  %23 = icmp eq i16 %22, -1
  br i1 %23, label %24, label %25

24:                                               ; preds = %21
  store i16 0, ptr @hPulseThread, align 2
  tail call void (ptr, ...) @Fail(ptr noundef nonnull @"??_C@_0CB@FNKGDICM@Cannot?5create?5Engine_PulseThread@") #7
  br label %25

25:                                               ; preds = %21, %24, %17
  %26 = tail call zeroext i16 @LookupRtHandle(i16 noundef zeroext 0, ptr noundef nonnull @"??_C@_06LKDHJJCH@ENGINE?$AA@", i32 noundef 10) #7
  %27 = tail call zeroext i16 @LookupRtHandle(i16 noundef zeroext 0, ptr noundef nonnull @"??_C@_09LJDFFONP@PACEMAKER?$AA@", i32 noundef 10) #7
  store i32 2, ptr @status_engine, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Engine_Reset() local_unnamed_addr #1 {
  store i8 0, ptr @Engine_PhaseStop, align 1
  store i32 0, ptr @systickcount, align 4
  store double 0.000000e+00, ptr @curdelay, align 8
  store double 0.000000e+00, ptr @maxdelay, align 8
  store double 0.000000e+00, ptr @mindelay, align 8
  store i64 0, ptr @uiEnd, align 8
  store i64 0, ptr @uiBegin, align 8
  ret void
}

declare dso_local zeroext i16 @CreateRtSemaphore(i16 noundef zeroext, i16 noundef zeroext, i16 noundef zeroext) local_unnamed_addr #2

declare dso_local zeroext i8 @Catalog(i16 noundef zeroext, i16 noundef zeroext, ptr noundef) local_unnamed_addr #2

declare dso_local zeroext i8 @Config_Get_BasePriority() local_unnamed_addr #2

declare dso_local zeroext i16 @CreateRtThread(i8 noundef zeroext, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
define dso_local void @Engine_Thread() #3 {
  store ptr @Logic_Scan, ptr @lpfnSeq_Ctrl, align 4
  %1 = tail call zeroext i16 @GetRtThreadHandles(i8 noundef zeroext 0) #7
  %2 = tail call zeroext i8 @Catalog(i16 noundef zeroext 0, i16 noundef zeroext %1, ptr noundef nonnull @"??_C@_06LKDHJJCH@ENGINE?$AA@") #7
  br label %3

3:                                                ; preds = %3, %0
  store i8 1, ptr @Engine_PhaseStop, align 1
  tail call void @Engine_WaitTrigger()
  store i8 0, ptr @Engine_PhaseStop, align 1
  %4 = tail call i64 @WatchDog_GetPentiumCounter() #7
  %5 = load ptr, ptr @lpfnSeq_Ctrl, align 4
  tail call void %5() #7
  %6 = tail call i64 @WatchDog_GetPentiumCounter() #7
  tail call void @Watchdog_Process(i64 noundef %4, i64 noundef %6) #7
  br label %3
}

declare dso_local void @Fail(ptr noundef, ...) local_unnamed_addr #2

declare dso_local void @Indicate_TASK_Prio(i32 noundef) local_unnamed_addr #2

declare dso_local void @Indicate_TASK_Stack(i32 noundef) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
define dso_local void @Engine_PulseThread() #3 {
  %1 = tail call zeroext i16 @GetRtThreadHandles(i8 noundef zeroext 0) #7
  %2 = tail call zeroext i8 @Catalog(i16 noundef zeroext 0, i16 noundef zeroext %1, ptr noundef nonnull @"??_C@_09LJDFFONP@PACEMAKER?$AA@") #7
  %3 = tail call i32 @Config_Get_ScanFreq() #7
  tail call void @Indicate_TASK_Period_us(i32 noundef %3) #7
  tail call void @knRtSleep(i32 noundef 1) #7
  br label %4

4:                                                ; preds = %12, %0
  %5 = phi i32 [ 0, %0 ], [ %7, %12 ]
  tail call void @InternalClock_Wait() #7
  %6 = add i32 %5, 1
  %7 = tail call i32 @InternalClock_IsPlcFireTiming(i32 noundef %6) #7
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %12

9:                                                ; preds = %4
  %10 = load ptr, ptr @sqtbl, align 4
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %13

12:                                               ; preds = %9, %13, %24, %28, %4
  br label %4

13:                                               ; preds = %9
  %14 = getelementptr inbounds nuw i8, ptr %10, i32 32
  %15 = load i8, ptr %14, align 1
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %12, label %17

17:                                               ; preds = %13
  %18 = load i16, ptr @hPulseSem, align 2
  %19 = icmp eq i16 %18, 0
  br i1 %19, label %28, label %20

20:                                               ; preds = %17
  %21 = tail call zeroext i8 @Step_IsEnable() #7
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %24, label %23

23:                                               ; preds = %20
  tail call void @Step_WaitTrigger() #7
  br label %24

24:                                               ; preds = %20, %23
  %25 = load i16, ptr @hPulseSem, align 2
  %26 = tail call zeroext i8 @ReleaseRtSemaphore(i16 noundef zeroext %25, i16 noundef zeroext 1) #7
  %27 = icmp eq i8 %26, 0
  br i1 %27, label %28, label %12

28:                                               ; preds = %17, %24
  tail call void @WatchDog_Action_OverRun() #7
  br label %12
}

declare dso_local zeroext i16 @LookupRtHandle(i16 noundef zeroext, ptr noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local zeroext i8 @Engine_Tigger() local_unnamed_addr #0 {
  %1 = load i16, ptr @hPulseSem, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %10, label %3

3:                                                ; preds = %0
  %4 = tail call zeroext i8 @Step_IsEnable() #7
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %7, label %6

6:                                                ; preds = %3
  tail call void @Step_WaitTrigger() #7
  br label %7

7:                                                ; preds = %6, %3
  %8 = load i16, ptr @hPulseSem, align 2
  %9 = tail call zeroext i8 @ReleaseRtSemaphore(i16 noundef zeroext %8, i16 noundef zeroext 1) #7
  br label %10

10:                                               ; preds = %7, %0
  %11 = phi i8 [ %9, %7 ], [ 0, %0 ]
  ret i8 %11
}

declare dso_local zeroext i8 @Step_IsEnable() local_unnamed_addr #2

declare dso_local void @Step_WaitTrigger() local_unnamed_addr #2

declare dso_local zeroext i8 @ReleaseRtSemaphore(i16 noundef zeroext, i16 noundef zeroext) local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local double @Engine_AbsDelay(double noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @Config_Get_ScanFreq() #7
  %3 = mul i32 %2, 1000
  %4 = uitofp i32 %3 to double
  %5 = fsub double %0, %4
  %6 = tail call double @llvm.fabs.f64(double %5)
  ret double %6
}

declare dso_local i32 @Config_Get_ScanFreq() local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #4

; Function Attrs: nounwind
define dso_local void @Engine_WaitTrigger() local_unnamed_addr #0 {
  %1 = load i16, ptr @hPulseSem, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %41, label %3

3:                                                ; preds = %0
  %4 = tail call i32 @WaitForRtSemaphore(i16 noundef zeroext %1, i16 noundef zeroext 1, i32 noundef -1) #7
  %5 = tail call i64 @WatchDog_GetPentiumCounter() #7
  store i64 %5, ptr @uiEnd, align 8
  %6 = load i64, ptr @uiBegin, align 8
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %31, label %8

8:                                                ; preds = %3
  %9 = tail call double @Watchdog_Calc(i64 noundef %6, i64 noundef %5) #7
  %10 = tail call i32 @Config_Get_ScanFreq() #7
  %11 = mul i32 %10, 1000
  %12 = uitofp i32 %11 to double
  %13 = fsub double %9, %12
  %14 = tail call double @llvm.fabs.f64(double %13)
  %15 = load double, ptr @maxdelay, align 8
  %16 = fcmp oeq double %15, 0.000000e+00
  br i1 %16, label %26, label %17

17:                                               ; preds = %8
  %18 = load double, ptr @curdelay, align 8
  %19 = fmul double %14, 1.000000e-01
  %20 = tail call double @llvm.fmuladd.f64(double %18, double 9.000000e-01, double %19)
  %21 = fcmp ogt double %20, %15
  %22 = select i1 %21, double %20, double %15
  %23 = load double, ptr @mindelay, align 8
  %24 = fcmp olt double %20, %23
  %25 = select i1 %24, double %20, double %23
  br label %26

26:                                               ; preds = %8, %17
  %27 = phi double [ %20, %17 ], [ %14, %8 ]
  %28 = phi double [ %22, %17 ], [ %14, %8 ]
  %29 = phi double [ %25, %17 ], [ %14, %8 ]
  store double %27, ptr @curdelay, align 8
  store double %28, ptr @maxdelay, align 8
  store double %29, ptr @mindelay, align 8
  %30 = load i64, ptr @uiEnd, align 8
  br label %31

31:                                               ; preds = %26, %3
  %32 = phi i64 [ %30, %26 ], [ %5, %3 ]
  store i64 %32, ptr @uiBegin, align 8
  %33 = load i32, ptr @systickcount, align 4
  %34 = add i32 %33, 1
  store i32 %34, ptr @systickcount, align 4
  tail call void @Indicate_SYSTICK_CNT(i32 noundef %34) #7
  %35 = load double, ptr @curdelay, align 8
  %36 = fptoui double %35 to i32
  tail call void @Indicate_TASK_CurDelay_ns(i32 noundef %36) #7
  %37 = load double, ptr @maxdelay, align 8
  %38 = fptoui double %37 to i32
  tail call void @Indicate_TASK_MaxDelay_ns(i32 noundef %38) #7
  %39 = load double, ptr @mindelay, align 8
  %40 = fptoui double %39 to i32
  tail call void @Indicate_TASK_MinDelay_ns(i32 noundef %40) #7
  br label %41

41:                                               ; preds = %31, %0
  ret void
}

declare dso_local i32 @WaitForRtSemaphore(i16 noundef zeroext, i16 noundef zeroext, i32 noundef) local_unnamed_addr #2

declare dso_local i64 @WatchDog_GetPentiumCounter() local_unnamed_addr #2

declare dso_local double @Watchdog_Calc(i64 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #4

declare dso_local void @Indicate_SYSTICK_CNT(i32 noundef) local_unnamed_addr #2

declare dso_local void @Indicate_TASK_CurDelay_ns(i32 noundef) local_unnamed_addr #2

declare dso_local void @Indicate_TASK_MaxDelay_ns(i32 noundef) local_unnamed_addr #2

declare dso_local void @Indicate_TASK_MinDelay_ns(i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Engine_Stop() local_unnamed_addr #5 {
  %1 = load ptr, ptr @sqtbl, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %5, label %3

3:                                                ; preds = %0
  %4 = getelementptr inbounds nuw i8, ptr %1, i32 32
  store i8 0, ptr %4, align 1
  br label %5

5:                                                ; preds = %3, %0
  store i32 8, ptr @status_engine, align 4
  ret void
}

; Function Attrs: nounwind
define dso_local void @Engine_Start() local_unnamed_addr #0 {
  tail call void @Watchdog_Reset() #7
  store i8 0, ptr @Engine_PhaseStop, align 1
  store i32 0, ptr @systickcount, align 4
  store double 0.000000e+00, ptr @curdelay, align 8
  store double 0.000000e+00, ptr @maxdelay, align 8
  store double 0.000000e+00, ptr @mindelay, align 8
  store i64 0, ptr @uiEnd, align 8
  store i64 0, ptr @uiBegin, align 8
  %1 = load ptr, ptr @sqtbl, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %5, label %3

3:                                                ; preds = %0
  %4 = getelementptr inbounds nuw i8, ptr %1, i32 32
  store i8 1, ptr %4, align 1
  br label %5

5:                                                ; preds = %3, %0
  store i32 6, ptr @status_engine, align 4
  ret void
}

declare dso_local void @Watchdog_Reset() local_unnamed_addr #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local zeroext i8 @Engine_IsStart() local_unnamed_addr #6 {
  %1 = load ptr, ptr @sqtbl, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %6, label %3

3:                                                ; preds = %0
  %4 = getelementptr inbounds nuw i8, ptr %1, i32 32
  %5 = load i8, ptr %4, align 1
  br label %6

6:                                                ; preds = %0, %3
  %7 = phi i8 [ %5, %3 ], [ 0, %0 ]
  ret i8 %7
}

declare dso_local zeroext i16 @GetRtThreadHandles(i8 noundef zeroext) local_unnamed_addr #2

declare dso_local void @Indicate_TASK_Period_us(i32 noundef) local_unnamed_addr #2

declare dso_local void @knRtSleep(i32 noundef) local_unnamed_addr #2

declare dso_local void @InternalClock_Wait() local_unnamed_addr #2

declare dso_local i32 @InternalClock_IsPlcFireTiming(i32 noundef) local_unnamed_addr #2

declare dso_local void @WatchDog_Action_OverRun() local_unnamed_addr #2

declare dso_local void @Logic_Scan() #2

declare dso_local void @Watchdog_Process(i64 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @Engine_WaitStop() local_unnamed_addr #0 {
  %1 = load i8, ptr @Engine_PhaseStop, align 1
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %3, label %6

3:                                                ; preds = %0, %3
  tail call void @knRtSleep(i32 noundef 1) #7
  %4 = load i8, ptr @Engine_PhaseStop, align 1
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %3, label %6

6:                                                ; preds = %3, %0
  ret void
}

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\engine.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
