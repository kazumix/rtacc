; ModuleID = '..\PLCP\userfunc.c'
source_filename = "..\\PLCP\\userfunc.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.T_ANY = type <{ %union.PANYVAL, i16, ptr, i8, i8, %struct.BITFIELD }>
%union.PANYVAL = type { ptr }
%struct.BITFIELD = type { i8, i8, i8 }

$LibVersion_0x0701 = comdat any

$"??_C@_0BB@NEHNLFHE@Userfunction_Add?$AA@" = comdat any

$"??_C@_0BG@MHHPLJKP@Userfunction_Add?3name?$AA@" = comdat any

$"??_C@_0BJ@MHLMLJEO@Userfunction_AddArgument?$AA@" = comdat any

$"??_C@_0BF@BPMKBFAL@?5?5Userfunc?$CI?$CF03d?$CJ?5?$CFs?6?$AA@" = comdat any

$"??_C@_0BA@BPMJOBOE@?5?5?5?5pin?$CI?$CFd?$CJ?5?$CFs?6?$AA@" = comdat any

$"??_C@_01IHBHIGKO@?0?$AA@" = comdat any

$"??_C@_02LAJDCOFE@ST?$AA@" = comdat any

$"??_C@_02ONCLNIEI@LD?$AA@" = comdat any

$"??_C@_03JBLDIHBA@UFU?$AA@" = comdat any

$"??_C@_0CP@OIDEEJJO@Userfunction_ReplaceInstruction?3@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@status_userfunc = dso_local local_unnamed_addr global i32 0, align 4
@plcUserFuncList = dso_local local_unnamed_addr global ptr null, align 4
@plcUserFuncBottom = dso_local local_unnamed_addr global ptr null, align 4
@"??_C@_0BB@NEHNLFHE@Userfunction_Add?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"Userfunction_Add\00", comdat, align 1
@"??_C@_0BG@MHHPLJKP@Userfunction_Add?3name?$AA@" = linkonce_odr dso_local unnamed_addr constant [22 x i8] c"Userfunction_Add:name\00", comdat, align 1
@"??_C@_0BJ@MHLMLJEO@Userfunction_AddArgument?$AA@" = linkonce_odr dso_local unnamed_addr constant [25 x i8] c"Userfunction_AddArgument\00", comdat, align 1
@"??_C@_0BF@BPMKBFAL@?5?5Userfunc?$CI?$CF03d?$CJ?5?$CFs?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [21 x i8] c"  Userfunc(%03d) %s\0A\00", comdat, align 1
@"??_C@_0BA@BPMJOBOE@?5?5?5?5pin?$CI?$CFd?$CJ?5?$CFs?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"    pin(%d) %s\0A\00", comdat, align 1
@context = dso_local local_unnamed_addr global ptr null, align 4
@"??_C@_01IHBHIGKO@?0?$AA@" = linkonce_odr dso_local unnamed_addr constant [2 x i8] c",\00", comdat, align 1
@VARIANT_EMPTY = external dso_local global %struct.T_ANY, align 1
@"??_C@_02LAJDCOFE@ST?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"ST\00", comdat, align 1
@"??_C@_02ONCLNIEI@LD?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"LD\00", comdat, align 1
@"??_C@_03JBLDIHBA@UFU?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"UFU\00", comdat, align 1
@"??_C@_0CP@OIDEEJJO@Userfunction_ReplaceInstruction?3@" = linkonce_odr dso_local unnamed_addr constant [47 x i8] c"Userfunction_ReplaceInstruction:work temporary\00", comdat, align 1
@str = private unnamed_addr constant [18 x i8] c"Userfunction list\00", align 1
@str.1 = private unnamed_addr constant [6 x i8] c"  N/A\00", align 1

; Function Attrs: nounwind
define dso_local void @Userfunction_Add(ptr noundef readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = tail call ptr @Heap_Alloc(i32 noundef 12, ptr noundef nonnull @"??_C@_0BB@NEHNLFHE@Userfunction_Add?$AA@") #12
  %3 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %0) #12
  %4 = add i32 %3, 1
  %5 = tail call ptr @Heap_Alloc(i32 noundef %4, ptr noundef nonnull @"??_C@_0BG@MHHPLJKP@Userfunction_Add?3name?$AA@") #12
  store ptr %5, ptr %2, align 1
  %6 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %5, ptr noundef nonnull dereferenceable(1) %0) #12
  %7 = getelementptr inbounds nuw i8, ptr %2, i32 8
  store ptr null, ptr %7, align 1
  %8 = load ptr, ptr @plcUserFuncList, align 4
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %1
  store ptr %2, ptr @plcUserFuncList, align 4
  br label %14

11:                                               ; preds = %1
  %12 = load ptr, ptr @plcUserFuncBottom, align 4
  %13 = getelementptr inbounds nuw i8, ptr %12, i32 8
  store ptr %2, ptr %13, align 1
  br label %14

14:                                               ; preds = %11, %10
  store ptr %2, ptr @plcUserFuncBottom, align 4
  store i32 2, ptr @status_userfunc, align 4
  ret void
}

declare dso_local ptr @Heap_Alloc(i32 noundef, ptr noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strlen(ptr noundef captures(none)) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none)) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local zeroext range(i8 0, 2) i8 @Userfunction_AddArgument(ptr noundef readonly captures(none) %0, ptr noundef %1) local_unnamed_addr #0 {
  %3 = load ptr, ptr @plcUserFuncList, align 4
  %4 = icmp eq ptr %3, null
  br i1 %4, label %31, label %5

5:                                                ; preds = %2, %10
  %6 = phi ptr [ %12, %10 ], [ %3, %2 ]
  %7 = load ptr, ptr %6, align 1
  %8 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %7, ptr noundef nonnull readonly dereferenceable(1) %0) #12
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %14, label %10

10:                                               ; preds = %5
  %11 = getelementptr inbounds nuw i8, ptr %6, i32 8
  %12 = load ptr, ptr %11, align 1
  %13 = icmp eq ptr %12, null
  br i1 %13, label %31, label %5, !llvm.loop !7

14:                                               ; preds = %5
  %15 = tail call ptr @Variable_SearchName(ptr noundef %1) #12
  %16 = icmp eq ptr %15, null
  br i1 %16, label %31, label %17

17:                                               ; preds = %14
  %18 = tail call ptr @Heap_Alloc(i32 noundef 8, ptr noundef nonnull @"??_C@_0BJ@MHLMLJEO@Userfunction_AddArgument?$AA@") #12
  store ptr %15, ptr %18, align 1
  %19 = getelementptr inbounds nuw i8, ptr %18, i32 4
  store ptr null, ptr %19, align 1
  %20 = getelementptr inbounds nuw i8, ptr %6, i32 4
  %21 = load ptr, ptr %20, align 1
  %22 = icmp eq ptr %21, null
  br i1 %22, label %23, label %24

23:                                               ; preds = %17
  store ptr %18, ptr %20, align 1
  br label %31

24:                                               ; preds = %17, %24
  %25 = phi ptr [ %27, %24 ], [ %21, %17 ]
  %26 = getelementptr inbounds nuw i8, ptr %25, i32 4
  %27 = load ptr, ptr %26, align 1
  %28 = icmp eq ptr %27, null
  br i1 %28, label %29, label %24, !llvm.loop !9

29:                                               ; preds = %24
  %30 = getelementptr inbounds nuw i8, ptr %25, i32 4
  store ptr %18, ptr %30, align 1
  br label %31

31:                                               ; preds = %10, %2, %14, %29, %23
  %32 = phi i8 [ 1, %23 ], [ 0, %14 ], [ 1, %29 ], [ 0, %2 ], [ 0, %10 ]
  ret i8 %32
}

; Function Attrs: nofree norecurse nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef ptr @Userfunction_Search(ptr noundef readonly captures(none) %0) local_unnamed_addr #4 {
  %2 = load ptr, ptr @plcUserFuncList, align 4
  %3 = icmp eq ptr %2, null
  br i1 %3, label %13, label %4

4:                                                ; preds = %1, %9
  %5 = phi ptr [ %11, %9 ], [ %2, %1 ]
  %6 = load ptr, ptr %5, align 1
  %7 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %6, ptr noundef nonnull dereferenceable(1) %0) #12
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %13, label %9

9:                                                ; preds = %4
  %10 = getelementptr inbounds nuw i8, ptr %5, i32 8
  %11 = load ptr, ptr %10, align 1
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %4, !llvm.loop !7

13:                                               ; preds = %4, %9, %1
  %14 = phi ptr [ null, %1 ], [ null, %9 ], [ %5, %4 ]
  ret ptr %14
}

declare dso_local ptr @Variable_SearchName(ptr noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @Userfunction_Clear() local_unnamed_addr #0 {
  %1 = load ptr, ptr @plcUserFuncList, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %19, label %3

3:                                                ; preds = %0, %13
  %4 = phi ptr [ %16, %13 ], [ %1, %0 ]
  %5 = getelementptr inbounds nuw i8, ptr %4, i32 4
  %6 = load ptr, ptr %5, align 1
  %7 = icmp eq ptr %6, null
  br i1 %7, label %13, label %8

8:                                                ; preds = %3, %8
  %9 = phi ptr [ %11, %8 ], [ %6, %3 ]
  %10 = getelementptr inbounds nuw i8, ptr %9, i32 4
  %11 = load ptr, ptr %10, align 1
  tail call void @Heap_Free(ptr noundef nonnull %9) #12
  store ptr %11, ptr %5, align 1
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %8, !llvm.loop !10

13:                                               ; preds = %8, %3
  %14 = load ptr, ptr %4, align 1
  tail call void @Heap_Free(ptr noundef %14) #12
  store ptr null, ptr %4, align 1
  %15 = getelementptr inbounds nuw i8, ptr %4, i32 8
  %16 = load ptr, ptr %15, align 1
  %17 = load ptr, ptr @plcUserFuncList, align 4
  tail call void @Heap_Free(ptr noundef %17) #12
  store ptr %16, ptr @plcUserFuncList, align 4
  %18 = icmp eq ptr %16, null
  br i1 %18, label %19, label %3, !llvm.loop !11

19:                                               ; preds = %13, %0
  store ptr null, ptr @plcUserFuncBottom, align 4
  store ptr null, ptr @plcUserFuncList, align 4
  store i32 0, ptr @status_userfunc, align 4
  ret void
}

declare dso_local void @Heap_Free(ptr noundef) local_unnamed_addr #1

; Function Attrs: nofree nounwind
define dso_local void @Userfunction_Display() local_unnamed_addr #5 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %2 = load ptr, ptr @plcUserFuncList, align 4
  %3 = icmp eq ptr %2, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  br label %28

6:                                                ; preds = %0, %23
  %7 = phi i32 [ %26, %23 ], [ 1, %0 ]
  %8 = phi ptr [ %25, %23 ], [ %2, %0 ]
  %9 = load ptr, ptr %8, align 1
  %10 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BF@BPMKBFAL@?5?5Userfunc?$CI?$CF03d?$CJ?5?$CFs?6?$AA@", i32 noundef %7, ptr noundef %9)
  %11 = getelementptr inbounds nuw i8, ptr %8, i32 4
  %12 = load ptr, ptr %11, align 1
  %13 = icmp eq ptr %12, null
  br i1 %13, label %23, label %14

14:                                               ; preds = %6, %14
  %15 = phi ptr [ %21, %14 ], [ %12, %6 ]
  %16 = phi i32 [ %19, %14 ], [ 1, %6 ]
  %17 = load ptr, ptr %15, align 1
  %18 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BA@BPMJOBOE@?5?5?5?5pin?$CI?$CFd?$CJ?5?$CFs?6?$AA@", i32 noundef %16, ptr noundef %17)
  %19 = add nuw nsw i32 %16, 1
  %20 = getelementptr inbounds nuw i8, ptr %15, i32 4
  %21 = load ptr, ptr %20, align 1
  %22 = icmp eq ptr %21, null
  br i1 %22, label %23, label %14, !llvm.loop !12

23:                                               ; preds = %14, %6
  %24 = getelementptr inbounds nuw i8, ptr %8, i32 8
  %25 = load ptr, ptr %24, align 1
  %26 = add nuw nsw i32 %7, 1
  %27 = icmp eq ptr %25, null
  br i1 %27, label %28, label %6, !llvm.loop !13

28:                                               ; preds = %23, %4
  ret void
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #6

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strcmp(ptr noundef captures(none), ptr noundef captures(none)) local_unnamed_addr #2

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local i32 @Userfunction_NumArgument(ptr noundef readonly captures(none) %0) local_unnamed_addr #7 {
  br label %2

2:                                                ; preds = %2, %1
  %3 = phi i32 [ 0, %1 ], [ %8, %2 ]
  %4 = phi ptr [ %0, %1 ], [ %6, %2 ]
  %5 = getelementptr inbounds nuw i8, ptr %4, i32 4
  %6 = load ptr, ptr %5, align 1
  %7 = icmp eq ptr %6, null
  %8 = add nuw nsw i32 %3, 1
  br i1 %7, label %9, label %2, !llvm.loop !14

9:                                                ; preds = %2
  ret i32 %3
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define dso_local ptr @_Userfunction_PargeArgumentFirst(ptr noundef %0) local_unnamed_addr #8 {
  %2 = tail call ptr @strtok(ptr noundef %0, ptr noundef nonnull @"??_C@_01IHBHIGKO@?0?$AA@")
  ret ptr %2
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn
declare dso_local ptr @strtok(ptr noundef, ptr noundef readonly captures(none)) local_unnamed_addr #9

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define dso_local ptr @_Userfunction_PargeArgumentNext() local_unnamed_addr #8 {
  %1 = tail call ptr @strtok(ptr noundef null, ptr noundef nonnull @"??_C@_01IHBHIGKO@?0?$AA@")
  ret ptr %1
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @_Userfunction_TrimArgument(ptr noundef captures(address) %0) local_unnamed_addr #10 {
  br label %2

2:                                                ; preds = %15, %1
  %3 = phi ptr [ %0, %1 ], [ %19, %15 ]
  %4 = phi ptr [ %0, %1 ], [ %17, %15 ]
  %5 = load i8, ptr %3, align 1
  %6 = and i8 %5, -2
  %7 = icmp eq i8 %6, 40
  br i1 %7, label %15, label %8

8:                                                ; preds = %2
  %9 = icmp eq ptr %4, %3
  br i1 %9, label %12, label %10

10:                                               ; preds = %8
  store i8 %5, ptr %4, align 1
  %11 = load i8, ptr %3, align 1
  br label %12

12:                                               ; preds = %10, %8
  %13 = phi i8 [ %11, %10 ], [ %5, %8 ]
  %14 = getelementptr inbounds nuw i8, ptr %4, i32 1
  br label %15

15:                                               ; preds = %2, %12
  %16 = phi i8 [ %13, %12 ], [ %5, %2 ]
  %17 = phi ptr [ %14, %12 ], [ %4, %2 ]
  %18 = icmp eq i8 %16, 0
  %19 = getelementptr inbounds nuw i8, ptr %3, i32 1
  br i1 %18, label %20, label %2, !llvm.loop !15

20:                                               ; preds = %15
  ret void
}

; Function Attrs: nounwind
define dso_local noundef ptr @Userfunction_ReplaceInstruction(ptr noundef readonly captures(address_is_null, ret: address, provenance) %0, ptr noundef %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  br label %5

5:                                                ; preds = %5, %4
  %6 = phi ptr [ %11, %5 ], [ @plcUserFuncList, %4 ]
  %7 = load ptr, ptr %6, align 1, !nonnull !16, !noundef !16
  %8 = load ptr, ptr %7, align 1
  %9 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %8, ptr noundef nonnull readonly dereferenceable(1) %1) #12
  %10 = icmp eq i32 %9, 0
  %11 = getelementptr inbounds nuw i8, ptr %7, i32 8
  br i1 %10, label %12, label %5

12:                                               ; preds = %5
  %13 = getelementptr inbounds nuw i8, ptr %7, i32 4
  %14 = load ptr, ptr %13, align 1
  br label %15

15:                                               ; preds = %15, %12
  %16 = phi i32 [ 0, %12 ], [ %21, %15 ]
  %17 = phi ptr [ %7, %12 ], [ %19, %15 ]
  %18 = getelementptr inbounds nuw i8, ptr %17, i32 4
  %19 = load ptr, ptr %18, align 1
  %20 = icmp eq ptr %19, null
  %21 = add nuw nsw i32 %16, 1
  br i1 %20, label %22, label %15, !llvm.loop !14

22:                                               ; preds = %15
  %23 = icmp eq i32 %16, 0
  br i1 %23, label %24, label %25

24:                                               ; preds = %22
  tail call void @Errorlog_Add(i32 noundef 0, i32 noundef 8196, ptr noundef nonnull %1) #12
  br label %112

25:                                               ; preds = %22
  %26 = tail call ptr @Instruction_GetTemplate(ptr noundef nonnull @"??_C@_02LAJDCOFE@ST?$AA@") #12
  %27 = tail call ptr @Instruction_GetTemplate(ptr noundef nonnull @"??_C@_02ONCLNIEI@LD?$AA@") #12
  %28 = tail call ptr @Instruction_GetTemplate(ptr noundef nonnull @"??_C@_03JBLDIHBA@UFU?$AA@") #12
  %29 = load ptr, ptr %14, align 1
  %30 = tail call ptr @Variable_Search(ptr noundef %29) #12
  %31 = tail call ptr @Logic_Add(ptr noundef %26, ptr noundef %30, ptr noundef null, ptr noundef null) #12
  %32 = getelementptr inbounds nuw i8, ptr %14, i32 4
  %33 = load ptr, ptr %32, align 1
  %34 = icmp eq ptr %0, null
  br i1 %34, label %60, label %35

35:                                               ; preds = %25
  %36 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %0) #12
  %37 = add i32 %36, 1
  %38 = tail call ptr @Heap_Alloc(i32 noundef %37, ptr noundef nonnull @"??_C@_0CP@OIDEEJJO@Userfunction_ReplaceInstruction?3@") #12
  %39 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %38, ptr noundef nonnull dereferenceable(1) %0) #12
  br label %40

40:                                               ; preds = %53, %35
  %41 = phi ptr [ %38, %35 ], [ %57, %53 ]
  %42 = phi ptr [ %38, %35 ], [ %55, %53 ]
  %43 = load i8, ptr %41, align 1
  %44 = and i8 %43, -2
  %45 = icmp eq i8 %44, 40
  br i1 %45, label %53, label %46

46:                                               ; preds = %40
  %47 = icmp eq ptr %42, %41
  br i1 %47, label %50, label %48

48:                                               ; preds = %46
  store i8 %43, ptr %42, align 1
  %49 = load i8, ptr %41, align 1
  br label %50

50:                                               ; preds = %48, %46
  %51 = phi i8 [ %49, %48 ], [ %43, %46 ]
  %52 = getelementptr inbounds nuw i8, ptr %42, i32 1
  br label %53

53:                                               ; preds = %50, %40
  %54 = phi i8 [ %51, %50 ], [ %43, %40 ]
  %55 = phi ptr [ %52, %50 ], [ %42, %40 ]
  %56 = icmp eq i8 %54, 0
  %57 = getelementptr inbounds nuw i8, ptr %41, i32 1
  br i1 %56, label %58, label %40, !llvm.loop !15

58:                                               ; preds = %53
  %59 = tail call ptr @strtok(ptr noundef nonnull %38, ptr noundef nonnull @"??_C@_01IHBHIGKO@?0?$AA@")
  br label %60

60:                                               ; preds = %58, %25
  %61 = phi ptr [ %59, %58 ], [ null, %25 ]
  %62 = phi ptr [ %38, %58 ], [ null, %25 ]
  %63 = icmp eq ptr %33, null
  br i1 %63, label %90, label %64

64:                                               ; preds = %60, %82
  %65 = phi ptr [ %88, %82 ], [ %33, %60 ]
  %66 = phi ptr [ %83, %82 ], [ %61, %60 ]
  %67 = load ptr, ptr %65, align 1
  %68 = tail call ptr @Variable_Search(ptr noundef %67) #12
  %69 = icmp eq ptr %66, null
  br i1 %69, label %78, label %70

70:                                               ; preds = %64
  %71 = tail call ptr @Variable_Search(ptr noundef nonnull %66) #12
  %72 = icmp eq ptr %71, null
  br i1 %72, label %73, label %75

73:                                               ; preds = %70
  %74 = tail call ptr @Literal_Compile(ptr noundef nonnull %66) #12
  br label %75

75:                                               ; preds = %73, %70
  %76 = phi ptr [ %74, %73 ], [ %71, %70 ]
  %77 = tail call ptr @strtok(ptr noundef null, ptr noundef nonnull @"??_C@_01IHBHIGKO@?0?$AA@")
  br label %82

78:                                               ; preds = %64
  %79 = getelementptr inbounds nuw i8, ptr %68, i32 4
  %80 = load i16, ptr %79, align 1
  %81 = tail call ptr @Variable_Zero(i16 noundef zeroext %80) #12
  br label %82

82:                                               ; preds = %78, %75
  %83 = phi ptr [ %77, %75 ], [ null, %78 ]
  %84 = phi ptr [ %76, %75 ], [ %81, %78 ]
  %85 = tail call ptr @Logic_Add(ptr noundef %27, ptr noundef %84, ptr noundef null, ptr noundef null) #12
  %86 = tail call ptr @Logic_Add(ptr noundef %26, ptr noundef %68, ptr noundef null, ptr noundef null) #12
  %87 = getelementptr inbounds nuw i8, ptr %65, i32 4
  %88 = load ptr, ptr %87, align 1
  %89 = icmp eq ptr %88, null
  br i1 %89, label %90, label %64, !llvm.loop !17

90:                                               ; preds = %82, %60
  %91 = icmp eq ptr %62, null
  br i1 %91, label %93, label %92

92:                                               ; preds = %90
  tail call void @Heap_Free(ptr noundef nonnull %62) #12
  br label %93

93:                                               ; preds = %92, %90
  %94 = tail call ptr @Label_Search(ptr noundef nonnull %1) #12
  %95 = getelementptr inbounds nuw i8, ptr %94, i32 8
  %96 = load ptr, ptr %95, align 1
  %97 = tail call ptr @Logic_Add(ptr noundef %28, ptr noundef %96, ptr noundef null, ptr noundef null) #12
  %98 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %1) #12
  %99 = shl i32 %98, 1
  %100 = add i32 %99, 2
  %101 = tail call ptr @Heap_Alloc(i32 noundef %100, ptr noundef nonnull @"??_C@_0CP@OIDEEJJO@Userfunction_ReplaceInstruction?3@") #12
  %102 = icmp eq ptr %101, null
  br i1 %102, label %112, label %103

103:                                              ; preds = %93
  %104 = tail call ptr @strcat(ptr noundef nonnull dereferenceable(1) %101, ptr noundef nonnull dereferenceable(1) %1) #12
  %105 = tail call i32 @strlen(ptr nonnull dereferenceable(1) %101)
  %106 = getelementptr inbounds i8, ptr %101, i32 %105
  store i16 46, ptr %106, align 1
  %107 = tail call ptr @strcat(ptr noundef nonnull dereferenceable(1) %101, ptr noundef nonnull dereferenceable(1) %1) #12
  %108 = tail call ptr @Variable_Search(ptr noundef nonnull %1) #12
  %109 = tail call ptr @Variable_Search(ptr noundef nonnull %101) #12
  %110 = tail call ptr @Logic_Add(ptr noundef %27, ptr noundef %109, ptr noundef null, ptr noundef null) #12
  %111 = tail call ptr @Logic_Add(ptr noundef %26, ptr noundef %108, ptr noundef null, ptr noundef null) #12
  tail call void @Heap_Free(ptr noundef nonnull %101) #12
  br label %112

112:                                              ; preds = %93, %103, %24
  %113 = phi ptr [ @VARIANT_EMPTY, %24 ], [ %0, %103 ], [ %0, %93 ]
  ret ptr %113
}

declare dso_local void @Errorlog_Add(i32 noundef, i32 noundef, ptr noundef) local_unnamed_addr #1

declare dso_local ptr @Instruction_GetTemplate(ptr noundef) local_unnamed_addr #1

declare dso_local ptr @Variable_Search(ptr noundef) local_unnamed_addr #1

declare dso_local ptr @Logic_Add(ptr noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #1

declare dso_local ptr @Literal_Compile(ptr noundef) local_unnamed_addr #1

declare dso_local ptr @Variable_Zero(i16 noundef zeroext) local_unnamed_addr #1

declare dso_local ptr @Label_Search(ptr noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcat(ptr noalias noundef returned, ptr noalias noundef readonly captures(none)) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #11

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree norecurse nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree norecurse nosync nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { mustprogress nofree norecurse nounwind willreturn "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nocallback nofree nounwind willreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nofree nounwind }
attributes #12 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\userfunc.c", directory: "C:\\D_DRV\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !8}
!12 = distinct !{!12, !8}
!13 = distinct !{!13, !8}
!14 = distinct !{!14, !8}
!15 = distinct !{!15, !8}
!16 = !{}
!17 = distinct !{!17, !8}
