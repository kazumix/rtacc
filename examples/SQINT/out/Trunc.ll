; ModuleID = '..\PLCPIEC\Trunc.c'
source_filename = "..\\PLCPIEC\\Trunc.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_0O@PNGJGHOM@TRUNC_SINT?3IN?$AA@" = comdat any

$"??_C@_0N@KMAOEGGI@TRUNC_INT?3IN?$AA@" = comdat any

$"??_C@_0O@ILBHFPNO@TRUNC_DINT?3IN?$AA@" = comdat any

$"??_C@_0P@MOFIMOCI@TRUNC_LREAL?3IN?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@TRUNC_TO_EXACT_LIMIT_MAX = dso_local local_unnamed_addr constant i32 16777216, align 4
@TRUNC_TO_EXACT_LIMIT_MIN = dso_local local_unnamed_addr constant i32 -16777216, align 4
@STAT_ENO_TRUNC = dso_local local_unnamed_addr global i8 0, align 1
@"??_C@_0O@PNGJGHOM@TRUNC_SINT?3IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"TRUNC_SINT:IN\00", comdat, align 1
@"??_C@_0N@KMAOEGGI@TRUNC_INT?3IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"TRUNC_INT:IN\00", comdat, align 1
@"??_C@_0O@ILBHFPNO@TRUNC_DINT?3IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"TRUNC_DINT:IN\00", comdat, align 1
@"??_C@_0P@MOFIMOCI@TRUNC_LREAL?3IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"TRUNC_LREAL:IN\00", comdat, align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport void @SetTruncEno(i8 noundef signext %0) local_unnamed_addr #0 {
  store i8 %0, ptr @STAT_ENO_TRUNC, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport signext i8 @GetTruncEno() local_unnamed_addr #1 {
  %1 = load i8, ptr @STAT_ENO_TRUNC, align 1
  ret i8 %1
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @TRUNC_SINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_TRUNC, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 260, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load float, ptr %6, align 4
  %8 = tail call i32 @ChckREAL(float noundef %7) #4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0O@PNGJGHOM@TRUNC_SINT?3IN?$AA@") #4
  store i8 0, ptr @STAT_ENO_TRUNC, align 1
  %11 = load ptr, ptr %0, align 1
  store i8 0, ptr %11, align 1
  br label %21

12:                                               ; preds = %4
  %13 = load ptr, ptr %0, align 1
  %14 = load float, ptr %13, align 4
  %15 = fptosi float %14 to i64
  %16 = add i64 %15, -128
  %17 = icmp ult i64 %16, -256
  br i1 %17, label %18, label %19

18:                                               ; preds = %12
  store i8 0, ptr @STAT_ENO_TRUNC, align 1
  store i8 0, ptr %13, align 1
  br label %21

19:                                               ; preds = %12
  %20 = fptosi float %14 to i8
  store i8 %20, ptr %13, align 1
  br label %21

21:                                               ; preds = %18, %19, %10
  ret ptr %0
}

declare dso_local i32 @ChckREAL(float noundef) local_unnamed_addr #3

declare dso_local void @Eexception_Post(i32 noundef, ptr noundef) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @TRUNC_INT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_TRUNC, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 261, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load float, ptr %6, align 4
  %8 = tail call i32 @ChckREAL(float noundef %7) #4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0N@KMAOEGGI@TRUNC_INT?3IN?$AA@") #4
  store i8 0, ptr @STAT_ENO_TRUNC, align 1
  %11 = load ptr, ptr %0, align 1
  store i16 0, ptr %11, align 2
  br label %21

12:                                               ; preds = %4
  %13 = load ptr, ptr %0, align 1
  %14 = load float, ptr %13, align 4
  %15 = fptosi float %14 to i64
  %16 = add i64 %15, -32768
  %17 = icmp ult i64 %16, -65536
  br i1 %17, label %18, label %19

18:                                               ; preds = %12
  store i8 0, ptr @STAT_ENO_TRUNC, align 1
  store i16 0, ptr %13, align 2
  br label %21

19:                                               ; preds = %12
  %20 = fptosi float %14 to i16
  store i16 %20, ptr %13, align 2
  br label %21

21:                                               ; preds = %18, %19, %10
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @TRUNC_DINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_TRUNC, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 262, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load float, ptr %6, align 4
  %8 = tail call i32 @ChckREAL(float noundef %7) #4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0O@ILBHFPNO@TRUNC_DINT?3IN?$AA@") #4
  store i8 0, ptr @STAT_ENO_TRUNC, align 1
  %11 = load ptr, ptr %0, align 1
  store i32 -2147483648, ptr %11, align 4
  br label %21

12:                                               ; preds = %4
  %13 = load ptr, ptr %0, align 1
  %14 = load float, ptr %13, align 4
  %15 = fptosi float %14 to i64
  %16 = add i64 %15, -16777216
  %17 = icmp ult i64 %16, -33554431
  br i1 %17, label %18, label %19

18:                                               ; preds = %12
  store i8 0, ptr @STAT_ENO_TRUNC, align 1
  store i32 0, ptr %13, align 4
  br label %21

19:                                               ; preds = %12
  %20 = fptosi float %14 to i32
  store i32 %20, ptr %13, align 4
  br label %21

21:                                               ; preds = %18, %19, %10
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @TRUNC_LINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_TRUNC, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 263, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load float, ptr %6, align 4
  %8 = tail call i32 @ChckREAL(float noundef %7) #4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0P@MOFIMOCI@TRUNC_LREAL?3IN?$AA@") #4
  store i8 0, ptr @STAT_ENO_TRUNC, align 1
  %11 = load ptr, ptr %0, align 1
  store i64 -9223372036854775808, ptr %11, align 8
  br label %20

12:                                               ; preds = %4
  %13 = load ptr, ptr %0, align 1
  %14 = load float, ptr %13, align 4
  %15 = fptosi float %14 to i64
  %16 = add i64 %15, -16777216
  %17 = icmp ult i64 %16, -33554431
  br i1 %17, label %18, label %19

18:                                               ; preds = %12
  store i8 0, ptr @STAT_ENO_TRUNC, align 1
  store i64 0, ptr %13, align 8
  br label %20

19:                                               ; preds = %12
  store i64 %15, ptr %13, align 8
  br label %20

20:                                               ; preds = %18, %19, %10
  ret ptr %0
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCPIEC\\Trunc.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
