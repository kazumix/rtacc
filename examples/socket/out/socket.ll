; ModuleID = 'socket.c'
source_filename = "socket.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_0L@PADFLHID@netlib?4rsl?$AA@" = comdat any

$"??_C@_0CO@CKEEIPDJ@?$FLsocket?$FN?5LoadRtLibrary?$CInetlib?4rs@" = comdat any

$"??_C@_0O@JDPEMBHJ@uastackrt?4rsl?$AA@" = comdat any

$"??_C@_0DB@JDFODGFO@?$FLsocket?$FN?5LoadRtLibrary?$CIuastackrt@" = comdat any

$"??_C@_07FADHOGD@_socket?$AA@" = comdat any

$"??_C@_06HBELJPBO@socket?$AA@" = comdat any

$"??_C@_09BFJOLACN@_shutdown?$AA@" = comdat any

$"??_C@_08FIACBBDA@shutdown?$AA@" = comdat any

$"??_C@_0CK@CMPBHBJD@?$FLsocket?$FN?5resolved?3?5socket?$DN?$CFp?5shu@" = comdat any

$"??_C@_0CI@KNEOODFD@?$FLsocket?$FN?5after?5socket?$CI?$CJ?5fd?$DN?$CFd?5er@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@"??_C@_0L@PADFLHID@netlib?4rsl?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"netlib.rsl\00", comdat, align 1
@"??_C@_0CO@CKEEIPDJ@?$FLsocket?$FN?5LoadRtLibrary?$CInetlib?4rs@" = linkonce_odr dso_local unnamed_addr constant [46 x i8] c"[socket] LoadRtLibrary(netlib.rsl) handle=%u\0A\00", comdat, align 1
@"??_C@_0O@JDPEMBHJ@uastackrt?4rsl?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"uastackrt.rsl\00", comdat, align 1
@"??_C@_0DB@JDFODGFO@?$FLsocket?$FN?5LoadRtLibrary?$CIuastackrt@" = linkonce_odr dso_local unnamed_addr constant [49 x i8] c"[socket] LoadRtLibrary(uastackrt.rsl) handle=%u\0A\00", comdat, align 1
@"??_C@_07FADHOGD@_socket?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"_socket\00", comdat, align 1
@"??_C@_06HBELJPBO@socket?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"socket\00", comdat, align 1
@"??_C@_09BFJOLACN@_shutdown?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"_shutdown\00", comdat, align 1
@"??_C@_08FIACBBDA@shutdown?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"shutdown\00", comdat, align 1
@"??_C@_0CK@CMPBHBJD@?$FLsocket?$FN?5resolved?3?5socket?$DN?$CFp?5shu@" = linkonce_odr dso_local unnamed_addr constant [42 x i8] c"[socket] resolved: socket=%p shutdown=%p\0A\00", comdat, align 1
@"??_C@_0CI@KNEOODFD@?$FLsocket?$FN?5after?5socket?$CI?$CJ?5fd?$DN?$CFd?5er@" = linkonce_odr dso_local unnamed_addr constant [40 x i8] c"[socket] after socket() fd=%d errno=%d\0A\00", comdat, align 1
@str = private unnamed_addr constant [30 x i8] c"[socket] before socket() call\00", align 1
@str.1 = private unnamed_addr constant [31 x i8] c"[socket] loading netlib.rsl...\00", align 1
@str.2 = private unnamed_addr constant [34 x i8] c"[socket] loading uastackrt.rsl...\00", align 1
@str.3 = private unnamed_addr constant [59 x i8] c"[socket] ERROR: could not resolve socket() from netlib.rsl\00", align 1
@str.4 = private unnamed_addr constant [24 x i8] c"[socket] after socket()\00", align 1

; Function Attrs: nounwind
define dso_local range(i32 -1, 1) i32 @main(i32 noundef %0, ptr noundef readnone captures(none) %1) local_unnamed_addr #0 {
  %3 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %4 = tail call ptr @_stdio_ptr() #4
  %5 = getelementptr inbounds nuw i8, ptr %4, i32 56
  %6 = tail call i32 @fflush(ptr noundef nonnull %5)
  %7 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  %8 = tail call ptr @_stdio_ptr() #4
  %9 = getelementptr inbounds nuw i8, ptr %8, i32 56
  %10 = tail call i32 @fflush(ptr noundef nonnull %9)
  %11 = tail call zeroext i16 @LoadRtLibrary(ptr noundef nonnull @"??_C@_0L@PADFLHID@netlib?4rsl?$AA@") #4
  %12 = zext i16 %11 to i32
  %13 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CO@CKEEIPDJ@?$FLsocket?$FN?5LoadRtLibrary?$CInetlib?4rs@", i32 noundef %12)
  %14 = tail call ptr @_stdio_ptr() #4
  %15 = getelementptr inbounds nuw i8, ptr %14, i32 56
  %16 = tail call i32 @fflush(ptr noundef nonnull %15)
  %17 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.2)
  %18 = tail call ptr @_stdio_ptr() #4
  %19 = getelementptr inbounds nuw i8, ptr %18, i32 56
  %20 = tail call i32 @fflush(ptr noundef nonnull %19)
  %21 = tail call zeroext i16 @LoadRtLibrary(ptr noundef nonnull @"??_C@_0O@JDPEMBHJ@uastackrt?4rsl?$AA@") #4
  %22 = zext i16 %21 to i32
  %23 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0DB@JDFODGFO@?$FLsocket?$FN?5LoadRtLibrary?$CIuastackrt@", i32 noundef %22)
  %24 = tail call ptr @_stdio_ptr() #4
  %25 = getelementptr inbounds nuw i8, ptr %24, i32 56
  %26 = tail call i32 @fflush(ptr noundef nonnull %25)
  %27 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %11, ptr noundef nonnull @"??_C@_07FADHOGD@_socket?$AA@") #4
  %28 = icmp eq ptr %27, null
  br i1 %28, label %29, label %31

29:                                               ; preds = %2
  %30 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %11, ptr noundef nonnull @"??_C@_06HBELJPBO@socket?$AA@") #4
  br label %31

31:                                               ; preds = %29, %2
  %32 = phi ptr [ %27, %2 ], [ %30, %29 ]
  %33 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %11, ptr noundef nonnull @"??_C@_09BFJOLACN@_shutdown?$AA@") #4
  %34 = icmp eq ptr %33, null
  br i1 %34, label %35, label %37

35:                                               ; preds = %31
  %36 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %11, ptr noundef nonnull @"??_C@_08FIACBBDA@shutdown?$AA@") #4
  br label %37

37:                                               ; preds = %35, %31
  %38 = phi ptr [ %33, %31 ], [ %36, %35 ]
  %39 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CK@CMPBHBJD@?$FLsocket?$FN?5resolved?3?5socket?$DN?$CFp?5shu@", ptr noundef %32, ptr noundef %38)
  %40 = tail call ptr @_stdio_ptr() #4
  %41 = getelementptr inbounds nuw i8, ptr %40, i32 56
  %42 = tail call i32 @fflush(ptr noundef nonnull %41)
  %43 = icmp eq ptr %32, null
  br i1 %43, label %44, label %46

44:                                               ; preds = %37
  %45 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.3)
  br label %64

46:                                               ; preds = %37
  %47 = tail call ptr @_thread_ptr() #4
  store i32 0, ptr %47, align 4
  %48 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.4)
  %49 = tail call ptr @_stdio_ptr() #4
  %50 = getelementptr inbounds nuw i8, ptr %49, i32 56
  %51 = tail call i32 @fflush(ptr noundef nonnull %50)
  %52 = tail call i32 %32(i32 noundef 2, i32 noundef 2, i32 noundef 17) #4
  %53 = tail call ptr @_thread_ptr() #4
  %54 = load i32, ptr %53, align 4
  %55 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CI@KNEOODFD@?$FLsocket?$FN?5after?5socket?$CI?$CJ?5fd?$DN?$CFd?5er@", i32 noundef %52, i32 noundef %54)
  %56 = tail call ptr @_stdio_ptr() #4
  %57 = getelementptr inbounds nuw i8, ptr %56, i32 56
  %58 = tail call i32 @fflush(ptr noundef nonnull %57)
  %59 = icmp sgt i32 %52, -1
  %60 = icmp ne ptr %38, null
  %61 = and i1 %60, %59
  br i1 %61, label %62, label %64

62:                                               ; preds = %46
  %63 = tail call i32 %38(i32 noundef %52, i32 noundef 2) #4
  br label %64

64:                                               ; preds = %46, %62, %44
  %65 = phi i32 [ -1, %44 ], [ 0, %62 ], [ 0, %46 ]
  ret i32 %65
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fflush(ptr noundef captures(none)) local_unnamed_addr #1

declare dso_local ptr @_stdio_ptr() local_unnamed_addr #2

declare dso_local zeroext i16 @LoadRtLibrary(ptr noundef) local_unnamed_addr #2

declare dso_local ptr @GetRtProcAddress(i16 noundef zeroext, ptr noundef) local_unnamed_addr #2

declare dso_local ptr @_thread_ptr() local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #3

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "socket.c", directory: "D:\\work\\rtacc\\examples\\socket")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
