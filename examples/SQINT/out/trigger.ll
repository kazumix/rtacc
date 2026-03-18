; ModuleID = '..\PLCP\trigger.c'
source_filename = "..\\PLCP\\trigger.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.CONTAINER_TAGS = type <{ ptr, i32, %union.anon, i8, i8, ptr, ptr, ptr, ptr }>
%union.anon = type { i32 }

$LibVersion_0x0701 = comdat any

$"??_C@_07DFGIDBBA@Control?$AA@" = comdat any

$"??_C@_04FIMCAEDB@Trig?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@"??_C@_07DFGIDBBA@Control?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"Control\00", comdat, align 1
@trigger = dso_local global [2 x %struct.CONTAINER_TAGS] [%struct.CONTAINER_TAGS <{ ptr @"??_C@_07DFGIDBBA@Control?$AA@", i32 7, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS zeroinitializer], align 1
@"??_C@_04FIMCAEDB@Trig?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"Trig\00", comdat, align 1

; Function Attrs: nounwind
define dso_local noundef ptr @Trigger_TagInit(ptr noundef %0) local_unnamed_addr #0 {
  %2 = tail call dereferenceable_or_null(8) ptr @malloc(i32 noundef 8) #6
  store ptr %0, ptr %2, align 4
  %3 = getelementptr inbounds nuw i8, ptr %2, i32 4
  store i32 0, ptr %3, align 4
  %4 = tail call i32 @EgTagWriteByIndex(ptr noundef %0, ptr noundef nonnull %3, i16 noundef zeroext 4) #7
  ret ptr %2
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare dso_local noalias noundef ptr @malloc(i32 noundef) local_unnamed_addr #1

declare dllimport i32 @EgTagWriteByIndex(ptr noundef, ptr noundef, i16 noundef zeroext) local_unnamed_addr #2

; Function Attrs: mustprogress nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define dso_local void @Trigger_TagClear(ptr noundef captures(address_is_null) %0) local_unnamed_addr #3 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %4, label %3

3:                                                ; preds = %1
  tail call void @free(ptr noundef nonnull %0)
  br label %4

4:                                                ; preds = %3, %1
  ret void
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare dso_local void @free(ptr allocptr noundef captures(none)) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local zeroext range(i8 0, 2) i8 @Trigger_TagCheck(ptr noundef %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %3 = load i32, ptr %2, align 4
  %4 = load ptr, ptr %0, align 4
  %5 = tail call i32 @EgTagReadByIndex(ptr noundef %4, ptr noundef nonnull %2, i16 noundef zeroext 4) #7
  %6 = load i32, ptr %2, align 4
  %7 = icmp ne i32 %3, %6
  %8 = zext i1 %7 to i8
  ret i8 %8
}

declare dllimport i32 @EgTagReadByIndex(ptr noundef, ptr noundef, i16 noundef zeroext) local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @Trigger_TagFinished(ptr noundef initializes((4, 8)) %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i32 0, ptr %2, align 4
  %3 = load ptr, ptr %0, align 4
  %4 = tail call i32 @EgTagWriteByIndex(ptr noundef %3, ptr noundef nonnull %2, i16 noundef zeroext 4) #7
  ret void
}

; Function Attrs: noreturn nounwind
define dso_local void @Trigger_DetectThread() #5 {
  %1 = tail call i32 @Property_Get_Interval() #7
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @trigger, i32 26), align 1
  %3 = tail call zeroext i16 @GetRtThreadHandles(i8 noundef zeroext 0) #7
  %4 = tail call zeroext i8 @CatalogRtHandle(i16 noundef zeroext 0, i16 noundef zeroext %3, ptr noundef nonnull @"??_C@_04FIMCAEDB@Trig?$AA@") #7
  %5 = tail call dereferenceable_or_null(8) ptr @malloc(i32 noundef 8) #6
  store ptr %2, ptr %5, align 4
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 4
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %0, %34
  %8 = phi ptr [ %35, %34 ], [ %2, %0 ]
  %9 = tail call i32 @EgTagWriteByIndex(ptr noundef %8, ptr noundef nonnull %6, i16 noundef zeroext 4) #7
  br label %10

10:                                               ; preds = %20, %7
  %11 = tail call zeroext i8 @RtSleepEx(i32 noundef %1) #7
  %12 = tail call zeroext i8 @Indicate_Run_Get() #7
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %20, label %14

14:                                               ; preds = %10
  tail call void @Indicate_Live() #7
  %15 = load i32, ptr %6, align 4
  %16 = load ptr, ptr %5, align 4
  %17 = tail call i32 @EgTagReadByIndex(ptr noundef %16, ptr noundef nonnull %6, i16 noundef zeroext 4) #7
  %18 = load i32, ptr %6, align 4
  %19 = icmp eq i32 %15, %18
  br i1 %19, label %20, label %21

20:                                               ; preds = %14, %10
  br label %10

21:                                               ; preds = %14
  switch i32 %18, label %34 [
    i32 100, label %22
    i32 101, label %23
    i32 110, label %24
    i32 111, label %25
    i32 120, label %26
    i32 122, label %27
    i32 123, label %28
    i32 200, label %29
    i32 201, label %30
    i32 300, label %31
    i32 301, label %32
    i32 302, label %33
  ]

22:                                               ; preds = %21
  tail call void @Api_PlcStop() #7
  br label %34

23:                                               ; preds = %21
  tail call void @Api_PlcReset() #7
  br label %34

24:                                               ; preds = %21
  tail call void @Api_PlcStartCold() #7
  br label %34

25:                                               ; preds = %21
  tail call void @Api_PlcStartWarm() #7
  br label %34

26:                                               ; preds = %21
  tail call void @Api_PlcDownload() #7
  br label %34

27:                                               ; preds = %21
  tail call void @Api_PlcRetainSave() #7
  br label %34

28:                                               ; preds = %21
  tail call void @Api_PlcRetainLoad() #7
  br label %34

29:                                               ; preds = %21
  tail call void @Api_DumpLog() #7
  br label %34

30:                                               ; preds = %21
  tail call void @Api_PlcDisasm() #7
  br label %34

31:                                               ; preds = %21
  tail call void @Api_StepEnable() #7
  br label %34

32:                                               ; preds = %21
  tail call void @Api_StepDisable() #7
  br label %34

33:                                               ; preds = %21
  tail call void @Api_StepStep() #7
  br label %34

34:                                               ; preds = %21, %33, %32, %31, %30, %29, %28, %27, %26, %25, %24, %23, %22
  store i32 0, ptr %6, align 4
  %35 = load ptr, ptr %5, align 4
  br label %7
}

declare dso_local i32 @Property_Get_Interval() local_unnamed_addr #2

declare dso_local zeroext i8 @CatalogRtHandle(i16 noundef zeroext, i16 noundef zeroext, ptr noundef) local_unnamed_addr #2

declare dso_local zeroext i16 @GetRtThreadHandles(i8 noundef zeroext) local_unnamed_addr #2

declare dso_local zeroext i8 @RtSleepEx(i32 noundef) local_unnamed_addr #2

declare dso_local zeroext i8 @Indicate_Run_Get() local_unnamed_addr #2

declare dso_local void @Indicate_Live() local_unnamed_addr #2

declare dso_local void @Api_PlcStop() local_unnamed_addr #2

declare dso_local void @Api_PlcReset() local_unnamed_addr #2

declare dso_local void @Api_PlcStartCold() local_unnamed_addr #2

declare dso_local void @Api_PlcStartWarm() local_unnamed_addr #2

declare dso_local void @Api_PlcDownload() local_unnamed_addr #2

declare dso_local void @Api_PlcRetainSave() local_unnamed_addr #2

declare dso_local void @Api_PlcRetainLoad() local_unnamed_addr #2

declare dso_local void @Api_DumpLog() local_unnamed_addr #2

declare dso_local void @Api_PlcDisasm() local_unnamed_addr #2

declare dso_local void @Api_StepEnable() local_unnamed_addr #2

declare dso_local void @Api_StepDisable() local_unnamed_addr #2

declare dso_local void @Api_StepStep() local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local zeroext i8 @Trigger_Init() local_unnamed_addr #0 {
  %1 = tail call zeroext i8 @Container_CreateTagsFromList(ptr noundef nonnull @trigger) #7
  %2 = tail call i32 @Property_Get_Priority() #7
  %3 = trunc i32 %2 to i8
  %4 = add i8 %3, 6
  %5 = tail call zeroext i16 @CreateRtThread(i8 noundef zeroext %4, ptr noundef nonnull @Trigger_DetectThread, i32 noundef 4096, ptr noundef null) #7
  ret i8 %1
}

declare dso_local zeroext i8 @Container_CreateTagsFromList(ptr noundef) local_unnamed_addr #2

declare dso_local zeroext i16 @CreateRtThread(i8 noundef zeroext, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #2

declare dso_local i32 @Property_Get_Priority() local_unnamed_addr #2

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\trigger.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
