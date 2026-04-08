; ModuleID = 'C:\D_DRV\work\rtacc\examples2\omron3000\omron_ecat_main.c'
source_filename = "C:\\D_DRV\\work\\rtacc\\examples2\\omron3000\\omron_ecat_main.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.TAG_SLAVE_DETAIL = type { i32, i16, i16, [4 x %struct.TAG_CATEGORYS], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.TAG_CATEGORYS = type { i16, i16, i16 }
%struct.OmronSlaveEntry = type { %struct.TAG_SLAVE_DETAIL, i16, i16 }

$LibVersion_0x0701 = comdat any

$"??_C@_0N@CIGOONNF@ECAT_EH_NODE?$AA@" = comdat any

$"??_C@_05HDDHMCAH@NodeA?$AA@" = comdat any

$"??_C@_04DOOIMPEH@used?$AA@" = comdat any

$"??_C@_07PPFHEIL@not?5set?$AA@" = comdat any

$"??_C@_0CI@NCPNENEA@EH?5node?5name?3?5?$CFs?5?$CIenv?5ECAT_EH_NO@" = comdat any

$"??_C@_06JEPJNHIO@EhOpen?$AA@" = comdat any

$"??_C@_0BC@HDAAJJMP@EhSetTimeoutForOD?$AA@" = comdat any

$"??_C@_0BD@PCGKLGFO@ECAT_OD_PREOP_ONLY?$AA@" = comdat any

$"??_C@_0BE@NNGOKNCF@ECAT_REQUIRE_SAFEOP?$AA@" = comdat any

$"??_C@_0BB@FMELMMAG@EhRqState?$CIPREOP?$CJ?$AA@" = comdat any

$"??_C@_0BJ@OMPNIHED@wait_master_state?$CIPREOP?$CJ?$AA@" = comdat any

$"??_C@_0BC@OKLOIOLL@EhRqState?$CISAFEOP?$CJ?$AA@" = comdat any

$"??_C@_0BK@OMLIINOP@wait_master_state?$CISAFEOP?$CJ?$AA@" = comdat any

$"??_C@_0DC@ENFINKMC@Master?5state?5after?5wait?3?5rq?$DN?$CFs?$CI?$CF@" = comdat any

$"??_C@_0CO@MGJCJBOB@EhGetState?5after?5wait?5failed?3?5rc@" = comdat any

$"??_C@_0BA@MPELDLJE@EhGetSlaveCount?$AA@" = comdat any

$"??_C@_0BP@BJEDEKGP@Configured?5slaves?5?$CIcount?$CJ?3?5?$CFu?6?$AA@" = comdat any

$"??_C@_00CNPNBAHC@?$AA@" = comdat any

$"??_C@_0BM@PEBAMHBK@ECAT_SLAVE_SAFEOP_BEFORE_OD?$AA@" = comdat any

$"??_C@_0BB@PMDLKLAD@ECAT_ALIAS_START?$AA@" = comdat any

$"??_C@_0P@LHFKHAHK@ECAT_ALIAS_END?$AA@" = comdat any

$"??_C@_0DA@MJJNADEA@EhFindSlaveByAlias?$CIalias?$DN?$CFu?$CJ?3?5rc@" = comdat any

$"??_C@_0CN@JIGFHOLF@Alias?$DN?$CFu?5vendor?5mismatch?3?5vendor@" = comdat any

$"??_C@_0CP@OPKBNJHD@Omron?5slave?5list?5full?5?$CI?$CFd?$CJ?0?5skip@" = comdat any

$"??_C@_0DL@ONLFGMNE@Found?5Omron?5alias?$DN?$CFu?5slaveNo?$DN?$CFlu@" = comdat any

$"??_C@_0DK@CLLEPENH@No?5Omron?5slaves?5in?5alias?5range?5?$CF@" = comdat any

$"??_C@_0CJ@GAOIJNFM@Request?5PREOP?5for?5?$CFd?5Omron?5slave@" = comdat any

$"??_C@_0CP@IIKLMIKD@EhRqSlaveState?$CIalias?$DN?$CFu?5PREOP?$CJ?5r@" = comdat any

$"??_C@_0BJ@KLHHNEIJ@ECAT_SLAVE_PREOP_WAIT_MS?$AA@" = comdat any

$"??_C@_0BH@OFECBMOC@ECAT_PREOP_WAIT_POLICY?$AA@" = comdat any

$"??_C@_0BF@CHJHKACA@ECAT_PREOP_READY_MIN?$AA@" = comdat any

$"??_C@_03OBJFJEBA@any?$AA@" = comdat any

$"??_C@_04CGFJFPFD@none?$AA@" = comdat any

$"??_C@_03NFKEKGGK@all?$AA@" = comdat any

$"??_C@_0EL@JGCLLIGC@PREOP?5wait?5policy?$DNall?3?5wait_all_@" = comdat any

$"??_C@_0CH@KCLEMHLE@wait_all_slaves_state_monitored?$CI@" = comdat any

$"??_C@_0FE@KEOJIPIA@PREOP?5wait?5policy?$DNany?3?5wait?5unti@" = comdat any

$"??_C@_0DF@BKAKCPGJ@?5?5?$FLpreop?9any?5wait?5?$CFlums?$FN?5ready?$DN?$CF@" = comdat any

$"??_C@_0CP@ECEMIGOD@PREOP?5wait?5policy?$DNany?3?5proceed?5?$CI@" = comdat any

$"??_C@_0EO@KNHBJBHN@PREOP?5wait?5policy?$DNany?3?5timeout?0?5@" = comdat any

$"??_C@_0EB@CNMFHIOO@ECAT_SLAVE_SAFEOP_BEFORE_OD?3?5req@" = comdat any

$"??_C@_0DA@FCLHOLLC@EhRqSlaveState?$CIalias?$DN?$CFu?5SAFEOP?$CJ?5@" = comdat any

$"??_C@_0BK@IDNMDLMP@ECAT_SLAVE_SAFEOP_WAIT_MS?$AA@" = comdat any

$"??_C@_0CI@MPCPKDBA@wait_all_slaves_state_monitored?$CI@" = comdat any

$"??_C@_0CP@MFIGGCHL@Skip?5alias?$DN?$CFu?3?5EhGetSlaveState?5r@" = comdat any

$"??_C@_0DN@DKFENOOB@Skip?5alias?$DN?$CFu?3?5current?5state?5?$CFs?$CI@" = comdat any

$"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@" = comdat any

$"??_C@_0CP@CPMBOAAF@?5?5?$FLmaster?5wait?5?$CFlums?$FN?5rq?$DN?$CFs?$CI?$CFu?$CJ?5@" = comdat any

$"??_C@_02KNHHEEKP@?5?5?$AA@" = comdat any

$"??_C@_04LGGJDDML@INIT?$AA@" = comdat any

$"??_C@_05GNNHPFKG@PREOP?$AA@" = comdat any

$"??_C@_06OKOJICN@SAFEOP?$AA@" = comdat any

$"??_C@_02MBMDLBEE@OP?$AA@" = comdat any

$"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@" = comdat any

$"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@" = comdat any

$"??_C@_0M@GKGONAIF@ER_EHAPI_OK?$AA@" = comdat any

$"??_C@_0CC@EPBMOFKF@ER_EHAPI_STATE_I?5?$CImaster?5in?5INIT@" = comdat any

$"??_C@_0BB@EAINAHCL@ER_EHAPI_STATE_P?$AA@" = comdat any

$"??_C@_0BB@GLKAFEOI@ER_EHAPI_STATE_S?$AA@" = comdat any

$"??_C@_0BB@INNHAJLF@ER_EHAPI_STATE_O?$AA@" = comdat any

$"??_C@_0CE@FHDLJFEF@ER_EHAPI_NOITEM?5?$CIOD?5item?5not?5fou@" = comdat any

$"??_C@_0CE@HBGEPOLC@ER_EHAPI_INDEX?5?$CIOD?5index?5not?5exi@" = comdat any

$"??_C@_0CK@HLCJIKKP@ER_EHAPI_SUBINDEX?5?$CIOD?5subindex?5n@" = comdat any

$"??_C@_0CF@JEELLCF@ER_EHAPI_LENGTH?5?$CIOD?5length?5misma@" = comdat any

$"??_C@_0CE@IIFKLKO@ER_EHAPI_ENIFILE?5?$CIENI?5load?5failu@" = comdat any

$"??_C@_0CB@GLKAHDMK@ER_EHAPI_OFFLINE?5?$CIslave?5offline?$CJ@" = comdat any

$"??_C@_0CD@JDHDBFJP@ER_EHAPI_NO_RESPONSE?5?$CIno?5respons@" = comdat any

$"??_C@_0BC@NEBAMHHI@ER_EHAPI_READONLY?$AA@" = comdat any

$"??_C@_0BB@GAEFCNMD@ER_EHAPI_TIMEOUT?$AA@" = comdat any

$"??_C@_0L@BODLGHHI@UNKNOWN_RC?$AA@" = comdat any

$"??_C@_0EA@DBNIOFNN@?$CFs?$FLall?5ENI?5slaves?$FN?5alias?51?4?4?$CFu?5?5@" = comdat any

$"??_C@_0FA@EAGNHGHP@?$CFs?5?5alias?$DN?$CF2u?5?5slaveNo?$DN?$CF?94lu?5?5ph@" = comdat any

$"??_C@_0FG@LDADCKD@?$CFs?5?5alias?$DN?$CF2u?5?5slaveNo?$DN?$CF?94lu?5?5ph@" = comdat any

$"??_C@_0EL@DPJBKDMP@?$CFs?5?5?$CIno?5slave?5matched?5in?5this?5sc@" = comdat any

$"??_C@_0BK@PLDNLDIJ@?$CFs?5?5?$CI?$CFd?5slave?$CIs?$CJ?5in?5ENI?$CJ?6?$AA@" = comdat any

$"??_C@_0BE@OBEAEJCL@ECAT_ALIAS_SCAN_MAX?$AA@" = comdat any

$"??_C@_0DC@BMHAGCCA@Monitor?5?$CFd?5slave?$CIs?$CJ?5until?5all?5re@" = comdat any

$"??_C@_0FM@IILNABDO@?5?5?$CIpoll?5interval?5?$CFums?$DL?5heartbeat@" = comdat any

$"??_C@_0BP@NBJHBPDG@?5?5?$FLt?$DN?$CFlums?$FN?5initial?5snapshot?3?6?$AA@" = comdat any

$"??_C@_0DA@DLGPDPGH@?5?5?5?5?5?5alias?$DN?$CFu?5?5EhGetSlaveState?5@" = comdat any

$"??_C@_02GIPFHKNO@OK?$AA@" = comdat any

$"??_C@_03JMFMNIFM@?9?9?9?$AA@" = comdat any

$"??_C@_0CO@LOIHEOAN@?5?5?5?5?5?5alias?$DN?$CFu?5?5rq?$DN?$CFs?$CI?$CFu?$CJ?5?5actua@" = comdat any

$"??_C@_06GGLIPOFD@?5?5?5?5?5?5?$AA@" = comdat any

$"??_C@_0CN@KCGBJHLB@?5?5?$FLalias?$DN?$CFu?$FN?5EhGetSlaveState?5rc?$DN@" = comdat any

$"??_C@_0EN@JPPIDOLA@?5?5?$FLt?$DN?$CFlums?5alias?$DN?$CFu?$FN?5CHANGED?3?5rq@" = comdat any

$"??_C@_0BI@OGJHOEJJ@ECAT_SLAVE_ERR_ESC_DUMP?$AA@" = comdat any

$"??_C@_0CB@MMOEPFFD@All?5?$CFd?5slave?$CIs?$CJ?5reached?5?$CFs?$CI?$CFu?$CJ?4?6@" = comdat any

$"??_C@_0EM@GGAOPIHH@?5?5?$FLt?$DN?$CFlums?5poll?$CD?$CFu?$FN?5heartbeat?5?$CIn@" = comdat any

$"??_C@_0CL@FOFPNPMA@Timeout?5waiting?5for?5all?5slaves?5?9@" = comdat any

$"??_C@_0CI@FLEOJDOI@?5?5?5?5?5?5master?3?5rq?$DN?$CFs?$CI?$CFu?$CJ?5?5actual?$DN@" = comdat any

$"??_C@_0CJ@GODOEOEO@?5?5?5?5?5?5master?3?5EhGetState?5rc?$DN0x?$CF0@" = comdat any

$"??_C@_0CI@KFNLKEHD@?5?5?5?5?5?5ESC?5registers?3?50x0130?$CIAL?5S@" = comdat any

$"??_C@_06IBAGLEAI@0x?$CF02X?$AA@" = comdat any

$"??_C@_0BO@PJLAEK@EhReadRegister?5rc?$DN0x?$CF04X?5?$CI?$CFs?$CJ?$AA@" = comdat any

$"??_C@_0BK@NPBAMMOM@?5?50x0134?$CIAL?5Status?5Code?$CJ?$DN?$AA@" = comdat any

$"??_C@_07PELFGGAM@0x?$CF02X?6?$AA@" = comdat any

$"??_C@_0BP@GMOGLJLE@EhReadRegister?5rc?$DN0x?$CF04X?5?$CI?$CFs?$CJ?6?$AA@" = comdat any

$"??_C@_0DH@DGPFPPNK@?9?9?9?5alias?$DN?$CFu?5slaveNo?$DN?$CFlu?5phys?$DN?$CFl@" = comdat any

$"??_C@_0CI@ONDCIMDI@?5?5Slave?5state?3?5rq?$DN?$CFs?$CI?$CFu?$CJ?5actual?$DN@" = comdat any

$"??_C@_0CJ@MCDLHOLL@?5?5EhGetSlaveState?5failed?5rc?$DN0x?$CF0@" = comdat any

$"??_C@_0BK@KKLGFJMC@?5?50x3000?30?5?$CIu8?$CJ?5?$DN?50x?$CF02X?6?$AA@" = comdat any

$"??_C@_0CH@OOBJMNFI@?5?50x3000?30?5read?5failed?5rc?$DN0x?$CF04X@" = comdat any

$"??_C@_0BK@CNBAJCIB@?5?50x3000?31?5?$CIu8?$CJ?5?$DN?50x?$CF02X?6?$AA@" = comdat any

$"??_C@_0CH@NCHJCOFA@?5?50x3000?31?5read?5failed?5rc?$DN0x?$CF04X@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@"??_C@_0N@CIGOONNF@ECAT_EH_NODE?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"ECAT_EH_NODE\00", comdat, align 1
@"??_C@_05HDDHMCAH@NodeA?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"NodeA\00", comdat, align 1
@"??_C@_04DOOIMPEH@used?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"used\00", comdat, align 1
@"??_C@_07PPFHEIL@not?5set?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"not set\00", comdat, align 1
@"??_C@_0CI@NCPNENEA@EH?5node?5name?3?5?$CFs?5?$CIenv?5ECAT_EH_NO@" = linkonce_odr dso_local unnamed_addr constant [40 x i8] c"EH node name: %s (env ECAT_EH_NODE %s)\0A\00", comdat, align 1
@"??_C@_06JEPJNHIO@EhOpen?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"EhOpen\00", comdat, align 1
@"??_C@_0BC@HDAAJJMP@EhSetTimeoutForOD?$AA@" = linkonce_odr dso_local unnamed_addr constant [18 x i8] c"EhSetTimeoutForOD\00", comdat, align 1
@"??_C@_0BD@PCGKLGFO@ECAT_OD_PREOP_ONLY?$AA@" = linkonce_odr dso_local unnamed_addr constant [19 x i8] c"ECAT_OD_PREOP_ONLY\00", comdat, align 1
@"??_C@_0BE@NNGOKNCF@ECAT_REQUIRE_SAFEOP?$AA@" = linkonce_odr dso_local unnamed_addr constant [20 x i8] c"ECAT_REQUIRE_SAFEOP\00", comdat, align 1
@"??_C@_0BB@FMELMMAG@EhRqState?$CIPREOP?$CJ?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"EhRqState(PREOP)\00", comdat, align 1
@"??_C@_0BJ@OMPNIHED@wait_master_state?$CIPREOP?$CJ?$AA@" = linkonce_odr dso_local unnamed_addr constant [25 x i8] c"wait_master_state(PREOP)\00", comdat, align 1
@"??_C@_0BC@OKLOIOLL@EhRqState?$CISAFEOP?$CJ?$AA@" = linkonce_odr dso_local unnamed_addr constant [18 x i8] c"EhRqState(SAFEOP)\00", comdat, align 1
@"??_C@_0BK@OMLIINOP@wait_master_state?$CISAFEOP?$CJ?$AA@" = linkonce_odr dso_local unnamed_addr constant [26 x i8] c"wait_master_state(SAFEOP)\00", comdat, align 1
@"??_C@_0DC@ENFINKMC@Master?5state?5after?5wait?3?5rq?$DN?$CFs?$CI?$CF@" = linkonce_odr dso_local unnamed_addr constant [50 x i8] c"Master state after wait: rq=%s(%u) actual=%s(%u)\0A\00", comdat, align 1
@"??_C@_0CO@MGJCJBOB@EhGetState?5after?5wait?5failed?3?5rc@" = linkonce_odr dso_local unnamed_addr constant [46 x i8] c"EhGetState after wait failed: rc=0x%04X (%s)\0A\00", comdat, align 1
@"??_C@_0BA@MPELDLJE@EhGetSlaveCount?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"EhGetSlaveCount\00", comdat, align 1
@"??_C@_0BP@BJEDEKGP@Configured?5slaves?5?$CIcount?$CJ?3?5?$CFu?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [31 x i8] c"Configured slaves (count): %u\0A\00", comdat, align 1
@"??_C@_00CNPNBAHC@?$AA@" = linkonce_odr dso_local unnamed_addr constant [1 x i8] zeroinitializer, comdat, align 1
@"??_C@_0BM@PEBAMHBK@ECAT_SLAVE_SAFEOP_BEFORE_OD?$AA@" = linkonce_odr dso_local unnamed_addr constant [28 x i8] c"ECAT_SLAVE_SAFEOP_BEFORE_OD\00", comdat, align 1
@"??_C@_0BB@PMDLKLAD@ECAT_ALIAS_START?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"ECAT_ALIAS_START\00", comdat, align 1
@"??_C@_0P@LHFKHAHK@ECAT_ALIAS_END?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"ECAT_ALIAS_END\00", comdat, align 1
@"??_C@_0DA@MJJNADEA@EhFindSlaveByAlias?$CIalias?$DN?$CFu?$CJ?3?5rc@" = linkonce_odr dso_local unnamed_addr constant [48 x i8] c"EhFindSlaveByAlias(alias=%u): rc=0x%04X (skip)\0A\00", comdat, align 1
@"??_C@_0CN@JIGFHOLF@Alias?$DN?$CFu?5vendor?5mismatch?3?5vendor@" = linkonce_odr dso_local unnamed_addr constant [45 x i8] c"Alias=%u vendor mismatch: vendor=%lu (skip)\0A\00", comdat, align 1
@"??_C@_0CP@OPKBNJHD@Omron?5slave?5list?5full?5?$CI?$CFd?$CJ?0?5skip@" = linkonce_odr dso_local unnamed_addr constant [47 x i8] c"Omron slave list full (%d), skipping alias=%u\0A\00", comdat, align 1
@"??_C@_0DL@ONLFGMNE@Found?5Omron?5alias?$DN?$CFu?5slaveNo?$DN?$CFlu@" = linkonce_odr dso_local unnamed_addr constant [59 x i8] c"Found Omron alias=%u slaveNo=%lu phys=%lu product=0x%08lX\0A\00", comdat, align 1
@"??_C@_0DK@CLLEPENH@No?5Omron?5slaves?5in?5alias?5range?5?$CF@" = linkonce_odr dso_local unnamed_addr constant [58 x i8] c"No Omron slaves in alias range %u..%u - nothing to read.\0A\00", comdat, align 1
@"??_C@_0CJ@GAOIJNFM@Request?5PREOP?5for?5?$CFd?5Omron?5slave@" = linkonce_odr dso_local unnamed_addr constant [41 x i8] c"Request PREOP for %d Omron slave(s) ...\0A\00", comdat, align 1
@"??_C@_0CP@IIKLMIKD@EhRqSlaveState?$CIalias?$DN?$CFu?5PREOP?$CJ?5r@" = linkonce_odr dso_local unnamed_addr constant [47 x i8] c"EhRqSlaveState(alias=%u PREOP) rc=0x%04X (%s)\0A\00", comdat, align 1
@"??_C@_0BJ@KLHHNEIJ@ECAT_SLAVE_PREOP_WAIT_MS?$AA@" = linkonce_odr dso_local unnamed_addr constant [25 x i8] c"ECAT_SLAVE_PREOP_WAIT_MS\00", comdat, align 1
@"??_C@_0BH@OFECBMOC@ECAT_PREOP_WAIT_POLICY?$AA@" = linkonce_odr dso_local unnamed_addr constant [23 x i8] c"ECAT_PREOP_WAIT_POLICY\00", comdat, align 1
@"??_C@_0BF@CHJHKACA@ECAT_PREOP_READY_MIN?$AA@" = linkonce_odr dso_local unnamed_addr constant [21 x i8] c"ECAT_PREOP_READY_MIN\00", comdat, align 1
@"??_C@_03OBJFJEBA@any?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"any\00", comdat, align 1
@"??_C@_04CGFJFPFD@none?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"none\00", comdat, align 1
@"??_C@_03NFKEKGGK@all?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"all\00", comdat, align 1
@"??_C@_0EL@JGCLLIGC@PREOP?5wait?5policy?$DNall?3?5wait_all_@" = linkonce_odr dso_local unnamed_addr constant [75 x i8] c"PREOP wait policy=all: wait_all_slaves_state_monitored(timeout %lums) ...\0A\00", comdat, align 1
@"??_C@_0CH@KCLEMHLE@wait_all_slaves_state_monitored?$CI@" = linkonce_odr dso_local unnamed_addr constant [39 x i8] c"wait_all_slaves_state_monitored(PREOP)\00", comdat, align 1
@"??_C@_0FE@KEOJIPIA@PREOP?5wait?5policy?$DNany?3?5wait?5unti@" = linkonce_odr dso_local unnamed_addr constant [84 x i8] c"PREOP wait policy=any: wait until ready >= %d (timeout %lums). current ready=%d/%d\0A\00", comdat, align 1
@"??_C@_0DF@BKAKCPGJ@?5?5?$FLpreop?9any?5wait?5?$CFlums?$FN?5ready?$DN?$CF@" = linkonce_odr dso_local unnamed_addr constant [53 x i8] c"  [preop-any wait %lums] ready=%d/%d (target >= %d)\0A\00", comdat, align 1
@"??_C@_0CP@ECEMIGOD@PREOP?5wait?5policy?$DNany?3?5proceed?5?$CI@" = linkonce_odr dso_local unnamed_addr constant [47 x i8] c"PREOP wait policy=any: proceed (ready=%d/%d).\0A\00", comdat, align 1
@"??_C@_0EO@KNHBJBHN@PREOP?5wait?5policy?$DNany?3?5timeout?0?5@" = linkonce_odr dso_local unnamed_addr constant [78 x i8] c"PREOP wait policy=any: timeout, proceed with currently ready slaves (%d/%d).\0A\00", comdat, align 1
@"??_C@_0EB@CNMFHIOO@ECAT_SLAVE_SAFEOP_BEFORE_OD?3?5req@" = linkonce_odr dso_local unnamed_addr constant [65 x i8] c"ECAT_SLAVE_SAFEOP_BEFORE_OD: request SAFEOP for %d slave(s) ...\0A\00", comdat, align 1
@"??_C@_0DA@FCLHOLLC@EhRqSlaveState?$CIalias?$DN?$CFu?5SAFEOP?$CJ?5@" = linkonce_odr dso_local unnamed_addr constant [48 x i8] c"EhRqSlaveState(alias=%u SAFEOP) rc=0x%04X (%s)\0A\00", comdat, align 1
@"??_C@_0BK@IDNMDLMP@ECAT_SLAVE_SAFEOP_WAIT_MS?$AA@" = linkonce_odr dso_local unnamed_addr constant [26 x i8] c"ECAT_SLAVE_SAFEOP_WAIT_MS\00", comdat, align 1
@"??_C@_0CI@MPCPKDBA@wait_all_slaves_state_monitored?$CI@" = linkonce_odr dso_local unnamed_addr constant [40 x i8] c"wait_all_slaves_state_monitored(SAFEOP)\00", comdat, align 1
@"??_C@_0CP@MFIGGCHL@Skip?5alias?$DN?$CFu?3?5EhGetSlaveState?5r@" = linkonce_odr dso_local unnamed_addr constant [47 x i8] c"Skip alias=%u: EhGetSlaveState rc=0x%04X (%s)\0A\00", comdat, align 1
@"??_C@_0DN@DKFENOOB@Skip?5alias?$DN?$CFu?3?5current?5state?5?$CFs?$CI@" = linkonce_odr dso_local unnamed_addr constant [61 x i8] c"Skip alias=%u: current state %s(%u) not ready for SDO read.\0A\00", comdat, align 1
@"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [19 x i8] c"%s: status 0x%04X\0A\00", comdat, align 1
@"??_C@_0CP@CPMBOAAF@?5?5?$FLmaster?5wait?5?$CFlums?$FN?5rq?$DN?$CFs?$CI?$CFu?$CJ?5@" = linkonce_odr dso_local unnamed_addr constant [47 x i8] c"  [master wait %lums] rq=%s(%u) actual=%s(%u)\0A\00", comdat, align 1
@"??_C@_02KNHHEEKP@?5?5?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"  \00", comdat, align 1
@"??_C@_04LGGJDDML@INIT?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"INIT\00", comdat, align 1
@"??_C@_05GNNHPFKG@PREOP?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"PREOP\00", comdat, align 1
@"??_C@_06OKOJICN@SAFEOP?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"SAFEOP\00", comdat, align 1
@"??_C@_02MBMDLBEE@OP?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"OP\00", comdat, align 1
@"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"INIT+ERR(0x%02X)\00", comdat, align 1
@g_state_str_buf = internal global [40 x i8] zeroinitializer, align 1
@"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"raw(0x%04X)\00", comdat, align 1
@"??_C@_0M@GKGONAIF@ER_EHAPI_OK?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"ER_EHAPI_OK\00", comdat, align 1
@"??_C@_0CC@EPBMOFKF@ER_EHAPI_STATE_I?5?$CImaster?5in?5INIT@" = linkonce_odr dso_local unnamed_addr constant [34 x i8] c"ER_EHAPI_STATE_I (master in INIT)\00", comdat, align 1
@"??_C@_0BB@EAINAHCL@ER_EHAPI_STATE_P?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"ER_EHAPI_STATE_P\00", comdat, align 1
@"??_C@_0BB@GLKAFEOI@ER_EHAPI_STATE_S?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"ER_EHAPI_STATE_S\00", comdat, align 1
@"??_C@_0BB@INNHAJLF@ER_EHAPI_STATE_O?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"ER_EHAPI_STATE_O\00", comdat, align 1
@"??_C@_0CE@FHDLJFEF@ER_EHAPI_NOITEM?5?$CIOD?5item?5not?5fou@" = linkonce_odr dso_local unnamed_addr constant [36 x i8] c"ER_EHAPI_NOITEM (OD item not found)\00", comdat, align 1
@"??_C@_0CE@HBGEPOLC@ER_EHAPI_INDEX?5?$CIOD?5index?5not?5exi@" = linkonce_odr dso_local unnamed_addr constant [36 x i8] c"ER_EHAPI_INDEX (OD index not exist)\00", comdat, align 1
@"??_C@_0CK@HLCJIKKP@ER_EHAPI_SUBINDEX?5?$CIOD?5subindex?5n@" = linkonce_odr dso_local unnamed_addr constant [42 x i8] c"ER_EHAPI_SUBINDEX (OD subindex not exist)\00", comdat, align 1
@"??_C@_0CF@JEELLCF@ER_EHAPI_LENGTH?5?$CIOD?5length?5misma@" = linkonce_odr dso_local unnamed_addr constant [37 x i8] c"ER_EHAPI_LENGTH (OD length mismatch)\00", comdat, align 1
@"??_C@_0CE@IIFKLKO@ER_EHAPI_ENIFILE?5?$CIENI?5load?5failu@" = linkonce_odr dso_local unnamed_addr constant [36 x i8] c"ER_EHAPI_ENIFILE (ENI load failure)\00", comdat, align 1
@"??_C@_0CB@GLKAHDMK@ER_EHAPI_OFFLINE?5?$CIslave?5offline?$CJ@" = linkonce_odr dso_local unnamed_addr constant [33 x i8] c"ER_EHAPI_OFFLINE (slave offline)\00", comdat, align 1
@"??_C@_0CD@JDHDBFJP@ER_EHAPI_NO_RESPONSE?5?$CIno?5respons@" = linkonce_odr dso_local unnamed_addr constant [35 x i8] c"ER_EHAPI_NO_RESPONSE (no response)\00", comdat, align 1
@"??_C@_0BC@NEBAMHHI@ER_EHAPI_READONLY?$AA@" = linkonce_odr dso_local unnamed_addr constant [18 x i8] c"ER_EHAPI_READONLY\00", comdat, align 1
@"??_C@_0BB@GAEFCNMD@ER_EHAPI_TIMEOUT?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"ER_EHAPI_TIMEOUT\00", comdat, align 1
@"??_C@_0L@BODLGHHI@UNKNOWN_RC?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"UNKNOWN_RC\00", comdat, align 1
@"??_C@_0EA@DBNIOFNN@?$CFs?$FLall?5ENI?5slaves?$FN?5alias?51?4?4?$CFu?5?5@" = linkonce_odr dso_local unnamed_addr constant [64 x i8] c"%s[all ENI slaves] alias 1..%u  (rq=requested  actual=current)\0A\00", comdat, align 1
@"??_C@_0FA@EAGNHGHP@?$CFs?5?5alias?$DN?$CF2u?5?5slaveNo?$DN?$CF?94lu?5?5ph@" = linkonce_odr dso_local unnamed_addr constant [80 x i8] c"%s  alias=%2u  slaveNo=%-4lu  phys=%-4lu  vendor=%lu  rq=%s(%u)  actual=%s(%u)\0A\00", comdat, align 1
@"??_C@_0FG@LDADCKD@?$CFs?5?5alias?$DN?$CF2u?5?5slaveNo?$DN?$CF?94lu?5?5ph@" = linkonce_odr dso_local unnamed_addr constant [86 x i8] c"%s  alias=%2u  slaveNo=%-4lu  phys=%-4lu  vendor=%lu  EhGetSlaveState rc=0x%04X (%s)\0A\00", comdat, align 1
@"??_C@_0EL@DPJBKDMP@?$CFs?5?5?$CIno?5slave?5matched?5in?5this?5sc@" = linkonce_odr dso_local unnamed_addr constant [75 x i8] c"%s  (no slave matched in this scan - raise ECAT_ALIAS_SCAN_MAX if needed)\0A\00", comdat, align 1
@"??_C@_0BK@PLDNLDIJ@?$CFs?5?5?$CI?$CFd?5slave?$CIs?$CJ?5in?5ENI?$CJ?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [26 x i8] c"%s  (%d slave(s) in ENI)\0A\00", comdat, align 1
@"??_C@_0BE@OBEAEJCL@ECAT_ALIAS_SCAN_MAX?$AA@" = linkonce_odr dso_local unnamed_addr constant [20 x i8] c"ECAT_ALIAS_SCAN_MAX\00", comdat, align 1
@"??_C@_0DC@BMHAGCCA@Monitor?5?$CFd?5slave?$CIs?$CJ?5until?5all?5re@" = linkonce_odr dso_local unnamed_addr constant [50 x i8] c"Monitor %d slave(s) until all reach state %s(%u)\0A\00", comdat, align 1
@"??_C@_0FM@IILNABDO@?5?5?$CIpoll?5interval?5?$CFums?$DL?5heartbeat@" = linkonce_odr dso_local unnamed_addr constant [92 x i8] c"  (poll interval %ums; heartbeat + full snapshot every %ums; immediate line on any change)\0A\00", comdat, align 1
@"??_C@_0BP@NBJHBPDG@?5?5?$FLt?$DN?$CFlums?$FN?5initial?5snapshot?3?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [31 x i8] c"  [t=%lums] initial snapshot:\0A\00", comdat, align 1
@"??_C@_0DA@DLGPDPGH@?5?5?5?5?5?5alias?$DN?$CFu?5?5EhGetSlaveState?5@" = linkonce_odr dso_local unnamed_addr constant [48 x i8] c"      alias=%u  EhGetSlaveState rc=0x%04X (%s)\0A\00", comdat, align 1
@"??_C@_02GIPFHKNO@OK?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"OK\00", comdat, align 1
@"??_C@_03JMFMNIFM@?9?9?9?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"---\00", comdat, align 1
@"??_C@_0CO@LOIHEOAN@?5?5?5?5?5?5alias?$DN?$CFu?5?5rq?$DN?$CFs?$CI?$CFu?$CJ?5?5actua@" = linkonce_odr dso_local unnamed_addr constant [46 x i8] c"      alias=%u  rq=%s(%u)  actual=%s(%u)  %s\0A\00", comdat, align 1
@"??_C@_06GGLIPOFD@?5?5?5?5?5?5?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"      \00", comdat, align 1
@"??_C@_0CN@KCGBJHLB@?5?5?$FLalias?$DN?$CFu?$FN?5EhGetSlaveState?5rc?$DN@" = linkonce_odr dso_local unnamed_addr constant [45 x i8] c"  [alias=%u] EhGetSlaveState rc=0x%04X (%s)\0A\00", comdat, align 1
@"??_C@_0EN@JPPIDOLA@?5?5?$FLt?$DN?$CFlums?5alias?$DN?$CFu?$FN?5CHANGED?3?5rq@" = linkonce_odr dso_local unnamed_addr constant [77 x i8] c"  [t=%lums alias=%u] CHANGED: rq %s(%u) -> %s(%u) | actual %s(%u) -> %s(%u)\0A\00", comdat, align 1
@"??_C@_0BI@OGJHOEJJ@ECAT_SLAVE_ERR_ESC_DUMP?$AA@" = linkonce_odr dso_local unnamed_addr constant [24 x i8] c"ECAT_SLAVE_ERR_ESC_DUMP\00", comdat, align 1
@"??_C@_0CB@MMOEPFFD@All?5?$CFd?5slave?$CIs?$CJ?5reached?5?$CFs?$CI?$CFu?$CJ?4?6@" = linkonce_odr dso_local unnamed_addr constant [33 x i8] c"All %d slave(s) reached %s(%u).\0A\00", comdat, align 1
@"??_C@_0EM@GGAOPIHH@?5?5?$FLt?$DN?$CFlums?5poll?$CD?$CFu?$FN?5heartbeat?5?$CIn@" = linkonce_odr dso_local unnamed_addr constant [76 x i8] c"  [t=%lums poll#%u] heartbeat (no change in last %ums - current snapshot):\0A\00", comdat, align 1
@"??_C@_0CL@FOFPNPMA@Timeout?5waiting?5for?5all?5slaves?5?9@" = linkonce_odr dso_local unnamed_addr constant [43 x i8] c"Timeout waiting for all slaves -> %s(%u).\0A\00", comdat, align 1
@"??_C@_0CI@FLEOJDOI@?5?5?5?5?5?5master?3?5rq?$DN?$CFs?$CI?$CFu?$CJ?5?5actual?$DN@" = linkonce_odr dso_local unnamed_addr constant [40 x i8] c"      master: rq=%s(%u)  actual=%s(%u)\0A\00", comdat, align 1
@"??_C@_0CJ@GODOEOEO@?5?5?5?5?5?5master?3?5EhGetState?5rc?$DN0x?$CF0@" = linkonce_odr dso_local unnamed_addr constant [41 x i8] c"      master: EhGetState rc=0x%04X (%s)\0A\00", comdat, align 1
@"??_C@_0CI@KFNLKEHD@?5?5?5?5?5?5ESC?5registers?3?50x0130?$CIAL?5S@" = linkonce_odr dso_local unnamed_addr constant [40 x i8] c"      ESC registers: 0x0130(AL Status)=\00", comdat, align 1
@"??_C@_06IBAGLEAI@0x?$CF02X?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"0x%02X\00", comdat, align 1
@"??_C@_0BO@PJLAEK@EhReadRegister?5rc?$DN0x?$CF04X?5?$CI?$CFs?$CJ?$AA@" = linkonce_odr dso_local unnamed_addr constant [30 x i8] c"EhReadRegister rc=0x%04X (%s)\00", comdat, align 1
@"??_C@_0BK@NPBAMMOM@?5?50x0134?$CIAL?5Status?5Code?$CJ?$DN?$AA@" = linkonce_odr dso_local unnamed_addr constant [26 x i8] c"  0x0134(AL Status Code)=\00", comdat, align 1
@"??_C@_07PELFGGAM@0x?$CF02X?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"0x%02X\0A\00", comdat, align 1
@"??_C@_0BP@GMOGLJLE@EhReadRegister?5rc?$DN0x?$CF04X?5?$CI?$CFs?$CJ?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [31 x i8] c"EhReadRegister rc=0x%04X (%s)\0A\00", comdat, align 1
@"??_C@_0DH@DGPFPPNK@?9?9?9?5alias?$DN?$CFu?5slaveNo?$DN?$CFlu?5phys?$DN?$CFl@" = linkonce_odr dso_local unnamed_addr constant [55 x i8] c"--- alias=%u slaveNo=%lu phys=%lu product=0x%08lX ---\0A\00", comdat, align 1
@"??_C@_0CI@ONDCIMDI@?5?5Slave?5state?3?5rq?$DN?$CFs?$CI?$CFu?$CJ?5actual?$DN@" = linkonce_odr dso_local unnamed_addr constant [40 x i8] c"  Slave state: rq=%s(%u) actual=%s(%u)\0A\00", comdat, align 1
@"??_C@_0CJ@MCDLHOLL@?5?5EhGetSlaveState?5failed?5rc?$DN0x?$CF0@" = linkonce_odr dso_local unnamed_addr constant [41 x i8] c"  EhGetSlaveState failed rc=0x%04X (%s)\0A\00", comdat, align 1
@"??_C@_0BK@KKLGFJMC@?5?50x3000?30?5?$CIu8?$CJ?5?$DN?50x?$CF02X?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [26 x i8] c"  0x3000:0 (u8) = 0x%02X\0A\00", comdat, align 1
@"??_C@_0CH@OOBJMNFI@?5?50x3000?30?5read?5failed?5rc?$DN0x?$CF04X@" = linkonce_odr dso_local unnamed_addr constant [39 x i8] c"  0x3000:0 read failed rc=0x%04X (%s)\0A\00", comdat, align 1
@"??_C@_0BK@CNBAJCIB@?5?50x3000?31?5?$CIu8?$CJ?5?$DN?50x?$CF02X?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [26 x i8] c"  0x3000:1 (u8) = 0x%02X\0A\00", comdat, align 1
@"??_C@_0CH@NCHJCOFA@?5?50x3000?31?5read?5failed?5rc?$DN0x?$CF04X@" = linkonce_odr dso_local unnamed_addr constant [39 x i8] c"  0x3000:1 read failed rc=0x%04X (%s)\0A\00", comdat, align 1
@str = private unnamed_addr constant [65 x i8] c"Omron SDO 0x3000 reader (RSI-ECAT EhOpen + EhRqState + EhReadOD)\00", align 1
@str.1 = private unnamed_addr constant [64 x i8] c"EhOpen OK. Next: EhSetTimeoutForOD, EhRqState, EhGetSlaveCount.\00", align 1
@str.2 = private unnamed_addr constant [45 x i8] c"SAFEOP mode: ECAT_REQUIRE_SAFEOP is enabled.\00", align 1
@str.3 = private unnamed_addr constant [51 x i8] c"PREOP mode: read SDO in PREOP (no SAFEOP request).\00", align 1
@str.4 = private unnamed_addr constant [31 x i8] c"EhRqState(master -> PREOP) ...\00", align 1
@str.5 = private unnamed_addr constant [43 x i8] c"wait_master_state(PREOP, timeout 180s) ...\00", align 1
@str.6 = private unnamed_addr constant [32 x i8] c"EhRqState(master -> SAFEOP) ...\00", align 1
@str.7 = private unnamed_addr constant [44 x i8] c"wait_master_state(SAFEOP, timeout 180s) ...\00", align 1
@str.8 = private unnamed_addr constant [54 x i8] c"PREOP wait policy=none: skip wait and go to SDO read.\00", align 1
@str.9 = private unnamed_addr constant [62 x i8] c"ECAT_SLAVE_SAFEOP_WAIT_MS=0: skip wait for all slaves SAFEOP.\00", align 1
@str.10 = private unnamed_addr constant [63 x i8] c"Reading SDO 0x3000 for slaves currently in PREOP/SAFEOP/OP ...\00", align 1
@str.11 = private unnamed_addr constant [6 x i8] c"Done.\00", align 1
@switch.table.wait_all_slaves_state_monitored.27 = private unnamed_addr constant [3 x ptr] [ptr @"??_C@_04LGGJDDML@INIT?$AA@", ptr @"??_C@_05GNNHPFKG@PREOP?$AA@", ptr @"??_C@_06OKOJICN@SAFEOP?$AA@"], align 4
@switch.table.print_master_state_snapshot.28 = private unnamed_addr constant [4 x ptr] [ptr @"??_C@_04LGGJDDML@INIT?$AA@", ptr @"??_C@_05GNNHPFKG@PREOP?$AA@", ptr @"??_C@_06OKOJICN@SAFEOP?$AA@", ptr @"??_C@_02MBMDLBEE@OP?$AA@"], align 4

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @main() local_unnamed_addr #0 {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  %3 = alloca i16, align 2
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  %6 = alloca i16, align 2
  %7 = alloca i16, align 2
  %8 = alloca [128 x i8], align 1
  %9 = alloca i16, align 2
  %10 = alloca %struct.TAG_SLAVE_DETAIL, align 4
  %11 = alloca i16, align 2
  %12 = alloca i16, align 2
  %13 = alloca [32 x %struct.OmronSlaveEntry], align 2
  %14 = alloca i16, align 2
  %15 = alloca i16, align 2
  call void @llvm.lifetime.start.p0(ptr nonnull %7) #14
  call void @llvm.lifetime.start.p0(ptr nonnull %8) #14
  call void @llvm.lifetime.start.p0(ptr nonnull %9) #14
  store i16 0, ptr %9, align 2
  call void @llvm.lifetime.start.p0(ptr nonnull %10) #14
  %16 = tail call ptr @getenv(ptr noundef nonnull @"??_C@_0N@CIGOONNF@ECAT_EH_NODE?$AA@")
  %17 = icmp eq ptr %16, null
  br i1 %17, label %22, label %18

18:                                               ; preds = %0
  %19 = load i8, ptr %16, align 1
  %20 = freeze i8 %19
  %21 = icmp ne i8 %20, 0
  br label %22

22:                                               ; preds = %18, %0
  %23 = phi i1 [ false, %0 ], [ %21, %18 ]
  %24 = tail call ptr @_stdio_ptr() #14
  %25 = getelementptr inbounds nuw i8, ptr %24, i32 56
  %26 = tail call i32 @setvbuf(ptr noundef nonnull %25, ptr noundef null, i32 noundef 4, i32 noundef 0)
  %27 = select i1 %23, ptr %16, ptr @"??_C@_05HDDHMCAH@NodeA?$AA@"
  %28 = call ptr @strncpy(ptr noundef nonnull dereferenceable(1) %8, ptr noundef nonnull dereferenceable(1) %27, i32 noundef 127) #14
  %29 = getelementptr inbounds nuw i8, ptr %8, i32 127
  store i8 0, ptr %29, align 1
  %30 = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %31 = select i1 %23, ptr @"??_C@_04DOOIMPEH@used?$AA@", ptr @"??_C@_07PPFHEIL@not?5set?$AA@"
  %32 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CI@NCPNENEA@EH?5node?5name?3?5?$CFs?5?$CIenv?5ECAT_EH_NO@", ptr noundef nonnull %8, ptr noundef nonnull %31)
  %33 = call i32 @EhOpen(ptr noundef nonnull %8, ptr noundef nonnull %7) #14
  %34 = icmp eq i32 %33, 0
  %35 = load i16, ptr %7, align 2
  %36 = icmp ne i16 %35, 0
  %37 = select i1 %34, i1 true, i1 %36
  br i1 %37, label %38, label %41

38:                                               ; preds = %22
  %39 = zext i16 %35 to i32
  %40 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@", ptr noundef nonnull @"??_C@_06JEPJNHIO@EhOpen?$AA@", i32 noundef %39)
  br label %548

41:                                               ; preds = %22
  %42 = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  %43 = call zeroext i16 @EhSetTimeoutForOD(i32 noundef %33, i32 noundef 60000, i32 noundef 60000) #14
  %44 = icmp eq i16 %43, 0
  br i1 %44, label %48, label %45

45:                                               ; preds = %41
  %46 = zext i16 %43 to i32
  %47 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@", ptr noundef nonnull @"??_C@_0BC@HDAAJJMP@EhSetTimeoutForOD?$AA@", i32 noundef %46)
  br label %48

48:                                               ; preds = %45, %41
  %49 = call ptr @getenv(ptr noundef nonnull @"??_C@_0BD@PCGKLGFO@ECAT_OD_PREOP_ONLY?$AA@")
  %50 = call ptr @getenv(ptr noundef nonnull @"??_C@_0BE@NNGOKNCF@ECAT_REQUIRE_SAFEOP?$AA@")
  %51 = icmp eq ptr %49, null
  br i1 %51, label %55, label %52

52:                                               ; preds = %48
  %53 = load i8, ptr %49, align 1
  %54 = icmp eq i8 %53, 48
  br label %55

55:                                               ; preds = %52, %48
  %56 = phi i1 [ false, %48 ], [ %54, %52 ]
  %57 = icmp eq ptr %50, null
  br i1 %57, label %60, label %58

58:                                               ; preds = %55
  %59 = load i8, ptr %50, align 1
  switch i8 %59, label %61 [
    i8 0, label %60
    i8 48, label %60
  ]

60:                                               ; preds = %58, %58, %55
  br i1 %56, label %61, label %62

61:                                               ; preds = %58, %60
  br label %62

62:                                               ; preds = %60, %61
  %63 = phi ptr [ @str.2, %61 ], [ @str.3, %60 ]
  %64 = phi i1 [ true, %61 ], [ false, %60 ]
  %65 = call i32 @puts(ptr nonnull dereferenceable(1) %63)
  %66 = call i32 @puts(ptr nonnull dereferenceable(1) @str.4)
  %67 = call zeroext i16 @EhRqState(i32 noundef %33, i16 noundef zeroext 2) #14
  %68 = icmp eq i16 %67, 0
  br i1 %68, label %73, label %69

69:                                               ; preds = %62
  %70 = zext i16 %67 to i32
  %71 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@", ptr noundef nonnull @"??_C@_0BB@FMELMMAG@EhRqState?$CIPREOP?$CJ?$AA@", i32 noundef %70)
  %72 = call zeroext i16 @EhClose(i32 noundef %33) #14
  br label %548

73:                                               ; preds = %62
  %74 = call i32 @puts(ptr nonnull dereferenceable(1) @str.5)
  %75 = call fastcc zeroext i16 @wait_master_state(i32 noundef %33, i16 noundef zeroext 2)
  %76 = icmp eq i16 %75, 0
  br i1 %76, label %80, label %77

77:                                               ; preds = %73
  %78 = zext i16 %75 to i32
  %79 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@", ptr noundef nonnull @"??_C@_0BJ@OMPNIHED@wait_master_state?$CIPREOP?$CJ?$AA@", i32 noundef %78)
  br label %80

80:                                               ; preds = %77, %73
  br i1 %64, label %81, label %96

81:                                               ; preds = %80
  %82 = call i32 @puts(ptr nonnull dereferenceable(1) @str.6)
  %83 = call zeroext i16 @EhRqState(i32 noundef %33, i16 noundef zeroext 4) #14
  %84 = icmp eq i16 %83, 0
  br i1 %84, label %89, label %85

85:                                               ; preds = %81
  %86 = zext i16 %83 to i32
  %87 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@", ptr noundef nonnull @"??_C@_0BC@OKLOIOLL@EhRqState?$CISAFEOP?$CJ?$AA@", i32 noundef %86)
  %88 = call zeroext i16 @EhClose(i32 noundef %33) #14
  br label %548

89:                                               ; preds = %81
  %90 = call i32 @puts(ptr nonnull dereferenceable(1) @str.7)
  %91 = call fastcc zeroext i16 @wait_master_state(i32 noundef %33, i16 noundef zeroext 4)
  %92 = icmp eq i16 %91, 0
  br i1 %92, label %96, label %93

93:                                               ; preds = %89
  %94 = zext i16 %91 to i32
  %95 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@", ptr noundef nonnull @"??_C@_0BK@OMLIINOP@wait_master_state?$CISAFEOP?$CJ?$AA@", i32 noundef %94)
  br label %96

96:                                               ; preds = %89, %93, %80
  call void @llvm.lifetime.start.p0(ptr nonnull %11) #14
  store i16 0, ptr %11, align 2
  call void @llvm.lifetime.start.p0(ptr nonnull %12) #14
  store i16 0, ptr %12, align 2
  %97 = call zeroext i16 @EhGetState(i32 noundef %33, ptr noundef nonnull %11, ptr noundef nonnull %12) #14
  %98 = icmp eq i16 %97, 0
  br i1 %98, label %99, label %141

99:                                               ; preds = %96
  %100 = load i16, ptr %12, align 2
  %101 = zext i16 %100 to i32
  %102 = call range(i32 0, 17) i32 @llvm.ctpop.i32(i32 %101)
  %103 = icmp eq i32 %102, 1
  br i1 %103, label %104, label %107

104:                                              ; preds = %99
  %105 = call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %101, i1 true)
  %106 = icmp samesign ult i32 %105, 4
  br i1 %106, label %115, label %107

107:                                              ; preds = %104, %99
  %108 = and i32 %101, 31
  %109 = icmp eq i32 %108, 17
  br i1 %109, label %110, label %113

110:                                              ; preds = %107
  %111 = and i32 %101, 241
  %112 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", i32 noundef %111) #14
  br label %118

113:                                              ; preds = %107
  %114 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", i32 noundef %101) #14
  br label %118

115:                                              ; preds = %104
  %116 = getelementptr inbounds nuw ptr, ptr @switch.table.print_master_state_snapshot.28, i32 %105
  %117 = load ptr, ptr %116, align 4
  br label %118

118:                                              ; preds = %115, %110, %113
  %119 = phi ptr [ @g_state_str_buf, %110 ], [ @g_state_str_buf, %113 ], [ %117, %115 ]
  %120 = load i16, ptr %11, align 2
  %121 = zext i16 %120 to i32
  %122 = call range(i32 0, 17) i32 @llvm.ctpop.i32(i32 %121)
  %123 = icmp eq i32 %122, 1
  br i1 %123, label %124, label %127

124:                                              ; preds = %118
  %125 = call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %121, i1 true)
  %126 = icmp samesign ult i32 %125, 4
  br i1 %126, label %135, label %127

127:                                              ; preds = %124, %118
  %128 = and i32 %121, 31
  %129 = icmp eq i32 %128, 17
  br i1 %129, label %130, label %133

130:                                              ; preds = %127
  %131 = and i32 %121, 241
  %132 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", i32 noundef %131) #14
  br label %138

133:                                              ; preds = %127
  %134 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", i32 noundef %121) #14
  br label %138

135:                                              ; preds = %124
  %136 = getelementptr inbounds nuw ptr, ptr @switch.table.print_master_state_snapshot.28, i32 %125
  %137 = load ptr, ptr %136, align 4
  br label %138

138:                                              ; preds = %135, %130, %133
  %139 = phi ptr [ @g_state_str_buf, %130 ], [ @g_state_str_buf, %133 ], [ %137, %135 ]
  %140 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0DC@ENFINKMC@Master?5state?5after?5wait?3?5rq?$DN?$CFs?$CI?$CF@", ptr noundef nonnull %139, i32 noundef %121, ptr noundef nonnull %119, i32 noundef %101)
  br label %145

141:                                              ; preds = %96
  %142 = zext i16 %97 to i32
  %143 = call fastcc ptr @ehapi_rc_str(i16 noundef zeroext %97)
  %144 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CO@MGJCJBOB@EhGetState?5after?5wait?5failed?3?5rc@", i32 noundef %142, ptr noundef nonnull %143)
  br label %145

145:                                              ; preds = %141, %138
  call void @llvm.lifetime.end.p0(ptr nonnull %12) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %11) #14
  %146 = call zeroext i16 @EhGetSlaveCount(i32 noundef %33, ptr noundef nonnull %9) #14
  %147 = icmp eq i16 %146, 0
  br i1 %147, label %152, label %148

148:                                              ; preds = %145
  %149 = zext i16 %146 to i32
  %150 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@", ptr noundef nonnull @"??_C@_0BA@MPELDLJE@EhGetSlaveCount?$AA@", i32 noundef %149)
  %151 = call zeroext i16 @EhClose(i32 noundef %33) #14
  br label %548

152:                                              ; preds = %145
  %153 = load i16, ptr %9, align 2
  %154 = zext i16 %153 to i32
  %155 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BP@BJEDEKGP@Configured?5slaves?5?$CIcount?$CJ?3?5?$CFu?6?$AA@", i32 noundef %154)
  call fastcc void @print_all_connected_slave_states(i32 noundef %33, ptr noundef nonnull @"??_C@_00CNPNBAHC@?$AA@")
  %156 = call ptr @getenv(ptr noundef nonnull @"??_C@_0BD@PCGKLGFO@ECAT_OD_PREOP_ONLY?$AA@")
  %157 = call ptr @getenv(ptr noundef nonnull @"??_C@_0BM@PEBAMHBK@ECAT_SLAVE_SAFEOP_BEFORE_OD?$AA@")
  %158 = call ptr @getenv(ptr noundef nonnull @"??_C@_0BE@NNGOKNCF@ECAT_REQUIRE_SAFEOP?$AA@")
  %159 = icmp eq ptr %156, null
  br i1 %159, label %166, label %160

160:                                              ; preds = %152
  %161 = load i8, ptr %156, align 1
  %162 = icmp eq i8 %161, 0
  br i1 %162, label %166, label %163

163:                                              ; preds = %160
  %164 = icmp ne i8 %161, 48
  %165 = zext i1 %164 to i32
  br label %166

166:                                              ; preds = %163, %160, %152
  %167 = phi i32 [ %165, %163 ], [ 1, %160 ], [ 1, %152 ]
  %168 = icmp eq ptr %158, null
  br i1 %168, label %172, label %169

169:                                              ; preds = %166
  %170 = load i8, ptr %158, align 1
  switch i8 %170, label %171 [
    i8 0, label %172
    i8 48, label %172
  ]

171:                                              ; preds = %169
  br label %172

172:                                              ; preds = %169, %169, %171, %166
  %173 = phi i32 [ 0, %171 ], [ %167, %169 ], [ %167, %169 ], [ %167, %166 ]
  %174 = icmp eq ptr %157, null
  br i1 %174, label %180, label %175

175:                                              ; preds = %172
  %176 = load i8, ptr %157, align 1
  %177 = icmp eq i8 %176, 0
  %178 = icmp eq i8 %176, 48
  %179 = or i1 %177, %178
  br label %180

180:                                              ; preds = %175, %172
  %181 = phi i1 [ %179, %175 ], [ true, %172 ]
  call void @llvm.lifetime.start.p0(ptr nonnull %13) #14
  %182 = call ptr @getenv(ptr noundef nonnull @"??_C@_0BB@PMDLKLAD@ECAT_ALIAS_START?$AA@")
  %183 = call ptr @getenv(ptr noundef nonnull @"??_C@_0P@LHFKHAHK@ECAT_ALIAS_END?$AA@")
  %184 = icmp eq ptr %182, null
  br i1 %184, label %191, label %185

185:                                              ; preds = %180
  %186 = load i8, ptr %182, align 1
  %187 = icmp eq i8 %186, 0
  br i1 %187, label %191, label %188

188:                                              ; preds = %185
  %189 = call i32 @atoi(ptr noundef nonnull %182)
  %190 = trunc i32 %189 to i16
  br label %191

191:                                              ; preds = %188, %185, %180
  %192 = phi i16 [ %190, %188 ], [ 5, %185 ], [ 5, %180 ]
  %193 = icmp eq ptr %183, null
  br i1 %193, label %200, label %194

194:                                              ; preds = %191
  %195 = load i8, ptr %183, align 1
  %196 = icmp eq i8 %195, 0
  br i1 %196, label %200, label %197

197:                                              ; preds = %194
  %198 = call i32 @atoi(ptr noundef nonnull %183)
  %199 = and i32 %198, 65535
  br label %200

200:                                              ; preds = %197, %194, %191
  %201 = phi i32 [ %199, %197 ], [ 14, %194 ], [ 14, %191 ]
  %202 = zext i16 %192 to i32
  %203 = icmp samesign ult i32 %201, %202
  br i1 %203, label %249, label %204

204:                                              ; preds = %200
  %205 = getelementptr inbounds nuw i8, ptr %10, i32 4
  %206 = getelementptr inbounds nuw i8, ptr %10, i32 36
  %207 = getelementptr inbounds nuw i8, ptr %10, i32 40
  %208 = getelementptr inbounds nuw i8, ptr %10, i32 52
  %209 = getelementptr inbounds nuw i8, ptr %10, i32 84
  %210 = trunc nuw i32 %201 to i16
  %211 = getelementptr inbounds nuw i8, ptr %10, i32 6
  br label %212

212:                                              ; preds = %204, %242
  %213 = phi i32 [ %202, %204 ], [ %245, %242 ]
  %214 = phi i16 [ %192, %204 ], [ %244, %242 ]
  %215 = phi i32 [ 0, %204 ], [ %243, %242 ]
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 2 dereferenceable(82) %211, i8 0, i32 82, i1 false)
  store i32 88, ptr %10, align 4
  store i16 %214, ptr %205, align 4
  %216 = call zeroext i16 @EhFindSlaveByAlias(i32 noundef %33, ptr noundef nonnull %10) #14
  %217 = icmp eq i16 %216, 0
  br i1 %217, label %221, label %218

218:                                              ; preds = %212
  %219 = zext i16 %216 to i32
  %220 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0DA@MJJNADEA@EhFindSlaveByAlias?$CIalias?$DN?$CFu?$CJ?3?5rc@", i32 noundef %213, i32 noundef %219)
  br label %242

221:                                              ; preds = %212
  %222 = load i32, ptr %206, align 4
  %223 = icmp eq i32 %222, 131
  br i1 %223, label %226, label %224

224:                                              ; preds = %221
  %225 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CN@JIGFHOLF@Alias?$DN?$CFu?5vendor?5mismatch?3?5vendor@", i32 noundef %213, i32 noundef %222)
  br label %242

226:                                              ; preds = %221
  %227 = icmp sgt i32 %215, 31
  br i1 %227, label %228, label %231

228:                                              ; preds = %226
  %229 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CP@OPKBNJHD@Omron?5slave?5list?5full?5?$CI?$CFd?$CJ?0?5skip@", i32 noundef 32, i32 noundef %213)
  %230 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CJ@GAOIJNFM@Request?5PREOP?5for?5?$CFd?5Omron?5slave@", i32 noundef %215)
  br label %254

231:                                              ; preds = %226
  %232 = getelementptr inbounds %struct.OmronSlaveEntry, ptr %13, i32 %215
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 2 dereferenceable(88) %232, ptr noundef nonnull align 4 dereferenceable(88) %10, i32 88, i1 false)
  %233 = getelementptr inbounds nuw i8, ptr %232, i32 88
  store i16 -1, ptr %233, align 2
  %234 = getelementptr inbounds nuw i8, ptr %232, i32 90
  store i16 -1, ptr %234, align 2
  %235 = add nsw i32 %215, 1
  %236 = load i32, ptr %207, align 4
  %237 = load i32, ptr %208, align 4
  %238 = load i32, ptr %209, align 4
  %239 = load i16, ptr %205, align 4
  %240 = zext i16 %239 to i32
  %241 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0DL@ONLFGMNE@Found?5Omron?5alias?$DN?$CFu?5slaveNo?$DN?$CFlu@", i32 noundef %240, i32 noundef %238, i32 noundef %237, i32 noundef %236)
  br label %242

242:                                              ; preds = %231, %224, %218
  %243 = phi i32 [ %215, %218 ], [ %215, %224 ], [ %235, %231 ]
  %244 = add i16 %214, 1
  %245 = zext i16 %244 to i32
  %246 = icmp ugt i16 %244, %210
  br i1 %246, label %247, label %212, !llvm.loop !7

247:                                              ; preds = %242
  %248 = icmp eq i32 %243, 0
  br i1 %248, label %249, label %251

249:                                              ; preds = %200, %247
  %250 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0DK@CLLEPENH@No?5Omron?5slaves?5in?5alias?5range?5?$CF@", i32 noundef %202, i32 noundef %201)
  br label %545

251:                                              ; preds = %247
  %252 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CJ@GAOIJNFM@Request?5PREOP?5for?5?$CFd?5Omron?5slave@", i32 noundef %243)
  %253 = icmp sgt i32 %243, 0
  br i1 %253, label %254, label %271

254:                                              ; preds = %228, %251
  %255 = phi i32 [ %215, %228 ], [ %243, %251 ]
  br label %256

256:                                              ; preds = %254, %268
  %257 = phi i32 [ %269, %268 ], [ 0, %254 ]
  %258 = getelementptr inbounds nuw %struct.OmronSlaveEntry, ptr %13, i32 %257
  %259 = getelementptr inbounds nuw i8, ptr %258, i32 4
  %260 = load i16, ptr %259, align 2
  %261 = call zeroext i16 @EhRqSlaveState(i32 noundef %33, i16 noundef zeroext %260, i16 noundef zeroext 2) #14
  %262 = icmp eq i16 %261, 0
  br i1 %262, label %268, label %263

263:                                              ; preds = %256
  %264 = zext i16 %261 to i32
  %265 = call fastcc ptr @ehapi_rc_str(i16 noundef zeroext %261)
  %266 = zext i16 %260 to i32
  %267 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CP@IIKLMIKD@EhRqSlaveState?$CIalias?$DN?$CFu?5PREOP?$CJ?5r@", i32 noundef %266, i32 noundef %264, ptr noundef nonnull %265)
  br label %268

268:                                              ; preds = %256, %263
  %269 = add nuw nsw i32 %257, 1
  %270 = icmp eq i32 %269, %255
  br i1 %270, label %271, label %256, !llvm.loop !9

271:                                              ; preds = %268, %251
  %272 = phi i1 [ false, %251 ], [ true, %268 ]
  %273 = phi i32 [ %243, %251 ], [ %255, %268 ]
  %274 = call ptr @getenv(ptr noundef nonnull @"??_C@_0BJ@KLHHNEIJ@ECAT_SLAVE_PREOP_WAIT_MS?$AA@")
  %275 = icmp eq ptr %274, null
  br i1 %275, label %283, label %276

276:                                              ; preds = %271
  %277 = load i8, ptr %274, align 1
  %278 = icmp eq i8 %277, 0
  br i1 %278, label %283, label %279

279:                                              ; preds = %276
  %280 = call i32 @atoi(ptr noundef nonnull %274)
  %281 = icmp slt i32 %280, 0
  %282 = select i1 %281, i32 180000, i32 %280
  br label %283

283:                                              ; preds = %271, %276, %279
  %284 = phi i32 [ %282, %279 ], [ 180000, %276 ], [ 180000, %271 ]
  %285 = call ptr @getenv(ptr noundef nonnull @"??_C@_0BH@OFECBMOC@ECAT_PREOP_WAIT_POLICY?$AA@")
  %286 = call ptr @getenv(ptr noundef nonnull @"??_C@_0BF@CHJHKACA@ECAT_PREOP_READY_MIN?$AA@")
  %287 = icmp eq ptr %286, null
  br i1 %287, label %294, label %288

288:                                              ; preds = %283
  %289 = load i8, ptr %286, align 1
  %290 = icmp eq i8 %289, 0
  br i1 %290, label %294, label %291

291:                                              ; preds = %288
  %292 = call i32 @atoi(ptr noundef nonnull %286)
  %293 = call i32 @llvm.smax.i32(i32 %292, i32 1)
  br label %294

294:                                              ; preds = %291, %288, %283
  %295 = phi i32 [ %293, %291 ], [ 1, %288 ], [ 1, %283 ]
  %296 = call i32 @llvm.smin.i32(i32 %295, i32 %273)
  %297 = icmp eq ptr %285, null
  br i1 %297, label %301, label %298

298:                                              ; preds = %294
  %299 = load i8, ptr %285, align 1
  %300 = icmp eq i8 %299, 0
  br i1 %300, label %301, label %302

301:                                              ; preds = %298, %294
  br label %302

302:                                              ; preds = %301, %298
  %303 = phi ptr [ @"??_C@_03OBJFJEBA@any?$AA@", %301 ], [ %285, %298 ]
  %304 = call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %303, ptr noundef nonnull dereferenceable(5) @"??_C@_04CGFJFPFD@none?$AA@") #14
  %305 = icmp eq i32 %304, 0
  %306 = icmp eq i32 %284, 0
  %307 = select i1 %305, i1 true, i1 %306
  br i1 %307, label %308, label %310

308:                                              ; preds = %302
  %309 = call i32 @puts(ptr nonnull dereferenceable(1) @str.8)
  br label %370

310:                                              ; preds = %302
  %311 = call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %303, ptr noundef nonnull dereferenceable(4) @"??_C@_03NFKEKGGK@all?$AA@") #14
  %312 = icmp eq i32 %311, 0
  br i1 %312, label %313, label %320

313:                                              ; preds = %310
  %314 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0EL@JGCLLIGC@PREOP?5wait?5policy?$DNall?3?5wait_all_@", i32 noundef %284)
  %315 = call fastcc zeroext i16 @wait_all_slaves_state_monitored(i32 noundef %33, ptr noundef %13, i32 noundef %273, i16 noundef zeroext 2, i32 noundef %284)
  %316 = icmp eq i16 %315, 0
  br i1 %316, label %370, label %317

317:                                              ; preds = %313
  %318 = zext nneg i16 %315 to i32
  %319 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@", ptr noundef nonnull @"??_C@_0CH@KCLEMHLE@wait_all_slaves_state_monitored?$CI@", i32 noundef %318)
  br label %370

320:                                              ; preds = %310
  %321 = call fastcc i32 @count_sdo_ready_slaves(i32 noundef %33, ptr noundef %13, i32 noundef %273)
  %322 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0FE@KEOJIPIA@PREOP?5wait?5policy?$DNany?3?5wait?5unti@", i32 noundef %296, i32 noundef %284, i32 noundef %321, i32 noundef %273)
  %323 = icmp slt i32 %321, %296
  br i1 %323, label %324, label %365

324:                                              ; preds = %320, %359
  %325 = phi i32 [ %360, %359 ], [ 0, %320 ]
  %326 = phi i32 [ %328, %359 ], [ 0, %320 ]
  %327 = call zeroext i8 @RtSleep(i32 noundef 100) #14
  %328 = add i32 %326, 100
  %329 = add nuw nsw i32 %325, 100
  br i1 %272, label %330, label %354

330:                                              ; preds = %324, %350
  %331 = phi i32 [ %351, %350 ], [ 0, %324 ]
  %332 = phi i32 [ %352, %350 ], [ 0, %324 ]
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #14
  store i16 0, ptr %5, align 2
  call void @llvm.lifetime.start.p0(ptr nonnull %6) #14
  store i16 0, ptr %6, align 2
  %333 = getelementptr inbounds nuw %struct.OmronSlaveEntry, ptr %13, i32 %332
  %334 = getelementptr inbounds nuw i8, ptr %333, i32 4
  %335 = load i16, ptr %334, align 2
  %336 = call zeroext i16 @EhGetSlaveState(i32 noundef range(i32 1, 0) %33, i16 noundef zeroext %335, ptr noundef nonnull %5, ptr noundef nonnull %6) #14
  %337 = icmp eq i16 %336, 0
  br i1 %337, label %338, label %350

338:                                              ; preds = %330
  %339 = load i16, ptr %6, align 2
  %340 = and i16 %339, 16
  %341 = icmp eq i16 %340, 0
  br i1 %341, label %342, label %349

342:                                              ; preds = %338
  %343 = and i16 %339, 15
  switch i16 %343, label %346 [
    i16 4, label %344
    i16 2, label %344
  ]

344:                                              ; preds = %342, %342
  %345 = add nsw i32 %331, 1
  br label %350

346:                                              ; preds = %342
  %347 = icmp eq i16 %343, 8
  %348 = add nsw i32 %331, 1
  br i1 %347, label %350, label %349

349:                                              ; preds = %346, %338
  br label %350

350:                                              ; preds = %349, %346, %344, %330
  %351 = phi i32 [ %331, %330 ], [ %331, %349 ], [ %348, %346 ], [ %345, %344 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #14
  %352 = add nuw nsw i32 %332, 1
  %353 = icmp eq i32 %352, %273
  br i1 %353, label %354, label %330, !llvm.loop !10

354:                                              ; preds = %350, %324
  %355 = phi i32 [ 0, %324 ], [ %351, %350 ]
  %356 = icmp ugt i32 %325, 899
  br i1 %356, label %357, label %359

357:                                              ; preds = %354
  %358 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0DF@BKAKCPGJ@?5?5?$FLpreop?9any?5wait?5?$CFlums?$FN?5ready?$DN?$CF@", i32 noundef %328, i32 noundef %355, i32 noundef %273, i32 noundef %296)
  br label %359

359:                                              ; preds = %357, %354
  %360 = phi i32 [ 0, %357 ], [ %329, %354 ]
  %361 = icmp ult i32 %328, %284
  %362 = icmp slt i32 %355, %296
  %363 = select i1 %361, i1 %362, i1 false
  br i1 %363, label %324, label %364, !llvm.loop !11

364:                                              ; preds = %359
  br i1 %362, label %368, label %365

365:                                              ; preds = %320, %364
  %366 = phi i32 [ %355, %364 ], [ %321, %320 ]
  %367 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CP@ECEMIGOD@PREOP?5wait?5policy?$DNany?3?5proceed?5?$CI@", i32 noundef %366, i32 noundef %273)
  br label %370

368:                                              ; preds = %364
  %369 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0EO@KNHBJBHN@PREOP?5wait?5policy?$DNany?3?5timeout?0?5@", i32 noundef %355, i32 noundef %273)
  br label %370

370:                                              ; preds = %365, %368, %317, %313, %308
  %371 = icmp ne i32 %173, 0
  %372 = or i1 %371, %181
  br i1 %372, label %410, label %373

373:                                              ; preds = %370
  %374 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0EB@CNMFHIOO@ECAT_SLAVE_SAFEOP_BEFORE_OD?3?5req@", i32 noundef %273)
  br i1 %272, label %375, label %390

375:                                              ; preds = %373, %387
  %376 = phi i32 [ %388, %387 ], [ 0, %373 ]
  %377 = getelementptr inbounds nuw %struct.OmronSlaveEntry, ptr %13, i32 %376
  %378 = getelementptr inbounds nuw i8, ptr %377, i32 4
  %379 = load i16, ptr %378, align 2
  %380 = call zeroext i16 @EhRqSlaveState(i32 noundef %33, i16 noundef zeroext %379, i16 noundef zeroext 4) #14
  %381 = icmp eq i16 %380, 0
  br i1 %381, label %387, label %382

382:                                              ; preds = %375
  %383 = zext i16 %380 to i32
  %384 = call fastcc ptr @ehapi_rc_str(i16 noundef zeroext %380)
  %385 = zext i16 %379 to i32
  %386 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0DA@FCLHOLLC@EhRqSlaveState?$CIalias?$DN?$CFu?5SAFEOP?$CJ?5@", i32 noundef %385, i32 noundef %383, ptr noundef nonnull %384)
  br label %387

387:                                              ; preds = %375, %382
  %388 = add nuw nsw i32 %376, 1
  %389 = icmp eq i32 %388, %273
  br i1 %389, label %390, label %375, !llvm.loop !12

390:                                              ; preds = %387, %373
  %391 = call ptr @getenv(ptr noundef nonnull @"??_C@_0BK@IDNMDLMP@ECAT_SLAVE_SAFEOP_WAIT_MS?$AA@")
  %392 = icmp eq ptr %391, null
  br i1 %392, label %403, label %393

393:                                              ; preds = %390
  %394 = load i8, ptr %391, align 1
  %395 = icmp eq i8 %394, 0
  br i1 %395, label %403, label %396

396:                                              ; preds = %393
  %397 = call i32 @atoi(ptr noundef nonnull %391)
  %398 = icmp slt i32 %397, 0
  br i1 %398, label %403, label %399

399:                                              ; preds = %396
  %400 = icmp eq i32 %397, 0
  br i1 %400, label %401, label %403

401:                                              ; preds = %399
  %402 = call i32 @puts(ptr nonnull dereferenceable(1) @str.9)
  br label %410

403:                                              ; preds = %396, %390, %393, %399
  %404 = phi i32 [ %397, %399 ], [ 180000, %393 ], [ 180000, %390 ], [ 180000, %396 ]
  %405 = call fastcc zeroext i16 @wait_all_slaves_state_monitored(i32 noundef %33, ptr noundef %13, i32 noundef %273, i16 noundef zeroext 4, i32 noundef %404)
  %406 = icmp eq i16 %405, 0
  br i1 %406, label %410, label %407

407:                                              ; preds = %403
  %408 = zext nneg i16 %405 to i32
  %409 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@", ptr noundef nonnull @"??_C@_0CI@MPCPKDBA@wait_all_slaves_state_monitored?$CI@", i32 noundef %408)
  br label %410

410:                                              ; preds = %401, %407, %403, %370
  %411 = call i32 @puts(ptr nonnull dereferenceable(1) @str.10)
  br i1 %272, label %412, label %545

412:                                              ; preds = %410, %542
  %413 = phi i32 [ %543, %542 ], [ 0, %410 ]
  call void @llvm.lifetime.start.p0(ptr nonnull %14) #14
  store i16 0, ptr %14, align 2
  call void @llvm.lifetime.start.p0(ptr nonnull %15) #14
  store i16 0, ptr %15, align 2
  %414 = getelementptr inbounds nuw %struct.OmronSlaveEntry, ptr %13, i32 %413
  %415 = getelementptr inbounds nuw i8, ptr %414, i32 4
  %416 = load i16, ptr %415, align 2
  %417 = call zeroext i16 @EhGetSlaveState(i32 noundef %33, i16 noundef zeroext %416, ptr noundef nonnull %14, ptr noundef nonnull %15) #14
  %418 = icmp eq i16 %417, 0
  br i1 %418, label %424, label %419

419:                                              ; preds = %412
  %420 = zext i16 %417 to i32
  %421 = call fastcc ptr @ehapi_rc_str(i16 noundef zeroext %417)
  %422 = zext i16 %416 to i32
  %423 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CP@MFIGGCHL@Skip?5alias?$DN?$CFu?3?5EhGetSlaveState?5r@", i32 noundef %422, i32 noundef %420, ptr noundef nonnull %421)
  br label %542

424:                                              ; preds = %412
  %425 = load i16, ptr %15, align 2
  %426 = and i16 %425, 16
  %427 = icmp eq i16 %426, 0
  br i1 %427, label %428, label %430

428:                                              ; preds = %424
  %429 = and i16 %425, 15
  switch i16 %429, label %430 [
    i16 4, label %452
    i16 2, label %452
    i16 8, label %452
  ]

430:                                              ; preds = %428, %424
  %431 = zext i16 %425 to i32
  %432 = call range(i32 0, 17) i32 @llvm.ctpop.i32(i32 %431)
  %433 = icmp eq i32 %432, 1
  br i1 %433, label %434, label %437

434:                                              ; preds = %430
  %435 = call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %431, i1 true)
  %436 = icmp samesign ult i32 %435, 4
  br i1 %436, label %445, label %437

437:                                              ; preds = %434, %430
  %438 = and i32 %431, 31
  %439 = icmp eq i32 %438, 17
  br i1 %439, label %440, label %443

440:                                              ; preds = %437
  %441 = and i32 %431, 241
  %442 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", i32 noundef %441) #14
  br label %448

443:                                              ; preds = %437
  %444 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", i32 noundef %431) #14
  br label %448

445:                                              ; preds = %434
  %446 = getelementptr inbounds nuw ptr, ptr @switch.table.print_master_state_snapshot.28, i32 %435
  %447 = load ptr, ptr %446, align 4
  br label %448

448:                                              ; preds = %445, %440, %443
  %449 = phi ptr [ @g_state_str_buf, %440 ], [ @g_state_str_buf, %443 ], [ %447, %445 ]
  %450 = zext i16 %416 to i32
  %451 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0DN@DKFENOOB@Skip?5alias?$DN?$CFu?3?5current?5state?5?$CFs?$CI@", i32 noundef %450, ptr noundef nonnull %449, i32 noundef %431)
  br label %542

452:                                              ; preds = %428, %428, %428
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #14
  store i8 0, ptr %1, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #14
  store i8 0, ptr %2, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #14
  store i16 0, ptr %3, align 2
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #14
  store i16 0, ptr %4, align 2
  %453 = getelementptr inbounds nuw i8, ptr %414, i32 40
  %454 = load i32, ptr %453, align 2
  %455 = getelementptr inbounds nuw i8, ptr %414, i32 52
  %456 = load i32, ptr %455, align 2
  %457 = getelementptr inbounds nuw i8, ptr %414, i32 84
  %458 = load i32, ptr %457, align 2
  %459 = zext i16 %416 to i32
  %460 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0DH@DGPFPPNK@?9?9?9?5alias?$DN?$CFu?5slaveNo?$DN?$CFlu?5phys?$DN?$CFl@", i32 noundef %459, i32 noundef %458, i32 noundef %456, i32 noundef %454)
  %461 = call zeroext i16 @EhGetSlaveState(i32 noundef range(i32 1, 0) %33, i16 noundef zeroext %416, ptr noundef nonnull %3, ptr noundef nonnull %4) #14
  %462 = icmp eq i16 %461, 0
  br i1 %462, label %463, label %515

463:                                              ; preds = %452
  %464 = load i16, ptr %4, align 2
  %465 = zext i16 %464 to i32
  %466 = call range(i32 0, 17) i32 @llvm.ctpop.i32(i32 %465)
  %467 = icmp eq i32 %466, 1
  br i1 %467, label %468, label %471

468:                                              ; preds = %463
  %469 = call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %465, i1 true)
  %470 = icmp samesign ult i32 %469, 4
  br i1 %470, label %479, label %471

471:                                              ; preds = %468, %463
  %472 = and i32 %465, 31
  %473 = icmp eq i32 %472, 17
  br i1 %473, label %474, label %477

474:                                              ; preds = %471
  %475 = and i32 %465, 241
  %476 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", i32 noundef %475) #14
  br label %482

477:                                              ; preds = %471
  %478 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", i32 noundef %465) #14
  br label %482

479:                                              ; preds = %468
  %480 = getelementptr inbounds nuw ptr, ptr @switch.table.print_master_state_snapshot.28, i32 %469
  %481 = load ptr, ptr %480, align 4
  br label %482

482:                                              ; preds = %479, %477, %474
  %483 = phi ptr [ @g_state_str_buf, %474 ], [ @g_state_str_buf, %477 ], [ %481, %479 ]
  %484 = load i16, ptr %3, align 2
  %485 = zext i16 %484 to i32
  %486 = call range(i32 0, 17) i32 @llvm.ctpop.i32(i32 %485)
  %487 = icmp eq i32 %486, 1
  br i1 %487, label %488, label %491

488:                                              ; preds = %482
  %489 = call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %485, i1 true)
  %490 = icmp samesign ult i32 %489, 4
  br i1 %490, label %499, label %491

491:                                              ; preds = %488, %482
  %492 = and i32 %485, 31
  %493 = icmp eq i32 %492, 17
  br i1 %493, label %494, label %497

494:                                              ; preds = %491
  %495 = and i32 %485, 241
  %496 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", i32 noundef %495) #14
  br label %502

497:                                              ; preds = %491
  %498 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", i32 noundef %485) #14
  br label %502

499:                                              ; preds = %488
  %500 = getelementptr inbounds nuw ptr, ptr @switch.table.print_master_state_snapshot.28, i32 %489
  %501 = load ptr, ptr %500, align 4
  br label %502

502:                                              ; preds = %499, %497, %494
  %503 = phi ptr [ @g_state_str_buf, %494 ], [ @g_state_str_buf, %497 ], [ %501, %499 ]
  %504 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CI@ONDCIMDI@?5?5Slave?5state?3?5rq?$DN?$CFs?$CI?$CFu?$CJ?5actual?$DN@", ptr noundef nonnull %503, i32 noundef %485, ptr noundef nonnull %483, i32 noundef %465)
  %505 = call ptr @getenv(ptr noundef nonnull @"??_C@_0BI@OGJHOEJJ@ECAT_SLAVE_ERR_ESC_DUMP?$AA@")
  %506 = icmp eq ptr %505, null
  br i1 %506, label %510, label %507

507:                                              ; preds = %502
  %508 = load i8, ptr %505, align 1
  %509 = icmp eq i8 %508, 48
  br i1 %509, label %519, label %510

510:                                              ; preds = %507, %502
  %511 = load i16, ptr %4, align 2
  %512 = and i16 %511, 16
  %513 = icmp eq i16 %512, 0
  br i1 %513, label %519, label %514

514:                                              ; preds = %510
  call fastcc void @dump_esc_al_registers(i32 noundef range(i32 1, 0) %33, i16 noundef zeroext %416)
  br label %519

515:                                              ; preds = %452
  %516 = zext i16 %461 to i32
  %517 = call fastcc ptr @ehapi_rc_str(i16 noundef zeroext %461)
  %518 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CJ@MCDLHOLL@?5?5EhGetSlaveState?5failed?5rc?$DN0x?$CF0@", i32 noundef %516, ptr noundef nonnull %517)
  br label %519

519:                                              ; preds = %515, %514, %510, %507
  %520 = call zeroext i16 @EhReadODByAlias(i32 noundef range(i32 1, 0) %33, i16 noundef zeroext %416, i16 noundef zeroext 12288, i8 noundef zeroext 0, ptr noundef nonnull %1, i8 noundef zeroext 1) #14
  %521 = icmp eq i16 %520, 0
  br i1 %521, label %522, label %526

522:                                              ; preds = %519
  %523 = load i8, ptr %1, align 1
  %524 = zext i8 %523 to i32
  %525 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BK@KKLGFJMC@?5?50x3000?30?5?$CIu8?$CJ?5?$DN?50x?$CF02X?6?$AA@", i32 noundef %524)
  br label %530

526:                                              ; preds = %519
  %527 = zext i16 %520 to i32
  %528 = call fastcc ptr @ehapi_rc_str(i16 noundef zeroext %520)
  %529 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CH@OOBJMNFI@?5?50x3000?30?5read?5failed?5rc?$DN0x?$CF04X@", i32 noundef %527, ptr noundef nonnull %528)
  br label %530

530:                                              ; preds = %526, %522
  %531 = call zeroext i16 @EhReadODByAlias(i32 noundef range(i32 1, 0) %33, i16 noundef zeroext %416, i16 noundef zeroext 12288, i8 noundef zeroext 1, ptr noundef nonnull %2, i8 noundef zeroext 1) #14
  %532 = icmp eq i16 %531, 0
  br i1 %532, label %533, label %537

533:                                              ; preds = %530
  %534 = load i8, ptr %2, align 1
  %535 = zext i8 %534 to i32
  %536 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BK@CNBAJCIB@?5?50x3000?31?5?$CIu8?$CJ?5?$DN?50x?$CF02X?6?$AA@", i32 noundef %535)
  br label %541

537:                                              ; preds = %530
  %538 = zext i16 %531 to i32
  %539 = call fastcc ptr @ehapi_rc_str(i16 noundef zeroext %531)
  %540 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CH@NCHJCOFA@?5?50x3000?31?5read?5failed?5rc?$DN0x?$CF04X@", i32 noundef %538, ptr noundef nonnull %539)
  br label %541

541:                                              ; preds = %533, %537
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #14
  br label %542

542:                                              ; preds = %541, %448, %419
  call void @llvm.lifetime.end.p0(ptr nonnull %15) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %14) #14
  %543 = add nuw nsw i32 %413, 1
  %544 = icmp eq i32 %543, %273
  br i1 %544, label %545, label %412, !llvm.loop !13

545:                                              ; preds = %542, %410, %249
  call void @llvm.lifetime.end.p0(ptr nonnull %13) #14
  %546 = call zeroext i16 @EhClose(i32 noundef %33) #14
  %547 = call i32 @puts(ptr nonnull dereferenceable(1) @str.11)
  br label %548

548:                                              ; preds = %69, %85, %545, %148, %38
  %549 = phi i32 [ 1, %38 ], [ 1, %148 ], [ 0, %545 ], [ 1, %69 ], [ 1, %85 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %10) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %9) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %8) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %7) #14
  ret i32 %549
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: nofree nounwind memory(read)
declare dso_local noundef ptr @getenv(ptr noundef captures(none)) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @setvbuf(ptr noundef captures(none), ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

declare dso_local ptr @_stdio_ptr() local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strncpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none), i32 noundef) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #3

declare dllimport i32 @EhOpen(ptr noundef, ptr noundef) local_unnamed_addr #4

declare dllimport zeroext i16 @EhSetTimeoutForOD(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #4

declare dllimport zeroext i16 @EhRqState(i32 noundef, i16 noundef zeroext) local_unnamed_addr #4

declare dllimport zeroext i16 @EhClose(i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define internal fastcc zeroext i16 @wait_master_state(i32 noundef range(i32 1, 0) %0, i16 noundef zeroext range(i16 2, 5) %1) unnamed_addr #0 {
  %3 = alloca i16, align 2
  %4 = alloca i16, align 2
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #14
  store i16 0, ptr %3, align 2
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #14
  store i16 0, ptr %4, align 2
  br label %5

5:                                                ; preds = %2, %63
  %6 = phi i32 [ 0, %2 ], [ %64, %63 ]
  %7 = phi i32 [ 0, %2 ], [ %66, %63 ]
  %8 = call zeroext i16 @EhGetState(i32 noundef %0, ptr noundef nonnull %3, ptr noundef nonnull %4) #14
  %9 = icmp eq i16 %8, 0
  br i1 %9, label %10, label %68

10:                                               ; preds = %5
  %11 = load i16, ptr %4, align 2
  %12 = zext i16 %11 to i32
  %13 = icmp eq i16 %11, %1
  br i1 %13, label %68, label %14

14:                                               ; preds = %10
  %15 = add i32 %6, 100
  %16 = icmp eq i32 %7, 0
  %17 = icmp ugt i32 %15, 4999
  %18 = select i1 %16, i1 true, i1 %17
  br i1 %18, label %19, label %63

19:                                               ; preds = %14
  %20 = select i1 %17, i32 0, i32 %15
  %21 = call range(i32 0, 17) i32 @llvm.ctpop.i32(i32 %12)
  %22 = icmp eq i32 %21, 1
  br i1 %22, label %23, label %26

23:                                               ; preds = %19
  %24 = call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %12, i1 true)
  %25 = icmp samesign ult i32 %24, 4
  br i1 %25, label %34, label %26

26:                                               ; preds = %23, %19
  %27 = and i32 %12, 31
  %28 = icmp eq i32 %27, 17
  br i1 %28, label %29, label %32

29:                                               ; preds = %26
  %30 = and i32 %12, 241
  %31 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", i32 noundef %30) #14
  br label %37

32:                                               ; preds = %26
  %33 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", i32 noundef %12) #14
  br label %37

34:                                               ; preds = %23
  %35 = getelementptr inbounds nuw ptr, ptr @switch.table.print_master_state_snapshot.28, i32 %24
  %36 = load ptr, ptr %35, align 4
  br label %37

37:                                               ; preds = %34, %29, %32
  %38 = phi ptr [ @g_state_str_buf, %29 ], [ @g_state_str_buf, %32 ], [ %36, %34 ]
  %39 = load i16, ptr %3, align 2
  %40 = zext i16 %39 to i32
  %41 = call range(i32 0, 17) i32 @llvm.ctpop.i32(i32 %40)
  %42 = icmp eq i32 %41, 1
  br i1 %42, label %43, label %46

43:                                               ; preds = %37
  %44 = call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %40, i1 true)
  %45 = icmp samesign ult i32 %44, 4
  br i1 %45, label %54, label %46

46:                                               ; preds = %43, %37
  %47 = and i32 %40, 31
  %48 = icmp eq i32 %47, 17
  br i1 %48, label %49, label %52

49:                                               ; preds = %46
  %50 = and i32 %40, 241
  %51 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", i32 noundef %50) #14
  br label %57

52:                                               ; preds = %46
  %53 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", i32 noundef %40) #14
  br label %57

54:                                               ; preds = %43
  %55 = getelementptr inbounds nuw ptr, ptr @switch.table.print_master_state_snapshot.28, i32 %44
  %56 = load ptr, ptr %55, align 4
  br label %57

57:                                               ; preds = %54, %49, %52
  %58 = phi ptr [ @g_state_str_buf, %49 ], [ @g_state_str_buf, %52 ], [ %56, %54 ]
  %59 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CP@CPMBOAAF@?5?5?$FLmaster?5wait?5?$CFlums?$FN?5rq?$DN?$CFs?$CI?$CFu?$CJ?5@", i32 noundef %7, ptr noundef nonnull %58, i32 noundef %40, ptr noundef nonnull %38, i32 noundef %12)
  call fastcc void @print_all_connected_slave_states(i32 noundef %0, ptr noundef nonnull @"??_C@_02KNHHEEKP@?5?5?$AA@")
  %60 = call ptr @_stdio_ptr() #14
  %61 = getelementptr inbounds nuw i8, ptr %60, i32 56
  %62 = call i32 @fflush(ptr noundef nonnull %61)
  br label %63

63:                                               ; preds = %57, %14
  %64 = phi i32 [ %20, %57 ], [ %15, %14 ]
  %65 = call zeroext i8 @RtSleep(i32 noundef 100) #14
  %66 = add nuw nsw i32 %7, 100
  %67 = icmp samesign ult i32 %7, 179900
  br i1 %67, label %5, label %68, !llvm.loop !14

68:                                               ; preds = %10, %5, %63
  %69 = phi i16 [ 15, %63 ], [ 0, %10 ], [ %8, %5 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #14
  ret i16 %69
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

declare dllimport zeroext i16 @EhGetState(i32 noundef, ptr noundef, ptr noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal fastcc noundef nonnull ptr @ehapi_rc_str(i16 noundef zeroext %0) unnamed_addr #6 {
  switch i16 %0, label %15 [
    i16 0, label %16
    i16 10, label %2
    i16 11, label %3
    i16 12, label %4
    i16 13, label %5
    i16 14, label %6
    i16 71, label %7
    i16 72, label %8
    i16 73, label %9
    i16 68, label %10
    i16 66, label %11
    i16 76, label %12
    i16 52, label %13
    i16 15, label %14
  ]

2:                                                ; preds = %1
  br label %16

3:                                                ; preds = %1
  br label %16

4:                                                ; preds = %1
  br label %16

5:                                                ; preds = %1
  br label %16

6:                                                ; preds = %1
  br label %16

7:                                                ; preds = %1
  br label %16

8:                                                ; preds = %1
  br label %16

9:                                                ; preds = %1
  br label %16

10:                                               ; preds = %1
  br label %16

11:                                               ; preds = %1
  br label %16

12:                                               ; preds = %1
  br label %16

13:                                               ; preds = %1
  br label %16

14:                                               ; preds = %1
  br label %16

15:                                               ; preds = %1
  br label %16

16:                                               ; preds = %1, %15, %14, %13, %12, %11, %10, %9, %8, %7, %6, %5, %4, %3, %2
  %17 = phi ptr [ @"??_C@_0BB@GAEFCNMD@ER_EHAPI_TIMEOUT?$AA@", %14 ], [ @"??_C@_0L@BODLGHHI@UNKNOWN_RC?$AA@", %15 ], [ @"??_C@_0BC@NEBAMHHI@ER_EHAPI_READONLY?$AA@", %13 ], [ @"??_C@_0CC@EPBMOFKF@ER_EHAPI_STATE_I?5?$CImaster?5in?5INIT@", %2 ], [ @"??_C@_0BB@EAINAHCL@ER_EHAPI_STATE_P?$AA@", %3 ], [ @"??_C@_0BB@GLKAFEOI@ER_EHAPI_STATE_S?$AA@", %4 ], [ @"??_C@_0BB@INNHAJLF@ER_EHAPI_STATE_O?$AA@", %5 ], [ @"??_C@_0CE@FHDLJFEF@ER_EHAPI_NOITEM?5?$CIOD?5item?5not?5fou@", %6 ], [ @"??_C@_0CE@HBGEPOLC@ER_EHAPI_INDEX?5?$CIOD?5index?5not?5exi@", %7 ], [ @"??_C@_0CK@HLCJIKKP@ER_EHAPI_SUBINDEX?5?$CIOD?5subindex?5n@", %8 ], [ @"??_C@_0CF@JEELLCF@ER_EHAPI_LENGTH?5?$CIOD?5length?5misma@", %9 ], [ @"??_C@_0CE@IIFKLKO@ER_EHAPI_ENIFILE?5?$CIENI?5load?5failu@", %10 ], [ @"??_C@_0CB@GLKAHDMK@ER_EHAPI_OFFLINE?5?$CIslave?5offline?$CJ@", %11 ], [ @"??_C@_0CD@JDHDBFJP@ER_EHAPI_NO_RESPONSE?5?$CIno?5respons@", %12 ], [ @"??_C@_0M@GKGONAIF@ER_EHAPI_OK?$AA@", %1 ]
  ret ptr %17
}

declare dllimport zeroext i16 @EhGetSlaveCount(i32 noundef, ptr noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define internal fastcc void @print_all_connected_slave_states(i32 noundef range(i32 1, 0) %0, ptr noundef %1) unnamed_addr #0 {
  %3 = alloca %struct.TAG_SLAVE_DETAIL, align 4
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  %6 = icmp eq ptr %1, null
  %7 = select i1 %6, ptr @"??_C@_00CNPNBAHC@?$AA@", ptr %1
  %8 = tail call ptr @getenv(ptr noundef nonnull @"??_C@_0BE@OBEAEJCL@ECAT_ALIAS_SCAN_MAX?$AA@")
  %9 = icmp eq ptr %8, null
  br i1 %9, label %18, label %10

10:                                               ; preds = %2
  %11 = load i8, ptr %8, align 1
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %18, label %13

13:                                               ; preds = %10
  %14 = tail call i32 @atoi(ptr noundef nonnull %8)
  %15 = add i32 %14, -1
  %16 = icmp ult i32 %15, 512
  %17 = select i1 %16, i32 %14, i32 15
  br label %18

18:                                               ; preds = %13, %10, %2
  %19 = phi i32 [ %17, %13 ], [ 15, %10 ], [ 15, %2 ]
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #14
  %20 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0EA@DBNIOFNN@?$CFs?$FLall?5ENI?5slaves?$FN?5alias?51?4?4?$CFu?5?5@", ptr noundef nonnull %7, i32 noundef %19)
  %21 = getelementptr inbounds nuw i8, ptr %3, i32 4
  %22 = getelementptr inbounds nuw i8, ptr %3, i32 36
  %23 = getelementptr inbounds nuw i8, ptr %3, i32 52
  %24 = getelementptr inbounds nuw i8, ptr %3, i32 84
  %25 = getelementptr inbounds nuw i8, ptr %3, i32 6
  br label %26

26:                                               ; preds = %18, %89
  %27 = phi i32 [ 1, %18 ], [ %92, %89 ]
  %28 = phi i16 [ 1, %18 ], [ %91, %89 ]
  %29 = phi i32 [ 0, %18 ], [ %90, %89 ]
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 2 dereferenceable(82) %25, i8 0, i32 82, i1 false)
  store i32 88, ptr %3, align 4
  store i16 %28, ptr %21, align 4
  %30 = call zeroext i16 @EhFindSlaveByAlias(i32 noundef %0, ptr noundef nonnull %3) #14
  %31 = icmp eq i16 %30, 0
  br i1 %31, label %32, label %89

32:                                               ; preds = %26
  %33 = add nsw i32 %29, 1
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #14
  store i16 0, ptr %4, align 2
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #14
  store i16 0, ptr %5, align 2
  %34 = call zeroext i16 @EhGetSlaveState(i32 noundef %0, i16 noundef zeroext %28, ptr noundef nonnull %4, ptr noundef nonnull %5) #14
  %35 = icmp eq i16 %34, 0
  br i1 %35, label %36, label %81

36:                                               ; preds = %32
  %37 = load i16, ptr %5, align 2
  %38 = zext i16 %37 to i32
  %39 = call range(i32 0, 17) i32 @llvm.ctpop.i32(i32 %38)
  %40 = icmp eq i32 %39, 1
  br i1 %40, label %41, label %44

41:                                               ; preds = %36
  %42 = call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %38, i1 true)
  %43 = icmp samesign ult i32 %42, 4
  br i1 %43, label %52, label %44

44:                                               ; preds = %41, %36
  %45 = and i32 %38, 31
  %46 = icmp eq i32 %45, 17
  br i1 %46, label %47, label %50

47:                                               ; preds = %44
  %48 = and i32 %38, 241
  %49 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", i32 noundef %48) #14
  br label %55

50:                                               ; preds = %44
  %51 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", i32 noundef %38) #14
  br label %55

52:                                               ; preds = %41
  %53 = getelementptr inbounds nuw ptr, ptr @switch.table.print_master_state_snapshot.28, i32 %42
  %54 = load ptr, ptr %53, align 4
  br label %55

55:                                               ; preds = %52, %47, %50
  %56 = phi ptr [ @g_state_str_buf, %47 ], [ @g_state_str_buf, %50 ], [ %54, %52 ]
  %57 = load i16, ptr %4, align 2
  %58 = zext i16 %57 to i32
  %59 = call range(i32 0, 17) i32 @llvm.ctpop.i32(i32 %58)
  %60 = icmp eq i32 %59, 1
  br i1 %60, label %61, label %64

61:                                               ; preds = %55
  %62 = call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %58, i1 true)
  %63 = icmp samesign ult i32 %62, 4
  br i1 %63, label %72, label %64

64:                                               ; preds = %61, %55
  %65 = and i32 %58, 31
  %66 = icmp eq i32 %65, 17
  br i1 %66, label %67, label %70

67:                                               ; preds = %64
  %68 = and i32 %58, 241
  %69 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", i32 noundef %68) #14
  br label %75

70:                                               ; preds = %64
  %71 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", i32 noundef %58) #14
  br label %75

72:                                               ; preds = %61
  %73 = getelementptr inbounds nuw ptr, ptr @switch.table.print_master_state_snapshot.28, i32 %62
  %74 = load ptr, ptr %73, align 4
  br label %75

75:                                               ; preds = %72, %67, %70
  %76 = phi ptr [ @g_state_str_buf, %67 ], [ @g_state_str_buf, %70 ], [ %74, %72 ]
  %77 = load i32, ptr %22, align 4
  %78 = load i32, ptr %23, align 4
  %79 = load i32, ptr %24, align 4
  %80 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0FA@EAGNHGHP@?$CFs?5?5alias?$DN?$CF2u?5?5slaveNo?$DN?$CF?94lu?5?5ph@", ptr noundef nonnull %7, i32 noundef %27, i32 noundef %79, i32 noundef %78, i32 noundef %77, ptr noundef nonnull %76, i32 noundef %58, ptr noundef nonnull %56, i32 noundef %38)
  br label %88

81:                                               ; preds = %32
  %82 = zext i16 %34 to i32
  %83 = call fastcc ptr @ehapi_rc_str(i16 noundef zeroext %34)
  %84 = load i32, ptr %22, align 4
  %85 = load i32, ptr %23, align 4
  %86 = load i32, ptr %24, align 4
  %87 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0FG@LDADCKD@?$CFs?5?5alias?$DN?$CF2u?5?5slaveNo?$DN?$CF?94lu?5?5ph@", ptr noundef nonnull %7, i32 noundef %27, i32 noundef %86, i32 noundef %85, i32 noundef %84, i32 noundef %82, ptr noundef nonnull %83)
  br label %88

88:                                               ; preds = %81, %75
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #14
  br label %89

89:                                               ; preds = %26, %88
  %90 = phi i32 [ %29, %26 ], [ %33, %88 ]
  %91 = add i16 %28, 1
  %92 = zext i16 %91 to i32
  %93 = icmp samesign ult i32 %19, %92
  br i1 %93, label %94, label %26, !llvm.loop !15

94:                                               ; preds = %89
  %95 = icmp eq i32 %90, 0
  br i1 %95, label %96, label %98

96:                                               ; preds = %94
  %97 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0EL@DPJBKDMP@?$CFs?5?5?$CIno?5slave?5matched?5in?5this?5sc@", ptr noundef nonnull %7)
  br label %100

98:                                               ; preds = %94
  %99 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BK@PLDNLDIJ@?$CFs?5?5?$CI?$CFd?5slave?$CIs?$CJ?5in?5ENI?$CJ?6?$AA@", ptr noundef nonnull %7, i32 noundef %90)
  br label %100

100:                                              ; preds = %98, %96
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #14
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(read)
declare dso_local i32 @atoi(ptr noundef captures(none)) local_unnamed_addr #7

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #8

declare dllimport zeroext i16 @EhFindSlaveByAlias(i32 noundef, ptr noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #9

declare dllimport zeroext i16 @EhRqSlaveState(i32 noundef, i16 noundef zeroext, i16 noundef zeroext) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strcmp(ptr noundef captures(none), ptr noundef captures(none)) local_unnamed_addr #10

; Function Attrs: nounwind
define internal fastcc zeroext range(i16 0, 16) i16 @wait_all_slaves_state_monitored(i32 noundef range(i32 1, 0) %0, ptr noundef nonnull captures(none) %1, i32 noundef range(i32 1, 0) %2, i16 noundef zeroext range(i16 2, 5) %3, i32 noundef range(i32 1, 0) %4) unnamed_addr #0 {
  %6 = alloca i16, align 2
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  %9 = alloca i16, align 2
  %10 = alloca i16, align 2
  %11 = alloca i16, align 2
  %12 = icmp slt i32 %2, 1
  br i1 %12, label %341, label %13

13:                                               ; preds = %5
  %14 = zext nneg i16 %3 to i32
  %15 = tail call range(i32 1, 4) i32 @llvm.ctpop.i32(i32 %14)
  %16 = icmp eq i32 %15, 1
  br i1 %16, label %17, label %21

17:                                               ; preds = %13
  %18 = tail call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %14, i1 true)
  %19 = getelementptr inbounds nuw ptr, ptr @switch.table.wait_all_slaves_state_monitored.27, i32 %18
  %20 = load ptr, ptr %19, align 4
  br label %23

21:                                               ; preds = %13
  %22 = tail call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", i32 noundef %14) #14
  br label %23

23:                                               ; preds = %17, %21
  %24 = phi ptr [ %20, %17 ], [ @g_state_str_buf, %21 ]
  %25 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0DC@BMHAGCCA@Monitor?5?$CFd?5slave?$CIs?$CJ?5until?5all?5re@", i32 noundef %2, ptr noundef nonnull %24, i32 noundef %14)
  %26 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0FM@IILNABDO@?5?5?$CIpoll?5interval?5?$CFums?$DL?5heartbeat@", i32 noundef 100, i32 noundef 1000)
  %27 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BP@NBJHBPDG@?5?5?$FLt?$DN?$CFlums?$FN?5initial?5snapshot?3?6?$AA@", i32 noundef 0)
  br label %28

28:                                               ; preds = %23, %92
  %29 = phi i32 [ %93, %92 ], [ 0, %23 ]
  call void @llvm.lifetime.start.p0(ptr nonnull %6) #14
  store i16 0, ptr %6, align 2
  call void @llvm.lifetime.start.p0(ptr nonnull %7) #14
  store i16 0, ptr %7, align 2
  %30 = getelementptr inbounds nuw %struct.OmronSlaveEntry, ptr %1, i32 %29
  %31 = getelementptr inbounds nuw i8, ptr %30, i32 4
  %32 = load i16, ptr %31, align 2
  %33 = call zeroext i16 @EhGetSlaveState(i32 noundef %0, i16 noundef zeroext %32, ptr noundef nonnull %6, ptr noundef nonnull %7) #14
  %34 = icmp eq i16 %33, 0
  br i1 %34, label %43, label %35

35:                                               ; preds = %28
  %36 = zext i16 %33 to i32
  %37 = call fastcc ptr @ehapi_rc_str(i16 noundef zeroext %33)
  %38 = load i16, ptr %31, align 2
  %39 = zext i16 %38 to i32
  %40 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0DA@DLGPDPGH@?5?5?5?5?5?5alias?$DN?$CFu?5?5EhGetSlaveState?5@", i32 noundef %39, i32 noundef %36, ptr noundef nonnull %37)
  %41 = getelementptr inbounds nuw i8, ptr %30, i32 88
  store i16 -1, ptr %41, align 2
  %42 = getelementptr inbounds nuw i8, ptr %30, i32 90
  store i16 -1, ptr %42, align 2
  br label %92

43:                                               ; preds = %28
  %44 = load i16, ptr %6, align 2
  %45 = getelementptr inbounds nuw i8, ptr %30, i32 88
  store i16 %44, ptr %45, align 2
  %46 = load i16, ptr %7, align 2
  %47 = getelementptr inbounds nuw i8, ptr %30, i32 90
  store i16 %46, ptr %47, align 2
  %48 = zext i16 %46 to i32
  %49 = icmp eq i16 %46, %3
  %50 = select i1 %49, ptr @"??_C@_02GIPFHKNO@OK?$AA@", ptr @"??_C@_03JMFMNIFM@?9?9?9?$AA@"
  %51 = call range(i32 0, 17) i32 @llvm.ctpop.i32(i32 %48)
  %52 = icmp eq i32 %51, 1
  br i1 %52, label %53, label %56

53:                                               ; preds = %43
  %54 = call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %48, i1 true)
  %55 = icmp samesign ult i32 %54, 4
  br i1 %55, label %64, label %56

56:                                               ; preds = %53, %43
  %57 = and i32 %48, 31
  %58 = icmp eq i32 %57, 17
  br i1 %58, label %59, label %62

59:                                               ; preds = %56
  %60 = and i32 %48, 241
  %61 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", i32 noundef %60) #14
  br label %67

62:                                               ; preds = %56
  %63 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", i32 noundef %48) #14
  br label %67

64:                                               ; preds = %53
  %65 = getelementptr inbounds nuw ptr, ptr @switch.table.print_master_state_snapshot.28, i32 %54
  %66 = load ptr, ptr %65, align 4
  br label %67

67:                                               ; preds = %64, %59, %62
  %68 = phi ptr [ @g_state_str_buf, %59 ], [ @g_state_str_buf, %62 ], [ %66, %64 ]
  %69 = load i16, ptr %6, align 2
  %70 = zext i16 %69 to i32
  %71 = call range(i32 0, 17) i32 @llvm.ctpop.i32(i32 %70)
  %72 = icmp eq i32 %71, 1
  br i1 %72, label %73, label %76

73:                                               ; preds = %67
  %74 = call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %70, i1 true)
  %75 = icmp samesign ult i32 %74, 4
  br i1 %75, label %84, label %76

76:                                               ; preds = %73, %67
  %77 = and i32 %70, 31
  %78 = icmp eq i32 %77, 17
  br i1 %78, label %79, label %82

79:                                               ; preds = %76
  %80 = and i32 %70, 241
  %81 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", i32 noundef %80) #14
  br label %87

82:                                               ; preds = %76
  %83 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", i32 noundef %70) #14
  br label %87

84:                                               ; preds = %73
  %85 = getelementptr inbounds nuw ptr, ptr @switch.table.print_master_state_snapshot.28, i32 %74
  %86 = load ptr, ptr %85, align 4
  br label %87

87:                                               ; preds = %84, %79, %82
  %88 = phi ptr [ @g_state_str_buf, %79 ], [ @g_state_str_buf, %82 ], [ %86, %84 ]
  %89 = load i16, ptr %31, align 2
  %90 = zext i16 %89 to i32
  %91 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CO@LOIHEOAN@?5?5?5?5?5?5alias?$DN?$CFu?5?5rq?$DN?$CFs?$CI?$CFu?$CJ?5?5actua@", i32 noundef %90, ptr noundef nonnull %88, i32 noundef %70, ptr noundef nonnull %68, i32 noundef %48, ptr noundef nonnull %50)
  br label %92

92:                                               ; preds = %87, %35
  call void @llvm.lifetime.end.p0(ptr nonnull %7) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #14
  %93 = add nuw nsw i32 %29, 1
  %94 = icmp eq i32 %93, %2
  br i1 %94, label %95, label %28, !llvm.loop !16

95:                                               ; preds = %92
  call fastcc void @print_all_connected_slave_states(i32 noundef %0, ptr noundef nonnull @"??_C@_06GGLIPOFD@?5?5?5?5?5?5?$AA@")
  call fastcc void @print_master_state_snapshot(i32 noundef %0)
  %96 = call ptr @_stdio_ptr() #14
  %97 = getelementptr inbounds nuw i8, ptr %96, i32 56
  %98 = call i32 @fflush(ptr noundef nonnull %97)
  br label %99

99:                                               ; preds = %321, %95
  %100 = phi i32 [ 0, %95 ], [ %324, %321 ]
  %101 = phi i32 [ 0, %95 ], [ %103, %321 ]
  %102 = phi i32 [ 0, %95 ], [ %322, %321 ]
  %103 = add i32 %101, 1
  br label %104

104:                                              ; preds = %230, %99
  %105 = phi i32 [ 1, %99 ], [ %231, %230 ]
  %106 = phi i32 [ 0, %99 ], [ %232, %230 ]
  call void @llvm.lifetime.start.p0(ptr nonnull %8) #14
  store i16 0, ptr %8, align 2
  call void @llvm.lifetime.start.p0(ptr nonnull %9) #14
  store i16 0, ptr %9, align 2
  %107 = getelementptr inbounds nuw %struct.OmronSlaveEntry, ptr %1, i32 %106
  %108 = getelementptr inbounds nuw i8, ptr %107, i32 4
  %109 = load i16, ptr %108, align 2
  %110 = call zeroext i16 @EhGetSlaveState(i32 noundef %0, i16 noundef zeroext %109, ptr noundef nonnull %8, ptr noundef nonnull %9) #14
  %111 = icmp eq i16 %110, 0
  br i1 %111, label %112, label %233

112:                                              ; preds = %104
  %113 = load i16, ptr %8, align 2
  %114 = getelementptr inbounds nuw i8, ptr %107, i32 88
  %115 = load i16, ptr %114, align 2
  %116 = icmp eq i16 %113, %115
  %117 = load i16, ptr %9, align 2
  br i1 %116, label %118, label %122

118:                                              ; preds = %112
  %119 = getelementptr inbounds nuw i8, ptr %107, i32 90
  %120 = load i16, ptr %119, align 2
  %121 = icmp eq i16 %117, %120
  br i1 %121, label %224, label %122

122:                                              ; preds = %118, %112
  %123 = zext i16 %117 to i32
  %124 = call range(i32 0, 17) i32 @llvm.ctpop.i32(i32 %123)
  %125 = icmp eq i32 %124, 1
  br i1 %125, label %126, label %129

126:                                              ; preds = %122
  %127 = call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %123, i1 true)
  %128 = icmp samesign ult i32 %127, 4
  br i1 %128, label %137, label %129

129:                                              ; preds = %126, %122
  %130 = and i32 %123, 31
  %131 = icmp eq i32 %130, 17
  br i1 %131, label %132, label %135

132:                                              ; preds = %129
  %133 = and i32 %123, 241
  %134 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", i32 noundef %133) #14
  br label %140

135:                                              ; preds = %129
  %136 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", i32 noundef %123) #14
  br label %140

137:                                              ; preds = %126
  %138 = getelementptr inbounds nuw ptr, ptr @switch.table.print_master_state_snapshot.28, i32 %127
  %139 = load ptr, ptr %138, align 4
  br label %140

140:                                              ; preds = %137, %132, %135
  %141 = phi ptr [ @g_state_str_buf, %132 ], [ @g_state_str_buf, %135 ], [ %139, %137 ]
  %142 = getelementptr inbounds nuw i8, ptr %107, i32 90
  %143 = load i16, ptr %142, align 2
  %144 = zext i16 %143 to i32
  %145 = call range(i32 0, 17) i32 @llvm.ctpop.i32(i32 %144)
  %146 = icmp eq i32 %145, 1
  br i1 %146, label %147, label %150

147:                                              ; preds = %140
  %148 = call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %144, i1 true)
  %149 = icmp samesign ult i32 %148, 4
  br i1 %149, label %158, label %150

150:                                              ; preds = %147, %140
  %151 = and i32 %144, 31
  %152 = icmp eq i32 %151, 17
  br i1 %152, label %153, label %156

153:                                              ; preds = %150
  %154 = and i32 %144, 241
  %155 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", i32 noundef %154) #14
  br label %161

156:                                              ; preds = %150
  %157 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", i32 noundef %144) #14
  br label %161

158:                                              ; preds = %147
  %159 = getelementptr inbounds nuw ptr, ptr @switch.table.print_master_state_snapshot.28, i32 %148
  %160 = load ptr, ptr %159, align 4
  br label %161

161:                                              ; preds = %158, %153, %156
  %162 = phi ptr [ @g_state_str_buf, %153 ], [ @g_state_str_buf, %156 ], [ %160, %158 ]
  %163 = load i16, ptr %8, align 2
  %164 = zext i16 %163 to i32
  %165 = call range(i32 0, 17) i32 @llvm.ctpop.i32(i32 %164)
  %166 = icmp eq i32 %165, 1
  br i1 %166, label %167, label %170

167:                                              ; preds = %161
  %168 = call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %164, i1 true)
  %169 = icmp samesign ult i32 %168, 4
  br i1 %169, label %178, label %170

170:                                              ; preds = %167, %161
  %171 = and i32 %164, 31
  %172 = icmp eq i32 %171, 17
  br i1 %172, label %173, label %176

173:                                              ; preds = %170
  %174 = and i32 %164, 241
  %175 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", i32 noundef %174) #14
  br label %181

176:                                              ; preds = %170
  %177 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", i32 noundef %164) #14
  br label %181

178:                                              ; preds = %167
  %179 = getelementptr inbounds nuw ptr, ptr @switch.table.print_master_state_snapshot.28, i32 %168
  %180 = load ptr, ptr %179, align 4
  br label %181

181:                                              ; preds = %178, %173, %176
  %182 = phi ptr [ @g_state_str_buf, %173 ], [ @g_state_str_buf, %176 ], [ %180, %178 ]
  %183 = load i16, ptr %114, align 2
  %184 = zext i16 %183 to i32
  %185 = call range(i32 0, 17) i32 @llvm.ctpop.i32(i32 %184)
  %186 = icmp eq i32 %185, 1
  br i1 %186, label %187, label %190

187:                                              ; preds = %181
  %188 = call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %184, i1 true)
  %189 = icmp samesign ult i32 %188, 4
  br i1 %189, label %198, label %190

190:                                              ; preds = %187, %181
  %191 = and i32 %184, 31
  %192 = icmp eq i32 %191, 17
  br i1 %192, label %193, label %196

193:                                              ; preds = %190
  %194 = and i32 %184, 241
  %195 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", i32 noundef %194) #14
  br label %201

196:                                              ; preds = %190
  %197 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", i32 noundef %184) #14
  br label %201

198:                                              ; preds = %187
  %199 = getelementptr inbounds nuw ptr, ptr @switch.table.print_master_state_snapshot.28, i32 %188
  %200 = load ptr, ptr %199, align 4
  br label %201

201:                                              ; preds = %198, %193, %196
  %202 = phi ptr [ @g_state_str_buf, %193 ], [ @g_state_str_buf, %196 ], [ %200, %198 ]
  %203 = load i16, ptr %108, align 2
  %204 = zext i16 %203 to i32
  %205 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0EN@JPPIDOLA@?5?5?$FLt?$DN?$CFlums?5alias?$DN?$CFu?$FN?5CHANGED?3?5rq@", i32 noundef %100, i32 noundef %204, ptr noundef nonnull %202, i32 noundef %184, ptr noundef nonnull %182, i32 noundef %164, ptr noundef nonnull %162, i32 noundef %144, ptr noundef nonnull %141, i32 noundef %123)
  %206 = call ptr @getenv(ptr noundef nonnull @"??_C@_0BI@OGJHOEJJ@ECAT_SLAVE_ERR_ESC_DUMP?$AA@")
  %207 = icmp eq ptr %206, null
  br i1 %207, label %211, label %208

208:                                              ; preds = %201
  %209 = load i8, ptr %206, align 1
  %210 = icmp eq i8 %209, 48
  br i1 %210, label %217, label %211

211:                                              ; preds = %208, %201
  %212 = load i16, ptr %9, align 2
  %213 = and i16 %212, 16
  %214 = icmp eq i16 %213, 0
  br i1 %214, label %217, label %215

215:                                              ; preds = %211
  %216 = load i16, ptr %108, align 2
  call fastcc void @dump_esc_al_registers(i32 noundef %0, i16 noundef zeroext %216)
  br label %217

217:                                              ; preds = %208, %215, %211
  %218 = load i16, ptr %8, align 2
  store i16 %218, ptr %114, align 2
  %219 = load i16, ptr %9, align 2
  store i16 %219, ptr %142, align 2
  %220 = call ptr @_stdio_ptr() #14
  %221 = getelementptr inbounds nuw i8, ptr %220, i32 56
  %222 = call i32 @fflush(ptr noundef nonnull %221)
  %223 = load i16, ptr %9, align 2
  br label %224

224:                                              ; preds = %118, %217
  %225 = phi i16 [ %223, %217 ], [ %117, %118 ]
  %226 = icmp eq i16 %225, %3
  %227 = select i1 %226, i32 %105, i32 0
  call void @llvm.lifetime.end.p0(ptr nonnull %9) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %8) #14
  %228 = add nuw nsw i32 %106, 1
  %229 = icmp eq i32 %228, %2
  br i1 %229, label %244, label %230

230:                                              ; preds = %224, %233
  %231 = phi i32 [ %227, %224 ], [ 0, %233 ]
  %232 = phi i32 [ %228, %224 ], [ %242, %233 ]
  br label %104, !llvm.loop !17

233:                                              ; preds = %104
  %234 = zext i16 %110 to i32
  %235 = call fastcc ptr @ehapi_rc_str(i16 noundef zeroext %110)
  %236 = load i16, ptr %108, align 2
  %237 = zext i16 %236 to i32
  %238 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CN@KCGBJHLB@?5?5?$FLalias?$DN?$CFu?$FN?5EhGetSlaveState?5rc?$DN@", i32 noundef %237, i32 noundef %234, ptr noundef nonnull %235)
  %239 = call ptr @_stdio_ptr() #14
  %240 = getelementptr inbounds nuw i8, ptr %239, i32 56
  %241 = call i32 @fflush(ptr noundef nonnull %240)
  call void @llvm.lifetime.end.p0(ptr nonnull %9) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %8) #14
  %242 = add nuw nsw i32 %106, 1
  %243 = icmp eq i32 %242, %2
  br i1 %243, label %256, label %230

244:                                              ; preds = %224
  %245 = icmp eq i32 %227, 0
  br i1 %245, label %256, label %246

246:                                              ; preds = %244
  br i1 %16, label %247, label %251

247:                                              ; preds = %246
  %248 = call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %14, i1 true)
  %249 = getelementptr inbounds nuw ptr, ptr @switch.table.wait_all_slaves_state_monitored.27, i32 %248
  %250 = load ptr, ptr %249, align 4
  br label %253

251:                                              ; preds = %246
  %252 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", i32 noundef %14) #14
  br label %253

253:                                              ; preds = %247, %251
  %254 = phi ptr [ %250, %247 ], [ @g_state_str_buf, %251 ]
  %255 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CB@MMOEPFFD@All?5?$CFd?5slave?$CIs?$CJ?5reached?5?$CFs?$CI?$CFu?$CJ?4?6@", i32 noundef %2, ptr noundef nonnull %254, i32 noundef %14)
  br label %336

256:                                              ; preds = %233, %244
  %257 = add nsw i32 %102, 100
  %258 = icmp ugt i32 %257, 999
  br i1 %258, label %259, label %321

259:                                              ; preds = %256
  %260 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0EM@GGAOPIHH@?5?5?$FLt?$DN?$CFlums?5poll?$CD?$CFu?$FN?5heartbeat?5?$CIn@", i32 noundef %100, i32 noundef %103, i32 noundef 1000)
  br label %261

261:                                              ; preds = %259, %314
  %262 = phi i32 [ %315, %314 ], [ 0, %259 ]
  call void @llvm.lifetime.start.p0(ptr nonnull %10) #14
  store i16 0, ptr %10, align 2
  call void @llvm.lifetime.start.p0(ptr nonnull %11) #14
  store i16 0, ptr %11, align 2
  %263 = getelementptr inbounds nuw %struct.OmronSlaveEntry, ptr %1, i32 %262
  %264 = getelementptr inbounds nuw i8, ptr %263, i32 4
  %265 = load i16, ptr %264, align 2
  %266 = call zeroext i16 @EhGetSlaveState(i32 noundef %0, i16 noundef zeroext %265, ptr noundef nonnull %10, ptr noundef nonnull %11) #14
  %267 = icmp eq i16 %266, 0
  br i1 %267, label %268, label %314

268:                                              ; preds = %261
  %269 = load i16, ptr %11, align 2
  %270 = zext i16 %269 to i32
  %271 = icmp eq i16 %269, %3
  %272 = select i1 %271, ptr @"??_C@_02GIPFHKNO@OK?$AA@", ptr @"??_C@_03JMFMNIFM@?9?9?9?$AA@"
  %273 = call range(i32 0, 17) i32 @llvm.ctpop.i32(i32 %270)
  %274 = icmp eq i32 %273, 1
  br i1 %274, label %275, label %278

275:                                              ; preds = %268
  %276 = call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %270, i1 true)
  %277 = icmp samesign ult i32 %276, 4
  br i1 %277, label %286, label %278

278:                                              ; preds = %275, %268
  %279 = and i32 %270, 31
  %280 = icmp eq i32 %279, 17
  br i1 %280, label %281, label %284

281:                                              ; preds = %278
  %282 = and i32 %270, 241
  %283 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", i32 noundef %282) #14
  br label %289

284:                                              ; preds = %278
  %285 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", i32 noundef %270) #14
  br label %289

286:                                              ; preds = %275
  %287 = getelementptr inbounds nuw ptr, ptr @switch.table.print_master_state_snapshot.28, i32 %276
  %288 = load ptr, ptr %287, align 4
  br label %289

289:                                              ; preds = %286, %281, %284
  %290 = phi ptr [ @g_state_str_buf, %281 ], [ @g_state_str_buf, %284 ], [ %288, %286 ]
  %291 = load i16, ptr %10, align 2
  %292 = zext i16 %291 to i32
  %293 = call range(i32 0, 17) i32 @llvm.ctpop.i32(i32 %292)
  %294 = icmp eq i32 %293, 1
  br i1 %294, label %295, label %298

295:                                              ; preds = %289
  %296 = call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %292, i1 true)
  %297 = icmp samesign ult i32 %296, 4
  br i1 %297, label %306, label %298

298:                                              ; preds = %295, %289
  %299 = and i32 %292, 31
  %300 = icmp eq i32 %299, 17
  br i1 %300, label %301, label %304

301:                                              ; preds = %298
  %302 = and i32 %292, 241
  %303 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", i32 noundef %302) #14
  br label %309

304:                                              ; preds = %298
  %305 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", i32 noundef %292) #14
  br label %309

306:                                              ; preds = %295
  %307 = getelementptr inbounds nuw ptr, ptr @switch.table.print_master_state_snapshot.28, i32 %296
  %308 = load ptr, ptr %307, align 4
  br label %309

309:                                              ; preds = %306, %301, %304
  %310 = phi ptr [ @g_state_str_buf, %301 ], [ @g_state_str_buf, %304 ], [ %308, %306 ]
  %311 = load i16, ptr %264, align 2
  %312 = zext i16 %311 to i32
  %313 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CO@LOIHEOAN@?5?5?5?5?5?5alias?$DN?$CFu?5?5rq?$DN?$CFs?$CI?$CFu?$CJ?5?5actua@", i32 noundef %312, ptr noundef nonnull %310, i32 noundef %292, ptr noundef nonnull %290, i32 noundef %270, ptr noundef nonnull %272)
  br label %314

314:                                              ; preds = %309, %261
  call void @llvm.lifetime.end.p0(ptr nonnull %11) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %10) #14
  %315 = add nuw nsw i32 %262, 1
  %316 = icmp eq i32 %315, %2
  br i1 %316, label %317, label %261, !llvm.loop !18

317:                                              ; preds = %314
  call fastcc void @print_all_connected_slave_states(i32 noundef %0, ptr noundef nonnull @"??_C@_06GGLIPOFD@?5?5?5?5?5?5?$AA@")
  call fastcc void @print_master_state_snapshot(i32 noundef %0)
  %318 = call ptr @_stdio_ptr() #14
  %319 = getelementptr inbounds nuw i8, ptr %318, i32 56
  %320 = call i32 @fflush(ptr noundef nonnull %319)
  br label %321

321:                                              ; preds = %256, %317
  %322 = phi i32 [ 0, %317 ], [ %257, %256 ]
  %323 = call zeroext i8 @RtSleep(i32 noundef 100) #14
  %324 = add i32 %100, 100
  %325 = icmp ult i32 %324, %4
  br i1 %325, label %99, label %326, !llvm.loop !19

326:                                              ; preds = %321
  br i1 %16, label %327, label %331

327:                                              ; preds = %326
  %328 = call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %14, i1 true)
  %329 = getelementptr inbounds nuw ptr, ptr @switch.table.wait_all_slaves_state_monitored.27, i32 %328
  %330 = load ptr, ptr %329, align 4
  br label %333

331:                                              ; preds = %326
  %332 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", i32 noundef %14) #14
  br label %333

333:                                              ; preds = %327, %331
  %334 = phi ptr [ %330, %327 ], [ @g_state_str_buf, %331 ]
  %335 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CL@FOFPNPMA@Timeout?5waiting?5for?5all?5slaves?5?9@", ptr noundef nonnull %334, i32 noundef %14)
  br label %336

336:                                              ; preds = %333, %253
  %337 = phi i16 [ 0, %253 ], [ 15, %333 ]
  %338 = call ptr @_stdio_ptr() #14
  %339 = getelementptr inbounds nuw i8, ptr %338, i32 56
  %340 = call i32 @fflush(ptr noundef nonnull %339)
  br label %341

341:                                              ; preds = %336, %5
  %342 = phi i16 [ 0, %5 ], [ %337, %336 ]
  ret i16 %342
}

; Function Attrs: nounwind
define internal fastcc i32 @count_sdo_ready_slaves(i32 noundef range(i32 1, 0) %0, ptr noundef nonnull readonly captures(none) %1, i32 noundef range(i32 1, 0) %2) unnamed_addr #0 {
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  %6 = icmp sgt i32 %2, 0
  br i1 %6, label %7, label %31

7:                                                ; preds = %3, %27
  %8 = phi i32 [ %28, %27 ], [ 0, %3 ]
  %9 = phi i32 [ %29, %27 ], [ 0, %3 ]
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #14
  store i16 0, ptr %4, align 2
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #14
  store i16 0, ptr %5, align 2
  %10 = getelementptr inbounds nuw %struct.OmronSlaveEntry, ptr %1, i32 %9
  %11 = getelementptr inbounds nuw i8, ptr %10, i32 4
  %12 = load i16, ptr %11, align 2
  %13 = call zeroext i16 @EhGetSlaveState(i32 noundef %0, i16 noundef zeroext %12, ptr noundef nonnull %4, ptr noundef nonnull %5) #14
  %14 = icmp eq i16 %13, 0
  br i1 %14, label %15, label %27

15:                                               ; preds = %7
  %16 = load i16, ptr %5, align 2
  %17 = and i16 %16, 16
  %18 = icmp eq i16 %17, 0
  br i1 %18, label %19, label %26

19:                                               ; preds = %15
  %20 = and i16 %16, 15
  switch i16 %20, label %23 [
    i16 4, label %21
    i16 2, label %21
  ]

21:                                               ; preds = %19, %19
  %22 = add nsw i32 %8, 1
  br label %27

23:                                               ; preds = %19
  %24 = icmp eq i16 %20, 8
  %25 = add nsw i32 %8, 1
  br i1 %24, label %27, label %26

26:                                               ; preds = %15, %23
  br label %27

27:                                               ; preds = %26, %23, %21, %7
  %28 = phi i32 [ %8, %7 ], [ %8, %26 ], [ %25, %23 ], [ %22, %21 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #14
  %29 = add nuw nsw i32 %9, 1
  %30 = icmp eq i32 %29, %2
  br i1 %30, label %31, label %7, !llvm.loop !10

31:                                               ; preds = %27, %3
  %32 = phi i32 [ 0, %3 ], [ %28, %27 ]
  ret i32 %32
}

declare dso_local zeroext i8 @RtSleep(i32 noundef) local_unnamed_addr #4

declare dllimport zeroext i16 @EhGetSlaveState(i32 noundef, i16 noundef zeroext, ptr noundef, ptr noundef) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fflush(ptr noundef captures(none)) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @snprintf(ptr noalias noundef writeonly captures(none), i32 noundef, ptr noundef readonly captures(none), ...) local_unnamed_addr #3

; Function Attrs: nounwind
define internal fastcc void @print_master_state_snapshot(i32 noundef range(i32 1, 0) %0) unnamed_addr #0 {
  %2 = alloca i16, align 2
  %3 = alloca i16, align 2
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #14
  store i16 0, ptr %2, align 2
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #14
  store i16 0, ptr %3, align 2
  %4 = call zeroext i16 @EhGetState(i32 noundef %0, ptr noundef nonnull %2, ptr noundef nonnull %3) #14
  %5 = icmp eq i16 %4, 0
  br i1 %5, label %6, label %48

6:                                                ; preds = %1
  %7 = load i16, ptr %3, align 2
  %8 = zext i16 %7 to i32
  %9 = call range(i32 0, 17) i32 @llvm.ctpop.i32(i32 %8)
  %10 = icmp eq i32 %9, 1
  br i1 %10, label %11, label %14

11:                                               ; preds = %6
  %12 = call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %8, i1 true)
  %13 = icmp samesign ult i32 %12, 4
  br i1 %13, label %22, label %14

14:                                               ; preds = %11, %6
  %15 = and i32 %8, 31
  %16 = icmp eq i32 %15, 17
  br i1 %16, label %17, label %20

17:                                               ; preds = %14
  %18 = and i32 %8, 241
  %19 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", i32 noundef %18) #14
  br label %25

20:                                               ; preds = %14
  %21 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", i32 noundef %8) #14
  br label %25

22:                                               ; preds = %11
  %23 = getelementptr inbounds nuw ptr, ptr @switch.table.print_master_state_snapshot.28, i32 %12
  %24 = load ptr, ptr %23, align 4
  br label %25

25:                                               ; preds = %22, %17, %20
  %26 = phi ptr [ @g_state_str_buf, %17 ], [ @g_state_str_buf, %20 ], [ %24, %22 ]
  %27 = load i16, ptr %2, align 2
  %28 = zext i16 %27 to i32
  %29 = call range(i32 0, 17) i32 @llvm.ctpop.i32(i32 %28)
  %30 = icmp eq i32 %29, 1
  br i1 %30, label %31, label %34

31:                                               ; preds = %25
  %32 = call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %28, i1 true)
  %33 = icmp samesign ult i32 %32, 4
  br i1 %33, label %42, label %34

34:                                               ; preds = %31, %25
  %35 = and i32 %28, 31
  %36 = icmp eq i32 %35, 17
  br i1 %36, label %37, label %40

37:                                               ; preds = %34
  %38 = and i32 %28, 241
  %39 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", i32 noundef %38) #14
  br label %45

40:                                               ; preds = %34
  %41 = call i32 (ptr, i32, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) @g_state_str_buf, i32 noundef 40, ptr noundef nonnull @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", i32 noundef %28) #14
  br label %45

42:                                               ; preds = %31
  %43 = getelementptr inbounds nuw ptr, ptr @switch.table.print_master_state_snapshot.28, i32 %32
  %44 = load ptr, ptr %43, align 4
  br label %45

45:                                               ; preds = %42, %37, %40
  %46 = phi ptr [ @g_state_str_buf, %37 ], [ @g_state_str_buf, %40 ], [ %44, %42 ]
  %47 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CI@FLEOJDOI@?5?5?5?5?5?5master?3?5rq?$DN?$CFs?$CI?$CFu?$CJ?5?5actual?$DN@", ptr noundef nonnull %46, i32 noundef %28, ptr noundef nonnull %26, i32 noundef %8)
  br label %52

48:                                               ; preds = %1
  %49 = zext i16 %4 to i32
  %50 = call fastcc ptr @ehapi_rc_str(i16 noundef zeroext %4)
  %51 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CJ@GODOEOEO@?5?5?5?5?5?5master?3?5EhGetState?5rc?$DN0x?$CF0@", i32 noundef %49, ptr noundef nonnull %50)
  br label %52

52:                                               ; preds = %48, %45
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #14
  ret void
}

; Function Attrs: nounwind
define internal fastcc void @dump_esc_al_registers(i32 noundef range(i32 1, 0) %0, i16 noundef zeroext %1) unnamed_addr #0 {
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #14
  store i8 0, ptr %3, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #14
  store i8 0, ptr %4, align 1
  %5 = call zeroext i16 @EhReadRegister(i32 noundef %0, i16 noundef zeroext %1, i16 noundef zeroext 304, i16 noundef zeroext 1, ptr noundef nonnull %3) #14
  %6 = call zeroext i16 @EhReadRegister(i32 noundef %0, i16 noundef zeroext %1, i16 noundef zeroext 308, i16 noundef zeroext 1, ptr noundef nonnull %4) #14
  %7 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CI@KFNLKEHD@?5?5?5?5?5?5ESC?5registers?3?50x0130?$CIAL?5S@")
  %8 = icmp eq i16 %5, 0
  br i1 %8, label %9, label %13

9:                                                ; preds = %2
  %10 = load i8, ptr %3, align 1
  %11 = zext i8 %10 to i32
  %12 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_06IBAGLEAI@0x?$CF02X?$AA@", i32 noundef %11)
  br label %17

13:                                               ; preds = %2
  %14 = zext i16 %5 to i32
  %15 = call fastcc ptr @ehapi_rc_str(i16 noundef zeroext %5)
  %16 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BO@PJLAEK@EhReadRegister?5rc?$DN0x?$CF04X?5?$CI?$CFs?$CJ?$AA@", i32 noundef %14, ptr noundef nonnull %15)
  br label %17

17:                                               ; preds = %13, %9
  %18 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BK@NPBAMMOM@?5?50x0134?$CIAL?5Status?5Code?$CJ?$DN?$AA@")
  %19 = icmp eq i16 %6, 0
  br i1 %19, label %20, label %24

20:                                               ; preds = %17
  %21 = load i8, ptr %4, align 1
  %22 = zext i8 %21 to i32
  %23 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_07PELFGGAM@0x?$CF02X?6?$AA@", i32 noundef %22)
  br label %28

24:                                               ; preds = %17
  %25 = zext i16 %6 to i32
  %26 = call fastcc ptr @ehapi_rc_str(i16 noundef zeroext %6)
  %27 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BP@GMOGLJLE@EhReadRegister?5rc?$DN0x?$CF04X?5?$CI?$CFs?$CJ?6?$AA@", i32 noundef %25, ptr noundef nonnull %26)
  br label %28

28:                                               ; preds = %24, %20
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #14
  ret void
}

declare dllimport zeroext i16 @EhReadRegister(i32 noundef, i16 noundef zeroext, i16 noundef zeroext, i16 noundef zeroext, ptr noundef) local_unnamed_addr #4

declare dllimport zeroext i16 @EhReadODByAlias(i32 noundef, i16 noundef zeroext, i16 noundef zeroext, i8 noundef zeroext, ptr noundef, i8 noundef zeroext) local_unnamed_addr #4

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.ctpop.i32(i32) #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.cttz.i32(i32, i1 immarg) #12

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #13

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #11

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #11

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nofree nounwind memory(read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nocallback nofree nounwind willreturn memory(read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #9 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #10 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #12 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #13 = { nofree nounwind }
attributes #14 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "C:\\D_DRV\\work\\rtacc\\examples2\\omron3000\\omron_ecat_main.c", directory: "C:\\D_DRV\\work\\rtacc")
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
!13 = distinct !{!13, !8}
!14 = distinct !{!14, !8}
!15 = distinct !{!15, !8}
!16 = distinct !{!16, !8}
!17 = distinct !{!17, !8}
!18 = distinct !{!18, !8}
!19 = distinct !{!19, !8}
