; ModuleID = '..\PLCPIEC\MOVE.c'
source_filename = "..\\PLCPIEC\\MOVE.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_0O@GIFHNDMD@MOVE_REAL?3IN1?$AA@" = comdat any

$"??_C@_0P@HBHAFBKF@MOVE_LREAL?3IN1?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@STAT_ENO_MOVE = dso_local local_unnamed_addr global i8 0, align 1
@"??_C@_0O@GIFHNDMD@MOVE_REAL?3IN1?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"MOVE_REAL:IN1\00", comdat, align 1
@"??_C@_0P@HBHAFBKF@MOVE_LREAL?3IN1?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"MOVE_LREAL:IN1\00", comdat, align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport void @SetMoveEno(i8 noundef signext %0) local_unnamed_addr #0 {
  store i8 %0, ptr @STAT_ENO_MOVE, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport signext i8 @GetMoveEno() local_unnamed_addr #1 {
  %1 = load i8, ptr @STAT_ENO_MOVE, align 1
  ret i8 %1
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @MOVE(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %6 = load i16, ptr %5, align 1
  switch i16 %6, label %21 [
    i16 782, label %7
    i16 783, label %12
    i16 260, label %19
    i16 262, label %19
    i16 261, label %19
    i16 263, label %19
    i16 514, label %19
    i16 513, label %19
    i16 512, label %19
    i16 515, label %19
    i16 1347, label %19
    i16 18, label %19
    i16 17, label %19
    i16 16, label %19
    i16 1536, label %19
    i16 1346, label %19
  ]

7:                                                ; preds = %4
  store i8 1, ptr @STAT_ENO_MOVE, align 1
  %8 = load ptr, ptr %0, align 1
  %9 = load float, ptr %8, align 4
  %10 = tail call i32 @ChckREAL(float noundef %9) #4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %21, label %17

12:                                               ; preds = %4
  store i8 1, ptr @STAT_ENO_MOVE, align 1
  %13 = load ptr, ptr %0, align 1
  %14 = load double, ptr %13, align 8
  %15 = tail call i32 @ChckLREAL(double noundef %14) #4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %21, label %17

17:                                               ; preds = %12, %7
  %18 = phi ptr [ @"??_C@_0O@GIFHNDMD@MOVE_REAL?3IN1?$AA@", %7 ], [ @"??_C@_0P@HBHAFBKF@MOVE_LREAL?3IN1?$AA@", %12 ]
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull %18) #4
  br label %19

19:                                               ; preds = %17, %4, %4, %4, %4, %4, %4, %4, %4, %4, %4, %4, %4, %4, %4
  %20 = phi i8 [ 1, %4 ], [ 1, %4 ], [ 1, %4 ], [ 1, %4 ], [ 1, %4 ], [ 1, %4 ], [ 1, %4 ], [ 1, %4 ], [ 1, %4 ], [ 1, %4 ], [ 1, %4 ], [ 1, %4 ], [ 1, %4 ], [ 1, %4 ], [ 0, %17 ]
  store i8 %20, ptr @STAT_ENO_MOVE, align 1
  br label %21

21:                                               ; preds = %19, %12, %7, %4
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @MOVE_REAL(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_MOVE, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = load float, ptr %5, align 4
  %7 = tail call i32 @ChckREAL(float noundef %6) #4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0O@GIFHNDMD@MOVE_REAL?3IN1?$AA@") #4
  store i8 0, ptr @STAT_ENO_MOVE, align 1
  br label %10

10:                                               ; preds = %9, %4
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @MOVE_LREAL(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  store i8 1, ptr @STAT_ENO_MOVE, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = load double, ptr %5, align 8
  %7 = tail call i32 @ChckLREAL(double noundef %6) #4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %4
  tail call void @Eexception_Post(i32 noundef 3, ptr noundef nonnull @"??_C@_0P@HBHAFBKF@MOVE_LREAL?3IN1?$AA@") #4
  store i8 0, ptr @STAT_ENO_MOVE, align 1
  br label %10

10:                                               ; preds = %9, %4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @MOVE_SINT(ptr noundef readnone returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  store i8 1, ptr @STAT_ENO_MOVE, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @MOVE_DINT(ptr noundef readnone returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  store i8 1, ptr @STAT_ENO_MOVE, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @MOVE_INT(ptr noundef readnone returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  store i8 1, ptr @STAT_ENO_MOVE, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @MOVE_LINT(ptr noundef readnone returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  store i8 1, ptr @STAT_ENO_MOVE, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @MOVE_UDINT(ptr noundef readnone returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  store i8 1, ptr @STAT_ENO_MOVE, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @MOVE_UINT(ptr noundef readnone returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  store i8 1, ptr @STAT_ENO_MOVE, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @MOVE_USINT(ptr noundef readnone returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  store i8 1, ptr @STAT_ENO_MOVE, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @MOVE_ULINT(ptr noundef readnone returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  store i8 1, ptr @STAT_ENO_MOVE, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @MOVE_TIME(ptr noundef readnone returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  store i8 1, ptr @STAT_ENO_MOVE, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @MOVE_DWORD(ptr noundef readnone returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  store i8 1, ptr @STAT_ENO_MOVE, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @MOVE_WORD(ptr noundef readnone returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  store i8 1, ptr @STAT_ENO_MOVE, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @MOVE_BYTE(ptr noundef readnone returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  store i8 1, ptr @STAT_ENO_MOVE, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @MOVE_BOOL(ptr noundef readnone returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  store i8 1, ptr @STAT_ENO_MOVE, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @MOVE_STRING(ptr noundef readnone returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #0 {
  store i8 1, ptr @STAT_ENO_MOVE, align 1
  ret ptr %0
}

declare dso_local i32 @ChckREAL(float noundef) local_unnamed_addr #3

declare dso_local void @Eexception_Post(i32 noundef, ptr noundef) local_unnamed_addr #3

declare dso_local i32 @ChckLREAL(double noundef) local_unnamed_addr #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCPIEC\\MOVE.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
