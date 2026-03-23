; ModuleID = '..\PLCPIEC\BcdTo.c'
source_filename = "..\\PLCPIEC\\BcdTo.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@STAT_ENO_BCD_TO = dso_local local_unnamed_addr global i8 0, align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport void @SetBcdToEno(i8 noundef signext %0) local_unnamed_addr #0 {
  store i8 %0, ptr @STAT_ENO_BCD_TO, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport signext i8 @GetBcdToEno() local_unnamed_addr #1 {
  %1 = load i8, ptr @STAT_ENO_BCD_TO, align 1
  ret i8 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @B_BCD_TO_DINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_BCD_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 262, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i8, ptr %6, align 1
  %8 = and i8 %7, 15
  %9 = icmp ugt i8 %7, -97
  %10 = icmp samesign ugt i8 %8, 9
  %11 = select i1 %9, i1 true, i1 %10
  br i1 %11, label %12, label %13

12:                                               ; preds = %4
  store i8 0, ptr @STAT_ENO_BCD_TO, align 1
  br label %18

13:                                               ; preds = %4
  %14 = lshr i8 %7, 4
  %15 = mul nuw nsw i8 %14, 10
  %16 = add nuw nsw i8 %15, %8
  %17 = zext nneg i8 %16 to i32
  br label %18

18:                                               ; preds = %13, %12
  %19 = phi i32 [ -1, %12 ], [ %17, %13 ]
  store i32 %19, ptr %6, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @B_BCD_TO_INT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_BCD_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 261, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i8, ptr %6, align 1
  %8 = and i8 %7, 15
  %9 = icmp ugt i8 %7, -97
  %10 = icmp samesign ugt i8 %8, 9
  %11 = select i1 %9, i1 true, i1 %10
  br i1 %11, label %12, label %13

12:                                               ; preds = %4
  store i8 0, ptr @STAT_ENO_BCD_TO, align 1
  br label %18

13:                                               ; preds = %4
  %14 = lshr i8 %7, 4
  %15 = mul nuw nsw i8 %14, 10
  %16 = add nuw nsw i8 %15, %8
  %17 = zext nneg i8 %16 to i16
  br label %18

18:                                               ; preds = %13, %12
  %19 = phi i16 [ -1, %12 ], [ %17, %13 ]
  store i16 %19, ptr %6, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @B_BCD_TO_LINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_BCD_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 263, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i8, ptr %6, align 1
  %8 = and i8 %7, 15
  %9 = icmp ugt i8 %7, -97
  %10 = icmp samesign ugt i8 %8, 9
  %11 = select i1 %9, i1 true, i1 %10
  br i1 %11, label %12, label %13

12:                                               ; preds = %4
  store i8 0, ptr @STAT_ENO_BCD_TO, align 1
  br label %18

13:                                               ; preds = %4
  %14 = lshr i8 %7, 4
  %15 = mul nuw nsw i8 %14, 10
  %16 = add nuw nsw i8 %15, %8
  %17 = zext nneg i8 %16 to i64
  br label %18

18:                                               ; preds = %13, %12
  %19 = phi i64 [ -1, %12 ], [ %17, %13 ]
  store i64 %19, ptr %6, align 8
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @B_BCD_TO_SINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_BCD_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 260, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i8, ptr %6, align 1
  %8 = and i8 %7, 15
  %9 = icmp ugt i8 %7, -97
  %10 = icmp samesign ugt i8 %8, 9
  %11 = select i1 %9, i1 true, i1 %10
  br i1 %11, label %12, label %13

12:                                               ; preds = %4
  store i8 -1, ptr %6, align 1
  store i8 0, ptr @STAT_ENO_BCD_TO, align 1
  br label %17

13:                                               ; preds = %4
  %14 = lshr i8 %7, 4
  %15 = mul nuw nsw i8 %14, 10
  %16 = add nuw nsw i8 %15, %8
  store i8 %16, ptr %6, align 1
  br label %17

17:                                               ; preds = %13, %12
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @BCD_TO_DINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_BCD_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 262, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = lshr i32 %7, 24
  %9 = and i32 %8, 15
  %10 = lshr i32 %7, 20
  %11 = and i32 %10, 15
  %12 = lshr i32 %7, 16
  %13 = and i32 %12, 15
  %14 = lshr i32 %7, 12
  %15 = and i32 %14, 15
  %16 = lshr i32 %7, 8
  %17 = and i32 %16, 15
  %18 = lshr i32 %7, 4
  %19 = and i32 %7, 15
  %20 = icmp ugt i32 %7, -1610612737
  %21 = icmp samesign ugt i32 %9, 9
  %22 = select i1 %20, i1 true, i1 %21
  %23 = icmp samesign ugt i32 %11, 9
  %24 = select i1 %22, i1 true, i1 %23
  %25 = icmp samesign ugt i32 %13, 9
  %26 = select i1 %24, i1 true, i1 %25
  %27 = icmp samesign ugt i32 %15, 9
  %28 = select i1 %26, i1 true, i1 %27
  %29 = icmp samesign ugt i32 %17, 9
  %30 = select i1 %28, i1 true, i1 %29
  %31 = and i32 %18, 15
  %32 = icmp samesign ugt i32 %31, 9
  %33 = select i1 %30, i1 true, i1 %32
  %34 = icmp samesign ugt i32 %19, 9
  %35 = select i1 %33, i1 true, i1 %34
  br i1 %35, label %36, label %37

36:                                               ; preds = %4
  store i8 0, ptr @STAT_ENO_BCD_TO, align 1
  br label %53

37:                                               ; preds = %4
  %38 = lshr i32 %7, 28
  %39 = mul nuw nsw i32 %31, 10
  %40 = mul nuw nsw i32 %17, 100
  %41 = mul nuw nsw i32 %15, 1000
  %42 = mul nuw nsw i32 %13, 10000
  %43 = mul nuw nsw i32 %11, 100000
  %44 = mul nuw nsw i32 %9, 1000000
  %45 = mul nuw nsw i32 %38, 10000000
  %46 = or disjoint i32 %45, %19
  %47 = add nuw nsw i32 %46, %39
  %48 = add nuw nsw i32 %47, %40
  %49 = add nuw nsw i32 %48, %41
  %50 = add nuw nsw i32 %49, %42
  %51 = add nuw nsw i32 %50, %43
  %52 = add nuw nsw i32 %51, %44
  br label %53

53:                                               ; preds = %37, %36
  %54 = phi i32 [ -1, %36 ], [ %52, %37 ]
  store i32 %54, ptr %6, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @D_BCD_TO_DINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_BCD_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 262, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = lshr i32 %7, 24
  %9 = and i32 %8, 15
  %10 = lshr i32 %7, 20
  %11 = and i32 %10, 15
  %12 = lshr i32 %7, 16
  %13 = and i32 %12, 15
  %14 = lshr i32 %7, 12
  %15 = and i32 %14, 15
  %16 = lshr i32 %7, 8
  %17 = and i32 %16, 15
  %18 = lshr i32 %7, 4
  %19 = and i32 %7, 15
  %20 = icmp ugt i32 %7, -1610612737
  %21 = icmp samesign ugt i32 %9, 9
  %22 = select i1 %20, i1 true, i1 %21
  %23 = icmp samesign ugt i32 %11, 9
  %24 = select i1 %22, i1 true, i1 %23
  %25 = icmp samesign ugt i32 %13, 9
  %26 = select i1 %24, i1 true, i1 %25
  %27 = icmp samesign ugt i32 %15, 9
  %28 = select i1 %26, i1 true, i1 %27
  %29 = icmp samesign ugt i32 %17, 9
  %30 = select i1 %28, i1 true, i1 %29
  %31 = and i32 %18, 15
  %32 = icmp samesign ugt i32 %31, 9
  %33 = select i1 %30, i1 true, i1 %32
  %34 = icmp samesign ugt i32 %19, 9
  %35 = select i1 %33, i1 true, i1 %34
  br i1 %35, label %36, label %37

36:                                               ; preds = %4
  store i8 0, ptr @STAT_ENO_BCD_TO, align 1
  br label %53

37:                                               ; preds = %4
  %38 = lshr i32 %7, 28
  %39 = mul nuw nsw i32 %31, 10
  %40 = mul nuw nsw i32 %17, 100
  %41 = mul nuw nsw i32 %15, 1000
  %42 = mul nuw nsw i32 %13, 10000
  %43 = mul nuw nsw i32 %11, 100000
  %44 = mul nuw nsw i32 %9, 1000000
  %45 = mul nuw nsw i32 %38, 10000000
  %46 = or disjoint i32 %45, %19
  %47 = add nuw nsw i32 %46, %39
  %48 = add nuw nsw i32 %47, %40
  %49 = add nuw nsw i32 %48, %41
  %50 = add nuw nsw i32 %49, %42
  %51 = add nuw nsw i32 %50, %43
  %52 = add nuw nsw i32 %51, %44
  br label %53

53:                                               ; preds = %36, %37
  %54 = phi i32 [ -1, %36 ], [ %52, %37 ]
  store i32 %54, ptr %6, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @D_BCD_TO_INT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_BCD_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 261, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = lshr i32 %7, 24
  %9 = and i32 %8, 15
  %10 = lshr i32 %7, 20
  %11 = and i32 %10, 15
  %12 = lshr i32 %7, 16
  %13 = and i32 %12, 15
  %14 = lshr i32 %7, 12
  %15 = and i32 %14, 15
  %16 = lshr i32 %7, 8
  %17 = and i32 %16, 15
  %18 = lshr i32 %7, 4
  %19 = and i32 %7, 15
  %20 = icmp ugt i32 %7, -1610612737
  %21 = icmp samesign ugt i32 %9, 9
  %22 = select i1 %20, i1 true, i1 %21
  %23 = icmp samesign ugt i32 %11, 9
  %24 = select i1 %22, i1 true, i1 %23
  %25 = icmp samesign ugt i32 %13, 9
  %26 = select i1 %24, i1 true, i1 %25
  %27 = icmp samesign ugt i32 %15, 9
  %28 = select i1 %26, i1 true, i1 %27
  %29 = icmp samesign ugt i32 %17, 9
  %30 = select i1 %28, i1 true, i1 %29
  %31 = and i32 %18, 15
  %32 = icmp samesign ugt i32 %31, 9
  %33 = select i1 %30, i1 true, i1 %32
  %34 = icmp samesign ugt i32 %19, 9
  %35 = select i1 %33, i1 true, i1 %34
  br i1 %35, label %36, label %37

36:                                               ; preds = %4
  store i16 -1, ptr %6, align 2
  store i8 0, ptr @STAT_ENO_BCD_TO, align 1
  br label %57

37:                                               ; preds = %4
  %38 = lshr i32 %7, 28
  %39 = mul nuw nsw i32 %31, 10
  %40 = mul nuw nsw i32 %17, 100
  %41 = mul nuw nsw i32 %15, 1000
  %42 = mul nuw nsw i32 %13, 10000
  %43 = mul nuw nsw i32 %11, 100000
  %44 = mul nuw nsw i32 %9, 1000000
  %45 = mul nuw nsw i32 %38, 10000000
  %46 = or disjoint i32 %45, %19
  %47 = add nuw nsw i32 %46, %39
  %48 = add nuw nsw i32 %47, %40
  %49 = add nuw nsw i32 %48, %41
  %50 = add nuw nsw i32 %49, %42
  %51 = add nuw nsw i32 %50, %43
  %52 = add nuw nsw i32 %51, %44
  %53 = icmp samesign ugt i32 %52, 32767
  br i1 %53, label %54, label %55

54:                                               ; preds = %37
  store i16 -1, ptr %6, align 2
  store i8 0, ptr @STAT_ENO_BCD_TO, align 1
  br label %57

55:                                               ; preds = %37
  %56 = trunc nuw nsw i32 %52 to i16
  store i16 %56, ptr %6, align 2
  br label %57

57:                                               ; preds = %54, %55, %36
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @D_BCD_TO_LINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_BCD_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 263, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = lshr i32 %7, 24
  %9 = and i32 %8, 15
  %10 = lshr i32 %7, 20
  %11 = and i32 %10, 15
  %12 = lshr i32 %7, 16
  %13 = and i32 %12, 15
  %14 = lshr i32 %7, 12
  %15 = and i32 %14, 15
  %16 = lshr i32 %7, 8
  %17 = and i32 %16, 15
  %18 = lshr i32 %7, 4
  %19 = and i32 %7, 15
  %20 = icmp ugt i32 %7, -1610612737
  %21 = icmp samesign ugt i32 %9, 9
  %22 = select i1 %20, i1 true, i1 %21
  %23 = icmp samesign ugt i32 %11, 9
  %24 = select i1 %22, i1 true, i1 %23
  %25 = icmp samesign ugt i32 %13, 9
  %26 = select i1 %24, i1 true, i1 %25
  %27 = icmp samesign ugt i32 %15, 9
  %28 = select i1 %26, i1 true, i1 %27
  %29 = icmp samesign ugt i32 %17, 9
  %30 = select i1 %28, i1 true, i1 %29
  %31 = and i32 %18, 15
  %32 = icmp samesign ugt i32 %31, 9
  %33 = select i1 %30, i1 true, i1 %32
  %34 = icmp samesign ugt i32 %19, 9
  %35 = select i1 %33, i1 true, i1 %34
  br i1 %35, label %36, label %37

36:                                               ; preds = %4
  store i8 0, ptr @STAT_ENO_BCD_TO, align 1
  br label %54

37:                                               ; preds = %4
  %38 = lshr i32 %7, 28
  %39 = mul nuw nsw i32 %31, 10
  %40 = mul nuw nsw i32 %17, 100
  %41 = mul nuw nsw i32 %15, 1000
  %42 = mul nuw nsw i32 %13, 10000
  %43 = mul nuw nsw i32 %11, 100000
  %44 = mul nuw nsw i32 %9, 1000000
  %45 = mul nuw nsw i32 %38, 10000000
  %46 = or disjoint i32 %45, %19
  %47 = add nuw nsw i32 %46, %39
  %48 = add nuw nsw i32 %47, %40
  %49 = add nuw nsw i32 %48, %41
  %50 = add nuw nsw i32 %49, %42
  %51 = add nuw nsw i32 %50, %43
  %52 = add nuw nsw i32 %51, %44
  %53 = zext nneg i32 %52 to i64
  br label %54

54:                                               ; preds = %37, %36
  %55 = phi i64 [ -1, %36 ], [ %53, %37 ]
  store i64 %55, ptr %6, align 8
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @D_BCD_TO_SINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_BCD_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 260, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = lshr i32 %7, 24
  %9 = and i32 %8, 15
  %10 = lshr i32 %7, 20
  %11 = and i32 %10, 15
  %12 = lshr i32 %7, 16
  %13 = and i32 %12, 15
  %14 = lshr i32 %7, 12
  %15 = and i32 %14, 15
  %16 = lshr i32 %7, 8
  %17 = and i32 %16, 15
  %18 = lshr i32 %7, 4
  %19 = and i32 %7, 15
  %20 = icmp ugt i32 %7, -1610612737
  %21 = icmp samesign ugt i32 %9, 9
  %22 = select i1 %20, i1 true, i1 %21
  %23 = icmp samesign ugt i32 %11, 9
  %24 = select i1 %22, i1 true, i1 %23
  %25 = icmp samesign ugt i32 %13, 9
  %26 = select i1 %24, i1 true, i1 %25
  %27 = icmp samesign ugt i32 %15, 9
  %28 = select i1 %26, i1 true, i1 %27
  %29 = icmp samesign ugt i32 %17, 9
  %30 = select i1 %28, i1 true, i1 %29
  %31 = and i32 %18, 15
  %32 = icmp samesign ugt i32 %31, 9
  %33 = select i1 %30, i1 true, i1 %32
  %34 = icmp samesign ugt i32 %19, 9
  %35 = select i1 %33, i1 true, i1 %34
  br i1 %35, label %36, label %37

36:                                               ; preds = %4
  store i8 -1, ptr %6, align 1
  store i8 0, ptr @STAT_ENO_BCD_TO, align 1
  br label %57

37:                                               ; preds = %4
  %38 = lshr i32 %7, 28
  %39 = mul nuw nsw i32 %31, 10
  %40 = mul nuw nsw i32 %17, 100
  %41 = mul nuw nsw i32 %15, 1000
  %42 = mul nuw nsw i32 %13, 10000
  %43 = mul nuw nsw i32 %11, 100000
  %44 = mul nuw nsw i32 %9, 1000000
  %45 = mul nuw nsw i32 %38, 10000000
  %46 = add nuw nsw i32 %39, %19
  %47 = add nuw nsw i32 %46, %40
  %48 = add nuw nsw i32 %47, %41
  %49 = add nuw nsw i32 %48, %42
  %50 = add nuw nsw i32 %49, %43
  %51 = add nuw nsw i32 %50, %44
  %52 = add nuw nsw i32 %51, %45
  %53 = icmp samesign ugt i32 %52, 127
  br i1 %53, label %54, label %55

54:                                               ; preds = %37
  store i8 -1, ptr %6, align 1
  store i8 0, ptr @STAT_ENO_BCD_TO, align 1
  br label %57

55:                                               ; preds = %37
  %56 = trunc nuw i32 %51 to i8
  store i8 %56, ptr %6, align 1
  br label %57

57:                                               ; preds = %54, %55, %36
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @W_BCD_TO_DINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_BCD_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 262, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i16, ptr %6, align 2
  %8 = lshr i16 %7, 8
  %9 = and i16 %8, 15
  %10 = lshr i16 %7, 4
  %11 = and i16 %7, 15
  %12 = icmp ugt i16 %7, -24577
  %13 = icmp samesign ugt i16 %9, 9
  %14 = select i1 %12, i1 true, i1 %13
  %15 = and i16 %10, 15
  %16 = icmp samesign ugt i16 %15, 9
  %17 = select i1 %14, i1 true, i1 %16
  %18 = icmp samesign ugt i16 %11, 9
  %19 = select i1 %17, i1 true, i1 %18
  br i1 %19, label %20, label %21

20:                                               ; preds = %4
  store i8 0, ptr @STAT_ENO_BCD_TO, align 1
  br label %30

21:                                               ; preds = %4
  %22 = lshr i16 %7, 12
  %23 = mul nuw nsw i16 %15, 10
  %24 = mul nuw nsw i16 %9, 100
  %25 = mul nuw nsw i16 %22, 1000
  %26 = add nuw nsw i16 %25, %11
  %27 = add nuw nsw i16 %26, %23
  %28 = add nuw nsw i16 %27, %24
  %29 = zext nneg i16 %28 to i32
  br label %30

30:                                               ; preds = %21, %20
  %31 = phi i32 [ -1, %20 ], [ %29, %21 ]
  store i32 %31, ptr %6, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @W_BCD_TO_INT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_BCD_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 261, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i16, ptr %6, align 2
  %8 = lshr i16 %7, 8
  %9 = and i16 %8, 15
  %10 = lshr i16 %7, 4
  %11 = icmp ugt i16 %7, -24577
  %12 = icmp samesign ugt i16 %9, 9
  %13 = select i1 %11, i1 true, i1 %12
  %14 = and i16 %10, 15
  %15 = icmp samesign ugt i16 %14, 9
  %16 = select i1 %13, i1 true, i1 %15
  %17 = and i16 %7, 14
  %18 = icmp samesign ugt i16 %17, 9
  %19 = select i1 %16, i1 true, i1 %18
  br i1 %19, label %20, label %21

20:                                               ; preds = %4
  store i8 0, ptr @STAT_ENO_BCD_TO, align 1
  br label %30

21:                                               ; preds = %4
  %22 = lshr i16 %7, 12
  %23 = and i16 %7, 15
  %24 = mul nuw nsw i16 %14, 10
  %25 = mul nuw nsw i16 %9, 100
  %26 = mul nuw nsw i16 %22, 1000
  %27 = add nuw nsw i16 %26, %23
  %28 = add nuw nsw i16 %27, %24
  %29 = add nuw nsw i16 %28, %25
  br label %30

30:                                               ; preds = %21, %20
  %31 = phi i16 [ -1, %20 ], [ %29, %21 ]
  store i16 %31, ptr %6, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @W_BCD_TO_LINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_BCD_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 263, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i16, ptr %6, align 2
  %8 = lshr i16 %7, 8
  %9 = and i16 %8, 15
  %10 = lshr i16 %7, 4
  %11 = and i16 %7, 15
  %12 = icmp ugt i16 %7, -24577
  %13 = icmp samesign ugt i16 %9, 9
  %14 = select i1 %12, i1 true, i1 %13
  %15 = and i16 %10, 15
  %16 = icmp samesign ugt i16 %15, 9
  %17 = select i1 %14, i1 true, i1 %16
  %18 = icmp samesign ugt i16 %11, 9
  %19 = select i1 %17, i1 true, i1 %18
  br i1 %19, label %20, label %21

20:                                               ; preds = %4
  store i8 0, ptr @STAT_ENO_BCD_TO, align 1
  br label %30

21:                                               ; preds = %4
  %22 = lshr i16 %7, 12
  %23 = mul nuw nsw i16 %15, 10
  %24 = mul nuw nsw i16 %9, 100
  %25 = mul nuw nsw i16 %22, 1000
  %26 = add nuw nsw i16 %25, %11
  %27 = add nuw nsw i16 %26, %23
  %28 = add nuw nsw i16 %27, %24
  %29 = zext nneg i16 %28 to i64
  br label %30

30:                                               ; preds = %21, %20
  %31 = phi i64 [ -1, %20 ], [ %29, %21 ]
  store i64 %31, ptr %6, align 8
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @W_BCD_TO_SINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_BCD_TO, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 260, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i16, ptr %6, align 2
  %8 = lshr i16 %7, 8
  %9 = and i16 %8, 15
  %10 = lshr i16 %7, 4
  %11 = icmp ugt i16 %7, -24577
  %12 = icmp samesign ugt i16 %9, 9
  %13 = select i1 %11, i1 true, i1 %12
  %14 = and i16 %10, 15
  %15 = icmp samesign ugt i16 %14, 9
  %16 = select i1 %13, i1 true, i1 %15
  %17 = and i16 %7, 14
  %18 = icmp samesign ugt i16 %17, 9
  %19 = select i1 %16, i1 true, i1 %18
  br i1 %19, label %20, label %21

20:                                               ; preds = %4
  store i8 -1, ptr %6, align 1
  store i8 0, ptr @STAT_ENO_BCD_TO, align 1
  br label %34

21:                                               ; preds = %4
  %22 = lshr i16 %7, 12
  %23 = and i16 %7, 15
  %24 = mul nuw nsw i16 %14, 10
  %25 = mul nuw nsw i16 %9, 100
  %26 = mul nuw nsw i16 %22, 1000
  %27 = add nuw nsw i16 %26, %23
  %28 = add nuw nsw i16 %27, %24
  %29 = add nuw nsw i16 %28, %25
  %30 = icmp samesign ugt i16 %29, 127
  br i1 %30, label %31, label %32

31:                                               ; preds = %21
  store i8 -1, ptr %6, align 1
  store i8 0, ptr @STAT_ENO_BCD_TO, align 1
  br label %34

32:                                               ; preds = %21
  %33 = trunc nuw nsw i16 %29 to i8
  store i8 %33, ptr %6, align 1
  br label %34

34:                                               ; preds = %31, %32, %20
  ret ptr %0
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCPIEC\\BcdTo.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
