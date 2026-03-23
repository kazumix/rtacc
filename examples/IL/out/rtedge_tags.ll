; ModuleID = 'rtedge_tags.c'
source_filename = "rtedge_tags.c"
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

$"??_C@_0L@HNHDFNJI@BOOL?$CDTP3_Q?$AA@" = comdat any

$"??_C@_0L@OAKEGFCB@BOOL?$CDTP4_Q?$AA@" = comdat any

$"??_C@_09PFDIALPP@BOOL?$CDLED1?$AA@" = comdat any

$"??_C@_09NOBFFIDM@BOOL?$CDLED2?$AA@" = comdat any

$"??_C@_0BD@IJGJPBAE@FUNCTION?$CDCTU?$CDCTU_1?$AA@" = comdat any

$"??_C@_0BB@KKNGKHLB@FUNCTION?$CDTP?$CDTP_1?$AA@" = comdat any

$"??_C@_0BB@IBPLPEHC@FUNCTION?$CDTP?$CDTP_2?$AA@" = comdat any

$"??_C@_0BB@JIOAMFDD@FUNCTION?$CDTP?$CDTP_3?$AA@" = comdat any

$"??_C@_0BB@NHKBFDPE@FUNCTION?$CDTP?$CDTP_4?$AA@" = comdat any

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

$"??_C@_0N@HONIKGLC@BOOL?$CDTP_3_IN?$AA@" = comdat any

$"??_C@_0M@GOLINLKH@INT?$CDTP_3_PT?$AA@" = comdat any

$"??_C@_0BC@LGAGMBMI@INT?$CDTP_3__elapsed?$AA@" = comdat any

$"??_C@_0BD@JMCFIKOE@BOOL?$CDTP_3__running?$AA@" = comdat any

$"??_C@_0M@HKKFPLMD@BOOL?$CDTP_3_Q?$AA@" = comdat any

$"??_C@_0N@MMPIHKKC@BOOL?$CDTP_4_IN?$AA@" = comdat any

$"??_C@_0M@NMJIAHLH@INT?$CDTP_4_PT?$AA@" = comdat any

$"??_C@_0BC@JPDNNEEL@INT?$CDTP_4__elapsed?$AA@" = comdat any

$"??_C@_0BD@LFBOJPGH@BOOL?$CDTP_4__running?$AA@" = comdat any

$"??_C@_0M@OHHCMDHK@BOOL?$CDTP_4_Q?$AA@" = comdat any

@il_rtedge_tag_count = internal unnamed_addr global i32 0, align 4
@il_rtedge_tag_storage = internal unnamed_addr global [128 x [112 x i8]] zeroinitializer, align 1
@k_il_rtedge_scalar_specs = internal unnamed_addr constant [13 x ptr] [ptr @"??_C@_0N@OJIOACIB@BOOL?$CDStartSW?$AA@", ptr @"??_C@_0L@KCHCODLI@BOOL?$CDEndSW?$AA@", ptr @"??_C@_09HJPOANEL@UINT?$CDAI_1?$AA@", ptr @"??_C@_0M@FDLKECOC@BOOL?$CDActive?$AA@", ptr @"??_C@_0P@JLEBCDPH@BOOL?$CDLimitOver?$AA@", ptr @"??_C@_0BD@MFAPEFPK@INT?$CDLimitOverCount?$AA@", ptr @"??_C@_08LDCBIFIH@BOOL?$CDErr?$AA@", ptr @"??_C@_0L@NHHKJFBD@BOOL?$CDTP1_Q?$AA@", ptr @"??_C@_0L@MFMPDKPN@BOOL?$CDTP2_Q?$AA@", ptr @"??_C@_0L@HNHDFNJI@BOOL?$CDTP3_Q?$AA@", ptr @"??_C@_0L@OAKEGFCB@BOOL?$CDTP4_Q?$AA@", ptr @"??_C@_09PFDIALPP@BOOL?$CDLED1?$AA@", ptr @"??_C@_09NOBFFIDM@BOOL?$CDLED2?$AA@"], align 4
@k_il_fb_instances = internal constant [5 x %struct.il_fb_instance_desc] [%struct.il_fb_instance_desc { ptr @"??_C@_0BD@IJGJPBAE@FUNCTION?$CDCTU?$CDCTU_1?$AA@", ptr @k_il_rtedge_ctu1_pin_tags, i32 6 }, %struct.il_fb_instance_desc { ptr @"??_C@_0BB@KKNGKHLB@FUNCTION?$CDTP?$CDTP_1?$AA@", ptr @k_il_rtedge_tp1_pin_tags, i32 5 }, %struct.il_fb_instance_desc { ptr @"??_C@_0BB@IBPLPEHC@FUNCTION?$CDTP?$CDTP_2?$AA@", ptr @k_il_rtedge_tp2_pin_tags, i32 5 }, %struct.il_fb_instance_desc { ptr @"??_C@_0BB@JIOAMFDD@FUNCTION?$CDTP?$CDTP_3?$AA@", ptr @k_il_rtedge_tp3_pin_tags, i32 5 }, %struct.il_fb_instance_desc { ptr @"??_C@_0BB@NHKBFDPE@FUNCTION?$CDTP?$CDTP_4?$AA@", ptr @k_il_rtedge_tp4_pin_tags, i32 5 }], align 4
@"??_C@_0N@OJIOACIB@BOOL?$CDStartSW?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"BOOL#StartSW\00", comdat, align 1
@"??_C@_0L@KCHCODLI@BOOL?$CDEndSW?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"BOOL#EndSW\00", comdat, align 1
@"??_C@_09HJPOANEL@UINT?$CDAI_1?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"UINT#AI_1\00", comdat, align 1
@"??_C@_0M@FDLKECOC@BOOL?$CDActive?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"BOOL#Active\00", comdat, align 1
@"??_C@_0P@JLEBCDPH@BOOL?$CDLimitOver?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"BOOL#LimitOver\00", comdat, align 1
@"??_C@_0BD@MFAPEFPK@INT?$CDLimitOverCount?$AA@" = linkonce_odr dso_local unnamed_addr constant [19 x i8] c"INT#LimitOverCount\00", comdat, align 1
@"??_C@_08LDCBIFIH@BOOL?$CDErr?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"BOOL#Err\00", comdat, align 1
@"??_C@_0L@NHHKJFBD@BOOL?$CDTP1_Q?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"BOOL#TP1_Q\00", comdat, align 1
@"??_C@_0L@MFMPDKPN@BOOL?$CDTP2_Q?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"BOOL#TP2_Q\00", comdat, align 1
@"??_C@_0L@HNHDFNJI@BOOL?$CDTP3_Q?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"BOOL#TP3_Q\00", comdat, align 1
@"??_C@_0L@OAKEGFCB@BOOL?$CDTP4_Q?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"BOOL#TP4_Q\00", comdat, align 1
@"??_C@_09PFDIALPP@BOOL?$CDLED1?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"BOOL#LED1\00", comdat, align 1
@"??_C@_09NOBFFIDM@BOOL?$CDLED2?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"BOOL#LED2\00", comdat, align 1
@"??_C@_0BD@IJGJPBAE@FUNCTION?$CDCTU?$CDCTU_1?$AA@" = linkonce_odr dso_local unnamed_addr constant [19 x i8] c"FUNCTION#CTU#CTU_1\00", comdat, align 1
@k_il_rtedge_ctu1_pin_tags = internal constant [6 x ptr] [ptr @"??_C@_0O@CONIEAAG@BOOL?$CDCTU_1_CU?$AA@", ptr @"??_C@_0BB@KFKIFIPE@BOOL?$CDCTU_1_RESET?$AA@", ptr @"??_C@_0N@EKPILEMJ@INT?$CDCTU_1_PV?$AA@", ptr @"??_C@_0N@PLIFCNF@BOOL?$CDCTU_1_Q?$AA@", ptr @"??_C@_0N@FEJIKJOA@INT?$CDCTU_1_CV?$AA@", ptr @"??_C@_0BE@HKBADBCF@BOOL?$CDCTU_1__prev_cu?$AA@"], align 4
@"??_C@_0BB@KKNGKHLB@FUNCTION?$CDTP?$CDTP_1?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"FUNCTION#TP#TP_1\00", comdat, align 1
@k_il_rtedge_tp1_pin_tags = internal constant [5 x ptr] [ptr @"??_C@_0N@EBIPFNC@BOOL?$CDTP_1_IN?$AA@", ptr @"??_C@_0M@BEHIIIMH@INT?$CDTP_1_PT?$AA@", ptr @"??_C@_0BC@OOGKHIAJ@INT?$CDTP_1__elapsed?$AA@", ptr @"??_C@_0BD@MEEJDDCF@BOOL?$CDTP_1__running?$AA@", ptr @"??_C@_0M@NAKMDDEI@BOOL?$CDTP_1_Q?$AA@"], align 4
@"??_C@_0BB@IBPLPEHC@FUNCTION?$CDTP?$CDTP_2?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"FUNCTION#TP#TP_2\00", comdat, align 1
@k_il_rtedge_tp2_pin_tags = internal constant [5 x ptr] [ptr @"??_C@_0N@EDLIIPAC@BOOL?$CDTP_2_IN?$AA@", ptr @"??_C@_0M@FDNIPCBH@INT?$CDTP_2_PT?$AA@", ptr @"??_C@_0BC@HHIIBOAI@INT?$CDTP_2__elapsed?$AA@", ptr @"??_C@_0BD@FNKLFFCE@BOOL?$CDTP_2__running?$AA@", ptr @"??_C@_0M@MCBJJMKG@BOOL?$CDTP_2_Q?$AA@"], align 4
@"??_C@_0BB@JIOAMFDD@FUNCTION?$CDTP?$CDTP_3?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"FUNCTION#TP#TP_3\00", comdat, align 1
@k_il_rtedge_tp3_pin_tags = internal constant [5 x ptr] [ptr @"??_C@_0N@HONIKGLC@BOOL?$CDTP_3_IN?$AA@", ptr @"??_C@_0M@GOLINLKH@INT?$CDTP_3_PT?$AA@", ptr @"??_C@_0BC@LGAGMBMI@INT?$CDTP_3__elapsed?$AA@", ptr @"??_C@_0BD@JMCFIKOE@BOOL?$CDTP_3__running?$AA@", ptr @"??_C@_0M@HKKFPLMD@BOOL?$CDTP_3_Q?$AA@"], align 4
@"??_C@_0BB@NHKBFDPE@FUNCTION?$CDTP?$CDTP_4?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"FUNCTION#TP#TP_4\00", comdat, align 1
@k_il_rtedge_tp4_pin_tags = internal constant [5 x ptr] [ptr @"??_C@_0N@MMPIHKKC@BOOL?$CDTP_4_IN?$AA@", ptr @"??_C@_0M@NMJIAHLH@INT?$CDTP_4_PT?$AA@", ptr @"??_C@_0BC@JPDNNEEL@INT?$CDTP_4__elapsed?$AA@", ptr @"??_C@_0BD@LFBOJPGH@BOOL?$CDTP_4__running?$AA@", ptr @"??_C@_0M@OHHCMDHK@BOOL?$CDTP_4_Q?$AA@"], align 4
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
@"??_C@_0N@HONIKGLC@BOOL?$CDTP_3_IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"BOOL#TP_3_IN\00", comdat, align 1
@"??_C@_0M@GOLINLKH@INT?$CDTP_3_PT?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"INT#TP_3_PT\00", comdat, align 1
@"??_C@_0BC@LGAGMBMI@INT?$CDTP_3__elapsed?$AA@" = linkonce_odr dso_local unnamed_addr constant [18 x i8] c"INT#TP_3__elapsed\00", comdat, align 1
@"??_C@_0BD@JMCFIKOE@BOOL?$CDTP_3__running?$AA@" = linkonce_odr dso_local unnamed_addr constant [19 x i8] c"BOOL#TP_3__running\00", comdat, align 1
@"??_C@_0M@HKKFPLMD@BOOL?$CDTP_3_Q?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"BOOL#TP_3_Q\00", comdat, align 1
@"??_C@_0N@MMPIHKKC@BOOL?$CDTP_4_IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"BOOL#TP_4_IN\00", comdat, align 1
@"??_C@_0M@NMJIAHLH@INT?$CDTP_4_PT?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"INT#TP_4_PT\00", comdat, align 1
@"??_C@_0BC@JPDNNEEL@INT?$CDTP_4__elapsed?$AA@" = linkonce_odr dso_local unnamed_addr constant [18 x i8] c"INT#TP_4__elapsed\00", comdat, align 1
@"??_C@_0BD@LFBOJPGH@BOOL?$CDTP_4__running?$AA@" = linkonce_odr dso_local unnamed_addr constant [19 x i8] c"BOOL#TP_4__running\00", comdat, align 1
@"??_C@_0M@OHHCMDHK@BOOL?$CDTP_4_Q?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"BOOL#TP_4_Q\00", comdat, align 1

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local zeroext range(i8 0, 2) i8 @il_rtedge_registry_push(ptr noundef readonly captures(address_is_null) %0, i8 noundef zeroext %1) local_unnamed_addr #0 {
  %3 = icmp eq ptr %0, null
  %4 = load i32, ptr @il_rtedge_tag_count, align 4
  %5 = icmp ugt i32 %4, 127
  %6 = select i1 %3, i1 true, i1 %5
  br i1 %6, label %30, label %7

7:                                                ; preds = %2, %22
  %8 = phi i32 [ %23, %22 ], [ 0, %2 ]
  %9 = getelementptr inbounds nuw i8, ptr %0, i32 %8
  %10 = load i8, ptr %9, align 1
  %11 = icmp eq i8 %10, 0
  br i1 %11, label %25, label %12

12:                                               ; preds = %7
  %13 = add nuw nsw i32 %8, 1
  %14 = getelementptr inbounds nuw i8, ptr %0, i32 %13
  %15 = load i8, ptr %14, align 1
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %25, label %17

17:                                               ; preds = %12
  %18 = add nuw nsw i32 %8, 2
  %19 = getelementptr inbounds nuw i8, ptr %0, i32 %18
  %20 = load i8, ptr %19, align 1
  %21 = icmp eq i8 %20, 0
  br i1 %21, label %25, label %22

22:                                               ; preds = %17
  %23 = add nuw nsw i32 %8, 3
  %24 = icmp eq i32 %23, 111
  br i1 %24, label %25, label %7, !llvm.loop !7

25:                                               ; preds = %22, %17, %12, %7
  %26 = phi i32 [ 111, %22 ], [ %8, %7 ], [ %13, %12 ], [ %18, %17 ]
  %27 = getelementptr inbounds nuw [112 x i8], ptr @il_rtedge_tag_storage, i32 %4
  tail call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %27, ptr nonnull align 1 %0, i32 %26, i1 false)
  %28 = getelementptr inbounds nuw i8, ptr %27, i32 %26
  store i8 0, ptr %28, align 1
  %29 = add nuw nsw i32 %4, 1
  store i32 %29, ptr @il_rtedge_tag_count, align 4
  br label %30

30:                                               ; preds = %2, %25
  %31 = phi i8 [ 1, %25 ], [ 0, %2 ]
  ret i8 %31
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local i32 @IlRtedgeTags_GetRegisteredCount() local_unnamed_addr #3 {
  %1 = load i32, ptr @il_rtedge_tag_count, align 4
  ret i32 %1
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 -1, 1) i32 @IlRtedgeTags_GetRegisteredSpec(i32 noundef %0, ptr noundef writeonly captures(address_is_null) %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = icmp ne ptr %1, null
  %5 = icmp ne i32 %2, 0
  %6 = and i1 %4, %5
  %7 = load i32, ptr @il_rtedge_tag_count, align 4
  %8 = icmp ult i32 %0, %7
  %9 = select i1 %6, i1 %8, i1 false
  br i1 %9, label %10, label %35

10:                                               ; preds = %3
  %11 = getelementptr inbounds nuw [112 x i8], ptr @il_rtedge_tag_storage, i32 %0
  br label %12

12:                                               ; preds = %27, %10
  %13 = phi i32 [ 0, %10 ], [ %28, %27 ]
  %14 = getelementptr inbounds nuw i8, ptr %11, i32 %13
  %15 = load i8, ptr %14, align 1
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %30, label %17

17:                                               ; preds = %12
  %18 = add nuw nsw i32 %13, 1
  %19 = getelementptr inbounds nuw i8, ptr %11, i32 %18
  %20 = load i8, ptr %19, align 1
  %21 = icmp eq i8 %20, 0
  br i1 %21, label %30, label %22

22:                                               ; preds = %17
  %23 = add nuw nsw i32 %13, 2
  %24 = getelementptr inbounds nuw i8, ptr %11, i32 %23
  %25 = load i8, ptr %24, align 1
  %26 = icmp eq i8 %25, 0
  br i1 %26, label %30, label %27

27:                                               ; preds = %22
  %28 = add nuw nsw i32 %13, 3
  %29 = icmp eq i32 %28, 111
  br i1 %29, label %30, label %12, !llvm.loop !7

30:                                               ; preds = %27, %22, %17, %12
  %31 = phi i32 [ 111, %27 ], [ %13, %12 ], [ %18, %17 ], [ %23, %22 ]
  %32 = icmp ult i32 %31, %2
  br i1 %32, label %33, label %35

33:                                               ; preds = %30
  tail call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %1, ptr nonnull align 1 %11, i32 %31, i1 false)
  %34 = getelementptr inbounds nuw i8, ptr %1, i32 %31
  store i8 0, ptr %34, align 1
  br label %35

35:                                               ; preds = %30, %3, %33
  %36 = phi i32 [ 0, %33 ], [ -1, %3 ], [ -1, %30 ]
  ret i32 %36
}

; Function Attrs: noinline nounwind optnone
define dso_local void @IlRtedgeTags_Init() local_unnamed_addr #4 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 4
  %3 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(ptr %1) #7
  store i32 0, ptr %1, align 4
  br label %4

4:                                                ; preds = %11, %0
  %5 = load i32, ptr %1, align 4
  %6 = icmp ult i32 %5, 13
  br i1 %6, label %7, label %14

7:                                                ; preds = %4
  %8 = load i32, ptr %1, align 4
  %9 = getelementptr inbounds nuw [13 x ptr], ptr @k_il_rtedge_scalar_specs, i32 0, i32 %8
  %10 = load ptr, ptr %9, align 4
  call fastcc void @il_rtedge_apply_instruction_spec(ptr noundef %10)
  br label %11

11:                                               ; preds = %7
  %12 = load i32, ptr %1, align 4
  %13 = add i32 %12, 1
  store i32 %13, ptr %1, align 4
  br label %4, !llvm.loop !9

14:                                               ; preds = %4
  store i32 0, ptr %1, align 4
  br label %15

15:                                               ; preds = %41, %14
  %16 = load i32, ptr %1, align 4
  %17 = icmp ult i32 %16, 5
  br i1 %17, label %18, label %44

18:                                               ; preds = %15
  call void @llvm.lifetime.start.p0(ptr %2) #7
  %19 = load i32, ptr %1, align 4
  %20 = getelementptr inbounds nuw [5 x %struct.il_fb_instance_desc], ptr @k_il_fb_instances, i32 0, i32 %19
  store ptr %20, ptr %2, align 4
  call void @llvm.lifetime.start.p0(ptr %3) #7
  %21 = load ptr, ptr %2, align 4
  %22 = getelementptr inbounds nuw %struct.il_fb_instance_desc, ptr %21, i32 0, i32 0
  %23 = load ptr, ptr %22, align 4
  call fastcc void @il_rtedge_apply_instruction_spec(ptr noundef %23)
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
  call fastcc void @il_rtedge_apply_instruction_spec(ptr noundef %36)
  br label %37

37:                                               ; preds = %30
  %38 = load i32, ptr %3, align 4
  %39 = add i32 %38, 1
  store i32 %39, ptr %3, align 4
  br label %24, !llvm.loop !10

40:                                               ; preds = %24
  call void @llvm.lifetime.end.p0(ptr %3) #7
  call void @llvm.lifetime.end.p0(ptr %2) #7
  br label %41

41:                                               ; preds = %40
  %42 = load i32, ptr %1, align 4
  %43 = add i32 %42, 1
  store i32 %43, ptr %1, align 4
  br label %15, !llvm.loop !11

44:                                               ; preds = %15
  call fastcc void @il_rtedge_invoke_slots_init()
  call void @IlRtedgeSlots_BindEgEntry()
  call void @llvm.lifetime.end.p0(ptr %1) #7
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @il_rtedge_apply_instruction_spec(ptr noundef readonly captures(none) %0) unnamed_addr #5 {
  %2 = alloca [112 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #7
  %3 = load i8, ptr %0, align 1
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %16, label %5

5:                                                ; preds = %1, %5
  %6 = phi i32 [ %13, %5 ], [ 1, %1 ]
  %7 = phi i8 [ %11, %5 ], [ %3, %1 ]
  %8 = phi i32 [ %6, %5 ], [ 0, %1 ]
  %9 = getelementptr inbounds nuw i8, ptr %2, i32 %8
  store i8 %7, ptr %9, align 1
  %10 = getelementptr inbounds nuw i8, ptr %0, i32 %6
  %11 = load i8, ptr %10, align 1
  %12 = icmp ne i8 %11, 0
  %13 = add nuw nsw i32 %6, 1
  %14 = icmp samesign ult i32 %6, 111
  %15 = and i1 %12, %14
  br i1 %15, label %5, label %16, !llvm.loop !12

16:                                               ; preds = %5, %1
  %17 = phi i32 [ 0, %1 ], [ %6, %5 ]
  %18 = getelementptr inbounds nuw i8, ptr %2, i32 %17
  store i8 0, ptr %18, align 1
  %19 = call zeroext i8 @Rtedge_TagCreateByInstruction(ptr noundef nonnull %2, i8 noundef zeroext 0) #7
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #7
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @il_rtedge_invoke_slots_init() unnamed_addr #5 {
  tail call void @test_slots_init() #7
  ret void
}

declare dso_local void @IlRtedgeSlots_BindEgEntry() local_unnamed_addr #6

declare dso_local zeroext i8 @Rtedge_TagCreateByInstruction(ptr noundef, i8 noundef zeroext) local_unnamed_addr #6

declare dso_local void @test_slots_init() local_unnamed_addr #6

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noinline nounwind optnone "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noinline nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "rtedge_tags.c", directory: "D:\\work\\rtacc\\examples\\IL")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !8}
!12 = distinct !{!12, !8}
