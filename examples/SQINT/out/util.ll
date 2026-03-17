; ModuleID = '..\PLCP\util.c'
source_filename = "..\\PLCP\\util.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct._INIT = type { i32, i16, i8, i16 }
%struct.tagException = type <{ ptr, i16, i8 }>
%struct.tagSysInfo = type <{ [15 x i8], i8, [30 x i8], [2 x i16], i8, i32, i16, i16, i16, i8, i8, i8, i8, i8, i16, i16, i32, [3 x i8], i8, i8, i8, i8, i8, i16, i32, i16, i8, i8, i32, i8, i32, i32, i32, i8, i32, i8, [6 x i8], i32, i16, i8, [32 x i8] }>
%union.tHashCode = type { %struct.anon }
%struct.anon = type { i32, i32, i32, i32 }
%struct.MD5_CONTEXT = type { [4 x i32], [2 x i32], [64 x i8] }

$UsecsToKticks = comdat any

$LibVersion_0x0701 = comdat any

$"??_C@_0O@MGBCDFJB@?6Error?5nr?$DN?$CFx?6?$AA@" = comdat any

$"??_C@_0M@NKKLNCPM@R?$DPEXIT_MBOX?$AA@" = comdat any

$"??_C@_03LHGCEHCD@PLC?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@__const.INtime_CheckDRTOS.iodRTOS = private unnamed_addr constant [6 x i8] c"RINTM\00", align 1
@__const.INtime_WaitIO.ioReq = private unnamed_addr constant [11 x i8] c"RTIOSrvReq\00", align 1
@__const.INtime_WaitIO.ioRsp = private unnamed_addr constant [11 x i8] c"RTIOSrvRsp\00", align 1
@__const.INtime_WaitIO.ioSem = private unnamed_addr constant [11 x i8] c"RTIOSrvSem\00", align 1
@dwKtickInUsecs = dso_local local_unnamed_addr global i32 0, align 4
@"??_C@_0O@MGBCDFJB@?6Error?5nr?$DN?$CFx?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"\0AError nr=%x\0A\00", comdat, align 1
@strInit = dso_local local_unnamed_addr global %struct._INIT zeroinitializer, align 4
@"??_C@_0M@NKKLNCPM@R?$DPEXIT_MBOX?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"R?EXIT_MBOX\00", comdat, align 1
@hRootProcess = dso_local local_unnamed_addr global i16 0, align 2
@hThisProcess = dso_local local_unnamed_addr global i16 0, align 2
@"??_C@_03LHGCEHCD@PLC?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"PLC\00", comdat, align 1

; Function Attrs: nounwind
define dso_local zeroext range(i16 0, 2) i16 @INtime_CheckDRTOS() local_unnamed_addr #0 {
  %1 = alloca [6 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #10
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(6) %1, ptr noundef nonnull align 1 dereferenceable(6) @__const.INtime_CheckDRTOS.iodRTOS, i32 6, i1 false)
  %2 = tail call zeroext i16 @GetRtThreadHandles(i8 noundef zeroext 3) #10
  %3 = call zeroext i16 @LookupRtHandle(i16 noundef zeroext %2, ptr noundef nonnull %1, i32 noundef 0) #10
  %4 = icmp ne i16 %3, -1
  %5 = zext i1 %4 to i16
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #10
  ret i16 %5
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #2

declare dso_local zeroext i16 @GetRtThreadHandles(i8 noundef zeroext) local_unnamed_addr #3

declare dso_local zeroext i16 @LookupRtHandle(i16 noundef zeroext, ptr noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: nounwind
define dso_local noundef zeroext i16 @INtime_WaitIO() local_unnamed_addr #0 {
  %1 = alloca [11 x i8], align 1
  %2 = alloca [11 x i8], align 1
  %3 = alloca [11 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #10
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(11) %1, ptr noundef nonnull align 1 dereferenceable(11) @__const.INtime_WaitIO.ioReq, i32 11, i1 false)
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #10
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(11) %2, ptr noundef nonnull align 1 dereferenceable(11) @__const.INtime_WaitIO.ioRsp, i32 11, i1 false)
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #10
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(11) %3, ptr noundef nonnull align 1 dereferenceable(11) @__const.INtime_WaitIO.ioSem, i32 11, i1 false)
  %4 = tail call zeroext i16 @GetRtThreadHandles(i8 noundef zeroext 3) #10
  br label %5

5:                                                ; preds = %14, %0
  %6 = call zeroext i16 @LookupRtHandle(i16 noundef zeroext %4, ptr noundef nonnull %1, i32 noundef 0) #10
  %7 = icmp eq i16 %6, -1
  br i1 %7, label %14, label %8

8:                                                ; preds = %5
  %9 = call zeroext i16 @LookupRtHandle(i16 noundef zeroext %4, ptr noundef nonnull %2, i32 noundef 0) #10
  %10 = icmp eq i16 %9, -1
  br i1 %10, label %14, label %11

11:                                               ; preds = %8
  %12 = call zeroext i16 @LookupRtHandle(i16 noundef zeroext %4, ptr noundef nonnull %3, i32 noundef 0) #10
  %13 = icmp eq i16 %12, -1
  br i1 %13, label %14, label %16

14:                                               ; preds = %11, %8, %5
  %15 = call zeroext i8 @RtSleep(i32 noundef 500) #10
  br label %5

16:                                               ; preds = %11
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #10
  ret i16 0
}

declare dso_local zeroext i8 @RtSleep(i32 noundef) local_unnamed_addr #3

; Function Attrs: inlinehint nounwind
define weak_odr dso_local i32 @UsecsToKticks(i32 noundef %0) local_unnamed_addr #4 comdat {
  %2 = load i32, ptr @dwKtickInUsecs, align 4
  %3 = add i32 %0, -1
  %4 = add i32 %3, %2
  %5 = udiv i32 %4, %2
  ret i32 %5
}

; Function Attrs: nounwind
define dso_local void @Fail(ptr noundef %0, ...) local_unnamed_addr #0 {
  %2 = alloca ptr, align 4
  %3 = alloca %struct.tagException, align 1
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #10
  %5 = getelementptr inbounds nuw i8, ptr %2, i32 4
  %6 = call i32 @vprintf(ptr noundef %0, ptr noundef nonnull %5) #10
  %7 = call i32 @GetLastRtError() #10
  %8 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0O@MGBCDFJB@?6Error?5nr?$DN?$CFx?6?$AA@", i32 noundef %7)
  %9 = call zeroext i8 @GetRtExceptionHandlerInfo(i8 noundef zeroext 0, ptr noundef nonnull %3) #10
  %10 = getelementptr inbounds nuw i8, ptr %3, i32 6
  store i8 0, ptr %10, align 1
  %11 = call zeroext i8 @SetRtExceptionHandler(ptr noundef nonnull %3) #10
  %12 = load i32, ptr @strInit, align 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %1
  call void @exit(i32 noundef 0) #11
  unreachable

15:                                               ; preds = %1
  %16 = load i16, ptr getelementptr inbounds nuw (i8, ptr @strInit, i32 4), align 4
  %17 = call zeroext i16 @GetRtThreadHandles(i8 noundef zeroext 0) #10
  %18 = icmp eq i16 %16, %17
  br i1 %18, label %19, label %24

19:                                               ; preds = %15
  %20 = load i32, ptr @strInit, align 4
  %21 = icmp eq i32 %20, 1
  br i1 %21, label %22, label %23

22:                                               ; preds = %19
  store i32 3, ptr @strInit, align 4
  call void @exit(i32 noundef 0) #11
  unreachable

23:                                               ; preds = %19
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #10
  ret void

24:                                               ; preds = %15
  %25 = call zeroext i16 @LookupRtHandle(i16 noundef zeroext 0, ptr noundef nonnull @"??_C@_0M@NKKLNCPM@R?$DPEXIT_MBOX?$AA@", i32 noundef 5000) #10
  store i32 255, ptr %4, align 4
  %26 = call zeroext i8 @SendRtData(i16 noundef zeroext %25, ptr noundef nonnull %4, i16 noundef zeroext 4) #10
  %27 = call zeroext i8 @SuspendRtThread(i16 noundef zeroext 0) #10
  br label %28

28:                                               ; preds = %28, %24
  %29 = call zeroext i8 @RtSleep(i32 noundef 655349) #10
  br label %28
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @vprintf(ptr noundef readonly captures(none), ptr noundef) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #5

declare dso_local i32 @GetLastRtError() local_unnamed_addr #3

declare dso_local zeroext i8 @GetRtExceptionHandlerInfo(i8 noundef zeroext, ptr noundef) local_unnamed_addr #3

declare dso_local zeroext i8 @SetRtExceptionHandler(ptr noundef) local_unnamed_addr #3

; Function Attrs: nofree noreturn
declare dso_local void @exit(i32 noundef) local_unnamed_addr #6

; Function Attrs: nofree noreturn nounwind
define dso_local void @Cleanup() local_unnamed_addr #7 {
  store i32 3, ptr @strInit, align 4
  tail call void @exit(i32 noundef 0) #11
  unreachable
}

declare dso_local zeroext i8 @SendRtData(i16 noundef zeroext, ptr noundef, i16 noundef zeroext) local_unnamed_addr #3

declare dso_local zeroext i8 @SuspendRtThread(i16 noundef zeroext) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local zeroext i8 @Catalog(i16 noundef zeroext %0, i16 noundef zeroext %1, ptr noundef %2) local_unnamed_addr #0 {
  %4 = tail call zeroext i8 @CatalogRtHandle(i16 noundef zeroext %0, i16 noundef zeroext %1, ptr noundef %2) #10
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %6, label %19

6:                                                ; preds = %3
  %7 = icmp eq i16 %0, 0
  br i1 %7, label %19, label %8

8:                                                ; preds = %6
  %9 = tail call zeroext i16 @LookupRtHandle(i16 noundef zeroext %0, ptr noundef %2, i32 noundef 0) #10
  %10 = icmp eq i16 %9, -1
  br i1 %10, label %19, label %11

11:                                               ; preds = %8
  %12 = tail call zeroext i16 @GetRtHandleType(i16 noundef zeroext %9) #10
  %13 = icmp eq i16 %12, 0
  br i1 %13, label %14, label %19

14:                                               ; preds = %11
  %15 = tail call zeroext i8 @UncatalogRtHandle(i16 noundef zeroext %0, ptr noundef %2) #10
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %19, label %17

17:                                               ; preds = %14
  %18 = tail call zeroext i8 @CatalogRtHandle(i16 noundef zeroext %0, i16 noundef zeroext %1, ptr noundef %2) #10
  br label %19

19:                                               ; preds = %6, %8, %11, %14, %3, %17
  %20 = phi i8 [ 1, %3 ], [ %18, %17 ], [ 0, %14 ], [ 0, %11 ], [ 0, %8 ], [ 0, %6 ]
  ret i8 %20
}

declare dso_local zeroext i8 @CatalogRtHandle(i16 noundef zeroext, i16 noundef zeroext, ptr noundef) local_unnamed_addr #3

declare dso_local zeroext i16 @GetRtHandleType(i16 noundef zeroext) local_unnamed_addr #3

declare dso_local zeroext i8 @UncatalogRtHandle(i16 noundef zeroext, ptr noundef) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local void @INtime_ProcessInitialize() local_unnamed_addr #0 {
  %1 = alloca [6 x i8], align 1
  %2 = alloca %struct.tagSysInfo, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #10
  %3 = tail call zeroext i16 @GetRtThreadHandles(i8 noundef zeroext 3) #10
  store i16 %3, ptr @hRootProcess, align 2
  %4 = tail call zeroext i16 @GetRtThreadHandles(i8 noundef zeroext 1) #10
  store i16 %4, ptr @hThisProcess, align 2
  %5 = load i16, ptr @hRootProcess, align 2
  %6 = tail call zeroext i8 @CatalogRtHandle(i16 noundef zeroext %5, i16 noundef zeroext %4, ptr noundef nonnull @"??_C@_03LHGCEHCD@PLC?$AA@") #10
  %7 = icmp ne i8 %6, 0
  %8 = icmp eq i16 %5, 0
  %9 = or i1 %8, %7
  br i1 %9, label %21, label %10

10:                                               ; preds = %0
  %11 = tail call zeroext i16 @LookupRtHandle(i16 noundef zeroext %5, ptr noundef nonnull @"??_C@_03LHGCEHCD@PLC?$AA@", i32 noundef 0) #10
  %12 = icmp eq i16 %11, -1
  br i1 %12, label %21, label %13

13:                                               ; preds = %10
  %14 = tail call zeroext i16 @GetRtHandleType(i16 noundef zeroext %11) #10
  %15 = icmp eq i16 %14, 0
  br i1 %15, label %16, label %21

16:                                               ; preds = %13
  %17 = tail call zeroext i8 @UncatalogRtHandle(i16 noundef zeroext %5, ptr noundef nonnull @"??_C@_03LHGCEHCD@PLC?$AA@") #10
  %18 = icmp eq i8 %17, 0
  br i1 %18, label %21, label %19

19:                                               ; preds = %16
  %20 = tail call zeroext i8 @CatalogRtHandle(i16 noundef zeroext %5, i16 noundef zeroext %4, ptr noundef nonnull @"??_C@_03LHGCEHCD@PLC?$AA@") #10
  br label %21

21:                                               ; preds = %0, %10, %13, %16, %19
  %22 = tail call zeroext i8 @SetRtProcessMaxPriority(i16 noundef zeroext 0, i8 noundef zeroext 0) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #10
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(6) %1, ptr noundef nonnull align 1 dereferenceable(6) @__const.INtime_CheckDRTOS.iodRTOS, i32 6, i1 false)
  %23 = tail call zeroext i16 @GetRtThreadHandles(i8 noundef zeroext 3) #10
  %24 = call zeroext i16 @LookupRtHandle(i16 noundef zeroext %23, ptr noundef nonnull %1, i32 noundef 0) #10
  %25 = icmp eq i16 %24, -1
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #10
  br i1 %25, label %26, label %28

26:                                               ; preds = %21
  %27 = call zeroext i16 @INtime_WaitIO()
  br label %28

28:                                               ; preds = %26, %21
  %29 = call zeroext i8 @CopyRtSystemInfo(ptr noundef nonnull %2) #10
  %30 = getelementptr inbounds nuw i8, ptr %2, i32 59
  %31 = load i16, ptr %30, align 1
  %32 = udiv i16 10000, %31
  %33 = zext nneg i16 %32 to i32
  store i32 %33, ptr @dwKtickInUsecs, align 4
  %34 = call zeroext i8 @SetRtThreadPriority(i16 noundef zeroext 0, i8 noundef zeroext -16) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #10
  ret void
}

declare dso_local zeroext i8 @SetRtProcessMaxPriority(i16 noundef zeroext, i8 noundef zeroext) local_unnamed_addr #3

declare dso_local zeroext i8 @CopyRtSystemInfo(ptr noundef) local_unnamed_addr #3

declare dso_local zeroext i8 @SetRtThreadPriority(i16 noundef zeroext, i8 noundef zeroext) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local void @INtime_ProcessFinalize() local_unnamed_addr #0 {
  %1 = tail call ptr @Config_Get_BaseName() #10
  %2 = load i16, ptr @hRootProcess, align 2
  %3 = tail call zeroext i8 @UncatalogRtHandle(i16 noundef zeroext %2, ptr noundef %1) #10
  ret void
}

declare dso_local ptr @Config_Get_BaseName() local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local void @INtime_ProcessCatalog() local_unnamed_addr #0 {
  %1 = tail call ptr @Config_Get_BaseName() #10
  %2 = load i16, ptr @hThisProcess, align 2
  %3 = load i16, ptr @hRootProcess, align 2
  %4 = tail call zeroext i8 @CatalogRtHandle(i16 noundef zeroext %3, i16 noundef zeroext %2, ptr noundef %1) #10
  %5 = icmp ne i8 %4, 0
  %6 = icmp eq i16 %3, 0
  %7 = or i1 %6, %5
  br i1 %7, label %19, label %8

8:                                                ; preds = %0
  %9 = tail call zeroext i16 @LookupRtHandle(i16 noundef zeroext %3, ptr noundef %1, i32 noundef 0) #10
  %10 = icmp eq i16 %9, -1
  br i1 %10, label %19, label %11

11:                                               ; preds = %8
  %12 = tail call zeroext i16 @GetRtHandleType(i16 noundef zeroext %9) #10
  %13 = icmp eq i16 %12, 0
  br i1 %13, label %14, label %19

14:                                               ; preds = %11
  %15 = tail call zeroext i8 @UncatalogRtHandle(i16 noundef zeroext %3, ptr noundef %1) #10
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %19, label %17

17:                                               ; preds = %14
  %18 = tail call zeroext i8 @CatalogRtHandle(i16 noundef zeroext %3, i16 noundef zeroext %2, ptr noundef %1) #10
  br label %19

19:                                               ; preds = %0, %8, %11, %14, %17
  ret void
}

; Function Attrs: nounwind
define dso_local void @INtime_Halt(ptr noundef %0) local_unnamed_addr #0 {
  %2 = tail call zeroext i16 @GetRtThreadHandles(i8 noundef zeroext 0) #10
  %3 = tail call zeroext i8 @CatalogRtHandle(i16 noundef zeroext 0, i16 noundef zeroext %2, ptr noundef %0) #10
  %4 = tail call zeroext i8 @SuspendRtThread(i16 noundef zeroext 0) #10
  ret void
}

; Function Attrs: nounwind
define dso_local zeroext i16 @INtime_RslLoad(ptr noundef readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = alloca [128 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #10
  %3 = tail call ptr @Config_Get_RslFolder() #10
  %4 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %2, ptr noundef nonnull dereferenceable(1) %3) #10
  %5 = call ptr @strcat(ptr noundef nonnull dereferenceable(1) %2, ptr noundef nonnull dereferenceable(1) %0) #10
  %6 = call zeroext i16 @LoadRtLibrary(ptr noundef nonnull %2) #10
  %7 = icmp eq i16 %6, 0
  br i1 %7, label %8, label %19

8:                                                ; preds = %1
  %9 = call ptr @Config_Get_RslFolder_Default() #10
  %10 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %2, ptr noundef nonnull dereferenceable(1) %9) #10
  %11 = call ptr @strcat(ptr noundef nonnull dereferenceable(1) %2, ptr noundef nonnull dereferenceable(1) %0) #10
  %12 = call zeroext i16 @LoadRtLibrary(ptr noundef nonnull %2) #10
  %13 = icmp eq i16 %12, 0
  br i1 %13, label %14, label %19

14:                                               ; preds = %8
  %15 = call ptr @Config_Get_RtaFolder() #10
  %16 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %2, ptr noundef nonnull dereferenceable(1) %15) #10
  %17 = call ptr @strcat(ptr noundef nonnull dereferenceable(1) %2, ptr noundef nonnull dereferenceable(1) %0) #10
  %18 = call zeroext i16 @LoadRtLibrary(ptr noundef nonnull %2) #10
  br label %19

19:                                               ; preds = %1, %14, %8
  %20 = phi i16 [ %18, %14 ], [ %12, %8 ], [ %6, %1 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #10
  ret i16 %20
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none)) local_unnamed_addr #8

declare dso_local ptr @Config_Get_RslFolder() local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcat(ptr noalias noundef returned, ptr noalias noundef readonly captures(none)) local_unnamed_addr #8

declare dso_local zeroext i16 @LoadRtLibrary(ptr noundef) local_unnamed_addr #3

declare dso_local ptr @Config_Get_RslFolder_Default() local_unnamed_addr #3

declare dso_local ptr @Config_Get_RtaFolder() local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local void @_Hash(ptr dead_on_unwind noalias writable sret(%union.tHashCode) align 1 %0, ptr noundef %1) local_unnamed_addr #0 {
  %3 = alloca %struct.MD5_CONTEXT, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #10
  call void @MD5Init(ptr noundef nonnull %3) #10
  %4 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %1) #10
  call void @MD5Update(ptr noundef nonnull %3, ptr noundef nonnull %1, i32 noundef %4) #10
  call void @MD5Final(ptr noundef %0, ptr noundef nonnull %3) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #10
  ret void
}

declare dso_local void @MD5Init(ptr noundef) local_unnamed_addr #3

declare dso_local void @MD5Update(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strlen(ptr noundef captures(none)) local_unnamed_addr #9

declare dso_local void @MD5Final(ptr noundef, ptr noundef) local_unnamed_addr #3

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { inlinehint nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree noreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree noreturn nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nounwind }
attributes #11 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\util.c", directory: "C:\\D_DRV\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)"}
