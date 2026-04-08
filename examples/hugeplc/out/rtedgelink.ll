; ModuleID = '..\..\rtedge\rtedgelink.c'
source_filename = "..\\..\\rtedge\\rtedgelink.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.anon = type { ptr, ptr }
%struct.anon.0 = type { ptr, ptr }
%struct.anon.1 = type { ptr, ptr }
%struct.IlKeywordMatch = type { ptr, i16, i32, i32 }
%struct.tTagsDesc = type { i8, i8, i8, %struct.EgVARIANT, [49 x i8], [49 x i8], %union.anon.3 }
%struct.EgVARIANT = type { %struct.anon.2 }
%struct.anon.2 = type <{ i16, i16, %struct.tEgSpinlock, %union.anon, i64 }>
%struct.tEgSpinlock = type { i32, i32 }
%union.anon = type { %union.EgVARIANTValues }
%union.EgVARIANTValues = type { double }
%union.anon.3 = type <{ %struct.tSHM_DESC, [141 x i8] }>
%struct.tSHM_DESC = type { [255 x i8], i8, i32, i8, i8, i16, i32, i32, [68 x i8], [16 x i8], [16 x i8] }

$"??_C@_06EHOFKDJC@R_TRIG?$AA@" = comdat any

$"??_C@_06NEHEBLEP@F_TRIG?$AA@" = comdat any

$"??_C@_03IPOIBAGA@TON?$AA@" = comdat any

$"??_C@_03EHDBJKGI@TOF?$AA@" = comdat any

$"??_C@_02NBLAPNNF@TP?$AA@" = comdat any

$"??_C@_04JMIDNENE@CTUD?$AA@" = comdat any

$"??_C@_03PLGDPIEN@CTU?$AA@" = comdat any

$"??_C@_03KILKNLFN@CTD?$AA@" = comdat any

$"??_C@_03BOJFLAKG@ADD?$AA@" = comdat any

$"??_C@_03KPDLEBHD@SUB?$AA@" = comdat any

$"??_C@_03IBHOEMFB@MUL?$AA@" = comdat any

$"??_C@_03FJGHKDBE@DIV?$AA@" = comdat any

$"??_C@_03FIBGOAPP@MOD?$AA@" = comdat any

$"??_C@_03BDACDFHA@AND?$AA@" = comdat any

$"??_C@_02PDPFNDMG@OR?$AA@" = comdat any

$"??_C@_03CDEJPCIF@XOR?$AA@" = comdat any

$"??_C@_04DOOMBBIC@ANDN?$AA@" = comdat any

$"??_C@_03BMAOPANN@ORN?$AA@" = comdat any

$"??_C@_04PDALFMNG@XORN?$AA@" = comdat any

$"??_C@_02NFEPAFND@EQ?$AA@" = comdat any

$"??_C@_02PHLEDNGH@NE?$AA@" = comdat any

$"??_C@_02KLLMCFPI@GT?$AA@" = comdat any

$"??_C@_02PIGFAGOI@GE?$AA@" = comdat any

$"??_C@_02KHOJMKBJ@LT?$AA@" = comdat any

$"??_C@_02PEDAOJAJ@LE?$AA@" = comdat any

$"??_C@_03GBFNEA@NOT?$AA@" = comdat any

$"??_C@_04LPPGDFDD@MOVE?$AA@" = comdat any

$"??_C@_02BHMEDAMC@LN?$AA@" = comdat any

$"??_C@_03MLIHNEFJ@LOG?$AA@" = comdat any

$"??_C@_03KKGFKKLA@EXP?$AA@" = comdat any

$"??_C@_04BFBMEOHG@EXPT?$AA@" = comdat any

$"??_C@_03PBAHGDAB@SHR?$AA@" = comdat any

$"??_C@_03CFEGFMNO@SHL?$AA@" = comdat any

$"??_C@_03JILFCNDO@ROL?$AA@" = comdat any

$"??_C@_08CEHGKHCN@BIT_TEST?$AA@" = comdat any

$"??_C@_02LFKOLMGF@CU?$AA@" = comdat any

$"??_C@_02OGHHJPHF@CD?$AA@" = comdat any

$"??_C@_05OOFGFHKO@RESET?$AA@" = comdat any

$"??_C@_04ICOEJIDH@LOAD?$AA@" = comdat any

$"??_C@_02IAODPCIP@PV?$AA@" = comdat any

$"??_C@_02KKAMMLHL@QU?$AA@" = comdat any

$"??_C@_02PJNFOIGL@QD?$AA@" = comdat any

$"??_C@_02JOIDOPKG@CV?$AA@" = comdat any

$"??_C@_04FNGLAKOL@_CU_?$AA@" = comdat any

$"??_C@_08MGKGFJNM@_prev_cu?$AA@" = comdat any

$"??_C@_04EAIPMDKM@_CD_?$AA@" = comdat any

$"??_C@_08JFHPHKMM@_prev_cd?$AA@" = comdat any

$"??_C@_01BNIGIBBF@Q?$AA@" = comdat any

$"??_C@_00CNPNBAHC@?$AA@" = comdat any

$"??_C@_07DCPMEJPJ@STRING?$CD?$AA@" = comdat any

$"??_C@_05HKHPEFOF@Entry?$AA@" = comdat any

$"??_C@_08GHDCOMMC@WORD_TO_?$AA@" = comdat any

$"??_C@_09PFOADHMA@DWORD_TO_?$AA@" = comdat any

$"??_C@_09MNAGFOAE@UDINT_TO_?$AA@" = comdat any

$"??_C@_07JHONPGBM@INT_TO_?$AA@" = comdat any

$"??_C@_08GAALBHL@REAL_TO_?$AA@" = comdat any

$"??_C@_09IHAFCKIN@LREAL_TO_?$AA@" = comdat any

$"??_C@_08GLDPJEJP@BOOL_TO_?$AA@" = comdat any

$"??_C@_08JDDNDFMP@BYTE_TO_?$AA@" = comdat any

$"??_C@_08FPBJEAGI@SINT_TO_?$AA@" = comdat any

$"??_C@_08CMADDJOC@UINT_TO_?$AA@" = comdat any

$"??_C@_09FKHHBLM@USINT_TO_?$AA@" = comdat any

$"??_C@_02BIBFALEN@EN?$AA@" = comdat any

$"??_C@_02BBAPPCCJ@IN?$AA@" = comdat any

$"??_C@_03HPJEHLOM@ENO?$AA@" = comdat any

$"??_C@_03KJGMBMID@OUT?$AA@" = comdat any

$"??_C@_03DNBHDFFK@CLK?$AA@" = comdat any

$"??_C@_09BKFNBCDF@_prev_clk?$AA@" = comdat any

$"??_C@_09KEDAADBG@_PREV_CLK?$AA@" = comdat any

$"??_C@_03IEPOJACM@IN1?$AA@" = comdat any

$"??_C@_03KPNDMDOP@IN2?$AA@" = comdat any

$"??_C@_02LCNFJAAN@PT?$AA@" = comdat any

$"??_C@_02KIDIPBJG@ET?$AA@" = comdat any

$"??_C@_04CCKFKGBO@_IN_?$AA@" = comdat any

$"??_C@_08FINOKCPO@_STTIME_?$AA@" = comdat any

$"??_C@_05NCFAHBAN@BOOL?$CD?$AA@" = comdat any

$"??_C@_04MCOJOMNJ@INT?$CD?$AA@" = comdat any

$"??_C@_05OJEKCDCD@UINT?$CD?$AA@" = comdat any

$"??_C@_06LBMBBDGI@DWORD?$CD?$AA@" = comdat any

$"??_C@_05CNEHJGCP@TIME?$CD?$AA@" = comdat any

$"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@" = comdat any

$"??_C@_04PPJDIBFE@BOOL?$AA@" = comdat any

$"??_C@_04OHBONDIN@TIME?$AA@" = comdat any

$"??_C@_08JOHAOBGG@?$CFs?$CD?$CFs?4?$CFs?$AA@" = comdat any

$"??_C@_03JMHEAPMO@INT?$AA@" = comdat any

@il_rtedge_tag_count = internal global i32 0, align 4
@il_rtedge_tag_storage = internal global [4096 x [112 x i8]] zeroinitializer, align 1
@il_rtedge_tag_hidden = internal global [4096 x i8] zeroinitializer, align 1
@g_fb_count = internal global i32 0, align 4
@g_fb_inst = internal global [256 x [80 x i8]] zeroinitializer, align 1
@g_fb_family = internal global [256 x [32 x i8]] zeroinitializer, align 1
@"??_C@_06EHOFKDJC@R_TRIG?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"R_TRIG\00", comdat, align 1
@"??_C@_06NEHEBLEP@F_TRIG?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"F_TRIG\00", comdat, align 1
@"??_C@_03IPOIBAGA@TON?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"TON\00", comdat, align 1
@"??_C@_03EHDBJKGI@TOF?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"TOF\00", comdat, align 1
@"??_C@_02NBLAPNNF@TP?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"TP\00", comdat, align 1
@"??_C@_04JMIDNENE@CTUD?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"CTUD\00", comdat, align 1
@"??_C@_03PLGDPIEN@CTU?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"CTU\00", comdat, align 1
@"??_C@_03KILKNLFN@CTD?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"CTD\00", comdat, align 1
@"??_C@_03BOJFLAKG@ADD?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"ADD\00", comdat, align 1
@"??_C@_03KPDLEBHD@SUB?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"SUB\00", comdat, align 1
@"??_C@_03IBHOEMFB@MUL?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"MUL\00", comdat, align 1
@"??_C@_03FJGHKDBE@DIV?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"DIV\00", comdat, align 1
@"??_C@_03FIBGOAPP@MOD?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"MOD\00", comdat, align 1
@"??_C@_03BDACDFHA@AND?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"AND\00", comdat, align 1
@"??_C@_02PDPFNDMG@OR?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"OR\00", comdat, align 1
@"??_C@_03CDEJPCIF@XOR?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"XOR\00", comdat, align 1
@"??_C@_04DOOMBBIC@ANDN?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"ANDN\00", comdat, align 1
@"??_C@_03BMAOPANN@ORN?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"ORN\00", comdat, align 1
@"??_C@_04PDALFMNG@XORN?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"XORN\00", comdat, align 1
@"??_C@_02NFEPAFND@EQ?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"EQ\00", comdat, align 1
@"??_C@_02PHLEDNGH@NE?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"NE\00", comdat, align 1
@"??_C@_02KLLMCFPI@GT?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"GT\00", comdat, align 1
@"??_C@_02PIGFAGOI@GE?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"GE\00", comdat, align 1
@"??_C@_02KHOJMKBJ@LT?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"LT\00", comdat, align 1
@"??_C@_02PEDAOJAJ@LE?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"LE\00", comdat, align 1
@"??_C@_03GBFNEA@NOT?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"NOT\00", comdat, align 1
@"??_C@_04LPPGDFDD@MOVE?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"MOVE\00", comdat, align 1
@"??_C@_02BHMEDAMC@LN?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"LN\00", comdat, align 1
@"??_C@_03MLIHNEFJ@LOG?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"LOG\00", comdat, align 1
@"??_C@_03KKGFKKLA@EXP?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"EXP\00", comdat, align 1
@"??_C@_04BFBMEOHG@EXPT?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"EXPT\00", comdat, align 1
@"??_C@_03PBAHGDAB@SHR?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"SHR\00", comdat, align 1
@"??_C@_03CFEGFMNO@SHL?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"SHL\00", comdat, align 1
@"??_C@_03JILFCNDO@ROL?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"ROL\00", comdat, align 1
@"??_C@_08CEHGKHCN@BIT_TEST?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"BIT_TEST\00", comdat, align 1
@"??_C@_02LFKOLMGF@CU?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"CU\00", comdat, align 1
@"??_C@_02OGHHJPHF@CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"CD\00", comdat, align 1
@"??_C@_05OOFGFHKO@RESET?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"RESET\00", comdat, align 1
@"??_C@_04ICOEJIDH@LOAD?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"LOAD\00", comdat, align 1
@"??_C@_02IAODPCIP@PV?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"PV\00", comdat, align 1
@"??_C@_02KKAMMLHL@QU?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"QU\00", comdat, align 1
@"??_C@_02PJNFOIGL@QD?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"QD\00", comdat, align 1
@"??_C@_02JOIDOPKG@CV?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"CV\00", comdat, align 1
@"??_C@_04FNGLAKOL@_CU_?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"_CU_\00", comdat, align 1
@"??_C@_08MGKGFJNM@_prev_cu?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"_prev_cu\00", comdat, align 1
@"??_C@_04EAIPMDKM@_CD_?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"_CD_\00", comdat, align 1
@"??_C@_08JFHPHKMM@_prev_cd?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"_prev_cd\00", comdat, align 1
@"??_C@_01BNIGIBBF@Q?$AA@" = linkonce_odr dso_local unnamed_addr constant [2 x i8] c"Q\00", comdat, align 1
@"??_C@_00CNPNBAHC@?$AA@" = linkonce_odr dso_local unnamed_addr constant [1 x i8] zeroinitializer, comdat, align 1
@"??_C@_07DCPMEJPJ@STRING?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"STRING#\00", comdat, align 1
@"??_C@_05HKHPEFOF@Entry?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"Entry\00", comdat, align 1
@"??_C@_08GHDCOMMC@WORD_TO_?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"WORD_TO_\00", comdat, align 1
@"??_C@_09PFOADHMA@DWORD_TO_?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"DWORD_TO_\00", comdat, align 1
@"??_C@_09MNAGFOAE@UDINT_TO_?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"UDINT_TO_\00", comdat, align 1
@"??_C@_07JHONPGBM@INT_TO_?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"INT_TO_\00", comdat, align 1
@"??_C@_08GAALBHL@REAL_TO_?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"REAL_TO_\00", comdat, align 1
@"??_C@_09IHAFCKIN@LREAL_TO_?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"LREAL_TO_\00", comdat, align 1
@"??_C@_08GLDPJEJP@BOOL_TO_?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"BOOL_TO_\00", comdat, align 1
@"??_C@_08JDDNDFMP@BYTE_TO_?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"BYTE_TO_\00", comdat, align 1
@"??_C@_08FPBJEAGI@SINT_TO_?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SINT_TO_\00", comdat, align 1
@"??_C@_08CMADDJOC@UINT_TO_?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"UINT_TO_\00", comdat, align 1
@"??_C@_09FKHHBLM@USINT_TO_?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"USINT_TO_\00", comdat, align 1
@"??_C@_02BIBFALEN@EN?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"EN\00", comdat, align 1
@"??_C@_02BBAPPCCJ@IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"IN\00", comdat, align 1
@"??_C@_03HPJEHLOM@ENO?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"ENO\00", comdat, align 1
@"??_C@_03KJGMBMID@OUT?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"OUT\00", comdat, align 1
@"??_C@_03DNBHDFFK@CLK?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"CLK\00", comdat, align 1
@"??_C@_09BKFNBCDF@_prev_clk?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"_prev_clk\00", comdat, align 1
@"??_C@_09KEDAADBG@_PREV_CLK?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"_PREV_CLK\00", comdat, align 1
@"??_C@_03IEPOJACM@IN1?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"IN1\00", comdat, align 1
@"??_C@_03KPNDMDOP@IN2?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"IN2\00", comdat, align 1
@"??_C@_02LCNFJAAN@PT?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"PT\00", comdat, align 1
@"??_C@_02KIDIPBJG@ET?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"ET\00", comdat, align 1
@"??_C@_04CCKFKGBO@_IN_?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"_IN_\00", comdat, align 1
@"??_C@_08FINOKCPO@_STTIME_?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"_STTIME_\00", comdat, align 1
@"??_C@_05NCFAHBAN@BOOL?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"BOOL#\00", comdat, align 1
@"??_C@_04MCOJOMNJ@INT?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"INT#\00", comdat, align 1
@"??_C@_05OJEKCDCD@UINT?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"UINT#\00", comdat, align 1
@"??_C@_06LBMBBDGI@DWORD?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"DWORD#\00", comdat, align 1
@"??_C@_05CNEHJGCP@TIME?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"TIME#\00", comdat, align 1
@"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"FUNCTION#\00", comdat, align 1
@il_kw = internal constant [8 x { ptr, i16, [2 x i8], i32, i32 }] [{ ptr, i16, [2 x i8], i32, i32 } { ptr @"??_C@_05NCFAHBAN@BOOL?$CD?$AA@", i16 1536, [2 x i8] zeroinitializer, i32 1, i32 1 }, { ptr, i16, [2 x i8], i32, i32 } { ptr @"??_C@_04MCOJOMNJ@INT?$CD?$AA@", i16 261, [2 x i8] zeroinitializer, i32 4, i32 2 }, { ptr, i16, [2 x i8], i32, i32 } { ptr @"??_C@_05OJEKCDCD@UINT?$CD?$AA@", i16 513, [2 x i8] zeroinitializer, i32 5, i32 2 }, { ptr, i16, [2 x i8], i32, i32 } { ptr @"??_C@_06LBMBBDGI@DWORD?$CD?$AA@", i16 515, [2 x i8] zeroinitializer, i32 7, i32 4 }, { ptr, i16, [2 x i8], i32, i32 } { ptr @"??_C@_05CNEHJGCP@TIME?$CD?$AA@", i16 1347, [2 x i8] zeroinitializer, i32 7, i32 4 }, { ptr, i16, [2 x i8], i32, i32 } { ptr @"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@", i16 1059, [2 x i8] zeroinitializer, i32 13, i32 -1 }, { ptr, i16, [2 x i8], i32, i32 } { ptr @"??_C@_07DCPMEJPJ@STRING?$CD?$AA@", i16 1346, [2 x i8] zeroinitializer, i32 13, i32 83 }, { ptr, i16, [2 x i8], i32, i32 } zeroinitializer], align 4
@il_rtedge_structure_create_catalog_ton.rows = internal constant [6 x %struct.anon] [%struct.anon { ptr @"??_C@_02BIBFALEN@EN?$AA@", ptr @"??_C@_04PPJDIBFE@BOOL?$AA@" }, %struct.anon { ptr @"??_C@_02BBAPPCCJ@IN?$AA@", ptr @"??_C@_04PPJDIBFE@BOOL?$AA@" }, %struct.anon { ptr @"??_C@_02LCNFJAAN@PT?$AA@", ptr @"??_C@_04OHBONDIN@TIME?$AA@" }, %struct.anon { ptr @"??_C@_02KIDIPBJG@ET?$AA@", ptr @"??_C@_04OHBONDIN@TIME?$AA@" }, %struct.anon { ptr @"??_C@_01BNIGIBBF@Q?$AA@", ptr @"??_C@_04PPJDIBFE@BOOL?$AA@" }, %struct.anon { ptr @"??_C@_04CCKFKGBO@_IN_?$AA@", ptr @"??_C@_04PPJDIBFE@BOOL?$AA@" }], align 4
@"??_C@_04PPJDIBFE@BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"BOOL\00", comdat, align 1
@"??_C@_04OHBONDIN@TIME?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"TIME\00", comdat, align 1
@"??_C@_08JOHAOBGG@?$CFs?$CD?$CFs?4?$CFs?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"%s#%s.%s\00", comdat, align 1
@il_rtedge_structure_create_catalog_ctu.rows = internal constant [6 x %struct.anon.0] [%struct.anon.0 { ptr @"??_C@_02LFKOLMGF@CU?$AA@", ptr @"??_C@_04PPJDIBFE@BOOL?$AA@" }, %struct.anon.0 { ptr @"??_C@_05OOFGFHKO@RESET?$AA@", ptr @"??_C@_04PPJDIBFE@BOOL?$AA@" }, %struct.anon.0 { ptr @"??_C@_02IAODPCIP@PV?$AA@", ptr @"??_C@_03JMHEAPMO@INT?$AA@" }, %struct.anon.0 { ptr @"??_C@_01BNIGIBBF@Q?$AA@", ptr @"??_C@_04PPJDIBFE@BOOL?$AA@" }, %struct.anon.0 { ptr @"??_C@_02JOIDOPKG@CV?$AA@", ptr @"??_C@_03JMHEAPMO@INT?$AA@" }, %struct.anon.0 { ptr @"??_C@_08MGKGFJNM@_prev_cu?$AA@", ptr @"??_C@_04PPJDIBFE@BOOL?$AA@" }], align 4
@"??_C@_03JMHEAPMO@INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"INT\00", comdat, align 1
@il_rtedge_structure_create_catalog_arith.rows = internal constant [5 x %struct.anon.1] [%struct.anon.1 { ptr @"??_C@_02BIBFALEN@EN?$AA@", ptr @"??_C@_04PPJDIBFE@BOOL?$AA@" }, %struct.anon.1 { ptr @"??_C@_03IEPOJACM@IN1?$AA@", ptr @"??_C@_03JMHEAPMO@INT?$AA@" }, %struct.anon.1 { ptr @"??_C@_03KPNDMDOP@IN2?$AA@", ptr @"??_C@_03JMHEAPMO@INT?$AA@" }, %struct.anon.1 { ptr @"??_C@_03HPJEHLOM@ENO?$AA@", ptr @"??_C@_04PPJDIBFE@BOOL?$AA@" }, %struct.anon.1 { ptr @"??_C@_03KJGMBMID@OUT?$AA@", ptr @"??_C@_03JMHEAPMO@INT?$AA@" }], align 4

; Function Attrs: noinline nounwind optnone
define dso_local zeroext i8 @il_rtedge_registry_push(ptr noundef %0, i8 noundef zeroext %1) #0 {
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %5 = alloca ptr, align 4
  %6 = alloca i32, align 4
  store i8 %1, ptr %4, align 1
  store ptr %0, ptr %5, align 4
  %7 = load ptr, ptr %5, align 4
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  store i8 0, ptr %3, align 1
  br label %36

10:                                               ; preds = %2
  %11 = load i32, ptr @il_rtedge_tag_count, align 4
  %12 = icmp uge i32 %11, 4096
  br i1 %12, label %13, label %14

13:                                               ; preds = %10
  store i8 0, ptr %3, align 1
  br label %36

14:                                               ; preds = %10
  %15 = load ptr, ptr %5, align 4
  %16 = call i32 @il_rtedge_str_len_bounded(ptr noundef %15, i32 noundef 111)
  store i32 %16, ptr %6, align 4
  %17 = load i32, ptr @il_rtedge_tag_count, align 4
  %18 = getelementptr inbounds nuw [4096 x [112 x i8]], ptr @il_rtedge_tag_storage, i32 0, i32 %17
  %19 = getelementptr inbounds [112 x i8], ptr %18, i32 0, i32 0
  %20 = load ptr, ptr %5, align 4
  %21 = load i32, ptr %6, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 1 %19, ptr align 1 %20, i32 %21, i1 false)
  %22 = load i32, ptr @il_rtedge_tag_count, align 4
  %23 = getelementptr inbounds nuw [4096 x [112 x i8]], ptr @il_rtedge_tag_storage, i32 0, i32 %22
  %24 = load i32, ptr %6, align 4
  %25 = getelementptr inbounds nuw [112 x i8], ptr %23, i32 0, i32 %24
  store i8 0, ptr %25, align 1
  %26 = load i8, ptr %4, align 1
  %27 = zext i8 %26 to i32
  %28 = icmp ne i32 %27, 0
  %29 = zext i1 %28 to i64
  %30 = select i1 %28, i32 1, i32 0
  %31 = trunc i32 %30 to i8
  %32 = load i32, ptr @il_rtedge_tag_count, align 4
  %33 = getelementptr inbounds nuw [4096 x i8], ptr @il_rtedge_tag_hidden, i32 0, i32 %32
  store i8 %31, ptr %33, align 1
  %34 = load i32, ptr @il_rtedge_tag_count, align 4
  %35 = add i32 %34, 1
  store i32 %35, ptr @il_rtedge_tag_count, align 4
  store i8 1, ptr %3, align 1
  br label %36

36:                                               ; preds = %14, %13, %9
  %37 = load i8, ptr %3, align 1
  ret i8 %37
}

; Function Attrs: noinline nounwind optnone
define internal i32 @il_rtedge_str_len_bounded(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 4
  %5 = alloca i32, align 4
  store i32 %1, ptr %3, align 4
  store ptr %0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %19, %2
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %3, align 4
  %9 = icmp ult i32 %7, %8
  br i1 %9, label %10, label %17

10:                                               ; preds = %6
  %11 = load ptr, ptr %4, align 4
  %12 = load i32, ptr %5, align 4
  %13 = getelementptr inbounds nuw i8, ptr %11, i32 %12
  %14 = load i8, ptr %13, align 1
  %15 = sext i8 %14 to i32
  %16 = icmp ne i32 %15, 0
  br label %17

17:                                               ; preds = %10, %6
  %18 = phi i1 [ false, %6 ], [ %16, %10 ]
  br i1 %18, label %19, label %22

19:                                               ; preds = %17
  %20 = load i32, ptr %5, align 4
  %21 = add i32 %20, 1
  store i32 %21, ptr %5, align 4
  br label %6, !llvm.loop !8

22:                                               ; preds = %17
  %23 = load i32, ptr %5, align 4
  ret i32 %23
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @il_rtedge_registry_clear() #0 {
  store i32 0, ptr @il_rtedge_tag_count, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local void @il_rtedge_registry_record_binding(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  store ptr %1, ptr %3, align 4
  store ptr %0, ptr %4, align 4
  %5 = load ptr, ptr %4, align 4
  %6 = load ptr, ptr %3, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local void @IlRtedgeRegistry_BindAllSlots() #0 {
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local void @plcp_rtedge_clear_instances() #0 {
  store i32 0, ptr @g_fb_count, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local void @plcp_rtedge_after_segment(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  store ptr %1, ptr %3, align 4
  store ptr %0, ptr %4, align 4
  %5 = load ptr, ptr %4, align 4
  %6 = icmp eq ptr %5, null
  br i1 %6, label %10, label %7

7:                                                ; preds = %2
  %8 = load ptr, ptr %3, align 4
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %7, %2
  br label %39

11:                                               ; preds = %7
  %12 = load i32, ptr @g_fb_count, align 4
  %13 = icmp uge i32 %12, 256
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  br label %39

15:                                               ; preds = %11
  %16 = load ptr, ptr %4, align 4
  %17 = call i32 @fb_index(ptr noundef %16)
  %18 = icmp sge i32 %17, 0
  br i1 %18, label %19, label %20

19:                                               ; preds = %15
  br label %39

20:                                               ; preds = %15
  %21 = load ptr, ptr %4, align 4
  %22 = load i32, ptr @g_fb_count, align 4
  %23 = getelementptr inbounds nuw [256 x [80 x i8]], ptr @g_fb_inst, i32 0, i32 %22
  %24 = getelementptr inbounds [80 x i8], ptr %23, i32 0, i32 0
  %25 = call ptr @strncpy(ptr noundef %24, ptr noundef %21, i32 noundef 79) #6
  %26 = load i32, ptr @g_fb_count, align 4
  %27 = getelementptr inbounds nuw [256 x [80 x i8]], ptr @g_fb_inst, i32 0, i32 %26
  %28 = getelementptr inbounds nuw [80 x i8], ptr %27, i32 0, i32 79
  store i8 0, ptr %28, align 1
  %29 = load ptr, ptr %3, align 4
  %30 = load i32, ptr @g_fb_count, align 4
  %31 = getelementptr inbounds nuw [256 x [32 x i8]], ptr @g_fb_family, i32 0, i32 %30
  %32 = getelementptr inbounds [32 x i8], ptr %31, i32 0, i32 0
  %33 = call ptr @strncpy(ptr noundef %32, ptr noundef %29, i32 noundef 31) #6
  %34 = load i32, ptr @g_fb_count, align 4
  %35 = getelementptr inbounds nuw [256 x [32 x i8]], ptr @g_fb_family, i32 0, i32 %34
  %36 = getelementptr inbounds nuw [32 x i8], ptr %35, i32 0, i32 31
  store i8 0, ptr %36, align 1
  %37 = load i32, ptr @g_fb_count, align 4
  %38 = add i32 %37, 1
  store i32 %38, ptr @g_fb_count, align 4
  br label %39

39:                                               ; preds = %20, %19, %14, %10
  ret void
}

; Function Attrs: noinline nounwind optnone
define internal i32 @fb_index(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %19, %1
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr @g_fb_count, align 4
  %8 = icmp ult i32 %6, %7
  br i1 %8, label %9, label %22

9:                                                ; preds = %5
  %10 = load ptr, ptr %3, align 4
  %11 = load i32, ptr %4, align 4
  %12 = getelementptr inbounds nuw [256 x [80 x i8]], ptr @g_fb_inst, i32 0, i32 %11
  %13 = getelementptr inbounds [80 x i8], ptr %12, i32 0, i32 0
  %14 = call i32 @strcmp(ptr noundef %13, ptr noundef %10) #6
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

16:                                               ; preds = %9
  %17 = load i32, ptr %4, align 4
  store i32 %17, ptr %2, align 4
  br label %23

18:                                               ; preds = %9
  br label %19

19:                                               ; preds = %18
  %20 = load i32, ptr %4, align 4
  %21 = add i32 %20, 1
  store i32 %21, ptr %4, align 4
  br label %5, !llvm.loop !10

22:                                               ; preds = %5
  store i32 -1, ptr %2, align 4
  br label %23

23:                                               ; preds = %22, %16
  %24 = load i32, ptr %2, align 4
  ret i32 %24
}

; Function Attrs: nounwind
declare dso_local ptr @strncpy(ptr noundef, ptr noundef, i32 noundef) #2

; Function Attrs: noinline nounwind optnone
define dso_local i32 @plcp_rtedge_fb_segment_bytes_by_name(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 4
  store ptr %0, ptr %3, align 4
  %4 = load ptr, ptr %3, align 4
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %164

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 4
  %9 = call i32 @family_is_type_conversion_en(ptr noundef %8)
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %7
  store i32 16, ptr %2, align 4
  br label %164

12:                                               ; preds = %7
  %13 = load ptr, ptr %3, align 4
  %14 = call i32 @strncmp(ptr noundef %13, ptr noundef @"??_C@_06EHOFKDJC@R_TRIG?$AA@", i32 noundef 6) #6
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %20, label %16

16:                                               ; preds = %12
  %17 = load ptr, ptr %3, align 4
  %18 = call i32 @strncmp(ptr noundef %17, ptr noundef @"??_C@_06NEHEBLEP@F_TRIG?$AA@", i32 noundef 6) #6
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %21

20:                                               ; preds = %16, %12
  store i32 12, ptr %2, align 4
  br label %164

21:                                               ; preds = %16
  %22 = load ptr, ptr %3, align 4
  %23 = call i32 @strncmp(ptr noundef %22, ptr noundef @"??_C@_03IPOIBAGA@TON?$AA@", i32 noundef 3) #6
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %29, label %25

25:                                               ; preds = %21
  %26 = load ptr, ptr %3, align 4
  %27 = call i32 @strncmp(ptr noundef %26, ptr noundef @"??_C@_03EHDBJKGI@TOF?$AA@", i32 noundef 3) #6
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %30

29:                                               ; preds = %25, %21
  store i32 24, ptr %2, align 4
  br label %164

30:                                               ; preds = %25
  %31 = load ptr, ptr %3, align 4
  %32 = call i32 @strncmp(ptr noundef %31, ptr noundef @"??_C@_02NBLAPNNF@TP?$AA@", i32 noundef 2) #6
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %35

34:                                               ; preds = %30
  store i32 40, ptr %2, align 4
  br label %164

35:                                               ; preds = %30
  %36 = load ptr, ptr %3, align 4
  %37 = call i32 @strncmp(ptr noundef %36, ptr noundef @"??_C@_04JMIDNENE@CTUD?$AA@", i32 noundef 4) #6
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %40

39:                                               ; preds = %35
  store i32 48, ptr %2, align 4
  br label %164

40:                                               ; preds = %35
  %41 = load ptr, ptr %3, align 4
  %42 = call i32 @strncmp(ptr noundef %41, ptr noundef @"??_C@_03PLGDPIEN@CTU?$AA@", i32 noundef 3) #6
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %48, label %44

44:                                               ; preds = %40
  %45 = load ptr, ptr %3, align 4
  %46 = call i32 @strncmp(ptr noundef %45, ptr noundef @"??_C@_03KILKNLFN@CTD?$AA@", i32 noundef 3) #6
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %49

48:                                               ; preds = %44, %40
  store i32 32, ptr %2, align 4
  br label %164

49:                                               ; preds = %44
  %50 = load ptr, ptr %3, align 4
  %51 = call i32 @strncmp(ptr noundef %50, ptr noundef @"??_C@_03BOJFLAKG@ADD?$AA@", i32 noundef 3) #6
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %69, label %53

53:                                               ; preds = %49
  %54 = load ptr, ptr %3, align 4
  %55 = call i32 @strncmp(ptr noundef %54, ptr noundef @"??_C@_03KPDLEBHD@SUB?$AA@", i32 noundef 3) #6
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %69, label %57

57:                                               ; preds = %53
  %58 = load ptr, ptr %3, align 4
  %59 = call i32 @strncmp(ptr noundef %58, ptr noundef @"??_C@_03IBHOEMFB@MUL?$AA@", i32 noundef 3) #6
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %69, label %61

61:                                               ; preds = %57
  %62 = load ptr, ptr %3, align 4
  %63 = call i32 @strncmp(ptr noundef %62, ptr noundef @"??_C@_03FJGHKDBE@DIV?$AA@", i32 noundef 3) #6
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %69, label %65

65:                                               ; preds = %61
  %66 = load ptr, ptr %3, align 4
  %67 = call i32 @strncmp(ptr noundef %66, ptr noundef @"??_C@_03FIBGOAPP@MOD?$AA@", i32 noundef 3) #6
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %70

69:                                               ; preds = %65, %61, %57, %53, %49
  store i32 16, ptr %2, align 4
  br label %164

70:                                               ; preds = %65
  %71 = load ptr, ptr %3, align 4
  %72 = call i32 @strcmp(ptr noundef %71, ptr noundef @"??_C@_03BDACDFHA@AND?$AA@") #6
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %94, label %74

74:                                               ; preds = %70
  %75 = load ptr, ptr %3, align 4
  %76 = call i32 @strcmp(ptr noundef %75, ptr noundef @"??_C@_02PDPFNDMG@OR?$AA@") #6
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %94, label %78

78:                                               ; preds = %74
  %79 = load ptr, ptr %3, align 4
  %80 = call i32 @strcmp(ptr noundef %79, ptr noundef @"??_C@_03CDEJPCIF@XOR?$AA@") #6
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %94, label %82

82:                                               ; preds = %78
  %83 = load ptr, ptr %3, align 4
  %84 = call i32 @strcmp(ptr noundef %83, ptr noundef @"??_C@_04DOOMBBIC@ANDN?$AA@") #6
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %94, label %86

86:                                               ; preds = %82
  %87 = load ptr, ptr %3, align 4
  %88 = call i32 @strcmp(ptr noundef %87, ptr noundef @"??_C@_03BMAOPANN@ORN?$AA@") #6
  %89 = icmp eq i32 %88, 0
  br i1 %89, label %94, label %90

90:                                               ; preds = %86
  %91 = load ptr, ptr %3, align 4
  %92 = call i32 @strcmp(ptr noundef %91, ptr noundef @"??_C@_04PDALFMNG@XORN?$AA@") #6
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %94, label %95

94:                                               ; preds = %90, %86, %82, %78, %74, %70
  store i32 16, ptr %2, align 4
  br label %164

95:                                               ; preds = %90
  %96 = load ptr, ptr %3, align 4
  %97 = call i32 @strcmp(ptr noundef %96, ptr noundef @"??_C@_02NFEPAFND@EQ?$AA@") #6
  %98 = icmp eq i32 %97, 0
  br i1 %98, label %119, label %99

99:                                               ; preds = %95
  %100 = load ptr, ptr %3, align 4
  %101 = call i32 @strcmp(ptr noundef %100, ptr noundef @"??_C@_02PHLEDNGH@NE?$AA@") #6
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %119, label %103

103:                                              ; preds = %99
  %104 = load ptr, ptr %3, align 4
  %105 = call i32 @strcmp(ptr noundef %104, ptr noundef @"??_C@_02KLLMCFPI@GT?$AA@") #6
  %106 = icmp eq i32 %105, 0
  br i1 %106, label %119, label %107

107:                                              ; preds = %103
  %108 = load ptr, ptr %3, align 4
  %109 = call i32 @strcmp(ptr noundef %108, ptr noundef @"??_C@_02PIGFAGOI@GE?$AA@") #6
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %119, label %111

111:                                              ; preds = %107
  %112 = load ptr, ptr %3, align 4
  %113 = call i32 @strcmp(ptr noundef %112, ptr noundef @"??_C@_02KHOJMKBJ@LT?$AA@") #6
  %114 = icmp eq i32 %113, 0
  br i1 %114, label %119, label %115

115:                                              ; preds = %111
  %116 = load ptr, ptr %3, align 4
  %117 = call i32 @strcmp(ptr noundef %116, ptr noundef @"??_C@_02PEDAOJAJ@LE?$AA@") #6
  %118 = icmp eq i32 %117, 0
  br i1 %118, label %119, label %120

119:                                              ; preds = %115, %111, %107, %103, %99, %95
  store i32 16, ptr %2, align 4
  br label %164

120:                                              ; preds = %115
  %121 = load ptr, ptr %3, align 4
  %122 = call i32 @strcmp(ptr noundef %121, ptr noundef @"??_C@_03GBFNEA@NOT?$AA@") #6
  %123 = icmp eq i32 %122, 0
  br i1 %123, label %124, label %125

124:                                              ; preds = %120
  store i32 16, ptr %2, align 4
  br label %164

125:                                              ; preds = %120
  %126 = load ptr, ptr %3, align 4
  %127 = call i32 @strcmp(ptr noundef %126, ptr noundef @"??_C@_04LPPGDFDD@MOVE?$AA@") #6
  %128 = icmp eq i32 %127, 0
  br i1 %128, label %145, label %129

129:                                              ; preds = %125
  %130 = load ptr, ptr %3, align 4
  %131 = call i32 @strcmp(ptr noundef %130, ptr noundef @"??_C@_02BHMEDAMC@LN?$AA@") #6
  %132 = icmp eq i32 %131, 0
  br i1 %132, label %145, label %133

133:                                              ; preds = %129
  %134 = load ptr, ptr %3, align 4
  %135 = call i32 @strcmp(ptr noundef %134, ptr noundef @"??_C@_03MLIHNEFJ@LOG?$AA@") #6
  %136 = icmp eq i32 %135, 0
  br i1 %136, label %145, label %137

137:                                              ; preds = %133
  %138 = load ptr, ptr %3, align 4
  %139 = call i32 @strcmp(ptr noundef %138, ptr noundef @"??_C@_03KKGFKKLA@EXP?$AA@") #6
  %140 = icmp eq i32 %139, 0
  br i1 %140, label %145, label %141

141:                                              ; preds = %137
  %142 = load ptr, ptr %3, align 4
  %143 = call i32 @strcmp(ptr noundef %142, ptr noundef @"??_C@_04BFBMEOHG@EXPT?$AA@") #6
  %144 = icmp eq i32 %143, 0
  br i1 %144, label %145, label %146

145:                                              ; preds = %141, %137, %133, %129, %125
  store i32 16, ptr %2, align 4
  br label %164

146:                                              ; preds = %141
  %147 = load ptr, ptr %3, align 4
  %148 = call i32 @strcmp(ptr noundef %147, ptr noundef @"??_C@_03PBAHGDAB@SHR?$AA@") #6
  %149 = icmp eq i32 %148, 0
  br i1 %149, label %162, label %150

150:                                              ; preds = %146
  %151 = load ptr, ptr %3, align 4
  %152 = call i32 @strcmp(ptr noundef %151, ptr noundef @"??_C@_03CFEGFMNO@SHL?$AA@") #6
  %153 = icmp eq i32 %152, 0
  br i1 %153, label %162, label %154

154:                                              ; preds = %150
  %155 = load ptr, ptr %3, align 4
  %156 = call i32 @strcmp(ptr noundef %155, ptr noundef @"??_C@_03JILFCNDO@ROL?$AA@") #6
  %157 = icmp eq i32 %156, 0
  br i1 %157, label %162, label %158

158:                                              ; preds = %154
  %159 = load ptr, ptr %3, align 4
  %160 = call i32 @strcmp(ptr noundef %159, ptr noundef @"??_C@_08CEHGKHCN@BIT_TEST?$AA@") #6
  %161 = icmp eq i32 %160, 0
  br i1 %161, label %162, label %163

162:                                              ; preds = %158, %154, %150, %146
  store i32 16, ptr %2, align 4
  br label %164

163:                                              ; preds = %158
  store i32 0, ptr %2, align 4
  br label %164

164:                                              ; preds = %163, %162, %145, %124, %119, %94, %69, %48, %39, %34, %29, %20, %11, %6
  %165 = load i32, ptr %2, align 4
  ret i32 %165
}

; Function Attrs: noinline nounwind optnone
define internal i32 @family_is_type_conversion_en(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 4
  store ptr %0, ptr %3, align 4
  %4 = load ptr, ptr %3, align 4
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %54

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 4
  %9 = call i32 @strncmp(ptr noundef %8, ptr noundef @"??_C@_08GHDCOMMC@WORD_TO_?$AA@", i32 noundef 8) #6
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %51, label %11

11:                                               ; preds = %7
  %12 = load ptr, ptr %3, align 4
  %13 = call i32 @strncmp(ptr noundef %12, ptr noundef @"??_C@_09PFOADHMA@DWORD_TO_?$AA@", i32 noundef 9) #6
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %51, label %15

15:                                               ; preds = %11
  %16 = load ptr, ptr %3, align 4
  %17 = call i32 @strncmp(ptr noundef %16, ptr noundef @"??_C@_09MNAGFOAE@UDINT_TO_?$AA@", i32 noundef 9) #6
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %51, label %19

19:                                               ; preds = %15
  %20 = load ptr, ptr %3, align 4
  %21 = call i32 @strncmp(ptr noundef %20, ptr noundef @"??_C@_07JHONPGBM@INT_TO_?$AA@", i32 noundef 7) #6
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %51, label %23

23:                                               ; preds = %19
  %24 = load ptr, ptr %3, align 4
  %25 = call i32 @strncmp(ptr noundef %24, ptr noundef @"??_C@_08GAALBHL@REAL_TO_?$AA@", i32 noundef 8) #6
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %51, label %27

27:                                               ; preds = %23
  %28 = load ptr, ptr %3, align 4
  %29 = call i32 @strncmp(ptr noundef %28, ptr noundef @"??_C@_09IHAFCKIN@LREAL_TO_?$AA@", i32 noundef 9) #6
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %51, label %31

31:                                               ; preds = %27
  %32 = load ptr, ptr %3, align 4
  %33 = call i32 @strncmp(ptr noundef %32, ptr noundef @"??_C@_08GLDPJEJP@BOOL_TO_?$AA@", i32 noundef 8) #6
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %51, label %35

35:                                               ; preds = %31
  %36 = load ptr, ptr %3, align 4
  %37 = call i32 @strncmp(ptr noundef %36, ptr noundef @"??_C@_08JDDNDFMP@BYTE_TO_?$AA@", i32 noundef 8) #6
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %51, label %39

39:                                               ; preds = %35
  %40 = load ptr, ptr %3, align 4
  %41 = call i32 @strncmp(ptr noundef %40, ptr noundef @"??_C@_08FPBJEAGI@SINT_TO_?$AA@", i32 noundef 8) #6
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %51, label %43

43:                                               ; preds = %39
  %44 = load ptr, ptr %3, align 4
  %45 = call i32 @strncmp(ptr noundef %44, ptr noundef @"??_C@_08CMADDJOC@UINT_TO_?$AA@", i32 noundef 8) #6
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %51, label %47

47:                                               ; preds = %43
  %48 = load ptr, ptr %3, align 4
  %49 = call i32 @strncmp(ptr noundef %48, ptr noundef @"??_C@_09FKHHBLM@USINT_TO_?$AA@", i32 noundef 9) #6
  %50 = icmp eq i32 %49, 0
  br label %51

51:                                               ; preds = %47, %43, %39, %35, %31, %27, %23, %19, %15, %11, %7
  %52 = phi i1 [ true, %43 ], [ true, %39 ], [ true, %35 ], [ true, %31 ], [ true, %27 ], [ true, %23 ], [ true, %19 ], [ true, %15 ], [ true, %11 ], [ true, %7 ], [ %50, %47 ]
  %53 = zext i1 %52 to i32
  store i32 %53, ptr %2, align 4
  br label %54

54:                                               ; preds = %51, %6
  %55 = load i32, ptr %2, align 4
  ret i32 %55
}

; Function Attrs: nounwind
declare dso_local i32 @strncmp(ptr noundef, ptr noundef, i32 noundef) #2

; Function Attrs: nounwind
declare dso_local i32 @strcmp(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone
define dso_local i32 @plcp_rtedge_fb_member_offset(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  store ptr %1, ptr %4, align 4
  store ptr %0, ptr %5, align 4
  %6 = load ptr, ptr %5, align 4
  %7 = icmp eq ptr %6, null
  br i1 %7, label %11, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr %4, align 4
  %10 = icmp eq ptr %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %8, %2
  store i32 -1, ptr %3, align 4
  br label %316

12:                                               ; preds = %8
  %13 = load ptr, ptr %5, align 4
  %14 = call i32 @family_is_type_conversion_en(ptr noundef %13)
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %19

16:                                               ; preds = %12
  %17 = load ptr, ptr %4, align 4
  %18 = call i32 @not_en_member_offset(ptr noundef %17)
  store i32 %18, ptr %3, align 4
  br label %316

19:                                               ; preds = %12
  %20 = load ptr, ptr %5, align 4
  %21 = call i32 @strncmp(ptr noundef %20, ptr noundef @"??_C@_06EHOFKDJC@R_TRIG?$AA@", i32 noundef 6) #6
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %27, label %23

23:                                               ; preds = %19
  %24 = load ptr, ptr %5, align 4
  %25 = call i32 @strncmp(ptr noundef %24, ptr noundef @"??_C@_06NEHEBLEP@F_TRIG?$AA@", i32 noundef 6) #6
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %30

27:                                               ; preds = %23, %19
  %28 = load ptr, ptr %4, align 4
  %29 = call i32 @trig_edge_member_offset(ptr noundef %28)
  store i32 %29, ptr %3, align 4
  br label %316

30:                                               ; preds = %23
  %31 = load ptr, ptr %5, align 4
  %32 = call i32 @strcmp(ptr noundef %31, ptr noundef @"??_C@_04LPPGDFDD@MOVE?$AA@") #6
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %46, label %34

34:                                               ; preds = %30
  %35 = load ptr, ptr %5, align 4
  %36 = call i32 @strcmp(ptr noundef %35, ptr noundef @"??_C@_02BHMEDAMC@LN?$AA@") #6
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %46, label %38

38:                                               ; preds = %34
  %39 = load ptr, ptr %5, align 4
  %40 = call i32 @strcmp(ptr noundef %39, ptr noundef @"??_C@_03MLIHNEFJ@LOG?$AA@") #6
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %46, label %42

42:                                               ; preds = %38
  %43 = load ptr, ptr %5, align 4
  %44 = call i32 @strcmp(ptr noundef %43, ptr noundef @"??_C@_03KKGFKKLA@EXP?$AA@") #6
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %49

46:                                               ; preds = %42, %38, %34, %30
  %47 = load ptr, ptr %4, align 4
  %48 = call i32 @not_en_member_offset(ptr noundef %47)
  store i32 %48, ptr %3, align 4
  br label %316

49:                                               ; preds = %42
  %50 = load ptr, ptr %5, align 4
  %51 = call i32 @strcmp(ptr noundef %50, ptr noundef @"??_C@_04BFBMEOHG@EXPT?$AA@") #6
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %69, label %53

53:                                               ; preds = %49
  %54 = load ptr, ptr %5, align 4
  %55 = call i32 @strcmp(ptr noundef %54, ptr noundef @"??_C@_03PBAHGDAB@SHR?$AA@") #6
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %69, label %57

57:                                               ; preds = %53
  %58 = load ptr, ptr %5, align 4
  %59 = call i32 @strcmp(ptr noundef %58, ptr noundef @"??_C@_03CFEGFMNO@SHL?$AA@") #6
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %69, label %61

61:                                               ; preds = %57
  %62 = load ptr, ptr %5, align 4
  %63 = call i32 @strcmp(ptr noundef %62, ptr noundef @"??_C@_03JILFCNDO@ROL?$AA@") #6
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %69, label %65

65:                                               ; preds = %61
  %66 = load ptr, ptr %5, align 4
  %67 = call i32 @strcmp(ptr noundef %66, ptr noundef @"??_C@_08CEHGKHCN@BIT_TEST?$AA@") #6
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %72

69:                                               ; preds = %65, %61, %57, %53, %49
  %70 = load ptr, ptr %4, align 4
  %71 = call i32 @arith_member_offset(ptr noundef %70)
  store i32 %71, ptr %3, align 4
  br label %316

72:                                               ; preds = %65
  %73 = load ptr, ptr %5, align 4
  %74 = call i32 @strncmp(ptr noundef %73, ptr noundef @"??_C@_03IPOIBAGA@TON?$AA@", i32 noundef 3) #6
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %80, label %76

76:                                               ; preds = %72
  %77 = load ptr, ptr %5, align 4
  %78 = call i32 @strncmp(ptr noundef %77, ptr noundef @"??_C@_03EHDBJKGI@TOF?$AA@", i32 noundef 3) #6
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %83

80:                                               ; preds = %76, %72
  %81 = load ptr, ptr %4, align 4
  %82 = call i32 @ton_like_offset(ptr noundef %81)
  store i32 %82, ptr %3, align 4
  br label %316

83:                                               ; preds = %76
  %84 = load ptr, ptr %5, align 4
  %85 = call i32 @strncmp(ptr noundef %84, ptr noundef @"??_C@_02NBLAPNNF@TP?$AA@", i32 noundef 2) #6
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %87, label %90

87:                                               ; preds = %83
  %88 = load ptr, ptr %4, align 4
  %89 = call i32 @ton_like_offset(ptr noundef %88)
  store i32 %89, ptr %3, align 4
  br label %316

90:                                               ; preds = %83
  %91 = load ptr, ptr %5, align 4
  %92 = call i32 @strncmp(ptr noundef %91, ptr noundef @"??_C@_04JMIDNENE@CTUD?$AA@", i32 noundef 4) #6
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %94, label %153

94:                                               ; preds = %90
  %95 = load ptr, ptr %4, align 4
  %96 = call i32 @strcmp(ptr noundef %95, ptr noundef @"??_C@_02LFKOLMGF@CU?$AA@") #6
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %98, label %99

98:                                               ; preds = %94
  store i32 0, ptr %3, align 4
  br label %316

99:                                               ; preds = %94
  %100 = load ptr, ptr %4, align 4
  %101 = call i32 @strcmp(ptr noundef %100, ptr noundef @"??_C@_02OGHHJPHF@CD?$AA@") #6
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %103, label %104

103:                                              ; preds = %99
  store i32 1, ptr %3, align 4
  br label %316

104:                                              ; preds = %99
  %105 = load ptr, ptr %4, align 4
  %106 = call i32 @strcmp(ptr noundef %105, ptr noundef @"??_C@_05OOFGFHKO@RESET?$AA@") #6
  %107 = icmp eq i32 %106, 0
  br i1 %107, label %108, label %109

108:                                              ; preds = %104
  store i32 2, ptr %3, align 4
  br label %316

109:                                              ; preds = %104
  %110 = load ptr, ptr %4, align 4
  %111 = call i32 @strcmp(ptr noundef %110, ptr noundef @"??_C@_04ICOEJIDH@LOAD?$AA@") #6
  %112 = icmp eq i32 %111, 0
  br i1 %112, label %113, label %114

113:                                              ; preds = %109
  store i32 3, ptr %3, align 4
  br label %316

114:                                              ; preds = %109
  %115 = load ptr, ptr %4, align 4
  %116 = call i32 @strcmp(ptr noundef %115, ptr noundef @"??_C@_02IAODPCIP@PV?$AA@") #6
  %117 = icmp eq i32 %116, 0
  br i1 %117, label %118, label %119

118:                                              ; preds = %114
  store i32 4, ptr %3, align 4
  br label %316

119:                                              ; preds = %114
  %120 = load ptr, ptr %4, align 4
  %121 = call i32 @strcmp(ptr noundef %120, ptr noundef @"??_C@_02KKAMMLHL@QU?$AA@") #6
  %122 = icmp eq i32 %121, 0
  br i1 %122, label %123, label %124

123:                                              ; preds = %119
  store i32 6, ptr %3, align 4
  br label %316

124:                                              ; preds = %119
  %125 = load ptr, ptr %4, align 4
  %126 = call i32 @strcmp(ptr noundef %125, ptr noundef @"??_C@_02PJNFOIGL@QD?$AA@") #6
  %127 = icmp eq i32 %126, 0
  br i1 %127, label %128, label %129

128:                                              ; preds = %124
  store i32 7, ptr %3, align 4
  br label %316

129:                                              ; preds = %124
  %130 = load ptr, ptr %4, align 4
  %131 = call i32 @strcmp(ptr noundef %130, ptr noundef @"??_C@_02JOIDOPKG@CV?$AA@") #6
  %132 = icmp eq i32 %131, 0
  br i1 %132, label %133, label %134

133:                                              ; preds = %129
  store i32 8, ptr %3, align 4
  br label %316

134:                                              ; preds = %129
  %135 = load ptr, ptr %4, align 4
  %136 = call i32 @strcmp(ptr noundef %135, ptr noundef @"??_C@_04FNGLAKOL@_CU_?$AA@") #6
  %137 = icmp eq i32 %136, 0
  br i1 %137, label %142, label %138

138:                                              ; preds = %134
  %139 = load ptr, ptr %4, align 4
  %140 = call i32 @strcmp(ptr noundef %139, ptr noundef @"??_C@_08MGKGFJNM@_prev_cu?$AA@") #6
  %141 = icmp eq i32 %140, 0
  br i1 %141, label %142, label %143

142:                                              ; preds = %138, %134
  store i32 10, ptr %3, align 4
  br label %316

143:                                              ; preds = %138
  %144 = load ptr, ptr %4, align 4
  %145 = call i32 @strcmp(ptr noundef %144, ptr noundef @"??_C@_04EAIPMDKM@_CD_?$AA@") #6
  %146 = icmp eq i32 %145, 0
  br i1 %146, label %151, label %147

147:                                              ; preds = %143
  %148 = load ptr, ptr %4, align 4
  %149 = call i32 @strcmp(ptr noundef %148, ptr noundef @"??_C@_08JFHPHKMM@_prev_cd?$AA@") #6
  %150 = icmp eq i32 %149, 0
  br i1 %150, label %151, label %152

151:                                              ; preds = %147, %143
  store i32 11, ptr %3, align 4
  br label %316

152:                                              ; preds = %147
  store i32 -1, ptr %3, align 4
  br label %316

153:                                              ; preds = %90
  %154 = load ptr, ptr %5, align 4
  %155 = call i32 @strncmp(ptr noundef %154, ptr noundef @"??_C@_03PLGDPIEN@CTU?$AA@", i32 noundef 3) #6
  %156 = icmp eq i32 %155, 0
  br i1 %156, label %157, label %192

157:                                              ; preds = %153
  %158 = load ptr, ptr %4, align 4
  %159 = call i32 @strcmp(ptr noundef %158, ptr noundef @"??_C@_02LFKOLMGF@CU?$AA@") #6
  %160 = icmp eq i32 %159, 0
  br i1 %160, label %161, label %162

161:                                              ; preds = %157
  store i32 0, ptr %3, align 4
  br label %316

162:                                              ; preds = %157
  %163 = load ptr, ptr %4, align 4
  %164 = call i32 @strcmp(ptr noundef %163, ptr noundef @"??_C@_05OOFGFHKO@RESET?$AA@") #6
  %165 = icmp eq i32 %164, 0
  br i1 %165, label %166, label %167

166:                                              ; preds = %162
  store i32 1, ptr %3, align 4
  br label %316

167:                                              ; preds = %162
  %168 = load ptr, ptr %4, align 4
  %169 = call i32 @strcmp(ptr noundef %168, ptr noundef @"??_C@_02IAODPCIP@PV?$AA@") #6
  %170 = icmp eq i32 %169, 0
  br i1 %170, label %171, label %172

171:                                              ; preds = %167
  store i32 2, ptr %3, align 4
  br label %316

172:                                              ; preds = %167
  %173 = load ptr, ptr %4, align 4
  %174 = call i32 @strcmp(ptr noundef %173, ptr noundef @"??_C@_01BNIGIBBF@Q?$AA@") #6
  %175 = icmp eq i32 %174, 0
  br i1 %175, label %176, label %177

176:                                              ; preds = %172
  store i32 4, ptr %3, align 4
  br label %316

177:                                              ; preds = %172
  %178 = load ptr, ptr %4, align 4
  %179 = call i32 @strcmp(ptr noundef %178, ptr noundef @"??_C@_02JOIDOPKG@CV?$AA@") #6
  %180 = icmp eq i32 %179, 0
  br i1 %180, label %181, label %182

181:                                              ; preds = %177
  store i32 5, ptr %3, align 4
  br label %316

182:                                              ; preds = %177
  %183 = load ptr, ptr %4, align 4
  %184 = call i32 @strcmp(ptr noundef %183, ptr noundef @"??_C@_04FNGLAKOL@_CU_?$AA@") #6
  %185 = icmp eq i32 %184, 0
  br i1 %185, label %190, label %186

186:                                              ; preds = %182
  %187 = load ptr, ptr %4, align 4
  %188 = call i32 @strcmp(ptr noundef %187, ptr noundef @"??_C@_08MGKGFJNM@_prev_cu?$AA@") #6
  %189 = icmp eq i32 %188, 0
  br i1 %189, label %190, label %191

190:                                              ; preds = %186, %182
  store i32 7, ptr %3, align 4
  br label %316

191:                                              ; preds = %186
  store i32 -1, ptr %3, align 4
  br label %316

192:                                              ; preds = %153
  %193 = load ptr, ptr %5, align 4
  %194 = call i32 @strncmp(ptr noundef %193, ptr noundef @"??_C@_03KILKNLFN@CTD?$AA@", i32 noundef 3) #6
  %195 = icmp eq i32 %194, 0
  br i1 %195, label %196, label %231

196:                                              ; preds = %192
  %197 = load ptr, ptr %4, align 4
  %198 = call i32 @strcmp(ptr noundef %197, ptr noundef @"??_C@_02OGHHJPHF@CD?$AA@") #6
  %199 = icmp eq i32 %198, 0
  br i1 %199, label %200, label %201

200:                                              ; preds = %196
  store i32 0, ptr %3, align 4
  br label %316

201:                                              ; preds = %196
  %202 = load ptr, ptr %4, align 4
  %203 = call i32 @strcmp(ptr noundef %202, ptr noundef @"??_C@_04ICOEJIDH@LOAD?$AA@") #6
  %204 = icmp eq i32 %203, 0
  br i1 %204, label %205, label %206

205:                                              ; preds = %201
  store i32 1, ptr %3, align 4
  br label %316

206:                                              ; preds = %201
  %207 = load ptr, ptr %4, align 4
  %208 = call i32 @strcmp(ptr noundef %207, ptr noundef @"??_C@_02IAODPCIP@PV?$AA@") #6
  %209 = icmp eq i32 %208, 0
  br i1 %209, label %210, label %211

210:                                              ; preds = %206
  store i32 2, ptr %3, align 4
  br label %316

211:                                              ; preds = %206
  %212 = load ptr, ptr %4, align 4
  %213 = call i32 @strcmp(ptr noundef %212, ptr noundef @"??_C@_01BNIGIBBF@Q?$AA@") #6
  %214 = icmp eq i32 %213, 0
  br i1 %214, label %215, label %216

215:                                              ; preds = %211
  store i32 4, ptr %3, align 4
  br label %316

216:                                              ; preds = %211
  %217 = load ptr, ptr %4, align 4
  %218 = call i32 @strcmp(ptr noundef %217, ptr noundef @"??_C@_02JOIDOPKG@CV?$AA@") #6
  %219 = icmp eq i32 %218, 0
  br i1 %219, label %220, label %221

220:                                              ; preds = %216
  store i32 5, ptr %3, align 4
  br label %316

221:                                              ; preds = %216
  %222 = load ptr, ptr %4, align 4
  %223 = call i32 @strcmp(ptr noundef %222, ptr noundef @"??_C@_04EAIPMDKM@_CD_?$AA@") #6
  %224 = icmp eq i32 %223, 0
  br i1 %224, label %229, label %225

225:                                              ; preds = %221
  %226 = load ptr, ptr %4, align 4
  %227 = call i32 @strcmp(ptr noundef %226, ptr noundef @"??_C@_08JFHPHKMM@_prev_cd?$AA@") #6
  %228 = icmp eq i32 %227, 0
  br i1 %228, label %229, label %230

229:                                              ; preds = %225, %221
  store i32 7, ptr %3, align 4
  br label %316

230:                                              ; preds = %225
  store i32 -1, ptr %3, align 4
  br label %316

231:                                              ; preds = %192
  %232 = load ptr, ptr %5, align 4
  %233 = call i32 @strncmp(ptr noundef %232, ptr noundef @"??_C@_03BOJFLAKG@ADD?$AA@", i32 noundef 3) #6
  %234 = icmp eq i32 %233, 0
  br i1 %234, label %251, label %235

235:                                              ; preds = %231
  %236 = load ptr, ptr %5, align 4
  %237 = call i32 @strncmp(ptr noundef %236, ptr noundef @"??_C@_03KPDLEBHD@SUB?$AA@", i32 noundef 3) #6
  %238 = icmp eq i32 %237, 0
  br i1 %238, label %251, label %239

239:                                              ; preds = %235
  %240 = load ptr, ptr %5, align 4
  %241 = call i32 @strncmp(ptr noundef %240, ptr noundef @"??_C@_03IBHOEMFB@MUL?$AA@", i32 noundef 3) #6
  %242 = icmp eq i32 %241, 0
  br i1 %242, label %251, label %243

243:                                              ; preds = %239
  %244 = load ptr, ptr %5, align 4
  %245 = call i32 @strncmp(ptr noundef %244, ptr noundef @"??_C@_03FJGHKDBE@DIV?$AA@", i32 noundef 3) #6
  %246 = icmp eq i32 %245, 0
  br i1 %246, label %251, label %247

247:                                              ; preds = %243
  %248 = load ptr, ptr %5, align 4
  %249 = call i32 @strncmp(ptr noundef %248, ptr noundef @"??_C@_03FIBGOAPP@MOD?$AA@", i32 noundef 3) #6
  %250 = icmp eq i32 %249, 0
  br i1 %250, label %251, label %254

251:                                              ; preds = %247, %243, %239, %235, %231
  %252 = load ptr, ptr %4, align 4
  %253 = call i32 @arith_member_offset(ptr noundef %252)
  store i32 %253, ptr %3, align 4
  br label %316

254:                                              ; preds = %247
  %255 = load ptr, ptr %5, align 4
  %256 = call i32 @strcmp(ptr noundef %255, ptr noundef @"??_C@_03BDACDFHA@AND?$AA@") #6
  %257 = icmp eq i32 %256, 0
  br i1 %257, label %278, label %258

258:                                              ; preds = %254
  %259 = load ptr, ptr %5, align 4
  %260 = call i32 @strcmp(ptr noundef %259, ptr noundef @"??_C@_02PDPFNDMG@OR?$AA@") #6
  %261 = icmp eq i32 %260, 0
  br i1 %261, label %278, label %262

262:                                              ; preds = %258
  %263 = load ptr, ptr %5, align 4
  %264 = call i32 @strcmp(ptr noundef %263, ptr noundef @"??_C@_03CDEJPCIF@XOR?$AA@") #6
  %265 = icmp eq i32 %264, 0
  br i1 %265, label %278, label %266

266:                                              ; preds = %262
  %267 = load ptr, ptr %5, align 4
  %268 = call i32 @strcmp(ptr noundef %267, ptr noundef @"??_C@_04DOOMBBIC@ANDN?$AA@") #6
  %269 = icmp eq i32 %268, 0
  br i1 %269, label %278, label %270

270:                                              ; preds = %266
  %271 = load ptr, ptr %5, align 4
  %272 = call i32 @strcmp(ptr noundef %271, ptr noundef @"??_C@_03BMAOPANN@ORN?$AA@") #6
  %273 = icmp eq i32 %272, 0
  br i1 %273, label %278, label %274

274:                                              ; preds = %270
  %275 = load ptr, ptr %5, align 4
  %276 = call i32 @strcmp(ptr noundef %275, ptr noundef @"??_C@_04PDALFMNG@XORN?$AA@") #6
  %277 = icmp eq i32 %276, 0
  br i1 %277, label %278, label %281

278:                                              ; preds = %274, %270, %266, %262, %258, %254
  %279 = load ptr, ptr %4, align 4
  %280 = call i32 @arith_member_offset(ptr noundef %279)
  store i32 %280, ptr %3, align 4
  br label %316

281:                                              ; preds = %274
  %282 = load ptr, ptr %5, align 4
  %283 = call i32 @strcmp(ptr noundef %282, ptr noundef @"??_C@_02NFEPAFND@EQ?$AA@") #6
  %284 = icmp eq i32 %283, 0
  br i1 %284, label %305, label %285

285:                                              ; preds = %281
  %286 = load ptr, ptr %5, align 4
  %287 = call i32 @strcmp(ptr noundef %286, ptr noundef @"??_C@_02PHLEDNGH@NE?$AA@") #6
  %288 = icmp eq i32 %287, 0
  br i1 %288, label %305, label %289

289:                                              ; preds = %285
  %290 = load ptr, ptr %5, align 4
  %291 = call i32 @strcmp(ptr noundef %290, ptr noundef @"??_C@_02KLLMCFPI@GT?$AA@") #6
  %292 = icmp eq i32 %291, 0
  br i1 %292, label %305, label %293

293:                                              ; preds = %289
  %294 = load ptr, ptr %5, align 4
  %295 = call i32 @strcmp(ptr noundef %294, ptr noundef @"??_C@_02PIGFAGOI@GE?$AA@") #6
  %296 = icmp eq i32 %295, 0
  br i1 %296, label %305, label %297

297:                                              ; preds = %293
  %298 = load ptr, ptr %5, align 4
  %299 = call i32 @strcmp(ptr noundef %298, ptr noundef @"??_C@_02KHOJMKBJ@LT?$AA@") #6
  %300 = icmp eq i32 %299, 0
  br i1 %300, label %305, label %301

301:                                              ; preds = %297
  %302 = load ptr, ptr %5, align 4
  %303 = call i32 @strcmp(ptr noundef %302, ptr noundef @"??_C@_02PEDAOJAJ@LE?$AA@") #6
  %304 = icmp eq i32 %303, 0
  br i1 %304, label %305, label %308

305:                                              ; preds = %301, %297, %293, %289, %285, %281
  %306 = load ptr, ptr %4, align 4
  %307 = call i32 @arith_member_offset(ptr noundef %306)
  store i32 %307, ptr %3, align 4
  br label %316

308:                                              ; preds = %301
  %309 = load ptr, ptr %5, align 4
  %310 = call i32 @strcmp(ptr noundef %309, ptr noundef @"??_C@_03GBFNEA@NOT?$AA@") #6
  %311 = icmp eq i32 %310, 0
  br i1 %311, label %312, label %315

312:                                              ; preds = %308
  %313 = load ptr, ptr %4, align 4
  %314 = call i32 @not_en_member_offset(ptr noundef %313)
  store i32 %314, ptr %3, align 4
  br label %316

315:                                              ; preds = %308
  store i32 -1, ptr %3, align 4
  br label %316

316:                                              ; preds = %315, %312, %305, %278, %251, %230, %229, %220, %215, %210, %205, %200, %191, %190, %181, %176, %171, %166, %161, %152, %151, %142, %133, %128, %123, %118, %113, %108, %103, %98, %87, %80, %69, %46, %27, %16, %11
  %317 = load i32, ptr %3, align 4
  ret i32 %317
}

; Function Attrs: noinline nounwind optnone
define internal i32 @not_en_member_offset(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 4
  store ptr %0, ptr %3, align 4
  %4 = load ptr, ptr %3, align 4
  %5 = call i32 @strcmp(ptr noundef %4, ptr noundef @"??_C@_02BIBFALEN@EN?$AA@") #6
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %24

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 4
  %10 = call i32 @strcmp(ptr noundef %9, ptr noundef @"??_C@_02BBAPPCCJ@IN?$AA@") #6
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %8
  store i32 1, ptr %2, align 4
  br label %24

13:                                               ; preds = %8
  %14 = load ptr, ptr %3, align 4
  %15 = call i32 @strcmp(ptr noundef %14, ptr noundef @"??_C@_03HPJEHLOM@ENO?$AA@") #6
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %13
  store i32 5, ptr %2, align 4
  br label %24

18:                                               ; preds = %13
  %19 = load ptr, ptr %3, align 4
  %20 = call i32 @strcmp(ptr noundef %19, ptr noundef @"??_C@_03KJGMBMID@OUT?$AA@") #6
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %18
  store i32 6, ptr %2, align 4
  br label %24

23:                                               ; preds = %18
  store i32 -1, ptr %2, align 4
  br label %24

24:                                               ; preds = %23, %22, %17, %12, %7
  %25 = load i32, ptr %2, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind optnone
define internal i32 @trig_edge_member_offset(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 4
  store ptr %0, ptr %3, align 4
  %4 = load ptr, ptr %3, align 4
  %5 = call i32 @strcmp(ptr noundef %4, ptr noundef @"??_C@_03DNBHDFFK@CLK?$AA@") #6
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %23

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 4
  %10 = call i32 @strcmp(ptr noundef %9, ptr noundef @"??_C@_01BNIGIBBF@Q?$AA@") #6
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %8
  store i32 1, ptr %2, align 4
  br label %23

13:                                               ; preds = %8
  %14 = load ptr, ptr %3, align 4
  %15 = call i32 @strcmp(ptr noundef %14, ptr noundef @"??_C@_09BKFNBCDF@_prev_clk?$AA@") #6
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %21, label %17

17:                                               ; preds = %13
  %18 = load ptr, ptr %3, align 4
  %19 = call i32 @strcmp(ptr noundef %18, ptr noundef @"??_C@_09KEDAADBG@_PREV_CLK?$AA@") #6
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %17, %13
  store i32 2, ptr %2, align 4
  br label %23

22:                                               ; preds = %17
  store i32 -1, ptr %2, align 4
  br label %23

23:                                               ; preds = %22, %21, %12, %7
  %24 = load i32, ptr %2, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone
define internal i32 @arith_member_offset(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 4
  store ptr %0, ptr %3, align 4
  %4 = load ptr, ptr %3, align 4
  %5 = call i32 @strcmp(ptr noundef %4, ptr noundef @"??_C@_02BIBFALEN@EN?$AA@") #6
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %29

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 4
  %10 = call i32 @strcmp(ptr noundef %9, ptr noundef @"??_C@_03IEPOJACM@IN1?$AA@") #6
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %8
  store i32 1, ptr %2, align 4
  br label %29

13:                                               ; preds = %8
  %14 = load ptr, ptr %3, align 4
  %15 = call i32 @strcmp(ptr noundef %14, ptr noundef @"??_C@_03KPNDMDOP@IN2?$AA@") #6
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %13
  store i32 5, ptr %2, align 4
  br label %29

18:                                               ; preds = %13
  %19 = load ptr, ptr %3, align 4
  %20 = call i32 @strcmp(ptr noundef %19, ptr noundef @"??_C@_03HPJEHLOM@ENO?$AA@") #6
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %18
  store i32 9, ptr %2, align 4
  br label %29

23:                                               ; preds = %18
  %24 = load ptr, ptr %3, align 4
  %25 = call i32 @strcmp(ptr noundef %24, ptr noundef @"??_C@_03KJGMBMID@OUT?$AA@") #6
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %28

27:                                               ; preds = %23
  store i32 10, ptr %2, align 4
  br label %29

28:                                               ; preds = %23
  store i32 -1, ptr %2, align 4
  br label %29

29:                                               ; preds = %28, %27, %22, %17, %12, %7
  %30 = load i32, ptr %2, align 4
  ret i32 %30
}

; Function Attrs: noinline nounwind optnone
define internal i32 @ton_like_offset(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 4
  store ptr %0, ptr %3, align 4
  %4 = load ptr, ptr %3, align 4
  %5 = call i32 @strcmp(ptr noundef %4, ptr noundef @"??_C@_02BIBFALEN@EN?$AA@") #6
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %39

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 4
  %10 = call i32 @strcmp(ptr noundef %9, ptr noundef @"??_C@_02BBAPPCCJ@IN?$AA@") #6
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %8
  store i32 1, ptr %2, align 4
  br label %39

13:                                               ; preds = %8
  %14 = load ptr, ptr %3, align 4
  %15 = call i32 @strcmp(ptr noundef %14, ptr noundef @"??_C@_02LCNFJAAN@PT?$AA@") #6
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %13
  store i32 4, ptr %2, align 4
  br label %39

18:                                               ; preds = %13
  %19 = load ptr, ptr %3, align 4
  %20 = call i32 @strcmp(ptr noundef %19, ptr noundef @"??_C@_02KIDIPBJG@ET?$AA@") #6
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %18
  store i32 8, ptr %2, align 4
  br label %39

23:                                               ; preds = %18
  %24 = load ptr, ptr %3, align 4
  %25 = call i32 @strcmp(ptr noundef %24, ptr noundef @"??_C@_01BNIGIBBF@Q?$AA@") #6
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %28

27:                                               ; preds = %23
  store i32 12, ptr %2, align 4
  br label %39

28:                                               ; preds = %23
  %29 = load ptr, ptr %3, align 4
  %30 = call i32 @strcmp(ptr noundef %29, ptr noundef @"??_C@_04CCKFKGBO@_IN_?$AA@") #6
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %33

32:                                               ; preds = %28
  store i32 13, ptr %2, align 4
  br label %39

33:                                               ; preds = %28
  %34 = load ptr, ptr %3, align 4
  %35 = call i32 @strcmp(ptr noundef %34, ptr noundef @"??_C@_08FINOKCPO@_STTIME_?$AA@") #6
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %38

37:                                               ; preds = %33
  store i32 16, ptr %2, align 4
  br label %39

38:                                               ; preds = %33
  store i32 -1, ptr %2, align 4
  br label %39

39:                                               ; preds = %38, %37, %32, %27, %22, %17, %12, %7
  %40 = load i32, ptr %2, align 4
  ret i32 %40
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @plcp_rtedge_ton_member_offset(ptr noundef %0) #0 {
  %2 = alloca ptr, align 4
  store ptr %0, ptr %2, align 4
  %3 = load ptr, ptr %2, align 4
  %4 = call i32 @plcp_rtedge_fb_member_offset(ptr noundef @"??_C@_03IPOIBAGA@TON?$AA@", ptr noundef %3)
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @plcp_rtedge_ton_segment_bytes() #0 {
  ret i32 24
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @plcp_rtedge_parse_fb_pin(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3, i32 noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 4
  %11 = alloca ptr, align 4
  %12 = alloca ptr, align 4
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 4
  store i32 %4, ptr %7, align 4
  store ptr %3, ptr %8, align 4
  store i32 %2, ptr %9, align 4
  store ptr %1, ptr %10, align 4
  store ptr %0, ptr %11, align 4
  %15 = load ptr, ptr %11, align 4
  %16 = icmp eq ptr %15, null
  br i1 %16, label %29, label %17

17:                                               ; preds = %5
  %18 = load ptr, ptr %10, align 4
  %19 = icmp eq ptr %18, null
  br i1 %19, label %29, label %20

20:                                               ; preds = %17
  %21 = load ptr, ptr %8, align 4
  %22 = icmp eq ptr %21, null
  br i1 %22, label %29, label %23

23:                                               ; preds = %20
  %24 = load i32, ptr %9, align 4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %29, label %26

26:                                               ; preds = %23
  %27 = load i32, ptr %7, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %30

29:                                               ; preds = %26, %23, %20, %17, %5
  store i32 0, ptr %6, align 4
  br label %79

30:                                               ; preds = %26
  %31 = load ptr, ptr %11, align 4
  %32 = call ptr @strrchr(ptr noundef %31, i32 noundef 46) #6
  store ptr %32, ptr %12, align 4
  %33 = load ptr, ptr %12, align 4
  %34 = icmp eq ptr %33, null
  br i1 %34, label %39, label %35

35:                                               ; preds = %30
  %36 = load ptr, ptr %12, align 4
  %37 = load ptr, ptr %11, align 4
  %38 = icmp eq ptr %36, %37
  br i1 %38, label %39, label %40

39:                                               ; preds = %35, %30
  store i32 0, ptr %6, align 4
  br label %79

40:                                               ; preds = %35
  %41 = load ptr, ptr %12, align 4
  %42 = load ptr, ptr %11, align 4
  %43 = ptrtoint ptr %41 to i32
  %44 = ptrtoint ptr %42 to i32
  %45 = sub i32 %43, %44
  store i32 %45, ptr %13, align 4
  %46 = load i32, ptr %13, align 4
  %47 = load i32, ptr %9, align 4
  %48 = icmp uge i32 %46, %47
  br i1 %48, label %49, label %50

49:                                               ; preds = %40
  store i32 0, ptr %6, align 4
  br label %79

50:                                               ; preds = %40
  %51 = load ptr, ptr %10, align 4
  %52 = load ptr, ptr %11, align 4
  %53 = load i32, ptr %13, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 1 %51, ptr align 1 %52, i32 %53, i1 false)
  %54 = load ptr, ptr %10, align 4
  %55 = load i32, ptr %13, align 4
  %56 = getelementptr inbounds nuw i8, ptr %54, i32 %55
  store i8 0, ptr %56, align 1
  %57 = load ptr, ptr %10, align 4
  %58 = call ptr @family_for_inst(ptr noundef %57)
  store ptr %58, ptr %14, align 4
  %59 = load ptr, ptr %14, align 4
  %60 = icmp eq ptr %59, null
  br i1 %60, label %61, label %62

61:                                               ; preds = %50
  store i32 0, ptr %6, align 4
  br label %79

62:                                               ; preds = %50
  %63 = load i32, ptr %7, align 4
  %64 = sub i32 %63, 1
  %65 = load ptr, ptr %12, align 4
  %66 = getelementptr inbounds i8, ptr %65, i32 1
  %67 = load ptr, ptr %8, align 4
  %68 = call ptr @strncpy(ptr noundef %67, ptr noundef %66, i32 noundef %64) #6
  %69 = load ptr, ptr %8, align 4
  %70 = load i32, ptr %7, align 4
  %71 = sub i32 %70, 1
  %72 = getelementptr inbounds nuw i8, ptr %69, i32 %71
  store i8 0, ptr %72, align 1
  %73 = load ptr, ptr %8, align 4
  %74 = load ptr, ptr %14, align 4
  %75 = call i32 @plcp_rtedge_fb_member_offset(ptr noundef %74, ptr noundef %73)
  %76 = icmp slt i32 %75, 0
  br i1 %76, label %77, label %78

77:                                               ; preds = %62
  store i32 0, ptr %6, align 4
  br label %79

78:                                               ; preds = %62
  store i32 1, ptr %6, align 4
  br label %79

79:                                               ; preds = %78, %77, %61, %49, %39, %29
  %80 = load i32, ptr %6, align 4
  ret i32 %80
}

; Function Attrs: nounwind
declare dso_local ptr @strrchr(ptr noundef, i32 noundef) #2

; Function Attrs: noinline nounwind optnone
define internal ptr @family_for_inst(ptr noundef %0) #0 {
  %2 = alloca ptr, align 4
  %3 = alloca ptr, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 4
  %5 = load ptr, ptr %3, align 4
  %6 = call i32 @fb_index(ptr noundef %5)
  store i32 %6, ptr %4, align 4
  %7 = load i32, ptr %4, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %1
  store ptr null, ptr %2, align 4
  br label %14

10:                                               ; preds = %1
  %11 = load i32, ptr %4, align 4
  %12 = getelementptr inbounds nuw [256 x [32 x i8]], ptr @g_fb_family, i32 0, i32 %11
  %13 = getelementptr inbounds [32 x i8], ptr %12, i32 0, i32 0
  store ptr %13, ptr %2, align 4
  br label %14

14:                                               ; preds = %10, %9
  %15 = load ptr, ptr %2, align 4
  ret ptr %15
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @plcp_rtedge_parse_ton_pin(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3, i32 noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 4
  %10 = alloca ptr, align 4
  store i32 %4, ptr %6, align 4
  store ptr %3, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store ptr %1, ptr %9, align 4
  store ptr %0, ptr %10, align 4
  %11 = load i32, ptr %6, align 4
  %12 = load ptr, ptr %7, align 4
  %13 = load i32, ptr %8, align 4
  %14 = load ptr, ptr %9, align 4
  %15 = load ptr, ptr %10, align 4
  %16 = call i32 @plcp_rtedge_parse_fb_pin(ptr noundef %15, ptr noundef %14, i32 noundef %13, ptr noundef %12, i32 noundef %11)
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone
define dso_local zeroext i8 @Rtedge_TagCreateByInstruction(ptr noundef %0, i8 noundef zeroext %1) #0 {
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %5 = alloca ptr, align 4
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 4
  %11 = alloca ptr, align 4
  %12 = alloca ptr, align 4
  %13 = alloca i16, align 2
  %14 = alloca i16, align 2
  %15 = alloca i32, align 4
  %16 = alloca [256 x i8], align 1
  %17 = alloca i16, align 2
  %18 = alloca i16, align 2
  %19 = alloca ptr, align 4
  %20 = alloca i16, align 2
  %21 = alloca ptr, align 4
  %22 = alloca ptr, align 4
  store i8 %1, ptr %4, align 1
  store ptr %0, ptr %5, align 4
  store i8 0, ptr %6, align 1
  store i8 0, ptr %7, align 1
  %23 = load ptr, ptr %5, align 4
  %24 = icmp eq ptr %23, null
  br i1 %24, label %25, label %26

25:                                               ; preds = %2
  store i8 0, ptr %3, align 1
  br label %189

26:                                               ; preds = %2
  %27 = load ptr, ptr %5, align 4
  %28 = call i32 @strlen(ptr noundef %27) #6
  %29 = add i32 %28, 1
  store i32 %29, ptr %9, align 4
  store ptr @il_kw, ptr %19, align 4
  br label %30

30:                                               ; preds = %173, %26
  %31 = load ptr, ptr %19, align 4
  %32 = getelementptr inbounds nuw %struct.IlKeywordMatch, ptr %31, i32 0, i32 0
  %33 = load ptr, ptr %32, align 4
  %34 = icmp ne ptr %33, null
  br i1 %34, label %35, label %176

35:                                               ; preds = %30
  %36 = load ptr, ptr %19, align 4
  %37 = getelementptr inbounds nuw %struct.IlKeywordMatch, ptr %36, i32 0, i32 0
  %38 = load ptr, ptr %37, align 4
  %39 = call i32 @strlen(ptr noundef %38) #6
  store i32 %39, ptr %8, align 4
  %40 = load i32, ptr %8, align 4
  %41 = load ptr, ptr %19, align 4
  %42 = getelementptr inbounds nuw %struct.IlKeywordMatch, ptr %41, i32 0, i32 0
  %43 = load ptr, ptr %42, align 4
  %44 = load ptr, ptr %5, align 4
  %45 = call i32 @strncmp(ptr noundef %44, ptr noundef %43, i32 noundef %40) #6
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %173

47:                                               ; preds = %35
  %48 = load i32, ptr %9, align 4
  %49 = call ptr @malloc(i32 noundef %48) #7
  store ptr %49, ptr %10, align 4
  %50 = load ptr, ptr %10, align 4
  %51 = icmp eq ptr %50, null
  br i1 %51, label %52, label %53

52:                                               ; preds = %47
  store i8 0, ptr %3, align 1
  br label %189

53:                                               ; preds = %47
  %54 = load ptr, ptr %10, align 4
  %55 = load ptr, ptr %5, align 4
  %56 = load i32, ptr %9, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 1 %54, ptr align 1 %55, i32 %56, i1 false)
  %57 = load ptr, ptr %19, align 4
  %58 = getelementptr inbounds nuw %struct.IlKeywordMatch, ptr %57, i32 0, i32 1
  %59 = load i16, ptr %58, align 4
  store i16 %59, ptr %13, align 2
  %60 = load i16, ptr %13, align 2
  %61 = zext i16 %60 to i32
  %62 = icmp eq i32 %61, 1059
  br i1 %62, label %63, label %118

63:                                               ; preds = %53
  %64 = load ptr, ptr %10, align 4
  %65 = call ptr @strrchr(ptr noundef %64, i32 noundef 35) #6
  store ptr %65, ptr %11, align 4
  %66 = load ptr, ptr %11, align 4
  %67 = icmp eq ptr %66, null
  br i1 %67, label %68, label %70

68:                                               ; preds = %63
  %69 = load ptr, ptr %10, align 4
  call void @free(ptr noundef %69)
  store i8 0, ptr %3, align 1
  br label %189

70:                                               ; preds = %63
  %71 = load ptr, ptr %11, align 4
  store i8 0, ptr %71, align 1
  %72 = load ptr, ptr %11, align 4
  %73 = getelementptr inbounds i8, ptr %72, i32 1
  store ptr %73, ptr %11, align 4
  %74 = load ptr, ptr %10, align 4
  %75 = load i32, ptr %8, align 4
  %76 = getelementptr inbounds nuw i8, ptr %74, i32 %75
  store ptr %76, ptr %12, align 4
  store i16 256, ptr %18, align 2
  store i16 0, ptr %17, align 2
  %77 = load i16, ptr %18, align 2
  %78 = getelementptr inbounds [256 x i8], ptr %16, i32 0, i32 0
  %79 = load ptr, ptr %10, align 4
  %80 = load ptr, ptr %12, align 4
  %81 = call zeroext i16 @il_fb_segment_size_bytes(ptr noundef %80)
  %82 = load i16, ptr %13, align 2
  %83 = call zeroext i16 @il_iec_to_edge(i16 noundef zeroext %82)
  %84 = load ptr, ptr %11, align 4
  %85 = call i32 @EgTagCreateSegment(ptr noundef %84, i16 noundef zeroext %83, i16 noundef zeroext %81, ptr noundef %79, ptr noundef @"??_C@_00CNPNBAHC@?$AA@", ptr noundef %78, i16 noundef zeroext %77, ptr noundef %17)
  store i32 %85, ptr %15, align 4
  %86 = load i32, ptr %15, align 4
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %88, label %117

88:                                               ; preds = %70
  %89 = load ptr, ptr %12, align 4
  %90 = call zeroext i16 @il_fb_segment_size_bytes(ptr noundef %89)
  store i16 %90, ptr %20, align 2
  %91 = load i16, ptr %20, align 2
  %92 = zext i16 %91 to i32
  %93 = call ptr @calloc(i32 noundef 1, i32 noundef %92) #8
  store ptr %93, ptr %21, align 4
  %94 = load ptr, ptr %21, align 4
  %95 = icmp ne ptr %94, null
  br i1 %95, label %96, label %104

96:                                               ; preds = %88
  %97 = load i16, ptr %20, align 2
  %98 = zext i16 %97 to i32
  %99 = trunc i32 %98 to i16
  %100 = load ptr, ptr %21, align 4
  %101 = load ptr, ptr %11, align 4
  %102 = call i32 @EgTagWriteSegment(ptr noundef %101, i16 noundef zeroext 0, ptr noundef %100, i16 noundef zeroext %99)
  %103 = load ptr, ptr %21, align 4
  call void @free(ptr noundef %103)
  br label %104

104:                                              ; preds = %96, %88
  %105 = load ptr, ptr %12, align 4
  %106 = load ptr, ptr %11, align 4
  call void @plcp_rtedge_after_segment(ptr noundef %106, ptr noundef %105)
  %107 = load ptr, ptr %12, align 4
  %108 = call zeroext i8 @il_rtedge_fb_has_structure_catalog(ptr noundef %107)
  %109 = icmp ne i8 %108, 0
  br i1 %109, label %110, label %116

110:                                              ; preds = %104
  %111 = load i8, ptr %4, align 1
  %112 = load ptr, ptr %5, align 4
  %113 = call zeroext i8 @il_rtedge_registry_push(ptr noundef %112, i8 noundef zeroext %111)
  %114 = load ptr, ptr %11, align 4
  %115 = load ptr, ptr %12, align 4
  call void @il_rtedge_structure_create_catalog_members(ptr noundef %115, ptr noundef %114)
  store i8 1, ptr %7, align 1
  br label %116

116:                                              ; preds = %110, %104
  store i8 1, ptr %6, align 1
  br label %117

117:                                              ; preds = %116, %70
  br label %171

118:                                              ; preds = %53
  %119 = load i16, ptr %13, align 2
  %120 = zext i16 %119 to i32
  %121 = icmp eq i32 %120, 1346
  br i1 %121, label %122, label %150

122:                                              ; preds = %118
  %123 = load ptr, ptr %10, align 4
  %124 = load i32, ptr %8, align 4
  %125 = getelementptr inbounds nuw i8, ptr %123, i32 %124
  store ptr %125, ptr %11, align 4
  store i16 256, ptr %18, align 2
  store i16 0, ptr %17, align 2
  %126 = load i8, ptr %4, align 1
  %127 = icmp ne i8 %126, 0
  br i1 %127, label %148, label %128

128:                                              ; preds = %122
  %129 = load i16, ptr %18, align 2
  %130 = getelementptr inbounds [256 x i8], ptr %16, i32 0, i32 0
  %131 = load i16, ptr %13, align 2
  %132 = call zeroext i16 @il_iec_to_edge(i16 noundef zeroext %131)
  %133 = load ptr, ptr %11, align 4
  %134 = call i32 @EgTagCreateSegment(ptr noundef %133, i16 noundef zeroext %132, i16 noundef zeroext 83, ptr noundef @"??_C@_07DCPMEJPJ@STRING?$CD?$AA@", ptr noundef @"??_C@_00CNPNBAHC@?$AA@", ptr noundef %130, i16 noundef zeroext %129, ptr noundef %17)
  store i32 %134, ptr %15, align 4
  %135 = load i32, ptr %15, align 4
  %136 = icmp eq i32 %135, 0
  br i1 %136, label %137, label %147

137:                                              ; preds = %128
  %138 = call ptr @calloc(i32 noundef 1, i32 noundef 83) #8
  store ptr %138, ptr %22, align 4
  %139 = load ptr, ptr %22, align 4
  %140 = icmp ne ptr %139, null
  br i1 %140, label %141, label %146

141:                                              ; preds = %137
  %142 = load ptr, ptr %22, align 4
  %143 = load ptr, ptr %11, align 4
  %144 = call i32 @EgTagWriteSegment(ptr noundef %143, i16 noundef zeroext 0, ptr noundef %142, i16 noundef zeroext 83)
  %145 = load ptr, ptr %22, align 4
  call void @free(ptr noundef %145)
  br label %146

146:                                              ; preds = %141, %137
  store i8 1, ptr %6, align 1
  br label %147

147:                                              ; preds = %146, %128
  br label %149

148:                                              ; preds = %122
  store i8 1, ptr %6, align 1
  br label %149

149:                                              ; preds = %148, %147
  br label %170

150:                                              ; preds = %118
  %151 = load ptr, ptr %10, align 4
  %152 = load i32, ptr %8, align 4
  %153 = getelementptr inbounds nuw i8, ptr %151, i32 %152
  store ptr %153, ptr %11, align 4
  %154 = load i16, ptr %13, align 2
  %155 = call zeroext i16 @il_iec_to_edge(i16 noundef zeroext %154)
  store i16 %155, ptr %14, align 2
  %156 = load i8, ptr %4, align 1
  %157 = icmp ne i8 %156, 0
  br i1 %157, label %168, label %158

158:                                              ; preds = %150
  %159 = load ptr, ptr %10, align 4
  %160 = load i16, ptr %14, align 2
  %161 = load ptr, ptr %11, align 4
  %162 = call i32 @EgTagCreateEx(ptr noundef %161, i16 noundef zeroext %160, ptr noundef %159, ptr noundef @"??_C@_00CNPNBAHC@?$AA@")
  store i32 %162, ptr %15, align 4
  %163 = load i32, ptr %15, align 4
  %164 = icmp eq i32 %163, 0
  %165 = zext i1 %164 to i64
  %166 = select i1 %164, i32 1, i32 0
  %167 = trunc i32 %166 to i8
  store i8 %167, ptr %6, align 1
  br label %169

168:                                              ; preds = %150
  store i8 1, ptr %6, align 1
  br label %169

169:                                              ; preds = %168, %158
  br label %170

170:                                              ; preds = %169, %149
  br label %171

171:                                              ; preds = %170, %117
  %172 = load ptr, ptr %10, align 4
  call void @free(ptr noundef %172)
  br label %176

173:                                              ; preds = %35
  %174 = load ptr, ptr %19, align 4
  %175 = getelementptr inbounds nuw %struct.IlKeywordMatch, ptr %174, i32 1
  store ptr %175, ptr %19, align 4
  br label %30, !llvm.loop !11

176:                                              ; preds = %171, %30
  %177 = load i8, ptr %6, align 1
  %178 = zext i8 %177 to i32
  %179 = icmp ne i32 %178, 0
  br i1 %179, label %180, label %187

180:                                              ; preds = %176
  %181 = load i8, ptr %7, align 1
  %182 = icmp ne i8 %181, 0
  br i1 %182, label %187, label %183

183:                                              ; preds = %180
  %184 = load i8, ptr %4, align 1
  %185 = load ptr, ptr %5, align 4
  %186 = call zeroext i8 @il_rtedge_registry_push(ptr noundef %185, i8 noundef zeroext %184)
  br label %187

187:                                              ; preds = %183, %180, %176
  %188 = load i8, ptr %6, align 1
  store i8 %188, ptr %3, align 1
  br label %189

189:                                              ; preds = %187, %68, %52, %25
  %190 = load i8, ptr %3, align 1
  ret i8 %190
}

; Function Attrs: nounwind
declare dso_local i32 @strlen(ptr noundef) #2

; Function Attrs: allocsize(0)
declare dso_local ptr @malloc(i32 noundef) #3

declare dso_local void @free(ptr noundef) #4

declare dllimport i32 @EgTagCreateSegment(ptr noundef, i16 noundef zeroext, i16 noundef zeroext, ptr noundef, ptr noundef, ptr noundef, i16 noundef zeroext, ptr noundef) #4

; Function Attrs: noinline nounwind optnone
define internal zeroext i16 @il_fb_segment_size_bytes(ptr noundef %0) #0 {
  %2 = alloca i16, align 2
  %3 = alloca ptr, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 4
  %5 = load ptr, ptr %3, align 4
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  store i16 64, ptr %2, align 2
  br label %17

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 4
  %10 = call i32 @plcp_rtedge_fb_segment_bytes_by_name(ptr noundef %9)
  store i32 %10, ptr %4, align 4
  %11 = load i32, ptr %4, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %16

13:                                               ; preds = %8
  %14 = load i32, ptr %4, align 4
  %15 = trunc i32 %14 to i16
  store i16 %15, ptr %2, align 2
  br label %17

16:                                               ; preds = %8
  store i16 64, ptr %2, align 2
  br label %17

17:                                               ; preds = %16, %13, %7
  %18 = load i16, ptr %2, align 2
  ret i16 %18
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i16 @il_iec_to_edge(i16 noundef zeroext %0) #0 {
  %2 = alloca i16, align 2
  %3 = alloca i16, align 2
  %4 = alloca ptr, align 4
  store i16 %0, ptr %3, align 2
  store ptr @il_kw, ptr %4, align 4
  br label %5

5:                                                ; preds = %24, %1
  %6 = load ptr, ptr %4, align 4
  %7 = getelementptr inbounds nuw %struct.IlKeywordMatch, ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %7, align 4
  %9 = icmp ne ptr %8, null
  br i1 %9, label %10, label %27

10:                                               ; preds = %5
  %11 = load ptr, ptr %4, align 4
  %12 = getelementptr inbounds nuw %struct.IlKeywordMatch, ptr %11, i32 0, i32 1
  %13 = load i16, ptr %12, align 4
  %14 = zext i16 %13 to i32
  %15 = load i16, ptr %3, align 2
  %16 = zext i16 %15 to i32
  %17 = icmp eq i32 %14, %16
  br i1 %17, label %18, label %23

18:                                               ; preds = %10
  %19 = load ptr, ptr %4, align 4
  %20 = getelementptr inbounds nuw %struct.IlKeywordMatch, ptr %19, i32 0, i32 2
  %21 = load i32, ptr %20, align 4
  %22 = trunc i32 %21 to i16
  store i16 %22, ptr %2, align 2
  br label %28

23:                                               ; preds = %10
  br label %24

24:                                               ; preds = %23
  %25 = load ptr, ptr %4, align 4
  %26 = getelementptr inbounds nuw %struct.IlKeywordMatch, ptr %25, i32 1
  store ptr %26, ptr %4, align 4
  br label %5, !llvm.loop !12

27:                                               ; preds = %5
  store i16 99, ptr %2, align 2
  br label %28

28:                                               ; preds = %27, %18
  %29 = load i16, ptr %2, align 2
  ret i16 %29
}

; Function Attrs: allocsize(0,1)
declare dso_local ptr @calloc(i32 noundef, i32 noundef) #5

declare dllimport i32 @EgTagWriteSegment(ptr noundef, i16 noundef zeroext, ptr noundef, i16 noundef zeroext) #4

; Function Attrs: noinline nounwind optnone
define internal zeroext i8 @il_rtedge_fb_has_structure_catalog(ptr noundef %0) #0 {
  %2 = alloca i8, align 1
  %3 = alloca ptr, align 4
  store ptr %0, ptr %3, align 4
  %4 = load ptr, ptr %3, align 4
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i8 0, ptr %2, align 1
  br label %47

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 4
  %9 = call i32 @strncmp(ptr noundef %8, ptr noundef @"??_C@_03IPOIBAGA@TON?$AA@", i32 noundef 3) #6
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %19, label %11

11:                                               ; preds = %7
  %12 = load ptr, ptr %3, align 4
  %13 = call i32 @strncmp(ptr noundef %12, ptr noundef @"??_C@_03EHDBJKGI@TOF?$AA@", i32 noundef 3) #6
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %19, label %15

15:                                               ; preds = %11
  %16 = load ptr, ptr %3, align 4
  %17 = call i32 @strncmp(ptr noundef %16, ptr noundef @"??_C@_02NBLAPNNF@TP?$AA@", i32 noundef 2) #6
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %20

19:                                               ; preds = %15, %11, %7
  store i8 1, ptr %2, align 1
  br label %47

20:                                               ; preds = %15
  %21 = load ptr, ptr %3, align 4
  %22 = call i32 @strncmp(ptr noundef %21, ptr noundef @"??_C@_03PLGDPIEN@CTU?$AA@", i32 noundef 3) #6
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %25

24:                                               ; preds = %20
  store i8 1, ptr %2, align 1
  br label %47

25:                                               ; preds = %20
  %26 = load ptr, ptr %3, align 4
  %27 = call i32 @strncmp(ptr noundef %26, ptr noundef @"??_C@_03BOJFLAKG@ADD?$AA@", i32 noundef 3) #6
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %45, label %29

29:                                               ; preds = %25
  %30 = load ptr, ptr %3, align 4
  %31 = call i32 @strncmp(ptr noundef %30, ptr noundef @"??_C@_03KPDLEBHD@SUB?$AA@", i32 noundef 3) #6
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %45, label %33

33:                                               ; preds = %29
  %34 = load ptr, ptr %3, align 4
  %35 = call i32 @strncmp(ptr noundef %34, ptr noundef @"??_C@_03IBHOEMFB@MUL?$AA@", i32 noundef 3) #6
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %45, label %37

37:                                               ; preds = %33
  %38 = load ptr, ptr %3, align 4
  %39 = call i32 @strncmp(ptr noundef %38, ptr noundef @"??_C@_03FJGHKDBE@DIV?$AA@", i32 noundef 3) #6
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %45, label %41

41:                                               ; preds = %37
  %42 = load ptr, ptr %3, align 4
  %43 = call i32 @strncmp(ptr noundef %42, ptr noundef @"??_C@_03FIBGOAPP@MOD?$AA@", i32 noundef 3) #6
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %46

45:                                               ; preds = %41, %37, %33, %29, %25
  store i8 1, ptr %2, align 1
  br label %47

46:                                               ; preds = %41
  store i8 0, ptr %2, align 1
  br label %47

47:                                               ; preds = %46, %45, %24, %19, %6
  %48 = load i8, ptr %2, align 1
  ret i8 %48
}

; Function Attrs: noinline nounwind optnone
define internal void @il_rtedge_structure_create_catalog_members(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  store ptr %1, ptr %3, align 4
  store ptr %0, ptr %4, align 4
  %5 = load ptr, ptr %4, align 4
  %6 = icmp eq ptr %5, null
  br i1 %6, label %10, label %7

7:                                                ; preds = %2
  %8 = load ptr, ptr %3, align 4
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %7, %2
  br label %53

11:                                               ; preds = %7
  %12 = load ptr, ptr %4, align 4
  %13 = call i32 @strncmp(ptr noundef %12, ptr noundef @"??_C@_03IPOIBAGA@TON?$AA@", i32 noundef 3) #6
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %23, label %15

15:                                               ; preds = %11
  %16 = load ptr, ptr %4, align 4
  %17 = call i32 @strncmp(ptr noundef %16, ptr noundef @"??_C@_03EHDBJKGI@TOF?$AA@", i32 noundef 3) #6
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %23, label %19

19:                                               ; preds = %15
  %20 = load ptr, ptr %4, align 4
  %21 = call i32 @strncmp(ptr noundef %20, ptr noundef @"??_C@_02NBLAPNNF@TP?$AA@", i32 noundef 2) #6
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %25

23:                                               ; preds = %19, %15, %11
  %24 = load ptr, ptr %3, align 4
  call void @il_rtedge_structure_create_catalog_ton(ptr noundef %24)
  br label %53

25:                                               ; preds = %19
  %26 = load ptr, ptr %4, align 4
  %27 = call i32 @strncmp(ptr noundef %26, ptr noundef @"??_C@_03PLGDPIEN@CTU?$AA@", i32 noundef 3) #6
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %31

29:                                               ; preds = %25
  %30 = load ptr, ptr %3, align 4
  call void @il_rtedge_structure_create_catalog_ctu(ptr noundef %30)
  br label %53

31:                                               ; preds = %25
  %32 = load ptr, ptr %4, align 4
  %33 = call i32 @strncmp(ptr noundef %32, ptr noundef @"??_C@_03BOJFLAKG@ADD?$AA@", i32 noundef 3) #6
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %51, label %35

35:                                               ; preds = %31
  %36 = load ptr, ptr %4, align 4
  %37 = call i32 @strncmp(ptr noundef %36, ptr noundef @"??_C@_03KPDLEBHD@SUB?$AA@", i32 noundef 3) #6
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %51, label %39

39:                                               ; preds = %35
  %40 = load ptr, ptr %4, align 4
  %41 = call i32 @strncmp(ptr noundef %40, ptr noundef @"??_C@_03IBHOEMFB@MUL?$AA@", i32 noundef 3) #6
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %51, label %43

43:                                               ; preds = %39
  %44 = load ptr, ptr %4, align 4
  %45 = call i32 @strncmp(ptr noundef %44, ptr noundef @"??_C@_03FJGHKDBE@DIV?$AA@", i32 noundef 3) #6
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %51, label %47

47:                                               ; preds = %43
  %48 = load ptr, ptr %4, align 4
  %49 = call i32 @strncmp(ptr noundef %48, ptr noundef @"??_C@_03FIBGOAPP@MOD?$AA@", i32 noundef 3) #6
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %53

51:                                               ; preds = %47, %43, %39, %35, %31
  %52 = load ptr, ptr %3, align 4
  call void @il_rtedge_structure_create_catalog_arith(ptr noundef %52)
  br label %53

53:                                               ; preds = %10, %23, %29, %51, %47
  ret void
}

declare dllimport i32 @EgTagCreateEx(ptr noundef, i16 noundef zeroext, ptr noundef, ptr noundef) #4

; Function Attrs: noinline nounwind optnone
define dso_local void @IlRtedge_BindTonPinSlot(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 4
  %6 = alloca ptr, align 4
  %7 = alloca ptr, align 4
  %8 = alloca ptr, align 4
  store i32 %2, ptr %4, align 4
  store ptr %1, ptr %5, align 4
  store ptr %0, ptr %6, align 4
  store ptr null, ptr %7, align 4
  %9 = load ptr, ptr %6, align 4
  %10 = icmp eq ptr %9, null
  br i1 %10, label %14, label %11

11:                                               ; preds = %3
  %12 = load ptr, ptr %5, align 4
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %15

14:                                               ; preds = %11, %3
  br label %34

15:                                               ; preds = %11
  %16 = load ptr, ptr %5, align 4
  %17 = call i32 @EgTagGetProperty(ptr noundef %16, ptr noundef @"??_C@_05HKHPEFOF@Entry?$AA@", ptr noundef %7, i32 noundef 4)
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %22, label %19

19:                                               ; preds = %15
  %20 = load ptr, ptr %7, align 4
  %21 = icmp eq ptr %20, null
  br i1 %21, label %22, label %23

22:                                               ; preds = %19, %15
  br label %34

23:                                               ; preds = %19
  %24 = load ptr, ptr %7, align 4
  %25 = call ptr @il_rtedge_dataptr_from_tagdesc(ptr noundef %24)
  store ptr %25, ptr %8, align 4
  %26 = load ptr, ptr %8, align 4
  %27 = icmp eq ptr %26, null
  br i1 %27, label %28, label %29

28:                                               ; preds = %23
  br label %34

29:                                               ; preds = %23
  %30 = load ptr, ptr %8, align 4
  %31 = load i32, ptr %4, align 4
  %32 = getelementptr inbounds nuw i8, ptr %30, i32 %31
  %33 = load ptr, ptr %6, align 4
  store ptr %32, ptr %33, align 4
  br label %34

34:                                               ; preds = %29, %28, %22, %14
  ret void
}

declare dllimport i32 @EgTagGetProperty(ptr noundef, ptr noundef, ptr noundef, i32 noundef) #4

; Function Attrs: noinline nounwind optnone
define internal ptr @il_rtedge_dataptr_from_tagdesc(ptr noundef %0) #0 {
  %2 = alloca ptr, align 4
  %3 = alloca ptr, align 4
  %4 = alloca i16, align 2
  store ptr %0, ptr %3, align 4
  %5 = load ptr, ptr %3, align 4
  %6 = getelementptr inbounds nuw %struct.tTagsDesc, ptr %5, i32 0, i32 3
  %7 = getelementptr inbounds nuw %struct.EgVARIANT, ptr %6, i32 0, i32 0
  %8 = getelementptr inbounds nuw %struct.anon.2, ptr %7, i32 0, i32 0
  %9 = load i16, ptr %8, align 1
  store i16 %9, ptr %4, align 2
  %10 = load i16, ptr %4, align 2
  %11 = zext i16 %10 to i32
  %12 = icmp eq i32 %11, 13
  br i1 %12, label %19, label %13

13:                                               ; preds = %1
  %14 = load ptr, ptr %3, align 4
  %15 = getelementptr inbounds nuw %struct.tTagsDesc, ptr %14, i32 0, i32 6
  %16 = getelementptr inbounds nuw %struct.tSHM_DESC, ptr %15, i32 0, i32 2
  %17 = load i32, ptr %16, align 1
  %18 = icmp eq i32 %17, 1
  br i1 %18, label %19, label %27

19:                                               ; preds = %13, %1
  %20 = load ptr, ptr %3, align 4
  %21 = getelementptr inbounds nuw %struct.tTagsDesc, ptr %20, i32 0, i32 3
  %22 = getelementptr inbounds nuw %struct.EgVARIANT, ptr %21, i32 0, i32 0
  %23 = getelementptr inbounds nuw %struct.anon.2, ptr %22, i32 0, i32 4
  %24 = load i64, ptr %23, align 1
  %25 = trunc i64 %24 to i32
  %26 = inttoptr i32 %25 to ptr
  store ptr %26, ptr %2, align 4
  br label %32

27:                                               ; preds = %13
  %28 = load ptr, ptr %3, align 4
  %29 = getelementptr inbounds nuw %struct.tTagsDesc, ptr %28, i32 0, i32 3
  %30 = getelementptr inbounds nuw %struct.EgVARIANT, ptr %29, i32 0, i32 0
  %31 = getelementptr inbounds nuw %struct.anon.2, ptr %30, i32 0, i32 3
  store ptr %31, ptr %2, align 4
  br label %32

32:                                               ; preds = %27, %19
  %33 = load ptr, ptr %2, align 4
  ret ptr %33
}

; Function Attrs: noinline nounwind optnone
define internal void @il_rtedge_structure_create_catalog_ton(ptr noundef %0) #0 {
  %2 = alloca ptr, align 4
  %3 = alloca [112 x i8], align 1
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 4
  %5 = load ptr, ptr %2, align 4
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  br label %32

8:                                                ; preds = %1
  store i32 0, ptr %4, align 4
  br label %9

9:                                                ; preds = %29, %8
  %10 = load i32, ptr %4, align 4
  %11 = icmp ult i32 %10, 6
  br i1 %11, label %12, label %32

12:                                               ; preds = %9
  %13 = load i32, ptr %4, align 4
  %14 = getelementptr inbounds nuw [6 x %struct.anon], ptr @il_rtedge_structure_create_catalog_ton.rows, i32 0, i32 %13
  %15 = getelementptr inbounds nuw %struct.anon, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 4
  %17 = load ptr, ptr %2, align 4
  %18 = load i32, ptr %4, align 4
  %19 = getelementptr inbounds nuw [6 x %struct.anon], ptr @il_rtedge_structure_create_catalog_ton.rows, i32 0, i32 %18
  %20 = getelementptr inbounds nuw %struct.anon, ptr %19, i32 0, i32 1
  %21 = load ptr, ptr %20, align 4
  %22 = getelementptr inbounds [112 x i8], ptr %3, i32 0, i32 0
  %23 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef %22, i32 noundef 112, ptr noundef @"??_C@_08JOHAOBGG@?$CFs?$CD?$CFs?4?$CFs?$AA@", ptr noundef %21, ptr noundef %17, ptr noundef %16) #6
  %24 = icmp sge i32 %23, 112
  br i1 %24, label %25, label %26

25:                                               ; preds = %12
  br label %29

26:                                               ; preds = %12
  %27 = getelementptr inbounds [112 x i8], ptr %3, i32 0, i32 0
  %28 = call zeroext i8 @il_rtedge_registry_push(ptr noundef %27, i8 noundef zeroext 0)
  br label %29

29:                                               ; preds = %26, %25
  %30 = load i32, ptr %4, align 4
  %31 = add i32 %30, 1
  store i32 %31, ptr %4, align 4
  br label %9, !llvm.loop !13

32:                                               ; preds = %7, %9
  ret void
}

; Function Attrs: noinline nounwind optnone
define internal void @il_rtedge_structure_create_catalog_ctu(ptr noundef %0) #0 {
  %2 = alloca ptr, align 4
  %3 = alloca [112 x i8], align 1
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 4
  %5 = load ptr, ptr %2, align 4
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  br label %32

8:                                                ; preds = %1
  store i32 0, ptr %4, align 4
  br label %9

9:                                                ; preds = %29, %8
  %10 = load i32, ptr %4, align 4
  %11 = icmp ult i32 %10, 6
  br i1 %11, label %12, label %32

12:                                               ; preds = %9
  %13 = load i32, ptr %4, align 4
  %14 = getelementptr inbounds nuw [6 x %struct.anon.0], ptr @il_rtedge_structure_create_catalog_ctu.rows, i32 0, i32 %13
  %15 = getelementptr inbounds nuw %struct.anon.0, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 4
  %17 = load ptr, ptr %2, align 4
  %18 = load i32, ptr %4, align 4
  %19 = getelementptr inbounds nuw [6 x %struct.anon.0], ptr @il_rtedge_structure_create_catalog_ctu.rows, i32 0, i32 %18
  %20 = getelementptr inbounds nuw %struct.anon.0, ptr %19, i32 0, i32 1
  %21 = load ptr, ptr %20, align 4
  %22 = getelementptr inbounds [112 x i8], ptr %3, i32 0, i32 0
  %23 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef %22, i32 noundef 112, ptr noundef @"??_C@_08JOHAOBGG@?$CFs?$CD?$CFs?4?$CFs?$AA@", ptr noundef %21, ptr noundef %17, ptr noundef %16) #6
  %24 = icmp sge i32 %23, 112
  br i1 %24, label %25, label %26

25:                                               ; preds = %12
  br label %29

26:                                               ; preds = %12
  %27 = getelementptr inbounds [112 x i8], ptr %3, i32 0, i32 0
  %28 = call zeroext i8 @il_rtedge_registry_push(ptr noundef %27, i8 noundef zeroext 0)
  br label %29

29:                                               ; preds = %26, %25
  %30 = load i32, ptr %4, align 4
  %31 = add i32 %30, 1
  store i32 %31, ptr %4, align 4
  br label %9, !llvm.loop !14

32:                                               ; preds = %7, %9
  ret void
}

; Function Attrs: noinline nounwind optnone
define internal void @il_rtedge_structure_create_catalog_arith(ptr noundef %0) #0 {
  %2 = alloca ptr, align 4
  %3 = alloca [112 x i8], align 1
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 4
  %5 = load ptr, ptr %2, align 4
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  br label %32

8:                                                ; preds = %1
  store i32 0, ptr %4, align 4
  br label %9

9:                                                ; preds = %29, %8
  %10 = load i32, ptr %4, align 4
  %11 = icmp ult i32 %10, 5
  br i1 %11, label %12, label %32

12:                                               ; preds = %9
  %13 = load i32, ptr %4, align 4
  %14 = getelementptr inbounds nuw [5 x %struct.anon.1], ptr @il_rtedge_structure_create_catalog_arith.rows, i32 0, i32 %13
  %15 = getelementptr inbounds nuw %struct.anon.1, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 4
  %17 = load ptr, ptr %2, align 4
  %18 = load i32, ptr %4, align 4
  %19 = getelementptr inbounds nuw [5 x %struct.anon.1], ptr @il_rtedge_structure_create_catalog_arith.rows, i32 0, i32 %18
  %20 = getelementptr inbounds nuw %struct.anon.1, ptr %19, i32 0, i32 1
  %21 = load ptr, ptr %20, align 4
  %22 = getelementptr inbounds [112 x i8], ptr %3, i32 0, i32 0
  %23 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef %22, i32 noundef 112, ptr noundef @"??_C@_08JOHAOBGG@?$CFs?$CD?$CFs?4?$CFs?$AA@", ptr noundef %21, ptr noundef %17, ptr noundef %16) #6
  %24 = icmp sge i32 %23, 112
  br i1 %24, label %25, label %26

25:                                               ; preds = %12
  br label %29

26:                                               ; preds = %12
  %27 = getelementptr inbounds [112 x i8], ptr %3, i32 0, i32 0
  %28 = call zeroext i8 @il_rtedge_registry_push(ptr noundef %27, i8 noundef zeroext 0)
  br label %29

29:                                               ; preds = %26, %25
  %30 = load i32, ptr %4, align 4
  %31 = add i32 %30, 1
  store i32 %31, ptr %4, align 4
  br label %9, !llvm.loop !15

32:                                               ; preds = %7, %9
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @snprintf(ptr noundef, i32 noundef, ptr noundef, ...) #2

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { allocsize(0) }
attributes #8 = { allocsize(0,1) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: false, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\..\\rtedge\\rtedgelink.c", directory: "D:\\work\\rtacc\\examples\\hugeplc")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{i32 1, !"MaxTLSAlign", i32 65536}
!7 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !9}
!13 = distinct !{!13, !9}
!14 = distinct !{!14, !9}
!15 = distinct !{!15, !9}
