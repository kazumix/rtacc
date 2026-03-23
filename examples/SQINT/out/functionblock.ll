; ModuleID = '..\PLCP\functionblock.c'
source_filename = "..\\PLCP\\functionblock.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_0BI@KIBLMIFL@Functionblock_Add?3entry?$AA@" = comdat any

$"??_C@_0BH@GMAJPKBL@Functionblock_Add?3name?$AA@" = comdat any

$"??_C@_0BL@DLCPKPLN@Functionblock_AddConnector?$AA@" = comdat any

$"??_C@_0BG@JCCPOPHJ@?5?5FB?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@status_funcblock = dso_local local_unnamed_addr global i32 0, align 4
@FbList = dso_local local_unnamed_addr global ptr null, align 4
@FbBottom = dso_local local_unnamed_addr global ptr null, align 4
@"??_C@_0BI@KIBLMIFL@Functionblock_Add?3entry?$AA@" = linkonce_odr dso_local unnamed_addr constant [24 x i8] c"Functionblock_Add:entry\00", comdat, align 1
@"??_C@_0BH@GMAJPKBL@Functionblock_Add?3name?$AA@" = linkonce_odr dso_local unnamed_addr constant [23 x i8] c"Functionblock_Add:name\00", comdat, align 1
@"??_C@_0BL@DLCPKPLN@Functionblock_AddConnector?$AA@" = linkonce_odr dso_local unnamed_addr constant [27 x i8] c"Functionblock_AddConnector\00", comdat, align 1
@FunctionBlocks = external dso_local local_unnamed_addr global [0 x ptr], align 4
@NumFunctionBlocks = external dso_local local_unnamed_addr global i16, align 2
@"??_C@_0BG@JCCPOPHJ@?5?5FB?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [22 x i8] c"  FB(%03d) %-14s  %p\0A\00", comdat, align 1
@str = private unnamed_addr constant [19 x i8] c"Functionblock list\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local void @Functionblock_Dummy(ptr noundef readnone captures(none) %0) local_unnamed_addr #0 {
  ret void
}

; Function Attrs: nounwind
define dso_local ptr @Functionblock_Add(ptr noundef readonly captures(none) %0) local_unnamed_addr #1 {
  %2 = tail call ptr @Heap_Alloc(i32 noundef 20, ptr noundef nonnull @"??_C@_0BI@KIBLMIFL@Functionblock_Add?3entry?$AA@") #11
  %3 = getelementptr inbounds nuw i8, ptr %2, i32 16
  store ptr null, ptr %3, align 1
  %4 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %0) #11
  %5 = add i32 %4, 1
  %6 = tail call ptr @Heap_Alloc(i32 noundef %5, ptr noundef nonnull @"??_C@_0BH@GMAJPKBL@Functionblock_Add?3name?$AA@") #11
  store ptr %6, ptr %2, align 1
  %7 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %6, ptr noundef nonnull dereferenceable(1) %0) #11
  %8 = load ptr, ptr @FbList, align 4
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %1
  store ptr %2, ptr @FbList, align 4
  br label %14

11:                                               ; preds = %1
  %12 = load ptr, ptr @FbBottom, align 4
  %13 = getelementptr inbounds nuw i8, ptr %12, i32 16
  store ptr %2, ptr %13, align 1
  br label %14

14:                                               ; preds = %11, %10
  store ptr %2, ptr @FbBottom, align 4
  store i32 2, ptr @status_funcblock, align 4
  ret ptr %2
}

declare dso_local ptr @Heap_Alloc(i32 noundef, ptr noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strlen(ptr noundef captures(none)) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none)) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local void @Functionblock_AddConnector(ptr noundef captures(none) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #1 {
  %3 = tail call ptr @Heap_Alloc(i32 noundef 14, ptr noundef nonnull @"??_C@_0BL@DLCPKPLN@Functionblock_AddConnector?$AA@") #11
  %4 = getelementptr inbounds nuw i8, ptr %3, i32 10
  store ptr null, ptr %4, align 1
  tail call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(10) %3, ptr noundef nonnull align 1 dereferenceable(10) %1, i32 10, i1 false)
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 12
  %6 = load ptr, ptr %5, align 1
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  store ptr %3, ptr %5, align 1
  br label %16

9:                                                ; preds = %2, %9
  %10 = phi ptr [ %12, %9 ], [ %6, %2 ]
  %11 = getelementptr inbounds nuw i8, ptr %10, i32 10
  %12 = load ptr, ptr %11, align 1
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %9, !llvm.loop !7

14:                                               ; preds = %9
  %15 = getelementptr inbounds nuw i8, ptr %10, i32 10
  store ptr %3, ptr %15, align 1
  br label %16

16:                                               ; preds = %14, %8
  store i32 2, ptr @status_funcblock, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #5

; Function Attrs: nofree norecurse nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef ptr @Functionblock_Search(ptr noundef readonly captures(none) %0) local_unnamed_addr #6 {
  %2 = load ptr, ptr @FbList, align 4
  %3 = icmp eq ptr %2, null
  br i1 %3, label %13, label %4

4:                                                ; preds = %1, %9
  %5 = phi ptr [ %11, %9 ], [ %2, %1 ]
  %6 = load ptr, ptr %5, align 1
  %7 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %6, ptr noundef nonnull dereferenceable(1) %0) #11
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %13, label %9

9:                                                ; preds = %4
  %10 = getelementptr inbounds nuw i8, ptr %5, i32 16
  %11 = load ptr, ptr %10, align 1
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %4, !llvm.loop !9

13:                                               ; preds = %4, %9, %1
  %14 = phi ptr [ null, %1 ], [ null, %9 ], [ %5, %4 ]
  ret ptr %14
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strcmp(ptr noundef captures(none), ptr noundef captures(none)) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local void @Functionblock_Clear() local_unnamed_addr #1 {
  %1 = load ptr, ptr @FbList, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %10, label %3

3:                                                ; preds = %0, %3
  %4 = phi ptr [ %7, %3 ], [ %1, %0 ]
  %5 = load ptr, ptr %4, align 1
  tail call void @Heap_Free(ptr noundef %5) #11
  %6 = getelementptr inbounds nuw i8, ptr %4, i32 16
  %7 = load ptr, ptr %6, align 1
  %8 = load ptr, ptr @FbList, align 4
  tail call void @Heap_Free(ptr noundef %8) #11
  store ptr %7, ptr @FbList, align 4
  %9 = icmp eq ptr %7, null
  br i1 %9, label %10, label %3, !llvm.loop !10

10:                                               ; preds = %3, %0
  store ptr null, ptr @FbBottom, align 4
  store ptr null, ptr @FbList, align 4
  store i32 0, ptr @status_funcblock, align 4
  ret void
}

declare dso_local void @Heap_Free(ptr noundef) local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local ptr @Functionblock_GetEntry(ptr noundef %0) local_unnamed_addr #1 {
  %2 = tail call ptr @Rtedge_GetStructureName(ptr noundef %0) #11
  %3 = load i16, ptr @NumFunctionBlocks, align 2
  %4 = icmp eq i16 %3, 0
  br i1 %4, label %20, label %5

5:                                                ; preds = %1
  %6 = zext i16 %3 to i32
  br label %10

7:                                                ; preds = %10
  %8 = add nuw nsw i32 %11, 1
  %9 = icmp eq i32 %8, %6
  br i1 %9, label %20, label %10, !llvm.loop !11

10:                                               ; preds = %5, %7
  %11 = phi i32 [ 0, %5 ], [ %8, %7 ]
  %12 = getelementptr inbounds nuw ptr, ptr @FunctionBlocks, i32 %11
  %13 = load ptr, ptr %12, align 4
  %14 = load ptr, ptr %13, align 1
  %15 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %14, ptr noundef nonnull dereferenceable(1) %2) #11
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %7

17:                                               ; preds = %10
  %18 = getelementptr inbounds nuw i8, ptr %13, i32 4
  %19 = load ptr, ptr %18, align 1
  br label %20

20:                                               ; preds = %7, %1, %17
  %21 = phi ptr [ %19, %17 ], [ null, %1 ], [ null, %7 ]
  ret ptr %21
}

declare dso_local ptr @Rtedge_GetStructureName(ptr noundef) local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @Functionblock_Load(ptr noundef readnone captures(none) %0) local_unnamed_addr #1 {
  %2 = load i16, ptr @NumFunctionBlocks, align 2
  %3 = icmp eq i16 %2, 0
  br i1 %3, label %57, label %4

4:                                                ; preds = %1, %52
  %5 = phi i32 [ %53, %52 ], [ 0, %1 ]
  %6 = getelementptr inbounds nuw ptr, ptr @FunctionBlocks, i32 %5
  %7 = load ptr, ptr %6, align 4
  %8 = load ptr, ptr %7, align 1
  %9 = tail call ptr @Heap_Alloc(i32 noundef 20, ptr noundef nonnull @"??_C@_0BI@KIBLMIFL@Functionblock_Add?3entry?$AA@") #11
  %10 = getelementptr inbounds nuw i8, ptr %9, i32 16
  store ptr null, ptr %10, align 1
  %11 = tail call i32 @strlen(ptr noundef nonnull readonly dereferenceable(1) %8) #11
  %12 = add i32 %11, 1
  %13 = tail call ptr @Heap_Alloc(i32 noundef %12, ptr noundef nonnull @"??_C@_0BH@GMAJPKBL@Functionblock_Add?3name?$AA@") #11
  store ptr %13, ptr %9, align 1
  %14 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %13, ptr noundef nonnull readonly dereferenceable(1) %8) #11
  %15 = load ptr, ptr @FbList, align 4
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %18

17:                                               ; preds = %4
  store ptr %9, ptr @FbList, align 4
  br label %21

18:                                               ; preds = %4
  %19 = load ptr, ptr @FbBottom, align 4
  %20 = getelementptr inbounds nuw i8, ptr %19, i32 16
  store ptr %9, ptr %20, align 1
  br label %21

21:                                               ; preds = %17, %18
  store ptr %9, ptr @FbBottom, align 4
  store i32 2, ptr @status_funcblock, align 4
  %22 = load ptr, ptr %6, align 4
  %23 = getelementptr inbounds nuw i8, ptr %22, i32 4
  %24 = load ptr, ptr %23, align 1
  %25 = getelementptr inbounds nuw i8, ptr %9, i32 4
  store ptr %24, ptr %25, align 1
  %26 = load ptr, ptr %6, align 4
  %27 = getelementptr inbounds nuw i8, ptr %26, i32 10
  %28 = load ptr, ptr %27, align 1
  %29 = icmp eq ptr %28, null
  br i1 %29, label %52, label %30

30:                                               ; preds = %21
  %31 = getelementptr inbounds nuw i8, ptr %26, i32 8
  %32 = getelementptr inbounds nuw i8, ptr %9, i32 12
  br label %33

33:                                               ; preds = %30, %47
  %34 = phi ptr [ %31, %30 ], [ %48, %47 ]
  %35 = tail call ptr @Heap_Alloc(i32 noundef 14, ptr noundef nonnull @"??_C@_0BL@DLCPKPLN@Functionblock_AddConnector?$AA@") #11
  %36 = getelementptr inbounds nuw i8, ptr %35, i32 10
  store ptr null, ptr %36, align 1
  tail call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(10) %35, ptr noundef nonnull readonly align 1 dereferenceable(10) %34, i32 10, i1 false)
  %37 = load ptr, ptr %32, align 1
  %38 = icmp eq ptr %37, null
  br i1 %38, label %39, label %40

39:                                               ; preds = %33
  store ptr %35, ptr %32, align 1
  br label %47

40:                                               ; preds = %33, %40
  %41 = phi ptr [ %43, %40 ], [ %37, %33 ]
  %42 = getelementptr inbounds nuw i8, ptr %41, i32 10
  %43 = load ptr, ptr %42, align 1
  %44 = icmp eq ptr %43, null
  br i1 %44, label %45, label %40, !llvm.loop !7

45:                                               ; preds = %40
  %46 = getelementptr inbounds nuw i8, ptr %41, i32 10
  store ptr %35, ptr %46, align 1
  br label %47

47:                                               ; preds = %39, %45
  store i32 2, ptr @status_funcblock, align 4
  %48 = getelementptr inbounds nuw i8, ptr %34, i32 10
  %49 = getelementptr inbounds nuw i8, ptr %34, i32 12
  %50 = load ptr, ptr %49, align 1
  %51 = icmp eq ptr %50, null
  br i1 %51, label %52, label %33, !llvm.loop !12

52:                                               ; preds = %47, %21
  %53 = add nuw nsw i32 %5, 1
  %54 = load i16, ptr @NumFunctionBlocks, align 2
  %55 = zext i16 %54 to i32
  %56 = icmp samesign ult i32 %53, %55
  br i1 %56, label %4, label %57, !llvm.loop !13

57:                                               ; preds = %52, %1
  store i32 6, ptr @status_funcblock, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Functionblock_Unload() local_unnamed_addr #7 {
  store i32 0, ptr @status_funcblock, align 4
  ret void
}

; Function Attrs: nounwind
define dso_local void @Functionblock_Register(ptr noundef %0) local_unnamed_addr #1 {
  %2 = tail call ptr @Rtedge_GetStructureName(ptr noundef %0) #11
  %3 = icmp eq ptr %2, null
  %4 = select i1 %3, ptr %0, ptr %2
  %5 = load ptr, ptr @FbList, align 4
  %6 = icmp eq ptr %5, null
  br i1 %6, label %28, label %7

7:                                                ; preds = %1, %12
  %8 = phi ptr [ %14, %12 ], [ %5, %1 ]
  %9 = load ptr, ptr %8, align 1
  %10 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %9, ptr noundef nonnull readonly dereferenceable(1) %4) #11
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %16, label %12

12:                                               ; preds = %7
  %13 = getelementptr inbounds nuw i8, ptr %8, i32 16
  %14 = load ptr, ptr %13, align 1
  %15 = icmp eq ptr %14, null
  br i1 %15, label %28, label %7, !llvm.loop !9

16:                                               ; preds = %7
  %17 = tail call ptr @Variable_Search(ptr noundef nonnull %4) #11
  %18 = icmp eq ptr %17, null
  br i1 %18, label %19, label %24

19:                                               ; preds = %16
  %20 = tail call ptr @Variable_Add(ptr noundef nonnull %4, i16 noundef zeroext 1059) #11
  %21 = getelementptr inbounds nuw i8, ptr %8, i32 4
  %22 = load ptr, ptr %21, align 1
  store ptr %22, ptr %20, align 1
  %23 = getelementptr inbounds nuw i8, ptr %20, i32 10
  store i8 1, ptr %23, align 1
  br label %24

24:                                               ; preds = %19, %16
  %25 = getelementptr inbounds nuw i8, ptr %8, i32 12
  %26 = load ptr, ptr %25, align 1
  %27 = tail call i32 @Structure_CreateCatalog(ptr noundef %0, ptr noundef %26) #11
  br label %28

28:                                               ; preds = %12, %1, %24
  ret void
}

declare dso_local ptr @Variable_Search(ptr noundef) local_unnamed_addr #2

declare dso_local ptr @Variable_Add(ptr noundef, i16 noundef zeroext) local_unnamed_addr #2

declare dso_local i32 @Structure_CreateCatalog(ptr noundef, ptr noundef) local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local i32 @Functionblock_GetSize(ptr noundef readonly captures(none) %0) local_unnamed_addr #1 {
  %2 = load ptr, ptr @FbList, align 4
  %3 = icmp eq ptr %2, null
  br i1 %3, label %26, label %4

4:                                                ; preds = %1, %9
  %5 = phi ptr [ %11, %9 ], [ %2, %1 ]
  %6 = load ptr, ptr %5, align 1
  %7 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %6, ptr noundef nonnull readonly dereferenceable(1) %0) #11
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %13, label %9

9:                                                ; preds = %4
  %10 = getelementptr inbounds nuw i8, ptr %5, i32 16
  %11 = load ptr, ptr %10, align 1
  %12 = icmp eq ptr %11, null
  br i1 %12, label %26, label %4, !llvm.loop !9

13:                                               ; preds = %4
  %14 = getelementptr inbounds nuw i8, ptr %5, i32 12
  %15 = load ptr, ptr %14, align 1
  %16 = icmp eq ptr %15, null
  br i1 %16, label %26, label %17

17:                                               ; preds = %13, %17
  %18 = phi ptr [ %24, %17 ], [ %15, %13 ]
  %19 = phi i32 [ %22, %17 ], [ 0, %13 ]
  %20 = load i16, ptr %18, align 1
  %21 = tail call i32 @Rtedge_TypeSize(i16 noundef zeroext %20) #11
  %22 = add i32 %21, %19
  %23 = getelementptr inbounds nuw i8, ptr %18, i32 10
  %24 = load ptr, ptr %23, align 1
  %25 = icmp eq ptr %24, null
  br i1 %25, label %26, label %17, !llvm.loop !14

26:                                               ; preds = %9, %17, %13, %1
  %27 = phi i32 [ %22, %17 ], [ 0, %1 ], [ 0, %13 ], [ 0, %9 ]
  ret i32 %27
}

declare dso_local i32 @Rtedge_TypeSize(i16 noundef zeroext) local_unnamed_addr #2

; Function Attrs: nofree nounwind
define dso_local void @Functionblock_Display() local_unnamed_addr #8 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %2 = load ptr, ptr @FbList, align 4
  %3 = icmp eq ptr %2, null
  br i1 %3, label %15, label %4

4:                                                ; preds = %0, %4
  %5 = phi ptr [ %13, %4 ], [ %2, %0 ]
  %6 = phi i32 [ %11, %4 ], [ 1, %0 ]
  %7 = load ptr, ptr %5, align 1
  %8 = getelementptr inbounds nuw i8, ptr %5, i32 4
  %9 = load ptr, ptr %8, align 1
  %10 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BG@JCCPOPHJ@?5?5FB?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@", i32 noundef %6, ptr noundef %7, ptr noundef %9)
  %11 = add nuw nsw i32 %6, 1
  %12 = getelementptr inbounds nuw i8, ptr %5, i32 16
  %13 = load ptr, ptr %12, align 1
  %14 = icmp eq ptr %13, null
  br i1 %14, label %15, label %4, !llvm.loop !15

15:                                               ; preds = %4, %0
  ret void
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #9

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #10

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nofree norecurse nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nofree nounwind }
attributes #11 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\functionblock.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !8}
!12 = distinct !{!12, !8}
!13 = distinct !{!13, !8}
!14 = distinct !{!14, !8}
!15 = distinct !{!15, !8}
