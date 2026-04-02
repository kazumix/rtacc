; ModuleID = '..\IL\il_rtedge_egapi.c'
source_filename = "..\\IL\\il_rtedge_egapi.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.anon = type { ptr, ptr }
%struct.anon.0 = type { ptr, ptr }
%struct.anon.1 = type { ptr, ptr }

$"??_C@_00CNPNBAHC@?$AA@" = comdat any

$"??_C@_07DCPMEJPJ@STRING?$CD?$AA@" = comdat any

$"??_C@_05NCFAHBAN@BOOL?$CD?$AA@" = comdat any

$"??_C@_04MCOJOMNJ@INT?$CD?$AA@" = comdat any

$"??_C@_05OJEKCDCD@UINT?$CD?$AA@" = comdat any

$"??_C@_06LBMBBDGI@DWORD?$CD?$AA@" = comdat any

$"??_C@_05CNEHJGCP@TIME?$CD?$AA@" = comdat any

$"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@" = comdat any

$"??_C@_03IPOIBAGA@TON?$AA@" = comdat any

$"??_C@_03EHDBJKGI@TOF?$AA@" = comdat any

$"??_C@_02NBLAPNNF@TP?$AA@" = comdat any

$"??_C@_03PLGDPIEN@CTU?$AA@" = comdat any

$"??_C@_03BOJFLAKG@ADD?$AA@" = comdat any

$"??_C@_03KPDLEBHD@SUB?$AA@" = comdat any

$"??_C@_03IBHOEMFB@MUL?$AA@" = comdat any

$"??_C@_03FJGHKDBE@DIV?$AA@" = comdat any

$"??_C@_03FIBGOAPP@MOD?$AA@" = comdat any

$"??_C@_02BIBFALEN@EN?$AA@" = comdat any

$"??_C@_04PPJDIBFE@BOOL?$AA@" = comdat any

$"??_C@_02BBAPPCCJ@IN?$AA@" = comdat any

$"??_C@_02LCNFJAAN@PT?$AA@" = comdat any

$"??_C@_04OHBONDIN@TIME?$AA@" = comdat any

$"??_C@_02KIDIPBJG@ET?$AA@" = comdat any

$"??_C@_01BNIGIBBF@Q?$AA@" = comdat any

$"??_C@_04CCKFKGBO@_IN_?$AA@" = comdat any

$"??_C@_08JOHAOBGG@?$CFs?$CD?$CFs?4?$CFs?$AA@" = comdat any

$"??_C@_02LFKOLMGF@CU?$AA@" = comdat any

$"??_C@_05OOFGFHKO@RESET?$AA@" = comdat any

$"??_C@_02IAODPCIP@PV?$AA@" = comdat any

$"??_C@_03JMHEAPMO@INT?$AA@" = comdat any

$"??_C@_02JOIDOPKG@CV?$AA@" = comdat any

$"??_C@_08MGKGFJNM@_prev_cu?$AA@" = comdat any

$"??_C@_03IEPOJACM@IN1?$AA@" = comdat any

$"??_C@_03KPNDMDOP@IN2?$AA@" = comdat any

$"??_C@_03HPJEHLOM@ENO?$AA@" = comdat any

$"??_C@_03KJGMBMID@OUT?$AA@" = comdat any

@"??_C@_00CNPNBAHC@?$AA@" = linkonce_odr dso_local unnamed_addr constant [1 x i8] zeroinitializer, comdat, align 1
@"??_C@_07DCPMEJPJ@STRING?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"STRING#\00", comdat, align 1
@"??_C@_05NCFAHBAN@BOOL?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"BOOL#\00", comdat, align 1
@"??_C@_04MCOJOMNJ@INT?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"INT#\00", comdat, align 1
@"??_C@_05OJEKCDCD@UINT?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"UINT#\00", comdat, align 1
@"??_C@_06LBMBBDGI@DWORD?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"DWORD#\00", comdat, align 1
@"??_C@_05CNEHJGCP@TIME?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"TIME#\00", comdat, align 1
@"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"FUNCTION#\00", comdat, align 1
@il_kw = internal unnamed_addr constant [8 x { ptr, i16, [2 x i8], i32, i32 }] [{ ptr, i16, [2 x i8], i32, i32 } { ptr @"??_C@_05NCFAHBAN@BOOL?$CD?$AA@", i16 1536, [2 x i8] zeroinitializer, i32 1, i32 1 }, { ptr, i16, [2 x i8], i32, i32 } { ptr @"??_C@_04MCOJOMNJ@INT?$CD?$AA@", i16 261, [2 x i8] zeroinitializer, i32 4, i32 2 }, { ptr, i16, [2 x i8], i32, i32 } { ptr @"??_C@_05OJEKCDCD@UINT?$CD?$AA@", i16 513, [2 x i8] zeroinitializer, i32 5, i32 2 }, { ptr, i16, [2 x i8], i32, i32 } { ptr @"??_C@_06LBMBBDGI@DWORD?$CD?$AA@", i16 515, [2 x i8] zeroinitializer, i32 4, i32 4 }, { ptr, i16, [2 x i8], i32, i32 } { ptr @"??_C@_05CNEHJGCP@TIME?$CD?$AA@", i16 1347, [2 x i8] zeroinitializer, i32 7, i32 4 }, { ptr, i16, [2 x i8], i32, i32 } { ptr @"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@", i16 1059, [2 x i8] zeroinitializer, i32 13, i32 -1 }, { ptr, i16, [2 x i8], i32, i32 } { ptr @"??_C@_07DCPMEJPJ@STRING?$CD?$AA@", i16 1346, [2 x i8] zeroinitializer, i32 13, i32 83 }, { ptr, i16, [2 x i8], i32, i32 } zeroinitializer], align 4
@"??_C@_03IPOIBAGA@TON?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"TON\00", comdat, align 1
@"??_C@_03EHDBJKGI@TOF?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"TOF\00", comdat, align 1
@"??_C@_02NBLAPNNF@TP?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"TP\00", comdat, align 1
@"??_C@_03PLGDPIEN@CTU?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"CTU\00", comdat, align 1
@"??_C@_03BOJFLAKG@ADD?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"ADD\00", comdat, align 1
@"??_C@_03KPDLEBHD@SUB?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"SUB\00", comdat, align 1
@"??_C@_03IBHOEMFB@MUL?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"MUL\00", comdat, align 1
@"??_C@_03FJGHKDBE@DIV?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"DIV\00", comdat, align 1
@"??_C@_03FIBGOAPP@MOD?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"MOD\00", comdat, align 1
@il_rtedge_structure_create_catalog_ton.rows = internal unnamed_addr constant [6 x %struct.anon] [%struct.anon { ptr @"??_C@_02BIBFALEN@EN?$AA@", ptr @"??_C@_04PPJDIBFE@BOOL?$AA@" }, %struct.anon { ptr @"??_C@_02BBAPPCCJ@IN?$AA@", ptr @"??_C@_04PPJDIBFE@BOOL?$AA@" }, %struct.anon { ptr @"??_C@_02LCNFJAAN@PT?$AA@", ptr @"??_C@_04OHBONDIN@TIME?$AA@" }, %struct.anon { ptr @"??_C@_02KIDIPBJG@ET?$AA@", ptr @"??_C@_04OHBONDIN@TIME?$AA@" }, %struct.anon { ptr @"??_C@_01BNIGIBBF@Q?$AA@", ptr @"??_C@_04PPJDIBFE@BOOL?$AA@" }, %struct.anon { ptr @"??_C@_04CCKFKGBO@_IN_?$AA@", ptr @"??_C@_04PPJDIBFE@BOOL?$AA@" }], align 4
@"??_C@_02BIBFALEN@EN?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"EN\00", comdat, align 1
@"??_C@_04PPJDIBFE@BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"BOOL\00", comdat, align 1
@"??_C@_02BBAPPCCJ@IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"IN\00", comdat, align 1
@"??_C@_02LCNFJAAN@PT?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"PT\00", comdat, align 1
@"??_C@_04OHBONDIN@TIME?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"TIME\00", comdat, align 1
@"??_C@_02KIDIPBJG@ET?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"ET\00", comdat, align 1
@"??_C@_01BNIGIBBF@Q?$AA@" = linkonce_odr dso_local unnamed_addr constant [2 x i8] c"Q\00", comdat, align 1
@"??_C@_04CCKFKGBO@_IN_?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"_IN_\00", comdat, align 1
@"??_C@_08JOHAOBGG@?$CFs?$CD?$CFs?4?$CFs?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"%s#%s.%s\00", comdat, align 1
@il_rtedge_structure_create_catalog_ctu.rows = internal unnamed_addr constant [6 x %struct.anon.0] [%struct.anon.0 { ptr @"??_C@_02LFKOLMGF@CU?$AA@", ptr @"??_C@_04PPJDIBFE@BOOL?$AA@" }, %struct.anon.0 { ptr @"??_C@_05OOFGFHKO@RESET?$AA@", ptr @"??_C@_04PPJDIBFE@BOOL?$AA@" }, %struct.anon.0 { ptr @"??_C@_02IAODPCIP@PV?$AA@", ptr @"??_C@_03JMHEAPMO@INT?$AA@" }, %struct.anon.0 { ptr @"??_C@_01BNIGIBBF@Q?$AA@", ptr @"??_C@_04PPJDIBFE@BOOL?$AA@" }, %struct.anon.0 { ptr @"??_C@_02JOIDOPKG@CV?$AA@", ptr @"??_C@_03JMHEAPMO@INT?$AA@" }, %struct.anon.0 { ptr @"??_C@_08MGKGFJNM@_prev_cu?$AA@", ptr @"??_C@_04PPJDIBFE@BOOL?$AA@" }], align 4
@"??_C@_02LFKOLMGF@CU?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"CU\00", comdat, align 1
@"??_C@_05OOFGFHKO@RESET?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"RESET\00", comdat, align 1
@"??_C@_02IAODPCIP@PV?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"PV\00", comdat, align 1
@"??_C@_03JMHEAPMO@INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"INT\00", comdat, align 1
@"??_C@_02JOIDOPKG@CV?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"CV\00", comdat, align 1
@"??_C@_08MGKGFJNM@_prev_cu?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"_prev_cu\00", comdat, align 1
@il_rtedge_structure_create_catalog_arith.rows = internal unnamed_addr constant [5 x %struct.anon.1] [%struct.anon.1 { ptr @"??_C@_02BIBFALEN@EN?$AA@", ptr @"??_C@_04PPJDIBFE@BOOL?$AA@" }, %struct.anon.1 { ptr @"??_C@_03IEPOJACM@IN1?$AA@", ptr @"??_C@_03JMHEAPMO@INT?$AA@" }, %struct.anon.1 { ptr @"??_C@_03KPNDMDOP@IN2?$AA@", ptr @"??_C@_03JMHEAPMO@INT?$AA@" }, %struct.anon.1 { ptr @"??_C@_03HPJEHLOM@ENO?$AA@", ptr @"??_C@_04PPJDIBFE@BOOL?$AA@" }, %struct.anon.1 { ptr @"??_C@_03KJGMBMID@OUT?$AA@", ptr @"??_C@_03JMHEAPMO@INT?$AA@" }], align 4
@"??_C@_03IEPOJACM@IN1?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"IN1\00", comdat, align 1
@"??_C@_03KPNDMDOP@IN2?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"IN2\00", comdat, align 1
@"??_C@_03HPJEHLOM@ENO?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"ENO\00", comdat, align 1
@"??_C@_03KJGMBMID@OUT?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"OUT\00", comdat, align 1

; Function Attrs: nounwind
define dso_local zeroext range(i8 0, 2) i8 @Rtedge_TagCreateByInstruction(ptr noundef %0, i8 noundef zeroext %1) local_unnamed_addr #0 {
  %3 = alloca [256 x i8], align 1
  %4 = alloca i16, align 2
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #10
  %5 = icmp eq ptr %0, null
  br i1 %5, label %124, label %6

6:                                                ; preds = %2
  %7 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %0) #10
  %8 = add i32 %7, 1
  br label %9

9:                                                ; preds = %6, %113
  %10 = phi ptr [ @"??_C@_05NCFAHBAN@BOOL?$CD?$AA@", %6 ], [ %115, %113 ]
  %11 = phi ptr [ @il_kw, %6 ], [ %114, %113 ]
  %12 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %10) #10
  %13 = tail call i32 @strncmp(ptr noundef nonnull %0, ptr noundef nonnull %10, i32 noundef %12) #10
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %113

15:                                               ; preds = %9
  %16 = tail call ptr @malloc(i32 noundef %8) #11
  %17 = icmp eq ptr %16, null
  br i1 %17, label %124, label %18

18:                                               ; preds = %15
  tail call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %16, ptr nonnull align 1 %0, i32 %8, i1 false)
  %19 = getelementptr inbounds nuw i8, ptr %11, i32 4
  %20 = load i16, ptr %19, align 4
  switch i16 %20, label %89 [
    i16 1059, label %21
    i16 1346, label %64
  ]

21:                                               ; preds = %18
  %22 = tail call ptr @strrchr(ptr noundef nonnull dereferenceable(1) %16, i32 noundef 35) #10
  %23 = icmp eq ptr %22, null
  br i1 %23, label %24, label %25

24:                                               ; preds = %21
  tail call void @free(ptr noundef %16)
  br label %124

25:                                               ; preds = %21
  store i8 0, ptr %22, align 1
  %26 = getelementptr inbounds nuw i8, ptr %22, i32 1
  %27 = getelementptr inbounds nuw i8, ptr %16, i32 %12
  store i16 0, ptr %4, align 2
  %28 = tail call i32 @plcp_rtedge_fb_segment_bytes_by_name(ptr noundef nonnull %27) #10
  %29 = icmp eq i32 %28, 0
  %30 = trunc i32 %28 to i16
  %31 = select i1 %29, i16 64, i16 %30
  br label %32

32:                                               ; preds = %41, %25
  %33 = phi ptr [ @il_kw, %25 ], [ %42, %41 ]
  %34 = getelementptr inbounds nuw i8, ptr %33, i32 4
  %35 = load i16, ptr %34, align 4
  %36 = icmp eq i16 %35, 1059
  br i1 %36, label %37, label %41

37:                                               ; preds = %32
  %38 = getelementptr inbounds nuw i8, ptr %33, i32 8
  %39 = load i32, ptr %38, align 4
  %40 = trunc i32 %39 to i16
  br label %45

41:                                               ; preds = %32
  %42 = getelementptr inbounds nuw i8, ptr %33, i32 16
  %43 = load ptr, ptr %42, align 4
  %44 = icmp eq ptr %43, null
  br i1 %44, label %45, label %32, !llvm.loop !7

45:                                               ; preds = %41, %37
  %46 = phi i16 [ %40, %37 ], [ 99, %41 ]
  %47 = call i32 @EgTagCreateSegment(ptr noundef nonnull %26, i16 noundef zeroext %46, i16 noundef zeroext %31, ptr noundef nonnull %16, ptr noundef nonnull @"??_C@_00CNPNBAHC@?$AA@", ptr noundef nonnull %3, i16 noundef zeroext 256, ptr noundef nonnull %4) #10
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %110

49:                                               ; preds = %45
  %50 = call i32 @plcp_rtedge_fb_segment_bytes_by_name(ptr noundef nonnull %27) #10
  %51 = icmp eq i32 %50, 0
  %52 = trunc i32 %50 to i16
  %53 = select i1 %51, i16 64, i16 %52
  %54 = zext i16 %53 to i32
  %55 = call ptr @calloc(i32 noundef 1, i32 noundef %54) #12
  %56 = icmp eq ptr %55, null
  br i1 %56, label %59, label %57

57:                                               ; preds = %49
  %58 = call i32 @EgTagWriteSegment(ptr noundef nonnull %26, i16 noundef zeroext 0, ptr noundef nonnull %55, i16 noundef zeroext %53) #10
  call void @free(ptr noundef %55)
  br label %59

59:                                               ; preds = %57, %49
  call void @plcp_rtedge_after_segment(ptr noundef nonnull %26, ptr noundef nonnull %27) #10
  %60 = call fastcc zeroext i8 @il_rtedge_fb_has_structure_catalog(ptr noundef %27)
  %61 = icmp eq i8 %60, 0
  br i1 %61, label %110, label %62

62:                                               ; preds = %59
  %63 = call zeroext i8 @il_rtedge_registry_push(ptr noundef nonnull %0, i8 noundef zeroext %1) #10
  call fastcc void @il_rtedge_structure_create_catalog_members(ptr noundef %27, ptr noundef %26)
  br label %110

64:                                               ; preds = %18
  %65 = getelementptr inbounds nuw i8, ptr %16, i32 %12
  store i16 0, ptr %4, align 2
  %66 = icmp eq i8 %1, 0
  br i1 %66, label %67, label %110

67:                                               ; preds = %64, %76
  %68 = phi ptr [ %77, %76 ], [ @il_kw, %64 ]
  %69 = getelementptr inbounds nuw i8, ptr %68, i32 4
  %70 = load i16, ptr %69, align 4
  %71 = icmp eq i16 %70, 1346
  br i1 %71, label %72, label %76

72:                                               ; preds = %67
  %73 = getelementptr inbounds nuw i8, ptr %68, i32 8
  %74 = load i32, ptr %73, align 4
  %75 = trunc i32 %74 to i16
  br label %80

76:                                               ; preds = %67
  %77 = getelementptr inbounds nuw i8, ptr %68, i32 16
  %78 = load ptr, ptr %77, align 4
  %79 = icmp eq ptr %78, null
  br i1 %79, label %80, label %67, !llvm.loop !7

80:                                               ; preds = %76, %72
  %81 = phi i16 [ %75, %72 ], [ 99, %76 ]
  %82 = call i32 @EgTagCreateSegment(ptr noundef nonnull %65, i16 noundef zeroext %81, i16 noundef zeroext 83, ptr noundef nonnull @"??_C@_07DCPMEJPJ@STRING?$CD?$AA@", ptr noundef nonnull @"??_C@_00CNPNBAHC@?$AA@", ptr noundef nonnull %3, i16 noundef zeroext 256, ptr noundef nonnull %4) #10
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %84, label %110

84:                                               ; preds = %80
  %85 = call dereferenceable_or_null(83) ptr @calloc(i32 noundef 1, i32 noundef 83) #12
  %86 = icmp eq ptr %85, null
  br i1 %86, label %110, label %87

87:                                               ; preds = %84
  %88 = call i32 @EgTagWriteSegment(ptr noundef nonnull %65, i16 noundef zeroext 0, ptr noundef nonnull %85, i16 noundef zeroext 83) #10
  call void @free(ptr noundef %85)
  br label %110

89:                                               ; preds = %18, %98
  %90 = phi ptr [ %99, %98 ], [ @il_kw, %18 ]
  %91 = getelementptr inbounds nuw i8, ptr %90, i32 4
  %92 = load i16, ptr %91, align 4
  %93 = icmp eq i16 %92, %20
  br i1 %93, label %94, label %98

94:                                               ; preds = %89
  %95 = getelementptr inbounds nuw i8, ptr %90, i32 8
  %96 = load i32, ptr %95, align 4
  %97 = trunc i32 %96 to i16
  br label %102

98:                                               ; preds = %89
  %99 = getelementptr inbounds nuw i8, ptr %90, i32 16
  %100 = load ptr, ptr %99, align 4
  %101 = icmp eq ptr %100, null
  br i1 %101, label %102, label %89, !llvm.loop !7

102:                                              ; preds = %98, %94
  %103 = phi i16 [ %97, %94 ], [ 99, %98 ]
  %104 = icmp eq i8 %1, 0
  br i1 %104, label %105, label %110

105:                                              ; preds = %102
  %106 = getelementptr inbounds nuw i8, ptr %16, i32 %12
  %107 = tail call i32 @EgTagCreateEx(ptr noundef nonnull %106, i16 noundef zeroext %103, ptr noundef nonnull %16, ptr noundef nonnull @"??_C@_00CNPNBAHC@?$AA@") #10
  %108 = icmp eq i32 %107, 0
  %109 = zext i1 %108 to i8
  br label %110

110:                                              ; preds = %102, %64, %84, %87, %59, %62, %80, %105, %45
  %111 = phi i1 [ false, %105 ], [ false, %45 ], [ false, %84 ], [ false, %59 ], [ false, %80 ], [ false, %64 ], [ true, %62 ], [ false, %87 ], [ false, %102 ]
  %112 = phi i8 [ %109, %105 ], [ 0, %45 ], [ 1, %84 ], [ 1, %59 ], [ 0, %80 ], [ 1, %64 ], [ 1, %62 ], [ 1, %87 ], [ 1, %102 ]
  call void @free(ptr noundef %16)
  br label %117

113:                                              ; preds = %9
  %114 = getelementptr inbounds nuw i8, ptr %11, i32 16
  %115 = load ptr, ptr %114, align 4
  %116 = icmp eq ptr %115, null
  br i1 %116, label %117, label %9, !llvm.loop !10

117:                                              ; preds = %113, %110
  %118 = phi i1 [ %111, %110 ], [ false, %113 ]
  %119 = phi i8 [ %112, %110 ], [ 0, %113 ]
  %120 = icmp eq i8 %119, 0
  %121 = or i1 %118, %120
  br i1 %121, label %124, label %122

122:                                              ; preds = %117
  %123 = call zeroext i8 @il_rtedge_registry_push(ptr noundef nonnull %0, i8 noundef zeroext %1) #10
  br label %124

124:                                              ; preds = %24, %15, %122, %117, %2
  %125 = phi i8 [ 0, %2 ], [ 0, %15 ], [ 0, %24 ], [ 1, %122 ], [ %119, %117 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #10
  ret i8 %125
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strlen(ptr noundef captures(none)) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strncmp(ptr noundef captures(none), ptr noundef captures(none), i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare dso_local noalias noundef ptr @malloc(i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #4

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local ptr @strrchr(ptr noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare dso_local void @free(ptr allocptr noundef captures(none)) local_unnamed_addr #5

declare dllimport i32 @EgTagCreateSegment(ptr noundef, i16 noundef zeroext, i16 noundef zeroext, ptr noundef, ptr noundef, ptr noundef, i16 noundef zeroext, ptr noundef) local_unnamed_addr #6

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite)
declare dso_local noalias noundef ptr @calloc(i32 noundef, i32 noundef) local_unnamed_addr #7

declare dllimport i32 @EgTagWriteSegment(ptr noundef, i16 noundef zeroext, ptr noundef, i16 noundef zeroext) local_unnamed_addr #6

declare dso_local void @plcp_rtedge_after_segment(ptr noundef, ptr noundef) local_unnamed_addr #6

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: read)
define internal fastcc zeroext range(i8 0, 2) i8 @il_rtedge_fb_has_structure_catalog(ptr noundef nonnull readonly captures(none) %0) unnamed_addr #8 {
  %2 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(4) @"??_C@_03IPOIBAGA@TON?$AA@", i32 noundef 3) #10
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %29, label %4

4:                                                ; preds = %1
  %5 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(4) @"??_C@_03EHDBJKGI@TOF?$AA@", i32 noundef 3) #10
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %29, label %7

7:                                                ; preds = %4
  %8 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(3) @"??_C@_02NBLAPNNF@TP?$AA@", i32 noundef 2) #10
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %29, label %10

10:                                               ; preds = %7
  %11 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(4) @"??_C@_03PLGDPIEN@CTU?$AA@", i32 noundef 3) #10
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %29, label %13

13:                                               ; preds = %10
  %14 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(4) @"??_C@_03BOJFLAKG@ADD?$AA@", i32 noundef 3) #10
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %29, label %16

16:                                               ; preds = %13
  %17 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(4) @"??_C@_03KPDLEBHD@SUB?$AA@", i32 noundef 3) #10
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %29, label %19

19:                                               ; preds = %16
  %20 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(4) @"??_C@_03IBHOEMFB@MUL?$AA@", i32 noundef 3) #10
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %29, label %22

22:                                               ; preds = %19
  %23 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(4) @"??_C@_03FJGHKDBE@DIV?$AA@", i32 noundef 3) #10
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %29, label %25

25:                                               ; preds = %22
  %26 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(4) @"??_C@_03FIBGOAPP@MOD?$AA@", i32 noundef 3) #10
  %27 = icmp eq i32 %26, 0
  %28 = zext i1 %27 to i8
  br label %29

29:                                               ; preds = %25, %13, %16, %19, %22, %10, %1, %4, %7
  %30 = phi i8 [ 1, %13 ], [ 1, %10 ], [ 1, %1 ], [ 1, %7 ], [ 1, %4 ], [ %28, %25 ], [ 1, %22 ], [ 1, %19 ], [ 1, %16 ]
  ret i8 %30
}

declare dso_local zeroext i8 @il_rtedge_registry_push(ptr noundef, i8 noundef zeroext) local_unnamed_addr #6

; Function Attrs: nounwind
define internal fastcc void @il_rtedge_structure_create_catalog_members(ptr noundef nonnull readonly captures(none) %0, ptr noundef nonnull %1) unnamed_addr #0 {
  %3 = alloca [112 x i8], align 1
  %4 = alloca [112 x i8], align 1
  %5 = alloca [112 x i8], align 1
  %6 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(4) @"??_C@_03IPOIBAGA@TON?$AA@", i32 noundef 3) #10
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %14, label %8

8:                                                ; preds = %2
  %9 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(4) @"??_C@_03EHDBJKGI@TOF?$AA@", i32 noundef 3) #10
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %14, label %11

11:                                               ; preds = %8
  %12 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(3) @"??_C@_02NBLAPNNF@TP?$AA@", i32 noundef 2) #10
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %29

14:                                               ; preds = %11, %8, %2
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #10
  br label %15

15:                                               ; preds = %25, %14
  %16 = phi i32 [ 0, %14 ], [ %26, %25 ]
  %17 = getelementptr inbounds nuw %struct.anon, ptr @il_rtedge_structure_create_catalog_ton.rows, i32 %16
  %18 = load ptr, ptr %17, align 4
  %19 = getelementptr inbounds nuw i8, ptr %17, i32 4
  %20 = load ptr, ptr %19, align 4
  %21 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %5, i32 noundef 112, ptr noundef nonnull @"??_C@_08JOHAOBGG@?$CFs?$CD?$CFs?4?$CFs?$AA@", ptr noundef %20, ptr noundef nonnull %1, ptr noundef %18) #10
  %22 = icmp sgt i32 %21, 111
  br i1 %22, label %25, label %23

23:                                               ; preds = %15
  %24 = call zeroext i8 @il_rtedge_registry_push(ptr noundef nonnull %5, i8 noundef zeroext 0) #10
  br label %25

25:                                               ; preds = %23, %15
  %26 = add nuw nsw i32 %16, 1
  %27 = icmp eq i32 %26, 6
  br i1 %27, label %28, label %15, !llvm.loop !11

28:                                               ; preds = %25
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #10
  br label %77

29:                                               ; preds = %11
  %30 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(4) @"??_C@_03PLGDPIEN@CTU?$AA@", i32 noundef 3) #10
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %47

32:                                               ; preds = %29
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #10
  br label %33

33:                                               ; preds = %43, %32
  %34 = phi i32 [ 0, %32 ], [ %44, %43 ]
  %35 = getelementptr inbounds nuw %struct.anon.0, ptr @il_rtedge_structure_create_catalog_ctu.rows, i32 %34
  %36 = load ptr, ptr %35, align 4
  %37 = getelementptr inbounds nuw i8, ptr %35, i32 4
  %38 = load ptr, ptr %37, align 4
  %39 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %4, i32 noundef 112, ptr noundef nonnull @"??_C@_08JOHAOBGG@?$CFs?$CD?$CFs?4?$CFs?$AA@", ptr noundef %38, ptr noundef nonnull %1, ptr noundef %36) #10
  %40 = icmp sgt i32 %39, 111
  br i1 %40, label %43, label %41

41:                                               ; preds = %33
  %42 = call zeroext i8 @il_rtedge_registry_push(ptr noundef nonnull %4, i8 noundef zeroext 0) #10
  br label %43

43:                                               ; preds = %41, %33
  %44 = add nuw nsw i32 %34, 1
  %45 = icmp eq i32 %44, 6
  br i1 %45, label %46, label %33, !llvm.loop !12

46:                                               ; preds = %43
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #10
  br label %77

47:                                               ; preds = %29
  %48 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(4) @"??_C@_03BOJFLAKG@ADD?$AA@", i32 noundef 3) #10
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %62, label %50

50:                                               ; preds = %47
  %51 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(4) @"??_C@_03KPDLEBHD@SUB?$AA@", i32 noundef 3) #10
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %62, label %53

53:                                               ; preds = %50
  %54 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(4) @"??_C@_03IBHOEMFB@MUL?$AA@", i32 noundef 3) #10
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %62, label %56

56:                                               ; preds = %53
  %57 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(4) @"??_C@_03FJGHKDBE@DIV?$AA@", i32 noundef 3) #10
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %62, label %59

59:                                               ; preds = %56
  %60 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(4) @"??_C@_03FIBGOAPP@MOD?$AA@", i32 noundef 3) #10
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %62, label %77

62:                                               ; preds = %59, %56, %53, %50, %47
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #10
  br label %63

63:                                               ; preds = %73, %62
  %64 = phi i32 [ 0, %62 ], [ %74, %73 ]
  %65 = getelementptr inbounds nuw %struct.anon.1, ptr @il_rtedge_structure_create_catalog_arith.rows, i32 %64
  %66 = load ptr, ptr %65, align 4
  %67 = getelementptr inbounds nuw i8, ptr %65, i32 4
  %68 = load ptr, ptr %67, align 4
  %69 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %3, i32 noundef 112, ptr noundef nonnull @"??_C@_08JOHAOBGG@?$CFs?$CD?$CFs?4?$CFs?$AA@", ptr noundef %68, ptr noundef nonnull %1, ptr noundef %66) #10
  %70 = icmp sgt i32 %69, 111
  br i1 %70, label %73, label %71

71:                                               ; preds = %63
  %72 = call zeroext i8 @il_rtedge_registry_push(ptr noundef nonnull %3, i8 noundef zeroext 0) #10
  br label %73

73:                                               ; preds = %71, %63
  %74 = add nuw nsw i32 %64, 1
  %75 = icmp eq i32 %74, 5
  br i1 %75, label %76, label %63, !llvm.loop !13

76:                                               ; preds = %73
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #10
  br label %77

77:                                               ; preds = %28, %46, %76, %59
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

declare dllimport i32 @EgTagCreateEx(ptr noundef, i16 noundef zeroext, ptr noundef, ptr noundef) local_unnamed_addr #6

declare dso_local i32 @plcp_rtedge_fb_segment_bytes_by_name(ptr noundef) local_unnamed_addr #6

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @snprintf(ptr noalias noundef writeonly captures(none), i32 noundef, ptr noundef readonly captures(none), ...) local_unnamed_addr #9

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { mustprogress nofree norecurse nounwind willreturn memory(argmem: read) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nounwind }
attributes #11 = { allocsize(0) }
attributes #12 = { allocsize(0,1) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\IL\\il_rtedge_egapi.c", directory: "D:\\work\\rtacc\\examples\\hugeplc")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !8, !9}
!11 = distinct !{!11, !8, !9}
!12 = distinct !{!12, !8, !9}
!13 = distinct !{!13, !8, !9}
