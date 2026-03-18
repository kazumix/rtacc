; ModuleID = '..\PLCP\rtedge.c'
source_filename = "..\\PLCP\\rtedge.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.TYPEMATCH = type <{ ptr, i16, i32, i32 }>

$LibVersion_0x0701 = comdat any

$"??_C@_00CNPNBAHC@?$AA@" = comdat any

$"??_C@_07DCPMEJPJ@STRING?$CD?$AA@" = comdat any

$"??_C@_0CG@DCLCJKIA@Rtedge_TagCreate?3zero?5clear?5temp@" = comdat any

$"??_C@_0CO@JPBCBDJ@Rtedge_TagCreateByInstruction?3cl@" = comdat any

$"??_C@_04KOACHJEN@Type?$AA@" = comdat any

$"??_C@_06CLBDIDBH@Source?$AA@" = comdat any

$"??_C@_05HKHPEFOF@Entry?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@"??_C@_00CNPNBAHC@?$AA@" = linkonce_odr dso_local unnamed_addr constant [1 x i8] zeroinitializer, comdat, align 1
@"??_C@_07DCPMEJPJ@STRING?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"STRING#\00", comdat, align 1
@"??_C@_0CG@DCLCJKIA@Rtedge_TagCreate?3zero?5clear?5temp@" = linkonce_odr dso_local unnamed_addr constant [38 x i8] c"Rtedge_TagCreate:zero clear temporary\00", comdat, align 1
@typematch = external dso_local local_unnamed_addr global [0 x %struct.TYPEMATCH], align 1
@"??_C@_0CO@JPBCBDJ@Rtedge_TagCreateByInstruction?3cl@" = linkonce_odr dso_local unnamed_addr constant [46 x i8] c"Rtedge_TagCreateByInstruction:clone temporary\00", comdat, align 1
@"??_C@_04KOACHJEN@Type?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"Type\00", comdat, align 1
@Rtedge_TagGetIecType.source = internal global [600 x i8] zeroinitializer, align 1
@"??_C@_06CLBDIDBH@Source?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"Source\00", comdat, align 1
@"??_C@_05HKHPEFOF@Entry?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"Entry\00", comdat, align 1
@Rtedge_GetStructureName.name = internal global [600 x i8] zeroinitializer, align 1
@__const.Rtedge_GetStructureName.tag1 = private unnamed_addr constant [8 x i8] c"STRUCT#\00", align 1
@__const.Rtedge_GetStructureName.tag2 = private unnamed_addr constant [10 x i8] c"FUNCTION#\00", align 1
@Rtedge_GetArrayName.name = internal global [600 x i8] zeroinitializer, align 1
@__const.Rtedge_GetArrayName.tag = private unnamed_addr constant [7 x i8] c"ARRAY#\00", align 1

; Function Attrs: nounwind
define dso_local zeroext range(i8 0, 2) i8 @Rtedge_TagCreate(ptr noundef %0, i16 noundef zeroext %1, ptr noundef %2, ptr noundef %3) local_unnamed_addr #0 {
  %5 = alloca i16, align 2
  %6 = alloca [49 x i8], align 1
  %7 = alloca i16, align 2
  %8 = add i16 %1, -1058
  %9 = icmp ult i16 %8, 3
  %10 = icmp eq i16 %1, 1346
  %11 = or i1 %10, %9
  %12 = icmp eq ptr %0, null
  br i1 %12, label %22, label %13

13:                                               ; preds = %4
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #9
  %14 = call i32 @EgTagGetProperty(ptr noundef nonnull %0, ptr noundef nonnull @"??_C@_04KOACHJEN@Type?$AA@", ptr noundef nonnull %5, i32 noundef 2) #9
  %15 = icmp eq i32 %14, 0
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #9
  br i1 %15, label %16, label %22

16:                                               ; preds = %13
  %17 = call zeroext i16 @Rtedge_TagGetIecType(ptr noundef nonnull %0)
  %18 = icmp eq i16 %1, %17
  %19 = icmp eq i16 %17, 1058
  %20 = and i1 %11, %19
  %21 = or i1 %18, %20
  br i1 %21, label %68, label %22

22:                                               ; preds = %4, %16, %13
  %23 = load ptr, ptr @typematch, align 1
  %24 = icmp eq ptr %23, null
  br i1 %24, label %38, label %25

25:                                               ; preds = %22, %34
  %26 = phi ptr [ %35, %34 ], [ @typematch, %22 ]
  %27 = getelementptr inbounds nuw i8, ptr %26, i32 4
  %28 = load i16, ptr %27, align 1
  %29 = icmp eq i16 %1, %28
  br i1 %29, label %30, label %34

30:                                               ; preds = %25
  %31 = getelementptr inbounds nuw i8, ptr %26, i32 6
  %32 = load i32, ptr %31, align 1
  %33 = trunc i32 %32 to i16
  br label %38

34:                                               ; preds = %25
  %35 = getelementptr inbounds nuw i8, ptr %26, i32 14
  %36 = load ptr, ptr %35, align 1
  %37 = icmp eq ptr %36, null
  br i1 %37, label %38, label %25, !llvm.loop !7

38:                                               ; preds = %34, %22, %30
  %39 = phi i16 [ %33, %30 ], [ 99, %22 ], [ 99, %34 ]
  switch i16 %1, label %40 [
    i16 1346, label %47
    i16 1060, label %47
    i16 1059, label %47
    i16 1058, label %47
  ]

40:                                               ; preds = %38
  %41 = icmp eq ptr %2, null
  %42 = select i1 %41, ptr @"??_C@_00CNPNBAHC@?$AA@", ptr %2
  %43 = icmp eq ptr %3, null
  %44 = select i1 %43, ptr @"??_C@_00CNPNBAHC@?$AA@", ptr %3
  %45 = call i32 @EgTagCreateEx(ptr noundef %0, i16 noundef zeroext %39, ptr noundef nonnull %44, ptr noundef nonnull %42) #9
  %46 = icmp eq i32 %45, 0
  br label %65

47:                                               ; preds = %38, %38, %38, %38
  call void @llvm.lifetime.start.p0(ptr nonnull %6) #9
  call void @llvm.lifetime.start.p0(ptr nonnull %7) #9
  %48 = icmp eq ptr %2, null
  %49 = ptrtoint ptr %2 to i32
  %50 = trunc i32 %49 to i16
  %51 = select i1 %48, i16 1, i16 %50
  %52 = icmp eq ptr %3, null
  %53 = select i1 %52, ptr @"??_C@_00CNPNBAHC@?$AA@", ptr %3
  %54 = select i1 %10, ptr @"??_C@_07DCPMEJPJ@STRING?$CD?$AA@", ptr %53
  %55 = select i1 %10, i16 83, i16 %51
  %56 = call i32 @EgTagCreateSegment(ptr noundef %0, i16 noundef zeroext %39, i16 noundef zeroext %55, ptr noundef nonnull %54, ptr noundef nonnull @"??_C@_00CNPNBAHC@?$AA@", ptr noundef nonnull %6, i16 noundef zeroext 49, ptr noundef nonnull %7) #9
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %58, label %64

58:                                               ; preds = %47
  %59 = zext i16 %55 to i32
  %60 = call ptr @Heap_Alloc(i32 noundef %59, ptr noundef nonnull @"??_C@_0CG@DCLCJKIA@Rtedge_TagCreate?3zero?5clear?5temp@") #9
  %61 = icmp eq ptr %60, null
  br i1 %61, label %64, label %62

62:                                               ; preds = %58
  %63 = call i32 @EgTagWriteSegment(ptr noundef %0, i16 noundef zeroext 0, ptr noundef nonnull %60, i16 noundef zeroext %55) #9
  call void @Heap_Free(ptr noundef nonnull %60) #9
  br label %64

64:                                               ; preds = %58, %62, %47
  call void @llvm.lifetime.end.p0(ptr nonnull %7) #9
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #9
  br label %65

65:                                               ; preds = %64, %40
  %66 = phi i1 [ %57, %64 ], [ %46, %40 ]
  %67 = zext i1 %66 to i8
  br label %68

68:                                               ; preds = %16, %65
  %69 = phi i8 [ %67, %65 ], [ 1, %16 ]
  ret i8 %69
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: nounwind
define dso_local zeroext range(i8 0, 2) i8 @Rtedge_TagIsExist(ptr noundef %0) local_unnamed_addr #0 {
  %2 = alloca i16, align 2
  %3 = icmp eq ptr %0, null
  br i1 %3, label %8, label %4

4:                                                ; preds = %1
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #9
  %5 = call i32 @EgTagGetProperty(ptr noundef nonnull %0, ptr noundef nonnull @"??_C@_04KOACHJEN@Type?$AA@", ptr noundef nonnull %2, i32 noundef 2) #9
  %6 = icmp eq i32 %5, 0
  %7 = zext i1 %6 to i8
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #9
  br label %8

8:                                                ; preds = %1, %4
  %9 = phi i8 [ %7, %4 ], [ 0, %1 ]
  ret i8 %9
}

; Function Attrs: nounwind
define dso_local zeroext i16 @Rtedge_TagGetIecType(ptr noundef %0) local_unnamed_addr #0 {
  %2 = alloca i16, align 2
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #9
  %3 = call i32 @EgTagGetProperty(ptr noundef %0, ptr noundef nonnull @"??_C@_04KOACHJEN@Type?$AA@", ptr noundef nonnull %2, i32 noundef 2) #9
  %4 = load ptr, ptr @typematch, align 1
  %5 = icmp eq ptr %4, null
  br i1 %5, label %21, label %6

6:                                                ; preds = %1
  %7 = load i16, ptr %2, align 2
  %8 = zext i16 %7 to i32
  br label %9

9:                                                ; preds = %17, %6
  %10 = phi ptr [ @typematch, %6 ], [ %18, %17 ]
  %11 = getelementptr inbounds nuw i8, ptr %10, i32 6
  %12 = load i32, ptr %11, align 1
  %13 = icmp eq i32 %12, %8
  br i1 %13, label %14, label %17

14:                                               ; preds = %9
  %15 = getelementptr inbounds nuw i8, ptr %10, i32 4
  %16 = load i16, ptr %15, align 1
  br label %21

17:                                               ; preds = %9
  %18 = getelementptr inbounds nuw i8, ptr %10, i32 14
  %19 = load ptr, ptr %18, align 1
  %20 = icmp eq ptr %19, null
  br i1 %20, label %21, label %9, !llvm.loop !9

21:                                               ; preds = %17, %1, %14
  %22 = phi i16 [ %16, %14 ], [ 0, %1 ], [ 0, %17 ]
  %23 = call i32 @EgTagGetProperty(ptr noundef %0, ptr noundef nonnull @"??_C@_06CLBDIDBH@Source?$AA@", ptr noundef nonnull @Rtedge_TagGetIecType.source, i32 noundef 600) #9
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %41

25:                                               ; preds = %21
  %26 = load ptr, ptr @typematch, align 1
  %27 = icmp eq ptr %26, null
  br i1 %27, label %41, label %28

28:                                               ; preds = %25, %37
  %29 = phi ptr [ %39, %37 ], [ %26, %25 ]
  %30 = phi ptr [ %38, %37 ], [ @typematch, %25 ]
  %31 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %29) #9
  %32 = call i32 @strncmp(ptr noundef nonnull @Rtedge_TagGetIecType.source, ptr noundef nonnull %29, i32 noundef %31) #9
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %37

34:                                               ; preds = %28
  %35 = getelementptr inbounds nuw i8, ptr %30, i32 4
  %36 = load i16, ptr %35, align 1
  br label %41

37:                                               ; preds = %28
  %38 = getelementptr inbounds nuw i8, ptr %30, i32 14
  %39 = load ptr, ptr %38, align 1
  %40 = icmp eq ptr %39, null
  br i1 %40, label %41, label %28, !llvm.loop !10

41:                                               ; preds = %37, %25, %21, %34
  %42 = phi i16 [ %22, %21 ], [ %36, %34 ], [ %22, %25 ], [ %22, %37 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #9
  ret i16 %42
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local zeroext i16 @Rtedge_ConvertToEdgeType(i16 noundef zeroext %0) local_unnamed_addr #2 {
  %2 = load ptr, ptr @typematch, align 1
  %3 = icmp eq ptr %2, null
  br i1 %3, label %17, label %4

4:                                                ; preds = %1, %13
  %5 = phi ptr [ %14, %13 ], [ @typematch, %1 ]
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 4
  %7 = load i16, ptr %6, align 1
  %8 = icmp eq i16 %0, %7
  br i1 %8, label %9, label %13

9:                                                ; preds = %4
  %10 = getelementptr inbounds nuw i8, ptr %5, i32 6
  %11 = load i32, ptr %10, align 1
  %12 = trunc i32 %11 to i16
  br label %17

13:                                               ; preds = %4
  %14 = getelementptr inbounds nuw i8, ptr %5, i32 14
  %15 = load ptr, ptr %14, align 1
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %4, !llvm.loop !7

17:                                               ; preds = %13, %1, %9
  %18 = phi i16 [ %12, %9 ], [ 99, %1 ], [ 99, %13 ]
  ret i16 %18
}

declare dllimport i32 @EgTagCreateEx(ptr noundef, i16 noundef zeroext, ptr noundef, ptr noundef) local_unnamed_addr #3

declare dllimport i32 @EgTagCreateSegment(ptr noundef, i16 noundef zeroext, i16 noundef zeroext, ptr noundef, ptr noundef, ptr noundef, i16 noundef zeroext, ptr noundef) local_unnamed_addr #3

declare dso_local ptr @Heap_Alloc(i32 noundef, ptr noundef) local_unnamed_addr #3

declare dllimport i32 @EgTagWriteSegment(ptr noundef, i16 noundef zeroext, ptr noundef, i16 noundef zeroext) local_unnamed_addr #3

declare dso_local void @Heap_Free(ptr noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: nounwind
define dso_local zeroext range(i8 0, 2) i8 @Rtedge_TagCreateByInstruction(ptr noundef readonly captures(address_is_null) %0, i8 noundef zeroext %1) local_unnamed_addr #0 {
  %3 = icmp eq ptr %0, null
  br i1 %3, label %61, label %4

4:                                                ; preds = %2
  %5 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %0) #9
  %6 = add i32 %5, 1
  %7 = load ptr, ptr @typematch, align 1
  %8 = icmp eq ptr %7, null
  br i1 %8, label %61, label %9

9:                                                ; preds = %4, %57
  %10 = phi ptr [ %59, %57 ], [ %7, %4 ]
  %11 = phi ptr [ %58, %57 ], [ @typematch, %4 ]
  %12 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %10) #9
  %13 = tail call i32 @strncmp(ptr noundef nonnull %0, ptr noundef nonnull %10, i32 noundef %12) #9
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %57

15:                                               ; preds = %9
  %16 = tail call ptr @Heap_Alloc(i32 noundef %6, ptr noundef nonnull @"??_C@_0CO@JPBCBDJ@Rtedge_TagCreateByInstruction?3cl@") #9
  %17 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %16, ptr noundef nonnull dereferenceable(1) %0) #9
  %18 = getelementptr inbounds nuw i8, ptr %11, i32 4
  %19 = load i16, ptr %18, align 1
  switch i16 %19, label %41 [
    i16 1059, label %20
    i16 1346, label %27
  ]

20:                                               ; preds = %15
  %21 = tail call ptr @strrchr(ptr noundef nonnull dereferenceable(1) %16, i32 noundef 35) #9
  store i8 0, ptr %21, align 1
  %22 = getelementptr inbounds nuw i8, ptr %21, i32 1
  %23 = getelementptr inbounds nuw i8, ptr %16, i32 %12
  %24 = tail call i32 @Functionblock_GetSize(ptr noundef nonnull %23) #9
  %25 = inttoptr i32 %24 to ptr
  %26 = tail call zeroext i8 @Rtedge_TagCreate(ptr noundef nonnull %22, i16 noundef zeroext 1059, ptr noundef %25, ptr noundef nonnull %16)
  tail call void @Functionblock_Register(ptr noundef nonnull %22) #9
  br label %55

27:                                               ; preds = %15
  %28 = getelementptr inbounds nuw i8, ptr %16, i32 %12
  %29 = tail call ptr @Variable_Search(ptr noundef nonnull %28) #9
  %30 = icmp eq ptr %29, null
  br i1 %30, label %31, label %33

31:                                               ; preds = %27
  %32 = tail call ptr @Variable_Add(ptr noundef nonnull %28, i16 noundef zeroext 1346) #9
  br label %33

33:                                               ; preds = %31, %27
  %34 = phi ptr [ %32, %31 ], [ %29, %27 ]
  %35 = icmp eq i8 %1, 0
  br i1 %35, label %36, label %39

36:                                               ; preds = %33
  %37 = tail call zeroext i8 @Rtedge_TagCreate(ptr noundef nonnull %28, i16 noundef zeroext 1346, ptr noundef nonnull inttoptr (i32 83 to ptr), ptr noundef nonnull @"??_C@_07DCPMEJPJ@STRING?$CD?$AA@")
  %38 = tail call ptr @Variable_LinkBody(ptr noundef %34, ptr noundef nonnull %28) #9
  br label %55

39:                                               ; preds = %33
  %40 = tail call ptr @Variable_Body(i32 noundef 83) #9
  store ptr %40, ptr %34, align 1
  br label %55

41:                                               ; preds = %15
  %42 = getelementptr inbounds nuw i8, ptr %16, i32 %12
  %43 = tail call ptr @Variable_Search(ptr noundef nonnull %42) #9
  %44 = icmp eq ptr %43, null
  br i1 %44, label %45, label %47

45:                                               ; preds = %41
  %46 = tail call ptr @Variable_Add(ptr noundef nonnull %42, i16 noundef zeroext %19) #9
  br label %47

47:                                               ; preds = %45, %41
  %48 = phi ptr [ %46, %45 ], [ %43, %41 ]
  %49 = icmp eq i8 %1, 0
  br i1 %49, label %50, label %53

50:                                               ; preds = %47
  %51 = tail call zeroext i8 @Rtedge_TagCreate(ptr noundef nonnull %42, i16 noundef zeroext %19, ptr noundef null, ptr noundef null)
  %52 = tail call ptr @Variable_LinkBody(ptr noundef %48, ptr noundef nonnull %42) #9
  br label %55

53:                                               ; preds = %47
  %54 = tail call ptr @Variable_Body(i32 noundef 8) #9
  store ptr %54, ptr %48, align 1
  br label %55

55:                                               ; preds = %50, %53, %36, %39, %20
  %56 = phi i8 [ %26, %20 ], [ %37, %36 ], [ 0, %39 ], [ 0, %53 ], [ %51, %50 ]
  tail call void @Heap_Free(ptr noundef nonnull %16) #9
  br label %61

57:                                               ; preds = %9
  %58 = getelementptr inbounds nuw i8, ptr %11, i32 14
  %59 = load ptr, ptr %58, align 1
  %60 = icmp eq ptr %59, null
  br i1 %60, label %61, label %9, !llvm.loop !11

61:                                               ; preds = %57, %4, %55, %2
  %62 = phi i8 [ 0, %2 ], [ %56, %55 ], [ 0, %4 ], [ 0, %57 ]
  ret i8 %62
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strlen(ptr noundef captures(none)) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strncmp(ptr noundef captures(none), ptr noundef captures(none), i32 noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none)) local_unnamed_addr #5

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local ptr @strrchr(ptr noundef, i32 noundef) local_unnamed_addr #4

declare dso_local i32 @Functionblock_GetSize(ptr noundef) local_unnamed_addr #3

declare dso_local void @Functionblock_Register(ptr noundef) local_unnamed_addr #3

declare dso_local ptr @Variable_Search(ptr noundef) local_unnamed_addr #3

declare dso_local ptr @Variable_Add(ptr noundef, i16 noundef zeroext) local_unnamed_addr #3

declare dso_local ptr @Variable_LinkBody(ptr noundef, ptr noundef) local_unnamed_addr #3

declare dso_local ptr @Variable_Body(i32 noundef) local_unnamed_addr #3

declare dllimport i32 @EgTagGetProperty(ptr noundef, ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local zeroext i16 @Rtedge_ConvertToIecType(i16 noundef zeroext %0) local_unnamed_addr #2 {
  %2 = load ptr, ptr @typematch, align 1
  %3 = icmp eq ptr %2, null
  br i1 %3, label %18, label %4

4:                                                ; preds = %1
  %5 = zext i16 %0 to i32
  br label %6

6:                                                ; preds = %4, %14
  %7 = phi ptr [ @typematch, %4 ], [ %15, %14 ]
  %8 = getelementptr inbounds nuw i8, ptr %7, i32 6
  %9 = load i32, ptr %8, align 1
  %10 = icmp eq i32 %9, %5
  br i1 %10, label %11, label %14

11:                                               ; preds = %6
  %12 = getelementptr inbounds nuw i8, ptr %7, i32 4
  %13 = load i16, ptr %12, align 1
  br label %18

14:                                               ; preds = %6
  %15 = getelementptr inbounds nuw i8, ptr %7, i32 14
  %16 = load ptr, ptr %15, align 1
  %17 = icmp eq ptr %16, null
  br i1 %17, label %18, label %6, !llvm.loop !9

18:                                               ; preds = %14, %1, %11
  %19 = phi i16 [ %13, %11 ], [ 0, %1 ], [ 0, %14 ]
  ret i16 %19
}

; Function Attrs: nounwind
define dso_local ptr @Rtedge_TagGetPointer(ptr noundef %0) local_unnamed_addr #0 {
  %2 = alloca ptr, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #9
  store ptr null, ptr %2, align 4
  %3 = call i32 @EgTagGetProperty(ptr noundef %0, ptr noundef nonnull @"??_C@_05HKHPEFOF@Entry?$AA@", ptr noundef nonnull %2, i32 noundef 4) #9
  %4 = icmp eq i32 %3, 0
  %5 = load ptr, ptr %2, align 4
  %6 = select i1 %4, ptr %5, ptr null
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #9
  ret ptr %6
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 65536) i32 @Rtedge_TypeSize(i16 noundef zeroext %0) local_unnamed_addr #2 {
  %2 = load ptr, ptr @typematch, align 1
  %3 = icmp eq ptr %2, null
  br i1 %3, label %19, label %4

4:                                                ; preds = %1, %15
  %5 = phi ptr [ %16, %15 ], [ @typematch, %1 ]
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 4
  %7 = load i16, ptr %6, align 1
  %8 = icmp eq i16 %0, %7
  br i1 %8, label %9, label %15

9:                                                ; preds = %4
  %10 = getelementptr inbounds nuw i8, ptr %5, i32 10
  %11 = load i32, ptr %10, align 1
  %12 = icmp eq i32 %11, -1
  %13 = and i32 %11, 65535
  %14 = select i1 %12, i32 0, i32 %13
  br label %19

15:                                               ; preds = %4
  %16 = getelementptr inbounds nuw i8, ptr %5, i32 14
  %17 = load ptr, ptr %16, align 1
  %18 = icmp eq ptr %17, null
  br i1 %18, label %19, label %4, !llvm.loop !12

19:                                               ; preds = %15, %1, %9
  %20 = phi i32 [ %14, %9 ], [ 0, %1 ], [ 0, %15 ]
  ret i32 %20
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local zeroext i16 @Rtedge_SizeOf(ptr noundef readonly captures(none) %0) local_unnamed_addr #6 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %3 = load i16, ptr %2, align 1
  %4 = load ptr, ptr @typematch, align 1
  %5 = icmp eq ptr %4, null
  br i1 %5, label %30, label %6

6:                                                ; preds = %1, %26
  %7 = phi ptr [ %27, %26 ], [ @typematch, %1 ]
  %8 = getelementptr inbounds nuw i8, ptr %7, i32 4
  %9 = load i16, ptr %8, align 1
  %10 = icmp eq i16 %3, %9
  br i1 %10, label %11, label %26

11:                                               ; preds = %6
  %12 = getelementptr inbounds nuw i8, ptr %7, i32 10
  %13 = load i32, ptr %12, align 1
  %14 = icmp eq i32 %13, -1
  br i1 %14, label %15, label %23

15:                                               ; preds = %11
  %16 = getelementptr inbounds nuw i8, ptr %0, i32 6
  %17 = load ptr, ptr %16, align 1
  %18 = icmp eq ptr %17, null
  br i1 %18, label %23, label %19

19:                                               ; preds = %15
  %20 = getelementptr inbounds nuw i8, ptr %17, i32 5
  %21 = load i16, ptr %20, align 1
  %22 = zext i16 %21 to i32
  br label %23

23:                                               ; preds = %15, %19, %11
  %24 = phi i32 [ %22, %19 ], [ %13, %11 ], [ 0, %15 ]
  %25 = trunc i32 %24 to i16
  br label %30

26:                                               ; preds = %6
  %27 = getelementptr inbounds nuw i8, ptr %7, i32 14
  %28 = load ptr, ptr %27, align 1
  %29 = icmp eq ptr %28, null
  br i1 %29, label %30, label %6, !llvm.loop !13

30:                                               ; preds = %26, %1, %23
  %31 = phi i16 [ %25, %23 ], [ 0, %1 ], [ 0, %26 ]
  ret i16 %31
}

; Function Attrs: nounwind
define dso_local ptr @Rtedge_GetStructureName(ptr noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @EgTagGetProperty(ptr noundef %0, ptr noundef nonnull @"??_C@_06CLBDIDBH@Source?$AA@", ptr noundef nonnull @Rtedge_GetStructureName.name, i32 noundef 600) #9
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %10

4:                                                ; preds = %1
  %5 = tail call i32 @memcmp(ptr noundef nonnull dereferenceable(7) @Rtedge_GetStructureName.name, ptr noundef nonnull dereferenceable(7) @__const.Rtedge_GetStructureName.tag1, i32 7)
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %11, label %7

7:                                                ; preds = %4
  %8 = tail call i32 @memcmp(ptr noundef nonnull dereferenceable(9) @Rtedge_GetStructureName.name, ptr noundef nonnull dereferenceable(9) @__const.Rtedge_GetStructureName.tag2, i32 9)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %11, label %10

10:                                               ; preds = %7, %1
  br label %11

11:                                               ; preds = %7, %4, %10
  %12 = phi ptr [ null, %10 ], [ getelementptr inbounds nuw (i8, ptr @Rtedge_GetStructureName.name, i32 7), %4 ], [ getelementptr inbounds nuw (i8, ptr @Rtedge_GetStructureName.name, i32 9), %7 ]
  ret ptr %12
}

; Function Attrs: nounwind
define dso_local zeroext range(i8 0, 2) i8 @Rtedge_IsStructure(ptr noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @EgTagGetProperty(ptr noundef %0, ptr noundef nonnull @"??_C@_06CLBDIDBH@Source?$AA@", ptr noundef nonnull @Rtedge_GetStructureName.name, i32 noundef 600) #9
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %10

4:                                                ; preds = %1
  %5 = tail call i32 @memcmp(ptr noundef nonnull dereferenceable(7) @Rtedge_GetStructureName.name, ptr noundef nonnull dereferenceable(7) @__const.Rtedge_GetStructureName.tag1, i32 7)
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %11, label %7

7:                                                ; preds = %4
  %8 = tail call i32 @memcmp(ptr noundef nonnull dereferenceable(9) @Rtedge_GetStructureName.name, ptr noundef nonnull dereferenceable(9) @__const.Rtedge_GetStructureName.tag2, i32 9)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %11, label %10

10:                                               ; preds = %7, %1
  br label %11

11:                                               ; preds = %4, %7, %10
  %12 = phi i8 [ 0, %10 ], [ 1, %4 ], [ 1, %7 ]
  ret i8 %12
}

; Function Attrs: nounwind
define dso_local ptr @Rtedge_GetArrayName(ptr noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @EgTagGetProperty(ptr noundef %0, ptr noundef nonnull @"??_C@_06CLBDIDBH@Source?$AA@", ptr noundef nonnull @Rtedge_GetArrayName.name, i32 noundef 600) #9
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %7

4:                                                ; preds = %1
  %5 = tail call i32 @memcmp(ptr noundef nonnull dereferenceable(6) @Rtedge_GetArrayName.name, ptr noundef nonnull dereferenceable(6) @__const.Rtedge_GetArrayName.tag, i32 6)
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %8, label %7

7:                                                ; preds = %4, %1
  br label %8

8:                                                ; preds = %4, %7
  %9 = phi ptr [ null, %7 ], [ getelementptr inbounds nuw (i8, ptr @Rtedge_GetArrayName.name, i32 6), %4 ]
  ret ptr %9
}

; Function Attrs: nounwind
define dso_local zeroext range(i8 0, 2) i8 @Rtedge_IsArray(ptr noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @EgTagGetProperty(ptr noundef %0, ptr noundef nonnull @"??_C@_06CLBDIDBH@Source?$AA@", ptr noundef nonnull @Rtedge_GetArrayName.name, i32 noundef 600) #9
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %7

4:                                                ; preds = %1
  %5 = tail call i32 @memcmp(ptr noundef nonnull dereferenceable(6) @Rtedge_GetArrayName.name, ptr noundef nonnull dereferenceable(6) @__const.Rtedge_GetArrayName.tag, i32 6)
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %8, label %7

7:                                                ; preds = %4, %1
  br label %8

8:                                                ; preds = %4, %7
  %9 = phi i8 [ 0, %7 ], [ 1, %4 ]
  ret i8 %9
}

; Function Attrs: nounwind
define dso_local ptr @Rtedge_Compile(ptr noundef %0) local_unnamed_addr #0 {
  %2 = alloca ptr, align 4
  %3 = alloca i16, align 2
  %4 = icmp eq ptr %0, null
  br i1 %4, label %30, label %5

5:                                                ; preds = %1
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #9
  %6 = call i32 @EgTagGetProperty(ptr noundef nonnull %0, ptr noundef nonnull @"??_C@_04KOACHJEN@Type?$AA@", ptr noundef nonnull %3, i32 noundef 2) #9
  %7 = icmp eq i32 %6, 0
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #9
  br i1 %7, label %8, label %30

8:                                                ; preds = %5
  %9 = call zeroext i16 @Rtedge_TagGetIecType(ptr noundef nonnull %0)
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #9
  store ptr null, ptr %2, align 4
  %10 = call i32 @EgTagGetProperty(ptr noundef nonnull %0, ptr noundef nonnull @"??_C@_05HKHPEFOF@Entry?$AA@", ptr noundef nonnull %2, i32 noundef 4) #9
  %11 = icmp eq i32 %10, 0
  %12 = load ptr, ptr %2, align 4
  %13 = select i1 %11, ptr %12, ptr null
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #9
  %14 = call ptr @Variable_Add(ptr noundef nonnull %0, i16 noundef zeroext %9) #9
  %15 = getelementptr inbounds nuw i8, ptr %14, i32 4
  store i16 %9, ptr %15, align 1
  %16 = getelementptr inbounds nuw i8, ptr %14, i32 6
  store ptr %13, ptr %16, align 1
  switch i16 %9, label %17 [
    i16 1346, label %21
    i16 1059, label %21
    i16 1058, label %21
  ]

17:                                               ; preds = %8
  %18 = getelementptr inbounds nuw i8, ptr %12, i32 385
  %19 = load i32, ptr %18, align 1
  %20 = icmp eq i32 %19, 1
  br i1 %20, label %21, label %26

21:                                               ; preds = %17, %8, %8, %8
  %22 = getelementptr inbounds nuw i8, ptr %12, i32 23
  %23 = load i64, ptr %22, align 1
  %24 = trunc i64 %23 to i32
  %25 = inttoptr i32 %24 to ptr
  br label %28

26:                                               ; preds = %17
  %27 = getelementptr inbounds nuw i8, ptr %13, i32 15
  br label %28

28:                                               ; preds = %21, %26
  %29 = phi ptr [ %25, %21 ], [ %27, %26 ]
  store ptr %29, ptr %14, align 1
  br label %30

30:                                               ; preds = %1, %5, %28
  %31 = phi ptr [ %14, %28 ], [ null, %5 ], [ null, %1 ]
  ret ptr %31
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define dso_local ptr @Rtedge_GetPointer(ptr noundef readonly captures(ret: address, provenance) %0, i16 noundef zeroext %1) local_unnamed_addr #7 {
  switch i16 %1, label %3 [
    i16 1346, label %7
    i16 1059, label %7
    i16 1058, label %7
  ]

3:                                                ; preds = %2
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 385
  %5 = load i32, ptr %4, align 1
  %6 = icmp eq i32 %5, 1
  br i1 %6, label %7, label %12

7:                                                ; preds = %2, %2, %2, %3
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 23
  %9 = load i64, ptr %8, align 1
  %10 = trunc i64 %9 to i32
  %11 = inttoptr i32 %10 to ptr
  br label %14

12:                                               ; preds = %3
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 15
  br label %14

14:                                               ; preds = %12, %7
  %15 = phi ptr [ %11, %7 ], [ %13, %12 ]
  ret ptr %15
}

; Function Attrs: nounwind
define dso_local zeroext range(i8 0, 2) i8 @Rtedge_TagRead_UInt32(ptr noundef %0, ptr noundef %1) local_unnamed_addr #0 {
  %3 = tail call i32 @EgTagRead(ptr noundef %0, ptr noundef %1, i16 noundef zeroext 4) #9
  %4 = icmp eq i32 %3, 0
  %5 = zext i1 %4 to i8
  ret i8 %5
}

declare dllimport i32 @EgTagRead(ptr noundef, ptr noundef, i16 noundef zeroext) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local zeroext range(i8 0, 2) i8 @Rtedge_TagWrite_UInt32(ptr noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  store i32 %1, ptr %3, align 4
  %4 = call i32 @EgTagWrite(ptr noundef %0, ptr noundef nonnull %3, i16 noundef zeroext 4) #9
  %5 = icmp eq i32 %4, 0
  %6 = zext i1 %5 to i8
  ret i8 %6
}

declare dllimport i32 @EgTagWrite(ptr noundef, ptr noundef, i16 noundef zeroext) local_unnamed_addr #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define dso_local zeroext range(i8 0, 2) i8 @Rtedge_IsDirectMemory(ptr noundef readonly captures(none) %0) local_unnamed_addr #7 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 385
  %3 = load i32, ptr %2, align 1
  %4 = icmp eq i32 %3, 1
  %5 = zext i1 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind
define dso_local zeroext range(i8 0, 2) i8 @Rtedge_SetTagDefaultValue() local_unnamed_addr #0 {
  %1 = tail call i32 @EgTagSetDefaultValue() #9
  %2 = icmp eq i32 %1, 0
  %3 = zext i1 %2 to i8
  ret i8 %3
}

declare dllimport i32 @EgTagSetDefaultValue(...) local_unnamed_addr #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: read)
declare i32 @memcmp(ptr captures(none), ptr captures(none), i32) local_unnamed_addr #8

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nofree norecurse nosync nounwind memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree norecurse nosync nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nocallback nofree nounwind willreturn memory(argmem: read) }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\rtedge.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
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
