; ModuleID = 'D:\work\rtacc\examples\RustRta\main.c'
source_filename = "D:\\work\\rtacc\\examples\\RustRta\\main.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.shared_t = type { i32, i32 }

$LibVersion_0x0701 = comdat any

$"??_C@_0CM@HOMIGEAF@RustRta?3?5shared?4counter?5?$DN?5?$CFd?5?$CIex@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@"??_C@_0CM@HOMIGEAF@RustRta?3?5shared?4counter?5?$DN?5?$CFd?5?$CIex@" = linkonce_odr dso_local unnamed_addr constant [44 x i8] c"RustRta: shared.counter = %d (expected 10)\0A\00", comdat, align 1
@str = private unnamed_addr constant [25 x i8] c"CreateRtThread(2) failed\00", align 1
@str.1 = private unnamed_addr constant [25 x i8] c"CreateRtThread(1) failed\00", align 1

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @main(i32 noundef %0, ptr noundef readnone captures(none) %1) local_unnamed_addr #0 {
  %3 = alloca %struct.shared_t, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #5
  store i64 0, ptr %3, align 4
  %4 = call zeroext i16 @CreateRtThread(i8 noundef zeroext 0, ptr noundef nonnull @rust_thread1_entry, i32 noundef 4096, ptr noundef nonnull %3) #5
  %5 = icmp eq i16 %4, -1
  br i1 %5, label %6, label %8

6:                                                ; preds = %2
  %7 = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  br label %24

8:                                                ; preds = %2
  %9 = call zeroext i16 @CreateRtThread(i8 noundef zeroext 0, ptr noundef nonnull @rust_thread2_entry, i32 noundef 4096, ptr noundef nonnull %3) #5
  %10 = icmp eq i16 %9, -1
  br i1 %10, label %15, label %11

11:                                               ; preds = %8
  %12 = getelementptr inbounds nuw i8, ptr %3, i32 4
  %13 = load atomic volatile i32, ptr %12 acquire, align 4
  %14 = icmp slt i32 %13, 2
  br i1 %14, label %17, label %21

15:                                               ; preds = %8
  %16 = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %24

17:                                               ; preds = %11, %17
  %18 = call zeroext i8 @RtSleep(i32 noundef 100) #5
  %19 = load atomic volatile i32, ptr %12 acquire, align 4
  %20 = icmp slt i32 %19, 2
  br i1 %20, label %17, label %21, !llvm.loop !7

21:                                               ; preds = %17, %11
  %22 = load atomic volatile i32, ptr %3 acquire, align 4
  %23 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CM@HOMIGEAF@RustRta?3?5shared?4counter?5?$DN?5?$CFd?5?$CIex@", i32 noundef %22)
  br label %24

24:                                               ; preds = %21, %15, %6
  %25 = phi i32 [ 1, %6 ], [ 1, %15 ], [ 0, %21 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #5
  ret i32 %25
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

declare dso_local zeroext i16 @CreateRtThread(i8 noundef zeroext, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #2

declare dso_local void @rust_thread1_entry(ptr noundef) #2

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #3

declare dso_local void @rust_thread2_entry(ptr noundef) #2

declare dso_local zeroext i8 @RtSleep(i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #4

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\work\\rtacc\\examples\\RustRta\\main.c", directory: "D:\\work\\rtacc\\examples\\RustRta")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
