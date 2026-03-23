; ModuleID = '..\PLCPIEC\LogicOpe.c'
source_filename = "..\\PLCPIEC\\LogicOpe.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @AND_BOOL(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i8, ptr %5, align 1
  %7 = load ptr, ptr %1, align 1
  %8 = load i8, ptr %7, align 1
  %9 = and i8 %8, %6
  store i8 %9, ptr %5, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @AND_BYTE(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i8, ptr %5, align 1
  %7 = load ptr, ptr %1, align 1
  %8 = load i8, ptr %7, align 1
  %9 = and i8 %8, %6
  store i8 %9, ptr %5, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @AND_WORD(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i16, ptr %5, align 2
  %7 = load ptr, ptr %1, align 1
  %8 = load i16, ptr %7, align 2
  %9 = and i16 %8, %6
  store i16 %9, ptr %5, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @AND_DWORD(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i32, ptr %5, align 4
  %7 = load ptr, ptr %1, align 1
  %8 = load i32, ptr %7, align 4
  %9 = and i32 %8, %6
  store i32 %9, ptr %5, align 4
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @AND(ptr noundef returned %0, ptr noundef %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #1 {
  tail call void @MaskBitfield(ptr noundef %0) #3
  tail call void @MaskBitfield(ptr noundef %1) #3
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %31 [
    i16 1536, label %7
    i16 260, label %13
    i16 512, label %13
    i16 16, label %13
    i16 261, label %19
    i16 513, label %19
    i16 17, label %19
    i16 262, label %25
    i16 514, label %25
    i16 18, label %25
  ]

7:                                                ; preds = %4
  %8 = load ptr, ptr %0, align 1
  %9 = load i8, ptr %8, align 1
  %10 = load ptr, ptr %1, align 1
  %11 = load i8, ptr %10, align 1
  %12 = and i8 %11, %9
  store i8 %12, ptr %8, align 1
  br label %31

13:                                               ; preds = %4, %4, %4
  %14 = load ptr, ptr %0, align 1
  %15 = load i8, ptr %14, align 1
  %16 = load ptr, ptr %1, align 1
  %17 = load i8, ptr %16, align 1
  %18 = and i8 %17, %15
  store i8 %18, ptr %14, align 1
  br label %31

19:                                               ; preds = %4, %4, %4
  %20 = load ptr, ptr %0, align 1
  %21 = load i16, ptr %20, align 2
  %22 = load ptr, ptr %1, align 1
  %23 = load i16, ptr %22, align 2
  %24 = and i16 %23, %21
  store i16 %24, ptr %20, align 2
  br label %31

25:                                               ; preds = %4, %4, %4
  %26 = load ptr, ptr %0, align 1
  %27 = load i32, ptr %26, align 4
  %28 = load ptr, ptr %1, align 1
  %29 = load i32, ptr %28, align 4
  %30 = and i32 %29, %27
  store i32 %30, ptr %26, align 4
  br label %31

31:                                               ; preds = %4, %25, %19, %13, %7
  ret ptr %0
}

declare dso_local void @MaskBitfield(ptr noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @NOT_BOOL(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i8, ptr %5, align 1
  %7 = and i8 %6, 1
  %8 = xor i8 %7, 1
  store i8 %8, ptr %5, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @NOT_BYTE(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i8, ptr %5, align 1
  %7 = xor i8 %6, -1
  store i8 %7, ptr %5, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @NOT_WORD(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i16, ptr %5, align 2
  %7 = xor i16 %6, -1
  store i16 %7, ptr %5, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @NOT_DWORD(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i32, ptr %5, align 4
  %7 = xor i32 %6, -1
  store i32 %7, ptr %5, align 4
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @NOT(ptr noundef returned %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #1 {
  tail call void @MaskBitfield(ptr noundef %0) #3
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %24 [
    i16 1536, label %7
    i16 260, label %12
    i16 512, label %12
    i16 16, label %12
    i16 261, label %16
    i16 513, label %16
    i16 17, label %16
    i16 262, label %20
    i16 514, label %20
    i16 18, label %20
  ]

7:                                                ; preds = %4
  %8 = load ptr, ptr %0, align 1
  %9 = load i8, ptr %8, align 1
  %10 = and i8 %9, 1
  %11 = xor i8 %10, 1
  store i8 %11, ptr %8, align 1
  br label %24

12:                                               ; preds = %4, %4, %4
  %13 = load ptr, ptr %0, align 1
  %14 = load i8, ptr %13, align 1
  %15 = xor i8 %14, -1
  store i8 %15, ptr %13, align 1
  br label %24

16:                                               ; preds = %4, %4, %4
  %17 = load ptr, ptr %0, align 1
  %18 = load i16, ptr %17, align 2
  %19 = xor i16 %18, -1
  store i16 %19, ptr %17, align 2
  br label %24

20:                                               ; preds = %4, %4, %4
  %21 = load ptr, ptr %0, align 1
  %22 = load i32, ptr %21, align 4
  %23 = xor i32 %22, -1
  store i32 %23, ptr %21, align 4
  br label %24

24:                                               ; preds = %4, %20, %16, %12, %7
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @OR_BOOL(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i8, ptr %5, align 1
  %7 = load ptr, ptr %1, align 1
  %8 = load i8, ptr %7, align 1
  %9 = or i8 %8, %6
  store i8 %9, ptr %5, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @OR_BYTE(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i8, ptr %5, align 1
  %7 = load ptr, ptr %1, align 1
  %8 = load i8, ptr %7, align 1
  %9 = or i8 %8, %6
  store i8 %9, ptr %5, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @OR_WORD(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i16, ptr %5, align 2
  %7 = load ptr, ptr %1, align 1
  %8 = load i16, ptr %7, align 2
  %9 = or i16 %8, %6
  store i16 %9, ptr %5, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @OR_DWORD(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i32, ptr %5, align 4
  %7 = load ptr, ptr %1, align 1
  %8 = load i32, ptr %7, align 4
  %9 = or i32 %8, %6
  store i32 %9, ptr %5, align 4
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @OR(ptr noundef returned %0, ptr noundef %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #1 {
  tail call void @MaskBitfield(ptr noundef %0) #3
  tail call void @MaskBitfield(ptr noundef %1) #3
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %31 [
    i16 1536, label %7
    i16 260, label %13
    i16 512, label %13
    i16 16, label %13
    i16 261, label %19
    i16 513, label %19
    i16 17, label %19
    i16 262, label %25
    i16 514, label %25
    i16 18, label %25
  ]

7:                                                ; preds = %4
  %8 = load ptr, ptr %0, align 1
  %9 = load i8, ptr %8, align 1
  %10 = load ptr, ptr %1, align 1
  %11 = load i8, ptr %10, align 1
  %12 = or i8 %11, %9
  store i8 %12, ptr %8, align 1
  br label %31

13:                                               ; preds = %4, %4, %4
  %14 = load ptr, ptr %0, align 1
  %15 = load i8, ptr %14, align 1
  %16 = load ptr, ptr %1, align 1
  %17 = load i8, ptr %16, align 1
  %18 = or i8 %17, %15
  store i8 %18, ptr %14, align 1
  br label %31

19:                                               ; preds = %4, %4, %4
  %20 = load ptr, ptr %0, align 1
  %21 = load i16, ptr %20, align 2
  %22 = load ptr, ptr %1, align 1
  %23 = load i16, ptr %22, align 2
  %24 = or i16 %23, %21
  store i16 %24, ptr %20, align 2
  br label %31

25:                                               ; preds = %4, %4, %4
  %26 = load ptr, ptr %0, align 1
  %27 = load i32, ptr %26, align 4
  %28 = load ptr, ptr %1, align 1
  %29 = load i32, ptr %28, align 4
  %30 = or i32 %29, %27
  store i32 %30, ptr %26, align 4
  br label %31

31:                                               ; preds = %4, %25, %19, %13, %7
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @XOR_BOOL(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i8, ptr %5, align 1
  %7 = load ptr, ptr %1, align 1
  %8 = load i8, ptr %7, align 1
  %9 = xor i8 %8, %6
  store i8 %9, ptr %5, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @XOR_BYTE(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i8, ptr %5, align 1
  %7 = load ptr, ptr %1, align 1
  %8 = load i8, ptr %7, align 1
  %9 = xor i8 %8, %6
  store i8 %9, ptr %5, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @XOR_WORD(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i16, ptr %5, align 2
  %7 = load ptr, ptr %1, align 1
  %8 = load i16, ptr %7, align 2
  %9 = xor i16 %8, %6
  store i16 %9, ptr %5, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @XOR_DWORD(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i32, ptr %5, align 4
  %7 = load ptr, ptr %1, align 1
  %8 = load i32, ptr %7, align 4
  %9 = xor i32 %8, %6
  store i32 %9, ptr %5, align 4
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @XOR(ptr noundef returned %0, ptr noundef %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #1 {
  tail call void @MaskBitfield(ptr noundef %0) #3
  tail call void @MaskBitfield(ptr noundef %1) #3
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %31 [
    i16 1536, label %7
    i16 260, label %13
    i16 512, label %13
    i16 16, label %13
    i16 261, label %19
    i16 513, label %19
    i16 17, label %19
    i16 262, label %25
    i16 514, label %25
    i16 18, label %25
  ]

7:                                                ; preds = %4
  %8 = load ptr, ptr %0, align 1
  %9 = load i8, ptr %8, align 1
  %10 = load ptr, ptr %1, align 1
  %11 = load i8, ptr %10, align 1
  %12 = xor i8 %11, %9
  store i8 %12, ptr %8, align 1
  br label %31

13:                                               ; preds = %4, %4, %4
  %14 = load ptr, ptr %0, align 1
  %15 = load i8, ptr %14, align 1
  %16 = load ptr, ptr %1, align 1
  %17 = load i8, ptr %16, align 1
  %18 = xor i8 %17, %15
  store i8 %18, ptr %14, align 1
  br label %31

19:                                               ; preds = %4, %4, %4
  %20 = load ptr, ptr %0, align 1
  %21 = load i16, ptr %20, align 2
  %22 = load ptr, ptr %1, align 1
  %23 = load i16, ptr %22, align 2
  %24 = xor i16 %23, %21
  store i16 %24, ptr %20, align 2
  br label %31

25:                                               ; preds = %4, %4, %4
  %26 = load ptr, ptr %0, align 1
  %27 = load i32, ptr %26, align 4
  %28 = load ptr, ptr %1, align 1
  %29 = load i32, ptr %28, align 4
  %30 = xor i32 %29, %27
  store i32 %30, ptr %26, align 4
  br label %31

31:                                               ; preds = %4, %25, %19, %13, %7
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @ANDN_BOOL(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i8, ptr %5, align 1
  %7 = load ptr, ptr %0, align 1
  %8 = load i8, ptr %7, align 1
  %9 = and i8 %6, 1
  %10 = xor i8 %9, 1
  %11 = and i8 %10, %8
  store i8 %11, ptr %7, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @ANDN_BYTE(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i8, ptr %5, align 1
  %7 = xor i8 %6, -1
  %8 = load ptr, ptr %0, align 1
  %9 = load i8, ptr %8, align 1
  %10 = and i8 %9, %7
  store i8 %10, ptr %8, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @ANDN_WORD(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i16, ptr %5, align 2
  %7 = xor i16 %6, -1
  %8 = load ptr, ptr %0, align 1
  %9 = load i16, ptr %8, align 2
  %10 = and i16 %9, %7
  store i16 %10, ptr %8, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @ANDN_DWORD(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i32, ptr %5, align 4
  %7 = xor i32 %6, -1
  %8 = load ptr, ptr %0, align 1
  %9 = load i32, ptr %8, align 4
  %10 = and i32 %9, %7
  store i32 %10, ptr %8, align 4
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @ANDN(ptr noundef returned %0, ptr noundef %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #1 {
  tail call void @MaskBitfield(ptr noundef %0) #3
  tail call void @MaskBitfield(ptr noundef %1) #3
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %36 [
    i16 1536, label %7
    i16 260, label %15
    i16 512, label %15
    i16 16, label %15
    i16 261, label %22
    i16 513, label %22
    i16 17, label %22
    i16 262, label %29
    i16 514, label %29
    i16 18, label %29
  ]

7:                                                ; preds = %4
  %8 = load ptr, ptr %1, align 1
  %9 = load i8, ptr %8, align 1
  %10 = load ptr, ptr %0, align 1
  %11 = load i8, ptr %10, align 1
  %12 = and i8 %9, 1
  %13 = xor i8 %12, 1
  %14 = and i8 %13, %11
  store i8 %14, ptr %10, align 1
  br label %36

15:                                               ; preds = %4, %4, %4
  %16 = load ptr, ptr %1, align 1
  %17 = load i8, ptr %16, align 1
  %18 = xor i8 %17, -1
  %19 = load ptr, ptr %0, align 1
  %20 = load i8, ptr %19, align 1
  %21 = and i8 %20, %18
  store i8 %21, ptr %19, align 1
  br label %36

22:                                               ; preds = %4, %4, %4
  %23 = load ptr, ptr %1, align 1
  %24 = load i16, ptr %23, align 2
  %25 = xor i16 %24, -1
  %26 = load ptr, ptr %0, align 1
  %27 = load i16, ptr %26, align 2
  %28 = and i16 %27, %25
  store i16 %28, ptr %26, align 2
  br label %36

29:                                               ; preds = %4, %4, %4
  %30 = load ptr, ptr %1, align 1
  %31 = load i32, ptr %30, align 4
  %32 = xor i32 %31, -1
  %33 = load ptr, ptr %0, align 1
  %34 = load i32, ptr %33, align 4
  %35 = and i32 %34, %32
  store i32 %35, ptr %33, align 4
  br label %36

36:                                               ; preds = %4, %29, %22, %15, %7
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @ORN_BOOL(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i8, ptr %5, align 1
  %7 = xor i8 %6, -1
  %8 = load ptr, ptr %0, align 1
  %9 = load i8, ptr %8, align 1
  %10 = or i8 %9, %7
  %11 = and i8 %10, 1
  store i8 %11, ptr %8, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @ORN_BYTE(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i8, ptr %5, align 1
  %7 = xor i8 %6, -1
  %8 = load ptr, ptr %0, align 1
  %9 = load i8, ptr %8, align 1
  %10 = or i8 %9, %7
  store i8 %10, ptr %8, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @ORN_WORD(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i16, ptr %5, align 2
  %7 = xor i16 %6, -1
  %8 = load ptr, ptr %0, align 1
  %9 = load i16, ptr %8, align 2
  %10 = or i16 %9, %7
  store i16 %10, ptr %8, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @ORN_DWORD(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i32, ptr %5, align 4
  %7 = xor i32 %6, -1
  %8 = load ptr, ptr %0, align 1
  %9 = load i32, ptr %8, align 4
  %10 = or i32 %9, %7
  store i32 %10, ptr %8, align 4
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @ORN(ptr noundef returned %0, ptr noundef %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #1 {
  tail call void @MaskBitfield(ptr noundef %0) #3
  tail call void @MaskBitfield(ptr noundef %1) #3
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %36 [
    i16 1536, label %7
    i16 260, label %15
    i16 512, label %15
    i16 16, label %15
    i16 261, label %22
    i16 513, label %22
    i16 17, label %22
    i16 262, label %29
    i16 514, label %29
    i16 18, label %29
  ]

7:                                                ; preds = %4
  %8 = load ptr, ptr %1, align 1
  %9 = load i8, ptr %8, align 1
  %10 = xor i8 %9, -1
  %11 = load ptr, ptr %0, align 1
  %12 = load i8, ptr %11, align 1
  %13 = or i8 %12, %10
  %14 = and i8 %13, 1
  store i8 %14, ptr %11, align 1
  br label %36

15:                                               ; preds = %4, %4, %4
  %16 = load ptr, ptr %1, align 1
  %17 = load i8, ptr %16, align 1
  %18 = xor i8 %17, -1
  %19 = load ptr, ptr %0, align 1
  %20 = load i8, ptr %19, align 1
  %21 = or i8 %20, %18
  store i8 %21, ptr %19, align 1
  br label %36

22:                                               ; preds = %4, %4, %4
  %23 = load ptr, ptr %1, align 1
  %24 = load i16, ptr %23, align 2
  %25 = xor i16 %24, -1
  %26 = load ptr, ptr %0, align 1
  %27 = load i16, ptr %26, align 2
  %28 = or i16 %27, %25
  store i16 %28, ptr %26, align 2
  br label %36

29:                                               ; preds = %4, %4, %4
  %30 = load ptr, ptr %1, align 1
  %31 = load i32, ptr %30, align 4
  %32 = xor i32 %31, -1
  %33 = load ptr, ptr %0, align 1
  %34 = load i32, ptr %33, align 4
  %35 = or i32 %34, %32
  store i32 %35, ptr %33, align 4
  br label %36

36:                                               ; preds = %4, %29, %22, %15, %7
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @XORN_BOOL(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i8, ptr %5, align 1
  %7 = load ptr, ptr %0, align 1
  %8 = load i8, ptr %7, align 1
  %9 = xor i8 %8, %6
  %10 = and i8 %9, 1
  %11 = xor i8 %10, 1
  store i8 %11, ptr %7, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @XORN_BYTE(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i8, ptr %5, align 1
  %7 = load ptr, ptr %0, align 1
  %8 = load i8, ptr %7, align 1
  %9 = xor i8 %6, %8
  %10 = xor i8 %9, -1
  store i8 %10, ptr %7, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @XORN_WORD(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i16, ptr %5, align 2
  %7 = load ptr, ptr %0, align 1
  %8 = load i16, ptr %7, align 2
  %9 = xor i16 %6, %8
  %10 = xor i16 %9, -1
  store i16 %10, ptr %7, align 2
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @XORN_DWORD(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  %5 = load ptr, ptr %1, align 1
  %6 = load i32, ptr %5, align 4
  %7 = load ptr, ptr %0, align 1
  %8 = load i32, ptr %7, align 4
  %9 = xor i32 %6, %8
  %10 = xor i32 %9, -1
  store i32 %10, ptr %7, align 4
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @XORN(ptr noundef returned %0, ptr noundef %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #1 {
  tail call void @MaskBitfield(ptr noundef %0) #3
  tail call void @MaskBitfield(ptr noundef %1) #3
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %36 [
    i16 1536, label %7
    i16 260, label %15
    i16 512, label %15
    i16 16, label %15
    i16 261, label %22
    i16 513, label %22
    i16 17, label %22
    i16 262, label %29
    i16 514, label %29
    i16 18, label %29
  ]

7:                                                ; preds = %4
  %8 = load ptr, ptr %1, align 1
  %9 = load i8, ptr %8, align 1
  %10 = load ptr, ptr %0, align 1
  %11 = load i8, ptr %10, align 1
  %12 = xor i8 %11, %9
  %13 = and i8 %12, 1
  %14 = xor i8 %13, 1
  store i8 %14, ptr %10, align 1
  br label %36

15:                                               ; preds = %4, %4, %4
  %16 = load ptr, ptr %1, align 1
  %17 = load i8, ptr %16, align 1
  %18 = load ptr, ptr %0, align 1
  %19 = load i8, ptr %18, align 1
  %20 = xor i8 %17, %19
  %21 = xor i8 %20, -1
  store i8 %21, ptr %18, align 1
  br label %36

22:                                               ; preds = %4, %4, %4
  %23 = load ptr, ptr %1, align 1
  %24 = load i16, ptr %23, align 2
  %25 = load ptr, ptr %0, align 1
  %26 = load i16, ptr %25, align 2
  %27 = xor i16 %24, %26
  %28 = xor i16 %27, -1
  store i16 %28, ptr %25, align 2
  br label %36

29:                                               ; preds = %4, %4, %4
  %30 = load ptr, ptr %1, align 1
  %31 = load i32, ptr %30, align 4
  %32 = load ptr, ptr %0, align 1
  %33 = load i32, ptr %32, align 4
  %34 = xor i32 %31, %33
  %35 = xor i32 %34, -1
  store i32 %35, ptr %32, align 4
  br label %36

36:                                               ; preds = %4, %29, %22, %15, %7
  ret ptr %0
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCPIEC\\LogicOpe.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
