; ModuleID = 'd:\work\rtacc\examples\ex\il_rtedge_slots_bind.c'
source_filename = "d:\\work\\rtacc\\examples\\ex\\il_rtedge_slots_bind.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$"??_C@_05HKHPEFOF@Entry?$AA@" = comdat any

$"??_C@_03KIKNLPCI@SW1?$AA@" = comdat any

$"??_C@_03IDIAOMOL@SW2?$AA@" = comdat any

$"??_C@_03BGIBLBOG@ANS?$AA@" = comdat any

@"??_C@_05HKHPEFOF@Entry?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"Entry\00", comdat, align 1
@"??_C@_03KIKNLPCI@SW1?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"SW1\00", comdat, align 1
@il_slot_SW1 = external dso_local local_unnamed_addr global ptr, align 4
@"??_C@_03IDIAOMOL@SW2?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"SW2\00", comdat, align 1
@il_slot_SW2 = external dso_local local_unnamed_addr global ptr, align 4
@"??_C@_03BGIBLBOG@ANS?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"ANS\00", comdat, align 1
@il_slot_ANS = external dso_local local_unnamed_addr global ptr, align 4

; Function Attrs: nounwind
define dso_local void @IlRtedgeSlots_BindEgEntry() local_unnamed_addr #0 {
  %1 = alloca ptr, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #3
  store ptr null, ptr %1, align 4
  %2 = call i32 @EgTagGetProperty(ptr noundef nonnull @"??_C@_03KIKNLPCI@SW1?$AA@", ptr noundef nonnull @"??_C@_05HKHPEFOF@Entry?$AA@", ptr noundef nonnull %1, i32 noundef 4) #3
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
  store ptr %23, ptr @il_slot_SW1, align 4
  br label %24

24:                                               ; preds = %0, %22
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #3
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #3
  store ptr null, ptr %1, align 4
  %25 = call i32 @EgTagGetProperty(ptr noundef nonnull @"??_C@_03IDIAOMOL@SW2?$AA@", ptr noundef nonnull @"??_C@_05HKHPEFOF@Entry?$AA@", ptr noundef nonnull %1, i32 noundef 4) #3
  %26 = icmp ne i32 %25, 0
  %27 = load ptr, ptr %1, align 4
  %28 = icmp eq ptr %27, null
  %29 = select i1 %26, i1 true, i1 %28
  br i1 %29, label %47, label %30

30:                                               ; preds = %24
  %31 = getelementptr inbounds nuw i8, ptr %27, i32 3
  %32 = load i16, ptr %31, align 1
  %33 = icmp eq i16 %32, 13
  br i1 %33, label %40, label %34

34:                                               ; preds = %30
  %35 = getelementptr inbounds nuw i8, ptr %27, i32 385
  %36 = load i32, ptr %35, align 1
  %37 = icmp eq i32 %36, 1
  br i1 %37, label %40, label %38

38:                                               ; preds = %34
  %39 = getelementptr inbounds nuw i8, ptr %27, i32 15
  br label %45

40:                                               ; preds = %34, %30
  %41 = getelementptr inbounds nuw i8, ptr %27, i32 23
  %42 = load i64, ptr %41, align 1
  %43 = trunc i64 %42 to i32
  %44 = inttoptr i32 %43 to ptr
  br label %45

45:                                               ; preds = %40, %38
  %46 = phi ptr [ %44, %40 ], [ %39, %38 ]
  store ptr %46, ptr @il_slot_SW2, align 4
  br label %47

47:                                               ; preds = %45, %24
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #3
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #3
  store ptr null, ptr %1, align 4
  %48 = call i32 @EgTagGetProperty(ptr noundef nonnull @"??_C@_03BGIBLBOG@ANS?$AA@", ptr noundef nonnull @"??_C@_05HKHPEFOF@Entry?$AA@", ptr noundef nonnull %1, i32 noundef 4) #3
  %49 = icmp ne i32 %48, 0
  %50 = load ptr, ptr %1, align 4
  %51 = icmp eq ptr %50, null
  %52 = select i1 %49, i1 true, i1 %51
  br i1 %52, label %70, label %53

53:                                               ; preds = %47
  %54 = getelementptr inbounds nuw i8, ptr %50, i32 3
  %55 = load i16, ptr %54, align 1
  %56 = icmp eq i16 %55, 13
  br i1 %56, label %63, label %57

57:                                               ; preds = %53
  %58 = getelementptr inbounds nuw i8, ptr %50, i32 385
  %59 = load i32, ptr %58, align 1
  %60 = icmp eq i32 %59, 1
  br i1 %60, label %63, label %61

61:                                               ; preds = %57
  %62 = getelementptr inbounds nuw i8, ptr %50, i32 15
  br label %68

63:                                               ; preds = %57, %53
  %64 = getelementptr inbounds nuw i8, ptr %50, i32 23
  %65 = load i64, ptr %64, align 1
  %66 = trunc i64 %65 to i32
  %67 = inttoptr i32 %66 to ptr
  br label %68

68:                                               ; preds = %63, %61
  %69 = phi ptr [ %67, %63 ], [ %62, %61 ]
  store ptr %69, ptr @il_slot_ANS, align 4
  br label %70

70:                                               ; preds = %68, %47
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #3
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
!1 = !DIFile(filename: "d:\\work\\rtacc\\examples\\ex\\il_rtedge_slots_bind.c", directory: "D:\\work\\rtacc\\examples\\ex")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
