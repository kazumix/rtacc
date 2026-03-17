; ModuleID = '..\PLCP\mnmfile.c'
source_filename = "..\\PLCP\\mnmfile.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.T_ANY = type <{ %union.PANYVAL, i16, ptr, i8, i8, %struct.BITFIELD }>
%union.PANYVAL = type { ptr }
%struct.BITFIELD = type { i8, i8, i8 }

$LibVersion_0x0701 = comdat any

$"??_C@_02BMJICGCB@rt?$AA@" = comdat any

$"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@" = comdat any

$"??_C@_01IHBHIGKO@?0?$AA@" = comdat any

$"??_C@_05EILEDKCG@LABEL?$AA@" = comdat any

$"??_C@_03BHDJDALB@RET?$AA@" = comdat any

$"??_C@_03JMGAKCCH@END?$AA@" = comdat any

$"??_C@_04HGICJEGC@?4X?$CFd?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@status_mnmfile = dso_local local_unnamed_addr global i32 0, align 4
@MnmFile_Open.fp = internal unnamed_addr global ptr null, align 4
@"??_C@_02BMJICGCB@rt?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"rt\00", comdat, align 1
@"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c" \09\0A\0D\00", comdat, align 1
@"??_C@_01IHBHIGKO@?0?$AA@" = linkonce_odr dso_local unnamed_addr constant [2 x i8] c",\00", comdat, align 1
@MnmFile_Base.Label = internal global [128 x i8] zeroinitializer, align 1
@"??_C@_05EILEDKCG@LABEL?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"LABEL\00", comdat, align 1
@VARIANT_EMPTY = external dso_local global %struct.T_ANY, align 1
@_Variable_Zero_FUNCTION = external dso_local global %struct.T_ANY, align 1
@"??_C@_03BHDJDALB@RET?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"RET\00", comdat, align 1
@"??_C@_03JMGAKCCH@END?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"END\00", comdat, align 1
@"??_C@_04HGICJEGC@?4X?$CFd?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c".X%d\00", comdat, align 1

; Function Attrs: nounwind
define dso_local noundef ptr @MnmFile_Open(ptr noundef readonly captures(none) %0) local_unnamed_addr #0 {
  tail call void @Comment_ClearNest() #15
  %2 = tail call ptr @fopen(ptr noundef %0, ptr noundef nonnull @"??_C@_02BMJICGCB@rt?$AA@")
  store ptr %2, ptr @MnmFile_Open.fp, align 4
  ret ptr %2
}

declare dso_local void @Comment_ClearNest() local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: nofree nounwind
declare dso_local noalias noundef ptr @fopen(ptr noundef readonly captures(none), ptr noundef readonly captures(none)) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: nofree nounwind
define dso_local void @MnmFile_Close(ptr noundef captures(address_is_null) %0) local_unnamed_addr #4 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %5, label %3

3:                                                ; preds = %1
  %4 = tail call i32 @fclose(ptr noundef nonnull %0)
  store i32 2, ptr @status_mnmfile, align 4
  br label %5

5:                                                ; preds = %1, %3
  ret void
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fclose(ptr noundef captures(none)) local_unnamed_addr #3

; Function Attrs: nofree nounwind
define dso_local noundef ptr @MnmFile_GetLine(ptr noundef captures(address_is_null) %0, ptr noundef %1, i32 noundef %2) local_unnamed_addr #4 {
  %4 = icmp eq ptr %0, null
  br i1 %4, label %7, label %5

5:                                                ; preds = %3
  %6 = tail call ptr @fgets(ptr noundef %1, i32 noundef %2, ptr noundef nonnull %0)
  br label %7

7:                                                ; preds = %3, %5
  %8 = phi ptr [ %6, %5 ], [ null, %3 ]
  ret ptr %8
}

; Function Attrs: nofree nounwind
declare dso_local noundef ptr @fgets(ptr noundef writeonly, i32 noundef, ptr noundef captures(none)) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local void @MnmFile_TrimLine_Stage1(ptr noundef %0) local_unnamed_addr #0 {
  %2 = load i8, ptr %0, align 1
  %3 = icmp eq i8 %2, 59
  br i1 %3, label %4, label %5

4:                                                ; preds = %1
  store i8 0, ptr %0, align 1
  br label %19

5:                                                ; preds = %1
  %6 = tail call ptr @strchr(ptr noundef nonnull dereferenceable(1) %0, i32 10)
  %7 = icmp eq ptr %6, null
  br i1 %7, label %9, label %8

8:                                                ; preds = %5
  store i8 0, ptr %6, align 1
  br label %9

9:                                                ; preds = %8, %5
  tail call void @Comment_ProcessBracket(ptr noundef nonnull %0) #15
  br label %10

10:                                               ; preds = %17, %9
  %11 = phi ptr [ %0, %9 ], [ %18, %17 ]
  %12 = load i8, ptr %11, align 1
  switch i8 %12, label %13 [
    i8 32, label %17
    i8 9, label %17
    i8 10, label %17
    i8 13, label %17
  ]

13:                                               ; preds = %10
  %14 = icmp eq ptr %11, %0
  br i1 %14, label %19, label %15

15:                                               ; preds = %13
  %16 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(1) %11) #15
  br label %19

17:                                               ; preds = %10, %10, %10, %10
  %18 = getelementptr inbounds nuw i8, ptr %11, i32 1
  br label %10

19:                                               ; preds = %15, %13, %4
  ret void
}

declare dso_local void @Comment_ProcessBracket(ptr noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none)) local_unnamed_addr #5

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @MnmFile_TrimLine_Stage2(ptr noundef captures(address_is_null) %0) local_unnamed_addr #6 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %27, label %3

3:                                                ; preds = %1, %20
  %4 = phi ptr [ %26, %20 ], [ %0, %1 ]
  %5 = phi ptr [ %21, %20 ], [ %0, %1 ]
  %6 = phi i8 [ %22, %20 ], [ 0, %1 ]
  %7 = phi i8 [ %23, %20 ], [ 0, %1 ]
  %8 = load i8, ptr %4, align 1
  switch i8 %8, label %14 [
    i8 2, label %15
    i8 3, label %9
    i8 9, label %10
    i8 32, label %10
  ]

9:                                                ; preds = %3
  br label %15

10:                                               ; preds = %3, %3
  %11 = icmp eq i8 %6, 0
  br i1 %11, label %12, label %15

12:                                               ; preds = %10
  %13 = icmp eq i8 %7, 0
  br i1 %13, label %15, label %20

14:                                               ; preds = %3
  br label %15

15:                                               ; preds = %12, %10, %3, %9, %14
  %16 = phi i8 [ %8, %10 ], [ %8, %14 ], [ %8, %3 ], [ %8, %9 ], [ 32, %12 ]
  %17 = phi i8 [ 1, %10 ], [ %6, %14 ], [ 1, %3 ], [ 0, %9 ], [ 0, %12 ]
  %18 = phi i8 [ %7, %10 ], [ %7, %14 ], [ %7, %3 ], [ %7, %9 ], [ 1, %12 ]
  %19 = getelementptr inbounds nuw i8, ptr %5, i32 1
  store i8 %16, ptr %5, align 1
  br label %20

20:                                               ; preds = %15, %12
  %21 = phi ptr [ %5, %12 ], [ %19, %15 ]
  %22 = phi i8 [ 0, %12 ], [ %17, %15 ]
  %23 = phi i8 [ 1, %12 ], [ %18, %15 ]
  %24 = load i8, ptr %4, align 1
  %25 = icmp eq i8 %24, 0
  %26 = getelementptr inbounds nuw i8, ptr %4, i32 1
  br i1 %25, label %27, label %3

27:                                               ; preds = %20, %1
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @MnmFile_TrimLine_Stage3(ptr noundef captures(address_is_null) %0) local_unnamed_addr #6 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %21, label %3

3:                                                ; preds = %1, %15
  %4 = phi ptr [ %20, %15 ], [ %0, %1 ]
  %5 = phi ptr [ %16, %15 ], [ %0, %1 ]
  %6 = phi i8 [ %17, %15 ], [ 0, %1 ]
  %7 = load i8, ptr %4, align 1
  switch i8 %7, label %11 [
    i8 2, label %12
    i8 3, label %8
    i8 9, label %9
    i8 32, label %9
  ]

8:                                                ; preds = %3
  br label %12

9:                                                ; preds = %3, %3
  %10 = icmp eq i8 %6, 0
  br i1 %10, label %15, label %12

11:                                               ; preds = %3
  br label %12

12:                                               ; preds = %9, %3, %8, %11
  %13 = phi i8 [ %6, %11 ], [ 1, %3 ], [ 0, %8 ], [ 1, %9 ]
  %14 = getelementptr inbounds nuw i8, ptr %5, i32 1
  store i8 %7, ptr %5, align 1
  br label %15

15:                                               ; preds = %12, %9
  %16 = phi ptr [ %5, %9 ], [ %14, %12 ]
  %17 = phi i8 [ 0, %9 ], [ %13, %12 ]
  %18 = load i8, ptr %4, align 1
  %19 = icmp eq i8 %18, 0
  %20 = getelementptr inbounds nuw i8, ptr %4, i32 1
  br i1 %19, label %21, label %3

21:                                               ; preds = %15, %1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define dso_local void @MnmFile_PargeLine(ptr noundef %0, ptr noundef writeonly captures(none) initializes((0, 4)) %1, ptr noundef writeonly captures(none) initializes((0, 4)) %2, ptr noundef writeonly captures(none) initializes((0, 4)) %3, ptr noundef writeonly captures(none) initializes((0, 4)) %4) local_unnamed_addr #7 {
  %6 = tail call ptr @strtok(ptr noundef %0, ptr noundef nonnull @"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@")
  store ptr %6, ptr %1, align 4
  %7 = tail call ptr @strtok(ptr noundef null, ptr noundef nonnull @"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@")
  store ptr %7, ptr %2, align 4
  %8 = tail call ptr @strtok(ptr noundef null, ptr noundef nonnull @"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@")
  store ptr %8, ptr %3, align 4
  %9 = tail call ptr @strtok(ptr noundef null, ptr noundef nonnull @"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@")
  store ptr %9, ptr %4, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn
declare dso_local ptr @strtok(ptr noundef, ptr noundef readonly captures(none)) local_unnamed_addr #8

; Function Attrs: nounwind
define dso_local void @MnmFile_PargeCamma(ptr noundef %0, ptr noundef captures(none) initializes((0, 4)) %1, ptr noundef captures(none) initializes((0, 4)) %2, ptr noundef captures(none) initializes((0, 4)) %3) local_unnamed_addr #0 {
  %5 = tail call ptr @strtok(ptr noundef %0, ptr noundef nonnull @"??_C@_01IHBHIGKO@?0?$AA@")
  store ptr %5, ptr %1, align 4
  %6 = tail call ptr @strtok(ptr noundef null, ptr noundef nonnull @"??_C@_01IHBHIGKO@?0?$AA@")
  store ptr %6, ptr %2, align 4
  %7 = tail call ptr @strtok(ptr noundef null, ptr noundef nonnull @"??_C@_01IHBHIGKO@?0?$AA@")
  store ptr %7, ptr %3, align 4
  %8 = load ptr, ptr %1, align 4
  %9 = tail call i32 @String_Packing(ptr noundef %8) #15
  %10 = load ptr, ptr %1, align 4
  %11 = icmp eq ptr %10, null
  br i1 %11, label %33, label %12

12:                                               ; preds = %4, %25
  %13 = phi ptr [ %30, %25 ], [ %10, %4 ]
  %14 = phi ptr [ %27, %25 ], [ %10, %4 ]
  %15 = phi i8 [ %28, %25 ], [ 0, %4 ]
  %16 = load i8, ptr %13, align 1
  switch i8 %16, label %20 [
    i8 2, label %21
    i8 3, label %17
    i8 9, label %18
    i8 32, label %18
  ]

17:                                               ; preds = %12
  br label %21

18:                                               ; preds = %12, %12
  %19 = icmp eq i8 %15, 0
  br i1 %19, label %25, label %21

20:                                               ; preds = %12
  br label %21

21:                                               ; preds = %20, %18, %17, %12
  %22 = phi i8 [ %15, %20 ], [ 1, %12 ], [ 0, %17 ], [ 1, %18 ]
  %23 = getelementptr inbounds nuw i8, ptr %14, i32 1
  store i8 %16, ptr %14, align 1
  %24 = load i8, ptr %13, align 1
  br label %25

25:                                               ; preds = %21, %18
  %26 = phi i8 [ %16, %18 ], [ %24, %21 ]
  %27 = phi ptr [ %14, %18 ], [ %23, %21 ]
  %28 = phi i8 [ 0, %18 ], [ %22, %21 ]
  %29 = icmp eq i8 %26, 0
  %30 = getelementptr inbounds nuw i8, ptr %13, i32 1
  br i1 %29, label %31, label %12

31:                                               ; preds = %25
  %32 = load ptr, ptr %1, align 4
  br label %33

33:                                               ; preds = %31, %4
  %34 = phi ptr [ %32, %31 ], [ null, %4 ]
  %35 = tail call i32 @String_Unpacking(ptr noundef %34) #15
  %36 = load ptr, ptr %2, align 4
  %37 = tail call i32 @String_Packing(ptr noundef %36) #15
  %38 = load ptr, ptr %2, align 4
  %39 = icmp eq ptr %38, null
  br i1 %39, label %61, label %40

40:                                               ; preds = %33, %53
  %41 = phi ptr [ %58, %53 ], [ %38, %33 ]
  %42 = phi ptr [ %55, %53 ], [ %38, %33 ]
  %43 = phi i8 [ %56, %53 ], [ 0, %33 ]
  %44 = load i8, ptr %41, align 1
  switch i8 %44, label %48 [
    i8 2, label %49
    i8 3, label %45
    i8 9, label %46
    i8 32, label %46
  ]

45:                                               ; preds = %40
  br label %49

46:                                               ; preds = %40, %40
  %47 = icmp eq i8 %43, 0
  br i1 %47, label %53, label %49

48:                                               ; preds = %40
  br label %49

49:                                               ; preds = %48, %46, %45, %40
  %50 = phi i8 [ %43, %48 ], [ 1, %40 ], [ 0, %45 ], [ 1, %46 ]
  %51 = getelementptr inbounds nuw i8, ptr %42, i32 1
  store i8 %44, ptr %42, align 1
  %52 = load i8, ptr %41, align 1
  br label %53

53:                                               ; preds = %49, %46
  %54 = phi i8 [ %44, %46 ], [ %52, %49 ]
  %55 = phi ptr [ %42, %46 ], [ %51, %49 ]
  %56 = phi i8 [ 0, %46 ], [ %50, %49 ]
  %57 = icmp eq i8 %54, 0
  %58 = getelementptr inbounds nuw i8, ptr %41, i32 1
  br i1 %57, label %59, label %40

59:                                               ; preds = %53
  %60 = load ptr, ptr %2, align 4
  br label %61

61:                                               ; preds = %59, %33
  %62 = phi ptr [ %60, %59 ], [ null, %33 ]
  %63 = tail call i32 @String_Unpacking(ptr noundef %62) #15
  %64 = load ptr, ptr %3, align 4
  %65 = tail call i32 @String_Packing(ptr noundef %64) #15
  %66 = load ptr, ptr %3, align 4
  %67 = icmp eq ptr %66, null
  br i1 %67, label %89, label %68

68:                                               ; preds = %61, %81
  %69 = phi ptr [ %86, %81 ], [ %66, %61 ]
  %70 = phi ptr [ %83, %81 ], [ %66, %61 ]
  %71 = phi i8 [ %84, %81 ], [ 0, %61 ]
  %72 = load i8, ptr %69, align 1
  switch i8 %72, label %76 [
    i8 2, label %77
    i8 3, label %73
    i8 9, label %74
    i8 32, label %74
  ]

73:                                               ; preds = %68
  br label %77

74:                                               ; preds = %68, %68
  %75 = icmp eq i8 %71, 0
  br i1 %75, label %81, label %77

76:                                               ; preds = %68
  br label %77

77:                                               ; preds = %76, %74, %73, %68
  %78 = phi i8 [ %71, %76 ], [ 1, %68 ], [ 0, %73 ], [ 1, %74 ]
  %79 = getelementptr inbounds nuw i8, ptr %70, i32 1
  store i8 %72, ptr %70, align 1
  %80 = load i8, ptr %69, align 1
  br label %81

81:                                               ; preds = %77, %74
  %82 = phi i8 [ %72, %74 ], [ %80, %77 ]
  %83 = phi ptr [ %70, %74 ], [ %79, %77 ]
  %84 = phi i8 [ 0, %74 ], [ %78, %77 ]
  %85 = icmp eq i8 %82, 0
  %86 = getelementptr inbounds nuw i8, ptr %69, i32 1
  br i1 %85, label %87, label %68

87:                                               ; preds = %81
  %88 = load ptr, ptr %3, align 4
  br label %89

89:                                               ; preds = %87, %61
  %90 = phi ptr [ %88, %87 ], [ null, %61 ]
  %91 = tail call i32 @String_Unpacking(ptr noundef %90) #15
  ret void
}

declare dso_local i32 @String_Packing(ptr noundef) local_unnamed_addr #1

declare dso_local i32 @String_Unpacking(ptr noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local zeroext range(i16 0, 5) i16 @MnmFile_PargeArgument(ptr noundef %0, i16 noundef zeroext %1, ptr noundef writeonly captures(none) %2) local_unnamed_addr #0 {
  %4 = alloca %struct.BITFIELD, align 1
  switch i16 %1, label %53 [
    i16 0, label %5
    i16 -32767, label %8
    i16 -32765, label %8
    i16 -32764, label %8
    i16 -32766, label %8
    i16 1536, label %8
    i16 -32763, label %8
    i16 -32762, label %8
    i16 -32761, label %8
    i16 -32760, label %8
    i16 -32759, label %8
    i16 19, label %8
    i16 18, label %8
    i16 17, label %8
    i16 16, label %8
    i16 263, label %8
    i16 262, label %8
    i16 261, label %8
    i16 260, label %8
    i16 515, label %8
    i16 514, label %8
    i16 513, label %8
    i16 512, label %8
    i16 783, label %8
    i16 782, label %8
    i16 1346, label %8
    i16 1347, label %8
  ]

5:                                                ; preds = %3
  %6 = icmp eq ptr %0, null
  %7 = select i1 %6, i16 0, i16 4
  br label %53

8:                                                ; preds = %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #15
  call void @Bitfield_Check(ptr dead_on_unwind nonnull writable sret(%struct.BITFIELD) align 1 %4, ptr noundef %0) #15
  %9 = load i8, ptr %4, align 1
  %10 = getelementptr inbounds nuw i8, ptr %4, i32 1
  %11 = load i16, ptr %10, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #15
  %12 = icmp eq ptr %0, null
  br i1 %12, label %24, label %13

13:                                               ; preds = %8
  %14 = call ptr @strdup(ptr noundef nonnull %0) #15
  %15 = icmp eq ptr %14, null
  br i1 %15, label %53, label %16

16:                                               ; preds = %13
  %17 = icmp eq i8 %9, 0
  br i1 %17, label %22, label %18

18:                                               ; preds = %16
  %19 = call ptr @strrchr(ptr noundef nonnull dereferenceable(1) %14, i32 noundef 46) #15
  %20 = icmp eq ptr %19, null
  br i1 %20, label %22, label %21

21:                                               ; preds = %18
  store i8 0, ptr %19, align 1
  br label %22

22:                                               ; preds = %16, %21, %18
  %23 = call ptr @Scope_variable(ptr noundef nonnull %14) #15
  br label %24

24:                                               ; preds = %8, %22
  %25 = phi ptr [ %14, %22 ], [ null, %8 ]
  %26 = phi ptr [ %23, %22 ], [ null, %8 ]
  %27 = call ptr @Variable_Search(ptr noundef %26) #15
  %28 = icmp eq ptr %27, null
  br i1 %28, label %29, label %40

29:                                               ; preds = %24
  %30 = call ptr @Literal_Compile(ptr noundef %26) #15
  %31 = icmp eq ptr %30, null
  br i1 %31, label %32, label %40

32:                                               ; preds = %29
  %33 = call ptr @Structure_Compile(ptr noundef %26) #15
  %34 = icmp eq ptr %33, null
  br i1 %34, label %35, label %40

35:                                               ; preds = %32
  %36 = call ptr @Rtedge_Compile(ptr noundef %26) #15
  %37 = icmp eq ptr %36, null
  br i1 %37, label %38, label %40

38:                                               ; preds = %35
  br i1 %12, label %53, label %39

39:                                               ; preds = %38
  call void @free(ptr noundef %25)
  br label %53

40:                                               ; preds = %29, %24, %32, %35
  %41 = phi ptr [ %36, %35 ], [ %33, %32 ], [ %27, %24 ], [ %30, %29 ]
  %42 = icmp eq i8 %9, 0
  br i1 %42, label %50, label %43

43:                                               ; preds = %40
  %44 = call ptr @Variable_Search(ptr noundef %0) #15
  %45 = icmp eq ptr %44, null
  br i1 %45, label %46, label %50

46:                                               ; preds = %43
  %47 = call ptr @Variable_Add(ptr noundef %0, i16 noundef zeroext 1536) #15
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(15) %47, ptr noundef nonnull align 1 dereferenceable(15) %41, i32 12, i1 false)
  %48 = getelementptr inbounds nuw i8, ptr %47, i32 12
  store i8 %9, ptr %48, align 1
  %49 = getelementptr inbounds nuw i8, ptr %47, i32 13
  store i16 %11, ptr %49, align 1
  br label %50

50:                                               ; preds = %43, %46, %40
  %51 = phi ptr [ %41, %40 ], [ %47, %46 ], [ %44, %43 ]
  store ptr %51, ptr %2, align 4
  br i1 %12, label %53, label %52

52:                                               ; preds = %50
  call void @free(ptr noundef %25)
  br label %53

53:                                               ; preds = %3, %50, %52, %38, %39, %13, %5
  %54 = phi i16 [ 0, %50 ], [ %7, %5 ], [ 4, %13 ], [ 4, %38 ], [ 4, %39 ], [ 0, %52 ], [ 4, %3 ]
  ret i16 %54
}

declare dso_local void @Bitfield_Check(ptr dead_on_unwind writable sret(%struct.BITFIELD) align 1, ptr noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #9

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
declare dso_local noalias ptr @strdup(ptr noundef readonly captures(none)) local_unnamed_addr #10

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local ptr @strrchr(ptr noundef, i32 noundef) local_unnamed_addr #11

declare dso_local ptr @Scope_variable(ptr noundef) local_unnamed_addr #1

declare dso_local ptr @Variable_Search(ptr noundef) local_unnamed_addr #1

declare dso_local ptr @Literal_Compile(ptr noundef) local_unnamed_addr #1

declare dso_local ptr @Structure_Compile(ptr noundef) local_unnamed_addr #1

declare dso_local ptr @Rtedge_Compile(ptr noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare dso_local void @free(ptr allocptr noundef captures(none)) local_unnamed_addr #12

declare dso_local ptr @Variable_Add(ptr noundef, i16 noundef zeroext) local_unnamed_addr #1

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local nonnull ptr @MnmFile_Base(ptr noundef readonly captures(none) %0) local_unnamed_addr #13 {
  %2 = tail call ptr @strncpy(ptr noundef nonnull dereferenceable(1) @MnmFile_Base.Label, ptr noundef nonnull dereferenceable(1) %0, i32 noundef 128) #15
  %3 = tail call ptr @strrchr(ptr noundef nonnull dereferenceable(1) @MnmFile_Base.Label, i32 noundef 46) #15
  %4 = icmp eq ptr %3, null
  br i1 %4, label %6, label %5

5:                                                ; preds = %1
  store i8 0, ptr %3, align 1
  br label %6

6:                                                ; preds = %5, %1
  %7 = tail call ptr @strrchr(ptr noundef nonnull dereferenceable(1) @MnmFile_Base.Label, i32 noundef 92) #15
  %8 = icmp eq ptr %7, null
  br i1 %8, label %11, label %9

9:                                                ; preds = %6
  %10 = getelementptr inbounds nuw i8, ptr %7, i32 1
  br label %16

11:                                               ; preds = %6
  %12 = tail call ptr @strrchr(ptr noundef nonnull dereferenceable(1) @MnmFile_Base.Label, i32 noundef 47) #15
  %13 = icmp eq ptr %12, null
  %14 = getelementptr inbounds nuw i8, ptr %12, i32 1
  %15 = select i1 %13, ptr @MnmFile_Base.Label, ptr %14
  br label %16

16:                                               ; preds = %11, %9
  %17 = phi ptr [ %10, %9 ], [ %15, %11 ]
  ret ptr %17
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strncpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none), i32 noundef) local_unnamed_addr #5

; Function Attrs: nounwind
define dso_local i32 @MnmFile_Load(ptr noundef %0) local_unnamed_addr #0 {
  %2 = alloca [128 x i8], align 1
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  %6 = alloca ptr, align 4
  %7 = alloca ptr, align 4
  %8 = alloca ptr, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %6) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %7) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %8) #15
  tail call void @Comment_ClearNest() #15
  %9 = tail call noundef ptr @fopen(ptr noundef readonly %0, ptr noundef nonnull @"??_C@_02BMJICGCB@rt?$AA@")
  store ptr %9, ptr @MnmFile_Open.fp, align 4
  %10 = icmp eq ptr %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %1
  tail call void @Errorlog_Add(i32 noundef 0, i32 noundef 32, ptr noundef %0) #15
  br label %205

12:                                               ; preds = %1
  %13 = tail call ptr @Instruction_GetTemplate(ptr noundef nonnull @"??_C@_05EILEDKCG@LABEL?$AA@") #15
  %14 = tail call ptr @Logic_Add(ptr noundef %13, ptr noundef null, ptr noundef null, ptr noundef null) #15
  %15 = tail call ptr @strncpy(ptr noundef nonnull dereferenceable(1) @MnmFile_Base.Label, ptr noundef nonnull readonly dereferenceable(1) %0, i32 noundef 128) #15
  %16 = tail call ptr @strrchr(ptr noundef nonnull dereferenceable(1) @MnmFile_Base.Label, i32 noundef 46) #15
  %17 = icmp eq ptr %16, null
  br i1 %17, label %19, label %18

18:                                               ; preds = %12
  store i8 0, ptr %16, align 1
  br label %19

19:                                               ; preds = %18, %12
  %20 = tail call ptr @strrchr(ptr noundef nonnull dereferenceable(1) @MnmFile_Base.Label, i32 noundef 92) #15
  %21 = icmp eq ptr %20, null
  br i1 %21, label %24, label %22

22:                                               ; preds = %19
  %23 = getelementptr inbounds nuw i8, ptr %20, i32 1
  br label %29

24:                                               ; preds = %19
  %25 = tail call ptr @strrchr(ptr noundef nonnull dereferenceable(1) @MnmFile_Base.Label, i32 noundef 47) #15
  %26 = icmp eq ptr %25, null
  %27 = getelementptr inbounds nuw i8, ptr %25, i32 1
  %28 = select i1 %26, ptr @MnmFile_Base.Label, ptr %27
  br label %29

29:                                               ; preds = %22, %24
  %30 = phi ptr [ %23, %22 ], [ %28, %24 ]
  %31 = tail call ptr @Label_Add(ptr noundef %30, i32 noundef 1, ptr noundef %14) #15
  %32 = call ptr @fgets(ptr noundef nonnull %2, i32 noundef 128, ptr noundef nonnull %9)
  %33 = icmp eq ptr %32, null
  br i1 %33, label %189, label %34

34:                                               ; preds = %29, %98
  %35 = phi i32 [ %99, %98 ], [ 0, %29 ]
  %36 = phi i32 [ %37, %98 ], [ 0, %29 ]
  %37 = add i32 %36, 1
  %38 = load i8, ptr %2, align 1
  %39 = icmp eq i8 %38, 59
  br i1 %39, label %40, label %41

40:                                               ; preds = %34
  store i8 0, ptr %2, align 1
  br label %98

41:                                               ; preds = %34
  %42 = call ptr @strchr(ptr noundef nonnull dereferenceable(1) %2, i32 10)
  %43 = icmp eq ptr %42, null
  br i1 %43, label %45, label %44

44:                                               ; preds = %41
  store i8 0, ptr %42, align 1
  br label %45

45:                                               ; preds = %44, %41
  call void @Comment_ProcessBracket(ptr noundef nonnull %2) #15
  br label %46

46:                                               ; preds = %53, %45
  %47 = phi ptr [ %2, %45 ], [ %54, %53 ]
  %48 = load i8, ptr %47, align 1
  switch i8 %48, label %49 [
    i8 32, label %53
    i8 9, label %53
    i8 10, label %53
    i8 13, label %53
  ]

49:                                               ; preds = %46
  %50 = icmp eq ptr %47, %2
  br i1 %50, label %55, label %51

51:                                               ; preds = %49
  %52 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %2, ptr noundef nonnull dereferenceable(1) %47) #15
  br label %55

53:                                               ; preds = %46, %46, %46, %46
  %54 = getelementptr inbounds nuw i8, ptr %47, i32 1
  br label %46

55:                                               ; preds = %51, %49
  %56 = load i8, ptr %2, align 1
  %57 = icmp eq i8 %56, 0
  br i1 %57, label %98, label %58

58:                                               ; preds = %55
  %59 = call i32 @String_Packing(ptr noundef nonnull %2) #15
  br label %60

60:                                               ; preds = %58, %78
  %61 = phi ptr [ %84, %78 ], [ %2, %58 ]
  %62 = phi ptr [ %80, %78 ], [ %2, %58 ]
  %63 = phi i8 [ %81, %78 ], [ 0, %58 ]
  %64 = phi i8 [ %82, %78 ], [ 0, %58 ]
  %65 = load i8, ptr %61, align 1
  switch i8 %65, label %71 [
    i8 2, label %72
    i8 3, label %66
    i8 9, label %67
    i8 32, label %67
  ]

66:                                               ; preds = %60
  br label %72

67:                                               ; preds = %60, %60
  %68 = icmp eq i8 %63, 0
  br i1 %68, label %69, label %72

69:                                               ; preds = %67
  %70 = icmp eq i8 %64, 0
  br i1 %70, label %72, label %78

71:                                               ; preds = %60
  br label %72

72:                                               ; preds = %71, %69, %67, %66, %60
  %73 = phi i8 [ %65, %67 ], [ %65, %71 ], [ %65, %60 ], [ %65, %66 ], [ 32, %69 ]
  %74 = phi i8 [ 1, %67 ], [ %63, %71 ], [ 1, %60 ], [ 0, %66 ], [ 0, %69 ]
  %75 = phi i8 [ %64, %67 ], [ %64, %71 ], [ %64, %60 ], [ %64, %66 ], [ 1, %69 ]
  %76 = getelementptr inbounds nuw i8, ptr %62, i32 1
  store i8 %73, ptr %62, align 1
  %77 = load i8, ptr %61, align 1
  br label %78

78:                                               ; preds = %72, %69
  %79 = phi i8 [ %65, %69 ], [ %77, %72 ]
  %80 = phi ptr [ %62, %69 ], [ %76, %72 ]
  %81 = phi i8 [ 0, %69 ], [ %74, %72 ]
  %82 = phi i8 [ 1, %69 ], [ %75, %72 ]
  %83 = icmp eq i8 %79, 0
  %84 = getelementptr inbounds nuw i8, ptr %61, i32 1
  br i1 %83, label %85, label %60

85:                                               ; preds = %78
  %86 = call ptr @strtok(ptr noundef nonnull %2, ptr noundef nonnull @"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@")
  %87 = call ptr @strtok(ptr noundef null, ptr noundef nonnull @"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@")
  %88 = call ptr @strtok(ptr noundef null, ptr noundef nonnull @"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@")
  %89 = call ptr @strtok(ptr noundef null, ptr noundef nonnull @"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@")
  %90 = call i32 @String_Unpacking(ptr noundef %87) #15
  %91 = icmp eq ptr %86, null
  br i1 %91, label %98, label %92

92:                                               ; preds = %85
  %93 = call ptr @Instruction_GetTemplate(ptr noundef nonnull %86) #15
  %94 = icmp eq ptr %93, null
  br i1 %94, label %95, label %102

95:                                               ; preds = %92
  %96 = load ptr, ptr %31, align 1
  call void @Errorlog_Add(i32 noundef %37, i32 noundef 128, ptr noundef %96) #15
  %97 = add nsw i32 %35, 1
  br label %98

98:                                               ; preds = %95, %106, %114, %122, %130, %141, %153, %165, %55, %85, %182, %40
  %99 = phi i32 [ %35, %55 ], [ %35, %85 ], [ %97, %95 ], [ %35, %106 ], [ %117, %114 ], [ %125, %122 ], [ %133, %130 ], [ %145, %141 ], [ %157, %153 ], [ %169, %165 ], [ %35, %182 ], [ %35, %40 ]
  %100 = call ptr @fgets(ptr noundef nonnull %2, i32 noundef 128, ptr noundef nonnull %9)
  %101 = icmp eq ptr %100, null
  br i1 %101, label %189, label %34, !llvm.loop !7

102:                                              ; preds = %92
  %103 = getelementptr inbounds nuw i8, ptr %93, i32 6
  %104 = load i8, ptr %103, align 1
  %105 = icmp eq i8 %104, 0
  br i1 %105, label %110, label %106

106:                                              ; preds = %102
  %107 = getelementptr inbounds nuw i8, ptr %93, i32 13
  %108 = load ptr, ptr %107, align 1
  %109 = call ptr %108(ptr noundef %87, ptr noundef nonnull %86, ptr noundef null, ptr noundef null) #15
  br label %98

110:                                              ; preds = %102
  call void @MnmFile_PargeCamma(ptr noundef %87, ptr noundef nonnull %3, ptr noundef nonnull %4, ptr noundef nonnull %5)
  %111 = load ptr, ptr %3, align 4
  %112 = call zeroext i8 @Reservedword_Check(ptr noundef %111) #15
  %113 = icmp eq i8 %112, 0
  br i1 %113, label %118, label %114

114:                                              ; preds = %110
  %115 = load ptr, ptr %31, align 1
  call void @Errorlog_Add(i32 noundef %37, i32 noundef 4, ptr noundef %115) #15
  %116 = load ptr, ptr %31, align 1
  call void @Errorlog_Add(i32 noundef %37, i32 noundef 129, ptr noundef %116) #15
  %117 = add nsw i32 %35, 2
  br label %98

118:                                              ; preds = %110
  %119 = load ptr, ptr %4, align 4
  %120 = call zeroext i8 @Reservedword_Check(ptr noundef %119) #15
  %121 = icmp eq i8 %120, 0
  br i1 %121, label %126, label %122

122:                                              ; preds = %118
  %123 = load ptr, ptr %31, align 1
  call void @Errorlog_Add(i32 noundef %37, i32 noundef 5, ptr noundef %123) #15
  %124 = load ptr, ptr %31, align 1
  call void @Errorlog_Add(i32 noundef %37, i32 noundef 129, ptr noundef %124) #15
  %125 = add nsw i32 %35, 2
  br label %98

126:                                              ; preds = %118
  %127 = load ptr, ptr %5, align 4
  %128 = call zeroext i8 @Reservedword_Check(ptr noundef %127) #15
  %129 = icmp eq i8 %128, 0
  br i1 %129, label %134, label %130

130:                                              ; preds = %126
  %131 = load ptr, ptr %31, align 1
  call void @Errorlog_Add(i32 noundef %37, i32 noundef 6, ptr noundef %131) #15
  %132 = load ptr, ptr %31, align 1
  call void @Errorlog_Add(i32 noundef %37, i32 noundef 129, ptr noundef %132) #15
  %133 = add nsw i32 %35, 2
  br label %98

134:                                              ; preds = %126
  store ptr @VARIANT_EMPTY, ptr %6, align 4
  store ptr @VARIANT_EMPTY, ptr %7, align 4
  store ptr @VARIANT_EMPTY, ptr %8, align 4
  %135 = icmp eq ptr %111, null
  br i1 %135, label %146, label %136

136:                                              ; preds = %134
  %137 = getelementptr inbounds nuw i8, ptr %93, i32 7
  %138 = load i16, ptr %137, align 1
  %139 = call zeroext i16 @MnmFile_PargeArgument(ptr noundef nonnull %111, i16 noundef zeroext %138, ptr noundef nonnull %6)
  %140 = icmp eq i16 %139, 0
  br i1 %140, label %146, label %141

141:                                              ; preds = %136
  %142 = zext nneg i16 %139 to i32
  %143 = load ptr, ptr %31, align 1
  call void @Errorlog_Add(i32 noundef %37, i32 noundef 4, ptr noundef %143) #15
  %144 = load ptr, ptr %31, align 1
  call void @Errorlog_Add(i32 noundef %37, i32 noundef %142, ptr noundef %144) #15
  %145 = add nsw i32 %35, 2
  br label %98

146:                                              ; preds = %136, %134
  %147 = icmp eq ptr %119, null
  br i1 %147, label %158, label %148

148:                                              ; preds = %146
  %149 = getelementptr inbounds nuw i8, ptr %93, i32 9
  %150 = load i16, ptr %149, align 1
  %151 = call zeroext i16 @MnmFile_PargeArgument(ptr noundef nonnull %119, i16 noundef zeroext %150, ptr noundef nonnull %7)
  %152 = icmp eq i16 %151, 0
  br i1 %152, label %158, label %153

153:                                              ; preds = %148
  %154 = zext nneg i16 %151 to i32
  %155 = load ptr, ptr %31, align 1
  call void @Errorlog_Add(i32 noundef %37, i32 noundef 5, ptr noundef %155) #15
  %156 = load ptr, ptr %31, align 1
  call void @Errorlog_Add(i32 noundef %37, i32 noundef %154, ptr noundef %156) #15
  %157 = add nsw i32 %35, 2
  br label %98

158:                                              ; preds = %148, %146
  %159 = icmp eq ptr %127, null
  br i1 %159, label %170, label %160

160:                                              ; preds = %158
  %161 = getelementptr inbounds nuw i8, ptr %93, i32 11
  %162 = load i16, ptr %161, align 1
  %163 = call zeroext i16 @MnmFile_PargeArgument(ptr noundef nonnull %127, i16 noundef zeroext %162, ptr noundef nonnull %8)
  %164 = icmp eq i16 %163, 0
  br i1 %164, label %170, label %165

165:                                              ; preds = %160
  %166 = zext nneg i16 %163 to i32
  %167 = load ptr, ptr %31, align 1
  call void @Errorlog_Add(i32 noundef %37, i32 noundef 6, ptr noundef %167) #15
  %168 = load ptr, ptr %31, align 1
  call void @Errorlog_Add(i32 noundef %37, i32 noundef %166, ptr noundef %168) #15
  %169 = add nsw i32 %35, 2
  br label %98

170:                                              ; preds = %160, %158
  %171 = getelementptr inbounds nuw i8, ptr %93, i32 4
  %172 = load i16, ptr %171, align 1
  %173 = icmp eq i16 %172, 32
  br i1 %173, label %176, label %174

174:                                              ; preds = %170
  %175 = load ptr, ptr %7, align 4
  br label %182

176:                                              ; preds = %170
  %177 = call ptr @Rtedge_GetStructureName(ptr noundef %111) #15
  %178 = call ptr @Variable_Search(ptr noundef %177) #15
  store ptr %178, ptr %7, align 4
  %179 = icmp eq ptr %178, null
  br i1 %179, label %180, label %182

180:                                              ; preds = %176
  %181 = load ptr, ptr %31, align 1
  call void @Errorlog_Add(i32 noundef %37, i32 noundef 8195, ptr noundef %181) #15
  store ptr @_Variable_Zero_FUNCTION, ptr %7, align 4
  br label %182

182:                                              ; preds = %174, %176, %180
  %183 = phi ptr [ %175, %174 ], [ %178, %176 ], [ @_Variable_Zero_FUNCTION, %180 ]
  %184 = load ptr, ptr %8, align 4
  %185 = load ptr, ptr %6, align 4
  %186 = call ptr @Logic_Add(ptr noundef nonnull %93, ptr noundef %185, ptr noundef %183, ptr noundef %184) #15
  %187 = load i16, ptr %171, align 1
  switch i16 %187, label %98 [
    i16 39, label %188
    i16 35, label %189
  ]

188:                                              ; preds = %182
  br label %189

189:                                              ; preds = %98, %182, %188, %29
  %190 = phi i32 [ %35, %182 ], [ 0, %29 ], [ %99, %98 ], [ %35, %188 ]
  %191 = phi i1 [ false, %182 ], [ true, %29 ], [ true, %98 ], [ true, %188 ]
  %192 = phi i1 [ true, %182 ], [ true, %29 ], [ true, %98 ], [ false, %188 ]
  %193 = call i32 @fclose(ptr noundef nonnull %9)
  store i32 2, ptr @status_mnmfile, align 4
  %194 = call ptr @Scope_get() #15
  %195 = load i8, ptr %194, align 1
  %196 = icmp eq i8 %195, 0
  br i1 %196, label %201, label %197

197:                                              ; preds = %189
  br i1 %191, label %198, label %205

198:                                              ; preds = %197
  %199 = call ptr @Instruction_GetTemplate(ptr noundef nonnull @"??_C@_03BHDJDALB@RET?$AA@") #15
  %200 = call ptr @Logic_Add(ptr noundef %199, ptr noundef nonnull @VARIANT_EMPTY, ptr noundef nonnull @VARIANT_EMPTY, ptr noundef nonnull @VARIANT_EMPTY) #15
  br label %205

201:                                              ; preds = %189
  br i1 %192, label %202, label %205

202:                                              ; preds = %201
  %203 = call ptr @Instruction_GetTemplate(ptr noundef nonnull @"??_C@_03JMGAKCCH@END?$AA@") #15
  %204 = call ptr @Logic_Add(ptr noundef %203, ptr noundef nonnull @VARIANT_EMPTY, ptr noundef nonnull @VARIANT_EMPTY, ptr noundef nonnull @VARIANT_EMPTY) #15
  br label %205

205:                                              ; preds = %198, %197, %202, %201, %11
  %206 = phi i32 [ 1, %11 ], [ %190, %197 ], [ %190, %198 ], [ %190, %201 ], [ %190, %202 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %8) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %7) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #15
  ret i32 %206
}

declare dso_local void @Errorlog_Add(i32 noundef, i32 noundef, ptr noundef) local_unnamed_addr #1

declare dso_local ptr @Instruction_GetTemplate(ptr noundef) local_unnamed_addr #1

declare dso_local ptr @Logic_Add(ptr noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #1

declare dso_local ptr @Label_Add(ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #1

declare dso_local zeroext i8 @Reservedword_Check(ptr noundef) local_unnamed_addr #1

declare dso_local ptr @Rtedge_GetStructureName(ptr noundef) local_unnamed_addr #1

declare dso_local ptr @Scope_get() local_unnamed_addr #1

; Function Attrs: nofree nounwind
define dso_local range(i32 -1, 64) i32 @MnmFile_BitArgument(ptr noundef %0, i16 noundef zeroext %1) local_unnamed_addr #4 {
  %3 = alloca i32, align 4
  %4 = icmp eq ptr %0, null
  br i1 %4, label %17, label %5

5:                                                ; preds = %2
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #15
  store i32 -1, ptr %3, align 4
  %6 = tail call ptr @strrchr(ptr noundef nonnull dereferenceable(1) %0, i32 noundef 46) #15
  %7 = icmp eq ptr %6, null
  br i1 %7, label %15, label %8

8:                                                ; preds = %5
  %9 = call i32 (ptr, ptr, ...) @sscanf(ptr noundef nonnull %6, ptr noundef nonnull @"??_C@_04HGICJEGC@?4X?$CFd?$AA@", ptr noundef nonnull %3)
  %10 = icmp eq i32 %9, 1
  %11 = load i32, ptr %3, align 4
  %12 = icmp ult i32 %11, 64
  %13 = select i1 %10, i1 %12, i1 false
  br i1 %13, label %14, label %15

14:                                               ; preds = %8
  store i8 0, ptr %6, align 1
  br label %15

15:                                               ; preds = %5, %8, %14
  %16 = phi i32 [ %11, %14 ], [ -1, %8 ], [ -1, %5 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #15
  br label %17

17:                                               ; preds = %2, %15
  %18 = phi i32 [ %16, %15 ], [ -1, %2 ]
  ret i32 %18
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @sscanf(ptr noundef readonly captures(none), ptr noundef readonly captures(none), ...) local_unnamed_addr #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: read)
declare ptr @strchr(ptr, i32) local_unnamed_addr #14

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree norecurse nounwind willreturn "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { mustprogress nocallback nofree nounwind willreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #10 = { mustprogress nofree nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { nocallback nofree nounwind willreturn memory(argmem: read) }
attributes #15 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\mnmfile.c", directory: "C:\\D_DRV\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
