; ModuleID = 'il_rtedge_slots_bind.c'
source_filename = "il_rtedge_slots_bind.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$"??_C@_05HKHPEFOF@Entry?$AA@" = comdat any

@"??_C@_05HKHPEFOF@Entry?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"Entry\00", comdat, align 1

; Function Attrs: nounwind
define dso_local void @IlRtedge_BindTonPinSlot(ptr noundef writeonly captures(address_is_null) %0, ptr noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = alloca ptr, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #4
  store ptr null, ptr %4, align 4
  %5 = icmp eq ptr %0, null
  %6 = icmp eq ptr %1, null
  %7 = or i1 %5, %6
  br i1 %7, label %34, label %8

8:                                                ; preds = %3
  %9 = call i32 @EgTagGetProperty(ptr noundef %1, ptr noundef nonnull @"??_C@_05HKHPEFOF@Entry?$AA@", ptr noundef nonnull %4, i32 noundef 4) #4
  %10 = icmp ne i32 %9, 0
  %11 = load ptr, ptr %4, align 4
  %12 = icmp eq ptr %11, null
  %13 = select i1 %10, i1 true, i1 %12
  br i1 %13, label %34, label %14

14:                                               ; preds = %8
  %15 = getelementptr inbounds nuw i8, ptr %11, i32 3
  %16 = load i16, ptr %15, align 1
  %17 = icmp eq i16 %16, 13
  br i1 %17, label %22, label %18

18:                                               ; preds = %14
  %19 = getelementptr inbounds nuw i8, ptr %11, i32 385
  %20 = load i32, ptr %19, align 1
  %21 = icmp eq i32 %20, 1
  br i1 %21, label %22, label %27

22:                                               ; preds = %18, %14
  %23 = getelementptr inbounds nuw i8, ptr %11, i32 23
  %24 = load i64, ptr %23, align 1
  %25 = trunc i64 %24 to i32
  %26 = inttoptr i32 %25 to ptr
  br label %29

27:                                               ; preds = %18
  %28 = getelementptr inbounds nuw i8, ptr %11, i32 15
  br label %29

29:                                               ; preds = %22, %27
  %30 = phi ptr [ %26, %22 ], [ %28, %27 ]
  %31 = icmp eq ptr %30, null
  br i1 %31, label %34, label %32

32:                                               ; preds = %29
  %33 = getelementptr inbounds nuw i8, ptr %30, i32 %2
  store ptr %33, ptr %0, align 4
  br label %34

34:                                               ; preds = %29, %8, %3, %32
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

declare dllimport i32 @EgTagGetProperty(ptr noundef, ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local void @IlRtedgeSlots_BindEgEntry() local_unnamed_addr #3 {
  ret void
}

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "il_rtedge_slots_bind.c", directory: "D:\\work\\rtacc\\examples\\hugeplc")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
