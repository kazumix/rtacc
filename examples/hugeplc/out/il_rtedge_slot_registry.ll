; ModuleID = '..\IL\il_rtedge_slot_registry.c'
source_filename = "..\\IL\\il_rtedge_slot_registry.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.IlRtedgeSlotRec = type { ptr, ptr }

$"??_C@_05HKHPEFOF@Entry?$AA@" = comdat any

@g_n = internal unnamed_addr global i32 0, align 4
@g_cap = internal unnamed_addr global i32 0, align 4
@g_rec = internal unnamed_addr global ptr null, align 4
@"??_C@_05HKHPEFOF@Entry?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"Entry\00", comdat, align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @il_rtedge_registry_clear() local_unnamed_addr #0 {
  store i32 0, ptr @g_n, align 4
  ret void
}

; Function Attrs: mustprogress nounwind willreturn memory(readwrite, target_mem0: none, target_mem1: none)
define dso_local void @il_rtedge_registry_record_binding(ptr noundef %0, ptr noundef %1) local_unnamed_addr #1 {
  %3 = icmp eq ptr %0, null
  %4 = icmp eq ptr %1, null
  %5 = or i1 %3, %4
  br i1 %5, label %24, label %6

6:                                                ; preds = %2
  %7 = load i32, ptr @g_n, align 4
  %8 = load i32, ptr @g_cap, align 4
  %9 = icmp ult i32 %7, %8
  br i1 %9, label %19, label %10

10:                                               ; preds = %6
  %11 = icmp eq i32 %8, 0
  %12 = shl i32 %8, 1
  %13 = select i1 %11, i32 512, i32 %12
  %14 = shl i32 %13, 3
  %15 = load ptr, ptr @g_rec, align 4
  %16 = tail call ptr @realloc(ptr noundef %15, i32 noundef %14) #8
  %17 = icmp eq ptr %16, null
  br i1 %17, label %24, label %18

18:                                               ; preds = %10
  store ptr %16, ptr @g_rec, align 4
  store i32 %13, ptr @g_cap, align 4
  br label %19

19:                                               ; preds = %18, %6
  %20 = load ptr, ptr @g_rec, align 4
  %21 = getelementptr inbounds nuw %struct.IlRtedgeSlotRec, ptr %20, i32 %7
  store ptr %0, ptr %21, align 4
  %22 = getelementptr inbounds nuw i8, ptr %21, i32 4
  store ptr %1, ptr %22, align 4
  %23 = add i32 %7, 1
  store i32 %23, ptr @g_n, align 4
  br label %24

24:                                               ; preds = %10, %2, %19
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nounwind willreturn allockind("realloc") allocsize(1) memory(argmem: readwrite, inaccessiblemem: readwrite)
declare dso_local noalias noundef ptr @realloc(ptr allocptr noundef captures(none), i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: nounwind
define dso_local void @IlRtedgeRegistry_BindAllSlots() local_unnamed_addr #4 {
  %1 = alloca [512 x i8], align 1
  %2 = alloca ptr, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #9
  %3 = load i32, ptr @g_n, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %55, label %5

5:                                                ; preds = %0
  %6 = getelementptr inbounds nuw i8, ptr %1, i32 511
  br label %7

7:                                                ; preds = %5, %51
  %8 = phi i32 [ 0, %5 ], [ %52, %51 ]
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #9
  store ptr null, ptr %2, align 4
  %9 = load ptr, ptr @g_rec, align 4
  %10 = getelementptr inbounds nuw %struct.IlRtedgeSlotRec, ptr %9, i32 %8
  %11 = load ptr, ptr %10, align 4
  %12 = call ptr @strchr(ptr noundef nonnull readonly dereferenceable(1) %11, i32 noundef 35) #9
  %13 = icmp eq ptr %12, null
  br i1 %13, label %18, label %14

14:                                               ; preds = %7
  %15 = getelementptr inbounds nuw i8, ptr %12, i32 1
  %16 = load i8, ptr %15, align 1
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %14, %7
  store i8 0, ptr %1, align 1
  br label %21

19:                                               ; preds = %14
  %20 = call ptr @strncpy(ptr noundef nonnull dereferenceable(1) %1, ptr noundef nonnull dereferenceable(1) %15, i32 noundef 511) #9
  store i8 0, ptr %6, align 1
  br label %21

21:                                               ; preds = %18, %19
  %22 = load i8, ptr %1, align 1
  %23 = icmp eq i8 %22, 0
  br i1 %23, label %51, label %24

24:                                               ; preds = %21
  %25 = call i32 @EgTagGetProperty(ptr noundef nonnull %1, ptr noundef nonnull @"??_C@_05HKHPEFOF@Entry?$AA@", ptr noundef nonnull %2, i32 noundef 4) #9
  %26 = icmp ne i32 %25, 0
  %27 = load ptr, ptr %2, align 4
  %28 = icmp eq ptr %27, null
  %29 = select i1 %26, i1 true, i1 %28
  br i1 %29, label %51, label %30

30:                                               ; preds = %24
  %31 = getelementptr inbounds nuw i8, ptr %27, i32 3
  %32 = load i16, ptr %31, align 1
  %33 = icmp eq i16 %32, 13
  br i1 %33, label %38, label %34

34:                                               ; preds = %30
  %35 = getelementptr inbounds nuw i8, ptr %27, i32 385
  %36 = load i32, ptr %35, align 1
  %37 = icmp eq i32 %36, 1
  br i1 %37, label %38, label %43

38:                                               ; preds = %34, %30
  %39 = getelementptr inbounds nuw i8, ptr %27, i32 23
  %40 = load i64, ptr %39, align 1
  %41 = trunc i64 %40 to i32
  %42 = inttoptr i32 %41 to ptr
  br label %45

43:                                               ; preds = %34
  %44 = getelementptr inbounds nuw i8, ptr %27, i32 15
  br label %45

45:                                               ; preds = %38, %43
  %46 = phi ptr [ %42, %38 ], [ %44, %43 ]
  %47 = load ptr, ptr @g_rec, align 4
  %48 = getelementptr inbounds nuw %struct.IlRtedgeSlotRec, ptr %47, i32 %8
  %49 = getelementptr inbounds nuw i8, ptr %48, i32 4
  %50 = load ptr, ptr %49, align 4
  store ptr %46, ptr %50, align 4
  br label %51

51:                                               ; preds = %24, %21, %45
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #9
  %52 = add nuw i32 %8, 1
  %53 = load i32, ptr @g_n, align 4
  %54 = icmp ult i32 %52, %53
  br i1 %54, label %7, label %55, !llvm.loop !7

55:                                               ; preds = %51, %0
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #9
  ret void
}

declare dllimport i32 @EgTagGetProperty(ptr noundef, ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #5

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local ptr @strchr(ptr noundef, i32 noundef) local_unnamed_addr #6

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strncpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none), i32 noundef) local_unnamed_addr #7

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nounwind willreturn memory(readwrite, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nounwind willreturn allockind("realloc") allocsize(1) memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { allocsize(1) }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\IL\\il_rtedge_slot_registry.c", directory: "D:\\work\\rtacc\\examples\\hugeplc")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!"llvm.loop.unroll.disable"}
