; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4

; Function Attrs: nounwind
define dso_local range(i32 -1, 1) i32 @main(i32 noundef %0, ptr noundef readnone captures(none) %1) local_unnamed_addr #0 {
  tail call void @IlRtedgeTags_Init() #2
  %3 = tail call zeroext i16 @CreateRtThread(i8 noundef zeroext -86, ptr noundef nonnull @ScanThread, i32 noundef 8192, ptr noundef null) #2
  %4 = icmp eq i16 %3, -1
  br i1 %4, label %7, label %5

5:                                                ; preds = %2
  %6 = tail call zeroext i8 @SuspendRtThread(i16 noundef zeroext 0) #2
  br label %7

7:                                                ; preds = %2, %5
  %8 = phi i32 [ 0, %5 ], [ -1, %2 ]
  ret i32 %8
}

declare dso_local void @IlRtedgeTags_Init() local_unnamed_addr #1

declare dso_local zeroext i16 @CreateRtThread(i8 noundef zeroext, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #1

declare dso_local void @ScanThread() #1

declare dso_local zeroext i8 @SuspendRtThread(i16 noundef zeroext) local_unnamed_addr #1

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "main.c", directory: "D:\\work\\rtacc\\examples\\iltimer")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
