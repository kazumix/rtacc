; ModuleID = '..\PLCP\poufile.c'
source_filename = "..\\PLCP\\poufile.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_0M@EIELBOGF@Poufile_Add?$AA@" = comdat any

$"??_C@_0BF@NFHFPGMN@Poufile_Add?3filepath?$AA@" = comdat any

$"??_C@_0BE@CDIPEEK@?5?5POUfile?$CI?$CF03d?$CJ?5?$CFs?6?$AA@" = comdat any

$"??_C@_0BC@CBLIHDML@Poufile_Set_Begin?$AA@" = comdat any

$"??_C@_0BL@MIJAGEAP@Poufile_Set_Begin?3filepath?$AA@" = comdat any

$"??_C@_00CNPNBAHC@?$AA@" = comdat any

$"??_C@_0BC@DOPEKAGM@Poufile_Set_Final?$AA@" = comdat any

$"??_C@_0BL@LBOMFFJG@Poufile_Set_Final?3filepath?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@status_pou = dso_local local_unnamed_addr global i32 0, align 4
@poulist = dso_local local_unnamed_addr global ptr null, align 4
@pouBottom = dso_local local_unnamed_addr global ptr null, align 4
@poubegin = dso_local local_unnamed_addr global ptr null, align 4
@poufinal = dso_local local_unnamed_addr global ptr null, align 4
@"??_C@_0M@EIELBOGF@Poufile_Add?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"Poufile_Add\00", comdat, align 1
@"??_C@_0BF@NFHFPGMN@Poufile_Add?3filepath?$AA@" = linkonce_odr dso_local unnamed_addr constant [21 x i8] c"Poufile_Add:filepath\00", comdat, align 1
@"??_C@_0BE@CDIPEEK@?5?5POUfile?$CI?$CF03d?$CJ?5?$CFs?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [20 x i8] c"  POUfile(%03d) %s\0A\00", comdat, align 1
@pouenum = dso_local local_unnamed_addr global ptr null, align 4
@"??_C@_0BC@CBLIHDML@Poufile_Set_Begin?$AA@" = linkonce_odr dso_local unnamed_addr constant [18 x i8] c"Poufile_Set_Begin\00", comdat, align 1
@"??_C@_0BL@MIJAGEAP@Poufile_Set_Begin?3filepath?$AA@" = linkonce_odr dso_local unnamed_addr constant [27 x i8] c"Poufile_Set_Begin:filepath\00", comdat, align 1
@"??_C@_00CNPNBAHC@?$AA@" = linkonce_odr dso_local unnamed_addr constant [1 x i8] zeroinitializer, comdat, align 1
@"??_C@_0BC@DOPEKAGM@Poufile_Set_Final?$AA@" = linkonce_odr dso_local unnamed_addr constant [18 x i8] c"Poufile_Set_Final\00", comdat, align 1
@"??_C@_0BL@LBOMFFJG@Poufile_Set_Final?3filepath?$AA@" = linkonce_odr dso_local unnamed_addr constant [27 x i8] c"Poufile_Set_Final:filepath\00", comdat, align 1
@str = private unnamed_addr constant [14 x i8] c"POU file list\00", align 1
@str.1 = private unnamed_addr constant [6 x i8] c"  N/A\00", align 1

; Function Attrs: nounwind
define dso_local ptr @Poufile_Add(ptr noundef readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = tail call ptr @Heap_Alloc(i32 noundef 8, ptr noundef nonnull @"??_C@_0M@EIELBOGF@Poufile_Add?$AA@") #9
  %3 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %0) #9
  %4 = add i32 %3, 1
  %5 = tail call ptr @Heap_Alloc(i32 noundef %4, ptr noundef nonnull @"??_C@_0BF@NFHFPGMN@Poufile_Add?3filepath?$AA@") #9
  store ptr %5, ptr %2, align 4
  %6 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %5, ptr noundef nonnull dereferenceable(1) %0) #9
  %7 = getelementptr inbounds nuw i8, ptr %2, i32 4
  store ptr null, ptr %7, align 4
  %8 = load ptr, ptr @poulist, align 4
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %1
  store ptr %2, ptr @poulist, align 4
  br label %14

11:                                               ; preds = %1
  %12 = load ptr, ptr @pouBottom, align 4
  %13 = getelementptr inbounds nuw i8, ptr %12, i32 4
  store ptr %2, ptr %13, align 4
  br label %14

14:                                               ; preds = %11, %10
  store ptr %2, ptr @pouBottom, align 4
  store i32 2, ptr @status_pou, align 4
  ret ptr %2
}

declare dso_local ptr @Heap_Alloc(i32 noundef, ptr noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strlen(ptr noundef captures(none)) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none)) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local void @Poufile_Clear() local_unnamed_addr #0 {
  %1 = load ptr, ptr @poulist, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %14, label %3

3:                                                ; preds = %0, %9
  %4 = phi ptr [ %12, %9 ], [ %1, %0 ]
  %5 = load ptr, ptr %4, align 4
  %6 = icmp eq ptr %5, null
  br i1 %6, label %9, label %7

7:                                                ; preds = %3
  tail call void @Heap_Free(ptr noundef nonnull %5) #9
  %8 = load ptr, ptr @poulist, align 4
  br label %9

9:                                                ; preds = %7, %3
  %10 = phi ptr [ %8, %7 ], [ %4, %3 ]
  %11 = getelementptr inbounds nuw i8, ptr %4, i32 4
  %12 = load ptr, ptr %11, align 4
  tail call void @Heap_Free(ptr noundef %10) #9
  store ptr %12, ptr @poulist, align 4
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %3, !llvm.loop !7

14:                                               ; preds = %9, %0
  store ptr null, ptr @pouBottom, align 4
  store ptr null, ptr @poulist, align 4
  store i32 0, ptr @status_pou, align 4
  ret void
}

declare dso_local void @Heap_Free(ptr noundef) local_unnamed_addr #1

; Function Attrs: nofree nounwind
define dso_local void @Poufile_Display() local_unnamed_addr #4 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %2 = load ptr, ptr @poulist, align 4
  %3 = icmp eq ptr %2, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  br label %15

6:                                                ; preds = %0, %6
  %7 = phi i32 [ %13, %6 ], [ 1, %0 ]
  %8 = phi ptr [ %12, %6 ], [ %2, %0 ]
  %9 = load ptr, ptr %8, align 4
  %10 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BE@CDIPEEK@?5?5POUfile?$CI?$CF03d?$CJ?5?$CFs?6?$AA@", i32 noundef %7, ptr noundef %9)
  %11 = getelementptr inbounds nuw i8, ptr %8, i32 4
  %12 = load ptr, ptr %11, align 4
  %13 = add nuw nsw i32 %7, 1
  %14 = icmp eq ptr %12, null
  br i1 %14, label %15, label %6, !llvm.loop !9

15:                                               ; preds = %6, %4
  ret void
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #5

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local ptr @Poufile_Next() local_unnamed_addr #6 {
  %1 = load ptr, ptr @pouenum, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %7, label %3

3:                                                ; preds = %0
  %4 = load ptr, ptr %1, align 4
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %6 = load ptr, ptr %5, align 4
  store ptr %6, ptr @pouenum, align 4
  br label %7

7:                                                ; preds = %0, %3
  %8 = phi ptr [ %4, %3 ], [ null, %0 ]
  ret ptr %8
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local ptr @Poufile_First() local_unnamed_addr #6 {
  %1 = load ptr, ptr @poulist, align 4
  store ptr %1, ptr @pouenum, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %7, label %3

3:                                                ; preds = %0
  %4 = load ptr, ptr %1, align 4
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %6 = load ptr, ptr %5, align 4
  store ptr %6, ptr @pouenum, align 4
  br label %7

7:                                                ; preds = %0, %3
  %8 = phi ptr [ %4, %3 ], [ null, %0 ]
  ret ptr %8
}

; Function Attrs: nounwind
define dso_local ptr @Poufile_Set_Begin(ptr noundef readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = tail call ptr @Heap_Alloc(i32 noundef 8, ptr noundef nonnull @"??_C@_0BC@CBLIHDML@Poufile_Set_Begin?$AA@") #9
  %3 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %0) #9
  %4 = add i32 %3, 1
  %5 = tail call ptr @Heap_Alloc(i32 noundef %4, ptr noundef nonnull @"??_C@_0BL@MIJAGEAP@Poufile_Set_Begin?3filepath?$AA@") #9
  store ptr %5, ptr %2, align 4
  %6 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %5, ptr noundef nonnull dereferenceable(1) %0) #9
  %7 = getelementptr inbounds nuw i8, ptr %2, i32 4
  store ptr null, ptr %7, align 4
  store ptr %2, ptr @poubegin, align 4
  ret ptr %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local ptr @Poufile_Get_Begin() local_unnamed_addr #7 {
  %1 = load ptr, ptr @poubegin, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %5, label %3

3:                                                ; preds = %0
  %4 = load ptr, ptr %1, align 4
  br label %5

5:                                                ; preds = %0, %3
  %6 = phi ptr [ %4, %3 ], [ @"??_C@_00CNPNBAHC@?$AA@", %0 ]
  ret ptr %6
}

; Function Attrs: nounwind
define dso_local ptr @Poufile_Set_Final(ptr noundef readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = tail call ptr @Heap_Alloc(i32 noundef 8, ptr noundef nonnull @"??_C@_0BC@DOPEKAGM@Poufile_Set_Final?$AA@") #9
  %3 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %0) #9
  %4 = add i32 %3, 1
  %5 = tail call ptr @Heap_Alloc(i32 noundef %4, ptr noundef nonnull @"??_C@_0BL@LBOMFFJG@Poufile_Set_Final?3filepath?$AA@") #9
  store ptr %5, ptr %2, align 4
  %6 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %5, ptr noundef nonnull dereferenceable(1) %0) #9
  %7 = getelementptr inbounds nuw i8, ptr %2, i32 4
  store ptr null, ptr %7, align 4
  store ptr %2, ptr @poufinal, align 4
  ret ptr %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local ptr @Poufile_Get_Final() local_unnamed_addr #7 {
  %1 = load ptr, ptr @poufinal, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %5, label %3

3:                                                ; preds = %0
  %4 = load ptr, ptr %1, align 4
  br label %5

5:                                                ; preds = %0, %3
  %6 = phi ptr [ %4, %3 ], [ @"??_C@_00CNPNBAHC@?$AA@", %0 ]
  ret ptr %6
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #8

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: read, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree nounwind }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\poufile.c", directory: "C:\\D_DRV\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
