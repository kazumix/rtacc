; ModuleID = '..\PLCP\variable.c'
source_filename = "..\\PLCP\\variable.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.STRING = type <{ i16, [81 x i8] }>
%struct.ARRAY = type <{ i16, [1 x i8] }>
%union.ANYVAL = type { %union.anon }
%union.anon = type { i64 }
%struct.T_ANY = type <{ %union.PANYVAL, i16, ptr, i8, i8, %struct.BITFIELD }>
%union.PANYVAL = type { ptr }
%struct.BITFIELD = type { i8, i8, i8 }

$LibVersion_0x0701 = comdat any

$"??_C@_0BD@PIGJDLMJ@Variable_Add?3entry?$AA@" = comdat any

$"??_C@_0BC@BLILFEGL@Variable_Add?3name?$AA@" = comdat any

$"??_C@_02MJNHLAAE@EG?$AA@" = comdat any

$"??_C@_02KNHHEEKP@?5?5?$AA@" = comdat any

$"??_C@_02BIGHIPPJ@RO?$AA@" = comdat any

$"??_C@_0CI@JAAMHDIA@?5?5Variable?$CI?$CF03d?$CJ?5?$CFp?5?$CF?924s?5?5?$CF?910s@" = comdat any

$"??_C@_0BA@LBHLBGIF@Variable_Create?$AA@" = comdat any

$"??_C@_0O@NOPHFFNJ@Variable_Body?$AA@" = comdat any

$"??_C@_0BB@FLIGODG@Variable_GetSize?$AA@" = comdat any

$"??_C@_0BB@OKBGGAGP@Variable_GetType?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@variablelist = dso_local local_unnamed_addr global ptr null, align 4
@variableBottom = dso_local local_unnamed_addr global ptr null, align 4
@RUNvariablelist = dso_local local_unnamed_addr global ptr null, align 4
@"??_C@_0BD@PIGJDLMJ@Variable_Add?3entry?$AA@" = linkonce_odr dso_local unnamed_addr constant [19 x i8] c"Variable_Add:entry\00", comdat, align 1
@"??_C@_0BC@BLILFEGL@Variable_Add?3name?$AA@" = linkonce_odr dso_local unnamed_addr constant [18 x i8] c"Variable_Add:name\00", comdat, align 1
@"??_C@_02MJNHLAAE@EG?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"EG\00", comdat, align 1
@"??_C@_02KNHHEEKP@?5?5?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"  \00", comdat, align 1
@"??_C@_02BIGHIPPJ@RO?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"RO\00", comdat, align 1
@"??_C@_0CI@JAAMHDIA@?5?5Variable?$CI?$CF03d?$CJ?5?$CFp?5?$CF?924s?5?5?$CF?910s@" = linkonce_odr dso_local unnamed_addr constant [40 x i8] c"  Variable(%03d) %p %-24s  %-10s %s %s\0A\00", comdat, align 1
@"??_C@_0BA@LBHLBGIF@Variable_Create?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"Variable_Create\00", comdat, align 1
@"??_C@_0O@NOPHFFNJ@Variable_Body?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"Variable_Body\00", comdat, align 1
@"??_C@_0BB@FLIGODG@Variable_GetSize?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"Variable_GetSize\00", comdat, align 1
@"??_C@_0BB@OKBGGAGP@Variable_GetType?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"Variable_GetType\00", comdat, align 1
@_Variable_Zero_Body_String = dso_local global %struct.STRING zeroinitializer, align 1
@_Variable_Zero_Body_Array = dso_local global %struct.ARRAY zeroinitializer, align 1
@_Variable_Zero_Body = dso_local global %union.ANYVAL zeroinitializer, align 1
@_Variable_Zero_BOOL = dso_local global %struct.T_ANY <{ %union.PANYVAL { ptr @_Variable_Zero_Body }, i16 1536, ptr null, i8 0, i8 0, %struct.BITFIELD zeroinitializer }>, align 1
@_Variable_Zero_SINT = dso_local global %struct.T_ANY <{ %union.PANYVAL { ptr @_Variable_Zero_Body }, i16 260, ptr null, i8 0, i8 0, %struct.BITFIELD zeroinitializer }>, align 1
@_Variable_Zero_INT = dso_local global %struct.T_ANY <{ %union.PANYVAL { ptr @_Variable_Zero_Body }, i16 261, ptr null, i8 0, i8 0, %struct.BITFIELD zeroinitializer }>, align 1
@_Variable_Zero_DINT = dso_local global %struct.T_ANY <{ %union.PANYVAL { ptr @_Variable_Zero_Body }, i16 262, ptr null, i8 0, i8 0, %struct.BITFIELD zeroinitializer }>, align 1
@_Variable_Zero_LINT = dso_local global %struct.T_ANY <{ %union.PANYVAL { ptr @_Variable_Zero_Body }, i16 263, ptr null, i8 0, i8 0, %struct.BITFIELD zeroinitializer }>, align 1
@_Variable_Zero_USINT = dso_local global %struct.T_ANY <{ %union.PANYVAL { ptr @_Variable_Zero_Body }, i16 512, ptr null, i8 0, i8 0, %struct.BITFIELD zeroinitializer }>, align 1
@_Variable_Zero_UINT = dso_local global %struct.T_ANY <{ %union.PANYVAL { ptr @_Variable_Zero_Body }, i16 513, ptr null, i8 0, i8 0, %struct.BITFIELD zeroinitializer }>, align 1
@_Variable_Zero_UDINT = dso_local global %struct.T_ANY <{ %union.PANYVAL { ptr @_Variable_Zero_Body }, i16 514, ptr null, i8 0, i8 0, %struct.BITFIELD zeroinitializer }>, align 1
@_Variable_Zero_ULINT = dso_local global %struct.T_ANY <{ %union.PANYVAL { ptr @_Variable_Zero_Body }, i16 515, ptr null, i8 0, i8 0, %struct.BITFIELD zeroinitializer }>, align 1
@_Variable_Zero_TIME = dso_local global %struct.T_ANY <{ %union.PANYVAL { ptr @_Variable_Zero_Body }, i16 1347, ptr null, i8 0, i8 0, %struct.BITFIELD zeroinitializer }>, align 1
@_Variable_Zero_BYTE = dso_local global %struct.T_ANY <{ %union.PANYVAL { ptr @_Variable_Zero_Body }, i16 16, ptr null, i8 0, i8 0, %struct.BITFIELD zeroinitializer }>, align 1
@_Variable_Zero_WORD = dso_local global %struct.T_ANY <{ %union.PANYVAL { ptr @_Variable_Zero_Body }, i16 17, ptr null, i8 0, i8 0, %struct.BITFIELD zeroinitializer }>, align 1
@_Variable_Zero_DWORD = dso_local global %struct.T_ANY <{ %union.PANYVAL { ptr @_Variable_Zero_Body }, i16 18, ptr null, i8 0, i8 0, %struct.BITFIELD zeroinitializer }>, align 1
@_Variable_Zero_QWORD = dso_local global %struct.T_ANY <{ %union.PANYVAL { ptr @_Variable_Zero_Body }, i16 19, ptr null, i8 0, i8 0, %struct.BITFIELD zeroinitializer }>, align 1
@_Variable_Zero_FUNCTION = dso_local global %struct.T_ANY <{ %union.PANYVAL { ptr @Functionblock_Dummy }, i16 1059, ptr null, i8 0, i8 0, %struct.BITFIELD zeroinitializer }>, align 1
@_Variable_Zero_STRING = dso_local global %struct.T_ANY <{ %union.PANYVAL { ptr @_Variable_Zero_Body_String }, i16 1346, ptr null, i8 0, i8 0, %struct.BITFIELD zeroinitializer }>, align 1
@_Variable_Zero_ARRAY = dso_local global %struct.T_ANY <{ %union.PANYVAL { ptr @_Variable_Zero_Body_Array }, i16 1058, ptr null, i8 0, i8 0, %struct.BITFIELD zeroinitializer }>, align 1
@_Variable_Zero_STRUCT = dso_local global %struct.T_ANY <{ %union.PANYVAL { ptr @_Variable_Zero_Body_Array }, i16 1060, ptr null, i8 0, i8 0, %struct.BITFIELD zeroinitializer }>, align 1
@_Variable_Zero_ANY = dso_local global %struct.T_ANY <{ %union.PANYVAL { ptr @_Variable_Zero_Body }, i16 263, ptr null, i8 0, i8 0, %struct.BITFIELD zeroinitializer }>, align 1
@_Variable_Zero_REAL = dso_local global %struct.T_ANY <{ %union.PANYVAL { ptr @_Variable_Zero_Body }, i16 782, ptr null, i8 0, i8 0, %struct.BITFIELD zeroinitializer }>, align 1
@_Variable_Zero_LREAL = dso_local global %struct.T_ANY <{ %union.PANYVAL { ptr @_Variable_Zero_Body }, i16 783, ptr null, i8 0, i8 0, %struct.BITFIELD zeroinitializer }>, align 1
@str = private unnamed_addr constant [18 x i8] c"PLC variable list\00", align 1
@str.1 = private unnamed_addr constant [6 x i8] c"  N/A\00", align 1

; Function Attrs: nounwind
define dso_local nonnull ptr @Variable_Add(ptr noundef readonly captures(none) %0, i16 noundef zeroext %1) local_unnamed_addr #0 {
  %3 = tail call ptr @Heap_Alloc(i32 noundef 23, ptr noundef nonnull @"??_C@_0BD@PIGJDLMJ@Variable_Add?3entry?$AA@") #11
  %4 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %0) #11
  %5 = add i32 %4, 1
  %6 = tail call ptr @Heap_Alloc(i32 noundef %5, ptr noundef nonnull @"??_C@_0BC@BLILFEGL@Variable_Add?3name?$AA@") #11
  store ptr %6, ptr %3, align 1
  %7 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %6, ptr noundef nonnull dereferenceable(1) %0) #11
  %8 = getelementptr inbounds nuw i8, ptr %3, i32 8
  store i16 %1, ptr %8, align 1
  %9 = getelementptr inbounds nuw i8, ptr %3, i32 19
  store ptr null, ptr %9, align 1
  %10 = load ptr, ptr @variablelist, align 4
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %13

12:                                               ; preds = %2
  store ptr %3, ptr @variablelist, align 4
  br label %16

13:                                               ; preds = %2
  %14 = load ptr, ptr @variableBottom, align 4
  %15 = getelementptr inbounds nuw i8, ptr %14, i32 19
  store ptr %3, ptr %15, align 1
  br label %16

16:                                               ; preds = %13, %12
  store ptr %3, ptr @variableBottom, align 4
  %17 = getelementptr inbounds nuw i8, ptr %3, i32 4
  ret ptr %17
}

declare dso_local ptr @Heap_Alloc(i32 noundef, ptr noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strlen(ptr noundef captures(none)) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none)) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local void @Variable_Clear() local_unnamed_addr #0 {
  %1 = load ptr, ptr @variablelist, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %21, label %3

3:                                                ; preds = %0, %16
  %4 = phi ptr [ %19, %16 ], [ %1, %0 ]
  %5 = getelementptr inbounds nuw i8, ptr %4, i32 4
  %6 = getelementptr inbounds nuw i8, ptr %4, i32 10
  %7 = load ptr, ptr %6, align 1
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %16

9:                                                ; preds = %3
  %10 = getelementptr inbounds nuw i8, ptr %4, i32 8
  %11 = load i16, ptr %10, align 1
  %12 = icmp eq i16 %11, 1059
  br i1 %12, label %16, label %13

13:                                               ; preds = %9
  %14 = load ptr, ptr %5, align 1
  tail call void @Heap_Free(ptr noundef %14) #11
  %15 = load ptr, ptr @variablelist, align 4
  br label %16

16:                                               ; preds = %9, %13, %3
  %17 = phi ptr [ %4, %9 ], [ %15, %13 ], [ %4, %3 ]
  %18 = getelementptr inbounds nuw i8, ptr %4, i32 19
  %19 = load ptr, ptr %18, align 1
  tail call void @Heap_Free(ptr noundef %17) #11
  store ptr %19, ptr @variablelist, align 4
  %20 = icmp eq ptr %19, null
  br i1 %20, label %21, label %3, !llvm.loop !7

21:                                               ; preds = %16, %0
  store ptr null, ptr @variableBottom, align 4
  store ptr null, ptr @variablelist, align 4
  ret void
}

declare dso_local void @Heap_Free(ptr noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @Variable_Display() local_unnamed_addr #0 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %2 = load ptr, ptr @RUNvariablelist, align 4
  %3 = icmp eq ptr %2, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  br label %27

6:                                                ; preds = %0, %6
  %7 = phi i32 [ %25, %6 ], [ 1, %0 ]
  %8 = phi ptr [ %24, %6 ], [ %2, %0 ]
  %9 = getelementptr inbounds nuw i8, ptr %8, i32 4
  %10 = getelementptr inbounds nuw i8, ptr %8, i32 10
  %11 = load ptr, ptr %10, align 1
  %12 = icmp eq ptr %11, null
  %13 = select i1 %12, ptr @"??_C@_02KNHHEEKP@?5?5?$AA@", ptr @"??_C@_02MJNHLAAE@EG?$AA@"
  %14 = getelementptr inbounds nuw i8, ptr %8, i32 14
  %15 = load i8, ptr %14, align 1
  %16 = icmp eq i8 %15, 0
  %17 = select i1 %16, ptr @"??_C@_02KNHHEEKP@?5?5?$AA@", ptr @"??_C@_02BIGHIPPJ@RO?$AA@"
  %18 = getelementptr inbounds nuw i8, ptr %8, i32 8
  %19 = load i16, ptr %18, align 1
  %20 = tail call ptr @Type_GetName(i16 noundef zeroext %19) #11
  %21 = load ptr, ptr %8, align 1
  %22 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CI@JAAMHDIA@?5?5Variable?$CI?$CF03d?$CJ?5?$CFp?5?$CF?924s?5?5?$CF?910s@", i32 noundef %7, ptr noundef nonnull %9, ptr noundef %21, ptr noundef %20, ptr noundef nonnull %17, ptr noundef nonnull %13)
  %23 = getelementptr inbounds nuw i8, ptr %8, i32 19
  %24 = load ptr, ptr %23, align 1
  %25 = add nuw nsw i32 %7, 1
  %26 = icmp eq ptr %24, null
  br i1 %26, label %27, label %6, !llvm.loop !9

27:                                               ; preds = %6, %4
  ret void
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #4

declare dso_local ptr @Type_GetName(i16 noundef zeroext) local_unnamed_addr #1

; Function Attrs: nofree norecurse nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local ptr @Variable_Search(ptr noundef readonly captures(none) %0) local_unnamed_addr #5 {
  %2 = load ptr, ptr @variablelist, align 4
  %3 = icmp eq ptr %2, null
  br i1 %3, label %15, label %4

4:                                                ; preds = %1, %11
  %5 = phi ptr [ %13, %11 ], [ %2, %1 ]
  %6 = load ptr, ptr %5, align 1
  %7 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %6, ptr noundef nonnull dereferenceable(1) %0) #11
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

9:                                                ; preds = %4
  %10 = getelementptr inbounds nuw i8, ptr %5, i32 4
  br label %15

11:                                               ; preds = %4
  %12 = getelementptr inbounds nuw i8, ptr %5, i32 19
  %13 = load ptr, ptr %12, align 1
  %14 = icmp eq ptr %13, null
  br i1 %14, label %15, label %4, !llvm.loop !10

15:                                               ; preds = %11, %1, %9
  %16 = phi ptr [ %10, %9 ], [ null, %1 ], [ null, %11 ]
  ret ptr %16
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strcmp(ptr noundef captures(none), ptr noundef captures(none)) local_unnamed_addr #2

; Function Attrs: nofree norecurse nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef ptr @Variable_SearchName(ptr noundef readonly captures(none) %0) local_unnamed_addr #5 {
  %2 = load ptr, ptr @variablelist, align 4
  %3 = icmp eq ptr %2, null
  br i1 %3, label %13, label %8

4:                                                ; preds = %8
  %5 = getelementptr inbounds nuw i8, ptr %9, i32 19
  %6 = load ptr, ptr %5, align 1
  %7 = icmp eq ptr %6, null
  br i1 %7, label %13, label %8, !llvm.loop !11

8:                                                ; preds = %1, %4
  %9 = phi ptr [ %6, %4 ], [ %2, %1 ]
  %10 = load ptr, ptr %9, align 1
  %11 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %10, ptr noundef nonnull dereferenceable(1) %0) #11
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %4

13:                                               ; preds = %8, %4, %1
  %14 = phi ptr [ null, %1 ], [ null, %4 ], [ %10, %8 ]
  ret ptr %14
}

; Function Attrs: nounwind
define dso_local noundef ptr @Variable_Create(i16 noundef zeroext %0) local_unnamed_addr #0 {
  %2 = tail call ptr @Heap_Alloc(i32 noundef 15, ptr noundef nonnull @"??_C@_0BA@LBHLBGIF@Variable_Create?$AA@") #11
  %3 = getelementptr inbounds nuw i8, ptr %2, i32 6
  store ptr null, ptr %3, align 1
  %4 = getelementptr inbounds nuw i8, ptr %2, i32 4
  store i16 %0, ptr %4, align 1
  store ptr null, ptr %2, align 1
  ret ptr %2
}

; Function Attrs: nounwind
define dso_local ptr @Variable_Body(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call ptr @Heap_Alloc(i32 noundef %0, ptr noundef nonnull @"??_C@_0O@NOPHFFNJ@Variable_Body?$AA@") #11
  ret ptr %2
}

; Function Attrs: nounwind
define dso_local ptr @Variable_LinkBody(ptr noundef writeonly captures(none) %0, ptr noundef %1) local_unnamed_addr #0 {
  %3 = tail call zeroext i16 @Rtedge_TagGetIecType(ptr noundef %1) #11
  %4 = tail call ptr @Rtedge_TagGetPointer(ptr noundef %1) #11
  %5 = icmp eq ptr %4, null
  br i1 %5, label %10, label %6

6:                                                ; preds = %2
  %7 = tail call ptr @Rtedge_GetPointer(ptr noundef nonnull %4, i16 noundef zeroext %3) #11
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 6
  store ptr %4, ptr %8, align 1
  %9 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 %3, ptr %9, align 1
  store ptr %7, ptr %0, align 1
  br label %10

10:                                               ; preds = %2, %6
  %11 = phi ptr [ %7, %6 ], [ null, %2 ]
  ret ptr %11
}

declare dso_local zeroext i16 @Rtedge_TagGetIecType(ptr noundef) local_unnamed_addr #1

declare dso_local ptr @Rtedge_TagGetPointer(ptr noundef) local_unnamed_addr #1

declare dso_local ptr @Rtedge_GetPointer(ptr noundef, i16 noundef zeroext) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local zeroext i16 @Variable_GetSize(ptr noundef readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = load ptr, ptr @variablelist, align 4
  %3 = icmp eq ptr %2, null
  br i1 %3, label %13, label %4

4:                                                ; preds = %1, %9
  %5 = phi ptr [ %11, %9 ], [ %2, %1 ]
  %6 = load ptr, ptr %5, align 1
  %7 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %6, ptr noundef nonnull readonly dereferenceable(1) %0) #11
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %14, label %9

9:                                                ; preds = %4
  %10 = getelementptr inbounds nuw i8, ptr %5, i32 19
  %11 = load ptr, ptr %10, align 1
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %4, !llvm.loop !10

13:                                               ; preds = %9, %1
  tail call void @Errorlog_Add(i32 noundef 0, i32 noundef 8194, ptr noundef nonnull @"??_C@_0BB@FLIGODG@Variable_GetSize?$AA@") #11
  br label %17

14:                                               ; preds = %4
  %15 = getelementptr inbounds nuw i8, ptr %5, i32 4
  %16 = tail call zeroext i16 @Rtedge_SizeOf(ptr noundef nonnull %15) #11
  br label %17

17:                                               ; preds = %14, %13
  %18 = phi i16 [ %16, %14 ], [ 0, %13 ]
  ret i16 %18
}

declare dso_local void @Errorlog_Add(i32 noundef, i32 noundef, ptr noundef) local_unnamed_addr #1

declare dso_local zeroext i16 @Rtedge_SizeOf(ptr noundef) local_unnamed_addr #1

; Function Attrs: nofree norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define dso_local void @Variable_Copy64(ptr noundef %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #6 {
  %3 = load i64, ptr %1, align 1
  br label %4

4:                                                ; preds = %4, %2
  %5 = load volatile i64, ptr %0, align 8
  %6 = cmpxchg volatile ptr %0, i64 %5, i64 %3 seq_cst seq_cst, align 8
  %7 = extractvalue { i64, i1 } %6, 1
  br i1 %7, label %8, label %4, !llvm.loop !12

8:                                                ; preds = %4
  ret void
}

; Function Attrs: nounwind
define dso_local zeroext i16 @Variable_GetType(ptr noundef readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = load ptr, ptr @variablelist, align 4
  %3 = icmp eq ptr %2, null
  br i1 %3, label %13, label %4

4:                                                ; preds = %1, %9
  %5 = phi ptr [ %11, %9 ], [ %2, %1 ]
  %6 = load ptr, ptr %5, align 1
  %7 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %6, ptr noundef nonnull readonly dereferenceable(1) %0) #11
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %14, label %9

9:                                                ; preds = %4
  %10 = getelementptr inbounds nuw i8, ptr %5, i32 19
  %11 = load ptr, ptr %10, align 1
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %4, !llvm.loop !10

13:                                               ; preds = %9, %1
  tail call void @Errorlog_Add(i32 noundef 0, i32 noundef 8194, ptr noundef nonnull @"??_C@_0BB@OKBGGAGP@Variable_GetType?$AA@") #11
  br label %17

14:                                               ; preds = %4
  %15 = getelementptr inbounds nuw i8, ptr %5, i32 8
  %16 = load i16, ptr %15, align 1
  br label %17

17:                                               ; preds = %14, %13
  %18 = phi i16 [ %16, %14 ], [ 0, %13 ]
  ret i16 %18
}

declare dso_local void @Functionblock_Dummy(ptr noundef) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef ptr @Variable_Zero(i16 noundef zeroext %0) local_unnamed_addr #7 {
  switch i16 %0, label %22 [
    i16 1536, label %23
    i16 260, label %2
    i16 261, label %3
    i16 262, label %4
    i16 263, label %5
    i16 512, label %6
    i16 513, label %7
    i16 514, label %8
    i16 515, label %9
    i16 1347, label %10
    i16 782, label %11
    i16 783, label %12
    i16 16, label %13
    i16 17, label %14
    i16 18, label %15
    i16 19, label %16
    i16 1059, label %17
    i16 1346, label %18
    i16 1058, label %19
    i16 1060, label %20
    i16 -32767, label %21
  ]

2:                                                ; preds = %1
  br label %23

3:                                                ; preds = %1
  br label %23

4:                                                ; preds = %1
  br label %23

5:                                                ; preds = %1
  br label %23

6:                                                ; preds = %1
  br label %23

7:                                                ; preds = %1
  br label %23

8:                                                ; preds = %1
  br label %23

9:                                                ; preds = %1
  br label %23

10:                                               ; preds = %1
  br label %23

11:                                               ; preds = %1
  br label %23

12:                                               ; preds = %1
  br label %23

13:                                               ; preds = %1
  br label %23

14:                                               ; preds = %1
  br label %23

15:                                               ; preds = %1
  br label %23

16:                                               ; preds = %1
  br label %23

17:                                               ; preds = %1
  br label %23

18:                                               ; preds = %1
  br label %23

19:                                               ; preds = %1
  br label %23

20:                                               ; preds = %1
  br label %23

21:                                               ; preds = %1
  br label %23

22:                                               ; preds = %1
  br label %23

23:                                               ; preds = %1, %22, %21, %20, %19, %18, %17, %16, %15, %14, %13, %12, %11, %10, %9, %8, %7, %6, %5, %4, %3, %2
  %24 = phi ptr [ null, %22 ], [ @_Variable_Zero_ANY, %21 ], [ @_Variable_Zero_SINT, %2 ], [ @_Variable_Zero_INT, %3 ], [ @_Variable_Zero_DINT, %4 ], [ @_Variable_Zero_LINT, %5 ], [ @_Variable_Zero_USINT, %6 ], [ @_Variable_Zero_UINT, %7 ], [ @_Variable_Zero_UDINT, %8 ], [ @_Variable_Zero_ULINT, %9 ], [ @_Variable_Zero_TIME, %10 ], [ @_Variable_Zero_REAL, %11 ], [ @_Variable_Zero_LREAL, %12 ], [ @_Variable_Zero_BYTE, %13 ], [ @_Variable_Zero_WORD, %14 ], [ @_Variable_Zero_DWORD, %15 ], [ @_Variable_Zero_QWORD, %16 ], [ @_Variable_Zero_FUNCTION, %17 ], [ @_Variable_Zero_STRING, %18 ], [ @_Variable_Zero_ARRAY, %19 ], [ @_Variable_Zero_STRUCT, %20 ], [ @_Variable_Zero_BOOL, %1 ]
  ret ptr %24
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Variable_Reset_All() local_unnamed_addr #8 {
  %1 = load ptr, ptr @RUNvariablelist, align 4
  %2 = icmp eq ptr %1, null
  br i1 %2, label %46, label %3

3:                                                ; preds = %0, %42
  %4 = phi ptr [ %44, %42 ], [ %1, %0 ]
  %5 = getelementptr inbounds nuw i8, ptr %4, i32 14
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %8, label %42

8:                                                ; preds = %3
  %9 = getelementptr inbounds nuw i8, ptr %4, i32 4
  %10 = load ptr, ptr %9, align 1
  %11 = icmp eq ptr %10, null
  br i1 %11, label %42, label %12

12:                                               ; preds = %8
  %13 = getelementptr inbounds nuw i8, ptr %4, i32 8
  %14 = load i16, ptr %13, align 1
  switch i16 %14, label %42 [
    i16 1536, label %15
    i16 260, label %16
    i16 261, label %17
    i16 262, label %18
    i16 263, label %19
    i16 512, label %20
    i16 513, label %21
    i16 514, label %22
    i16 515, label %23
    i16 1347, label %24
    i16 782, label %25
    i16 783, label %26
    i16 16, label %27
    i16 17, label %28
    i16 18, label %29
    i16 19, label %30
    i16 -32767, label %38
    i16 1058, label %31
    i16 1060, label %31
    i16 1346, label %37
  ]

15:                                               ; preds = %12
  store i8 0, ptr %10, align 1
  br label %42

16:                                               ; preds = %12
  store i8 0, ptr %10, align 1
  br label %42

17:                                               ; preds = %12
  store i16 0, ptr %10, align 2
  br label %42

18:                                               ; preds = %12
  store i32 0, ptr %10, align 4
  br label %42

19:                                               ; preds = %12
  store i64 0, ptr %10, align 8
  br label %42

20:                                               ; preds = %12
  store i8 0, ptr %10, align 1
  br label %42

21:                                               ; preds = %12
  store i16 0, ptr %10, align 2
  br label %42

22:                                               ; preds = %12
  store i32 0, ptr %10, align 4
  br label %42

23:                                               ; preds = %12
  store i64 0, ptr %10, align 8
  br label %42

24:                                               ; preds = %12
  store i32 0, ptr %10, align 4
  br label %42

25:                                               ; preds = %12
  store float 0.000000e+00, ptr %10, align 4
  br label %42

26:                                               ; preds = %12
  store double 0.000000e+00, ptr %10, align 8
  br label %42

27:                                               ; preds = %12
  store i8 0, ptr %10, align 1
  br label %42

28:                                               ; preds = %12
  store i16 0, ptr %10, align 2
  br label %42

29:                                               ; preds = %12
  store i32 0, ptr %10, align 4
  br label %42

30:                                               ; preds = %12
  store i64 0, ptr %10, align 8
  br label %42

31:                                               ; preds = %12, %12
  %32 = getelementptr inbounds nuw i8, ptr %4, i32 10
  %33 = load ptr, ptr %32, align 1
  %34 = getelementptr inbounds nuw i8, ptr %33, i32 5
  %35 = load i16, ptr %34, align 1
  %36 = zext i16 %35 to i32
  tail call void @llvm.memset.p0.i32(ptr nonnull align 1 %10, i8 0, i32 %36, i1 false)
  br label %42

37:                                               ; preds = %12
  tail call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(83) %10, i8 0, i32 83, i1 false)
  br label %42

38:                                               ; preds = %12
  %39 = load i32, ptr %10, align 4
  %40 = inttoptr i32 %39 to ptr
  %41 = load ptr, ptr %40, align 1
  tail call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(83) %41, i8 0, i32 83, i1 false)
  br label %42

42:                                               ; preds = %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %37, %38, %12, %8, %3
  %43 = getelementptr inbounds nuw i8, ptr %4, i32 19
  %44 = load ptr, ptr %43, align 1
  %45 = icmp eq ptr %44, null
  br i1 %45, label %46, label %3, !llvm.loop !13

46:                                               ; preds = %42, %0
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #9

; Function Attrs: nounwind
define dso_local void @Variable_Swap() local_unnamed_addr #0 {
  %1 = load ptr, ptr @RUNvariablelist, align 4
  %2 = load ptr, ptr @variablelist, align 4
  store ptr %2, ptr @RUNvariablelist, align 4
  store ptr %1, ptr @variablelist, align 4
  %3 = icmp eq ptr %1, null
  br i1 %3, label %22, label %4

4:                                                ; preds = %0, %17
  %5 = phi ptr [ %20, %17 ], [ %1, %0 ]
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 4
  %7 = getelementptr inbounds nuw i8, ptr %5, i32 10
  %8 = load ptr, ptr %7, align 1
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %17

10:                                               ; preds = %4
  %11 = getelementptr inbounds nuw i8, ptr %5, i32 8
  %12 = load i16, ptr %11, align 1
  %13 = icmp eq i16 %12, 1059
  br i1 %13, label %17, label %14

14:                                               ; preds = %10
  %15 = load ptr, ptr %6, align 1
  tail call void @Heap_Free(ptr noundef %15) #11
  %16 = load ptr, ptr @variablelist, align 4
  br label %17

17:                                               ; preds = %14, %10, %4
  %18 = phi ptr [ %5, %10 ], [ %16, %14 ], [ %5, %4 ]
  %19 = getelementptr inbounds nuw i8, ptr %5, i32 19
  %20 = load ptr, ptr %19, align 1
  tail call void @Heap_Free(ptr noundef %18) #11
  store ptr %20, ptr @variablelist, align 4
  %21 = icmp eq ptr %20, null
  br i1 %21, label %22, label %4, !llvm.loop !7

22:                                               ; preds = %17, %0
  store ptr null, ptr @variableBottom, align 4
  store ptr null, ptr @variablelist, align 4
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #10

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree norecurse nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #10 = { nofree nounwind }
attributes #11 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\variable.c", directory: "C:\\D_DRV\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !8}
!12 = distinct !{!12, !8}
!13 = distinct !{!13, !8}
