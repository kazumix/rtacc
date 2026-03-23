; ModuleID = '..\PLCPIEC\check.c'
source_filename = "..\\PLCPIEC\\check.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4

; Function Attrs: nounwind
define dso_local void @Eexception_Post(i32 noundef %0, ptr noundef %1) local_unnamed_addr #0 {
  tail call void @Exception_Set(i32 noundef %0, ptr noundef %1, i32 noundef 0) #4
  ret void
}

declare dso_local void @Exception_Set(i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef signext i8 @IsDetailMode() local_unnamed_addr #2 {
  ret i8 1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @ChckREAL(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @llvm.fabs.f32(float %0)
  %3 = fcmp ueq float %2, 0x7FF0000000000000
  %4 = zext i1 %3 to i32
  ret i32 %4
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @ChckNaN_REAL(float noundef %0) local_unnamed_addr #2 {
  %2 = fcmp uno float %0, 0.000000e+00
  %3 = zext i1 %2 to i32
  ret i32 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @ChckInf_REAL(float noundef %0) local_unnamed_addr #2 {
  %2 = tail call float @llvm.fabs.f32(float %0)
  %3 = fcmp oeq float %2, 0x7FF0000000000000
  %4 = zext i1 %3 to i32
  ret i32 %4
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @ChckLREAL(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call double @llvm.fabs.f64(double %0)
  %3 = fcmp ueq double %2, 0x7FF0000000000000
  %4 = zext i1 %3 to i32
  ret i32 %4
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @ChckNaN_LREAL(double noundef %0) local_unnamed_addr #2 {
  %2 = fcmp uno double %0, 0.000000e+00
  %3 = zext i1 %2 to i32
  ret i32 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @ChckInf_LREAL(double noundef %0) local_unnamed_addr #2 {
  %2 = tail call double @llvm.fabs.f64(double %0)
  %3 = fcmp oeq double %2, 0x7FF0000000000000
  %4 = zext i1 %3 to i32
  ret i32 %4
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @ADD_Overflow_SINT(i8 noundef signext %0, i8 noundef signext %1) local_unnamed_addr #2 {
  %3 = sext i8 %1 to i32
  %4 = icmp sgt i8 %1, 0
  br i1 %4, label %5, label %9

5:                                                ; preds = %2
  %6 = sext i8 %0 to i32
  %7 = sub nuw nsw i32 127, %3
  %8 = icmp slt i32 %7, %6
  br i1 %8, label %16, label %15

9:                                                ; preds = %2
  %10 = icmp slt i8 %1, 0
  br i1 %10, label %11, label %15

11:                                               ; preds = %9
  %12 = sext i8 %0 to i32
  %13 = sub nsw i32 -128, %3
  %14 = icmp sgt i32 %13, %12
  br i1 %14, label %16, label %15

15:                                               ; preds = %5, %11, %9
  br label %16

16:                                               ; preds = %5, %11, %15
  %17 = phi i32 [ 0, %15 ], [ 1, %11 ], [ 1, %5 ]
  ret i32 %17
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @ADD_Overflow_DINT(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = icmp sgt i32 %1, 0
  %4 = sub nuw nsw i32 2147483647, %1
  %5 = icmp sgt i32 %0, %4
  %6 = select i1 %3, i1 %5, i1 false
  br i1 %6, label %13, label %7

7:                                                ; preds = %2
  %8 = icmp slt i32 %1, 0
  %9 = sub nsw i32 -2147483648, %1
  %10 = icmp slt i32 %0, %9
  %11 = select i1 %8, i1 %10, i1 false
  %12 = zext i1 %11 to i32
  br label %13

13:                                               ; preds = %7, %2
  %14 = phi i32 [ 1, %2 ], [ %12, %7 ]
  ret i32 %14
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @ADD_Overflow_INT(i16 noundef signext %0, i16 noundef signext %1) local_unnamed_addr #2 {
  %3 = sext i16 %1 to i32
  %4 = icmp sgt i16 %1, 0
  br i1 %4, label %5, label %9

5:                                                ; preds = %2
  %6 = sext i16 %0 to i32
  %7 = sub nuw nsw i32 32767, %3
  %8 = icmp slt i32 %7, %6
  br i1 %8, label %16, label %15

9:                                                ; preds = %2
  %10 = icmp slt i16 %1, 0
  br i1 %10, label %11, label %15

11:                                               ; preds = %9
  %12 = sext i16 %0 to i32
  %13 = sub nsw i32 -32768, %3
  %14 = icmp sgt i32 %13, %12
  br i1 %14, label %16, label %15

15:                                               ; preds = %5, %11, %9
  br label %16

16:                                               ; preds = %5, %11, %15
  %17 = phi i32 [ 0, %15 ], [ 1, %11 ], [ 1, %5 ]
  ret i32 %17
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @ADD_Overflow_LINT(i64 noundef %0, i64 noundef %1) local_unnamed_addr #2 {
  %3 = icmp sgt i64 %1, 0
  %4 = sub nuw nsw i64 9223372036854775807, %1
  %5 = icmp sgt i64 %0, %4
  %6 = select i1 %3, i1 %5, i1 false
  br i1 %6, label %13, label %7

7:                                                ; preds = %2
  %8 = icmp slt i64 %1, 0
  %9 = sub nsw i64 -9223372036854775808, %1
  %10 = icmp slt i64 %0, %9
  %11 = select i1 %8, i1 %10, i1 false
  %12 = zext i1 %11 to i32
  br label %13

13:                                               ; preds = %7, %2
  %14 = phi i32 [ 1, %2 ], [ %12, %7 ]
  ret i32 %14
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @ADD_Overflow_UDINT(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = xor i32 %1, -1
  %4 = icmp ugt i32 %0, %3
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @ADD_Overflow_UINT(i16 noundef zeroext %0, i16 noundef zeroext %1) local_unnamed_addr #2 {
  %3 = xor i16 %1, -1
  %4 = icmp ugt i16 %0, %3
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @ADD_Overflow_USINT(i8 noundef zeroext %0, i8 noundef zeroext %1) local_unnamed_addr #2 {
  %3 = xor i8 %1, -1
  %4 = icmp ugt i8 %0, %3
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @ADD_Overflow_ULINT(i64 noundef %0, i64 noundef %1) local_unnamed_addr #2 {
  %3 = xor i64 %1, -1
  %4 = icmp ugt i64 %0, %3
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @ADD_Overflow_TIME(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = xor i32 %1, -1
  %4 = icmp ugt i32 %0, %3
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @SUB_Overflow_SINT(i8 noundef signext %0, i8 noundef signext %1) local_unnamed_addr #2 {
  %3 = sext i8 %0 to i32
  %4 = icmp sgt i8 %0, 0
  %5 = sext i8 %1 to i32
  %6 = icmp slt i8 %1, 0
  %7 = and i1 %4, %6
  %8 = add nsw i32 %5, 127
  %9 = icmp slt i32 %8, %3
  %10 = select i1 %7, i1 %9, i1 false
  br i1 %10, label %23, label %11

11:                                               ; preds = %2
  %12 = icmp sgt i8 %1, 0
  %13 = icmp slt i8 %0, 0
  %14 = and i1 %13, %12
  %15 = or disjoint i32 %5, -128
  %16 = icmp sgt i32 %15, %3
  %17 = select i1 %14, i1 %16, i1 false
  br i1 %17, label %23, label %18

18:                                               ; preds = %11
  %19 = icmp eq i8 %0, 0
  %20 = icmp eq i8 %1, -128
  %21 = and i1 %19, %20
  %22 = zext i1 %21 to i32
  br label %23

23:                                               ; preds = %18, %2, %11
  %24 = phi i32 [ %22, %18 ], [ 1, %11 ], [ 1, %2 ]
  ret i32 %24
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @SUB_Overflow_INT(i16 noundef signext %0, i16 noundef signext %1) local_unnamed_addr #2 {
  %3 = sext i16 %0 to i32
  %4 = icmp sgt i16 %0, 0
  %5 = sext i16 %1 to i32
  %6 = icmp slt i16 %1, 0
  %7 = and i1 %4, %6
  %8 = add nsw i32 %5, 32767
  %9 = icmp slt i32 %8, %3
  %10 = select i1 %7, i1 %9, i1 false
  br i1 %10, label %23, label %11

11:                                               ; preds = %2
  %12 = icmp sgt i16 %1, 0
  %13 = icmp slt i16 %0, 0
  %14 = and i1 %13, %12
  %15 = or disjoint i32 %5, -32768
  %16 = icmp sgt i32 %15, %3
  %17 = select i1 %14, i1 %16, i1 false
  br i1 %17, label %23, label %18

18:                                               ; preds = %11
  %19 = icmp eq i16 %0, 0
  %20 = icmp eq i16 %1, -32768
  %21 = and i1 %19, %20
  %22 = zext i1 %21 to i32
  br label %23

23:                                               ; preds = %18, %2, %11
  %24 = phi i32 [ %22, %18 ], [ 1, %11 ], [ 1, %2 ]
  ret i32 %24
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @SUB_Overflow_DINT(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  %4 = icmp slt i32 %1, 0
  %5 = and i1 %3, %4
  %6 = add nsw i32 %1, 2147483647
  %7 = icmp sgt i32 %0, %6
  %8 = select i1 %5, i1 %7, i1 false
  br i1 %8, label %21, label %9

9:                                                ; preds = %2
  %10 = icmp sgt i32 %1, 0
  %11 = icmp slt i32 %0, 0
  %12 = and i1 %11, %10
  %13 = or disjoint i32 %1, -2147483648
  %14 = icmp samesign ult i32 %0, %13
  %15 = select i1 %12, i1 %14, i1 false
  br i1 %15, label %21, label %16

16:                                               ; preds = %9
  %17 = icmp eq i32 %0, 0
  %18 = icmp eq i32 %1, -2147483648
  %19 = and i1 %17, %18
  %20 = zext i1 %19 to i32
  br label %21

21:                                               ; preds = %16, %2, %9
  %22 = phi i32 [ %20, %16 ], [ 1, %9 ], [ 1, %2 ]
  ret i32 %22
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @SUB_Overflow_LINT(i64 noundef %0, i64 noundef %1) local_unnamed_addr #2 {
  %3 = icmp sgt i64 %0, 0
  %4 = icmp slt i64 %1, 0
  %5 = and i1 %3, %4
  %6 = add nsw i64 %1, 9223372036854775807
  %7 = icmp sgt i64 %0, %6
  %8 = select i1 %5, i1 %7, i1 false
  br i1 %8, label %21, label %9

9:                                                ; preds = %2
  %10 = icmp sgt i64 %1, 0
  %11 = icmp slt i64 %0, 0
  %12 = and i1 %11, %10
  %13 = or disjoint i64 %1, -9223372036854775808
  %14 = icmp samesign ult i64 %0, %13
  %15 = select i1 %12, i1 %14, i1 false
  br i1 %15, label %21, label %16

16:                                               ; preds = %9
  %17 = icmp eq i64 %0, 0
  %18 = icmp eq i64 %1, -9223372036854775808
  %19 = and i1 %17, %18
  %20 = zext i1 %19 to i32
  br label %21

21:                                               ; preds = %16, %2, %9
  %22 = phi i32 [ %20, %16 ], [ 1, %9 ], [ 1, %2 ]
  ret i32 %22
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @SUB_Overflow_USINT(i8 noundef zeroext %0, i8 noundef zeroext %1) local_unnamed_addr #2 {
  %3 = icmp ult i8 %0, %1
  %4 = zext i1 %3 to i32
  ret i32 %4
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @SUB_Overflow_UINT(i16 noundef zeroext %0, i16 noundef zeroext %1) local_unnamed_addr #2 {
  %3 = icmp ult i16 %0, %1
  %4 = zext i1 %3 to i32
  ret i32 %4
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @SUB_Overflow_UDINT(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = icmp ult i32 %0, %1
  %4 = zext i1 %3 to i32
  ret i32 %4
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @SUB_Overflow_ULINT(i64 noundef %0, i64 noundef %1) local_unnamed_addr #2 {
  %3 = icmp ult i64 %0, %1
  %4 = zext i1 %3 to i32
  ret i32 %4
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @SUB_Overflow_TIME(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = icmp ult i32 %0, %1
  %4 = zext i1 %3 to i32
  ret i32 %4
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @MUL_Overflow_SINT(i8 noundef signext %0, i8 noundef signext %1) local_unnamed_addr #2 {
  %3 = sext i8 %0 to i32
  %4 = icmp sgt i8 %0, 0
  %5 = sext i8 %1 to i32
  %6 = icmp sgt i8 %1, 0
  %7 = and i1 %4, %6
  br i1 %7, label %8, label %11

8:                                                ; preds = %2
  %9 = udiv i8 127, %1
  %10 = icmp samesign ult i8 %9, %0
  br i1 %10, label %37, label %36

11:                                               ; preds = %2
  %12 = icmp slt i8 %1, 1
  %13 = and i1 %4, %12
  br i1 %13, label %14, label %19

14:                                               ; preds = %11
  %15 = udiv i8 -128, %0
  %16 = zext i8 %15 to i32
  %17 = sub nsw i32 0, %16
  %18 = icmp sgt i32 %17, %5
  br i1 %18, label %37, label %36

19:                                               ; preds = %11
  %20 = icmp slt i8 %0, 1
  %21 = and i1 %20, %6
  br i1 %21, label %22, label %27

22:                                               ; preds = %19
  %23 = udiv i8 -128, %1
  %24 = zext i8 %23 to i32
  %25 = sub nsw i32 0, %24
  %26 = icmp sgt i32 %25, %3
  br i1 %26, label %37, label %36

27:                                               ; preds = %19
  %28 = icmp slt i8 %0, 0
  %29 = and i1 %28, %12
  br i1 %29, label %30, label %36

30:                                               ; preds = %27
  %31 = sub i8 0, %0
  %32 = udiv i8 127, %31
  %33 = zext nneg i8 %32 to i32
  %34 = sub nsw i32 0, %33
  %35 = icmp sgt i32 %34, %5
  br i1 %35, label %37, label %36

36:                                               ; preds = %22, %14, %8, %30, %27
  br label %37

37:                                               ; preds = %8, %14, %22, %30, %36
  %38 = phi i32 [ 0, %36 ], [ 1, %30 ], [ 1, %22 ], [ 1, %14 ], [ 1, %8 ]
  ret i32 %38
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @MUL_Overflow_INT(i16 noundef signext %0, i16 noundef signext %1) local_unnamed_addr #2 {
  %3 = sext i16 %0 to i32
  %4 = icmp sgt i16 %0, 0
  %5 = sext i16 %1 to i32
  %6 = icmp sgt i16 %1, 0
  %7 = and i1 %4, %6
  br i1 %7, label %8, label %11

8:                                                ; preds = %2
  %9 = udiv i16 32767, %1
  %10 = icmp samesign ult i16 %9, %0
  br i1 %10, label %37, label %36

11:                                               ; preds = %2
  %12 = icmp slt i16 %1, 1
  %13 = and i1 %4, %12
  br i1 %13, label %14, label %19

14:                                               ; preds = %11
  %15 = udiv i16 -32768, %0
  %16 = zext i16 %15 to i32
  %17 = sub nsw i32 0, %16
  %18 = icmp sgt i32 %17, %5
  br i1 %18, label %37, label %36

19:                                               ; preds = %11
  %20 = icmp slt i16 %0, 1
  %21 = and i1 %20, %6
  br i1 %21, label %22, label %27

22:                                               ; preds = %19
  %23 = udiv i16 -32768, %1
  %24 = zext i16 %23 to i32
  %25 = sub nsw i32 0, %24
  %26 = icmp sgt i32 %25, %3
  br i1 %26, label %37, label %36

27:                                               ; preds = %19
  %28 = icmp slt i16 %0, 0
  %29 = and i1 %28, %12
  br i1 %29, label %30, label %36

30:                                               ; preds = %27
  %31 = sub i16 0, %0
  %32 = udiv i16 32767, %31
  %33 = zext nneg i16 %32 to i32
  %34 = sub nsw i32 0, %33
  %35 = icmp sgt i32 %34, %5
  br i1 %35, label %37, label %36

36:                                               ; preds = %22, %14, %8, %30, %27
  br label %37

37:                                               ; preds = %8, %14, %22, %30, %36
  %38 = phi i32 [ 0, %36 ], [ 1, %30 ], [ 1, %22 ], [ 1, %14 ], [ 1, %8 ]
  ret i32 %38
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @MUL_Overflow_DINT(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  %4 = icmp sgt i32 %1, 0
  %5 = and i1 %3, %4
  br i1 %5, label %6, label %9

6:                                                ; preds = %2
  %7 = udiv i32 2147483647, %1
  %8 = icmp samesign ult i32 %7, %0
  br i1 %8, label %32, label %31

9:                                                ; preds = %2
  %10 = icmp slt i32 %1, 1
  %11 = and i1 %3, %10
  br i1 %11, label %12, label %16

12:                                               ; preds = %9
  %13 = udiv i32 -2147483648, %0
  %14 = sub i32 0, %13
  %15 = icmp slt i32 %1, %14
  br i1 %15, label %32, label %31

16:                                               ; preds = %9
  %17 = icmp slt i32 %0, 1
  %18 = and i1 %17, %4
  br i1 %18, label %19, label %23

19:                                               ; preds = %16
  %20 = udiv i32 -2147483648, %1
  %21 = sub i32 0, %20
  %22 = icmp slt i32 %0, %21
  br i1 %22, label %32, label %31

23:                                               ; preds = %16
  %24 = icmp slt i32 %0, 0
  %25 = and i1 %24, %10
  br i1 %25, label %26, label %31

26:                                               ; preds = %23
  %27 = sub i32 0, %0
  %28 = udiv i32 2147483647, %27
  %29 = sub nsw i32 0, %28
  %30 = icmp slt i32 %1, %29
  br i1 %30, label %32, label %31

31:                                               ; preds = %19, %12, %6, %26, %23
  br label %32

32:                                               ; preds = %6, %12, %19, %26, %31
  %33 = phi i32 [ 0, %31 ], [ 1, %26 ], [ 1, %19 ], [ 1, %12 ], [ 1, %6 ]
  ret i32 %33
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @MUL_Overflow_LINT(i64 noundef %0, i64 noundef %1) local_unnamed_addr #2 {
  %3 = icmp sgt i64 %0, 0
  %4 = icmp sgt i64 %1, 0
  %5 = and i1 %3, %4
  br i1 %5, label %6, label %9

6:                                                ; preds = %2
  %7 = udiv i64 9223372036854775807, %1
  %8 = icmp samesign ult i64 %7, %0
  br i1 %8, label %32, label %31

9:                                                ; preds = %2
  %10 = icmp slt i64 %1, 1
  %11 = and i1 %3, %10
  br i1 %11, label %12, label %16

12:                                               ; preds = %9
  %13 = udiv i64 -9223372036854775808, %0
  %14 = sub i64 0, %13
  %15 = icmp slt i64 %1, %14
  br i1 %15, label %32, label %31

16:                                               ; preds = %9
  %17 = icmp slt i64 %0, 1
  %18 = and i1 %17, %4
  br i1 %18, label %19, label %23

19:                                               ; preds = %16
  %20 = udiv i64 -9223372036854775808, %1
  %21 = sub i64 0, %20
  %22 = icmp slt i64 %0, %21
  br i1 %22, label %32, label %31

23:                                               ; preds = %16
  %24 = icmp slt i64 %0, 0
  %25 = and i1 %24, %10
  br i1 %25, label %26, label %31

26:                                               ; preds = %23
  %27 = sub i64 0, %0
  %28 = udiv i64 9223372036854775807, %27
  %29 = sub nsw i64 0, %28
  %30 = icmp slt i64 %1, %29
  br i1 %30, label %32, label %31

31:                                               ; preds = %19, %12, %6, %26, %23
  br label %32

32:                                               ; preds = %6, %12, %19, %26, %31
  %33 = phi i32 [ 0, %31 ], [ 1, %26 ], [ 1, %19 ], [ 1, %12 ], [ 1, %6 ]
  ret i32 %33
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @MUL_Overflow_USINT(i8 noundef zeroext %0, i8 noundef zeroext %1) local_unnamed_addr #2 {
  %3 = icmp eq i8 %1, 0
  br i1 %3, label %7, label %4

4:                                                ; preds = %2
  %5 = tail call { i8, i1 } @llvm.umul.with.overflow.i8(i8 %1, i8 %0)
  %6 = extractvalue { i8, i1 } %5, 1
  br i1 %6, label %8, label %7

7:                                                ; preds = %4, %2
  br label %8

8:                                                ; preds = %4, %7
  %9 = phi i32 [ 0, %7 ], [ 1, %4 ]
  ret i32 %9
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @MUL_Overflow_UINT(i16 noundef zeroext %0, i16 noundef zeroext %1) local_unnamed_addr #2 {
  %3 = icmp eq i16 %1, 0
  br i1 %3, label %7, label %4

4:                                                ; preds = %2
  %5 = tail call { i16, i1 } @llvm.umul.with.overflow.i16(i16 %1, i16 %0)
  %6 = extractvalue { i16, i1 } %5, 1
  br i1 %6, label %8, label %7

7:                                                ; preds = %4, %2
  br label %8

8:                                                ; preds = %4, %7
  %9 = phi i32 [ 0, %7 ], [ 1, %4 ]
  ret i32 %9
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @MUL_Overflow_UDINT(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = icmp eq i32 %1, 0
  br i1 %3, label %7, label %4

4:                                                ; preds = %2
  %5 = tail call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %1, i32 %0)
  %6 = extractvalue { i32, i1 } %5, 1
  br i1 %6, label %8, label %7

7:                                                ; preds = %4, %2
  br label %8

8:                                                ; preds = %4, %7
  %9 = phi i32 [ 0, %7 ], [ 1, %4 ]
  ret i32 %9
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @MUL_Overflow_ULINT(i64 noundef %0, i64 noundef %1) local_unnamed_addr #2 {
  %3 = icmp eq i64 %1, 0
  br i1 %3, label %7, label %4

4:                                                ; preds = %2
  %5 = tail call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %1, i64 %0)
  %6 = extractvalue { i64, i1 } %5, 1
  br i1 %6, label %8, label %7

7:                                                ; preds = %4, %2
  br label %8

8:                                                ; preds = %4, %7
  %9 = phi i32 [ 0, %7 ], [ 1, %4 ]
  ret i32 %9
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @MUL_Overflow_TIME(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = icmp eq i32 %1, 0
  br i1 %3, label %7, label %4

4:                                                ; preds = %2
  %5 = tail call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %1, i32 %0)
  %6 = extractvalue { i32, i1 } %5, 1
  br i1 %6, label %8, label %7

7:                                                ; preds = %4, %2
  br label %8

8:                                                ; preds = %4, %7
  %9 = phi i32 [ 0, %7 ], [ 1, %4 ]
  ret i32 %9
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @MUL_Overflow_TIME_UDINT(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = icmp eq i32 %1, 0
  br i1 %3, label %7, label %4

4:                                                ; preds = %2
  %5 = tail call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %1, i32 %0)
  %6 = extractvalue { i32, i1 } %5, 1
  br i1 %6, label %8, label %7

7:                                                ; preds = %4, %2
  br label %8

8:                                                ; preds = %4, %7
  %9 = phi i32 [ 0, %7 ], [ 1, %4 ]
  ret i32 %9
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @DIV_Overflow_SINT(i8 noundef signext %0, i8 noundef signext %1) local_unnamed_addr #2 {
  %3 = icmp eq i8 %0, -128
  %4 = icmp eq i8 %1, -1
  %5 = and i1 %3, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @DIV_Overflow_INT(i16 noundef signext %0, i16 noundef signext %1) local_unnamed_addr #2 {
  %3 = icmp eq i16 %0, -32768
  %4 = icmp eq i16 %1, -1
  %5 = and i1 %3, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @DIV_Overflow_DINT(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = icmp eq i32 %0, -2147483648
  %4 = icmp eq i32 %1, -1
  %5 = and i1 %3, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @DIV_Overflow_LINT(i64 noundef %0, i64 noundef %1) local_unnamed_addr #2 {
  %3 = icmp eq i64 %0, -9223372036854775808
  %4 = icmp eq i64 %1, -1
  %5 = and i1 %3, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #3

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #3

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare { i8, i1 } @llvm.umul.with.overflow.i8(i8, i8) #3

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare { i16, i1 } @llvm.umul.with.overflow.i16(i16, i16) #3

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare { i32, i1 } @llvm.umul.with.overflow.i32(i32, i32) #3

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #3

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCPIEC\\check.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
