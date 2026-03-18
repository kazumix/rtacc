; ModuleID = '..\PLCP\property.c'
source_filename = "..\\PLCP\\property.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.PROPERTY_TAGS = type <{ ptr, i32, %union.anon, i8, ptr, ptr, ptr, ptr }>
%union.anon = type { i32 }

$LibVersion_0x0701 = comdat any

$"??_C@_08KGEIBGG@Priority?$AA@" = comdat any

$"??_C@_08KDKDEPAG@Interval?$AA@" = comdat any

$"??_C@_07HGGLMJDG@PouMain?$AA@" = comdat any

$"??_C@_00CNPNBAHC@?$AA@" = comdat any

$"??_C@_03EHFCOOP@Pou?$AA@" = comdat any

$"??_C@_08NFPEMNNK@PouBegin?$AA@" = comdat any

$"??_C@_08MKLIBOHN@PouFinal?$AA@" = comdat any

$"??_C@_07BLJMJFEM@NoPrint?$AA@" = comdat any

$"??_C@_06MHHFENDB@Remote?$AA@" = comdat any

$"??_C@_04MDBAPKAP@Step?$AA@" = comdat any

$"??_C@_08LMAOLDEH@Scanfreq?$AA@" = comdat any

$"??_C@_0L@INEEGANB@RetainInst?$AA@" = comdat any

$"??_C@_0N@COHPKCOK@EgRetain_001?$AA@" = comdat any

$"??_C@_07ICCLJJJJ@AutoRun?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@"??_C@_08KGEIBGG@Priority?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"Priority\00", comdat, align 1
@"??_C@_08KDKDEPAG@Interval?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"Interval\00", comdat, align 1
@"??_C@_07HGGLMJDG@PouMain?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"PouMain\00", comdat, align 1
@"??_C@_00CNPNBAHC@?$AA@" = linkonce_odr dso_local unnamed_addr constant [1 x i8] zeroinitializer, comdat, align 1
@"??_C@_03EHFCOOP@Pou?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"Pou\00", comdat, align 1
@"??_C@_08NFPEMNNK@PouBegin?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"PouBegin\00", comdat, align 1
@"??_C@_08MKLIBOHN@PouFinal?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"PouFinal\00", comdat, align 1
@"??_C@_07BLJMJFEM@NoPrint?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"NoPrint\00", comdat, align 1
@"??_C@_06MHHFENDB@Remote?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"Remote\00", comdat, align 1
@"??_C@_04MDBAPKAP@Step?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"Step\00", comdat, align 1
@"??_C@_08LMAOLDEH@Scanfreq?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"Scanfreq\00", comdat, align 1
@"??_C@_0L@INEEGANB@RetainInst?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"RetainInst\00", comdat, align 1
@"??_C@_0N@COHPKCOK@EgRetain_001?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"EgRetain_001\00", comdat, align 1
@property = dso_local global [12 x %struct.PROPERTY_TAGS] [%struct.PROPERTY_TAGS <{ ptr @"??_C@_08KGEIBGG@Priority?$AA@", i32 7, %union.anon { i32 140 }, i8 0, ptr @Property_Process_Priority, ptr null, ptr null, ptr null }>, %struct.PROPERTY_TAGS <{ ptr @"??_C@_08KDKDEPAG@Interval?$AA@", i32 7, %union.anon { i32 1 }, i8 0, ptr @Property_Process_Nop, ptr null, ptr null, ptr null }>, %struct.PROPERTY_TAGS <{ ptr @"??_C@_07HGGLMJDG@PouMain?$AA@", i32 12, %union.anon { i32 ptrtoint (ptr @"??_C@_00CNPNBAHC@?$AA@" to i32) }, i8 0, ptr @Property_Process_Intprt, ptr null, ptr null, ptr null }>, %struct.PROPERTY_TAGS <{ ptr @"??_C@_03EHFCOOP@Pou?$AA@", i32 12, %union.anon { i32 ptrtoint (ptr @"??_C@_00CNPNBAHC@?$AA@" to i32) }, i8 0, ptr @Property_Process_Pou, ptr null, ptr null, ptr null }>, %struct.PROPERTY_TAGS <{ ptr @"??_C@_08NFPEMNNK@PouBegin?$AA@", i32 12, %union.anon { i32 ptrtoint (ptr @"??_C@_00CNPNBAHC@?$AA@" to i32) }, i8 0, ptr @Property_Process_PouBegin, ptr null, ptr null, ptr null }>, %struct.PROPERTY_TAGS <{ ptr @"??_C@_08MKLIBOHN@PouFinal?$AA@", i32 12, %union.anon { i32 ptrtoint (ptr @"??_C@_00CNPNBAHC@?$AA@" to i32) }, i8 0, ptr @Property_Process_PouFinal, ptr null, ptr null, ptr null }>, %struct.PROPERTY_TAGS <{ ptr @"??_C@_07BLJMJFEM@NoPrint?$AA@", i32 1, %union.anon zeroinitializer, i8 0, ptr @Property_Process_NoPrint, ptr null, ptr null, ptr null }>, %struct.PROPERTY_TAGS <{ ptr @"??_C@_06MHHFENDB@Remote?$AA@", i32 1, %union.anon zeroinitializer, i8 0, ptr @Property_Process_Remote, ptr null, ptr null, ptr null }>, %struct.PROPERTY_TAGS <{ ptr @"??_C@_04MDBAPKAP@Step?$AA@", i32 1, %union.anon zeroinitializer, i8 0, ptr @Property_Process_Step, ptr null, ptr null, ptr null }>, %struct.PROPERTY_TAGS <{ ptr @"??_C@_08LMAOLDEH@Scanfreq?$AA@", i32 7, %union.anon { i32 1000 }, i8 0, ptr @Property_Process_Scanrate, ptr null, ptr null, ptr null }>, %struct.PROPERTY_TAGS <{ ptr @"??_C@_0L@INEEGANB@RetainInst?$AA@", i32 12, %union.anon { i32 ptrtoint (ptr @"??_C@_0N@COHPKCOK@EgRetain_001?$AA@" to i32) }, i8 0, ptr @Property_Process_Retain, ptr null, ptr null, ptr null }>, %struct.PROPERTY_TAGS zeroinitializer], align 4
@"??_C@_07ICCLJJJJ@AutoRun?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"AutoRun\00", comdat, align 1

; Function Attrs: nounwind
define dso_local void @Property_Process_Priority(ptr noundef readonly captures(none) %0) #0 {
  %2 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #4
  %3 = load ptr, ptr %0, align 1
  %4 = tail call ptr @Container_GetTagName(ptr noundef %3) #4
  %5 = call i32 @EgTagRead(ptr noundef %4, ptr noundef nonnull %2, i16 noundef zeroext 4) #4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %10

7:                                                ; preds = %1
  %8 = load i32, ptr %2, align 4
  %9 = trunc i32 %8 to i8
  call void @Config_Set_BasePriority(i8 noundef zeroext %9) #4
  br label %10

10:                                               ; preds = %7, %1
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local void @Property_Process_Nop(ptr readnone captures(none) %0) #1 {
  ret void
}

; Function Attrs: nounwind
define dso_local void @Property_Process_Intprt(ptr noundef readonly captures(none) %0) #0 {
  %2 = alloca [80 x i8], align 1
  %3 = alloca [128 x i8], align 1
  %4 = alloca [128 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #4
  %5 = load ptr, ptr %0, align 1
  %6 = tail call ptr @Container_GetTagName(ptr noundef %5) #4
  %7 = call i32 @EgTagReadString(ptr noundef %6, ptr noundef nonnull %2, i16 noundef zeroext 80) #4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %12

9:                                                ; preds = %1
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #4
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #4
  call void @Config_Set_RunMode(i8 noundef zeroext 1) #4
  call void @Config_Set_MnmFilePath(ptr noundef nonnull %2) #4
  %10 = call ptr @Config_Get_MnmFilePath() #4
  call void @Argument_PathFromFolder(ptr noundef %10, ptr noundef nonnull %3, i32 noundef 128) #4
  call void @Config_Set_WorkFolder(ptr noundef nonnull %3) #4
  %11 = call ptr @Config_Get_MnmFilePath() #4
  call void @Argument_PathFromBase(ptr noundef %11, ptr noundef nonnull %4, i32 noundef 128) #4
  call void @Config_Set_BaseName(ptr noundef nonnull %4) #4
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #4
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #4
  br label %12

12:                                               ; preds = %9, %1
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #4
  ret void
}

; Function Attrs: nounwind
define dso_local void @Property_Process_Pou(ptr noundef readonly captures(none) %0) #0 {
  %2 = alloca [1024 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #4
  %3 = load ptr, ptr %0, align 1
  %4 = tail call ptr @Container_GetTagName(ptr noundef %3) #4
  %5 = call i32 @EgTagReadString(ptr noundef %4, ptr noundef nonnull %2, i16 noundef zeroext 1024) #4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  call void @Argument_PouFiles(ptr noundef nonnull %2) #4
  br label %8

8:                                                ; preds = %7, %1
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #4
  ret void
}

; Function Attrs: nounwind
define dso_local void @Property_Process_PouBegin(ptr noundef readonly captures(none) %0) #0 {
  %2 = alloca [80 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #4
  %3 = load ptr, ptr %0, align 1
  %4 = tail call ptr @Container_GetTagName(ptr noundef %3) #4
  %5 = call i32 @EgTagReadString(ptr noundef %4, ptr noundef nonnull %2, i16 noundef zeroext 80) #4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %9

7:                                                ; preds = %1
  %8 = call ptr @Poufile_Set_Begin(ptr noundef nonnull %2) #4
  br label %9

9:                                                ; preds = %7, %1
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #4
  ret void
}

; Function Attrs: nounwind
define dso_local void @Property_Process_PouFinal(ptr noundef readonly captures(none) %0) #0 {
  %2 = alloca [80 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #4
  %3 = load ptr, ptr %0, align 1
  %4 = tail call ptr @Container_GetTagName(ptr noundef %3) #4
  %5 = call i32 @EgTagReadString(ptr noundef %4, ptr noundef nonnull %2, i16 noundef zeroext 80) #4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %9

7:                                                ; preds = %1
  %8 = call ptr @Poufile_Set_Final(ptr noundef nonnull %2) #4
  br label %9

9:                                                ; preds = %7, %1
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #4
  ret void
}

; Function Attrs: nounwind
define dso_local void @Property_Process_NoPrint(ptr noundef readonly captures(none) %0) #0 {
  %2 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #4
  %3 = load ptr, ptr %0, align 1
  %4 = tail call ptr @Container_GetTagName(ptr noundef %3) #4
  %5 = call i32 @EgTagRead(ptr noundef %4, ptr noundef nonnull %2, i16 noundef zeroext 4) #4
  %6 = icmp eq i32 %5, 0
  %7 = load i32, ptr %2, align 4
  %8 = icmp eq i32 %7, 1
  %9 = select i1 %6, i1 %8, i1 false
  br i1 %9, label %10, label %11

10:                                               ; preds = %1
  call void @Config_Set_PrintMode(i8 noundef zeroext 0) #4
  br label %11

11:                                               ; preds = %10, %1
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #4
  ret void
}

; Function Attrs: nounwind
define dso_local void @Property_Process_Remote(ptr noundef readonly captures(none) %0) #0 {
  %2 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #4
  %3 = load ptr, ptr %0, align 1
  %4 = tail call ptr @Container_GetTagName(ptr noundef %3) #4
  %5 = call i32 @EgTagRead(ptr noundef %4, ptr noundef nonnull %2, i16 noundef zeroext 4) #4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %10

7:                                                ; preds = %1
  %8 = load i32, ptr %2, align 4
  %9 = trunc i32 %8 to i8
  call void @Config_Set_RemoteMode(i8 noundef zeroext %9) #4
  br label %10

10:                                               ; preds = %7, %1
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #4
  ret void
}

; Function Attrs: nounwind
define dso_local void @Property_Process_Step(ptr noundef readonly captures(none) %0) #0 {
  %2 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #4
  %3 = load ptr, ptr %0, align 1
  %4 = tail call ptr @Container_GetTagName(ptr noundef %3) #4
  %5 = call i32 @EgTagRead(ptr noundef %4, ptr noundef nonnull %2, i16 noundef zeroext 4) #4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %10

7:                                                ; preds = %1
  %8 = load i32, ptr %2, align 4
  %9 = trunc i32 %8 to i8
  call void @Config_Set_StepMode(i8 noundef zeroext %9) #4
  br label %10

10:                                               ; preds = %7, %1
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #4
  ret void
}

; Function Attrs: nounwind
define dso_local void @Property_Process_Scanrate(ptr noundef readonly captures(none) %0) #0 {
  %2 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #4
  %3 = load ptr, ptr %0, align 1
  %4 = tail call ptr @Container_GetTagName(ptr noundef %3) #4
  %5 = call i32 @EgTagRead(ptr noundef %4, ptr noundef nonnull %2, i16 noundef zeroext 4) #4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %9

7:                                                ; preds = %1
  %8 = load i32, ptr %2, align 4
  call void @Config_Set_ScanFreq(i32 noundef %8) #4
  br label %9

9:                                                ; preds = %7, %1
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #4
  ret void
}

; Function Attrs: nounwind
define dso_local void @Property_Process_Retain(ptr noundef readonly captures(none) %0) #0 {
  %2 = alloca [80 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #4
  %3 = load ptr, ptr %0, align 1
  %4 = tail call ptr @Container_GetTagName(ptr noundef %3) #4
  %5 = call i32 @EgTagReadString(ptr noundef %4, ptr noundef nonnull %2, i16 noundef zeroext 80) #4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  call void @Retain_Set_Tagname(ptr noundef nonnull %2) #4
  br label %8

8:                                                ; preds = %7, %1
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

declare dso_local ptr @Container_GetTagName(ptr noundef) local_unnamed_addr #3

declare dllimport i32 @EgTagRead(ptr noundef, ptr noundef, i16 noundef zeroext) local_unnamed_addr #3

declare dso_local void @Config_Set_BasePriority(i8 noundef zeroext) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

declare dllimport i32 @EgTagReadString(ptr noundef, ptr noundef, i16 noundef zeroext) local_unnamed_addr #3

declare dso_local void @Config_Set_RunMode(i8 noundef zeroext) local_unnamed_addr #3

declare dso_local void @Config_Set_MnmFilePath(ptr noundef) local_unnamed_addr #3

declare dso_local void @Argument_PathFromFolder(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #3

declare dso_local ptr @Config_Get_MnmFilePath() local_unnamed_addr #3

declare dso_local void @Config_Set_WorkFolder(ptr noundef) local_unnamed_addr #3

declare dso_local void @Argument_PathFromBase(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #3

declare dso_local void @Config_Set_BaseName(ptr noundef) local_unnamed_addr #3

declare dso_local void @Argument_PouFiles(ptr noundef) local_unnamed_addr #3

declare dso_local ptr @Poufile_Set_Begin(ptr noundef) local_unnamed_addr #3

declare dso_local ptr @Poufile_Set_Final(ptr noundef) local_unnamed_addr #3

declare dso_local void @Config_Set_PrintMode(i8 noundef zeroext) local_unnamed_addr #3

declare dso_local void @Config_Set_RemoteMode(i8 noundef zeroext) local_unnamed_addr #3

declare dso_local void @Config_Set_StepMode(i8 noundef zeroext) local_unnamed_addr #3

declare dso_local void @Config_Set_ScanFreq(i32 noundef) local_unnamed_addr #3

declare dso_local void @Retain_Set_Tagname(ptr noundef) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local void @Property_Process() local_unnamed_addr #0 {
  %1 = load ptr, ptr @property, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %10, label %3

3:                                                ; preds = %0, %3
  %4 = phi ptr [ %7, %3 ], [ @property, %0 ]
  %5 = getelementptr inbounds nuw i8, ptr %4, i32 13
  %6 = load ptr, ptr %5, align 1
  tail call void %6(ptr noundef nonnull %4) #4
  %7 = getelementptr inbounds nuw i8, ptr %4, i32 29
  %8 = load ptr, ptr %7, align 1
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %3, !llvm.loop !7

10:                                               ; preds = %3, %0
  ret void
}

; Function Attrs: nounwind
define dso_local i32 @Property_Get_Priority() local_unnamed_addr #0 {
  %1 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #4
  store i32 140, ptr %1, align 4
  %2 = tail call ptr @Container_GetTagName(ptr noundef nonnull @"??_C@_08KGEIBGG@Priority?$AA@") #4
  %3 = call i32 @EgTagRead(ptr noundef %2, ptr noundef nonnull %1, i16 noundef zeroext 4) #4
  %4 = load i32, ptr %1, align 4
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #4
  ret i32 %4
}

; Function Attrs: nounwind
define dso_local i32 @Property_Get_Interval() local_unnamed_addr #0 {
  %1 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #4
  store i32 1, ptr %1, align 4
  %2 = tail call ptr @Container_GetTagName(ptr noundef nonnull @"??_C@_08KDKDEPAG@Interval?$AA@") #4
  %3 = call i32 @EgTagRead(ptr noundef %2, ptr noundef nonnull %1, i16 noundef zeroext 4) #4
  %4 = load i32, ptr %1, align 4
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #4
  ret i32 %4
}

; Function Attrs: nounwind
define dso_local zeroext i8 @Property_Get_Autorun() local_unnamed_addr #0 {
  %1 = alloca i8, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #4
  store i8 1, ptr %1, align 1
  %2 = tail call ptr @Container_GetTagName(ptr noundef nonnull @"??_C@_07ICCLJJJJ@AutoRun?$AA@") #4
  %3 = call i32 @EgTagRead(ptr noundef %2, ptr noundef nonnull %1, i16 noundef zeroext 1) #4
  %4 = load i8, ptr %1, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #4
  ret i8 %4
}

; Function Attrs: nounwind
define dso_local noundef zeroext i8 @Property_Init() local_unnamed_addr #0 {
  %1 = load ptr, ptr @property, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %10, label %3

3:                                                ; preds = %0, %3
  %4 = phi ptr [ %7, %3 ], [ @property, %0 ]
  %5 = getelementptr inbounds nuw i8, ptr %4, i32 13
  %6 = load ptr, ptr %5, align 1
  tail call void %6(ptr noundef nonnull %4) #4
  %7 = getelementptr inbounds nuw i8, ptr %4, i32 29
  %8 = load ptr, ptr %7, align 1
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %3, !llvm.loop !7

10:                                               ; preds = %3, %0
  ret i8 1
}

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\property.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
