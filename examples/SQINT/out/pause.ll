; ModuleID = '..\PLCP\pause.c'
source_filename = "..\\PLCP\\pause.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_06OAFNIPMP@SQSUSP?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@status_pause = dso_local local_unnamed_addr global i32 0, align 4
@sqtbl = external dso_local local_unnamed_addr global ptr, align 4
@"??_C@_06OAFNIPMP@SQSUSP?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"SQSUSP\00", comdat, align 1

; Function Attrs: nounwind
define dso_local void @Pause_Init() local_unnamed_addr #0 {
  %1 = load ptr, ptr @sqtbl, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %12, label %3

3:                                                ; preds = %0
  %4 = getelementptr inbounds nuw i8, ptr %1, i32 41
  %5 = load i16, ptr %4, align 1
  %6 = icmp eq i16 %5, 0
  br i1 %6, label %7, label %12

7:                                                ; preds = %3
  %8 = tail call zeroext i16 @CreateRtSemaphore(i16 noundef zeroext 0, i16 noundef zeroext 1, i16 noundef zeroext 0) #4
  %9 = load ptr, ptr @sqtbl, align 4
  %10 = getelementptr inbounds nuw i8, ptr %9, i32 41
  store i16 %8, ptr %10, align 1
  %11 = tail call zeroext i8 @Catalog(i16 noundef zeroext 0, i16 noundef zeroext %8, ptr noundef nonnull @"??_C@_06OAFNIPMP@SQSUSP?$AA@") #4
  store i32 2, ptr @status_pause, align 4
  br label %12

12:                                               ; preds = %3, %7, %0
  ret void
}

declare dso_local zeroext i16 @CreateRtSemaphore(i16 noundef zeroext, i16 noundef zeroext, i16 noundef zeroext) local_unnamed_addr #1

declare dso_local zeroext i8 @Catalog(i16 noundef zeroext, i16 noundef zeroext, ptr noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local zeroext range(i8 0, 2) i8 @Pause_IsEnable() local_unnamed_addr #2 {
  %1 = load ptr, ptr @sqtbl, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %8, label %3

3:                                                ; preds = %0
  %4 = getelementptr inbounds nuw i8, ptr %1, i32 39
  %5 = load i8, ptr %4, align 1
  %6 = icmp ne i8 %5, 0
  %7 = zext i1 %6 to i8
  br label %8

8:                                                ; preds = %0, %3
  %9 = phi i8 [ %7, %3 ], [ 0, %0 ]
  ret i8 %9
}

; Function Attrs: nounwind
define dso_local void @Pause_WaitTrigger() local_unnamed_addr #0 {
  %1 = load i32, ptr @status_pause, align 4
  %2 = load ptr, ptr @sqtbl, align 4
  %3 = icmp eq ptr %2, null
  br i1 %3, label %14, label %4

4:                                                ; preds = %0
  %5 = getelementptr inbounds nuw i8, ptr %2, i32 41
  %6 = load i16, ptr %5, align 1
  %7 = tail call zeroext i16 @GetRtHandleType(i16 noundef zeroext %6) #4
  %8 = icmp eq i16 %7, 4
  br i1 %8, label %9, label %14

9:                                                ; preds = %4
  store i32 4, ptr @status_pause, align 4
  %10 = load ptr, ptr @sqtbl, align 4
  %11 = getelementptr inbounds nuw i8, ptr %10, i32 41
  %12 = load i16, ptr %11, align 1
  %13 = tail call i32 @WaitForRtSemaphore(i16 noundef zeroext %12, i16 noundef zeroext 1, i32 noundef -1) #4
  store i32 %1, ptr @status_pause, align 4
  br label %14

14:                                               ; preds = %4, %9, %0
  ret void
}

declare dso_local zeroext i16 @GetRtHandleType(i16 noundef zeroext) local_unnamed_addr #1

declare dso_local i32 @WaitForRtSemaphore(i16 noundef zeroext, i16 noundef zeroext, i32 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Pause_Enable() local_unnamed_addr #3 {
  %1 = load ptr, ptr @sqtbl, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %5, label %3

3:                                                ; preds = %0
  %4 = getelementptr inbounds nuw i8, ptr %1, i32 39
  store i8 1, ptr %4, align 1
  store i32 6, ptr @status_pause, align 4
  br label %5

5:                                                ; preds = %3, %0
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Pause_Disable() local_unnamed_addr #3 {
  %1 = load ptr, ptr @sqtbl, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %5, label %3

3:                                                ; preds = %0
  %4 = getelementptr inbounds nuw i8, ptr %1, i32 39
  store i8 0, ptr %4, align 1
  store i32 2, ptr @status_pause, align 4
  br label %5

5:                                                ; preds = %3, %0
  ret void
}

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\pause.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
