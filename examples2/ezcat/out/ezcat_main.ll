; ModuleID = 'ezcat_main.c'
source_filename = "ezcat_main.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.ezcat_master = type { %struct.ezcat_lowsock, [1536 x i8], i32, i32, i32 }
%struct.ezcat_lowsock = type { i32, [6 x i8], [260 x i8], [384 x i8] }

$LibVersion_0x0701 = comdat any

$"??_C@_08HPGHNMAJ@EZCAT_IF?$AA@" = comdat any

$"??_C@_09KAGEOMBB@EZCAT_TMO?$AA@" = comdat any

$"??_C@_0N@FCEHPMED@EZCAT_LISTIF?$AA@" = comdat any

$"??_C@_05OJNJFIAP@ie1e0?$AA@" = comdat any

$"??_C@_0BM@OFDFFDMD@ezcat?3?5open?5failed?5?$CIif?$DN?$CC?$CFs?$CC?$AA@" = comdat any

$"??_C@_0L@MABPEHLF@?0?5errno?$DN?$CFd?$AA@" = comdat any

$"??_C@_05DNDNCJEB@?5?$CI?$CFs?$CJ?$AA@" = comdat any

$"??_C@_0O@IPIGCFIH@?0?5detail?$DN?$CFd?$CJ?6?$AA@" = comdat any

$"??_C@_0ED@FBOOFBBL@ezcat?3?5netlib?4rsl?5not?5loaded?4?5Ex@" = comdat any

$"??_C@_0DJ@EBBIFOJG@ezcat?3?5netlib?1clib?5loaded?5but?5a?5@" = comdat any

$"??_C@_0FH@LNJIIOKO@ezcat?3?5OP?0?5?$CFd?5slave?$CIs?$CJ?4?5Ctrl?$CLC?5?c@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@"??_C@_08HPGHNMAJ@EZCAT_IF?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"EZCAT_IF\00", comdat, align 1
@"??_C@_09KAGEOMBB@EZCAT_TMO?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"EZCAT_TMO\00", comdat, align 1
@"??_C@_0N@FCEHPMED@EZCAT_LISTIF?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"EZCAT_LISTIF\00", comdat, align 1
@"??_C@_05OJNJFIAP@ie1e0?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"ie1e0\00", comdat, align 1
@"??_C@_0BM@OFDFFDMD@ezcat?3?5open?5failed?5?$CIif?$DN?$CC?$CFs?$CC?$AA@" = linkonce_odr dso_local unnamed_addr constant [28 x i8] c"ezcat: open failed (if=\22%s\22\00", comdat, align 1
@"??_C@_0L@MABPEHLF@?0?5errno?$DN?$CFd?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c", errno=%d\00", comdat, align 1
@"??_C@_05DNDNCJEB@?5?$CI?$CFs?$CJ?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c" (%s)\00", comdat, align 1
@"??_C@_0O@IPIGCFIH@?0?5detail?$DN?$CFd?$CJ?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c", detail=%d)\0A\00", comdat, align 1
@"??_C@_0ED@FBOOFBBL@ezcat?3?5netlib?4rsl?5not?5loaded?4?5Ex@" = linkonce_odr dso_local unnamed_addr constant [67 x i8] c"ezcat: netlib.rsl not loaded. Expected: %%INTIME%%\\bin\\netlib.rsl\0A\00", comdat, align 1
@"??_C@_0DJ@EBBIFOJG@ezcat?3?5netlib?1clib?5loaded?5but?5a?5@" = linkonce_odr dso_local unnamed_addr constant [57 x i8] c"ezcat: netlib/clib loaded but a required symbol missing \00", comdat, align 1
@"??_C@_0FH@LNJIIOKO@ezcat?3?5OP?0?5?$CFd?5slave?$CIs?$CJ?4?5Ctrl?$CLC?5?c@" = linkonce_odr dso_local unnamed_addr constant [87 x i8] c"ezcat: OP, %d slave(s). Ctrl+C \E3\81\A7\E3\82\B9\E3\83\AC\E3\83\BC\E3\83\96\E3\82\92\E6\AE\B5\E9\9A\8E\E5\81\9C\E6\AD\A2\E3\81\97\E3\81\A6\E7\B5\82\E4\BA\86\E3\81\97\E3\81\BE\E3\81\99\E3\80\82\0A\00", comdat, align 1
@g_ezcat_stop = internal global i32 0, align 4
@str = private unnamed_addr constant [33 x i8] c"ezcat: shutting down EtherCAT...\00", align 1
@str.1 = private unnamed_addr constant [13 x i8] c"ezcat: done.\00", align 1
@str.2 = private unnamed_addr constant [68 x i8] c"ezcat: no AF_LINK+MAC for ifname (case-insensitive + ifindex tried)\00", align 1
@str.3 = private unnamed_addr constant [60 x i8] c"ezcat:   EZCAT_LISTIF=1 then rerun to print interface names\00", align 1
@str.4 = private unnamed_addr constant [67 x i8] c"ezcat: getifaddrs/freeifaddrs missing. Try EZCAT_CLIB=...\\clib.rsl\00", align 1
@str.5 = private unnamed_addr constant [51 x i8] c"(netlib: socket,bind,send,recv; clib: ioctl,close)\00", align 1
@str.6 = private unnamed_addr constant [78 x i8] c"ezcat: clib.rsl not loaded (needed for ioctl/close). Set INTIME or EZCAT_CLIB\00", align 1
@str.7 = private unnamed_addr constant [71 x i8] c"ezcat:   set INTIME to SDK root, or EZCAT_NETLIB=C:\\path\\to\\netlib.rsl\00", align 1
@str.8 = private unnamed_addr constant [28 x i8] c"ezcat: hint: EZCAT_IF=ie1e0\00", align 1

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @main() local_unnamed_addr #0 {
  %1 = alloca %struct.ezcat_master, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #7
  %2 = tail call ptr @getenv(ptr noundef nonnull @"??_C@_08HPGHNMAJ@EZCAT_IF?$AA@")
  %3 = tail call ptr @getenv(ptr noundef nonnull @"??_C@_09KAGEOMBB@EZCAT_TMO?$AA@")
  %4 = tail call ptr @getenv(ptr noundef nonnull @"??_C@_0N@FCEHPMED@EZCAT_LISTIF?$AA@")
  %5 = icmp eq ptr %2, null
  %6 = select i1 %5, ptr @"??_C@_05OJNJFIAP@ie1e0?$AA@", ptr %2
  %7 = icmp eq ptr %3, null
  br i1 %7, label %33, label %8

8:                                                ; preds = %0
  %9 = load i8, ptr %3, align 1
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %33, label %11

11:                                               ; preds = %8
  %12 = add i8 %9, -48
  %13 = icmp ult i8 %12, 10
  br i1 %13, label %19, label %28

14:                                               ; preds = %19
  %15 = getelementptr inbounds nuw i8, ptr %22, i32 1
  %16 = load i8, ptr %15, align 1
  %17 = add i8 %16, -48
  %18 = icmp ult i8 %17, 10
  br i1 %18, label %19, label %28, !llvm.loop !7

19:                                               ; preds = %11, %14
  %20 = phi i8 [ %16, %14 ], [ %9, %11 ]
  %21 = phi i32 [ %26, %14 ], [ 0, %11 ]
  %22 = phi ptr [ %15, %14 ], [ %3, %11 ]
  %23 = mul nuw nsw i32 %21, 10
  %24 = add nsw i8 %20, -48
  %25 = zext nneg i8 %24 to i32
  %26 = add nuw nsw i32 %23, %25
  %27 = icmp samesign ugt i32 %26, 300000
  br i1 %27, label %28, label %14

28:                                               ; preds = %14, %19, %11
  %29 = phi i32 [ 0, %11 ], [ %26, %19 ], [ %26, %14 ]
  %30 = add nsw i32 %29, -1
  %31 = icmp ult i32 %30, 299999
  %32 = select i1 %31, i32 %29, i32 5000
  br label %33

33:                                               ; preds = %28, %8, %0
  %34 = phi i32 [ %32, %28 ], [ 5000, %8 ], [ 5000, %0 ]
  %35 = icmp eq ptr %4, null
  br i1 %35, label %40, label %36

36:                                               ; preds = %33
  %37 = load i8, ptr %4, align 1
  %38 = icmp eq i8 %37, 49
  br i1 %38, label %39, label %40

39:                                               ; preds = %36
  tail call void @ezcat_lowsock_list_devices() #7
  br label %40

40:                                               ; preds = %39, %36, %33
  %41 = call i32 @ezcat_master_init(ptr noundef nonnull %1, ptr noundef nonnull %6) #7
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %77, label %43

43:                                               ; preds = %40
  %44 = call i32 @ezcat_lowsock_last_open_errno() #7
  %45 = call i32 @ezcat_lowsock_last_open_detail() #7
  %46 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BM@OFDFFDMD@ezcat?3?5open?5failed?5?$CIif?$DN?$CC?$CFs?$CC?$AA@", ptr noundef nonnull %6)
  %47 = icmp eq i32 %44, 0
  br i1 %47, label %59, label %48

48:                                               ; preds = %43
  %49 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0L@MABPEHLF@?0?5errno?$DN?$CFd?$AA@", i32 noundef %44)
  %50 = call ptr @strerror(i32 noundef %44) #7
  %51 = icmp eq ptr %50, null
  br i1 %51, label %59, label %52

52:                                               ; preds = %48
  %53 = call ptr @strerror(i32 noundef %44) #7
  %54 = load i8, ptr %53, align 1
  %55 = icmp eq i8 %54, 0
  br i1 %55, label %59, label %56

56:                                               ; preds = %52
  %57 = call ptr @strerror(i32 noundef %44) #7
  %58 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05DNDNCJEB@?5?$CI?$CFs?$CJ?$AA@", ptr noundef %57)
  br label %59

59:                                               ; preds = %48, %52, %56, %43
  %60 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0O@IPIGCFIH@?0?5detail?$DN?$CFd?$CJ?6?$AA@", i32 noundef %45)
  switch i32 %45, label %66 [
    i32 1, label %61
    i32 7, label %72
    i32 2, label %63
    i32 3, label %65
  ]

61:                                               ; preds = %59
  %62 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0ED@FBOOFBBL@ezcat?3?5netlib?4rsl?5not?5loaded?4?5Ex@")
  br label %72

63:                                               ; preds = %59
  %64 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0DJ@EBBIFOJG@ezcat?3?5netlib?1clib?5loaded?5but?5a?5@")
  br label %72

65:                                               ; preds = %59
  br label %72

66:                                               ; preds = %59
  %67 = icmp eq i32 %45, 4
  %68 = icmp eq i32 %44, 6
  %69 = select i1 %67, i1 true, i1 %68
  br i1 %69, label %70, label %75

70:                                               ; preds = %66
  %71 = call i32 @puts(ptr nonnull dereferenceable(1) @str.2)
  br label %72

72:                                               ; preds = %59, %61, %63, %70, %65
  %73 = phi ptr [ @str.7, %61 ], [ @str.4, %65 ], [ @str.3, %70 ], [ @str.5, %63 ], [ @str.6, %59 ]
  %74 = call i32 @puts(ptr nonnull dereferenceable(1) %73)
  br label %75

75:                                               ; preds = %72, %66
  %76 = call i32 @puts(ptr nonnull dereferenceable(1) @str.8)
  br label %95

77:                                               ; preds = %40
  %78 = call i32 @ezcat_master_bringup_op(ptr noundef nonnull %1, i32 noundef %34) #7
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %81, label %80

80:                                               ; preds = %77
  call void @ezcat_master_fini(ptr noundef nonnull %1) #7
  br label %95

81:                                               ; preds = %77
  %82 = getelementptr inbounds nuw i8, ptr %1, i32 2192
  %83 = load i32, ptr %82, align 4
  %84 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0FH@LNJIIOKO@ezcat?3?5OP?0?5?$CFd?5slave?$CIs?$CJ?4?5Ctrl?$CLC?5?c@", i32 noundef %83)
  store atomic volatile i32 0, ptr @g_ezcat_stop release, align 4
  %85 = call ptr @signal(i32 noundef 2, ptr noundef nonnull @ezcat_sig_int) #7
  %86 = load atomic volatile i32, ptr @g_ezcat_stop acquire, align 4
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %88, label %92

88:                                               ; preds = %81, %88
  %89 = call zeroext i8 @RtSleepEx(i32 noundef 100) #7
  %90 = load atomic volatile i32, ptr @g_ezcat_stop acquire, align 4
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %88, label %92

92:                                               ; preds = %88, %81
  %93 = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @ezcat_master_shutdown_slaves(ptr noundef nonnull %1, i32 noundef %34) #7
  call void @ezcat_master_fini(ptr noundef nonnull %1) #7
  %94 = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  br label %95

95:                                               ; preds = %92, %80, %75
  %96 = phi i32 [ 1, %75 ], [ 1, %80 ], [ 0, %92 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #7
  ret i32 %96
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: nofree nounwind memory(read)
declare dso_local noundef ptr @getenv(ptr noundef captures(none)) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

declare dso_local void @ezcat_lowsock_list_devices() local_unnamed_addr #3

declare dso_local i32 @ezcat_master_init(ptr noundef, ptr noundef) local_unnamed_addr #3

declare dso_local i32 @ezcat_lowsock_last_open_errno() local_unnamed_addr #3

declare dso_local i32 @ezcat_lowsock_last_open_detail() local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #4

declare dso_local ptr @strerror(i32 noundef) local_unnamed_addr #3

declare dso_local i32 @ezcat_master_bringup_op(ptr noundef, i32 noundef) local_unnamed_addr #3

declare dso_local void @ezcat_master_fini(ptr noundef) local_unnamed_addr #3

declare dso_local ptr @signal(i32 noundef, ptr noundef) local_unnamed_addr #3

; Function Attrs: nofree norecurse nounwind memory(readwrite, argmem: none, target_mem0: none, target_mem1: none)
define internal void @ezcat_sig_int(i32 %0) #5 {
  store atomic volatile i32 1, ptr @g_ezcat_stop release, align 4
  ret void
}

declare dso_local zeroext i8 @RtSleepEx(i32 noundef) local_unnamed_addr #3

declare dso_local void @ezcat_master_shutdown_slaves(ptr noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #6

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nofree nounwind memory(read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree norecurse nounwind memory(readwrite, argmem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree nounwind }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "ezcat_main.c", directory: "D:\\work\\rtacc\\examples2\\ezcat")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
