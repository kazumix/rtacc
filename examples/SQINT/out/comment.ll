; ModuleID = '..\PLCP\comment.c'
source_filename = "..\\PLCP\\comment.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@commentnest = internal unnamed_addr global i32 0, align 4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Comment_ClearNest() local_unnamed_addr #0 {
  store i32 0, ptr @commentnest, align 4
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local range(i32 0, 3) i32 @Comment_SearchBracket(ptr noundef %0, ptr noundef writeonly captures(none) %1) local_unnamed_addr #1 {
  br label %3

3:                                                ; preds = %14, %2
  %4 = phi ptr [ %0, %2 ], [ %15, %14 ]
  %5 = load i8, ptr %4, align 1
  switch i8 %5, label %14 [
    i8 0, label %16
    i8 40, label %6
    i8 42, label %10
  ]

6:                                                ; preds = %3
  %7 = getelementptr inbounds nuw i8, ptr %4, i32 1
  %8 = load i8, ptr %7, align 1
  %9 = icmp eq i8 %8, 42
  br i1 %9, label %16, label %14

10:                                               ; preds = %3
  %11 = getelementptr inbounds nuw i8, ptr %4, i32 1
  %12 = load i8, ptr %11, align 1
  %13 = icmp eq i8 %12, 41
  br i1 %13, label %16, label %14

14:                                               ; preds = %3, %10, %6
  %15 = getelementptr inbounds nuw i8, ptr %4, i32 1
  br label %3, !llvm.loop !7

16:                                               ; preds = %3, %10, %6
  %17 = phi ptr [ %4, %10 ], [ %4, %6 ], [ null, %3 ]
  %18 = phi i32 [ 2, %10 ], [ 1, %6 ], [ 0, %3 ]
  store ptr %17, ptr %1, align 4
  ret i32 %18
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Comment_ProcessBracket(ptr noundef %0) local_unnamed_addr #2 {
  br label %2

2:                                                ; preds = %42, %1
  %3 = phi ptr [ %0, %1 ], [ %33, %42 ]
  %4 = phi ptr [ null, %1 ], [ %43, %42 ]
  %5 = phi ptr [ null, %1 ], [ %44, %42 ]
  br label %6

6:                                                ; preds = %17, %2
  %7 = phi ptr [ %3, %2 ], [ %18, %17 ]
  %8 = load i8, ptr %7, align 1
  switch i8 %8, label %17 [
    i8 0, label %45
    i8 40, label %9
    i8 42, label %13
  ]

9:                                                ; preds = %6
  %10 = getelementptr inbounds nuw i8, ptr %7, i32 1
  %11 = load i8, ptr %10, align 1
  %12 = icmp eq i8 %11, 42
  br i1 %12, label %19, label %17

13:                                               ; preds = %6
  %14 = getelementptr inbounds nuw i8, ptr %7, i32 1
  %15 = load i8, ptr %14, align 1
  %16 = icmp eq i8 %15, 41
  br i1 %16, label %24, label %17

17:                                               ; preds = %13, %9, %6
  %18 = getelementptr inbounds nuw i8, ptr %7, i32 1
  br label %6, !llvm.loop !7

19:                                               ; preds = %9
  %20 = load i32, ptr @commentnest, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr @commentnest, align 4
  %22 = icmp eq i32 %20, 0
  %23 = select i1 %22, ptr %7, ptr %4
  br label %30

24:                                               ; preds = %13
  %25 = getelementptr inbounds nuw i8, ptr %7, i32 1
  %26 = load i32, ptr @commentnest, align 4
  %27 = add nsw i32 %26, -1
  store i32 %27, ptr @commentnest, align 4
  %28 = icmp eq i32 %27, 0
  %29 = select i1 %28, ptr %25, ptr %5
  br label %30

30:                                               ; preds = %19, %24
  %31 = phi ptr [ %23, %19 ], [ %4, %24 ]
  %32 = phi ptr [ %5, %19 ], [ %29, %24 ]
  %33 = getelementptr inbounds nuw i8, ptr %7, i32 2
  %34 = icmp ne ptr %31, null
  %35 = icmp ne ptr %32, null
  %36 = select i1 %34, i1 %35, i1 false
  br i1 %36, label %37, label %42

37:                                               ; preds = %30
  %38 = ptrtoint ptr %32 to i32
  %39 = ptrtoint ptr %31 to i32
  %40 = sub i32 %38, %39
  %41 = add i32 %40, 1
  tail call void @llvm.memset.p0.i32(ptr nonnull align 1 %31, i8 32, i32 %41, i1 false)
  br label %42

42:                                               ; preds = %37, %30
  %43 = phi ptr [ null, %37 ], [ %31, %30 ]
  %44 = phi ptr [ null, %37 ], [ %32, %30 ]
  br label %2

45:                                               ; preds = %6
  %46 = icmp eq ptr %4, null
  br i1 %46, label %48, label %47

47:                                               ; preds = %45
  store i8 0, ptr %4, align 1
  br label %59

48:                                               ; preds = %45
  %49 = icmp eq ptr %5, null
  br i1 %49, label %55, label %50

50:                                               ; preds = %48
  %51 = ptrtoint ptr %5 to i32
  %52 = ptrtoint ptr %0 to i32
  %53 = sub i32 %51, %52
  %54 = add i32 %53, 1
  tail call void @llvm.memset.p0.i32(ptr align 1 %0, i8 32, i32 %54, i1 false)
  br label %59

55:                                               ; preds = %48
  %56 = load i32, ptr @commentnest, align 4
  %57 = icmp sgt i32 %56, 0
  br i1 %57, label %58, label %59

58:                                               ; preds = %55
  store i8 0, ptr %0, align 1
  br label %59

59:                                               ; preds = %50, %58, %55, %47
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\comment.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
