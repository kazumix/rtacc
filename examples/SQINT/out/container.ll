; ModuleID = '..\PLCP\container.c'
source_filename = "..\\PLCP\\container.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.T_ANY = type <{ %union.PANYVAL, i16, ptr, i8, i8, %struct.BITFIELD }>
%union.PANYVAL = type { ptr }
%struct.BITFIELD = type { i8, i8, i8 }
%struct._tag_event_info = type { i32, i32, i32 }
%struct.tEdgeConfig = type { i8, i8, i16, ptr, [261 x i8], i8, [2 x i8], ptr }

$LibVersion_0x0701 = comdat any

$"??_C@_03LHGCEHCD@PLC?$AA@" = comdat any

$"??_C@_07NFKFJBIP@?$CFs_?$CF03d?$AA@" = comdat any

$"??_C@_04KOACHJEN@Type?$AA@" = comdat any

$"??_C@_05FNNGFGLF@Index?$AA@" = comdat any

$"??_C@_00CNPNBAHC@?$AA@" = comdat any

$"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@" = comdat any

$"??_C@_04LBABLPF@Exit?$AA@" = comdat any

$"??_C@_06HHNOBIIB@Notify?$AA@" = comdat any

$"??_C@_0BJ@OPOGIFPF@EM_SERVICE_RUN?5recieved?4?$AA@" = comdat any

$"??_C@_03GOLGPOF@DBG?$AA@" = comdat any

$"??_C@_0BL@DPPAKCHP@EM_SERVICE_PAUSE?5recieved?4?$AA@" = comdat any

$"??_C@_0BK@LMHOIIID@EM_SERVICE_STOP?5recieved?4?$AA@" = comdat any

$"??_C@_04KGFMLCPK@Main?$AA@" = comdat any

$"??_C@_05HKHPEFOF@Entry?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@"??_C@_03LHGCEHCD@PLC?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"PLC\00", comdat, align 1
@"??_C@_07NFKFJBIP@?$CFs_?$CF03d?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"%s_%03d\00", comdat, align 1
@"??_C@_04KOACHJEN@Type?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"Type\00", comdat, align 1
@"??_C@_05FNNGFGLF@Index?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"Index\00", comdat, align 1
@"??_C@_00CNPNBAHC@?$AA@" = linkonce_odr dso_local unnamed_addr constant [1 x i8] zeroinitializer, comdat, align 1
@ServiceRealName = external dllimport global [25 x i8], align 1
@"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"SERVICE.%s.%s\00", comdat, align 1
@_ContainerTagName = internal global [128 x i8] zeroinitializer, align 1
@_ModuleName = internal global [128 x i8] zeroinitializer, align 1
@"Container_Log$.messBuff" = internal unnamed_addr global ptr null, align 4
@hExitEvent = dso_local local_unnamed_addr global i16 0, align 2
@"??_C@_04LBABLPF@Exit?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"Exit\00", comdat, align 1
@"??_C@_06HHNOBIIB@Notify?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"Notify\00", comdat, align 1
@"??_C@_0BJ@OPOGIFPF@EM_SERVICE_RUN?5recieved?4?$AA@" = linkonce_odr dso_local unnamed_addr constant [25 x i8] c"EM_SERVICE_RUN recieved.\00", comdat, align 1
@"??_C@_03GOLGPOF@DBG?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"DBG\00", comdat, align 1
@"??_C@_0BL@DPPAKCHP@EM_SERVICE_PAUSE?5recieved?4?$AA@" = linkonce_odr dso_local unnamed_addr constant [27 x i8] c"EM_SERVICE_PAUSE recieved.\00", comdat, align 1
@"??_C@_0BK@LMHOIIID@EM_SERVICE_STOP?5recieved?4?$AA@" = linkonce_odr dso_local unnamed_addr constant [26 x i8] c"EM_SERVICE_STOP recieved.\00", comdat, align 1
@catalogProc = internal global [12 x i8] zeroinitializer, align 1
@"??_C@_04KGFMLCPK@Main?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"Main\00", comdat, align 1
@Container_CreateTagsFromList.dummy = internal global %struct.T_ANY zeroinitializer, align 1
@"??_C@_05HKHPEFOF@Entry?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"Entry\00", comdat, align 1
@switch.table.Container_TagCreate = private unnamed_addr constant [7 x i16] [i16 1, i16 0, i16 1, i16 2, i16 2, i16 4, i16 4], align 2

; Function Attrs: nounwind
define dso_local zeroext range(i8 0, 2) i8 @Container_Set_Catalogname(i16 noundef zeroext %0, ptr noundef %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %6, %2
  %4 = phi i32 [ 0, %2 ], [ %7, %6 ]
  %5 = icmp eq i32 %4, 128
  br i1 %5, label %11, label %6

6:                                                ; preds = %3
  %7 = add nuw nsw i32 %4, 1
  %8 = tail call i32 (ptr, ptr, ...) @sprintf(ptr noundef nonnull dereferenceable(1) %1, ptr noundef nonnull dereferenceable(1) @"??_C@_07NFKFJBIP@?$CFs_?$CF03d?$AA@", ptr noundef nonnull @"??_C@_03LHGCEHCD@PLC?$AA@", i32 noundef %7) #12
  %9 = tail call zeroext i16 @LookupRtHandle(i16 noundef zeroext %0, ptr noundef nonnull %1, i32 noundef 0) #12
  %10 = icmp eq i16 %9, -1
  br i1 %10, label %11, label %3, !llvm.loop !7

11:                                               ; preds = %3, %6
  %12 = phi i8 [ 1, %6 ], [ 0, %3 ]
  ret i8 %12
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @sprintf(ptr noalias noundef writeonly captures(none), ptr noundef readonly captures(none), ...) local_unnamed_addr #2

declare dso_local zeroext i16 @LookupRtHandle(i16 noundef zeroext, ptr noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: nounwind
define dso_local zeroext range(i8 0, 2) i8 @Container_TagCheck(ptr noundef %0) local_unnamed_addr #0 {
  %2 = alloca i16, align 2
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #12
  %3 = call i32 @EgTagGetProperty(ptr noundef %0, ptr noundef nonnull @"??_C@_04KOACHJEN@Type?$AA@", ptr noundef nonnull %2, i32 noundef 2) #12
  %4 = icmp eq i32 %3, 0
  %5 = zext i1 %4 to i8
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #12
  ret i8 %5
}

declare dllimport i32 @EgTagGetProperty(ptr noundef, ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local zeroext range(i16 0, 5) i16 @Container_TagSize(i32 noundef %0) local_unnamed_addr #4 {
  %2 = add i32 %0, -1
  %3 = icmp ult i32 %2, 7
  br i1 %3, label %4, label %7

4:                                                ; preds = %1
  %5 = getelementptr inbounds nuw i16, ptr @switch.table.Container_TagCreate, i32 %2
  %6 = load i16, ptr %5, align 2
  br label %7

7:                                                ; preds = %1, %4
  %8 = phi i16 [ %6, %4 ], [ 0, %1 ]
  ret i16 %8
}

; Function Attrs: nounwind
define dso_local ptr @Container_TagGetIndex(ptr noundef %0) local_unnamed_addr #0 {
  %2 = alloca ptr, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #12
  %3 = call i32 @EgTagGetProperty(ptr noundef %0, ptr noundef nonnull @"??_C@_05FNNGFGLF@Index?$AA@", ptr noundef nonnull %2, i32 noundef 4) #12
  %4 = icmp eq i32 %3, 0
  %5 = load ptr, ptr %2, align 4
  %6 = select i1 %4, ptr %5, ptr null
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #12
  ret ptr %6
}

; Function Attrs: nounwind
define dso_local zeroext range(i8 0, 2) i8 @Container_TagCreate(ptr noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4) local_unnamed_addr #0 {
  %6 = alloca i16, align 2
  %7 = alloca i32, align 4
  %8 = alloca [32 x i8], align 1
  %9 = alloca i16, align 2
  store i32 %2, ptr %7, align 4
  %10 = add i32 %1, -1
  %11 = icmp ult i32 %10, 7
  br i1 %11, label %12, label %15

12:                                               ; preds = %5
  %13 = getelementptr inbounds nuw i16, ptr @switch.table.Container_TagCreate, i32 %10
  %14 = load i16, ptr %13, align 2
  br label %15

15:                                               ; preds = %5, %12
  %16 = phi i16 [ %14, %12 ], [ 0, %5 ]
  call void @llvm.lifetime.start.p0(ptr nonnull %6) #12
  %17 = call i32 @EgTagGetProperty(ptr noundef %0, ptr noundef nonnull @"??_C@_04KOACHJEN@Type?$AA@", ptr noundef nonnull %6, i32 noundef 2) #12
  %18 = icmp eq i32 %17, 0
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #12
  br i1 %18, label %43, label %19

19:                                               ; preds = %15
  %20 = icmp eq i32 %1, 12
  br i1 %20, label %32, label %21

21:                                               ; preds = %19
  %22 = icmp eq ptr %4, null
  %23 = select i1 %22, ptr @"??_C@_00CNPNBAHC@?$AA@", ptr %4
  %24 = icmp eq ptr %3, null
  %25 = select i1 %24, ptr @"??_C@_00CNPNBAHC@?$AA@", ptr %3
  %26 = trunc i32 %1 to i16
  %27 = call i32 @EgTagCreate(ptr noundef %0, i16 noundef zeroext %26, i16 noundef zeroext %16, ptr noundef nonnull %25, ptr noundef nonnull %23) #12
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %45

29:                                               ; preds = %21
  %30 = call i32 @EgTagWrite(ptr noundef %0, ptr noundef nonnull %7, i16 noundef zeroext %16) #12
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %43, label %45

32:                                               ; preds = %19
  call void @llvm.lifetime.start.p0(ptr nonnull %8) #12
  call void @llvm.lifetime.start.p0(ptr nonnull %9) #12
  %33 = icmp eq ptr %4, null
  %34 = select i1 %33, ptr @"??_C@_00CNPNBAHC@?$AA@", ptr %4
  %35 = icmp eq ptr %3, null
  %36 = select i1 %35, ptr @"??_C@_00CNPNBAHC@?$AA@", ptr %3
  %37 = call i32 @EgTagCreateSegment(ptr noundef %0, i16 noundef zeroext 12, i16 noundef zeroext 80, ptr noundef nonnull %36, ptr noundef nonnull %34, ptr noundef nonnull %8, i16 noundef zeroext 32, ptr noundef nonnull %9) #12
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %44

39:                                               ; preds = %32
  %40 = inttoptr i32 %2 to ptr
  %41 = call i32 @EgTagWriteString(ptr noundef %0, ptr noundef %40) #12
  %42 = icmp eq i32 %41, 0
  call void @llvm.lifetime.end.p0(ptr nonnull %9) #12
  call void @llvm.lifetime.end.p0(ptr nonnull %8) #12
  br i1 %42, label %43, label %45

43:                                               ; preds = %29, %39, %15
  br label %45

44:                                               ; preds = %32
  call void @llvm.lifetime.end.p0(ptr nonnull %9) #12
  call void @llvm.lifetime.end.p0(ptr nonnull %8) #12
  br label %45

45:                                               ; preds = %44, %29, %21, %39, %43
  %46 = phi i8 [ 1, %43 ], [ 0, %39 ], [ 0, %21 ], [ 0, %29 ], [ 0, %44 ]
  ret i8 %46
}

declare dllimport i32 @EgTagCreate(ptr noundef, i16 noundef zeroext, i16 noundef zeroext, ptr noundef, ptr noundef) local_unnamed_addr #3

declare dllimport i32 @EgTagWrite(ptr noundef, ptr noundef, i16 noundef zeroext) local_unnamed_addr #3

declare dllimport i32 @EgTagCreateSegment(ptr noundef, i16 noundef zeroext, i16 noundef zeroext, ptr noundef, ptr noundef, ptr noundef, i16 noundef zeroext, ptr noundef) local_unnamed_addr #3

declare dllimport i32 @EgTagWriteString(ptr noundef, ptr noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef nonnull ptr @Container_GetModuleName() local_unnamed_addr #4 {
  ret ptr @ServiceRealName
}

; Function Attrs: nofree nounwind
define dso_local noundef nonnull ptr @Container_GetTagName(ptr noundef %0) local_unnamed_addr #5 {
  %2 = tail call i32 (ptr, ptr, ...) @sprintf(ptr noundef nonnull dereferenceable(1) @_ContainerTagName, ptr noundef nonnull dereferenceable(1) @"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@", ptr noundef nonnull @ServiceRealName, ptr noundef %0) #12
  ret ptr @_ContainerTagName
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Container_SetModuleName(ptr noundef readonly captures(none) %0) local_unnamed_addr #6 {
  %2 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) @_ModuleName, ptr noundef nonnull dereferenceable(1) %0) #12
  %3 = tail call ptr @strrchr(ptr noundef nonnull dereferenceable(1) @_ModuleName, i32 noundef 92) #12
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %8

5:                                                ; preds = %1
  %6 = tail call ptr @strrchr(ptr noundef nonnull dereferenceable(1) @_ModuleName, i32 noundef 47) #12
  %7 = icmp eq ptr %6, null
  br i1 %7, label %16, label %8

8:                                                ; preds = %1, %5
  %9 = phi ptr [ %6, %5 ], [ %3, %1 ]
  %10 = getelementptr inbounds nuw i8, ptr %9, i32 1
  %11 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %10) #12
  %12 = add i32 %11, 1
  tail call void @llvm.memmove.p0.p0.i32(ptr nonnull align 1 @_ModuleName, ptr nonnull align 1 %10, i32 %12, i1 false)
  %13 = tail call ptr @strrchr(ptr noundef nonnull dereferenceable(1) @_ModuleName, i32 noundef 46) #12
  %14 = icmp eq ptr %13, null
  br i1 %14, label %16, label %15

15:                                               ; preds = %8
  store i8 0, ptr %13, align 1
  br label %16

16:                                               ; preds = %8, %15, %5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none)) local_unnamed_addr #7

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local ptr @strrchr(ptr noundef, i32 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strlen(ptr noundef captures(none)) local_unnamed_addr #8

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i32(ptr writeonly captures(none), ptr readonly captures(none), i32, i1 immarg) #9

; Function Attrs: nounwind
define dso_local void @"Container_Log$"(ptr noundef %0, ptr noundef %1, ptr noundef %2, ...) local_unnamed_addr #0 {
  %4 = alloca ptr, align 4
  store ptr %2, ptr %4, align 4
  %5 = load ptr, ptr @"Container_Log$.messBuff", align 4
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %10

7:                                                ; preds = %3
  %8 = tail call dereferenceable_or_null(1024) ptr @calloc(i32 1, i32 1024)
  store ptr %8, ptr @"Container_Log$.messBuff", align 4
  %9 = icmp eq ptr %8, null
  br i1 %9, label %15, label %10

10:                                               ; preds = %7, %3
  %11 = phi ptr [ %5, %3 ], [ %8, %7 ]
  %12 = getelementptr inbounds nuw i8, ptr %4, i32 4
  %13 = call i32 @vsprintf(ptr noundef nonnull %11, ptr noundef %2, ptr noundef nonnull %12) #12
  %14 = load ptr, ptr @"Container_Log$.messBuff", align 4
  call void (ptr, ptr, ptr, ...) @EgFW_PrintLog(ptr noundef %0, ptr noundef %1, ptr noundef %14) #12
  br label %15

15:                                               ; preds = %7, %10
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #10

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @vsprintf(ptr noundef captures(none), ptr noundef readonly captures(none), ptr noundef) local_unnamed_addr #2

declare dllimport void @EgFW_PrintLog(ptr noundef, ptr noundef, ptr noundef, ...) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local void @ExitEvent_Init() local_unnamed_addr #0 {
  %1 = tail call zeroext i16 @CreateRtSemaphore(i16 noundef zeroext 0, i16 noundef zeroext 1, i16 noundef zeroext 0) #12
  store i16 %1, ptr @hExitEvent, align 2
  %2 = tail call zeroext i8 @CatalogRtHandle(i16 noundef zeroext 0, i16 noundef zeroext %1, ptr noundef nonnull @"??_C@_04LBABLPF@Exit?$AA@") #12
  ret void
}

declare dso_local zeroext i16 @CreateRtSemaphore(i16 noundef zeroext, i16 noundef zeroext, i16 noundef zeroext) local_unnamed_addr #3

declare dso_local zeroext i8 @CatalogRtHandle(i16 noundef zeroext, i16 noundef zeroext, ptr noundef) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local void @ExitEvent_Wait() local_unnamed_addr #0 {
  %1 = load i16, ptr @hExitEvent, align 2
  %2 = tail call i32 @WaitForRtSemaphore(i16 noundef zeroext %1, i16 noundef zeroext 1, i32 noundef -1) #12
  ret void
}

declare dso_local i32 @WaitForRtSemaphore(i16 noundef zeroext, i16 noundef zeroext, i32 noundef) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local void @ExitEvent_Post() local_unnamed_addr #0 {
  %1 = load i16, ptr @hExitEvent, align 2
  %2 = tail call zeroext i8 @ReleaseRtSemaphore(i16 noundef zeroext %1, i16 noundef zeroext 1) #12
  ret void
}

declare dso_local zeroext i8 @ReleaseRtSemaphore(i16 noundef zeroext, i16 noundef zeroext) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local void @ExitEvent_RtaMsgHandler() #0 {
  %1 = alloca %struct._tag_event_info, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #12
  %2 = tail call zeroext i8 @SynchronizeRtLoader() #12
  %3 = tail call zeroext i16 @GetRtThreadHandles(i8 noundef zeroext 0) #12
  %4 = tail call zeroext i8 @CatalogRtHandle(i16 noundef zeroext 0, i16 noundef zeroext %3, ptr noundef nonnull @"??_C@_06HHNOBIIB@Notify?$AA@") #12
  %5 = call zeroext i8 @RtNotifyEvent(i32 noundef 12, i32 noundef -1, ptr noundef nonnull %1) #12
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %15, label %7

7:                                                ; preds = %0, %12
  %8 = load i32, ptr %1, align 4
  switch i32 %8, label %12 [
    i32 8, label %9
    i32 255, label %9
  ]

9:                                                ; preds = %7, %7
  call void @Indicate_Run(i8 noundef zeroext 0) #12
  %10 = load i16, ptr @hExitEvent, align 2
  %11 = call zeroext i8 @ReleaseRtSemaphore(i16 noundef zeroext %10, i16 noundef zeroext 1) #12
  br label %12

12:                                               ; preds = %7, %9
  %13 = call zeroext i8 @RtNotifyEvent(i32 noundef 12, i32 noundef -1, ptr noundef nonnull %1) #12
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %15, label %7, !llvm.loop !9

15:                                               ; preds = %12, %0
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #12
  ret void
}

declare dso_local zeroext i8 @SynchronizeRtLoader() local_unnamed_addr #3

declare dso_local zeroext i16 @GetRtThreadHandles(i8 noundef zeroext) local_unnamed_addr #3

declare dso_local zeroext i8 @RtNotifyEvent(i32 noundef, i32 noundef, ptr noundef) local_unnamed_addr #3

declare dso_local void @Indicate_Run(i8 noundef zeroext) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local noundef i32 @Container_EgdeMsgHandler(ptr readnone captures(none) %0, i32 noundef %1, ptr readnone captures(none) %2) #0 {
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  %6 = alloca ptr, align 4
  switch i32 %1, label %45 [
    i32 102, label %7
    i32 103, label %19
    i32 101, label %31
  ]

7:                                                ; preds = %3
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  store ptr @"??_C@_0BJ@OPOGIFPF@EM_SERVICE_RUN?5recieved?4?$AA@", ptr %6, align 4
  %8 = load ptr, ptr @"Container_Log$.messBuff", align 4
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %13

10:                                               ; preds = %7
  %11 = tail call dereferenceable_or_null(1024) ptr @calloc(i32 1, i32 1024)
  store ptr %11, ptr @"Container_Log$.messBuff", align 4
  %12 = icmp eq ptr %11, null
  br i1 %12, label %18, label %13

13:                                               ; preds = %10, %7
  %14 = phi ptr [ %8, %7 ], [ %11, %10 ]
  %15 = getelementptr inbounds nuw i8, ptr %6, i32 4
  %16 = call i32 @vsprintf(ptr noundef nonnull %14, ptr noundef nonnull @"??_C@_0BJ@OPOGIFPF@EM_SERVICE_RUN?5recieved?4?$AA@", ptr noundef nonnull %15) #12
  %17 = load ptr, ptr @"Container_Log$.messBuff", align 4
  call void (ptr, ptr, ptr, ...) @EgFW_PrintLog(ptr noundef nonnull @ServiceRealName, ptr noundef nonnull @"??_C@_03GOLGPOF@DBG?$AA@", ptr noundef %17) #12
  br label %18

18:                                               ; preds = %10, %13
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  call void @Indicate_Run(i8 noundef zeroext 1) #12
  br label %45

19:                                               ; preds = %3
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  store ptr @"??_C@_0BL@DPPAKCHP@EM_SERVICE_PAUSE?5recieved?4?$AA@", ptr %5, align 4
  %20 = load ptr, ptr @"Container_Log$.messBuff", align 4
  %21 = icmp eq ptr %20, null
  br i1 %21, label %22, label %25

22:                                               ; preds = %19
  %23 = tail call dereferenceable_or_null(1024) ptr @calloc(i32 1, i32 1024)
  store ptr %23, ptr @"Container_Log$.messBuff", align 4
  %24 = icmp eq ptr %23, null
  br i1 %24, label %30, label %25

25:                                               ; preds = %22, %19
  %26 = phi ptr [ %20, %19 ], [ %23, %22 ]
  %27 = getelementptr inbounds nuw i8, ptr %5, i32 4
  %28 = call i32 @vsprintf(ptr noundef nonnull %26, ptr noundef nonnull @"??_C@_0BL@DPPAKCHP@EM_SERVICE_PAUSE?5recieved?4?$AA@", ptr noundef nonnull %27) #12
  %29 = load ptr, ptr @"Container_Log$.messBuff", align 4
  call void (ptr, ptr, ptr, ...) @EgFW_PrintLog(ptr noundef nonnull @ServiceRealName, ptr noundef nonnull @"??_C@_03GOLGPOF@DBG?$AA@", ptr noundef %29) #12
  br label %30

30:                                               ; preds = %22, %25
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  call void @Indicate_Run(i8 noundef zeroext 0) #12
  br label %45

31:                                               ; preds = %3
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  store ptr @"??_C@_0BK@LMHOIIID@EM_SERVICE_STOP?5recieved?4?$AA@", ptr %4, align 4
  %32 = load ptr, ptr @"Container_Log$.messBuff", align 4
  %33 = icmp eq ptr %32, null
  br i1 %33, label %34, label %37

34:                                               ; preds = %31
  %35 = tail call dereferenceable_or_null(1024) ptr @calloc(i32 1, i32 1024)
  store ptr %35, ptr @"Container_Log$.messBuff", align 4
  %36 = icmp eq ptr %35, null
  br i1 %36, label %42, label %37

37:                                               ; preds = %34, %31
  %38 = phi ptr [ %32, %31 ], [ %35, %34 ]
  %39 = getelementptr inbounds nuw i8, ptr %4, i32 4
  %40 = call i32 @vsprintf(ptr noundef nonnull %38, ptr noundef nonnull @"??_C@_0BK@LMHOIIID@EM_SERVICE_STOP?5recieved?4?$AA@", ptr noundef nonnull %39) #12
  %41 = load ptr, ptr @"Container_Log$.messBuff", align 4
  call void (ptr, ptr, ptr, ...) @EgFW_PrintLog(ptr noundef nonnull @ServiceRealName, ptr noundef nonnull @"??_C@_03GOLGPOF@DBG?$AA@", ptr noundef %41) #12
  br label %42

42:                                               ; preds = %34, %37
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  call void @Indicate_Run(i8 noundef zeroext 0) #12
  %43 = load i16, ptr @hExitEvent, align 2
  %44 = call zeroext i8 @ReleaseRtSemaphore(i16 noundef zeroext %43, i16 noundef zeroext 1) #12
  br label %45

45:                                               ; preds = %3, %42, %30, %18
  ret i32 0
}

; Function Attrs: nounwind
define dso_local void @Container_Init() local_unnamed_addr #0 {
  %1 = alloca %struct.tEdgeConfig, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #12
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(276) %1, i8 0, i32 276, i1 false)
  %2 = getelementptr inbounds nuw i8, ptr %1, i32 1
  store i8 1, ptr %2, align 1
  %3 = getelementptr inbounds nuw i8, ptr %1, i32 2
  store i16 -1, ptr %3, align 1
  %4 = getelementptr inbounds nuw i8, ptr %1, i32 4
  store ptr @Container_EgdeMsgHandler, ptr %4, align 1
  %5 = call i32 @EgInit(ptr noundef nonnull %1) #12
  %6 = call zeroext i8 @RtSleep(i32 noundef 100) #12
  %7 = call zeroext i8 @Property_Init() #12
  %8 = call zeroext i8 @Indicate_Init() #12
  %9 = call zeroext i8 @Trigger_Init() #12
  %10 = call zeroext i16 @CreateRtSemaphore(i16 noundef zeroext 0, i16 noundef zeroext 1, i16 noundef zeroext 0) #12
  store i16 %10, ptr @hExitEvent, align 2
  %11 = call zeroext i8 @CatalogRtHandle(i16 noundef zeroext 0, i16 noundef zeroext %10, ptr noundef nonnull @"??_C@_04LBABLPF@Exit?$AA@") #12
  %12 = call zeroext i8 @SetRtProcessMaxPriority(i16 noundef zeroext 0, i8 noundef zeroext 0) #12
  %13 = call i32 @Property_Get_Priority() #12
  %14 = trunc i32 %13 to i8
  %15 = add i8 %14, 10
  %16 = call zeroext i8 @SetRtThreadPriority(i16 noundef zeroext 0, i8 noundef zeroext %15) #12
  %17 = call zeroext i16 @GetRtThreadHandles(i8 noundef zeroext 3) #12
  br label %18

18:                                               ; preds = %21, %0
  %19 = phi i32 [ 0, %0 ], [ %22, %21 ]
  %20 = icmp eq i32 %19, 128
  br i1 %20, label %26, label %21

21:                                               ; preds = %18
  %22 = add nuw nsw i32 %19, 1
  %23 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef nonnull dereferenceable(1) @catalogProc, ptr noundef nonnull dereferenceable(1) @"??_C@_07NFKFJBIP@?$CFs_?$CF03d?$AA@", ptr noundef nonnull @"??_C@_03LHGCEHCD@PLC?$AA@", i32 noundef %22) #12
  %24 = call zeroext i16 @LookupRtHandle(i16 noundef zeroext %17, ptr noundef nonnull @catalogProc, i32 noundef 0) #12
  %25 = icmp eq i16 %24, -1
  br i1 %25, label %26, label %18, !llvm.loop !7

26:                                               ; preds = %18, %21
  %27 = call zeroext i8 @UncatalogRtHandle(i16 noundef zeroext %17, ptr noundef nonnull @catalogProc) #12
  %28 = call zeroext i16 @GetRtThreadHandles(i8 noundef zeroext 1) #12
  %29 = call zeroext i8 @CatalogRtHandle(i16 noundef zeroext %17, i16 noundef zeroext %28, ptr noundef nonnull @catalogProc) #12
  %30 = call zeroext i16 @GetRtThreadHandles(i8 noundef zeroext 0) #12
  %31 = call zeroext i8 @CatalogRtHandle(i16 noundef zeroext 0, i16 noundef zeroext %30, ptr noundef nonnull @"??_C@_04KGFMLCPK@Main?$AA@") #12
  %32 = call i32 @Property_Get_Priority() #12
  %33 = trunc i32 %32 to i8
  %34 = add i8 %33, 8
  %35 = call zeroext i16 @CreateRtThread(i8 noundef zeroext %34, ptr noundef nonnull @ExitEvent_RtaMsgHandler, i32 noundef 4096, ptr noundef null) #12
  call void @Indicate_STATE_ON(i8 noundef zeroext 1) #12
  call void @Indicate_STATE_LOADING(i8 noundef zeroext 0) #12
  call void @Indicate_STATE_STOP(i8 noundef zeroext 0) #12
  call void @Indicate_STATE_STEP(i8 noundef zeroext 0) #12
  call void @Indicate_STATE_HALT(i8 noundef zeroext 0) #12
  call void @Indicate_STATE_RUN(i8 noundef zeroext 1) #12
  %36 = call i32 @Errorlog_Count() #12
  call void @Indicate_ERRORS(i32 noundef %36) #12
  %37 = call zeroext i8 @Property_Get_Autorun() #12
  %38 = icmp ne i8 %37, 0
  %39 = zext i1 %38 to i8
  call void @Indicate_Run(i8 noundef zeroext %39) #12
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #12
  ret void
}

declare dllimport i32 @EgInit(ptr noundef) local_unnamed_addr #3

declare dso_local zeroext i8 @RtSleep(i32 noundef) local_unnamed_addr #3

declare dso_local zeroext i8 @Property_Init() local_unnamed_addr #3

declare dso_local zeroext i8 @Indicate_Init() local_unnamed_addr #3

declare dso_local zeroext i8 @Trigger_Init() local_unnamed_addr #3

declare dso_local zeroext i8 @SetRtProcessMaxPriority(i16 noundef zeroext, i8 noundef zeroext) local_unnamed_addr #3

declare dso_local zeroext i8 @SetRtThreadPriority(i16 noundef zeroext, i8 noundef zeroext) local_unnamed_addr #3

declare dso_local i32 @Property_Get_Priority() local_unnamed_addr #3

declare dso_local zeroext i8 @UncatalogRtHandle(i16 noundef zeroext, ptr noundef) local_unnamed_addr #3

declare dso_local zeroext i16 @CreateRtThread(i8 noundef zeroext, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #3

declare dso_local void @Indicate_STATE_ON(i8 noundef zeroext) local_unnamed_addr #3

declare dso_local void @Indicate_STATE_LOADING(i8 noundef zeroext) local_unnamed_addr #3

declare dso_local void @Indicate_STATE_STOP(i8 noundef zeroext) local_unnamed_addr #3

declare dso_local void @Indicate_STATE_STEP(i8 noundef zeroext) local_unnamed_addr #3

declare dso_local void @Indicate_STATE_HALT(i8 noundef zeroext) local_unnamed_addr #3

declare dso_local void @Indicate_STATE_RUN(i8 noundef zeroext) local_unnamed_addr #3

declare dso_local void @Indicate_ERRORS(i32 noundef) local_unnamed_addr #3

declare dso_local i32 @Errorlog_Count() local_unnamed_addr #3

declare dso_local zeroext i8 @Property_Get_Autorun() local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local void @Container_Finish() local_unnamed_addr #0 {
  %1 = tail call zeroext i16 @GetRtThreadHandles(i8 noundef zeroext 3) #12
  %2 = tail call zeroext i8 @UncatalogRtHandle(i16 noundef zeroext %1, ptr noundef nonnull @catalogProc) #12
  tail call void @Indicate_STATE_ON(i8 noundef zeroext 0) #12
  tail call void @Indicate_STATE_LOADING(i8 noundef zeroext 0) #12
  tail call void @Indicate_STATE_STOP(i8 noundef zeroext 0) #12
  tail call void @Indicate_STATE_RUN(i8 noundef zeroext 0) #12
  tail call void @Indicate_STATE_STEP(i8 noundef zeroext 0) #12
  tail call void @Indicate_STATE_HALT(i8 noundef zeroext 0) #12
  %3 = tail call i32 @EgFinalize() #12
  ret void
}

declare dllimport i32 @EgFinalize(...) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local noundef zeroext i8 @Container_CreateTagsFromList(ptr noundef captures(none) %0) local_unnamed_addr #0 {
  %2 = alloca ptr, align 4
  %3 = alloca ptr, align 4
  %4 = alloca i16, align 2
  %5 = alloca ptr, align 4
  %6 = alloca ptr, align 4
  %7 = load ptr, ptr %0, align 1
  %8 = icmp eq ptr %7, null
  br i1 %8, label %64, label %9

9:                                                ; preds = %1, %60
  %10 = phi ptr [ %62, %60 ], [ %7, %1 ]
  %11 = phi ptr [ %61, %60 ], [ %0, %1 ]
  %12 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef nonnull dereferenceable(1) @_ContainerTagName, ptr noundef nonnull dereferenceable(1) @"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@", ptr noundef nonnull @ServiceRealName, ptr noundef nonnull %10) #12
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #12
  %13 = call i32 @EgTagGetProperty(ptr noundef nonnull @_ContainerTagName, ptr noundef nonnull @"??_C@_04KOACHJEN@Type?$AA@", ptr noundef nonnull %4, i32 noundef 2) #12
  %14 = icmp eq i32 %13, 0
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #12
  br i1 %14, label %15, label %30

15:                                               ; preds = %9
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #12
  %16 = call i32 @EgTagGetProperty(ptr noundef nonnull @_ContainerTagName, ptr noundef nonnull @"??_C@_05FNNGFGLF@Index?$AA@", ptr noundef nonnull %3, i32 noundef 4) #12
  %17 = icmp eq i32 %16, 0
  %18 = load ptr, ptr %3, align 4
  %19 = select i1 %17, ptr %18, ptr null
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #12
  %20 = getelementptr inbounds nuw i8, ptr %11, i32 26
  store ptr %19, ptr %20, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #12
  store ptr null, ptr %5, align 4
  %21 = call i32 @EgTagGetProperty(ptr noundef nonnull @_ContainerTagName, ptr noundef nonnull @"??_C@_05HKHPEFOF@Entry?$AA@", ptr noundef nonnull %5, i32 noundef 4) #12
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %27

23:                                               ; preds = %15
  %24 = load ptr, ptr %5, align 4
  %25 = getelementptr inbounds nuw i8, ptr %24, i32 15
  %26 = getelementptr inbounds nuw i8, ptr %11, i32 13
  store i8 1, ptr %26, align 1
  br label %27

27:                                               ; preds = %15, %23
  %28 = phi ptr [ %25, %23 ], [ @Container_CreateTagsFromList.dummy, %15 ]
  %29 = getelementptr inbounds nuw i8, ptr %11, i32 14
  store ptr %28, ptr %29, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #12
  br label %60

30:                                               ; preds = %9
  %31 = getelementptr inbounds nuw i8, ptr %11, i32 12
  %32 = load i8, ptr %31, align 1
  %33 = icmp eq i8 %32, 0
  br i1 %33, label %60, label %34

34:                                               ; preds = %30
  %35 = getelementptr inbounds nuw i8, ptr %11, i32 22
  %36 = load ptr, ptr %35, align 1
  %37 = getelementptr inbounds nuw i8, ptr %11, i32 18
  %38 = load ptr, ptr %37, align 1
  %39 = getelementptr inbounds nuw i8, ptr %11, i32 8
  %40 = load i32, ptr %39, align 1
  %41 = getelementptr inbounds nuw i8, ptr %11, i32 4
  %42 = load i32, ptr %41, align 1
  %43 = call zeroext i8 @Container_TagCreate(ptr noundef nonnull @_ContainerTagName, i32 noundef %42, i32 noundef %40, ptr noundef %38, ptr noundef %36)
  %44 = icmp eq i8 %43, 0
  br i1 %44, label %64, label %45

45:                                               ; preds = %34
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #12
  %46 = call i32 @EgTagGetProperty(ptr noundef nonnull @_ContainerTagName, ptr noundef nonnull @"??_C@_05FNNGFGLF@Index?$AA@", ptr noundef nonnull %2, i32 noundef 4) #12
  %47 = icmp eq i32 %46, 0
  %48 = load ptr, ptr %2, align 4
  %49 = select i1 %47, ptr %48, ptr null
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #12
  %50 = getelementptr inbounds nuw i8, ptr %11, i32 26
  store ptr %49, ptr %50, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %6) #12
  store ptr null, ptr %6, align 4
  %51 = call i32 @EgTagGetProperty(ptr noundef nonnull @_ContainerTagName, ptr noundef nonnull @"??_C@_05HKHPEFOF@Entry?$AA@", ptr noundef nonnull %6, i32 noundef 4) #12
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %53, label %57

53:                                               ; preds = %45
  %54 = load ptr, ptr %6, align 4
  %55 = getelementptr inbounds nuw i8, ptr %54, i32 15
  %56 = getelementptr inbounds nuw i8, ptr %11, i32 13
  store i8 1, ptr %56, align 1
  br label %57

57:                                               ; preds = %45, %53
  %58 = phi ptr [ %55, %53 ], [ @Container_CreateTagsFromList.dummy, %45 ]
  %59 = getelementptr inbounds nuw i8, ptr %11, i32 14
  store ptr %58, ptr %59, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #12
  br label %60

60:                                               ; preds = %30, %57, %27
  %61 = getelementptr inbounds nuw i8, ptr %11, i32 30
  %62 = load ptr, ptr %61, align 1
  %63 = icmp eq ptr %62, null
  br i1 %63, label %64, label %9, !llvm.loop !10

64:                                               ; preds = %34, %60, %1
  ret i8 0
}

; Function Attrs: nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @calloc(i32 noundef, i32 noundef) local_unnamed_addr #11

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #10 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #11 = { nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #12 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\container.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}
