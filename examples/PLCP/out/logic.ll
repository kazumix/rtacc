; ModuleID = 'logic.c'
source_filename = "logic.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.T_ANY = type <{ %union.PANYVAL, i16, ptr, i8, i8, %struct.BITFIELD }>
%union.PANYVAL = type { ptr }
%struct.BITFIELD = type { i8, i8, i8 }
%union.VALUEBODY = type <{ %union.ANYVAL, [75 x i8] }>
%union.ANYVAL = type { %union.anon }
%union.anon = type { i64 }
%union.VALUEBODY.0 = type <{ %union.ANYVAL, [75 x i8] }>
%union.VALUEBODY.1 = type <{ %union.ANYVAL, [75 x i8] }>

$LibVersion_0x0701 = comdat any

$"??_C@_09IGONEJKP@Logic_Add?$AA@" = comdat any

$"??_C@_0CF@BIIKPHMI@?5?5line?$CI?$CF03d?$CJ?5?$CFp?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5@" = comdat any

$"??_C@_0BE@CKMLNBAF@?5?5entry?5point?3?5?5?$CFp?6?$AA@" = comdat any

$"??_C@_0HM@OIDHGGKG@?$CDinclude?5?$DMPLCINST?4h?$DO?6int?5main?$CIin@" = comdat any

$"??_C@_0BI@JHDIMNMC@?7a?$DN?$CFs?$CI?5a?5?0?$CFp?0?5?$CFp?0?5?$CFp?$CJ?$DL?6?$AA@" = comdat any

$"??_C@_02KGHIDFGE@?$HN?6?$AA@" = comdat any

$"??_C@_0CI@IHKJGMPN@?5?5line?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5?5?$CF0@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@status_logic = dso_local local_unnamed_addr global i32 0, align 4
@plcLogic = dso_local local_unnamed_addr global ptr null, align 4
@plcLogicBottom = dso_local local_unnamed_addr global ptr null, align 4
@plcentrypoint = dso_local local_unnamed_addr global ptr null, align 4
@plcbeginpoint = dso_local local_unnamed_addr global ptr null, align 4
@plcfinalpoint = dso_local local_unnamed_addr global ptr null, align 4
@RUNplcLogic = dso_local local_unnamed_addr global ptr null, align 4
@RUNplcentrypoint = dso_local local_unnamed_addr global ptr null, align 4
@RUNplcbeginpoint = dso_local local_unnamed_addr global ptr null, align 4
@RUNplcfinalpoint = dso_local local_unnamed_addr global ptr null, align 4
@"??_C@_09IGONEJKP@Logic_Add?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"Logic_Add\00", comdat, align 1
@VARIANT_EMPTY = external dso_local global %struct.T_ANY, align 1
@"??_C@_0CF@BIIKPHMI@?5?5line?$CI?$CF03d?$CJ?5?$CFp?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5@" = linkonce_odr dso_local unnamed_addr constant [37 x i8] c"  line(%03d) %p %14s  %p %p %p   %p\0A\00", comdat, align 1
@"??_C@_0BE@CKMLNBAF@?5?5entry?5point?3?5?5?$CFp?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [20 x i8] c"  entry point:  %p\0A\00", comdat, align 1
@"??_C@_0HM@OIDHGGKG@?$CDinclude?5?$DMPLCINST?4h?$DO?6int?5main?$CIin@" = linkonce_odr dso_local unnamed_addr constant [124 x i8] c"#include <PLCINST.h>\0Aint main(int argc, char* argv[])\0A{\0A\09return plcmain(argc, argv);\0A}\0Avoid seq_control(void)\0A{\0A\09BYTE\09a=0;\0A\00", comdat, align 1
@"??_C@_0BI@JHDIMNMC@?7a?$DN?$CFs?$CI?5a?5?0?$CFp?0?5?$CFp?0?5?$CFp?$CJ?$DL?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [24 x i8] c"\09a=%s( a ,%p, %p, %p);\0A\00", comdat, align 1
@"??_C@_02KGHIDFGE@?$HN?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"}\0A\00", comdat, align 1
@"??_C@_0CI@IHKJGMPN@?5?5line?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5?5?$CF0@" = linkonce_odr dso_local unnamed_addr constant [40 x i8] c"  line(%03d) %14s  %p %p %p   %016I64x\0A\00", comdat, align 1
@str = private unnamed_addr constant [11 x i8] c"Logic list\00", align 1
@str.1 = private unnamed_addr constant [17 x i8] c"Logic entrypoint\00", align 1
@str.4 = private unnamed_addr constant [13 x i8] c"Logic Disasm\00", align 1
@str.5 = private unnamed_addr constant [6 x i8] c"  N/A\00", align 1

; Function Attrs: nounwind
define dso_local noundef ptr @Logic_Add(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) local_unnamed_addr #0 {
  %5 = tail call ptr @Heap_Alloc(i32 noundef 28, ptr noundef nonnull @"??_C@_09IGONEJKP@Logic_Add?$AA@") #8
  store ptr %0, ptr %5, align 1
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 4
  store ptr %1, ptr %6, align 1
  %7 = getelementptr inbounds nuw i8, ptr %5, i32 8
  store ptr %2, ptr %7, align 1
  %8 = getelementptr inbounds nuw i8, ptr %5, i32 12
  store ptr %3, ptr %8, align 1
  %9 = getelementptr inbounds nuw i8, ptr %5, i32 24
  store ptr null, ptr %9, align 1
  %10 = load ptr, ptr @plcLogic, align 4
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %13

12:                                               ; preds = %4
  store ptr %5, ptr @plcLogic, align 4
  br label %16

13:                                               ; preds = %4
  %14 = load ptr, ptr @plcLogicBottom, align 4
  %15 = getelementptr inbounds nuw i8, ptr %14, i32 24
  store ptr %5, ptr %15, align 1
  br label %16

16:                                               ; preds = %13, %12
  store ptr %5, ptr @plcLogicBottom, align 4
  store i32 2, ptr @status_logic, align 4
  ret ptr %5
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

declare dso_local ptr @Heap_Alloc(i32 noundef, ptr noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: nounwind
define dso_local void @Logic_Clear() local_unnamed_addr #0 {
  %1 = load ptr, ptr @plcLogic, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %8, label %3

3:                                                ; preds = %0, %3
  %4 = phi ptr [ %6, %3 ], [ %1, %0 ]
  %5 = getelementptr inbounds nuw i8, ptr %4, i32 24
  %6 = load ptr, ptr %5, align 1
  tail call void @Heap_Free(ptr noundef nonnull %4) #8
  store ptr %6, ptr @plcLogic, align 4
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %3, !llvm.loop !7

8:                                                ; preds = %3, %0
  store ptr null, ptr @plcLogic, align 4
  store ptr null, ptr @plcLogicBottom, align 4
  store i32 0, ptr @status_logic, align 4
  ret void
}

declare dso_local void @Heap_Free(ptr noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind
define dso_local void @Logic_Display() local_unnamed_addr #3 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %2 = load ptr, ptr @RUNplcLogic, align 4
  %3 = icmp eq ptr %2, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.5)
  br label %38

6:                                                ; preds = %0, %6
  %7 = phi i32 [ %28, %6 ], [ 1, %0 ]
  %8 = phi ptr [ %27, %6 ], [ %2, %0 ]
  %9 = load ptr, ptr %8, align 1
  %10 = getelementptr inbounds nuw i8, ptr %9, i32 13
  %11 = load ptr, ptr %10, align 1
  %12 = getelementptr inbounds nuw i8, ptr %8, i32 12
  %13 = load ptr, ptr %12, align 1
  %14 = icmp eq ptr %13, @VARIANT_EMPTY
  %15 = select i1 %14, ptr null, ptr %13
  %16 = getelementptr inbounds nuw i8, ptr %8, i32 8
  %17 = load ptr, ptr %16, align 1
  %18 = icmp eq ptr %17, @VARIANT_EMPTY
  %19 = select i1 %18, ptr null, ptr %17
  %20 = getelementptr inbounds nuw i8, ptr %8, i32 4
  %21 = load ptr, ptr %20, align 1
  %22 = icmp eq ptr %21, @VARIANT_EMPTY
  %23 = select i1 %22, ptr null, ptr %21
  %24 = load ptr, ptr %9, align 1
  %25 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CF@BIIKPHMI@?5?5line?$CI?$CF03d?$CJ?5?$CFp?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5@", i32 noundef %7, ptr noundef nonnull %8, ptr noundef %24, ptr noundef %23, ptr noundef %19, ptr noundef %15, ptr noundef %11)
  %26 = getelementptr inbounds nuw i8, ptr %8, i32 24
  %27 = load ptr, ptr %26, align 1
  %28 = add nuw nsw i32 %7, 1
  %29 = icmp eq ptr %27, null
  br i1 %29, label %30, label %6, !llvm.loop !9

30:                                               ; preds = %6
  %31 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  %32 = load ptr, ptr @RUNplcentrypoint, align 4
  %33 = icmp eq ptr %32, null
  br i1 %33, label %34, label %36

34:                                               ; preds = %30
  %35 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.5)
  br label %38

36:                                               ; preds = %30
  %37 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BE@CKMLNBAF@?5?5entry?5point?3?5?5?$CFp?6?$AA@", ptr noundef nonnull %32)
  br label %38

38:                                               ; preds = %36, %34, %4
  ret void
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #4

; Function Attrs: nofree nounwind
define dso_local void @Logic_Convert_To_Clanguage(ptr noundef captures(none) %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr @plcLogic, align 4
  %3 = tail call i32 @fwrite(ptr nonnull @"??_C@_0HM@OIDHGGKG@?$CDinclude?5?$DMPLCINST?4h?$DO?6int?5main?$CIin@", i32 123, i32 1, ptr %0)
  %4 = icmp eq ptr %2, null
  br i1 %4, label %19, label %5

5:                                                ; preds = %1, %5
  %6 = phi ptr [ %17, %5 ], [ %2, %1 ]
  %7 = getelementptr inbounds nuw i8, ptr %6, i32 12
  %8 = load ptr, ptr %7, align 1
  %9 = getelementptr inbounds nuw i8, ptr %6, i32 8
  %10 = load ptr, ptr %9, align 1
  %11 = getelementptr inbounds nuw i8, ptr %6, i32 4
  %12 = load ptr, ptr %11, align 1
  %13 = load ptr, ptr %6, align 1
  %14 = load ptr, ptr %13, align 1
  %15 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %0, ptr noundef nonnull @"??_C@_0BI@JHDIMNMC@?7a?$DN?$CFs?$CI?5a?5?0?$CFp?0?5?$CFp?0?5?$CFp?$CJ?$DL?6?$AA@", ptr noundef %14, ptr noundef %12, ptr noundef %10, ptr noundef %8) #8
  %16 = getelementptr inbounds nuw i8, ptr %6, i32 24
  %17 = load ptr, ptr %16, align 1
  %18 = icmp eq ptr %17, null
  br i1 %18, label %19, label %5, !llvm.loop !10

19:                                               ; preds = %5, %1
  %20 = tail call i32 @fwrite(ptr nonnull @"??_C@_02KGHIDFGE@?$HN?6?$AA@", i32 2, i32 1, ptr %0)
  ret void
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fprintf(ptr noundef captures(none), ptr noundef readonly captures(none), ...) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local ptr @Logic_RunPOU(ptr noundef %0, ptr noundef readonly captures(address_is_null) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = icmp eq ptr %1, null
  br i1 %5, label %28, label %6

6:                                                ; preds = %4, %24
  %7 = phi ptr [ %18, %24 ], [ %0, %4 ]
  %8 = phi ptr [ %26, %24 ], [ %1, %4 ]
  %9 = load ptr, ptr %8, align 1
  %10 = getelementptr inbounds nuw i8, ptr %9, i32 13
  %11 = load ptr, ptr %10, align 1
  %12 = getelementptr inbounds nuw i8, ptr %8, i32 12
  %13 = load ptr, ptr %12, align 1
  %14 = getelementptr inbounds nuw i8, ptr %8, i32 8
  %15 = load ptr, ptr %14, align 1
  %16 = getelementptr inbounds nuw i8, ptr %8, i32 4
  %17 = load ptr, ptr %16, align 1
  %18 = tail call ptr %11(ptr noundef %7, ptr noundef %17, ptr noundef %15, ptr noundef %13) #8
  %19 = getelementptr inbounds nuw i8, ptr %18, i32 11
  %20 = load i8, ptr %19, align 1
  %21 = icmp eq i8 %20, 1
  br i1 %21, label %22, label %24

22:                                               ; preds = %6
  %23 = getelementptr inbounds nuw i8, ptr %18, i32 11
  store i8 0, ptr %23, align 1
  br label %28

24:                                               ; preds = %6
  %25 = getelementptr inbounds nuw i8, ptr %8, i32 24
  %26 = load ptr, ptr %25, align 1
  %27 = icmp eq ptr %26, null
  br i1 %27, label %28, label %6, !llvm.loop !11

28:                                               ; preds = %24, %4, %22
  %29 = phi ptr [ %18, %22 ], [ %0, %4 ], [ %18, %24 ]
  ret ptr %29
}

; Function Attrs: nounwind
define dso_local void @Logic_Scan() local_unnamed_addr #0 {
  %1 = alloca %struct.T_ANY, align 4
  %2 = alloca %union.VALUEBODY, align 1
  %3 = load ptr, ptr @RUNplcentrypoint, align 4
  %4 = icmp eq ptr %3, null
  br i1 %4, label %30, label %5

5:                                                ; preds = %0
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #8
  %6 = getelementptr inbounds nuw i8, ptr %1, i32 4
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 4 dereferenceable(11) %6, i8 0, i32 11, i1 false)
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #8
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(83) %2, i8 0, i32 83, i1 false)
  store ptr %2, ptr %1, align 4
  br label %7

7:                                                ; preds = %5, %25
  %8 = phi ptr [ %19, %25 ], [ %1, %5 ]
  %9 = phi ptr [ %27, %25 ], [ %3, %5 ]
  %10 = load ptr, ptr %9, align 1
  %11 = getelementptr inbounds nuw i8, ptr %10, i32 13
  %12 = load ptr, ptr %11, align 1
  %13 = getelementptr inbounds nuw i8, ptr %9, i32 12
  %14 = load ptr, ptr %13, align 1
  %15 = getelementptr inbounds nuw i8, ptr %9, i32 8
  %16 = load ptr, ptr %15, align 1
  %17 = getelementptr inbounds nuw i8, ptr %9, i32 4
  %18 = load ptr, ptr %17, align 1
  %19 = call ptr %12(ptr noundef nonnull %8, ptr noundef %18, ptr noundef %16, ptr noundef %14) #8
  %20 = getelementptr inbounds nuw i8, ptr %19, i32 11
  %21 = load i8, ptr %20, align 1
  %22 = icmp eq i8 %21, 1
  br i1 %22, label %23, label %25

23:                                               ; preds = %7
  %24 = getelementptr inbounds nuw i8, ptr %19, i32 11
  store i8 0, ptr %24, align 1
  br label %29

25:                                               ; preds = %7
  %26 = getelementptr inbounds nuw i8, ptr %9, i32 24
  %27 = load ptr, ptr %26, align 1
  %28 = icmp eq ptr %27, null
  br i1 %28, label %29, label %7, !llvm.loop !11

29:                                               ; preds = %25, %23
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #8
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #8
  br label %30

30:                                               ; preds = %0, %29
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #5

; Function Attrs: nounwind
define dso_local void @Logic_Begin() local_unnamed_addr #0 {
  %1 = alloca %struct.T_ANY, align 4
  %2 = alloca %union.VALUEBODY.0, align 1
  %3 = load ptr, ptr @RUNplcbeginpoint, align 4
  %4 = icmp eq ptr %3, null
  br i1 %4, label %30, label %5

5:                                                ; preds = %0
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #8
  %6 = getelementptr inbounds nuw i8, ptr %1, i32 4
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 4 dereferenceable(11) %6, i8 0, i32 11, i1 false)
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #8
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(83) %2, i8 0, i32 83, i1 false)
  store ptr %2, ptr %1, align 4
  br label %7

7:                                                ; preds = %5, %25
  %8 = phi ptr [ %19, %25 ], [ %1, %5 ]
  %9 = phi ptr [ %27, %25 ], [ %3, %5 ]
  %10 = load ptr, ptr %9, align 1
  %11 = getelementptr inbounds nuw i8, ptr %10, i32 13
  %12 = load ptr, ptr %11, align 1
  %13 = getelementptr inbounds nuw i8, ptr %9, i32 12
  %14 = load ptr, ptr %13, align 1
  %15 = getelementptr inbounds nuw i8, ptr %9, i32 8
  %16 = load ptr, ptr %15, align 1
  %17 = getelementptr inbounds nuw i8, ptr %9, i32 4
  %18 = load ptr, ptr %17, align 1
  %19 = call ptr %12(ptr noundef nonnull %8, ptr noundef %18, ptr noundef %16, ptr noundef %14) #8
  %20 = getelementptr inbounds nuw i8, ptr %19, i32 11
  %21 = load i8, ptr %20, align 1
  %22 = icmp eq i8 %21, 1
  br i1 %22, label %23, label %25

23:                                               ; preds = %7
  %24 = getelementptr inbounds nuw i8, ptr %19, i32 11
  store i8 0, ptr %24, align 1
  br label %29

25:                                               ; preds = %7
  %26 = getelementptr inbounds nuw i8, ptr %9, i32 24
  %27 = load ptr, ptr %26, align 1
  %28 = icmp eq ptr %27, null
  br i1 %28, label %29, label %7, !llvm.loop !11

29:                                               ; preds = %25, %23
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #8
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #8
  br label %30

30:                                               ; preds = %0, %29
  ret void
}

; Function Attrs: nounwind
define dso_local void @Logic_Final() local_unnamed_addr #0 {
  %1 = alloca %struct.T_ANY, align 4
  %2 = alloca %union.VALUEBODY.1, align 1
  %3 = load ptr, ptr @RUNplcfinalpoint, align 4
  %4 = icmp eq ptr %3, null
  br i1 %4, label %30, label %5

5:                                                ; preds = %0
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #8
  %6 = getelementptr inbounds nuw i8, ptr %1, i32 4
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 4 dereferenceable(11) %6, i8 0, i32 11, i1 false)
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #8
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(83) %2, i8 0, i32 83, i1 false)
  store ptr %2, ptr %1, align 4
  br label %7

7:                                                ; preds = %5, %25
  %8 = phi ptr [ %19, %25 ], [ %1, %5 ]
  %9 = phi ptr [ %27, %25 ], [ %3, %5 ]
  %10 = load ptr, ptr %9, align 1
  %11 = getelementptr inbounds nuw i8, ptr %10, i32 13
  %12 = load ptr, ptr %11, align 1
  %13 = getelementptr inbounds nuw i8, ptr %9, i32 12
  %14 = load ptr, ptr %13, align 1
  %15 = getelementptr inbounds nuw i8, ptr %9, i32 8
  %16 = load ptr, ptr %15, align 1
  %17 = getelementptr inbounds nuw i8, ptr %9, i32 4
  %18 = load ptr, ptr %17, align 1
  %19 = call ptr %12(ptr noundef nonnull %8, ptr noundef %18, ptr noundef %16, ptr noundef %14) #8
  %20 = getelementptr inbounds nuw i8, ptr %19, i32 11
  %21 = load i8, ptr %20, align 1
  %22 = icmp eq i8 %21, 1
  br i1 %22, label %23, label %25

23:                                               ; preds = %7
  %24 = getelementptr inbounds nuw i8, ptr %19, i32 11
  store i8 0, ptr %24, align 1
  br label %29

25:                                               ; preds = %7
  %26 = getelementptr inbounds nuw i8, ptr %9, i32 24
  %27 = load ptr, ptr %26, align 1
  %28 = icmp eq ptr %27, null
  br i1 %28, label %29, label %7, !llvm.loop !11

29:                                               ; preds = %25, %23
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #8
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #8
  br label %30

30:                                               ; preds = %0, %29
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Logic_SetEntrypoint(ptr noundef %0) local_unnamed_addr #6 {
  store ptr %0, ptr @plcentrypoint, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Logic_SetBeginpoint(ptr noundef %0) local_unnamed_addr #6 {
  store ptr %0, ptr @plcbeginpoint, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Logic_SetFinalpoint(ptr noundef %0) local_unnamed_addr #6 {
  store ptr %0, ptr @plcfinalpoint, align 4
  ret void
}

; Function Attrs: nounwind
define dso_local void @Logic_Swap() local_unnamed_addr #0 {
  %1 = load ptr, ptr @RUNplcLogic, align 4
  %2 = load ptr, ptr @plcLogic, align 4
  store ptr %2, ptr @RUNplcLogic, align 4
  store ptr %1, ptr @plcLogic, align 4
  %3 = icmp eq ptr %1, null
  br i1 %3, label %9, label %4

4:                                                ; preds = %0, %4
  %5 = phi ptr [ %7, %4 ], [ %1, %0 ]
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 24
  %7 = load ptr, ptr %6, align 1
  tail call void @Heap_Free(ptr noundef nonnull %5) #8
  store ptr %7, ptr @plcLogic, align 4
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %4, !llvm.loop !7

9:                                                ; preds = %4, %0
  store ptr null, ptr @plcLogicBottom, align 4
  store i32 0, ptr @status_logic, align 4
  store ptr null, ptr @plcLogic, align 4
  %10 = load ptr, ptr @plcentrypoint, align 4
  store ptr %10, ptr @RUNplcentrypoint, align 4
  store ptr null, ptr @plcentrypoint, align 4
  %11 = load ptr, ptr @plcbeginpoint, align 4
  store ptr %11, ptr @RUNplcbeginpoint, align 4
  store ptr null, ptr @plcbeginpoint, align 4
  %12 = load ptr, ptr @plcfinalpoint, align 4
  store ptr %12, ptr @RUNplcfinalpoint, align 4
  store ptr null, ptr @plcfinalpoint, align 4
  ret void
}

; Function Attrs: nofree nounwind
define dso_local void @Logic_Disasm() local_unnamed_addr #3 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.4)
  %2 = load ptr, ptr @RUNplcLogic, align 4
  %3 = icmp eq ptr %2, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.5)
  br label %30

6:                                                ; preds = %0, %6
  %7 = phi i32 [ %28, %6 ], [ 1, %0 ]
  %8 = phi ptr [ %27, %6 ], [ %2, %0 ]
  %9 = getelementptr inbounds nuw i8, ptr %8, i32 16
  %10 = load i64, ptr %9, align 1
  %11 = getelementptr inbounds nuw i8, ptr %8, i32 12
  %12 = load ptr, ptr %11, align 1
  %13 = icmp eq ptr %12, @VARIANT_EMPTY
  %14 = select i1 %13, ptr null, ptr %12
  %15 = getelementptr inbounds nuw i8, ptr %8, i32 8
  %16 = load ptr, ptr %15, align 1
  %17 = icmp eq ptr %16, @VARIANT_EMPTY
  %18 = select i1 %17, ptr null, ptr %16
  %19 = getelementptr inbounds nuw i8, ptr %8, i32 4
  %20 = load ptr, ptr %19, align 1
  %21 = icmp eq ptr %20, @VARIANT_EMPTY
  %22 = select i1 %21, ptr null, ptr %20
  %23 = load ptr, ptr %8, align 1
  %24 = load ptr, ptr %23, align 1
  %25 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CI@IHKJGMPN@?5?5line?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5?5?$CF0@", i32 noundef %7, ptr noundef %24, ptr noundef %22, ptr noundef %18, ptr noundef %14, i64 noundef %10)
  %26 = getelementptr inbounds nuw i8, ptr %8, i32 24
  %27 = load ptr, ptr %26, align 1
  %28 = add nuw nsw i32 %7, 1
  %29 = icmp eq ptr %27, null
  br i1 %29, label %30, label %6, !llvm.loop !12

30:                                               ; preds = %6, %4
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #7

; Function Attrs: nofree nounwind
declare noundef i32 @fwrite(ptr noundef readonly captures(none), i32 noundef, i32 noundef, ptr noundef captures(none)) local_unnamed_addr #7

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #6 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree nounwind }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "logic.c", directory: "D:\\work\\rtacc\\examples\\PLCP")
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
