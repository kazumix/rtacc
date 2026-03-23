; ModuleID = '..\PLCPIEC\LT.c'
source_filename = "..\\PLCPIEC\\LT.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_0BF@LBNBFDMC@LT?3invalid?5data?5type?$AA@" = comdat any

$"??_C@_0M@CHNALBMJ@LT_REAL?3IN1?$AA@" = comdat any

$"??_C@_0M@MPNOCAK@LT_REAL?3IN2?$AA@" = comdat any

$"??_C@_0N@JBOKDPNJ@LT_LREAL?3IN1?$AA@" = comdat any

$"??_C@_0N@LKMHGMBK@LT_LREAL?3IN2?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@STAT_ENO_LT = dso_local local_unnamed_addr global i8 0, align 1
@"??_C@_0BF@LBNBFDMC@LT?3invalid?5data?5type?$AA@" = linkonce_odr dso_local unnamed_addr constant [21 x i8] c"LT:invalid data type\00", comdat, align 1
@"??_C@_0M@CHNALBMJ@LT_REAL?3IN1?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"LT_REAL:IN1\00", comdat, align 1
@"??_C@_0M@MPNOCAK@LT_REAL?3IN2?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"LT_REAL:IN2\00", comdat, align 1
@"??_C@_0N@JBOKDPNJ@LT_LREAL?3IN1?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"LT_LREAL:IN1\00", comdat, align 1
@"??_C@_0N@LKMHGMBK@LT_LREAL?3IN2?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"LT_LREAL:IN2\00", comdat, align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport void @SetLtEno(i8 noundef signext %0) local_unnamed_addr #0 {
  store i8 %0, ptr @STAT_ENO_LT, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport signext i8 @GetLtEno() local_unnamed_addr #1 {
  %1 = load i8, ptr @STAT_ENO_LT, align 1
  ret i8 %1
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @LT(ptr noundef returned %0, ptr noundef %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  tail call void @MaskBitfield(ptr noundef %0) #5
  tail call void @MaskBitfield(ptr noundef %1) #5
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %136 [
    i16 782, label %7
    i16 783, label %26
    i16 260, label %45
    i16 262, label %52
    i16 261, label %59
    i16 263, label %66
    i16 514, label %73
    i16 513, label %80
    i16 512, label %87
    i16 515, label %94
    i16 1347, label %101
    i16 18, label %108
    i16 17, label %115
    i16 16, label %122
    i16 1536, label %129
  ]

7:                                                ; preds = %4
  store i8 1, ptr @STAT_ENO_LT, align 1
  %8 = load ptr, ptr %0, align 1
  %9 = load float, ptr %8, align 4
  %10 = tail call i32 @ChckREAL(float noundef %9) #5
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %13, label %12

12:                                               ; preds = %7
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0M@CHNALBMJ@LT_REAL?3IN1?$AA@") #5
  store i8 0, ptr @STAT_ENO_LT, align 1
  br label %13

13:                                               ; preds = %12, %7
  %14 = load ptr, ptr %1, align 1
  %15 = load float, ptr %14, align 4
  %16 = tail call i32 @ChckREAL(float noundef %15) #5
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %19, label %18

18:                                               ; preds = %13
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0M@MPNOCAK@LT_REAL?3IN2?$AA@") #5
  store i8 0, ptr @STAT_ENO_LT, align 1
  br label %19

19:                                               ; preds = %13, %18
  store i16 1536, ptr %5, align 1
  %20 = load ptr, ptr %0, align 1
  %21 = load float, ptr %20, align 4
  %22 = load ptr, ptr %1, align 1
  %23 = load float, ptr %22, align 4
  %24 = fcmp olt float %21, %23
  %25 = zext i1 %24 to i8
  store i8 %25, ptr %20, align 4
  br label %137

26:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_LT, align 1
  %27 = load ptr, ptr %0, align 1
  %28 = load double, ptr %27, align 8
  %29 = tail call i32 @ChckLREAL(double noundef %28) #5
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %32, label %31

31:                                               ; preds = %26
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0N@JBOKDPNJ@LT_LREAL?3IN1?$AA@") #5
  store i8 0, ptr @STAT_ENO_LT, align 1
  br label %32

32:                                               ; preds = %31, %26
  %33 = load ptr, ptr %1, align 1
  %34 = load double, ptr %33, align 8
  %35 = tail call i32 @ChckLREAL(double noundef %34) #5
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %38, label %37

37:                                               ; preds = %32
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0N@LKMHGMBK@LT_LREAL?3IN2?$AA@") #5
  store i8 0, ptr @STAT_ENO_LT, align 1
  br label %38

38:                                               ; preds = %32, %37
  store i16 1536, ptr %5, align 1
  %39 = load ptr, ptr %0, align 1
  %40 = load double, ptr %39, align 8
  %41 = load ptr, ptr %1, align 1
  %42 = load double, ptr %41, align 8
  %43 = fcmp olt double %40, %42
  %44 = zext i1 %43 to i8
  store i8 %44, ptr %39, align 8
  br label %137

45:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_LT, align 1
  store i16 1536, ptr %5, align 1
  %46 = load ptr, ptr %0, align 1
  %47 = load i8, ptr %46, align 1
  %48 = load ptr, ptr %1, align 1
  %49 = load i8, ptr %48, align 1
  %50 = icmp slt i8 %47, %49
  %51 = zext i1 %50 to i8
  store i8 %51, ptr %46, align 1
  br label %137

52:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_LT, align 1
  store i16 1536, ptr %5, align 1
  %53 = load ptr, ptr %0, align 1
  %54 = load i32, ptr %53, align 4
  %55 = load ptr, ptr %1, align 1
  %56 = load i32, ptr %55, align 4
  %57 = icmp slt i32 %54, %56
  %58 = zext i1 %57 to i8
  store i8 %58, ptr %53, align 4
  br label %137

59:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_LT, align 1
  store i16 1536, ptr %5, align 1
  %60 = load ptr, ptr %0, align 1
  %61 = load i16, ptr %60, align 2
  %62 = load ptr, ptr %1, align 1
  %63 = load i16, ptr %62, align 2
  %64 = icmp slt i16 %61, %63
  %65 = zext i1 %64 to i8
  store i8 %65, ptr %60, align 2
  br label %137

66:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_LT, align 1
  store i16 1536, ptr %5, align 1
  %67 = load ptr, ptr %0, align 1
  %68 = load i64, ptr %67, align 8
  %69 = load ptr, ptr %1, align 1
  %70 = load i64, ptr %69, align 8
  %71 = icmp slt i64 %68, %70
  %72 = zext i1 %71 to i8
  store i8 %72, ptr %67, align 8
  br label %137

73:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_LT, align 1
  store i16 1536, ptr %5, align 1
  %74 = load ptr, ptr %0, align 1
  %75 = load i32, ptr %74, align 4
  %76 = load ptr, ptr %1, align 1
  %77 = load i32, ptr %76, align 4
  %78 = icmp ult i32 %75, %77
  %79 = zext i1 %78 to i8
  store i8 %79, ptr %74, align 4
  br label %137

80:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_LT, align 1
  store i16 1536, ptr %5, align 1
  %81 = load ptr, ptr %0, align 1
  %82 = load i16, ptr %81, align 2
  %83 = load ptr, ptr %1, align 1
  %84 = load i16, ptr %83, align 2
  %85 = icmp ult i16 %82, %84
  %86 = zext i1 %85 to i8
  store i8 %86, ptr %81, align 2
  br label %137

87:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_LT, align 1
  store i16 1536, ptr %5, align 1
  %88 = load ptr, ptr %0, align 1
  %89 = load i8, ptr %88, align 1
  %90 = load ptr, ptr %1, align 1
  %91 = load i8, ptr %90, align 1
  %92 = icmp ult i8 %89, %91
  %93 = zext i1 %92 to i8
  store i8 %93, ptr %88, align 1
  br label %137

94:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_LT, align 1
  store i16 1536, ptr %5, align 1
  %95 = load ptr, ptr %0, align 1
  %96 = load i64, ptr %95, align 8
  %97 = load ptr, ptr %1, align 1
  %98 = load i64, ptr %97, align 8
  %99 = icmp ult i64 %96, %98
  %100 = zext i1 %99 to i8
  store i8 %100, ptr %95, align 8
  br label %137

101:                                              ; preds = %4
  store i8 1, ptr @STAT_ENO_LT, align 1
  store i16 1536, ptr %5, align 1
  %102 = load ptr, ptr %0, align 1
  %103 = load i32, ptr %102, align 4
  %104 = load ptr, ptr %1, align 1
  %105 = load i32, ptr %104, align 4
  %106 = icmp ult i32 %103, %105
  %107 = zext i1 %106 to i8
  store i8 %107, ptr %102, align 4
  br label %137

108:                                              ; preds = %4
  store i8 1, ptr @STAT_ENO_LT, align 1
  store i16 1536, ptr %5, align 1
  %109 = load ptr, ptr %0, align 1
  %110 = load i32, ptr %109, align 4
  %111 = load ptr, ptr %1, align 1
  %112 = load i32, ptr %111, align 4
  %113 = icmp ult i32 %110, %112
  %114 = zext i1 %113 to i8
  store i8 %114, ptr %109, align 4
  br label %137

115:                                              ; preds = %4
  store i8 1, ptr @STAT_ENO_LT, align 1
  store i16 1536, ptr %5, align 1
  %116 = load ptr, ptr %0, align 1
  %117 = load i16, ptr %116, align 2
  %118 = load ptr, ptr %1, align 1
  %119 = load i16, ptr %118, align 2
  %120 = icmp ult i16 %117, %119
  %121 = zext i1 %120 to i8
  store i8 %121, ptr %116, align 2
  br label %137

122:                                              ; preds = %4
  store i8 1, ptr @STAT_ENO_LT, align 1
  store i16 1536, ptr %5, align 1
  %123 = load ptr, ptr %0, align 1
  %124 = load i8, ptr %123, align 1
  %125 = load ptr, ptr %1, align 1
  %126 = load i8, ptr %125, align 1
  %127 = icmp ult i8 %124, %126
  %128 = zext i1 %127 to i8
  store i8 %128, ptr %123, align 1
  br label %137

129:                                              ; preds = %4
  store i8 1, ptr @STAT_ENO_LT, align 1
  store i16 1536, ptr %5, align 1
  %130 = load ptr, ptr %0, align 1
  %131 = load i8, ptr %130, align 1
  %132 = load ptr, ptr %1, align 1
  %133 = load i8, ptr %132, align 1
  %134 = icmp slt i8 %131, %133
  %135 = zext i1 %134 to i8
  store i8 %135, ptr %130, align 1
  br label %137

136:                                              ; preds = %4
  tail call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0BF@LBNBFDMC@LT?3invalid?5data?5type?$AA@") #5
  br label %137

137:                                              ; preds = %136, %129, %122, %115, %108, %101, %94, %87, %80, %73, %66, %59, %52, %45, %38, %19
  ret ptr %0
}

declare dso_local void @MaskBitfield(ptr noundef) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @LT_REAL(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_LT, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = load float, ptr %5, align 4
  %7 = tail call i32 @ChckREAL(float noundef %6) #5
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0M@CHNALBMJ@LT_REAL?3IN1?$AA@") #5
  store i8 0, ptr @STAT_ENO_LT, align 1
  br label %10

10:                                               ; preds = %9, %4
  %11 = load ptr, ptr %1, align 1
  %12 = load float, ptr %11, align 4
  %13 = tail call i32 @ChckREAL(float noundef %12) #5
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %16, label %15

15:                                               ; preds = %10
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0M@MPNOCAK@LT_REAL?3IN2?$AA@") #5
  store i8 0, ptr @STAT_ENO_LT, align 1
  br label %16

16:                                               ; preds = %15, %10
  %17 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %17, align 1
  %18 = load ptr, ptr %0, align 1
  %19 = load float, ptr %18, align 4
  %20 = load ptr, ptr %1, align 1
  %21 = load float, ptr %20, align 4
  %22 = fcmp olt float %19, %21
  %23 = zext i1 %22 to i8
  store i8 %23, ptr %18, align 4
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @LT_LREAL(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_LT, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = load double, ptr %5, align 8
  %7 = tail call i32 @ChckLREAL(double noundef %6) #5
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0N@JBOKDPNJ@LT_LREAL?3IN1?$AA@") #5
  store i8 0, ptr @STAT_ENO_LT, align 1
  br label %10

10:                                               ; preds = %9, %4
  %11 = load ptr, ptr %1, align 1
  %12 = load double, ptr %11, align 8
  %13 = tail call i32 @ChckLREAL(double noundef %12) #5
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %16, label %15

15:                                               ; preds = %10
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0N@LKMHGMBK@LT_LREAL?3IN2?$AA@") #5
  store i8 0, ptr @STAT_ENO_LT, align 1
  br label %16

16:                                               ; preds = %15, %10
  %17 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %17, align 1
  %18 = load ptr, ptr %0, align 1
  %19 = load double, ptr %18, align 8
  %20 = load ptr, ptr %1, align 1
  %21 = load double, ptr %20, align 8
  %22 = fcmp olt double %19, %21
  %23 = zext i1 %22 to i8
  store i8 %23, ptr %18, align 8
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LT_SINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #4 {
  store i8 1, ptr @STAT_ENO_LT, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i8, ptr %6, align 1
  %8 = load ptr, ptr %1, align 1
  %9 = load i8, ptr %8, align 1
  %10 = icmp slt i8 %7, %9
  %11 = zext i1 %10 to i8
  store i8 %11, ptr %6, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LT_DINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #4 {
  store i8 1, ptr @STAT_ENO_LT, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = load ptr, ptr %1, align 1
  %9 = load i32, ptr %8, align 4
  %10 = icmp slt i32 %7, %9
  %11 = zext i1 %10 to i8
  store i8 %11, ptr %6, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LT_INT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #4 {
  store i8 1, ptr @STAT_ENO_LT, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i16, ptr %6, align 2
  %8 = load ptr, ptr %1, align 1
  %9 = load i16, ptr %8, align 2
  %10 = icmp slt i16 %7, %9
  %11 = zext i1 %10 to i8
  store i8 %11, ptr %6, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LT_LINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #4 {
  store i8 1, ptr @STAT_ENO_LT, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i64, ptr %6, align 8
  %8 = load ptr, ptr %1, align 1
  %9 = load i64, ptr %8, align 8
  %10 = icmp slt i64 %7, %9
  %11 = zext i1 %10 to i8
  store i8 %11, ptr %6, align 8
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LT_UDINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #4 {
  store i8 1, ptr @STAT_ENO_LT, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = load ptr, ptr %1, align 1
  %9 = load i32, ptr %8, align 4
  %10 = icmp ult i32 %7, %9
  %11 = zext i1 %10 to i8
  store i8 %11, ptr %6, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LT_UINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #4 {
  store i8 1, ptr @STAT_ENO_LT, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i16, ptr %6, align 2
  %8 = load ptr, ptr %1, align 1
  %9 = load i16, ptr %8, align 2
  %10 = icmp ult i16 %7, %9
  %11 = zext i1 %10 to i8
  store i8 %11, ptr %6, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LT_USINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #4 {
  store i8 1, ptr @STAT_ENO_LT, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i8, ptr %6, align 1
  %8 = load ptr, ptr %1, align 1
  %9 = load i8, ptr %8, align 1
  %10 = icmp ult i8 %7, %9
  %11 = zext i1 %10 to i8
  store i8 %11, ptr %6, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LT_ULINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #4 {
  store i8 1, ptr @STAT_ENO_LT, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i64, ptr %6, align 8
  %8 = load ptr, ptr %1, align 1
  %9 = load i64, ptr %8, align 8
  %10 = icmp ult i64 %7, %9
  %11 = zext i1 %10 to i8
  store i8 %11, ptr %6, align 8
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LT_TIME(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #4 {
  store i8 1, ptr @STAT_ENO_LT, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = load ptr, ptr %1, align 1
  %9 = load i32, ptr %8, align 4
  %10 = icmp ult i32 %7, %9
  %11 = zext i1 %10 to i8
  store i8 %11, ptr %6, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LT_DWORD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #4 {
  store i8 1, ptr @STAT_ENO_LT, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = load ptr, ptr %1, align 1
  %9 = load i32, ptr %8, align 4
  %10 = icmp ult i32 %7, %9
  %11 = zext i1 %10 to i8
  store i8 %11, ptr %6, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LT_WORD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #4 {
  store i8 1, ptr @STAT_ENO_LT, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i16, ptr %6, align 2
  %8 = load ptr, ptr %1, align 1
  %9 = load i16, ptr %8, align 2
  %10 = icmp ult i16 %7, %9
  %11 = zext i1 %10 to i8
  store i8 %11, ptr %6, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LT_BYTE(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #4 {
  store i8 1, ptr @STAT_ENO_LT, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i8, ptr %6, align 1
  %8 = load ptr, ptr %1, align 1
  %9 = load i8, ptr %8, align 1
  %10 = icmp ult i8 %7, %9
  %11 = zext i1 %10 to i8
  store i8 %11, ptr %6, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LT_BOOL(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #4 {
  store i8 1, ptr @STAT_ENO_LT, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i8, ptr %6, align 1
  %8 = load ptr, ptr %1, align 1
  %9 = load i8, ptr %8, align 1
  %10 = icmp slt i8 %7, %9
  %11 = zext i1 %10 to i8
  store i8 %11, ptr %6, align 1
  ret ptr %0
}

declare dso_local void @Eexception_Post(i32 noundef, ptr noundef) local_unnamed_addr #3

declare dso_local i32 @ChckREAL(float noundef) local_unnamed_addr #3

declare dso_local i32 @ChckLREAL(double noundef) local_unnamed_addr #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCPIEC\\LT.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
