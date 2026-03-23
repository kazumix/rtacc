; ModuleID = '..\PLCPIEC\BitMask.c'
source_filename = "..\\PLCPIEC\\BitMask.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @MaskBitfield(ptr noundef captures(none) %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 12
  %3 = load i8, ptr %2, align 1
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %37, label %5

5:                                                ; preds = %1
  %6 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %7 = load i16, ptr %6, align 1
  switch i16 %7, label %37 [
    i16 16, label %8
    i16 17, label %18
    i16 18, label %28
  ]

8:                                                ; preds = %5
  %9 = load ptr, ptr %0, align 1
  %10 = load i8, ptr %9, align 1
  %11 = zext i8 %10 to i32
  %12 = getelementptr inbounds nuw i8, ptr %0, i32 13
  %13 = load i8, ptr %12, align 1
  %14 = zext nneg i8 %13 to i32
  %15 = lshr i32 %11, %14
  %16 = trunc nuw i32 %15 to i8
  %17 = and i8 %16, 1
  store i8 %17, ptr %0, align 1
  br label %36

18:                                               ; preds = %5
  %19 = load ptr, ptr %0, align 1
  %20 = load i16, ptr %19, align 2
  %21 = zext i16 %20 to i32
  %22 = getelementptr inbounds nuw i8, ptr %0, i32 13
  %23 = load i8, ptr %22, align 1
  %24 = zext nneg i8 %23 to i32
  %25 = lshr i32 %21, %24
  %26 = trunc nuw i32 %25 to i16
  %27 = and i16 %26, 1
  store i16 %27, ptr %0, align 2
  br label %36

28:                                               ; preds = %5
  %29 = load ptr, ptr %0, align 1
  %30 = load i32, ptr %29, align 4
  %31 = getelementptr inbounds nuw i8, ptr %0, i32 13
  %32 = load i8, ptr %31, align 1
  %33 = zext nneg i8 %32 to i32
  %34 = lshr i32 %30, %33
  %35 = and i32 %34, 1
  store i32 %35, ptr %0, align 4
  br label %36

36:                                               ; preds = %28, %18, %8
  store i16 1536, ptr %6, align 1
  br label %37

37:                                               ; preds = %36, %5, %1
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCPIEC\\BitMask.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
