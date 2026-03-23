; ModuleID = '..\PLCPIEC\DWordTo.c'
source_filename = "..\\PLCPIEC\\DWordTo.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_0O@HENDLDG@DWORD_TO_REAL?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@FLOAT_EXACT_LIMIT = dso_local local_unnamed_addr constant i32 16777216, align 4
@STAT_ENO_DWORD_TO = dso_local local_unnamed_addr global i8 0, align 1
@"??_C@_0O@HENDLDG@DWORD_TO_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DWORD_TO_REAL\00", comdat, align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport void @SetDWordToEno(i8 noundef signext %0) local_unnamed_addr #0 {
  store i8 %0, ptr @STAT_ENO_DWORD_TO, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport signext i8 @GetDWordToEno() local_unnamed_addr #1 {
  %1 = load i8, ptr @STAT_ENO_DWORD_TO, align 1
  ret i8 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @DWORD_TO_BOOL(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = icmp ne i32 %7, 0
  %9 = zext i1 %8 to i8
  store i8 %9, ptr %6, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @DWORD_TO_BYTE(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 16, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = trunc i32 %7 to i8
  store i8 %8, ptr %6, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local dllexport noundef ptr @DWORD_TO_DINT(ptr noundef returned writeonly captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #3 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 262, ptr %5, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @DWORD_TO_INT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 261, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = trunc i32 %7 to i16
  store i16 %8, ptr %6, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @DWORD_TO_LINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 263, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = sext i32 %7 to i64
  store i64 %8, ptr %6, align 8
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @DWORD_TO_LREAL(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 783, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = sitofp i32 %7 to double
  store double %8, ptr %6, align 8
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local dllexport noundef ptr @DWORD_TO_REAL(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #4 {
  store i8 1, ptr @STAT_ENO_DWORD_TO, align 1
  %5 = load ptr, ptr %0, align 1
  %6 = load i32, ptr %5, align 4
  %7 = icmp ugt i32 %6, 16777216
  br i1 %7, label %8, label %10

8:                                                ; preds = %4
  tail call void @Eexception_Post(i32 noundef 5, ptr noundef nonnull @"??_C@_0O@HENDLDG@DWORD_TO_REAL?$AA@") #6
  store i8 0, ptr @STAT_ENO_DWORD_TO, align 1
  %9 = load ptr, ptr %0, align 1
  br label %10

10:                                               ; preds = %8, %4
  %11 = phi ptr [ %9, %8 ], [ %5, %4 ]
  %12 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 782, ptr %12, align 1
  %13 = load i32, ptr %11, align 4
  %14 = sitofp i32 %13 to float
  store float %14, ptr %11, align 4
  ret ptr %0
}

declare dso_local void @Eexception_Post(i32 noundef, ptr noundef) local_unnamed_addr #5

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @DWORD_TO_SINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 260, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = trunc i32 %7 to i8
  store i8 %8, ptr %6, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local dllexport noundef ptr @DWORD_TO_UDINT(ptr noundef returned writeonly captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #3 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 514, ptr %5, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @DWORD_TO_UINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 513, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = trunc i32 %7 to i16
  store i16 %8, ptr %6, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @DWORD_TO_USINT(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 512, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = trunc i32 %7 to i8
  store i8 %8, ptr %6, align 4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local dllexport noundef ptr @DWORD_TO_WORD(ptr noundef returned captures(ret: address, provenance) initializes((4, 6)) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 17, ptr %5, align 1
  %6 = load ptr, ptr %0, align 1
  %7 = load i32, ptr %6, align 4
  %8 = trunc i32 %7 to i16
  store i16 %8, ptr %6, align 4
  ret ptr %0
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCPIEC\\DWordTo.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
