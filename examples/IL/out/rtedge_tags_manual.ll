; ModuleID = 'd:\work\rtacc\examples\IL\rtedge_tags.c'
source_filename = "d:\\work\\rtacc\\examples\\IL\\rtedge_tags.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.il_fb_instance_desc = type { ptr, ptr, i32 }

$"??_C@_0N@OJIOACIB@BOOL?$CDStartSW?$AA@" = comdat any

$"??_C@_0L@KCHCODLI@BOOL?$CDEndSW?$AA@" = comdat any

$"??_C@_09HJPOANEL@UINT?$CDAI_1?$AA@" = comdat any

$"??_C@_0M@FDLKECOC@BOOL?$CDActive?$AA@" = comdat any

$"??_C@_0P@JLEBCDPH@BOOL?$CDLimitOver?$AA@" = comdat any

$"??_C@_0BD@MFAPEFPK@INT?$CDLimitOverCount?$AA@" = comdat any

$"??_C@_08LDCBIFIH@BOOL?$CDErr?$AA@" = comdat any

$"??_C@_0L@NHHKJFBD@BOOL?$CDTP1_Q?$AA@" = comdat any

$"??_C@_0L@MFMPDKPN@BOOL?$CDTP2_Q?$AA@" = comdat any

$"??_C@_09PFDIALPP@BOOL?$CDLED1?$AA@" = comdat any

$"??_C@_0BD@IJGJPBAE@FUNCTION?$CDCTU?$CDCTU_1?$AA@" = comdat any

$"??_C@_0BB@KKNGKHLB@FUNCTION?$CDTP?$CDTP_1?$AA@" = comdat any

$"??_C@_0BB@IBPLPEHC@FUNCTION?$CDTP?$CDTP_2?$AA@" = comdat any

$"??_C@_0O@CONIEAAG@BOOL?$CDCTU_1_CU?$AA@" = comdat any

$"??_C@_0BB@KFKIFIPE@BOOL?$CDCTU_1_RESET?$AA@" = comdat any

$"??_C@_0N@EKPILEMJ@INT?$CDCTU_1_PV?$AA@" = comdat any

$"??_C@_0N@PLIFCNF@BOOL?$CDCTU_1_Q?$AA@" = comdat any

$"??_C@_0N@FEJIKJOA@INT?$CDCTU_1_CV?$AA@" = comdat any

$"??_C@_0BE@HKBADBCF@BOOL?$CDCTU_1__prev_cu?$AA@" = comdat any

$"??_C@_0N@EBIPFNC@BOOL?$CDTP_1_IN?$AA@" = comdat any

$"??_C@_0M@BEHIIIMH@INT?$CDTP_1_PT?$AA@" = comdat any

$"??_C@_0BC@OOGKHIAJ@INT?$CDTP_1__elapsed?$AA@" = comdat any

$"??_C@_0BD@MEEJDDCF@BOOL?$CDTP_1__running?$AA@" = comdat any

$"??_C@_0M@NAKMDDEI@BOOL?$CDTP_1_Q?$AA@" = comdat any

$"??_C@_0N@EDLIIPAC@BOOL?$CDTP_2_IN?$AA@" = comdat any

$"??_C@_0M@FDNIPCBH@INT?$CDTP_2_PT?$AA@" = comdat any

$"??_C@_0BC@HHIIBOAI@INT?$CDTP_2__elapsed?$AA@" = comdat any

$"??_C@_0BD@FNKLFFCE@BOOL?$CDTP_2__running?$AA@" = comdat any

$"??_C@_0M@MCBJJMKG@BOOL?$CDTP_2_Q?$AA@" = comdat any

@k_il_rtedge_scalar_specs = internal unnamed_addr constant [10 x ptr] [ptr @"??_C@_0N@OJIOACIB@BOOL?$CDStartSW?$AA@", ptr @"??_C@_0L@KCHCODLI@BOOL?$CDEndSW?$AA@", ptr @"??_C@_09HJPOANEL@UINT?$CDAI_1?$AA@", ptr @"??_C@_0M@FDLKECOC@BOOL?$CDActive?$AA@", ptr @"??_C@_0P@JLEBCDPH@BOOL?$CDLimitOver?$AA@", ptr @"??_C@_0BD@MFAPEFPK@INT?$CDLimitOverCount?$AA@", ptr @"??_C@_08LDCBIFIH@BOOL?$CDErr?$AA@", ptr @"??_C@_0L@NHHKJFBD@BOOL?$CDTP1_Q?$AA@", ptr @"??_C@_0L@MFMPDKPN@BOOL?$CDTP2_Q?$AA@", ptr @"??_C@_09PFDIALPP@BOOL?$CDLED1?$AA@"], align 4
@k_il_fb_instances = internal constant [3 x %struct.il_fb_instance_desc] [%struct.il_fb_instance_desc { ptr @"??_C@_0BD@IJGJPBAE@FUNCTION?$CDCTU?$CDCTU_1?$AA@", ptr @k_il_rtedge_ctu1_pin_tags, i32 6 }, %struct.il_fb_instance_desc { ptr @"??_C@_0BB@KKNGKHLB@FUNCTION?$CDTP?$CDTP_1?$AA@", ptr @k_il_rtedge_tp1_pin_tags, i32 5 }, %struct.il_fb_instance_desc { ptr @"??_C@_0BB@IBPLPEHC@FUNCTION?$CDTP?$CDTP_2?$AA@", ptr @k_il_rtedge_tp2_pin_tags, i32 5 }], align 4
@"??_C@_0N@OJIOACIB@BOOL?$CDStartSW?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"BOOL#StartSW\00", comdat, align 1
@"??_C@_0L@KCHCODLI@BOOL?$CDEndSW?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"BOOL#EndSW\00", comdat, align 1
@"??_C@_09HJPOANEL@UINT?$CDAI_1?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"UINT#AI_1\00", comdat, align 1
@"??_C@_0M@FDLKECOC@BOOL?$CDActive?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"BOOL#Active\00", comdat, align 1
@"??_C@_0P@JLEBCDPH@BOOL?$CDLimitOver?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"BOOL#LimitOver\00", comdat, align 1
@"??_C@_0BD@MFAPEFPK@INT?$CDLimitOverCount?$AA@" = linkonce_odr dso_local unnamed_addr constant [19 x i8] c"INT#LimitOverCount\00", comdat, align 1
@"??_C@_08LDCBIFIH@BOOL?$CDErr?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"BOOL#Err\00", comdat, align 1
@"??_C@_0L@NHHKJFBD@BOOL?$CDTP1_Q?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"BOOL#TP1_Q\00", comdat, align 1
@"??_C@_0L@MFMPDKPN@BOOL?$CDTP2_Q?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"BOOL#TP2_Q\00", comdat, align 1
@"??_C@_09PFDIALPP@BOOL?$CDLED1?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"BOOL#LED1\00", comdat, align 1
@"??_C@_0BD@IJGJPBAE@FUNCTION?$CDCTU?$CDCTU_1?$AA@" = linkonce_odr dso_local unnamed_addr constant [19 x i8] c"FUNCTION#CTU#CTU_1\00", comdat, align 1
@k_il_rtedge_ctu1_pin_tags = internal constant [6 x ptr] [ptr @"??_C@_0O@CONIEAAG@BOOL?$CDCTU_1_CU?$AA@", ptr @"??_C@_0BB@KFKIFIPE@BOOL?$CDCTU_1_RESET?$AA@", ptr @"??_C@_0N@EKPILEMJ@INT?$CDCTU_1_PV?$AA@", ptr @"??_C@_0N@PLIFCNF@BOOL?$CDCTU_1_Q?$AA@", ptr @"??_C@_0N@FEJIKJOA@INT?$CDCTU_1_CV?$AA@", ptr @"??_C@_0BE@HKBADBCF@BOOL?$CDCTU_1__prev_cu?$AA@"], align 4
@"??_C@_0BB@KKNGKHLB@FUNCTION?$CDTP?$CDTP_1?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"FUNCTION#TP#TP_1\00", comdat, align 1
@k_il_rtedge_tp1_pin_tags = internal constant [5 x ptr] [ptr @"??_C@_0N@EBIPFNC@BOOL?$CDTP_1_IN?$AA@", ptr @"??_C@_0M@BEHIIIMH@INT?$CDTP_1_PT?$AA@", ptr @"??_C@_0BC@OOGKHIAJ@INT?$CDTP_1__elapsed?$AA@", ptr @"??_C@_0BD@MEEJDDCF@BOOL?$CDTP_1__running?$AA@", ptr @"??_C@_0M@NAKMDDEI@BOOL?$CDTP_1_Q?$AA@"], align 4
@"??_C@_0BB@IBPLPEHC@FUNCTION?$CDTP?$CDTP_2?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"FUNCTION#TP#TP_2\00", comdat, align 1
@k_il_rtedge_tp2_pin_tags = internal constant [5 x ptr] [ptr @"??_C@_0N@EDLIIPAC@BOOL?$CDTP_2_IN?$AA@", ptr @"??_C@_0M@FDNIPCBH@INT?$CDTP_2_PT?$AA@", ptr @"??_C@_0BC@HHIIBOAI@INT?$CDTP_2__elapsed?$AA@", ptr @"??_C@_0BD@FNKLFFCE@BOOL?$CDTP_2__running?$AA@", ptr @"??_C@_0M@MCBJJMKG@BOOL?$CDTP_2_Q?$AA@"], align 4
@"??_C@_0O@CONIEAAG@BOOL?$CDCTU_1_CU?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"BOOL#CTU_1_CU\00", comdat, align 1
@"??_C@_0BB@KFKIFIPE@BOOL?$CDCTU_1_RESET?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"BOOL#CTU_1_RESET\00", comdat, align 1
@"??_C@_0N@EKPILEMJ@INT?$CDCTU_1_PV?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"INT#CTU_1_PV\00", comdat, align 1
@"??_C@_0N@PLIFCNF@BOOL?$CDCTU_1_Q?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"BOOL#CTU_1_Q\00", comdat, align 1
@"??_C@_0N@FEJIKJOA@INT?$CDCTU_1_CV?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"INT#CTU_1_CV\00", comdat, align 1
@"??_C@_0BE@HKBADBCF@BOOL?$CDCTU_1__prev_cu?$AA@" = linkonce_odr dso_local unnamed_addr constant [20 x i8] c"BOOL#CTU_1__prev_cu\00", comdat, align 1
@"??_C@_0N@EBIPFNC@BOOL?$CDTP_1_IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"BOOL#TP_1_IN\00", comdat, align 1
@"??_C@_0M@BEHIIIMH@INT?$CDTP_1_PT?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"INT#TP_1_PT\00", comdat, align 1
@"??_C@_0BC@OOGKHIAJ@INT?$CDTP_1__elapsed?$AA@" = linkonce_odr dso_local unnamed_addr constant [18 x i8] c"INT#TP_1__elapsed\00", comdat, align 1
@"??_C@_0BD@MEEJDDCF@BOOL?$CDTP_1__running?$AA@" = linkonce_odr dso_local unnamed_addr constant [19 x i8] c"BOOL#TP_1__running\00", comdat, align 1
@"??_C@_0M@NAKMDDEI@BOOL?$CDTP_1_Q?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"BOOL#TP_1_Q\00", comdat, align 1
@"??_C@_0N@EDLIIPAC@BOOL?$CDTP_2_IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"BOOL#TP_2_IN\00", comdat, align 1
@"??_C@_0M@FDNIPCBH@INT?$CDTP_2_PT?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"INT#TP_2_PT\00", comdat, align 1
@"??_C@_0BC@HHIIBOAI@INT?$CDTP_2__elapsed?$AA@" = linkonce_odr dso_local unnamed_addr constant [18 x i8] c"INT#TP_2__elapsed\00", comdat, align 1
@"??_C@_0BD@FNKLFFCE@BOOL?$CDTP_2__running?$AA@" = linkonce_odr dso_local unnamed_addr constant [19 x i8] c"BOOL#TP_2__running\00", comdat, align 1
@"??_C@_0M@MCBJJMKG@BOOL?$CDTP_2_Q?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"BOOL#TP_2_Q\00", comdat, align 1

; Function Attrs: noinline nounwind optnone
define dso_local void @IlRtedgeTags_Init() local_unnamed_addr #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 4
  %3 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(ptr %1) #5
  store i32 0, ptr %1, align 4
  br label %4

4:                                                ; preds = %11, %0
  %5 = load i32, ptr %1, align 4
  %6 = icmp ult i32 %5, 10
  br i1 %6, label %7, label %14

7:                                                ; preds = %4
  %8 = load i32, ptr %1, align 4
  %9 = getelementptr inbounds nuw [10 x ptr], ptr @k_il_rtedge_scalar_specs, i32 0, i32 %8
  %10 = load ptr, ptr %9, align 4
  call fastcc void @il_rtedge_apply_instruction_spec()
  br label %11

11:                                               ; preds = %7
  %12 = load i32, ptr %1, align 4
  %13 = add i32 %12, 1
  store i32 %13, ptr %1, align 4
  br label %4, !llvm.loop !7

14:                                               ; preds = %4
  store i32 0, ptr %1, align 4
  br label %15

15:                                               ; preds = %41, %14
  %16 = load i32, ptr %1, align 4
  %17 = icmp ult i32 %16, 3
  br i1 %17, label %18, label %44

18:                                               ; preds = %15
  call void @llvm.lifetime.start.p0(ptr %2) #5
  %19 = load i32, ptr %1, align 4
  %20 = getelementptr inbounds nuw [3 x %struct.il_fb_instance_desc], ptr @k_il_fb_instances, i32 0, i32 %19
  store ptr %20, ptr %2, align 4
  call void @llvm.lifetime.start.p0(ptr %3) #5
  %21 = load ptr, ptr %2, align 4
  %22 = getelementptr inbounds nuw %struct.il_fb_instance_desc, ptr %21, i32 0, i32 0
  %23 = load ptr, ptr %22, align 4
  call fastcc void @il_rtedge_apply_instruction_spec()
  store i32 0, ptr %3, align 4
  br label %24

24:                                               ; preds = %37, %18
  %25 = load i32, ptr %3, align 4
  %26 = load ptr, ptr %2, align 4
  %27 = getelementptr inbounds nuw %struct.il_fb_instance_desc, ptr %26, i32 0, i32 2
  %28 = load i32, ptr %27, align 4
  %29 = icmp ult i32 %25, %28
  br i1 %29, label %30, label %40

30:                                               ; preds = %24
  %31 = load ptr, ptr %2, align 4
  %32 = getelementptr inbounds nuw %struct.il_fb_instance_desc, ptr %31, i32 0, i32 1
  %33 = load ptr, ptr %32, align 4
  %34 = load i32, ptr %3, align 4
  %35 = getelementptr inbounds nuw ptr, ptr %33, i32 %34
  %36 = load ptr, ptr %35, align 4
  call fastcc void @il_rtedge_apply_instruction_spec()
  br label %37

37:                                               ; preds = %30
  %38 = load i32, ptr %3, align 4
  %39 = add i32 %38, 1
  store i32 %39, ptr %3, align 4
  br label %24, !llvm.loop !9

40:                                               ; preds = %24
  call void @llvm.lifetime.end.p0(ptr %3) #5
  call void @llvm.lifetime.end.p0(ptr %2) #5
  br label %41

41:                                               ; preds = %40
  %42 = load i32, ptr %1, align 4
  %43 = add i32 %42, 1
  store i32 %43, ptr %1, align 4
  br label %15, !llvm.loop !10

44:                                               ; preds = %15
  call fastcc void @il_rtedge_invoke_slots_init()
  call void @llvm.lifetime.end.p0(ptr %1) #5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal fastcc void @il_rtedge_apply_instruction_spec() unnamed_addr #2 {
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: noinline nounwind
define internal fastcc void @il_rtedge_invoke_slots_init() unnamed_addr #3 {
  tail call void @test_slots_init() #5
  ret void
}

declare dso_local void @test_slots_init() local_unnamed_addr #4

attributes #0 = { noinline nounwind optnone "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noinline nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "d:\\work\\rtacc\\examples\\IL\\rtedge_tags.c", directory: "D:\\work\\rtacc")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}
