; ModuleID = 'out\inc_rtedge_glue.c'
source_filename = "out\\inc_rtedge_glue.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$"??_C@_05HKHPEFOF@Entry?$AA@" = comdat any

$"??_C@_03ONLIJOLC@MOI?$AA@" = comdat any

@"??_C@_05HKHPEFOF@Entry?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"Entry\00", comdat, align 1
@"??_C@_03ONLIJOLC@MOI?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"MOI\00", comdat, align 1
@il_slot_MOI = external dso_local local_unnamed_addr global ptr, align 4

; Function Attrs: nounwind
define dso_local void @IlRtedgeSlots_BindEgEntry() local_unnamed_addr #0 {
  %1 = alloca ptr, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #3
  store ptr null, ptr %1, align 4
  %2 = call i32 @EgTagGetProperty(ptr noundef nonnull @"??_C@_03ONLIJOLC@MOI?$AA@", ptr noundef nonnull @"??_C@_05HKHPEFOF@Entry?$AA@", ptr noundef nonnull %1, i32 noundef 4) #3
  %3 = icmp ne i32 %2, 0
  %4 = load ptr, ptr %1, align 4
  %5 = icmp eq ptr %4, null
  %6 = select i1 %3, i1 true, i1 %5
  br i1 %6, label %24, label %7

7:                                                ; preds = %0
  %8 = getelementptr inbounds nuw i8, ptr %4, i32 3
  %9 = load i16, ptr %8, align 1
  %10 = icmp eq i16 %9, 13
  br i1 %10, label %15, label %11

11:                                               ; preds = %7
  %12 = getelementptr inbounds nuw i8, ptr %4, i32 385
  %13 = load i32, ptr %12, align 1
  %14 = icmp eq i32 %13, 1
  br i1 %14, label %15, label %20

15:                                               ; preds = %11, %7
  %16 = getelementptr inbounds nuw i8, ptr %4, i32 23
  %17 = load i64, ptr %16, align 1
  %18 = trunc i64 %17 to i32
  %19 = inttoptr i32 %18 to ptr
  br label %22

20:                                               ; preds = %11
  %21 = getelementptr inbounds nuw i8, ptr %4, i32 15
  br label %22

22:                                               ; preds = %15, %20
  %23 = phi ptr [ %19, %15 ], [ %21, %20 ]
  store ptr %23, ptr @il_slot_MOI, align 4
  br label %24

24:                                               ; preds = %0, %22
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

declare dllimport i32 @EgTagGetProperty(ptr noundef, ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: nounwind
define dso_local void @IlRtedgeTags_Init() local_unnamed_addr #0 {
  %1 = alloca ptr, align 4
  tail call void @inc_slots_init() #3
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #3
  store ptr null, ptr %1, align 4
  %2 = call i32 @EgTagGetProperty(ptr noundef nonnull @"??_C@_03ONLIJOLC@MOI?$AA@", ptr noundef nonnull @"??_C@_05HKHPEFOF@Entry?$AA@", ptr noundef nonnull %1, i32 noundef 4) #3
  %3 = icmp ne i32 %2, 0
  %4 = load ptr, ptr %1, align 4
  %5 = icmp eq ptr %4, null
  %6 = select i1 %3, i1 true, i1 %5
  br i1 %6, label %24, label %7

7:                                                ; preds = %0
  %8 = getelementptr inbounds nuw i8, ptr %4, i32 3
  %9 = load i16, ptr %8, align 1
  %10 = icmp eq i16 %9, 13
  br i1 %10, label %15, label %11

11:                                               ; preds = %7
  %12 = getelementptr inbounds nuw i8, ptr %4, i32 385
  %13 = load i32, ptr %12, align 1
  %14 = icmp eq i32 %13, 1
  br i1 %14, label %15, label %20

15:                                               ; preds = %11, %7
  %16 = getelementptr inbounds nuw i8, ptr %4, i32 23
  %17 = load i64, ptr %16, align 1
  %18 = trunc i64 %17 to i32
  %19 = inttoptr i32 %18 to ptr
  br label %22

20:                                               ; preds = %11
  %21 = getelementptr inbounds nuw i8, ptr %4, i32 15
  br label %22

22:                                               ; preds = %20, %15
  %23 = phi ptr [ %19, %15 ], [ %21, %20 ]
  store ptr %23, ptr @il_slot_MOI, align 4
  br label %24

24:                                               ; preds = %0, %22
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #3
  ret void
}

declare dso_local void @inc_slots_init() local_unnamed_addr #2

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "out\\inc_rtedge_glue.c", directory: "D:\\work\\rtacc\\examples2\\etag")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
