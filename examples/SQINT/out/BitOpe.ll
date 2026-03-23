; ModuleID = '..\PLCPIEC\BitOpe.c'
source_filename = "..\\PLCPIEC\\BitOpe.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @BIT_TEST(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp sgt i8 %6, -1
  br i1 %7, label %8, label %42

8:                                                ; preds = %4
  %9 = zext nneg i8 %6 to i32
  %10 = shl nuw i32 1, %9
  %11 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %12 = load i16, ptr %11, align 1
  switch i16 %12, label %13 [
    i16 260, label %15
    i16 512, label %15
    i16 16, label %15
    i16 261, label %22
    i16 17, label %22
    i16 513, label %22
    i16 262, label %29
    i16 18, label %29
    i16 514, label %29
  ]

13:                                               ; preds = %8
  %14 = load ptr, ptr %0, align 1
  br label %40

15:                                               ; preds = %8, %8, %8
  %16 = icmp samesign ult i8 %6, 8
  %17 = load ptr, ptr %0, align 1
  br i1 %16, label %18, label %40

18:                                               ; preds = %15
  %19 = load i8, ptr %17, align 1
  %20 = zext i8 %19 to i32
  %21 = and i32 %10, %20
  br label %35

22:                                               ; preds = %8, %8, %8
  %23 = icmp samesign ult i8 %6, 16
  %24 = load ptr, ptr %0, align 1
  br i1 %23, label %25, label %40

25:                                               ; preds = %22
  %26 = load i16, ptr %24, align 2
  %27 = zext i16 %26 to i32
  %28 = and i32 %10, %27
  br label %35

29:                                               ; preds = %8, %8, %8
  %30 = icmp samesign ult i8 %6, 32
  %31 = load ptr, ptr %0, align 1
  br i1 %30, label %32, label %40

32:                                               ; preds = %29
  %33 = load i32, ptr %31, align 4
  %34 = and i32 %33, %10
  br label %35

35:                                               ; preds = %32, %25, %18
  %36 = phi ptr [ %24, %25 ], [ %17, %18 ], [ %31, %32 ]
  %37 = phi i32 [ %28, %25 ], [ %21, %18 ], [ %34, %32 ]
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %40, label %39

39:                                               ; preds = %35
  store i8 1, ptr %36, align 1
  br label %44

40:                                               ; preds = %13, %15, %22, %29, %35
  %41 = phi ptr [ %14, %13 ], [ %17, %15 ], [ %24, %22 ], [ %31, %29 ], [ %36, %35 ]
  store i8 0, ptr %41, align 1
  br label %44

42:                                               ; preds = %4
  %43 = load ptr, ptr %0, align 1
  store i8 0, ptr %43, align 1
  br label %44

44:                                               ; preds = %39, %40, %42
  %45 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %45, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @GET_CHAR(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i16, ptr %5, align 2
  %7 = sext i16 %6 to i32
  %8 = icmp slt i16 %6, 0
  %9 = load ptr, ptr %0, align 1
  br i1 %8, label %21, label %10

10:                                               ; preds = %4
  %11 = load i16, ptr %9, align 1
  %12 = zext i16 %11 to i32
  %13 = icmp samesign ugt i32 %7, %12
  br i1 %13, label %21, label %14

14:                                               ; preds = %10
  %15 = icmp eq i16 %11, 0
  br i1 %15, label %23, label %16

16:                                               ; preds = %14
  %17 = getelementptr i8, ptr %9, i32 1
  %18 = getelementptr i8, ptr %17, i32 %7
  %19 = load i8, ptr %18, align 1
  %20 = sext i8 %19 to i16
  br label %21

21:                                               ; preds = %10, %4, %16
  %22 = phi i16 [ 0, %4 ], [ %20, %16 ], [ 0, %10 ]
  store i16 %22, ptr %9, align 2
  br label %23

23:                                               ; preds = %21, %14
  %24 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 261, ptr %24, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @GET_LSB(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 16, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i16, ptr %6, align 2
  %8 = trunc i16 %7 to i8
  store i8 %8, ptr %6, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @GET_MSB(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 16, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i16, ptr %6, align 2
  %8 = lshr i16 %7, 8
  %9 = trunc nuw i16 %8 to i8
  store i8 %9, ptr %6, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @I_BIT_IN_BYTE(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i8, ptr %5, align 1
  %7 = load ptr, ptr %2, align 1
  %8 = load i8, ptr %7, align 1
  %9 = zext nneg i8 %8 to i32
  %10 = shl nuw i32 1, %9
  %11 = trunc i32 %10 to i8
  %12 = xor i8 %6, %11
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 16, ptr %13, align 1
  %14 = load ptr, ptr %0, align 1
  store i8 %12, ptr %14, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @I_BIT_IN_WORD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i16, ptr %5, align 2
  %7 = load ptr, ptr %2, align 1
  %8 = load i8, ptr %7, align 1
  %9 = zext nneg i8 %8 to i32
  %10 = shl nuw i32 1, %9
  %11 = trunc i32 %10 to i16
  %12 = xor i16 %6, %11
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 17, ptr %13, align 1
  %14 = load ptr, ptr %0, align 1
  store i16 %12, ptr %14, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @I_BIT_IN_DWORD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i32, ptr %5, align 4
  %7 = load ptr, ptr %2, align 1
  %8 = load i8, ptr %7, align 1
  %9 = zext nneg i8 %8 to i32
  %10 = shl nuw i32 1, %9
  %11 = xor i32 %10, %6
  %12 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 18, ptr %12, align 1
  %13 = load ptr, ptr %0, align 1
  store i32 %11, ptr %13, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @I_BIT_IN(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %38, label %8

8:                                                ; preds = %4
  %9 = load ptr, ptr %2, align 1
  %10 = load i8, ptr %9, align 1
  %11 = icmp sgt i8 %10, -1
  br i1 %11, label %12, label %38

12:                                               ; preds = %8
  %13 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %14 = load i16, ptr %13, align 1
  switch i16 %14, label %38 [
    i16 512, label %15
    i16 260, label %15
    i16 16, label %15
    i16 261, label %23
    i16 513, label %23
    i16 17, label %23
    i16 262, label %31
    i16 514, label %31
    i16 18, label %31
  ]

15:                                               ; preds = %12, %12, %12
  %16 = load ptr, ptr %1, align 1
  %17 = load i8, ptr %16, align 1
  %18 = zext nneg i8 %10 to i32
  %19 = shl nuw i32 1, %18
  %20 = trunc i32 %19 to i8
  %21 = xor i8 %17, %20
  %22 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 16, ptr %22, align 1
  store i8 %21, ptr %5, align 1
  br label %38

23:                                               ; preds = %12, %12, %12
  %24 = load ptr, ptr %1, align 1
  %25 = load i16, ptr %24, align 2
  %26 = zext nneg i8 %10 to i32
  %27 = shl nuw i32 1, %26
  %28 = trunc i32 %27 to i16
  %29 = xor i16 %25, %28
  %30 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 17, ptr %30, align 1
  store i16 %29, ptr %5, align 2
  br label %38

31:                                               ; preds = %12, %12, %12
  %32 = load ptr, ptr %1, align 1
  %33 = load i32, ptr %32, align 4
  %34 = zext nneg i8 %10 to i32
  %35 = shl nuw i32 1, %34
  %36 = xor i32 %33, %35
  %37 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 18, ptr %37, align 1
  store i32 %36, ptr %5, align 4
  br label %38

38:                                               ; preds = %8, %12, %31, %23, %15, %4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @PARITY_BYTE(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i8, ptr %5, align 1
  %7 = lshr i8 %6, 4
  %8 = xor i8 %7, %6
  store i8 %8, ptr %5, align 1
  %9 = load ptr, ptr %0, align 1
  %10 = load i8, ptr %9, align 1
  %11 = lshr i8 %10, 2
  %12 = xor i8 %11, %10
  store i8 %12, ptr %9, align 1
  %13 = load ptr, ptr %0, align 1
  %14 = load i8, ptr %13, align 1
  %15 = lshr i8 %14, 1
  %16 = xor i8 %15, %14
  store i8 %16, ptr %13, align 1
  %17 = load ptr, ptr %0, align 1
  %18 = load i8, ptr %17, align 1
  %19 = and i8 %18, 1
  store i8 %19, ptr %17, align 1
  %20 = load ptr, ptr %0, align 1
  %21 = load i8, ptr %20, align 1
  %22 = icmp eq i8 %21, 0
  %23 = zext i1 %22 to i8
  store i8 %23, ptr %20, align 1
  %24 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %24, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @PARITY_WORD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i16, ptr %5, align 2
  %7 = lshr i16 %6, 8
  %8 = xor i16 %7, %6
  store i16 %8, ptr %5, align 2
  %9 = load ptr, ptr %0, align 1
  %10 = load i16, ptr %9, align 2
  %11 = lshr i16 %10, 4
  %12 = xor i16 %11, %10
  store i16 %12, ptr %9, align 2
  %13 = load ptr, ptr %0, align 1
  %14 = load i16, ptr %13, align 2
  %15 = lshr i16 %14, 2
  %16 = xor i16 %15, %14
  store i16 %16, ptr %13, align 2
  %17 = load ptr, ptr %0, align 1
  %18 = load i16, ptr %17, align 2
  %19 = lshr i16 %18, 1
  %20 = xor i16 %19, %18
  store i16 %20, ptr %17, align 2
  %21 = load ptr, ptr %0, align 1
  %22 = load i16, ptr %21, align 2
  %23 = trunc i16 %22 to i8
  %24 = and i8 %23, 1
  store i8 %24, ptr %21, align 2
  %25 = load ptr, ptr %0, align 1
  %26 = load i8, ptr %25, align 1
  %27 = icmp eq i8 %26, 0
  %28 = zext i1 %27 to i8
  store i8 %28, ptr %25, align 1
  %29 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %29, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @PARITY_DWORD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i32, ptr %5, align 4
  %7 = lshr i32 %6, 16
  %8 = xor i32 %7, %6
  store i32 %8, ptr %5, align 4
  %9 = load ptr, ptr %0, align 1
  %10 = load i32, ptr %9, align 4
  %11 = lshr i32 %10, 8
  %12 = xor i32 %11, %10
  store i32 %12, ptr %9, align 4
  %13 = load ptr, ptr %0, align 1
  %14 = load i32, ptr %13, align 4
  %15 = lshr i32 %14, 4
  %16 = xor i32 %15, %14
  store i32 %16, ptr %13, align 4
  %17 = load ptr, ptr %0, align 1
  %18 = load i32, ptr %17, align 4
  %19 = lshr i32 %18, 2
  %20 = xor i32 %19, %18
  store i32 %20, ptr %17, align 4
  %21 = load ptr, ptr %0, align 1
  %22 = load i32, ptr %21, align 4
  %23 = lshr i32 %22, 1
  %24 = xor i32 %23, %22
  store i32 %24, ptr %21, align 4
  %25 = load ptr, ptr %0, align 1
  %26 = load i32, ptr %25, align 4
  %27 = trunc i32 %26 to i8
  %28 = and i8 %27, 1
  store i8 %28, ptr %25, align 4
  %29 = load ptr, ptr %0, align 1
  %30 = load i8, ptr %29, align 1
  %31 = icmp eq i8 %30, 0
  %32 = zext i1 %31 to i8
  store i8 %32, ptr %29, align 1
  %33 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %33, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @PARITY(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %74 [
    i16 260, label %7
    i16 512, label %7
    i16 16, label %7
    i16 261, label %22
    i16 513, label %22
    i16 17, label %22
    i16 262, label %42
    i16 514, label %42
    i16 18, label %42
  ]

7:                                                ; preds = %4, %4, %4
  %8 = load ptr, ptr %0, align 1
  %9 = load i8, ptr %8, align 1
  %10 = lshr i8 %9, 4
  %11 = xor i8 %10, %9
  store i8 %11, ptr %8, align 1
  %12 = load ptr, ptr %0, align 1
  %13 = load i8, ptr %12, align 1
  %14 = lshr i8 %13, 2
  %15 = xor i8 %14, %13
  store i8 %15, ptr %12, align 1
  %16 = load ptr, ptr %0, align 1
  %17 = load i8, ptr %16, align 1
  %18 = lshr i8 %17, 1
  %19 = xor i8 %18, %17
  store i8 %19, ptr %16, align 1
  %20 = load ptr, ptr %0, align 1
  %21 = load i8, ptr %20, align 1
  br label %66

22:                                               ; preds = %4, %4, %4
  %23 = load ptr, ptr %0, align 1
  %24 = load i16, ptr %23, align 2
  %25 = lshr i16 %24, 8
  %26 = xor i16 %25, %24
  store i16 %26, ptr %23, align 2
  %27 = load ptr, ptr %0, align 1
  %28 = load i16, ptr %27, align 2
  %29 = lshr i16 %28, 4
  %30 = xor i16 %29, %28
  store i16 %30, ptr %27, align 2
  %31 = load ptr, ptr %0, align 1
  %32 = load i16, ptr %31, align 2
  %33 = lshr i16 %32, 2
  %34 = xor i16 %33, %32
  store i16 %34, ptr %31, align 2
  %35 = load ptr, ptr %0, align 1
  %36 = load i16, ptr %35, align 2
  %37 = lshr i16 %36, 1
  %38 = xor i16 %37, %36
  store i16 %38, ptr %35, align 2
  %39 = load ptr, ptr %0, align 1
  %40 = load i16, ptr %39, align 2
  %41 = trunc i16 %40 to i8
  br label %66

42:                                               ; preds = %4, %4, %4
  %43 = load ptr, ptr %0, align 1
  %44 = load i32, ptr %43, align 4
  %45 = lshr i32 %44, 16
  %46 = xor i32 %45, %44
  store i32 %46, ptr %43, align 4
  %47 = load ptr, ptr %0, align 1
  %48 = load i32, ptr %47, align 4
  %49 = lshr i32 %48, 8
  %50 = xor i32 %49, %48
  store i32 %50, ptr %47, align 4
  %51 = load ptr, ptr %0, align 1
  %52 = load i32, ptr %51, align 4
  %53 = lshr i32 %52, 4
  %54 = xor i32 %53, %52
  store i32 %54, ptr %51, align 4
  %55 = load ptr, ptr %0, align 1
  %56 = load i32, ptr %55, align 4
  %57 = lshr i32 %56, 2
  %58 = xor i32 %57, %56
  store i32 %58, ptr %55, align 4
  %59 = load ptr, ptr %0, align 1
  %60 = load i32, ptr %59, align 4
  %61 = lshr i32 %60, 1
  %62 = xor i32 %61, %60
  store i32 %62, ptr %59, align 4
  %63 = load ptr, ptr %0, align 1
  %64 = load i32, ptr %63, align 4
  %65 = trunc i32 %64 to i8
  br label %66

66:                                               ; preds = %7, %22, %42
  %67 = phi i8 [ %65, %42 ], [ %41, %22 ], [ %21, %7 ]
  %68 = phi ptr [ %63, %42 ], [ %39, %22 ], [ %20, %7 ]
  %69 = and i8 %67, 1
  store i8 %69, ptr %68, align 1
  %70 = load ptr, ptr %0, align 1
  %71 = load i8, ptr %70, align 1
  %72 = icmp eq i8 %71, 0
  %73 = zext i1 %72 to i8
  store i8 %73, ptr %70, align 1
  store i16 1536, ptr %5, align 1
  br label %74

74:                                               ; preds = %66, %4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @R_BIT_IN_BYTE(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i8, ptr %5, align 1
  %7 = load ptr, ptr %2, align 1
  %8 = load i8, ptr %7, align 1
  %9 = zext nneg i8 %8 to i32
  %10 = shl nuw i32 1, %9
  %11 = trunc i32 %10 to i8
  %12 = xor i8 %11, -1
  %13 = and i8 %6, %12
  %14 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 16, ptr %14, align 1
  %15 = load ptr, ptr %0, align 1
  store i8 %13, ptr %15, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @R_BIT_IN_WORD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i16, ptr %5, align 2
  %7 = load ptr, ptr %2, align 1
  %8 = load i8, ptr %7, align 1
  %9 = zext nneg i8 %8 to i32
  %10 = shl nuw i32 1, %9
  %11 = trunc i32 %10 to i16
  %12 = xor i16 %11, -1
  %13 = and i16 %6, %12
  %14 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 17, ptr %14, align 1
  %15 = load ptr, ptr %0, align 1
  store i16 %13, ptr %15, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @R_BIT_IN_DWORD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i32, ptr %5, align 4
  %7 = load ptr, ptr %2, align 1
  %8 = load i8, ptr %7, align 1
  %9 = zext nneg i8 %8 to i32
  %10 = shl nuw i32 1, %9
  %11 = xor i32 %10, -1
  %12 = and i32 %6, %11
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 18, ptr %13, align 1
  %14 = load ptr, ptr %0, align 1
  store i32 %12, ptr %14, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @R_BIT_IN(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %41, label %8

8:                                                ; preds = %4
  %9 = load ptr, ptr %2, align 1
  %10 = load i8, ptr %9, align 1
  %11 = icmp sgt i8 %10, -1
  br i1 %11, label %12, label %41

12:                                               ; preds = %8
  %13 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %14 = load i16, ptr %13, align 1
  switch i16 %14, label %41 [
    i16 260, label %15
    i16 512, label %15
    i16 16, label %15
    i16 261, label %24
    i16 513, label %24
    i16 17, label %24
    i16 262, label %33
    i16 514, label %33
    i16 18, label %33
  ]

15:                                               ; preds = %12, %12, %12
  %16 = load ptr, ptr %1, align 1
  %17 = load i8, ptr %16, align 1
  %18 = zext nneg i8 %10 to i32
  %19 = shl nuw i32 1, %18
  %20 = trunc i32 %19 to i8
  %21 = xor i8 %20, -1
  %22 = and i8 %17, %21
  %23 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 16, ptr %23, align 1
  store i8 %22, ptr %5, align 1
  br label %41

24:                                               ; preds = %12, %12, %12
  %25 = load ptr, ptr %1, align 1
  %26 = load i16, ptr %25, align 2
  %27 = zext nneg i8 %10 to i32
  %28 = shl nuw i32 1, %27
  %29 = trunc i32 %28 to i16
  %30 = xor i16 %29, -1
  %31 = and i16 %26, %30
  %32 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 17, ptr %32, align 1
  store i16 %31, ptr %5, align 2
  br label %41

33:                                               ; preds = %12, %12, %12
  %34 = load ptr, ptr %1, align 1
  %35 = load i32, ptr %34, align 4
  %36 = zext nneg i8 %10 to i32
  %37 = shl nuw i32 1, %36
  %38 = xor i32 %37, -1
  %39 = and i32 %35, %38
  %40 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 18, ptr %40, align 1
  store i32 %39, ptr %5, align 4
  br label %41

41:                                               ; preds = %8, %12, %33, %24, %15, %4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @S_BIT_IN_BYTE(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i8, ptr %5, align 1
  %7 = load ptr, ptr %2, align 1
  %8 = load i8, ptr %7, align 1
  %9 = zext nneg i8 %8 to i32
  %10 = shl nuw i32 1, %9
  %11 = trunc i32 %10 to i8
  %12 = or i8 %6, %11
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 16, ptr %13, align 1
  %14 = load ptr, ptr %0, align 1
  store i8 %12, ptr %14, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @S_BIT_IN_WORD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i16, ptr %5, align 2
  %7 = load ptr, ptr %2, align 1
  %8 = load i8, ptr %7, align 1
  %9 = zext nneg i8 %8 to i32
  %10 = shl nuw i32 1, %9
  %11 = trunc i32 %10 to i16
  %12 = or i16 %6, %11
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 17, ptr %13, align 1
  %14 = load ptr, ptr %0, align 1
  store i16 %12, ptr %14, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @S_BIT_IN_DWORD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load ptr, ptr %2, align 1
  %7 = load i8, ptr %6, align 1
  %8 = zext nneg i8 %7 to i32
  %9 = shl nuw i32 1, %8
  %10 = load i32, ptr %5, align 4
  %11 = or i32 %9, %10
  %12 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 18, ptr %12, align 1
  %13 = load ptr, ptr %0, align 1
  store i32 %11, ptr %13, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @S_BIT_IN(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %38, label %8

8:                                                ; preds = %4
  %9 = load ptr, ptr %2, align 1
  %10 = load i8, ptr %9, align 1
  %11 = icmp sgt i8 %10, -1
  br i1 %11, label %12, label %38

12:                                               ; preds = %8
  %13 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %14 = load i16, ptr %13, align 1
  switch i16 %14, label %38 [
    i16 260, label %15
    i16 512, label %15
    i16 16, label %15
    i16 261, label %23
    i16 513, label %23
    i16 17, label %23
    i16 262, label %31
    i16 514, label %31
    i16 18, label %31
  ]

15:                                               ; preds = %12, %12, %12
  %16 = load ptr, ptr %1, align 1
  %17 = load i8, ptr %16, align 1
  %18 = zext nneg i8 %10 to i32
  %19 = shl nuw i32 1, %18
  %20 = trunc i32 %19 to i8
  %21 = or i8 %17, %20
  %22 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 16, ptr %22, align 1
  store i8 %21, ptr %5, align 1
  br label %38

23:                                               ; preds = %12, %12, %12
  %24 = load ptr, ptr %1, align 1
  %25 = load i16, ptr %24, align 2
  %26 = zext nneg i8 %10 to i32
  %27 = shl nuw i32 1, %26
  %28 = trunc i32 %27 to i16
  %29 = or i16 %25, %28
  %30 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 17, ptr %30, align 1
  store i16 %29, ptr %5, align 2
  br label %38

31:                                               ; preds = %12, %12, %12
  %32 = load ptr, ptr %1, align 1
  %33 = zext nneg i8 %10 to i32
  %34 = shl nuw i32 1, %33
  %35 = load i32, ptr %32, align 4
  %36 = or i32 %35, %34
  %37 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 18, ptr %37, align 1
  store i32 %36, ptr %5, align 4
  br label %38

38:                                               ; preds = %8, %12, %31, %23, %15, %4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SET_LSB(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i16, ptr %5, align 2
  %7 = and i16 %6, -256
  %8 = load ptr, ptr %0, align 1
  %9 = load i8, ptr %8, align 1
  %10 = zext i8 %9 to i16
  %11 = or disjoint i16 %7, %10
  %12 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 17, ptr %12, align 1
  store i16 %11, ptr %8, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SET_MSB(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i16, ptr %5, align 2
  %7 = and i16 %6, 255
  %8 = load ptr, ptr %0, align 1
  %9 = load i8, ptr %8, align 1
  %10 = zext i8 %9 to i16
  %11 = shl nuw i16 %10, 8
  %12 = or disjoint i16 %11, %7
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 17, ptr %13, align 1
  store i16 %12, ptr %8, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @STRING_TO_BUFFER(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i16, ptr %5, align 1
  %7 = zext i16 %6 to i32
  %8 = icmp eq i16 %6, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %4
  store i16 14, ptr %5, align 2
  br label %32

10:                                               ; preds = %4
  %11 = load ptr, ptr %1, align 1
  %12 = load i16, ptr %11, align 1
  %13 = zext i16 %12 to i32
  %14 = icmp eq i16 %12, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %10
  store i16 14, ptr %5, align 2
  br label %32

16:                                               ; preds = %10
  %17 = load ptr, ptr %2, align 1
  %18 = load i16, ptr %17, align 2
  %19 = sext i16 %18 to i32
  %20 = icmp slt i16 %18, 1
  br i1 %20, label %21, label %22

21:                                               ; preds = %16
  store i16 10, ptr %5, align 2
  br label %32

22:                                               ; preds = %16
  %23 = icmp samesign ugt i32 %19, %7
  br i1 %23, label %24, label %25

24:                                               ; preds = %22
  store i16 11, ptr %5, align 2
  br label %32

25:                                               ; preds = %22
  %26 = icmp samesign ugt i32 %19, %13
  br i1 %26, label %27, label %28

27:                                               ; preds = %25
  store i16 14, ptr %5, align 2
  br label %32

28:                                               ; preds = %25
  %29 = getelementptr inbounds nuw i8, ptr %11, i32 2
  %30 = getelementptr inbounds nuw i8, ptr %5, i32 2
  tail call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %29, ptr nonnull align 1 %30, i32 %19, i1 false)
  %31 = load ptr, ptr %0, align 1
  store i16 0, ptr %31, align 2
  br label %32

32:                                               ; preds = %15, %24, %28, %27, %21, %9
  ret ptr %0
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SWAP(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i16, ptr %5, align 2
  %7 = tail call i16 @llvm.bswap.i16(i16 %6)
  store i16 %7, ptr %5, align 2
  ret ptr %0
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.bswap.i16(i16) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCPIEC\\BitOpe.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
