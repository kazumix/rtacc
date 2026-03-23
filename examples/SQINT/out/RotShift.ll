; ModuleID = '..\PLCPIEC\RotShift.c'
source_filename = "..\\PLCPIEC\\RotShift.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @ROL_BYTE(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %67 [
    i16 260, label %7
    i16 261, label %11
    i16 262, label %15
    i16 263, label %19
    i16 512, label %22
    i16 513, label %26
    i16 514, label %30
  ]

7:                                                ; preds = %4
  %8 = load ptr, ptr %1, align 1
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i64
  br label %34

11:                                               ; preds = %4
  %12 = load ptr, ptr %1, align 1
  %13 = load i16, ptr %12, align 2
  %14 = sext i16 %13 to i64
  br label %34

15:                                               ; preds = %4
  %16 = load ptr, ptr %1, align 1
  %17 = load i32, ptr %16, align 4
  %18 = sext i32 %17 to i64
  br label %34

19:                                               ; preds = %4
  %20 = load ptr, ptr %1, align 1
  %21 = load i64, ptr %20, align 8
  br label %34

22:                                               ; preds = %4
  %23 = load ptr, ptr %1, align 1
  %24 = load i8, ptr %23, align 1
  %25 = zext i8 %24 to i64
  br label %39

26:                                               ; preds = %4
  %27 = load ptr, ptr %1, align 1
  %28 = load i16, ptr %27, align 2
  %29 = zext i16 %28 to i64
  br label %39

30:                                               ; preds = %4
  %31 = load ptr, ptr %1, align 1
  %32 = load i32, ptr %31, align 4
  %33 = zext i32 %32 to i64
  br label %39

34:                                               ; preds = %19, %15, %11, %7
  %35 = phi i64 [ %21, %19 ], [ %10, %7 ], [ %14, %11 ], [ %18, %15 ]
  %36 = icmp slt i64 %35, 0
  br i1 %36, label %37, label %39

37:                                               ; preds = %34
  %38 = load ptr, ptr %0, align 1
  store i8 0, ptr %38, align 1
  br label %67

39:                                               ; preds = %30, %26, %22, %34
  %40 = phi i64 [ %35, %34 ], [ %33, %30 ], [ %29, %26 ], [ %25, %22 ]
  %41 = and i64 %40, 7
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %67, label %43

43:                                               ; preds = %39
  %44 = load ptr, ptr %0, align 1
  %45 = load i8, ptr %44, align 1
  %46 = tail call i8 @llvm.fshl.i8(i8 %45, i8 %45, i8 1)
  %47 = icmp eq i64 %41, 1
  br i1 %47, label %65, label %48, !llvm.loop !7

48:                                               ; preds = %43
  %49 = tail call i8 @llvm.fshl.i8(i8 %45, i8 %45, i8 2)
  %50 = icmp samesign ugt i64 %41, 2
  br i1 %50, label %51, label %65, !llvm.loop !7

51:                                               ; preds = %48
  %52 = tail call i8 @llvm.fshl.i8(i8 %45, i8 %45, i8 3)
  %53 = icmp eq i64 %41, 3
  br i1 %53, label %65, label %54, !llvm.loop !7

54:                                               ; preds = %51
  %55 = tail call i8 @llvm.fshl.i8(i8 %45, i8 %45, i8 4)
  %56 = icmp samesign ugt i64 %41, 4
  br i1 %56, label %57, label %65, !llvm.loop !7

57:                                               ; preds = %54
  %58 = tail call i8 @llvm.fshl.i8(i8 %45, i8 %45, i8 5)
  %59 = icmp eq i64 %41, 5
  br i1 %59, label %65, label %60, !llvm.loop !7

60:                                               ; preds = %57
  %61 = tail call i8 @llvm.fshl.i8(i8 %45, i8 %45, i8 6)
  %62 = icmp eq i64 %41, 7
  %63 = tail call i8 @llvm.fshl.i8(i8 %45, i8 %45, i8 7)
  %64 = select i1 %62, i8 %63, i8 %61
  br label %65, !llvm.loop !7

65:                                               ; preds = %60, %57, %54, %51, %48, %43
  %66 = phi i8 [ %46, %43 ], [ %49, %48 ], [ %52, %51 ], [ %55, %54 ], [ %58, %57 ], [ %64, %60 ]
  store i8 %66, ptr %44, align 1
  br label %67

67:                                               ; preds = %4, %39, %65, %37
  ret ptr %0
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @ROL_WORD(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %69 [
    i16 260, label %7
    i16 261, label %11
    i16 262, label %15
    i16 263, label %19
    i16 512, label %22
    i16 513, label %26
    i16 514, label %30
  ]

7:                                                ; preds = %4
  %8 = load ptr, ptr %1, align 1
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i64
  br label %34

11:                                               ; preds = %4
  %12 = load ptr, ptr %1, align 1
  %13 = load i16, ptr %12, align 2
  %14 = sext i16 %13 to i64
  br label %34

15:                                               ; preds = %4
  %16 = load ptr, ptr %1, align 1
  %17 = load i32, ptr %16, align 4
  %18 = sext i32 %17 to i64
  br label %34

19:                                               ; preds = %4
  %20 = load ptr, ptr %1, align 1
  %21 = load i64, ptr %20, align 8
  br label %34

22:                                               ; preds = %4
  %23 = load ptr, ptr %1, align 1
  %24 = load i8, ptr %23, align 1
  %25 = zext i8 %24 to i64
  br label %39

26:                                               ; preds = %4
  %27 = load ptr, ptr %1, align 1
  %28 = load i16, ptr %27, align 2
  %29 = zext i16 %28 to i64
  br label %39

30:                                               ; preds = %4
  %31 = load ptr, ptr %1, align 1
  %32 = load i32, ptr %31, align 4
  %33 = zext i32 %32 to i64
  br label %39

34:                                               ; preds = %19, %15, %11, %7
  %35 = phi i64 [ %21, %19 ], [ %10, %7 ], [ %14, %11 ], [ %18, %15 ]
  %36 = icmp slt i64 %35, 0
  br i1 %36, label %37, label %39

37:                                               ; preds = %34
  %38 = load ptr, ptr %0, align 1
  store i16 0, ptr %38, align 2
  br label %69

39:                                               ; preds = %30, %26, %22, %34
  %40 = phi i64 [ %35, %34 ], [ %33, %30 ], [ %29, %26 ], [ %25, %22 ]
  %41 = and i64 %40, 15
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %69, label %43

43:                                               ; preds = %39
  %44 = load ptr, ptr %0, align 1
  %45 = load i16, ptr %44, align 2
  %46 = and i64 %40, 7
  %47 = icmp samesign ult i64 %41, 8
  br i1 %47, label %58, label %48

48:                                               ; preds = %43
  %49 = and i64 %40, 8
  br label %50

50:                                               ; preds = %50, %48
  %51 = phi i16 [ %45, %48 ], [ %53, %50 ]
  %52 = phi i64 [ 0, %48 ], [ %54, %50 ]
  %53 = tail call i16 @llvm.bswap.i16(i16 %51)
  %54 = add i64 %52, 8
  %55 = icmp eq i64 %54, %49
  br i1 %55, label %56, label %50, !llvm.loop !9

56:                                               ; preds = %50
  %57 = icmp eq i64 %46, 0
  br i1 %57, label %67, label %58

58:                                               ; preds = %56, %43
  %59 = phi i16 [ %45, %43 ], [ %53, %56 ]
  %60 = icmp ne i64 %46, 0
  tail call void @llvm.assume(i1 %60)
  br label %61

61:                                               ; preds = %61, %58
  %62 = phi i16 [ %59, %58 ], [ %64, %61 ]
  %63 = phi i64 [ 0, %58 ], [ %65, %61 ]
  %64 = tail call i16 @llvm.fshl.i16(i16 %62, i16 %62, i16 1)
  %65 = add i64 %63, 1
  %66 = icmp eq i64 %65, %46
  br i1 %66, label %67, label %61, !llvm.loop !10

67:                                               ; preds = %61, %56
  %68 = phi i16 [ %53, %56 ], [ %64, %61 ]
  store i16 %68, ptr %44, align 2
  br label %69

69:                                               ; preds = %4, %39, %67, %37
  ret ptr %0
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @ROL_DWORD(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %69 [
    i16 260, label %7
    i16 261, label %11
    i16 262, label %15
    i16 263, label %19
    i16 512, label %22
    i16 513, label %26
    i16 514, label %30
  ]

7:                                                ; preds = %4
  %8 = load ptr, ptr %1, align 1
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i64
  br label %34

11:                                               ; preds = %4
  %12 = load ptr, ptr %1, align 1
  %13 = load i16, ptr %12, align 2
  %14 = sext i16 %13 to i64
  br label %34

15:                                               ; preds = %4
  %16 = load ptr, ptr %1, align 1
  %17 = load i32, ptr %16, align 4
  %18 = sext i32 %17 to i64
  br label %34

19:                                               ; preds = %4
  %20 = load ptr, ptr %1, align 1
  %21 = load i64, ptr %20, align 8
  br label %34

22:                                               ; preds = %4
  %23 = load ptr, ptr %1, align 1
  %24 = load i8, ptr %23, align 1
  %25 = zext i8 %24 to i64
  br label %39

26:                                               ; preds = %4
  %27 = load ptr, ptr %1, align 1
  %28 = load i16, ptr %27, align 2
  %29 = zext i16 %28 to i64
  br label %39

30:                                               ; preds = %4
  %31 = load ptr, ptr %1, align 1
  %32 = load i32, ptr %31, align 4
  %33 = zext i32 %32 to i64
  br label %39

34:                                               ; preds = %19, %15, %11, %7
  %35 = phi i64 [ %21, %19 ], [ %10, %7 ], [ %14, %11 ], [ %18, %15 ]
  %36 = icmp slt i64 %35, 0
  br i1 %36, label %37, label %39

37:                                               ; preds = %34
  %38 = load ptr, ptr %0, align 1
  store i32 0, ptr %38, align 4
  br label %69

39:                                               ; preds = %30, %26, %22, %34
  %40 = phi i64 [ %35, %34 ], [ %33, %30 ], [ %29, %26 ], [ %25, %22 ]
  %41 = and i64 %40, 31
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %69, label %43

43:                                               ; preds = %39
  %44 = load ptr, ptr %0, align 1
  %45 = load i32, ptr %44, align 4
  %46 = and i64 %40, 7
  %47 = icmp samesign ult i64 %41, 8
  br i1 %47, label %58, label %48

48:                                               ; preds = %43
  %49 = and i64 %40, 24
  br label %50

50:                                               ; preds = %50, %48
  %51 = phi i32 [ %45, %48 ], [ %53, %50 ]
  %52 = phi i64 [ 0, %48 ], [ %54, %50 ]
  %53 = tail call i32 @llvm.fshl.i32(i32 %51, i32 %51, i32 8)
  %54 = add i64 %52, 8
  %55 = icmp eq i64 %54, %49
  br i1 %55, label %56, label %50, !llvm.loop !12

56:                                               ; preds = %50
  %57 = icmp eq i64 %46, 0
  br i1 %57, label %67, label %58

58:                                               ; preds = %56, %43
  %59 = phi i32 [ %45, %43 ], [ %53, %56 ]
  %60 = icmp ne i64 %46, 0
  tail call void @llvm.assume(i1 %60)
  br label %61

61:                                               ; preds = %61, %58
  %62 = phi i32 [ %59, %58 ], [ %64, %61 ]
  %63 = phi i64 [ 0, %58 ], [ %65, %61 ]
  %64 = tail call i32 @llvm.fshl.i32(i32 %62, i32 %62, i32 1)
  %65 = add i64 %63, 1
  %66 = icmp eq i64 %65, %46
  br i1 %66, label %67, label %61, !llvm.loop !13

67:                                               ; preds = %61, %56
  %68 = phi i32 [ %53, %56 ], [ %64, %61 ]
  store i32 %68, ptr %44, align 4
  br label %69

69:                                               ; preds = %4, %39, %67, %37
  ret ptr %0
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @ROL(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %200 [
    i16 260, label %7
    i16 512, label %7
    i16 16, label %7
    i16 261, label %70
    i16 513, label %70
    i16 17, label %70
    i16 262, label %135
    i16 514, label %135
    i16 18, label %135
  ]

7:                                                ; preds = %4, %4, %4
  %8 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %9 = load i16, ptr %8, align 1
  switch i16 %9, label %200 [
    i16 260, label %10
    i16 261, label %14
    i16 262, label %18
    i16 263, label %22
    i16 512, label %25
    i16 513, label %29
    i16 514, label %33
  ]

10:                                               ; preds = %7
  %11 = load ptr, ptr %1, align 1
  %12 = load i8, ptr %11, align 1
  %13 = sext i8 %12 to i64
  br label %37

14:                                               ; preds = %7
  %15 = load ptr, ptr %1, align 1
  %16 = load i16, ptr %15, align 2
  %17 = sext i16 %16 to i64
  br label %37

18:                                               ; preds = %7
  %19 = load ptr, ptr %1, align 1
  %20 = load i32, ptr %19, align 4
  %21 = sext i32 %20 to i64
  br label %37

22:                                               ; preds = %7
  %23 = load ptr, ptr %1, align 1
  %24 = load i64, ptr %23, align 8
  br label %37

25:                                               ; preds = %7
  %26 = load ptr, ptr %1, align 1
  %27 = load i8, ptr %26, align 1
  %28 = zext i8 %27 to i64
  br label %42

29:                                               ; preds = %7
  %30 = load ptr, ptr %1, align 1
  %31 = load i16, ptr %30, align 2
  %32 = zext i16 %31 to i64
  br label %42

33:                                               ; preds = %7
  %34 = load ptr, ptr %1, align 1
  %35 = load i32, ptr %34, align 4
  %36 = zext i32 %35 to i64
  br label %42

37:                                               ; preds = %22, %18, %14, %10
  %38 = phi i64 [ %24, %22 ], [ %13, %10 ], [ %17, %14 ], [ %21, %18 ]
  %39 = icmp slt i64 %38, 0
  br i1 %39, label %40, label %42

40:                                               ; preds = %37
  %41 = load ptr, ptr %0, align 1
  store i8 0, ptr %41, align 1
  br label %200

42:                                               ; preds = %37, %33, %29, %25
  %43 = phi i64 [ %38, %37 ], [ %36, %33 ], [ %32, %29 ], [ %28, %25 ]
  %44 = and i64 %43, 7
  %45 = icmp eq i64 %44, 0
  br i1 %45, label %200, label %46

46:                                               ; preds = %42
  %47 = load ptr, ptr %0, align 1
  %48 = load i8, ptr %47, align 1
  %49 = tail call i8 @llvm.fshl.i8(i8 %48, i8 %48, i8 1)
  %50 = icmp eq i64 %44, 1
  br i1 %50, label %68, label %51, !llvm.loop !7

51:                                               ; preds = %46
  %52 = tail call i8 @llvm.fshl.i8(i8 %48, i8 %48, i8 2)
  %53 = icmp samesign ugt i64 %44, 2
  br i1 %53, label %54, label %68, !llvm.loop !7

54:                                               ; preds = %51
  %55 = tail call i8 @llvm.fshl.i8(i8 %48, i8 %48, i8 3)
  %56 = icmp eq i64 %44, 3
  br i1 %56, label %68, label %57, !llvm.loop !7

57:                                               ; preds = %54
  %58 = tail call i8 @llvm.fshl.i8(i8 %48, i8 %48, i8 4)
  %59 = icmp samesign ugt i64 %44, 4
  br i1 %59, label %60, label %68, !llvm.loop !7

60:                                               ; preds = %57
  %61 = tail call i8 @llvm.fshl.i8(i8 %48, i8 %48, i8 5)
  %62 = icmp eq i64 %44, 5
  br i1 %62, label %68, label %63, !llvm.loop !7

63:                                               ; preds = %60
  %64 = tail call i8 @llvm.fshl.i8(i8 %48, i8 %48, i8 6)
  %65 = icmp eq i64 %44, 7
  %66 = tail call i8 @llvm.fshl.i8(i8 %48, i8 %48, i8 7)
  %67 = select i1 %65, i8 %66, i8 %64
  br label %68, !llvm.loop !7

68:                                               ; preds = %63, %60, %57, %54, %51, %46
  %69 = phi i8 [ %49, %46 ], [ %52, %51 ], [ %55, %54 ], [ %58, %57 ], [ %61, %60 ], [ %67, %63 ]
  store i8 %69, ptr %47, align 1
  br label %200

70:                                               ; preds = %4, %4, %4
  %71 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %72 = load i16, ptr %71, align 1
  switch i16 %72, label %200 [
    i16 260, label %73
    i16 261, label %77
    i16 262, label %81
    i16 263, label %85
    i16 512, label %88
    i16 513, label %92
    i16 514, label %96
  ]

73:                                               ; preds = %70
  %74 = load ptr, ptr %1, align 1
  %75 = load i8, ptr %74, align 1
  %76 = sext i8 %75 to i64
  br label %100

77:                                               ; preds = %70
  %78 = load ptr, ptr %1, align 1
  %79 = load i16, ptr %78, align 2
  %80 = sext i16 %79 to i64
  br label %100

81:                                               ; preds = %70
  %82 = load ptr, ptr %1, align 1
  %83 = load i32, ptr %82, align 4
  %84 = sext i32 %83 to i64
  br label %100

85:                                               ; preds = %70
  %86 = load ptr, ptr %1, align 1
  %87 = load i64, ptr %86, align 8
  br label %100

88:                                               ; preds = %70
  %89 = load ptr, ptr %1, align 1
  %90 = load i8, ptr %89, align 1
  %91 = zext i8 %90 to i64
  br label %105

92:                                               ; preds = %70
  %93 = load ptr, ptr %1, align 1
  %94 = load i16, ptr %93, align 2
  %95 = zext i16 %94 to i64
  br label %105

96:                                               ; preds = %70
  %97 = load ptr, ptr %1, align 1
  %98 = load i32, ptr %97, align 4
  %99 = zext i32 %98 to i64
  br label %105

100:                                              ; preds = %85, %81, %77, %73
  %101 = phi i64 [ %87, %85 ], [ %76, %73 ], [ %80, %77 ], [ %84, %81 ]
  %102 = icmp slt i64 %101, 0
  br i1 %102, label %103, label %105

103:                                              ; preds = %100
  %104 = load ptr, ptr %0, align 1
  store i16 0, ptr %104, align 2
  br label %200

105:                                              ; preds = %100, %96, %92, %88
  %106 = phi i64 [ %101, %100 ], [ %99, %96 ], [ %95, %92 ], [ %91, %88 ]
  %107 = and i64 %106, 15
  %108 = icmp eq i64 %107, 0
  br i1 %108, label %200, label %109

109:                                              ; preds = %105
  %110 = load ptr, ptr %0, align 1
  %111 = load i16, ptr %110, align 2
  %112 = and i64 %106, 7
  %113 = icmp samesign ult i64 %107, 8
  br i1 %113, label %124, label %114

114:                                              ; preds = %109
  %115 = and i64 %106, 8
  br label %116

116:                                              ; preds = %116, %114
  %117 = phi i16 [ %111, %114 ], [ %119, %116 ]
  %118 = phi i64 [ 0, %114 ], [ %120, %116 ]
  %119 = tail call i16 @llvm.bswap.i16(i16 %117)
  %120 = add i64 %118, 8
  %121 = icmp eq i64 %120, %115
  br i1 %121, label %122, label %116, !llvm.loop !9

122:                                              ; preds = %116
  %123 = icmp eq i64 %112, 0
  br i1 %123, label %133, label %124

124:                                              ; preds = %122, %109
  %125 = phi i16 [ %111, %109 ], [ %119, %122 ]
  %126 = icmp ne i64 %112, 0
  tail call void @llvm.assume(i1 %126)
  br label %127

127:                                              ; preds = %127, %124
  %128 = phi i16 [ %125, %124 ], [ %130, %127 ]
  %129 = phi i64 [ 0, %124 ], [ %131, %127 ]
  %130 = tail call i16 @llvm.fshl.i16(i16 %128, i16 %128, i16 1)
  %131 = add i64 %129, 1
  %132 = icmp eq i64 %131, %112
  br i1 %132, label %133, label %127, !llvm.loop !14

133:                                              ; preds = %127, %122
  %134 = phi i16 [ %119, %122 ], [ %130, %127 ]
  store i16 %134, ptr %110, align 2
  br label %200

135:                                              ; preds = %4, %4, %4
  %136 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %137 = load i16, ptr %136, align 1
  switch i16 %137, label %200 [
    i16 260, label %138
    i16 261, label %142
    i16 262, label %146
    i16 263, label %150
    i16 512, label %153
    i16 513, label %157
    i16 514, label %161
  ]

138:                                              ; preds = %135
  %139 = load ptr, ptr %1, align 1
  %140 = load i8, ptr %139, align 1
  %141 = sext i8 %140 to i64
  br label %165

142:                                              ; preds = %135
  %143 = load ptr, ptr %1, align 1
  %144 = load i16, ptr %143, align 2
  %145 = sext i16 %144 to i64
  br label %165

146:                                              ; preds = %135
  %147 = load ptr, ptr %1, align 1
  %148 = load i32, ptr %147, align 4
  %149 = sext i32 %148 to i64
  br label %165

150:                                              ; preds = %135
  %151 = load ptr, ptr %1, align 1
  %152 = load i64, ptr %151, align 8
  br label %165

153:                                              ; preds = %135
  %154 = load ptr, ptr %1, align 1
  %155 = load i8, ptr %154, align 1
  %156 = zext i8 %155 to i64
  br label %170

157:                                              ; preds = %135
  %158 = load ptr, ptr %1, align 1
  %159 = load i16, ptr %158, align 2
  %160 = zext i16 %159 to i64
  br label %170

161:                                              ; preds = %135
  %162 = load ptr, ptr %1, align 1
  %163 = load i32, ptr %162, align 4
  %164 = zext i32 %163 to i64
  br label %170

165:                                              ; preds = %150, %146, %142, %138
  %166 = phi i64 [ %152, %150 ], [ %141, %138 ], [ %145, %142 ], [ %149, %146 ]
  %167 = icmp slt i64 %166, 0
  br i1 %167, label %168, label %170

168:                                              ; preds = %165
  %169 = load ptr, ptr %0, align 1
  store i32 0, ptr %169, align 4
  br label %200

170:                                              ; preds = %165, %161, %157, %153
  %171 = phi i64 [ %166, %165 ], [ %164, %161 ], [ %160, %157 ], [ %156, %153 ]
  %172 = and i64 %171, 31
  %173 = icmp eq i64 %172, 0
  br i1 %173, label %200, label %174

174:                                              ; preds = %170
  %175 = load ptr, ptr %0, align 1
  %176 = load i32, ptr %175, align 4
  %177 = and i64 %171, 7
  %178 = icmp samesign ult i64 %172, 8
  br i1 %178, label %189, label %179

179:                                              ; preds = %174
  %180 = and i64 %171, 24
  br label %181

181:                                              ; preds = %181, %179
  %182 = phi i32 [ %176, %179 ], [ %184, %181 ]
  %183 = phi i64 [ 0, %179 ], [ %185, %181 ]
  %184 = tail call i32 @llvm.fshl.i32(i32 %182, i32 %182, i32 8)
  %185 = add i64 %183, 8
  %186 = icmp eq i64 %185, %180
  br i1 %186, label %187, label %181, !llvm.loop !12

187:                                              ; preds = %181
  %188 = icmp eq i64 %177, 0
  br i1 %188, label %198, label %189

189:                                              ; preds = %187, %174
  %190 = phi i32 [ %176, %174 ], [ %184, %187 ]
  %191 = icmp ne i64 %177, 0
  tail call void @llvm.assume(i1 %191)
  br label %192

192:                                              ; preds = %192, %189
  %193 = phi i32 [ %190, %189 ], [ %195, %192 ]
  %194 = phi i64 [ 0, %189 ], [ %196, %192 ]
  %195 = tail call i32 @llvm.fshl.i32(i32 %193, i32 %193, i32 1)
  %196 = add i64 %194, 1
  %197 = icmp eq i64 %196, %177
  br i1 %197, label %198, label %192, !llvm.loop !15

198:                                              ; preds = %192, %187
  %199 = phi i32 [ %184, %187 ], [ %195, %192 ]
  store i32 %199, ptr %175, align 4
  br label %200

200:                                              ; preds = %198, %170, %168, %135, %133, %105, %103, %70, %68, %42, %40, %7, %4
  ret ptr %0
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @ROR_BYTE(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %69 [
    i16 260, label %7
    i16 261, label %11
    i16 262, label %15
    i16 263, label %19
    i16 512, label %22
    i16 513, label %26
    i16 514, label %30
  ]

7:                                                ; preds = %4
  %8 = load ptr, ptr %1, align 1
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i64
  br label %34

11:                                               ; preds = %4
  %12 = load ptr, ptr %1, align 1
  %13 = load i16, ptr %12, align 2
  %14 = sext i16 %13 to i64
  br label %34

15:                                               ; preds = %4
  %16 = load ptr, ptr %1, align 1
  %17 = load i32, ptr %16, align 4
  %18 = sext i32 %17 to i64
  br label %34

19:                                               ; preds = %4
  %20 = load ptr, ptr %1, align 1
  %21 = load i64, ptr %20, align 8
  br label %34

22:                                               ; preds = %4
  %23 = load ptr, ptr %1, align 1
  %24 = load i8, ptr %23, align 1
  %25 = zext i8 %24 to i64
  br label %39

26:                                               ; preds = %4
  %27 = load ptr, ptr %1, align 1
  %28 = load i16, ptr %27, align 2
  %29 = zext i16 %28 to i64
  br label %39

30:                                               ; preds = %4
  %31 = load ptr, ptr %1, align 1
  %32 = load i32, ptr %31, align 4
  %33 = zext i32 %32 to i64
  br label %39

34:                                               ; preds = %19, %15, %11, %7
  %35 = phi i64 [ %21, %19 ], [ %10, %7 ], [ %14, %11 ], [ %18, %15 ]
  %36 = icmp slt i64 %35, 0
  br i1 %36, label %37, label %39

37:                                               ; preds = %34
  %38 = load ptr, ptr %0, align 1
  store i8 0, ptr %38, align 1
  br label %39

39:                                               ; preds = %30, %26, %22, %37, %34
  %40 = phi i64 [ %35, %34 ], [ %35, %37 ], [ %33, %30 ], [ %29, %26 ], [ %25, %22 ]
  %41 = srem i64 %40, 8
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %69, label %43

43:                                               ; preds = %39
  %44 = load ptr, ptr %0, align 1
  %45 = load i8, ptr %44, align 1
  %46 = icmp sgt i64 %41, 0
  br i1 %46, label %47, label %67

47:                                               ; preds = %43
  %48 = tail call i8 @llvm.fshl.i8(i8 %45, i8 %45, i8 7)
  %49 = icmp eq i64 %41, 1
  br i1 %49, label %67, label %50, !llvm.loop !16

50:                                               ; preds = %47
  %51 = tail call i8 @llvm.fshl.i8(i8 %45, i8 %45, i8 6)
  %52 = icmp sgt i64 %41, 2
  br i1 %52, label %53, label %67, !llvm.loop !16

53:                                               ; preds = %50
  %54 = tail call i8 @llvm.fshl.i8(i8 %45, i8 %45, i8 5)
  %55 = icmp eq i64 %41, 3
  br i1 %55, label %67, label %56, !llvm.loop !16

56:                                               ; preds = %53
  %57 = tail call i8 @llvm.fshl.i8(i8 %45, i8 %45, i8 4)
  %58 = icmp sgt i64 %41, 4
  br i1 %58, label %59, label %67, !llvm.loop !16

59:                                               ; preds = %56
  %60 = tail call i8 @llvm.fshl.i8(i8 %45, i8 %45, i8 3)
  %61 = icmp eq i64 %41, 5
  br i1 %61, label %67, label %62, !llvm.loop !16

62:                                               ; preds = %59
  %63 = tail call i8 @llvm.fshl.i8(i8 %45, i8 %45, i8 2)
  %64 = icmp sgt i64 %41, 6
  %65 = tail call i8 @llvm.fshl.i8(i8 %45, i8 %45, i8 1)
  %66 = select i1 %64, i8 %65, i8 %63
  br label %67, !llvm.loop !16

67:                                               ; preds = %62, %47, %50, %53, %56, %59, %43
  %68 = phi i8 [ %45, %43 ], [ %48, %47 ], [ %51, %50 ], [ %54, %53 ], [ %57, %56 ], [ %60, %59 ], [ %66, %62 ]
  store i8 %68, ptr %44, align 1
  br label %69

69:                                               ; preds = %4, %67, %39
  ret ptr %0
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @ROR_WORD(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %54 [
    i16 260, label %7
    i16 261, label %11
    i16 262, label %15
    i16 263, label %19
    i16 512, label %22
    i16 513, label %26
    i16 514, label %30
  ]

7:                                                ; preds = %4
  %8 = load ptr, ptr %1, align 1
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i64
  br label %34

11:                                               ; preds = %4
  %12 = load ptr, ptr %1, align 1
  %13 = load i16, ptr %12, align 2
  %14 = sext i16 %13 to i64
  br label %34

15:                                               ; preds = %4
  %16 = load ptr, ptr %1, align 1
  %17 = load i32, ptr %16, align 4
  %18 = sext i32 %17 to i64
  br label %34

19:                                               ; preds = %4
  %20 = load ptr, ptr %1, align 1
  %21 = load i64, ptr %20, align 8
  br label %34

22:                                               ; preds = %4
  %23 = load ptr, ptr %1, align 1
  %24 = load i8, ptr %23, align 1
  %25 = zext i8 %24 to i64
  br label %39

26:                                               ; preds = %4
  %27 = load ptr, ptr %1, align 1
  %28 = load i16, ptr %27, align 2
  %29 = zext i16 %28 to i64
  br label %39

30:                                               ; preds = %4
  %31 = load ptr, ptr %1, align 1
  %32 = load i32, ptr %31, align 4
  %33 = zext i32 %32 to i64
  br label %39

34:                                               ; preds = %19, %15, %11, %7
  %35 = phi i64 [ %21, %19 ], [ %10, %7 ], [ %14, %11 ], [ %18, %15 ]
  %36 = icmp slt i64 %35, 0
  br i1 %36, label %37, label %39

37:                                               ; preds = %34
  %38 = load ptr, ptr %0, align 1
  store i16 0, ptr %38, align 2
  br label %54

39:                                               ; preds = %30, %26, %22, %34
  %40 = phi i64 [ %35, %34 ], [ %33, %30 ], [ %29, %26 ], [ %25, %22 ]
  %41 = and i64 %40, 15
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %54, label %43

43:                                               ; preds = %39
  %44 = load ptr, ptr %0, align 1
  %45 = load i16, ptr %44, align 2
  br label %46

46:                                               ; preds = %43, %46
  %47 = phi i16 [ 0, %43 ], [ %50, %46 ]
  %48 = phi i16 [ %45, %43 ], [ %49, %46 ]
  %49 = tail call i16 @llvm.fshl.i16(i16 %48, i16 %48, i16 15)
  %50 = add i16 %47, 1
  %51 = sext i16 %50 to i64
  %52 = icmp sgt i64 %41, %51
  br i1 %52, label %46, label %53, !llvm.loop !17

53:                                               ; preds = %46
  store i16 %49, ptr %44, align 2
  br label %54

54:                                               ; preds = %4, %39, %53, %37
  ret ptr %0
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @ROR_DWORD(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %69 [
    i16 260, label %7
    i16 261, label %11
    i16 262, label %15
    i16 263, label %19
    i16 512, label %22
    i16 513, label %26
    i16 514, label %30
  ]

7:                                                ; preds = %4
  %8 = load ptr, ptr %1, align 1
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i64
  br label %34

11:                                               ; preds = %4
  %12 = load ptr, ptr %1, align 1
  %13 = load i16, ptr %12, align 2
  %14 = sext i16 %13 to i64
  br label %34

15:                                               ; preds = %4
  %16 = load ptr, ptr %1, align 1
  %17 = load i32, ptr %16, align 4
  %18 = sext i32 %17 to i64
  br label %34

19:                                               ; preds = %4
  %20 = load ptr, ptr %1, align 1
  %21 = load i64, ptr %20, align 8
  br label %34

22:                                               ; preds = %4
  %23 = load ptr, ptr %1, align 1
  %24 = load i8, ptr %23, align 1
  %25 = zext i8 %24 to i64
  br label %39

26:                                               ; preds = %4
  %27 = load ptr, ptr %1, align 1
  %28 = load i16, ptr %27, align 2
  %29 = zext i16 %28 to i64
  br label %39

30:                                               ; preds = %4
  %31 = load ptr, ptr %1, align 1
  %32 = load i32, ptr %31, align 4
  %33 = zext i32 %32 to i64
  br label %39

34:                                               ; preds = %19, %15, %11, %7
  %35 = phi i64 [ %21, %19 ], [ %10, %7 ], [ %14, %11 ], [ %18, %15 ]
  %36 = icmp slt i64 %35, 0
  br i1 %36, label %37, label %39

37:                                               ; preds = %34
  %38 = load ptr, ptr %0, align 1
  store i32 0, ptr %38, align 4
  br label %69

39:                                               ; preds = %30, %26, %22, %34
  %40 = phi i64 [ %35, %34 ], [ %33, %30 ], [ %29, %26 ], [ %25, %22 ]
  %41 = and i64 %40, 31
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %69, label %43

43:                                               ; preds = %39
  %44 = load ptr, ptr %0, align 1
  %45 = load i32, ptr %44, align 4
  %46 = and i64 %40, 7
  %47 = icmp samesign ult i64 %41, 8
  br i1 %47, label %58, label %48

48:                                               ; preds = %43
  %49 = and i64 %40, 24
  br label %50

50:                                               ; preds = %50, %48
  %51 = phi i32 [ %45, %48 ], [ %53, %50 ]
  %52 = phi i64 [ 0, %48 ], [ %54, %50 ]
  %53 = tail call i32 @llvm.fshl.i32(i32 %51, i32 %51, i32 24)
  %54 = add i64 %52, 8
  %55 = icmp eq i64 %54, %49
  br i1 %55, label %56, label %50, !llvm.loop !18

56:                                               ; preds = %50
  %57 = icmp eq i64 %46, 0
  br i1 %57, label %67, label %58

58:                                               ; preds = %56, %43
  %59 = phi i32 [ %45, %43 ], [ %53, %56 ]
  %60 = icmp ne i64 %46, 0
  tail call void @llvm.assume(i1 %60)
  br label %61

61:                                               ; preds = %61, %58
  %62 = phi i32 [ %59, %58 ], [ %64, %61 ]
  %63 = phi i64 [ 0, %58 ], [ %65, %61 ]
  %64 = tail call i32 @llvm.fshl.i32(i32 %62, i32 %62, i32 31)
  %65 = add i64 %63, 1
  %66 = icmp eq i64 %65, %46
  br i1 %66, label %67, label %61, !llvm.loop !19

67:                                               ; preds = %61, %56
  %68 = phi i32 [ %53, %56 ], [ %64, %61 ]
  store i32 %68, ptr %44, align 4
  br label %69

69:                                               ; preds = %4, %39, %67, %37
  ret ptr %0
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @ROR(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %76 [
    i16 260, label %7
    i16 512, label %7
    i16 16, label %7
    i16 261, label %9
    i16 513, label %9
    i16 17, label %9
    i16 262, label %11
    i16 514, label %11
    i16 18, label %11
  ]

7:                                                ; preds = %4, %4, %4
  %8 = tail call ptr @ROR_BYTE(ptr noundef nonnull %0, ptr noundef %1, ptr poison, ptr poison)
  br label %76

9:                                                ; preds = %4, %4, %4
  %10 = tail call ptr @ROR_WORD(ptr noundef nonnull %0, ptr noundef %1, ptr poison, ptr poison)
  br label %76

11:                                               ; preds = %4, %4, %4
  %12 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %13 = load i16, ptr %12, align 1
  switch i16 %13, label %76 [
    i16 260, label %14
    i16 261, label %18
    i16 262, label %22
    i16 263, label %26
    i16 512, label %29
    i16 513, label %33
    i16 514, label %37
  ]

14:                                               ; preds = %11
  %15 = load ptr, ptr %1, align 1
  %16 = load i8, ptr %15, align 1
  %17 = sext i8 %16 to i64
  br label %41

18:                                               ; preds = %11
  %19 = load ptr, ptr %1, align 1
  %20 = load i16, ptr %19, align 2
  %21 = sext i16 %20 to i64
  br label %41

22:                                               ; preds = %11
  %23 = load ptr, ptr %1, align 1
  %24 = load i32, ptr %23, align 4
  %25 = sext i32 %24 to i64
  br label %41

26:                                               ; preds = %11
  %27 = load ptr, ptr %1, align 1
  %28 = load i64, ptr %27, align 8
  br label %41

29:                                               ; preds = %11
  %30 = load ptr, ptr %1, align 1
  %31 = load i8, ptr %30, align 1
  %32 = zext i8 %31 to i64
  br label %46

33:                                               ; preds = %11
  %34 = load ptr, ptr %1, align 1
  %35 = load i16, ptr %34, align 2
  %36 = zext i16 %35 to i64
  br label %46

37:                                               ; preds = %11
  %38 = load ptr, ptr %1, align 1
  %39 = load i32, ptr %38, align 4
  %40 = zext i32 %39 to i64
  br label %46

41:                                               ; preds = %26, %22, %18, %14
  %42 = phi i64 [ %28, %26 ], [ %17, %14 ], [ %21, %18 ], [ %25, %22 ]
  %43 = icmp slt i64 %42, 0
  br i1 %43, label %44, label %46

44:                                               ; preds = %41
  %45 = load ptr, ptr %0, align 1
  store i32 0, ptr %45, align 4
  br label %76

46:                                               ; preds = %41, %37, %33, %29
  %47 = phi i64 [ %42, %41 ], [ %40, %37 ], [ %36, %33 ], [ %32, %29 ]
  %48 = and i64 %47, 31
  %49 = icmp eq i64 %48, 0
  br i1 %49, label %76, label %50

50:                                               ; preds = %46
  %51 = load ptr, ptr %0, align 1
  %52 = load i32, ptr %51, align 4
  %53 = and i64 %47, 7
  %54 = icmp samesign ult i64 %48, 8
  br i1 %54, label %65, label %55

55:                                               ; preds = %50
  %56 = and i64 %47, 24
  br label %57

57:                                               ; preds = %57, %55
  %58 = phi i32 [ %52, %55 ], [ %60, %57 ]
  %59 = phi i64 [ 0, %55 ], [ %61, %57 ]
  %60 = tail call i32 @llvm.fshl.i32(i32 %58, i32 %58, i32 24)
  %61 = add i64 %59, 8
  %62 = icmp eq i64 %61, %56
  br i1 %62, label %63, label %57, !llvm.loop !18

63:                                               ; preds = %57
  %64 = icmp eq i64 %53, 0
  br i1 %64, label %74, label %65

65:                                               ; preds = %63, %50
  %66 = phi i32 [ %52, %50 ], [ %60, %63 ]
  %67 = icmp ne i64 %53, 0
  tail call void @llvm.assume(i1 %67)
  br label %68

68:                                               ; preds = %68, %65
  %69 = phi i32 [ %66, %65 ], [ %71, %68 ]
  %70 = phi i64 [ 0, %65 ], [ %72, %68 ]
  %71 = tail call i32 @llvm.fshl.i32(i32 %69, i32 %69, i32 31)
  %72 = add i64 %70, 1
  %73 = icmp eq i64 %72, %53
  br i1 %73, label %74, label %68, !llvm.loop !20

74:                                               ; preds = %68, %63
  %75 = phi i32 [ %60, %63 ], [ %71, %68 ]
  store i32 %75, ptr %51, align 4
  br label %76

76:                                               ; preds = %74, %46, %44, %11, %4, %9, %7
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SHL_BYTE(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #1 {
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %49 [
    i16 260, label %7
    i16 261, label %11
    i16 262, label %15
    i16 263, label %19
    i16 512, label %22
    i16 513, label %26
    i16 514, label %30
  ]

7:                                                ; preds = %4
  %8 = load ptr, ptr %1, align 1
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i64
  br label %34

11:                                               ; preds = %4
  %12 = load ptr, ptr %1, align 1
  %13 = load i16, ptr %12, align 2
  %14 = sext i16 %13 to i64
  br label %34

15:                                               ; preds = %4
  %16 = load ptr, ptr %1, align 1
  %17 = load i32, ptr %16, align 4
  %18 = sext i32 %17 to i64
  br label %34

19:                                               ; preds = %4
  %20 = load ptr, ptr %1, align 1
  %21 = load i64, ptr %20, align 8
  br label %34

22:                                               ; preds = %4
  %23 = load ptr, ptr %1, align 1
  %24 = load i8, ptr %23, align 1
  %25 = zext i8 %24 to i64
  br label %39

26:                                               ; preds = %4
  %27 = load ptr, ptr %1, align 1
  %28 = load i16, ptr %27, align 2
  %29 = zext i16 %28 to i64
  br label %39

30:                                               ; preds = %4
  %31 = load ptr, ptr %1, align 1
  %32 = load i32, ptr %31, align 4
  %33 = zext i32 %32 to i64
  br label %39

34:                                               ; preds = %19, %15, %11, %7
  %35 = phi i64 [ %21, %19 ], [ %10, %7 ], [ %14, %11 ], [ %18, %15 ]
  %36 = icmp slt i64 %35, 0
  br i1 %36, label %37, label %39

37:                                               ; preds = %34
  %38 = load ptr, ptr %0, align 1
  store i8 0, ptr %38, align 1
  br label %49

39:                                               ; preds = %30, %26, %22, %34
  %40 = phi i64 [ %35, %34 ], [ %33, %30 ], [ %29, %26 ], [ %25, %22 ]
  %41 = icmp eq i64 %40, 0
  br i1 %41, label %49, label %42

42:                                               ; preds = %39
  %43 = load ptr, ptr %0, align 1
  %44 = load i8, ptr %43, align 1
  %45 = zext i8 %44 to i32
  %46 = trunc i64 %40 to i32
  %47 = shl i32 %45, %46
  %48 = trunc i32 %47 to i8
  store i8 %48, ptr %43, align 1
  br label %49

49:                                               ; preds = %4, %42, %39, %37
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SHL_WORD(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #1 {
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %49 [
    i16 260, label %7
    i16 261, label %11
    i16 262, label %15
    i16 263, label %19
    i16 512, label %22
    i16 513, label %26
    i16 514, label %30
  ]

7:                                                ; preds = %4
  %8 = load ptr, ptr %1, align 1
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i64
  br label %34

11:                                               ; preds = %4
  %12 = load ptr, ptr %1, align 1
  %13 = load i16, ptr %12, align 2
  %14 = sext i16 %13 to i64
  br label %34

15:                                               ; preds = %4
  %16 = load ptr, ptr %1, align 1
  %17 = load i32, ptr %16, align 4
  %18 = sext i32 %17 to i64
  br label %34

19:                                               ; preds = %4
  %20 = load ptr, ptr %1, align 1
  %21 = load i64, ptr %20, align 8
  br label %34

22:                                               ; preds = %4
  %23 = load ptr, ptr %1, align 1
  %24 = load i8, ptr %23, align 1
  %25 = zext i8 %24 to i64
  br label %39

26:                                               ; preds = %4
  %27 = load ptr, ptr %1, align 1
  %28 = load i16, ptr %27, align 2
  %29 = zext i16 %28 to i64
  br label %39

30:                                               ; preds = %4
  %31 = load ptr, ptr %1, align 1
  %32 = load i32, ptr %31, align 4
  %33 = zext i32 %32 to i64
  br label %39

34:                                               ; preds = %19, %15, %11, %7
  %35 = phi i64 [ %21, %19 ], [ %10, %7 ], [ %14, %11 ], [ %18, %15 ]
  %36 = icmp slt i64 %35, 0
  br i1 %36, label %37, label %39

37:                                               ; preds = %34
  %38 = load ptr, ptr %0, align 1
  store i16 0, ptr %38, align 2
  br label %49

39:                                               ; preds = %30, %26, %22, %34
  %40 = phi i64 [ %35, %34 ], [ %33, %30 ], [ %29, %26 ], [ %25, %22 ]
  %41 = icmp eq i64 %40, 0
  br i1 %41, label %49, label %42

42:                                               ; preds = %39
  %43 = load ptr, ptr %0, align 1
  %44 = load i16, ptr %43, align 2
  %45 = zext i16 %44 to i32
  %46 = trunc i64 %40 to i32
  %47 = shl i32 %45, %46
  %48 = trunc i32 %47 to i16
  store i16 %48, ptr %43, align 2
  br label %49

49:                                               ; preds = %4, %39, %42, %37
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SHL_DWORD(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #1 {
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %48 [
    i16 260, label %7
    i16 261, label %11
    i16 262, label %15
    i16 263, label %19
    i16 512, label %22
    i16 513, label %26
    i16 514, label %30
  ]

7:                                                ; preds = %4
  %8 = load ptr, ptr %1, align 1
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i64
  br label %34

11:                                               ; preds = %4
  %12 = load ptr, ptr %1, align 1
  %13 = load i16, ptr %12, align 2
  %14 = sext i16 %13 to i64
  br label %34

15:                                               ; preds = %4
  %16 = load ptr, ptr %1, align 1
  %17 = load i32, ptr %16, align 4
  %18 = sext i32 %17 to i64
  br label %34

19:                                               ; preds = %4
  %20 = load ptr, ptr %1, align 1
  %21 = load i64, ptr %20, align 8
  br label %34

22:                                               ; preds = %4
  %23 = load ptr, ptr %1, align 1
  %24 = load i8, ptr %23, align 1
  %25 = zext i8 %24 to i64
  br label %39

26:                                               ; preds = %4
  %27 = load ptr, ptr %1, align 1
  %28 = load i16, ptr %27, align 2
  %29 = zext i16 %28 to i64
  br label %39

30:                                               ; preds = %4
  %31 = load ptr, ptr %1, align 1
  %32 = load i32, ptr %31, align 4
  %33 = zext i32 %32 to i64
  br label %39

34:                                               ; preds = %19, %15, %11, %7
  %35 = phi i64 [ %21, %19 ], [ %10, %7 ], [ %14, %11 ], [ %18, %15 ]
  %36 = icmp slt i64 %35, 0
  br i1 %36, label %37, label %39

37:                                               ; preds = %34
  %38 = load ptr, ptr %0, align 1
  store i32 0, ptr %38, align 4
  br label %48

39:                                               ; preds = %30, %26, %22, %34
  %40 = phi i64 [ %35, %34 ], [ %33, %30 ], [ %29, %26 ], [ %25, %22 ]
  %41 = icmp eq i64 %40, 0
  br i1 %41, label %48, label %42

42:                                               ; preds = %39
  %43 = load ptr, ptr %0, align 1
  %44 = load i32, ptr %43, align 4
  %45 = zext i32 %44 to i64
  %46 = shl i64 %45, %40
  %47 = trunc i64 %46 to i32
  store i32 %47, ptr %43, align 4
  br label %48

48:                                               ; preds = %4, %39, %42, %37
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SHL(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #1 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %141 [
    i16 260, label %7
    i16 512, label %7
    i16 16, label %7
    i16 261, label %52
    i16 513, label %52
    i16 17, label %52
    i16 262, label %97
    i16 514, label %97
    i16 18, label %97
  ]

7:                                                ; preds = %4, %4, %4
  %8 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %9 = load i16, ptr %8, align 1
  switch i16 %9, label %141 [
    i16 260, label %10
    i16 261, label %14
    i16 262, label %18
    i16 263, label %22
    i16 512, label %25
    i16 513, label %29
    i16 514, label %33
  ]

10:                                               ; preds = %7
  %11 = load ptr, ptr %1, align 1
  %12 = load i8, ptr %11, align 1
  %13 = sext i8 %12 to i64
  br label %37

14:                                               ; preds = %7
  %15 = load ptr, ptr %1, align 1
  %16 = load i16, ptr %15, align 2
  %17 = sext i16 %16 to i64
  br label %37

18:                                               ; preds = %7
  %19 = load ptr, ptr %1, align 1
  %20 = load i32, ptr %19, align 4
  %21 = sext i32 %20 to i64
  br label %37

22:                                               ; preds = %7
  %23 = load ptr, ptr %1, align 1
  %24 = load i64, ptr %23, align 8
  br label %37

25:                                               ; preds = %7
  %26 = load ptr, ptr %1, align 1
  %27 = load i8, ptr %26, align 1
  %28 = zext i8 %27 to i64
  br label %42

29:                                               ; preds = %7
  %30 = load ptr, ptr %1, align 1
  %31 = load i16, ptr %30, align 2
  %32 = zext i16 %31 to i64
  br label %42

33:                                               ; preds = %7
  %34 = load ptr, ptr %1, align 1
  %35 = load i32, ptr %34, align 4
  %36 = zext i32 %35 to i64
  br label %42

37:                                               ; preds = %22, %18, %14, %10
  %38 = phi i64 [ %24, %22 ], [ %13, %10 ], [ %17, %14 ], [ %21, %18 ]
  %39 = icmp slt i64 %38, 0
  br i1 %39, label %40, label %42

40:                                               ; preds = %37
  %41 = load ptr, ptr %0, align 1
  store i8 0, ptr %41, align 1
  br label %141

42:                                               ; preds = %37, %33, %29, %25
  %43 = phi i64 [ %38, %37 ], [ %36, %33 ], [ %32, %29 ], [ %28, %25 ]
  %44 = icmp eq i64 %43, 0
  br i1 %44, label %141, label %45

45:                                               ; preds = %42
  %46 = load ptr, ptr %0, align 1
  %47 = load i8, ptr %46, align 1
  %48 = zext i8 %47 to i32
  %49 = trunc i64 %43 to i32
  %50 = shl i32 %48, %49
  %51 = trunc i32 %50 to i8
  store i8 %51, ptr %46, align 1
  br label %141

52:                                               ; preds = %4, %4, %4
  %53 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %54 = load i16, ptr %53, align 1
  switch i16 %54, label %141 [
    i16 260, label %55
    i16 261, label %59
    i16 262, label %63
    i16 263, label %67
    i16 512, label %70
    i16 513, label %74
    i16 514, label %78
  ]

55:                                               ; preds = %52
  %56 = load ptr, ptr %1, align 1
  %57 = load i8, ptr %56, align 1
  %58 = sext i8 %57 to i64
  br label %82

59:                                               ; preds = %52
  %60 = load ptr, ptr %1, align 1
  %61 = load i16, ptr %60, align 2
  %62 = sext i16 %61 to i64
  br label %82

63:                                               ; preds = %52
  %64 = load ptr, ptr %1, align 1
  %65 = load i32, ptr %64, align 4
  %66 = sext i32 %65 to i64
  br label %82

67:                                               ; preds = %52
  %68 = load ptr, ptr %1, align 1
  %69 = load i64, ptr %68, align 8
  br label %82

70:                                               ; preds = %52
  %71 = load ptr, ptr %1, align 1
  %72 = load i8, ptr %71, align 1
  %73 = zext i8 %72 to i64
  br label %87

74:                                               ; preds = %52
  %75 = load ptr, ptr %1, align 1
  %76 = load i16, ptr %75, align 2
  %77 = zext i16 %76 to i64
  br label %87

78:                                               ; preds = %52
  %79 = load ptr, ptr %1, align 1
  %80 = load i32, ptr %79, align 4
  %81 = zext i32 %80 to i64
  br label %87

82:                                               ; preds = %67, %63, %59, %55
  %83 = phi i64 [ %69, %67 ], [ %58, %55 ], [ %62, %59 ], [ %66, %63 ]
  %84 = icmp slt i64 %83, 0
  br i1 %84, label %85, label %87

85:                                               ; preds = %82
  %86 = load ptr, ptr %0, align 1
  store i16 0, ptr %86, align 2
  br label %141

87:                                               ; preds = %82, %78, %74, %70
  %88 = phi i64 [ %83, %82 ], [ %81, %78 ], [ %77, %74 ], [ %73, %70 ]
  %89 = icmp eq i64 %88, 0
  br i1 %89, label %141, label %90

90:                                               ; preds = %87
  %91 = load ptr, ptr %0, align 1
  %92 = load i16, ptr %91, align 2
  %93 = zext i16 %92 to i32
  %94 = trunc i64 %88 to i32
  %95 = shl i32 %93, %94
  %96 = trunc i32 %95 to i16
  store i16 %96, ptr %91, align 2
  br label %141

97:                                               ; preds = %4, %4, %4
  %98 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %99 = load i16, ptr %98, align 1
  switch i16 %99, label %141 [
    i16 260, label %100
    i16 261, label %104
    i16 262, label %108
    i16 263, label %112
    i16 512, label %115
    i16 513, label %119
    i16 514, label %123
  ]

100:                                              ; preds = %97
  %101 = load ptr, ptr %1, align 1
  %102 = load i8, ptr %101, align 1
  %103 = sext i8 %102 to i64
  br label %127

104:                                              ; preds = %97
  %105 = load ptr, ptr %1, align 1
  %106 = load i16, ptr %105, align 2
  %107 = sext i16 %106 to i64
  br label %127

108:                                              ; preds = %97
  %109 = load ptr, ptr %1, align 1
  %110 = load i32, ptr %109, align 4
  %111 = sext i32 %110 to i64
  br label %127

112:                                              ; preds = %97
  %113 = load ptr, ptr %1, align 1
  %114 = load i64, ptr %113, align 8
  br label %127

115:                                              ; preds = %97
  %116 = load ptr, ptr %1, align 1
  %117 = load i8, ptr %116, align 1
  %118 = zext i8 %117 to i64
  br label %132

119:                                              ; preds = %97
  %120 = load ptr, ptr %1, align 1
  %121 = load i16, ptr %120, align 2
  %122 = zext i16 %121 to i64
  br label %132

123:                                              ; preds = %97
  %124 = load ptr, ptr %1, align 1
  %125 = load i32, ptr %124, align 4
  %126 = zext i32 %125 to i64
  br label %132

127:                                              ; preds = %112, %108, %104, %100
  %128 = phi i64 [ %114, %112 ], [ %103, %100 ], [ %107, %104 ], [ %111, %108 ]
  %129 = icmp slt i64 %128, 0
  br i1 %129, label %130, label %132

130:                                              ; preds = %127
  %131 = load ptr, ptr %0, align 1
  store i32 0, ptr %131, align 4
  br label %141

132:                                              ; preds = %127, %123, %119, %115
  %133 = phi i64 [ %128, %127 ], [ %126, %123 ], [ %122, %119 ], [ %118, %115 ]
  %134 = icmp eq i64 %133, 0
  br i1 %134, label %141, label %135

135:                                              ; preds = %132
  %136 = load ptr, ptr %0, align 1
  %137 = load i32, ptr %136, align 4
  %138 = zext i32 %137 to i64
  %139 = shl i64 %138, %133
  %140 = trunc i64 %139 to i32
  store i32 %140, ptr %136, align 4
  br label %141

141:                                              ; preds = %135, %132, %130, %97, %90, %87, %85, %52, %45, %42, %40, %7, %4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SHR_BYTE(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #1 {
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %49 [
    i16 260, label %7
    i16 261, label %11
    i16 262, label %15
    i16 263, label %19
    i16 512, label %22
    i16 513, label %26
    i16 514, label %30
  ]

7:                                                ; preds = %4
  %8 = load ptr, ptr %1, align 1
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i64
  br label %34

11:                                               ; preds = %4
  %12 = load ptr, ptr %1, align 1
  %13 = load i16, ptr %12, align 2
  %14 = sext i16 %13 to i64
  br label %34

15:                                               ; preds = %4
  %16 = load ptr, ptr %1, align 1
  %17 = load i32, ptr %16, align 4
  %18 = sext i32 %17 to i64
  br label %34

19:                                               ; preds = %4
  %20 = load ptr, ptr %1, align 1
  %21 = load i64, ptr %20, align 8
  br label %34

22:                                               ; preds = %4
  %23 = load ptr, ptr %1, align 1
  %24 = load i8, ptr %23, align 1
  %25 = zext i8 %24 to i64
  br label %39

26:                                               ; preds = %4
  %27 = load ptr, ptr %1, align 1
  %28 = load i16, ptr %27, align 2
  %29 = zext i16 %28 to i64
  br label %39

30:                                               ; preds = %4
  %31 = load ptr, ptr %1, align 1
  %32 = load i32, ptr %31, align 4
  %33 = zext i32 %32 to i64
  br label %39

34:                                               ; preds = %19, %15, %11, %7
  %35 = phi i64 [ %21, %19 ], [ %10, %7 ], [ %14, %11 ], [ %18, %15 ]
  %36 = icmp slt i64 %35, 0
  br i1 %36, label %37, label %39

37:                                               ; preds = %34
  %38 = load ptr, ptr %0, align 1
  store i8 0, ptr %38, align 1
  br label %49

39:                                               ; preds = %30, %26, %22, %34
  %40 = phi i64 [ %35, %34 ], [ %33, %30 ], [ %29, %26 ], [ %25, %22 ]
  %41 = icmp eq i64 %40, 0
  br i1 %41, label %49, label %42

42:                                               ; preds = %39
  %43 = load ptr, ptr %0, align 1
  %44 = load i8, ptr %43, align 1
  %45 = zext i8 %44 to i32
  %46 = trunc i64 %40 to i32
  %47 = lshr i32 %45, %46
  %48 = trunc nuw i32 %47 to i8
  store i8 %48, ptr %43, align 1
  br label %49

49:                                               ; preds = %4, %42, %39, %37
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SHR_WORD(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #1 {
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %49 [
    i16 260, label %7
    i16 261, label %11
    i16 262, label %15
    i16 263, label %19
    i16 512, label %22
    i16 513, label %26
    i16 514, label %30
  ]

7:                                                ; preds = %4
  %8 = load ptr, ptr %1, align 1
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i64
  br label %34

11:                                               ; preds = %4
  %12 = load ptr, ptr %1, align 1
  %13 = load i16, ptr %12, align 2
  %14 = sext i16 %13 to i64
  br label %34

15:                                               ; preds = %4
  %16 = load ptr, ptr %1, align 1
  %17 = load i32, ptr %16, align 4
  %18 = sext i32 %17 to i64
  br label %34

19:                                               ; preds = %4
  %20 = load ptr, ptr %1, align 1
  %21 = load i64, ptr %20, align 8
  br label %34

22:                                               ; preds = %4
  %23 = load ptr, ptr %1, align 1
  %24 = load i8, ptr %23, align 1
  %25 = zext i8 %24 to i64
  br label %39

26:                                               ; preds = %4
  %27 = load ptr, ptr %1, align 1
  %28 = load i16, ptr %27, align 2
  %29 = zext i16 %28 to i64
  br label %39

30:                                               ; preds = %4
  %31 = load ptr, ptr %1, align 1
  %32 = load i32, ptr %31, align 4
  %33 = zext i32 %32 to i64
  br label %39

34:                                               ; preds = %19, %15, %11, %7
  %35 = phi i64 [ %21, %19 ], [ %10, %7 ], [ %14, %11 ], [ %18, %15 ]
  %36 = icmp slt i64 %35, 0
  br i1 %36, label %37, label %39

37:                                               ; preds = %34
  %38 = load ptr, ptr %0, align 1
  store i16 0, ptr %38, align 2
  br label %49

39:                                               ; preds = %30, %26, %22, %34
  %40 = phi i64 [ %35, %34 ], [ %33, %30 ], [ %29, %26 ], [ %25, %22 ]
  %41 = icmp eq i64 %40, 0
  br i1 %41, label %49, label %42

42:                                               ; preds = %39
  %43 = load ptr, ptr %0, align 1
  %44 = load i16, ptr %43, align 2
  %45 = zext i16 %44 to i32
  %46 = trunc i64 %40 to i32
  %47 = lshr i32 %45, %46
  %48 = trunc nuw i32 %47 to i16
  store i16 %48, ptr %43, align 2
  br label %49

49:                                               ; preds = %4, %39, %42, %37
  ret ptr %0
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SHR_DWORD(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %72 [
    i16 260, label %7
    i16 261, label %11
    i16 262, label %15
    i16 263, label %19
    i16 512, label %22
    i16 513, label %26
    i16 514, label %30
  ]

7:                                                ; preds = %4
  %8 = load ptr, ptr %1, align 1
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i64
  br label %34

11:                                               ; preds = %4
  %12 = load ptr, ptr %1, align 1
  %13 = load i16, ptr %12, align 2
  %14 = sext i16 %13 to i64
  br label %34

15:                                               ; preds = %4
  %16 = load ptr, ptr %1, align 1
  %17 = load i32, ptr %16, align 4
  %18 = sext i32 %17 to i64
  br label %34

19:                                               ; preds = %4
  %20 = load ptr, ptr %1, align 1
  %21 = load i64, ptr %20, align 8
  br label %34

22:                                               ; preds = %4
  %23 = load ptr, ptr %1, align 1
  %24 = load i8, ptr %23, align 1
  %25 = zext i8 %24 to i64
  br label %39

26:                                               ; preds = %4
  %27 = load ptr, ptr %1, align 1
  %28 = load i16, ptr %27, align 2
  %29 = zext i16 %28 to i64
  br label %39

30:                                               ; preds = %4
  %31 = load ptr, ptr %1, align 1
  %32 = load i32, ptr %31, align 4
  %33 = zext i32 %32 to i64
  br label %39

34:                                               ; preds = %19, %15, %11, %7
  %35 = phi i64 [ %21, %19 ], [ %10, %7 ], [ %14, %11 ], [ %18, %15 ]
  %36 = icmp slt i64 %35, 0
  br i1 %36, label %37, label %39

37:                                               ; preds = %34
  %38 = load ptr, ptr %0, align 1
  store i32 0, ptr %38, align 4
  br label %72

39:                                               ; preds = %30, %26, %22, %34
  %40 = phi i64 [ %35, %34 ], [ %33, %30 ], [ %29, %26 ], [ %25, %22 ]
  %41 = icmp samesign ugt i64 %40, 32
  br i1 %41, label %42, label %44

42:                                               ; preds = %39
  %43 = load ptr, ptr %0, align 1
  store i32 0, ptr %43, align 4
  br label %72

44:                                               ; preds = %39
  %45 = icmp eq i64 %40, 0
  br i1 %45, label %72, label %46

46:                                               ; preds = %44
  %47 = load ptr, ptr %0, align 1
  %48 = load i32, ptr %47, align 4
  %49 = and i64 %40, 7
  %50 = icmp samesign ult i64 %40, 8
  br i1 %50, label %61, label %51

51:                                               ; preds = %46
  %52 = and i64 %40, 56
  br label %53

53:                                               ; preds = %53, %51
  %54 = phi i32 [ %48, %51 ], [ %56, %53 ]
  %55 = phi i64 [ 0, %51 ], [ %57, %53 ]
  %56 = lshr i32 %54, 8
  %57 = add i64 %55, 8
  %58 = icmp eq i64 %57, %52
  br i1 %58, label %59, label %53, !llvm.loop !21

59:                                               ; preds = %53
  %60 = icmp eq i64 %49, 0
  br i1 %60, label %70, label %61

61:                                               ; preds = %59, %46
  %62 = phi i32 [ %48, %46 ], [ %56, %59 ]
  %63 = icmp ne i64 %49, 0
  tail call void @llvm.assume(i1 %63)
  br label %64

64:                                               ; preds = %64, %61
  %65 = phi i32 [ %62, %61 ], [ %67, %64 ]
  %66 = phi i64 [ 0, %61 ], [ %68, %64 ]
  %67 = lshr i32 %65, 1
  %68 = add i64 %66, 1
  %69 = icmp eq i64 %68, %49
  br i1 %69, label %70, label %64, !llvm.loop !22

70:                                               ; preds = %64, %59
  %71 = phi i32 [ %56, %59 ], [ %67, %64 ]
  store i32 %71, ptr %47, align 4
  br label %72

72:                                               ; preds = %4, %42, %70, %44, %37
  ret ptr %0
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SHR(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %99 [
    i16 260, label %7
    i16 512, label %7
    i16 16, label %7
    i16 261, label %52
    i16 513, label %52
    i16 17, label %52
    i16 262, label %97
    i16 514, label %97
    i16 18, label %97
  ]

7:                                                ; preds = %4, %4, %4
  %8 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %9 = load i16, ptr %8, align 1
  switch i16 %9, label %99 [
    i16 260, label %10
    i16 261, label %14
    i16 262, label %18
    i16 263, label %22
    i16 512, label %25
    i16 513, label %29
    i16 514, label %33
  ]

10:                                               ; preds = %7
  %11 = load ptr, ptr %1, align 1
  %12 = load i8, ptr %11, align 1
  %13 = sext i8 %12 to i64
  br label %37

14:                                               ; preds = %7
  %15 = load ptr, ptr %1, align 1
  %16 = load i16, ptr %15, align 2
  %17 = sext i16 %16 to i64
  br label %37

18:                                               ; preds = %7
  %19 = load ptr, ptr %1, align 1
  %20 = load i32, ptr %19, align 4
  %21 = sext i32 %20 to i64
  br label %37

22:                                               ; preds = %7
  %23 = load ptr, ptr %1, align 1
  %24 = load i64, ptr %23, align 8
  br label %37

25:                                               ; preds = %7
  %26 = load ptr, ptr %1, align 1
  %27 = load i8, ptr %26, align 1
  %28 = zext i8 %27 to i64
  br label %42

29:                                               ; preds = %7
  %30 = load ptr, ptr %1, align 1
  %31 = load i16, ptr %30, align 2
  %32 = zext i16 %31 to i64
  br label %42

33:                                               ; preds = %7
  %34 = load ptr, ptr %1, align 1
  %35 = load i32, ptr %34, align 4
  %36 = zext i32 %35 to i64
  br label %42

37:                                               ; preds = %22, %18, %14, %10
  %38 = phi i64 [ %24, %22 ], [ %13, %10 ], [ %17, %14 ], [ %21, %18 ]
  %39 = icmp slt i64 %38, 0
  br i1 %39, label %40, label %42

40:                                               ; preds = %37
  %41 = load ptr, ptr %0, align 1
  store i8 0, ptr %41, align 1
  br label %99

42:                                               ; preds = %37, %33, %29, %25
  %43 = phi i64 [ %38, %37 ], [ %36, %33 ], [ %32, %29 ], [ %28, %25 ]
  %44 = icmp eq i64 %43, 0
  br i1 %44, label %99, label %45

45:                                               ; preds = %42
  %46 = load ptr, ptr %0, align 1
  %47 = load i8, ptr %46, align 1
  %48 = zext i8 %47 to i32
  %49 = trunc i64 %43 to i32
  %50 = lshr i32 %48, %49
  %51 = trunc nuw i32 %50 to i8
  store i8 %51, ptr %46, align 1
  br label %99

52:                                               ; preds = %4, %4, %4
  %53 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %54 = load i16, ptr %53, align 1
  switch i16 %54, label %99 [
    i16 260, label %55
    i16 261, label %59
    i16 262, label %63
    i16 263, label %67
    i16 512, label %70
    i16 513, label %74
    i16 514, label %78
  ]

55:                                               ; preds = %52
  %56 = load ptr, ptr %1, align 1
  %57 = load i8, ptr %56, align 1
  %58 = sext i8 %57 to i64
  br label %82

59:                                               ; preds = %52
  %60 = load ptr, ptr %1, align 1
  %61 = load i16, ptr %60, align 2
  %62 = sext i16 %61 to i64
  br label %82

63:                                               ; preds = %52
  %64 = load ptr, ptr %1, align 1
  %65 = load i32, ptr %64, align 4
  %66 = sext i32 %65 to i64
  br label %82

67:                                               ; preds = %52
  %68 = load ptr, ptr %1, align 1
  %69 = load i64, ptr %68, align 8
  br label %82

70:                                               ; preds = %52
  %71 = load ptr, ptr %1, align 1
  %72 = load i8, ptr %71, align 1
  %73 = zext i8 %72 to i64
  br label %87

74:                                               ; preds = %52
  %75 = load ptr, ptr %1, align 1
  %76 = load i16, ptr %75, align 2
  %77 = zext i16 %76 to i64
  br label %87

78:                                               ; preds = %52
  %79 = load ptr, ptr %1, align 1
  %80 = load i32, ptr %79, align 4
  %81 = zext i32 %80 to i64
  br label %87

82:                                               ; preds = %67, %63, %59, %55
  %83 = phi i64 [ %69, %67 ], [ %58, %55 ], [ %62, %59 ], [ %66, %63 ]
  %84 = icmp slt i64 %83, 0
  br i1 %84, label %85, label %87

85:                                               ; preds = %82
  %86 = load ptr, ptr %0, align 1
  store i16 0, ptr %86, align 2
  br label %99

87:                                               ; preds = %82, %78, %74, %70
  %88 = phi i64 [ %83, %82 ], [ %81, %78 ], [ %77, %74 ], [ %73, %70 ]
  %89 = icmp eq i64 %88, 0
  br i1 %89, label %99, label %90

90:                                               ; preds = %87
  %91 = load ptr, ptr %0, align 1
  %92 = load i16, ptr %91, align 2
  %93 = zext i16 %92 to i32
  %94 = trunc i64 %88 to i32
  %95 = lshr i32 %93, %94
  %96 = trunc nuw i32 %95 to i16
  store i16 %96, ptr %91, align 2
  br label %99

97:                                               ; preds = %4, %4, %4
  %98 = tail call ptr @SHR_DWORD(ptr noundef nonnull %0, ptr noundef %1, ptr poison, ptr poison)
  br label %99

99:                                               ; preds = %90, %87, %85, %52, %45, %42, %40, %7, %4, %97
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SIZEOF(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %15 [
    i16 1536, label %12
    i16 16, label %12
    i16 260, label %12
    i16 512, label %12
    i16 261, label %7
    i16 513, label %7
    i16 17, label %7
    i16 262, label %8
    i16 514, label %8
    i16 18, label %8
    i16 782, label %8
    i16 1347, label %8
    i16 263, label %9
    i16 515, label %9
    i16 19, label %9
    i16 783, label %9
    i16 1346, label %10
    i16 1058, label %11
    i16 1060, label %11
  ]

7:                                                ; preds = %4, %4, %4
  br label %12

8:                                                ; preds = %4, %4, %4, %4, %4
  br label %12

9:                                                ; preds = %4, %4, %4, %4
  br label %12

10:                                               ; preds = %4
  br label %12

11:                                               ; preds = %4, %4
  br label %12

12:                                               ; preds = %4, %4, %4, %4, %7, %8, %9, %10, %11
  %13 = phi i32 [ 1, %4 ], [ 0, %11 ], [ 83, %10 ], [ 8, %9 ], [ 4, %8 ], [ 2, %7 ], [ 1, %4 ], [ 1, %4 ], [ 1, %4 ]
  %14 = load ptr, ptr %0, align 1
  store i32 %13, ptr %14, align 4
  br label %15

15:                                               ; preds = %12, %4
  store i16 514, ptr %5, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local dllexport noundef ptr @LOWER_BOUND(ptr noundef readnone returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #3 {
  ret ptr %0
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.fshl.i8(i8, i8, i8) #4

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.fshl.i16(i16, i16, i16) #4

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshl.i32(i32, i32, i32) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #5

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.bswap.i16(i16) #4

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCPIEC\\RotShift.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !8}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !11}
!16 = distinct !{!16, !8}
!17 = distinct !{!17, !8}
!18 = distinct !{!18, !8}
!19 = distinct !{!19, !11}
!20 = distinct !{!20, !11}
!21 = distinct !{!21, !8}
!22 = distinct !{!22, !11}
