; ModuleID = '..\PLCP\heap.c'
source_filename = "..\\PLCP\\heap.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_0CI@CHIKLELK@?5?5Heap?$CI?$CF03d?$CJ?5?$CFp?5?5Order?$CD?$CFd?5?$CFd?5byt@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@status_heap = dso_local local_unnamed_addr global i32 0, align 4
@heaplist = dso_local local_unnamed_addr global ptr null, align 4
@heapbottom = dso_local local_unnamed_addr global ptr null, align 4
@orderNo = dso_local local_unnamed_addr global i32 0, align 4
@"??_C@_0CI@CHIKLELK@?5?5Heap?$CI?$CF03d?$CJ?5?$CFp?5?5Order?$CD?$CFd?5?$CFd?5byt@" = linkonce_odr dso_local unnamed_addr constant [40 x i8] c"  Heap(%03d) %p  Order#%d %d bytes  %s\0A\00", comdat, align 1
@str = private unnamed_addr constant [10 x i8] c"Heap list\00", align 1
@str.1 = private unnamed_addr constant [6 x i8] c"  N/A\00", align 1

; Function Attrs: mustprogress nofree nounwind willreturn memory(readwrite, argmem: write, target_mem0: none, target_mem1: none)
define dso_local void @Heap_Add(ptr noundef %0, i32 noundef %1, ptr noundef %2) local_unnamed_addr #0 {
  %4 = tail call dereferenceable_or_null(20) ptr @malloc(i32 noundef 20) #10
  store ptr %0, ptr %4, align 1
  %5 = getelementptr inbounds nuw i8, ptr %4, i32 4
  store i32 %1, ptr %5, align 1
  %6 = getelementptr inbounds nuw i8, ptr %4, i32 8
  store ptr %2, ptr %6, align 1
  %7 = load i32, ptr @orderNo, align 4
  %8 = add i32 %7, 1
  store i32 %8, ptr @orderNo, align 4
  %9 = getelementptr inbounds nuw i8, ptr %4, i32 12
  store i32 %8, ptr %9, align 1
  %10 = getelementptr inbounds nuw i8, ptr %4, i32 16
  store ptr null, ptr %10, align 1
  %11 = load ptr, ptr @heaplist, align 4
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %14

13:                                               ; preds = %3
  store ptr %4, ptr @heaplist, align 4
  br label %17

14:                                               ; preds = %3
  %15 = load ptr, ptr @heapbottom, align 4
  %16 = getelementptr inbounds nuw i8, ptr %15, i32 16
  store ptr %4, ptr %16, align 1
  br label %17

17:                                               ; preds = %14, %13
  store ptr %4, ptr @heapbottom, align 4
  store i32 2, ptr @status_heap, align 4
  ret void
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare dso_local noalias noundef ptr @malloc(i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind memory(readwrite, target_mem0: none, target_mem1: none)
define dso_local void @Heap_Clear() local_unnamed_addr #2 {
  %1 = load ptr, ptr @heaplist, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %8, label %3

3:                                                ; preds = %0, %3
  %4 = phi ptr [ %6, %3 ], [ %1, %0 ]
  %5 = getelementptr inbounds nuw i8, ptr %4, i32 16
  %6 = load ptr, ptr %5, align 1
  tail call void @free(ptr noundef nonnull %4)
  store ptr %6, ptr @heaplist, align 4
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %3, !llvm.loop !7

8:                                                ; preds = %3, %0
  store ptr null, ptr @heaplist, align 4
  store ptr null, ptr @heapbottom, align 4
  store i32 0, ptr @status_heap, align 4
  ret void
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare dso_local void @free(ptr allocptr noundef captures(none)) local_unnamed_addr #3

; Function Attrs: nounwind memory(readwrite, target_mem0: none, target_mem1: none)
define dso_local void @Heap_Del(ptr noundef readnone captures(address) %0) local_unnamed_addr #2 {
  %2 = load ptr, ptr @heaplist, align 4
  %3 = icmp eq ptr %2, null
  br i1 %3, label %29, label %4

4:                                                ; preds = %1
  %5 = load ptr, ptr %2, align 1
  %6 = icmp eq ptr %5, %0
  br i1 %6, label %10, label %23

7:                                                ; preds = %23
  %8 = load ptr, ptr %26, align 1
  %9 = icmp eq ptr %8, %0
  br i1 %9, label %10, label %23, !llvm.loop !9

10:                                               ; preds = %7, %4
  %11 = phi ptr [ %2, %4 ], [ %24, %7 ]
  %12 = phi ptr [ %2, %4 ], [ %26, %7 ]
  %13 = getelementptr inbounds nuw i8, ptr %12, i32 16
  %14 = load ptr, ptr %13, align 1
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %21

16:                                               ; preds = %10
  %17 = icmp eq ptr %11, %12
  br i1 %17, label %18, label %19

18:                                               ; preds = %16
  store ptr null, ptr @heaplist, align 4
  store ptr null, ptr @heapbottom, align 4
  br label %28

19:                                               ; preds = %16
  %20 = getelementptr inbounds nuw i8, ptr %11, i32 16
  store ptr null, ptr %20, align 1
  store ptr %11, ptr @heapbottom, align 4
  br label %28

21:                                               ; preds = %10
  %22 = getelementptr inbounds nuw i8, ptr %11, i32 16
  store ptr %14, ptr %22, align 1
  br label %28

23:                                               ; preds = %4, %7
  %24 = phi ptr [ %26, %7 ], [ %2, %4 ]
  %25 = getelementptr inbounds nuw i8, ptr %24, i32 16
  %26 = load ptr, ptr %25, align 1
  %27 = icmp eq ptr %26, null
  br i1 %27, label %29, label %7, !llvm.loop !9

28:                                               ; preds = %18, %19, %21
  tail call void @free(ptr noundef nonnull %12)
  br label %29

29:                                               ; preds = %23, %1, %28
  ret void
}

; Function Attrs: nofree nounwind
define dso_local void @Heap_Display() local_unnamed_addr #4 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %2 = load ptr, ptr @heaplist, align 4
  %3 = icmp eq ptr %2, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  br label %21

6:                                                ; preds = %0, %6
  %7 = phi i32 [ %19, %6 ], [ 1, %0 ]
  %8 = phi ptr [ %18, %6 ], [ %2, %0 ]
  %9 = getelementptr inbounds nuw i8, ptr %8, i32 8
  %10 = load ptr, ptr %9, align 1
  %11 = getelementptr inbounds nuw i8, ptr %8, i32 4
  %12 = load i32, ptr %11, align 1
  %13 = getelementptr inbounds nuw i8, ptr %8, i32 12
  %14 = load i32, ptr %13, align 1
  %15 = load ptr, ptr %8, align 1
  %16 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CI@CHIKLELK@?5?5Heap?$CI?$CF03d?$CJ?5?$CFp?5?5Order?$CD?$CFd?5?$CFd?5byt@", i32 noundef %7, ptr noundef %15, i32 noundef %14, i32 noundef %12, ptr noundef %10)
  %17 = getelementptr inbounds nuw i8, ptr %8, i32 16
  %18 = load ptr, ptr %17, align 1
  %19 = add nuw nsw i32 %7, 1
  %20 = icmp eq ptr %18, null
  br i1 %20, label %21, label %6, !llvm.loop !10

21:                                               ; preds = %6, %4
  ret void
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #5

; Function Attrs: nounwind
define dso_local noundef ptr @Heap_Alloc(i32 noundef %0, ptr noundef %1) local_unnamed_addr #6 {
  %3 = tail call ptr @calloc(i32 1, i32 %0)
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %6

5:                                                ; preds = %2
  tail call void @Errorlog_Add(i32 noundef 0, i32 noundef 8192, ptr noundef %1) #11
  br label %21

6:                                                ; preds = %2
  %7 = tail call dereferenceable_or_null(20) ptr @malloc(i32 noundef 20) #10
  store ptr %3, ptr %7, align 1
  %8 = getelementptr inbounds nuw i8, ptr %7, i32 4
  store i32 %0, ptr %8, align 1
  %9 = getelementptr inbounds nuw i8, ptr %7, i32 8
  store ptr %1, ptr %9, align 1
  %10 = load i32, ptr @orderNo, align 4
  %11 = add i32 %10, 1
  store i32 %11, ptr @orderNo, align 4
  %12 = getelementptr inbounds nuw i8, ptr %7, i32 12
  store i32 %11, ptr %12, align 1
  %13 = getelementptr inbounds nuw i8, ptr %7, i32 16
  store ptr null, ptr %13, align 1
  %14 = load ptr, ptr @heaplist, align 4
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %17

16:                                               ; preds = %6
  store ptr %7, ptr @heaplist, align 4
  br label %20

17:                                               ; preds = %6
  %18 = load ptr, ptr @heapbottom, align 4
  %19 = getelementptr inbounds nuw i8, ptr %18, i32 16
  store ptr %7, ptr %19, align 1
  br label %20

20:                                               ; preds = %16, %17
  store ptr %7, ptr @heapbottom, align 4
  store i32 2, ptr @status_heap, align 4
  br label %21

21:                                               ; preds = %20, %5
  ret ptr %3
}

declare dso_local void @Errorlog_Add(i32 noundef, i32 noundef, ptr noundef) local_unnamed_addr #7

; Function Attrs: nounwind memory(readwrite, target_mem0: none, target_mem1: none)
define dso_local void @Heap_Free(ptr noundef captures(address) %0) local_unnamed_addr #2 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %32, label %3

3:                                                ; preds = %1
  %4 = load ptr, ptr @heaplist, align 4
  %5 = icmp eq ptr %4, null
  br i1 %5, label %31, label %6

6:                                                ; preds = %3
  %7 = load ptr, ptr %4, align 1
  %8 = icmp eq ptr %7, %0
  br i1 %8, label %12, label %25

9:                                                ; preds = %25
  %10 = load ptr, ptr %28, align 1
  %11 = icmp eq ptr %10, %0
  br i1 %11, label %12, label %25, !llvm.loop !9

12:                                               ; preds = %9, %6
  %13 = phi ptr [ %4, %6 ], [ %26, %9 ]
  %14 = phi ptr [ %4, %6 ], [ %28, %9 ]
  %15 = getelementptr inbounds nuw i8, ptr %14, i32 16
  %16 = load ptr, ptr %15, align 1
  %17 = icmp eq ptr %16, null
  br i1 %17, label %18, label %23

18:                                               ; preds = %12
  %19 = icmp eq ptr %13, %14
  br i1 %19, label %20, label %21

20:                                               ; preds = %18
  store ptr null, ptr @heaplist, align 4
  store ptr null, ptr @heapbottom, align 4
  br label %30

21:                                               ; preds = %18
  %22 = getelementptr inbounds nuw i8, ptr %13, i32 16
  store ptr null, ptr %22, align 1
  store ptr %13, ptr @heapbottom, align 4
  br label %30

23:                                               ; preds = %12
  %24 = getelementptr inbounds nuw i8, ptr %13, i32 16
  store ptr %16, ptr %24, align 1
  br label %30

25:                                               ; preds = %6, %9
  %26 = phi ptr [ %28, %9 ], [ %4, %6 ]
  %27 = getelementptr inbounds nuw i8, ptr %26, i32 16
  %28 = load ptr, ptr %27, align 1
  %29 = icmp eq ptr %28, null
  br i1 %29, label %31, label %9, !llvm.loop !9

30:                                               ; preds = %23, %21, %20
  tail call void @free(ptr noundef nonnull %14)
  br label %31

31:                                               ; preds = %25, %3, %30
  tail call void @free(ptr noundef %0)
  br label %32

32:                                               ; preds = %1, %31
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #8

; Function Attrs: nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @calloc(i32 noundef, i32 noundef) local_unnamed_addr #9

attributes #0 = { mustprogress nofree nounwind willreturn memory(readwrite, argmem: write, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind memory(readwrite, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree nounwind }
attributes #9 = { nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #10 = { allocsize(0) }
attributes #11 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\heap.c", directory: "C:\\D_DRV\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}
