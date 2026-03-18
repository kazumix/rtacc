; ModuleID = '..\PLCP\retain.c'
source_filename = "..\\PLCP\\retain.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_0BA@FBAMOBLD@SERVICE?4?$CFs?4Save?$AA@" = comdat any

$"??_C@_0BA@FDBBBCGH@SERVICE?4?$CFs?4Load?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@status_retain = dso_local local_unnamed_addr global i32 0, align 4
@"??_C@_0BA@FBAMOBLD@SERVICE?4?$CFs?4Save?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"SERVICE.%s.Save\00", comdat, align 1
@_Retain_Save = internal global [128 x i8] zeroinitializer, align 1
@"??_C@_0BA@FDBBBCGH@SERVICE?4?$CFs?4Load?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"SERVICE.%s.Load\00", comdat, align 1
@_Retain_Load = internal global [128 x i8] zeroinitializer, align 1
@Retain_Load_Request.loadordernumber = internal unnamed_addr global i32 0, align 4
@Retain_Save_Request.saveordernumber = internal unnamed_addr global i32 0, align 4

; Function Attrs: nofree nounwind
define dso_local void @Retain_Set_Tagname(ptr noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 (ptr, ptr, ...) @sprintf(ptr noundef nonnull dereferenceable(1) @_Retain_Save, ptr noundef nonnull dereferenceable(1) @"??_C@_0BA@FBAMOBLD@SERVICE?4?$CFs?4Save?$AA@", ptr noundef %0) #6
  %3 = tail call i32 (ptr, ptr, ...) @sprintf(ptr noundef nonnull dereferenceable(1) @_Retain_Load, ptr noundef nonnull dereferenceable(1) @"??_C@_0BA@FDBBBCGH@SERVICE?4?$CFs?4Load?$AA@", ptr noundef %0) #6
  ret void
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @sprintf(ptr noalias noundef writeonly captures(none), ptr noundef readonly captures(none), ...) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local zeroext i8 @Retain_Load_Request() local_unnamed_addr #2 {
  %1 = load i32, ptr @Retain_Load_Request.loadordernumber, align 4
  %2 = add i32 %1, 1
  %3 = tail call i32 @llvm.umax.i32(i32 %2, i32 1)
  store i32 %3, ptr @Retain_Load_Request.loadordernumber, align 4
  %4 = tail call zeroext i8 @Rtedge_TagWrite_UInt32(ptr noundef nonnull @_Retain_Load, i32 noundef %3) #6
  ret i8 %4
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #3

declare dso_local zeroext i8 @Rtedge_TagWrite_UInt32(ptr noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #3

; Function Attrs: nounwind
define dso_local zeroext i8 @Retain_Save_Request() local_unnamed_addr #2 {
  %1 = load i32, ptr @Retain_Save_Request.saveordernumber, align 4
  %2 = add i32 %1, 1
  %3 = tail call i32 @llvm.umax.i32(i32 %2, i32 1)
  store i32 %3, ptr @Retain_Save_Request.saveordernumber, align 4
  %4 = tail call zeroext i8 @Rtedge_TagWrite_UInt32(ptr noundef nonnull @_Retain_Save, i32 noundef %3) #6
  ret i8 %4
}

; Function Attrs: nounwind
define dso_local zeroext range(i8 0, 2) i8 @Retain_Load_Wait(i32 noundef %0) local_unnamed_addr #2 {
  %2 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #6
  %3 = call zeroext i8 @Rtedge_TagRead_UInt32(ptr noundef nonnull @_Retain_Load, ptr noundef nonnull %2) #6
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %18, label %5

5:                                                ; preds = %1, %14
  %6 = phi i32 [ %12, %14 ], [ %0, %1 ]
  %7 = load i32, ptr %2, align 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %18, label %9

9:                                                ; preds = %5
  %10 = icmp ult i32 %6, 100
  %11 = add i32 %6, -100
  %12 = select i1 %10, i32 %6, i32 %11
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %18, label %14

14:                                               ; preds = %9
  %15 = call zeroext i8 @RtSleepEx(i32 noundef 100) #6
  %16 = call zeroext i8 @Rtedge_TagRead_UInt32(ptr noundef nonnull @_Retain_Load, ptr noundef nonnull %2) #6
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %18, label %5

18:                                               ; preds = %14, %5, %9, %1
  %19 = phi i8 [ 0, %1 ], [ 0, %9 ], [ 1, %5 ], [ 0, %14 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #6
  ret i8 %19
}

declare dso_local zeroext i8 @Rtedge_TagRead_UInt32(ptr noundef, ptr noundef) local_unnamed_addr #4

declare dso_local zeroext i8 @RtSleepEx(i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local zeroext range(i8 0, 2) i8 @Retain_Save_Wait(i32 noundef %0) local_unnamed_addr #2 {
  %2 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #6
  %3 = call zeroext i8 @Rtedge_TagRead_UInt32(ptr noundef nonnull @_Retain_Save, ptr noundef nonnull %2) #6
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %16, label %5

5:                                                ; preds = %1, %11
  %6 = phi i32 [ %12, %11 ], [ %0, %1 ]
  %7 = load i32, ptr %2, align 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %16, label %9

9:                                                ; preds = %5
  %10 = icmp ult i32 %6, 101
  br i1 %10, label %16, label %11

11:                                               ; preds = %9
  %12 = add i32 %6, -100
  %13 = call zeroext i8 @RtSleepEx(i32 noundef 100) #6
  %14 = call zeroext i8 @Rtedge_TagRead_UInt32(ptr noundef nonnull @_Retain_Save, ptr noundef nonnull %2) #6
  %15 = icmp eq i8 %14, 0
  br i1 %15, label %16, label %5

16:                                               ; preds = %11, %5, %9, %1
  %17 = phi i8 [ 0, %1 ], [ 0, %9 ], [ 1, %5 ], [ 0, %11 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #6
  ret i8 %17
}

; Function Attrs: nounwind
define dso_local zeroext range(i8 0, 2) i8 @Retain_Save() local_unnamed_addr #2 {
  %1 = alloca i32, align 4
  %2 = load i32, ptr @Retain_Save_Request.saveordernumber, align 4
  %3 = add i32 %2, 1
  %4 = tail call i32 @llvm.umax.i32(i32 %3, i32 1)
  store i32 %4, ptr @Retain_Save_Request.saveordernumber, align 4
  %5 = tail call zeroext i8 @Rtedge_TagWrite_UInt32(ptr noundef nonnull @_Retain_Save, i32 noundef %4) #6
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %44, label %7

7:                                                ; preds = %0
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #6
  %8 = call zeroext i8 @Rtedge_TagRead_UInt32(ptr noundef nonnull @_Retain_Save, ptr noundef nonnull %1) #6
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %42, label %10

10:                                               ; preds = %7
  %11 = load i32, ptr %1, align 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %42, label %13

13:                                               ; preds = %10
  %14 = call zeroext i8 @RtSleepEx(i32 noundef 100) #6
  %15 = call zeroext i8 @Rtedge_TagRead_UInt32(ptr noundef nonnull @_Retain_Save, ptr noundef nonnull %1) #6
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %42, label %17

17:                                               ; preds = %13
  %18 = load i32, ptr %1, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %42, label %20

20:                                               ; preds = %17
  %21 = call zeroext i8 @RtSleepEx(i32 noundef 100) #6
  %22 = call zeroext i8 @Rtedge_TagRead_UInt32(ptr noundef nonnull @_Retain_Save, ptr noundef nonnull %1) #6
  %23 = icmp eq i8 %22, 0
  br i1 %23, label %42, label %24

24:                                               ; preds = %20
  %25 = load i32, ptr %1, align 4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %42, label %27

27:                                               ; preds = %24
  %28 = call zeroext i8 @RtSleepEx(i32 noundef 100) #6
  %29 = call zeroext i8 @Rtedge_TagRead_UInt32(ptr noundef nonnull @_Retain_Save, ptr noundef nonnull %1) #6
  %30 = icmp eq i8 %29, 0
  br i1 %30, label %42, label %31

31:                                               ; preds = %27
  %32 = load i32, ptr %1, align 4
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %42, label %34

34:                                               ; preds = %31
  %35 = call zeroext i8 @RtSleepEx(i32 noundef 100) #6
  %36 = call zeroext i8 @Rtedge_TagRead_UInt32(ptr noundef nonnull @_Retain_Save, ptr noundef nonnull %1) #6
  %37 = icmp eq i8 %36, 0
  br i1 %37, label %42, label %38

38:                                               ; preds = %34
  %39 = load i32, ptr %1, align 4
  %40 = icmp eq i32 %39, 0
  %41 = zext i1 %40 to i8
  br label %42

42:                                               ; preds = %38, %10, %13, %17, %20, %24, %27, %31, %34, %7
  %43 = phi i8 [ 0, %7 ], [ 0, %34 ], [ 1, %10 ], [ 0, %13 ], [ 1, %17 ], [ 1, %31 ], [ 0, %20 ], [ 1, %24 ], [ %41, %38 ], [ 0, %27 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #6
  br label %44

44:                                               ; preds = %42, %0
  %45 = phi i8 [ %43, %42 ], [ 0, %0 ]
  ret i8 %45
}

; Function Attrs: nounwind
define dso_local zeroext range(i8 0, 2) i8 @Retain_Load() local_unnamed_addr #2 {
  %1 = alloca i32, align 4
  %2 = load i32, ptr @Retain_Load_Request.loadordernumber, align 4
  %3 = add i32 %2, 1
  %4 = tail call i32 @llvm.umax.i32(i32 %3, i32 1)
  store i32 %4, ptr @Retain_Load_Request.loadordernumber, align 4
  %5 = tail call zeroext i8 @Rtedge_TagWrite_UInt32(ptr noundef nonnull @_Retain_Load, i32 noundef %4) #6
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %44, label %7

7:                                                ; preds = %0
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #6
  %8 = call zeroext i8 @Rtedge_TagRead_UInt32(ptr noundef nonnull @_Retain_Load, ptr noundef nonnull %1) #6
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %42, label %10

10:                                               ; preds = %7
  %11 = load i32, ptr %1, align 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %42, label %13

13:                                               ; preds = %10
  %14 = call zeroext i8 @RtSleepEx(i32 noundef 100) #6
  %15 = call zeroext i8 @Rtedge_TagRead_UInt32(ptr noundef nonnull @_Retain_Load, ptr noundef nonnull %1) #6
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %42, label %17

17:                                               ; preds = %13
  %18 = load i32, ptr %1, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %42, label %20

20:                                               ; preds = %17
  %21 = call zeroext i8 @RtSleepEx(i32 noundef 100) #6
  %22 = call zeroext i8 @Rtedge_TagRead_UInt32(ptr noundef nonnull @_Retain_Load, ptr noundef nonnull %1) #6
  %23 = icmp eq i8 %22, 0
  br i1 %23, label %42, label %24

24:                                               ; preds = %20
  %25 = load i32, ptr %1, align 4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %42, label %27

27:                                               ; preds = %24
  %28 = call zeroext i8 @RtSleepEx(i32 noundef 100) #6
  %29 = call zeroext i8 @Rtedge_TagRead_UInt32(ptr noundef nonnull @_Retain_Load, ptr noundef nonnull %1) #6
  %30 = icmp eq i8 %29, 0
  br i1 %30, label %42, label %31

31:                                               ; preds = %27
  %32 = load i32, ptr %1, align 4
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %42, label %34

34:                                               ; preds = %31
  %35 = call zeroext i8 @RtSleepEx(i32 noundef 100) #6
  %36 = call zeroext i8 @Rtedge_TagRead_UInt32(ptr noundef nonnull @_Retain_Load, ptr noundef nonnull %1) #6
  %37 = icmp eq i8 %36, 0
  br i1 %37, label %42, label %38

38:                                               ; preds = %34
  %39 = load i32, ptr %1, align 4
  %40 = icmp eq i32 %39, 0
  %41 = zext i1 %40 to i8
  br label %42

42:                                               ; preds = %38, %10, %13, %17, %20, %24, %27, %31, %34, %7
  %43 = phi i8 [ 0, %7 ], [ 0, %34 ], [ 1, %10 ], [ 0, %13 ], [ 1, %17 ], [ 1, %31 ], [ 0, %20 ], [ 1, %24 ], [ %41, %38 ], [ 0, %27 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #6
  br label %44

44:                                               ; preds = %42, %0
  %45 = phi i8 [ %43, %42 ], [ 0, %0 ]
  ret i8 %45
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #5

attributes #0 = { nofree nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\retain.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
