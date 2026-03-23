; ModuleID = '..\PLCPIEC\RealTo.c'
source_filename = "..\\PLCPIEC\\RealTo.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_0BA@COEDBKCN@REAL_TO_BOOL?3IN?$AA@" = comdat any

$"??_C@_0BA@EOEMCDPA@REAL_TO_BYTE?3IN?$AA@" = comdat any

$"??_C@_0BA@BADACJHG@REAL_TO_DINT?3IN?$AA@" = comdat any

$"??_C@_0BB@PELEAKEC@REAL_TO_DWORD?3IN?$AA@" = comdat any

$"??_C@_0P@OPLKFOKI@REAL_TO_INT?3IN?$AA@" = comdat any

$"??_C@_0BA@MDNFDCMD@REAL_TO_LINT?3IN?$AA@" = comdat any

$"??_C@_0BB@BGMOMCIE@REAL_TO_LREAL?3IN?$AA@" = comdat any

$"??_C@_0BA@GGEOBBEE@REAL_TO_SINT?3IN?$AA@" = comdat any

$"??_C@_0BB@MKBPAKOA@REAL_TO_UDINT?3IN?$AA@" = comdat any

$"??_C@_0BA@KACBBIMD@REAL_TO_UINT?3IN?$AA@" = comdat any

$"??_C@_0BB@LMGBDCNC@REAL_TO_USINT?3IN?$AA@" = comdat any

$"??_C@_0BA@JFCAHPOG@REAL_TO_WORD?3IN?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@REAL_TO_EXACT_LIMIT_MAX = dso_local local_unnamed_addr constant i32 16777216, align 4
@REAL_TO_EXACT_LIMIT_MIN = dso_local local_unnamed_addr constant i32 -16777216, align 4
@STAT_ENO_REAL_TO = dso_local local_unnamed_addr global i8 0, align 1
@"??_C@_0BA@COEDBKCN@REAL_TO_BOOL?3IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"REAL_TO_BOOL:IN\00", comdat, align 1
@"??_C@_0BA@EOEMCDPA@REAL_TO_BYTE?3IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"REAL_TO_BYTE:IN\00", comdat, align 1
@"??_C@_0BA@BADACJHG@REAL_TO_DINT?3IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"REAL_TO_DINT:IN\00", comdat, align 1
@"??_C@_0BB@PELEAKEC@REAL_TO_DWORD?3IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"REAL_TO_DWORD:IN\00", comdat, align 1
@"??_C@_0P@OPLKFOKI@REAL_TO_INT?3IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"REAL_TO_INT:IN\00", comdat, align 1
@"??_C@_0BA@MDNFDCMD@REAL_TO_LINT?3IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"REAL_TO_LINT:IN\00", comdat, align 1
@"??_C@_0BB@BGMOMCIE@REAL_TO_LREAL?3IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"REAL_TO_LREAL:IN\00", comdat, align 1
@"??_C@_0BA@GGEOBBEE@REAL_TO_SINT?3IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"REAL_TO_SINT:IN\00", comdat, align 1
@"??_C@_0BB@MKBPAKOA@REAL_TO_UDINT?3IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"REAL_TO_UDINT:IN\00", comdat, align 1
@"??_C@_0BA@KACBBIMD@REAL_TO_UINT?3IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"REAL_TO_UINT:IN\00", comdat, align 1
@"??_C@_0BB@LMGBDCNC@REAL_TO_USINT?3IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"REAL_TO_USINT:IN\00", comdat, align 1
@"??_C@_0BA@JFCAHPOG@REAL_TO_WORD?3IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"REAL_TO_WORD:IN\00", comdat, align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport void @SetRealToEno(i8 noundef signext %0) local_unnamed_addr #0 {
  store i8 %0, ptr @STAT_ENO_REAL_TO, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport signext i8 @GetRealToEno() local_unnamed_addr #1 {
  %1 = load i8, ptr @STAT_ENO_REAL_TO, align 1
  ret i8 %1
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @REAL_TO_BOOL(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_REAL_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load float, ptr %6, align 4
  %8 = tail call i32 @ChckREAL(float noundef %7) #7
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0BA@COEDBKCN@REAL_TO_BOOL?3IN?$AA@") #7
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  %11 = load ptr, ptr %0, align 1
  store i8 1, ptr %11, align 1
  br label %17

12:                                               ; preds = %4
  %13 = load ptr, ptr %0, align 1
  %14 = load float, ptr %13, align 4
  %15 = fcmp une float %14, 0.000000e+00
  %16 = zext i1 %15 to i8
  store i8 %16, ptr %13, align 4
  br label %17

17:                                               ; preds = %12, %10
  ret ptr %0
}

declare dso_local i32 @ChckREAL(float noundef) local_unnamed_addr #3

declare dso_local void @Eexception_Post(i32 noundef, ptr noundef) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @REAL_TO_BYTE(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_REAL_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 16, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load float, ptr %6, align 4
  %8 = tail call i32 @ChckREAL(float noundef %7) #7
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0BA@EOEMCDPA@REAL_TO_BYTE?3IN?$AA@") #7
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  %11 = load ptr, ptr %0, align 1
  store i8 0, ptr %11, align 1
  br label %22

12:                                               ; preds = %4
  %13 = load ptr, ptr %0, align 1
  %14 = load float, ptr %13, align 4
  %15 = tail call float @llvm.round.f32(float %14)
  %16 = fcmp ogt float %15, 2.550000e+02
  %17 = fcmp olt float %15, 0.000000e+00
  %18 = or i1 %16, %17
  br i1 %18, label %19, label %20

19:                                               ; preds = %12
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  br label %20

20:                                               ; preds = %12, %19
  %21 = fptoui float %15 to i8
  store i8 %21, ptr %13, align 1
  br label %22

22:                                               ; preds = %20, %10
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @REAL_TO_DINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_REAL_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 262, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load float, ptr %6, align 4
  %8 = tail call i32 @ChckREAL(float noundef %7) #7
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0BA@BADACJHG@REAL_TO_DINT?3IN?$AA@") #7
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  %11 = load ptr, ptr %0, align 1
  store i32 -2147483648, ptr %11, align 4
  br label %35

12:                                               ; preds = %4
  %13 = load ptr, ptr %0, align 1
  %14 = load float, ptr %13, align 4
  %15 = fcmp olt float %14, 0.000000e+00
  br i1 %15, label %16, label %29

16:                                               ; preds = %12
  %17 = tail call { float, float } @llvm.modf.f32(float %14)
  %18 = extractvalue { float, float } %17, 0
  %19 = tail call float @llvm.fabs.f32(float %18)
  %20 = fcmp oge float %19, 5.000000e-01
  %21 = sext i1 %20 to i32
  %22 = uitofp i1 %20 to float
  %23 = fsub float %14, %22
  %24 = fcmp ugt float %23, 0xC170000000000000
  br i1 %24, label %26, label %25

25:                                               ; preds = %16
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  br label %26

26:                                               ; preds = %25, %16
  %27 = fptosi float %14 to i32
  %28 = add i32 %27, %21
  store i32 %28, ptr %13, align 4
  br label %35

29:                                               ; preds = %12
  %30 = tail call float @llvm.round.f32(float %14)
  %31 = fcmp ult float %30, 0x4170000000000000
  br i1 %31, label %33, label %32

32:                                               ; preds = %29
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  br label %33

33:                                               ; preds = %32, %29
  %34 = fptosi float %30 to i32
  store i32 %34, ptr %13, align 4
  br label %35

35:                                               ; preds = %26, %33, %10
  ret ptr %0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { float, float } @llvm.modf.f32(float) #4

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #5

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @REAL_TO_DWORD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_REAL_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 18, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load float, ptr %6, align 4
  %8 = tail call i32 @ChckREAL(float noundef %7) #7
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0BB@PELEAKEC@REAL_TO_DWORD?3IN?$AA@") #7
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  %11 = load ptr, ptr %0, align 1
  store i32 0, ptr %11, align 4
  br label %22

12:                                               ; preds = %4
  %13 = load ptr, ptr %0, align 1
  %14 = load float, ptr %13, align 4
  %15 = tail call float @llvm.round.f32(float %14)
  %16 = fcmp oge float %15, 0x4170000000000000
  %17 = fcmp olt float %15, 0.000000e+00
  %18 = or i1 %16, %17
  br i1 %18, label %19, label %20

19:                                               ; preds = %12
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  store i32 -1, ptr %13, align 4
  br label %22

20:                                               ; preds = %12
  %21 = fptoui float %15 to i32
  store i32 %21, ptr %13, align 4
  br label %22

22:                                               ; preds = %19, %20, %10
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @REAL_TO_INT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_REAL_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 261, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load float, ptr %6, align 4
  %8 = tail call i32 @ChckREAL(float noundef %7) #7
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0P@OPLKFOKI@REAL_TO_INT?3IN?$AA@") #7
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  %11 = load ptr, ptr %0, align 1
  store i16 0, ptr %11, align 2
  br label %35

12:                                               ; preds = %4
  %13 = load ptr, ptr %0, align 1
  %14 = load float, ptr %13, align 4
  %15 = fcmp olt float %14, 0.000000e+00
  br i1 %15, label %16, label %29

16:                                               ; preds = %12
  %17 = tail call { float, float } @llvm.modf.f32(float %14)
  %18 = extractvalue { float, float } %17, 0
  %19 = tail call float @llvm.fabs.f32(float %18)
  %20 = fcmp oge float %19, 5.000000e-01
  %21 = sext i1 %20 to i16
  %22 = uitofp i1 %20 to float
  %23 = fsub float %14, %22
  %24 = fcmp olt float %23, -3.276800e+04
  br i1 %24, label %25, label %26

25:                                               ; preds = %16
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  br label %26

26:                                               ; preds = %25, %16
  %27 = fptosi float %14 to i16
  %28 = add i16 %27, %21
  store i16 %28, ptr %13, align 2
  br label %35

29:                                               ; preds = %12
  %30 = fcmp ogt float %14, 3.276700e+04
  br i1 %30, label %31, label %32

31:                                               ; preds = %29
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  br label %32

32:                                               ; preds = %31, %29
  %33 = tail call float @llvm.round.f32(float %14)
  %34 = fptosi float %33 to i16
  store i16 %34, ptr %13, align 2
  br label %35

35:                                               ; preds = %26, %32, %10
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @REAL_TO_LINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_REAL_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 263, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load float, ptr %6, align 4
  %8 = tail call i32 @ChckREAL(float noundef %7) #7
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0BA@MDNFDCMD@REAL_TO_LINT?3IN?$AA@") #7
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  %11 = load ptr, ptr %0, align 1
  store i64 -9223372036854775808, ptr %11, align 8
  br label %35

12:                                               ; preds = %4
  %13 = load ptr, ptr %0, align 1
  %14 = load float, ptr %13, align 4
  %15 = fcmp olt float %14, 0.000000e+00
  br i1 %15, label %16, label %29

16:                                               ; preds = %12
  %17 = tail call { float, float } @llvm.modf.f32(float %14)
  %18 = extractvalue { float, float } %17, 0
  %19 = tail call float @llvm.fabs.f32(float %18)
  %20 = fcmp oge float %19, 5.000000e-01
  %21 = uitofp i1 %20 to float
  %22 = fsub float %14, %21
  %23 = fcmp ugt float %22, 0xC170000000000000
  br i1 %23, label %25, label %24

24:                                               ; preds = %16
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  store i64 -9223372036854775808, ptr %13, align 8
  br label %35

25:                                               ; preds = %16
  %26 = sext i1 %20 to i64
  %27 = fptosi float %14 to i64
  %28 = add i64 %26, %27
  store i64 %28, ptr %13, align 8
  br label %35

29:                                               ; preds = %12
  %30 = fcmp ult float %14, 0x4170000000000000
  br i1 %30, label %32, label %31

31:                                               ; preds = %29
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  store i64 -9223372036854775808, ptr %13, align 8
  br label %35

32:                                               ; preds = %29
  %33 = tail call float @llvm.round.f32(float %14)
  %34 = fptosi float %33 to i64
  store i64 %34, ptr %13, align 8
  br label %35

35:                                               ; preds = %25, %24, %32, %31, %10
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @REAL_TO_LREAL(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_REAL_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 783, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load float, ptr %6, align 4
  %8 = tail call i32 @ChckREAL(float noundef %7) #7
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %11, label %10

10:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0BB@BGMOMCIE@REAL_TO_LREAL?3IN?$AA@") #7
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  br label %11

11:                                               ; preds = %10, %4
  %12 = load ptr, ptr %0, align 1
  %13 = load float, ptr %12, align 4
  %14 = fpext float %13 to double
  store double %14, ptr %12, align 8
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @REAL_TO_SINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_REAL_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 260, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load float, ptr %6, align 4
  %8 = tail call i32 @ChckREAL(float noundef %7) #7
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0BA@GGEOBBEE@REAL_TO_SINT?3IN?$AA@") #7
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  %11 = load ptr, ptr %0, align 1
  store i8 0, ptr %11, align 1
  br label %35

12:                                               ; preds = %4
  %13 = load ptr, ptr %0, align 1
  %14 = load float, ptr %13, align 4
  %15 = fcmp olt float %14, 0.000000e+00
  br i1 %15, label %16, label %29

16:                                               ; preds = %12
  %17 = tail call { float, float } @llvm.modf.f32(float %14)
  %18 = extractvalue { float, float } %17, 0
  %19 = tail call float @llvm.fabs.f32(float %18)
  %20 = fcmp oge float %19, 5.000000e-01
  %21 = sext i1 %20 to i8
  %22 = uitofp i1 %20 to float
  %23 = fsub float %14, %22
  %24 = fcmp olt float %23, -1.280000e+02
  br i1 %24, label %25, label %26

25:                                               ; preds = %16
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  br label %26

26:                                               ; preds = %25, %16
  %27 = fptosi float %14 to i8
  %28 = add i8 %27, %21
  store i8 %28, ptr %13, align 1
  br label %35

29:                                               ; preds = %12
  %30 = tail call float @llvm.round.f32(float %14)
  %31 = fcmp ogt float %30, 1.270000e+02
  br i1 %31, label %32, label %33

32:                                               ; preds = %29
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  br label %33

33:                                               ; preds = %32, %29
  %34 = fptosi float %30 to i8
  store i8 %34, ptr %13, align 1
  br label %35

35:                                               ; preds = %26, %33, %10
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @REAL_TO_UDINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_REAL_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 514, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load float, ptr %6, align 4
  %8 = tail call i32 @ChckREAL(float noundef %7) #7
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0BB@MKBPAKOA@REAL_TO_UDINT?3IN?$AA@") #7
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  %11 = load ptr, ptr %0, align 1
  store i32 0, ptr %11, align 4
  br label %22

12:                                               ; preds = %4
  %13 = load ptr, ptr %0, align 1
  %14 = load float, ptr %13, align 4
  %15 = tail call float @llvm.round.f32(float %14)
  %16 = fcmp oge float %15, 0x4170000000000000
  %17 = fcmp olt float %15, 0.000000e+00
  %18 = or i1 %16, %17
  br i1 %18, label %19, label %20

19:                                               ; preds = %12
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  store i32 -2147483648, ptr %13, align 4
  br label %22

20:                                               ; preds = %12
  %21 = fptoui float %15 to i32
  store i32 %21, ptr %13, align 4
  br label %22

22:                                               ; preds = %19, %20, %10
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @REAL_TO_UINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_REAL_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 513, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load float, ptr %6, align 4
  %8 = tail call i32 @ChckREAL(float noundef %7) #7
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0BA@KACBBIMD@REAL_TO_UINT?3IN?$AA@") #7
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  %11 = load ptr, ptr %0, align 1
  store i16 0, ptr %11, align 2
  br label %22

12:                                               ; preds = %4
  %13 = load ptr, ptr %0, align 1
  %14 = load float, ptr %13, align 4
  %15 = tail call float @llvm.round.f32(float %14)
  %16 = fcmp ogt float %15, 6.553500e+04
  %17 = fcmp olt float %15, 0.000000e+00
  %18 = or i1 %16, %17
  br i1 %18, label %19, label %20

19:                                               ; preds = %12
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  br label %20

20:                                               ; preds = %12, %19
  %21 = fptoui float %15 to i16
  store i16 %21, ptr %13, align 2
  br label %22

22:                                               ; preds = %20, %10
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @REAL_TO_USINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_REAL_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 512, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load float, ptr %6, align 4
  %8 = tail call i32 @ChckREAL(float noundef %7) #7
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0BB@LMGBDCNC@REAL_TO_USINT?3IN?$AA@") #7
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  %11 = load ptr, ptr %0, align 1
  store i8 0, ptr %11, align 1
  br label %22

12:                                               ; preds = %4
  %13 = load ptr, ptr %0, align 1
  %14 = load float, ptr %13, align 4
  %15 = tail call float @llvm.round.f32(float %14)
  %16 = fcmp ogt float %15, 2.550000e+02
  %17 = fcmp olt float %15, 0.000000e+00
  %18 = or i1 %16, %17
  br i1 %18, label %19, label %20

19:                                               ; preds = %12
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  br label %20

20:                                               ; preds = %12, %19
  %21 = fptoui float %15 to i8
  store i8 %21, ptr %13, align 1
  br label %22

22:                                               ; preds = %20, %10
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @REAL_TO_WORD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_REAL_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 17, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load float, ptr %6, align 4
  %8 = tail call i32 @ChckREAL(float noundef %7) #7
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0BA@JFCAHPOG@REAL_TO_WORD?3IN?$AA@") #7
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  %11 = load ptr, ptr %0, align 1
  store i16 0, ptr %11, align 2
  br label %22

12:                                               ; preds = %4
  %13 = load ptr, ptr %0, align 1
  %14 = load float, ptr %13, align 4
  %15 = tail call float @llvm.round.f32(float %14)
  %16 = fcmp ogt float %15, 6.553500e+04
  %17 = fcmp olt float %15, 0.000000e+00
  %18 = or i1 %16, %17
  br i1 %18, label %19, label %20

19:                                               ; preds = %12
  store i8 0, ptr @STAT_ENO_REAL_TO, align 1
  br label %20

20:                                               ; preds = %12, %19
  %21 = fptoui float %15 to i16
  store i16 %21, ptr %13, align 2
  br label %22

22:                                               ; preds = %20, %10
  ret ptr %0
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.round.f32(float) #6

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCPIEC\\RealTo.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
