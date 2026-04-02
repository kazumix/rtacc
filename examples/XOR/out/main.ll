; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$"??_C@_0M@CCDLDBPH@0?5?$FO?50?5?$DN?5?$CFd?6?$AA@" = comdat any

$"??_C@_0M@OOJBDBGJ@0?5?$FO?51?5?$DN?5?$CFd?6?$AA@" = comdat any

$"??_C@_0M@LJJOHNJI@1?5?$FO?50?5?$DN?5?$CFd?6?$AA@" = comdat any

$"??_C@_0M@HFDEHNAG@1?5?$FO?51?5?$DN?5?$CFd?6?$AA@" = comdat any

@"??_C@_0M@CCDLDBPH@0?5?$FO?50?5?$DN?5?$CFd?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"0 ^ 0 = %d\0A\00", comdat, align 1
@"??_C@_0M@OOJBDBGJ@0?5?$FO?51?5?$DN?5?$CFd?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"0 ^ 1 = %d\0A\00", comdat, align 1
@"??_C@_0M@LJJOHNJI@1?5?$FO?50?5?$DN?5?$CFd?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"1 ^ 0 = %d\0A\00", comdat, align 1
@"??_C@_0M@HFDEHNAG@1?5?$FO?51?5?$DN?5?$CFd?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"1 ^ 1 = %d\0A\00", comdat, align 1
@str = private unnamed_addr constant [10 x i8] c"XOR test:\00", align 1

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %2 = tail call zeroext i1 @XOR_FUNC(i1 noundef zeroext false, i1 noundef zeroext false) #4
  %3 = zext i1 %2 to i32
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0M@CCDLDBPH@0?5?$FO?50?5?$DN?5?$CFd?6?$AA@", i32 noundef %3)
  %5 = tail call zeroext i1 @XOR_FUNC(i1 noundef zeroext false, i1 noundef zeroext true) #4
  %6 = zext i1 %5 to i32
  %7 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0M@OOJBDBGJ@0?5?$FO?51?5?$DN?5?$CFd?6?$AA@", i32 noundef %6)
  %8 = tail call zeroext i1 @XOR_FUNC(i1 noundef zeroext true, i1 noundef zeroext false) #4
  %9 = zext i1 %8 to i32
  %10 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0M@LJJOHNJI@1?5?$FO?50?5?$DN?5?$CFd?6?$AA@", i32 noundef %9)
  %11 = tail call zeroext i1 @XOR_FUNC(i1 noundef zeroext true, i1 noundef zeroext true) #4
  %12 = zext i1 %11 to i32
  %13 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0M@HFDEHNAG@1?5?$FO?51?5?$DN?5?$CFd?6?$AA@", i32 noundef %12)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

declare dso_local zeroext i1 @XOR_FUNC(i1 noundef zeroext, i1 noundef zeroext) local_unnamed_addr #2

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
!1 = !DIFile(filename: "main.c", directory: "D:\\work\\rtacc\\examples\\XOR")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
