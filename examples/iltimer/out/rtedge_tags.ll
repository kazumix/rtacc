; ModuleID = 'rtedge_tags.c'
source_filename = "rtedge_tags.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

@il_rtedge_tag_count = internal unnamed_addr global i32 0, align 4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local zeroext range(i8 0, 2) i8 @il_rtedge_registry_push(ptr noundef readonly captures(address_is_null) %0, i8 noundef zeroext %1) local_unnamed_addr #0 {
  %3 = icmp eq ptr %0, null
  %4 = load i32, ptr @il_rtedge_tag_count, align 4
  %5 = icmp ugt i32 %4, 127
  %6 = select i1 %3, i1 true, i1 %5
  br i1 %6, label %9, label %7

7:                                                ; preds = %2
  %8 = add nuw nsw i32 %4, 1
  store i32 %8, ptr @il_rtedge_tag_count, align 4
  br label %9

9:                                                ; preds = %2, %7
  %10 = phi i8 [ 1, %7 ], [ 0, %2 ]
  ret i8 %10
}

; Function Attrs: noinline nounwind optnone
define dso_local void @IlRtedgeTags_Init() local_unnamed_addr #1 {
  call void @plcp_rtedge_clear_instances()
  call fastcc void @il_rtedge_invoke_slots_init()
  call void @IlRtedgeSlots_BindEgEntry()
  ret void
}

declare dso_local void @plcp_rtedge_clear_instances() local_unnamed_addr #2

; Function Attrs: noinline nounwind
define internal fastcc void @il_rtedge_invoke_slots_init() unnamed_addr #3 {
  tail call void @scan_slots_init() #4
  ret void
}

declare dso_local void @IlRtedgeSlots_BindEgEntry() local_unnamed_addr #2

; Function Attrs: noinline nounwind optnone
define dso_local void @il_rtedge_registry_clear() local_unnamed_addr #1 {
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local void @il_rtedge_registry_record_binding(ptr noundef %0, ptr noundef %1) local_unnamed_addr #1 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  store ptr %1, ptr %3, align 4
  store ptr %0, ptr %4, align 4
  %5 = load ptr, ptr %4, align 4
  %6 = load ptr, ptr %3, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local void @IlRtedgeRegistry_BindAllSlots() local_unnamed_addr #1 {
  ret void
}

declare dso_local void @scan_slots_init() local_unnamed_addr #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noinline nounwind optnone "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noinline nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "rtedge_tags.c", directory: "D:\\work\\rtacc\\examples\\iltimer")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
