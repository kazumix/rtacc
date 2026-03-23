; ModuleID = '..\PLCP\basicfunction.c'
source_filename = "..\\PLCP\\basicfunction.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.MNMTEMPLATE = type <{ ptr, i16, i8, i16, i16, i16, ptr, i16 }>

$LibVersion_0x0701 = comdat any

$"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@" = comdat any

$"??_C@_0BM@NHPPFOEA@?5?5function?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@status_basicfunc = dso_local local_unnamed_addr global i32 0, align 4
@NumBasicFunctions = external dso_local local_unnamed_addr global i16, align 2
@BasicFunctions = external dso_local global [0 x %struct.MNMTEMPLATE], align 1
@InstructionCatalog = external dso_local local_unnamed_addr global [0 x ptr], align 4
@"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@" = linkonce_odr dso_local unnamed_addr constant [41 x i8] c"instruction hash conflict! %s. skipped.\0A\00", comdat, align 1
@"??_C@_0BM@NHPPFOEA@?5?5function?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [28 x i8] c"  function(%03d) %-14s  %p\0A\00", comdat, align 1
@str = private unnamed_addr constant [19 x i8] c"Basicfunction list\00", align 1
@str.1 = private unnamed_addr constant [6 x i8] c"  N/A\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Basicfunction_Load(ptr noundef readnone captures(none) %0) local_unnamed_addr #0 {
  %2 = load i16, ptr @NumBasicFunctions, align 2
  %3 = icmp eq i16 %2, 0
  br i1 %3, label %5, label %4

4:                                                ; preds = %1
  store i32 6, ptr @status_basicfunc, align 4
  br label %5

5:                                                ; preds = %4, %1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Basicfunction_Unload() local_unnamed_addr #1 {
  store i32 0, ptr @status_basicfunc, align 4
  ret void
}

; Function Attrs: nounwind
define dso_local noundef i32 @Basicfunction_CreateCatalog() local_unnamed_addr #2 {
  %1 = load i16, ptr @NumBasicFunctions, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %21, label %3

3:                                                ; preds = %0, %16
  %4 = phi i32 [ %17, %16 ], [ 0, %0 ]
  %5 = getelementptr inbounds nuw %struct.MNMTEMPLATE, ptr @BasicFunctions, i32 %4
  %6 = load ptr, ptr %5, align 1
  %7 = tail call zeroext i16 @Instruction_CalcHash(ptr noundef %6) #7
  %8 = zext i16 %7 to i32
  %9 = getelementptr inbounds nuw ptr, ptr @InstructionCatalog, i32 %8
  %10 = load ptr, ptr %9, align 4
  %11 = icmp eq ptr %10, null
  br i1 %11, label %15, label %12

12:                                               ; preds = %3
  %13 = load ptr, ptr %5, align 1
  %14 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@", ptr noundef %13)
  br label %16

15:                                               ; preds = %3
  store ptr %5, ptr %9, align 4
  br label %16

16:                                               ; preds = %15, %12
  %17 = add nuw nsw i32 %4, 1
  %18 = load i16, ptr @NumBasicFunctions, align 2
  %19 = zext i16 %18 to i32
  %20 = icmp samesign ult i32 %17, %19
  br i1 %20, label %3, label %21, !llvm.loop !7

21:                                               ; preds = %16, %0
  store i32 2, ptr @status_basicfunc, align 4
  ret i32 0
}

declare dso_local zeroext i16 @Instruction_CalcHash(ptr noundef) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #4

; Function Attrs: nofree nounwind
define dso_local void @Basicfunction_Display() local_unnamed_addr #5 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %2 = load i16, ptr @NumBasicFunctions, align 2
  %3 = icmp eq i16 %2, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  br label %19

6:                                                ; preds = %0, %6
  %7 = phi i32 [ %14, %6 ], [ 1, %0 ]
  %8 = phi i32 [ %15, %6 ], [ 0, %0 ]
  %9 = getelementptr inbounds nuw %struct.MNMTEMPLATE, ptr @BasicFunctions, i32 %8
  %10 = load ptr, ptr %9, align 1
  %11 = getelementptr inbounds nuw i8, ptr %9, i32 13
  %12 = load ptr, ptr %11, align 1
  %13 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BM@NHPPFOEA@?5?5function?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@", i32 noundef %7, ptr noundef %10, ptr noundef %12)
  %14 = add nuw nsw i32 %7, 1
  %15 = add nuw nsw i32 %8, 1
  %16 = load i16, ptr @NumBasicFunctions, align 2
  %17 = zext i16 %16 to i32
  %18 = icmp samesign ult i32 %15, %17
  br i1 %18, label %6, label %19, !llvm.loop !9

19:                                               ; preds = %6, %4
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #6

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree nounwind }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\basicfunction.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
