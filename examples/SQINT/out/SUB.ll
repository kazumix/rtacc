; ModuleID = '..\PLCPIEC\SUB.c'
source_filename = "..\\PLCPIEC\\SUB.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_0N@DAMDLDHO@SUB_REAL?3IN1?$AA@" = comdat any

$"??_C@_0N@BLOOOALN@SUB_REAL?3IN2?$AA@" = comdat any

$"??_C@_0BA@CEICCEKF@SUB_REAL?3RESULT?$AA@" = comdat any

$"??_C@_0O@MEPIAKPE@SUB_LREAL?3IN1?$AA@" = comdat any

$"??_C@_0O@OPNFFJDH@SUB_LREAL?3IN2?$AA@" = comdat any

$"??_C@_0BB@EMCMEGNC@SUB_LREAL?3RESULT?$AA@" = comdat any

$"??_C@_08FMNPCPAE@SUB_SINT?$AA@" = comdat any

$"??_C@_08IOBPGEJG@SUB_DINT?$AA@" = comdat any

$"??_C@_07IKIFMOPD@SUB_INT?$AA@" = comdat any

$"??_C@_08LOGPCPFH@SUB_LINT?$AA@" = comdat any

$"??_C@_09HLEJLKNF@SUB_UDINT?$AA@" = comdat any

$"??_C@_08NDJPNKKE@SUB_UINT?$AA@" = comdat any

$"??_C@_09KJIJPBEH@SUB_USINT?$AA@" = comdat any

$"??_C@_09ELDJPBBE@SUB_ULINT?$AA@" = comdat any

$"??_C@_07DFBCIIPG@SUB_T_T?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@STAT_ENO_SUB = dso_local local_unnamed_addr global i8 0, align 1
@"??_C@_0N@DAMDLDHO@SUB_REAL?3IN1?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"SUB_REAL:IN1\00", comdat, align 1
@"??_C@_0N@BLOOOALN@SUB_REAL?3IN2?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"SUB_REAL:IN2\00", comdat, align 1
@"??_C@_0BA@CEICCEKF@SUB_REAL?3RESULT?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"SUB_REAL:RESULT\00", comdat, align 1
@"??_C@_0O@MEPIAKPE@SUB_LREAL?3IN1?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"SUB_LREAL:IN1\00", comdat, align 1
@"??_C@_0O@OPNFFJDH@SUB_LREAL?3IN2?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"SUB_LREAL:IN2\00", comdat, align 1
@"??_C@_0BB@EMCMEGNC@SUB_LREAL?3RESULT?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"SUB_LREAL:RESULT\00", comdat, align 1
@"??_C@_08FMNPCPAE@SUB_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SUB_SINT\00", comdat, align 1
@"??_C@_08IOBPGEJG@SUB_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SUB_DINT\00", comdat, align 1
@"??_C@_07IKIFMOPD@SUB_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"SUB_INT\00", comdat, align 1
@"??_C@_08LOGPCPFH@SUB_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SUB_LINT\00", comdat, align 1
@"??_C@_09HLEJLKNF@SUB_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"SUB_UDINT\00", comdat, align 1
@"??_C@_08NDJPNKKE@SUB_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SUB_UINT\00", comdat, align 1
@"??_C@_09KJIJPBEH@SUB_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"SUB_USINT\00", comdat, align 1
@"??_C@_09ELDJPBBE@SUB_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"SUB_ULINT\00", comdat, align 1
@"??_C@_07DFBCIIPG@SUB_T_T?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"SUB_T_T\00", comdat, align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport void @SetSubEno(i8 noundef signext %0) local_unnamed_addr #0 {
  store i8 %0, ptr @STAT_ENO_SUB, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport signext i8 @GetSubEno() local_unnamed_addr #1 {
  %1 = load i8, ptr @STAT_ENO_SUB, align 1
  ret i8 %1
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @SUB(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %165 [
    i16 782, label %7
    i16 783, label %9
    i16 260, label %11
    i16 262, label %25
    i16 261, label %39
    i16 263, label %53
    i16 514, label %67
    i16 513, label %81
    i16 512, label %95
    i16 515, label %109
    i16 17, label %123
    i16 16, label %137
    i16 18, label %151
  ]

7:                                                ; preds = %4
  %8 = tail call ptr @SUB_REAL(ptr noundef nonnull %0, ptr noundef %1, ptr poison, ptr poison)
  br label %165

9:                                                ; preds = %4
  %10 = tail call ptr @SUB_LREAL(ptr noundef nonnull %0, ptr noundef %1, ptr poison, ptr poison)
  br label %165

11:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_SUB, align 1
  %12 = load ptr, ptr %1, align 1
  %13 = load i8, ptr %12, align 1
  %14 = load ptr, ptr %0, align 1
  %15 = load i8, ptr %14, align 1
  %16 = tail call i32 @SUB_Overflow_SINT(i8 noundef signext %15, i8 noundef signext %13) #4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %19, label %18

18:                                               ; preds = %11
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_08FMNPCPAE@SUB_SINT?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %19

19:                                               ; preds = %11, %18
  store i16 260, ptr %5, align 1
  %20 = load ptr, ptr %0, align 1
  %21 = load i8, ptr %20, align 1
  %22 = load ptr, ptr %1, align 1
  %23 = load i8, ptr %22, align 1
  %24 = sub i8 %21, %23
  store i8 %24, ptr %20, align 1
  br label %165

25:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_SUB, align 1
  %26 = load ptr, ptr %1, align 1
  %27 = load i32, ptr %26, align 4
  %28 = load ptr, ptr %0, align 1
  %29 = load i32, ptr %28, align 4
  %30 = tail call i32 @SUB_Overflow_DINT(i32 noundef %29, i32 noundef %27) #4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %33, label %32

32:                                               ; preds = %25
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_08IOBPGEJG@SUB_DINT?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %33

33:                                               ; preds = %25, %32
  store i16 262, ptr %5, align 1
  %34 = load ptr, ptr %0, align 1
  %35 = load i32, ptr %34, align 4
  %36 = load ptr, ptr %1, align 1
  %37 = load i32, ptr %36, align 4
  %38 = sub nsw i32 %35, %37
  store i32 %38, ptr %34, align 4
  br label %165

39:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_SUB, align 1
  %40 = load ptr, ptr %1, align 1
  %41 = load i16, ptr %40, align 2
  %42 = load ptr, ptr %0, align 1
  %43 = load i16, ptr %42, align 2
  %44 = tail call i32 @SUB_Overflow_INT(i16 noundef signext %43, i16 noundef signext %41) #4
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %47, label %46

46:                                               ; preds = %39
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_07IKIFMOPD@SUB_INT?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %47

47:                                               ; preds = %39, %46
  store i16 261, ptr %5, align 1
  %48 = load ptr, ptr %0, align 1
  %49 = load i16, ptr %48, align 2
  %50 = load ptr, ptr %1, align 1
  %51 = load i16, ptr %50, align 2
  %52 = sub i16 %49, %51
  store i16 %52, ptr %48, align 2
  br label %165

53:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_SUB, align 1
  %54 = load ptr, ptr %1, align 1
  %55 = load i64, ptr %54, align 8
  %56 = load ptr, ptr %0, align 1
  %57 = load i64, ptr %56, align 8
  %58 = tail call i32 @SUB_Overflow_LINT(i64 noundef %57, i64 noundef %55) #4
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %61, label %60

60:                                               ; preds = %53
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_08LOGPCPFH@SUB_LINT?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %61

61:                                               ; preds = %53, %60
  store i16 263, ptr %5, align 1
  %62 = load ptr, ptr %0, align 1
  %63 = load i64, ptr %62, align 8
  %64 = load ptr, ptr %1, align 1
  %65 = load i64, ptr %64, align 8
  %66 = sub nsw i64 %63, %65
  store i64 %66, ptr %62, align 8
  br label %165

67:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_SUB, align 1
  %68 = load ptr, ptr %1, align 1
  %69 = load i32, ptr %68, align 4
  %70 = load ptr, ptr %0, align 1
  %71 = load i32, ptr %70, align 4
  %72 = tail call i32 @SUB_Overflow_UDINT(i32 noundef %71, i32 noundef %69) #4
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %75, label %74

74:                                               ; preds = %67
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_09HLEJLKNF@SUB_UDINT?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %75

75:                                               ; preds = %67, %74
  store i16 514, ptr %5, align 1
  %76 = load ptr, ptr %0, align 1
  %77 = load i32, ptr %76, align 4
  %78 = load ptr, ptr %1, align 1
  %79 = load i32, ptr %78, align 4
  %80 = sub i32 %77, %79
  store i32 %80, ptr %76, align 4
  br label %165

81:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_SUB, align 1
  %82 = load ptr, ptr %1, align 1
  %83 = load i16, ptr %82, align 2
  %84 = load ptr, ptr %0, align 1
  %85 = load i16, ptr %84, align 2
  %86 = tail call i32 @SUB_Overflow_UINT(i16 noundef zeroext %85, i16 noundef zeroext %83) #4
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %89, label %88

88:                                               ; preds = %81
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_08NDJPNKKE@SUB_UINT?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %89

89:                                               ; preds = %81, %88
  store i16 513, ptr %5, align 1
  %90 = load ptr, ptr %0, align 1
  %91 = load i16, ptr %90, align 2
  %92 = load ptr, ptr %1, align 1
  %93 = load i16, ptr %92, align 2
  %94 = sub i16 %91, %93
  store i16 %94, ptr %90, align 2
  br label %165

95:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_SUB, align 1
  %96 = load ptr, ptr %1, align 1
  %97 = load i8, ptr %96, align 1
  %98 = load ptr, ptr %0, align 1
  %99 = load i8, ptr %98, align 1
  %100 = tail call i32 @SUB_Overflow_USINT(i8 noundef zeroext %99, i8 noundef zeroext %97) #4
  %101 = icmp eq i32 %100, 0
  br i1 %101, label %103, label %102

102:                                              ; preds = %95
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_09KJIJPBEH@SUB_USINT?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %103

103:                                              ; preds = %95, %102
  store i16 512, ptr %5, align 1
  %104 = load ptr, ptr %0, align 1
  %105 = load i8, ptr %104, align 1
  %106 = load ptr, ptr %1, align 1
  %107 = load i8, ptr %106, align 1
  %108 = sub i8 %105, %107
  store i8 %108, ptr %104, align 1
  br label %165

109:                                              ; preds = %4
  store i8 1, ptr @STAT_ENO_SUB, align 1
  %110 = load ptr, ptr %1, align 1
  %111 = load i64, ptr %110, align 8
  %112 = load ptr, ptr %0, align 1
  %113 = load i64, ptr %112, align 8
  %114 = tail call i32 @SUB_Overflow_ULINT(i64 noundef %113, i64 noundef %111) #4
  %115 = icmp eq i32 %114, 0
  br i1 %115, label %117, label %116

116:                                              ; preds = %109
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_09ELDJPBBE@SUB_ULINT?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %117

117:                                              ; preds = %109, %116
  store i16 515, ptr %5, align 1
  %118 = load ptr, ptr %0, align 1
  %119 = load i64, ptr %118, align 8
  %120 = load ptr, ptr %1, align 1
  %121 = load i64, ptr %120, align 8
  %122 = sub i64 %119, %121
  store i64 %122, ptr %118, align 8
  br label %165

123:                                              ; preds = %4
  store i8 1, ptr @STAT_ENO_SUB, align 1
  %124 = load ptr, ptr %1, align 1
  %125 = load i16, ptr %124, align 2
  %126 = load ptr, ptr %0, align 1
  %127 = load i16, ptr %126, align 2
  %128 = tail call i32 @SUB_Overflow_UINT(i16 noundef zeroext %127, i16 noundef zeroext %125) #4
  %129 = icmp eq i32 %128, 0
  br i1 %129, label %131, label %130

130:                                              ; preds = %123
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_08NDJPNKKE@SUB_UINT?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %131

131:                                              ; preds = %123, %130
  store i16 513, ptr %5, align 1
  %132 = load ptr, ptr %0, align 1
  %133 = load i16, ptr %132, align 2
  %134 = load ptr, ptr %1, align 1
  %135 = load i16, ptr %134, align 2
  %136 = sub i16 %133, %135
  store i16 %136, ptr %132, align 2
  br label %165

137:                                              ; preds = %4
  store i8 1, ptr @STAT_ENO_SUB, align 1
  %138 = load ptr, ptr %1, align 1
  %139 = load i8, ptr %138, align 1
  %140 = load ptr, ptr %0, align 1
  %141 = load i8, ptr %140, align 1
  %142 = tail call i32 @SUB_Overflow_USINT(i8 noundef zeroext %141, i8 noundef zeroext %139) #4
  %143 = icmp eq i32 %142, 0
  br i1 %143, label %145, label %144

144:                                              ; preds = %137
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_09KJIJPBEH@SUB_USINT?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %145

145:                                              ; preds = %137, %144
  store i16 512, ptr %5, align 1
  %146 = load ptr, ptr %0, align 1
  %147 = load i8, ptr %146, align 1
  %148 = load ptr, ptr %1, align 1
  %149 = load i8, ptr %148, align 1
  %150 = sub i8 %147, %149
  store i8 %150, ptr %146, align 1
  br label %165

151:                                              ; preds = %4
  store i8 1, ptr @STAT_ENO_SUB, align 1
  %152 = load ptr, ptr %1, align 1
  %153 = load i32, ptr %152, align 4
  %154 = load ptr, ptr %0, align 1
  %155 = load i32, ptr %154, align 4
  %156 = tail call i32 @SUB_Overflow_UDINT(i32 noundef %155, i32 noundef %153) #4
  %157 = icmp eq i32 %156, 0
  br i1 %157, label %159, label %158

158:                                              ; preds = %151
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_09HLEJLKNF@SUB_UDINT?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %159

159:                                              ; preds = %151, %158
  store i16 514, ptr %5, align 1
  %160 = load ptr, ptr %0, align 1
  %161 = load i32, ptr %160, align 4
  %162 = load ptr, ptr %1, align 1
  %163 = load i32, ptr %162, align 4
  %164 = sub i32 %161, %163
  store i32 %164, ptr %160, align 4
  br label %165

165:                                              ; preds = %4, %159, %145, %131, %117, %103, %89, %75, %61, %47, %33, %19, %9, %7
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @SUB_REAL(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_SUB, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = load float, ptr %5, align 4
  %7 = tail call i32 @ChckREAL(float noundef %6) #4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0N@DAMDLDHO@SUB_REAL?3IN1?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %10

10:                                               ; preds = %9, %4
  %11 = load ptr, ptr %1, align 1
  %12 = load float, ptr %11, align 4
  %13 = tail call i32 @ChckREAL(float noundef %12) #4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %16, label %15

15:                                               ; preds = %10
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0N@BLOOOALN@SUB_REAL?3IN2?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %16

16:                                               ; preds = %15, %10
  %17 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 782, ptr %17, align 1
  %18 = load ptr, ptr %0, align 1
  %19 = load float, ptr %18, align 4
  %20 = load ptr, ptr %1, align 1
  %21 = load float, ptr %20, align 4
  %22 = fsub float %19, %21
  store float %22, ptr %18, align 4
  %23 = load ptr, ptr %0, align 1
  %24 = load float, ptr %23, align 4
  %25 = tail call i32 @ChckREAL(float noundef %24) #4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %28, label %27

27:                                               ; preds = %16
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0BA@CEICCEKF@SUB_REAL?3RESULT?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %28

28:                                               ; preds = %27, %16
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @SUB_LREAL(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_SUB, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = load double, ptr %5, align 8
  %7 = tail call i32 @ChckLREAL(double noundef %6) #4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0O@MEPIAKPE@SUB_LREAL?3IN1?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %10

10:                                               ; preds = %9, %4
  %11 = load ptr, ptr %1, align 1
  %12 = load double, ptr %11, align 8
  %13 = tail call i32 @ChckLREAL(double noundef %12) #4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %16, label %15

15:                                               ; preds = %10
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0O@OPNFFJDH@SUB_LREAL?3IN2?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %16

16:                                               ; preds = %15, %10
  %17 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 783, ptr %17, align 1
  %18 = load ptr, ptr %0, align 1
  %19 = load double, ptr %18, align 8
  %20 = load ptr, ptr %1, align 1
  %21 = load double, ptr %20, align 8
  %22 = fsub double %19, %21
  store double %22, ptr %18, align 8
  %23 = load ptr, ptr %0, align 1
  %24 = load double, ptr %23, align 8
  %25 = tail call i32 @ChckLREAL(double noundef %24) #4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %28, label %27

27:                                               ; preds = %16
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0BB@EMCMEGNC@SUB_LREAL?3RESULT?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %28

28:                                               ; preds = %27, %16
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @SUB_SINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_SUB, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = load i8, ptr %5, align 1
  %7 = load ptr, ptr %0, align 1
  %8 = load i8, ptr %7, align 1
  %9 = tail call i32 @SUB_Overflow_SINT(i8 noundef signext %8, i8 noundef signext %6) #4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %12, label %11

11:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_08FMNPCPAE@SUB_SINT?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %12

12:                                               ; preds = %11, %4
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 260, ptr %13, align 1
  %14 = load ptr, ptr %0, align 1
  %15 = load i8, ptr %14, align 1
  %16 = load ptr, ptr %1, align 1
  %17 = load i8, ptr %16, align 1
  %18 = sub i8 %15, %17
  store i8 %18, ptr %14, align 1
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @SUB_DINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_SUB, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = load i32, ptr %5, align 4
  %7 = load ptr, ptr %0, align 1
  %8 = load i32, ptr %7, align 4
  %9 = tail call i32 @SUB_Overflow_DINT(i32 noundef %8, i32 noundef %6) #4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %12, label %11

11:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_08IOBPGEJG@SUB_DINT?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %12

12:                                               ; preds = %11, %4
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 262, ptr %13, align 1
  %14 = load ptr, ptr %0, align 1
  %15 = load i32, ptr %14, align 4
  %16 = load ptr, ptr %1, align 1
  %17 = load i32, ptr %16, align 4
  %18 = sub nsw i32 %15, %17
  store i32 %18, ptr %14, align 4
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @SUB_INT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_SUB, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = load i16, ptr %5, align 2
  %7 = load ptr, ptr %0, align 1
  %8 = load i16, ptr %7, align 2
  %9 = tail call i32 @SUB_Overflow_INT(i16 noundef signext %8, i16 noundef signext %6) #4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %12, label %11

11:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_07IKIFMOPD@SUB_INT?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %12

12:                                               ; preds = %11, %4
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 261, ptr %13, align 1
  %14 = load ptr, ptr %0, align 1
  %15 = load i16, ptr %14, align 2
  %16 = load ptr, ptr %1, align 1
  %17 = load i16, ptr %16, align 2
  %18 = sub i16 %15, %17
  store i16 %18, ptr %14, align 2
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @SUB_LINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_SUB, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = load i64, ptr %5, align 8
  %7 = load ptr, ptr %0, align 1
  %8 = load i64, ptr %7, align 8
  %9 = tail call i32 @SUB_Overflow_LINT(i64 noundef %8, i64 noundef %6) #4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %12, label %11

11:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_08LOGPCPFH@SUB_LINT?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %12

12:                                               ; preds = %11, %4
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 263, ptr %13, align 1
  %14 = load ptr, ptr %0, align 1
  %15 = load i64, ptr %14, align 8
  %16 = load ptr, ptr %1, align 1
  %17 = load i64, ptr %16, align 8
  %18 = sub nsw i64 %15, %17
  store i64 %18, ptr %14, align 8
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @SUB_UDINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_SUB, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = load i32, ptr %5, align 4
  %7 = load ptr, ptr %0, align 1
  %8 = load i32, ptr %7, align 4
  %9 = tail call i32 @SUB_Overflow_UDINT(i32 noundef %8, i32 noundef %6) #4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %12, label %11

11:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_09HLEJLKNF@SUB_UDINT?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %12

12:                                               ; preds = %11, %4
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 514, ptr %13, align 1
  %14 = load ptr, ptr %0, align 1
  %15 = load i32, ptr %14, align 4
  %16 = load ptr, ptr %1, align 1
  %17 = load i32, ptr %16, align 4
  %18 = sub i32 %15, %17
  store i32 %18, ptr %14, align 4
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @SUB_UINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_SUB, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = load i16, ptr %5, align 2
  %7 = load ptr, ptr %0, align 1
  %8 = load i16, ptr %7, align 2
  %9 = tail call i32 @SUB_Overflow_UINT(i16 noundef zeroext %8, i16 noundef zeroext %6) #4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %12, label %11

11:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_08NDJPNKKE@SUB_UINT?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %12

12:                                               ; preds = %11, %4
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 513, ptr %13, align 1
  %14 = load ptr, ptr %0, align 1
  %15 = load i16, ptr %14, align 2
  %16 = load ptr, ptr %1, align 1
  %17 = load i16, ptr %16, align 2
  %18 = sub i16 %15, %17
  store i16 %18, ptr %14, align 2
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @SUB_USINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_SUB, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = load i8, ptr %5, align 1
  %7 = load ptr, ptr %0, align 1
  %8 = load i8, ptr %7, align 1
  %9 = tail call i32 @SUB_Overflow_USINT(i8 noundef zeroext %8, i8 noundef zeroext %6) #4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %12, label %11

11:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_09KJIJPBEH@SUB_USINT?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %12

12:                                               ; preds = %11, %4
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 512, ptr %13, align 1
  %14 = load ptr, ptr %0, align 1
  %15 = load i8, ptr %14, align 1
  %16 = load ptr, ptr %1, align 1
  %17 = load i8, ptr %16, align 1
  %18 = sub i8 %15, %17
  store i8 %18, ptr %14, align 1
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @SUB_ULINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_SUB, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = load i64, ptr %5, align 8
  %7 = load ptr, ptr %0, align 1
  %8 = load i64, ptr %7, align 8
  %9 = tail call i32 @SUB_Overflow_ULINT(i64 noundef %8, i64 noundef %6) #4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %12, label %11

11:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_09ELDJPBBE@SUB_ULINT?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %12

12:                                               ; preds = %11, %4
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 515, ptr %13, align 1
  %14 = load ptr, ptr %0, align 1
  %15 = load i64, ptr %14, align 8
  %16 = load ptr, ptr %1, align 1
  %17 = load i64, ptr %16, align 8
  %18 = sub i64 %15, %17
  store i64 %18, ptr %14, align 8
  ret ptr %0
}

declare dso_local i32 @ChckREAL(float noundef) local_unnamed_addr #3

declare dso_local void @Eexception_Post(i32 noundef, ptr noundef) local_unnamed_addr #3

declare dso_local i32 @ChckLREAL(double noundef) local_unnamed_addr #3

declare dso_local i32 @SUB_Overflow_SINT(i8 noundef signext, i8 noundef signext) local_unnamed_addr #3

declare dso_local i32 @SUB_Overflow_DINT(i32 noundef, i32 noundef) local_unnamed_addr #3

declare dso_local i32 @SUB_Overflow_INT(i16 noundef signext, i16 noundef signext) local_unnamed_addr #3

declare dso_local i32 @SUB_Overflow_LINT(i64 noundef, i64 noundef) local_unnamed_addr #3

declare dso_local i32 @SUB_Overflow_UDINT(i32 noundef, i32 noundef) local_unnamed_addr #3

declare dso_local i32 @SUB_Overflow_UINT(i16 noundef zeroext, i16 noundef zeroext) local_unnamed_addr #3

declare dso_local i32 @SUB_Overflow_USINT(i8 noundef zeroext, i8 noundef zeroext) local_unnamed_addr #3

declare dso_local i32 @SUB_Overflow_ULINT(i64 noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @SUB_T_T(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_SUB, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = load i32, ptr %5, align 4
  %7 = load ptr, ptr %0, align 1
  %8 = load i32, ptr %7, align 4
  %9 = tail call i32 @SUB_Overflow_TIME(i32 noundef %8, i32 noundef %6) #4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %12, label %11

11:                                               ; preds = %4
  tail call void @Eexception_Post(i32 noundef 2, ptr noundef nonnull @"??_C@_07DFBCIIPG@SUB_T_T?$AA@") #4
  store i8 0, ptr @STAT_ENO_SUB, align 1
  br label %12

12:                                               ; preds = %11, %4
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1347, ptr %13, align 1
  %14 = load ptr, ptr %0, align 1
  %15 = load i32, ptr %14, align 4
  %16 = load ptr, ptr %1, align 1
  %17 = load i32, ptr %16, align 4
  %18 = sub i32 %15, %17
  store i32 %18, ptr %14, align 4
  ret ptr %0
}

declare dso_local i32 @SUB_Overflow_TIME(i32 noundef, i32 noundef) local_unnamed_addr #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCPIEC\\SUB.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
