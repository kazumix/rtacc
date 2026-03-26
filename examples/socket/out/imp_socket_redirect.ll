; ModuleID = '..\imp_socket_redirect.c'
source_filename = "..\\imp_socket_redirect.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

; Function Attrs: nounwind
define dso_local i32 @socket(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = tail call i32 @"\01__imp__socket"(i32 noundef %0, i32 noundef %1, i32 noundef %2) #2
  ret i32 %4
}

declare dso_local i32 @"\01__imp__socket"(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @connect(i32 noundef %0, ptr noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = tail call i32 @"\01__imp__connect"(i32 noundef %0, ptr noundef %1, i32 noundef %2) #2
  ret i32 %4
}

declare dso_local i32 @"\01__imp__connect"(i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @getsockname(i32 noundef %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #0 {
  %4 = tail call i32 @"\01__imp__getsockname"(i32 noundef %0, ptr noundef %1, ptr noundef %2) #2
  ret i32 %4
}

declare dso_local i32 @"\01__imp__getsockname"(i32 noundef, ptr noundef, ptr noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local ptr @inet_ntoa(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call ptr @"\01__imp__inet_ntoa"(i32 noundef %0) #2
  ret ptr %2
}

declare dso_local ptr @"\01__imp__inet_ntoa"(i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @shutdown(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = tail call i32 @"\01__imp__shutdown"(i32 noundef %0, i32 noundef %1) #2
  ret i32 %3
}

declare dso_local i32 @"\01__imp__shutdown"(i32 noundef, i32 noundef) local_unnamed_addr #1

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\imp_socket_redirect.c", directory: "D:\\work\\rtacc\\examples\\socket")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
