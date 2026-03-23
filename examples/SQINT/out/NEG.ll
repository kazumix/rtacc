; ModuleID = '..\PLCPIEC\NEG.c'
source_filename = "..\\PLCPIEC\\NEG.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_0N@LOKHDEGE@NEG_REAL?3IN1?$AA@" = comdat any

$"??_C@_0O@DJBEJHAJ@NEG_LREAL?3IN1?$AA@" = comdat any

$"??_C@_08CPNDJEKO@NEG_SINT?$AA@" = comdat any

$"??_C@_08PNBDNPDM@NEG_DINT?$AA@" = comdat any

$"??_C@_07FKCIOHHE@NEG_INT?$AA@" = comdat any

$"??_C@_08MNGDJEPN@NEG_LINT?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@STAT_ENO_NEG = dso_local local_unnamed_addr global i8 0, align 1
@"??_C@_0N@LOKHDEGE@NEG_REAL?3IN1?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"NEG_REAL:IN1\00", comdat, align 1
@"??_C@_0O@DJBEJHAJ@NEG_LREAL?3IN1?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"NEG_LREAL:IN1\00", comdat, align 1
@"??_C@_08CPNDJEKO@NEG_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"NEG_SINT\00", comdat, align 1
@"??_C@_08PNBDNPDM@NEG_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"NEG_DINT\00", comdat, align 1
@"??_C@_07FKCIOHHE@NEG_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"NEG_INT\00", comdat, align 1
@"??_C@_08MNGDJEPN@NEG_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"NEG_LINT\00", comdat, align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport void @SetNegEno(i8 noundef signext %0) local_unnamed_addr #0 {
  store i8 %0, ptr @STAT_ENO_NEG, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport signext i8 @GetNegEno() local_unnamed_addr #1 {
  %1 = load i8, ptr @STAT_ENO_NEG, align 1
  ret i8 %1
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @NEG(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %87 [
    i16 782, label %7
    i16 783, label %17
    i16 260, label %27
    i16 262, label %35
    i16 261, label %43
    i16 263, label %51
    i16 514, label %59
    i16 513, label %63
    i16 512, label %67
    i16 515, label %71
    i16 17, label %75
    i16 16, label %79
    i16 18, label %83
  ]

7:                                                ; preds = %4
  store i8 1, ptr @STAT_ENO_NEG, align 1
  %8 = load ptr, ptr %0, align 1
  %9 = load float, ptr %8, align 4
  %10 = tail call i32 @ChckREAL(float noundef %9) #5
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %13, label %12

12:                                               ; preds = %7
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0N@LOKHDEGE@NEG_REAL?3IN1?$AA@") #5
  store i8 0, ptr @STAT_ENO_NEG, align 1
  br label %13

13:                                               ; preds = %7, %12
  store i16 782, ptr %5, align 1
  %14 = load ptr, ptr %0, align 1
  %15 = load float, ptr %14, align 4
  %16 = fneg float %15
  store float %16, ptr %14, align 4
  br label %87

17:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_NEG, align 1
  %18 = load ptr, ptr %0, align 1
  %19 = load double, ptr %18, align 8
  %20 = tail call i32 @ChckLREAL(double noundef %19) #5
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %23, label %22

22:                                               ; preds = %17
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0O@DJBEJHAJ@NEG_LREAL?3IN1?$AA@") #5
  store i8 0, ptr @STAT_ENO_NEG, align 1
  br label %23

23:                                               ; preds = %17, %22
  store i16 783, ptr %5, align 1
  %24 = load ptr, ptr %0, align 1
  %25 = load double, ptr %24, align 8
  %26 = fneg double %25
  store double %26, ptr %24, align 8
  br label %87

27:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_NEG, align 1
  store i16 260, ptr %5, align 1
  %28 = load ptr, ptr %0, align 1
  %29 = load i8, ptr %28, align 1
  %30 = sub i8 0, %29
  store i8 %30, ptr %28, align 1
  %31 = load ptr, ptr %0, align 1
  %32 = load i8, ptr %31, align 1
  %33 = icmp eq i8 %32, -128
  br i1 %33, label %34, label %87

34:                                               ; preds = %27
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_08CPNDJEKO@NEG_SINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_NEG, align 1
  br label %87

35:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_NEG, align 1
  store i16 262, ptr %5, align 1
  %36 = load ptr, ptr %0, align 1
  %37 = load i32, ptr %36, align 4
  %38 = sub nsw i32 0, %37
  store i32 %38, ptr %36, align 4
  %39 = load ptr, ptr %0, align 1
  %40 = load i32, ptr %39, align 4
  %41 = icmp eq i32 %40, -2147483648
  br i1 %41, label %42, label %87

42:                                               ; preds = %35
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_08PNBDNPDM@NEG_DINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_NEG, align 1
  br label %87

43:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_NEG, align 1
  store i16 261, ptr %5, align 1
  %44 = load ptr, ptr %0, align 1
  %45 = load i16, ptr %44, align 2
  %46 = sub i16 0, %45
  store i16 %46, ptr %44, align 2
  %47 = load ptr, ptr %0, align 1
  %48 = load i16, ptr %47, align 2
  %49 = icmp eq i16 %48, -32768
  br i1 %49, label %50, label %87

50:                                               ; preds = %43
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_07FKCIOHHE@NEG_INT?$AA@") #5
  store i8 0, ptr @STAT_ENO_NEG, align 1
  br label %87

51:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_NEG, align 1
  store i16 263, ptr %5, align 1
  %52 = load ptr, ptr %0, align 1
  %53 = load i64, ptr %52, align 8
  %54 = sub nsw i64 0, %53
  store i64 %54, ptr %52, align 8
  %55 = load ptr, ptr %0, align 1
  %56 = load i64, ptr %55, align 8
  %57 = icmp eq i64 %56, -9223372036854775808
  br i1 %57, label %58, label %87

58:                                               ; preds = %51
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_08MNGDJEPN@NEG_LINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_NEG, align 1
  br label %87

59:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_NEG, align 1
  store i16 514, ptr %5, align 1
  %60 = load ptr, ptr %0, align 1
  %61 = load i32, ptr %60, align 4
  %62 = sub i32 0, %61
  store i32 %62, ptr %60, align 4
  br label %87

63:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_NEG, align 1
  store i16 513, ptr %5, align 1
  %64 = load ptr, ptr %0, align 1
  %65 = load i16, ptr %64, align 2
  %66 = sub i16 0, %65
  store i16 %66, ptr %64, align 2
  br label %87

67:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_NEG, align 1
  store i16 512, ptr %5, align 1
  %68 = load ptr, ptr %0, align 1
  %69 = load i8, ptr %68, align 1
  %70 = sub i8 0, %69
  store i8 %70, ptr %68, align 1
  br label %87

71:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_NEG, align 1
  store i16 515, ptr %5, align 1
  %72 = load ptr, ptr %0, align 1
  %73 = load i64, ptr %72, align 8
  %74 = sub i64 0, %73
  store i64 %74, ptr %72, align 8
  br label %87

75:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_NEG, align 1
  store i16 513, ptr %5, align 1
  %76 = load ptr, ptr %0, align 1
  %77 = load i16, ptr %76, align 2
  %78 = sub i16 0, %77
  store i16 %78, ptr %76, align 2
  br label %87

79:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_NEG, align 1
  store i16 512, ptr %5, align 1
  %80 = load ptr, ptr %0, align 1
  %81 = load i8, ptr %80, align 1
  %82 = sub i8 0, %81
  store i8 %82, ptr %80, align 1
  br label %87

83:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_NEG, align 1
  store i16 514, ptr %5, align 1
  %84 = load ptr, ptr %0, align 1
  %85 = load i32, ptr %84, align 4
  %86 = sub i32 0, %85
  store i32 %86, ptr %84, align 4
  br label %87

87:                                               ; preds = %58, %51, %50, %43, %42, %35, %34, %27, %4, %83, %79, %75, %71, %67, %63, %59, %23, %13
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @NEG_REAL(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_NEG, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = load float, ptr %5, align 4
  %7 = tail call i32 @ChckREAL(float noundef %6) #5
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0N@LOKHDEGE@NEG_REAL?3IN1?$AA@") #5
  store i8 0, ptr @STAT_ENO_NEG, align 1
  br label %10

10:                                               ; preds = %9, %4
  %11 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 782, ptr %11, align 1
  %12 = load ptr, ptr %0, align 1
  %13 = load float, ptr %12, align 4
  %14 = fneg float %13
  store float %14, ptr %12, align 4
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @NEG_LREAL(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_NEG, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = load double, ptr %5, align 8
  %7 = tail call i32 @ChckLREAL(double noundef %6) #5
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0O@DJBEJHAJ@NEG_LREAL?3IN1?$AA@") #5
  store i8 0, ptr @STAT_ENO_NEG, align 1
  br label %10

10:                                               ; preds = %9, %4
  %11 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 783, ptr %11, align 1
  %12 = load ptr, ptr %0, align 1
  %13 = load double, ptr %12, align 8
  %14 = fneg double %13
  store double %14, ptr %12, align 8
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @NEG_SINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_NEG, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 260, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i8, ptr %6, align 1
  %8 = sub i8 0, %7
  store i8 %8, ptr %6, align 1
  %9 = load ptr, ptr %0, align 1
  %10 = load i8, ptr %9, align 1
  %11 = icmp eq i8 %10, -128
  br i1 %11, label %12, label %13

12:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_08CPNDJEKO@NEG_SINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_NEG, align 1
  br label %13

13:                                               ; preds = %12, %4
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @NEG_DINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_NEG, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 262, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = sub nsw i32 0, %7
  store i32 %8, ptr %6, align 4
  %9 = load ptr, ptr %0, align 1
  %10 = load i32, ptr %9, align 4
  %11 = icmp eq i32 %10, -2147483648
  br i1 %11, label %12, label %13

12:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_08PNBDNPDM@NEG_DINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_NEG, align 1
  br label %13

13:                                               ; preds = %12, %4
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @NEG_INT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_NEG, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 261, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i16, ptr %6, align 2
  %8 = sub i16 0, %7
  store i16 %8, ptr %6, align 2
  %9 = load ptr, ptr %0, align 1
  %10 = load i16, ptr %9, align 2
  %11 = icmp eq i16 %10, -32768
  br i1 %11, label %12, label %13

12:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_07FKCIOHHE@NEG_INT?$AA@") #5
  store i8 0, ptr @STAT_ENO_NEG, align 1
  br label %13

13:                                               ; preds = %12, %4
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @NEG_LINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_NEG, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 263, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i64, ptr %6, align 8
  %8 = sub nsw i64 0, %7
  store i64 %8, ptr %6, align 8
  %9 = load ptr, ptr %0, align 1
  %10 = load i64, ptr %9, align 8
  %11 = icmp eq i64 %10, -9223372036854775808
  br i1 %11, label %12, label %13

12:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_08MNGDJEPN@NEG_LINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_NEG, align 1
  br label %13

13:                                               ; preds = %12, %4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @NEG_UDINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #3 {
  store i8 1, ptr @STAT_ENO_NEG, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 514, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = sub i32 0, %7
  store i32 %8, ptr %6, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @NEG_UINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #3 {
  store i8 1, ptr @STAT_ENO_NEG, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 513, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i16, ptr %6, align 2
  %8 = sub i16 0, %7
  store i16 %8, ptr %6, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @NEG_USINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #3 {
  store i8 1, ptr @STAT_ENO_NEG, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 512, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i8, ptr %6, align 1
  %8 = sub i8 0, %7
  store i8 %8, ptr %6, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @NEG_ULINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #3 {
  store i8 1, ptr @STAT_ENO_NEG, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 515, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i64, ptr %6, align 8
  %8 = sub i64 0, %7
  store i64 %8, ptr %6, align 8
  ret ptr %0
}

declare dso_local i32 @ChckREAL(float noundef) local_unnamed_addr #4

declare dso_local void @Eexception_Post(i32 noundef, ptr noundef) local_unnamed_addr #4

declare dso_local i32 @ChckLREAL(double noundef) local_unnamed_addr #4

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCPIEC\\NEG.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
