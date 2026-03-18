; ModuleID = '..\PLCP\instruction.c'
source_filename = "..\\PLCP\\instruction.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.MNMTEMPLATE = type <{ ptr, i16, i8, i16, i16, i16, ptr, i16 }>
%union.tHashCode = type { %struct.anon }
%struct.anon = type { i32, i32, i32, i32 }

$LibVersion_0x0701 = comdat any

$"??_C@_00CNPNBAHC@?$AA@" = comdat any

$"??_C@_09FOLKACJL@STACKOVER?$AA@" = comdat any

$"??_C@_0L@LMAGOADG@STACKUNDER?$AA@" = comdat any

$"??_C@_03MJAIKILM@VAR?$AA@" = comdat any

$"??_C@_02LDGFHOIO@FU?$AA@" = comdat any

$"??_C@_02LGOGPKBI@FB?$AA@" = comdat any

$"??_C@_03JBLDIHBA@UFU?$AA@" = comdat any

$"??_C@_05EILEDKCG@LABEL?$AA@" = comdat any

$"??_C@_03GEANJIEE@NOP?$AA@" = comdat any

$"??_C@_02ONCLNIEI@LD?$AA@" = comdat any

$"??_C@_03BGBAIAPB@LDN?$AA@" = comdat any

$"??_C@_02LAJDCOFE@ST?$AA@" = comdat any

$"??_C@_03CEMGEEI@STN?$AA@" = comdat any

$"??_C@_01CPLAODJH@S?$AA@" = comdat any

$"??_C@_02LONEIP@SN?$AA@" = comdat any

$"??_C@_01DGKLNCNG@R?$AA@" = comdat any

$"??_C@_02BHMLOLI@RN?$AA@" = comdat any

$"??_C@_03BDACDFHA@AND?$AA@" = comdat any

$"??_C@_04DOOMBBIC@ANDN?$AA@" = comdat any

$"??_C@_02PDPFNDMG@OR?$AA@" = comdat any

$"??_C@_03BMAOPANN@ORN?$AA@" = comdat any

$"??_C@_03HKIODAMO@CAL?$AA@" = comdat any

$"??_C@_04KHPCHNEB@CALC?$AA@" = comdat any

$"??_C@_05GPIGOBPA@CALCN?$AA@" = comdat any

$"??_C@_03BHDJDALB@RET?$AA@" = comdat any

$"??_C@_04GHCFKGOM@RETC?$AA@" = comdat any

$"??_C@_05MHCBOJHO@RETCN?$AA@" = comdat any

$"??_C@_03GBFNEA@NOT?$AA@" = comdat any

$"??_C@_02NFEPAFND@EQ?$AA@" = comdat any

$"??_C@_03JMGAKCCH@END?$AA@" = comdat any

$"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@status_instruction = dso_local local_unnamed_addr global i32 0, align 4
@Instruction_UF = dso_local local_unnamed_addr global i8 0, align 1
@Instruction_UFB = dso_local local_unnamed_addr global i8 0, align 1
@InstructionCatalog = dso_local local_unnamed_addr global [65535 x ptr] zeroinitializer, align 4
@stack = dso_local local_unnamed_addr global [256 x i8] zeroinitializer, align 1
@stackptr = dso_local local_unnamed_addr global i32 0, align 4
@"??_C@_00CNPNBAHC@?$AA@" = linkonce_odr dso_local unnamed_addr constant [1 x i8] zeroinitializer, comdat, align 1
@"??_C@_09FOLKACJL@STACKOVER?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"STACKOVER\00", comdat, align 1
@"??_C@_0L@LMAGOADG@STACKUNDER?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"STACKUNDER\00", comdat, align 1
@"??_C@_03MJAIKILM@VAR?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"VAR\00", comdat, align 1
@"??_C@_02LDGFHOIO@FU?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"FU\00", comdat, align 1
@"??_C@_02LGOGPKBI@FB?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"FB\00", comdat, align 1
@"??_C@_03JBLDIHBA@UFU?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"UFU\00", comdat, align 1
@"??_C@_05EILEDKCG@LABEL?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"LABEL\00", comdat, align 1
@"??_C@_03GEANJIEE@NOP?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"NOP\00", comdat, align 1
@"??_C@_02ONCLNIEI@LD?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"LD\00", comdat, align 1
@"??_C@_03BGBAIAPB@LDN?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"LDN\00", comdat, align 1
@"??_C@_02LAJDCOFE@ST?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"ST\00", comdat, align 1
@"??_C@_03CEMGEEI@STN?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"STN\00", comdat, align 1
@"??_C@_01CPLAODJH@S?$AA@" = linkonce_odr dso_local unnamed_addr constant [2 x i8] c"S\00", comdat, align 1
@"??_C@_02LONEIP@SN?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"SN\00", comdat, align 1
@"??_C@_01DGKLNCNG@R?$AA@" = linkonce_odr dso_local unnamed_addr constant [2 x i8] c"R\00", comdat, align 1
@"??_C@_02BHMLOLI@RN?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"RN\00", comdat, align 1
@"??_C@_03BDACDFHA@AND?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"AND\00", comdat, align 1
@"??_C@_04DOOMBBIC@ANDN?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"ANDN\00", comdat, align 1
@"??_C@_02PDPFNDMG@OR?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"OR\00", comdat, align 1
@"??_C@_03BMAOPANN@ORN?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"ORN\00", comdat, align 1
@"??_C@_03HKIODAMO@CAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"CAL\00", comdat, align 1
@"??_C@_04KHPCHNEB@CALC?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"CALC\00", comdat, align 1
@"??_C@_05GPIGOBPA@CALCN?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"CALCN\00", comdat, align 1
@"??_C@_03BHDJDALB@RET?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"RET\00", comdat, align 1
@"??_C@_04GHCFKGOM@RETC?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"RETC\00", comdat, align 1
@"??_C@_05MHCBOJHO@RETCN?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"RETCN\00", comdat, align 1
@"??_C@_03GBFNEA@NOT?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"NOT\00", comdat, align 1
@"??_C@_02NFEPAFND@EQ?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"EQ\00", comdat, align 1
@"??_C@_03JMGAKCCH@END?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"END\00", comdat, align 1
@InstructionTemplate = dso_local global [27 x %struct.MNMTEMPLATE] [%struct.MNMTEMPLATE <{ ptr @"??_C@_03MJAIKILM@VAR?$AA@", i16 1, i8 1, i16 0, i16 0, i16 0, ptr @VAR, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_02LDGFHOIO@FU?$AA@", i16 2, i8 1, i16 0, i16 0, i16 0, ptr @FU, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_02LGOGPKBI@FB?$AA@", i16 3, i8 1, i16 0, i16 0, i16 0, ptr @FB, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03JBLDIHBA@UFU?$AA@", i16 2, i8 1, i16 0, i16 0, i16 0, ptr @Logic_RunPOU, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_05EILEDKCG@LABEL?$AA@", i16 4, i8 0, i16 0, i16 0, i16 0, ptr @LABEL, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03GEANJIEE@NOP?$AA@", i16 0, i8 0, i16 0, i16 0, i16 0, ptr @NOP, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_02ONCLNIEI@LD?$AA@", i16 5, i8 0, i16 -32767, i16 0, i16 0, ptr @LD, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03BGBAIAPB@LDN?$AA@", i16 7, i8 0, i16 -32767, i16 0, i16 0, ptr @LDN, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_02LAJDCOFE@ST?$AA@", i16 9, i8 0, i16 -32767, i16 0, i16 0, ptr @ST, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03CEMGEEI@STN?$AA@", i16 11, i8 0, i16 -32767, i16 0, i16 0, ptr @STN, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_01CPLAODJH@S?$AA@", i16 13, i8 0, i16 1536, i16 0, i16 0, ptr @S, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_02LONEIP@SN?$AA@", i16 14, i8 0, i16 1536, i16 0, i16 0, ptr @SN, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_01DGKLNCNG@R?$AA@", i16 15, i8 0, i16 1536, i16 0, i16 0, ptr @R, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_02BHMLOLI@RN?$AA@", i16 16, i8 0, i16 1536, i16 0, i16 0, ptr @RN, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03BDACDFHA@AND?$AA@", i16 17, i8 0, i16 1536, i16 0, i16 0, ptr @AND, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_04DOOMBBIC@ANDN?$AA@", i16 19, i8 0, i16 1536, i16 0, i16 0, ptr @ANDN, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_02PDPFNDMG@OR?$AA@", i16 21, i8 0, i16 1536, i16 0, i16 0, ptr @OR, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03BMAOPANN@ORN?$AA@", i16 23, i8 0, i16 1536, i16 0, i16 0, ptr @ORN, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03HKIODAMO@CAL?$AA@", i16 32, i8 0, i16 -32762, i16 0, i16 0, ptr @CAL, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_04KHPCHNEB@CALC?$AA@", i16 33, i8 0, i16 -32762, i16 0, i16 0, ptr @CALC, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_05GPIGOBPA@CALCN?$AA@", i16 34, i8 0, i16 -32762, i16 0, i16 0, ptr @CALCN, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03BHDJDALB@RET?$AA@", i16 35, i8 0, i16 0, i16 0, i16 0, ptr @RET, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_04GHCFKGOM@RETC?$AA@", i16 36, i8 0, i16 0, i16 0, i16 0, ptr @RETC, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_05MHCBOJHO@RETCN?$AA@", i16 37, i8 0, i16 0, i16 0, i16 0, ptr @RETCN, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03GBFNEA@NOT?$AA@", i16 38, i8 0, i16 0, i16 0, i16 0, ptr @NOT, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_02NFEPAFND@EQ?$AA@", i16 38, i8 0, i16 -32767, i16 -32767, i16 0, ptr @EQ, i16 0 }>, %struct.MNMTEMPLATE <{ ptr @"??_C@_03JMGAKCCH@END?$AA@", i16 39, i8 0, i16 0, i16 0, i16 0, ptr @END, i16 0 }>], align 1
@"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@" = linkonce_odr dso_local unnamed_addr constant [41 x i8] c"instruction hash conflict! %s. skipped.\0A\00", comdat, align 1

; Function Attrs: nounwind
define dso_local noundef zeroext i8 @push(i8 noundef returned zeroext %0) local_unnamed_addr #0 {
  %2 = load i32, ptr @stackptr, align 4
  %3 = getelementptr inbounds i8, ptr @stack, i32 %2
  store i8 %0, ptr %3, align 1
  %4 = add nsw i32 %2, 1
  store i32 %4, ptr @stackptr, align 4
  %5 = icmp sgt i32 %2, 255
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  tail call void @Errorlog_Add(i32 noundef 0, i32 noundef 288, ptr noundef nonnull @"??_C@_00CNPNBAHC@?$AA@") #14
  tail call void @INtime_Halt(ptr noundef nonnull @"??_C@_09FOLKACJL@STACKOVER?$AA@") #14
  br label %7

7:                                                ; preds = %6, %1
  ret i8 %0
}

declare dso_local void @Errorlog_Add(i32 noundef, i32 noundef, ptr noundef) local_unnamed_addr #1

declare dso_local void @INtime_Halt(ptr noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local zeroext i8 @pop() local_unnamed_addr #0 {
  %1 = load i32, ptr @stackptr, align 4
  %2 = icmp slt i32 %1, 1
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  tail call void @Errorlog_Add(i32 noundef 0, i32 noundef 289, ptr noundef nonnull @"??_C@_00CNPNBAHC@?$AA@") #14
  tail call void @INtime_Halt(ptr noundef nonnull @"??_C@_0L@LMAGOADG@STACKUNDER?$AA@") #14
  %4 = load i32, ptr @stackptr, align 4
  br label %5

5:                                                ; preds = %3, %0
  %6 = phi i32 [ %4, %3 ], [ %1, %0 ]
  %7 = add nsw i32 %6, -1
  store i32 %7, ptr @stackptr, align 4
  %8 = getelementptr inbounds i8, ptr @stack, i32 %7
  %9 = load i8, ptr %8, align 1
  ret i8 %9
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef ptr @NOP(ptr noundef readnone returned captures(ret: address, provenance) %0, ptr readnone captures(none) %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #3 {
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local noundef ptr @LD(ptr noundef returned initializes((4, 6)) %0, ptr noundef %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #0 {
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %6 = load i16, ptr %5, align 1
  %7 = icmp eq i16 %6, -32767
  br i1 %7, label %8, label %14

8:                                                ; preds = %4
  %9 = load ptr, ptr %1, align 1
  %10 = load i32, ptr %9, align 4
  %11 = inttoptr i32 %10 to ptr
  %12 = getelementptr inbounds nuw i8, ptr %11, i32 4
  %13 = load i16, ptr %12, align 1
  br label %14

14:                                               ; preds = %8, %4
  %15 = phi i16 [ %13, %8 ], [ %6, %4 ]
  %16 = phi ptr [ %11, %8 ], [ %1, %4 ]
  %17 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 %15, ptr %17, align 1
  %18 = tail call i32 @Type_GetSize(ptr noundef nonnull %16) #14
  %19 = trunc i32 %18 to i16
  switch i16 %19, label %30 [
    i16 1, label %20
    i16 2, label %22
    i16 4, label %24
    i16 8, label %26
    i16 83, label %28
  ]

20:                                               ; preds = %14
  %21 = load ptr, ptr %0, align 1
  tail call void @LD_byte(ptr noundef %21, ptr noundef nonnull %16) #14
  br label %30

22:                                               ; preds = %14
  %23 = load ptr, ptr %0, align 1
  tail call void @LD_word(ptr noundef %23, ptr noundef nonnull %16) #14
  br label %30

24:                                               ; preds = %14
  %25 = load ptr, ptr %0, align 1
  tail call void @LD_dword(ptr noundef %25, ptr noundef nonnull %16) #14
  br label %30

26:                                               ; preds = %14
  %27 = load ptr, ptr %0, align 1
  tail call void @LD_qword(ptr noundef %27, ptr noundef nonnull %16) #14
  br label %30

28:                                               ; preds = %14
  %29 = load ptr, ptr %0, align 1
  tail call void @LD_string(ptr noundef %29, ptr noundef nonnull %16) #14
  br label %30

30:                                               ; preds = %14, %28, %26, %24, %22, %20
  %31 = getelementptr inbounds nuw i8, ptr %16, i32 12
  %32 = load i8, ptr %31, align 1
  %33 = icmp eq i8 %32, 0
  br i1 %33, label %46, label %34

34:                                               ; preds = %30
  %35 = getelementptr inbounds nuw i8, ptr %0, i32 12
  store i8 1, ptr %35, align 1
  %36 = getelementptr inbounds nuw i8, ptr %16, i32 13
  %37 = load i8, ptr %36, align 1
  %38 = getelementptr inbounds nuw i8, ptr %0, i32 13
  store i8 %37, ptr %38, align 1
  %39 = load ptr, ptr %16, align 1
  %40 = load i32, ptr %39, align 4
  %41 = zext nneg i8 %37 to i32
  %42 = lshr i32 %40, %41
  %43 = trunc i32 %42 to i8
  %44 = and i8 %43, 1
  %45 = getelementptr inbounds nuw i8, ptr %0, i32 14
  store i8 %44, ptr %45, align 1
  store i16 1536, ptr %17, align 1
  store ptr %45, ptr %0, align 1
  br label %46

46:                                               ; preds = %34, %30
  ret ptr %0
}

declare dso_local i32 @Type_GetSize(ptr noundef) local_unnamed_addr #1

declare dso_local void @LD_byte(ptr noundef, ptr noundef) local_unnamed_addr #1

declare dso_local void @LD_word(ptr noundef, ptr noundef) local_unnamed_addr #1

declare dso_local void @LD_dword(ptr noundef, ptr noundef) local_unnamed_addr #1

declare dso_local void @LD_qword(ptr noundef, ptr noundef) local_unnamed_addr #1

declare dso_local void @LD_string(ptr noundef, ptr noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local noundef ptr @LDN(ptr noundef returned initializes((4, 6)) %0, ptr noundef %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #0 {
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %6 = load i16, ptr %5, align 1
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 %6, ptr %7, align 1
  %8 = tail call i32 @Type_GetSize(ptr noundef %1) #14
  %9 = and i32 %8, 65535
  %10 = tail call range(i32 0, 17) i32 @llvm.ctpop.i32(i32 %9)
  %11 = icmp eq i32 %10, 1
  br i1 %11, label %12, label %22

12:                                               ; preds = %4
  %13 = tail call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %9, i1 true)
  switch i32 %13, label %22 [
    i32 0, label %14
    i32 1, label %16
    i32 2, label %18
    i32 3, label %20
  ]

14:                                               ; preds = %12
  %15 = load ptr, ptr %0, align 1
  tail call void @LDN_byte(ptr noundef %15, ptr noundef nonnull %1) #14
  br label %22

16:                                               ; preds = %12
  %17 = load ptr, ptr %0, align 1
  tail call void @LDN_word(ptr noundef %17, ptr noundef nonnull %1) #14
  br label %22

18:                                               ; preds = %12
  %19 = load ptr, ptr %0, align 1
  tail call void @LDN_dword(ptr noundef %19, ptr noundef nonnull %1) #14
  br label %22

20:                                               ; preds = %12
  %21 = load ptr, ptr %0, align 1
  tail call void @LDN_qword(ptr noundef %21, ptr noundef nonnull %1) #14
  br label %22

22:                                               ; preds = %4, %12, %20, %18, %16, %14
  %23 = getelementptr inbounds nuw i8, ptr %1, i32 12
  %24 = load i8, ptr %23, align 1
  %25 = icmp eq i8 %24, 0
  br i1 %25, label %39, label %26

26:                                               ; preds = %22
  %27 = getelementptr inbounds nuw i8, ptr %0, i32 12
  store i8 1, ptr %27, align 1
  %28 = getelementptr inbounds nuw i8, ptr %1, i32 13
  %29 = load i8, ptr %28, align 1
  %30 = getelementptr inbounds nuw i8, ptr %0, i32 13
  store i8 %29, ptr %30, align 1
  %31 = load ptr, ptr %1, align 1
  %32 = load i32, ptr %31, align 4
  %33 = zext nneg i8 %29 to i32
  %34 = lshr i32 %32, %33
  %35 = trunc i32 %34 to i8
  %36 = and i8 %35, 1
  %37 = xor i8 %36, -1
  %38 = getelementptr inbounds nuw i8, ptr %0, i32 14
  store i8 %37, ptr %38, align 1
  store i16 1536, ptr %7, align 1
  store ptr %38, ptr %0, align 1
  br label %39

39:                                               ; preds = %26, %22
  ret ptr %0
}

declare dso_local void @LDN_byte(ptr noundef, ptr noundef) local_unnamed_addr #1

declare dso_local void @LDN_word(ptr noundef, ptr noundef) local_unnamed_addr #1

declare dso_local void @LDN_dword(ptr noundef, ptr noundef) local_unnamed_addr #1

declare dso_local void @LDN_qword(ptr noundef, ptr noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local noundef ptr @ST(ptr noundef returned %0, ptr noundef %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #0 {
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %6 = load i16, ptr %5, align 1
  %7 = icmp eq i16 %6, -32767
  br i1 %7, label %8, label %12

8:                                                ; preds = %4
  %9 = load ptr, ptr %1, align 1
  %10 = load i32, ptr %9, align 4
  %11 = inttoptr i32 %10 to ptr
  br label %12

12:                                               ; preds = %8, %4
  %13 = phi ptr [ %11, %8 ], [ %1, %4 ]
  %14 = getelementptr inbounds nuw i8, ptr %13, i32 12
  %15 = load i8, ptr %14, align 1
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %36, label %17

17:                                               ; preds = %12
  %18 = load ptr, ptr %0, align 1
  %19 = load i8, ptr %18, align 1
  %20 = and i8 %19, 1
  %21 = getelementptr inbounds nuw i8, ptr %13, i32 13
  %22 = load i8, ptr %21, align 1
  %23 = zext nneg i8 %22 to i32
  %24 = shl nuw i32 1, %23
  %25 = xor i32 %24, -1
  %26 = load ptr, ptr %13, align 1
  %27 = load i32, ptr %26, align 4
  %28 = and i32 %27, %25
  store i32 %28, ptr %26, align 4
  %29 = zext nneg i8 %20 to i32
  %30 = load i8, ptr %21, align 1
  %31 = zext nneg i8 %30 to i32
  %32 = shl nuw i32 %29, %31
  %33 = load ptr, ptr %13, align 1
  %34 = load i32, ptr %33, align 4
  %35 = or i32 %34, %32
  store i32 %35, ptr %33, align 4
  br label %52

36:                                               ; preds = %12
  %37 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %38 = load i16, ptr %37, align 1
  %39 = getelementptr inbounds nuw i8, ptr %13, i32 4
  store i16 %38, ptr %39, align 1
  %40 = tail call i32 @Type_GetSize(ptr noundef %0) #14
  %41 = trunc i32 %40 to i16
  switch i16 %41, label %52 [
    i16 1, label %42
    i16 2, label %44
    i16 4, label %46
    i16 8, label %48
    i16 83, label %50
  ]

42:                                               ; preds = %36
  %43 = load ptr, ptr %0, align 1
  tail call void @ST_byte(ptr noundef nonnull %13, ptr noundef %43) #14
  br label %52

44:                                               ; preds = %36
  %45 = load ptr, ptr %0, align 1
  tail call void @ST_word(ptr noundef nonnull %13, ptr noundef %45) #14
  br label %52

46:                                               ; preds = %36
  %47 = load ptr, ptr %0, align 1
  tail call void @ST_dword(ptr noundef nonnull %13, ptr noundef %47) #14
  br label %52

48:                                               ; preds = %36
  %49 = load ptr, ptr %0, align 1
  tail call void @ST_qword(ptr noundef nonnull %13, ptr noundef %49) #14
  br label %52

50:                                               ; preds = %36
  %51 = load ptr, ptr %0, align 1
  tail call void @ST_string(ptr noundef nonnull %13, ptr noundef %51) #14
  br label %52

52:                                               ; preds = %42, %44, %46, %48, %50, %36, %17
  ret ptr %0
}

declare dso_local void @ST_byte(ptr noundef, ptr noundef) local_unnamed_addr #1

declare dso_local void @ST_word(ptr noundef, ptr noundef) local_unnamed_addr #1

declare dso_local void @ST_dword(ptr noundef, ptr noundef) local_unnamed_addr #1

declare dso_local void @ST_qword(ptr noundef, ptr noundef) local_unnamed_addr #1

declare dso_local void @ST_string(ptr noundef, ptr noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local noundef ptr @STN(ptr noundef returned %0, ptr noundef %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #0 {
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %6 = load i16, ptr %5, align 1
  %7 = icmp eq i16 %6, -32767
  br i1 %7, label %8, label %12

8:                                                ; preds = %4
  %9 = load ptr, ptr %1, align 1
  %10 = load i32, ptr %9, align 4
  %11 = inttoptr i32 %10 to ptr
  br label %12

12:                                               ; preds = %8, %4
  %13 = phi ptr [ %11, %8 ], [ %1, %4 ]
  %14 = getelementptr inbounds nuw i8, ptr %13, i32 12
  %15 = load i8, ptr %14, align 1
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %37, label %17

17:                                               ; preds = %12
  %18 = load ptr, ptr %0, align 1
  %19 = load i8, ptr %18, align 1
  %20 = and i8 %19, 1
  %21 = xor i8 %20, 1
  %22 = getelementptr inbounds nuw i8, ptr %13, i32 13
  %23 = load i8, ptr %22, align 1
  %24 = zext nneg i8 %23 to i32
  %25 = shl nuw i32 1, %24
  %26 = xor i32 %25, -1
  %27 = load ptr, ptr %13, align 1
  %28 = load i32, ptr %27, align 4
  %29 = and i32 %28, %26
  store i32 %29, ptr %27, align 4
  %30 = zext nneg i8 %21 to i32
  %31 = load i8, ptr %22, align 1
  %32 = zext nneg i8 %31 to i32
  %33 = shl nuw i32 %30, %32
  %34 = load ptr, ptr %13, align 1
  %35 = load i32, ptr %34, align 4
  %36 = or i32 %35, %33
  store i32 %36, ptr %34, align 4
  br label %55

37:                                               ; preds = %12
  %38 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %39 = load i16, ptr %38, align 1
  %40 = getelementptr inbounds nuw i8, ptr %13, i32 4
  store i16 %39, ptr %40, align 1
  %41 = tail call i32 @Type_GetSize(ptr noundef %0) #14
  %42 = and i32 %41, 65535
  %43 = tail call range(i32 0, 17) i32 @llvm.ctpop.i32(i32 %42)
  %44 = icmp eq i32 %43, 1
  br i1 %44, label %45, label %55

45:                                               ; preds = %37
  %46 = tail call range(i32 0, 33) i32 @llvm.cttz.i32(i32 %42, i1 true)
  switch i32 %46, label %55 [
    i32 0, label %47
    i32 1, label %49
    i32 2, label %51
    i32 3, label %53
  ]

47:                                               ; preds = %45
  %48 = load ptr, ptr %0, align 1
  tail call void @STN_byte(ptr noundef nonnull %13, ptr noundef %48) #14
  br label %55

49:                                               ; preds = %45
  %50 = load ptr, ptr %0, align 1
  tail call void @STN_word(ptr noundef nonnull %13, ptr noundef %50) #14
  br label %55

51:                                               ; preds = %45
  %52 = load ptr, ptr %0, align 1
  tail call void @STN_dword(ptr noundef nonnull %13, ptr noundef %52) #14
  br label %55

53:                                               ; preds = %45
  %54 = load ptr, ptr %0, align 1
  tail call void @STN_qword(ptr noundef nonnull %13, ptr noundef %54) #14
  br label %55

55:                                               ; preds = %47, %49, %51, %53, %45, %37, %17
  ret ptr %0
}

declare dso_local void @STN_byte(ptr noundef, ptr noundef) local_unnamed_addr #1

declare dso_local void @STN_word(ptr noundef, ptr noundef) local_unnamed_addr #1

declare dso_local void @STN_dword(ptr noundef, ptr noundef) local_unnamed_addr #1

declare dso_local void @STN_qword(ptr noundef, ptr noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef ptr @S(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef captures(none) %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #4 {
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %6 = load i16, ptr %5, align 1
  %7 = icmp eq i16 %6, -32767
  br i1 %7, label %8, label %12

8:                                                ; preds = %4
  %9 = load ptr, ptr %1, align 1
  %10 = load i32, ptr %9, align 4
  %11 = inttoptr i32 %10 to ptr
  br label %12

12:                                               ; preds = %8, %4
  %13 = phi ptr [ %11, %8 ], [ %1, %4 ]
  %14 = load ptr, ptr %0, align 1
  %15 = load i8, ptr %14, align 1
  %16 = and i8 %15, 1
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %33, label %18

18:                                               ; preds = %12
  %19 = getelementptr inbounds nuw i8, ptr %13, i32 12
  %20 = load i8, ptr %19, align 1
  %21 = icmp eq i8 %20, 0
  br i1 %21, label %30, label %22

22:                                               ; preds = %18
  %23 = getelementptr inbounds nuw i8, ptr %13, i32 13
  %24 = load i8, ptr %23, align 1
  %25 = zext nneg i8 %24 to i32
  %26 = shl nuw i32 1, %25
  %27 = load ptr, ptr %13, align 1
  %28 = load i32, ptr %27, align 4
  %29 = or i32 %28, %26
  store i32 %29, ptr %27, align 4
  br label %33

30:                                               ; preds = %18
  %31 = getelementptr inbounds nuw i8, ptr %13, i32 4
  store i16 1536, ptr %31, align 1
  %32 = load ptr, ptr %13, align 1
  store i8 1, ptr %32, align 1
  br label %33

33:                                               ; preds = %22, %30, %12
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef ptr @SN(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef captures(none) %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #4 {
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %6 = load i16, ptr %5, align 1
  %7 = icmp eq i16 %6, -32767
  br i1 %7, label %8, label %12

8:                                                ; preds = %4
  %9 = load ptr, ptr %1, align 1
  %10 = load i32, ptr %9, align 4
  %11 = inttoptr i32 %10 to ptr
  br label %12

12:                                               ; preds = %8, %4
  %13 = phi ptr [ %11, %8 ], [ %1, %4 ]
  %14 = load ptr, ptr %0, align 1
  %15 = load i8, ptr %14, align 1
  %16 = and i8 %15, 1
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %18, label %33

18:                                               ; preds = %12
  %19 = getelementptr inbounds nuw i8, ptr %13, i32 12
  %20 = load i8, ptr %19, align 1
  %21 = icmp eq i8 %20, 0
  br i1 %21, label %30, label %22

22:                                               ; preds = %18
  %23 = getelementptr inbounds nuw i8, ptr %13, i32 13
  %24 = load i8, ptr %23, align 1
  %25 = zext nneg i8 %24 to i32
  %26 = shl nuw i32 1, %25
  %27 = load ptr, ptr %13, align 1
  %28 = load i32, ptr %27, align 4
  %29 = or i32 %28, %26
  store i32 %29, ptr %27, align 4
  br label %33

30:                                               ; preds = %18
  %31 = getelementptr inbounds nuw i8, ptr %13, i32 4
  store i16 1536, ptr %31, align 1
  %32 = load ptr, ptr %13, align 1
  store i8 1, ptr %32, align 1
  br label %33

33:                                               ; preds = %22, %30, %12
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef ptr @R(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef captures(none) %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #4 {
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %6 = load i16, ptr %5, align 1
  %7 = icmp eq i16 %6, -32767
  br i1 %7, label %8, label %12

8:                                                ; preds = %4
  %9 = load ptr, ptr %1, align 1
  %10 = load i32, ptr %9, align 4
  %11 = inttoptr i32 %10 to ptr
  br label %12

12:                                               ; preds = %8, %4
  %13 = phi ptr [ %11, %8 ], [ %1, %4 ]
  %14 = load ptr, ptr %0, align 1
  %15 = load i8, ptr %14, align 1
  %16 = and i8 %15, 1
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %34, label %18

18:                                               ; preds = %12
  %19 = getelementptr inbounds nuw i8, ptr %13, i32 12
  %20 = load i8, ptr %19, align 1
  %21 = icmp eq i8 %20, 0
  br i1 %21, label %31, label %22

22:                                               ; preds = %18
  %23 = getelementptr inbounds nuw i8, ptr %13, i32 13
  %24 = load i8, ptr %23, align 1
  %25 = zext nneg i8 %24 to i32
  %26 = shl nuw i32 1, %25
  %27 = xor i32 %26, -1
  %28 = load ptr, ptr %13, align 1
  %29 = load i32, ptr %28, align 4
  %30 = and i32 %29, %27
  store i32 %30, ptr %28, align 4
  br label %34

31:                                               ; preds = %18
  %32 = getelementptr inbounds nuw i8, ptr %13, i32 4
  store i16 1536, ptr %32, align 1
  %33 = load ptr, ptr %13, align 1
  store i8 0, ptr %33, align 1
  br label %34

34:                                               ; preds = %22, %31, %12
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef ptr @RN(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef captures(none) %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #4 {
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %6 = load i16, ptr %5, align 1
  %7 = icmp eq i16 %6, -32767
  br i1 %7, label %8, label %12

8:                                                ; preds = %4
  %9 = load ptr, ptr %1, align 1
  %10 = load i32, ptr %9, align 4
  %11 = inttoptr i32 %10 to ptr
  br label %12

12:                                               ; preds = %8, %4
  %13 = phi ptr [ %11, %8 ], [ %1, %4 ]
  %14 = load ptr, ptr %0, align 1
  %15 = load i8, ptr %14, align 1
  %16 = and i8 %15, 1
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %18, label %34

18:                                               ; preds = %12
  %19 = getelementptr inbounds nuw i8, ptr %13, i32 12
  %20 = load i8, ptr %19, align 1
  %21 = icmp eq i8 %20, 0
  br i1 %21, label %31, label %22

22:                                               ; preds = %18
  %23 = getelementptr inbounds nuw i8, ptr %13, i32 13
  %24 = load i8, ptr %23, align 1
  %25 = zext nneg i8 %24 to i32
  %26 = shl nuw i32 1, %25
  %27 = xor i32 %26, -1
  %28 = load ptr, ptr %13, align 1
  %29 = load i32, ptr %28, align 4
  %30 = and i32 %29, %27
  store i32 %30, ptr %28, align 4
  br label %34

31:                                               ; preds = %18
  %32 = getelementptr inbounds nuw i8, ptr %13, i32 4
  store i16 1536, ptr %32, align 1
  %33 = load ptr, ptr %13, align 1
  store i8 0, ptr %33, align 1
  br label %34

34:                                               ; preds = %22, %31, %12
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local noundef ptr @AND(ptr noundef returned %0, ptr noundef %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #0 {
  %5 = tail call signext i8 @Variant_Read_Bool(ptr noundef %0) #14
  %6 = tail call signext i8 @Variant_Read_Bool(ptr noundef %1) #14
  %7 = and i8 %5, 1
  %8 = icmp ne i8 %7, 0
  %9 = and i8 %6, 1
  %10 = icmp ne i8 %9, 0
  %11 = select i1 %8, i1 %10, i1 false
  %12 = zext i1 %11 to i8
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %13, align 1
  %14 = load ptr, ptr %0, align 1
  store i8 %12, ptr %14, align 1
  ret ptr %0
}

declare dso_local signext i8 @Variant_Read_Bool(ptr noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local noundef ptr @ANDN(ptr noundef returned %0, ptr noundef %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #0 {
  %5 = tail call signext i8 @Variant_Read_Bool(ptr noundef %0) #14
  %6 = tail call signext i8 @Variant_Read_Bool(ptr noundef %1) #14
  %7 = and i8 %5, 1
  %8 = icmp ne i8 %7, 0
  %9 = and i8 %6, 1
  %10 = icmp eq i8 %9, 0
  %11 = select i1 %8, i1 %10, i1 false
  %12 = zext i1 %11 to i8
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %13, align 1
  %14 = load ptr, ptr %0, align 1
  store i8 %12, ptr %14, align 1
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local noundef ptr @OR(ptr noundef returned %0, ptr noundef %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #0 {
  %5 = tail call signext i8 @Variant_Read_Bool(ptr noundef %0) #14
  %6 = tail call signext i8 @Variant_Read_Bool(ptr noundef %1) #14
  %7 = and i8 %5, 1
  %8 = icmp ne i8 %7, 0
  %9 = and i8 %6, 1
  %10 = icmp ne i8 %9, 0
  %11 = select i1 %8, i1 true, i1 %10
  %12 = zext i1 %11 to i8
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %13, align 1
  %14 = load ptr, ptr %0, align 1
  store i8 %12, ptr %14, align 1
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local noundef ptr @ORN(ptr noundef returned %0, ptr noundef %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #0 {
  %5 = tail call signext i8 @Variant_Read_Bool(ptr noundef %0) #14
  %6 = tail call signext i8 @Variant_Read_Bool(ptr noundef %1) #14
  %7 = and i8 %5, 1
  %8 = icmp ne i8 %7, 0
  %9 = and i8 %6, 1
  %10 = icmp eq i8 %9, 0
  %11 = select i1 %8, i1 true, i1 %10
  %12 = zext i1 %11 to i8
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %13, align 1
  %14 = load ptr, ptr %0, align 1
  store i8 %12, ptr %14, align 1
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local noundef ptr @NOT(ptr noundef returned %0, ptr readnone captures(none) %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #0 {
  %5 = tail call signext i8 @Variant_Read_Bool(ptr noundef %0) #14
  %6 = and i8 %5, 1
  %7 = xor i8 %6, 1
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %8, align 1
  %9 = load ptr, ptr %0, align 1
  store i8 %7, ptr %9, align 1
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local noundef ptr @EQ(ptr noundef returned %0, ptr noundef %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #0 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %6 = load i16, ptr %5, align 1
  %7 = icmp eq i16 %6, 1536
  br i1 %7, label %8, label %16

8:                                                ; preds = %4
  %9 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %10 = load i16, ptr %9, align 1
  %11 = icmp eq i16 %10, 1536
  br i1 %11, label %12, label %16

12:                                               ; preds = %8
  %13 = tail call signext i8 @Variant_Read_Bool(ptr noundef nonnull %0) #14
  %14 = tail call signext i8 @Variant_Read_Bool(ptr noundef nonnull %1) #14
  %15 = icmp eq i8 %13, %14
  br label %20

16:                                               ; preds = %8, %4
  %17 = tail call double @Variant_Read_Lreal(ptr noundef nonnull %0) #14
  %18 = tail call double @Variant_Read_Lreal(ptr noundef %1) #14
  %19 = fcmp oeq double %17, %18
  br label %20

20:                                               ; preds = %16, %12
  %21 = phi i1 [ %15, %12 ], [ %19, %16 ]
  %22 = zext i1 %21 to i8
  store i16 1536, ptr %5, align 1
  %23 = load ptr, ptr %0, align 1
  store i8 %22, ptr %23, align 1
  ret ptr %0
}

declare dso_local double @Variant_Read_Lreal(ptr noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef ptr @JMP(ptr noundef readnone returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #3 {
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef ptr @JMPC(ptr noundef readnone returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #3 {
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef ptr @JMPCN(ptr noundef readnone returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #3 {
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local noundef ptr @CAL(ptr noundef readnone returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, ptr readnone captures(none) %3) #0 {
  %5 = load ptr, ptr %2, align 1
  %6 = load ptr, ptr %1, align 1
  tail call void %5(ptr noundef %6) #14
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local noundef ptr @CALC(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, ptr readnone captures(none) %3) #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i8, ptr %5, align 1
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %12, label %9

9:                                                ; preds = %4
  %10 = load ptr, ptr %2, align 1
  %11 = load ptr, ptr %1, align 1
  tail call void %10(ptr noundef %11) #14
  br label %12

12:                                               ; preds = %9, %4
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local noundef ptr @CALCN(ptr noundef readonly returned captures(ret: address, provenance) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2, ptr readnone captures(none) %3) #0 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i8, ptr %5, align 1
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %9, label %12

9:                                                ; preds = %4
  %10 = load ptr, ptr %2, align 1
  %11 = load ptr, ptr %1, align 1
  tail call void %10(ptr noundef %11) #14
  br label %12

12:                                               ; preds = %9, %4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef ptr @RET(ptr noundef returned writeonly captures(ret: address, provenance) initializes((11, 12)) %0, ptr readnone captures(none) %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #5 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 11
  store i8 1, ptr %5, align 1
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef ptr @RETC(ptr noundef returned captures(ret: address, provenance) %0, ptr readnone captures(none) %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #6 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 1
  br i1 %7, label %8, label %10

8:                                                ; preds = %4
  %9 = getelementptr inbounds nuw i8, ptr %0, i32 11
  store i8 1, ptr %9, align 1
  br label %10

10:                                               ; preds = %8, %4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef ptr @RETCN(ptr noundef returned captures(ret: address, provenance) %0, ptr readnone captures(none) %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #6 {
  %5 = load ptr, ptr %0, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %4
  %9 = getelementptr inbounds nuw i8, ptr %0, i32 11
  store i8 1, ptr %9, align 1
  br label %10

10:                                               ; preds = %8, %4
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef ptr @CLR(ptr noundef readnone returned captures(ret: address, provenance) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2, ptr noundef readnone captures(none) %3) local_unnamed_addr #3 {
  ret ptr %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef ptr @END(ptr noundef returned writeonly captures(ret: address, provenance) initializes((11, 12)) %0, ptr readnone captures(none) %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #5 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 11
  store i8 1, ptr %5, align 1
  ret ptr %0
}

; Function Attrs: nounwind
define dso_local noalias noundef ptr @VAR(ptr noundef %0, ptr readnone captures(none) %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #0 {
  %5 = load i8, ptr @Instruction_UFB, align 1
  %6 = icmp eq i8 %5, 1
  %7 = tail call ptr @Scope_variable(ptr noundef %0) #14
  br i1 %6, label %14, label %8

8:                                                ; preds = %4
  %9 = tail call zeroext i8 @Rtedge_TagCreateByInstruction(ptr noundef %7, i8 noundef zeroext 0) #14
  %10 = tail call ptr @strrchr(ptr noundef nonnull dereferenceable(1) %7, i32 noundef 35) #14
  %11 = getelementptr inbounds nuw i8, ptr %10, i32 1
  %12 = tail call ptr @Scope_get() #14
  %13 = tail call zeroext i8 @Userfunction_AddArgument(ptr noundef %12, ptr noundef nonnull %11) #14
  br label %14

14:                                               ; preds = %4, %8
  ret ptr null
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local zeroext range(i8 0, 2) i8 @Instruction_IsUFB() local_unnamed_addr #7 {
  %1 = load i8, ptr @Instruction_UFB, align 1
  %2 = icmp eq i8 %1, 1
  %3 = zext i1 %2 to i8
  ret i8 %3
}

declare dso_local ptr @Scope_variable(ptr noundef) local_unnamed_addr #1

declare dso_local zeroext i8 @Rtedge_TagCreateByInstruction(ptr noundef, i8 noundef zeroext) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local ptr @strrchr(ptr noundef, i32 noundef) local_unnamed_addr #8

declare dso_local ptr @Scope_get() local_unnamed_addr #1

declare dso_local zeroext i8 @Userfunction_AddArgument(ptr noundef, ptr noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local noalias noundef ptr @FU(ptr noundef %0, ptr readnone captures(none) %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #0 {
  %5 = tail call ptr @Scope_variable(ptr noundef %0) #14
  %6 = tail call zeroext i8 @Rtedge_TagCreateByInstruction(ptr noundef %5, i8 noundef zeroext 0) #14
  %7 = tail call zeroext i8 @Rtedge_TagCreateByInstruction(ptr noundef %0, i8 noundef zeroext 0) #14
  %8 = tail call ptr @Scope_get() #14
  tail call void @Userfunction_Add(ptr noundef %8) #14
  store i8 1, ptr @Instruction_UF, align 1
  store i8 0, ptr @Instruction_UFB, align 1
  ret ptr null
}

declare dso_local void @Userfunction_Add(ptr noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local noalias noundef ptr @FB(ptr noundef %0, ptr readnone captures(none) %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #0 {
  %5 = tail call ptr @Scope_variable(ptr noundef %0) #14
  %6 = tail call ptr @Scope_get() #14
  tail call void @UserFB_Add(ptr noundef %6) #14
  store i8 0, ptr @Instruction_UF, align 1
  store i8 1, ptr @Instruction_UFB, align 1
  ret ptr null
}

declare dso_local void @UserFB_Add(ptr noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef ptr @LABEL(ptr noundef readnone returned captures(ret: address, provenance) %0, ptr readnone captures(none) %1, ptr readnone captures(none) %2, ptr readnone captures(none) %3) #3 {
  ret ptr %0
}

declare dso_local ptr @Logic_RunPOU(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: nounwind
define dso_local zeroext i16 @Instruction_CalcHash(ptr noundef %0) local_unnamed_addr #0 {
  %2 = alloca %union.tHashCode, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #14
  call void @_Hash(ptr dead_on_unwind nonnull writable sret(%union.tHashCode) align 1 %2, ptr noundef %0) #14
  %3 = getelementptr inbounds nuw i8, ptr %2, i32 4
  %4 = load i32, ptr %3, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #14
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

declare dso_local void @_Hash(ptr dead_on_unwind writable sret(%union.tHashCode) align 1, ptr noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local noundef i32 @Instruction_CreateCatalog() local_unnamed_addr #0 {
  %1 = alloca %union.tHashCode, align 1
  tail call void @llvm.memset.p0.i32(ptr noundef nonnull align 4 dereferenceable(262140) @InstructionCatalog, i8 0, i32 262140, i1 false)
  %2 = getelementptr inbounds nuw i8, ptr %1, i32 4
  br label %3

3:                                                ; preds = %0, %16
  %4 = phi i32 [ 0, %0 ], [ %17, %16 ]
  %5 = getelementptr inbounds nuw %struct.MNMTEMPLATE, ptr @InstructionTemplate, i32 %4
  %6 = load ptr, ptr %5, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #14
  call void @_Hash(ptr dead_on_unwind nonnull writable sret(%union.tHashCode) align 1 %1, ptr noundef %6) #14
  %7 = load i32, ptr %2, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #14
  %8 = and i32 %7, 65535
  %9 = getelementptr inbounds nuw ptr, ptr @InstructionCatalog, i32 %8
  %10 = load ptr, ptr %9, align 4
  %11 = icmp eq ptr %10, null
  br i1 %11, label %15, label %12

12:                                               ; preds = %3
  %13 = load ptr, ptr %5, align 1
  %14 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@", ptr noundef %13)
  br label %16

15:                                               ; preds = %3
  store ptr %5, ptr %9, align 4
  br label %16

16:                                               ; preds = %15, %12
  %17 = add nuw nsw i32 %4, 1
  %18 = icmp eq i32 %17, 27
  br i1 %18, label %19, label %3, !llvm.loop !7

19:                                               ; preds = %16
  store i32 2, ptr @status_instruction, align 4
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #9

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #10

; Function Attrs: nounwind
define dso_local noundef i32 @Instruction_CreateUserfunctionCatalog(ptr noundef %0, ptr noundef %1) local_unnamed_addr #0 {
  %3 = alloca %union.tHashCode, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #14
  call void @_Hash(ptr dead_on_unwind nonnull writable sret(%union.tHashCode) align 1 %3, ptr noundef %0) #14
  %4 = getelementptr inbounds nuw i8, ptr %3, i32 4
  %5 = load i32, ptr %4, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #14
  %6 = and i32 %5, 65535
  %7 = getelementptr inbounds nuw ptr, ptr @InstructionCatalog, i32 %6
  %8 = load ptr, ptr %7, align 4
  %9 = icmp eq ptr %8, null
  br i1 %9, label %12, label %10

10:                                               ; preds = %2
  %11 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@", ptr noundef %0)
  br label %12

12:                                               ; preds = %10, %2
  store ptr %1, ptr %7, align 4
  store i32 2, ptr @status_instruction, align 4
  ret i32 0
}

; Function Attrs: nounwind
define dso_local ptr @Instruction_GetTemplate(ptr noundef %0) local_unnamed_addr #0 {
  %2 = alloca %union.tHashCode, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #14
  call void @_Hash(ptr dead_on_unwind nonnull writable sret(%union.tHashCode) align 1 %2, ptr noundef %0) #14
  %3 = getelementptr inbounds nuw i8, ptr %2, i32 4
  %4 = load i32, ptr %3, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #14
  %5 = and i32 %4, 65535
  %6 = getelementptr inbounds nuw ptr, ptr @InstructionCatalog, i32 %5
  %7 = load ptr, ptr %6, align 4
  %8 = icmp eq ptr %7, null
  br i1 %8, label %16, label %9

9:                                                ; preds = %1
  %10 = load ptr, ptr %7, align 1
  %11 = icmp eq ptr %10, null
  br i1 %11, label %16, label %12

12:                                               ; preds = %9
  %13 = call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %10, ptr noundef nonnull dereferenceable(1) %0) #14
  %14 = icmp eq i32 %13, 0
  %15 = select i1 %14, ptr %7, ptr null
  br label %16

16:                                               ; preds = %12, %9, %1
  %17 = phi ptr [ null, %9 ], [ null, %1 ], [ %15, %12 ]
  ret ptr %17
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strcmp(ptr noundef captures(none), ptr noundef captures(none)) local_unnamed_addr #8

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local zeroext range(i8 0, 2) i8 @Instruction_IsUF() local_unnamed_addr #7 {
  %1 = load i8, ptr @Instruction_UF, align 1
  %2 = icmp eq i8 %1, 1
  %3 = zext i1 %2 to i8
  ret i8 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Instruction_FUFBReset() local_unnamed_addr #11 {
  store i8 0, ptr @Instruction_UF, align 1
  store i8 0, ptr @Instruction_UFB, align 1
  ret void
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.ctpop.i32(i32) #12

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.cttz.i32(i32, i1 immarg) #13

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #10 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #13 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #14 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\instruction.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
