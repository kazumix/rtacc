; ModuleID = '..\PLCPFB\Counter.c'
source_filename = "..\\PLCPFB\\Counter.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local dllexport void @CTU(ptr noundef captures(none) %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 1
  %3 = load i8, ptr %2, align 1
  %4 = icmp eq i8 %3, 1
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = getelementptr inbounds nuw i8, ptr %0, i32 5
  store i16 0, ptr %6, align 1
  br label %28

7:                                                ; preds = %1
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 7
  %9 = load i8, ptr %8, align 1
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %11, label %22

11:                                               ; preds = %7
  %12 = load i8, ptr %0, align 1
  %13 = icmp eq i8 %12, 1
  br i1 %13, label %14, label %22

14:                                               ; preds = %11
  %15 = getelementptr inbounds nuw i8, ptr %0, i32 5
  %16 = load i16, ptr %15, align 1
  %17 = getelementptr inbounds nuw i8, ptr %0, i32 2
  %18 = load i16, ptr %17, align 1
  %19 = icmp slt i16 %16, %18
  br i1 %19, label %20, label %22

20:                                               ; preds = %14
  %21 = add nsw i16 %16, 1
  store i16 %21, ptr %15, align 1
  br label %22

22:                                               ; preds = %20, %14, %11, %7
  %23 = getelementptr inbounds nuw i8, ptr %0, i32 5
  %24 = load i16, ptr %23, align 1
  %25 = getelementptr inbounds nuw i8, ptr %0, i32 2
  %26 = load i16, ptr %25, align 1
  %27 = icmp slt i16 %24, %26
  br i1 %27, label %31, label %28

28:                                               ; preds = %22, %5
  %29 = phi i8 [ 0, %5 ], [ 1, %22 ]
  %30 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i8 %29, ptr %30, align 1
  br label %31

31:                                               ; preds = %28, %22
  %32 = load i8, ptr %0, align 1
  %33 = getelementptr inbounds nuw i8, ptr %0, i32 7
  store i8 %32, ptr %33, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local dllexport void @CTD(ptr noundef captures(none) %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 1
  %3 = load i8, ptr %2, align 1
  %4 = icmp eq i8 %3, 1
  br i1 %4, label %5, label %9

5:                                                ; preds = %1
  %6 = getelementptr inbounds nuw i8, ptr %0, i32 2
  %7 = load i16, ptr %6, align 1
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 5
  store i16 %7, ptr %8, align 1
  br label %26

9:                                                ; preds = %1
  %10 = getelementptr inbounds nuw i8, ptr %0, i32 7
  %11 = load i8, ptr %10, align 1
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %13, label %22

13:                                               ; preds = %9
  %14 = load i8, ptr %0, align 1
  %15 = icmp eq i8 %14, 1
  br i1 %15, label %16, label %22

16:                                               ; preds = %13
  %17 = getelementptr inbounds nuw i8, ptr %0, i32 5
  %18 = load i16, ptr %17, align 1
  %19 = icmp sgt i16 %18, 0
  br i1 %19, label %20, label %22

20:                                               ; preds = %16
  %21 = add nsw i16 %18, -1
  store i16 %21, ptr %17, align 1
  br label %22

22:                                               ; preds = %20, %16, %13, %9
  %23 = getelementptr inbounds nuw i8, ptr %0, i32 5
  %24 = load i16, ptr %23, align 1
  %25 = icmp slt i16 %24, 1
  br i1 %25, label %26, label %29

26:                                               ; preds = %22, %5
  %27 = phi i8 [ 0, %5 ], [ 1, %22 ]
  %28 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i8 %27, ptr %28, align 1
  br label %29

29:                                               ; preds = %26, %22
  %30 = load i8, ptr %0, align 1
  %31 = getelementptr inbounds nuw i8, ptr %0, i32 7
  store i8 %30, ptr %31, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local dllexport void @CTUD(ptr noundef captures(none) %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 2
  %3 = load i8, ptr %2, align 1
  %4 = icmp eq i8 %3, 1
  br i1 %4, label %9, label %5

5:                                                ; preds = %1
  %6 = getelementptr inbounds nuw i8, ptr %0, i32 3
  %7 = load i8, ptr %6, align 1
  %8 = icmp eq i8 %7, 1
  br i1 %8, label %14, label %25

9:                                                ; preds = %1
  %10 = getelementptr inbounds nuw i8, ptr %0, i32 8
  store i16 0, ptr %10, align 1
  %11 = getelementptr inbounds nuw i8, ptr %0, i32 3
  %12 = load i8, ptr %11, align 1
  %13 = icmp eq i8 %12, 1
  br i1 %13, label %14, label %18

14:                                               ; preds = %5, %9
  %15 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %16 = load i16, ptr %15, align 1
  %17 = getelementptr inbounds nuw i8, ptr %0, i32 8
  store i16 %16, ptr %17, align 1
  br label %18

18:                                               ; preds = %14, %9
  %19 = getelementptr inbounds nuw i8, ptr %0, i32 6
  store i8 0, ptr %19, align 1
  %20 = load i8, ptr %0, align 1
  %21 = getelementptr inbounds nuw i8, ptr %0, i32 10
  store i8 %20, ptr %21, align 1
  %22 = getelementptr inbounds nuw i8, ptr %0, i32 1
  %23 = load i8, ptr %22, align 1
  %24 = getelementptr inbounds nuw i8, ptr %0, i32 11
  store i8 %23, ptr %24, align 1
  br label %69

25:                                               ; preds = %5
  %26 = getelementptr inbounds nuw i8, ptr %0, i32 10
  %27 = load i8, ptr %26, align 1
  %28 = icmp eq i8 %27, 0
  br i1 %28, label %29, label %40

29:                                               ; preds = %25
  %30 = load i8, ptr %0, align 1
  %31 = icmp eq i8 %30, 1
  br i1 %31, label %32, label %40

32:                                               ; preds = %29
  %33 = getelementptr inbounds nuw i8, ptr %0, i32 8
  %34 = load i16, ptr %33, align 1
  %35 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %36 = load i16, ptr %35, align 1
  %37 = icmp slt i16 %34, %36
  br i1 %37, label %38, label %40

38:                                               ; preds = %32
  %39 = add nsw i16 %34, 1
  store i16 %39, ptr %33, align 1
  br label %40

40:                                               ; preds = %38, %32, %29, %25
  %41 = getelementptr inbounds nuw i8, ptr %0, i32 8
  %42 = load i16, ptr %41, align 1
  %43 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %44 = load i16, ptr %43, align 1
  %45 = icmp slt i16 %42, %44
  br i1 %45, label %48, label %46

46:                                               ; preds = %40
  %47 = getelementptr inbounds nuw i8, ptr %0, i32 6
  store i8 1, ptr %47, align 1
  br label %48

48:                                               ; preds = %46, %40
  %49 = getelementptr inbounds nuw i8, ptr %0, i32 11
  %50 = load i8, ptr %49, align 1
  %51 = icmp eq i8 %50, 0
  br i1 %51, label %52, label %60

52:                                               ; preds = %48
  %53 = getelementptr inbounds nuw i8, ptr %0, i32 1
  %54 = load i8, ptr %53, align 1
  %55 = icmp eq i8 %54, 1
  %56 = icmp sgt i16 %42, 0
  %57 = and i1 %56, %55
  br i1 %57, label %58, label %60

58:                                               ; preds = %52
  %59 = add nsw i16 %42, -1
  store i16 %59, ptr %41, align 1
  br label %60

60:                                               ; preds = %52, %48, %58
  %61 = phi i16 [ %59, %58 ], [ %42, %48 ], [ %42, %52 ]
  %62 = icmp slt i16 %61, 1
  br i1 %62, label %63, label %65

63:                                               ; preds = %60
  %64 = getelementptr inbounds nuw i8, ptr %0, i32 7
  store i8 1, ptr %64, align 1
  br label %65

65:                                               ; preds = %63, %60
  %66 = load i8, ptr %0, align 1
  store i8 %66, ptr %26, align 1
  %67 = getelementptr inbounds nuw i8, ptr %0, i32 1
  %68 = load i8, ptr %67, align 1
  store i8 %68, ptr %49, align 1
  br label %69

69:                                               ; preds = %65, %18
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local dllexport void @CTU_5000(ptr noundef captures(none) %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 1
  %3 = load i8, ptr %2, align 1
  %4 = icmp eq i8 %3, 1
  br i1 %4, label %5, label %8

5:                                                ; preds = %1
  %6 = getelementptr inbounds nuw i8, ptr %0, i32 3
  store i16 0, ptr %6, align 1
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 2
  store i8 0, ptr %7, align 1
  br label %28

8:                                                ; preds = %1
  %9 = getelementptr inbounds nuw i8, ptr %0, i32 2
  %10 = load i8, ptr %9, align 1
  %11 = icmp eq i8 %10, 0
  br i1 %11, label %12, label %28

12:                                               ; preds = %8
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 5
  %14 = load i8, ptr %13, align 1
  %15 = icmp eq i8 %14, 0
  br i1 %15, label %16, label %23

16:                                               ; preds = %12
  %17 = load i8, ptr %0, align 1
  %18 = icmp eq i8 %17, 1
  br i1 %18, label %19, label %23

19:                                               ; preds = %16
  %20 = getelementptr inbounds nuw i8, ptr %0, i32 3
  %21 = load i16, ptr %20, align 1
  %22 = add i16 %21, 1
  store i16 %22, ptr %20, align 1
  br label %23

23:                                               ; preds = %19, %16, %12
  %24 = getelementptr inbounds nuw i8, ptr %0, i32 3
  %25 = load i16, ptr %24, align 1
  %26 = icmp sgt i16 %25, 4999
  br i1 %26, label %27, label %28

27:                                               ; preds = %23
  store i8 1, ptr %9, align 1
  br label %28

28:                                               ; preds = %8, %27, %23, %5
  %29 = load i8, ptr %0, align 1
  %30 = getelementptr inbounds nuw i8, ptr %0, i32 5
  store i8 %29, ptr %30, align 1
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCPFB\\Counter.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
