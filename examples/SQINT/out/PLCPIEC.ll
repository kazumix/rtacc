; ModuleID = '..\PLCPIEC\PLCPIEC.c'
source_filename = "..\\PLCPIEC\\PLCPIEC.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.MNMTEMPLATE = type <{ ptr, i16, i8, i16, i16, i16, ptr, i16 }>

$LibVersion_0x0701 = comdat any

$"??_C@_02NFEPAFND@EQ?$AA@" = comdat any

$"??_C@_07EAFHGHGE@EQ_REAL?$AA@" = comdat any

$"??_C@_08HKPFNOFC@EQ_LREAL?$AA@" = comdat any

$"??_C@_07LOKGCOAI@EQ_SINT?$AA@" = comdat any

$"??_C@_07GMGGGFJK@EQ_DINT?$AA@" = comdat any

$"??_C@_06ELPONGDK@EQ_INT?$AA@" = comdat any

$"??_C@_07FMBGCOFL@EQ_LINT?$AA@" = comdat any

$"??_C@_08HCBNIPPP@EQ_UDINT?$AA@" = comdat any

$"??_C@_07DBOGNLKI@EQ_UINT?$AA@" = comdat any

$"??_C@_08KANNMEGN@EQ_USINT?$AA@" = comdat any

$"??_C@_08ECGNMEDO@EQ_ULINT?$AA@" = comdat any

$"??_C@_07FNBJGPFB@EQ_TIME?$AA@" = comdat any

$"??_C@_08OHECKEAK@EQ_DWORD?$AA@" = comdat any

$"??_C@_07DBLDJPFB@EQ_WORD?$AA@" = comdat any

$"??_C@_07PBFHMCBD@EQ_BYTE?$AA@" = comdat any

$"??_C@_07EFJEDNII@EQ_BOOL?$AA@" = comdat any

$"??_C@_02PIGFAGOI@GE?$AA@" = comdat any

$"??_C@_07JBODNIME@GE_REAL?$AA@" = comdat any

$"??_C@_08KMPCMJAF@GE_LREAL?$AA@" = comdat any

$"??_C@_07GPBCJBKI@GE_SINT?$AA@" = comdat any

$"??_C@_07LNNCNKDK@GE_DINT?$AA@" = comdat any

$"??_C@_06EECGIHJO@GE_INT?$AA@" = comdat any

$"??_C@_07INKCJBPL@GE_LINT?$AA@" = comdat any

$"??_C@_08KEBKJIKI@GE_UDINT?$AA@" = comdat any

$"??_C@_07OAFCGEAI@GE_UINT?$AA@" = comdat any

$"??_C@_08HGNKNDDK@GE_USINT?$AA@" = comdat any

$"??_C@_08JEGKNDGJ@GE_ULINT?$AA@" = comdat any

$"??_C@_07IMKNNAPB@GE_TIME?$AA@" = comdat any

$"??_C@_08DBEFLDFN@GE_DWORD?$AA@" = comdat any

$"??_C@_07OAAHCAPB@GE_WORD?$AA@" = comdat any

$"??_C@_07CAODHNLD@GE_BYTE?$AA@" = comdat any

$"??_C@_07JECAICCI@GE_BOOL?$AA@" = comdat any

$"??_C@_02KLLMCFPI@GT?$AA@" = comdat any

$"??_C@_07FAEKEPLO@GT_REAL?$AA@" = comdat any

$"??_C@_08BMODPILA@GT_LREAL?$AA@" = comdat any

$"??_C@_07KOLLAGNC@GT_SINT?$AA@" = comdat any

$"??_C@_07HMHLENEA@GT_DINT?$AA@" = comdat any

$"??_C@_06IMKMFGKA@GT_INT?$AA@" = comdat any

$"??_C@_07EMALAGIB@GT_LINT?$AA@" = comdat any

$"??_C@_08BEALKJBN@GT_UDINT?$AA@" = comdat any

$"??_C@_07CBPLPDHC@GT_UINT?$AA@" = comdat any

$"??_C@_08MGMLOCIP@GT_USINT?$AA@" = comdat any

$"??_C@_08CEHLOCNM@GT_ULINT?$AA@" = comdat any

$"??_C@_07ENAEEHIL@GT_TIME?$AA@" = comdat any

$"??_C@_08IBFEICOI@GT_DWORD?$AA@" = comdat any

$"??_C@_07CBKOLHIL@GT_WORD?$AA@" = comdat any

$"??_C@_07OBEKOKMJ@GT_BYTE?$AA@" = comdat any

$"??_C@_07FFIJBFFC@GT_BOOL?$AA@" = comdat any

$"??_C@_02PEDAOJAJ@LE?$AA@" = comdat any

$"??_C@_07MMIJMEJC@LE_REAL?$AA@" = comdat any

$"??_C@_08COKHFHNI@LE_LREAL?$AA@" = comdat any

$"??_C@_07DCHIINPO@LE_SINT?$AA@" = comdat any

$"??_C@_07OALIMGGM@LE_DINT?$AA@" = comdat any

$"??_C@_06EGCBNDGE@LE_INT?$AA@" = comdat any

$"??_C@_07NAMIINKN@LE_LINT?$AA@" = comdat any

$"??_C@_08CGEPAGHF@LE_UDINT?$AA@" = comdat any

$"??_C@_07LNDIHIFO@LE_UINT?$AA@" = comdat any

$"??_C@_08PEIPENOH@LE_USINT?$AA@" = comdat any

$"??_C@_08BGDPENLE@LE_ULINT?$AA@" = comdat any

$"??_C@_07NBMHMMKH@LE_TIME?$AA@" = comdat any

$"??_C@_08LDBACNIA@LE_DWORD?$AA@" = comdat any

$"??_C@_07LNGNDMKH@LE_WORD?$AA@" = comdat any

$"??_C@_07HNIJGBOF@LE_BYTE?$AA@" = comdat any

$"??_C@_07MJEKJOHO@LE_BOOL?$AA@" = comdat any

$"??_C@_02KHOJMKBJ@LT?$AA@" = comdat any

$"??_C@_07NCAFDOI@LT_REAL?$AA@" = comdat any

$"??_C@_08JOLGGGGN@LT_LREAL?$AA@" = comdat any

$"??_C@_07PDNBBKIE@LT_SINT?$AA@" = comdat any

$"??_C@_07CBBBFBBG@LT_DINT?$AA@" = comdat any

$"??_C@_06IOKLACFK@LT_INT?$AA@" = comdat any

$"??_C@_07BBGBBKNH@LT_LINT?$AA@" = comdat any

$"??_C@_08JGFODHMA@LT_UDINT?$AA@" = comdat any

$"??_C@_07HMJBOPCE@LT_UINT?$AA@" = comdat any

$"??_C@_08EEJOHMFC@LT_USINT?$AA@" = comdat any

$"??_C@_08KGCOHMAB@LT_ULINT?$AA@" = comdat any

$"??_C@_07BAGOFLNN@LT_TIME?$AA@" = comdat any

$"??_C@_08DABBMDF@LT_DWORD?$AA@" = comdat any

$"??_C@_07HMMEKLNN@LT_WORD?$AA@" = comdat any

$"??_C@_07LMCAPGJP@LT_BYTE?$AA@" = comdat any

$"??_C@_07IODAJAE@LT_BOOL?$AA@" = comdat any

$"??_C@_02PHLEDNGH@NE?$AA@" = comdat any

$"??_C@_07IOKMMDOP@NE_REAL?$AA@" = comdat any

$"??_C@_08FBHPFO@NE_LREAL?$AA@" = comdat any

$"??_C@_07HAFNIKID@NE_SINT?$AA@" = comdat any

$"??_C@_07KCJNMBBB@NE_DINT?$AA@" = comdat any

$"??_C@_06NBLOMCEN@NE_INT?$AA@" = comdat any

$"??_C@_07JCONIKNA@NE_LINT?$AA@" = comdat any

$"??_C@_08ILJCOPD@NE_UDINT?$AA@" = comdat any

$"??_C@_07PPBNHPCD@NE_UINT?$AA@" = comdat any

$"??_C@_08NKHJGFGB@NE_USINT?$AA@" = comdat any

$"??_C@_08DIMJGFDC@NE_ULINT?$AA@" = comdat any

$"??_C@_07JDOCMLNK@NE_TIME?$AA@" = comdat any

$"??_C@_08JNOGAFAG@NE_DWORD?$AA@" = comdat any

$"??_C@_07PPEIDLNK@NE_WORD?$AA@" = comdat any

$"??_C@_07DPKMGGJI@NE_BYTE?$AA@" = comdat any

$"??_C@_07ILGPJJAD@NE_BOOL?$AA@" = comdat any

$"??_C@_03BOJFLAKG@ADD?$AA@" = comdat any

$"??_C@_08PDNJAIBA@ADD_REAL?$AA@" = comdat any

$"??_C@_09CNCOOFBI@ADD_LREAL?$AA@" = comdat any

$"??_C@_08NCIEBHM@ADD_SINT?$AA@" = comdat any

$"??_C@_08NPOIAKOO@ADD_DINT?$AA@" = comdat any

$"??_C@_07KDOLIMMC@ADD_INT?$AA@" = comdat any

$"??_C@_08OPJIEBCP@ADD_LINT?$AA@" = comdat any

$"??_C@_09CFMGLELF@ADD_UDINT?$AA@" = comdat any

$"??_C@_08ICGILENM@ADD_UINT?$AA@" = comdat any

$"??_C@_09PHAGPPCH@ADD_USINT?$AA@" = comdat any

$"??_C@_09BFLGPPHE@ADD_ULINT?$AA@" = comdat any

$"??_C@_07BMHMMKMH@ADD_T_T?$AA@" = comdat any

$"??_C@_03FJGHKDBE@DIV?$AA@" = comdat any

$"??_C@_08NCAKNFGJ@DIV_REAL?$AA@" = comdat any

$"??_C@_09ENGPPFN@DIV_LREAL?$AA@" = comdat any

$"??_C@_08CMPLJMAF@DIV_SINT?$AA@" = comdat any

$"??_C@_08PODLNHJH@DIV_DINT?$AA@" = comdat any

$"??_C@_07MEMCEAPG@DIV_INT?$AA@" = comdat any

$"??_C@_08MOELJMFG@DIV_LINT?$AA@" = comdat any

$"??_C@_09MDOKOPA@DIV_UDINT?$AA@" = comdat any

$"??_C@_08KDLLGJKF@DIV_UINT?$AA@" = comdat any

$"??_C@_09NOPOOFGC@DIV_USINT?$AA@" = comdat any

$"??_C@_09DMEOOFDB@DIV_ULINT?$AA@" = comdat any

$"??_C@_08FANIPFLA@DIV_T_AN?$AA@" = comdat any

$"??_C@_0O@FIPKPHEJ@DIV_T_AN_SINT?$AA@" = comdat any

$"??_C@_0O@IKDKLMNL@DIV_T_AN_DINT?$AA@" = comdat any

$"??_C@_0N@HEHLJGHF@DIV_T_AN_INT?$AA@" = comdat any

$"??_C@_0O@LKEKPHBK@DIV_T_AN_LINT?$AA@" = comdat any

$"??_C@_0P@HDCAKCCA@DIV_T_AN_UDINT?$AA@" = comdat any

$"??_C@_0O@NHLKACOJ@DIV_T_AN_UINT?$AA@" = comdat any

$"??_C@_0P@KBOAOJLC@DIV_T_AN_USINT?$AA@" = comdat any

$"??_C@_0P@EDFAOJOB@DIV_T_AN_ULINT?$AA@" = comdat any

$"??_C@_0O@KGALLOCF@DIV_T_AN_REAL?$AA@" = comdat any

$"??_C@_0P@HLMIPDIN@DIV_T_AN_LREAL?$AA@" = comdat any

$"??_C@_08BPJJGDHH@DIV_T_AI?$AA@" = comdat any

$"??_C@_0O@JNFNMJMH@DIV_T_AI_SINT?$AA@" = comdat any

$"??_C@_0O@EPJNICFF@DIV_T_AI_DINT?$AA@" = comdat any

$"??_C@_0N@GJHOKGMN@DIV_T_AI_INT?$AA@" = comdat any

$"??_C@_0O@HPONMJJE@DIV_T_AI_LINT?$AA@" = comdat any

$"??_C@_0P@HJOFKLDJ@DIV_T_AI_UDINT?$AA@" = comdat any

$"??_C@_0O@BCBNDMGH@DIV_T_AI_UINT?$AA@" = comdat any

$"??_C@_0P@KLCFOAKL@DIV_T_AI_USINT?$AA@" = comdat any

$"??_C@_0P@EJJFOAPI@DIV_T_AI_ULINT?$AA@" = comdat any

$"??_C@_07CNAPKBHF@DIV_T_R?$AA@" = comdat any

$"??_C@_04BFBMEOHG@EXPT?$AA@" = comdat any

$"??_C@_0P@GJJODHJO@EXPT_REAL_REAL?$AA@" = comdat any

$"??_C@_0BA@CHLEAMAA@EXPT_REAL_LREAL?$AA@" = comdat any

$"??_C@_0P@JHGPHOPC@EXPT_REAL_SINT?$AA@" = comdat any

$"??_C@_0P@EFKPDFGA@EXPT_REAL_DINT?$AA@" = comdat any

$"??_C@_0O@FLGHLEED@EXPT_REAL_INT?$AA@" = comdat any

$"??_C@_0P@HFNPHOKB@EXPT_REAL_LINT?$AA@" = comdat any

$"??_C@_0BA@CPFMFNKN@EXPT_REAL_UDINT?$AA@" = comdat any

$"??_C@_0P@BICPILFC@EXPT_REAL_UINT?$AA@" = comdat any

$"??_C@_0BA@PNJMBGDP@EXPT_REAL_USINT?$AA@" = comdat any

$"??_C@_0BA@BPCMBGGM@EXPT_REAL_ULINT?$AA@" = comdat any

$"??_C@_0BA@LNLMLOH@EXPT_LREAL_REAL?$AA@" = comdat any

$"??_C@_0BB@OAPIAGE@EXPT_LREAL_LREAL?$AA@" = comdat any

$"??_C@_0BA@PFCKICIL@EXPT_LREAL_SINT?$AA@" = comdat any

$"??_C@_0BA@CHOKMJBJ@EXPT_LREAL_DINT?$AA@" = comdat any

$"??_C@_0P@MDIGBCBP@EXPT_LREAL_INT?$AA@" = comdat any

$"??_C@_0BA@BHJKICNI@EXPT_LREAL_LINT?$AA@" = comdat any

$"??_C@_0BB@GOHNBMJ@EXPT_LREAL_UDINT?$AA@" = comdat any

$"??_C@_0BA@HKGKHHCL@EXPT_LREAL_UINT?$AA@" = comdat any

$"??_C@_0BB@NECHJKFL@EXPT_LREAL_USINT?$AA@" = comdat any

$"??_C@_0BB@DGJHJKAI@EXPT_LREAL_ULINT?$AA@" = comdat any

$"??_C@_03FIBGOAPP@MOD?$AA@" = comdat any

$"??_C@_08EIIHOHFC@MOD_REAL?$AA@" = comdat any

$"??_C@_09LFEHJLEL@MOD_LREAL?$AA@" = comdat any

$"??_C@_08LGHGKODO@MOD_SINT?$AA@" = comdat any

$"??_C@_08GELGOFKM@MOD_DINT?$AA@" = comdat any

$"??_C@_07PGEDMNHH@MOD_INT?$AA@" = comdat any

$"??_C@_08FEMGKOGN@MOD_LINT?$AA@" = comdat any

$"??_C@_09LNKPMKOG@MOD_UDINT?$AA@" = comdat any

$"??_C@_08DJDGFLJO@MOD_UINT?$AA@" = comdat any

$"??_C@_09GPGPIBHE@MOD_USINT?$AA@" = comdat any

$"??_C@_09INNPIBCH@MOD_ULINT?$AA@" = comdat any

$"??_C@_04LPPGDFDD@MOVE?$AA@" = comdat any

$"??_C@_09MNDFBOKI@MOVE_REAL?$AA@" = comdat any

$"??_C@_0L@OIKKDCLA@MOVE_LREAL?$AA@" = comdat any

$"??_C@_09DDMEFHME@MOVE_SINT?$AA@" = comdat any

$"??_C@_09OBAEBMFG@MOVE_DINT?$AA@" = comdat any

$"??_C@_08CBIKOPCF@MOVE_INT?$AA@" = comdat any

$"??_C@_09NBHEFHJH@MOVE_LINT?$AA@" = comdat any

$"??_C@_0L@OAECGDBN@MOVE_UDINT?$AA@" = comdat any

$"??_C@_09LMIEKCGE@MOVE_UINT?$AA@" = comdat any

$"??_C@_0L@DCICCIIP@MOVE_USINT?$AA@" = comdat any

$"??_C@_0L@NADCCINM@MOVE_ULINT?$AA@" = comdat any

$"??_C@_09NAHLBGJN@MOVE_TIME?$AA@" = comdat any

$"??_C@_0L@HFBNEIOI@MOVE_DWORD?$AA@" = comdat any

$"??_C@_09LMNBOGJN@MOVE_WORD?$AA@" = comdat any

$"??_C@_09HMDFLLNP@MOVE_BYTE?$AA@" = comdat any

$"??_C@_09MIPGEEEE@MOVE_BOOL?$AA@" = comdat any

$"??_C@_0M@CHIOHIFF@MOVE_STRING?$AA@" = comdat any

$"??_C@_03IBHOEMFB@MUL?$AA@" = comdat any

$"??_C@_08JGBDIENG@MUL_REAL?$AA@" = comdat any

$"??_C@_09FPEMEIBB@MUL_LREAL?$AA@" = comdat any

$"??_C@_08GIOCMNLK@MUL_SINT?$AA@" = comdat any

$"??_C@_08LKCCIGCI@MUL_DINT?$AA@" = comdat any

$"??_C@_07NJLOIMJK@MUL_INT?$AA@" = comdat any

$"??_C@_08IKFCMNOJ@MUL_LINT?$AA@" = comdat any

$"??_C@_09FHKEBJLM@MUL_UDINT?$AA@" = comdat any

$"??_C@_08OHKCDIBK@MUL_UINT?$AA@" = comdat any

$"??_C@_09IFGEFCCO@MUL_USINT?$AA@" = comdat any

$"??_C@_09GHNEFCHN@MUL_ULINT?$AA@" = comdat any

$"??_C@_08BEMBKEAP@MUL_T_AN?$AA@" = comdat any

$"??_C@_0O@DODOBCLF@MUL_T_AN_SINT?$AA@" = comdat any

$"??_C@_0O@OMPOFJCH@MUL_T_AN_DINT?$AA@" = comdat any

$"??_C@_0N@LGKFKAKP@MUL_T_AN_INT?$AA@" = comdat any

$"??_C@_0O@NMIOBCOG@MUL_T_AN_LINT?$AA@" = comdat any

$"??_C@_0P@MHENNIPC@MUL_T_AN_UDINT?$AA@" = comdat any

$"??_C@_0O@LBHOOHBF@MUL_T_AN_UINT?$AA@" = comdat any

$"??_C@_0P@BFINJDGA@MUL_T_AN_USINT?$AA@" = comdat any

$"??_C@_0P@PHDNJDDD@MUL_T_AN_ULINT?$AA@" = comdat any

$"??_C@_0O@MAMPFLNJ@MUL_T_AN_REAL?$AA@" = comdat any

$"??_C@_0P@MPKFIJFP@MUL_T_AN_LREAL?$AA@" = comdat any

$"??_C@_08FLIADCMI@MUL_T_AI?$AA@" = comdat any

$"??_C@_0O@PLJJCMDL@MUL_T_AI_SINT?$AA@" = comdat any

$"??_C@_0O@CJFJGHKJ@MUL_T_AI_DINT?$AA@" = comdat any

$"??_C@_0N@KLKAJABH@MUL_T_AI_INT?$AA@" = comdat any

$"??_C@_0O@BJCJCMGI@MUL_T_AI_LINT?$AA@" = comdat any

$"??_C@_0P@MNIINBOL@MUL_T_AI_UDINT?$AA@" = comdat any

$"??_C@_0O@HENJNJJL@MUL_T_AI_UINT?$AA@" = comdat any

$"??_C@_0P@BPEIJKHJ@MUL_T_AI_USINT?$AA@" = comdat any

$"??_C@_0P@PNPIJKCK@MUL_T_AI_ULINT?$AA@" = comdat any

$"??_C@_07DAHDGNBJ@MUL_T_R?$AA@" = comdat any

$"??_C@_03GMBJJJAE@NEG?$AA@" = comdat any

$"??_C@_08NBCCNNMC@NEG_REAL?$AA@" = comdat any

$"??_C@_09EFNBKNDF@NEG_LREAL?$AA@" = comdat any

$"??_C@_08CPNDJEKO@NEG_SINT?$AA@" = comdat any

$"??_C@_08PNBDNPDM@NEG_DINT?$AA@" = comdat any

$"??_C@_07FKCIOHHE@NEG_INT?$AA@" = comdat any

$"??_C@_08MNGDJEPN@NEG_LINT?$AA@" = comdat any

$"??_C@_09ENDJPMJI@NEG_UDINT?$AA@" = comdat any

$"??_C@_08KAJDGBAO@NEG_UINT?$AA@" = comdat any

$"??_C@_09JPPJLHAK@NEG_USINT?$AA@" = comdat any

$"??_C@_09HNEJLHFJ@NEG_ULINT?$AA@" = comdat any

$"??_C@_03KPDLEBHD@SUB?$AA@" = comdat any

$"??_C@_08KCCOGGGI@SUB_REAL?$AA@" = comdat any

$"??_C@_09HDKBOLHI@SUB_LREAL?$AA@" = comdat any

$"??_C@_08FMNPCPAE@SUB_SINT?$AA@" = comdat any

$"??_C@_08IOBPGEJG@SUB_DINT?$AA@" = comdat any

$"??_C@_07IKIFMOPD@SUB_INT?$AA@" = comdat any

$"??_C@_08LOGPCPFH@SUB_LINT?$AA@" = comdat any

$"??_C@_09HLEJLKNF@SUB_UDINT?$AA@" = comdat any

$"??_C@_08NDJPNKKE@SUB_UINT?$AA@" = comdat any

$"??_C@_09KJIJPBEH@SUB_USINT?$AA@" = comdat any

$"??_C@_09ELDJPBBE@SUB_ULINT?$AA@" = comdat any

$"??_C@_07DFBCIIPG@SUB_T_T?$AA@" = comdat any

$"??_C@_0N@OANMICMP@BYTE_TO_DINT?$AA@" = comdat any

$"??_C@_0O@PMMPLLJG@BYTE_TO_DWORD?$AA@" = comdat any

$"??_C@_0M@CCGFHAGE@BYTE_TO_INT?$AA@" = comdat any

$"??_C@_0N@NAKMMJAO@BYTE_TO_LINT?$AA@" = comdat any

$"??_C@_0N@DCBMMJFN@BYTE_TO_SINT?$AA@" = comdat any

$"??_C@_0O@GJJAJAGD@BYTE_TO_UDINT?$AA@" = comdat any

$"??_C@_0N@LNFMDMPN@BYTE_TO_UINT?$AA@" = comdat any

$"??_C@_0O@LLFANLPB@BYTE_TO_USINT?$AA@" = comdat any

$"??_C@_0N@LNAJHIAE@BYTE_TO_WORD?$AA@" = comdat any

$"??_C@_0N@MJCONKNN@BYTE_TO_BOOL?$AA@" = comdat any

$"??_C@_0N@MMONIADB@BYTE_TO_REAL?$AA@" = comdat any

$"??_C@_0O@GBHIMBMO@BYTE_TO_LREAL?$AA@" = comdat any

$"??_C@_0N@OPAKAFBP@BOOL_TO_BYTE?$AA@" = comdat any

$"??_C@_0N@HCDLKCJG@BOOL_TO_DINT?$AA@" = comdat any

$"??_C@_0O@OOOKLFOG@BOOL_TO_DWORD?$AA@" = comdat any

$"??_C@_0M@BHMLLCKI@BOOL_TO_INT?$AA@" = comdat any

$"??_C@_0N@ECELOJFH@BOOL_TO_LINT?$AA@" = comdat any

$"??_C@_0O@HDFNMPLO@BOOL_TO_LREAL?$AA@" = comdat any

$"??_C@_0N@FOAKKAGI@BOOL_TO_REAL?$AA@" = comdat any

$"??_C@_0N@KAPLOJAE@BOOL_TO_SINT?$AA@" = comdat any

$"??_C@_0O@HLLFJOBD@BOOL_TO_UDINT?$AA@" = comdat any

$"??_C@_0N@CPLLBMKE@BOOL_TO_UINT?$AA@" = comdat any

$"??_C@_0O@KJHFNFIB@BOOL_TO_USINT?$AA@" = comdat any

$"??_C@_0N@CPOOFIFN@BOOL_TO_WORD?$AA@" = comdat any

$"??_C@_0M@OIHDOFLF@INT_TO_BOOL?$AA@" = comdat any

$"??_C@_0M@FMLABKCO@INT_TO_BYTE?$AA@" = comdat any

$"??_C@_0N@LGCALGIF@INT_TO_B_BCD?$AA@" = comdat any

$"??_C@_0N@GAHJFFJI@INT_TO_D_BCD?$AA@" = comdat any

$"??_C@_0N@OFDLCFKN@INT_TO_W_BCD?$AA@" = comdat any

$"??_C@_0M@MBIBLNKH@INT_TO_DINT?$AA@" = comdat any

$"??_C@_0M@JMFEEHGM@INT_TO_WORD?$AA@" = comdat any

$"??_C@_0N@LPIHAPMD@INT_TO_DWORD?$AA@" = comdat any

$"??_C@_0M@PBPBPGGG@INT_TO_LINT?$AA@" = comdat any

$"??_C@_0N@CCDAHFJL@INT_TO_LREAL?$AA@" = comdat any

$"??_C@_0M@ONLALPFJ@INT_TO_REAL?$AA@" = comdat any

$"??_C@_0M@BDEBPGDF@INT_TO_SINT?$AA@" = comdat any

$"??_C@_0N@CKNICEDG@INT_TO_UDINT?$AA@" = comdat any

$"??_C@_0M@JMABADJF@INT_TO_UINT?$AA@" = comdat any

$"??_C@_0N@PIBIGPKE@INT_TO_USINT?$AA@" = comdat any

$"??_C@_0O@HIGKLLPG@B_BCD_TO_DINT?$AA@" = comdat any

$"??_C@_0N@EGHMPFCG@B_BCD_TO_INT?$AA@" = comdat any

$"??_C@_0O@EIBKPADH@B_BCD_TO_LINT?$AA@" = comdat any

$"??_C@_0O@KKKKPAGE@B_BCD_TO_SINT?$AA@" = comdat any

$"??_C@_0M@FMCJNFEG@BCD_TO_DINT?$AA@" = comdat any

$"??_C@_0O@IAKIPAEA@D_BCD_TO_DINT?$AA@" = comdat any

$"??_C@_0N@OGJJCKPL@D_BCD_TO_INT?$AA@" = comdat any

$"??_C@_0O@LANILLIB@D_BCD_TO_LINT?$AA@" = comdat any

$"??_C@_0O@FCGILLNC@D_BCD_TO_SINT?$AA@" = comdat any

$"??_C@_0O@JKHLOJPH@W_BCD_TO_DINT?$AA@" = comdat any

$"??_C@_0N@OPFEOAOP@W_BCD_TO_INT?$AA@" = comdat any

$"??_C@_0O@KKALKCDG@W_BCD_TO_LINT?$AA@" = comdat any

$"??_C@_0O@EILLKCGF@W_BCD_TO_SINT?$AA@" = comdat any

$"??_C@_0O@DAPKPBCK@DINT_TO_B_BCD?$AA@" = comdat any

$"??_C@_0M@HNICFAFP@DINT_TO_BCD?$AA@" = comdat any

$"??_C@_0N@OBOGJOGF@DINT_TO_BOOL?$AA@" = comdat any

$"??_C@_0N@FFCFGBPO@DINT_TO_BYTE?$AA@" = comdat any

$"??_C@_0O@OGKDBCDH@DINT_TO_D_BCD?$AA@" = comdat any

$"??_C@_0O@DJFNEIGM@DINT_TO_DWORD?$AA@" = comdat any

$"??_C@_0M@OIJJFGFM@DINT_TO_INT?$AA@" = comdat any

$"??_C@_0N@PIGEINLG@DINT_TO_LINT?$AA@" = comdat any

$"??_C@_0O@KEOKDCDE@DINT_TO_LREAL?$AA@" = comdat any

$"??_C@_0N@OECFMEIJ@DINT_TO_REAL?$AA@" = comdat any

$"??_C@_0N@BKNEINOF@DINT_TO_SINT?$AA@" = comdat any

$"??_C@_0N@PJGLMMLM@DINT_TO_TIME?$AA@" = comdat any

$"??_C@_0O@KMACGDJJ@DINT_TO_UDINT?$AA@" = comdat any

$"??_C@_0O@HOMCCIAL@DINT_TO_USINT?$AA@" = comdat any

$"??_C@_0O@GDOBGCAC@DINT_TO_W_BCD?$AA@" = comdat any

$"??_C@_0N@JFJEHIEF@DINT_TO_UINT?$AA@" = comdat any

$"??_C@_0N@JFMBDMLM@DINT_TO_WORD?$AA@" = comdat any

$"??_C@_0O@OCAMMGKA@LREAL_TO_BOOL?$AA@" = comdat any

$"??_C@_0O@FGMPDJDL@LREAL_TO_BYTE?$AA@" = comdat any

$"??_C@_0O@MLPOJOLC@LREAL_TO_DINT?$AA@" = comdat any

$"??_C@_0P@NCFAJEAL@LREAL_TO_DWORD?$AA@" = comdat any

$"??_C@_0N@LECDJPNO@LREAL_TO_INT?$AA@" = comdat any

$"??_C@_0O@PLIONFHD@LREAL_TO_LINT?$AA@" = comdat any

$"??_C@_0O@OHMPJMEM@LREAL_TO_REAL?$AA@" = comdat any

$"??_C@_0O@BJDONFCA@LREAL_TO_SINT?$AA@" = comdat any

$"??_C@_0P@EHAPLPPO@LREAL_TO_UDINT?$AA@" = comdat any

$"??_C@_0O@JGHOCAIA@LREAL_TO_UINT?$AA@" = comdat any

$"??_C@_0P@JFMPPEGM@LREAL_TO_USINT?$AA@" = comdat any

$"??_C@_0O@JGCLGEHJ@LREAL_TO_WORD?$AA@" = comdat any

$"??_C@_0N@FHIPJPDJ@REAL_TO_BOOL?$AA@" = comdat any

$"??_C@_0N@ODEMGAKC@REAL_TO_BYTE?$AA@" = comdat any

$"??_C@_0N@HOHNMHCL@REAL_TO_DINT?$AA@" = comdat any

$"??_C@_0O@FLDGDMLC@REAL_TO_DWORD?$AA@" = comdat any

$"??_C@_0M@OHLFDHGD@REAL_TO_INT?$AA@" = comdat any

$"??_C@_0N@EOANIMOK@REAL_TO_LINT?$AA@" = comdat any

$"??_C@_0O@MGIBEGOK@REAL_TO_LREAL?$AA@" = comdat any

$"??_C@_0N@KMLNIMLJ@REAL_TO_SINT?$AA@" = comdat any

$"??_C@_0O@MOGJBHEH@REAL_TO_UDINT?$AA@" = comdat any

$"??_C@_0N@CDPNHJBJ@REAL_TO_UINT?$AA@" = comdat any

$"??_C@_0O@BMKJFMNF@REAL_TO_USINT?$AA@" = comdat any

$"??_C@_0N@CDKIDNOA@REAL_TO_WORD?$AA@" = comdat any

$"??_C@_0O@CIOGBNK@DWORD_TO_BOOL?$AA@" = comdat any

$"??_C@_0O@LGENJOEB@DWORD_TO_BYTE?$AA@" = comdat any

$"??_C@_0O@CLHMDJMI@DWORD_TO_DINT?$AA@" = comdat any

$"??_C@_0N@ODGNPLNE@DWORD_TO_INT?$AA@" = comdat any

$"??_C@_0O@BLAMHCAJ@DWORD_TO_LINT?$AA@" = comdat any

$"??_C@_0P@PPNHPENG@DWORD_TO_LREAL?$AA@" = comdat any

$"??_C@_0O@HENDLDG@DWORD_TO_REAL?$AA@" = comdat any

$"??_C@_0O@PJLMHCFK@DWORD_TO_SINT?$AA@" = comdat any

$"??_C@_0P@PHDPKFHL@DWORD_TO_UDINT?$AA@" = comdat any

$"??_C@_0O@HGPMIHPK@DWORD_TO_UINT?$AA@" = comdat any

$"??_C@_0P@CFPPOOOJ@DWORD_TO_USINT?$AA@" = comdat any

$"??_C@_0O@HGKJMDAD@DWORD_TO_WORD?$AA@" = comdat any

$"??_C@_0O@DKDOPBM@LINT_TO_B_BCD?$AA@" = comdat any

$"??_C@_0N@LLOFENAI@LINT_TO_BOOL?$AA@" = comdat any

$"??_C@_0N@PCGLCJD@LINT_TO_BYTE?$AA@" = comdat any

$"??_C@_0O@NFPKAMAB@LINT_TO_D_BCD?$AA@" = comdat any

$"??_C@_0N@JCBHBFBK@LINT_TO_DINT?$AA@" = comdat any

$"??_C@_0O@KAEFGFK@LINT_TO_DWORD?$AA@" = comdat any

$"??_C@_0M@OOJFCAKC@LINT_TO_INT?$AA@" = comdat any

$"??_C@_0O@JHLDCMAC@LINT_TO_LREAL?$AA@" = comdat any

$"??_C@_0N@LOCGBHOE@LINT_TO_REAL?$AA@" = comdat any

$"??_C@_0N@EANHFOII@LINT_TO_SINT?$AA@" = comdat any

$"??_C@_0O@JPFLHNKP@LINT_TO_UDINT?$AA@" = comdat any

$"??_C@_0N@MPJHKLCI@LINT_TO_UINT?$AA@" = comdat any

$"??_C@_0O@ENJLDGDN@LINT_TO_USINT?$AA@" = comdat any

$"??_C@_0O@FALIHMDE@LINT_TO_W_BCD?$AA@" = comdat any

$"??_C@_0N@MPMCOPNB@LINT_TO_WORD?$AA@" = comdat any

$"??_C@_0O@DDIFGHIG@SINT_TO_B_BCD?$AA@" = comdat any

$"??_C@_0N@CIJCDOOH@SINT_TO_BOOL?$AA@" = comdat any

$"??_C@_0N@JMFBMBHM@SINT_TO_BYTE?$AA@" = comdat any

$"??_C@_0O@OFNMIEJL@SINT_TO_D_BCD?$AA@" = comdat any

$"??_C@_0N@BGAGGPF@SINT_TO_DINT?$AA@" = comdat any

$"??_C@_0O@DKCCNOMA@SINT_TO_DWORD?$AA@" = comdat any

$"??_C@_0M@JABJFCCP@SINT_TO_INT?$AA@" = comdat any

$"??_C@_0N@DBBACNDE@SINT_TO_LINT?$AA@" = comdat any

$"??_C@_0O@KHJFKEJI@SINT_TO_LREAL?$AA@" = comdat any

$"??_C@_0N@CNFBGEAL@SINT_TO_REAL?$AA@" = comdat any

$"??_C@_0O@KPHNPFDF@SINT_TO_UDINT?$AA@" = comdat any

$"??_C@_0N@FMOANIMH@SINT_TO_UINT?$AA@" = comdat any

$"??_C@_0O@HNLNLOKH@SINT_TO_USINT?$AA@" = comdat any

$"??_C@_0O@GAJOPEKO@SINT_TO_W_BCD?$AA@" = comdat any

$"??_C@_0N@FMLFJMDO@SINT_TO_WORD?$AA@" = comdat any

$"??_C@_0O@JMIBAENA@UDINT_TO_BOOL?$AA@" = comdat any

$"??_C@_0O@CIECPLEL@UDINT_TO_BYTE?$AA@" = comdat any

$"??_C@_0O@LFHDFMMC@UDINT_TO_DINT?$AA@" = comdat any

$"??_C@_0N@IIJNFCND@UDINT_TO_INT?$AA@" = comdat any

$"??_C@_0O@IFADBHAD@UDINT_TO_LINT?$AA@" = comdat any

$"??_C@_0P@BPJMBCKN@UDINT_TO_LREAL?$AA@" = comdat any

$"??_C@_0O@JJECFODM@UDINT_TO_REAL?$AA@" = comdat any

$"??_C@_0O@GHLDBHFA@UDINT_TO_SINT?$AA@" = comdat any

$"??_C@_0O@OIPDOCPA@UDINT_TO_UINT?$AA@" = comdat any

$"??_C@_0P@MFLEAIJC@UDINT_TO_USINT?$AA@" = comdat any

$"??_C@_0O@OIKGKGAJ@UDINT_TO_WORD?$AA@" = comdat any

$"??_C@_0P@ICCLGIPF@UDINT_TO_DWORD?$AA@" = comdat any

$"??_C@_0N@IIHHOBDK@UINT_TO_BOOL?$AA@" = comdat any

$"??_C@_0N@DMLEBOKB@UINT_TO_BYTE?$AA@" = comdat any

$"??_C@_0N@KBIFLJCI@UINT_TO_DINT?$AA@" = comdat any

$"??_C@_0M@HPCEPHMP@UINT_TO_INT?$AA@" = comdat any

$"??_C@_0N@JBPFPCOJ@UINT_TO_LINT?$AA@" = comdat any

$"??_C@_0O@FPFHOPCO@UINT_TO_LREAL?$AA@" = comdat any

$"??_C@_0N@INLELLNG@UINT_TO_REAL?$AA@" = comdat any

$"??_C@_0N@HDEFPCLK@UINT_TO_SINT?$AA@" = comdat any

$"??_C@_0O@FHLPLOID@UINT_TO_UDINT?$AA@" = comdat any

$"??_C@_0O@IFHPPFBB@UINT_TO_USINT?$AA@" = comdat any

$"??_C@_0N@PMFAEDOD@UINT_TO_WORD?$AA@" = comdat any

$"??_C@_0O@MCOAJFHG@UINT_TO_DWORD?$AA@" = comdat any

$"??_C@_0O@FFPFKEFC@USINT_TO_BOOL?$AA@" = comdat any

$"??_C@_0O@OBDGFLMJ@USINT_TO_BYTE?$AA@" = comdat any

$"??_C@_0O@HMAHPMEA@USINT_TO_DINT?$AA@" = comdat any

$"??_C@_0P@IBFEPOFJ@USINT_TO_DWORD?$AA@" = comdat any

$"??_C@_0N@PABNFGKA@USINT_TO_INT?$AA@" = comdat any

$"??_C@_0O@EMHHLHIB@USINT_TO_LINT?$AA@" = comdat any

$"??_C@_0P@BMODIEAB@USINT_TO_LREAL?$AA@" = comdat any

$"??_C@_0O@FADGPOLO@USINT_TO_REAL?$AA@" = comdat any

$"??_C@_0O@KOMHLHNC@USINT_TO_SINT?$AA@" = comdat any

$"??_C@_0P@BEALNFKM@USINT_TO_UDINT?$AA@" = comdat any

$"??_C@_0O@CBIHECHC@USINT_TO_UINT?$AA@" = comdat any

$"??_C@_0O@CBNCAGIL@USINT_TO_WORD?$AA@" = comdat any

$"??_C@_0N@IEFECGHF@WORD_TO_BOOL?$AA@" = comdat any

$"??_C@_0N@DAJHNJOO@WORD_TO_BYTE?$AA@" = comdat any

$"??_C@_0N@KNKGHOGH@WORD_TO_DINT?$AA@" = comdat any

$"??_C@_0O@CEIPOKLA@WORD_TO_DWORD?$AA@" = comdat any

$"??_C@_0M@OKPIIAAE@WORD_TO_INT?$AA@" = comdat any

$"??_C@_0N@JNNGDFKG@WORD_TO_LINT?$AA@" = comdat any

$"??_C@_0O@LJDIJAOI@WORD_TO_LREAL?$AA@" = comdat any

$"??_C@_0N@IBJHHMJJ@WORD_TO_REAL?$AA@" = comdat any

$"??_C@_0N@HPGGDFPF@WORD_TO_SINT?$AA@" = comdat any

$"??_C@_0O@LBNAMBEF@WORD_TO_UDINT?$AA@" = comdat any

$"??_C@_0N@PACGMAFF@WORD_TO_UINT?$AA@" = comdat any

$"??_C@_0O@GDBAIKNH@WORD_TO_USINT?$AA@" = comdat any

$"??_C@_0L@FAGLCNNG@TRUNC_SINT?$AA@" = comdat any

$"??_C@_09IIJMCEDI@TRUNC_INT?$AA@" = comdat any

$"??_C@_0L@ICKLGGEE@TRUNC_DINT?$AA@" = comdat any

$"??_C@_0L@LCNLCNIF@TRUNC_LINT?$AA@" = comdat any

$"??_C@_0N@CNJNOMHK@TIME_TO_DINT?$AA@" = comdat any

$"??_C@_03BDACDFHA@AND?$AA@" = comdat any

$"??_C@_08GHNKEODE@AND_BOOL?$AA@" = comdat any

$"??_C@_08NDBJLBKP@AND_BYTE?$AA@" = comdat any

$"??_C@_08BDPNOMON@AND_WORD?$AA@" = comdat any

$"??_C@_09CFLHBFNO@AND_DWORD?$AA@" = comdat any

$"??_C@_04DOOMBBIC@ANDN?$AA@" = comdat any

$"??_C@_09PJCINCCF@ANDN_BOOL?$AA@" = comdat any

$"??_C@_09ENOLCNLO@ANDN_BYTE?$AA@" = comdat any

$"??_C@_09INAPHAPM@ANDN_WORD?$AA@" = comdat any

$"??_C@_0L@EPJJMHLA@ANDN_DWORD?$AA@" = comdat any

$"??_C@_03GBFNEA@NOT?$AA@" = comdat any

$"??_C@_08BDBHBNLF@NOT_BOOL?$AA@" = comdat any

$"??_C@_08KHNEOCCO@NOT_BYTE?$AA@" = comdat any

$"??_C@_08GHDALPGM@NOT_WORD?$AA@" = comdat any

$"??_C@_09LPHMGLDL@NOT_DWORD?$AA@" = comdat any

$"??_C@_02PDPFNDMG@OR?$AA@" = comdat any

$"??_C@_07OFLMDLNN@OR_BOOL?$AA@" = comdat any

$"??_C@_07FBHPMEEG@OR_BYTE?$AA@" = comdat any

$"??_C@_07JBJLJJAE@OR_WORD?$AA@" = comdat any

$"??_C@_08PMODCJHH@OR_DWORD?$AA@" = comdat any

$"??_C@_03BMAOPANN@ORN?$AA@" = comdat any

$"??_C@_08CAHMOOIM@ORN_BOOL?$AA@" = comdat any

$"??_C@_08JELPBBBH@ORN_BYTE?$AA@" = comdat any

$"??_C@_08FEFLEMFF@ORN_WORD?$AA@" = comdat any

$"??_C@_09OAEKIIMA@ORN_DWORD?$AA@" = comdat any

$"??_C@_03CDEJPCIF@XOR?$AA@" = comdat any

$"??_C@_08KPBNBDHE@XOR_BOOL?$AA@" = comdat any

$"??_C@_08BLNOOMOP@XOR_BYTE?$AA@" = comdat any

$"??_C@_08NLDKLBKN@XOR_WORD?$AA@" = comdat any

$"??_C@_09FDKDJDBD@XOR_DWORD?$AA@" = comdat any

$"??_C@_04PDALFMNG@XORN?$AA@" = comdat any

$"??_C@_09IPDMFEOI@XORN_BOOL?$AA@" = comdat any

$"??_C@_09DLPPKLHD@XORN_BYTE?$AA@" = comdat any

$"??_C@_09PLBLPGDB@XORN_WORD?$AA@" = comdat any

$"??_C@_0L@KKDKGNDL@XORN_DWORD?$AA@" = comdat any

$"??_C@_03JILFCNDO@ROL?$AA@" = comdat any

$"??_C@_08LJBBIBOC@ROL_BYTE?$AA@" = comdat any

$"??_C@_08HJPFNMKA@ROL_WORD?$AA@" = comdat any

$"??_C@_09CNLACAMD@ROL_DWORD?$AA@" = comdat any

$"??_C@_03EMPEBCOB@ROR?$AA@" = comdat any

$"??_C@_08IOPAGGHB@ROR_BYTE?$AA@" = comdat any

$"??_C@_08EOBEDLDD@ROR_WORD?$AA@" = comdat any

$"??_C@_09EEIBADNK@ROR_DWORD?$AA@" = comdat any

$"??_C@_03CFEGFMNO@SHL?$AA@" = comdat any

$"??_C@_08KEKPJMLI@SHL_BYTE?$AA@" = comdat any

$"??_C@_08GEELMBPK@SHL_WORD?$AA@" = comdat any

$"??_C@_09KGBDCGDE@SHL_DWORD?$AA@" = comdat any

$"??_C@_03PBAHGDAB@SHR?$AA@" = comdat any

$"??_C@_08JDEOHLCL@SHR_BYTE?$AA@" = comdat any

$"??_C@_08FDKKCGGJ@SHR_WORD?$AA@" = comdat any

$"??_C@_09MPCCAFCN@SHR_DWORD?$AA@" = comdat any

$"??_C@_06FLHFNFBE@SIZEOF?$AA@" = comdat any

$"??_C@_0M@HDFBCJPA@LOWER_BOUND?$AA@" = comdat any

$"??_C@_03BPJLEIIC@ABS?$AA@" = comdat any

$"??_C@_08GJDOOKLL@ABS_SINT?$AA@" = comdat any

$"??_C@_07NOOIILNL@ABS_INT?$AA@" = comdat any

$"??_C@_08LLPOKBCJ@ABS_DINT?$AA@" = comdat any

$"??_C@_08ILIOOKOI@ABS_LINT?$AA@" = comdat any

$"??_C@_09PCGCLOJP@ABS_USINT?$AA@" = comdat any

$"??_C@_08OGHOBPBL@ABS_UINT?$AA@" = comdat any

$"??_C@_09CAKCPFAN@ABS_UDINT?$AA@" = comdat any

$"??_C@_09BANCLOMM@ABS_ULINT?$AA@" = comdat any

$"??_C@_08JHMPKDNH@ABS_REAL?$AA@" = comdat any

$"??_C@_09CIEKKEKA@ABS_LREAL?$AA@" = comdat any

$"??_C@_08IKIBKLOC@ABS_TIME?$AA@" = comdat any

$"??_C@_04DPLPEKKC@ACOS?$AA@" = comdat any

$"??_C@_09FGMHIOMG@ACOS_REAL?$AA@" = comdat any

$"??_C@_0L@ECDLIMHP@ACOS_LREAL?$AA@" = comdat any

$"??_C@_04JEEHANJD@ASIN?$AA@" = comdat any

$"??_C@_09DKGBDIDO@ASIN_REAL?$AA@" = comdat any

$"??_C@_0L@PBDBFAOH@ASIN_LREAL?$AA@" = comdat any

$"??_C@_04HIDGEJC@ATAN?$AA@" = comdat any

$"??_C@_09INOFEOEC@ATAN_REAL?$AA@" = comdat any

$"??_C@_0L@KIDFOJIG@ATAN_LREAL?$AA@" = comdat any

$"??_C@_03LNEKBDFK@COS?$AA@" = comdat any

$"??_C@_08CCDMJOIA@COS_REAL?$AA@" = comdat any

$"??_C@_09NNPAJDMK@COS_LREAL?$AA@" = comdat any

$"??_C@_03BGLCFEGL@SIN?$AA@" = comdat any

$"??_C@_08EOJKCIHI@SIN_REAL?$AA@" = comdat any

$"??_C@_09GOPKEPFC@SIN_LREAL?$AA@" = comdat any

$"??_C@_03IFHGDNGK@TAN?$AA@" = comdat any

$"??_C@_08PJBOFOAE@TAN_REAL?$AA@" = comdat any

$"??_C@_09DHPOPGDD@TAN_LREAL?$AA@" = comdat any

$"??_C@_03KKGFKKLA@EXP?$AA@" = comdat any

$"??_C@_08BGLAMFKF@EXP_REAL?$AA@" = comdat any

$"??_C@_09JGMAMLNG@EXP_LREAL?$AA@" = comdat any

$"??_C@_02BHMEDAMC@LN?$AA@" = comdat any

$"??_C@_07MOIOJAGI@LN_REAL?$AA@" = comdat any

$"??_C@_08HDMNELIO@LN_LREAL?$AA@" = comdat any

$"??_C@_03MLIHNEFJ@LOG?$AA@" = comdat any

$"??_C@_08GOBEOJIM@LOG_REAL?$AA@" = comdat any

$"??_C@_09NEAKPHJG@LOG_LREAL?$AA@" = comdat any

$"??_C@_04IEDALHLA@SQRT?$AA@" = comdat any

$"??_C@_09NFLDKPJA@SQRT_REAL?$AA@" = comdat any

$"??_C@_0L@MALAAMJP@SQRT_LREAL?$AA@" = comdat any

$"??_C@_0P@JALKPGJN@BYTE_TO_STRING?$AA@" = comdat any

$"??_C@_0P@ECGPDDDB@WORD_TO_STRING?$AA@" = comdat any

$"??_C@_0BA@IDEIMBPO@DWORD_TO_STRING?$AA@" = comdat any

$"??_C@_0P@BCHEOPDJ@SINT_TO_STRING?$AA@" = comdat any

$"??_C@_0O@ILPIBLFC@INT_TO_STRING?$AA@" = comdat any

$"??_C@_0P@MNBHHPGM@DINT_TO_STRING?$AA@" = comdat any

$"??_C@_0P@CJOLDOL@LINT_TO_STRING?$AA@" = comdat any

$"??_C@_0BA@JLBMLCPJ@USINT_TO_STRING?$AA@" = comdat any

$"??_C@_0P@DAIODLML@UINT_TO_STRING?$AA@" = comdat any

$"??_C@_0BA@EEHPCCKM@UDINT_TO_STRING?$AA@" = comdat any

$"??_C@_0P@KDACCNHO@TIME_TO_STRING?$AA@" = comdat any

$"??_C@_0P@KMBOOLML@REAL_TO_STRING?$AA@" = comdat any

$"??_C@_0BA@BOCKIGEL@LREAL_TO_STRING?$AA@" = comdat any

$"??_C@_0P@PELKKNLK@STRING_TO_BYTE?$AA@" = comdat any

$"??_C@_0P@DEFOPAPI@STRING_TO_WORD?$AA@" = comdat any

$"??_C@_0BA@EIENFCCJ@STRING_TO_DWORD?$AA@" = comdat any

$"??_C@_0P@LLELEBKB@STRING_TO_SINT?$AA@" = comdat any

$"??_C@_0O@KGMGGMPN@STRING_TO_INT?$AA@" = comdat any

$"??_C@_0P@GJILAKDD@STRING_TO_DINT?$AA@" = comdat any

$"??_C@_0P@FJPLEBPC@STRING_TO_LINT?$AA@" = comdat any

$"??_C@_0BA@PNCDCEO@STRING_TO_USINT?$AA@" = comdat any

$"??_C@_0P@DEALLEAB@STRING_TO_UINT?$AA@" = comdat any

$"??_C@_0BA@NNBCHJNM@STRING_TO_UDINT?$AA@" = comdat any

$"??_C@_0P@FIPEAAPI@STRING_TO_TIME?$AA@" = comdat any

$"??_C@_0P@EFLKAIMN@STRING_TO_REAL?$AA@" = comdat any

$"??_C@_0BA@NFPKCIHB@STRING_TO_LREAL?$AA@" = comdat any

$"??_C@_06CIJDJJIA@CONCAT?$AA@" = comdat any

$"??_C@_06FKDAMKFP@DELETE?$AA@" = comdat any

$"??_C@_04OGGDJIHH@FIND?$AA@" = comdat any

$"??_C@_06OEMEAEKN@INSERT?$AA@" = comdat any

$"??_C@_07NGBKIEMN@REPLACE?$AA@" = comdat any

$"??_C@_03BHNCOKMG@LEN?$AA@" = comdat any

$"??_C@_04KCNEHMIH@LEFT?$AA@" = comdat any

$"??_C@_03FMJLJMEN@MID?$AA@" = comdat any

$"??_C@_05PMAFOJDE@RIGHT?$AA@" = comdat any

$"??_C@_09GJBIKEON@EQ_STRING?$AA@" = comdat any

$"??_C@_09GANEEMGH@NE_STRING?$AA@" = comdat any

$"??_C@_09JMMBGHKN@GE_STRING?$AA@" = comdat any

$"??_C@_09CHHKDBJP@GT_STRING?$AA@" = comdat any

$"??_C@_09GECBJMFK@LE_STRING?$AA@" = comdat any

$"??_C@_09NPJKMKGI@LT_STRING?$AA@" = comdat any

$"??_C@_05KLKGAAIM@LIMIT?$AA@" = comdat any

$"??_C@_0L@CELEDJHH@LIMIT_SINT?$AA@" = comdat any

$"??_C@_09OGFKBPLL@LIMIT_INT?$AA@" = comdat any

$"??_C@_0L@PGHEHCOF@LIMIT_DINT?$AA@" = comdat any

$"??_C@_0L@MGAEDJCE@LIMIT_LINT?$AA@" = comdat any

$"??_C@_0L@NKEFHABL@LIMIT_REAL?$AA@" = comdat any

$"??_C@_0M@LKNFKAOI@LIMIT_LREAL?$AA@" = comdat any

$"??_C@_0N@ECGMNOAB@LIMIT_STRING?$AA@" = comdat any

$"??_C@_03LEPPJAKI@MAX?$AA@" = comdat any

$"??_C@_08DICEKLG@MAX_SINT?$AA@" = comdat any

$"??_C@_07NCGIHEMK@MAX_INT?$AA@" = comdat any

$"??_C@_08NBECABCE@MAX_DINT?$AA@" = comdat any

$"??_C@_08OBDCEKOF@MAX_LINT?$AA@" = comdat any

$"??_C@_09IMLJHOIC@MAX_USINT?$AA@" = comdat any

$"??_C@_08IMMCLPBG@MAX_UINT?$AA@" = comdat any

$"??_C@_09FOHJDFBA@MAX_UDINT?$AA@" = comdat any

$"??_C@_09GOAJHONB@MAX_ULINT?$AA@" = comdat any

$"??_C@_08PNHDADNK@MAX_REAL?$AA@" = comdat any

$"??_C@_09FGJBGELN@MAX_LREAL?$AA@" = comdat any

$"??_C@_0L@FJIBDPLO@MAX_STRING?$AA@" = comdat any

$"??_C@_03KGHEHEMH@MIN?$AA@" = comdat any

$"??_C@_08NEGJPIPH@MIN_SINT?$AA@" = comdat any

$"??_C@_07DEAINLCL@MIN_INT?$AA@" = comdat any

$"??_C@_08GKJLDGF@MIN_DINT?$AA@" = comdat any

$"??_C@_08DGNJPIKE@MIN_LINT?$AA@" = comdat any

$"??_C@_09INLFOEDG@MIN_USINT?$AA@" = comdat any

$"??_C@_08FLCJANFH@MIN_UINT?$AA@" = comdat any

$"??_C@_09FPHFKPKE@MIN_UDINT?$AA@" = comdat any

$"??_C@_09GPAFOEGF@MIN_ULINT?$AA@" = comdat any

$"??_C@_08CKJILBJL@MIN_REAL?$AA@" = comdat any

$"??_C@_09FHJNPOAJ@MIN_LREAL?$AA@" = comdat any

$"??_C@_0L@JFIMEELB@MIN_STRING?$AA@" = comdat any

$"??_C@_03CNJOMPIN@SEL?$AA@" = comdat any

$"??_C@_08HAFLGFHC@SEL_SINT?$AA@" = comdat any

$"??_C@_07NHFBDDEN@SEL_INT?$AA@" = comdat any

$"??_C@_08KCJLCOOA@SEL_DINT?$AA@" = comdat any

$"??_C@_08JCOLGFCB@SEL_LINT?$AA@" = comdat any

$"??_C@_08IOKKCMBO@SEL_REAL?$AA@" = comdat any

$"??_C@_09MKOLLLDL@SEL_LREAL?$AA@" = comdat any

$"??_C@_0L@FNMGGDHE@SEL_STRING?$AA@" = comdat any

$"??_C@_08JDOECECL@SEL_TIME?$AA@" = comdat any

$"??_C@_08ILGJHGPC@SEL_BOOL?$AA@" = comdat any

$"??_C@_08DPKKIJGJ@SEL_BYTE?$AA@" = comdat any

$"??_C@_08PPEONECL@SEL_WORD?$AA@" = comdat any

$"??_C@_09FHFMMBGD@SEL_DWORD?$AA@" = comdat any

$"??_C@_08CEHGKHCN@BIT_TEST?$AA@" = comdat any

$"??_C@_08FABMLEPK@GET_CHAR?$AA@" = comdat any

$"??_C@_07PPJNPJKM@GET_LSB?$AA@" = comdat any

$"??_C@_07EHCBJOMJ@GET_MSB?$AA@" = comdat any

$"??_C@_08FDEOCCKI@I_BIT_IN?$AA@" = comdat any

$"??_C@_0O@COKLNBLA@I_BIT_IN_BYTE?$AA@" = comdat any

$"??_C@_0O@OOEPIMPC@I_BIT_IN_WORD?$AA@" = comdat any

$"??_C@_0P@KIECKKEL@I_BIT_IN_DWORD?$AA@" = comdat any

$"??_C@_06CBEBPLJC@PARITY?$AA@" = comdat any

$"??_C@_0M@IIDDNLMN@PARITY_BYTE?$AA@" = comdat any

$"??_C@_0M@EINHIGIP@PARITY_WORD?$AA@" = comdat any

$"??_C@_0N@IGFADPMA@PARITY_DWORD?$AA@" = comdat any

$"??_C@_08HNNLPOAE@R_BIT_IN?$AA@" = comdat any

$"??_C@_0O@HCBNGDB@R_BIT_IN_BYTE?$AA@" = comdat any

$"??_C@_0O@MHMFILHD@R_BIT_IN_WORD?$AA@" = comdat any

$"??_C@_0P@DCNEJDPK@R_BIT_IN_DWORD?$AA@" = comdat any

$"??_C@_08GKKAOKEH@S_BIT_IN?$AA@" = comdat any

$"??_C@_0O@JKCODHEH@S_BIT_IN_BYTE?$AA@" = comdat any

$"??_C@_0O@FKMKGKAF@S_BIT_IN_WORD?$AA@" = comdat any

$"??_C@_0P@ILCPEIBC@S_BIT_IN_DWORD?$AA@" = comdat any

$"??_C@_07HGMMGHN@SET_LSB?$AA@" = comdat any

$"??_C@_07LPNAKBBI@SET_MSB?$AA@" = comdat any

$"??_C@_0BB@DHMGLGFH@STRING_TO_BUFFER?$AA@" = comdat any

$"??_C@_04NLFHDAEB@SWAP?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@"??_C@_02NFEPAFND@EQ?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"EQ\00", comdat, align 1
@"??_C@_07EAFHGHGE@EQ_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"EQ_REAL\00", comdat, align 1
@"??_C@_08HKPFNOFC@EQ_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"EQ_LREAL\00", comdat, align 1
@"??_C@_07LOKGCOAI@EQ_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"EQ_SINT\00", comdat, align 1
@"??_C@_07GMGGGFJK@EQ_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"EQ_DINT\00", comdat, align 1
@"??_C@_06ELPONGDK@EQ_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"EQ_INT\00", comdat, align 1
@"??_C@_07FMBGCOFL@EQ_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"EQ_LINT\00", comdat, align 1
@"??_C@_08HCBNIPPP@EQ_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"EQ_UDINT\00", comdat, align 1
@"??_C@_07DBOGNLKI@EQ_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"EQ_UINT\00", comdat, align 1
@"??_C@_08KANNMEGN@EQ_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"EQ_USINT\00", comdat, align 1
@"??_C@_08ECGNMEDO@EQ_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"EQ_ULINT\00", comdat, align 1
@"??_C@_07FNBJGPFB@EQ_TIME?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"EQ_TIME\00", comdat, align 1
@"??_C@_08OHECKEAK@EQ_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"EQ_DWORD\00", comdat, align 1
@"??_C@_07DBLDJPFB@EQ_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"EQ_WORD\00", comdat, align 1
@"??_C@_07PBFHMCBD@EQ_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"EQ_BYTE\00", comdat, align 1
@"??_C@_07EFJEDNII@EQ_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"EQ_BOOL\00", comdat, align 1
@"??_C@_02PIGFAGOI@GE?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"GE\00", comdat, align 1
@"??_C@_07JBODNIME@GE_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"GE_REAL\00", comdat, align 1
@"??_C@_08KMPCMJAF@GE_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"GE_LREAL\00", comdat, align 1
@"??_C@_07GPBCJBKI@GE_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"GE_SINT\00", comdat, align 1
@"??_C@_07LNNCNKDK@GE_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"GE_DINT\00", comdat, align 1
@"??_C@_06EECGIHJO@GE_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"GE_INT\00", comdat, align 1
@"??_C@_07INKCJBPL@GE_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"GE_LINT\00", comdat, align 1
@"??_C@_08KEBKJIKI@GE_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"GE_UDINT\00", comdat, align 1
@"??_C@_07OAFCGEAI@GE_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"GE_UINT\00", comdat, align 1
@"??_C@_08HGNKNDDK@GE_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"GE_USINT\00", comdat, align 1
@"??_C@_08JEGKNDGJ@GE_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"GE_ULINT\00", comdat, align 1
@"??_C@_07IMKNNAPB@GE_TIME?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"GE_TIME\00", comdat, align 1
@"??_C@_08DBEFLDFN@GE_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"GE_DWORD\00", comdat, align 1
@"??_C@_07OAAHCAPB@GE_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"GE_WORD\00", comdat, align 1
@"??_C@_07CAODHNLD@GE_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"GE_BYTE\00", comdat, align 1
@"??_C@_07JECAICCI@GE_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"GE_BOOL\00", comdat, align 1
@"??_C@_02KLLMCFPI@GT?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"GT\00", comdat, align 1
@"??_C@_07FAEKEPLO@GT_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"GT_REAL\00", comdat, align 1
@"??_C@_08BMODPILA@GT_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"GT_LREAL\00", comdat, align 1
@"??_C@_07KOLLAGNC@GT_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"GT_SINT\00", comdat, align 1
@"??_C@_07HMHLENEA@GT_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"GT_DINT\00", comdat, align 1
@"??_C@_06IMKMFGKA@GT_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"GT_INT\00", comdat, align 1
@"??_C@_07EMALAGIB@GT_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"GT_LINT\00", comdat, align 1
@"??_C@_08BEALKJBN@GT_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"GT_UDINT\00", comdat, align 1
@"??_C@_07CBPLPDHC@GT_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"GT_UINT\00", comdat, align 1
@"??_C@_08MGMLOCIP@GT_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"GT_USINT\00", comdat, align 1
@"??_C@_08CEHLOCNM@GT_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"GT_ULINT\00", comdat, align 1
@"??_C@_07ENAEEHIL@GT_TIME?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"GT_TIME\00", comdat, align 1
@"??_C@_08IBFEICOI@GT_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"GT_DWORD\00", comdat, align 1
@"??_C@_07CBKOLHIL@GT_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"GT_WORD\00", comdat, align 1
@"??_C@_07OBEKOKMJ@GT_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"GT_BYTE\00", comdat, align 1
@"??_C@_07FFIJBFFC@GT_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"GT_BOOL\00", comdat, align 1
@"??_C@_02PEDAOJAJ@LE?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"LE\00", comdat, align 1
@"??_C@_07MMIJMEJC@LE_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"LE_REAL\00", comdat, align 1
@"??_C@_08COKHFHNI@LE_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"LE_LREAL\00", comdat, align 1
@"??_C@_07DCHIINPO@LE_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"LE_SINT\00", comdat, align 1
@"??_C@_07OALIMGGM@LE_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"LE_DINT\00", comdat, align 1
@"??_C@_06EGCBNDGE@LE_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"LE_INT\00", comdat, align 1
@"??_C@_07NAMIINKN@LE_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"LE_LINT\00", comdat, align 1
@"??_C@_08CGEPAGHF@LE_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"LE_UDINT\00", comdat, align 1
@"??_C@_07LNDIHIFO@LE_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"LE_UINT\00", comdat, align 1
@"??_C@_08PEIPENOH@LE_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"LE_USINT\00", comdat, align 1
@"??_C@_08BGDPENLE@LE_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"LE_ULINT\00", comdat, align 1
@"??_C@_07NBMHMMKH@LE_TIME?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"LE_TIME\00", comdat, align 1
@"??_C@_08LDBACNIA@LE_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"LE_DWORD\00", comdat, align 1
@"??_C@_07LNGNDMKH@LE_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"LE_WORD\00", comdat, align 1
@"??_C@_07HNIJGBOF@LE_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"LE_BYTE\00", comdat, align 1
@"??_C@_07MJEKJOHO@LE_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"LE_BOOL\00", comdat, align 1
@"??_C@_02KHOJMKBJ@LT?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"LT\00", comdat, align 1
@"??_C@_07NCAFDOI@LT_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"LT_REAL\00", comdat, align 1
@"??_C@_08JOLGGGGN@LT_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"LT_LREAL\00", comdat, align 1
@"??_C@_07PDNBBKIE@LT_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"LT_SINT\00", comdat, align 1
@"??_C@_07CBBBFBBG@LT_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"LT_DINT\00", comdat, align 1
@"??_C@_06IOKLACFK@LT_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"LT_INT\00", comdat, align 1
@"??_C@_07BBGBBKNH@LT_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"LT_LINT\00", comdat, align 1
@"??_C@_08JGFODHMA@LT_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"LT_UDINT\00", comdat, align 1
@"??_C@_07HMJBOPCE@LT_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"LT_UINT\00", comdat, align 1
@"??_C@_08EEJOHMFC@LT_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"LT_USINT\00", comdat, align 1
@"??_C@_08KGCOHMAB@LT_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"LT_ULINT\00", comdat, align 1
@"??_C@_07BAGOFLNN@LT_TIME?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"LT_TIME\00", comdat, align 1
@"??_C@_08DABBMDF@LT_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"LT_DWORD\00", comdat, align 1
@"??_C@_07HMMEKLNN@LT_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"LT_WORD\00", comdat, align 1
@"??_C@_07LMCAPGJP@LT_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"LT_BYTE\00", comdat, align 1
@"??_C@_07IODAJAE@LT_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"LT_BOOL\00", comdat, align 1
@"??_C@_02PHLEDNGH@NE?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"NE\00", comdat, align 1
@"??_C@_07IOKMMDOP@NE_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"NE_REAL\00", comdat, align 1
@"??_C@_08FBHPFO@NE_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"NE_LREAL\00", comdat, align 1
@"??_C@_07HAFNIKID@NE_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"NE_SINT\00", comdat, align 1
@"??_C@_07KCJNMBBB@NE_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"NE_DINT\00", comdat, align 1
@"??_C@_06NBLOMCEN@NE_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"NE_INT\00", comdat, align 1
@"??_C@_07JCONIKNA@NE_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"NE_LINT\00", comdat, align 1
@"??_C@_08ILJCOPD@NE_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"NE_UDINT\00", comdat, align 1
@"??_C@_07PPBNHPCD@NE_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"NE_UINT\00", comdat, align 1
@"??_C@_08NKHJGFGB@NE_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"NE_USINT\00", comdat, align 1
@"??_C@_08DIMJGFDC@NE_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"NE_ULINT\00", comdat, align 1
@"??_C@_07JDOCMLNK@NE_TIME?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"NE_TIME\00", comdat, align 1
@"??_C@_08JNOGAFAG@NE_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"NE_DWORD\00", comdat, align 1
@"??_C@_07PPEIDLNK@NE_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"NE_WORD\00", comdat, align 1
@"??_C@_07DPKMGGJI@NE_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"NE_BYTE\00", comdat, align 1
@"??_C@_07ILGPJJAD@NE_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"NE_BOOL\00", comdat, align 1
@"??_C@_03BOJFLAKG@ADD?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"ADD\00", comdat, align 1
@"??_C@_08PDNJAIBA@ADD_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"ADD_REAL\00", comdat, align 1
@"??_C@_09CNCOOFBI@ADD_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"ADD_LREAL\00", comdat, align 1
@"??_C@_08NCIEBHM@ADD_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"ADD_SINT\00", comdat, align 1
@"??_C@_08NPOIAKOO@ADD_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"ADD_DINT\00", comdat, align 1
@"??_C@_07KDOLIMMC@ADD_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"ADD_INT\00", comdat, align 1
@"??_C@_08OPJIEBCP@ADD_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"ADD_LINT\00", comdat, align 1
@"??_C@_09CFMGLELF@ADD_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"ADD_UDINT\00", comdat, align 1
@"??_C@_08ICGILENM@ADD_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"ADD_UINT\00", comdat, align 1
@"??_C@_09PHAGPPCH@ADD_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"ADD_USINT\00", comdat, align 1
@"??_C@_09BFLGPPHE@ADD_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"ADD_ULINT\00", comdat, align 1
@"??_C@_07BMHMMKMH@ADD_T_T?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"ADD_T_T\00", comdat, align 1
@"??_C@_03FJGHKDBE@DIV?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"DIV\00", comdat, align 1
@"??_C@_08NCAKNFGJ@DIV_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"DIV_REAL\00", comdat, align 1
@"??_C@_09ENGPPFN@DIV_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"DIV_LREAL\00", comdat, align 1
@"??_C@_08CMPLJMAF@DIV_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"DIV_SINT\00", comdat, align 1
@"??_C@_08PODLNHJH@DIV_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"DIV_DINT\00", comdat, align 1
@"??_C@_07MEMCEAPG@DIV_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"DIV_INT\00", comdat, align 1
@"??_C@_08MOELJMFG@DIV_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"DIV_LINT\00", comdat, align 1
@"??_C@_09MDOKOPA@DIV_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"DIV_UDINT\00", comdat, align 1
@"??_C@_08KDLLGJKF@DIV_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"DIV_UINT\00", comdat, align 1
@"??_C@_09NOPOOFGC@DIV_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"DIV_USINT\00", comdat, align 1
@"??_C@_09DMEOOFDB@DIV_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"DIV_ULINT\00", comdat, align 1
@"??_C@_08FANIPFLA@DIV_T_AN?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"DIV_T_AN\00", comdat, align 1
@"??_C@_0O@FIPKPHEJ@DIV_T_AN_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DIV_T_AN_SINT\00", comdat, align 1
@"??_C@_0O@IKDKLMNL@DIV_T_AN_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DIV_T_AN_DINT\00", comdat, align 1
@"??_C@_0N@HEHLJGHF@DIV_T_AN_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"DIV_T_AN_INT\00", comdat, align 1
@"??_C@_0O@LKEKPHBK@DIV_T_AN_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DIV_T_AN_LINT\00", comdat, align 1
@"??_C@_0P@HDCAKCCA@DIV_T_AN_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"DIV_T_AN_UDINT\00", comdat, align 1
@"??_C@_0O@NHLKACOJ@DIV_T_AN_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DIV_T_AN_UINT\00", comdat, align 1
@"??_C@_0P@KBOAOJLC@DIV_T_AN_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"DIV_T_AN_USINT\00", comdat, align 1
@"??_C@_0P@EDFAOJOB@DIV_T_AN_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"DIV_T_AN_ULINT\00", comdat, align 1
@"??_C@_0O@KGALLOCF@DIV_T_AN_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DIV_T_AN_REAL\00", comdat, align 1
@"??_C@_0P@HLMIPDIN@DIV_T_AN_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"DIV_T_AN_LREAL\00", comdat, align 1
@"??_C@_08BPJJGDHH@DIV_T_AI?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"DIV_T_AI\00", comdat, align 1
@"??_C@_0O@JNFNMJMH@DIV_T_AI_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DIV_T_AI_SINT\00", comdat, align 1
@"??_C@_0O@EPJNICFF@DIV_T_AI_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DIV_T_AI_DINT\00", comdat, align 1
@"??_C@_0N@GJHOKGMN@DIV_T_AI_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"DIV_T_AI_INT\00", comdat, align 1
@"??_C@_0O@HPONMJJE@DIV_T_AI_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DIV_T_AI_LINT\00", comdat, align 1
@"??_C@_0P@HJOFKLDJ@DIV_T_AI_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"DIV_T_AI_UDINT\00", comdat, align 1
@"??_C@_0O@BCBNDMGH@DIV_T_AI_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DIV_T_AI_UINT\00", comdat, align 1
@"??_C@_0P@KLCFOAKL@DIV_T_AI_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"DIV_T_AI_USINT\00", comdat, align 1
@"??_C@_0P@EJJFOAPI@DIV_T_AI_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"DIV_T_AI_ULINT\00", comdat, align 1
@"??_C@_07CNAPKBHF@DIV_T_R?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"DIV_T_R\00", comdat, align 1
@"??_C@_04BFBMEOHG@EXPT?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"EXPT\00", comdat, align 1
@"??_C@_0P@GJJODHJO@EXPT_REAL_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"EXPT_REAL_REAL\00", comdat, align 1
@"??_C@_0BA@CHLEAMAA@EXPT_REAL_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"EXPT_REAL_LREAL\00", comdat, align 1
@"??_C@_0P@JHGPHOPC@EXPT_REAL_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"EXPT_REAL_SINT\00", comdat, align 1
@"??_C@_0P@EFKPDFGA@EXPT_REAL_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"EXPT_REAL_DINT\00", comdat, align 1
@"??_C@_0O@FLGHLEED@EXPT_REAL_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"EXPT_REAL_INT\00", comdat, align 1
@"??_C@_0P@HFNPHOKB@EXPT_REAL_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"EXPT_REAL_LINT\00", comdat, align 1
@"??_C@_0BA@CPFMFNKN@EXPT_REAL_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"EXPT_REAL_UDINT\00", comdat, align 1
@"??_C@_0P@BICPILFC@EXPT_REAL_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"EXPT_REAL_UINT\00", comdat, align 1
@"??_C@_0BA@PNJMBGDP@EXPT_REAL_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"EXPT_REAL_USINT\00", comdat, align 1
@"??_C@_0BA@BPCMBGGM@EXPT_REAL_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"EXPT_REAL_ULINT\00", comdat, align 1
@"??_C@_0BA@LNLMLOH@EXPT_LREAL_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"EXPT_LREAL_REAL\00", comdat, align 1
@"??_C@_0BB@OAPIAGE@EXPT_LREAL_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"EXPT_LREAL_LREAL\00", comdat, align 1
@"??_C@_0BA@PFCKICIL@EXPT_LREAL_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"EXPT_LREAL_SINT\00", comdat, align 1
@"??_C@_0BA@CHOKMJBJ@EXPT_LREAL_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"EXPT_LREAL_DINT\00", comdat, align 1
@"??_C@_0P@MDIGBCBP@EXPT_LREAL_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"EXPT_LREAL_INT\00", comdat, align 1
@"??_C@_0BA@BHJKICNI@EXPT_LREAL_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"EXPT_LREAL_LINT\00", comdat, align 1
@"??_C@_0BB@GOHNBMJ@EXPT_LREAL_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"EXPT_LREAL_UDINT\00", comdat, align 1
@"??_C@_0BA@HKGKHHCL@EXPT_LREAL_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"EXPT_LREAL_UINT\00", comdat, align 1
@"??_C@_0BB@NECHJKFL@EXPT_LREAL_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"EXPT_LREAL_USINT\00", comdat, align 1
@"??_C@_0BB@DGJHJKAI@EXPT_LREAL_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"EXPT_LREAL_ULINT\00", comdat, align 1
@"??_C@_03FIBGOAPP@MOD?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"MOD\00", comdat, align 1
@"??_C@_08EIIHOHFC@MOD_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MOD_REAL\00", comdat, align 1
@"??_C@_09LFEHJLEL@MOD_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MOD_LREAL\00", comdat, align 1
@"??_C@_08LGHGKODO@MOD_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MOD_SINT\00", comdat, align 1
@"??_C@_08GELGOFKM@MOD_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MOD_DINT\00", comdat, align 1
@"??_C@_07PGEDMNHH@MOD_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"MOD_INT\00", comdat, align 1
@"??_C@_08FEMGKOGN@MOD_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MOD_LINT\00", comdat, align 1
@"??_C@_09LNKPMKOG@MOD_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MOD_UDINT\00", comdat, align 1
@"??_C@_08DJDGFLJO@MOD_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MOD_UINT\00", comdat, align 1
@"??_C@_09GPGPIBHE@MOD_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MOD_USINT\00", comdat, align 1
@"??_C@_09INNPIBCH@MOD_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MOD_ULINT\00", comdat, align 1
@"??_C@_04LPPGDFDD@MOVE?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"MOVE\00", comdat, align 1
@"??_C@_09MNDFBOKI@MOVE_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MOVE_REAL\00", comdat, align 1
@"??_C@_0L@OIKKDCLA@MOVE_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"MOVE_LREAL\00", comdat, align 1
@"??_C@_09DDMEFHME@MOVE_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MOVE_SINT\00", comdat, align 1
@"??_C@_09OBAEBMFG@MOVE_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MOVE_DINT\00", comdat, align 1
@"??_C@_08CBIKOPCF@MOVE_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MOVE_INT\00", comdat, align 1
@"??_C@_09NBHEFHJH@MOVE_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MOVE_LINT\00", comdat, align 1
@"??_C@_0L@OAECGDBN@MOVE_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"MOVE_UDINT\00", comdat, align 1
@"??_C@_09LMIEKCGE@MOVE_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MOVE_UINT\00", comdat, align 1
@"??_C@_0L@DCICCIIP@MOVE_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"MOVE_USINT\00", comdat, align 1
@"??_C@_0L@NADCCINM@MOVE_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"MOVE_ULINT\00", comdat, align 1
@"??_C@_09NAHLBGJN@MOVE_TIME?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MOVE_TIME\00", comdat, align 1
@"??_C@_0L@HFBNEIOI@MOVE_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"MOVE_DWORD\00", comdat, align 1
@"??_C@_09LMNBOGJN@MOVE_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MOVE_WORD\00", comdat, align 1
@"??_C@_09HMDFLLNP@MOVE_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MOVE_BYTE\00", comdat, align 1
@"??_C@_09MIPGEEEE@MOVE_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MOVE_BOOL\00", comdat, align 1
@"??_C@_0M@CHIOHIFF@MOVE_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"MOVE_STRING\00", comdat, align 1
@"??_C@_03IBHOEMFB@MUL?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"MUL\00", comdat, align 1
@"??_C@_08JGBDIENG@MUL_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MUL_REAL\00", comdat, align 1
@"??_C@_09FPEMEIBB@MUL_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MUL_LREAL\00", comdat, align 1
@"??_C@_08GIOCMNLK@MUL_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MUL_SINT\00", comdat, align 1
@"??_C@_08LKCCIGCI@MUL_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MUL_DINT\00", comdat, align 1
@"??_C@_07NJLOIMJK@MUL_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"MUL_INT\00", comdat, align 1
@"??_C@_08IKFCMNOJ@MUL_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MUL_LINT\00", comdat, align 1
@"??_C@_09FHKEBJLM@MUL_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MUL_UDINT\00", comdat, align 1
@"??_C@_08OHKCDIBK@MUL_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MUL_UINT\00", comdat, align 1
@"??_C@_09IFGEFCCO@MUL_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MUL_USINT\00", comdat, align 1
@"??_C@_09GHNEFCHN@MUL_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MUL_ULINT\00", comdat, align 1
@"??_C@_08BEMBKEAP@MUL_T_AN?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MUL_T_AN\00", comdat, align 1
@"??_C@_0O@DODOBCLF@MUL_T_AN_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"MUL_T_AN_SINT\00", comdat, align 1
@"??_C@_0O@OMPOFJCH@MUL_T_AN_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"MUL_T_AN_DINT\00", comdat, align 1
@"??_C@_0N@LGKFKAKP@MUL_T_AN_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"MUL_T_AN_INT\00", comdat, align 1
@"??_C@_0O@NMIOBCOG@MUL_T_AN_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"MUL_T_AN_LINT\00", comdat, align 1
@"??_C@_0P@MHENNIPC@MUL_T_AN_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"MUL_T_AN_UDINT\00", comdat, align 1
@"??_C@_0O@LBHOOHBF@MUL_T_AN_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"MUL_T_AN_UINT\00", comdat, align 1
@"??_C@_0P@BFINJDGA@MUL_T_AN_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"MUL_T_AN_USINT\00", comdat, align 1
@"??_C@_0P@PHDNJDDD@MUL_T_AN_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"MUL_T_AN_ULINT\00", comdat, align 1
@"??_C@_0O@MAMPFLNJ@MUL_T_AN_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"MUL_T_AN_REAL\00", comdat, align 1
@"??_C@_0P@MPKFIJFP@MUL_T_AN_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"MUL_T_AN_LREAL\00", comdat, align 1
@"??_C@_08FLIADCMI@MUL_T_AI?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MUL_T_AI\00", comdat, align 1
@"??_C@_0O@PLJJCMDL@MUL_T_AI_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"MUL_T_AI_SINT\00", comdat, align 1
@"??_C@_0O@CJFJGHKJ@MUL_T_AI_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"MUL_T_AI_DINT\00", comdat, align 1
@"??_C@_0N@KLKAJABH@MUL_T_AI_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"MUL_T_AI_INT\00", comdat, align 1
@"??_C@_0O@BJCJCMGI@MUL_T_AI_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"MUL_T_AI_LINT\00", comdat, align 1
@"??_C@_0P@MNIINBOL@MUL_T_AI_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"MUL_T_AI_UDINT\00", comdat, align 1
@"??_C@_0O@HENJNJJL@MUL_T_AI_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"MUL_T_AI_UINT\00", comdat, align 1
@"??_C@_0P@BPEIJKHJ@MUL_T_AI_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"MUL_T_AI_USINT\00", comdat, align 1
@"??_C@_0P@PNPIJKCK@MUL_T_AI_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"MUL_T_AI_ULINT\00", comdat, align 1
@"??_C@_07DAHDGNBJ@MUL_T_R?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"MUL_T_R\00", comdat, align 1
@"??_C@_03GMBJJJAE@NEG?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"NEG\00", comdat, align 1
@"??_C@_08NBCCNNMC@NEG_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"NEG_REAL\00", comdat, align 1
@"??_C@_09EFNBKNDF@NEG_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"NEG_LREAL\00", comdat, align 1
@"??_C@_08CPNDJEKO@NEG_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"NEG_SINT\00", comdat, align 1
@"??_C@_08PNBDNPDM@NEG_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"NEG_DINT\00", comdat, align 1
@"??_C@_07FKCIOHHE@NEG_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"NEG_INT\00", comdat, align 1
@"??_C@_08MNGDJEPN@NEG_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"NEG_LINT\00", comdat, align 1
@"??_C@_09ENDJPMJI@NEG_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"NEG_UDINT\00", comdat, align 1
@"??_C@_08KAJDGBAO@NEG_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"NEG_UINT\00", comdat, align 1
@"??_C@_09JPPJLHAK@NEG_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"NEG_USINT\00", comdat, align 1
@"??_C@_09HNEJLHFJ@NEG_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"NEG_ULINT\00", comdat, align 1
@"??_C@_03KPDLEBHD@SUB?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"SUB\00", comdat, align 1
@"??_C@_08KCCOGGGI@SUB_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SUB_REAL\00", comdat, align 1
@"??_C@_09HDKBOLHI@SUB_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"SUB_LREAL\00", comdat, align 1
@"??_C@_08FMNPCPAE@SUB_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SUB_SINT\00", comdat, align 1
@"??_C@_08IOBPGEJG@SUB_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SUB_DINT\00", comdat, align 1
@"??_C@_07IKIFMOPD@SUB_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"SUB_INT\00", comdat, align 1
@"??_C@_08LOGPCPFH@SUB_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SUB_LINT\00", comdat, align 1
@"??_C@_09HLEJLKNF@SUB_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"SUB_UDINT\00", comdat, align 1
@"??_C@_08NDJPNKKE@SUB_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SUB_UINT\00", comdat, align 1
@"??_C@_09KJIJPBEH@SUB_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"SUB_USINT\00", comdat, align 1
@"??_C@_09ELDJPBBE@SUB_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"SUB_ULINT\00", comdat, align 1
@"??_C@_07DFBCIIPG@SUB_T_T?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"SUB_T_T\00", comdat, align 1
@"??_C@_0N@OANMICMP@BYTE_TO_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"BYTE_TO_DINT\00", comdat, align 1
@"??_C@_0O@PMMPLLJG@BYTE_TO_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"BYTE_TO_DWORD\00", comdat, align 1
@"??_C@_0M@CCGFHAGE@BYTE_TO_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"BYTE_TO_INT\00", comdat, align 1
@"??_C@_0N@NAKMMJAO@BYTE_TO_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"BYTE_TO_LINT\00", comdat, align 1
@"??_C@_0N@DCBMMJFN@BYTE_TO_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"BYTE_TO_SINT\00", comdat, align 1
@"??_C@_0O@GJJAJAGD@BYTE_TO_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"BYTE_TO_UDINT\00", comdat, align 1
@"??_C@_0N@LNFMDMPN@BYTE_TO_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"BYTE_TO_UINT\00", comdat, align 1
@"??_C@_0O@LLFANLPB@BYTE_TO_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"BYTE_TO_USINT\00", comdat, align 1
@"??_C@_0N@LNAJHIAE@BYTE_TO_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"BYTE_TO_WORD\00", comdat, align 1
@"??_C@_0N@MJCONKNN@BYTE_TO_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"BYTE_TO_BOOL\00", comdat, align 1
@"??_C@_0N@MMONIADB@BYTE_TO_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"BYTE_TO_REAL\00", comdat, align 1
@"??_C@_0O@GBHIMBMO@BYTE_TO_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"BYTE_TO_LREAL\00", comdat, align 1
@"??_C@_0N@OPAKAFBP@BOOL_TO_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"BOOL_TO_BYTE\00", comdat, align 1
@"??_C@_0N@HCDLKCJG@BOOL_TO_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"BOOL_TO_DINT\00", comdat, align 1
@"??_C@_0O@OOOKLFOG@BOOL_TO_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"BOOL_TO_DWORD\00", comdat, align 1
@"??_C@_0M@BHMLLCKI@BOOL_TO_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"BOOL_TO_INT\00", comdat, align 1
@"??_C@_0N@ECELOJFH@BOOL_TO_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"BOOL_TO_LINT\00", comdat, align 1
@"??_C@_0O@HDFNMPLO@BOOL_TO_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"BOOL_TO_LREAL\00", comdat, align 1
@"??_C@_0N@FOAKKAGI@BOOL_TO_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"BOOL_TO_REAL\00", comdat, align 1
@"??_C@_0N@KAPLOJAE@BOOL_TO_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"BOOL_TO_SINT\00", comdat, align 1
@"??_C@_0O@HLLFJOBD@BOOL_TO_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"BOOL_TO_UDINT\00", comdat, align 1
@"??_C@_0N@CPLLBMKE@BOOL_TO_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"BOOL_TO_UINT\00", comdat, align 1
@"??_C@_0O@KJHFNFIB@BOOL_TO_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"BOOL_TO_USINT\00", comdat, align 1
@"??_C@_0N@CPOOFIFN@BOOL_TO_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"BOOL_TO_WORD\00", comdat, align 1
@"??_C@_0M@OIHDOFLF@INT_TO_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"INT_TO_BOOL\00", comdat, align 1
@"??_C@_0M@FMLABKCO@INT_TO_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"INT_TO_BYTE\00", comdat, align 1
@"??_C@_0N@LGCALGIF@INT_TO_B_BCD?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"INT_TO_B_BCD\00", comdat, align 1
@"??_C@_0N@GAHJFFJI@INT_TO_D_BCD?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"INT_TO_D_BCD\00", comdat, align 1
@"??_C@_0N@OFDLCFKN@INT_TO_W_BCD?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"INT_TO_W_BCD\00", comdat, align 1
@"??_C@_0M@MBIBLNKH@INT_TO_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"INT_TO_DINT\00", comdat, align 1
@"??_C@_0M@JMFEEHGM@INT_TO_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"INT_TO_WORD\00", comdat, align 1
@"??_C@_0N@LPIHAPMD@INT_TO_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"INT_TO_DWORD\00", comdat, align 1
@"??_C@_0M@PBPBPGGG@INT_TO_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"INT_TO_LINT\00", comdat, align 1
@"??_C@_0N@CCDAHFJL@INT_TO_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"INT_TO_LREAL\00", comdat, align 1
@"??_C@_0M@ONLALPFJ@INT_TO_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"INT_TO_REAL\00", comdat, align 1
@"??_C@_0M@BDEBPGDF@INT_TO_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"INT_TO_SINT\00", comdat, align 1
@"??_C@_0N@CKNICEDG@INT_TO_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"INT_TO_UDINT\00", comdat, align 1
@"??_C@_0M@JMABADJF@INT_TO_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"INT_TO_UINT\00", comdat, align 1
@"??_C@_0N@PIBIGPKE@INT_TO_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"INT_TO_USINT\00", comdat, align 1
@"??_C@_0O@HIGKLLPG@B_BCD_TO_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"B_BCD_TO_DINT\00", comdat, align 1
@"??_C@_0N@EGHMPFCG@B_BCD_TO_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"B_BCD_TO_INT\00", comdat, align 1
@"??_C@_0O@EIBKPADH@B_BCD_TO_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"B_BCD_TO_LINT\00", comdat, align 1
@"??_C@_0O@KKKKPAGE@B_BCD_TO_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"B_BCD_TO_SINT\00", comdat, align 1
@"??_C@_0M@FMCJNFEG@BCD_TO_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"BCD_TO_DINT\00", comdat, align 1
@"??_C@_0O@IAKIPAEA@D_BCD_TO_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"D_BCD_TO_DINT\00", comdat, align 1
@"??_C@_0N@OGJJCKPL@D_BCD_TO_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"D_BCD_TO_INT\00", comdat, align 1
@"??_C@_0O@LANILLIB@D_BCD_TO_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"D_BCD_TO_LINT\00", comdat, align 1
@"??_C@_0O@FCGILLNC@D_BCD_TO_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"D_BCD_TO_SINT\00", comdat, align 1
@"??_C@_0O@JKHLOJPH@W_BCD_TO_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"W_BCD_TO_DINT\00", comdat, align 1
@"??_C@_0N@OPFEOAOP@W_BCD_TO_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"W_BCD_TO_INT\00", comdat, align 1
@"??_C@_0O@KKALKCDG@W_BCD_TO_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"W_BCD_TO_LINT\00", comdat, align 1
@"??_C@_0O@EILLKCGF@W_BCD_TO_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"W_BCD_TO_SINT\00", comdat, align 1
@"??_C@_0O@DAPKPBCK@DINT_TO_B_BCD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DINT_TO_B_BCD\00", comdat, align 1
@"??_C@_0M@HNICFAFP@DINT_TO_BCD?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"DINT_TO_BCD\00", comdat, align 1
@"??_C@_0N@OBOGJOGF@DINT_TO_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"DINT_TO_BOOL\00", comdat, align 1
@"??_C@_0N@FFCFGBPO@DINT_TO_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"DINT_TO_BYTE\00", comdat, align 1
@"??_C@_0O@OGKDBCDH@DINT_TO_D_BCD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DINT_TO_D_BCD\00", comdat, align 1
@"??_C@_0O@DJFNEIGM@DINT_TO_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DINT_TO_DWORD\00", comdat, align 1
@"??_C@_0M@OIJJFGFM@DINT_TO_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"DINT_TO_INT\00", comdat, align 1
@"??_C@_0N@PIGEINLG@DINT_TO_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"DINT_TO_LINT\00", comdat, align 1
@"??_C@_0O@KEOKDCDE@DINT_TO_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DINT_TO_LREAL\00", comdat, align 1
@"??_C@_0N@OECFMEIJ@DINT_TO_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"DINT_TO_REAL\00", comdat, align 1
@"??_C@_0N@BKNEINOF@DINT_TO_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"DINT_TO_SINT\00", comdat, align 1
@"??_C@_0N@PJGLMMLM@DINT_TO_TIME?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"DINT_TO_TIME\00", comdat, align 1
@"??_C@_0O@KMACGDJJ@DINT_TO_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DINT_TO_UDINT\00", comdat, align 1
@"??_C@_0O@HOMCCIAL@DINT_TO_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DINT_TO_USINT\00", comdat, align 1
@"??_C@_0O@GDOBGCAC@DINT_TO_W_BCD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DINT_TO_W_BCD\00", comdat, align 1
@"??_C@_0N@JFJEHIEF@DINT_TO_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"DINT_TO_UINT\00", comdat, align 1
@"??_C@_0N@JFMBDMLM@DINT_TO_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"DINT_TO_WORD\00", comdat, align 1
@"??_C@_0O@OCAMMGKA@LREAL_TO_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"LREAL_TO_BOOL\00", comdat, align 1
@"??_C@_0O@FGMPDJDL@LREAL_TO_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"LREAL_TO_BYTE\00", comdat, align 1
@"??_C@_0O@MLPOJOLC@LREAL_TO_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"LREAL_TO_DINT\00", comdat, align 1
@"??_C@_0P@NCFAJEAL@LREAL_TO_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"LREAL_TO_DWORD\00", comdat, align 1
@"??_C@_0N@LECDJPNO@LREAL_TO_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"LREAL_TO_INT\00", comdat, align 1
@"??_C@_0O@PLIONFHD@LREAL_TO_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"LREAL_TO_LINT\00", comdat, align 1
@"??_C@_0O@OHMPJMEM@LREAL_TO_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"LREAL_TO_REAL\00", comdat, align 1
@"??_C@_0O@BJDONFCA@LREAL_TO_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"LREAL_TO_SINT\00", comdat, align 1
@"??_C@_0P@EHAPLPPO@LREAL_TO_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"LREAL_TO_UDINT\00", comdat, align 1
@"??_C@_0O@JGHOCAIA@LREAL_TO_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"LREAL_TO_UINT\00", comdat, align 1
@"??_C@_0P@JFMPPEGM@LREAL_TO_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"LREAL_TO_USINT\00", comdat, align 1
@"??_C@_0O@JGCLGEHJ@LREAL_TO_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"LREAL_TO_WORD\00", comdat, align 1
@"??_C@_0N@FHIPJPDJ@REAL_TO_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"REAL_TO_BOOL\00", comdat, align 1
@"??_C@_0N@ODEMGAKC@REAL_TO_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"REAL_TO_BYTE\00", comdat, align 1
@"??_C@_0N@HOHNMHCL@REAL_TO_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"REAL_TO_DINT\00", comdat, align 1
@"??_C@_0O@FLDGDMLC@REAL_TO_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"REAL_TO_DWORD\00", comdat, align 1
@"??_C@_0M@OHLFDHGD@REAL_TO_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"REAL_TO_INT\00", comdat, align 1
@"??_C@_0N@EOANIMOK@REAL_TO_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"REAL_TO_LINT\00", comdat, align 1
@"??_C@_0O@MGIBEGOK@REAL_TO_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"REAL_TO_LREAL\00", comdat, align 1
@"??_C@_0N@KMLNIMLJ@REAL_TO_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"REAL_TO_SINT\00", comdat, align 1
@"??_C@_0O@MOGJBHEH@REAL_TO_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"REAL_TO_UDINT\00", comdat, align 1
@"??_C@_0N@CDPNHJBJ@REAL_TO_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"REAL_TO_UINT\00", comdat, align 1
@"??_C@_0O@BMKJFMNF@REAL_TO_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"REAL_TO_USINT\00", comdat, align 1
@"??_C@_0N@CDKIDNOA@REAL_TO_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"REAL_TO_WORD\00", comdat, align 1
@"??_C@_0O@CIOGBNK@DWORD_TO_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DWORD_TO_BOOL\00", comdat, align 1
@"??_C@_0O@LGENJOEB@DWORD_TO_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DWORD_TO_BYTE\00", comdat, align 1
@"??_C@_0O@CLHMDJMI@DWORD_TO_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DWORD_TO_DINT\00", comdat, align 1
@"??_C@_0N@ODGNPLNE@DWORD_TO_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"DWORD_TO_INT\00", comdat, align 1
@"??_C@_0O@BLAMHCAJ@DWORD_TO_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DWORD_TO_LINT\00", comdat, align 1
@"??_C@_0P@PPNHPENG@DWORD_TO_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"DWORD_TO_LREAL\00", comdat, align 1
@"??_C@_0O@HENDLDG@DWORD_TO_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DWORD_TO_REAL\00", comdat, align 1
@"??_C@_0O@PJLMHCFK@DWORD_TO_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DWORD_TO_SINT\00", comdat, align 1
@"??_C@_0P@PHDPKFHL@DWORD_TO_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"DWORD_TO_UDINT\00", comdat, align 1
@"??_C@_0O@HGPMIHPK@DWORD_TO_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DWORD_TO_UINT\00", comdat, align 1
@"??_C@_0P@CFPPOOOJ@DWORD_TO_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"DWORD_TO_USINT\00", comdat, align 1
@"??_C@_0O@HGKJMDAD@DWORD_TO_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"DWORD_TO_WORD\00", comdat, align 1
@"??_C@_0O@DKDOPBM@LINT_TO_B_BCD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"LINT_TO_B_BCD\00", comdat, align 1
@"??_C@_0N@LLOFENAI@LINT_TO_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"LINT_TO_BOOL\00", comdat, align 1
@"??_C@_0N@PCGLCJD@LINT_TO_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"LINT_TO_BYTE\00", comdat, align 1
@"??_C@_0O@NFPKAMAB@LINT_TO_D_BCD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"LINT_TO_D_BCD\00", comdat, align 1
@"??_C@_0N@JCBHBFBK@LINT_TO_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"LINT_TO_DINT\00", comdat, align 1
@"??_C@_0O@KAEFGFK@LINT_TO_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"LINT_TO_DWORD\00", comdat, align 1
@"??_C@_0M@OOJFCAKC@LINT_TO_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"LINT_TO_INT\00", comdat, align 1
@"??_C@_0O@JHLDCMAC@LINT_TO_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"LINT_TO_LREAL\00", comdat, align 1
@"??_C@_0N@LOCGBHOE@LINT_TO_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"LINT_TO_REAL\00", comdat, align 1
@"??_C@_0N@EANHFOII@LINT_TO_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"LINT_TO_SINT\00", comdat, align 1
@"??_C@_0O@JPFLHNKP@LINT_TO_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"LINT_TO_UDINT\00", comdat, align 1
@"??_C@_0N@MPJHKLCI@LINT_TO_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"LINT_TO_UINT\00", comdat, align 1
@"??_C@_0O@ENJLDGDN@LINT_TO_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"LINT_TO_USINT\00", comdat, align 1
@"??_C@_0O@FALIHMDE@LINT_TO_W_BCD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"LINT_TO_W_BCD\00", comdat, align 1
@"??_C@_0N@MPMCOPNB@LINT_TO_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"LINT_TO_WORD\00", comdat, align 1
@"??_C@_0O@DDIFGHIG@SINT_TO_B_BCD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"SINT_TO_B_BCD\00", comdat, align 1
@"??_C@_0N@CIJCDOOH@SINT_TO_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"SINT_TO_BOOL\00", comdat, align 1
@"??_C@_0N@JMFBMBHM@SINT_TO_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"SINT_TO_BYTE\00", comdat, align 1
@"??_C@_0O@OFNMIEJL@SINT_TO_D_BCD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"SINT_TO_D_BCD\00", comdat, align 1
@"??_C@_0N@BGAGGPF@SINT_TO_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"SINT_TO_DINT\00", comdat, align 1
@"??_C@_0O@DKCCNOMA@SINT_TO_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"SINT_TO_DWORD\00", comdat, align 1
@"??_C@_0M@JABJFCCP@SINT_TO_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"SINT_TO_INT\00", comdat, align 1
@"??_C@_0N@DBBACNDE@SINT_TO_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"SINT_TO_LINT\00", comdat, align 1
@"??_C@_0O@KHJFKEJI@SINT_TO_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"SINT_TO_LREAL\00", comdat, align 1
@"??_C@_0N@CNFBGEAL@SINT_TO_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"SINT_TO_REAL\00", comdat, align 1
@"??_C@_0O@KPHNPFDF@SINT_TO_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"SINT_TO_UDINT\00", comdat, align 1
@"??_C@_0N@FMOANIMH@SINT_TO_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"SINT_TO_UINT\00", comdat, align 1
@"??_C@_0O@HNLNLOKH@SINT_TO_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"SINT_TO_USINT\00", comdat, align 1
@"??_C@_0O@GAJOPEKO@SINT_TO_W_BCD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"SINT_TO_W_BCD\00", comdat, align 1
@"??_C@_0N@FMLFJMDO@SINT_TO_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"SINT_TO_WORD\00", comdat, align 1
@"??_C@_0O@JMIBAENA@UDINT_TO_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"UDINT_TO_BOOL\00", comdat, align 1
@"??_C@_0O@CIECPLEL@UDINT_TO_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"UDINT_TO_BYTE\00", comdat, align 1
@"??_C@_0O@LFHDFMMC@UDINT_TO_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"UDINT_TO_DINT\00", comdat, align 1
@"??_C@_0N@IIJNFCND@UDINT_TO_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"UDINT_TO_INT\00", comdat, align 1
@"??_C@_0O@IFADBHAD@UDINT_TO_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"UDINT_TO_LINT\00", comdat, align 1
@"??_C@_0P@BPJMBCKN@UDINT_TO_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"UDINT_TO_LREAL\00", comdat, align 1
@"??_C@_0O@JJECFODM@UDINT_TO_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"UDINT_TO_REAL\00", comdat, align 1
@"??_C@_0O@GHLDBHFA@UDINT_TO_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"UDINT_TO_SINT\00", comdat, align 1
@"??_C@_0O@OIPDOCPA@UDINT_TO_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"UDINT_TO_UINT\00", comdat, align 1
@"??_C@_0P@MFLEAIJC@UDINT_TO_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"UDINT_TO_USINT\00", comdat, align 1
@"??_C@_0O@OIKGKGAJ@UDINT_TO_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"UDINT_TO_WORD\00", comdat, align 1
@"??_C@_0P@ICCLGIPF@UDINT_TO_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"UDINT_TO_DWORD\00", comdat, align 1
@"??_C@_0N@IIHHOBDK@UINT_TO_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"UINT_TO_BOOL\00", comdat, align 1
@"??_C@_0N@DMLEBOKB@UINT_TO_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"UINT_TO_BYTE\00", comdat, align 1
@"??_C@_0N@KBIFLJCI@UINT_TO_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"UINT_TO_DINT\00", comdat, align 1
@"??_C@_0M@HPCEPHMP@UINT_TO_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"UINT_TO_INT\00", comdat, align 1
@"??_C@_0N@JBPFPCOJ@UINT_TO_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"UINT_TO_LINT\00", comdat, align 1
@"??_C@_0O@FPFHOPCO@UINT_TO_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"UINT_TO_LREAL\00", comdat, align 1
@"??_C@_0N@INLELLNG@UINT_TO_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"UINT_TO_REAL\00", comdat, align 1
@"??_C@_0N@HDEFPCLK@UINT_TO_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"UINT_TO_SINT\00", comdat, align 1
@"??_C@_0O@FHLPLOID@UINT_TO_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"UINT_TO_UDINT\00", comdat, align 1
@"??_C@_0O@IFHPPFBB@UINT_TO_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"UINT_TO_USINT\00", comdat, align 1
@"??_C@_0N@PMFAEDOD@UINT_TO_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"UINT_TO_WORD\00", comdat, align 1
@"??_C@_0O@MCOAJFHG@UINT_TO_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"UINT_TO_DWORD\00", comdat, align 1
@"??_C@_0O@FFPFKEFC@USINT_TO_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"USINT_TO_BOOL\00", comdat, align 1
@"??_C@_0O@OBDGFLMJ@USINT_TO_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"USINT_TO_BYTE\00", comdat, align 1
@"??_C@_0O@HMAHPMEA@USINT_TO_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"USINT_TO_DINT\00", comdat, align 1
@"??_C@_0P@IBFEPOFJ@USINT_TO_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"USINT_TO_DWORD\00", comdat, align 1
@"??_C@_0N@PABNFGKA@USINT_TO_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"USINT_TO_INT\00", comdat, align 1
@"??_C@_0O@EMHHLHIB@USINT_TO_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"USINT_TO_LINT\00", comdat, align 1
@"??_C@_0P@BMODIEAB@USINT_TO_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"USINT_TO_LREAL\00", comdat, align 1
@"??_C@_0O@FADGPOLO@USINT_TO_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"USINT_TO_REAL\00", comdat, align 1
@"??_C@_0O@KOMHLHNC@USINT_TO_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"USINT_TO_SINT\00", comdat, align 1
@"??_C@_0P@BEALNFKM@USINT_TO_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"USINT_TO_UDINT\00", comdat, align 1
@"??_C@_0O@CBIHECHC@USINT_TO_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"USINT_TO_UINT\00", comdat, align 1
@"??_C@_0O@CBNCAGIL@USINT_TO_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"USINT_TO_WORD\00", comdat, align 1
@"??_C@_0N@IEFECGHF@WORD_TO_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"WORD_TO_BOOL\00", comdat, align 1
@"??_C@_0N@DAJHNJOO@WORD_TO_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"WORD_TO_BYTE\00", comdat, align 1
@"??_C@_0N@KNKGHOGH@WORD_TO_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"WORD_TO_DINT\00", comdat, align 1
@"??_C@_0O@CEIPOKLA@WORD_TO_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"WORD_TO_DWORD\00", comdat, align 1
@"??_C@_0M@OKPIIAAE@WORD_TO_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"WORD_TO_INT\00", comdat, align 1
@"??_C@_0N@JNNGDFKG@WORD_TO_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"WORD_TO_LINT\00", comdat, align 1
@"??_C@_0O@LJDIJAOI@WORD_TO_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"WORD_TO_LREAL\00", comdat, align 1
@"??_C@_0N@IBJHHMJJ@WORD_TO_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"WORD_TO_REAL\00", comdat, align 1
@"??_C@_0N@HPGGDFPF@WORD_TO_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"WORD_TO_SINT\00", comdat, align 1
@"??_C@_0O@LBNAMBEF@WORD_TO_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"WORD_TO_UDINT\00", comdat, align 1
@"??_C@_0N@PACGMAFF@WORD_TO_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"WORD_TO_UINT\00", comdat, align 1
@"??_C@_0O@GDBAIKNH@WORD_TO_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"WORD_TO_USINT\00", comdat, align 1
@"??_C@_0L@FAGLCNNG@TRUNC_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"TRUNC_SINT\00", comdat, align 1
@"??_C@_09IIJMCEDI@TRUNC_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"TRUNC_INT\00", comdat, align 1
@"??_C@_0L@ICKLGGEE@TRUNC_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"TRUNC_DINT\00", comdat, align 1
@"??_C@_0L@LCNLCNIF@TRUNC_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"TRUNC_LINT\00", comdat, align 1
@"??_C@_0N@CNJNOMHK@TIME_TO_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"TIME_TO_DINT\00", comdat, align 1
@"??_C@_03BDACDFHA@AND?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"AND\00", comdat, align 1
@"??_C@_08GHNKEODE@AND_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"AND_BOOL\00", comdat, align 1
@"??_C@_08NDBJLBKP@AND_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"AND_BYTE\00", comdat, align 1
@"??_C@_08BDPNOMON@AND_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"AND_WORD\00", comdat, align 1
@"??_C@_09CFLHBFNO@AND_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"AND_DWORD\00", comdat, align 1
@"??_C@_04DOOMBBIC@ANDN?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"ANDN\00", comdat, align 1
@"??_C@_09PJCINCCF@ANDN_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"ANDN_BOOL\00", comdat, align 1
@"??_C@_09ENOLCNLO@ANDN_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"ANDN_BYTE\00", comdat, align 1
@"??_C@_09INAPHAPM@ANDN_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"ANDN_WORD\00", comdat, align 1
@"??_C@_0L@EPJJMHLA@ANDN_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"ANDN_DWORD\00", comdat, align 1
@"??_C@_03GBFNEA@NOT?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"NOT\00", comdat, align 1
@"??_C@_08BDBHBNLF@NOT_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"NOT_BOOL\00", comdat, align 1
@"??_C@_08KHNEOCCO@NOT_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"NOT_BYTE\00", comdat, align 1
@"??_C@_08GHDALPGM@NOT_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"NOT_WORD\00", comdat, align 1
@"??_C@_09LPHMGLDL@NOT_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"NOT_DWORD\00", comdat, align 1
@"??_C@_02PDPFNDMG@OR?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"OR\00", comdat, align 1
@"??_C@_07OFLMDLNN@OR_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"OR_BOOL\00", comdat, align 1
@"??_C@_07FBHPMEEG@OR_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"OR_BYTE\00", comdat, align 1
@"??_C@_07JBJLJJAE@OR_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"OR_WORD\00", comdat, align 1
@"??_C@_08PMODCJHH@OR_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"OR_DWORD\00", comdat, align 1
@"??_C@_03BMAOPANN@ORN?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"ORN\00", comdat, align 1
@"??_C@_08CAHMOOIM@ORN_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"ORN_BOOL\00", comdat, align 1
@"??_C@_08JELPBBBH@ORN_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"ORN_BYTE\00", comdat, align 1
@"??_C@_08FEFLEMFF@ORN_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"ORN_WORD\00", comdat, align 1
@"??_C@_09OAEKIIMA@ORN_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"ORN_DWORD\00", comdat, align 1
@"??_C@_03CDEJPCIF@XOR?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"XOR\00", comdat, align 1
@"??_C@_08KPBNBDHE@XOR_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"XOR_BOOL\00", comdat, align 1
@"??_C@_08BLNOOMOP@XOR_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"XOR_BYTE\00", comdat, align 1
@"??_C@_08NLDKLBKN@XOR_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"XOR_WORD\00", comdat, align 1
@"??_C@_09FDKDJDBD@XOR_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"XOR_DWORD\00", comdat, align 1
@"??_C@_04PDALFMNG@XORN?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"XORN\00", comdat, align 1
@"??_C@_09IPDMFEOI@XORN_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"XORN_BOOL\00", comdat, align 1
@"??_C@_09DLPPKLHD@XORN_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"XORN_BYTE\00", comdat, align 1
@"??_C@_09PLBLPGDB@XORN_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"XORN_WORD\00", comdat, align 1
@"??_C@_0L@KKDKGNDL@XORN_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"XORN_DWORD\00", comdat, align 1
@"??_C@_03JILFCNDO@ROL?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"ROL\00", comdat, align 1
@"??_C@_08LJBBIBOC@ROL_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"ROL_BYTE\00", comdat, align 1
@"??_C@_08HJPFNMKA@ROL_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"ROL_WORD\00", comdat, align 1
@"??_C@_09CNLACAMD@ROL_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"ROL_DWORD\00", comdat, align 1
@"??_C@_03EMPEBCOB@ROR?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"ROR\00", comdat, align 1
@"??_C@_08IOPAGGHB@ROR_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"ROR_BYTE\00", comdat, align 1
@"??_C@_08EOBEDLDD@ROR_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"ROR_WORD\00", comdat, align 1
@"??_C@_09EEIBADNK@ROR_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"ROR_DWORD\00", comdat, align 1
@"??_C@_03CFEGFMNO@SHL?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"SHL\00", comdat, align 1
@"??_C@_08KEKPJMLI@SHL_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SHL_BYTE\00", comdat, align 1
@"??_C@_08GEELMBPK@SHL_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SHL_WORD\00", comdat, align 1
@"??_C@_09KGBDCGDE@SHL_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"SHL_DWORD\00", comdat, align 1
@"??_C@_03PBAHGDAB@SHR?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"SHR\00", comdat, align 1
@"??_C@_08JDEOHLCL@SHR_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SHR_BYTE\00", comdat, align 1
@"??_C@_08FDKKCGGJ@SHR_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SHR_WORD\00", comdat, align 1
@"??_C@_09MPCCAFCN@SHR_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"SHR_DWORD\00", comdat, align 1
@"??_C@_06FLHFNFBE@SIZEOF?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"SIZEOF\00", comdat, align 1
@"??_C@_0M@HDFBCJPA@LOWER_BOUND?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"LOWER_BOUND\00", comdat, align 1
@"??_C@_03BPJLEIIC@ABS?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"ABS\00", comdat, align 1
@"??_C@_08GJDOOKLL@ABS_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"ABS_SINT\00", comdat, align 1
@"??_C@_07NOOIILNL@ABS_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"ABS_INT\00", comdat, align 1
@"??_C@_08LLPOKBCJ@ABS_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"ABS_DINT\00", comdat, align 1
@"??_C@_08ILIOOKOI@ABS_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"ABS_LINT\00", comdat, align 1
@"??_C@_09PCGCLOJP@ABS_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"ABS_USINT\00", comdat, align 1
@"??_C@_08OGHOBPBL@ABS_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"ABS_UINT\00", comdat, align 1
@"??_C@_09CAKCPFAN@ABS_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"ABS_UDINT\00", comdat, align 1
@"??_C@_09BANCLOMM@ABS_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"ABS_ULINT\00", comdat, align 1
@"??_C@_08JHMPKDNH@ABS_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"ABS_REAL\00", comdat, align 1
@"??_C@_09CIEKKEKA@ABS_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"ABS_LREAL\00", comdat, align 1
@"??_C@_08IKIBKLOC@ABS_TIME?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"ABS_TIME\00", comdat, align 1
@"??_C@_04DPLPEKKC@ACOS?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"ACOS\00", comdat, align 1
@"??_C@_09FGMHIOMG@ACOS_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"ACOS_REAL\00", comdat, align 1
@"??_C@_0L@ECDLIMHP@ACOS_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"ACOS_LREAL\00", comdat, align 1
@"??_C@_04JEEHANJD@ASIN?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"ASIN\00", comdat, align 1
@"??_C@_09DKGBDIDO@ASIN_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"ASIN_REAL\00", comdat, align 1
@"??_C@_0L@PBDBFAOH@ASIN_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"ASIN_LREAL\00", comdat, align 1
@"??_C@_04HIDGEJC@ATAN?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"ATAN\00", comdat, align 1
@"??_C@_09INOFEOEC@ATAN_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"ATAN_REAL\00", comdat, align 1
@"??_C@_0L@KIDFOJIG@ATAN_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"ATAN_LREAL\00", comdat, align 1
@"??_C@_03LNEKBDFK@COS?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"COS\00", comdat, align 1
@"??_C@_08CCDMJOIA@COS_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"COS_REAL\00", comdat, align 1
@"??_C@_09NNPAJDMK@COS_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"COS_LREAL\00", comdat, align 1
@"??_C@_03BGLCFEGL@SIN?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"SIN\00", comdat, align 1
@"??_C@_08EOJKCIHI@SIN_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SIN_REAL\00", comdat, align 1
@"??_C@_09GOPKEPFC@SIN_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"SIN_LREAL\00", comdat, align 1
@"??_C@_03IFHGDNGK@TAN?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"TAN\00", comdat, align 1
@"??_C@_08PJBOFOAE@TAN_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"TAN_REAL\00", comdat, align 1
@"??_C@_09DHPOPGDD@TAN_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"TAN_LREAL\00", comdat, align 1
@"??_C@_03KKGFKKLA@EXP?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"EXP\00", comdat, align 1
@"??_C@_08BGLAMFKF@EXP_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"EXP_REAL\00", comdat, align 1
@"??_C@_09JGMAMLNG@EXP_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"EXP_LREAL\00", comdat, align 1
@"??_C@_02BHMEDAMC@LN?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"LN\00", comdat, align 1
@"??_C@_07MOIOJAGI@LN_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"LN_REAL\00", comdat, align 1
@"??_C@_08HDMNELIO@LN_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"LN_LREAL\00", comdat, align 1
@"??_C@_03MLIHNEFJ@LOG?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"LOG\00", comdat, align 1
@"??_C@_08GOBEOJIM@LOG_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"LOG_REAL\00", comdat, align 1
@"??_C@_09NEAKPHJG@LOG_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"LOG_LREAL\00", comdat, align 1
@"??_C@_04IEDALHLA@SQRT?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"SQRT\00", comdat, align 1
@"??_C@_09NFLDKPJA@SQRT_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"SQRT_REAL\00", comdat, align 1
@"??_C@_0L@MALAAMJP@SQRT_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"SQRT_LREAL\00", comdat, align 1
@"??_C@_0P@JALKPGJN@BYTE_TO_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"BYTE_TO_STRING\00", comdat, align 1
@"??_C@_0P@ECGPDDDB@WORD_TO_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"WORD_TO_STRING\00", comdat, align 1
@"??_C@_0BA@IDEIMBPO@DWORD_TO_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"DWORD_TO_STRING\00", comdat, align 1
@"??_C@_0P@BCHEOPDJ@SINT_TO_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"SINT_TO_STRING\00", comdat, align 1
@"??_C@_0O@ILPIBLFC@INT_TO_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"INT_TO_STRING\00", comdat, align 1
@"??_C@_0P@MNBHHPGM@DINT_TO_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"DINT_TO_STRING\00", comdat, align 1
@"??_C@_0P@CJOLDOL@LINT_TO_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"LINT_TO_STRING\00", comdat, align 1
@"??_C@_0BA@JLBMLCPJ@USINT_TO_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"USINT_TO_STRING\00", comdat, align 1
@"??_C@_0P@DAIODLML@UINT_TO_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"UINT_TO_STRING\00", comdat, align 1
@"??_C@_0BA@EEHPCCKM@UDINT_TO_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"UDINT_TO_STRING\00", comdat, align 1
@"??_C@_0P@KDACCNHO@TIME_TO_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"TIME_TO_STRING\00", comdat, align 1
@"??_C@_0P@KMBOOLML@REAL_TO_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"REAL_TO_STRING\00", comdat, align 1
@"??_C@_0BA@BOCKIGEL@LREAL_TO_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"LREAL_TO_STRING\00", comdat, align 1
@"??_C@_0P@PELKKNLK@STRING_TO_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"STRING_TO_BYTE\00", comdat, align 1
@"??_C@_0P@DEFOPAPI@STRING_TO_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"STRING_TO_WORD\00", comdat, align 1
@"??_C@_0BA@EIENFCCJ@STRING_TO_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"STRING_TO_DWORD\00", comdat, align 1
@"??_C@_0P@LLELEBKB@STRING_TO_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"STRING_TO_SINT\00", comdat, align 1
@"??_C@_0O@KGMGGMPN@STRING_TO_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"STRING_TO_INT\00", comdat, align 1
@"??_C@_0P@GJILAKDD@STRING_TO_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"STRING_TO_DINT\00", comdat, align 1
@"??_C@_0P@FJPLEBPC@STRING_TO_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"STRING_TO_LINT\00", comdat, align 1
@"??_C@_0BA@PNCDCEO@STRING_TO_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"STRING_TO_USINT\00", comdat, align 1
@"??_C@_0P@DEALLEAB@STRING_TO_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"STRING_TO_UINT\00", comdat, align 1
@"??_C@_0BA@NNBCHJNM@STRING_TO_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"STRING_TO_UDINT\00", comdat, align 1
@"??_C@_0P@FIPEAAPI@STRING_TO_TIME?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"STRING_TO_TIME\00", comdat, align 1
@"??_C@_0P@EFLKAIMN@STRING_TO_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"STRING_TO_REAL\00", comdat, align 1
@"??_C@_0BA@NFPKCIHB@STRING_TO_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"STRING_TO_LREAL\00", comdat, align 1
@"??_C@_06CIJDJJIA@CONCAT?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"CONCAT\00", comdat, align 1
@"??_C@_06FKDAMKFP@DELETE?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"DELETE\00", comdat, align 1
@"??_C@_04OGGDJIHH@FIND?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"FIND\00", comdat, align 1
@"??_C@_06OEMEAEKN@INSERT?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"INSERT\00", comdat, align 1
@"??_C@_07NGBKIEMN@REPLACE?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"REPLACE\00", comdat, align 1
@"??_C@_03BHNCOKMG@LEN?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"LEN\00", comdat, align 1
@"??_C@_04KCNEHMIH@LEFT?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"LEFT\00", comdat, align 1
@"??_C@_03FMJLJMEN@MID?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"MID\00", comdat, align 1
@"??_C@_05PMAFOJDE@RIGHT?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"RIGHT\00", comdat, align 1
@"??_C@_09GJBIKEON@EQ_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"EQ_STRING\00", comdat, align 1
@"??_C@_09GANEEMGH@NE_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"NE_STRING\00", comdat, align 1
@"??_C@_09JMMBGHKN@GE_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"GE_STRING\00", comdat, align 1
@"??_C@_09CHHKDBJP@GT_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"GT_STRING\00", comdat, align 1
@"??_C@_09GECBJMFK@LE_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"LE_STRING\00", comdat, align 1
@"??_C@_09NPJKMKGI@LT_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"LT_STRING\00", comdat, align 1
@"??_C@_05KLKGAAIM@LIMIT?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"LIMIT\00", comdat, align 1
@"??_C@_0L@CELEDJHH@LIMIT_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"LIMIT_SINT\00", comdat, align 1
@"??_C@_09OGFKBPLL@LIMIT_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"LIMIT_INT\00", comdat, align 1
@"??_C@_0L@PGHEHCOF@LIMIT_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"LIMIT_DINT\00", comdat, align 1
@"??_C@_0L@MGAEDJCE@LIMIT_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"LIMIT_LINT\00", comdat, align 1
@"??_C@_0L@NKEFHABL@LIMIT_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"LIMIT_REAL\00", comdat, align 1
@"??_C@_0M@LKNFKAOI@LIMIT_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"LIMIT_LREAL\00", comdat, align 1
@"??_C@_0N@ECGMNOAB@LIMIT_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"LIMIT_STRING\00", comdat, align 1
@"??_C@_03LEPPJAKI@MAX?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"MAX\00", comdat, align 1
@"??_C@_08DICEKLG@MAX_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MAX_SINT\00", comdat, align 1
@"??_C@_07NCGIHEMK@MAX_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"MAX_INT\00", comdat, align 1
@"??_C@_08NBECABCE@MAX_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MAX_DINT\00", comdat, align 1
@"??_C@_08OBDCEKOF@MAX_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MAX_LINT\00", comdat, align 1
@"??_C@_09IMLJHOIC@MAX_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MAX_USINT\00", comdat, align 1
@"??_C@_08IMMCLPBG@MAX_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MAX_UINT\00", comdat, align 1
@"??_C@_09FOHJDFBA@MAX_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MAX_UDINT\00", comdat, align 1
@"??_C@_09GOAJHONB@MAX_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MAX_ULINT\00", comdat, align 1
@"??_C@_08PNHDADNK@MAX_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MAX_REAL\00", comdat, align 1
@"??_C@_09FGJBGELN@MAX_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MAX_LREAL\00", comdat, align 1
@"??_C@_0L@FJIBDPLO@MAX_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"MAX_STRING\00", comdat, align 1
@"??_C@_03KGHEHEMH@MIN?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"MIN\00", comdat, align 1
@"??_C@_08NEGJPIPH@MIN_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MIN_SINT\00", comdat, align 1
@"??_C@_07DEAINLCL@MIN_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"MIN_INT\00", comdat, align 1
@"??_C@_08GKJLDGF@MIN_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MIN_DINT\00", comdat, align 1
@"??_C@_08DGNJPIKE@MIN_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MIN_LINT\00", comdat, align 1
@"??_C@_09INLFOEDG@MIN_USINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MIN_USINT\00", comdat, align 1
@"??_C@_08FLCJANFH@MIN_UINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MIN_UINT\00", comdat, align 1
@"??_C@_09FPHFKPKE@MIN_UDINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MIN_UDINT\00", comdat, align 1
@"??_C@_09GPAFOEGF@MIN_ULINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MIN_ULINT\00", comdat, align 1
@"??_C@_08CKJILBJL@MIN_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"MIN_REAL\00", comdat, align 1
@"??_C@_09FHJNPOAJ@MIN_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"MIN_LREAL\00", comdat, align 1
@"??_C@_0L@JFIMEELB@MIN_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"MIN_STRING\00", comdat, align 1
@"??_C@_03CNJOMPIN@SEL?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"SEL\00", comdat, align 1
@"??_C@_08HAFLGFHC@SEL_SINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SEL_SINT\00", comdat, align 1
@"??_C@_07NHFBDDEN@SEL_INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"SEL_INT\00", comdat, align 1
@"??_C@_08KCJLCOOA@SEL_DINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SEL_DINT\00", comdat, align 1
@"??_C@_08JCOLGFCB@SEL_LINT?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SEL_LINT\00", comdat, align 1
@"??_C@_08IOKKCMBO@SEL_REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SEL_REAL\00", comdat, align 1
@"??_C@_09MKOLLLDL@SEL_LREAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"SEL_LREAL\00", comdat, align 1
@"??_C@_0L@FNMGGDHE@SEL_STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"SEL_STRING\00", comdat, align 1
@"??_C@_08JDOECECL@SEL_TIME?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SEL_TIME\00", comdat, align 1
@"??_C@_08ILGJHGPC@SEL_BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SEL_BOOL\00", comdat, align 1
@"??_C@_08DPKKIJGJ@SEL_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SEL_BYTE\00", comdat, align 1
@"??_C@_08PPEONECL@SEL_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"SEL_WORD\00", comdat, align 1
@"??_C@_09FHFMMBGD@SEL_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"SEL_DWORD\00", comdat, align 1
@"??_C@_08CEHGKHCN@BIT_TEST?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"BIT_TEST\00", comdat, align 1
@"??_C@_08FABMLEPK@GET_CHAR?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"GET_CHAR\00", comdat, align 1
@"??_C@_07PPJNPJKM@GET_LSB?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"GET_LSB\00", comdat, align 1
@"??_C@_07EHCBJOMJ@GET_MSB?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"GET_MSB\00", comdat, align 1
@"??_C@_08FDEOCCKI@I_BIT_IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"I_BIT_IN\00", comdat, align 1
@"??_C@_0O@COKLNBLA@I_BIT_IN_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"I_BIT_IN_BYTE\00", comdat, align 1
@"??_C@_0O@OOEPIMPC@I_BIT_IN_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"I_BIT_IN_WORD\00", comdat, align 1
@"??_C@_0P@KIECKKEL@I_BIT_IN_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"I_BIT_IN_DWORD\00", comdat, align 1
@"??_C@_06CBEBPLJC@PARITY?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"PARITY\00", comdat, align 1
@"??_C@_0M@IIDDNLMN@PARITY_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"PARITY_BYTE\00", comdat, align 1
@"??_C@_0M@EINHIGIP@PARITY_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"PARITY_WORD\00", comdat, align 1
@"??_C@_0N@IGFADPMA@PARITY_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"PARITY_DWORD\00", comdat, align 1
@"??_C@_08HNNLPOAE@R_BIT_IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"R_BIT_IN\00", comdat, align 1
@"??_C@_0O@HCBNGDB@R_BIT_IN_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"R_BIT_IN_BYTE\00", comdat, align 1
@"??_C@_0O@MHMFILHD@R_BIT_IN_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"R_BIT_IN_WORD\00", comdat, align 1
@"??_C@_0P@DCNEJDPK@R_BIT_IN_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"R_BIT_IN_DWORD\00", comdat, align 1
@"??_C@_08GKKAOKEH@S_BIT_IN?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"S_BIT_IN\00", comdat, align 1
@"??_C@_0O@JKCODHEH@S_BIT_IN_BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"S_BIT_IN_BYTE\00", comdat, align 1
@"??_C@_0O@FKMKGKAF@S_BIT_IN_WORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"S_BIT_IN_WORD\00", comdat, align 1
@"??_C@_0P@ILCPEIBC@S_BIT_IN_DWORD?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"S_BIT_IN_DWORD\00", comdat, align 1
@"??_C@_07HGMMGHN@SET_LSB?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"SET_LSB\00", comdat, align 1
@"??_C@_07LPNAKBBI@SET_MSB?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"SET_MSB\00", comdat, align 1
@"??_C@_0BB@DHMGLGFH@STRING_TO_BUFFER?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"STRING_TO_BUFFER\00", comdat, align 1
@"??_C@_04NLFHDAEB@SWAP?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"SWAP\00", comdat, align 1
@BasicFunctions = dso_local dllexport local_unnamed_addr global [637 x %struct.MNMTEMPLATE] [%struct.MNMTEMPLATE <{ ptr @"??_C@_02NFEPAFND@EQ?$AA@", i16 38, i8 0, i16 -32759, i16 -32759, i16 0, ptr @EQ, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07EAFHGHGE@EQ_REAL?$AA@", i16 38, i8 0, i16 782, i16 782, i16 0, ptr @EQ_REAL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08HKPFNOFC@EQ_LREAL?$AA@", i16 38, i8 0, i16 783, i16 783, i16 0, ptr @EQ_LREAL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07LOKGCOAI@EQ_SINT?$AA@", i16 38, i8 0, i16 260, i16 260, i16 0, ptr @EQ_SINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07GMGGGFJK@EQ_DINT?$AA@", i16 38, i8 0, i16 262, i16 262, i16 0, ptr @EQ_DINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_06ELPONGDK@EQ_INT?$AA@", i16 38, i8 0, i16 261, i16 261, i16 0, ptr @EQ_INT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07FMBGCOFL@EQ_LINT?$AA@", i16 38, i8 0, i16 263, i16 263, i16 0, ptr @EQ_LINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08HCBNIPPP@EQ_UDINT?$AA@", i16 38, i8 0, i16 514, i16 514, i16 0, ptr @EQ_UDINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07DBOGNLKI@EQ_UINT?$AA@", i16 38, i8 0, i16 513, i16 513, i16 0, ptr @EQ_UINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08KANNMEGN@EQ_USINT?$AA@", i16 38, i8 0, i16 512, i16 512, i16 0, ptr @EQ_USINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08ECGNMEDO@EQ_ULINT?$AA@", i16 38, i8 0, i16 515, i16 515, i16 0, ptr @EQ_ULINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07FNBJGPFB@EQ_TIME?$AA@", i16 38, i8 0, i16 1347, i16 1347, i16 0, ptr @EQ_TIME, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08OHECKEAK@EQ_DWORD?$AA@", i16 38, i8 0, i16 18, i16 18, i16 0, ptr @EQ_DWORD, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07DBLDJPFB@EQ_WORD?$AA@", i16 38, i8 0, i16 17, i16 17, i16 0, ptr @EQ_WORD, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07PBFHMCBD@EQ_BYTE?$AA@", i16 38, i8 0, i16 16, i16 16, i16 0, ptr @EQ_BYTE, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07EFJEDNII@EQ_BOOL?$AA@", i16 38, i8 0, i16 1536, i16 1536, i16 0, ptr @EQ_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_02PIGFAGOI@GE?$AA@", i16 38, i8 0, i16 -32759, i16 -32759, i16 0, ptr @GE, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07JBODNIME@GE_REAL?$AA@", i16 38, i8 0, i16 782, i16 782, i16 0, ptr @GE_REAL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08KMPCMJAF@GE_LREAL?$AA@", i16 38, i8 0, i16 783, i16 783, i16 0, ptr @GE_LREAL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07GPBCJBKI@GE_SINT?$AA@", i16 38, i8 0, i16 260, i16 260, i16 0, ptr @GE_SINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07LNNCNKDK@GE_DINT?$AA@", i16 38, i8 0, i16 262, i16 262, i16 0, ptr @GE_DINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_06EECGIHJO@GE_INT?$AA@", i16 38, i8 0, i16 261, i16 261, i16 0, ptr @GE_INT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07INKCJBPL@GE_LINT?$AA@", i16 38, i8 0, i16 263, i16 263, i16 0, ptr @GE_LINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08KEBKJIKI@GE_UDINT?$AA@", i16 38, i8 0, i16 514, i16 514, i16 0, ptr @GE_UDINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07OAFCGEAI@GE_UINT?$AA@", i16 38, i8 0, i16 513, i16 513, i16 0, ptr @GE_UINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08HGNKNDDK@GE_USINT?$AA@", i16 38, i8 0, i16 512, i16 512, i16 0, ptr @GE_USINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08JEGKNDGJ@GE_ULINT?$AA@", i16 38, i8 0, i16 515, i16 515, i16 0, ptr @GE_ULINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07IMKNNAPB@GE_TIME?$AA@", i16 38, i8 0, i16 1347, i16 1347, i16 0, ptr @GE_TIME, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08DBEFLDFN@GE_DWORD?$AA@", i16 38, i8 0, i16 18, i16 18, i16 0, ptr @GE_DWORD, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07OAAHCAPB@GE_WORD?$AA@", i16 38, i8 0, i16 17, i16 17, i16 0, ptr @GE_WORD, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07CAODHNLD@GE_BYTE?$AA@", i16 38, i8 0, i16 16, i16 16, i16 0, ptr @GE_BYTE, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07JECAICCI@GE_BOOL?$AA@", i16 38, i8 0, i16 1536, i16 1536, i16 0, ptr @GE_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_02KLLMCFPI@GT?$AA@", i16 38, i8 0, i16 -32759, i16 -32759, i16 0, ptr @GT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07FAEKEPLO@GT_REAL?$AA@", i16 38, i8 0, i16 782, i16 782, i16 0, ptr @GT_REAL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08BMODPILA@GT_LREAL?$AA@", i16 38, i8 0, i16 783, i16 783, i16 0, ptr @GT_LREAL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07KOLLAGNC@GT_SINT?$AA@", i16 38, i8 0, i16 260, i16 260, i16 0, ptr @GT_SINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07HMHLENEA@GT_DINT?$AA@", i16 38, i8 0, i16 262, i16 262, i16 0, ptr @GT_DINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_06IMKMFGKA@GT_INT?$AA@", i16 38, i8 0, i16 261, i16 261, i16 0, ptr @GT_INT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07EMALAGIB@GT_LINT?$AA@", i16 38, i8 0, i16 263, i16 263, i16 0, ptr @GT_LINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08BEALKJBN@GT_UDINT?$AA@", i16 38, i8 0, i16 514, i16 514, i16 0, ptr @GT_UDINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07CBPLPDHC@GT_UINT?$AA@", i16 38, i8 0, i16 513, i16 513, i16 0, ptr @GT_UINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08MGMLOCIP@GT_USINT?$AA@", i16 38, i8 0, i16 512, i16 512, i16 0, ptr @GT_USINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08CEHLOCNM@GT_ULINT?$AA@", i16 38, i8 0, i16 515, i16 515, i16 0, ptr @GT_ULINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07ENAEEHIL@GT_TIME?$AA@", i16 38, i8 0, i16 1347, i16 1347, i16 0, ptr @GT_TIME, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08IBFEICOI@GT_DWORD?$AA@", i16 38, i8 0, i16 18, i16 18, i16 0, ptr @GT_DWORD, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07CBKOLHIL@GT_WORD?$AA@", i16 38, i8 0, i16 17, i16 17, i16 0, ptr @GT_WORD, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07OBEKOKMJ@GT_BYTE?$AA@", i16 38, i8 0, i16 16, i16 16, i16 0, ptr @GT_BYTE, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07FFIJBFFC@GT_BOOL?$AA@", i16 38, i8 0, i16 1536, i16 1536, i16 0, ptr @GT_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_02PEDAOJAJ@LE?$AA@", i16 38, i8 0, i16 -32759, i16 -32759, i16 0, ptr @LE, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07MMIJMEJC@LE_REAL?$AA@", i16 38, i8 0, i16 782, i16 782, i16 0, ptr @LE_REAL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08COKHFHNI@LE_LREAL?$AA@", i16 38, i8 0, i16 783, i16 783, i16 0, ptr @LE_LREAL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07DCHIINPO@LE_SINT?$AA@", i16 38, i8 0, i16 260, i16 260, i16 0, ptr @LE_SINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07OALIMGGM@LE_DINT?$AA@", i16 38, i8 0, i16 262, i16 262, i16 0, ptr @LE_DINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_06EGCBNDGE@LE_INT?$AA@", i16 38, i8 0, i16 261, i16 261, i16 0, ptr @LE_INT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07NAMIINKN@LE_LINT?$AA@", i16 38, i8 0, i16 263, i16 263, i16 0, ptr @LE_LINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08CGEPAGHF@LE_UDINT?$AA@", i16 38, i8 0, i16 514, i16 514, i16 0, ptr @LE_UDINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07LNDIHIFO@LE_UINT?$AA@", i16 38, i8 0, i16 513, i16 513, i16 0, ptr @LE_UINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08PEIPENOH@LE_USINT?$AA@", i16 38, i8 0, i16 512, i16 512, i16 0, ptr @LE_USINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08BGDPENLE@LE_ULINT?$AA@", i16 38, i8 0, i16 515, i16 515, i16 0, ptr @LE_ULINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07NBMHMMKH@LE_TIME?$AA@", i16 38, i8 0, i16 1347, i16 1347, i16 0, ptr @LE_TIME, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08LDBACNIA@LE_DWORD?$AA@", i16 38, i8 0, i16 18, i16 18, i16 0, ptr @LE_DWORD, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07LNGNDMKH@LE_WORD?$AA@", i16 38, i8 0, i16 17, i16 17, i16 0, ptr @LE_WORD, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07HNIJGBOF@LE_BYTE?$AA@", i16 38, i8 0, i16 16, i16 16, i16 0, ptr @LE_BYTE, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07MJEKJOHO@LE_BOOL?$AA@", i16 38, i8 0, i16 1536, i16 1536, i16 0, ptr @LE_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_02KHOJMKBJ@LT?$AA@", i16 38, i8 0, i16 -32759, i16 -32759, i16 0, ptr @LT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07NCAFDOI@LT_REAL?$AA@", i16 38, i8 0, i16 782, i16 782, i16 0, ptr @LT_REAL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08JOLGGGGN@LT_LREAL?$AA@", i16 38, i8 0, i16 783, i16 783, i16 0, ptr @LT_LREAL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07PDNBBKIE@LT_SINT?$AA@", i16 38, i8 0, i16 260, i16 260, i16 0, ptr @LT_SINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07CBBBFBBG@LT_DINT?$AA@", i16 38, i8 0, i16 262, i16 262, i16 0, ptr @LT_DINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_06IOKLACFK@LT_INT?$AA@", i16 38, i8 0, i16 261, i16 261, i16 0, ptr @LT_INT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07BBGBBKNH@LT_LINT?$AA@", i16 38, i8 0, i16 263, i16 263, i16 0, ptr @LT_LINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08JGFODHMA@LT_UDINT?$AA@", i16 38, i8 0, i16 514, i16 514, i16 0, ptr @LT_UDINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07HMJBOPCE@LT_UINT?$AA@", i16 38, i8 0, i16 513, i16 513, i16 0, ptr @LT_UINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08EEJOHMFC@LT_USINT?$AA@", i16 38, i8 0, i16 512, i16 512, i16 0, ptr @LT_USINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08KGCOHMAB@LT_ULINT?$AA@", i16 38, i8 0, i16 515, i16 515, i16 0, ptr @LT_ULINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07BAGOFLNN@LT_TIME?$AA@", i16 38, i8 0, i16 1347, i16 1347, i16 0, ptr @LT_TIME, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08DABBMDF@LT_DWORD?$AA@", i16 38, i8 0, i16 18, i16 18, i16 0, ptr @LT_DWORD, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07HMMEKLNN@LT_WORD?$AA@", i16 38, i8 0, i16 17, i16 17, i16 0, ptr @LT_WORD, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07LMCAPGJP@LT_BYTE?$AA@", i16 38, i8 0, i16 16, i16 16, i16 0, ptr @LT_BYTE, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07IODAJAE@LT_BOOL?$AA@", i16 38, i8 0, i16 1536, i16 1536, i16 0, ptr @LT_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_02PHLEDNGH@NE?$AA@", i16 38, i8 0, i16 -32759, i16 -32759, i16 0, ptr @NE, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07IOKMMDOP@NE_REAL?$AA@", i16 38, i8 0, i16 782, i16 782, i16 0, ptr @NE_REAL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08FBHPFO@NE_LREAL?$AA@", i16 38, i8 0, i16 783, i16 783, i16 0, ptr @NE_LREAL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07HAFNIKID@NE_SINT?$AA@", i16 38, i8 0, i16 260, i16 260, i16 0, ptr @NE_SINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07KCJNMBBB@NE_DINT?$AA@", i16 38, i8 0, i16 262, i16 262, i16 0, ptr @NE_DINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_06NBLOMCEN@NE_INT?$AA@", i16 38, i8 0, i16 261, i16 261, i16 0, ptr @NE_INT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07JCONIKNA@NE_LINT?$AA@", i16 38, i8 0, i16 263, i16 263, i16 0, ptr @NE_LINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08ILJCOPD@NE_UDINT?$AA@", i16 38, i8 0, i16 514, i16 514, i16 0, ptr @NE_UDINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07PPBNHPCD@NE_UINT?$AA@", i16 38, i8 0, i16 513, i16 513, i16 0, ptr @NE_UINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08NKHJGFGB@NE_USINT?$AA@", i16 38, i8 0, i16 512, i16 512, i16 0, ptr @NE_USINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08DIMJGFDC@NE_ULINT?$AA@", i16 38, i8 0, i16 515, i16 515, i16 0, ptr @NE_ULINT, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07JDOCMLNK@NE_TIME?$AA@", i16 38, i8 0, i16 1347, i16 1347, i16 0, ptr @NE_TIME, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08JNOGAFAG@NE_DWORD?$AA@", i16 38, i8 0, i16 18, i16 18, i16 0, ptr @NE_DWORD, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07PPEIDLNK@NE_WORD?$AA@", i16 38, i8 0, i16 17, i16 17, i16 0, ptr @NE_WORD, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07DPKMGGJI@NE_BYTE?$AA@", i16 38, i8 0, i16 16, i16 16, i16 0, ptr @NE_BYTE, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07ILGPJJAD@NE_BOOL?$AA@", i16 38, i8 0, i16 1536, i16 1536, i16 0, ptr @NE_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03BOJFLAKG@ADD?$AA@", i16 38, i8 0, i16 -32765, i16 -32765, i16 0, ptr @ADD, i16 -32765 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08PDNJAIBA@ADD_REAL?$AA@", i16 38, i8 0, i16 782, i16 782, i16 0, ptr @ADD_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09CNCOOFBI@ADD_LREAL?$AA@", i16 38, i8 0, i16 783, i16 783, i16 0, ptr @ADD_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08NCIEBHM@ADD_SINT?$AA@", i16 38, i8 0, i16 260, i16 260, i16 0, ptr @ADD_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08NPOIAKOO@ADD_DINT?$AA@", i16 38, i8 0, i16 262, i16 262, i16 0, ptr @ADD_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07KDOLIMMC@ADD_INT?$AA@", i16 38, i8 0, i16 261, i16 261, i16 0, ptr @ADD_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08OPJIEBCP@ADD_LINT?$AA@", i16 38, i8 0, i16 263, i16 263, i16 0, ptr @ADD_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09CFMGLELF@ADD_UDINT?$AA@", i16 38, i8 0, i16 514, i16 514, i16 0, ptr @ADD_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08ICGILENM@ADD_UINT?$AA@", i16 38, i8 0, i16 513, i16 513, i16 0, ptr @ADD_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09PHAGPPCH@ADD_USINT?$AA@", i16 38, i8 0, i16 512, i16 512, i16 0, ptr @ADD_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09BFLGPPHE@ADD_ULINT?$AA@", i16 38, i8 0, i16 515, i16 515, i16 0, ptr @ADD_ULINT, i16 515 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07BMHMMKMH@ADD_T_T?$AA@", i16 38, i8 0, i16 1347, i16 1347, i16 0, ptr @ADD_T_T, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03FJGHKDBE@DIV?$AA@", i16 38, i8 0, i16 -32765, i16 -32765, i16 0, ptr @DIV, i16 -32765 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08NCAKNFGJ@DIV_REAL?$AA@", i16 38, i8 0, i16 782, i16 782, i16 0, ptr @DIV_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09ENGPPFN@DIV_LREAL?$AA@", i16 38, i8 0, i16 783, i16 783, i16 0, ptr @DIV_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08CMPLJMAF@DIV_SINT?$AA@", i16 38, i8 0, i16 260, i16 260, i16 0, ptr @DIV_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08PODLNHJH@DIV_DINT?$AA@", i16 38, i8 0, i16 262, i16 262, i16 0, ptr @DIV_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07MEMCEAPG@DIV_INT?$AA@", i16 38, i8 0, i16 261, i16 261, i16 0, ptr @DIV_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08MOELJMFG@DIV_LINT?$AA@", i16 38, i8 0, i16 263, i16 263, i16 0, ptr @DIV_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09MDOKOPA@DIV_UDINT?$AA@", i16 38, i8 0, i16 514, i16 514, i16 0, ptr @DIV_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08KDLLGJKF@DIV_UINT?$AA@", i16 38, i8 0, i16 513, i16 513, i16 0, ptr @DIV_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09NOPOOFGC@DIV_USINT?$AA@", i16 38, i8 0, i16 512, i16 512, i16 0, ptr @DIV_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09DMEOOFDB@DIV_ULINT?$AA@", i16 38, i8 0, i16 515, i16 515, i16 0, ptr @DIV_ULINT, i16 515 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08FANIPFLA@DIV_T_AN?$AA@", i16 38, i8 0, i16 1347, i16 -32765, i16 0, ptr @DIV_T_AN, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@FIPKPHEJ@DIV_T_AN_SINT?$AA@", i16 38, i8 0, i16 1347, i16 260, i16 0, ptr @DIV_T_AN_SINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@IKDKLMNL@DIV_T_AN_DINT?$AA@", i16 38, i8 0, i16 1347, i16 262, i16 0, ptr @DIV_T_AN_DINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@HEHLJGHF@DIV_T_AN_INT?$AA@", i16 38, i8 0, i16 1347, i16 261, i16 0, ptr @DIV_T_AN_INT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@LKEKPHBK@DIV_T_AN_LINT?$AA@", i16 38, i8 0, i16 1347, i16 263, i16 0, ptr @DIV_T_AN_LINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@HDCAKCCA@DIV_T_AN_UDINT?$AA@", i16 38, i8 0, i16 1347, i16 514, i16 0, ptr @DIV_T_AN_UDINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@NHLKACOJ@DIV_T_AN_UINT?$AA@", i16 38, i8 0, i16 1347, i16 513, i16 0, ptr @DIV_T_AN_UINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@KBOAOJLC@DIV_T_AN_USINT?$AA@", i16 38, i8 0, i16 1347, i16 512, i16 0, ptr @DIV_T_AN_USINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@EDFAOJOB@DIV_T_AN_ULINT?$AA@", i16 38, i8 0, i16 1347, i16 515, i16 0, ptr @DIV_T_AN_ULINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@KGALLOCF@DIV_T_AN_REAL?$AA@", i16 38, i8 0, i16 1347, i16 782, i16 0, ptr @DIV_T_AN_REAL, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@HLMIPDIN@DIV_T_AN_LREAL?$AA@", i16 38, i8 0, i16 1347, i16 783, i16 0, ptr @DIV_T_AN_LREAL, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08BPJJGDHH@DIV_T_AI?$AA@", i16 38, i8 0, i16 1347, i16 -32761, i16 0, ptr @DIV_T_AI, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@JNFNMJMH@DIV_T_AI_SINT?$AA@", i16 38, i8 0, i16 1347, i16 260, i16 0, ptr @DIV_T_AI_SINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@EPJNICFF@DIV_T_AI_DINT?$AA@", i16 38, i8 0, i16 1347, i16 262, i16 0, ptr @DIV_T_AI_DINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@GJHOKGMN@DIV_T_AI_INT?$AA@", i16 38, i8 0, i16 1347, i16 261, i16 0, ptr @DIV_T_AI_INT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@HPONMJJE@DIV_T_AI_LINT?$AA@", i16 38, i8 0, i16 1347, i16 263, i16 0, ptr @DIV_T_AI_LINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@HJOFKLDJ@DIV_T_AI_UDINT?$AA@", i16 38, i8 0, i16 1347, i16 514, i16 0, ptr @DIV_T_AI_UDINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@BCBNDMGH@DIV_T_AI_UINT?$AA@", i16 38, i8 0, i16 1347, i16 513, i16 0, ptr @DIV_T_AI_UINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@KLCFOAKL@DIV_T_AI_USINT?$AA@", i16 38, i8 0, i16 1347, i16 512, i16 0, ptr @DIV_T_AI_USINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@EJJFOAPI@DIV_T_AI_ULINT?$AA@", i16 38, i8 0, i16 1347, i16 515, i16 0, ptr @DIV_T_AI_ULINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07CNAPKBHF@DIV_T_R?$AA@", i16 38, i8 0, i16 1347, i16 782, i16 0, ptr @DIV_T_R, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_04BFBMEOHG@EXPT?$AA@", i16 38, i8 0, i16 -32760, i16 -32765, i16 0, ptr @EXPT, i16 -32760 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@GJJODHJO@EXPT_REAL_REAL?$AA@", i16 38, i8 0, i16 782, i16 782, i16 0, ptr @EXPT_REAL_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0BA@CHLEAMAA@EXPT_REAL_LREAL?$AA@", i16 38, i8 0, i16 782, i16 783, i16 0, ptr @EXPT_REAL_LREAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@JHGPHOPC@EXPT_REAL_SINT?$AA@", i16 38, i8 0, i16 782, i16 260, i16 0, ptr @EXPT_REAL_SINT, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@EFKPDFGA@EXPT_REAL_DINT?$AA@", i16 38, i8 0, i16 782, i16 262, i16 0, ptr @EXPT_REAL_DINT, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@FLGHLEED@EXPT_REAL_INT?$AA@", i16 38, i8 0, i16 782, i16 261, i16 0, ptr @EXPT_REAL_INT, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@HFNPHOKB@EXPT_REAL_LINT?$AA@", i16 38, i8 0, i16 782, i16 263, i16 0, ptr @EXPT_REAL_LINT, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0BA@CPFMFNKN@EXPT_REAL_UDINT?$AA@", i16 38, i8 0, i16 782, i16 514, i16 0, ptr @EXPT_REAL_UDINT, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@BICPILFC@EXPT_REAL_UINT?$AA@", i16 38, i8 0, i16 782, i16 513, i16 0, ptr @EXPT_REAL_UINT, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0BA@PNJMBGDP@EXPT_REAL_USINT?$AA@", i16 38, i8 0, i16 782, i16 512, i16 0, ptr @EXPT_REAL_USINT, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0BA@BPCMBGGM@EXPT_REAL_ULINT?$AA@", i16 38, i8 0, i16 782, i16 515, i16 0, ptr @EXPT_REAL_ULINT, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0BA@LNLMLOH@EXPT_LREAL_REAL?$AA@", i16 38, i8 0, i16 783, i16 782, i16 0, ptr @EXPT_LREAL_REAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0BB@OAPIAGE@EXPT_LREAL_LREAL?$AA@", i16 38, i8 0, i16 783, i16 783, i16 0, ptr @EXPT_LREAL_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0BA@PFCKICIL@EXPT_LREAL_SINT?$AA@", i16 38, i8 0, i16 783, i16 260, i16 0, ptr @EXPT_LREAL_SINT, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0BA@CHOKMJBJ@EXPT_LREAL_DINT?$AA@", i16 38, i8 0, i16 783, i16 262, i16 0, ptr @EXPT_LREAL_DINT, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@MDIGBCBP@EXPT_LREAL_INT?$AA@", i16 38, i8 0, i16 783, i16 261, i16 0, ptr @EXPT_LREAL_INT, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0BA@BHJKICNI@EXPT_LREAL_LINT?$AA@", i16 38, i8 0, i16 783, i16 263, i16 0, ptr @EXPT_LREAL_LINT, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0BB@GOHNBMJ@EXPT_LREAL_UDINT?$AA@", i16 38, i8 0, i16 783, i16 514, i16 0, ptr @EXPT_LREAL_UDINT, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0BA@HKGKHHCL@EXPT_LREAL_UINT?$AA@", i16 38, i8 0, i16 783, i16 513, i16 0, ptr @EXPT_LREAL_UINT, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0BB@NECHJKFL@EXPT_LREAL_USINT?$AA@", i16 38, i8 0, i16 783, i16 512, i16 0, ptr @EXPT_LREAL_USINT, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0BB@DGJHJKAI@EXPT_LREAL_ULINT?$AA@", i16 38, i8 0, i16 783, i16 515, i16 0, ptr @EXPT_LREAL_ULINT, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03FIBGOAPP@MOD?$AA@", i16 38, i8 0, i16 -32761, i16 -32761, i16 0, ptr @MOD, i16 -32761 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08EIIHOHFC@MOD_REAL?$AA@", i16 38, i8 0, i16 782, i16 782, i16 0, ptr @MOD_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09LFEHJLEL@MOD_LREAL?$AA@", i16 38, i8 0, i16 783, i16 783, i16 0, ptr @MOD_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08LGHGKODO@MOD_SINT?$AA@", i16 38, i8 0, i16 260, i16 260, i16 0, ptr @MOD_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08GELGOFKM@MOD_DINT?$AA@", i16 38, i8 0, i16 262, i16 262, i16 0, ptr @MOD_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07PGEDMNHH@MOD_INT?$AA@", i16 38, i8 0, i16 261, i16 261, i16 0, ptr @MOD_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08FEMGKOGN@MOD_LINT?$AA@", i16 38, i8 0, i16 263, i16 263, i16 0, ptr @MOD_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09LNKPMKOG@MOD_UDINT?$AA@", i16 38, i8 0, i16 514, i16 514, i16 0, ptr @MOD_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08DJDGFLJO@MOD_UINT?$AA@", i16 38, i8 0, i16 513, i16 513, i16 0, ptr @MOD_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09GPGPIBHE@MOD_USINT?$AA@", i16 38, i8 0, i16 512, i16 512, i16 0, ptr @MOD_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09INNPIBCH@MOD_ULINT?$AA@", i16 38, i8 0, i16 515, i16 515, i16 0, ptr @MOD_ULINT, i16 515 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_04LPPGDFDD@MOVE?$AA@", i16 38, i8 0, i16 -32767, i16 0, i16 0, ptr @MOVE, i16 -32767 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09MNDFBOKI@MOVE_REAL?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @MOVE_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0L@OIKKDCLA@MOVE_LREAL?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @MOVE_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09DDMEFHME@MOVE_SINT?$AA@", i16 38, i8 0, i16 260, i16 0, i16 0, ptr @MOVE_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09OBAEBMFG@MOVE_DINT?$AA@", i16 38, i8 0, i16 262, i16 0, i16 0, ptr @MOVE_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08CBIKOPCF@MOVE_INT?$AA@", i16 38, i8 0, i16 261, i16 0, i16 0, ptr @MOVE_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09NBHEFHJH@MOVE_LINT?$AA@", i16 38, i8 0, i16 263, i16 0, i16 0, ptr @MOVE_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0L@OAECGDBN@MOVE_UDINT?$AA@", i16 38, i8 0, i16 514, i16 0, i16 0, ptr @MOVE_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09LMIEKCGE@MOVE_UINT?$AA@", i16 38, i8 0, i16 513, i16 0, i16 0, ptr @MOVE_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0L@DCICCIIP@MOVE_USINT?$AA@", i16 38, i8 0, i16 512, i16 0, i16 0, ptr @MOVE_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0L@NADCCINM@MOVE_ULINT?$AA@", i16 38, i8 0, i16 515, i16 0, i16 0, ptr @MOVE_ULINT, i16 515 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09NAHLBGJN@MOVE_TIME?$AA@", i16 38, i8 0, i16 1347, i16 0, i16 0, ptr @MOVE_TIME, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0L@HFBNEIOI@MOVE_DWORD?$AA@", i16 38, i8 0, i16 18, i16 0, i16 0, ptr @MOVE_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09LMNBOGJN@MOVE_WORD?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @MOVE_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09HMDFLLNP@MOVE_BYTE?$AA@", i16 38, i8 0, i16 16, i16 0, i16 0, ptr @MOVE_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09MIPGEEEE@MOVE_BOOL?$AA@", i16 38, i8 0, i16 1536, i16 0, i16 0, ptr @MOVE_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@CHIOHIFF@MOVE_STRING?$AA@", i16 38, i8 0, i16 1346, i16 0, i16 0, ptr @MOVE_STRING, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03IBHOEMFB@MUL?$AA@", i16 38, i8 0, i16 -32765, i16 -32765, i16 0, ptr @MUL, i16 -32765 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08JGBDIENG@MUL_REAL?$AA@", i16 38, i8 0, i16 782, i16 782, i16 0, ptr @MUL_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09FPEMEIBB@MUL_LREAL?$AA@", i16 38, i8 0, i16 783, i16 783, i16 0, ptr @MUL_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08GIOCMNLK@MUL_SINT?$AA@", i16 38, i8 0, i16 260, i16 260, i16 0, ptr @MUL_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08LKCCIGCI@MUL_DINT?$AA@", i16 38, i8 0, i16 262, i16 262, i16 0, ptr @MUL_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07NJLOIMJK@MUL_INT?$AA@", i16 38, i8 0, i16 261, i16 261, i16 0, ptr @MUL_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08IKFCMNOJ@MUL_LINT?$AA@", i16 38, i8 0, i16 263, i16 263, i16 0, ptr @MUL_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09FHKEBJLM@MUL_UDINT?$AA@", i16 38, i8 0, i16 514, i16 514, i16 0, ptr @MUL_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08OHKCDIBK@MUL_UINT?$AA@", i16 38, i8 0, i16 513, i16 513, i16 0, ptr @MUL_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09IFGEFCCO@MUL_USINT?$AA@", i16 38, i8 0, i16 512, i16 512, i16 0, ptr @MUL_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09GHNEFCHN@MUL_ULINT?$AA@", i16 38, i8 0, i16 515, i16 515, i16 0, ptr @MUL_ULINT, i16 515 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08BEMBKEAP@MUL_T_AN?$AA@", i16 38, i8 0, i16 1347, i16 -32765, i16 0, ptr @MUL_T_AN, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@DODOBCLF@MUL_T_AN_SINT?$AA@", i16 38, i8 0, i16 1347, i16 260, i16 0, ptr @MUL_T_AN_SINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@OMPOFJCH@MUL_T_AN_DINT?$AA@", i16 38, i8 0, i16 1347, i16 262, i16 0, ptr @MUL_T_AN_DINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@LGKFKAKP@MUL_T_AN_INT?$AA@", i16 38, i8 0, i16 1347, i16 261, i16 0, ptr @MUL_T_AN_INT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@NMIOBCOG@MUL_T_AN_LINT?$AA@", i16 38, i8 0, i16 1347, i16 263, i16 0, ptr @MUL_T_AN_LINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@MHENNIPC@MUL_T_AN_UDINT?$AA@", i16 38, i8 0, i16 1347, i16 514, i16 0, ptr @MUL_T_AN_UDINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@LBHOOHBF@MUL_T_AN_UINT?$AA@", i16 38, i8 0, i16 1347, i16 513, i16 0, ptr @MUL_T_AN_UINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@BFINJDGA@MUL_T_AN_USINT?$AA@", i16 38, i8 0, i16 1347, i16 512, i16 0, ptr @MUL_T_AN_USINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@PHDNJDDD@MUL_T_AN_ULINT?$AA@", i16 38, i8 0, i16 1347, i16 515, i16 0, ptr @MUL_T_AN_ULINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@MAMPFLNJ@MUL_T_AN_REAL?$AA@", i16 38, i8 0, i16 1347, i16 782, i16 0, ptr @MUL_T_AN_REAL, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@MPKFIJFP@MUL_T_AN_LREAL?$AA@", i16 38, i8 0, i16 1347, i16 783, i16 0, ptr @MUL_T_AN_LREAL, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08FLIADCMI@MUL_T_AI?$AA@", i16 38, i8 0, i16 1347, i16 -32761, i16 0, ptr @MUL_T_AI, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@PLJJCMDL@MUL_T_AI_SINT?$AA@", i16 38, i8 0, i16 1347, i16 260, i16 0, ptr @MUL_T_AI_SINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@CJFJGHKJ@MUL_T_AI_DINT?$AA@", i16 38, i8 0, i16 1347, i16 262, i16 0, ptr @MUL_T_AI_DINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@KLKAJABH@MUL_T_AI_INT?$AA@", i16 38, i8 0, i16 1347, i16 261, i16 0, ptr @MUL_T_AI_INT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@BJCJCMGI@MUL_T_AI_LINT?$AA@", i16 38, i8 0, i16 1347, i16 263, i16 0, ptr @MUL_T_AI_LINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@MNIINBOL@MUL_T_AI_UDINT?$AA@", i16 38, i8 0, i16 1347, i16 514, i16 0, ptr @MUL_T_AI_UDINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@HENJNJJL@MUL_T_AI_UINT?$AA@", i16 38, i8 0, i16 1347, i16 513, i16 0, ptr @MUL_T_AI_UINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@BPEIJKHJ@MUL_T_AI_USINT?$AA@", i16 38, i8 0, i16 1347, i16 512, i16 0, ptr @MUL_T_AI_USINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@PNPIJKCK@MUL_T_AI_ULINT?$AA@", i16 38, i8 0, i16 1347, i16 515, i16 0, ptr @MUL_T_AI_ULINT, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07DAHDGNBJ@MUL_T_R?$AA@", i16 38, i8 0, i16 1347, i16 782, i16 0, ptr @MUL_T_R, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03GMBJJJAE@NEG?$AA@", i16 38, i8 0, i16 -32765, i16 0, i16 0, ptr @NEG, i16 -32765 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08NBCCNNMC@NEG_REAL?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @NEG_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09EFNBKNDF@NEG_LREAL?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @NEG_LREAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08CPNDJEKO@NEG_SINT?$AA@", i16 38, i8 0, i16 260, i16 0, i16 0, ptr @NEG_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08PNBDNPDM@NEG_DINT?$AA@", i16 38, i8 0, i16 262, i16 0, i16 0, ptr @NEG_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07FKCIOHHE@NEG_INT?$AA@", i16 38, i8 0, i16 261, i16 0, i16 0, ptr @NEG_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08MNGDJEPN@NEG_LINT?$AA@", i16 38, i8 0, i16 263, i16 0, i16 0, ptr @NEG_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09ENDJPMJI@NEG_UDINT?$AA@", i16 38, i8 0, i16 514, i16 0, i16 0, ptr @NEG_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08KAJDGBAO@NEG_UINT?$AA@", i16 38, i8 0, i16 513, i16 0, i16 0, ptr @NEG_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09JPPJLHAK@NEG_USINT?$AA@", i16 38, i8 0, i16 512, i16 0, i16 0, ptr @NEG_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09HNEJLHFJ@NEG_ULINT?$AA@", i16 38, i8 0, i16 515, i16 0, i16 0, ptr @NEG_ULINT, i16 515 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03KPDLEBHD@SUB?$AA@", i16 38, i8 0, i16 -32765, i16 -32765, i16 0, ptr @SUB, i16 -32765 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08KCCOGGGI@SUB_REAL?$AA@", i16 38, i8 0, i16 782, i16 782, i16 0, ptr @SUB_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09HDKBOLHI@SUB_LREAL?$AA@", i16 38, i8 0, i16 783, i16 783, i16 0, ptr @SUB_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08FMNPCPAE@SUB_SINT?$AA@", i16 38, i8 0, i16 260, i16 260, i16 0, ptr @SUB_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08IOBPGEJG@SUB_DINT?$AA@", i16 38, i8 0, i16 262, i16 262, i16 0, ptr @SUB_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07IKIFMOPD@SUB_INT?$AA@", i16 38, i8 0, i16 261, i16 261, i16 0, ptr @SUB_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08LOGPCPFH@SUB_LINT?$AA@", i16 38, i8 0, i16 263, i16 263, i16 0, ptr @SUB_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09HLEJLKNF@SUB_UDINT?$AA@", i16 38, i8 0, i16 514, i16 514, i16 0, ptr @SUB_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08NDJPNKKE@SUB_UINT?$AA@", i16 38, i8 0, i16 513, i16 513, i16 0, ptr @SUB_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09KJIJPBEH@SUB_USINT?$AA@", i16 38, i8 0, i16 512, i16 512, i16 0, ptr @SUB_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09ELDJPBBE@SUB_ULINT?$AA@", i16 38, i8 0, i16 515, i16 515, i16 0, ptr @SUB_ULINT, i16 515 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07DFBCIIPG@SUB_T_T?$AA@", i16 38, i8 0, i16 1347, i16 1347, i16 0, ptr @SUB_T_T, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@OANMICMP@BYTE_TO_DINT?$AA@", i16 38, i8 0, i16 16, i16 0, i16 0, ptr @BYTE_TO_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@PMMPLLJG@BYTE_TO_DWORD?$AA@", i16 38, i8 0, i16 16, i16 0, i16 0, ptr @BYTE_TO_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@CCGFHAGE@BYTE_TO_INT?$AA@", i16 38, i8 0, i16 16, i16 0, i16 0, ptr @BYTE_TO_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@NAKMMJAO@BYTE_TO_LINT?$AA@", i16 38, i8 0, i16 16, i16 0, i16 0, ptr @BYTE_TO_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@DCBMMJFN@BYTE_TO_SINT?$AA@", i16 38, i8 0, i16 16, i16 0, i16 0, ptr @BYTE_TO_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@GJJAJAGD@BYTE_TO_UDINT?$AA@", i16 38, i8 0, i16 16, i16 0, i16 0, ptr @BYTE_TO_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@LNFMDMPN@BYTE_TO_UINT?$AA@", i16 38, i8 0, i16 16, i16 0, i16 0, ptr @BYTE_TO_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@LLFANLPB@BYTE_TO_USINT?$AA@", i16 38, i8 0, i16 16, i16 0, i16 0, ptr @BYTE_TO_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@LNAJHIAE@BYTE_TO_WORD?$AA@", i16 38, i8 0, i16 16, i16 0, i16 0, ptr @BYTE_TO_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@MJCONKNN@BYTE_TO_BOOL?$AA@", i16 38, i8 0, i16 16, i16 0, i16 0, ptr @BYTE_TO_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@MMONIADB@BYTE_TO_REAL?$AA@", i16 38, i8 0, i16 16, i16 0, i16 0, ptr @BYTE_TO_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@GBHIMBMO@BYTE_TO_LREAL?$AA@", i16 38, i8 0, i16 16, i16 0, i16 0, ptr @BYTE_TO_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@OPAKAFBP@BOOL_TO_BYTE?$AA@", i16 38, i8 0, i16 1536, i16 0, i16 0, ptr @BOOL_TO_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@HCDLKCJG@BOOL_TO_DINT?$AA@", i16 38, i8 0, i16 1536, i16 0, i16 0, ptr @BOOL_TO_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@OOOKLFOG@BOOL_TO_DWORD?$AA@", i16 38, i8 0, i16 1536, i16 0, i16 0, ptr @BOOL_TO_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@BHMLLCKI@BOOL_TO_INT?$AA@", i16 38, i8 0, i16 1536, i16 0, i16 0, ptr @BOOL_TO_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@ECELOJFH@BOOL_TO_LINT?$AA@", i16 38, i8 0, i16 1536, i16 0, i16 0, ptr @BOOL_TO_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@HDFNMPLO@BOOL_TO_LREAL?$AA@", i16 38, i8 0, i16 1536, i16 0, i16 0, ptr @BOOL_TO_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@FOAKKAGI@BOOL_TO_REAL?$AA@", i16 38, i8 0, i16 1536, i16 0, i16 0, ptr @BOOL_TO_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@KAPLOJAE@BOOL_TO_SINT?$AA@", i16 38, i8 0, i16 1536, i16 0, i16 0, ptr @BOOL_TO_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@HLLFJOBD@BOOL_TO_UDINT?$AA@", i16 38, i8 0, i16 1536, i16 0, i16 0, ptr @BOOL_TO_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@CPLLBMKE@BOOL_TO_UINT?$AA@", i16 38, i8 0, i16 1536, i16 0, i16 0, ptr @BOOL_TO_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@KJHFNFIB@BOOL_TO_USINT?$AA@", i16 38, i8 0, i16 1536, i16 0, i16 0, ptr @BOOL_TO_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@CPOOFIFN@BOOL_TO_WORD?$AA@", i16 38, i8 0, i16 1536, i16 0, i16 0, ptr @BOOL_TO_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@OIHDOFLF@INT_TO_BOOL?$AA@", i16 38, i8 0, i16 261, i16 0, i16 0, ptr @INT_TO_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@FMLABKCO@INT_TO_BYTE?$AA@", i16 38, i8 0, i16 261, i16 0, i16 0, ptr @INT_TO_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@LGCALGIF@INT_TO_B_BCD?$AA@", i16 38, i8 0, i16 261, i16 0, i16 0, ptr @INT_TO_B_BCD, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@GAHJFFJI@INT_TO_D_BCD?$AA@", i16 38, i8 0, i16 261, i16 0, i16 0, ptr @INT_TO_D_BCD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@OFDLCFKN@INT_TO_W_BCD?$AA@", i16 38, i8 0, i16 261, i16 0, i16 0, ptr @INT_TO_W_BCD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@MBIBLNKH@INT_TO_DINT?$AA@", i16 38, i8 0, i16 261, i16 0, i16 0, ptr @INT_TO_DINT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@JMFEEHGM@INT_TO_WORD?$AA@", i16 38, i8 0, i16 261, i16 0, i16 0, ptr @INT_TO_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@LPIHAPMD@INT_TO_DWORD?$AA@", i16 38, i8 0, i16 261, i16 0, i16 0, ptr @INT_TO_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@PBPBPGGG@INT_TO_LINT?$AA@", i16 38, i8 0, i16 261, i16 0, i16 0, ptr @INT_TO_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@CCDAHFJL@INT_TO_LREAL?$AA@", i16 38, i8 0, i16 261, i16 0, i16 0, ptr @INT_TO_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@ONLALPFJ@INT_TO_REAL?$AA@", i16 38, i8 0, i16 261, i16 0, i16 0, ptr @INT_TO_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@BDEBPGDF@INT_TO_SINT?$AA@", i16 38, i8 0, i16 261, i16 0, i16 0, ptr @INT_TO_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@CKNICEDG@INT_TO_UDINT?$AA@", i16 38, i8 0, i16 261, i16 0, i16 0, ptr @INT_TO_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@JMABADJF@INT_TO_UINT?$AA@", i16 38, i8 0, i16 261, i16 0, i16 0, ptr @INT_TO_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@PIBIGPKE@INT_TO_USINT?$AA@", i16 38, i8 0, i16 261, i16 0, i16 0, ptr @INT_TO_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@HIGKLLPG@B_BCD_TO_DINT?$AA@", i16 38, i8 0, i16 16, i16 0, i16 0, ptr @B_BCD_TO_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@EGHMPFCG@B_BCD_TO_INT?$AA@", i16 38, i8 0, i16 16, i16 0, i16 0, ptr @B_BCD_TO_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@EIBKPADH@B_BCD_TO_LINT?$AA@", i16 38, i8 0, i16 16, i16 0, i16 0, ptr @B_BCD_TO_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@KKKKPAGE@B_BCD_TO_SINT?$AA@", i16 38, i8 0, i16 16, i16 0, i16 0, ptr @B_BCD_TO_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@FMCJNFEG@BCD_TO_DINT?$AA@", i16 38, i8 0, i16 16, i16 0, i16 0, ptr @BCD_TO_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@IAKIPAEA@D_BCD_TO_DINT?$AA@", i16 38, i8 0, i16 18, i16 0, i16 0, ptr @D_BCD_TO_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@OGJJCKPL@D_BCD_TO_INT?$AA@", i16 38, i8 0, i16 18, i16 0, i16 0, ptr @D_BCD_TO_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@LANILLIB@D_BCD_TO_LINT?$AA@", i16 38, i8 0, i16 18, i16 0, i16 0, ptr @D_BCD_TO_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@FCGILLNC@D_BCD_TO_SINT?$AA@", i16 38, i8 0, i16 18, i16 0, i16 0, ptr @D_BCD_TO_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@JKHLOJPH@W_BCD_TO_DINT?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @W_BCD_TO_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@OPFEOAOP@W_BCD_TO_INT?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @W_BCD_TO_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@KKALKCDG@W_BCD_TO_LINT?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @W_BCD_TO_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@EILLKCGF@W_BCD_TO_SINT?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @W_BCD_TO_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@DAPKPBCK@DINT_TO_B_BCD?$AA@", i16 38, i8 0, i16 262, i16 0, i16 0, ptr @DINT_TO_B_BCD, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@HNICFAFP@DINT_TO_BCD?$AA@", i16 38, i8 0, i16 262, i16 0, i16 0, ptr @DINT_TO_BCD, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@OBOGJOGF@DINT_TO_BOOL?$AA@", i16 38, i8 0, i16 262, i16 0, i16 0, ptr @DINT_TO_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@FFCFGBPO@DINT_TO_BYTE?$AA@", i16 38, i8 0, i16 262, i16 0, i16 0, ptr @DINT_TO_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@OGKDBCDH@DINT_TO_D_BCD?$AA@", i16 38, i8 0, i16 262, i16 0, i16 0, ptr @DINT_TO_D_BCD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@DJFNEIGM@DINT_TO_DWORD?$AA@", i16 38, i8 0, i16 262, i16 0, i16 0, ptr @DINT_TO_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@OIJJFGFM@DINT_TO_INT?$AA@", i16 38, i8 0, i16 262, i16 0, i16 0, ptr @DINT_TO_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@PIGEINLG@DINT_TO_LINT?$AA@", i16 38, i8 0, i16 262, i16 0, i16 0, ptr @DINT_TO_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@KEOKDCDE@DINT_TO_LREAL?$AA@", i16 38, i8 0, i16 262, i16 0, i16 0, ptr @DINT_TO_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@OECFMEIJ@DINT_TO_REAL?$AA@", i16 38, i8 0, i16 262, i16 0, i16 0, ptr @DINT_TO_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@BKNEINOF@DINT_TO_SINT?$AA@", i16 38, i8 0, i16 262, i16 0, i16 0, ptr @DINT_TO_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@PJGLMMLM@DINT_TO_TIME?$AA@", i16 38, i8 0, i16 262, i16 0, i16 0, ptr @DINT_TO_TIME, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@KMACGDJJ@DINT_TO_UDINT?$AA@", i16 38, i8 0, i16 262, i16 0, i16 0, ptr @DINT_TO_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@HOMCCIAL@DINT_TO_USINT?$AA@", i16 38, i8 0, i16 262, i16 0, i16 0, ptr @DINT_TO_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@GDOBGCAC@DINT_TO_W_BCD?$AA@", i16 38, i8 0, i16 262, i16 0, i16 0, ptr @DINT_TO_W_BCD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@JFJEHIEF@DINT_TO_UINT?$AA@", i16 38, i8 0, i16 262, i16 0, i16 0, ptr @DINT_TO_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@JFMBDMLM@DINT_TO_WORD?$AA@", i16 38, i8 0, i16 262, i16 0, i16 0, ptr @DINT_TO_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@OCAMMGKA@LREAL_TO_BOOL?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @LREAL_TO_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@FGMPDJDL@LREAL_TO_BYTE?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @LREAL_TO_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@MLPOJOLC@LREAL_TO_DINT?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @LREAL_TO_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@NCFAJEAL@LREAL_TO_DWORD?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @LREAL_TO_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@LECDJPNO@LREAL_TO_INT?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @LREAL_TO_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@PLIONFHD@LREAL_TO_LINT?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @LREAL_TO_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@OHMPJMEM@LREAL_TO_REAL?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @LREAL_TO_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@BJDONFCA@LREAL_TO_SINT?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @LREAL_TO_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@EHAPLPPO@LREAL_TO_UDINT?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @LREAL_TO_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@JGHOCAIA@LREAL_TO_UINT?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @LREAL_TO_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@JFMPPEGM@LREAL_TO_USINT?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @LREAL_TO_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@JGCLGEHJ@LREAL_TO_WORD?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @LREAL_TO_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@FHIPJPDJ@REAL_TO_BOOL?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @REAL_TO_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@ODEMGAKC@REAL_TO_BYTE?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @REAL_TO_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@HOHNMHCL@REAL_TO_DINT?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @REAL_TO_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@FLDGDMLC@REAL_TO_DWORD?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @REAL_TO_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@OHLFDHGD@REAL_TO_INT?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @REAL_TO_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@EOANIMOK@REAL_TO_LINT?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @REAL_TO_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@MGIBEGOK@REAL_TO_LREAL?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @REAL_TO_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@KMLNIMLJ@REAL_TO_SINT?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @REAL_TO_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@MOGJBHEH@REAL_TO_UDINT?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @REAL_TO_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@CDPNHJBJ@REAL_TO_UINT?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @REAL_TO_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@BMKJFMNF@REAL_TO_USINT?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @REAL_TO_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@CDKIDNOA@REAL_TO_WORD?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @REAL_TO_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@CIOGBNK@DWORD_TO_BOOL?$AA@", i16 38, i8 0, i16 18, i16 0, i16 0, ptr @DWORD_TO_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@LGENJOEB@DWORD_TO_BYTE?$AA@", i16 38, i8 0, i16 18, i16 0, i16 0, ptr @DWORD_TO_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@CLHMDJMI@DWORD_TO_DINT?$AA@", i16 38, i8 0, i16 18, i16 0, i16 0, ptr @DWORD_TO_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@ODGNPLNE@DWORD_TO_INT?$AA@", i16 38, i8 0, i16 18, i16 0, i16 0, ptr @DWORD_TO_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@BLAMHCAJ@DWORD_TO_LINT?$AA@", i16 38, i8 0, i16 18, i16 0, i16 0, ptr @DWORD_TO_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@PPNHPENG@DWORD_TO_LREAL?$AA@", i16 38, i8 0, i16 18, i16 0, i16 0, ptr @DWORD_TO_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@HENDLDG@DWORD_TO_REAL?$AA@", i16 38, i8 0, i16 18, i16 0, i16 0, ptr @DWORD_TO_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@PJLMHCFK@DWORD_TO_SINT?$AA@", i16 38, i8 0, i16 18, i16 0, i16 0, ptr @DWORD_TO_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@PHDPKFHL@DWORD_TO_UDINT?$AA@", i16 38, i8 0, i16 18, i16 0, i16 0, ptr @DWORD_TO_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@HGPMIHPK@DWORD_TO_UINT?$AA@", i16 38, i8 0, i16 18, i16 0, i16 0, ptr @DWORD_TO_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@CFPPOOOJ@DWORD_TO_USINT?$AA@", i16 38, i8 0, i16 18, i16 0, i16 0, ptr @DWORD_TO_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@HGKJMDAD@DWORD_TO_WORD?$AA@", i16 38, i8 0, i16 18, i16 0, i16 0, ptr @DWORD_TO_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@DKDOPBM@LINT_TO_B_BCD?$AA@", i16 38, i8 0, i16 263, i16 0, i16 0, ptr @LINT_TO_B_BCD, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@LLOFENAI@LINT_TO_BOOL?$AA@", i16 38, i8 0, i16 263, i16 0, i16 0, ptr @LINT_TO_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@PCGLCJD@LINT_TO_BYTE?$AA@", i16 38, i8 0, i16 263, i16 0, i16 0, ptr @LINT_TO_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@NFPKAMAB@LINT_TO_D_BCD?$AA@", i16 38, i8 0, i16 263, i16 0, i16 0, ptr @LINT_TO_D_BCD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@JCBHBFBK@LINT_TO_DINT?$AA@", i16 38, i8 0, i16 263, i16 0, i16 0, ptr @LINT_TO_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@KAEFGFK@LINT_TO_DWORD?$AA@", i16 38, i8 0, i16 263, i16 0, i16 0, ptr @LINT_TO_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@OOJFCAKC@LINT_TO_INT?$AA@", i16 38, i8 0, i16 263, i16 0, i16 0, ptr @LINT_TO_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@JHLDCMAC@LINT_TO_LREAL?$AA@", i16 38, i8 0, i16 263, i16 0, i16 0, ptr @LINT_TO_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@LOCGBHOE@LINT_TO_REAL?$AA@", i16 38, i8 0, i16 263, i16 0, i16 0, ptr @LINT_TO_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@EANHFOII@LINT_TO_SINT?$AA@", i16 38, i8 0, i16 263, i16 0, i16 0, ptr @LINT_TO_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@JPFLHNKP@LINT_TO_UDINT?$AA@", i16 38, i8 0, i16 263, i16 0, i16 0, ptr @LINT_TO_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@MPJHKLCI@LINT_TO_UINT?$AA@", i16 38, i8 0, i16 263, i16 0, i16 0, ptr @LINT_TO_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@ENJLDGDN@LINT_TO_USINT?$AA@", i16 38, i8 0, i16 263, i16 0, i16 0, ptr @LINT_TO_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@FALIHMDE@LINT_TO_W_BCD?$AA@", i16 38, i8 0, i16 263, i16 0, i16 0, ptr @LINT_TO_W_BCD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@MPMCOPNB@LINT_TO_WORD?$AA@", i16 38, i8 0, i16 263, i16 0, i16 0, ptr @LINT_TO_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@DDIFGHIG@SINT_TO_B_BCD?$AA@", i16 38, i8 0, i16 260, i16 0, i16 0, ptr @SINT_TO_B_BCD, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@CIJCDOOH@SINT_TO_BOOL?$AA@", i16 38, i8 0, i16 260, i16 0, i16 0, ptr @SINT_TO_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@JMFBMBHM@SINT_TO_BYTE?$AA@", i16 38, i8 0, i16 260, i16 0, i16 0, ptr @SINT_TO_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@OFNMIEJL@SINT_TO_D_BCD?$AA@", i16 38, i8 0, i16 260, i16 0, i16 0, ptr @SINT_TO_D_BCD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@BGAGGPF@SINT_TO_DINT?$AA@", i16 38, i8 0, i16 260, i16 0, i16 0, ptr @SINT_TO_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@DKCCNOMA@SINT_TO_DWORD?$AA@", i16 38, i8 0, i16 260, i16 0, i16 0, ptr @SINT_TO_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@JABJFCCP@SINT_TO_INT?$AA@", i16 38, i8 0, i16 260, i16 0, i16 0, ptr @SINT_TO_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@DBBACNDE@SINT_TO_LINT?$AA@", i16 38, i8 0, i16 260, i16 0, i16 0, ptr @SINT_TO_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@KHJFKEJI@SINT_TO_LREAL?$AA@", i16 38, i8 0, i16 260, i16 0, i16 0, ptr @SINT_TO_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@CNFBGEAL@SINT_TO_REAL?$AA@", i16 38, i8 0, i16 260, i16 0, i16 0, ptr @SINT_TO_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@KPHNPFDF@SINT_TO_UDINT?$AA@", i16 38, i8 0, i16 260, i16 0, i16 0, ptr @SINT_TO_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@FMOANIMH@SINT_TO_UINT?$AA@", i16 38, i8 0, i16 260, i16 0, i16 0, ptr @SINT_TO_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@HNLNLOKH@SINT_TO_USINT?$AA@", i16 38, i8 0, i16 260, i16 0, i16 0, ptr @SINT_TO_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@GAJOPEKO@SINT_TO_W_BCD?$AA@", i16 38, i8 0, i16 260, i16 0, i16 0, ptr @SINT_TO_W_BCD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@FMLFJMDO@SINT_TO_WORD?$AA@", i16 38, i8 0, i16 260, i16 0, i16 0, ptr @SINT_TO_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@JMIBAENA@UDINT_TO_BOOL?$AA@", i16 38, i8 0, i16 514, i16 0, i16 0, ptr @UDINT_TO_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@CIECPLEL@UDINT_TO_BYTE?$AA@", i16 38, i8 0, i16 514, i16 0, i16 0, ptr @UDINT_TO_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@LFHDFMMC@UDINT_TO_DINT?$AA@", i16 38, i8 0, i16 514, i16 0, i16 0, ptr @UDINT_TO_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@IIJNFCND@UDINT_TO_INT?$AA@", i16 38, i8 0, i16 514, i16 0, i16 0, ptr @UDINT_TO_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@IFADBHAD@UDINT_TO_LINT?$AA@", i16 38, i8 0, i16 514, i16 0, i16 0, ptr @UDINT_TO_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@BPJMBCKN@UDINT_TO_LREAL?$AA@", i16 38, i8 0, i16 514, i16 0, i16 0, ptr @UDINT_TO_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@JJECFODM@UDINT_TO_REAL?$AA@", i16 38, i8 0, i16 514, i16 0, i16 0, ptr @UDINT_TO_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@GHLDBHFA@UDINT_TO_SINT?$AA@", i16 38, i8 0, i16 514, i16 0, i16 0, ptr @UDINT_TO_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@OIPDOCPA@UDINT_TO_UINT?$AA@", i16 38, i8 0, i16 514, i16 0, i16 0, ptr @UDINT_TO_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@MFLEAIJC@UDINT_TO_USINT?$AA@", i16 38, i8 0, i16 514, i16 0, i16 0, ptr @UDINT_TO_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@OIKGKGAJ@UDINT_TO_WORD?$AA@", i16 38, i8 0, i16 514, i16 0, i16 0, ptr @UDINT_TO_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@ICCLGIPF@UDINT_TO_DWORD?$AA@", i16 38, i8 0, i16 514, i16 0, i16 0, ptr @UDINT_TO_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@IIHHOBDK@UINT_TO_BOOL?$AA@", i16 38, i8 0, i16 513, i16 0, i16 0, ptr @UINT_TO_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@DMLEBOKB@UINT_TO_BYTE?$AA@", i16 38, i8 0, i16 513, i16 0, i16 0, ptr @UINT_TO_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@KBIFLJCI@UINT_TO_DINT?$AA@", i16 38, i8 0, i16 513, i16 0, i16 0, ptr @UINT_TO_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@HPCEPHMP@UINT_TO_INT?$AA@", i16 38, i8 0, i16 513, i16 0, i16 0, ptr @UINT_TO_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@JBPFPCOJ@UINT_TO_LINT?$AA@", i16 38, i8 0, i16 513, i16 0, i16 0, ptr @UINT_TO_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@FPFHOPCO@UINT_TO_LREAL?$AA@", i16 38, i8 0, i16 513, i16 0, i16 0, ptr @UINT_TO_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@INLELLNG@UINT_TO_REAL?$AA@", i16 38, i8 0, i16 513, i16 0, i16 0, ptr @UINT_TO_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@HDEFPCLK@UINT_TO_SINT?$AA@", i16 38, i8 0, i16 513, i16 0, i16 0, ptr @UINT_TO_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@FHLPLOID@UINT_TO_UDINT?$AA@", i16 38, i8 0, i16 513, i16 0, i16 0, ptr @UINT_TO_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@IFHPPFBB@UINT_TO_USINT?$AA@", i16 38, i8 0, i16 513, i16 0, i16 0, ptr @UINT_TO_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@PMFAEDOD@UINT_TO_WORD?$AA@", i16 38, i8 0, i16 513, i16 0, i16 0, ptr @UINT_TO_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@MCOAJFHG@UINT_TO_DWORD?$AA@", i16 38, i8 0, i16 513, i16 0, i16 0, ptr @UINT_TO_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@FFPFKEFC@USINT_TO_BOOL?$AA@", i16 38, i8 0, i16 512, i16 0, i16 0, ptr @USINT_TO_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@OBDGFLMJ@USINT_TO_BYTE?$AA@", i16 38, i8 0, i16 512, i16 0, i16 0, ptr @USINT_TO_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@HMAHPMEA@USINT_TO_DINT?$AA@", i16 38, i8 0, i16 512, i16 0, i16 0, ptr @USINT_TO_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@IBFEPOFJ@USINT_TO_DWORD?$AA@", i16 38, i8 0, i16 512, i16 0, i16 0, ptr @USINT_TO_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@PABNFGKA@USINT_TO_INT?$AA@", i16 38, i8 0, i16 512, i16 0, i16 0, ptr @USINT_TO_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@EMHHLHIB@USINT_TO_LINT?$AA@", i16 38, i8 0, i16 512, i16 0, i16 0, ptr @USINT_TO_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@BMODIEAB@USINT_TO_LREAL?$AA@", i16 38, i8 0, i16 512, i16 0, i16 0, ptr @USINT_TO_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@FADGPOLO@USINT_TO_REAL?$AA@", i16 38, i8 0, i16 512, i16 0, i16 0, ptr @USINT_TO_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@KOMHLHNC@USINT_TO_SINT?$AA@", i16 38, i8 0, i16 512, i16 0, i16 0, ptr @USINT_TO_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@BEALNFKM@USINT_TO_UDINT?$AA@", i16 38, i8 0, i16 512, i16 0, i16 0, ptr @USINT_TO_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@CBIHECHC@USINT_TO_UINT?$AA@", i16 38, i8 0, i16 512, i16 0, i16 0, ptr @USINT_TO_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@CBNCAGIL@USINT_TO_WORD?$AA@", i16 38, i8 0, i16 512, i16 0, i16 0, ptr @USINT_TO_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@IEFECGHF@WORD_TO_BOOL?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @WORD_TO_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@DAJHNJOO@WORD_TO_BYTE?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @WORD_TO_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@KNKGHOGH@WORD_TO_DINT?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @WORD_TO_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@CEIPOKLA@WORD_TO_DWORD?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @WORD_TO_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@OKPIIAAE@WORD_TO_INT?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @WORD_TO_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@JNNGDFKG@WORD_TO_LINT?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @WORD_TO_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@LJDIJAOI@WORD_TO_LREAL?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @WORD_TO_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@IBJHHMJJ@WORD_TO_REAL?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @WORD_TO_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@HPGGDFPF@WORD_TO_SINT?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @WORD_TO_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@LBNAMBEF@WORD_TO_UDINT?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @WORD_TO_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@PACGMAFF@WORD_TO_UINT?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @WORD_TO_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@GDBAIKNH@WORD_TO_USINT?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @WORD_TO_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0L@FAGLCNNG@TRUNC_SINT?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @TRUNC_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09IIJMCEDI@TRUNC_INT?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @TRUNC_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0L@ICKLGGEE@TRUNC_DINT?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @TRUNC_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0L@LCNLCNIF@TRUNC_LINT?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @TRUNC_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@CNJNOMHK@TIME_TO_DINT?$AA@", i16 38, i8 0, i16 1347, i16 0, i16 0, ptr @TIME_TO_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03BDACDFHA@AND?$AA@", i16 38, i8 0, i16 -32766, i16 -32766, i16 0, ptr @AND, i16 -32766 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08GHNKEODE@AND_BOOL?$AA@", i16 38, i8 0, i16 1536, i16 1536, i16 0, ptr @AND_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08NDBJLBKP@AND_BYTE?$AA@", i16 38, i8 0, i16 16, i16 16, i16 0, ptr @AND_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08BDPNOMON@AND_WORD?$AA@", i16 38, i8 0, i16 17, i16 17, i16 0, ptr @AND_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09CFLHBFNO@AND_DWORD?$AA@", i16 38, i8 0, i16 18, i16 18, i16 0, ptr @AND_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_04DOOMBBIC@ANDN?$AA@", i16 38, i8 0, i16 -32766, i16 -32766, i16 0, ptr @ANDN, i16 -32766 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09PJCINCCF@ANDN_BOOL?$AA@", i16 38, i8 0, i16 1536, i16 1536, i16 0, ptr @ANDN_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09ENOLCNLO@ANDN_BYTE?$AA@", i16 38, i8 0, i16 16, i16 16, i16 0, ptr @ANDN_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09INAPHAPM@ANDN_WORD?$AA@", i16 38, i8 0, i16 17, i16 17, i16 0, ptr @ANDN_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0L@EPJJMHLA@ANDN_DWORD?$AA@", i16 38, i8 0, i16 18, i16 18, i16 0, ptr @ANDN_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03GBFNEA@NOT?$AA@", i16 38, i8 0, i16 -32766, i16 0, i16 0, ptr @NOT, i16 -32766 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08BDBHBNLF@NOT_BOOL?$AA@", i16 38, i8 0, i16 1536, i16 0, i16 0, ptr @NOT_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08KHNEOCCO@NOT_BYTE?$AA@", i16 38, i8 0, i16 16, i16 0, i16 0, ptr @NOT_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08GHDALPGM@NOT_WORD?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @NOT_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09LPHMGLDL@NOT_DWORD?$AA@", i16 38, i8 0, i16 18, i16 0, i16 0, ptr @NOT_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_02PDPFNDMG@OR?$AA@", i16 38, i8 0, i16 -32766, i16 -32766, i16 0, ptr @OR, i16 -32766 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07OFLMDLNN@OR_BOOL?$AA@", i16 38, i8 0, i16 1536, i16 1536, i16 0, ptr @OR_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07FBHPMEEG@OR_BYTE?$AA@", i16 38, i8 0, i16 16, i16 16, i16 0, ptr @OR_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07JBJLJJAE@OR_WORD?$AA@", i16 38, i8 0, i16 17, i16 17, i16 0, ptr @OR_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08PMODCJHH@OR_DWORD?$AA@", i16 38, i8 0, i16 18, i16 18, i16 0, ptr @OR_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03BMAOPANN@ORN?$AA@", i16 38, i8 0, i16 -32766, i16 -32766, i16 0, ptr @ORN, i16 -32766 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08CAHMOOIM@ORN_BOOL?$AA@", i16 38, i8 0, i16 1536, i16 1536, i16 0, ptr @ORN_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08JELPBBBH@ORN_BYTE?$AA@", i16 38, i8 0, i16 16, i16 16, i16 0, ptr @ORN_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08FEFLEMFF@ORN_WORD?$AA@", i16 38, i8 0, i16 17, i16 17, i16 0, ptr @ORN_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09OAEKIIMA@ORN_DWORD?$AA@", i16 38, i8 0, i16 18, i16 18, i16 0, ptr @ORN_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03CDEJPCIF@XOR?$AA@", i16 38, i8 0, i16 -32766, i16 -32766, i16 0, ptr @XOR, i16 -32766 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08KPBNBDHE@XOR_BOOL?$AA@", i16 38, i8 0, i16 1536, i16 1536, i16 0, ptr @XOR_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08BLNOOMOP@XOR_BYTE?$AA@", i16 38, i8 0, i16 16, i16 16, i16 0, ptr @XOR_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08NLDKLBKN@XOR_WORD?$AA@", i16 38, i8 0, i16 17, i16 17, i16 0, ptr @XOR_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09FDKDJDBD@XOR_DWORD?$AA@", i16 38, i8 0, i16 18, i16 18, i16 0, ptr @XOR_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_04PDALFMNG@XORN?$AA@", i16 38, i8 0, i16 -32766, i16 -32766, i16 0, ptr @XORN, i16 -32766 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09IPDMFEOI@XORN_BOOL?$AA@", i16 38, i8 0, i16 1536, i16 1536, i16 0, ptr @XORN_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09DLPPKLHD@XORN_BYTE?$AA@", i16 38, i8 0, i16 16, i16 16, i16 0, ptr @XORN_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09PLBLPGDB@XORN_WORD?$AA@", i16 38, i8 0, i16 17, i16 17, i16 0, ptr @XORN_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0L@KKDKGNDL@XORN_DWORD?$AA@", i16 38, i8 0, i16 18, i16 18, i16 0, ptr @XORN_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03JILFCNDO@ROL?$AA@", i16 38, i8 0, i16 -32766, i16 -32761, i16 0, ptr @ROL, i16 -32766 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08LJBBIBOC@ROL_BYTE?$AA@", i16 38, i8 0, i16 16, i16 261, i16 0, ptr @ROL_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08HJPFNMKA@ROL_WORD?$AA@", i16 38, i8 0, i16 17, i16 261, i16 0, ptr @ROL_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09CNLACAMD@ROL_DWORD?$AA@", i16 38, i8 0, i16 18, i16 261, i16 0, ptr @ROL_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03EMPEBCOB@ROR?$AA@", i16 38, i8 0, i16 -32766, i16 -32761, i16 0, ptr @ROR, i16 -32766 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08IOPAGGHB@ROR_BYTE?$AA@", i16 38, i8 0, i16 16, i16 261, i16 0, ptr @ROR_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08EOBEDLDD@ROR_WORD?$AA@", i16 38, i8 0, i16 17, i16 261, i16 0, ptr @ROR_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09EEIBADNK@ROR_DWORD?$AA@", i16 38, i8 0, i16 18, i16 261, i16 0, ptr @ROR_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03CFEGFMNO@SHL?$AA@", i16 38, i8 0, i16 -32766, i16 -32761, i16 0, ptr @SHL, i16 -32766 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08KEKPJMLI@SHL_BYTE?$AA@", i16 38, i8 0, i16 16, i16 261, i16 0, ptr @SHL_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08GEELMBPK@SHL_WORD?$AA@", i16 38, i8 0, i16 17, i16 261, i16 0, ptr @SHL_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09KGBDCGDE@SHL_DWORD?$AA@", i16 38, i8 0, i16 18, i16 261, i16 0, ptr @SHL_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03PBAHGDAB@SHR?$AA@", i16 38, i8 0, i16 -32766, i16 -32761, i16 0, ptr @SHR, i16 -32766 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08JDEOHLCL@SHR_BYTE?$AA@", i16 38, i8 0, i16 16, i16 261, i16 0, ptr @SHR_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08FDKKCGGJ@SHR_WORD?$AA@", i16 38, i8 0, i16 17, i16 261, i16 0, ptr @SHR_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09MPCCAFCN@SHR_DWORD?$AA@", i16 38, i8 0, i16 18, i16 261, i16 0, ptr @SHR_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_06FLHFNFBE@SIZEOF?$AA@", i16 38, i8 0, i16 -32767, i16 0, i16 0, ptr @SIZEOF, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@HDFBCJPA@LOWER_BOUND?$AA@", i16 38, i8 0, i16 -32767, i16 262, i16 0, ptr @LOWER_BOUND, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03BPJLEIIC@ABS?$AA@", i16 38, i8 0, i16 -32765, i16 0, i16 0, ptr @ABS, i16 -32765 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08GJDOOKLL@ABS_SINT?$AA@", i16 38, i8 0, i16 260, i16 0, i16 0, ptr @ABS_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07NOOIILNL@ABS_INT?$AA@", i16 38, i8 0, i16 261, i16 0, i16 0, ptr @ABS_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08LLPOKBCJ@ABS_DINT?$AA@", i16 38, i8 0, i16 262, i16 0, i16 0, ptr @ABS_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08ILIOOKOI@ABS_LINT?$AA@", i16 38, i8 0, i16 263, i16 0, i16 0, ptr @ABS_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09PCGCLOJP@ABS_USINT?$AA@", i16 38, i8 0, i16 512, i16 0, i16 0, ptr @ABS_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08OGHOBPBL@ABS_UINT?$AA@", i16 38, i8 0, i16 513, i16 0, i16 0, ptr @ABS_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09CAKCPFAN@ABS_UDINT?$AA@", i16 38, i8 0, i16 514, i16 0, i16 0, ptr @ABS_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09BANCLOMM@ABS_ULINT?$AA@", i16 38, i8 0, i16 515, i16 0, i16 0, ptr @ABS_ULINT, i16 515 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08JHMPKDNH@ABS_REAL?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @ABS_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09CIEKKEKA@ABS_LREAL?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @ABS_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08IKIBKLOC@ABS_TIME?$AA@", i16 38, i8 0, i16 1347, i16 0, i16 0, ptr @ABS_TIME, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_04DPLPEKKC@ACOS?$AA@", i16 38, i8 0, i16 -32760, i16 0, i16 0, ptr @ACOS, i16 -32760 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09FGMHIOMG@ACOS_REAL?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @ACOS_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0L@ECDLIMHP@ACOS_LREAL?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @ACOS_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_04JEEHANJD@ASIN?$AA@", i16 38, i8 0, i16 -32760, i16 0, i16 0, ptr @ASIN, i16 -32760 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09DKGBDIDO@ASIN_REAL?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @ASIN_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0L@PBDBFAOH@ASIN_LREAL?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @ASIN_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_04HIDGEJC@ATAN?$AA@", i16 38, i8 0, i16 -32760, i16 0, i16 0, ptr @ATAN, i16 -32760 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09INOFEOEC@ATAN_REAL?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @ATAN_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0L@KIDFOJIG@ATAN_LREAL?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @ATAN_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03LNEKBDFK@COS?$AA@", i16 38, i8 0, i16 -32760, i16 0, i16 0, ptr @COS, i16 -32760 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08CCDMJOIA@COS_REAL?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @COS_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09NNPAJDMK@COS_LREAL?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @COS_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03BGLCFEGL@SIN?$AA@", i16 38, i8 0, i16 -32760, i16 0, i16 0, ptr @SIN, i16 -32760 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08EOJKCIHI@SIN_REAL?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @SIN_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09GOPKEPFC@SIN_LREAL?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @SIN_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03IFHGDNGK@TAN?$AA@", i16 38, i8 0, i16 -32760, i16 0, i16 0, ptr @TAN, i16 -32760 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08PJBOFOAE@TAN_REAL?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @TAN_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09DHPOPGDD@TAN_LREAL?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @TAN_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03KKGFKKLA@EXP?$AA@", i16 38, i8 0, i16 -32760, i16 0, i16 0, ptr @EXP, i16 -32760 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08BGLAMFKF@EXP_REAL?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @EXP_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09JGMAMLNG@EXP_LREAL?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @EXP_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_02BHMEDAMC@LN?$AA@", i16 38, i8 0, i16 -32760, i16 0, i16 0, ptr @LN, i16 -32760 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07MOIOJAGI@LN_REAL?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @LN_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08HDMNELIO@LN_LREAL?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @LN_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03MLIHNEFJ@LOG?$AA@", i16 38, i8 0, i16 -32760, i16 0, i16 0, ptr @LOG, i16 -32760 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08GOBEOJIM@LOG_REAL?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @LOG_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09NEAKPHJG@LOG_LREAL?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @LOG_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_04IEDALHLA@SQRT?$AA@", i16 38, i8 0, i16 -32760, i16 0, i16 0, ptr @SQRT, i16 -32760 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09NFLDKPJA@SQRT_REAL?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @SQRT_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0L@MALAAMJP@SQRT_LREAL?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @SQRT_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@JALKPGJN@BYTE_TO_STRING?$AA@", i16 38, i8 0, i16 16, i16 0, i16 0, ptr @BYTE_TO_STRING, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@ECGPDDDB@WORD_TO_STRING?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @WORD_TO_STRING, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0BA@IDEIMBPO@DWORD_TO_STRING?$AA@", i16 38, i8 0, i16 18, i16 0, i16 0, ptr @DWORD_TO_STRING, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@BCHEOPDJ@SINT_TO_STRING?$AA@", i16 38, i8 0, i16 260, i16 0, i16 0, ptr @SINT_TO_STRING, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@ILPIBLFC@INT_TO_STRING?$AA@", i16 38, i8 0, i16 261, i16 0, i16 0, ptr @INT_TO_STRING, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@MNBHHPGM@DINT_TO_STRING?$AA@", i16 38, i8 0, i16 262, i16 0, i16 0, ptr @DINT_TO_STRING, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@CJOLDOL@LINT_TO_STRING?$AA@", i16 38, i8 0, i16 263, i16 0, i16 0, ptr @LINT_TO_STRING, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0BA@JLBMLCPJ@USINT_TO_STRING?$AA@", i16 38, i8 0, i16 512, i16 0, i16 0, ptr @USINT_TO_STRING, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@DAIODLML@UINT_TO_STRING?$AA@", i16 38, i8 0, i16 513, i16 0, i16 0, ptr @UINT_TO_STRING, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0BA@EEHPCCKM@UDINT_TO_STRING?$AA@", i16 38, i8 0, i16 514, i16 0, i16 0, ptr @UDINT_TO_STRING, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@KDACCNHO@TIME_TO_STRING?$AA@", i16 38, i8 0, i16 1347, i16 0, i16 0, ptr @TIME_TO_STRING, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@KMBOOLML@REAL_TO_STRING?$AA@", i16 38, i8 0, i16 782, i16 0, i16 0, ptr @REAL_TO_STRING, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0BA@BOCKIGEL@LREAL_TO_STRING?$AA@", i16 38, i8 0, i16 783, i16 0, i16 0, ptr @LREAL_TO_STRING, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@PELKKNLK@STRING_TO_BYTE?$AA@", i16 38, i8 0, i16 1346, i16 0, i16 0, ptr @STRING_TO_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@DEFOPAPI@STRING_TO_WORD?$AA@", i16 38, i8 0, i16 1346, i16 0, i16 0, ptr @STRING_TO_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0BA@EIENFCCJ@STRING_TO_DWORD?$AA@", i16 38, i8 0, i16 1346, i16 0, i16 0, ptr @STRING_TO_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@LLELEBKB@STRING_TO_SINT?$AA@", i16 38, i8 0, i16 1346, i16 0, i16 0, ptr @STRING_TO_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@KGMGGMPN@STRING_TO_INT?$AA@", i16 38, i8 0, i16 1346, i16 0, i16 0, ptr @STRING_TO_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@GJILAKDD@STRING_TO_DINT?$AA@", i16 38, i8 0, i16 1346, i16 0, i16 0, ptr @STRING_TO_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@FJPLEBPC@STRING_TO_LINT?$AA@", i16 38, i8 0, i16 1346, i16 0, i16 0, ptr @STRING_TO_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0BA@PNCDCEO@STRING_TO_USINT?$AA@", i16 38, i8 0, i16 1346, i16 0, i16 0, ptr @STRING_TO_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@DEALLEAB@STRING_TO_UINT?$AA@", i16 38, i8 0, i16 1346, i16 0, i16 0, ptr @STRING_TO_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0BA@NNBCHJNM@STRING_TO_UDINT?$AA@", i16 38, i8 0, i16 1346, i16 0, i16 0, ptr @STRING_TO_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@FIPEAAPI@STRING_TO_TIME?$AA@", i16 38, i8 0, i16 1346, i16 0, i16 0, ptr @STRING_TO_TIME, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@EFLKAIMN@STRING_TO_REAL?$AA@", i16 38, i8 0, i16 1346, i16 0, i16 0, ptr @STRING_TO_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0BA@NFPKCIHB@STRING_TO_LREAL?$AA@", i16 38, i8 0, i16 1346, i16 0, i16 0, ptr @STRING_TO_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_06CIJDJJIA@CONCAT?$AA@", i16 38, i8 0, i16 1346, i16 1346, i16 0, ptr @CONCAT, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_06FKDAMKFP@DELETE?$AA@", i16 38, i8 0, i16 1346, i16 -32761, i16 -32761, ptr @DELETE_STR, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_04OGGDJIHH@FIND?$AA@", i16 38, i8 0, i16 1346, i16 1346, i16 0, ptr @FIND, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_06OEMEAEKN@INSERT?$AA@", i16 38, i8 0, i16 1346, i16 1346, i16 -32761, ptr @INSERT, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07NGBKIEMN@REPLACE?$AA@", i16 38, i8 0, i16 1346, i16 1346, i16 -32761, ptr @REPLACE, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03BHNCOKMG@LEN?$AA@", i16 38, i8 0, i16 1346, i16 0, i16 0, ptr @LEN, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_04KCNEHMIH@LEFT?$AA@", i16 38, i8 0, i16 1346, i16 -32761, i16 0, ptr @LEFT, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03FMJLJMEN@MID?$AA@", i16 38, i8 0, i16 1346, i16 -32761, i16 -32761, ptr @MID, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_05PMAFOJDE@RIGHT?$AA@", i16 38, i8 0, i16 1346, i16 -32761, i16 0, ptr @RIGHT, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09GJBIKEON@EQ_STRING?$AA@", i16 38, i8 0, i16 1346, i16 1346, i16 0, ptr @EQ_STRING, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09GANEEMGH@NE_STRING?$AA@", i16 38, i8 0, i16 1346, i16 1346, i16 0, ptr @NE_STRING, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09JMMBGHKN@GE_STRING?$AA@", i16 38, i8 0, i16 1346, i16 1346, i16 0, ptr @GE_STRING, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09CHHKDBJP@GT_STRING?$AA@", i16 38, i8 0, i16 1346, i16 1346, i16 0, ptr @GT_STRING, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09GECBJMFK@LE_STRING?$AA@", i16 38, i8 0, i16 1346, i16 1346, i16 0, ptr @LE_STRING, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09NPJKMKGI@LT_STRING?$AA@", i16 38, i8 0, i16 1346, i16 1346, i16 0, ptr @LT_STRING, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_05KLKGAAIM@LIMIT?$AA@", i16 38, i8 0, i16 -32759, i16 -32759, i16 -32759, ptr @LIMIT, i16 -32759 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0L@CELEDJHH@LIMIT_SINT?$AA@", i16 38, i8 0, i16 260, i16 260, i16 0, ptr @LIMIT_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09OGFKBPLL@LIMIT_INT?$AA@", i16 38, i8 0, i16 261, i16 261, i16 0, ptr @LIMIT_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0L@PGHEHCOF@LIMIT_DINT?$AA@", i16 38, i8 0, i16 262, i16 262, i16 0, ptr @LIMIT_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0L@MGAEDJCE@LIMIT_LINT?$AA@", i16 38, i8 0, i16 263, i16 263, i16 0, ptr @LIMIT_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0L@NKEFHABL@LIMIT_REAL?$AA@", i16 38, i8 0, i16 782, i16 782, i16 0, ptr @LIMIT_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@LKNFKAOI@LIMIT_LREAL?$AA@", i16 38, i8 0, i16 783, i16 783, i16 0, ptr @LIMIT_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@ECGMNOAB@LIMIT_STRING?$AA@", i16 38, i8 0, i16 1346, i16 1346, i16 0, ptr @LIMIT_STRING, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03LEPPJAKI@MAX?$AA@", i16 38, i8 0, i16 -32759, i16 -32759, i16 0, ptr @MAX, i16 -32767 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08DICEKLG@MAX_SINT?$AA@", i16 38, i8 0, i16 260, i16 260, i16 0, ptr @MAX_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07NCGIHEMK@MAX_INT?$AA@", i16 38, i8 0, i16 261, i16 261, i16 0, ptr @MAX_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08NBECABCE@MAX_DINT?$AA@", i16 38, i8 0, i16 262, i16 262, i16 0, ptr @MAX_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08OBDCEKOF@MAX_LINT?$AA@", i16 38, i8 0, i16 263, i16 263, i16 0, ptr @MAX_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09IMLJHOIC@MAX_USINT?$AA@", i16 38, i8 0, i16 512, i16 512, i16 0, ptr @MAX_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08IMMCLPBG@MAX_UINT?$AA@", i16 38, i8 0, i16 513, i16 513, i16 0, ptr @MAX_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09FOHJDFBA@MAX_UDINT?$AA@", i16 38, i8 0, i16 514, i16 514, i16 0, ptr @MAX_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09GOAJHONB@MAX_ULINT?$AA@", i16 38, i8 0, i16 515, i16 515, i16 0, ptr @MAX_ULINT, i16 515 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08PNHDADNK@MAX_REAL?$AA@", i16 38, i8 0, i16 782, i16 782, i16 0, ptr @MAX_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09FGJBGELN@MAX_LREAL?$AA@", i16 38, i8 0, i16 783, i16 783, i16 0, ptr @MAX_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0L@FJIBDPLO@MAX_STRING?$AA@", i16 38, i8 0, i16 1346, i16 1346, i16 0, ptr @MAX_STR, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03KGHEHEMH@MIN?$AA@", i16 38, i8 0, i16 -32759, i16 -32759, i16 0, ptr @MIN, i16 -32767 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08NEGJPIPH@MIN_SINT?$AA@", i16 38, i8 0, i16 260, i16 260, i16 0, ptr @MIN_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07DEAINLCL@MIN_INT?$AA@", i16 38, i8 0, i16 261, i16 261, i16 0, ptr @MIN_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08GKJLDGF@MIN_DINT?$AA@", i16 38, i8 0, i16 262, i16 262, i16 0, ptr @MIN_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08DGNJPIKE@MIN_LINT?$AA@", i16 38, i8 0, i16 263, i16 263, i16 0, ptr @MIN_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09INLFOEDG@MIN_USINT?$AA@", i16 38, i8 0, i16 512, i16 512, i16 0, ptr @MIN_USINT, i16 512 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08FLCJANFH@MIN_UINT?$AA@", i16 38, i8 0, i16 513, i16 513, i16 0, ptr @MIN_UINT, i16 513 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09FPHFKPKE@MIN_UDINT?$AA@", i16 38, i8 0, i16 514, i16 514, i16 0, ptr @MIN_UDINT, i16 514 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09GPAFOEGF@MIN_ULINT?$AA@", i16 38, i8 0, i16 515, i16 515, i16 0, ptr @MIN_ULINT, i16 515 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08CKJILBJL@MIN_REAL?$AA@", i16 38, i8 0, i16 782, i16 782, i16 0, ptr @MIN_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09FHJNPOAJ@MIN_LREAL?$AA@", i16 38, i8 0, i16 783, i16 783, i16 0, ptr @MIN_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0L@JFIMEELB@MIN_STRING?$AA@", i16 38, i8 0, i16 1346, i16 1346, i16 0, ptr @MIN_STR, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03CNJOMPIN@SEL?$AA@", i16 38, i8 0, i16 1536, i16 -32767, i16 -32767, ptr @SEL, i16 -32767 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08HAFLGFHC@SEL_SINT?$AA@", i16 38, i8 0, i16 1536, i16 260, i16 260, ptr @SEL_SINT, i16 260 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07NHFBDDEN@SEL_INT?$AA@", i16 38, i8 0, i16 1536, i16 261, i16 261, ptr @SEL_INT, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08KCJLCOOA@SEL_DINT?$AA@", i16 38, i8 0, i16 1536, i16 262, i16 262, ptr @SEL_DINT, i16 262 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08JCOLGFCB@SEL_LINT?$AA@", i16 38, i8 0, i16 1536, i16 263, i16 263, ptr @SEL_LINT, i16 263 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08IOKKCMBO@SEL_REAL?$AA@", i16 38, i8 0, i16 1536, i16 782, i16 782, ptr @SEL_REAL, i16 782 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09MKOLLLDL@SEL_LREAL?$AA@", i16 38, i8 0, i16 1536, i16 783, i16 783, ptr @SEL_LREAL, i16 783 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0L@FNMGGDHE@SEL_STRING?$AA@", i16 38, i8 0, i16 1536, i16 1346, i16 1346, ptr @SEL_STRING, i16 1346 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08JDOECECL@SEL_TIME?$AA@", i16 38, i8 0, i16 1536, i16 1347, i16 1347, ptr @SEL_TIME, i16 1347 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08ILGJHGPC@SEL_BOOL?$AA@", i16 38, i8 0, i16 1536, i16 1536, i16 1536, ptr @SEL_BOOL, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08DPKKIJGJ@SEL_BYTE?$AA@", i16 38, i8 0, i16 1536, i16 16, i16 16, ptr @SEL_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08PPEONECL@SEL_WORD?$AA@", i16 38, i8 0, i16 1536, i16 17, i16 17, ptr @SEL_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_09FHFMMBGD@SEL_DWORD?$AA@", i16 38, i8 0, i16 1536, i16 18, i16 18, ptr @SEL_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08CEHGKHCN@BIT_TEST?$AA@", i16 38, i8 0, i16 -32766, i16 260, i16 0, ptr @BIT_TEST, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08FABMLEPK@GET_CHAR?$AA@", i16 38, i8 0, i16 1346, i16 261, i16 0, ptr @GET_CHAR, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07PPJNPJKM@GET_LSB?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @GET_LSB, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07EHCBJOMJ@GET_MSB?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @GET_MSB, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08FDEOCCKI@I_BIT_IN?$AA@", i16 38, i8 0, i16 1536, i16 -32766, i16 0, ptr @I_BIT_IN, i16 -32766 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@COKLNBLA@I_BIT_IN_BYTE?$AA@", i16 38, i8 0, i16 1536, i16 16, i16 0, ptr @I_BIT_IN_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@OOEPIMPC@I_BIT_IN_WORD?$AA@", i16 38, i8 0, i16 1536, i16 17, i16 0, ptr @I_BIT_IN_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@KIECKKEL@I_BIT_IN_DWORD?$AA@", i16 38, i8 0, i16 1536, i16 18, i16 0, ptr @I_BIT_IN_DWORD, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_06CBEBPLJC@PARITY?$AA@", i16 38, i8 0, i16 -32766, i16 0, i16 0, ptr @PARITY, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@IIDDNLMN@PARITY_BYTE?$AA@", i16 38, i8 0, i16 16, i16 0, i16 0, ptr @PARITY_BYTE, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0M@EINHIGIP@PARITY_WORD?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @PARITY_WORD, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0N@IGFADPMA@PARITY_DWORD?$AA@", i16 38, i8 0, i16 18, i16 0, i16 0, ptr @PARITY_DWORD, i16 1536 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08HNNLPOAE@R_BIT_IN?$AA@", i16 38, i8 0, i16 1536, i16 -32766, i16 0, ptr @R_BIT_IN, i16 -32766 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@HCBNGDB@R_BIT_IN_BYTE?$AA@", i16 38, i8 0, i16 1536, i16 16, i16 0, ptr @R_BIT_IN_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@MHMFILHD@R_BIT_IN_WORD?$AA@", i16 38, i8 0, i16 1536, i16 17, i16 0, ptr @R_BIT_IN_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@DCNEJDPK@R_BIT_IN_DWORD?$AA@", i16 38, i8 0, i16 1536, i16 18, i16 0, ptr @R_BIT_IN_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_08GKKAOKEH@S_BIT_IN?$AA@", i16 38, i8 0, i16 1536, i16 -32766, i16 0, ptr @S_BIT_IN, i16 -32766 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@JKCODHEH@S_BIT_IN_BYTE?$AA@", i16 38, i8 0, i16 1536, i16 16, i16 0, ptr @S_BIT_IN_BYTE, i16 16 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0O@FKMKGKAF@S_BIT_IN_WORD?$AA@", i16 38, i8 0, i16 1536, i16 17, i16 0, ptr @S_BIT_IN_WORD, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0P@ILCPEIBC@S_BIT_IN_DWORD?$AA@", i16 38, i8 0, i16 1536, i16 18, i16 0, ptr @S_BIT_IN_DWORD, i16 18 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07HGMMGHN@SET_LSB?$AA@", i16 38, i8 0, i16 16, i16 17, i16 0, ptr @SET_LSB, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_07LPNAKBBI@SET_MSB?$AA@", i16 38, i8 0, i16 16, i16 17, i16 0, ptr @SET_MSB, i16 17 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_0BB@DHMGLGFH@STRING_TO_BUFFER?$AA@", i16 38, i8 0, i16 1346, i16 16, i16 261, ptr @STRING_TO_BUFFER, i16 261 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_04NLFHDAEB@SWAP?$AA@", i16 38, i8 0, i16 17, i16 0, i16 0, ptr @SWAP, i16 17 }>], align 1
@NumBasicFunctions = dso_local dllexport local_unnamed_addr global i16 637, align 2

declare dso_local ptr @EQ(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EQ_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EQ_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EQ_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EQ_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EQ_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EQ_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EQ_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EQ_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EQ_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EQ_ULINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EQ_TIME(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EQ_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EQ_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EQ_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EQ_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GE_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GE_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GE_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GE_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GE_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GE_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GE_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GE_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GE_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GE_ULINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GE_TIME(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GE_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GE_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GE_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GE_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GT_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GT_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GT_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GT_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GT_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GT_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GT_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GT_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GT_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GT_ULINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GT_TIME(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GT_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GT_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GT_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GT_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LE_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LE_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LE_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LE_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LE_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LE_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LE_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LE_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LE_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LE_ULINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LE_TIME(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LE_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LE_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LE_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LE_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LT_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LT_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LT_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LT_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LT_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LT_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LT_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LT_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LT_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LT_ULINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LT_TIME(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LT_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LT_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LT_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LT_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NE_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NE_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NE_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NE_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NE_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NE_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NE_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NE_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NE_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NE_ULINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NE_TIME(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NE_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NE_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NE_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NE_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ADD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ADD_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ADD_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ADD_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ADD_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ADD_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ADD_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ADD_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ADD_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ADD_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ADD_ULINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ADD_T_T(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_ULINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_T_AN(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_T_AN_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_T_AN_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_T_AN_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_T_AN_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_T_AN_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_T_AN_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_T_AN_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_T_AN_ULINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_T_AN_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_T_AN_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_T_AI(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_T_AI_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_T_AI_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_T_AI_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_T_AI_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_T_AI_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_T_AI_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_T_AI_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_T_AI_ULINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DIV_T_R(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXPT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXPT_REAL_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXPT_REAL_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXPT_REAL_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXPT_REAL_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXPT_REAL_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXPT_REAL_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXPT_REAL_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXPT_REAL_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXPT_REAL_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXPT_REAL_ULINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXPT_LREAL_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXPT_LREAL_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXPT_LREAL_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXPT_LREAL_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXPT_LREAL_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXPT_LREAL_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXPT_LREAL_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXPT_LREAL_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXPT_LREAL_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXPT_LREAL_ULINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOD_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOD_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOD_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOD_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOD_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOD_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOD_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOD_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOD_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOD_ULINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOVE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOVE_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOVE_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOVE_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOVE_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOVE_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOVE_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOVE_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOVE_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOVE_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOVE_ULINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOVE_TIME(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOVE_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOVE_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOVE_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOVE_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MOVE_STRING(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_ULINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_T_AN(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_T_AN_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_T_AN_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_T_AN_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_T_AN_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_T_AN_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_T_AN_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_T_AN_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_T_AN_ULINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_T_AN_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_T_AN_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_T_AI(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_T_AI_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_T_AI_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_T_AI_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_T_AI_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_T_AI_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_T_AI_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_T_AI_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_T_AI_ULINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MUL_T_R(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NEG(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NEG_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NEG_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NEG_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NEG_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NEG_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NEG_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NEG_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NEG_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NEG_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NEG_ULINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SUB(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SUB_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SUB_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SUB_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SUB_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SUB_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SUB_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SUB_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SUB_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SUB_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SUB_ULINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SUB_T_T(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BYTE_TO_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BYTE_TO_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BYTE_TO_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BYTE_TO_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BYTE_TO_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BYTE_TO_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BYTE_TO_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BYTE_TO_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BYTE_TO_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BYTE_TO_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BYTE_TO_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BYTE_TO_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BOOL_TO_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BOOL_TO_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BOOL_TO_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BOOL_TO_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BOOL_TO_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BOOL_TO_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BOOL_TO_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BOOL_TO_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BOOL_TO_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BOOL_TO_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BOOL_TO_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BOOL_TO_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @INT_TO_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @INT_TO_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @INT_TO_B_BCD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @INT_TO_D_BCD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @INT_TO_W_BCD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @INT_TO_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @INT_TO_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @INT_TO_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @INT_TO_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @INT_TO_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @INT_TO_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @INT_TO_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @INT_TO_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @INT_TO_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @INT_TO_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @B_BCD_TO_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @B_BCD_TO_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @B_BCD_TO_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @B_BCD_TO_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BCD_TO_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @D_BCD_TO_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @D_BCD_TO_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @D_BCD_TO_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @D_BCD_TO_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @W_BCD_TO_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @W_BCD_TO_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @W_BCD_TO_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @W_BCD_TO_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DINT_TO_B_BCD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DINT_TO_BCD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DINT_TO_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DINT_TO_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DINT_TO_D_BCD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DINT_TO_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DINT_TO_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DINT_TO_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DINT_TO_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DINT_TO_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DINT_TO_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DINT_TO_TIME(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DINT_TO_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DINT_TO_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DINT_TO_W_BCD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DINT_TO_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DINT_TO_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LREAL_TO_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LREAL_TO_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LREAL_TO_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LREAL_TO_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LREAL_TO_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LREAL_TO_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LREAL_TO_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LREAL_TO_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LREAL_TO_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LREAL_TO_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LREAL_TO_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LREAL_TO_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @REAL_TO_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @REAL_TO_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @REAL_TO_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @REAL_TO_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @REAL_TO_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @REAL_TO_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @REAL_TO_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @REAL_TO_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @REAL_TO_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @REAL_TO_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @REAL_TO_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @REAL_TO_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DWORD_TO_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DWORD_TO_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DWORD_TO_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DWORD_TO_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DWORD_TO_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DWORD_TO_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DWORD_TO_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DWORD_TO_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DWORD_TO_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DWORD_TO_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DWORD_TO_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DWORD_TO_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LINT_TO_B_BCD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LINT_TO_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LINT_TO_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LINT_TO_D_BCD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LINT_TO_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LINT_TO_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LINT_TO_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LINT_TO_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LINT_TO_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LINT_TO_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LINT_TO_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LINT_TO_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LINT_TO_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LINT_TO_W_BCD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LINT_TO_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SINT_TO_B_BCD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SINT_TO_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SINT_TO_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SINT_TO_D_BCD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SINT_TO_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SINT_TO_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SINT_TO_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SINT_TO_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SINT_TO_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SINT_TO_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SINT_TO_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SINT_TO_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SINT_TO_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SINT_TO_W_BCD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SINT_TO_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UDINT_TO_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UDINT_TO_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UDINT_TO_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UDINT_TO_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UDINT_TO_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UDINT_TO_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UDINT_TO_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UDINT_TO_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UDINT_TO_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UDINT_TO_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UDINT_TO_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UDINT_TO_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UINT_TO_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UINT_TO_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UINT_TO_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UINT_TO_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UINT_TO_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UINT_TO_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UINT_TO_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UINT_TO_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UINT_TO_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UINT_TO_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UINT_TO_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UINT_TO_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @USINT_TO_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @USINT_TO_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @USINT_TO_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @USINT_TO_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @USINT_TO_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @USINT_TO_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @USINT_TO_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @USINT_TO_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @USINT_TO_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @USINT_TO_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @USINT_TO_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @USINT_TO_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @WORD_TO_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @WORD_TO_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @WORD_TO_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @WORD_TO_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @WORD_TO_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @WORD_TO_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @WORD_TO_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @WORD_TO_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @WORD_TO_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @WORD_TO_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @WORD_TO_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @WORD_TO_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @TRUNC_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @TRUNC_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @TRUNC_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @TRUNC_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @TIME_TO_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @AND(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @AND_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @AND_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @AND_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @AND_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ANDN(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ANDN_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ANDN_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ANDN_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ANDN_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NOT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NOT_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NOT_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NOT_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NOT_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @OR(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @OR_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @OR_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @OR_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @OR_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ORN(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ORN_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ORN_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ORN_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ORN_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @XOR(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @XOR_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @XOR_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @XOR_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @XOR_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @XORN(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @XORN_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @XORN_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @XORN_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @XORN_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ROL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ROL_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ROL_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ROL_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ROR(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ROR_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ROR_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ROR_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SHL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SHL_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SHL_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SHL_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SHR(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SHR_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SHR_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SHR_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SIZEOF(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LOWER_BOUND(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ABS(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ABS_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ABS_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ABS_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ABS_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ABS_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ABS_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ABS_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ABS_ULINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ABS_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ABS_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ABS_TIME(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ACOS(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ACOS_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ACOS_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ASIN(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ASIN_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ASIN_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ATAN(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ATAN_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @ATAN_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @COS(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @COS_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @COS_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SIN(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SIN_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SIN_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @TAN(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @TAN_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @TAN_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXP(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXP_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EXP_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LN(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LN_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LN_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LOG(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LOG_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LOG_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SQRT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SQRT_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SQRT_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BYTE_TO_STRING(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @WORD_TO_STRING(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DWORD_TO_STRING(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SINT_TO_STRING(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @INT_TO_STRING(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DINT_TO_STRING(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LINT_TO_STRING(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @USINT_TO_STRING(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UINT_TO_STRING(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @UDINT_TO_STRING(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @TIME_TO_STRING(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @REAL_TO_STRING(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LREAL_TO_STRING(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @STRING_TO_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @STRING_TO_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @STRING_TO_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @STRING_TO_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @STRING_TO_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @STRING_TO_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @STRING_TO_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @STRING_TO_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @STRING_TO_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @STRING_TO_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @STRING_TO_TIME(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @STRING_TO_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @STRING_TO_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @CONCAT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @DELETE_STR(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @FIND(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @INSERT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @REPLACE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LEN(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LEFT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MID(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @RIGHT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @EQ_STRING(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @NE_STRING(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GE_STRING(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GT_STRING(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LE_STRING(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LT_STRING(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LIMIT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LIMIT_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LIMIT_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LIMIT_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LIMIT_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LIMIT_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LIMIT_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @LIMIT_STRING(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MAX(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MAX_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MAX_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MAX_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MAX_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MAX_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MAX_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MAX_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MAX_ULINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MAX_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MAX_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MAX_STR(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MIN(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MIN_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MIN_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MIN_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MIN_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MIN_USINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MIN_UINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MIN_UDINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MIN_ULINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MIN_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MIN_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @MIN_STR(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SEL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SEL_SINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SEL_INT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SEL_DINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SEL_LINT(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SEL_REAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SEL_LREAL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SEL_STRING(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SEL_TIME(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SEL_BOOL(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SEL_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SEL_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SEL_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @BIT_TEST(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GET_CHAR(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GET_LSB(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @GET_MSB(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @I_BIT_IN(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @I_BIT_IN_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @I_BIT_IN_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @I_BIT_IN_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @PARITY(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @PARITY_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @PARITY_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @PARITY_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @R_BIT_IN(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @R_BIT_IN_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @R_BIT_IN_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @R_BIT_IN_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @S_BIT_IN(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @S_BIT_IN_BYTE(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @S_BIT_IN_WORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @S_BIT_IN_DWORD(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SET_LSB(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SET_MSB(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @STRING_TO_BUFFER(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

declare dso_local ptr @SWAP(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

attributes #0 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCPIEC\\PLCPIEC.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
