; ModuleID = 'socket_shim.c'
source_filename = "socket_shim.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }

$"??_C@_0BP@CDPEGKDI@?$FLshim?$FN?5socket?5failed?5errno?$DN?$CFd?6?$AA@" = comdat any

$"??_C@_0CE@LCBCMMCB@?$FLshim?$FN?5getsockname?5failed?5errno?$DN@" = comdat any

$"??_C@_0CJ@MHIOOKOP@?$FLshim?$FN?5default?9route?5local?5ip?5?$CIt@" = comdat any

@"??_C@_0BP@CDPEGKDI@?$FLshim?$FN?5socket?5failed?5errno?$DN?$CFd?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [31 x i8] c"[shim] socket failed errno=%d\0A\00", comdat, align 1
@"??_C@_0CE@LCBCMMCB@?$FLshim?$FN?5getsockname?5failed?5errno?$DN@" = linkonce_odr dso_local unnamed_addr constant [36 x i8] c"[shim] getsockname failed errno=%d\0A\00", comdat, align 1
@"??_C@_0CJ@MHIOOKOP@?$FLshim?$FN?5default?9route?5local?5ip?5?$CIt@" = linkonce_odr dso_local unnamed_addr constant [41 x i8] c"[shim] default-route local ip (tcp): %s\0A\00", comdat, align 1
@str = private unnamed_addr constant [24 x i8] c"[shim] inet_ntoa failed\00", align 1

; Function Attrs: nounwind
define dso_local noundef i32 @intime_socket_demo() local_unnamed_addr #0 {
  %1 = alloca %struct.sockaddr_in, align 1
  %2 = alloca %struct.sockaddr_in, align 1
  %3 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #6
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #6
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #6
  store i32 16, ptr %3, align 4
  %4 = tail call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #6
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %6, label %10

6:                                                ; preds = %0
  %7 = tail call ptr @_thread_ptr() #6
  %8 = load i32, ptr %7, align 4
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BP@CDPEGKDI@?$FLshim?$FN?5socket?5failed?5errno?$DN?$CFd?6?$AA@", i32 noundef %8)
  br label %35

10:                                               ; preds = %0
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(16) %1, i8 0, i32 16, i1 false)
  %11 = getelementptr inbounds nuw i8, ptr %1, i32 1
  store i8 2, ptr %11, align 1
  %12 = tail call zeroext i16 @htons(i16 noundef zeroext 80) #6
  %13 = getelementptr inbounds nuw i8, ptr %1, i32 2
  store i16 %12, ptr %13, align 1
  %14 = tail call i32 @htonl(i32 noundef 134744072) #6
  %15 = getelementptr inbounds nuw i8, ptr %1, i32 4
  store i32 %14, ptr %15, align 1
  %16 = call i32 @connect(i32 noundef %4, ptr noundef nonnull %1, i32 noundef 16) #6
  %17 = call i32 @getsockname(i32 noundef %4, ptr noundef nonnull %2, ptr noundef nonnull %3) #6
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %24, label %19

19:                                               ; preds = %10
  %20 = call ptr @_thread_ptr() #6
  %21 = load i32, ptr %20, align 4
  %22 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CE@LCBCMMCB@?$FLshim?$FN?5getsockname?5failed?5errno?$DN@", i32 noundef %21)
  %23 = call i32 @shutdown(i32 noundef %4, i32 noundef 2) #6
  br label %35

24:                                               ; preds = %10
  %25 = getelementptr inbounds nuw i8, ptr %2, i32 4
  %26 = load i32, ptr %25, align 1
  %27 = call ptr @inet_ntoa(i32 %26) #6
  %28 = icmp eq ptr %27, null
  br i1 %28, label %31, label %29

29:                                               ; preds = %24
  %30 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CJ@MHIOOKOP@?$FLshim?$FN?5default?9route?5local?5ip?5?$CIt@", ptr noundef nonnull %27)
  br label %33

31:                                               ; preds = %24
  %32 = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %33

33:                                               ; preds = %31, %29
  %34 = call i32 @shutdown(i32 noundef %4, i32 noundef 2) #6
  br label %35

35:                                               ; preds = %6, %19, %33
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #6
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #6
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #6
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

declare dso_local i32 @socket(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #3

declare dso_local ptr @_thread_ptr() local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #4

declare dso_local zeroext i16 @htons(i16 noundef zeroext) local_unnamed_addr #2

declare dso_local i32 @htonl(i32 noundef) local_unnamed_addr #2

declare dso_local i32 @connect(i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #2

declare dso_local i32 @getsockname(i32 noundef, ptr noundef, ptr noundef) local_unnamed_addr #2

declare dso_local i32 @shutdown(i32 noundef, i32 noundef) local_unnamed_addr #2

declare dso_local ptr @inet_ntoa(i32) local_unnamed_addr #2

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
!1 = !DIFile(filename: "socket_shim.c", directory: "D:\\work\\rtacc\\examples\\python")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
