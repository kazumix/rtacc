; ModuleID = '..\PLCP\inifile.c'
source_filename = "..\\PLCP\\inifile.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_02BMJICGCB@rt?$AA@" = comdat any

$"??_C@_03GEMDPLAE@?$DN?6?$AN?$AA@" = comdat any

$"??_C@_03PJBEMDLN@?3?6?$AN?$AA@" = comdat any

$"??_C@_02LIIHNNHG@?6?$AN?$AA@" = comdat any

$"??_C@_08PHDJDNOC@PRIORITY?$AA@" = comdat any

$"??_C@_08KFNFNIOC@SCANRATE?$AA@" = comdat any

$"??_C@_07FCKKGCNH@OVERRUN?$AA@" = comdat any

$"??_C@_07BIBLEOKI@NOPRINT?$AA@" = comdat any

$"??_C@_0L@DHMCEGLJ@IODRV_PATH?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@status_inifile = dso_local local_unnamed_addr global i32 0, align 4
@IniFile_Open.fp = internal unnamed_addr global ptr null, align 4
@"??_C@_02BMJICGCB@rt?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"rt\00", comdat, align 1
@"??_C@_03GEMDPLAE@?$DN?6?$AN?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"=\0A\0D\00", comdat, align 1
@"??_C@_03PJBEMDLN@?3?6?$AN?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c":\0A\0D\00", comdat, align 1
@"??_C@_02LIIHNNHG@?6?$AN?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"\0A\0D\00", comdat, align 1
@__const.IniFile_Load.cTabGlobal = private unnamed_addr constant [14 x i8] c"[PLC_SETTING]\00", align 1
@"??_C@_08PHDJDNOC@PRIORITY?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"PRIORITY\00", comdat, align 1
@"??_C@_08KFNFNIOC@SCANRATE?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SCANRATE\00", comdat, align 1
@"??_C@_07FCKKGCNH@OVERRUN?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"OVERRUN\00", comdat, align 1
@"??_C@_07BIBLEOKI@NOPRINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"NOPRINT\00", comdat, align 1
@"??_C@_0L@DHMCEGLJ@IODRV_PATH?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"IODRV_PATH\00", comdat, align 1
@__const.SectionAndKey_get.dlm1 = private unnamed_addr constant [5 x i8] c"\0A\0D;#\00", align 1
@__const.SectionAndKey_get.dlm3 = private unnamed_addr constant [3 x i8] c" \09\00", align 1

; Function Attrs: nofree nounwind
define dso_local noundef ptr @IniFile_Open(ptr noundef readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = tail call ptr @fopen(ptr noundef %0, ptr noundef nonnull @"??_C@_02BMJICGCB@rt?$AA@")
  store ptr %2, ptr @IniFile_Open.fp, align 4
  ret ptr %2
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: nofree nounwind
declare dso_local noalias noundef ptr @fopen(ptr noundef readonly captures(none), ptr noundef readonly captures(none)) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: nofree nounwind
define dso_local void @IniFile_Close(ptr noundef captures(address_is_null) %0) local_unnamed_addr #0 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %5, label %3

3:                                                ; preds = %1
  %4 = tail call i32 @fclose(ptr noundef nonnull %0)
  br label %5

5:                                                ; preds = %3, %1
  store i32 2, ptr @status_inifile, align 4
  ret void
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fclose(ptr noundef captures(none)) local_unnamed_addr #2

; Function Attrs: nofree nounwind
define dso_local noundef ptr @IniFile_GetLine(ptr noundef captures(address_is_null) %0, ptr noundef %1, i32 noundef %2) local_unnamed_addr #0 {
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
declare dso_local noundef ptr @fgets(ptr noundef writeonly, i32 noundef, ptr noundef captures(none)) local_unnamed_addr #2

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(write, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @IniFile_TrimLine(ptr noundef %0, i32 noundef %1) local_unnamed_addr #3 {
  %3 = tail call ptr @strchr(ptr nonnull dereferenceable(1) %0, i32 59)
  %4 = icmp eq ptr %3, null
  br i1 %4, label %6, label %5

5:                                                ; preds = %2
  store i8 0, ptr %3, align 1
  br label %6

6:                                                ; preds = %5, %2
  %7 = tail call ptr @strchr(ptr nonnull dereferenceable(1) %0, i32 10)
  %8 = icmp eq ptr %7, null
  br i1 %8, label %10, label %9

9:                                                ; preds = %6
  store i8 0, ptr %7, align 1
  br label %10

10:                                               ; preds = %9, %6
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local ptr @strstr(ptr noundef, ptr noundef captures(none)) local_unnamed_addr #4

; Function Attrs: nofree nounwind
define dso_local i32 @IniFile_GetProfileString(ptr noundef captures(address_is_null) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, ptr noundef readonly captures(none) %3, ptr noundef %4, i32 noundef %5) local_unnamed_addr #0 {
  %7 = alloca [128 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %7) #12
  %8 = icmp eq ptr %0, null
  br i1 %8, label %9, label %12

9:                                                ; preds = %6
  %10 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %4, ptr noundef nonnull dereferenceable(1) %3) #12
  %11 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %4) #12
  br label %21

12:                                               ; preds = %6
  %13 = call fastcc signext i8 @LowlevelGetProfileString(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %7)
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %18, label %15

15:                                               ; preds = %12
  %16 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %4, ptr noundef nonnull dereferenceable(1) %3) #12
  %17 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %4) #12
  br label %21

18:                                               ; preds = %12
  %19 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %4, ptr noundef nonnull dereferenceable(1) %7) #12
  %20 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %4) #12
  br label %21

21:                                               ; preds = %18, %15, %9
  %22 = phi i32 [ %11, %9 ], [ %17, %15 ], [ %20, %18 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %7) #12
  ret i32 %22
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none)) local_unnamed_addr #5

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strlen(ptr noundef captures(none)) local_unnamed_addr #4

; Function Attrs: nofree nounwind
define internal fastcc signext range(i8 -1, 1) i8 @LowlevelGetProfileString(ptr noundef nonnull captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, ptr noundef nonnull initializes((0, 1)) %3) unnamed_addr #0 {
  %5 = alloca [128 x i8], align 1
  %6 = alloca [3 x i8], align 1
  %7 = alloca [128 x i8], align 1
  %8 = alloca [128 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %7) #12
  call void @llvm.lifetime.start.p0(ptr nonnull %8) #12
  %9 = tail call i32 @fseek(ptr noundef nonnull %0, i32 noundef 0, i32 noundef 0)
  store i8 0, ptr %3, align 1
  store i8 0, ptr %8, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #12
  call void @llvm.lifetime.start.p0(ptr nonnull %6) #12
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(3) %6, ptr noundef nonnull align 1 dereferenceable(3) @__const.SectionAndKey_get.dlm3, i32 3, i1 false)
  store i8 0, ptr %7, align 1
  %10 = call ptr @fgets(ptr noundef nonnull %5, i32 noundef 127, ptr noundef nonnull %0)
  %11 = icmp eq ptr %10, null
  br i1 %11, label %14, label %12

12:                                               ; preds = %4
  %13 = getelementptr inbounds nuw i8, ptr %5, i32 127
  br label %15

14:                                               ; preds = %55, %4
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #12
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #12
  br label %73

15:                                               ; preds = %12, %55
  store i8 0, ptr %13, align 1
  %16 = call i32 @strcspn(ptr noundef nonnull %5, ptr noundef nonnull @__const.SectionAndKey_get.dlm1)
  %17 = getelementptr inbounds nuw i8, ptr %5, i32 %16
  store i8 0, ptr %17, align 1
  %18 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %5) #12
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %40, label %20

20:                                               ; preds = %15, %33
  %21 = phi i32 [ %36, %33 ], [ 0, %15 ]
  %22 = phi i16 [ %34, %33 ], [ 0, %15 ]
  %23 = phi i16 [ %35, %33 ], [ 0, %15 ]
  %24 = getelementptr inbounds nuw i8, ptr %5, i32 %21
  %25 = load i8, ptr %24, align 1
  %26 = sext i8 %25 to i32
  %27 = call ptr @strchr(ptr noundef nonnull dereferenceable(1) %6, i32 noundef %26) #12
  %28 = icmp eq ptr %27, null
  br i1 %28, label %29, label %33

29:                                               ; preds = %20
  %30 = add i16 %22, 1
  %31 = zext i16 %22 to i32
  %32 = getelementptr inbounds nuw i8, ptr %7, i32 %31
  store i8 %25, ptr %32, align 1
  br label %33

33:                                               ; preds = %29, %20
  %34 = phi i16 [ %30, %29 ], [ %22, %20 ]
  %35 = add i16 %23, 1
  %36 = zext i16 %35 to i32
  %37 = icmp ugt i32 %18, %36
  br i1 %37, label %20, label %38, !llvm.loop !7

38:                                               ; preds = %33
  %39 = zext i16 %34 to i32
  br label %40

40:                                               ; preds = %38, %15
  %41 = phi i32 [ 0, %15 ], [ %39, %38 ]
  %42 = getelementptr inbounds nuw i8, ptr %7, i32 %41
  store i8 0, ptr %42, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #12
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #12
  %43 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %7) #12
  %44 = icmp ult i32 %43, 3
  br i1 %44, label %55, label %45

45:                                               ; preds = %40
  %46 = load i8, ptr %7, align 1
  %47 = icmp eq i8 %46, 91
  br i1 %47, label %48, label %58

48:                                               ; preds = %45
  %49 = getelementptr i8, ptr %7, i32 %43
  %50 = getelementptr i8, ptr %49, i32 -1
  %51 = load i8, ptr %50, align 1
  %52 = icmp eq i8 %51, 93
  br i1 %52, label %53, label %58

53:                                               ; preds = %48
  %54 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %8, ptr noundef nonnull dereferenceable(1) %7) #12
  br label %55

55:                                               ; preds = %58, %61, %53, %40, %64
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #12
  call void @llvm.lifetime.start.p0(ptr nonnull %6) #12
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(3) %6, ptr noundef nonnull align 1 dereferenceable(3) @__const.SectionAndKey_get.dlm3, i32 3, i1 false)
  store i8 0, ptr %7, align 1
  %56 = call ptr @fgets(ptr noundef nonnull %5, i32 noundef 127, ptr noundef nonnull %0)
  %57 = icmp eq ptr %56, null
  br i1 %57, label %14, label %15

58:                                               ; preds = %48, %45
  %59 = call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %8, ptr noundef nonnull dereferenceable(1) %1) #12
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %55

61:                                               ; preds = %58
  %62 = call ptr @strstr(ptr noundef nonnull dereferenceable(1) %7, ptr noundef nonnull dereferenceable(1) %2) #12
  %63 = icmp eq ptr %62, null
  br i1 %63, label %55, label %64

64:                                               ; preds = %61
  %65 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %2) #12
  %66 = getelementptr inbounds nuw i8, ptr %62, i32 %65
  %67 = load i8, ptr %66, align 1
  %68 = icmp eq i8 %67, 61
  br i1 %68, label %69, label %55

69:                                               ; preds = %64
  %70 = getelementptr inbounds nuw i8, ptr %62, i32 %65
  %71 = getelementptr inbounds nuw i8, ptr %70, i32 1
  %72 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %3, ptr noundef nonnull dereferenceable(1) %71) #12
  br label %73

73:                                               ; preds = %14, %69
  %74 = phi i8 [ -1, %14 ], [ 0, %69 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %8) #12
  call void @llvm.lifetime.end.p0(ptr nonnull %7) #12
  ret i8 %74
}

; Function Attrs: nofree nounwind
define dso_local i32 @IniFile_GetProfileInt(ptr noundef captures(address_is_null) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = alloca [128 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #12
  %6 = icmp eq ptr %0, null
  br i1 %6, label %12, label %7

7:                                                ; preds = %4
  %8 = call fastcc signext i8 @LowlevelGetProfileString(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %5)
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %7
  %11 = call i32 @atoi(ptr noundef nonnull %5)
  br label %12

12:                                               ; preds = %7, %4, %10
  %13 = phi i32 [ %11, %10 ], [ %3, %4 ], [ %3, %7 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #12
  ret i32 %13
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(read)
declare dso_local i32 @atoi(ptr noundef captures(none)) local_unnamed_addr #6

; Function Attrs: nofree nounwind
define dso_local i32 @IniFile_SeekSection(ptr noundef captures(address_is_null) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #0 {
  %3 = alloca [128 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #12
  %4 = tail call i32 @fseek(ptr noundef %0, i32 noundef 0, i32 noundef 0)
  %5 = icmp eq ptr %0, null
  br i1 %5, label %22, label %6

6:                                                ; preds = %2, %19
  %7 = phi i32 [ %11, %19 ], [ 0, %2 ]
  %8 = call ptr @fgets(ptr noundef nonnull %3, i32 noundef 128, ptr noundef nonnull %0)
  %9 = icmp eq ptr %8, null
  br i1 %9, label %22, label %10

10:                                               ; preds = %6
  %11 = add nuw nsw i32 %7, 1
  %12 = call ptr @strchr(ptr nonnull dereferenceable(1) %3, i32 59)
  %13 = icmp eq ptr %12, null
  br i1 %13, label %15, label %14

14:                                               ; preds = %10
  store i8 0, ptr %12, align 1
  br label %15

15:                                               ; preds = %14, %10
  %16 = call ptr @strchr(ptr nonnull dereferenceable(1) %3, i32 10)
  %17 = icmp eq ptr %16, null
  br i1 %17, label %19, label %18

18:                                               ; preds = %15
  store i8 0, ptr %16, align 1
  br label %19

19:                                               ; preds = %15, %18
  %20 = call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %3, ptr noundef nonnull dereferenceable(1) %1) #12
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %6, !llvm.loop !9

22:                                               ; preds = %19, %6, %2
  %23 = phi i32 [ 0, %2 ], [ %11, %19 ], [ 0, %6 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #12
  ret i32 %23
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fseek(ptr noundef captures(none), i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strcmp(ptr noundef captures(none), ptr noundef captures(none)) local_unnamed_addr #4

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define dso_local void @IniFile_PargeTimer(ptr noundef %0, ptr noundef writeonly captures(none) initializes((0, 4)) %1, ptr noundef writeonly captures(none) initializes((0, 4)) %2, ptr noundef writeonly captures(none) initializes((0, 4)) %3) local_unnamed_addr #7 {
  %5 = tail call ptr @strtok(ptr noundef %0, ptr noundef nonnull @"??_C@_03GEMDPLAE@?$DN?6?$AN?$AA@")
  store ptr %5, ptr %1, align 4
  %6 = tail call ptr @strtok(ptr noundef null, ptr noundef nonnull @"??_C@_03PJBEMDLN@?3?6?$AN?$AA@")
  store ptr %6, ptr %2, align 4
  %7 = tail call ptr @strtok(ptr noundef null, ptr noundef nonnull @"??_C@_02LIIHNNHG@?6?$AN?$AA@")
  store ptr %7, ptr %3, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn
declare dso_local ptr @strtok(ptr noundef, ptr noundef readonly captures(none)) local_unnamed_addr #8

; Function Attrs: nounwind
define dso_local noundef i32 @IniFile_Load(ptr noundef readonly captures(none) %0) local_unnamed_addr #9 {
  %2 = alloca [128 x i8], align 1
  %3 = alloca [128 x i8], align 1
  %4 = alloca [128 x i8], align 1
  %5 = alloca [128 x i8], align 1
  %6 = alloca [128 x i8], align 1
  %7 = tail call noundef ptr @fopen(ptr noundef readonly %0, ptr noundef nonnull @"??_C@_02BMJICGCB@rt?$AA@")
  store ptr %7, ptr @IniFile_Open.fp, align 4
  %8 = icmp eq ptr %7, null
  br i1 %8, label %39, label %9

9:                                                ; preds = %1
  call void @llvm.lifetime.start.p0(ptr nonnull %6) #12
  %10 = call fastcc signext i8 @LowlevelGetProfileString(ptr noundef nonnull %7, ptr noundef nonnull readonly @__const.IniFile_Load.cTabGlobal, ptr noundef nonnull @"??_C@_08PHDJDNOC@PRIORITY?$AA@", ptr noundef %6)
  %11 = icmp eq i8 %10, 0
  br i1 %11, label %12, label %15

12:                                               ; preds = %9
  %13 = call i32 @atoi(ptr noundef nonnull %6)
  %14 = trunc i32 %13 to i8
  br label %15

15:                                               ; preds = %12, %9
  %16 = phi i8 [ %14, %12 ], [ -116, %9 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #12
  call void @Config_Set_BasePriority(i8 noundef zeroext %16) #12
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #12
  %17 = call fastcc signext i8 @LowlevelGetProfileString(ptr noundef nonnull %7, ptr noundef nonnull readonly @__const.IniFile_Load.cTabGlobal, ptr noundef nonnull @"??_C@_08KFNFNIOC@SCANRATE?$AA@", ptr noundef %5)
  %18 = icmp eq i8 %17, 0
  br i1 %18, label %19, label %21

19:                                               ; preds = %15
  %20 = call i32 @atoi(ptr noundef nonnull %5)
  br label %21

21:                                               ; preds = %19, %15
  %22 = phi i32 [ %20, %19 ], [ 1000, %15 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #12
  call void @Config_Set_ScanFreq(i32 noundef %22) #12
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #12
  %23 = call fastcc signext i8 @LowlevelGetProfileString(ptr noundef nonnull %7, ptr noundef nonnull readonly @__const.IniFile_Load.cTabGlobal, ptr noundef nonnull @"??_C@_07FCKKGCNH@OVERRUN?$AA@", ptr noundef %4)
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %25, label %27

25:                                               ; preds = %21
  %26 = call i32 @atoi(ptr noundef nonnull %4)
  br label %27

27:                                               ; preds = %25, %21
  %28 = phi i32 [ %26, %25 ], [ 0, %21 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #12
  call void @Config_Set_Overrun(i32 noundef %28) #12
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #12
  %29 = call fastcc signext i8 @LowlevelGetProfileString(ptr noundef nonnull %7, ptr noundef nonnull readonly @__const.IniFile_Load.cTabGlobal, ptr noundef nonnull @"??_C@_07BIBLEOKI@NOPRINT?$AA@", ptr noundef %3)
  %30 = icmp eq i8 %29, 0
  br i1 %30, label %32, label %31

31:                                               ; preds = %27
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #12
  br label %36

32:                                               ; preds = %27
  %33 = call i32 @atoi(ptr noundef nonnull %3)
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #12
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %36, label %35

35:                                               ; preds = %32
  call void @Config_Set_PrintMode(i8 noundef zeroext 0) #12
  br label %36

36:                                               ; preds = %32, %35, %31
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #12
  %37 = call fastcc signext i8 @LowlevelGetProfileString(ptr noundef nonnull %7, ptr noundef nonnull readonly @__const.IniFile_Load.cTabGlobal, ptr noundef nonnull @"??_C@_0L@DHMCEGLJ@IODRV_PATH?$AA@", ptr noundef %2)
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #12
  %38 = call i32 @fclose(ptr noundef nonnull %7)
  store i32 2, ptr @status_inifile, align 4
  br label %39

39:                                               ; preds = %36, %1
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #10

declare dso_local void @Config_Set_BasePriority(i8 noundef zeroext) local_unnamed_addr #11

declare dso_local void @Config_Set_ScanFreq(i32 noundef) local_unnamed_addr #11

declare dso_local void @Config_Set_Overrun(i32 noundef) local_unnamed_addr #11

declare dso_local void @Config_Set_PrintMode(i8 noundef zeroext) local_unnamed_addr #11

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strcspn(ptr noundef captures(none), ptr noundef captures(none)) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local ptr @strchr(ptr noundef, i32 noundef) local_unnamed_addr #4

attributes #0 = { nofree nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree norecurse nounwind willreturn memory(write, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nocallback nofree nounwind willreturn memory(read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree norecurse nounwind willreturn "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { mustprogress nocallback nofree nounwind willreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #11 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\inifile.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
