; ModuleID = 'il_rtedge_slots_bind.c'
source_filename = "il_rtedge_slots_bind.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.anon = type { ptr, ptr }

$"??_C@_05HKHPEFOF@Entry?$AA@" = comdat any

$"??_C@_03KIKNLPCI@SW1?$AA@" = comdat any

$"??_C@_03IDIAOMOL@SW2?$AA@" = comdat any

$"??_C@_03JKJLNNKK@SW3?$AA@" = comdat any

$"??_C@_06INNMFNMA@MsTick?$AA@" = comdat any

$"??_C@_04LJNKDHAL@LED1?$AA@" = comdat any

$"??_C@_04JCPHGEMI@LED2?$AA@" = comdat any

@il_slot_binds = internal unnamed_addr constant [6 x %struct.anon] [%struct.anon { ptr @"??_C@_03KIKNLPCI@SW1?$AA@", ptr @il_slot_SW1 }, %struct.anon { ptr @"??_C@_03IDIAOMOL@SW2?$AA@", ptr @il_slot_SW2 }, %struct.anon { ptr @"??_C@_03JKJLNNKK@SW3?$AA@", ptr @il_slot_SW3 }, %struct.anon { ptr @"??_C@_06INNMFNMA@MsTick?$AA@", ptr @il_slot_MsTick }, %struct.anon { ptr @"??_C@_04LJNKDHAL@LED1?$AA@", ptr @il_slot_LED1 }, %struct.anon { ptr @"??_C@_04JCPHGEMI@LED2?$AA@", ptr @il_slot_LED2 }], align 4
@"??_C@_05HKHPEFOF@Entry?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"Entry\00", comdat, align 1
@"??_C@_03KIKNLPCI@SW1?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"SW1\00", comdat, align 1
@il_slot_SW1 = external dso_local global ptr, align 4
@"??_C@_03IDIAOMOL@SW2?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"SW2\00", comdat, align 1
@il_slot_SW2 = external dso_local global ptr, align 4
@"??_C@_03JKJLNNKK@SW3?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"SW3\00", comdat, align 1
@il_slot_SW3 = external dso_local global ptr, align 4
@"??_C@_06INNMFNMA@MsTick?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"MsTick\00", comdat, align 1
@il_slot_MsTick = external dso_local global ptr, align 4
@"??_C@_04LJNKDHAL@LED1?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"LED1\00", comdat, align 1
@il_slot_LED1 = external dso_local global ptr, align 4
@"??_C@_04JCPHGEMI@LED2?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"LED2\00", comdat, align 1
@il_slot_LED2 = external dso_local global ptr, align 4

; Function Attrs: nounwind
define dso_local void @IlRtedgeSlots_BindEgEntry() local_unnamed_addr #0 {
  %1 = alloca ptr, align 4
  br label %2

2:                                                ; preds = %0, %30
  %3 = phi i32 [ 0, %0 ], [ %31, %30 ]
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #3
  store ptr null, ptr %1, align 4
  %4 = getelementptr inbounds nuw %struct.anon, ptr @il_slot_binds, i32 %3
  %5 = load ptr, ptr %4, align 4
  %6 = call i32 @EgTagGetProperty(ptr noundef %5, ptr noundef nonnull @"??_C@_05HKHPEFOF@Entry?$AA@", ptr noundef nonnull %1, i32 noundef 4) #3
  %7 = icmp ne i32 %6, 0
  %8 = load ptr, ptr %1, align 4
  %9 = icmp eq ptr %8, null
  %10 = select i1 %7, i1 true, i1 %9
  br i1 %10, label %30, label %11

11:                                               ; preds = %2
  %12 = getelementptr inbounds nuw i8, ptr %8, i32 3
  %13 = load i16, ptr %12, align 1
  %14 = icmp eq i16 %13, 13
  br i1 %14, label %19, label %15

15:                                               ; preds = %11
  %16 = getelementptr inbounds nuw i8, ptr %8, i32 385
  %17 = load i32, ptr %16, align 1
  %18 = icmp eq i32 %17, 1
  br i1 %18, label %19, label %24

19:                                               ; preds = %15, %11
  %20 = getelementptr inbounds nuw i8, ptr %8, i32 23
  %21 = load i64, ptr %20, align 1
  %22 = trunc i64 %21 to i32
  %23 = inttoptr i32 %22 to ptr
  br label %26

24:                                               ; preds = %15
  %25 = getelementptr inbounds nuw i8, ptr %8, i32 15
  br label %26

26:                                               ; preds = %19, %24
  %27 = phi ptr [ %23, %19 ], [ %25, %24 ]
  %28 = getelementptr inbounds nuw i8, ptr %4, i32 4
  %29 = load ptr, ptr %28, align 4
  store ptr %27, ptr %29, align 4
  br label %30

30:                                               ; preds = %2, %26
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #3
  %31 = add nuw nsw i32 %3, 1
  %32 = icmp eq i32 %31, 6
  br i1 %32, label %33, label %2, !llvm.loop !7

33:                                               ; preds = %30
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

declare dllimport i32 @EgTagGetProperty(ptr noundef, ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "il_rtedge_slots_bind.c", directory: "D:\\work\\rtacc\\examples\\ST2")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
