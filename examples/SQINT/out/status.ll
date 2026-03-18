; ModuleID = '..\PLCP\status.c'
source_filename = "..\\PLCP\\status.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_04MDHMLCKF@STOP?$AA@" = comdat any

$"??_C@_00CNPNBAHC@?$AA@" = comdat any

$"??_C@_05KACKNMMA@READY?$AA@" = comdat any

$"??_C@_04DBNKAKHO@WAIT?$AA@" = comdat any

$"??_C@_03LLDCGJBK@RUN?$AA@" = comdat any

$"??_C@_04NFKBMIMG@HALT?$AA@" = comdat any

$"??_C@_0O@PIFKHJEH@errorlog?5list?$AA@" = comdat any

$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@" = comdat any

$"??_C@_0L@KDAGFJJM@logic?5list?$AA@" = comdat any

$"??_C@_0BA@JNEKCDIC@inifile?5feature?$AA@" = comdat any

$"??_C@_0BA@FANHOABO@mnmfile?5feature?$AA@" = comdat any

$"??_C@_0O@LFCAOOJB@internalclock?$AA@" = comdat any

$"??_C@_0P@HMNLIEBD@engine?5feature?$AA@" = comdat any

$"??_C@_0BD@OAIJAOHP@bluescreen?5feature?$AA@" = comdat any

$"??_C@_0BE@CDDLLKOB@instruction?5feature?$AA@" = comdat any

$"??_C@_0O@GKLGJKNL@pause?5feature?$AA@" = comdat any

$"??_C@_0N@JGCMANAB@step?5feature?$AA@" = comdat any

$"??_C@_0BB@IHCPDHLN@watchdog?5feature?$AA@" = comdat any

$"??_C@_0M@HFBCMFOB@api?5feature?$AA@" = comdat any

$"??_C@_0BC@JAJMGGA@plc?5control?5state?$AA@" = comdat any

$"??_C@_0P@DCJKHNDF@retain?5feature?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@"??_C@_04MDHMLCKF@STOP?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"STOP\00", comdat, align 1
@"??_C@_00CNPNBAHC@?$AA@" = linkonce_odr dso_local unnamed_addr constant [1 x i8] zeroinitializer, comdat, align 1
@"??_C@_05KACKNMMA@READY?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"READY\00", comdat, align 1
@"??_C@_04DBNKAKHO@WAIT?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"WAIT\00", comdat, align 1
@"??_C@_03LLDCGJBK@RUN?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"RUN\00", comdat, align 1
@"??_C@_04NFKBMIMG@HALT?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"HALT\00", comdat, align 1
@__const.Status_Topic.topic = private unnamed_addr constant [9 x ptr] [ptr @"??_C@_04MDHMLCKF@STOP?$AA@", ptr @"??_C@_00CNPNBAHC@?$AA@", ptr @"??_C@_05KACKNMMA@READY?$AA@", ptr @"??_C@_00CNPNBAHC@?$AA@", ptr @"??_C@_04DBNKAKHO@WAIT?$AA@", ptr @"??_C@_00CNPNBAHC@?$AA@", ptr @"??_C@_03LLDCGJBK@RUN?$AA@", ptr @"??_C@_00CNPNBAHC@?$AA@", ptr @"??_C@_04NFKBMIMG@HALT?$AA@"], align 4
@status_errorlog = external dso_local local_unnamed_addr global i32, align 4
@"??_C@_0O@PIFKHJEH@errorlog?5list?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"errorlog list\00", comdat, align 1
@"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"  %-20s ... %s \0A\00", comdat, align 1
@status_logic = external dso_local local_unnamed_addr global i32, align 4
@"??_C@_0L@KDAGFJJM@logic?5list?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"logic list\00", comdat, align 1
@status_inifile = external dso_local local_unnamed_addr global i32, align 4
@"??_C@_0BA@JNEKCDIC@inifile?5feature?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"inifile feature\00", comdat, align 1
@status_mnmfile = external dso_local local_unnamed_addr global i32, align 4
@"??_C@_0BA@FANHOABO@mnmfile?5feature?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"mnmfile feature\00", comdat, align 1
@status_internalclock = external dso_local local_unnamed_addr global i32, align 4
@"??_C@_0O@LFCAOOJB@internalclock?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"internalclock\00", comdat, align 1
@status_engine = external dso_local local_unnamed_addr global i32, align 4
@"??_C@_0P@HMNLIEBD@engine?5feature?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"engine feature\00", comdat, align 1
@status_bluescreen = external dso_local local_unnamed_addr global i32, align 4
@"??_C@_0BD@OAIJAOHP@bluescreen?5feature?$AA@" = linkonce_odr dso_local unnamed_addr constant [19 x i8] c"bluescreen feature\00", comdat, align 1
@status_instruction = external dso_local local_unnamed_addr global i32, align 4
@"??_C@_0BE@CDDLLKOB@instruction?5feature?$AA@" = linkonce_odr dso_local unnamed_addr constant [20 x i8] c"instruction feature\00", comdat, align 1
@status_pause = external dso_local local_unnamed_addr global i32, align 4
@"??_C@_0O@GKLGJKNL@pause?5feature?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"pause feature\00", comdat, align 1
@status_step = external dso_local local_unnamed_addr global i32, align 4
@"??_C@_0N@JGCMANAB@step?5feature?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"step feature\00", comdat, align 1
@status_watchdog = external dso_local local_unnamed_addr global i32, align 4
@"??_C@_0BB@IHCPDHLN@watchdog?5feature?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"watchdog feature\00", comdat, align 1
@status_api = external dso_local local_unnamed_addr global i32, align 4
@"??_C@_0M@HFBCMFOB@api?5feature?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"api feature\00", comdat, align 1
@status_plccontrol = external dso_local local_unnamed_addr global i32, align 4
@"??_C@_0BC@JAJMGGA@plc?5control?5state?$AA@" = linkonce_odr dso_local unnamed_addr constant [18 x i8] c"plc control state\00", comdat, align 1
@status_retain = external dso_local local_unnamed_addr global i32, align 4
@"??_C@_0P@DCJKHNDF@retain?5feature?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"retain feature\00", comdat, align 1
@str = private unnamed_addr constant [12 x i8] c"Status list\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local ptr @Status_Topic(i32 noundef %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw ptr, ptr @__const.Status_Topic.topic, i32 %0
  %3 = load ptr, ptr %2, align 4
  ret ptr %3
}

; Function Attrs: nofree nounwind
define dso_local void @Status_Display() local_unnamed_addr #1 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %2 = load i32, ptr @status_errorlog, align 4
  %3 = getelementptr inbounds nuw ptr, ptr @__const.Status_Topic.topic, i32 %2
  %4 = load ptr, ptr %3, align 4
  %5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@", ptr noundef nonnull @"??_C@_0O@PIFKHJEH@errorlog?5list?$AA@", ptr noundef %4)
  %6 = load i32, ptr @status_logic, align 4
  %7 = getelementptr inbounds nuw ptr, ptr @__const.Status_Topic.topic, i32 %6
  %8 = load ptr, ptr %7, align 4
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@", ptr noundef nonnull @"??_C@_0L@KDAGFJJM@logic?5list?$AA@", ptr noundef %8)
  %10 = load i32, ptr @status_inifile, align 4
  %11 = getelementptr inbounds nuw ptr, ptr @__const.Status_Topic.topic, i32 %10
  %12 = load ptr, ptr %11, align 4
  %13 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@", ptr noundef nonnull @"??_C@_0BA@JNEKCDIC@inifile?5feature?$AA@", ptr noundef %12)
  %14 = load i32, ptr @status_mnmfile, align 4
  %15 = getelementptr inbounds nuw ptr, ptr @__const.Status_Topic.topic, i32 %14
  %16 = load ptr, ptr %15, align 4
  %17 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@", ptr noundef nonnull @"??_C@_0BA@FANHOABO@mnmfile?5feature?$AA@", ptr noundef %16)
  %18 = load i32, ptr @status_internalclock, align 4
  %19 = getelementptr inbounds nuw ptr, ptr @__const.Status_Topic.topic, i32 %18
  %20 = load ptr, ptr %19, align 4
  %21 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@", ptr noundef nonnull @"??_C@_0O@LFCAOOJB@internalclock?$AA@", ptr noundef %20)
  %22 = load i32, ptr @status_engine, align 4
  %23 = getelementptr inbounds nuw ptr, ptr @__const.Status_Topic.topic, i32 %22
  %24 = load ptr, ptr %23, align 4
  %25 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@", ptr noundef nonnull @"??_C@_0P@HMNLIEBD@engine?5feature?$AA@", ptr noundef %24)
  %26 = load i32, ptr @status_bluescreen, align 4
  %27 = getelementptr inbounds nuw ptr, ptr @__const.Status_Topic.topic, i32 %26
  %28 = load ptr, ptr %27, align 4
  %29 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@", ptr noundef nonnull @"??_C@_0BD@OAIJAOHP@bluescreen?5feature?$AA@", ptr noundef %28)
  %30 = load i32, ptr @status_instruction, align 4
  %31 = getelementptr inbounds nuw ptr, ptr @__const.Status_Topic.topic, i32 %30
  %32 = load ptr, ptr %31, align 4
  %33 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@", ptr noundef nonnull @"??_C@_0BE@CDDLLKOB@instruction?5feature?$AA@", ptr noundef %32)
  %34 = load i32, ptr @status_pause, align 4
  %35 = getelementptr inbounds nuw ptr, ptr @__const.Status_Topic.topic, i32 %34
  %36 = load ptr, ptr %35, align 4
  %37 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@", ptr noundef nonnull @"??_C@_0O@GKLGJKNL@pause?5feature?$AA@", ptr noundef %36)
  %38 = load i32, ptr @status_step, align 4
  %39 = getelementptr inbounds nuw ptr, ptr @__const.Status_Topic.topic, i32 %38
  %40 = load ptr, ptr %39, align 4
  %41 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@", ptr noundef nonnull @"??_C@_0N@JGCMANAB@step?5feature?$AA@", ptr noundef %40)
  %42 = load i32, ptr @status_watchdog, align 4
  %43 = getelementptr inbounds nuw ptr, ptr @__const.Status_Topic.topic, i32 %42
  %44 = load ptr, ptr %43, align 4
  %45 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@", ptr noundef nonnull @"??_C@_0BB@IHCPDHLN@watchdog?5feature?$AA@", ptr noundef %44)
  %46 = load i32, ptr @status_api, align 4
  %47 = getelementptr inbounds nuw ptr, ptr @__const.Status_Topic.topic, i32 %46
  %48 = load ptr, ptr %47, align 4
  %49 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@", ptr noundef nonnull @"??_C@_0M@HFBCMFOB@api?5feature?$AA@", ptr noundef %48)
  %50 = load i32, ptr @status_plccontrol, align 4
  %51 = getelementptr inbounds nuw ptr, ptr @__const.Status_Topic.topic, i32 %50
  %52 = load ptr, ptr %51, align 4
  %53 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@", ptr noundef nonnull @"??_C@_0BC@JAJMGGA@plc?5control?5state?$AA@", ptr noundef %52)
  %54 = load i32, ptr @status_retain, align 4
  %55 = getelementptr inbounds nuw ptr, ptr @__const.Status_Topic.topic, i32 %54
  %56 = load ptr, ptr %55, align 4
  %57 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@", ptr noundef nonnull @"??_C@_0P@DCJKHNDF@retain?5feature?$AA@", ptr noundef %56)
  ret void
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @Status_DetailDisplay() local_unnamed_addr #3 {
  tail call void @Status_Display()
  tail call void @Heap_Display() #6
  tail call void @Basicfunction_Display() #6
  tail call void @Functionblock_Display() #6
  tail call void @Poufile_Display() #6
  tail call void @Logic_Display() #6
  tail call void @Label_Display() #6
  tail call void @Userfunction_Display() #6
  tail call void @Variable_Display() #6
  %1 = tail call i32 @Errorlog_Count() #6
  %2 = icmp sgt i32 %1, 0
  br i1 %2, label %3, label %4

3:                                                ; preds = %0
  tail call void @Errorlog_Display(ptr noundef nonnull @"??_C@_00CNPNBAHC@?$AA@") #6
  br label %4

4:                                                ; preds = %3, %0
  ret void
}

declare dso_local void @Heap_Display() local_unnamed_addr #4

declare dso_local void @Basicfunction_Display() local_unnamed_addr #4

declare dso_local void @Functionblock_Display() local_unnamed_addr #4

declare dso_local void @Poufile_Display() local_unnamed_addr #4

declare dso_local void @Logic_Display() local_unnamed_addr #4

declare dso_local void @Label_Display() local_unnamed_addr #4

declare dso_local void @Userfunction_Display() local_unnamed_addr #4

declare dso_local void @Variable_Display() local_unnamed_addr #4

declare dso_local i32 @Errorlog_Count() local_unnamed_addr #4

declare dso_local void @Errorlog_Display(ptr noundef) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #5

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\status.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
