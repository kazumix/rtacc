; ModuleID = 'scope.c'
source_filename = "scope.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@scope = dso_local global [128 x i8] zeroinitializer, align 1
@scopedvariable = dso_local global [128 x i8] zeroinitializer, align 1

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef nonnull ptr @Scope_set(ptr noundef readonly captures(address_is_null) %0) local_unnamed_addr #0 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %3, label %4

3:                                                ; preds = %1
  store i8 0, ptr @scope, align 1
  br label %6

4:                                                ; preds = %1
  %5 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) @scope, ptr noundef nonnull dereferenceable(1) %0) #4
  br label %6

6:                                                ; preds = %4, %3
  ret ptr @scope
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none)) local_unnamed_addr #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef nonnull ptr @Scope_get() local_unnamed_addr #2 {
  ret ptr @scope
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef ptr @Scope_variable(ptr noundef %0) local_unnamed_addr #0 {
  %2 = load i8, ptr @scope, align 1
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %25, label %4

4:                                                ; preds = %1
  %5 = tail call ptr @strrchr(ptr noundef nonnull dereferenceable(1) %0, i32 noundef 35) #4
  %6 = icmp eq ptr %5, null
  br i1 %6, label %18, label %7

7:                                                ; preds = %4
  %8 = getelementptr inbounds nuw i8, ptr %5, i32 1
  %9 = ptrtoint ptr %8 to i32
  %10 = ptrtoint ptr %0 to i32
  %11 = sub i32 %9, %10
  %12 = tail call ptr @strncpy(ptr noundef nonnull @scopedvariable, ptr noundef nonnull %0, i32 noundef %11) #4
  %13 = getelementptr inbounds i8, ptr @scopedvariable, i32 %11
  store i8 0, ptr %13, align 1
  %14 = tail call ptr @strcat(ptr noundef nonnull dereferenceable(1) @scopedvariable, ptr noundef nonnull dereferenceable(1) @scope) #4
  %15 = tail call i32 @strlen(ptr nonnull dereferenceable(1) @scopedvariable)
  %16 = getelementptr inbounds i8, ptr @scopedvariable, i32 %15
  store i16 46, ptr %16, align 1
  %17 = getelementptr inbounds i8, ptr %0, i32 %11
  br label %22

18:                                               ; preds = %4
  %19 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) @scopedvariable, ptr noundef nonnull dereferenceable(1) @scope) #4
  %20 = tail call i32 @strlen(ptr nonnull dereferenceable(1) @scopedvariable)
  %21 = getelementptr inbounds i8, ptr @scopedvariable, i32 %20
  store i16 46, ptr %21, align 1
  br label %22

22:                                               ; preds = %18, %7
  %23 = phi ptr [ %17, %7 ], [ %0, %18 ]
  %24 = tail call ptr @strcat(ptr noundef nonnull dereferenceable(1) @scopedvariable, ptr noundef nonnull dereferenceable(1) %23) #4
  br label %25

25:                                               ; preds = %22, %1
  %26 = phi ptr [ %0, %1 ], [ @scopedvariable, %22 ]
  ret ptr %26
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strlen(ptr noundef captures(none)) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local ptr @strrchr(ptr noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strncpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none), i32 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcat(ptr noalias noundef returned, ptr noalias noundef readonly captures(none)) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "scope.c", directory: "D:\\work\\rtacc\\examples\\PLCP")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)"}
