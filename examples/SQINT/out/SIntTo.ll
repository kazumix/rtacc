; ModuleID = '..\PLCPIEC\SIntTo.c'
source_filename = "..\\PLCPIEC\\SIntTo.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SINT_TO_B_BCD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 16, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i8, ptr %6, align 1
  %8 = icmp ugt i8 %7, 99
  br i1 %8, label %14, label %9

9:                                                ; preds = %4
  %10 = udiv i8 %7, 10
  %11 = shl nuw i8 %10, 4
  %12 = urem i8 %7, 10
  %13 = or disjoint i8 %11, %12
  br label %14

14:                                               ; preds = %4, %9
  %15 = phi i8 [ %13, %9 ], [ -1, %4 ]
  store i8 %15, ptr %6, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SINT_TO_BOOL(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i8, ptr %6, align 1
  %8 = icmp ne i8 %7, 0
  %9 = zext i1 %8 to i8
  store i8 %9, ptr %6, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local dllexport noundef ptr @SINT_TO_BYTE(ptr noundef returned writeonly captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #1 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 16, ptr %5, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SINT_TO_D_BCD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 18, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i8, ptr %6, align 1
  %8 = freeze i8 %7
  %9 = icmp slt i8 %8, 0
  br i1 %9, label %23, label %10

10:                                               ; preds = %4
  %11 = zext nneg i8 %8 to i32
  %12 = icmp samesign ugt i8 %8, 99
  %13 = select i1 %12, i32 256, i32 0
  %14 = add nsw i32 %11, -100
  %15 = icmp samesign ult i8 %8, 100
  %16 = select i1 %15, i32 %11, i32 %14
  %17 = udiv i32 %16, 10
  %18 = shl nuw nsw i32 %17, 4
  %19 = urem i8 %8, 10
  %20 = zext nneg i8 %19 to i32
  %21 = add nuw nsw i32 %18, %13
  %22 = or disjoint i32 %21, %20
  br label %23

23:                                               ; preds = %4, %10
  %24 = phi i32 [ %22, %10 ], [ -1, %4 ]
  store i32 %24, ptr %6, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SINT_TO_DINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 262, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i8, ptr %6, align 1
  %8 = sext i8 %7 to i32
  store i32 %8, ptr %6, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SINT_TO_DWORD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i8, ptr %5, align 1
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 18, ptr %7, align 1
  %8 = zext i8 %6 to i32
  store i32 %8, ptr %5, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SINT_TO_INT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 261, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i8, ptr %6, align 1
  %8 = sext i8 %7 to i16
  store i16 %8, ptr %6, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SINT_TO_LINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 263, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i8, ptr %6, align 1
  %8 = sext i8 %7 to i64
  store i64 %8, ptr %6, align 8
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SINT_TO_LREAL(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 783, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i8, ptr %6, align 1
  %8 = sitofp i8 %7 to double
  store double %8, ptr %6, align 8
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SINT_TO_REAL(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 782, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i8, ptr %6, align 1
  %8 = sitofp i8 %7 to float
  store float %8, ptr %6, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SINT_TO_UDINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i8, ptr %5, align 1
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 514, ptr %7, align 1
  %8 = zext i8 %6 to i32
  store i32 %8, ptr %5, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SINT_TO_UINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i8, ptr %5, align 1
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 513, ptr %7, align 1
  %8 = zext i8 %6 to i16
  store i16 %8, ptr %5, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local dllexport noundef ptr @SINT_TO_USINT(ptr noundef returned writeonly captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #1 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 512, ptr %5, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SINT_TO_W_BCD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 17, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i8, ptr %6, align 1
  %8 = freeze i8 %7
  %9 = icmp slt i8 %8, 0
  br i1 %9, label %23, label %10

10:                                               ; preds = %4
  %11 = zext nneg i8 %8 to i16
  %12 = icmp samesign ugt i8 %8, 99
  %13 = select i1 %12, i16 256, i16 0
  %14 = add nsw i16 %11, -100
  %15 = icmp samesign ult i8 %8, 100
  %16 = select i1 %15, i16 %11, i16 %14
  %17 = udiv i16 %16, 10
  %18 = shl nuw nsw i16 %17, 4
  %19 = urem i8 %8, 10
  %20 = zext nneg i8 %19 to i16
  %21 = add nuw nsw i16 %18, %13
  %22 = or disjoint i16 %21, %20
  br label %23

23:                                               ; preds = %4, %10
  %24 = phi i16 [ %22, %10 ], [ -1, %4 ]
  store i16 %24, ptr %6, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @SINT_TO_WORD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i8, ptr %5, align 1
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 17, ptr %7, align 1
  %8 = zext i8 %6 to i16
  store i16 %8, ptr %5, align 2
  ret ptr %0
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCPIEC\\SIntTo.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
