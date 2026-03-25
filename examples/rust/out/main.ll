; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.thread_ctx_t = type { ptr, i16, i16, i16 }

$LibVersion_0x0701 = comdat any

$"??_C@_0FA@MMLPNPPF@rust_rt_mailbox?3?5seq?$DN?$CFd?5value?$DN?$CFd@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@"??_C@_0FA@MMLPNPPF@rust_rt_mailbox?3?5seq?$DN?$CFd?5value?$DN?$CFd@" = linkonce_odr dso_local unnamed_addr constant [80 x i8] c"rust_rt_mailbox: seq=%d value=%d sum_seen=%d done_bits=%d (expect sum_seen=%d)\0A\00", comdat, align 1
@str = private unnamed_addr constant [26 x i8] c"SendRtHandle(kick) failed\00", align 1
@str.1 = private unnamed_addr constant [25 x i8] c"CreateRtThread(B) failed\00", align 1
@str.2 = private unnamed_addr constant [25 x i8] c"CreateRtThread(A) failed\00", align 1
@str.3 = private unnamed_addr constant [23 x i8] c"CreateRtMailbox failed\00", align 1
@str.4 = private unnamed_addr constant [28 x i8] c"CreateRtMemoryHandle failed\00", align 1
@str.5 = private unnamed_addr constant [24 x i8] c"AllocateRtMemory failed\00", align 1

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @main(i32 noundef %0, ptr noundef readnone captures(none) %1) local_unnamed_addr #0 {
  %3 = alloca %struct.thread_ctx_t, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #6
  %4 = tail call ptr @AllocateRtMemory(i32 noundef 4096) #6
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %8

6:                                                ; preds = %2
  %7 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.5)
  br label %60

8:                                                ; preds = %2
  tail call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(4096) %4, i8 0, i32 4096, i1 false)
  %9 = tail call zeroext i16 @CreateRtMemoryHandle(ptr noundef nonnull %4, i32 noundef 4096) #6
  %10 = icmp eq i16 %9, -1
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.4)
  br label %60

13:                                               ; preds = %8
  %14 = tail call zeroext i16 @CreateRtMailbox(i16 noundef zeroext 0) #6
  %15 = tail call zeroext i16 @CreateRtMailbox(i16 noundef zeroext 0) #6
  %16 = icmp eq i16 %14, -1
  %17 = icmp eq i16 %15, -1
  %18 = select i1 %16, i1 true, i1 %17
  br i1 %18, label %19, label %21

19:                                               ; preds = %13
  %20 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.3)
  br label %60

21:                                               ; preds = %13
  store ptr %4, ptr %3, align 4
  %22 = getelementptr inbounds nuw i8, ptr %3, i32 4
  store i16 %9, ptr %22, align 4
  %23 = getelementptr inbounds nuw i8, ptr %3, i32 6
  store i16 %14, ptr %23, align 2
  %24 = getelementptr inbounds nuw i8, ptr %3, i32 8
  store i16 %15, ptr %24, align 4
  %25 = call zeroext i16 @CreateRtThread(i8 noundef zeroext 0, ptr noundef nonnull @rust_thread_a_entry, i32 noundef 4096, ptr noundef nonnull %3) #6
  %26 = icmp eq i16 %25, -1
  br i1 %26, label %27, label %29

27:                                               ; preds = %21
  %28 = call i32 @puts(ptr nonnull dereferenceable(1) @str.2)
  br label %60

29:                                               ; preds = %21
  %30 = call zeroext i16 @CreateRtThread(i8 noundef zeroext 0, ptr noundef nonnull @rust_thread_b_entry, i32 noundef 4096, ptr noundef nonnull %3) #6
  %31 = icmp eq i16 %30, -1
  br i1 %31, label %32, label %34

32:                                               ; preds = %29
  %33 = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  br label %60

34:                                               ; preds = %29
  %35 = call zeroext i8 @SendRtHandle(i16 noundef zeroext %14, i16 noundef zeroext %9, i16 noundef zeroext 0) #6
  %36 = icmp eq i8 %35, 0
  br i1 %36, label %37, label %39

37:                                               ; preds = %34
  %38 = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %60

39:                                               ; preds = %34, %46
  %40 = phi i32 [ %48, %46 ], [ 0, %34 ]
  %41 = load ptr, ptr %3, align 4
  %42 = getelementptr inbounds nuw i8, ptr %41, i32 12
  %43 = load atomic volatile i32, ptr %42 acquire, align 4
  %44 = and i32 %43, 3
  %45 = icmp eq i32 %44, 3
  br i1 %45, label %50, label %46

46:                                               ; preds = %39
  %47 = call zeroext i8 @RtSleep(i32 noundef 10) #6
  %48 = add nuw nsw i32 %40, 1
  %49 = icmp eq i32 %48, 5000
  br i1 %49, label %50, label %39, !llvm.loop !7

50:                                               ; preds = %39, %46
  %51 = load ptr, ptr %3, align 4
  %52 = getelementptr inbounds nuw i8, ptr %51, i32 12
  %53 = load atomic volatile i32, ptr %52 acquire, align 4
  %54 = getelementptr inbounds nuw i8, ptr %51, i32 8
  %55 = load atomic volatile i32, ptr %54 acquire, align 4
  %56 = getelementptr inbounds nuw i8, ptr %51, i32 4
  %57 = load atomic volatile i32, ptr %56 acquire, align 4
  %58 = load atomic volatile i32, ptr %51 acquire, align 4
  %59 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0FA@MMLPNPPF@rust_rt_mailbox?3?5seq?$DN?$CFd?5value?$DN?$CFd@", i32 noundef %58, i32 noundef %57, i32 noundef %55, i32 noundef %53, i32 noundef 150)
  br label %60

60:                                               ; preds = %50, %37, %32, %27, %19, %11, %6
  %61 = phi i32 [ 1, %6 ], [ 1, %11 ], [ 1, %19 ], [ 1, %27 ], [ 1, %32 ], [ 0, %50 ], [ 1, %37 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #6
  ret i32 %61
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

declare dso_local ptr @AllocateRtMemory(i32 noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #4

declare dso_local zeroext i16 @CreateRtMemoryHandle(ptr noundef, i32 noundef) local_unnamed_addr #2

declare dso_local zeroext i16 @CreateRtMailbox(i16 noundef zeroext) local_unnamed_addr #2

declare dso_local zeroext i16 @CreateRtThread(i8 noundef zeroext, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #2

declare dso_local void @rust_thread_a_entry(ptr noundef) #2

declare dso_local void @rust_thread_b_entry(ptr noundef) #2

declare dso_local zeroext i8 @SendRtHandle(i16 noundef zeroext, i16 noundef zeroext, i16 noundef zeroext) local_unnamed_addr #2

declare dso_local zeroext i8 @RtSleep(i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #5

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nofree nounwind }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "main.c", directory: "D:\\work\\rtacc\\examples\\rust")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
