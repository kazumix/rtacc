; ModuleID = '..\PLCP\argument.c'
source_filename = "..\\PLCP\\argument.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_0BC@NALIPHCK@Argument_PouFiles?$AA@" = comdat any

$"??_C@_01IHBHIGKO@?0?$AA@" = comdat any

$"??_C@_04KEPPKGIG@?4RTA?$AA@" = comdat any

$"??_C@_04PKIPNKLG@?4INI?$AA@" = comdat any

$"??_C@_05CDJHHCF@?9STEP?$AA@" = comdat any

$"??_C@_08OIIOOAJL@?9NOPRINT?$AA@" = comdat any

$"??_C@_06MAGLMDKM@?9PRINT?$AA@" = comdat any

$"??_C@_07JGNONNOP@?9REMOTE?$AA@" = comdat any

$"??_C@_0L@JJOKJJEO@?9PRIORITY?1?$AA@" = comdat any

$"??_C@_0L@JJLIHFKL@?9SCANRATE?1?$AA@" = comdat any

$"??_C@_08PPAPKFEF@?9INTPRT?1?$AA@" = comdat any

$"??_C@_05HGAABLCC@?9POU?1?$AA@" = comdat any

$"??_C@_07BAHIKDNH@?9BEGIN?1?$AA@" = comdat any

$"??_C@_07FINFNJEP@?9FINAL?1?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@"??_C@_0BC@NALIPHCK@Argument_PouFiles?$AA@" = linkonce_odr dso_local unnamed_addr constant [18 x i8] c"Argument_PouFiles\00", comdat, align 1
@"??_C@_01IHBHIGKO@?0?$AA@" = linkonce_odr dso_local unnamed_addr constant [2 x i8] c",\00", comdat, align 1
@"??_C@_04KEPPKGIG@?4RTA?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c".RTA\00", comdat, align 1
@"??_C@_04PKIPNKLG@?4INI?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c".INI\00", comdat, align 1
@"??_C@_05CDJHHCF@?9STEP?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"-STEP\00", comdat, align 1
@"??_C@_08OIIOOAJL@?9NOPRINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"-NOPRINT\00", comdat, align 1
@"??_C@_06MAGLMDKM@?9PRINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"-PRINT\00", comdat, align 1
@"??_C@_07JGNONNOP@?9REMOTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"-REMOTE\00", comdat, align 1
@"??_C@_0L@JJOKJJEO@?9PRIORITY?1?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"-PRIORITY/\00", comdat, align 1
@"??_C@_0L@JJLIHFKL@?9SCANRATE?1?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"-SCANRATE/\00", comdat, align 1
@"??_C@_08PPAPKFEF@?9INTPRT?1?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"-INTPRT/\00", comdat, align 1
@"??_C@_05HGAABLCC@?9POU?1?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"-POU/\00", comdat, align 1
@"??_C@_07BAHIKDNH@?9BEGIN?1?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"-BEGIN/\00", comdat, align 1
@"??_C@_07FINFNJEP@?9FINAL?1?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"-FINAL/\00", comdat, align 1

; Function Attrs: nounwind
define dso_local void @Argument_PathFromFolder(ptr noundef readonly captures(none) %0, ptr noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = alloca [128 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #10
  tail call void @llvm.memset.p0.i32(ptr align 1 %1, i8 0, i32 %2, i1 false)
  %5 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %4, ptr noundef nonnull dereferenceable(1) %0) #10
  %6 = call zeroext i16 @INtime_CheckDRTOS() #10
  %7 = and i16 %6, 255
  %8 = icmp eq i16 %7, 0
  %9 = select i1 %8, i32 92, i32 47
  %10 = call ptr @strrchr(ptr noundef nonnull dereferenceable(1) %4, i32 noundef %9) #10
  %11 = icmp eq ptr %10, null
  br i1 %11, label %15, label %12

12:                                               ; preds = %3
  %13 = getelementptr inbounds nuw i8, ptr %10, i32 1
  store i8 0, ptr %13, align 1
  %14 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %1, ptr noundef nonnull dereferenceable(1) %4) #10
  br label %15

15:                                               ; preds = %12, %3
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #10
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none)) local_unnamed_addr #3

declare dso_local zeroext i16 @INtime_CheckDRTOS() local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local ptr @strrchr(ptr noundef, i32 noundef) local_unnamed_addr #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: nounwind
define dso_local void @Argument_PathFromBase(ptr noundef readonly captures(none) %0, ptr noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = alloca [128 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #10
  tail call void @llvm.memset.p0.i32(ptr align 1 %1, i8 0, i32 %2, i1 false)
  %5 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %4, ptr noundef nonnull dereferenceable(1) %0) #10
  %6 = call zeroext i16 @INtime_CheckDRTOS() #10
  %7 = and i16 %6, 255
  %8 = icmp eq i16 %7, 0
  %9 = select i1 %8, i32 92, i32 47
  %10 = call ptr @strrchr(ptr noundef nonnull dereferenceable(1) %4, i32 noundef %9) #10
  %11 = call ptr @strrchr(ptr noundef nonnull dereferenceable(1) %4, i32 noundef 46) #10
  %12 = icmp eq ptr %11, null
  br i1 %12, label %18, label %13

13:                                               ; preds = %3
  store i8 0, ptr %11, align 1
  %14 = icmp eq ptr %10, null
  br i1 %14, label %18, label %15

15:                                               ; preds = %13
  %16 = getelementptr inbounds nuw i8, ptr %10, i32 1
  %17 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %1, ptr noundef nonnull dereferenceable(1) %16) #10
  br label %18

18:                                               ; preds = %3, %15, %13
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #10
  ret void
}

; Function Attrs: nounwind
define dso_local void @Argument_PouFiles(ptr noundef readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %0) #10
  %3 = add i32 %2, 1
  %4 = tail call ptr @Heap_Alloc(i32 noundef %3, ptr noundef nonnull @"??_C@_0BC@NALIPHCK@Argument_PouFiles?$AA@") #10
  %5 = icmp eq ptr %4, null
  br i1 %5, label %18, label %6

6:                                                ; preds = %1
  %7 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %4, ptr noundef nonnull dereferenceable(1) %0) #10
  %8 = tail call i32 @String_Packing(ptr noundef nonnull %4) #10
  %9 = tail call ptr @strtok(ptr noundef nonnull %4, ptr noundef nonnull @"??_C@_01IHBHIGKO@?0?$AA@")
  %10 = icmp eq ptr %9, null
  br i1 %10, label %17, label %11

11:                                               ; preds = %6, %11
  %12 = phi ptr [ %15, %11 ], [ %9, %6 ]
  %13 = tail call i32 @String_Unpacking(ptr noundef nonnull %4) #10
  %14 = tail call ptr @Poufile_Add(ptr noundef nonnull %12) #10
  %15 = tail call ptr @strtok(ptr noundef null, ptr noundef nonnull @"??_C@_01IHBHIGKO@?0?$AA@")
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %11, !llvm.loop !7

17:                                               ; preds = %11, %6
  tail call void @Heap_Free(ptr noundef nonnull %4) #10
  br label %18

18:                                               ; preds = %17, %1
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strlen(ptr noundef captures(none)) local_unnamed_addr #5

declare dso_local ptr @Heap_Alloc(i32 noundef, ptr noundef) local_unnamed_addr #4

declare dso_local i32 @String_Packing(ptr noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nounwind willreturn
declare dso_local ptr @strtok(ptr noundef, ptr noundef readonly captures(none)) local_unnamed_addr #6

declare dso_local i32 @String_Unpacking(ptr noundef) local_unnamed_addr #4

declare dso_local ptr @Poufile_Add(ptr noundef) local_unnamed_addr #4

declare dso_local void @Heap_Free(ptr noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local void @Argument_Init(i32 noundef %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #0 {
  %3 = alloca [128 x i8], align 1
  %4 = alloca [128 x i8], align 1
  %5 = alloca [128 x i8], align 1
  %6 = alloca [128 x i8], align 1
  %7 = alloca [128 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %6) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %7) #10
  %8 = load ptr, ptr %1, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #10
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(128) %5, i8 0, i32 128, i1 false)
  %9 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %4, ptr noundef nonnull readonly dereferenceable(1) %8) #10
  %10 = call zeroext i16 @INtime_CheckDRTOS() #10
  %11 = and i16 %10, 255
  %12 = icmp eq i16 %11, 0
  %13 = select i1 %12, i32 92, i32 47
  %14 = call ptr @strrchr(ptr noundef nonnull dereferenceable(1) %4, i32 noundef %13) #10
  %15 = icmp eq ptr %14, null
  br i1 %15, label %19, label %16

16:                                               ; preds = %2
  %17 = getelementptr inbounds nuw i8, ptr %14, i32 1
  store i8 0, ptr %17, align 1
  %18 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %5, ptr noundef nonnull dereferenceable(1) %4) #10
  br label %19

19:                                               ; preds = %2, %16
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #10
  call void @Config_Set_WorkFolder(ptr noundef nonnull %5) #10
  call void @Config_Set_RtaFolder(ptr noundef nonnull %5) #10
  %20 = load ptr, ptr %1, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #10
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(128) %6, i8 0, i32 128, i1 false)
  %21 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %3, ptr noundef nonnull readonly dereferenceable(1) %20) #10
  %22 = call zeroext i16 @INtime_CheckDRTOS() #10
  %23 = and i16 %22, 255
  %24 = icmp eq i16 %23, 0
  %25 = select i1 %24, i32 92, i32 47
  %26 = call ptr @strrchr(ptr noundef nonnull dereferenceable(1) %3, i32 noundef %25) #10
  %27 = call ptr @strrchr(ptr noundef nonnull dereferenceable(1) %3, i32 noundef 46) #10
  %28 = icmp eq ptr %27, null
  br i1 %28, label %34, label %29

29:                                               ; preds = %19
  store i8 0, ptr %27, align 1
  %30 = icmp eq ptr %26, null
  br i1 %30, label %34, label %31

31:                                               ; preds = %29
  %32 = getelementptr inbounds nuw i8, ptr %26, i32 1
  %33 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %6, ptr noundef nonnull dereferenceable(1) %32) #10
  br label %34

34:                                               ; preds = %19, %29, %31
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #10
  call void @Config_Set_BaseName(ptr noundef nonnull %6) #10
  %35 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %7, ptr noundef nonnull dereferenceable(1) %5) #10
  %36 = call ptr @strcat(ptr noundef nonnull dereferenceable(1) %7, ptr noundef nonnull dereferenceable(1) %6) #10
  %37 = call i32 @strlen(ptr nonnull dereferenceable(1) %7)
  %38 = getelementptr inbounds i8, ptr %7, i32 %37
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(5) %38, ptr noundef nonnull align 1 dereferenceable(5) @"??_C@_04KEPPKGIG@?4RTA?$AA@", i32 5, i1 false)
  call void @Config_Set_RtaFilePath(ptr noundef nonnull %7) #10
  %39 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %7, ptr noundef nonnull dereferenceable(1) %5) #10
  %40 = call ptr @strcat(ptr noundef nonnull dereferenceable(1) %7, ptr noundef nonnull dereferenceable(1) %6) #10
  %41 = call i32 @strlen(ptr nonnull dereferenceable(1) %7)
  %42 = getelementptr inbounds i8, ptr %7, i32 %41
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(5) %42, ptr noundef nonnull align 1 dereferenceable(5) @"??_C@_04PKIPNKLG@?4INI?$AA@", i32 5, i1 false)
  call void @Config_Set_IniFilePath(ptr noundef nonnull %7) #10
  %43 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %7, ptr noundef nonnull dereferenceable(1) %5) #10
  call void @Config_Set_RslFolder(ptr noundef nonnull %7) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %7) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #10
  ret void
}

declare dso_local void @Config_Set_WorkFolder(ptr noundef) local_unnamed_addr #4

declare dso_local void @Config_Set_RtaFolder(ptr noundef) local_unnamed_addr #4

declare dso_local void @Config_Set_BaseName(ptr noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcat(ptr noalias noundef returned, ptr noalias noundef readonly captures(none)) local_unnamed_addr #3

declare dso_local void @Config_Set_RtaFilePath(ptr noundef) local_unnamed_addr #4

declare dso_local void @Config_Set_IniFilePath(ptr noundef) local_unnamed_addr #4

declare dso_local void @Config_Set_RslFolder(ptr noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local void @Argument_Step(ptr noundef readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(6) @"??_C@_05CDJHHCF@?9STEP?$AA@") #10
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %5

4:                                                ; preds = %1
  tail call void @Config_Set_StepMode(i8 noundef zeroext 1) #10
  br label %5

5:                                                ; preds = %4, %1
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strcmp(ptr noundef captures(none), ptr noundef captures(none)) local_unnamed_addr #5

declare dso_local void @Config_Set_StepMode(i8 noundef zeroext) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local void @Argument_NoPrint(ptr noundef readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(9) @"??_C@_08OIIOOAJL@?9NOPRINT?$AA@") #10
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %5

4:                                                ; preds = %1
  tail call void @Config_Set_PrintMode(i8 noundef zeroext 0) #10
  br label %5

5:                                                ; preds = %4, %1
  ret void
}

declare dso_local void @Config_Set_PrintMode(i8 noundef zeroext) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local void @Argument_Print(ptr noundef readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(7) @"??_C@_06MAGLMDKM@?9PRINT?$AA@") #10
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %5

4:                                                ; preds = %1
  tail call void @Config_Set_PrintMode(i8 noundef zeroext 1) #10
  br label %5

5:                                                ; preds = %4, %1
  ret void
}

; Function Attrs: nounwind
define dso_local void @Argument_Remote(ptr noundef readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(8) @"??_C@_07JGNONNOP@?9REMOTE?$AA@") #10
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %5

4:                                                ; preds = %1
  tail call void @Config_Set_RemoteMode(i8 noundef zeroext 1) #10
  br label %5

5:                                                ; preds = %4, %1
  ret void
}

declare dso_local void @Config_Set_RemoteMode(i8 noundef zeroext) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local void @Argument_Priority(ptr noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @strnicmp(ptr noundef %0, ptr noundef nonnull @"??_C@_0L@JJOKJJEO@?9PRIORITY?1?$AA@", i32 noundef 10) #10
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %8

4:                                                ; preds = %1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 10
  %6 = tail call i32 @atoi(ptr noundef nonnull %5)
  %7 = trunc i32 %6 to i8
  tail call void @Config_Set_BasePriority(i8 noundef zeroext %7) #10
  br label %8

8:                                                ; preds = %4, %1
  ret void
}

declare dso_local i32 @strnicmp(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #4

declare dso_local void @Config_Set_BasePriority(i8 noundef zeroext) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(read)
declare dso_local i32 @atoi(ptr noundef captures(none)) local_unnamed_addr #7

; Function Attrs: nounwind
define dso_local void @Argument_ScanRate(ptr noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @strnicmp(ptr noundef %0, ptr noundef nonnull @"??_C@_0L@JJLIHFKL@?9SCANRATE?1?$AA@", i32 noundef 10) #10
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %7

4:                                                ; preds = %1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 10
  %6 = tail call i32 @atoi(ptr noundef nonnull %5)
  tail call void @Config_Set_ScanFreq(i32 noundef %6) #10
  br label %7

7:                                                ; preds = %4, %1
  ret void
}

declare dso_local void @Config_Set_ScanFreq(i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local void @Argument_Intprt(ptr noundef %0) local_unnamed_addr #0 {
  %2 = alloca [128 x i8], align 1
  %3 = alloca [128 x i8], align 1
  %4 = alloca [128 x i8], align 1
  %5 = alloca [128 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #10
  %6 = tail call i32 @strnicmp(ptr noundef %0, ptr noundef nonnull @"??_C@_08PPAPKFEF@?9INTPRT?1?$AA@", i32 noundef 8) #10
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %37

8:                                                ; preds = %1
  tail call void @Config_Set_RunMode(i8 noundef zeroext 1) #10
  %9 = getelementptr inbounds nuw i8, ptr %0, i32 8
  tail call void @Config_Set_MnmFilePath(ptr noundef nonnull %9) #10
  %10 = tail call ptr @Config_Get_MnmFilePath() #10
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #10
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(128) %4, i8 0, i32 128, i1 false)
  %11 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %3, ptr noundef nonnull readonly dereferenceable(1) %10) #10
  %12 = call zeroext i16 @INtime_CheckDRTOS() #10
  %13 = and i16 %12, 255
  %14 = icmp eq i16 %13, 0
  %15 = select i1 %14, i32 92, i32 47
  %16 = call ptr @strrchr(ptr noundef nonnull dereferenceable(1) %3, i32 noundef %15) #10
  %17 = icmp eq ptr %16, null
  br i1 %17, label %21, label %18

18:                                               ; preds = %8
  %19 = getelementptr inbounds nuw i8, ptr %16, i32 1
  store i8 0, ptr %19, align 1
  %20 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %4, ptr noundef nonnull dereferenceable(1) %3) #10
  br label %21

21:                                               ; preds = %8, %18
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #10
  call void @Config_Set_WorkFolder(ptr noundef nonnull %4) #10
  %22 = call ptr @Config_Get_MnmFilePath() #10
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #10
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(128) %5, i8 0, i32 128, i1 false)
  %23 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %2, ptr noundef nonnull readonly dereferenceable(1) %22) #10
  %24 = call zeroext i16 @INtime_CheckDRTOS() #10
  %25 = and i16 %24, 255
  %26 = icmp eq i16 %25, 0
  %27 = select i1 %26, i32 92, i32 47
  %28 = call ptr @strrchr(ptr noundef nonnull dereferenceable(1) %2, i32 noundef %27) #10
  %29 = call ptr @strrchr(ptr noundef nonnull dereferenceable(1) %2, i32 noundef 46) #10
  %30 = icmp eq ptr %29, null
  br i1 %30, label %36, label %31

31:                                               ; preds = %21
  store i8 0, ptr %29, align 1
  %32 = icmp eq ptr %28, null
  br i1 %32, label %36, label %33

33:                                               ; preds = %31
  %34 = getelementptr inbounds nuw i8, ptr %28, i32 1
  %35 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %5, ptr noundef nonnull dereferenceable(1) %34) #10
  br label %36

36:                                               ; preds = %21, %31, %33
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #10
  call void @Config_Set_BaseName(ptr noundef nonnull %5) #10
  br label %37

37:                                               ; preds = %36, %1
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #10
  ret void
}

declare dso_local void @Config_Set_RunMode(i8 noundef zeroext) local_unnamed_addr #4

declare dso_local void @Config_Set_MnmFilePath(ptr noundef) local_unnamed_addr #4

declare dso_local ptr @Config_Get_MnmFilePath() local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local void @Argument_Pou(ptr noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @strnicmp(ptr noundef %0, ptr noundef nonnull @"??_C@_05HGAABLCC@?9POU?1?$AA@", i32 noundef 5) #10
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 5
  tail call void @Argument_PouFiles(ptr noundef nonnull %5)
  br label %6

6:                                                ; preds = %4, %1
  ret void
}

; Function Attrs: nounwind
define dso_local void @Argument_Begin(ptr noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @strnicmp(ptr noundef %0, ptr noundef nonnull @"??_C@_07BAHIKDNH@?9BEGIN?1?$AA@", i32 noundef 7) #10
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %7

4:                                                ; preds = %1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 7
  %6 = tail call ptr @Poufile_Set_Begin(ptr noundef nonnull %5) #10
  br label %7

7:                                                ; preds = %4, %1
  ret void
}

declare dso_local ptr @Poufile_Set_Begin(ptr noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local void @Argument_Final(ptr noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @strnicmp(ptr noundef %0, ptr noundef nonnull @"??_C@_07FINFNJEP@?9FINAL?1?$AA@", i32 noundef 7) #10
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %7

4:                                                ; preds = %1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 7
  %6 = tail call ptr @Poufile_Set_Final(ptr noundef nonnull %5) #10
  br label %7

7:                                                ; preds = %4, %1
  ret void
}

declare dso_local ptr @Poufile_Set_Final(ptr noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local void @Argument_Process(i32 noundef %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #0 {
  %3 = alloca [512 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #10
  %4 = icmp sgt i32 %0, 1
  br i1 %4, label %5, label %57

5:                                                ; preds = %2
  %6 = getelementptr inbounds nuw i8, ptr %3, i32 10
  %7 = getelementptr inbounds nuw i8, ptr %3, i32 5
  %8 = getelementptr inbounds nuw i8, ptr %3, i32 7
  br label %9

9:                                                ; preds = %5, %54
  %10 = phi i32 [ 1, %5 ], [ %55, %54 ]
  %11 = getelementptr inbounds nuw ptr, ptr %1, i32 %10
  %12 = load ptr, ptr %11, align 4
  %13 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %3, ptr noundef nonnull dereferenceable(1) %12) #10
  %14 = call i32 @memcmp(ptr noundef nonnull dereferenceable(6) %3, ptr noundef nonnull dereferenceable(6) @"??_C@_05CDJHHCF@?9STEP?$AA@", i32 6)
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %9
  call void @Config_Set_StepMode(i8 noundef zeroext 1) #10
  br label %17

17:                                               ; preds = %9, %16
  %18 = call i32 @memcmp(ptr noundef nonnull dereferenceable(9) %3, ptr noundef nonnull dereferenceable(9) @"??_C@_08OIIOOAJL@?9NOPRINT?$AA@", i32 9)
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %21

20:                                               ; preds = %17
  call void @Config_Set_PrintMode(i8 noundef zeroext 0) #10
  br label %21

21:                                               ; preds = %17, %20
  %22 = call i32 @memcmp(ptr noundef nonnull dereferenceable(7) %3, ptr noundef nonnull dereferenceable(7) @"??_C@_06MAGLMDKM@?9PRINT?$AA@", i32 7)
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %25

24:                                               ; preds = %21
  call void @Config_Set_PrintMode(i8 noundef zeroext 1) #10
  br label %25

25:                                               ; preds = %21, %24
  %26 = call i32 @memcmp(ptr noundef nonnull dereferenceable(8) %3, ptr noundef nonnull dereferenceable(8) @"??_C@_07JGNONNOP@?9REMOTE?$AA@", i32 8)
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %29

28:                                               ; preds = %25
  call void @Config_Set_RemoteMode(i8 noundef zeroext 1) #10
  br label %29

29:                                               ; preds = %25, %28
  %30 = call i32 @strnicmp(ptr noundef nonnull %3, ptr noundef nonnull @"??_C@_0L@JJOKJJEO@?9PRIORITY?1?$AA@", i32 noundef 10) #10
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %35

32:                                               ; preds = %29
  %33 = call i32 @atoi(ptr noundef nonnull %6)
  %34 = trunc i32 %33 to i8
  call void @Config_Set_BasePriority(i8 noundef zeroext %34) #10
  br label %35

35:                                               ; preds = %29, %32
  %36 = call i32 @strnicmp(ptr noundef nonnull %3, ptr noundef nonnull @"??_C@_0L@JJLIHFKL@?9SCANRATE?1?$AA@", i32 noundef 10) #10
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %40

38:                                               ; preds = %35
  %39 = call i32 @atoi(ptr noundef nonnull %6)
  call void @Config_Set_ScanFreq(i32 noundef %39) #10
  br label %40

40:                                               ; preds = %35, %38
  call void @Argument_Intprt(ptr noundef nonnull %3)
  %41 = call i32 @strnicmp(ptr noundef nonnull %3, ptr noundef nonnull @"??_C@_05HGAABLCC@?9POU?1?$AA@", i32 noundef 5) #10
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %43, label %44

43:                                               ; preds = %40
  call void @Argument_PouFiles(ptr noundef nonnull %7)
  br label %44

44:                                               ; preds = %40, %43
  %45 = call i32 @strnicmp(ptr noundef nonnull %3, ptr noundef nonnull @"??_C@_07BAHIKDNH@?9BEGIN?1?$AA@", i32 noundef 7) #10
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %49

47:                                               ; preds = %44
  %48 = call ptr @Poufile_Set_Begin(ptr noundef nonnull %8) #10
  br label %49

49:                                               ; preds = %44, %47
  %50 = call i32 @strnicmp(ptr noundef nonnull %3, ptr noundef nonnull @"??_C@_07FINFNJEP@?9FINAL?1?$AA@", i32 noundef 7) #10
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %54

52:                                               ; preds = %49
  %53 = call ptr @Poufile_Set_Final(ptr noundef nonnull %8) #10
  br label %54

54:                                               ; preds = %49, %52
  %55 = add nuw nsw i32 %10, 1
  %56 = icmp eq i32 %55, %0
  br i1 %56, label %57, label %9, !llvm.loop !9

57:                                               ; preds = %54, %2
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #10
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #8

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: read)
declare i32 @memcmp(ptr captures(none), ptr captures(none), i32) local_unnamed_addr #9

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nocallback nofree nounwind willreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nocallback nofree nounwind willreturn memory(read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #9 = { nocallback nofree nounwind willreturn memory(argmem: read) }
attributes #10 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\argument.c", directory: "C:\\D_DRV\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
