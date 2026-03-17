; ModuleID = 'sqtbl.c'
source_filename = "sqtbl.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_05KKOJADCM@SQTBL?$AA@" = comdat any

$"??_C@_06OPMGJGJF@SCRIPT?$AA@" = comdat any

$"??_C@_0BA@EIHPONHL@VER?405_00_00_00?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@sqtbl = dso_local local_unnamed_addr global ptr null, align 4
@hSQTBLmem = dso_local local_unnamed_addr global i16 0, align 2
@"??_C@_05KKOJADCM@SQTBL?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"SQTBL\00", comdat, align 1
@"??_C@_06OPMGJGJF@SCRIPT?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"SCRIPT\00", comdat, align 1
@"??_C@_0BA@EIHPONHL@VER?405_00_00_00?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"VER.05_00_00_00\00", comdat, align 1

; Function Attrs: nounwind
define dso_local range(i32 -1, 1) i32 @SQTBL_Create() local_unnamed_addr #0 {
  %1 = tail call ptr @AllocateRtMemory(i32 noundef 4096) #5
  store ptr %1, ptr @sqtbl, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %3, label %4

3:                                                ; preds = %0
  tail call void @exit(i32 noundef 0) #6
  unreachable

4:                                                ; preds = %0
  %5 = tail call zeroext i16 @CreateRtMemoryHandle(ptr noundef nonnull %1, i32 noundef 4096) #5
  store i16 %5, ptr @hSQTBLmem, align 2
  %6 = tail call zeroext i8 @Catalog(i16 noundef zeroext 0, i16 noundef zeroext %5, ptr noundef nonnull @"??_C@_05KKOJADCM@SQTBL?$AA@") #5
  %7 = load ptr, ptr @sqtbl, align 4
  %8 = icmp eq ptr %7, null
  br i1 %8, label %10, label %9

9:                                                ; preds = %4
  tail call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(4096) %7, i8 0, i32 4096, i1 false)
  br label %10

10:                                               ; preds = %9, %4
  %11 = sext i1 %8 to i32
  ret i32 %11
}

declare dso_local ptr @AllocateRtMemory(i32 noundef) local_unnamed_addr #1

; Function Attrs: nofree noreturn
declare dso_local void @exit(i32 noundef) local_unnamed_addr #2

declare dso_local zeroext i16 @CreateRtMemoryHandle(ptr noundef, i32 noundef) local_unnamed_addr #1

declare dso_local zeroext i8 @Catalog(i16 noundef zeroext, i16 noundef zeroext, ptr noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #3

; Function Attrs: nounwind
define dso_local void @SQTBL_Initialize() local_unnamed_addr #0 {
  %1 = load ptr, ptr @sqtbl, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %24, label %3

3:                                                ; preds = %0
  %4 = tail call zeroext i8 @Config_Get_TraceMode() #5
  %5 = load ptr, ptr @sqtbl, align 4
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 40
  store i8 %4, ptr %6, align 1
  %7 = tail call zeroext i8 @Config_Get_StepMode() #5
  %8 = load ptr, ptr @sqtbl, align 4
  %9 = getelementptr inbounds nuw i8, ptr %8, i32 33
  store i8 %7, ptr %9, align 1
  %10 = tail call zeroext i8 @Config_Get_PrintMode() #5
  %11 = load ptr, ptr @sqtbl, align 4
  %12 = getelementptr inbounds nuw i8, ptr %11, i32 37
  store i8 %10, ptr %12, align 1
  %13 = tail call zeroext i8 @Config_Get_RemoteMode() #5
  %14 = load ptr, ptr @sqtbl, align 4
  %15 = getelementptr inbounds nuw i8, ptr %14, i32 38
  store i8 %13, ptr %15, align 1
  %16 = tail call zeroext i8 @Config_Get_RunMode() #5
  switch i8 %16, label %21 [
    i8 0, label %17
    i8 1, label %19
  ]

17:                                               ; preds = %3
  %18 = load ptr, ptr @sqtbl, align 4
  store i32 4544581, ptr %18, align 1
  br label %21

19:                                               ; preds = %3
  %20 = load ptr, ptr @sqtbl, align 4
  tail call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(7) %20, ptr noundef nonnull align 1 dereferenceable(7) @"??_C@_06OPMGJGJF@SCRIPT?$AA@", i32 7, i1 false) #5
  br label %21

21:                                               ; preds = %3, %19, %17
  %22 = load ptr, ptr @sqtbl, align 4
  %23 = getelementptr inbounds nuw i8, ptr %22, i32 16
  tail call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(16) %23, ptr noundef nonnull align 1 dereferenceable(16) @"??_C@_0BA@EIHPONHL@VER?405_00_00_00?$AA@", i32 16, i1 false) #5
  br label %24

24:                                               ; preds = %21, %0
  ret void
}

declare dso_local zeroext i8 @Config_Get_TraceMode() local_unnamed_addr #1

declare dso_local zeroext i8 @Config_Get_StepMode() local_unnamed_addr #1

declare dso_local zeroext i8 @Config_Get_PrintMode() local_unnamed_addr #1

declare dso_local zeroext i8 @Config_Get_RemoteMode() local_unnamed_addr #1

declare dso_local zeroext i8 @Config_Get_RunMode() local_unnamed_addr #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #4

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree noreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "sqtbl.c", directory: "D:\\work\\rtacc\\examples\\PLCP")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)"}
