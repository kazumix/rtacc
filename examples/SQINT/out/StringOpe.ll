; ModuleID = '..\PLCPIEC\StringOpe.c'
source_filename = "..\\PLCPIEC\\StringOpe.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.STRING = type <{ i16, [81 x i8] }>

$LibVersion_0x0701 = comdat any

$"??_C@_02NJNOFBBI@?$CFx?$AA@" = comdat any

$"??_C@_0CC@FCHOGMLC@BYTE_TO_STRING?3?5To?5string?5failed@" = comdat any

$"??_C@_0CC@OJAPPOIJ@WORD_TO_STRING?3?5To?5string?5failed@" = comdat any

$"??_C@_0CD@MNIEIBFL@DWORD_TO_STRING?3?5To?5string?5faile@" = comdat any

$"??_C@_0CC@KMJABFPM@SINT_TO_STRING?3?5To?5string?5failed@" = comdat any

$"??_C@_0CB@EJHFMPCO@INT_TO_STRING?3?5To?5string?5failed?4@" = comdat any

$"??_C@_0CC@HGKJLLNN@DINT_TO_STRING?3?5To?5string?5failed@" = comdat any

$"??_C@_04OHCHCBJH@?$CFllx?$AA@" = comdat any

$"??_C@_0CC@IJMKDECM@LINT_TO_STRING?3?5To?5string?5failed@" = comdat any

$"??_C@_02CGLCDNAE@?$CFe?$AA@" = comdat any

$"??_C@_0CC@PNPNGLIG@REAL_TO_STRING?3?5To?5string?5failed@" = comdat any

$"??_C@_0CD@BDDDLFFB@LREAL_TO_STRING?3?5To?5string?5faile@" = comdat any

$"??_C@_0CC@HKJJMPAA@TIME_TO_STRING?3?5To?5string?5failed@" = comdat any

$"??_C@_0CD@IHPDJKN@USINT_TO_STRING?3?5To?5string?5faile@" = comdat any

$"??_C@_0CC@HHJNPDEI@UINT_TO_STRING?3?5To?5string?5failed@" = comdat any

$"??_C@_0CD@NCEGJHIM@UDINT_TO_STRING?3?5To?5string?5faile@" = comdat any

$"??_C@_0CA@KMJDJBMF@CONCAT?3String?5length?5limit?5over?$AA@" = comdat any

$"??_C@_0BL@GPOILBPF@DELETE?3Delete?5length?50?3?5a2?$AA@" = comdat any

$"??_C@_0CA@DOEJJBCN@DELETE?3Delete?5Start?5Under?50?3?5a3?$AA@" = comdat any

$"??_C@_0BI@HELCINBB@DELETE?3Delete?5size?5over?$AA@" = comdat any

$"??_C@_0BL@JPOJLKEG@INSERT?3Insert?5length?50?3?5a3?$AA@" = comdat any

$"??_C@_0BI@GCPJOOHJ@INSERT?3Insert?5size?5over?$AA@" = comdat any

$"??_C@_0BK@HCLMIPFB@INSERT?3Insert?5index?5error?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@STAT_ENO_STRING_OPE = dso_local local_unnamed_addr global i8 0, align 1
@"??_C@_02NJNOFBBI@?$CFx?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"%x\00", comdat, align 1
@"??_C@_0CC@FCHOGMLC@BYTE_TO_STRING?3?5To?5string?5failed@" = linkonce_odr dso_local unnamed_addr constant [34 x i8] c"BYTE_TO_STRING: To string failed.\00", comdat, align 1
@"??_C@_0CC@OJAPPOIJ@WORD_TO_STRING?3?5To?5string?5failed@" = linkonce_odr dso_local unnamed_addr constant [34 x i8] c"WORD_TO_STRING: To string failed.\00", comdat, align 1
@"??_C@_0CD@MNIEIBFL@DWORD_TO_STRING?3?5To?5string?5faile@" = linkonce_odr dso_local unnamed_addr constant [35 x i8] c"DWORD_TO_STRING: To string failed.\00", comdat, align 1
@"??_C@_0CC@KMJABFPM@SINT_TO_STRING?3?5To?5string?5failed@" = linkonce_odr dso_local unnamed_addr constant [34 x i8] c"SINT_TO_STRING: To string failed.\00", comdat, align 1
@"??_C@_0CB@EJHFMPCO@INT_TO_STRING?3?5To?5string?5failed?4@" = linkonce_odr dso_local unnamed_addr constant [33 x i8] c"INT_TO_STRING: To string failed.\00", comdat, align 1
@"??_C@_0CC@HGKJLLNN@DINT_TO_STRING?3?5To?5string?5failed@" = linkonce_odr dso_local unnamed_addr constant [34 x i8] c"DINT_TO_STRING: To string failed.\00", comdat, align 1
@"??_C@_04OHCHCBJH@?$CFllx?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"%llx\00", comdat, align 1
@"??_C@_0CC@IJMKDECM@LINT_TO_STRING?3?5To?5string?5failed@" = linkonce_odr dso_local unnamed_addr constant [34 x i8] c"LINT_TO_STRING: To string failed.\00", comdat, align 1
@"??_C@_02CGLCDNAE@?$CFe?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"%e\00", comdat, align 1
@"??_C@_0CC@PNPNGLIG@REAL_TO_STRING?3?5To?5string?5failed@" = linkonce_odr dso_local unnamed_addr constant [34 x i8] c"REAL_TO_STRING: To string failed.\00", comdat, align 1
@"??_C@_0CD@BDDDLFFB@LREAL_TO_STRING?3?5To?5string?5faile@" = linkonce_odr dso_local unnamed_addr constant [35 x i8] c"LREAL_TO_STRING: To string failed.\00", comdat, align 1
@"??_C@_0CC@HKJJMPAA@TIME_TO_STRING?3?5To?5string?5failed@" = linkonce_odr dso_local unnamed_addr constant [34 x i8] c"TIME_TO_STRING: To string failed.\00", comdat, align 1
@"??_C@_0CD@IHPDJKN@USINT_TO_STRING?3?5To?5string?5faile@" = linkonce_odr dso_local unnamed_addr constant [35 x i8] c"USINT_TO_STRING: To string failed.\00", comdat, align 1
@"??_C@_0CC@HHJNPDEI@UINT_TO_STRING?3?5To?5string?5failed@" = linkonce_odr dso_local unnamed_addr constant [34 x i8] c"UINT_TO_STRING: To string failed.\00", comdat, align 1
@"??_C@_0CD@NCEGJHIM@UDINT_TO_STRING?3?5To?5string?5faile@" = linkonce_odr dso_local unnamed_addr constant [35 x i8] c"UDINT_TO_STRING: To string failed.\00", comdat, align 1
@"??_C@_0CA@KMJDJBMF@CONCAT?3String?5length?5limit?5over?$AA@" = linkonce_odr dso_local unnamed_addr constant [32 x i8] c"CONCAT:String length limit over\00", comdat, align 1
@"??_C@_0BL@GPOILBPF@DELETE?3Delete?5length?50?3?5a2?$AA@" = linkonce_odr dso_local unnamed_addr constant [27 x i8] c"DELETE:Delete length 0: a2\00", comdat, align 1
@"??_C@_0CA@DOEJJBCN@DELETE?3Delete?5Start?5Under?50?3?5a3?$AA@" = linkonce_odr dso_local unnamed_addr constant [32 x i8] c"DELETE:Delete Start Under 0: a3\00", comdat, align 1
@"??_C@_0BI@HELCINBB@DELETE?3Delete?5size?5over?$AA@" = linkonce_odr dso_local unnamed_addr constant [24 x i8] c"DELETE:Delete size over\00", comdat, align 1
@"??_C@_0BL@JPOJLKEG@INSERT?3Insert?5length?50?3?5a3?$AA@" = linkonce_odr dso_local unnamed_addr constant [27 x i8] c"INSERT:Insert length 0: a3\00", comdat, align 1
@"??_C@_0BI@GCPJOOHJ@INSERT?3Insert?5size?5over?$AA@" = linkonce_odr dso_local unnamed_addr constant [24 x i8] c"INSERT:Insert size over\00", comdat, align 1
@"??_C@_0BK@HCLMIPFB@INSERT?3Insert?5index?5error?$AA@" = linkonce_odr dso_local unnamed_addr constant [26 x i8] c"INSERT:Insert index error\00", comdat, align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport void @SetStringOpeEno(i8 noundef signext %0) local_unnamed_addr #0 {
  store i8 %0, ptr @STAT_ENO_STRING_OPE, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport signext i8 @GetStringOpeEno() local_unnamed_addr #1 {
  %1 = load i8, ptr @STAT_ENO_STRING_OPE, align 1
  ret i8 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef zeroext i8 @Check_Format(i16 noundef zeroext %0, ptr noundef readonly byval(%struct.STRING) align 4 captures(none) %1) local_unnamed_addr #2 {
  ret i8 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #3

; Function Attrs: nofree norecurse nosync nounwind memory(write, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef ptr @RETURN_NULL_STR(ptr noundef readonly returned captures(ret: address, provenance) %0) local_unnamed_addr #4 {
  %2 = load ptr, ptr %0, align 1
  store i16 0, ptr %2, align 1
  br label %3

3:                                                ; preds = %3, %1
  %4 = phi i32 [ 0, %1 ], [ %14, %3 ]
  %5 = load ptr, ptr %0, align 1
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 2
  %7 = getelementptr inbounds nuw i8, ptr %6, i32 %4
  store i8 0, ptr %7, align 1
  %8 = load ptr, ptr %0, align 1
  %9 = getelementptr inbounds nuw i8, ptr %8, i32 3
  %10 = getelementptr inbounds nuw i8, ptr %9, i32 %4
  store i8 0, ptr %10, align 1
  %11 = load ptr, ptr %0, align 1
  %12 = getelementptr inbounds nuw i8, ptr %11, i32 4
  %13 = getelementptr inbounds nuw i8, ptr %12, i32 %4
  store i8 0, ptr %13, align 1
  %14 = add nuw nsw i32 %4, 3
  %15 = icmp eq i32 %14, 81
  br i1 %15, label %16, label %3, !llvm.loop !7

16:                                               ; preds = %3
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @BYTE_TO_STRING(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #5 {
  %5 = alloca [256 x i8], align 1
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #20
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(256) %5, i8 0, i32 256, i1 false)
  %6 = load ptr, ptr %0, align 1
  %7 = load i8, ptr %6, align 1
  %8 = load ptr, ptr %1, align 1
  %9 = load i16, ptr %8, align 1
  %10 = icmp eq i16 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %4
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(3) %5, ptr noundef nonnull align 1 dereferenceable(3) @"??_C@_02NJNOFBBI@?$CFx?$AA@", i32 3, i1 false) #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %15

12:                                               ; preds = %4
  %13 = getelementptr inbounds nuw i8, ptr %8, i32 2
  %14 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %5, ptr noundef nonnull dereferenceable(1) %13) #20
  br label %15

15:                                               ; preds = %12, %11
  %16 = zext i8 %7 to i32
  %17 = getelementptr inbounds nuw i8, ptr %6, i32 2
  %18 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %17, i32 noundef 80, ptr noundef nonnull %5, i32 noundef %16) #20
  %19 = icmp slt i32 %18, 0
  br i1 %19, label %20, label %36

20:                                               ; preds = %15
  %21 = load ptr, ptr %0, align 1
  store i16 0, ptr %21, align 1
  br label %22

22:                                               ; preds = %22, %20
  %23 = phi i32 [ 0, %20 ], [ %33, %22 ]
  %24 = load ptr, ptr %0, align 1
  %25 = getelementptr inbounds nuw i8, ptr %24, i32 2
  %26 = getelementptr inbounds nuw i8, ptr %25, i32 %23
  store i8 0, ptr %26, align 1
  %27 = load ptr, ptr %0, align 1
  %28 = getelementptr inbounds nuw i8, ptr %27, i32 3
  %29 = getelementptr inbounds nuw i8, ptr %28, i32 %23
  store i8 0, ptr %29, align 1
  %30 = load ptr, ptr %0, align 1
  %31 = getelementptr inbounds nuw i8, ptr %30, i32 4
  %32 = getelementptr inbounds nuw i8, ptr %31, i32 %23
  store i8 0, ptr %32, align 1
  %33 = add nuw nsw i32 %23, 3
  %34 = icmp eq i32 %33, 81
  br i1 %34, label %35, label %22, !llvm.loop !7

35:                                               ; preds = %22
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CC@FCHOGMLC@BYTE_TO_STRING?3?5To?5string?5failed@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %58

36:                                               ; preds = %15
  %37 = icmp samesign ugt i32 %18, 80
  %38 = load ptr, ptr %0, align 1
  br i1 %37, label %39, label %54

39:                                               ; preds = %36
  store i16 0, ptr %38, align 1
  br label %40

40:                                               ; preds = %40, %39
  %41 = phi i32 [ 0, %39 ], [ %51, %40 ]
  %42 = load ptr, ptr %0, align 1
  %43 = getelementptr inbounds nuw i8, ptr %42, i32 2
  %44 = getelementptr inbounds nuw i8, ptr %43, i32 %41
  store i8 0, ptr %44, align 1
  %45 = load ptr, ptr %0, align 1
  %46 = getelementptr inbounds nuw i8, ptr %45, i32 3
  %47 = getelementptr inbounds nuw i8, ptr %46, i32 %41
  store i8 0, ptr %47, align 1
  %48 = load ptr, ptr %0, align 1
  %49 = getelementptr inbounds nuw i8, ptr %48, i32 4
  %50 = getelementptr inbounds nuw i8, ptr %49, i32 %41
  store i8 0, ptr %50, align 1
  %51 = add nuw nsw i32 %41, 3
  %52 = icmp eq i32 %51, 81
  br i1 %52, label %53, label %40, !llvm.loop !7

53:                                               ; preds = %40
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CC@FCHOGMLC@BYTE_TO_STRING?3?5To?5string?5failed@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %58

54:                                               ; preds = %36
  %55 = getelementptr inbounds nuw i8, ptr %38, i32 2
  %56 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %55) #20
  %57 = trunc i32 %56 to i16
  store i16 %57, ptr %38, align 1
  br label %58

58:                                               ; preds = %53, %54, %35
  %59 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1346, ptr %59, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #20
  ret ptr %0
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #6

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none)) local_unnamed_addr #7

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @snprintf(ptr noalias noundef writeonly captures(none), i32 noundef, ptr noundef readonly captures(none), ...) local_unnamed_addr #8

declare dso_local void @Eexception_Post(i32 noundef, ptr noundef) local_unnamed_addr #9

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strlen(ptr noundef captures(none)) local_unnamed_addr #10

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @WORD_TO_STRING(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #5 {
  %5 = alloca [256 x i8], align 1
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #20
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(256) %5, i8 0, i32 256, i1 false)
  %6 = load ptr, ptr %0, align 1
  %7 = load i16, ptr %6, align 2
  %8 = load ptr, ptr %1, align 1
  %9 = load i16, ptr %8, align 1
  %10 = icmp eq i16 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %4
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(3) %5, ptr noundef nonnull align 1 dereferenceable(3) @"??_C@_02NJNOFBBI@?$CFx?$AA@", i32 3, i1 false) #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %15

12:                                               ; preds = %4
  %13 = getelementptr inbounds nuw i8, ptr %8, i32 2
  %14 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %5, ptr noundef nonnull dereferenceable(1) %13) #20
  br label %15

15:                                               ; preds = %12, %11
  %16 = zext i16 %7 to i32
  %17 = getelementptr inbounds nuw i8, ptr %6, i32 2
  %18 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %17, i32 noundef 80, ptr noundef nonnull %5, i32 noundef %16) #20
  %19 = icmp slt i32 %18, 0
  br i1 %19, label %20, label %36

20:                                               ; preds = %15
  %21 = load ptr, ptr %0, align 1
  store i16 0, ptr %21, align 1
  br label %22

22:                                               ; preds = %22, %20
  %23 = phi i32 [ 0, %20 ], [ %33, %22 ]
  %24 = load ptr, ptr %0, align 1
  %25 = getelementptr inbounds nuw i8, ptr %24, i32 2
  %26 = getelementptr inbounds nuw i8, ptr %25, i32 %23
  store i8 0, ptr %26, align 1
  %27 = load ptr, ptr %0, align 1
  %28 = getelementptr inbounds nuw i8, ptr %27, i32 3
  %29 = getelementptr inbounds nuw i8, ptr %28, i32 %23
  store i8 0, ptr %29, align 1
  %30 = load ptr, ptr %0, align 1
  %31 = getelementptr inbounds nuw i8, ptr %30, i32 4
  %32 = getelementptr inbounds nuw i8, ptr %31, i32 %23
  store i8 0, ptr %32, align 1
  %33 = add nuw nsw i32 %23, 3
  %34 = icmp eq i32 %33, 81
  br i1 %34, label %35, label %22, !llvm.loop !7

35:                                               ; preds = %22
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CC@OJAPPOIJ@WORD_TO_STRING?3?5To?5string?5failed@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %58

36:                                               ; preds = %15
  %37 = icmp samesign ugt i32 %18, 80
  %38 = load ptr, ptr %0, align 1
  br i1 %37, label %39, label %54

39:                                               ; preds = %36
  store i16 0, ptr %38, align 1
  br label %40

40:                                               ; preds = %40, %39
  %41 = phi i32 [ 0, %39 ], [ %51, %40 ]
  %42 = load ptr, ptr %0, align 1
  %43 = getelementptr inbounds nuw i8, ptr %42, i32 2
  %44 = getelementptr inbounds nuw i8, ptr %43, i32 %41
  store i8 0, ptr %44, align 1
  %45 = load ptr, ptr %0, align 1
  %46 = getelementptr inbounds nuw i8, ptr %45, i32 3
  %47 = getelementptr inbounds nuw i8, ptr %46, i32 %41
  store i8 0, ptr %47, align 1
  %48 = load ptr, ptr %0, align 1
  %49 = getelementptr inbounds nuw i8, ptr %48, i32 4
  %50 = getelementptr inbounds nuw i8, ptr %49, i32 %41
  store i8 0, ptr %50, align 1
  %51 = add nuw nsw i32 %41, 3
  %52 = icmp eq i32 %51, 81
  br i1 %52, label %53, label %40, !llvm.loop !7

53:                                               ; preds = %40
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CC@OJAPPOIJ@WORD_TO_STRING?3?5To?5string?5failed@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %58

54:                                               ; preds = %36
  %55 = getelementptr inbounds nuw i8, ptr %38, i32 2
  %56 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %55) #20
  %57 = trunc i32 %56 to i16
  store i16 %57, ptr %38, align 1
  br label %58

58:                                               ; preds = %53, %54, %35
  %59 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1346, ptr %59, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #20
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @DWORD_TO_STRING(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #5 {
  %5 = alloca [256 x i8], align 1
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #20
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(256) %5, i8 0, i32 256, i1 false)
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = load ptr, ptr %1, align 1
  %9 = load i16, ptr %8, align 1
  %10 = icmp eq i16 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %4
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(3) %5, ptr noundef nonnull align 1 dereferenceable(3) @"??_C@_02NJNOFBBI@?$CFx?$AA@", i32 3, i1 false) #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %15

12:                                               ; preds = %4
  %13 = getelementptr inbounds nuw i8, ptr %8, i32 2
  %14 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %5, ptr noundef nonnull dereferenceable(1) %13) #20
  br label %15

15:                                               ; preds = %12, %11
  %16 = getelementptr inbounds nuw i8, ptr %6, i32 2
  %17 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %16, i32 noundef 80, ptr noundef nonnull %5, i32 noundef %7) #20
  %18 = icmp slt i32 %17, 0
  br i1 %18, label %19, label %35

19:                                               ; preds = %15
  %20 = load ptr, ptr %0, align 1
  store i16 0, ptr %20, align 1
  br label %21

21:                                               ; preds = %21, %19
  %22 = phi i32 [ 0, %19 ], [ %32, %21 ]
  %23 = load ptr, ptr %0, align 1
  %24 = getelementptr inbounds nuw i8, ptr %23, i32 2
  %25 = getelementptr inbounds nuw i8, ptr %24, i32 %22
  store i8 0, ptr %25, align 1
  %26 = load ptr, ptr %0, align 1
  %27 = getelementptr inbounds nuw i8, ptr %26, i32 3
  %28 = getelementptr inbounds nuw i8, ptr %27, i32 %22
  store i8 0, ptr %28, align 1
  %29 = load ptr, ptr %0, align 1
  %30 = getelementptr inbounds nuw i8, ptr %29, i32 4
  %31 = getelementptr inbounds nuw i8, ptr %30, i32 %22
  store i8 0, ptr %31, align 1
  %32 = add nuw nsw i32 %22, 3
  %33 = icmp eq i32 %32, 81
  br i1 %33, label %34, label %21, !llvm.loop !7

34:                                               ; preds = %21
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CD@MNIEIBFL@DWORD_TO_STRING?3?5To?5string?5faile@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %57

35:                                               ; preds = %15
  %36 = icmp samesign ugt i32 %17, 80
  %37 = load ptr, ptr %0, align 1
  br i1 %36, label %38, label %53

38:                                               ; preds = %35
  store i16 0, ptr %37, align 1
  br label %39

39:                                               ; preds = %39, %38
  %40 = phi i32 [ 0, %38 ], [ %50, %39 ]
  %41 = load ptr, ptr %0, align 1
  %42 = getelementptr inbounds nuw i8, ptr %41, i32 2
  %43 = getelementptr inbounds nuw i8, ptr %42, i32 %40
  store i8 0, ptr %43, align 1
  %44 = load ptr, ptr %0, align 1
  %45 = getelementptr inbounds nuw i8, ptr %44, i32 3
  %46 = getelementptr inbounds nuw i8, ptr %45, i32 %40
  store i8 0, ptr %46, align 1
  %47 = load ptr, ptr %0, align 1
  %48 = getelementptr inbounds nuw i8, ptr %47, i32 4
  %49 = getelementptr inbounds nuw i8, ptr %48, i32 %40
  store i8 0, ptr %49, align 1
  %50 = add nuw nsw i32 %40, 3
  %51 = icmp eq i32 %50, 81
  br i1 %51, label %52, label %39, !llvm.loop !7

52:                                               ; preds = %39
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CD@MNIEIBFL@DWORD_TO_STRING?3?5To?5string?5faile@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %57

53:                                               ; preds = %35
  %54 = getelementptr inbounds nuw i8, ptr %37, i32 2
  %55 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %54) #20
  %56 = trunc i32 %55 to i16
  store i16 %56, ptr %37, align 1
  br label %57

57:                                               ; preds = %52, %53, %34
  %58 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1346, ptr %58, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #20
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @SINT_TO_STRING(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #5 {
  %5 = alloca [256 x i8], align 1
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #20
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(256) %5, i8 0, i32 256, i1 false)
  %6 = load ptr, ptr %0, align 1
  %7 = load i8, ptr %6, align 1
  %8 = load ptr, ptr %1, align 1
  %9 = load i16, ptr %8, align 1
  %10 = icmp eq i16 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %4
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(3) %5, ptr noundef nonnull align 1 dereferenceable(3) @"??_C@_02NJNOFBBI@?$CFx?$AA@", i32 3, i1 false) #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %15

12:                                               ; preds = %4
  %13 = getelementptr inbounds nuw i8, ptr %8, i32 2
  %14 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %5, ptr noundef nonnull dereferenceable(1) %13) #20
  br label %15

15:                                               ; preds = %12, %11
  %16 = sext i8 %7 to i32
  %17 = getelementptr inbounds nuw i8, ptr %6, i32 2
  %18 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %17, i32 noundef 80, ptr noundef nonnull %5, i32 noundef %16) #20
  %19 = icmp slt i32 %18, 0
  br i1 %19, label %20, label %36

20:                                               ; preds = %15
  %21 = load ptr, ptr %0, align 1
  store i16 0, ptr %21, align 1
  br label %22

22:                                               ; preds = %22, %20
  %23 = phi i32 [ 0, %20 ], [ %33, %22 ]
  %24 = load ptr, ptr %0, align 1
  %25 = getelementptr inbounds nuw i8, ptr %24, i32 2
  %26 = getelementptr inbounds nuw i8, ptr %25, i32 %23
  store i8 0, ptr %26, align 1
  %27 = load ptr, ptr %0, align 1
  %28 = getelementptr inbounds nuw i8, ptr %27, i32 3
  %29 = getelementptr inbounds nuw i8, ptr %28, i32 %23
  store i8 0, ptr %29, align 1
  %30 = load ptr, ptr %0, align 1
  %31 = getelementptr inbounds nuw i8, ptr %30, i32 4
  %32 = getelementptr inbounds nuw i8, ptr %31, i32 %23
  store i8 0, ptr %32, align 1
  %33 = add nuw nsw i32 %23, 3
  %34 = icmp eq i32 %33, 81
  br i1 %34, label %35, label %22, !llvm.loop !7

35:                                               ; preds = %22
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CC@KMJABFPM@SINT_TO_STRING?3?5To?5string?5failed@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %58

36:                                               ; preds = %15
  %37 = icmp samesign ugt i32 %18, 80
  %38 = load ptr, ptr %0, align 1
  br i1 %37, label %39, label %54

39:                                               ; preds = %36
  store i16 0, ptr %38, align 1
  br label %40

40:                                               ; preds = %40, %39
  %41 = phi i32 [ 0, %39 ], [ %51, %40 ]
  %42 = load ptr, ptr %0, align 1
  %43 = getelementptr inbounds nuw i8, ptr %42, i32 2
  %44 = getelementptr inbounds nuw i8, ptr %43, i32 %41
  store i8 0, ptr %44, align 1
  %45 = load ptr, ptr %0, align 1
  %46 = getelementptr inbounds nuw i8, ptr %45, i32 3
  %47 = getelementptr inbounds nuw i8, ptr %46, i32 %41
  store i8 0, ptr %47, align 1
  %48 = load ptr, ptr %0, align 1
  %49 = getelementptr inbounds nuw i8, ptr %48, i32 4
  %50 = getelementptr inbounds nuw i8, ptr %49, i32 %41
  store i8 0, ptr %50, align 1
  %51 = add nuw nsw i32 %41, 3
  %52 = icmp eq i32 %51, 81
  br i1 %52, label %53, label %40, !llvm.loop !7

53:                                               ; preds = %40
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CC@KMJABFPM@SINT_TO_STRING?3?5To?5string?5failed@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %58

54:                                               ; preds = %36
  %55 = getelementptr inbounds nuw i8, ptr %38, i32 2
  %56 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %55) #20
  %57 = trunc i32 %56 to i16
  store i16 %57, ptr %38, align 1
  br label %58

58:                                               ; preds = %53, %54, %35
  %59 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1346, ptr %59, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #20
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @INT_TO_STRING(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #5 {
  %5 = alloca [256 x i8], align 1
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #20
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(256) %5, i8 0, i32 256, i1 false)
  %6 = load ptr, ptr %0, align 1
  %7 = load i16, ptr %6, align 2
  %8 = load ptr, ptr %1, align 1
  %9 = load i16, ptr %8, align 1
  %10 = icmp eq i16 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %4
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(3) %5, ptr noundef nonnull align 1 dereferenceable(3) @"??_C@_02NJNOFBBI@?$CFx?$AA@", i32 3, i1 false) #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %15

12:                                               ; preds = %4
  %13 = getelementptr inbounds nuw i8, ptr %8, i32 2
  %14 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %5, ptr noundef nonnull dereferenceable(1) %13) #20
  br label %15

15:                                               ; preds = %12, %11
  %16 = sext i16 %7 to i32
  %17 = getelementptr inbounds nuw i8, ptr %6, i32 2
  %18 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %17, i32 noundef 80, ptr noundef nonnull %5, i32 noundef %16) #20
  %19 = icmp slt i32 %18, 0
  br i1 %19, label %20, label %36

20:                                               ; preds = %15
  %21 = load ptr, ptr %0, align 1
  store i16 0, ptr %21, align 1
  br label %22

22:                                               ; preds = %22, %20
  %23 = phi i32 [ 0, %20 ], [ %33, %22 ]
  %24 = load ptr, ptr %0, align 1
  %25 = getelementptr inbounds nuw i8, ptr %24, i32 2
  %26 = getelementptr inbounds nuw i8, ptr %25, i32 %23
  store i8 0, ptr %26, align 1
  %27 = load ptr, ptr %0, align 1
  %28 = getelementptr inbounds nuw i8, ptr %27, i32 3
  %29 = getelementptr inbounds nuw i8, ptr %28, i32 %23
  store i8 0, ptr %29, align 1
  %30 = load ptr, ptr %0, align 1
  %31 = getelementptr inbounds nuw i8, ptr %30, i32 4
  %32 = getelementptr inbounds nuw i8, ptr %31, i32 %23
  store i8 0, ptr %32, align 1
  %33 = add nuw nsw i32 %23, 3
  %34 = icmp eq i32 %33, 81
  br i1 %34, label %35, label %22, !llvm.loop !7

35:                                               ; preds = %22
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CB@EJHFMPCO@INT_TO_STRING?3?5To?5string?5failed?4@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %58

36:                                               ; preds = %15
  %37 = icmp samesign ugt i32 %18, 80
  %38 = load ptr, ptr %0, align 1
  br i1 %37, label %39, label %54

39:                                               ; preds = %36
  store i16 0, ptr %38, align 1
  br label %40

40:                                               ; preds = %40, %39
  %41 = phi i32 [ 0, %39 ], [ %51, %40 ]
  %42 = load ptr, ptr %0, align 1
  %43 = getelementptr inbounds nuw i8, ptr %42, i32 2
  %44 = getelementptr inbounds nuw i8, ptr %43, i32 %41
  store i8 0, ptr %44, align 1
  %45 = load ptr, ptr %0, align 1
  %46 = getelementptr inbounds nuw i8, ptr %45, i32 3
  %47 = getelementptr inbounds nuw i8, ptr %46, i32 %41
  store i8 0, ptr %47, align 1
  %48 = load ptr, ptr %0, align 1
  %49 = getelementptr inbounds nuw i8, ptr %48, i32 4
  %50 = getelementptr inbounds nuw i8, ptr %49, i32 %41
  store i8 0, ptr %50, align 1
  %51 = add nuw nsw i32 %41, 3
  %52 = icmp eq i32 %51, 81
  br i1 %52, label %53, label %40, !llvm.loop !7

53:                                               ; preds = %40
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CB@EJHFMPCO@INT_TO_STRING?3?5To?5string?5failed?4@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %58

54:                                               ; preds = %36
  %55 = getelementptr inbounds nuw i8, ptr %38, i32 2
  %56 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %55) #20
  %57 = trunc i32 %56 to i16
  store i16 %57, ptr %38, align 1
  br label %58

58:                                               ; preds = %53, %54, %35
  %59 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1346, ptr %59, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #20
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @DINT_TO_STRING(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #5 {
  %5 = alloca [256 x i8], align 1
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #20
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(256) %5, i8 0, i32 256, i1 false)
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = load ptr, ptr %1, align 1
  %9 = load i16, ptr %8, align 1
  %10 = icmp eq i16 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %4
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(3) %5, ptr noundef nonnull align 1 dereferenceable(3) @"??_C@_02NJNOFBBI@?$CFx?$AA@", i32 3, i1 false) #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %15

12:                                               ; preds = %4
  %13 = getelementptr inbounds nuw i8, ptr %8, i32 2
  %14 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %5, ptr noundef nonnull dereferenceable(1) %13) #20
  br label %15

15:                                               ; preds = %12, %11
  %16 = getelementptr inbounds nuw i8, ptr %6, i32 2
  %17 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %16, i32 noundef 80, ptr noundef nonnull %5, i32 noundef %7) #20
  %18 = icmp slt i32 %17, 0
  br i1 %18, label %19, label %35

19:                                               ; preds = %15
  %20 = load ptr, ptr %0, align 1
  store i16 0, ptr %20, align 1
  br label %21

21:                                               ; preds = %21, %19
  %22 = phi i32 [ 0, %19 ], [ %32, %21 ]
  %23 = load ptr, ptr %0, align 1
  %24 = getelementptr inbounds nuw i8, ptr %23, i32 2
  %25 = getelementptr inbounds nuw i8, ptr %24, i32 %22
  store i8 0, ptr %25, align 1
  %26 = load ptr, ptr %0, align 1
  %27 = getelementptr inbounds nuw i8, ptr %26, i32 3
  %28 = getelementptr inbounds nuw i8, ptr %27, i32 %22
  store i8 0, ptr %28, align 1
  %29 = load ptr, ptr %0, align 1
  %30 = getelementptr inbounds nuw i8, ptr %29, i32 4
  %31 = getelementptr inbounds nuw i8, ptr %30, i32 %22
  store i8 0, ptr %31, align 1
  %32 = add nuw nsw i32 %22, 3
  %33 = icmp eq i32 %32, 81
  br i1 %33, label %34, label %21, !llvm.loop !7

34:                                               ; preds = %21
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CC@HGKJLLNN@DINT_TO_STRING?3?5To?5string?5failed@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %57

35:                                               ; preds = %15
  %36 = icmp samesign ugt i32 %17, 80
  %37 = load ptr, ptr %0, align 1
  br i1 %36, label %38, label %53

38:                                               ; preds = %35
  store i16 0, ptr %37, align 1
  br label %39

39:                                               ; preds = %39, %38
  %40 = phi i32 [ 0, %38 ], [ %50, %39 ]
  %41 = load ptr, ptr %0, align 1
  %42 = getelementptr inbounds nuw i8, ptr %41, i32 2
  %43 = getelementptr inbounds nuw i8, ptr %42, i32 %40
  store i8 0, ptr %43, align 1
  %44 = load ptr, ptr %0, align 1
  %45 = getelementptr inbounds nuw i8, ptr %44, i32 3
  %46 = getelementptr inbounds nuw i8, ptr %45, i32 %40
  store i8 0, ptr %46, align 1
  %47 = load ptr, ptr %0, align 1
  %48 = getelementptr inbounds nuw i8, ptr %47, i32 4
  %49 = getelementptr inbounds nuw i8, ptr %48, i32 %40
  store i8 0, ptr %49, align 1
  %50 = add nuw nsw i32 %40, 3
  %51 = icmp eq i32 %50, 81
  br i1 %51, label %52, label %39, !llvm.loop !7

52:                                               ; preds = %39
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CC@HGKJLLNN@DINT_TO_STRING?3?5To?5string?5failed@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %57

53:                                               ; preds = %35
  %54 = getelementptr inbounds nuw i8, ptr %37, i32 2
  %55 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %54) #20
  %56 = trunc i32 %55 to i16
  store i16 %56, ptr %37, align 1
  br label %57

57:                                               ; preds = %52, %53, %34
  %58 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1346, ptr %58, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #20
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @LINT_TO_STRING(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #5 {
  %5 = alloca [256 x i8], align 1
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #20
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(256) %5, i8 0, i32 256, i1 false)
  %6 = load ptr, ptr %0, align 1
  %7 = load i64, ptr %6, align 8
  %8 = load ptr, ptr %1, align 1
  %9 = load i16, ptr %8, align 1
  %10 = icmp eq i16 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %4
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(5) %5, ptr noundef nonnull align 1 dereferenceable(5) @"??_C@_04OHCHCBJH@?$CFllx?$AA@", i32 5, i1 false) #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %15

12:                                               ; preds = %4
  %13 = getelementptr inbounds nuw i8, ptr %8, i32 2
  %14 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %5, ptr noundef nonnull dereferenceable(1) %13) #20
  br label %15

15:                                               ; preds = %12, %11
  %16 = getelementptr inbounds nuw i8, ptr %6, i32 2
  %17 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %16, i32 noundef 80, ptr noundef nonnull %5, i64 noundef %7) #20
  %18 = icmp slt i32 %17, 0
  br i1 %18, label %19, label %35

19:                                               ; preds = %15
  %20 = load ptr, ptr %0, align 1
  store i16 0, ptr %20, align 1
  br label %21

21:                                               ; preds = %21, %19
  %22 = phi i32 [ 0, %19 ], [ %32, %21 ]
  %23 = load ptr, ptr %0, align 1
  %24 = getelementptr inbounds nuw i8, ptr %23, i32 2
  %25 = getelementptr inbounds nuw i8, ptr %24, i32 %22
  store i8 0, ptr %25, align 1
  %26 = load ptr, ptr %0, align 1
  %27 = getelementptr inbounds nuw i8, ptr %26, i32 3
  %28 = getelementptr inbounds nuw i8, ptr %27, i32 %22
  store i8 0, ptr %28, align 1
  %29 = load ptr, ptr %0, align 1
  %30 = getelementptr inbounds nuw i8, ptr %29, i32 4
  %31 = getelementptr inbounds nuw i8, ptr %30, i32 %22
  store i8 0, ptr %31, align 1
  %32 = add nuw nsw i32 %22, 3
  %33 = icmp eq i32 %32, 81
  br i1 %33, label %34, label %21, !llvm.loop !7

34:                                               ; preds = %21
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CC@IJMKDECM@LINT_TO_STRING?3?5To?5string?5failed@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %57

35:                                               ; preds = %15
  %36 = icmp samesign ugt i32 %17, 80
  %37 = load ptr, ptr %0, align 1
  br i1 %36, label %38, label %53

38:                                               ; preds = %35
  store i16 0, ptr %37, align 1
  br label %39

39:                                               ; preds = %39, %38
  %40 = phi i32 [ 0, %38 ], [ %50, %39 ]
  %41 = load ptr, ptr %0, align 1
  %42 = getelementptr inbounds nuw i8, ptr %41, i32 2
  %43 = getelementptr inbounds nuw i8, ptr %42, i32 %40
  store i8 0, ptr %43, align 1
  %44 = load ptr, ptr %0, align 1
  %45 = getelementptr inbounds nuw i8, ptr %44, i32 3
  %46 = getelementptr inbounds nuw i8, ptr %45, i32 %40
  store i8 0, ptr %46, align 1
  %47 = load ptr, ptr %0, align 1
  %48 = getelementptr inbounds nuw i8, ptr %47, i32 4
  %49 = getelementptr inbounds nuw i8, ptr %48, i32 %40
  store i8 0, ptr %49, align 1
  %50 = add nuw nsw i32 %40, 3
  %51 = icmp eq i32 %50, 81
  br i1 %51, label %52, label %39, !llvm.loop !7

52:                                               ; preds = %39
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CC@IJMKDECM@LINT_TO_STRING?3?5To?5string?5failed@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %57

53:                                               ; preds = %35
  %54 = getelementptr inbounds nuw i8, ptr %37, i32 2
  %55 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %54) #20
  %56 = trunc i32 %55 to i16
  store i16 %56, ptr %37, align 1
  br label %57

57:                                               ; preds = %52, %53, %34
  %58 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1346, ptr %58, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #20
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @REAL_TO_STRING(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #5 {
  %5 = alloca [256 x i8], align 1
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #20
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(256) %5, i8 0, i32 256, i1 false)
  %6 = load ptr, ptr %0, align 1
  %7 = load float, ptr %6, align 4
  %8 = load ptr, ptr %1, align 1
  %9 = load i16, ptr %8, align 1
  %10 = icmp eq i16 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %4
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(3) %5, ptr noundef nonnull align 1 dereferenceable(3) @"??_C@_02CGLCDNAE@?$CFe?$AA@", i32 3, i1 false) #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %15

12:                                               ; preds = %4
  %13 = getelementptr inbounds nuw i8, ptr %8, i32 2
  %14 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %5, ptr noundef nonnull dereferenceable(1) %13) #20
  br label %15

15:                                               ; preds = %12, %11
  %16 = fpext float %7 to double
  %17 = getelementptr inbounds nuw i8, ptr %6, i32 2
  %18 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %17, i32 noundef 80, ptr noundef nonnull %5, double noundef %16) #20
  %19 = icmp slt i32 %18, 0
  br i1 %19, label %20, label %36

20:                                               ; preds = %15
  %21 = load ptr, ptr %0, align 1
  store i16 0, ptr %21, align 1
  br label %22

22:                                               ; preds = %22, %20
  %23 = phi i32 [ 0, %20 ], [ %33, %22 ]
  %24 = load ptr, ptr %0, align 1
  %25 = getelementptr inbounds nuw i8, ptr %24, i32 2
  %26 = getelementptr inbounds nuw i8, ptr %25, i32 %23
  store i8 0, ptr %26, align 1
  %27 = load ptr, ptr %0, align 1
  %28 = getelementptr inbounds nuw i8, ptr %27, i32 3
  %29 = getelementptr inbounds nuw i8, ptr %28, i32 %23
  store i8 0, ptr %29, align 1
  %30 = load ptr, ptr %0, align 1
  %31 = getelementptr inbounds nuw i8, ptr %30, i32 4
  %32 = getelementptr inbounds nuw i8, ptr %31, i32 %23
  store i8 0, ptr %32, align 1
  %33 = add nuw nsw i32 %23, 3
  %34 = icmp eq i32 %33, 81
  br i1 %34, label %35, label %22, !llvm.loop !7

35:                                               ; preds = %22
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CC@PNPNGLIG@REAL_TO_STRING?3?5To?5string?5failed@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %58

36:                                               ; preds = %15
  %37 = icmp samesign ugt i32 %18, 80
  %38 = load ptr, ptr %0, align 1
  br i1 %37, label %39, label %54

39:                                               ; preds = %36
  store i16 0, ptr %38, align 1
  br label %40

40:                                               ; preds = %40, %39
  %41 = phi i32 [ 0, %39 ], [ %51, %40 ]
  %42 = load ptr, ptr %0, align 1
  %43 = getelementptr inbounds nuw i8, ptr %42, i32 2
  %44 = getelementptr inbounds nuw i8, ptr %43, i32 %41
  store i8 0, ptr %44, align 1
  %45 = load ptr, ptr %0, align 1
  %46 = getelementptr inbounds nuw i8, ptr %45, i32 3
  %47 = getelementptr inbounds nuw i8, ptr %46, i32 %41
  store i8 0, ptr %47, align 1
  %48 = load ptr, ptr %0, align 1
  %49 = getelementptr inbounds nuw i8, ptr %48, i32 4
  %50 = getelementptr inbounds nuw i8, ptr %49, i32 %41
  store i8 0, ptr %50, align 1
  %51 = add nuw nsw i32 %41, 3
  %52 = icmp eq i32 %51, 81
  br i1 %52, label %53, label %40, !llvm.loop !7

53:                                               ; preds = %40
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CC@PNPNGLIG@REAL_TO_STRING?3?5To?5string?5failed@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %58

54:                                               ; preds = %36
  %55 = getelementptr inbounds nuw i8, ptr %38, i32 2
  %56 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %55) #20
  %57 = trunc i32 %56 to i16
  store i16 %57, ptr %38, align 1
  br label %58

58:                                               ; preds = %53, %54, %35
  %59 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1346, ptr %59, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #20
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @LREAL_TO_STRING(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #5 {
  %5 = alloca [256 x i8], align 1
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #20
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(256) %5, i8 0, i32 256, i1 false)
  %6 = load ptr, ptr %0, align 1
  %7 = load double, ptr %6, align 8
  %8 = load ptr, ptr %1, align 1
  %9 = load i16, ptr %8, align 1
  %10 = icmp eq i16 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %4
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(3) %5, ptr noundef nonnull align 1 dereferenceable(3) @"??_C@_02CGLCDNAE@?$CFe?$AA@", i32 3, i1 false) #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %15

12:                                               ; preds = %4
  %13 = getelementptr inbounds nuw i8, ptr %8, i32 2
  %14 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %5, ptr noundef nonnull dereferenceable(1) %13) #20
  br label %15

15:                                               ; preds = %12, %11
  %16 = getelementptr inbounds nuw i8, ptr %6, i32 2
  %17 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %16, i32 noundef 80, ptr noundef nonnull %5, double noundef %7) #20
  %18 = icmp slt i32 %17, 0
  br i1 %18, label %19, label %35

19:                                               ; preds = %15
  %20 = load ptr, ptr %0, align 1
  store i16 0, ptr %20, align 1
  br label %21

21:                                               ; preds = %21, %19
  %22 = phi i32 [ 0, %19 ], [ %32, %21 ]
  %23 = load ptr, ptr %0, align 1
  %24 = getelementptr inbounds nuw i8, ptr %23, i32 2
  %25 = getelementptr inbounds nuw i8, ptr %24, i32 %22
  store i8 0, ptr %25, align 1
  %26 = load ptr, ptr %0, align 1
  %27 = getelementptr inbounds nuw i8, ptr %26, i32 3
  %28 = getelementptr inbounds nuw i8, ptr %27, i32 %22
  store i8 0, ptr %28, align 1
  %29 = load ptr, ptr %0, align 1
  %30 = getelementptr inbounds nuw i8, ptr %29, i32 4
  %31 = getelementptr inbounds nuw i8, ptr %30, i32 %22
  store i8 0, ptr %31, align 1
  %32 = add nuw nsw i32 %22, 3
  %33 = icmp eq i32 %32, 81
  br i1 %33, label %34, label %21, !llvm.loop !7

34:                                               ; preds = %21
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CD@BDDDLFFB@LREAL_TO_STRING?3?5To?5string?5faile@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %57

35:                                               ; preds = %15
  %36 = icmp samesign ugt i32 %17, 80
  %37 = load ptr, ptr %0, align 1
  br i1 %36, label %38, label %53

38:                                               ; preds = %35
  store i16 0, ptr %37, align 1
  br label %39

39:                                               ; preds = %39, %38
  %40 = phi i32 [ 0, %38 ], [ %50, %39 ]
  %41 = load ptr, ptr %0, align 1
  %42 = getelementptr inbounds nuw i8, ptr %41, i32 2
  %43 = getelementptr inbounds nuw i8, ptr %42, i32 %40
  store i8 0, ptr %43, align 1
  %44 = load ptr, ptr %0, align 1
  %45 = getelementptr inbounds nuw i8, ptr %44, i32 3
  %46 = getelementptr inbounds nuw i8, ptr %45, i32 %40
  store i8 0, ptr %46, align 1
  %47 = load ptr, ptr %0, align 1
  %48 = getelementptr inbounds nuw i8, ptr %47, i32 4
  %49 = getelementptr inbounds nuw i8, ptr %48, i32 %40
  store i8 0, ptr %49, align 1
  %50 = add nuw nsw i32 %40, 3
  %51 = icmp eq i32 %50, 81
  br i1 %51, label %52, label %39, !llvm.loop !7

52:                                               ; preds = %39
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CD@BDDDLFFB@LREAL_TO_STRING?3?5To?5string?5faile@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %57

53:                                               ; preds = %35
  %54 = getelementptr inbounds nuw i8, ptr %37, i32 2
  %55 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %54) #20
  %56 = trunc i32 %55 to i16
  store i16 %56, ptr %37, align 1
  br label %57

57:                                               ; preds = %52, %53, %34
  %58 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1346, ptr %58, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #20
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @TIME_TO_STRING(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #5 {
  %5 = alloca [256 x i8], align 1
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #20
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(256) %5, i8 0, i32 256, i1 false)
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = load ptr, ptr %1, align 1
  %9 = load i16, ptr %8, align 1
  %10 = icmp eq i16 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %4
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(3) %5, ptr noundef nonnull align 1 dereferenceable(3) @"??_C@_02NJNOFBBI@?$CFx?$AA@", i32 3, i1 false) #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %15

12:                                               ; preds = %4
  %13 = getelementptr inbounds nuw i8, ptr %8, i32 2
  %14 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %5, ptr noundef nonnull dereferenceable(1) %13) #20
  br label %15

15:                                               ; preds = %12, %11
  %16 = getelementptr inbounds nuw i8, ptr %6, i32 2
  %17 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %16, i32 noundef 80, ptr noundef nonnull %5, i32 noundef %7) #20
  %18 = icmp slt i32 %17, 0
  br i1 %18, label %19, label %35

19:                                               ; preds = %15
  %20 = load ptr, ptr %0, align 1
  store i16 0, ptr %20, align 1
  br label %21

21:                                               ; preds = %21, %19
  %22 = phi i32 [ 0, %19 ], [ %32, %21 ]
  %23 = load ptr, ptr %0, align 1
  %24 = getelementptr inbounds nuw i8, ptr %23, i32 2
  %25 = getelementptr inbounds nuw i8, ptr %24, i32 %22
  store i8 0, ptr %25, align 1
  %26 = load ptr, ptr %0, align 1
  %27 = getelementptr inbounds nuw i8, ptr %26, i32 3
  %28 = getelementptr inbounds nuw i8, ptr %27, i32 %22
  store i8 0, ptr %28, align 1
  %29 = load ptr, ptr %0, align 1
  %30 = getelementptr inbounds nuw i8, ptr %29, i32 4
  %31 = getelementptr inbounds nuw i8, ptr %30, i32 %22
  store i8 0, ptr %31, align 1
  %32 = add nuw nsw i32 %22, 3
  %33 = icmp eq i32 %32, 81
  br i1 %33, label %34, label %21, !llvm.loop !7

34:                                               ; preds = %21
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CC@HKJJMPAA@TIME_TO_STRING?3?5To?5string?5failed@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %57

35:                                               ; preds = %15
  %36 = icmp samesign ugt i32 %17, 80
  %37 = load ptr, ptr %0, align 1
  br i1 %36, label %38, label %53

38:                                               ; preds = %35
  store i16 0, ptr %37, align 1
  br label %39

39:                                               ; preds = %39, %38
  %40 = phi i32 [ 0, %38 ], [ %50, %39 ]
  %41 = load ptr, ptr %0, align 1
  %42 = getelementptr inbounds nuw i8, ptr %41, i32 2
  %43 = getelementptr inbounds nuw i8, ptr %42, i32 %40
  store i8 0, ptr %43, align 1
  %44 = load ptr, ptr %0, align 1
  %45 = getelementptr inbounds nuw i8, ptr %44, i32 3
  %46 = getelementptr inbounds nuw i8, ptr %45, i32 %40
  store i8 0, ptr %46, align 1
  %47 = load ptr, ptr %0, align 1
  %48 = getelementptr inbounds nuw i8, ptr %47, i32 4
  %49 = getelementptr inbounds nuw i8, ptr %48, i32 %40
  store i8 0, ptr %49, align 1
  %50 = add nuw nsw i32 %40, 3
  %51 = icmp eq i32 %50, 81
  br i1 %51, label %52, label %39, !llvm.loop !7

52:                                               ; preds = %39
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CC@HKJJMPAA@TIME_TO_STRING?3?5To?5string?5failed@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %57

53:                                               ; preds = %35
  %54 = getelementptr inbounds nuw i8, ptr %37, i32 2
  %55 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %54) #20
  %56 = trunc i32 %55 to i16
  store i16 %56, ptr %37, align 1
  br label %57

57:                                               ; preds = %52, %53, %34
  %58 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1346, ptr %58, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #20
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @USINT_TO_STRING(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #5 {
  %5 = alloca [256 x i8], align 1
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #20
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(256) %5, i8 0, i32 256, i1 false)
  %6 = load ptr, ptr %0, align 1
  %7 = load i8, ptr %6, align 1
  %8 = load ptr, ptr %1, align 1
  %9 = load i16, ptr %8, align 1
  %10 = icmp eq i16 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %4
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(3) %5, ptr noundef nonnull align 1 dereferenceable(3) @"??_C@_02NJNOFBBI@?$CFx?$AA@", i32 3, i1 false) #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %15

12:                                               ; preds = %4
  %13 = getelementptr inbounds nuw i8, ptr %8, i32 2
  %14 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %5, ptr noundef nonnull dereferenceable(1) %13) #20
  br label %15

15:                                               ; preds = %12, %11
  %16 = zext i8 %7 to i32
  %17 = getelementptr inbounds nuw i8, ptr %6, i32 2
  %18 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %17, i32 noundef 80, ptr noundef nonnull %5, i32 noundef %16) #20
  %19 = icmp slt i32 %18, 0
  br i1 %19, label %20, label %36

20:                                               ; preds = %15
  %21 = load ptr, ptr %0, align 1
  store i16 0, ptr %21, align 1
  br label %22

22:                                               ; preds = %22, %20
  %23 = phi i32 [ 0, %20 ], [ %33, %22 ]
  %24 = load ptr, ptr %0, align 1
  %25 = getelementptr inbounds nuw i8, ptr %24, i32 2
  %26 = getelementptr inbounds nuw i8, ptr %25, i32 %23
  store i8 0, ptr %26, align 1
  %27 = load ptr, ptr %0, align 1
  %28 = getelementptr inbounds nuw i8, ptr %27, i32 3
  %29 = getelementptr inbounds nuw i8, ptr %28, i32 %23
  store i8 0, ptr %29, align 1
  %30 = load ptr, ptr %0, align 1
  %31 = getelementptr inbounds nuw i8, ptr %30, i32 4
  %32 = getelementptr inbounds nuw i8, ptr %31, i32 %23
  store i8 0, ptr %32, align 1
  %33 = add nuw nsw i32 %23, 3
  %34 = icmp eq i32 %33, 81
  br i1 %34, label %35, label %22, !llvm.loop !7

35:                                               ; preds = %22
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CD@IHPDJKN@USINT_TO_STRING?3?5To?5string?5faile@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %58

36:                                               ; preds = %15
  %37 = icmp samesign ugt i32 %18, 80
  %38 = load ptr, ptr %0, align 1
  br i1 %37, label %39, label %54

39:                                               ; preds = %36
  store i16 0, ptr %38, align 1
  br label %40

40:                                               ; preds = %40, %39
  %41 = phi i32 [ 0, %39 ], [ %51, %40 ]
  %42 = load ptr, ptr %0, align 1
  %43 = getelementptr inbounds nuw i8, ptr %42, i32 2
  %44 = getelementptr inbounds nuw i8, ptr %43, i32 %41
  store i8 0, ptr %44, align 1
  %45 = load ptr, ptr %0, align 1
  %46 = getelementptr inbounds nuw i8, ptr %45, i32 3
  %47 = getelementptr inbounds nuw i8, ptr %46, i32 %41
  store i8 0, ptr %47, align 1
  %48 = load ptr, ptr %0, align 1
  %49 = getelementptr inbounds nuw i8, ptr %48, i32 4
  %50 = getelementptr inbounds nuw i8, ptr %49, i32 %41
  store i8 0, ptr %50, align 1
  %51 = add nuw nsw i32 %41, 3
  %52 = icmp eq i32 %51, 81
  br i1 %52, label %53, label %40, !llvm.loop !7

53:                                               ; preds = %40
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CD@IHPDJKN@USINT_TO_STRING?3?5To?5string?5faile@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %58

54:                                               ; preds = %36
  %55 = getelementptr inbounds nuw i8, ptr %38, i32 2
  %56 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %55) #20
  %57 = trunc i32 %56 to i16
  store i16 %57, ptr %38, align 1
  br label %58

58:                                               ; preds = %53, %54, %35
  %59 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1346, ptr %59, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #20
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @UINT_TO_STRING(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #5 {
  %5 = alloca [256 x i8], align 1
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #20
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(256) %5, i8 0, i32 256, i1 false)
  %6 = load ptr, ptr %0, align 1
  %7 = load i16, ptr %6, align 2
  %8 = load ptr, ptr %1, align 1
  %9 = load i16, ptr %8, align 1
  %10 = icmp eq i16 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %4
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(3) %5, ptr noundef nonnull align 1 dereferenceable(3) @"??_C@_02NJNOFBBI@?$CFx?$AA@", i32 3, i1 false) #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %15

12:                                               ; preds = %4
  %13 = getelementptr inbounds nuw i8, ptr %8, i32 2
  %14 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %5, ptr noundef nonnull dereferenceable(1) %13) #20
  br label %15

15:                                               ; preds = %12, %11
  %16 = zext i16 %7 to i32
  %17 = getelementptr inbounds nuw i8, ptr %6, i32 2
  %18 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %17, i32 noundef 80, ptr noundef nonnull %5, i32 noundef %16) #20
  %19 = icmp slt i32 %18, 0
  br i1 %19, label %20, label %36

20:                                               ; preds = %15
  %21 = load ptr, ptr %0, align 1
  store i16 0, ptr %21, align 1
  br label %22

22:                                               ; preds = %22, %20
  %23 = phi i32 [ 0, %20 ], [ %33, %22 ]
  %24 = load ptr, ptr %0, align 1
  %25 = getelementptr inbounds nuw i8, ptr %24, i32 2
  %26 = getelementptr inbounds nuw i8, ptr %25, i32 %23
  store i8 0, ptr %26, align 1
  %27 = load ptr, ptr %0, align 1
  %28 = getelementptr inbounds nuw i8, ptr %27, i32 3
  %29 = getelementptr inbounds nuw i8, ptr %28, i32 %23
  store i8 0, ptr %29, align 1
  %30 = load ptr, ptr %0, align 1
  %31 = getelementptr inbounds nuw i8, ptr %30, i32 4
  %32 = getelementptr inbounds nuw i8, ptr %31, i32 %23
  store i8 0, ptr %32, align 1
  %33 = add nuw nsw i32 %23, 3
  %34 = icmp eq i32 %33, 81
  br i1 %34, label %35, label %22, !llvm.loop !7

35:                                               ; preds = %22
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CC@HHJNPDEI@UINT_TO_STRING?3?5To?5string?5failed@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %58

36:                                               ; preds = %15
  %37 = icmp samesign ugt i32 %18, 80
  %38 = load ptr, ptr %0, align 1
  br i1 %37, label %39, label %54

39:                                               ; preds = %36
  store i16 0, ptr %38, align 1
  br label %40

40:                                               ; preds = %40, %39
  %41 = phi i32 [ 0, %39 ], [ %51, %40 ]
  %42 = load ptr, ptr %0, align 1
  %43 = getelementptr inbounds nuw i8, ptr %42, i32 2
  %44 = getelementptr inbounds nuw i8, ptr %43, i32 %41
  store i8 0, ptr %44, align 1
  %45 = load ptr, ptr %0, align 1
  %46 = getelementptr inbounds nuw i8, ptr %45, i32 3
  %47 = getelementptr inbounds nuw i8, ptr %46, i32 %41
  store i8 0, ptr %47, align 1
  %48 = load ptr, ptr %0, align 1
  %49 = getelementptr inbounds nuw i8, ptr %48, i32 4
  %50 = getelementptr inbounds nuw i8, ptr %49, i32 %41
  store i8 0, ptr %50, align 1
  %51 = add nuw nsw i32 %41, 3
  %52 = icmp eq i32 %51, 81
  br i1 %52, label %53, label %40, !llvm.loop !7

53:                                               ; preds = %40
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CC@HHJNPDEI@UINT_TO_STRING?3?5To?5string?5failed@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %58

54:                                               ; preds = %36
  %55 = getelementptr inbounds nuw i8, ptr %38, i32 2
  %56 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %55) #20
  %57 = trunc i32 %56 to i16
  store i16 %57, ptr %38, align 1
  br label %58

58:                                               ; preds = %53, %54, %35
  %59 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1346, ptr %59, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #20
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @UDINT_TO_STRING(ptr noundef returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #5 {
  %5 = alloca [256 x i8], align 4
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #20
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 4 dereferenceable(256) %5, i8 0, i32 256, i1 false)
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = load ptr, ptr %1, align 1
  %9 = load i16, ptr %8, align 1
  %10 = icmp eq i16 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %4
  store i32 7892005, ptr %5, align 4
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %15

12:                                               ; preds = %4
  %13 = getelementptr inbounds nuw i8, ptr %8, i32 2
  %14 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %5, ptr noundef nonnull dereferenceable(1) %13) #20
  br label %15

15:                                               ; preds = %12, %11
  %16 = getelementptr inbounds nuw i8, ptr %6, i32 2
  %17 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %16, i32 noundef 80, ptr noundef nonnull %5, i32 noundef %7) #20
  %18 = icmp slt i32 %17, 0
  br i1 %18, label %19, label %35

19:                                               ; preds = %15
  %20 = load ptr, ptr %0, align 1
  store i16 0, ptr %20, align 1
  br label %21

21:                                               ; preds = %21, %19
  %22 = phi i32 [ 0, %19 ], [ %32, %21 ]
  %23 = load ptr, ptr %0, align 1
  %24 = getelementptr inbounds nuw i8, ptr %23, i32 2
  %25 = getelementptr inbounds nuw i8, ptr %24, i32 %22
  store i8 0, ptr %25, align 1
  %26 = load ptr, ptr %0, align 1
  %27 = getelementptr inbounds nuw i8, ptr %26, i32 3
  %28 = getelementptr inbounds nuw i8, ptr %27, i32 %22
  store i8 0, ptr %28, align 1
  %29 = load ptr, ptr %0, align 1
  %30 = getelementptr inbounds nuw i8, ptr %29, i32 4
  %31 = getelementptr inbounds nuw i8, ptr %30, i32 %22
  store i8 0, ptr %31, align 1
  %32 = add nuw nsw i32 %22, 3
  %33 = icmp eq i32 %32, 81
  br i1 %33, label %34, label %21, !llvm.loop !7

34:                                               ; preds = %21
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CD@NCEGJHIM@UDINT_TO_STRING?3?5To?5string?5faile@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %57

35:                                               ; preds = %15
  %36 = icmp samesign ugt i32 %17, 80
  %37 = load ptr, ptr %0, align 1
  br i1 %36, label %38, label %53

38:                                               ; preds = %35
  store i16 0, ptr %37, align 1
  br label %39

39:                                               ; preds = %39, %38
  %40 = phi i32 [ 0, %38 ], [ %50, %39 ]
  %41 = load ptr, ptr %0, align 1
  %42 = getelementptr inbounds nuw i8, ptr %41, i32 2
  %43 = getelementptr inbounds nuw i8, ptr %42, i32 %40
  store i8 0, ptr %43, align 1
  %44 = load ptr, ptr %0, align 1
  %45 = getelementptr inbounds nuw i8, ptr %44, i32 3
  %46 = getelementptr inbounds nuw i8, ptr %45, i32 %40
  store i8 0, ptr %46, align 1
  %47 = load ptr, ptr %0, align 1
  %48 = getelementptr inbounds nuw i8, ptr %47, i32 4
  %49 = getelementptr inbounds nuw i8, ptr %48, i32 %40
  store i8 0, ptr %49, align 1
  %50 = add nuw nsw i32 %40, 3
  %51 = icmp eq i32 %50, 81
  br i1 %51, label %52, label %39, !llvm.loop !7

52:                                               ; preds = %39
  call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CD@NCEGJHIM@UDINT_TO_STRING?3?5To?5string?5faile@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %57

53:                                               ; preds = %35
  %54 = getelementptr inbounds nuw i8, ptr %37, i32 2
  %55 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %54) #20
  %56 = trunc i32 %55 to i16
  store i16 %56, ptr %37, align 1
  br label %57

57:                                               ; preds = %52, %53, %34
  %58 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1346, ptr %58, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #20
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: read, target_mem0: read, target_mem1: read)
define dso_local dllexport noundef ptr @STRING_TO_BYTE(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #11 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 2
  %7 = tail call i32 @atoi(ptr noundef nonnull %6)
  %8 = trunc i32 %7 to i8
  store i8 %8, ptr %5, align 1
  %9 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 16, ptr %9, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(read)
declare dso_local i32 @atoi(ptr noundef captures(none)) local_unnamed_addr #12

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: read, target_mem0: read, target_mem1: read)
define dso_local dllexport noundef ptr @STRING_TO_WORD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #11 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 2
  %7 = tail call i32 @atoi(ptr noundef nonnull %6)
  %8 = trunc i32 %7 to i16
  store i16 %8, ptr %5, align 2
  %9 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 17, ptr %9, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: read, target_mem0: read, target_mem1: read)
define dso_local dllexport noundef ptr @STRING_TO_DWORD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #11 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 2
  %7 = tail call i32 @atoi(ptr noundef nonnull %6)
  store i32 %7, ptr %5, align 4
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 18, ptr %8, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: read, target_mem0: read, target_mem1: read)
define dso_local dllexport noundef ptr @STRING_TO_SINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #11 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 2
  %7 = tail call i32 @atoi(ptr noundef nonnull %6)
  %8 = trunc i32 %7 to i8
  store i8 %8, ptr %5, align 1
  %9 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 260, ptr %9, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: read, target_mem0: read, target_mem1: read)
define dso_local dllexport noundef ptr @STRING_TO_INT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #11 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 2
  %7 = tail call i32 @atoi(ptr noundef nonnull %6)
  %8 = trunc i32 %7 to i16
  store i16 %8, ptr %5, align 2
  %9 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 261, ptr %9, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: read, target_mem0: read, target_mem1: read)
define dso_local dllexport noundef ptr @STRING_TO_DINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #11 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 2
  %7 = tail call i32 @atoi(ptr noundef nonnull %6)
  store i32 %7, ptr %5, align 4
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 262, ptr %8, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define dso_local dllexport noundef ptr @STRING_TO_LINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #13 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 2
  %7 = tail call i64 @strtoll(ptr noundef nonnull captures(none) %6, ptr noundef null, i32 noundef 10)
  %8 = load ptr, ptr %0, align 1
  store i64 %7, ptr %8, align 8
  %9 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 263, ptr %9, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn
declare dso_local i64 @strtoll(ptr noundef readonly, ptr noundef captures(none), i32 noundef) local_unnamed_addr #14

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: read, target_mem0: read, target_mem1: read)
define dso_local dllexport noundef ptr @STRING_TO_REAL(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #11 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 2
  %7 = tail call double @atof(ptr noundef nonnull %6)
  %8 = fptrunc double %7 to float
  store float %8, ptr %5, align 4
  %9 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 782, ptr %9, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(read)
declare dso_local double @atof(ptr noundef captures(none)) local_unnamed_addr #12

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: read, target_mem0: read, target_mem1: read)
define dso_local dllexport noundef ptr @STRING_TO_LREAL(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #11 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 783, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = getelementptr inbounds nuw i8, ptr %6, i32 2
  %8 = tail call double @atof(ptr noundef nonnull %7)
  store double %8, ptr %6, align 8
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: read, target_mem0: read, target_mem1: read)
define dso_local dllexport noundef ptr @STRING_TO_TIME(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #11 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 2
  %7 = tail call i32 @atoi(ptr noundef nonnull %6)
  store i32 %7, ptr %5, align 4
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1347, ptr %8, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: read, target_mem0: read, target_mem1: read)
define dso_local dllexport noundef ptr @STRING_TO_USINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #11 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 2
  %7 = tail call i32 @atoi(ptr noundef nonnull %6)
  %8 = trunc i32 %7 to i8
  store i8 %8, ptr %5, align 1
  %9 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 512, ptr %9, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: read, target_mem0: read, target_mem1: read)
define dso_local dllexport noundef ptr @STRING_TO_UINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #11 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 2
  %7 = tail call i32 @atoi(ptr noundef nonnull %6)
  %8 = trunc i32 %7 to i16
  store i16 %8, ptr %5, align 2
  %9 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 513, ptr %9, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: read, target_mem0: read, target_mem1: read)
define dso_local dllexport noundef ptr @STRING_TO_UDINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #11 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 2
  %7 = tail call i32 @atoi(ptr noundef nonnull %6)
  store i32 %7, ptr %5, align 4
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 514, ptr %8, align 1
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @CONCAT(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #5 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = load i16, ptr %5, align 1
  %7 = load ptr, ptr %1, align 1
  %8 = load i16, ptr %7, align 1
  %9 = add i16 %8, %6
  %10 = icmp ugt i16 %9, 80
  br i1 %10, label %11, label %26

11:                                               ; preds = %4
  store i16 0, ptr %5, align 1
  br label %12

12:                                               ; preds = %12, %11
  %13 = phi i32 [ 0, %11 ], [ %23, %12 ]
  %14 = load ptr, ptr %0, align 1
  %15 = getelementptr inbounds nuw i8, ptr %14, i32 2
  %16 = getelementptr inbounds nuw i8, ptr %15, i32 %13
  store i8 0, ptr %16, align 1
  %17 = load ptr, ptr %0, align 1
  %18 = getelementptr inbounds nuw i8, ptr %17, i32 3
  %19 = getelementptr inbounds nuw i8, ptr %18, i32 %13
  store i8 0, ptr %19, align 1
  %20 = load ptr, ptr %0, align 1
  %21 = getelementptr inbounds nuw i8, ptr %20, i32 4
  %22 = getelementptr inbounds nuw i8, ptr %21, i32 %13
  store i8 0, ptr %22, align 1
  %23 = add nuw nsw i32 %13, 3
  %24 = icmp eq i32 %23, 81
  br i1 %24, label %25, label %12, !llvm.loop !7

25:                                               ; preds = %12
  tail call void @Eexception_Post(i32 noundef 5, ptr noundef nonnull @"??_C@_0CA@KMJDJBMF@CONCAT?3String?5length?5limit?5over?$AA@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %31

26:                                               ; preds = %4
  %27 = getelementptr inbounds nuw i8, ptr %7, i32 2
  %28 = getelementptr inbounds nuw i8, ptr %5, i32 2
  %29 = tail call ptr @strcat(ptr noundef nonnull dereferenceable(1) %28, ptr noundef nonnull dereferenceable(1) %27) #20
  %30 = load ptr, ptr %0, align 1
  store i16 %9, ptr %30, align 1
  br label %31

31:                                               ; preds = %26, %25
  ret ptr %0
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcat(ptr noalias noundef returned, ptr noalias noundef readonly captures(none)) local_unnamed_addr #7

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @DELETE_STR(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #5 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = load i32, ptr %5, align 4
  %7 = icmp slt i32 %6, 0
  br i1 %7, label %8, label %24

8:                                                ; preds = %4
  %9 = load ptr, ptr %0, align 1
  store i16 0, ptr %9, align 1
  br label %10

10:                                               ; preds = %10, %8
  %11 = phi i32 [ 0, %8 ], [ %21, %10 ]
  %12 = load ptr, ptr %0, align 1
  %13 = getelementptr inbounds nuw i8, ptr %12, i32 2
  %14 = getelementptr inbounds nuw i8, ptr %13, i32 %11
  store i8 0, ptr %14, align 1
  %15 = load ptr, ptr %0, align 1
  %16 = getelementptr inbounds nuw i8, ptr %15, i32 3
  %17 = getelementptr inbounds nuw i8, ptr %16, i32 %11
  store i8 0, ptr %17, align 1
  %18 = load ptr, ptr %0, align 1
  %19 = getelementptr inbounds nuw i8, ptr %18, i32 4
  %20 = getelementptr inbounds nuw i8, ptr %19, i32 %11
  store i8 0, ptr %20, align 1
  %21 = add nuw nsw i32 %11, 3
  %22 = icmp eq i32 %21, 81
  br i1 %22, label %23, label %10, !llvm.loop !7

23:                                               ; preds = %10
  tail call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0BL@GPOILBPF@DELETE?3Delete?5length?50?3?5a2?$AA@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %148

24:                                               ; preds = %4
  %25 = icmp eq i32 %6, 0
  br i1 %25, label %148, label %26

26:                                               ; preds = %24
  %27 = load ptr, ptr %2, align 1
  %28 = load i32, ptr %27, align 4
  %29 = icmp slt i32 %28, 1
  %30 = load ptr, ptr %0, align 1
  br i1 %29, label %31, label %46

31:                                               ; preds = %26
  store i16 0, ptr %30, align 1
  br label %32

32:                                               ; preds = %32, %31
  %33 = phi i32 [ 0, %31 ], [ %43, %32 ]
  %34 = load ptr, ptr %0, align 1
  %35 = getelementptr inbounds nuw i8, ptr %34, i32 2
  %36 = getelementptr inbounds nuw i8, ptr %35, i32 %33
  store i8 0, ptr %36, align 1
  %37 = load ptr, ptr %0, align 1
  %38 = getelementptr inbounds nuw i8, ptr %37, i32 3
  %39 = getelementptr inbounds nuw i8, ptr %38, i32 %33
  store i8 0, ptr %39, align 1
  %40 = load ptr, ptr %0, align 1
  %41 = getelementptr inbounds nuw i8, ptr %40, i32 4
  %42 = getelementptr inbounds nuw i8, ptr %41, i32 %33
  store i8 0, ptr %42, align 1
  %43 = add nuw nsw i32 %33, 3
  %44 = icmp eq i32 %43, 81
  br i1 %44, label %45, label %32, !llvm.loop !7

45:                                               ; preds = %32
  tail call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0CA@DOEJJBCN@DELETE?3Delete?5Start?5Under?50?3?5a3?$AA@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %148

46:                                               ; preds = %26
  %47 = load i16, ptr %30, align 1
  %48 = zext i16 %47 to i32
  %49 = icmp samesign ugt i32 %6, %48
  br i1 %49, label %50, label %65

50:                                               ; preds = %46
  store i16 0, ptr %30, align 1
  br label %51

51:                                               ; preds = %51, %50
  %52 = phi i32 [ 0, %50 ], [ %62, %51 ]
  %53 = load ptr, ptr %0, align 1
  %54 = getelementptr inbounds nuw i8, ptr %53, i32 2
  %55 = getelementptr inbounds nuw i8, ptr %54, i32 %52
  store i8 0, ptr %55, align 1
  %56 = load ptr, ptr %0, align 1
  %57 = getelementptr inbounds nuw i8, ptr %56, i32 3
  %58 = getelementptr inbounds nuw i8, ptr %57, i32 %52
  store i8 0, ptr %58, align 1
  %59 = load ptr, ptr %0, align 1
  %60 = getelementptr inbounds nuw i8, ptr %59, i32 4
  %61 = getelementptr inbounds nuw i8, ptr %60, i32 %52
  store i8 0, ptr %61, align 1
  %62 = add nuw nsw i32 %52, 3
  %63 = icmp eq i32 %62, 81
  br i1 %63, label %64, label %51, !llvm.loop !7

64:                                               ; preds = %51
  tail call void @Eexception_Post(i32 noundef 5, ptr noundef nonnull @"??_C@_0BI@HELCINBB@DELETE?3Delete?5size?5over?$AA@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %148

65:                                               ; preds = %46
  %66 = add nsw i32 %6, -1
  %67 = add nuw i32 %66, %28
  %68 = icmp samesign ugt i32 %67, %48
  br i1 %68, label %71, label %69

69:                                               ; preds = %65
  %70 = icmp samesign ult i32 %6, 80
  br i1 %70, label %106, label %88

71:                                               ; preds = %65
  store i16 0, ptr %30, align 1
  br label %72

72:                                               ; preds = %72, %71
  %73 = phi i32 [ 0, %71 ], [ %83, %72 ]
  %74 = load ptr, ptr %0, align 1
  %75 = getelementptr inbounds nuw i8, ptr %74, i32 2
  %76 = getelementptr inbounds nuw i8, ptr %75, i32 %73
  store i8 0, ptr %76, align 1
  %77 = load ptr, ptr %0, align 1
  %78 = getelementptr inbounds nuw i8, ptr %77, i32 3
  %79 = getelementptr inbounds nuw i8, ptr %78, i32 %73
  store i8 0, ptr %79, align 1
  %80 = load ptr, ptr %0, align 1
  %81 = getelementptr inbounds nuw i8, ptr %80, i32 4
  %82 = getelementptr inbounds nuw i8, ptr %81, i32 %73
  store i8 0, ptr %82, align 1
  %83 = add nuw nsw i32 %73, 3
  %84 = icmp eq i32 %83, 81
  br i1 %84, label %85, label %72, !llvm.loop !7

85:                                               ; preds = %72
  tail call void @Eexception_Post(i32 noundef 5, ptr noundef nonnull @"??_C@_0BI@HELCINBB@DELETE?3Delete?5size?5over?$AA@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %148

86:                                               ; preds = %106
  %87 = icmp samesign ult i32 %107, 79
  br i1 %87, label %88, label %142

88:                                               ; preds = %69, %86
  %89 = phi i32 [ 0, %69 ], [ %118, %86 ]
  %90 = sub i32 0, %89
  %91 = and i32 %90, 3
  %92 = icmp eq i32 %91, 0
  br i1 %92, label %102, label %93

93:                                               ; preds = %88, %93
  %94 = phi i32 [ %99, %93 ], [ %89, %88 ]
  %95 = phi i32 [ %100, %93 ], [ 0, %88 ]
  %96 = load ptr, ptr %0, align 1
  %97 = getelementptr inbounds nuw i8, ptr %96, i32 2
  %98 = getelementptr inbounds nuw i8, ptr %97, i32 %94
  store i8 0, ptr %98, align 1
  %99 = add nuw i32 %94, 1
  %100 = add i32 %95, 1
  %101 = icmp eq i32 %100, %91
  br i1 %101, label %102, label %93, !llvm.loop !9

102:                                              ; preds = %93, %88
  %103 = phi i32 [ %89, %88 ], [ %99, %93 ]
  %104 = add i32 %89, -77
  %105 = icmp ult i32 %104, 3
  br i1 %105, label %139, label %123

106:                                              ; preds = %69, %106
  %107 = phi i32 [ %118, %106 ], [ 0, %69 ]
  %108 = load ptr, ptr %0, align 1
  %109 = getelementptr inbounds nuw i8, ptr %108, i32 2
  %110 = getelementptr i8, ptr %109, i32 %67
  %111 = getelementptr i8, ptr %110, i32 %107
  %112 = load i8, ptr %111, align 1
  %113 = load ptr, ptr %2, align 1
  %114 = load i32, ptr %113, align 4
  %115 = getelementptr i8, ptr %109, i32 %114
  %116 = getelementptr i8, ptr %115, i32 -1
  %117 = getelementptr i8, ptr %116, i32 %107
  store i8 %112, ptr %117, align 1
  %118 = add nuw nsw i32 %107, 1
  %119 = load ptr, ptr %1, align 1
  %120 = load i32, ptr %119, align 4
  %121 = sub nsw i32 80, %120
  %122 = icmp slt i32 %118, %121
  br i1 %122, label %106, label %86, !llvm.loop !11

123:                                              ; preds = %102, %123
  %124 = phi i32 [ %137, %123 ], [ %103, %102 ]
  %125 = load ptr, ptr %0, align 1
  %126 = getelementptr inbounds nuw i8, ptr %125, i32 2
  %127 = getelementptr inbounds nuw i8, ptr %126, i32 %124
  store i8 0, ptr %127, align 1
  %128 = load ptr, ptr %0, align 1
  %129 = getelementptr inbounds nuw i8, ptr %128, i32 3
  %130 = getelementptr inbounds nuw i8, ptr %129, i32 %124
  store i8 0, ptr %130, align 1
  %131 = load ptr, ptr %0, align 1
  %132 = getelementptr inbounds nuw i8, ptr %131, i32 4
  %133 = getelementptr inbounds nuw i8, ptr %132, i32 %124
  store i8 0, ptr %133, align 1
  %134 = load ptr, ptr %0, align 1
  %135 = getelementptr inbounds nuw i8, ptr %134, i32 5
  %136 = getelementptr inbounds nuw i8, ptr %135, i32 %124
  store i8 0, ptr %136, align 1
  %137 = add nuw i32 %124, 4
  %138 = icmp eq i32 %137, 80
  br i1 %138, label %139, label %123, !llvm.loop !12

139:                                              ; preds = %123, %102
  %140 = load ptr, ptr %1, align 1
  %141 = load i32, ptr %140, align 4
  br label %142

142:                                              ; preds = %139, %86
  %143 = phi i32 [ %141, %139 ], [ %120, %86 ]
  %144 = load ptr, ptr %0, align 1
  %145 = load i16, ptr %144, align 1
  %146 = trunc i32 %143 to i16
  %147 = sub i16 %145, %146
  store i16 %147, ptr %144, align 1
  br label %148

148:                                              ; preds = %24, %142, %85, %64, %45, %23
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @EQ_STRING(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #15 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 2
  %7 = load ptr, ptr %0, align 1
  %8 = getelementptr inbounds nuw i8, ptr %7, i32 2
  %9 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %8, ptr noundef nonnull dereferenceable(1) %6) #20
  %10 = icmp eq i32 %9, 0
  %11 = zext i1 %10 to i8
  store i8 %11, ptr %7, align 1
  %12 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %12, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strcmp(ptr noundef captures(none), ptr noundef captures(none)) local_unnamed_addr #10

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @FIND(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #15 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 2
  %7 = load ptr, ptr %0, align 1
  %8 = getelementptr inbounds nuw i8, ptr %7, i32 2
  %9 = tail call ptr @strstr(ptr noundef nonnull dereferenceable(1) %8, ptr noundef nonnull dereferenceable(1) %6) #20
  %10 = icmp eq ptr %9, null
  %11 = ptrtoint ptr %9 to i32
  %12 = ptrtoint ptr %8 to i32
  %13 = sub i32 %11, %12
  %14 = trunc i32 %13 to i16
  %15 = add i16 %14, 1
  %16 = select i1 %10, i16 0, i16 %15
  store i16 %16, ptr %7, align 2
  %17 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 261, ptr %17, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local ptr @strstr(ptr noundef, ptr noundef captures(none)) local_unnamed_addr #10

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @GE_STRING(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #15 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 2
  %7 = load ptr, ptr %0, align 1
  %8 = getelementptr inbounds nuw i8, ptr %7, i32 2
  %9 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %8, ptr noundef nonnull dereferenceable(1) %6) #20
  %10 = icmp sgt i32 %9, -1
  %11 = zext i1 %10 to i8
  store i8 %11, ptr %7, align 1
  %12 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %12, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @GT_STRING(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #15 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 2
  %7 = load ptr, ptr %0, align 1
  %8 = getelementptr inbounds nuw i8, ptr %7, i32 2
  %9 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %8, ptr noundef nonnull dereferenceable(1) %6) #20
  %10 = icmp sgt i32 %9, 0
  %11 = zext i1 %10 to i8
  store i8 %11, ptr %7, align 1
  %12 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %12, align 1
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @INSERT(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #5 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %2, align 1
  %6 = load i32, ptr %5, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %24

8:                                                ; preds = %4
  %9 = load ptr, ptr %0, align 1
  store i16 0, ptr %9, align 1
  br label %10

10:                                               ; preds = %10, %8
  %11 = phi i32 [ 0, %8 ], [ %21, %10 ]
  %12 = load ptr, ptr %0, align 1
  %13 = getelementptr inbounds nuw i8, ptr %12, i32 2
  %14 = getelementptr inbounds nuw i8, ptr %13, i32 %11
  store i8 0, ptr %14, align 1
  %15 = load ptr, ptr %0, align 1
  %16 = getelementptr inbounds nuw i8, ptr %15, i32 3
  %17 = getelementptr inbounds nuw i8, ptr %16, i32 %11
  store i8 0, ptr %17, align 1
  %18 = load ptr, ptr %0, align 1
  %19 = getelementptr inbounds nuw i8, ptr %18, i32 4
  %20 = getelementptr inbounds nuw i8, ptr %19, i32 %11
  store i8 0, ptr %20, align 1
  %21 = add nuw nsw i32 %11, 3
  %22 = icmp eq i32 %21, 81
  br i1 %22, label %23, label %10, !llvm.loop !7

23:                                               ; preds = %10
  tail call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0BL@JPOJLKEG@INSERT?3Insert?5length?50?3?5a3?$AA@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %204

24:                                               ; preds = %4
  %25 = load ptr, ptr %1, align 1
  %26 = load i16, ptr %25, align 1
  %27 = load ptr, ptr %0, align 1
  %28 = load i16, ptr %27, align 1
  %29 = zext i16 %28 to i32
  %30 = zext i16 %26 to i32
  %31 = add nuw nsw i32 %29, %30
  %32 = icmp samesign ugt i32 %31, 80
  br i1 %32, label %33, label %48

33:                                               ; preds = %24
  store i16 0, ptr %27, align 1
  br label %34

34:                                               ; preds = %34, %33
  %35 = phi i32 [ 0, %33 ], [ %45, %34 ]
  %36 = load ptr, ptr %0, align 1
  %37 = getelementptr inbounds nuw i8, ptr %36, i32 2
  %38 = getelementptr inbounds nuw i8, ptr %37, i32 %35
  store i8 0, ptr %38, align 1
  %39 = load ptr, ptr %0, align 1
  %40 = getelementptr inbounds nuw i8, ptr %39, i32 3
  %41 = getelementptr inbounds nuw i8, ptr %40, i32 %35
  store i8 0, ptr %41, align 1
  %42 = load ptr, ptr %0, align 1
  %43 = getelementptr inbounds nuw i8, ptr %42, i32 4
  %44 = getelementptr inbounds nuw i8, ptr %43, i32 %35
  store i8 0, ptr %44, align 1
  %45 = add nuw nsw i32 %35, 3
  %46 = icmp eq i32 %45, 81
  br i1 %46, label %47, label %34, !llvm.loop !7

47:                                               ; preds = %34
  tail call void @Eexception_Post(i32 noundef 5, ptr noundef nonnull @"??_C@_0BI@GCPJOOHJ@INSERT?3Insert?5size?5over?$AA@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %204

48:                                               ; preds = %24
  %49 = icmp sgt i32 %6, %29
  br i1 %49, label %50, label %65

50:                                               ; preds = %48
  store i16 0, ptr %27, align 1
  br label %51

51:                                               ; preds = %51, %50
  %52 = phi i32 [ 0, %50 ], [ %62, %51 ]
  %53 = load ptr, ptr %0, align 1
  %54 = getelementptr inbounds nuw i8, ptr %53, i32 2
  %55 = getelementptr inbounds nuw i8, ptr %54, i32 %52
  store i8 0, ptr %55, align 1
  %56 = load ptr, ptr %0, align 1
  %57 = getelementptr inbounds nuw i8, ptr %56, i32 3
  %58 = getelementptr inbounds nuw i8, ptr %57, i32 %52
  store i8 0, ptr %58, align 1
  %59 = load ptr, ptr %0, align 1
  %60 = getelementptr inbounds nuw i8, ptr %59, i32 4
  %61 = getelementptr inbounds nuw i8, ptr %60, i32 %52
  store i8 0, ptr %61, align 1
  %62 = add nuw nsw i32 %52, 3
  %63 = icmp eq i32 %62, 81
  br i1 %63, label %64, label %51, !llvm.loop !7

64:                                               ; preds = %51
  tail call void @Eexception_Post(i32 noundef 4, ptr noundef nonnull @"??_C@_0BK@HCLMIPFB@INSERT?3Insert?5index?5error?$AA@") #20
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %204

65:                                               ; preds = %48
  %66 = sub i32 %30, %6
  %67 = add i32 %66, %29
  %68 = icmp sgt i32 %67, 0
  br i1 %68, label %69, label %95

69:                                               ; preds = %65
  %70 = add nuw nsw i32 %30, %29
  %71 = and i32 %67, 3
  %72 = sub i32 %6, %70
  %73 = icmp ugt i32 %72, -4
  br i1 %73, label %78, label %74

74:                                               ; preds = %69
  %75 = and i32 %67, 2147483644
  br label %102

76:                                               ; preds = %102
  %77 = icmp eq i32 %71, 0
  br i1 %77, label %95, label %78

78:                                               ; preds = %76, %69
  %79 = phi i32 [ 0, %69 ], [ %137, %76 ]
  %80 = icmp ne i32 %71, 0
  tail call void @llvm.assume(i1 %80)
  br label %81

81:                                               ; preds = %81, %78
  %82 = phi i32 [ %92, %81 ], [ %79, %78 ]
  %83 = phi i32 [ %93, %81 ], [ 0, %78 ]
  %84 = load ptr, ptr %0, align 1
  %85 = getelementptr inbounds nuw i8, ptr %84, i32 2
  %86 = xor i32 %82, -1
  %87 = getelementptr i8, ptr %85, i32 %86
  %88 = getelementptr i8, ptr %87, i32 %29
  %89 = load i8, ptr %88, align 1
  %90 = getelementptr i8, ptr %85, i32 %31
  %91 = getelementptr i8, ptr %90, i32 %86
  store i8 %89, ptr %91, align 1
  %92 = add nuw nsw i32 %82, 1
  %93 = add i32 %83, 1
  %94 = icmp eq i32 %93, %71
  br i1 %94, label %95, label %81, !llvm.loop !13

95:                                               ; preds = %76, %81, %65
  %96 = icmp eq i16 %26, 0
  br i1 %96, label %200, label %97

97:                                               ; preds = %95
  %98 = and i32 %30, 3
  %99 = icmp ult i16 %26, 4
  br i1 %99, label %183, label %100

100:                                              ; preds = %97
  %101 = and i32 %30, 124
  br label %140

102:                                              ; preds = %102, %74
  %103 = phi i32 [ 0, %74 ], [ %137, %102 ]
  %104 = phi i32 [ 0, %74 ], [ %138, %102 ]
  %105 = load ptr, ptr %0, align 1
  %106 = getelementptr inbounds nuw i8, ptr %105, i32 2
  %107 = xor i32 %103, -1
  %108 = getelementptr i8, ptr %106, i32 %107
  %109 = getelementptr i8, ptr %108, i32 %29
  %110 = load i8, ptr %109, align 1
  %111 = getelementptr i8, ptr %106, i32 %31
  %112 = getelementptr i8, ptr %111, i32 %107
  store i8 %110, ptr %112, align 1
  %113 = load ptr, ptr %0, align 1
  %114 = getelementptr inbounds nuw i8, ptr %113, i32 2
  %115 = xor i32 %103, -2
  %116 = getelementptr i8, ptr %114, i32 %115
  %117 = getelementptr i8, ptr %116, i32 %29
  %118 = load i8, ptr %117, align 1
  %119 = getelementptr i8, ptr %114, i32 %31
  %120 = getelementptr i8, ptr %119, i32 %115
  store i8 %118, ptr %120, align 1
  %121 = load ptr, ptr %0, align 1
  %122 = getelementptr inbounds nuw i8, ptr %121, i32 2
  %123 = xor i32 %103, -3
  %124 = getelementptr i8, ptr %122, i32 %123
  %125 = getelementptr i8, ptr %124, i32 %29
  %126 = load i8, ptr %125, align 1
  %127 = getelementptr i8, ptr %122, i32 %31
  %128 = getelementptr i8, ptr %127, i32 %123
  store i8 %126, ptr %128, align 1
  %129 = load ptr, ptr %0, align 1
  %130 = getelementptr inbounds nuw i8, ptr %129, i32 2
  %131 = xor i32 %103, -4
  %132 = getelementptr i8, ptr %130, i32 %131
  %133 = getelementptr i8, ptr %132, i32 %29
  %134 = load i8, ptr %133, align 1
  %135 = getelementptr i8, ptr %130, i32 %31
  %136 = getelementptr i8, ptr %135, i32 %131
  store i8 %134, ptr %136, align 1
  %137 = add nuw nsw i32 %103, 4
  %138 = add i32 %104, 4
  %139 = icmp eq i32 %138, %75
  br i1 %139, label %76, label %102, !llvm.loop !14

140:                                              ; preds = %140, %100
  %141 = phi i32 [ 0, %100 ], [ %178, %140 ]
  %142 = phi i32 [ 0, %100 ], [ %179, %140 ]
  %143 = load ptr, ptr %1, align 1
  %144 = getelementptr inbounds nuw i8, ptr %143, i32 2
  %145 = getelementptr inbounds nuw i8, ptr %144, i32 %141
  %146 = load i8, ptr %145, align 1
  %147 = load ptr, ptr %0, align 1
  %148 = getelementptr inbounds nuw i8, ptr %147, i32 2
  %149 = getelementptr i8, ptr %148, i32 %6
  %150 = getelementptr i8, ptr %149, i32 %141
  store i8 %146, ptr %150, align 1
  %151 = or disjoint i32 %141, 1
  %152 = load ptr, ptr %1, align 1
  %153 = getelementptr inbounds nuw i8, ptr %152, i32 2
  %154 = getelementptr inbounds nuw i8, ptr %153, i32 %151
  %155 = load i8, ptr %154, align 1
  %156 = load ptr, ptr %0, align 1
  %157 = getelementptr inbounds nuw i8, ptr %156, i32 2
  %158 = getelementptr i8, ptr %157, i32 %6
  %159 = getelementptr i8, ptr %158, i32 %151
  store i8 %155, ptr %159, align 1
  %160 = or disjoint i32 %141, 2
  %161 = load ptr, ptr %1, align 1
  %162 = getelementptr inbounds nuw i8, ptr %161, i32 2
  %163 = getelementptr inbounds nuw i8, ptr %162, i32 %160
  %164 = load i8, ptr %163, align 1
  %165 = load ptr, ptr %0, align 1
  %166 = getelementptr inbounds nuw i8, ptr %165, i32 2
  %167 = getelementptr i8, ptr %166, i32 %6
  %168 = getelementptr i8, ptr %167, i32 %160
  store i8 %164, ptr %168, align 1
  %169 = or disjoint i32 %141, 3
  %170 = load ptr, ptr %1, align 1
  %171 = getelementptr inbounds nuw i8, ptr %170, i32 2
  %172 = getelementptr inbounds nuw i8, ptr %171, i32 %169
  %173 = load i8, ptr %172, align 1
  %174 = load ptr, ptr %0, align 1
  %175 = getelementptr inbounds nuw i8, ptr %174, i32 2
  %176 = getelementptr i8, ptr %175, i32 %6
  %177 = getelementptr i8, ptr %176, i32 %169
  store i8 %173, ptr %177, align 1
  %178 = add nuw nsw i32 %141, 4
  %179 = add i32 %142, 4
  %180 = icmp eq i32 %179, %101
  br i1 %180, label %181, label %140, !llvm.loop !15

181:                                              ; preds = %140
  %182 = icmp eq i32 %98, 0
  br i1 %182, label %200, label %183

183:                                              ; preds = %181, %97
  %184 = phi i32 [ 0, %97 ], [ %178, %181 ]
  %185 = icmp ne i32 %98, 0
  tail call void @llvm.assume(i1 %185)
  br label %186

186:                                              ; preds = %186, %183
  %187 = phi i32 [ %197, %186 ], [ %184, %183 ]
  %188 = phi i32 [ %198, %186 ], [ 0, %183 ]
  %189 = load ptr, ptr %1, align 1
  %190 = getelementptr inbounds nuw i8, ptr %189, i32 2
  %191 = getelementptr inbounds nuw i8, ptr %190, i32 %187
  %192 = load i8, ptr %191, align 1
  %193 = load ptr, ptr %0, align 1
  %194 = getelementptr inbounds nuw i8, ptr %193, i32 2
  %195 = getelementptr i8, ptr %194, i32 %6
  %196 = getelementptr i8, ptr %195, i32 %187
  store i8 %192, ptr %196, align 1
  %197 = add nuw nsw i32 %187, 1
  %198 = add i32 %188, 1
  %199 = icmp eq i32 %198, %98
  br i1 %199, label %200, label %186, !llvm.loop !16

200:                                              ; preds = %181, %186, %95
  %201 = load ptr, ptr %0, align 1
  %202 = load i16, ptr %201, align 1
  %203 = add i16 %202, %26
  store i16 %203, ptr %201, align 1
  br label %204

204:                                              ; preds = %200, %64, %47, %23
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LE_STRING(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #15 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 2
  %7 = load ptr, ptr %0, align 1
  %8 = getelementptr inbounds nuw i8, ptr %7, i32 2
  %9 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %8, ptr noundef nonnull dereferenceable(1) %6) #20
  %10 = icmp slt i32 %9, 1
  %11 = zext i1 %10 to i8
  store i8 %11, ptr %7, align 1
  %12 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %12, align 1
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @LEFT(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #5 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = load i32, ptr %5, align 4
  %7 = icmp sgt i32 %6, 80
  %8 = load ptr, ptr %0, align 1
  br i1 %7, label %9, label %24

9:                                                ; preds = %4
  store i16 0, ptr %8, align 1
  br label %10

10:                                               ; preds = %10, %9
  %11 = phi i32 [ 0, %9 ], [ %21, %10 ]
  %12 = load ptr, ptr %0, align 1
  %13 = getelementptr inbounds nuw i8, ptr %12, i32 2
  %14 = getelementptr inbounds nuw i8, ptr %13, i32 %11
  store i8 0, ptr %14, align 1
  %15 = load ptr, ptr %0, align 1
  %16 = getelementptr inbounds nuw i8, ptr %15, i32 3
  %17 = getelementptr inbounds nuw i8, ptr %16, i32 %11
  store i8 0, ptr %17, align 1
  %18 = load ptr, ptr %0, align 1
  %19 = getelementptr inbounds nuw i8, ptr %18, i32 4
  %20 = getelementptr inbounds nuw i8, ptr %19, i32 %11
  store i8 0, ptr %20, align 1
  %21 = add nuw nsw i32 %11, 3
  %22 = icmp eq i32 %21, 81
  br i1 %22, label %23, label %10, !llvm.loop !7

23:                                               ; preds = %10
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %52

24:                                               ; preds = %4
  %25 = load i16, ptr %8, align 1
  %26 = zext i16 %25 to i32
  %27 = icmp sgt i32 %6, %26
  br i1 %27, label %28, label %43

28:                                               ; preds = %24
  store i16 0, ptr %8, align 1
  br label %29

29:                                               ; preds = %29, %28
  %30 = phi i32 [ 0, %28 ], [ %40, %29 ]
  %31 = load ptr, ptr %0, align 1
  %32 = getelementptr inbounds nuw i8, ptr %31, i32 2
  %33 = getelementptr inbounds nuw i8, ptr %32, i32 %30
  store i8 0, ptr %33, align 1
  %34 = load ptr, ptr %0, align 1
  %35 = getelementptr inbounds nuw i8, ptr %34, i32 3
  %36 = getelementptr inbounds nuw i8, ptr %35, i32 %30
  store i8 0, ptr %36, align 1
  %37 = load ptr, ptr %0, align 1
  %38 = getelementptr inbounds nuw i8, ptr %37, i32 4
  %39 = getelementptr inbounds nuw i8, ptr %38, i32 %30
  store i8 0, ptr %39, align 1
  %40 = add nuw nsw i32 %30, 3
  %41 = icmp eq i32 %40, 81
  br i1 %41, label %42, label %29, !llvm.loop !7

42:                                               ; preds = %29
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %52

43:                                               ; preds = %24
  %44 = trunc i32 %6 to i16
  store i16 %44, ptr %8, align 1
  %45 = load ptr, ptr %1, align 1
  %46 = load i32, ptr %45, align 4
  %47 = sub i32 81, %46
  %48 = load ptr, ptr %0, align 1
  %49 = getelementptr inbounds nuw i8, ptr %48, i32 2
  %50 = getelementptr inbounds i8, ptr %49, i32 %46
  %51 = tail call ptr @strnset(ptr noundef nonnull %50, i32 noundef 0, i32 noundef %47) #20
  br label %52

52:                                               ; preds = %42, %43, %23
  ret ptr %0
}

declare dso_local ptr @strnset(ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #9

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LEN(ptr noundef returned writeonly captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #16 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 261, ptr %5, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @LT_STRING(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #15 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 2
  %7 = load ptr, ptr %0, align 1
  %8 = getelementptr inbounds nuw i8, ptr %7, i32 2
  %9 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %8, ptr noundef nonnull dereferenceable(1) %6) #20
  %10 = lshr i32 %9, 31
  %11 = trunc nuw nsw i32 %10 to i8
  store i8 %11, ptr %7, align 1
  %12 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %12, align 1
  ret ptr %0
}

; Function Attrs: nofree norecurse nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @MID(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #17 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = load i32, ptr %5, align 4
  %7 = icmp sgt i32 %6, 80
  %8 = load ptr, ptr %0, align 1
  br i1 %7, label %9, label %24

9:                                                ; preds = %4
  store i16 0, ptr %8, align 1
  br label %10

10:                                               ; preds = %10, %9
  %11 = phi i32 [ 0, %9 ], [ %21, %10 ]
  %12 = load ptr, ptr %0, align 1
  %13 = getelementptr inbounds nuw i8, ptr %12, i32 2
  %14 = getelementptr inbounds nuw i8, ptr %13, i32 %11
  store i8 0, ptr %14, align 1
  %15 = load ptr, ptr %0, align 1
  %16 = getelementptr inbounds nuw i8, ptr %15, i32 3
  %17 = getelementptr inbounds nuw i8, ptr %16, i32 %11
  store i8 0, ptr %17, align 1
  %18 = load ptr, ptr %0, align 1
  %19 = getelementptr inbounds nuw i8, ptr %18, i32 4
  %20 = getelementptr inbounds nuw i8, ptr %19, i32 %11
  store i8 0, ptr %20, align 1
  %21 = add nuw nsw i32 %11, 3
  %22 = icmp eq i32 %21, 81
  br i1 %22, label %23, label %10, !llvm.loop !7

23:                                               ; preds = %10
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %105

24:                                               ; preds = %4
  %25 = load i16, ptr %8, align 1
  %26 = zext i16 %25 to i32
  %27 = icmp sgt i32 %6, %26
  br i1 %27, label %28, label %43

28:                                               ; preds = %24
  store i16 0, ptr %8, align 1
  br label %29

29:                                               ; preds = %29, %28
  %30 = phi i32 [ 0, %28 ], [ %40, %29 ]
  %31 = load ptr, ptr %0, align 1
  %32 = getelementptr inbounds nuw i8, ptr %31, i32 2
  %33 = getelementptr inbounds nuw i8, ptr %32, i32 %30
  store i8 0, ptr %33, align 1
  %34 = load ptr, ptr %0, align 1
  %35 = getelementptr inbounds nuw i8, ptr %34, i32 3
  %36 = getelementptr inbounds nuw i8, ptr %35, i32 %30
  store i8 0, ptr %36, align 1
  %37 = load ptr, ptr %0, align 1
  %38 = getelementptr inbounds nuw i8, ptr %37, i32 4
  %39 = getelementptr inbounds nuw i8, ptr %38, i32 %30
  store i8 0, ptr %39, align 1
  %40 = add nuw nsw i32 %30, 3
  %41 = icmp eq i32 %40, 81
  br i1 %41, label %42, label %29, !llvm.loop !7

42:                                               ; preds = %29
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %105

43:                                               ; preds = %24
  %44 = load ptr, ptr %2, align 1
  %45 = load i32, ptr %44, align 4
  %46 = icmp slt i32 %45, 1
  br i1 %46, label %47, label %62

47:                                               ; preds = %43
  store i16 0, ptr %8, align 1
  br label %48

48:                                               ; preds = %48, %47
  %49 = phi i32 [ 0, %47 ], [ %59, %48 ]
  %50 = load ptr, ptr %0, align 1
  %51 = getelementptr inbounds nuw i8, ptr %50, i32 2
  %52 = getelementptr inbounds nuw i8, ptr %51, i32 %49
  store i8 0, ptr %52, align 1
  %53 = load ptr, ptr %0, align 1
  %54 = getelementptr inbounds nuw i8, ptr %53, i32 3
  %55 = getelementptr inbounds nuw i8, ptr %54, i32 %49
  store i8 0, ptr %55, align 1
  %56 = load ptr, ptr %0, align 1
  %57 = getelementptr inbounds nuw i8, ptr %56, i32 4
  %58 = getelementptr inbounds nuw i8, ptr %57, i32 %49
  store i8 0, ptr %58, align 1
  %59 = add nuw nsw i32 %49, 3
  %60 = icmp eq i32 %59, 81
  br i1 %60, label %61, label %48, !llvm.loop !7

61:                                               ; preds = %48
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %105

62:                                               ; preds = %43
  %63 = add nsw i32 %45, %6
  %64 = add nuw nsw i32 %26, 1
  %65 = icmp sgt i32 %63, %64
  br i1 %65, label %66, label %81

66:                                               ; preds = %62
  store i16 0, ptr %8, align 1
  br label %67

67:                                               ; preds = %67, %66
  %68 = phi i32 [ 0, %66 ], [ %78, %67 ]
  %69 = load ptr, ptr %0, align 1
  %70 = getelementptr inbounds nuw i8, ptr %69, i32 2
  %71 = getelementptr inbounds nuw i8, ptr %70, i32 %68
  store i8 0, ptr %71, align 1
  %72 = load ptr, ptr %0, align 1
  %73 = getelementptr inbounds nuw i8, ptr %72, i32 3
  %74 = getelementptr inbounds nuw i8, ptr %73, i32 %68
  store i8 0, ptr %74, align 1
  %75 = load ptr, ptr %0, align 1
  %76 = getelementptr inbounds nuw i8, ptr %75, i32 4
  %77 = getelementptr inbounds nuw i8, ptr %76, i32 %68
  store i8 0, ptr %77, align 1
  %78 = add nuw nsw i32 %68, 3
  %79 = icmp eq i32 %78, 81
  br i1 %79, label %80, label %67, !llvm.loop !7

80:                                               ; preds = %67
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %105

81:                                               ; preds = %62
  %82 = getelementptr inbounds nuw i8, ptr %8, i32 2
  %83 = getelementptr i8, ptr %82, i32 %45
  %84 = getelementptr i8, ptr %83, i32 -1
  %85 = tail call ptr @strncpy(ptr noundef nonnull %82, ptr noundef %84, i32 noundef %6) #20
  %86 = load ptr, ptr %1, align 1
  %87 = load i32, ptr %86, align 4
  %88 = icmp slt i32 %87, 80
  br i1 %88, label %89, label %101

89:                                               ; preds = %81, %89
  %90 = phi i32 [ %98, %89 ], [ %87, %81 ]
  %91 = phi i32 [ %96, %89 ], [ 0, %81 ]
  %92 = load ptr, ptr %0, align 1
  %93 = getelementptr inbounds nuw i8, ptr %92, i32 2
  %94 = getelementptr i8, ptr %93, i32 %90
  %95 = getelementptr i8, ptr %94, i32 %91
  store i8 0, ptr %95, align 1
  %96 = add nuw nsw i32 %91, 1
  %97 = load ptr, ptr %1, align 1
  %98 = load i32, ptr %97, align 4
  %99 = sub nsw i32 80, %98
  %100 = icmp slt i32 %96, %99
  br i1 %100, label %89, label %101, !llvm.loop !17

101:                                              ; preds = %89, %81
  %102 = phi i32 [ %87, %81 ], [ %98, %89 ]
  %103 = trunc i32 %102 to i16
  %104 = load ptr, ptr %0, align 1
  store i16 %103, ptr %104, align 1
  br label %105

105:                                              ; preds = %101, %80, %61, %42, %23
  ret ptr %0
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strncpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none), i32 noundef) local_unnamed_addr #7

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @NE_STRING(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #15 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %5, align 1
  %6 = load ptr, ptr %1, align 1
  %7 = getelementptr inbounds nuw i8, ptr %6, i32 2
  %8 = load ptr, ptr %0, align 1
  %9 = getelementptr inbounds nuw i8, ptr %8, i32 2
  %10 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %9, ptr noundef nonnull dereferenceable(1) %7) #20
  %11 = icmp ne i32 %10, 0
  %12 = zext i1 %11 to i8
  store i8 %12, ptr %8, align 1
  ret ptr %0
}

; Function Attrs: nofree norecurse nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @REPLACE(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, ptr noundef readonly captures(none) %3) local_unnamed_addr #17 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = load i16, ptr %5, align 1
  %7 = load ptr, ptr %1, align 1
  %8 = load i16, ptr %7, align 1
  %9 = load ptr, ptr %2, align 1
  %10 = load i64, ptr %9, align 8
  %11 = load ptr, ptr %3, align 1
  %12 = load i64, ptr %11, align 8
  %13 = icmp ugt i16 %8, 80
  br i1 %13, label %14, label %29

14:                                               ; preds = %4
  store i16 0, ptr %5, align 1
  br label %15

15:                                               ; preds = %15, %14
  %16 = phi i32 [ 0, %14 ], [ %26, %15 ]
  %17 = load ptr, ptr %0, align 1
  %18 = getelementptr inbounds nuw i8, ptr %17, i32 2
  %19 = getelementptr inbounds nuw i8, ptr %18, i32 %16
  store i8 0, ptr %19, align 1
  %20 = load ptr, ptr %0, align 1
  %21 = getelementptr inbounds nuw i8, ptr %20, i32 3
  %22 = getelementptr inbounds nuw i8, ptr %21, i32 %16
  store i8 0, ptr %22, align 1
  %23 = load ptr, ptr %0, align 1
  %24 = getelementptr inbounds nuw i8, ptr %23, i32 4
  %25 = getelementptr inbounds nuw i8, ptr %24, i32 %16
  store i8 0, ptr %25, align 1
  %26 = add nuw nsw i32 %16, 3
  %27 = icmp eq i32 %26, 81
  br i1 %27, label %28, label %15, !llvm.loop !7

28:                                               ; preds = %15
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %159

29:                                               ; preds = %4
  %30 = icmp ugt i16 %8, %6
  br i1 %30, label %31, label %46

31:                                               ; preds = %29
  store i16 0, ptr %5, align 1
  br label %32

32:                                               ; preds = %32, %31
  %33 = phi i32 [ 0, %31 ], [ %43, %32 ]
  %34 = load ptr, ptr %0, align 1
  %35 = getelementptr inbounds nuw i8, ptr %34, i32 2
  %36 = getelementptr inbounds nuw i8, ptr %35, i32 %33
  store i8 0, ptr %36, align 1
  %37 = load ptr, ptr %0, align 1
  %38 = getelementptr inbounds nuw i8, ptr %37, i32 3
  %39 = getelementptr inbounds nuw i8, ptr %38, i32 %33
  store i8 0, ptr %39, align 1
  %40 = load ptr, ptr %0, align 1
  %41 = getelementptr inbounds nuw i8, ptr %40, i32 4
  %42 = getelementptr inbounds nuw i8, ptr %41, i32 %33
  store i8 0, ptr %42, align 1
  %43 = add nuw nsw i32 %33, 3
  %44 = icmp eq i32 %43, 81
  br i1 %44, label %45, label %32, !llvm.loop !7

45:                                               ; preds = %32
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %159

46:                                               ; preds = %29
  %47 = icmp slt i64 %10, 1
  br i1 %47, label %48, label %63

48:                                               ; preds = %46
  store i16 0, ptr %5, align 1
  br label %49

49:                                               ; preds = %49, %48
  %50 = phi i32 [ 0, %48 ], [ %60, %49 ]
  %51 = load ptr, ptr %0, align 1
  %52 = getelementptr inbounds nuw i8, ptr %51, i32 2
  %53 = getelementptr inbounds nuw i8, ptr %52, i32 %50
  store i8 0, ptr %53, align 1
  %54 = load ptr, ptr %0, align 1
  %55 = getelementptr inbounds nuw i8, ptr %54, i32 3
  %56 = getelementptr inbounds nuw i8, ptr %55, i32 %50
  store i8 0, ptr %56, align 1
  %57 = load ptr, ptr %0, align 1
  %58 = getelementptr inbounds nuw i8, ptr %57, i32 4
  %59 = getelementptr inbounds nuw i8, ptr %58, i32 %50
  store i8 0, ptr %59, align 1
  %60 = add nuw nsw i32 %50, 3
  %61 = icmp eq i32 %60, 81
  br i1 %61, label %62, label %49, !llvm.loop !7

62:                                               ; preds = %49
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %159

63:                                               ; preds = %46
  %64 = icmp slt i64 %12, 1
  br i1 %64, label %65, label %80

65:                                               ; preds = %63
  store i16 0, ptr %5, align 1
  br label %66

66:                                               ; preds = %66, %65
  %67 = phi i32 [ 0, %65 ], [ %77, %66 ]
  %68 = load ptr, ptr %0, align 1
  %69 = getelementptr inbounds nuw i8, ptr %68, i32 2
  %70 = getelementptr inbounds nuw i8, ptr %69, i32 %67
  store i8 0, ptr %70, align 1
  %71 = load ptr, ptr %0, align 1
  %72 = getelementptr inbounds nuw i8, ptr %71, i32 3
  %73 = getelementptr inbounds nuw i8, ptr %72, i32 %67
  store i8 0, ptr %73, align 1
  %74 = load ptr, ptr %0, align 1
  %75 = getelementptr inbounds nuw i8, ptr %74, i32 4
  %76 = getelementptr inbounds nuw i8, ptr %75, i32 %67
  store i8 0, ptr %76, align 1
  %77 = add nuw nsw i32 %67, 3
  %78 = icmp eq i32 %77, 81
  br i1 %78, label %79, label %66, !llvm.loop !7

79:                                               ; preds = %66
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %159

80:                                               ; preds = %63
  %81 = add nsw i64 %12, -1
  %82 = zext i16 %6 to i64
  %83 = icmp samesign ugt i64 %81, %82
  br i1 %83, label %84, label %99

84:                                               ; preds = %80
  store i16 0, ptr %5, align 1
  br label %85

85:                                               ; preds = %85, %84
  %86 = phi i32 [ 0, %84 ], [ %96, %85 ]
  %87 = load ptr, ptr %0, align 1
  %88 = getelementptr inbounds nuw i8, ptr %87, i32 2
  %89 = getelementptr inbounds nuw i8, ptr %88, i32 %86
  store i8 0, ptr %89, align 1
  %90 = load ptr, ptr %0, align 1
  %91 = getelementptr inbounds nuw i8, ptr %90, i32 3
  %92 = getelementptr inbounds nuw i8, ptr %91, i32 %86
  store i8 0, ptr %92, align 1
  %93 = load ptr, ptr %0, align 1
  %94 = getelementptr inbounds nuw i8, ptr %93, i32 4
  %95 = getelementptr inbounds nuw i8, ptr %94, i32 %86
  store i8 0, ptr %95, align 1
  %96 = add nuw nsw i32 %86, 3
  %97 = icmp eq i32 %96, 81
  br i1 %97, label %98, label %85, !llvm.loop !7

98:                                               ; preds = %85
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %159

99:                                               ; preds = %80
  %100 = zext nneg i16 %8 to i64
  %101 = icmp samesign ugt i64 %10, %100
  br i1 %101, label %102, label %117

102:                                              ; preds = %99
  store i16 0, ptr %5, align 1
  br label %103

103:                                              ; preds = %103, %102
  %104 = phi i32 [ 0, %102 ], [ %114, %103 ]
  %105 = load ptr, ptr %0, align 1
  %106 = getelementptr inbounds nuw i8, ptr %105, i32 2
  %107 = getelementptr inbounds nuw i8, ptr %106, i32 %104
  store i8 0, ptr %107, align 1
  %108 = load ptr, ptr %0, align 1
  %109 = getelementptr inbounds nuw i8, ptr %108, i32 3
  %110 = getelementptr inbounds nuw i8, ptr %109, i32 %104
  store i8 0, ptr %110, align 1
  %111 = load ptr, ptr %0, align 1
  %112 = getelementptr inbounds nuw i8, ptr %111, i32 4
  %113 = getelementptr inbounds nuw i8, ptr %112, i32 %104
  store i8 0, ptr %113, align 1
  %114 = add nuw nsw i32 %104, 3
  %115 = icmp eq i32 %114, 81
  br i1 %115, label %116, label %103, !llvm.loop !7

116:                                              ; preds = %103
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %159

117:                                              ; preds = %99
  %118 = add nuw nsw i64 %81, %10
  %119 = icmp samesign ugt i64 %118, 80
  br i1 %119, label %120, label %135

120:                                              ; preds = %117
  store i16 0, ptr %5, align 1
  br label %121

121:                                              ; preds = %121, %120
  %122 = phi i32 [ 0, %120 ], [ %132, %121 ]
  %123 = load ptr, ptr %0, align 1
  %124 = getelementptr inbounds nuw i8, ptr %123, i32 2
  %125 = getelementptr inbounds nuw i8, ptr %124, i32 %122
  store i8 0, ptr %125, align 1
  %126 = load ptr, ptr %0, align 1
  %127 = getelementptr inbounds nuw i8, ptr %126, i32 3
  %128 = getelementptr inbounds nuw i8, ptr %127, i32 %122
  store i8 0, ptr %128, align 1
  %129 = load ptr, ptr %0, align 1
  %130 = getelementptr inbounds nuw i8, ptr %129, i32 4
  %131 = getelementptr inbounds nuw i8, ptr %130, i32 %122
  store i8 0, ptr %131, align 1
  %132 = add nuw nsw i32 %122, 3
  %133 = icmp eq i32 %132, 81
  br i1 %133, label %134, label %121, !llvm.loop !7

134:                                              ; preds = %121
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %159

135:                                              ; preds = %117
  %136 = icmp samesign ugt i64 %118, %82
  br i1 %136, label %137, label %152

137:                                              ; preds = %135
  store i16 0, ptr %5, align 1
  br label %138

138:                                              ; preds = %138, %137
  %139 = phi i32 [ 0, %137 ], [ %149, %138 ]
  %140 = load ptr, ptr %0, align 1
  %141 = getelementptr inbounds nuw i8, ptr %140, i32 2
  %142 = getelementptr inbounds nuw i8, ptr %141, i32 %139
  store i8 0, ptr %142, align 1
  %143 = load ptr, ptr %0, align 1
  %144 = getelementptr inbounds nuw i8, ptr %143, i32 3
  %145 = getelementptr inbounds nuw i8, ptr %144, i32 %139
  store i8 0, ptr %145, align 1
  %146 = load ptr, ptr %0, align 1
  %147 = getelementptr inbounds nuw i8, ptr %146, i32 4
  %148 = getelementptr inbounds nuw i8, ptr %147, i32 %139
  store i8 0, ptr %148, align 1
  %149 = add nuw nsw i32 %139, 3
  %150 = icmp eq i32 %149, 81
  br i1 %150, label %151, label %138, !llvm.loop !7

151:                                              ; preds = %138
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %159

152:                                              ; preds = %135
  %153 = trunc nuw nsw i64 %10 to i32
  %154 = getelementptr inbounds nuw i8, ptr %7, i32 2
  %155 = getelementptr inbounds nuw i8, ptr %5, i32 2
  %156 = trunc nuw nsw i64 %81 to i32
  %157 = getelementptr inbounds nuw i8, ptr %155, i32 %156
  %158 = tail call ptr @strncpy(ptr noundef nonnull %157, ptr noundef nonnull %154, i32 noundef %153) #20
  br label %159

159:                                              ; preds = %152, %151, %134, %116, %98, %79, %62, %45, %28
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @RIGHT(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #5 {
  store i8 1, ptr @STAT_ENO_STRING_OPE, align 1
  %5 = load ptr, ptr %1, align 1
  %6 = load i32, ptr %5, align 4
  %7 = icmp sgt i32 %6, 80
  %8 = load ptr, ptr %0, align 1
  br i1 %7, label %9, label %24

9:                                                ; preds = %4
  store i16 0, ptr %8, align 1
  br label %10

10:                                               ; preds = %10, %9
  %11 = phi i32 [ 0, %9 ], [ %21, %10 ]
  %12 = load ptr, ptr %0, align 1
  %13 = getelementptr inbounds nuw i8, ptr %12, i32 2
  %14 = getelementptr inbounds nuw i8, ptr %13, i32 %11
  store i8 0, ptr %14, align 1
  %15 = load ptr, ptr %0, align 1
  %16 = getelementptr inbounds nuw i8, ptr %15, i32 3
  %17 = getelementptr inbounds nuw i8, ptr %16, i32 %11
  store i8 0, ptr %17, align 1
  %18 = load ptr, ptr %0, align 1
  %19 = getelementptr inbounds nuw i8, ptr %18, i32 4
  %20 = getelementptr inbounds nuw i8, ptr %19, i32 %11
  store i8 0, ptr %20, align 1
  %21 = add nuw nsw i32 %11, 3
  %22 = icmp eq i32 %21, 81
  br i1 %22, label %23, label %10, !llvm.loop !7

23:                                               ; preds = %10
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %59

24:                                               ; preds = %4
  %25 = load i16, ptr %8, align 1
  %26 = zext i16 %25 to i32
  %27 = icmp sgt i32 %6, %26
  br i1 %27, label %28, label %43

28:                                               ; preds = %24
  store i16 0, ptr %8, align 1
  br label %29

29:                                               ; preds = %29, %28
  %30 = phi i32 [ 0, %28 ], [ %40, %29 ]
  %31 = load ptr, ptr %0, align 1
  %32 = getelementptr inbounds nuw i8, ptr %31, i32 2
  %33 = getelementptr inbounds nuw i8, ptr %32, i32 %30
  store i8 0, ptr %33, align 1
  %34 = load ptr, ptr %0, align 1
  %35 = getelementptr inbounds nuw i8, ptr %34, i32 3
  %36 = getelementptr inbounds nuw i8, ptr %35, i32 %30
  store i8 0, ptr %36, align 1
  %37 = load ptr, ptr %0, align 1
  %38 = getelementptr inbounds nuw i8, ptr %37, i32 4
  %39 = getelementptr inbounds nuw i8, ptr %38, i32 %30
  store i8 0, ptr %39, align 1
  %40 = add nuw nsw i32 %30, 3
  %41 = icmp eq i32 %40, 81
  br i1 %41, label %42, label %29, !llvm.loop !7

42:                                               ; preds = %29
  store i8 0, ptr @STAT_ENO_STRING_OPE, align 1
  br label %59

43:                                               ; preds = %24
  %44 = trunc i32 %6 to i16
  %45 = sub i16 %25, %44
  store i16 %44, ptr %8, align 1
  %46 = load ptr, ptr %1, align 1
  %47 = load i32, ptr %46, align 4
  %48 = load ptr, ptr %0, align 1
  %49 = getelementptr inbounds nuw i8, ptr %48, i32 2
  %50 = zext i16 %45 to i32
  %51 = getelementptr inbounds nuw i8, ptr %49, i32 %50
  %52 = tail call ptr @strncpy(ptr noundef nonnull %49, ptr noundef nonnull %51, i32 noundef %47) #20
  %53 = load ptr, ptr %0, align 1
  %54 = getelementptr inbounds nuw i8, ptr %53, i32 2
  %55 = load ptr, ptr %1, align 1
  %56 = load i32, ptr %55, align 4
  %57 = getelementptr inbounds i8, ptr %54, i32 %56
  %58 = tail call ptr @strnset(ptr noundef nonnull %57, i32 noundef 0, i32 noundef %50) #20
  br label %59

59:                                               ; preds = %42, %43, %23
  ret ptr %0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #18

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #19

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nofree norecurse nosync nounwind memory(write, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #7 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: read, target_mem0: read, target_mem1: read) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { mustprogress nocallback nofree nounwind willreturn memory(read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { mustprogress nofree norecurse nounwind willreturn "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { mustprogress nocallback nofree nounwind willreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #16 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #17 = { nofree norecurse nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #18 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #19 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #20 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCPIEC\\StringOpe.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !8}
!12 = distinct !{!12, !8}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !8}
!15 = distinct !{!15, !8}
!16 = distinct !{!16, !10}
!17 = distinct !{!17, !8}
