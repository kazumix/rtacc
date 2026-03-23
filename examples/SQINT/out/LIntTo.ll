; ModuleID = '..\PLCPIEC\LIntTo.c'
source_filename = "..\\PLCPIEC\\LIntTo.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_0O@JHLDCMAC@LINT_TO_LREAL?$AA@" = comdat any

$"??_C@_0N@LOCGBHOE@LINT_TO_REAL?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@LINT_TO_REAL_EXACT_LIMIT_MAX = dso_local local_unnamed_addr constant i32 16777216, align 4
@LINT_TO_REAL_EXACT_LIMIT_MIN = dso_local local_unnamed_addr constant i32 -16777216, align 4
@LREAL_EXACT_LIMIT_MAX = dso_local local_unnamed_addr constant i64 9007199254740992, align 8
@LREAL_EXACT_LIMIT_MIN = dso_local local_unnamed_addr constant i64 -9007199254740992, align 8
@STAT_ENO_LINT_TO = dso_local local_unnamed_addr global i8 0, align 1
@"??_C@_0O@JHLDCMAC@LINT_TO_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"LINT_TO_LREAL\00", comdat, align 1
@"??_C@_0N@LOCGBHOE@LINT_TO_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"LINT_TO_REAL\00", comdat, align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport void @SetLIntToEno(i8 noundef signext %0) local_unnamed_addr #0 {
  store i8 %0, ptr @STAT_ENO_LINT_TO, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport signext i8 @GetLIntToEno() local_unnamed_addr #1 {
  %1 = load i8, ptr @STAT_ENO_LINT_TO, align 1
  ret i8 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LINT_TO_B_BCD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 16, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i64, ptr %6, align 8
  %8 = icmp ugt i64 %7, 99
  br i1 %8, label %15, label %9

9:                                                ; preds = %4
  %10 = trunc nuw nsw i64 %7 to i8
  %11 = udiv i8 %10, 10
  %12 = shl nuw i8 %11, 4
  %13 = urem i8 %10, 10
  %14 = or disjoint i8 %12, %13
  br label %15

15:                                               ; preds = %4, %9
  %16 = phi i8 [ %14, %9 ], [ -1, %4 ]
  store i8 %16, ptr %6, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LINT_TO_BOOL(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i64, ptr %6, align 8
  %8 = icmp ne i64 %7, 0
  %9 = zext i1 %8 to i8
  store i8 %9, ptr %6, align 8
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LINT_TO_BYTE(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 16, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i64, ptr %6, align 8
  %8 = trunc i64 %7 to i8
  store i8 %8, ptr %6, align 8
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LINT_TO_D_BCD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 18, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i64, ptr %6, align 8
  %8 = icmp ugt i64 %7, 99999999
  br i1 %8, label %45, label %9

9:                                                ; preds = %4
  %10 = trunc nuw nsw i64 %7 to i32
  %11 = udiv i32 %10, 10000000
  %12 = shl nuw i32 %11, 28
  %13 = urem i32 %10, 10000000
  %14 = udiv i32 %13, 1000000
  %15 = shl nuw nsw i32 %14, 24
  %16 = urem i32 %10, 1000000
  %17 = udiv i32 %16, 100000
  %18 = shl nuw nsw i32 %17, 20
  %19 = urem i32 %10, 100000
  %20 = udiv i32 %19, 10000
  %21 = shl nuw nsw i32 %20, 16
  %22 = urem i32 %10, 10000
  %23 = trunc nuw nsw i32 %22 to i16
  %24 = udiv i16 %23, 1000
  %25 = zext nneg i16 %24 to i32
  %26 = shl nuw nsw i32 %25, 12
  %27 = urem i32 %10, 1000
  %28 = trunc nuw nsw i32 %27 to i16
  %29 = udiv i16 %28, 100
  %30 = shl nuw nsw i16 %29, 8
  %31 = zext nneg i16 %30 to i32
  %32 = urem i32 %10, 100
  %33 = trunc nuw nsw i32 %32 to i8
  %34 = udiv i8 %33, 10
  %35 = shl nuw i8 %34, 4
  %36 = zext i8 %35 to i32
  %37 = urem i32 %10, 10
  %38 = or disjoint i32 %12, %37
  %39 = add nuw nsw i32 %38, %15
  %40 = or disjoint i32 %39, %18
  %41 = or disjoint i32 %40, %21
  %42 = add nuw nsw i32 %41, %26
  %43 = or disjoint i32 %42, %31
  %44 = add nuw nsw i32 %43, %36
  br label %45

45:                                               ; preds = %4, %9
  %46 = phi i32 [ %44, %9 ], [ -1, %4 ]
  store i32 %46, ptr %6, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LINT_TO_DINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 262, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i64, ptr %6, align 8
  %8 = trunc i64 %7 to i32
  store i32 %8, ptr %6, align 8
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LINT_TO_DWORD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 18, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i64, ptr %6, align 8
  %8 = trunc i64 %7 to i32
  store i32 %8, ptr %6, align 8
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LINT_TO_INT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 261, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i64, ptr %6, align 8
  %8 = trunc i64 %7 to i16
  store i16 %8, ptr %6, align 8
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @LINT_TO_LREAL(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #3 {
  store i8 1, ptr @STAT_ENO_LINT_TO, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = load i64, ptr %5, align 8
  %7 = add i64 %6, -9007199254740993
  %8 = icmp ult i64 %7, -18014398509481985
  br i1 %8, label %9, label %11

9:                                                ; preds = %4
  tail call void @Eexception_Post(i32 noundef 5, ptr noundef nonnull @"??_C@_0O@JHLDCMAC@LINT_TO_LREAL?$AA@") #5
  store i8 0, ptr @STAT_ENO_LINT_TO, align 1
  %10 = load ptr, ptr %0, align 1
  br label %11

11:                                               ; preds = %4, %9
  %12 = phi ptr [ %5, %4 ], [ %10, %9 ]
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 783, ptr %13, align 1
  %14 = load i64, ptr %12, align 8
  %15 = sitofp i64 %14 to double
  store double %15, ptr %12, align 8
  ret ptr %0
}

declare dso_local void @Eexception_Post(i32 noundef, ptr noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @LINT_TO_REAL(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #3 {
  store i8 1, ptr @STAT_ENO_LINT_TO, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = load i64, ptr %5, align 8
  %7 = add i64 %6, -16777217
  %8 = icmp ult i64 %7, -33554433
  br i1 %8, label %9, label %11

9:                                                ; preds = %4
  tail call void @Eexception_Post(i32 noundef 5, ptr noundef nonnull @"??_C@_0N@LOCGBHOE@LINT_TO_REAL?$AA@") #5
  store i8 0, ptr @STAT_ENO_LINT_TO, align 1
  %10 = load ptr, ptr %0, align 1
  br label %11

11:                                               ; preds = %4, %9
  %12 = phi ptr [ %5, %4 ], [ %10, %9 ]
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 782, ptr %13, align 1
  %14 = load i64, ptr %12, align 8
  %15 = sitofp i64 %14 to float
  store float %15, ptr %12, align 8
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LINT_TO_SINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 260, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i64, ptr %6, align 8
  %8 = trunc i64 %7 to i8
  store i8 %8, ptr %6, align 8
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LINT_TO_UDINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 514, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i64, ptr %6, align 8
  %8 = trunc i64 %7 to i32
  store i32 %8, ptr %6, align 8
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LINT_TO_UINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 513, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i64, ptr %6, align 8
  %8 = trunc i64 %7 to i16
  store i16 %8, ptr %6, align 8
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LINT_TO_USINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 512, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i64, ptr %6, align 8
  %8 = trunc i64 %7 to i8
  store i8 %8, ptr %6, align 8
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LINT_TO_W_BCD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 17, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i64, ptr %6, align 8
  %8 = icmp ugt i64 %7, 9999
  br i1 %8, label %25, label %9

9:                                                ; preds = %4
  %10 = trunc nuw nsw i64 %7 to i16
  %11 = udiv i16 %10, 1000
  %12 = shl nuw i16 %11, 12
  %13 = urem i16 %10, 1000
  %14 = udiv i16 %13, 100
  %15 = shl nuw nsw i16 %14, 8
  %16 = urem i16 %10, 100
  %17 = trunc nuw nsw i16 %16 to i8
  %18 = udiv i8 %17, 10
  %19 = shl nuw i8 %18, 4
  %20 = zext i8 %19 to i16
  %21 = urem i16 %10, 10
  %22 = or disjoint i16 %15, %12
  %23 = or disjoint i16 %22, %20
  %24 = or disjoint i16 %23, %21
  br label %25

25:                                               ; preds = %4, %9
  %26 = phi i16 [ %24, %9 ], [ -1, %4 ]
  store i16 %26, ptr %6, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LINT_TO_WORD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 17, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i64, ptr %6, align 8
  %8 = trunc i64 %7 to i16
  store i16 %8, ptr %6, align 8
  ret ptr %0
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCPIEC\\LIntTo.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
