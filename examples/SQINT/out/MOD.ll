; ModuleID = '..\PLCPIEC\MOD.c'
source_filename = "..\\PLCPIEC\\MOD.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_0N@HALINGMK@MOD_REAL?3IN1?$AA@" = comdat any

$"??_C@_0N@FLJFIFAJ@MOD_REAL?3IN2?$AA@" = comdat any

$"??_C@_08EIIHOHFC@MOD_REAL?$AA@" = comdat any

$"??_C@_0BA@DJIIEFHP@MOD_REAL?3RESULT?$AA@" = comdat any

$"??_C@_0O@ILEAGAE@MOD_LREAL?3IN1?$AA@" = comdat any

$"??_C@_0O@CDJJFFMH@MOD_LREAL?3IN2?$AA@" = comdat any

$"??_C@_09LFEHJLEL@MOD_LREAL?$AA@" = comdat any

$"??_C@_0BB@CKDHHHHJ@MOD_LREAL?3RESULT?$AA@" = comdat any

$"??_C@_08LGHGKODO@MOD_SINT?$AA@" = comdat any

$"??_C@_08GELGOFKM@MOD_DINT?$AA@" = comdat any

$"??_C@_07PGEDMNHH@MOD_INT?$AA@" = comdat any

$"??_C@_08FEMGKOGN@MOD_LINT?$AA@" = comdat any

$"??_C@_09LNKPMKOG@MOD_UDINT?$AA@" = comdat any

$"??_C@_08DJDGFLJO@MOD_UINT?$AA@" = comdat any

$"??_C@_09GPGPIBHE@MOD_USINT?$AA@" = comdat any

$"??_C@_09INNPIBCH@MOD_ULINT?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@STAT_ENO_MOD = dso_local local_unnamed_addr global i8 0, align 1
@"??_C@_0N@HALINGMK@MOD_REAL?3IN1?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"MOD_REAL:IN1\00", comdat, align 1
@"??_C@_0N@FLJFIFAJ@MOD_REAL?3IN2?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"MOD_REAL:IN2\00", comdat, align 1
@"??_C@_08EIIHOHFC@MOD_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MOD_REAL\00", comdat, align 1
@"??_C@_0BA@DJIIEFHP@MOD_REAL?3RESULT?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"MOD_REAL:RESULT\00", comdat, align 1
@"??_C@_0O@ILEAGAE@MOD_LREAL?3IN1?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"MOD_LREAL:IN1\00", comdat, align 1
@"??_C@_0O@CDJJFFMH@MOD_LREAL?3IN2?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"MOD_LREAL:IN2\00", comdat, align 1
@"??_C@_09LFEHJLEL@MOD_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MOD_LREAL\00", comdat, align 1
@"??_C@_0BB@CKDHHHHJ@MOD_LREAL?3RESULT?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"MOD_LREAL:RESULT\00", comdat, align 1
@"??_C@_08LGHGKODO@MOD_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MOD_SINT\00", comdat, align 1
@"??_C@_08GELGOFKM@MOD_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MOD_DINT\00", comdat, align 1
@"??_C@_07PGEDMNHH@MOD_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"MOD_INT\00", comdat, align 1
@"??_C@_08FEMGKOGN@MOD_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MOD_LINT\00", comdat, align 1
@"??_C@_09LNKPMKOG@MOD_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MOD_UDINT\00", comdat, align 1
@"??_C@_08DJDGFLJO@MOD_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MOD_UINT\00", comdat, align 1
@"??_C@_09GPGPIBHE@MOD_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MOD_USINT\00", comdat, align 1
@"??_C@_09INNPIBCH@MOD_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MOD_ULINT\00", comdat, align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport void @SetModEno(i8 noundef signext %0) local_unnamed_addr #0 {
  store i8 %0, ptr @STAT_ENO_MOD, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport signext i8 @GetModEno() local_unnamed_addr #1 {
  %1 = load i8, ptr @STAT_ENO_MOD, align 1
  ret i8 %1
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @MOD(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %168 [
    i16 782, label %7
    i16 783, label %9
    i16 260, label %11
    i16 262, label %26
    i16 261, label %41
    i16 263, label %56
    i16 514, label %67
    i16 513, label %82
    i16 512, label %97
    i16 515, label %112
    i16 17, label %123
    i16 16, label %138
    i16 18, label %153
  ]

7:                                                ; preds = %4
  %8 = tail call ptr @MOD_REAL(ptr noundef nonnull %0, ptr noundef %1, ptr poison, ptr poison)
  br label %168

9:                                                ; preds = %4
  %10 = tail call ptr @MOD_LREAL(ptr noundef nonnull %0, ptr noundef %1, ptr poison, ptr poison)
  br label %168

11:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_MOD, align 1
  %12 = load ptr, ptr %1, align 1
  %13 = load i8, ptr %12, align 1
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %11
  tail call void @Eexception_Post(i32 noundef 1, ptr noundef nonnull @"??_C@_08LGHGKODO@MOD_SINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %168

16:                                               ; preds = %11
  store i16 260, ptr %5, align 1
  %17 = load ptr, ptr %1, align 1
  %18 = load i8, ptr %17, align 1
  %19 = sitofp i8 %18 to double
  %20 = load ptr, ptr %0, align 1
  %21 = load i8, ptr %20, align 1
  %22 = sitofp i8 %21 to double
  %23 = tail call double @fmod(double noundef %22, double noundef %19) #5
  %24 = fptosi double %23 to i8
  %25 = load ptr, ptr %0, align 1
  store i8 %24, ptr %25, align 1
  br label %168

26:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_MOD, align 1
  %27 = load ptr, ptr %1, align 1
  %28 = load i32, ptr %27, align 4
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %31

30:                                               ; preds = %26
  tail call void @Eexception_Post(i32 noundef 1, ptr noundef nonnull @"??_C@_08GELGOFKM@MOD_DINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %168

31:                                               ; preds = %26
  store i16 262, ptr %5, align 1
  %32 = load ptr, ptr %1, align 1
  %33 = load i32, ptr %32, align 4
  %34 = sitofp i32 %33 to double
  %35 = load ptr, ptr %0, align 1
  %36 = load i32, ptr %35, align 4
  %37 = sitofp i32 %36 to double
  %38 = tail call double @fmod(double noundef %37, double noundef %34) #5
  %39 = fptosi double %38 to i32
  %40 = load ptr, ptr %0, align 1
  store i32 %39, ptr %40, align 4
  br label %168

41:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_MOD, align 1
  %42 = load ptr, ptr %1, align 1
  %43 = load i16, ptr %42, align 2
  %44 = icmp eq i16 %43, 0
  br i1 %44, label %45, label %46

45:                                               ; preds = %41
  tail call void @Eexception_Post(i32 noundef 1, ptr noundef nonnull @"??_C@_07PGEDMNHH@MOD_INT?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %168

46:                                               ; preds = %41
  store i16 261, ptr %5, align 1
  %47 = load ptr, ptr %1, align 1
  %48 = load i16, ptr %47, align 2
  %49 = sitofp i16 %48 to double
  %50 = load ptr, ptr %0, align 1
  %51 = load i16, ptr %50, align 2
  %52 = sitofp i16 %51 to double
  %53 = tail call double @fmod(double noundef %52, double noundef %49) #5
  %54 = fptosi double %53 to i16
  %55 = load ptr, ptr %0, align 1
  store i16 %54, ptr %55, align 2
  br label %168

56:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_MOD, align 1
  %57 = load ptr, ptr %1, align 1
  %58 = load i64, ptr %57, align 8
  %59 = icmp eq i64 %58, 0
  br i1 %59, label %60, label %61

60:                                               ; preds = %56
  tail call void @Eexception_Post(i32 noundef 1, ptr noundef nonnull @"??_C@_08FEMGKOGN@MOD_LINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %168

61:                                               ; preds = %56
  store i16 263, ptr %5, align 1
  %62 = load ptr, ptr %0, align 1
  %63 = load i64, ptr %62, align 8
  %64 = load ptr, ptr %1, align 1
  %65 = load i64, ptr %64, align 8
  %66 = srem i64 %63, %65
  store i64 %66, ptr %62, align 8
  br label %168

67:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_MOD, align 1
  %68 = load ptr, ptr %1, align 1
  %69 = load i32, ptr %68, align 4
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %71, label %72

71:                                               ; preds = %67
  tail call void @Eexception_Post(i32 noundef 1, ptr noundef nonnull @"??_C@_09LNKPMKOG@MOD_UDINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %168

72:                                               ; preds = %67
  store i16 514, ptr %5, align 1
  %73 = load ptr, ptr %1, align 1
  %74 = load i32, ptr %73, align 4
  %75 = uitofp i32 %74 to double
  %76 = load ptr, ptr %0, align 1
  %77 = load i32, ptr %76, align 4
  %78 = uitofp i32 %77 to double
  %79 = tail call double @fmod(double noundef %78, double noundef %75) #5
  %80 = fptoui double %79 to i32
  %81 = load ptr, ptr %0, align 1
  store i32 %80, ptr %81, align 4
  br label %168

82:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_MOD, align 1
  %83 = load ptr, ptr %1, align 1
  %84 = load i16, ptr %83, align 2
  %85 = icmp eq i16 %84, 0
  br i1 %85, label %86, label %87

86:                                               ; preds = %82
  tail call void @Eexception_Post(i32 noundef 1, ptr noundef nonnull @"??_C@_08DJDGFLJO@MOD_UINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %168

87:                                               ; preds = %82
  store i16 513, ptr %5, align 1
  %88 = load ptr, ptr %1, align 1
  %89 = load i16, ptr %88, align 2
  %90 = uitofp i16 %89 to double
  %91 = load ptr, ptr %0, align 1
  %92 = load i16, ptr %91, align 2
  %93 = uitofp i16 %92 to double
  %94 = tail call double @fmod(double noundef %93, double noundef %90) #5
  %95 = fptoui double %94 to i16
  %96 = load ptr, ptr %0, align 1
  store i16 %95, ptr %96, align 2
  br label %168

97:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_MOD, align 1
  %98 = load ptr, ptr %1, align 1
  %99 = load i8, ptr %98, align 1
  %100 = icmp eq i8 %99, 0
  br i1 %100, label %101, label %102

101:                                              ; preds = %97
  tail call void @Eexception_Post(i32 noundef 1, ptr noundef nonnull @"??_C@_09GPGPIBHE@MOD_USINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %168

102:                                              ; preds = %97
  store i16 512, ptr %5, align 1
  %103 = load ptr, ptr %1, align 1
  %104 = load i8, ptr %103, align 1
  %105 = uitofp i8 %104 to double
  %106 = load ptr, ptr %0, align 1
  %107 = load i8, ptr %106, align 1
  %108 = uitofp i8 %107 to double
  %109 = tail call double @fmod(double noundef %108, double noundef %105) #5
  %110 = fptoui double %109 to i8
  %111 = load ptr, ptr %0, align 1
  store i8 %110, ptr %111, align 1
  br label %168

112:                                              ; preds = %4
  store i8 1, ptr @STAT_ENO_MOD, align 1
  %113 = load ptr, ptr %1, align 1
  %114 = load i64, ptr %113, align 8
  %115 = icmp eq i64 %114, 0
  br i1 %115, label %116, label %117

116:                                              ; preds = %112
  tail call void @Eexception_Post(i32 noundef 1, ptr noundef nonnull @"??_C@_09INNPIBCH@MOD_ULINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %168

117:                                              ; preds = %112
  store i16 515, ptr %5, align 1
  %118 = load ptr, ptr %0, align 1
  %119 = load i64, ptr %118, align 8
  %120 = load ptr, ptr %1, align 1
  %121 = load i64, ptr %120, align 8
  %122 = urem i64 %119, %121
  store i64 %122, ptr %118, align 8
  br label %168

123:                                              ; preds = %4
  store i8 1, ptr @STAT_ENO_MOD, align 1
  %124 = load ptr, ptr %1, align 1
  %125 = load i16, ptr %124, align 2
  %126 = icmp eq i16 %125, 0
  br i1 %126, label %127, label %128

127:                                              ; preds = %123
  tail call void @Eexception_Post(i32 noundef 1, ptr noundef nonnull @"??_C@_08DJDGFLJO@MOD_UINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %168

128:                                              ; preds = %123
  store i16 513, ptr %5, align 1
  %129 = load ptr, ptr %1, align 1
  %130 = load i16, ptr %129, align 2
  %131 = uitofp i16 %130 to double
  %132 = load ptr, ptr %0, align 1
  %133 = load i16, ptr %132, align 2
  %134 = uitofp i16 %133 to double
  %135 = tail call double @fmod(double noundef %134, double noundef %131) #5
  %136 = fptoui double %135 to i16
  %137 = load ptr, ptr %0, align 1
  store i16 %136, ptr %137, align 2
  br label %168

138:                                              ; preds = %4
  store i8 1, ptr @STAT_ENO_MOD, align 1
  %139 = load ptr, ptr %1, align 1
  %140 = load i8, ptr %139, align 1
  %141 = icmp eq i8 %140, 0
  br i1 %141, label %142, label %143

142:                                              ; preds = %138
  tail call void @Eexception_Post(i32 noundef 1, ptr noundef nonnull @"??_C@_09GPGPIBHE@MOD_USINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %168

143:                                              ; preds = %138
  store i16 512, ptr %5, align 1
  %144 = load ptr, ptr %1, align 1
  %145 = load i8, ptr %144, align 1
  %146 = uitofp i8 %145 to double
  %147 = load ptr, ptr %0, align 1
  %148 = load i8, ptr %147, align 1
  %149 = uitofp i8 %148 to double
  %150 = tail call double @fmod(double noundef %149, double noundef %146) #5
  %151 = fptoui double %150 to i8
  %152 = load ptr, ptr %0, align 1
  store i8 %151, ptr %152, align 1
  br label %168

153:                                              ; preds = %4
  store i8 1, ptr @STAT_ENO_MOD, align 1
  %154 = load ptr, ptr %1, align 1
  %155 = load i32, ptr %154, align 4
  %156 = icmp eq i32 %155, 0
  br i1 %156, label %157, label %158

157:                                              ; preds = %153
  tail call void @Eexception_Post(i32 noundef 1, ptr noundef nonnull @"??_C@_09LNKPMKOG@MOD_UDINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %168

158:                                              ; preds = %153
  store i16 514, ptr %5, align 1
  %159 = load ptr, ptr %1, align 1
  %160 = load i32, ptr %159, align 4
  %161 = uitofp i32 %160 to double
  %162 = load ptr, ptr %0, align 1
  %163 = load i32, ptr %162, align 4
  %164 = uitofp i32 %163 to double
  %165 = tail call double @fmod(double noundef %164, double noundef %161) #5
  %166 = fptoui double %165 to i32
  %167 = load ptr, ptr %0, align 1
  store i32 %166, ptr %167, align 4
  br label %168

168:                                              ; preds = %158, %157, %143, %142, %128, %127, %117, %116, %102, %101, %87, %86, %72, %71, %61, %60, %46, %45, %31, %30, %16, %15, %4, %9, %7
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @MOD_REAL(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_MOD, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = load float, ptr %5, align 4
  %7 = tail call i32 @ChckREAL(float noundef %6) #5
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0N@HALINGMK@MOD_REAL?3IN1?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %10

10:                                               ; preds = %9, %4
  %11 = load ptr, ptr %1, align 1
  %12 = load float, ptr %11, align 4
  %13 = tail call i32 @ChckREAL(float noundef %12) #5
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %16, label %15

15:                                               ; preds = %10
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0N@FLJFIFAJ@MOD_REAL?3IN2?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %16

16:                                               ; preds = %15, %10
  %17 = load ptr, ptr %1, align 1
  %18 = load float, ptr %17, align 4
  %19 = fcmp oeq float %18, 0.000000e+00
  br i1 %19, label %20, label %21

20:                                               ; preds = %16
  tail call void @Eexception_Post(i32 noundef 1, ptr noundef nonnull @"??_C@_08EIIHOHFC@MOD_REAL?$AA@") #5
  br label %37

21:                                               ; preds = %16
  %22 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 782, ptr %22, align 1
  %23 = load ptr, ptr %1, align 1
  %24 = load float, ptr %23, align 4
  %25 = fpext float %24 to double
  %26 = load ptr, ptr %0, align 1
  %27 = load float, ptr %26, align 4
  %28 = fpext float %27 to double
  %29 = tail call double @fmod(double noundef %28, double noundef %25) #5
  %30 = fptrunc double %29 to float
  %31 = load ptr, ptr %0, align 1
  store float %30, ptr %31, align 4
  %32 = load ptr, ptr %0, align 1
  %33 = load float, ptr %32, align 4
  %34 = tail call i32 @ChckREAL(float noundef %33) #5
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %38, label %36

36:                                               ; preds = %21
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0BA@DJIIEFHP@MOD_REAL?3RESULT?$AA@") #5
  br label %37

37:                                               ; preds = %20, %36
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %38

38:                                               ; preds = %37, %21
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @MOD_LREAL(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_MOD, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = load double, ptr %5, align 8
  %7 = tail call i32 @ChckLREAL(double noundef %6) #5
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0O@ILEAGAE@MOD_LREAL?3IN1?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %10

10:                                               ; preds = %9, %4
  %11 = load ptr, ptr %1, align 1
  %12 = load double, ptr %11, align 8
  %13 = tail call i32 @ChckLREAL(double noundef %12) #5
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %16, label %15

15:                                               ; preds = %10
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0O@CDJJFFMH@MOD_LREAL?3IN2?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %16

16:                                               ; preds = %15, %10
  %17 = load ptr, ptr %1, align 1
  %18 = load double, ptr %17, align 8
  %19 = fcmp oeq double %18, 0.000000e+00
  br i1 %19, label %20, label %21

20:                                               ; preds = %16
  tail call void @Eexception_Post(i32 noundef 1, ptr noundef nonnull @"??_C@_09LFEHJLEL@MOD_LREAL?$AA@") #5
  br label %34

21:                                               ; preds = %16
  %22 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 783, ptr %22, align 1
  %23 = load ptr, ptr %1, align 1
  %24 = load double, ptr %23, align 8
  %25 = load ptr, ptr %0, align 1
  %26 = load double, ptr %25, align 8
  %27 = tail call double @fmod(double noundef %26, double noundef %24) #5
  %28 = load ptr, ptr %0, align 1
  store double %27, ptr %28, align 8
  %29 = load ptr, ptr %0, align 1
  %30 = load double, ptr %29, align 8
  %31 = tail call i32 @ChckLREAL(double noundef %30) #5
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %35, label %33

33:                                               ; preds = %21
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0BB@CKDHHHHJ@MOD_LREAL?3RESULT?$AA@") #5
  br label %34

34:                                               ; preds = %20, %33
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %35

35:                                               ; preds = %34, %21
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @MOD_SINT(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_MOD, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %4
  tail call void @Eexception_Post(i32 noundef 1, ptr noundef nonnull @"??_C@_08LGHGKODO@MOD_SINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %20

9:                                                ; preds = %4
  %10 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 260, ptr %10, align 1
  %11 = load ptr, ptr %1, align 1
  %12 = load i8, ptr %11, align 1
  %13 = sitofp i8 %12 to double
  %14 = load ptr, ptr %0, align 1
  %15 = load i8, ptr %14, align 1
  %16 = sitofp i8 %15 to double
  %17 = tail call double @fmod(double noundef %16, double noundef %13) #5
  %18 = fptosi double %17 to i8
  %19 = load ptr, ptr %0, align 1
  store i8 %18, ptr %19, align 1
  br label %20

20:                                               ; preds = %9, %8
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @MOD_DINT(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_MOD, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = load i32, ptr %5, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %4
  tail call void @Eexception_Post(i32 noundef 1, ptr noundef nonnull @"??_C@_08GELGOFKM@MOD_DINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %20

9:                                                ; preds = %4
  %10 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 262, ptr %10, align 1
  %11 = load ptr, ptr %1, align 1
  %12 = load i32, ptr %11, align 4
  %13 = sitofp i32 %12 to double
  %14 = load ptr, ptr %0, align 1
  %15 = load i32, ptr %14, align 4
  %16 = sitofp i32 %15 to double
  %17 = tail call double @fmod(double noundef %16, double noundef %13) #5
  %18 = fptosi double %17 to i32
  %19 = load ptr, ptr %0, align 1
  store i32 %18, ptr %19, align 4
  br label %20

20:                                               ; preds = %9, %8
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @MOD_INT(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_MOD, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = load i16, ptr %5, align 2
  %7 = icmp eq i16 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %4
  tail call void @Eexception_Post(i32 noundef 1, ptr noundef nonnull @"??_C@_07PGEDMNHH@MOD_INT?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %20

9:                                                ; preds = %4
  %10 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 261, ptr %10, align 1
  %11 = load ptr, ptr %1, align 1
  %12 = load i16, ptr %11, align 2
  %13 = sitofp i16 %12 to double
  %14 = load ptr, ptr %0, align 1
  %15 = load i16, ptr %14, align 2
  %16 = sitofp i16 %15 to double
  %17 = tail call double @fmod(double noundef %16, double noundef %13) #5
  %18 = fptosi double %17 to i16
  %19 = load ptr, ptr %0, align 1
  store i16 %18, ptr %19, align 2
  br label %20

20:                                               ; preds = %9, %8
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @MOD_LINT(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_MOD, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = load i64, ptr %5, align 8
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %4
  tail call void @Eexception_Post(i32 noundef 1, ptr noundef nonnull @"??_C@_08FEMGKOGN@MOD_LINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %16

9:                                                ; preds = %4
  %10 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 263, ptr %10, align 1
  %11 = load ptr, ptr %0, align 1
  %12 = load i64, ptr %11, align 8
  %13 = load ptr, ptr %1, align 1
  %14 = load i64, ptr %13, align 8
  %15 = srem i64 %12, %14
  store i64 %15, ptr %11, align 8
  br label %16

16:                                               ; preds = %9, %8
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @MOD_UDINT(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_MOD, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = load i32, ptr %5, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %4
  tail call void @Eexception_Post(i32 noundef 1, ptr noundef nonnull @"??_C@_09LNKPMKOG@MOD_UDINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %20

9:                                                ; preds = %4
  %10 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 514, ptr %10, align 1
  %11 = load ptr, ptr %1, align 1
  %12 = load i32, ptr %11, align 4
  %13 = uitofp i32 %12 to double
  %14 = load ptr, ptr %0, align 1
  %15 = load i32, ptr %14, align 4
  %16 = uitofp i32 %15 to double
  %17 = tail call double @fmod(double noundef %16, double noundef %13) #5
  %18 = fptoui double %17 to i32
  %19 = load ptr, ptr %0, align 1
  store i32 %18, ptr %19, align 4
  br label %20

20:                                               ; preds = %9, %8
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @MOD_UINT(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_MOD, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = load i16, ptr %5, align 2
  %7 = icmp eq i16 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %4
  tail call void @Eexception_Post(i32 noundef 1, ptr noundef nonnull @"??_C@_08DJDGFLJO@MOD_UINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %20

9:                                                ; preds = %4
  %10 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 513, ptr %10, align 1
  %11 = load ptr, ptr %1, align 1
  %12 = load i16, ptr %11, align 2
  %13 = uitofp i16 %12 to double
  %14 = load ptr, ptr %0, align 1
  %15 = load i16, ptr %14, align 2
  %16 = uitofp i16 %15 to double
  %17 = tail call double @fmod(double noundef %16, double noundef %13) #5
  %18 = fptoui double %17 to i16
  %19 = load ptr, ptr %0, align 1
  store i16 %18, ptr %19, align 2
  br label %20

20:                                               ; preds = %9, %8
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @MOD_USINT(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_MOD, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %4
  tail call void @Eexception_Post(i32 noundef 1, ptr noundef nonnull @"??_C@_09GPGPIBHE@MOD_USINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %20

9:                                                ; preds = %4
  %10 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 512, ptr %10, align 1
  %11 = load ptr, ptr %1, align 1
  %12 = load i8, ptr %11, align 1
  %13 = uitofp i8 %12 to double
  %14 = load ptr, ptr %0, align 1
  %15 = load i8, ptr %14, align 1
  %16 = uitofp i8 %15 to double
  %17 = tail call double @fmod(double noundef %16, double noundef %13) #5
  %18 = fptoui double %17 to i8
  %19 = load ptr, ptr %0, align 1
  store i8 %18, ptr %19, align 1
  br label %20

20:                                               ; preds = %9, %8
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @MOD_ULINT(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_MOD, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = load i64, ptr %5, align 8
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %4
  tail call void @Eexception_Post(i32 noundef 1, ptr noundef nonnull @"??_C@_09INNPIBCH@MOD_ULINT?$AA@") #5
  store i8 0, ptr @STAT_ENO_MOD, align 1
  br label %16

9:                                                ; preds = %4
  %10 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 515, ptr %10, align 1
  %11 = load ptr, ptr %0, align 1
  %12 = load i64, ptr %11, align 8
  %13 = load ptr, ptr %1, align 1
  %14 = load i64, ptr %13, align 8
  %15 = urem i64 %12, %14
  store i64 %15, ptr %11, align 8
  br label %16

16:                                               ; preds = %9, %8
  ret ptr %0
}

declare dso_local i32 @ChckREAL(float noundef) local_unnamed_addr #3

declare dso_local void @Eexception_Post(i32 noundef, ptr noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(errnomem: write)
declare dso_local double @fmod(double noundef, double noundef) local_unnamed_addr #4

declare dso_local i32 @ChckLREAL(double noundef) local_unnamed_addr #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(errnomem: write) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCPIEC\\MOD.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
