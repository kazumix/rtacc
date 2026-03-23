; ModuleID = 'd:\work\rtacc\examples\ex\hello.c'
source_filename = "d:\\work\\rtacc\\examples\\ex\\hello.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [18 x i8] c"Hello, World! %d\0A\00", comdat, align 1
@str = private unnamed_addr constant [34 x i8] c"CreateRtThread(ScanThread) failed\00", align 1

; Function Attrs: nounwind
define dso_local range(i32 -1, 1) i32 @main(i32 noundef %0, ptr noundef readnone captures(none) %1) local_unnamed_addr #0 {
  tail call void @IlRtedgeTags_Init() #4
  %3 = tail call zeroext i16 @CreateRtThread(i8 noundef zeroext -86, ptr noundef nonnull @ScanThread, i32 noundef 8192, ptr noundef null) #4
  %4 = icmp eq i16 %3, -1
  br i1 %4, label %47, label %5

5:                                                ; preds = %2
  %6 = tail call zeroext i8 @RtSleep(i32 noundef 500) #4
  %7 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@", i32 noundef 0)
  %8 = tail call zeroext i8 @RtSleep(i32 noundef 500) #4
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@", i32 noundef 1)
  %10 = tail call zeroext i8 @RtSleep(i32 noundef 500) #4
  %11 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@", i32 noundef 2)
  %12 = tail call zeroext i8 @RtSleep(i32 noundef 500) #4
  %13 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@", i32 noundef 3)
  %14 = tail call zeroext i8 @RtSleep(i32 noundef 500) #4
  %15 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@", i32 noundef 4)
  %16 = tail call zeroext i8 @RtSleep(i32 noundef 500) #4
  %17 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@", i32 noundef 5)
  %18 = tail call zeroext i8 @RtSleep(i32 noundef 500) #4
  %19 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@", i32 noundef 6)
  %20 = tail call zeroext i8 @RtSleep(i32 noundef 500) #4
  %21 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@", i32 noundef 7)
  %22 = tail call zeroext i8 @RtSleep(i32 noundef 500) #4
  %23 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@", i32 noundef 8)
  %24 = tail call zeroext i8 @RtSleep(i32 noundef 500) #4
  %25 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@", i32 noundef 9)
  %26 = tail call zeroext i8 @RtSleep(i32 noundef 500) #4
  %27 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@", i32 noundef 10)
  %28 = tail call zeroext i8 @RtSleep(i32 noundef 500) #4
  %29 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@", i32 noundef 11)
  %30 = tail call zeroext i8 @RtSleep(i32 noundef 500) #4
  %31 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@", i32 noundef 12)
  %32 = tail call zeroext i8 @RtSleep(i32 noundef 500) #4
  %33 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@", i32 noundef 13)
  %34 = tail call zeroext i8 @RtSleep(i32 noundef 500) #4
  %35 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@", i32 noundef 14)
  %36 = tail call zeroext i8 @RtSleep(i32 noundef 500) #4
  %37 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@", i32 noundef 15)
  %38 = tail call zeroext i8 @RtSleep(i32 noundef 500) #4
  %39 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@", i32 noundef 16)
  %40 = tail call zeroext i8 @RtSleep(i32 noundef 500) #4
  %41 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@", i32 noundef 17)
  %42 = tail call zeroext i8 @RtSleep(i32 noundef 500) #4
  %43 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@", i32 noundef 18)
  %44 = tail call zeroext i8 @RtSleep(i32 noundef 500) #4
  %45 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@", i32 noundef 19)
  %46 = tail call zeroext i8 @SuspendRtThread(i16 noundef zeroext 0) #4
  br label %49

47:                                               ; preds = %2
  %48 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %49

49:                                               ; preds = %47, %5
  %50 = phi i32 [ 0, %5 ], [ -1, %47 ]
  ret i32 %50
}

declare dso_local void @IlRtedgeTags_Init() local_unnamed_addr #1

declare dso_local zeroext i16 @CreateRtThread(i8 noundef zeroext, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #1

declare dso_local void @ScanThread() #1

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #2

declare dso_local zeroext i8 @RtSleep(i32 noundef) local_unnamed_addr #1

declare dso_local zeroext i8 @SuspendRtThread(i16 noundef zeroext) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #3

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "d:\\work\\rtacc\\examples\\ex\\hello.c", directory: "D:\\work\\rtacc\\examples\\ex")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
