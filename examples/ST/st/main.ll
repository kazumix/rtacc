; ModuleID = 'D:\work\rtacc\examples\ST\main.c'
source_filename = "D:\\work\\rtacc\\examples\\ST\\main.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$"??_C@_0BB@JIGCCBPJ@NotBool?$CI0?$CJ?5?$DN?5?$CFd?6?$AA@" = comdat any

$"??_C@_0BB@IPBJDFLK@NotBool?$CI1?$CJ?5?$DN?5?$CFd?6?$AA@" = comdat any

@"??_C@_0BB@JIGCCBPJ@NotBool?$CI0?$CJ?5?$DN?5?$CFd?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"NotBool(0) = %d\0A\00", comdat, align 1
@"??_C@_0BB@IPBJDFLK@NotBool?$CI1?$CJ?5?$DN?5?$CFd?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"NotBool(1) = %d\0A\00", comdat, align 1

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = tail call i32 @NotBool(i32 noundef 0) #3
  %2 = tail call i32 @NotBool(i32 noundef 1) #3
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BB@JIGCCBPJ@NotBool?$CI0?$CJ?5?$DN?5?$CFd?6?$AA@", i32 noundef %1)
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BB@IPBJDFLK@NotBool?$CI1?$CJ?5?$DN?5?$CFd?6?$AA@", i32 noundef %2)
  ret i32 0
}

declare dso_local i32 @NotBool(i32 noundef) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #2

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\work\\rtacc\\examples\\ST\\main.c", directory: "D:\\work\\rtacc\\examples\\ST")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)"}
