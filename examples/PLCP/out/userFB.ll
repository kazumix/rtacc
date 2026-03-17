; ModuleID = 'userFB.c'
source_filename = "userFB.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_0L@MKIBBCNB@UserFB_Add?$AA@" = comdat any

$"??_C@_0BE@HHDLPLIJ@UserFB_AddConnector?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@status_userFB = dso_local local_unnamed_addr global i32 0, align 4
@UserFBList = dso_local local_unnamed_addr global ptr null, align 4
@UserFBBottom = dso_local local_unnamed_addr global ptr null, align 4
@"??_C@_0L@MKIBBCNB@UserFB_Add?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"UserFB_Add\00", comdat, align 1
@"??_C@_0BE@HHDLPLIJ@UserFB_AddConnector?$AA@" = linkonce_odr dso_local unnamed_addr constant [20 x i8] c"UserFB_AddConnector\00", comdat, align 1

; Function Attrs: nounwind
define dso_local void @UserFB_Add(ptr noundef %0) local_unnamed_addr #0 {
  %2 = tail call ptr @Heap_Alloc(i32 noundef 20, ptr noundef nonnull @"??_C@_0L@MKIBBCNB@UserFB_Add?$AA@") #6
  %3 = getelementptr inbounds nuw i8, ptr %2, i32 16
  store ptr null, ptr %3, align 1
  store ptr %0, ptr %2, align 1
  %4 = load ptr, ptr @UserFBList, align 4
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store ptr %2, ptr @UserFBList, align 4
  br label %10

7:                                                ; preds = %1
  %8 = load ptr, ptr @UserFBBottom, align 4
  %9 = getelementptr inbounds nuw i8, ptr %8, i32 16
  store ptr %2, ptr %9, align 1
  br label %10

10:                                               ; preds = %7, %6
  store ptr %2, ptr @UserFBBottom, align 4
  store i32 2, ptr @status_userFB, align 4
  ret void
}

declare dso_local ptr @Heap_Alloc(i32 noundef, ptr noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @UserFB_AddConnector(ptr noundef captures(none) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #0 {
  %3 = tail call ptr @Heap_Alloc(i32 noundef 14, ptr noundef nonnull @"??_C@_0BE@HHDLPLIJ@UserFB_AddConnector?$AA@") #6
  %4 = getelementptr inbounds nuw i8, ptr %3, i32 10
  store ptr null, ptr %4, align 1
  tail call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(10) %3, ptr noundef nonnull align 1 dereferenceable(10) %1, i32 10, i1 false)
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 12
  %6 = load ptr, ptr %5, align 1
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  store ptr %3, ptr %5, align 1
  br label %16

9:                                                ; preds = %2, %9
  %10 = phi ptr [ %12, %9 ], [ %6, %2 ]
  %11 = getelementptr inbounds nuw i8, ptr %10, i32 10
  %12 = load ptr, ptr %11, align 1
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %9, !llvm.loop !7

14:                                               ; preds = %9
  %15 = getelementptr inbounds nuw i8, ptr %10, i32 10
  store ptr %3, ptr %15, align 1
  br label %16

16:                                               ; preds = %14, %8
  store i32 2, ptr @status_userFB, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #2

; Function Attrs: nofree norecurse nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef ptr @UserFB_Search(ptr noundef readonly captures(none) %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr @UserFBList, align 4
  %3 = icmp eq ptr %2, null
  br i1 %3, label %13, label %4

4:                                                ; preds = %1, %9
  %5 = phi ptr [ %11, %9 ], [ %2, %1 ]
  %6 = load ptr, ptr %5, align 1
  %7 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %6, ptr noundef nonnull dereferenceable(1) %0) #6
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %13, label %9

9:                                                ; preds = %4
  %10 = getelementptr inbounds nuw i8, ptr %5, i32 16
  %11 = load ptr, ptr %10, align 1
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %4, !llvm.loop !9

13:                                               ; preds = %4, %9, %1
  %14 = phi ptr [ null, %1 ], [ null, %9 ], [ %5, %4 ]
  ret ptr %14
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strcmp(ptr noundef captures(none), ptr noundef captures(none)) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local void @UserFB_Clear() local_unnamed_addr #0 {
  %1 = load ptr, ptr @UserFBList, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %8, label %3

3:                                                ; preds = %0, %3
  %4 = phi ptr [ %6, %3 ], [ %1, %0 ]
  %5 = getelementptr inbounds nuw i8, ptr %4, i32 16
  %6 = load ptr, ptr %5, align 1
  tail call void @Heap_Free(ptr noundef nonnull %4) #6
  store ptr %6, ptr @UserFBList, align 4
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %3, !llvm.loop !10

8:                                                ; preds = %3, %0
  store ptr null, ptr @UserFBBottom, align 4
  store ptr null, ptr @UserFBList, align 4
  store i32 0, ptr @status_userFB, align 4
  ret void
}

declare dso_local void @Heap_Free(ptr noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local noalias noundef ptr @UserFB_GetEntry(ptr noundef %0) local_unnamed_addr #0 {
  %2 = tail call ptr @Rtedge_GetStructureName(ptr noundef %0) #6
  ret ptr null
}

declare dso_local ptr @Rtedge_GetStructureName(ptr noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @UserFB_GetSize(ptr noundef readnone captures(none) %0) local_unnamed_addr #5 {
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef zeroext i8 @UserFB_TagCreate(ptr noundef readnone captures(none) %0, i16 noundef zeroext %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #5 {
  ret i8 1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local void @UserFB_Register(ptr noundef readnone captures(none) %0) local_unnamed_addr #5 {
  ret void
}

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nofree norecurse nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "userFB.c", directory: "D:\\work\\rtacc\\examples\\PLCP")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}
