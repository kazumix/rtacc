; ModuleID = '..\PLCP\structure.c'
source_filename = "..\\PLCP\\structure.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_0BJ@EJLMNAHD@structure?5tag?5not?5found?4?$AA@" = comdat any

$"??_C@_0CC@PMKPPOMH@Structure_CreateCatalog?3D_ANY?5pi@" = comdat any

$"??_C@_0CJ@OILNIPDE@Structure_CreateCatalog?3D_ANY?5pi@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@status_structure = dso_local local_unnamed_addr global i32 0, align 4
@"??_C@_0BJ@EJLMNAHD@structure?5tag?5not?5found?4?$AA@" = linkonce_odr dso_local unnamed_addr constant [25 x i8] c"structure tag not found.\00", comdat, align 1
@"??_C@_0CC@PMKPPOMH@Structure_CreateCatalog?3D_ANY?5pi@" = linkonce_odr dso_local unnamed_addr constant [34 x i8] c"Structure_CreateCatalog:D_ANY pin\00", comdat, align 1
@"??_C@_0CJ@OILNIPDE@Structure_CreateCatalog?3D_ANY?5pi@" = linkonce_odr dso_local unnamed_addr constant [41 x i8] c"Structure_CreateCatalog:D_ANY pin (body)\00", comdat, align 1

; Function Attrs: nounwind
define dso_local ptr @Structure_Compile(ptr noundef %0) local_unnamed_addr #0 {
  %2 = alloca [80 x i8], align 1
  %3 = icmp eq ptr %0, null
  br i1 %3, label %16, label %4

4:                                                ; preds = %1
  %5 = tail call ptr @strchr(ptr noundef nonnull dereferenceable(1) %0, i32 noundef 46) #7
  %6 = icmp eq ptr %5, null
  br i1 %6, label %16, label %7

7:                                                ; preds = %4
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #7
  %8 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %2, ptr noundef nonnull dereferenceable(1) %0) #7
  %9 = call ptr @strrchr(ptr noundef nonnull dereferenceable(1) %2, i32 noundef 46) #7
  store i8 0, ptr %9, align 1
  %10 = call zeroext i8 @Rtedge_IsStructure(ptr noundef nonnull %2) #7
  %11 = icmp eq i8 %10, 0
  br i1 %11, label %14, label %12

12:                                               ; preds = %7
  call void @Functionblock_Register(ptr noundef nonnull %2) #7
  %13 = call ptr @Variable_Search(ptr noundef nonnull %0) #7
  br label %14

14:                                               ; preds = %12, %7
  %15 = phi ptr [ %13, %12 ], [ null, %7 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #7
  br label %16

16:                                               ; preds = %4, %1, %14
  %17 = phi ptr [ %15, %14 ], [ null, %1 ], [ null, %4 ]
  ret ptr %17
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local ptr @strchr(ptr noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none)) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local ptr @strrchr(ptr noundef, i32 noundef) local_unnamed_addr #2

declare dso_local zeroext i8 @Rtedge_IsStructure(ptr noundef) local_unnamed_addr #4

declare dso_local void @Functionblock_Register(ptr noundef) local_unnamed_addr #4

declare dso_local ptr @Variable_Search(ptr noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: nounwind
define dso_local noundef i32 @Structure_CreateCatalog(ptr noundef %0, ptr noundef readonly captures(address_is_null) %1) local_unnamed_addr #0 {
  %3 = alloca [80 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #7
  %4 = tail call zeroext i8 @Rtedge_IsStructure(ptr noundef %0) #7
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %2
  tail call void @Errorlog_Add(i32 noundef 0, i32 noundef 8194, ptr noundef nonnull @"??_C@_0BJ@EJLMNAHD@structure?5tag?5not?5found?4?$AA@") #7
  br label %56

7:                                                ; preds = %2
  %8 = tail call ptr @Rtedge_TagGetPointer(ptr noundef %0) #7
  %9 = tail call ptr @Variable_Search(ptr noundef %0) #7
  %10 = icmp eq ptr %9, null
  br i1 %10, label %11, label %18

11:                                               ; preds = %7
  %12 = tail call ptr @Variable_Add(ptr noundef %0, i16 noundef zeroext 1059) #7
  %13 = getelementptr inbounds nuw i8, ptr %12, i32 6
  store ptr %8, ptr %13, align 1
  %14 = getelementptr inbounds nuw i8, ptr %8, i32 23
  %15 = load i64, ptr %14, align 1
  %16 = trunc i64 %15 to i32
  %17 = inttoptr i32 %16 to ptr
  store ptr %17, ptr %12, align 1
  br label %18

18:                                               ; preds = %11, %7
  %19 = tail call ptr @Rtedge_GetStructureName(ptr noundef %0) #7
  %20 = icmp eq ptr %1, null
  br i1 %20, label %55, label %21

21:                                               ; preds = %18
  %22 = getelementptr inbounds nuw i8, ptr %8, i32 23
  br label %23

23:                                               ; preds = %21, %48
  %24 = phi ptr [ %1, %21 ], [ %53, %48 ]
  %25 = phi i32 [ 0, %21 ], [ %51, %48 ]
  %26 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %3, ptr noundef nonnull dereferenceable(1) %0) #7
  %27 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %3)
  %28 = getelementptr inbounds i8, ptr %3, i32 %27
  store i16 46, ptr %28, align 1
  %29 = getelementptr inbounds nuw i8, ptr %24, i32 2
  %30 = load ptr, ptr %29, align 1
  %31 = call ptr @strcat(ptr noundef nonnull dereferenceable(1) %3, ptr noundef nonnull dereferenceable(1) %30) #7
  %32 = load i16, ptr %24, align 1
  %33 = call ptr @Variable_Add(ptr noundef nonnull %3, i16 noundef zeroext %32) #7
  %34 = getelementptr inbounds nuw i8, ptr %33, i32 6
  store ptr %8, ptr %34, align 1
  %35 = load i64, ptr %22, align 1
  %36 = trunc i64 %35 to i32
  %37 = inttoptr i32 %36 to ptr
  %38 = and i32 %25, 65535
  %39 = getelementptr inbounds nuw i8, ptr %37, i32 %38
  store ptr %39, ptr %33, align 1
  %40 = getelementptr inbounds nuw i8, ptr %33, i32 4
  %41 = load i16, ptr %40, align 1
  %42 = icmp eq i16 %41, -32767
  br i1 %42, label %43, label %48

43:                                               ; preds = %23
  %44 = call ptr @Heap_Alloc(i32 noundef 15, ptr noundef nonnull @"??_C@_0CC@PMKPPOMH@Structure_CreateCatalog?3D_ANY?5pi@") #7
  %45 = call ptr @Heap_Alloc(i32 noundef 83, ptr noundef nonnull @"??_C@_0CJ@OILNIPDE@Structure_CreateCatalog?3D_ANY?5pi@") #7
  store ptr %45, ptr %44, align 1
  %46 = ptrtoint ptr %44 to i32
  %47 = load ptr, ptr %33, align 1
  store i32 %46, ptr %47, align 4
  br label %48

48:                                               ; preds = %43, %23
  %49 = call zeroext i16 @Rtedge_SizeOf(ptr noundef nonnull %33) #7
  %50 = zext i16 %49 to i32
  %51 = add nuw nsw i32 %38, %50
  %52 = getelementptr inbounds nuw i8, ptr %24, i32 10
  %53 = load ptr, ptr %52, align 1
  %54 = icmp eq ptr %53, null
  br i1 %54, label %55, label %23, !llvm.loop !7

55:                                               ; preds = %48, %18
  store i32 2, ptr @status_structure, align 4
  br label %56

56:                                               ; preds = %55, %6
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #7
  ret i32 0
}

declare dso_local void @Errorlog_Add(i32 noundef, i32 noundef, ptr noundef) local_unnamed_addr #4

declare dso_local ptr @Rtedge_TagGetPointer(ptr noundef) local_unnamed_addr #4

declare dso_local ptr @Variable_Add(ptr noundef, i16 noundef zeroext) local_unnamed_addr #4

declare dso_local ptr @Rtedge_GetStructureName(ptr noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcat(ptr noalias noundef returned, ptr noalias noundef readonly captures(none)) local_unnamed_addr #3

declare dso_local ptr @Heap_Alloc(i32 noundef, ptr noundef) local_unnamed_addr #4

declare dso_local zeroext i16 @Rtedge_SizeOf(ptr noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @Structure_GetSize(ptr noundef readnone captures(none) %0) local_unnamed_addr #5 {
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: read)
declare i32 @strlen(ptr captures(none)) local_unnamed_addr #6

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: read) }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\structure.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
