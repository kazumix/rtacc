; ModuleID = '..\PLCP\label.c'
source_filename = "..\\PLCP\\label.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%union.tHashCode = type { %struct.anon }
%struct.anon = type { i32, i32, i32, i32 }

$LibVersion_0x0701 = comdat any

$"??_C@_09DADJEEPI@Label_Add?$AA@" = comdat any

$"??_C@_0BE@DBGJIEJN@Label_Add?3labelname?$AA@" = comdat any

$"??_C@_0CD@PBMEOOHM@label?5hash?5conflict?$CB?5?$CFs?4?5skipped@" = comdat any

$"??_C@_0BI@HABOLDNE@?5?5label?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?6?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@status_label = dso_local local_unnamed_addr global i32 0, align 4
@plcLabel = dso_local local_unnamed_addr global ptr null, align 4
@plcLabelBottom = dso_local local_unnamed_addr global ptr null, align 4
@LabelCatalog = dso_local local_unnamed_addr global [4095 x ptr] zeroinitializer, align 4
@"??_C@_09DADJEEPI@Label_Add?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"Label_Add\00", comdat, align 1
@"??_C@_0BE@DBGJIEJN@Label_Add?3labelname?$AA@" = linkonce_odr dso_local unnamed_addr constant [20 x i8] c"Label_Add:labelname\00", comdat, align 1
@"??_C@_0CD@PBMEOOHM@label?5hash?5conflict?$CB?5?$CFs?4?5skipped@" = linkonce_odr dso_local unnamed_addr constant [35 x i8] c"label hash conflict! %s. skipped.\0A\00", comdat, align 1
@"??_C@_0BI@HABOLDNE@?5?5label?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [24 x i8] c"  label(%03d) %14s  %p\0A\00", comdat, align 1
@str = private unnamed_addr constant [11 x i8] c"Label list\00", align 1
@str.1 = private unnamed_addr constant [6 x i8] c"  N/A\00", align 1

; Function Attrs: nounwind
define dso_local zeroext range(i16 0, 4096) i16 @Label_CalcHash(ptr noundef %0) local_unnamed_addr #0 {
  %2 = alloca %union.tHashCode, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #10
  call void @_Hash(ptr dead_on_unwind nonnull writable sret(%union.tHashCode) align 1 %2, ptr noundef %0) #10
  %3 = getelementptr inbounds nuw i8, ptr %2, i32 4
  %4 = load i32, ptr %3, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #10
  %5 = trunc i32 %4 to i16
  %6 = and i16 %5, 4095
  ret i16 %6
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

declare dso_local void @_Hash(ptr dead_on_unwind writable sret(%union.tHashCode) align 1, ptr noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: nounwind
define dso_local ptr @Label_Add(ptr noundef %0, i32 noundef %1, ptr noundef %2) local_unnamed_addr #0 {
  %4 = alloca %union.tHashCode, align 1
  %5 = tail call ptr @Heap_Alloc(i32 noundef 16, ptr noundef nonnull @"??_C@_09DADJEEPI@Label_Add?$AA@") #10
  %6 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %0) #10
  %7 = add i32 %6, 1
  %8 = tail call ptr @Heap_Alloc(i32 noundef %7, ptr noundef nonnull @"??_C@_0BE@DBGJIEJN@Label_Add?3labelname?$AA@") #10
  store ptr %8, ptr %5, align 1
  %9 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %8, ptr noundef nonnull dereferenceable(1) %0) #10
  %10 = getelementptr inbounds nuw i8, ptr %5, i32 4
  store i32 %1, ptr %10, align 1
  %11 = getelementptr inbounds nuw i8, ptr %5, i32 8
  store ptr %2, ptr %11, align 1
  %12 = getelementptr inbounds nuw i8, ptr %5, i32 12
  store ptr null, ptr %12, align 1
  %13 = load ptr, ptr @plcLabel, align 4
  %14 = icmp eq ptr %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %3
  store ptr %5, ptr @plcLabel, align 4
  br label %19

16:                                               ; preds = %3
  %17 = load ptr, ptr @plcLabelBottom, align 4
  %18 = getelementptr inbounds nuw i8, ptr %17, i32 12
  store ptr %5, ptr %18, align 1
  br label %19

19:                                               ; preds = %16, %15
  store ptr %5, ptr @plcLabelBottom, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #10
  call void @_Hash(ptr dead_on_unwind nonnull writable sret(%union.tHashCode) align 1 %4, ptr noundef nonnull %0) #10
  %20 = getelementptr inbounds nuw i8, ptr %4, i32 4
  %21 = load i32, ptr %20, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #10
  %22 = and i32 %21, 4095
  %23 = getelementptr inbounds nuw ptr, ptr @LabelCatalog, i32 %22
  %24 = load ptr, ptr %23, align 4
  %25 = icmp eq ptr %24, null
  br i1 %25, label %28, label %26

26:                                               ; preds = %19
  %27 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CD@PBMEOOHM@label?5hash?5conflict?$CB?5?$CFs?4?5skipped@", ptr noundef nonnull %0)
  br label %28

28:                                               ; preds = %19, %26
  store i32 2, ptr @status_label, align 4
  ret ptr %5
}

declare dso_local ptr @Heap_Alloc(i32 noundef, ptr noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strlen(ptr noundef captures(none)) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none)) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #5

; Function Attrs: nounwind
define dso_local void @Label_Clear() local_unnamed_addr #0 {
  %1 = load ptr, ptr @plcLabel, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %8, label %3

3:                                                ; preds = %0, %3
  %4 = phi ptr [ %6, %3 ], [ %1, %0 ]
  %5 = getelementptr inbounds nuw i8, ptr %4, i32 12
  %6 = load ptr, ptr %5, align 1
  tail call void @Heap_Free(ptr noundef nonnull %4) #10
  store ptr %6, ptr @plcLabel, align 4
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %3, !llvm.loop !7

8:                                                ; preds = %3, %0
  store ptr null, ptr @plcLabelBottom, align 4
  store ptr null, ptr @plcLabel, align 4
  store i32 0, ptr @status_label, align 4
  ret void
}

declare dso_local void @Heap_Free(ptr noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind
define dso_local void @Label_Display() local_unnamed_addr #6 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %2 = load ptr, ptr @plcLabel, align 4
  %3 = icmp eq ptr %2, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  br label %17

6:                                                ; preds = %0, %6
  %7 = phi i32 [ %15, %6 ], [ 1, %0 ]
  %8 = phi ptr [ %14, %6 ], [ %2, %0 ]
  %9 = getelementptr inbounds nuw i8, ptr %8, i32 8
  %10 = load ptr, ptr %9, align 1
  %11 = load ptr, ptr %8, align 1
  %12 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BI@HABOLDNE@?5?5label?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?6?$AA@", i32 noundef %7, ptr noundef %11, ptr noundef %10)
  %13 = getelementptr inbounds nuw i8, ptr %8, i32 12
  %14 = load ptr, ptr %13, align 1
  %15 = add nuw nsw i32 %7, 1
  %16 = icmp eq ptr %14, null
  br i1 %16, label %17, label %6, !llvm.loop !9

17:                                               ; preds = %6, %4
  ret void
}

; Function Attrs: nofree norecurse nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef ptr @Label_Search(ptr noundef readonly captures(none) %0) local_unnamed_addr #7 {
  %2 = load ptr, ptr @plcLabel, align 4
  %3 = icmp eq ptr %2, null
  br i1 %3, label %13, label %4

4:                                                ; preds = %1, %9
  %5 = phi ptr [ %11, %9 ], [ %2, %1 ]
  %6 = load ptr, ptr %5, align 1
  %7 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(1) %6) #10
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %13, label %9

9:                                                ; preds = %4
  %10 = getelementptr inbounds nuw i8, ptr %5, i32 12
  %11 = load ptr, ptr %10, align 1
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %4, !llvm.loop !10

13:                                               ; preds = %4, %9, %1
  %14 = phi ptr [ null, %1 ], [ null, %9 ], [ %5, %4 ]
  ret ptr %14
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strcmp(ptr noundef captures(none), ptr noundef captures(none)) local_unnamed_addr #3

; Function Attrs: nofree norecurse nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Label_SetAnchor(ptr noundef readonly captures(none) %0, i32 noundef %1, ptr noundef %2) local_unnamed_addr #8 {
  %4 = load ptr, ptr @plcLabel, align 4
  %5 = icmp eq ptr %4, null
  br i1 %5, label %18, label %6

6:                                                ; preds = %3, %11
  %7 = phi ptr [ %13, %11 ], [ %4, %3 ]
  %8 = load ptr, ptr %7, align 1
  %9 = tail call i32 @strcmp(ptr noundef nonnull readonly dereferenceable(1) %0, ptr noundef nonnull dereferenceable(1) %8) #10
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %15, label %11

11:                                               ; preds = %6
  %12 = getelementptr inbounds nuw i8, ptr %7, i32 12
  %13 = load ptr, ptr %12, align 1
  %14 = icmp eq ptr %13, null
  br i1 %14, label %18, label %6, !llvm.loop !10

15:                                               ; preds = %6
  %16 = getelementptr inbounds nuw i8, ptr %7, i32 4
  store i32 %1, ptr %16, align 1
  %17 = getelementptr inbounds nuw i8, ptr %7, i32 8
  store ptr %2, ptr %17, align 1
  br label %18

18:                                               ; preds = %11, %3, %15
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #9

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree norecurse nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree norecurse nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nofree nounwind }
attributes #10 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\label.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}
