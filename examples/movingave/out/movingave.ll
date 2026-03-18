; ModuleID = 'movingave.c'
source_filename = "movingave.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: write, inaccessiblemem: readwrite)
define dso_local range(i32 -1, 1) i32 @fast_moving_average_init(ptr noundef writeonly captures(address_is_null) %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp eq ptr %0, null
  %4 = icmp slt i32 %1, 1
  %5 = or i1 %3, %4
  br i1 %5, label %14, label %6

6:                                                ; preds = %2
  %7 = shl i32 %1, 3
  %8 = add i32 %7, 8
  %9 = tail call ptr @malloc(i32 noundef %8) #8
  store ptr %9, ptr %0, align 4
  %10 = icmp eq ptr %9, null
  %11 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %12 = select i1 %10, i32 0, i32 %1
  %13 = sext i1 %10 to i32
  store i32 %12, ptr %11, align 4
  br label %14

14:                                               ; preds = %6, %2
  %15 = phi i32 [ -1, %2 ], [ %13, %6 ]
  ret i32 %15
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare dso_local noalias noundef ptr @malloc(i32 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nounwind willreturn memory(readwrite, target_mem0: none, target_mem1: none)
define dso_local void @fast_moving_average_free(ptr noundef captures(address_is_null) %0) local_unnamed_addr #2 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %6, label %3

3:                                                ; preds = %1
  %4 = load ptr, ptr %0, align 4
  tail call void @free(ptr noundef %4)
  store ptr null, ptr %0, align 4
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %1, %3
  ret void
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare dso_local void @free(ptr allocptr noundef captures(none)) local_unnamed_addr #3

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 -1, 1) i32 @fast_moving_average_compute(ptr noundef readonly captures(address_is_null) %0, ptr noundef readonly captures(address_is_null) %1, i32 noundef %2, i32 noundef %3, ptr noundef writeonly captures(address_is_null) %4) local_unnamed_addr #4 {
  %6 = ptrtoint ptr %4 to i32
  %7 = icmp slt i32 %3, 1
  br i1 %7, label %163, label %8

8:                                                ; preds = %5
  %9 = icmp sle i32 %3, %2
  %10 = icmp ne ptr %0, null
  %11 = and i1 %10, %9
  br i1 %11, label %12, label %163

12:                                               ; preds = %8
  %13 = load ptr, ptr %0, align 4
  %14 = ptrtoint ptr %13 to i32
  %15 = icmp eq ptr %13, null
  br i1 %15, label %163, label %16

16:                                               ; preds = %12
  %17 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %18 = load i32, ptr %17, align 4
  %19 = icmp sge i32 %18, %2
  %20 = icmp ne ptr %1, null
  %21 = and i1 %20, %19
  %22 = icmp ne ptr %4, null
  %23 = and i1 %22, %21
  br i1 %23, label %24, label %163

24:                                               ; preds = %16
  store double 0.000000e+00, ptr %13, align 8
  %25 = add i32 %2, -1
  %26 = and i32 %2, 3
  %27 = icmp ult i32 %25, 3
  br i1 %27, label %32, label %28

28:                                               ; preds = %24
  %29 = and i32 %2, -4
  br label %108

30:                                               ; preds = %108
  %31 = icmp eq i32 %26, 0
  br i1 %31, label %47, label %32

32:                                               ; preds = %30, %24
  %33 = phi double [ 0.000000e+00, %24 ], [ %129, %30 ]
  %34 = phi i32 [ 0, %24 ], [ %130, %30 ]
  %35 = icmp ne i32 %26, 0
  tail call void @llvm.assume(i1 %35)
  br label %36

36:                                               ; preds = %36, %32
  %37 = phi double [ %42, %36 ], [ %33, %32 ]
  %38 = phi i32 [ %43, %36 ], [ %34, %32 ]
  %39 = phi i32 [ %45, %36 ], [ 0, %32 ]
  %40 = getelementptr inbounds nuw double, ptr %1, i32 %38
  %41 = load double, ptr %40, align 8
  %42 = fadd double %37, %41
  %43 = add nuw nsw i32 %38, 1
  %44 = getelementptr inbounds nuw double, ptr %13, i32 %43
  store double %42, ptr %44, align 8
  %45 = add i32 %39, 1
  %46 = icmp eq i32 %45, %26
  br i1 %46, label %47, label %36, !llvm.loop !7

47:                                               ; preds = %36, %30
  %48 = add nsw i32 %3, -1
  %49 = uitofp nneg i32 %3 to double
  %50 = icmp ult i32 %2, 8
  br i1 %50, label %86, label %51

51:                                               ; preds = %47
  %52 = shl i32 %3, 3
  %53 = add i32 %52, %6
  %54 = add i32 %53, -8
  %55 = sub i32 %54, %14
  %56 = icmp ult i32 %55, 32
  %57 = add i32 %6, -8
  %58 = sub i32 %57, %14
  %59 = icmp ult i32 %58, 32
  %60 = or i1 %56, %59
  br i1 %60, label %86, label %61

61:                                               ; preds = %51
  %62 = and i32 %2, -4
  %63 = insertelement <4 x i32> poison, i32 %48, i64 0
  %64 = shufflevector <4 x i32> %63, <4 x i32> poison, <4 x i32> zeroinitializer
  %65 = insertelement <4 x double> poison, double %49, i64 0
  %66 = shufflevector <4 x double> %65, <4 x double> poison, <4 x i32> zeroinitializer
  br label %67

67:                                               ; preds = %67, %61
  %68 = phi i32 [ 0, %61 ], [ %81, %67 ]
  %69 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %61 ], [ %82, %67 ]
  %70 = icmp sge <4 x i32> %69, %64
  %71 = or disjoint i32 %68, 1
  %72 = getelementptr double, ptr %13, i32 %71
  %73 = tail call <4 x double> @llvm.masked.load.v4f64.p0(ptr align 8 %72, <4 x i1> %70, <4 x double> poison)
  %74 = sub i32 %71, %3
  %75 = getelementptr double, ptr %13, i32 %74
  %76 = tail call <4 x double> @llvm.masked.load.v4f64.p0(ptr align 8 %75, <4 x i1> %70, <4 x double> poison)
  %77 = fsub <4 x double> %73, %76
  %78 = fdiv <4 x double> %77, %66
  %79 = select <4 x i1> %70, <4 x double> %78, <4 x double> splat (double 0x7FF8000000000000)
  %80 = getelementptr inbounds nuw double, ptr %4, i32 %68
  store <4 x double> %79, ptr %80, align 8
  %81 = add nuw i32 %68, 4
  %82 = add nuw nsw <4 x i32> %69, splat (i32 4)
  %83 = icmp eq i32 %81, %62
  br i1 %83, label %84, label %67, !llvm.loop !9

84:                                               ; preds = %67
  %85 = icmp eq i32 %2, %62
  br i1 %85, label %163, label %86

86:                                               ; preds = %51, %47, %84
  %87 = phi i32 [ 0, %51 ], [ 0, %47 ], [ %62, %84 ]
  %88 = or disjoint i32 %87, 1
  %89 = and i32 %2, 1
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %105, label %91

91:                                               ; preds = %86
  %92 = icmp slt i32 %87, %48
  %93 = or disjoint i32 %87, 1
  br i1 %92, label %102, label %94

94:                                               ; preds = %91
  %95 = getelementptr inbounds nuw double, ptr %13, i32 %93
  %96 = load double, ptr %95, align 8
  %97 = sub nsw i32 %93, %3
  %98 = getelementptr inbounds double, ptr %13, i32 %97
  %99 = load double, ptr %98, align 8
  %100 = fsub double %96, %99
  %101 = fdiv double %100, %49
  br label %102

102:                                              ; preds = %94, %91
  %103 = phi double [ %101, %94 ], [ 0x7FF8000000000000, %91 ]
  %104 = getelementptr inbounds nuw double, ptr %4, i32 %87
  store double %103, ptr %104, align 8
  br label %105

105:                                              ; preds = %102, %86
  %106 = phi i32 [ %87, %86 ], [ %93, %102 ]
  %107 = icmp eq i32 %2, %88
  br i1 %107, label %163, label %134

108:                                              ; preds = %108, %28
  %109 = phi double [ 0.000000e+00, %28 ], [ %129, %108 ]
  %110 = phi i32 [ 0, %28 ], [ %130, %108 ]
  %111 = phi i32 [ 0, %28 ], [ %132, %108 ]
  %112 = getelementptr inbounds nuw double, ptr %1, i32 %110
  %113 = load double, ptr %112, align 8
  %114 = fadd double %109, %113
  %115 = or disjoint i32 %110, 1
  %116 = getelementptr inbounds nuw double, ptr %13, i32 %115
  store double %114, ptr %116, align 8
  %117 = getelementptr inbounds nuw double, ptr %1, i32 %115
  %118 = load double, ptr %117, align 8
  %119 = fadd double %114, %118
  %120 = or disjoint i32 %110, 2
  %121 = getelementptr inbounds nuw double, ptr %13, i32 %120
  store double %119, ptr %121, align 8
  %122 = getelementptr inbounds nuw double, ptr %1, i32 %120
  %123 = load double, ptr %122, align 8
  %124 = fadd double %119, %123
  %125 = or disjoint i32 %110, 3
  %126 = getelementptr inbounds nuw double, ptr %13, i32 %125
  store double %124, ptr %126, align 8
  %127 = getelementptr inbounds nuw double, ptr %1, i32 %125
  %128 = load double, ptr %127, align 8
  %129 = fadd double %124, %128
  %130 = add nuw nsw i32 %110, 4
  %131 = getelementptr inbounds nuw double, ptr %13, i32 %130
  store double %129, ptr %131, align 8
  %132 = add i32 %111, 4
  %133 = icmp eq i32 %132, %29
  br i1 %133, label %30, label %108, !llvm.loop !13

134:                                              ; preds = %105, %159
  %135 = phi i32 [ %150, %159 ], [ %106, %105 ]
  %136 = icmp slt i32 %135, %48
  %137 = add nuw nsw i32 %135, 1
  br i1 %136, label %146, label %138

138:                                              ; preds = %134
  %139 = getelementptr inbounds nuw double, ptr %13, i32 %137
  %140 = load double, ptr %139, align 8
  %141 = sub nsw i32 %137, %3
  %142 = getelementptr inbounds double, ptr %13, i32 %141
  %143 = load double, ptr %142, align 8
  %144 = fsub double %140, %143
  %145 = fdiv double %144, %49
  br label %146

146:                                              ; preds = %134, %138
  %147 = phi double [ %145, %138 ], [ 0x7FF8000000000000, %134 ]
  %148 = getelementptr inbounds nuw double, ptr %4, i32 %135
  store double %147, ptr %148, align 8
  %149 = icmp slt i32 %137, %48
  %150 = add nuw nsw i32 %135, 2
  br i1 %149, label %159, label %151

151:                                              ; preds = %146
  %152 = getelementptr inbounds nuw double, ptr %13, i32 %150
  %153 = load double, ptr %152, align 8
  %154 = sub nsw i32 %150, %3
  %155 = getelementptr inbounds double, ptr %13, i32 %154
  %156 = load double, ptr %155, align 8
  %157 = fsub double %153, %156
  %158 = fdiv double %157, %49
  br label %159

159:                                              ; preds = %151, %146
  %160 = phi double [ %158, %151 ], [ 0x7FF8000000000000, %146 ]
  %161 = getelementptr inbounds nuw double, ptr %4, i32 %137
  store double %160, ptr %161, align 8
  %162 = icmp eq i32 %150, %2
  br i1 %162, label %163, label %134, !llvm.loop !14

163:                                              ; preds = %105, %159, %84, %5, %8, %12, %16
  %164 = phi i32 [ -1, %5 ], [ -1, %16 ], [ -1, %12 ], [ -1, %8 ], [ 0, %84 ], [ 0, %159 ], [ 0, %105 ]
  ret i32 %164
}

; Function Attrs: nounwind memory(readwrite, target_mem0: none, target_mem1: none)
define dso_local range(i32 -1, 1) i32 @fast_moving_average(ptr noundef readonly captures(address_is_null) %0, i32 noundef %1, i32 noundef %2, ptr noundef writeonly captures(address_is_null) %3) local_unnamed_addr #5 {
  %5 = icmp slt i32 %1, 1
  br i1 %5, label %116, label %6

6:                                                ; preds = %4
  %7 = shl i32 %1, 3
  %8 = add i32 %7, 8
  %9 = tail call ptr @malloc(i32 noundef %8) #8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %116, label %11

11:                                               ; preds = %6
  %12 = icmp slt i32 %2, 1
  %13 = icmp samesign ugt i32 %2, %1
  %14 = select i1 %12, i1 true, i1 %13
  br i1 %14, label %114, label %15

15:                                               ; preds = %11
  %16 = icmp ne ptr %0, null
  %17 = icmp ne ptr %3, null
  %18 = and i1 %16, %17
  br i1 %18, label %19, label %114

19:                                               ; preds = %15
  store double 0.000000e+00, ptr %9, align 8
  %20 = and i32 %1, 3
  %21 = icmp ult i32 %1, 4
  br i1 %21, label %26, label %22

22:                                               ; preds = %19
  %23 = and i32 %1, 2147483644
  br label %72

24:                                               ; preds = %72
  %25 = icmp eq i32 %20, 0
  br i1 %25, label %41, label %26

26:                                               ; preds = %24, %19
  %27 = phi double [ 0.000000e+00, %19 ], [ %93, %24 ]
  %28 = phi i32 [ 0, %19 ], [ %94, %24 ]
  %29 = icmp ne i32 %20, 0
  tail call void @llvm.assume(i1 %29)
  br label %30

30:                                               ; preds = %30, %26
  %31 = phi double [ %36, %30 ], [ %27, %26 ]
  %32 = phi i32 [ %37, %30 ], [ %28, %26 ]
  %33 = phi i32 [ %39, %30 ], [ 0, %26 ]
  %34 = getelementptr inbounds nuw double, ptr %0, i32 %32
  %35 = load double, ptr %34, align 8
  %36 = fadd double %31, %35
  %37 = add nuw nsw i32 %32, 1
  %38 = getelementptr inbounds nuw double, ptr %9, i32 %37
  store double %36, ptr %38, align 8
  %39 = add i32 %33, 1
  %40 = icmp eq i32 %39, %20
  br i1 %40, label %41, label %30, !llvm.loop !15

41:                                               ; preds = %30, %24
  %42 = add nsw i32 %2, -1
  %43 = uitofp nneg i32 %2 to double
  %44 = icmp ult i32 %1, 4
  br i1 %44, label %70, label %45

45:                                               ; preds = %41
  %46 = and i32 %1, 2147483644
  %47 = insertelement <4 x i32> poison, i32 %42, i64 0
  %48 = shufflevector <4 x i32> %47, <4 x i32> poison, <4 x i32> zeroinitializer
  %49 = insertelement <4 x double> poison, double %43, i64 0
  %50 = shufflevector <4 x double> %49, <4 x double> poison, <4 x i32> zeroinitializer
  br label %51

51:                                               ; preds = %51, %45
  %52 = phi i32 [ 0, %45 ], [ %65, %51 ]
  %53 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %45 ], [ %66, %51 ]
  %54 = icmp sge <4 x i32> %53, %48
  %55 = or disjoint i32 %52, 1
  %56 = getelementptr double, ptr %9, i32 %55
  %57 = tail call <4 x double> @llvm.masked.load.v4f64.p0(ptr align 8 %56, <4 x i1> %54, <4 x double> poison)
  %58 = sub i32 %55, %2
  %59 = getelementptr double, ptr %9, i32 %58
  %60 = tail call <4 x double> @llvm.masked.load.v4f64.p0(ptr align 8 %59, <4 x i1> %54, <4 x double> poison)
  %61 = fsub <4 x double> %57, %60
  %62 = fdiv <4 x double> %61, %50
  %63 = select <4 x i1> %54, <4 x double> %62, <4 x double> splat (double 0x7FF8000000000000)
  %64 = getelementptr inbounds nuw double, ptr %3, i32 %52
  store <4 x double> %63, ptr %64, align 8
  %65 = add nuw i32 %52, 4
  %66 = add nuw nsw <4 x i32> %53, splat (i32 4)
  %67 = icmp eq i32 %65, %46
  br i1 %67, label %68, label %51, !llvm.loop !16

68:                                               ; preds = %51
  %69 = icmp eq i32 %1, %46
  br i1 %69, label %114, label %70

70:                                               ; preds = %41, %68
  %71 = phi i32 [ 0, %41 ], [ %46, %68 ]
  br label %98

72:                                               ; preds = %72, %22
  %73 = phi double [ 0.000000e+00, %22 ], [ %93, %72 ]
  %74 = phi i32 [ 0, %22 ], [ %94, %72 ]
  %75 = phi i32 [ 0, %22 ], [ %96, %72 ]
  %76 = getelementptr inbounds nuw double, ptr %0, i32 %74
  %77 = load double, ptr %76, align 8
  %78 = fadd double %73, %77
  %79 = or disjoint i32 %74, 1
  %80 = getelementptr inbounds nuw double, ptr %9, i32 %79
  store double %78, ptr %80, align 8
  %81 = getelementptr inbounds nuw double, ptr %0, i32 %79
  %82 = load double, ptr %81, align 8
  %83 = fadd double %78, %82
  %84 = or disjoint i32 %74, 2
  %85 = getelementptr inbounds nuw double, ptr %9, i32 %84
  store double %83, ptr %85, align 8
  %86 = getelementptr inbounds nuw double, ptr %0, i32 %84
  %87 = load double, ptr %86, align 8
  %88 = fadd double %83, %87
  %89 = or disjoint i32 %74, 3
  %90 = getelementptr inbounds nuw double, ptr %9, i32 %89
  store double %88, ptr %90, align 8
  %91 = getelementptr inbounds nuw double, ptr %0, i32 %89
  %92 = load double, ptr %91, align 8
  %93 = fadd double %88, %92
  %94 = add nuw nsw i32 %74, 4
  %95 = getelementptr inbounds nuw double, ptr %9, i32 %94
  store double %93, ptr %95, align 8
  %96 = add i32 %75, 4
  %97 = icmp eq i32 %96, %23
  br i1 %97, label %24, label %72, !llvm.loop !13

98:                                               ; preds = %70, %110
  %99 = phi i32 [ %101, %110 ], [ %71, %70 ]
  %100 = icmp slt i32 %99, %42
  %101 = add nuw nsw i32 %99, 1
  br i1 %100, label %110, label %102

102:                                              ; preds = %98
  %103 = getelementptr inbounds nuw double, ptr %9, i32 %101
  %104 = load double, ptr %103, align 8
  %105 = sub nsw i32 %101, %2
  %106 = getelementptr inbounds double, ptr %9, i32 %105
  %107 = load double, ptr %106, align 8
  %108 = fsub double %104, %107
  %109 = fdiv double %108, %43
  br label %110

110:                                              ; preds = %102, %98
  %111 = phi double [ %109, %102 ], [ 0x7FF8000000000000, %98 ]
  %112 = getelementptr inbounds nuw double, ptr %3, i32 %99
  store double %111, ptr %112, align 8
  %113 = icmp eq i32 %101, %1
  br i1 %113, label %114, label %98, !llvm.loop !17

114:                                              ; preds = %110, %68, %11, %15
  %115 = phi i32 [ -1, %11 ], [ -1, %15 ], [ 0, %68 ], [ 0, %110 ]
  tail call void @free(ptr noundef %9)
  br label %116

116:                                              ; preds = %4, %6, %114
  %117 = phi i32 [ %115, %114 ], [ -1, %6 ], [ -1, %4 ]
  ret i32 %117
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <4 x double> @llvm.masked.load.v4f64.p0(ptr captures(none), <4 x i1>, <4 x double>) #6

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #7

attributes #0 = { mustprogress nofree nounwind willreturn memory(argmem: write, inaccessiblemem: readwrite) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+avx,+avx2,+cmov,+crc32,+cx8,+fma,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+avx,+avx2,+cmov,+crc32,+cx8,+fma,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "tune-cpu"="generic" }
attributes #2 = { mustprogress nounwind willreturn memory(readwrite, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+avx,+avx2,+cmov,+crc32,+cx8,+fma,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "tune-cpu"="generic" }
attributes #3 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+avx,+avx2,+cmov,+crc32,+cx8,+fma,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "tune-cpu"="generic" }
attributes #4 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+avx,+avx2,+cmov,+crc32,+cx8,+fma,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "tune-cpu"="generic" }
attributes #5 = { nounwind memory(readwrite, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+avx,+avx2,+cmov,+crc32,+cx8,+fma,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nosync nounwind willreturn memory(argmem: read) }
attributes #7 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #8 = { allocsize(0) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "movingave.c", directory: "D:\\work\\rtacc\\examples\\movingave")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = distinct !{!9, !10, !11, !12}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.isvectorized", i32 1}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !10, !11}
!15 = distinct !{!15, !8}
!16 = distinct !{!16, !10, !11, !12}
!17 = distinct !{!17, !10, !12, !11}
