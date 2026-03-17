; ModuleID = 'basicfunction.c'
source_filename = "basicfunction.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.MNMTEMPLATE = type <{ ptr, i16, i8, i16, i16, i16, ptr, i16 }>

$LibVersion_0x0701 = comdat any

$"??_C@_0P@FHFAIKGM@BasicFunctions?$AA@" = comdat any

$"??_C@_0BC@OECJMJAO@NumBasicFunctions?$AA@" = comdat any

$"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@" = comdat any

$"??_C@_0BM@NHPPFOEA@?5?5function?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@status_basicfunc = dso_local local_unnamed_addr global i32 0, align 4
@BasicFunctions = dso_local local_unnamed_addr global ptr null, align 4
@NumBasicFunctions = dso_local local_unnamed_addr global i16 0, align 2
@hBasicFuncRSL = internal unnamed_addr global i16 0, align 2
@"??_C@_0P@FHFAIKGM@BasicFunctions?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"BasicFunctions\00", comdat, align 1
@"??_C@_0BC@OECJMJAO@NumBasicFunctions?$AA@" = linkonce_odr dso_local unnamed_addr constant [18 x i8] c"NumBasicFunctions\00", comdat, align 1
@InstructionCatalog = external dso_local local_unnamed_addr global [0 x ptr], align 4
@"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@" = linkonce_odr dso_local unnamed_addr constant [41 x i8] c"instruction hash conflict! %s. skipped.\0A\00", comdat, align 1
@"??_C@_0BM@NHPPFOEA@?5?5function?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [28 x i8] c"  function(%03d) %-14s  %p\0A\00", comdat, align 1
@str = private unnamed_addr constant [19 x i8] c"Basicfunction list\00", align 1
@str.1 = private unnamed_addr constant [6 x i8] c"  N/A\00", align 1

; Function Attrs: nounwind
define dso_local void @Basicfunction_Load(ptr noundef %0) local_unnamed_addr #0 {
  %2 = tail call zeroext i16 @INtime_RslLoad(ptr noundef %0) #5
  store i16 %2, ptr @hBasicFuncRSL, align 2
  %3 = icmp eq i16 %2, 0
  br i1 %3, label %15, label %4

4:                                                ; preds = %1
  %5 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %2, ptr noundef nonnull @"??_C@_0P@FHFAIKGM@BasicFunctions?$AA@") #5
  store ptr %5, ptr @BasicFunctions, align 4
  %6 = load i16, ptr @hBasicFuncRSL, align 2
  %7 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %6, ptr noundef nonnull @"??_C@_0BC@OECJMJAO@NumBasicFunctions?$AA@") #5
  %8 = load ptr, ptr @BasicFunctions, align 4
  %9 = icmp eq ptr %8, null
  %10 = icmp eq ptr %7, null
  %11 = select i1 %9, i1 true, i1 %10
  br i1 %11, label %12, label %13

12:                                               ; preds = %4
  tail call void @Errorlog_Add(i32 noundef 0, i32 noundef 208, ptr noundef %0) #5
  br label %15

13:                                               ; preds = %4
  %14 = load i16, ptr %7, align 2
  store i16 %14, ptr @NumBasicFunctions, align 2
  store i32 6, ptr @status_basicfunc, align 4
  br label %15

15:                                               ; preds = %1, %12, %13
  ret void
}

declare dso_local zeroext i16 @INtime_RslLoad(ptr noundef) local_unnamed_addr #1

declare dso_local ptr @GetRtProcAddress(i16 noundef zeroext, ptr noundef) local_unnamed_addr #1

declare dso_local void @Errorlog_Add(i32 noundef, i32 noundef, ptr noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @Basicfunction_Unload() local_unnamed_addr #0 {
  %1 = load i16, ptr @hBasicFuncRSL, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %5, label %3

3:                                                ; preds = %0
  %4 = tail call zeroext i8 @FreeRtLibrary(i16 noundef zeroext %1) #5
  store i16 0, ptr @hBasicFuncRSL, align 2
  br label %5

5:                                                ; preds = %3, %0
  store i32 0, ptr @status_basicfunc, align 4
  ret void
}

declare dso_local zeroext i8 @FreeRtLibrary(i16 noundef zeroext) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local noundef i32 @Basicfunction_CreateCatalog() local_unnamed_addr #0 {
  %1 = load i16, ptr @NumBasicFunctions, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %28, label %3

3:                                                ; preds = %0
  %4 = load ptr, ptr @BasicFunctions, align 4
  br label %5

5:                                                ; preds = %3, %22
  %6 = phi ptr [ %23, %22 ], [ %4, %3 ]
  %7 = phi i32 [ %24, %22 ], [ 0, %3 ]
  %8 = getelementptr inbounds nuw %struct.MNMTEMPLATE, ptr %6, i32 %7
  %9 = load ptr, ptr %8, align 1
  %10 = tail call zeroext i16 @Instruction_CalcHash(ptr noundef %9) #5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds nuw ptr, ptr @InstructionCatalog, i32 %11
  %13 = load ptr, ptr %12, align 4
  %14 = icmp eq ptr %13, null
  %15 = load ptr, ptr @BasicFunctions, align 4
  %16 = getelementptr inbounds nuw %struct.MNMTEMPLATE, ptr %15, i32 %7
  br i1 %14, label %21, label %17

17:                                               ; preds = %5
  %18 = load ptr, ptr %16, align 1
  %19 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@", ptr noundef %18)
  %20 = load ptr, ptr @BasicFunctions, align 4
  br label %22

21:                                               ; preds = %5
  store ptr %16, ptr %12, align 4
  br label %22

22:                                               ; preds = %21, %17
  %23 = phi ptr [ %15, %21 ], [ %20, %17 ]
  %24 = add nuw nsw i32 %7, 1
  %25 = load i16, ptr @NumBasicFunctions, align 2
  %26 = zext i16 %25 to i32
  %27 = icmp samesign ult i32 %24, %26
  br i1 %27, label %5, label %28, !llvm.loop !7

28:                                               ; preds = %22, %0
  store i32 2, ptr @status_basicfunc, align 4
  ret i32 0
}

declare dso_local zeroext i16 @Instruction_CalcHash(ptr noundef) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind
define dso_local void @Basicfunction_Display() local_unnamed_addr #3 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %2 = load i16, ptr @NumBasicFunctions, align 2
  %3 = icmp eq i16 %2, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  br label %20

6:                                                ; preds = %0, %6
  %7 = phi i32 [ %15, %6 ], [ 1, %0 ]
  %8 = phi i32 [ %16, %6 ], [ 0, %0 ]
  %9 = load ptr, ptr @BasicFunctions, align 4
  %10 = getelementptr inbounds nuw %struct.MNMTEMPLATE, ptr %9, i32 %8
  %11 = load ptr, ptr %10, align 1
  %12 = getelementptr inbounds nuw i8, ptr %10, i32 13
  %13 = load ptr, ptr %12, align 1
  %14 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BM@NHPPFOEA@?5?5function?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@", i32 noundef %7, ptr noundef %11, ptr noundef %13)
  %15 = add nuw nsw i32 %7, 1
  %16 = add nuw nsw i32 %8, 1
  %17 = load i16, ptr @NumBasicFunctions, align 2
  %18 = zext i16 %17 to i32
  %19 = icmp samesign ult i32 %16, %18
  br i1 %19, label %6, label %20, !llvm.loop !9

20:                                               ; preds = %6, %4
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #4

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "basicfunction.c", directory: "D:\\work\\rtacc\\examples\\PLCP")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
