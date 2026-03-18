; ModuleID = 'D:\work\rtacc\examples\RTthread\RTthread.c'
source_filename = "D:\\work\\rtacc\\examples\\RTthread\\RTthread.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@str = private unnamed_addr constant [14 x i8] c"thread1 start\00", align 1
@str.1 = private unnamed_addr constant [16 x i8] c"thread1 running\00", align 1
@str.2 = private unnamed_addr constant [14 x i8] c"thread2 start\00", align 1
@str.3 = private unnamed_addr constant [16 x i8] c"thread2 running\00", align 1
@str.4 = private unnamed_addr constant [21 x i8] c"INtime RTthread test\00", align 1
@str.5 = private unnamed_addr constant [23 x i8] c"CreateRtThread success\00", align 1
@str.6 = private unnamed_addr constant [22 x i8] c"CreateRtThread failed\00", align 1

; Function Attrs: noreturn nounwind
define dso_local void @thread1() #0 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %2

2:                                                ; preds = %0, %2
  %3 = tail call zeroext i8 @RtSleep(i32 noundef 1000) #4
  %4 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  br label %2
}

declare dso_local zeroext i8 @RtSleep(i32 noundef) local_unnamed_addr #1

; Function Attrs: noreturn nounwind
define dso_local void @thread2() #0 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.2)
  br label %2

2:                                                ; preds = %0, %2
  %3 = tail call zeroext i8 @RtSleep(i32 noundef 1500) #4
  %4 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.3)
  br label %2
}

; Function Attrs: nounwind
define dso_local range(i32 -1, 1) i32 @main() local_unnamed_addr #2 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.4)
  %2 = tail call zeroext i16 @CreateRtThread(i8 noundef zeroext -86, ptr noundef nonnull @thread1, i32 noundef 4096, ptr noundef null) #4
  %3 = tail call zeroext i16 @CreateRtThread(i8 noundef zeroext -84, ptr noundef nonnull @thread2, i32 noundef 4096, ptr noundef null) #4
  %4 = icmp eq i16 %2, -1
  %5 = icmp eq i16 %3, -1
  %6 = select i1 %4, i1 true, i1 %5
  br i1 %6, label %7, label %9

7:                                                ; preds = %0
  %8 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.6)
  br label %12

9:                                                ; preds = %0
  %10 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.5)
  %11 = tail call zeroext i8 @SuspendRtThread(i16 noundef zeroext 0) #4
  br label %12

12:                                               ; preds = %9, %7
  %13 = phi i32 [ -1, %7 ], [ 0, %9 ]
  ret i32 %13
}

declare dso_local zeroext i16 @CreateRtThread(i8 noundef zeroext, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #1

declare dso_local zeroext i8 @SuspendRtThread(i16 noundef zeroext) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #3

attributes #0 = { noreturn nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\work\\rtacc\\examples\\RTthread\\RTthread.c", directory: "D:\\work\\rtacc\\examples\\RTthread")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
