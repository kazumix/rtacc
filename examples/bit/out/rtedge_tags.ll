; ModuleID = 'examples\bit\rtedge_tags.c'
source_filename = "examples\\bit\\rtedge_tags.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$"??_C@_09OIOPDAKO@DWORD?$CDdw1?$AA@" = comdat any

$"??_C@_09MDMCGDGN@DWORD?$CDdw2?$AA@" = comdat any

$"??_C@_09NKNJFCCM@DWORD?$CDdw3?$AA@" = comdat any

@il_rtedge_tag_count = internal unnamed_addr global i32 0, align 4
@k_bit_rtedge_scalar_specs = internal unnamed_addr constant [3 x ptr] [ptr @"??_C@_09OIOPDAKO@DWORD?$CDdw1?$AA@", ptr @"??_C@_09MDMCGDGN@DWORD?$CDdw2?$AA@", ptr @"??_C@_09NKNJFCCM@DWORD?$CDdw3?$AA@"], align 4
@"??_C@_09OIOPDAKO@DWORD?$CDdw1?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"DWORD#dw1\00", comdat, align 1
@"??_C@_09MDMCGDGN@DWORD?$CDdw2?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"DWORD#dw2\00", comdat, align 1
@"??_C@_09NKNJFCCM@DWORD?$CDdw3?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"DWORD#dw3\00", comdat, align 1

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

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @IlRtedgeTags_Init() local_unnamed_addr #2 {
  %1 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(ptr %1) #5
  store i32 0, ptr %1, align 4
  br label %2

2:                                                ; preds = %9, %0
  %3 = load i32, ptr %1, align 4
  %4 = icmp ult i32 %3, 3
  br i1 %4, label %5, label %12

5:                                                ; preds = %2
  %6 = load i32, ptr %1, align 4
  %7 = getelementptr inbounds nuw [3 x ptr], ptr @k_bit_rtedge_scalar_specs, i32 0, i32 %6
  %8 = load ptr, ptr %7, align 4
  call fastcc void @il_rtedge_apply_instruction_spec(ptr noundef %8)
  br label %9

9:                                                ; preds = %5
  %10 = load i32, ptr %1, align 4
  %11 = add i32 %10, 1
  store i32 %11, ptr %1, align 4
  br label %2, !llvm.loop !7

12:                                               ; preds = %2
  call void @scan_slots_init()
  call void @IlRtedgeSlots_BindEgEntry()
  call void @llvm.lifetime.end.p0(ptr %1) #5
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @il_rtedge_apply_instruction_spec(ptr noundef readonly captures(none) %0) unnamed_addr #3 {
  %2 = alloca [112 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #5
  %3 = load i8, ptr %0, align 1
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %16, label %5

5:                                                ; preds = %1, %5
  %6 = phi i32 [ %13, %5 ], [ 1, %1 ]
  %7 = phi i8 [ %11, %5 ], [ %3, %1 ]
  %8 = phi i32 [ %6, %5 ], [ 0, %1 ]
  %9 = getelementptr inbounds nuw i8, ptr %2, i32 %8
  store i8 %7, ptr %9, align 1
  %10 = getelementptr inbounds nuw i8, ptr %0, i32 %6
  %11 = load i8, ptr %10, align 1
  %12 = icmp ne i8 %11, 0
  %13 = add nuw nsw i32 %6, 1
  %14 = icmp samesign ult i32 %6, 111
  %15 = and i1 %12, %14
  br i1 %15, label %5, label %16, !llvm.loop !9

16:                                               ; preds = %5, %1
  %17 = phi i32 [ 0, %1 ], [ %6, %5 ]
  %18 = getelementptr inbounds nuw i8, ptr %2, i32 %17
  store i8 0, ptr %18, align 1
  %19 = call zeroext i8 @Rtedge_TagCreateByInstruction(ptr noundef nonnull %2, i8 noundef zeroext 0) #5
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #5
  ret void
}

declare dso_local void @scan_slots_init() local_unnamed_addr #4

declare dso_local void @IlRtedgeSlots_BindEgEntry() local_unnamed_addr #4

declare dso_local zeroext i8 @Rtedge_TagCreateByInstruction(ptr noundef, i8 noundef zeroext) local_unnamed_addr #4

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { noinline nounwind optnone "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noinline nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "examples\\bit\\rtedge_tags.c", directory: "D:\\work\\rtacc")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
