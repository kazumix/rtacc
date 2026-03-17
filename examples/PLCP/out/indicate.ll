; ModuleID = 'indicate.c'
source_filename = "indicate.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.CONTAINER_TAGS = type <{ ptr, i32, %union.anon, i8, i8, ptr, ptr, ptr, ptr }>
%union.anon = type { i32 }

$LibVersion_0x0701 = comdat any

$"??_C@_06PGDKHFME@Status?$AA@" = comdat any

$"??_C@_05NAOIJFC@Error?$AA@" = comdat any

$"??_C@_03BGPLALFI@Run?$AA@" = comdat any

$"??_C@_04KKAGIOCD@Live?$AA@" = comdat any

$"??_C@_08OAGHDPEJ@STATE_ON?$AA@" = comdat any

$"??_C@_0O@IMOCLJCO@STATE_LOADING?$AA@" = comdat any

$"??_C@_0L@MMBEGDMH@STATE_STOP?$AA@" = comdat any

$"??_C@_09NDBKDPFD@STATE_RUN?$AA@" = comdat any

$"??_C@_0L@MBIDOGBB@STATE_STEP?$AA@" = comdat any

$"??_C@_0L@NKMJBJKE@STATE_HALT?$AA@" = comdat any

$"??_C@_0P@OBGFCEGN@TASK_Period_us?$AA@" = comdat any

$"??_C@_0BB@BIHCCKNE@TASK_Watchdog_us?$AA@" = comdat any

$"??_C@_0L@OJINNFI@TASK_Stack?$AA@" = comdat any

$"??_C@_09FJFIOJGA@TASK_Prio?$AA@" = comdat any

$"??_C@_0BE@PILKOLFM@TASK_MinDuration_ns?$AA@" = comdat any

$"??_C@_0BE@NPABIMGN@TASK_MaxDuration_ns?$AA@" = comdat any

$"??_C@_0BE@HHDDEBEJ@TASK_CurDuration_ns?$AA@" = comdat any

$"??_C@_0BB@MPMBGPPD@TASK_MinDelay_ns?$AA@" = comdat any

$"??_C@_0BB@FPLCHPBJ@TASK_MaxDelay_ns?$AA@" = comdat any

$"??_C@_0BB@LPIOILIH@TASK_CurDelay_ns?$AA@" = comdat any

$"??_C@_0M@NJGLOIKF@DEBUG_FORCE?$AA@" = comdat any

$"??_C@_0M@EPKCJCCH@DEBUG_BPSET?$AA@" = comdat any

$"??_C@_0BE@IHGKBEJC@DEBUG_EXCEPTIONCODE?$AA@" = comdat any

$"??_C@_0M@DOKECC@SYSTICK_CNT?$AA@" = comdat any

$"??_C@_06EKOMPDCK@ERRORS?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@"??_C@_06PGDKHFME@Status?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"Status\00", comdat, align 1
@"??_C@_05NAOIJFC@Error?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"Error\00", comdat, align 1
@"??_C@_03BGPLALFI@Run?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"Run\00", comdat, align 1
@"??_C@_04KKAGIOCD@Live?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"Live\00", comdat, align 1
@"??_C@_08OAGHDPEJ@STATE_ON?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"STATE_ON\00", comdat, align 1
@"??_C@_0O@IMOCLJCO@STATE_LOADING?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"STATE_LOADING\00", comdat, align 1
@"??_C@_0L@MMBEGDMH@STATE_STOP?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"STATE_STOP\00", comdat, align 1
@"??_C@_09NDBKDPFD@STATE_RUN?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"STATE_RUN\00", comdat, align 1
@"??_C@_0L@MBIDOGBB@STATE_STEP?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"STATE_STEP\00", comdat, align 1
@"??_C@_0L@NKMJBJKE@STATE_HALT?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"STATE_HALT\00", comdat, align 1
@"??_C@_0P@OBGFCEGN@TASK_Period_us?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"TASK_Period_us\00", comdat, align 1
@"??_C@_0BB@BIHCCKNE@TASK_Watchdog_us?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"TASK_Watchdog_us\00", comdat, align 1
@"??_C@_0L@OJINNFI@TASK_Stack?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"TASK_Stack\00", comdat, align 1
@"??_C@_09FJFIOJGA@TASK_Prio?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"TASK_Prio\00", comdat, align 1
@"??_C@_0BE@PILKOLFM@TASK_MinDuration_ns?$AA@" = linkonce_odr dso_local unnamed_addr constant [20 x i8] c"TASK_MinDuration_ns\00", comdat, align 1
@"??_C@_0BE@NPABIMGN@TASK_MaxDuration_ns?$AA@" = linkonce_odr dso_local unnamed_addr constant [20 x i8] c"TASK_MaxDuration_ns\00", comdat, align 1
@"??_C@_0BE@HHDDEBEJ@TASK_CurDuration_ns?$AA@" = linkonce_odr dso_local unnamed_addr constant [20 x i8] c"TASK_CurDuration_ns\00", comdat, align 1
@"??_C@_0BB@MPMBGPPD@TASK_MinDelay_ns?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"TASK_MinDelay_ns\00", comdat, align 1
@"??_C@_0BB@FPLCHPBJ@TASK_MaxDelay_ns?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"TASK_MaxDelay_ns\00", comdat, align 1
@"??_C@_0BB@LPIOILIH@TASK_CurDelay_ns?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"TASK_CurDelay_ns\00", comdat, align 1
@"??_C@_0M@NJGLOIKF@DEBUG_FORCE?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"DEBUG_FORCE\00", comdat, align 1
@"??_C@_0M@EPKCJCCH@DEBUG_BPSET?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"DEBUG_BPSET\00", comdat, align 1
@"??_C@_0BE@IHGKBEJC@DEBUG_EXCEPTIONCODE?$AA@" = linkonce_odr dso_local unnamed_addr constant [20 x i8] c"DEBUG_EXCEPTIONCODE\00", comdat, align 1
@"??_C@_0M@DOKECC@SYSTICK_CNT?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"SYSTICK_CNT\00", comdat, align 1
@"??_C@_06EKOMPDCK@ERRORS?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"ERRORS\00", comdat, align 1
@indicate = dso_local global [26 x %struct.CONTAINER_TAGS] [%struct.CONTAINER_TAGS <{ ptr @"??_C@_06PGDKHFME@Status?$AA@", i32 3, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_05NAOIJFC@Error?$AA@", i32 1, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_03BGPLALFI@Run?$AA@", i32 1, %union.anon { i32 1 }, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_04KKAGIOCD@Live?$AA@", i32 7, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_08OAGHDPEJ@STATE_ON?$AA@", i32 1, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_0O@IMOCLJCO@STATE_LOADING?$AA@", i32 1, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_0L@MMBEGDMH@STATE_STOP?$AA@", i32 1, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_09NDBKDPFD@STATE_RUN?$AA@", i32 1, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_0L@MBIDOGBB@STATE_STEP?$AA@", i32 1, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_0L@NKMJBJKE@STATE_HALT?$AA@", i32 1, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_0P@OBGFCEGN@TASK_Period_us?$AA@", i32 7, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_0BB@BIHCCKNE@TASK_Watchdog_us?$AA@", i32 7, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_0L@OJINNFI@TASK_Stack?$AA@", i32 7, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_09FJFIOJGA@TASK_Prio?$AA@", i32 7, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_0BE@PILKOLFM@TASK_MinDuration_ns?$AA@", i32 7, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_0BE@NPABIMGN@TASK_MaxDuration_ns?$AA@", i32 7, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_0BE@HHDDEBEJ@TASK_CurDuration_ns?$AA@", i32 7, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_0BB@MPMBGPPD@TASK_MinDelay_ns?$AA@", i32 7, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_0BB@FPLCHPBJ@TASK_MaxDelay_ns?$AA@", i32 7, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_0BB@LPIOILIH@TASK_CurDelay_ns?$AA@", i32 7, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_0M@NJGLOIKF@DEBUG_FORCE?$AA@", i32 1, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_0M@EPKCJCCH@DEBUG_BPSET?$AA@", i32 1, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_0BE@IHGKBEJC@DEBUG_EXCEPTIONCODE?$AA@", i32 7, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_0M@DOKECC@SYSTICK_CNT?$AA@", i32 7, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS <{ ptr @"??_C@_06EKOMPDCK@ERRORS?$AA@", i32 7, %union.anon zeroinitializer, i8 1, i8 0, ptr null, ptr null, ptr null, ptr null }>, %struct.CONTAINER_TAGS zeroinitializer], align 1
@Indicate_Live.live = internal global i32 0, align 4

; Function Attrs: nounwind
define dso_local void @Indicate_Status(i8 noundef zeroext %0) local_unnamed_addr #0 {
  %2 = alloca i8, align 1
  store i8 %0, ptr %2, align 1
  %3 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 26), align 1
  %4 = call i32 @EgTagWriteByIndex(ptr noundef %3, ptr noundef nonnull %2, i16 noundef zeroext 1) #4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

declare dllimport i32 @EgTagWriteByIndex(ptr noundef, ptr noundef, i16 noundef zeroext) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: nounwind
define dso_local void @Indicate_Error(i8 noundef zeroext %0) local_unnamed_addr #0 {
  %2 = alloca i8, align 1
  store i8 %0, ptr %2, align 1
  %3 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 56), align 1
  %4 = call i32 @EgTagWriteByIndex(ptr noundef %3, ptr noundef nonnull %2, i16 noundef zeroext 4) #4
  ret void
}

; Function Attrs: nounwind
define dso_local void @Indicate_Run(i8 noundef zeroext %0) local_unnamed_addr #0 {
  %2 = alloca i8, align 1
  store i8 %0, ptr %2, align 1
  %3 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 86), align 1
  %4 = call i32 @EgTagWriteByIndex(ptr noundef %3, ptr noundef nonnull %2, i16 noundef zeroext 1) #4
  ret void
}

; Function Attrs: nounwind
define dso_local zeroext i8 @Indicate_Run_Get() local_unnamed_addr #0 {
  %1 = alloca i8, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #4
  store i8 0, ptr %1, align 1
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 86), align 1
  %3 = call i32 @EgTagReadByIndex(ptr noundef %2, ptr noundef nonnull %1, i16 noundef zeroext 1) #4
  %4 = load i8, ptr %1, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #4
  ret i8 %4
}

declare dllimport i32 @EgTagReadByIndex(ptr noundef, ptr noundef, i16 noundef zeroext) local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @Indicate_Live() local_unnamed_addr #0 {
  %1 = load i32, ptr @Indicate_Live.live, align 4
  %2 = add i32 %1, 1
  store i32 %2, ptr @Indicate_Live.live, align 4
  %3 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 116), align 1
  %4 = tail call i32 @EgTagWriteByIndex(ptr noundef %3, ptr noundef nonnull @Indicate_Live.live, i16 noundef zeroext 4) #4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Indicate_STATE_ON(i8 noundef zeroext %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 134), align 1
  store i8 %0, ptr %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Indicate_STATE_LOADING(i8 noundef zeroext %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 164), align 1
  store i8 %0, ptr %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Indicate_STATE_STOP(i8 noundef zeroext %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 194), align 1
  store i8 %0, ptr %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Indicate_STATE_RUN(i8 noundef zeroext %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 224), align 1
  store i8 %0, ptr %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Indicate_STATE_STEP(i8 noundef zeroext %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 254), align 1
  store i8 %0, ptr %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Indicate_STATE_HALT(i8 noundef zeroext %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 284), align 1
  store i8 %0, ptr %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Indicate_TASK_Period_us(i32 noundef %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 314), align 1
  store i32 %0, ptr %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Indicate_TASK_Watchdog_us(i32 noundef %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 344), align 1
  store i32 %0, ptr %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Indicate_TASK_Stack(i32 noundef %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 374), align 1
  store i32 %0, ptr %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Indicate_TASK_Prio(i32 noundef %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 404), align 1
  store i32 %0, ptr %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Indicate_TASK_MinDuration_ns(i32 noundef %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 434), align 1
  store i32 %0, ptr %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Indicate_TASK_MaxDuration_ns(i32 noundef %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 464), align 1
  store i32 %0, ptr %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Indicate_TASK_CurDuration_ns(i32 noundef %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 494), align 1
  store i32 %0, ptr %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Indicate_TASK_MinDelay_ns(i32 noundef %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 524), align 1
  store i32 %0, ptr %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Indicate_TASK_MaxDelay_ns(i32 noundef %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 554), align 1
  store i32 %0, ptr %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Indicate_TASK_CurDelay_ns(i32 noundef %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 584), align 1
  store i32 %0, ptr %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Indicate_DEBUG_FORCE(i8 noundef zeroext %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 614), align 1
  store i8 %0, ptr %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Indicate_DEBUG_BPSET(i8 noundef zeroext %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 644), align 1
  store i8 %0, ptr %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Indicate_DEBUG_EXCEPTICODE(i32 noundef %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 674), align 1
  store i32 %0, ptr %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Indicate_SYSTICK_CNT(i32 noundef %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 704), align 1
  store i32 %0, ptr %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Indicate_ERRORS(i32 noundef %0) local_unnamed_addr #3 {
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @indicate, i32 734), align 1
  store i32 %0, ptr %2, align 1
  ret void
}

; Function Attrs: nounwind
define dso_local zeroext i8 @Indicate_Init() local_unnamed_addr #0 {
  %1 = tail call zeroext i8 @Container_CreateTagsFromList(ptr noundef nonnull @indicate) #4
  ret i8 %1
}

declare dso_local zeroext i8 @Container_CreateTagsFromList(ptr noundef) local_unnamed_addr #2

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "indicate.c", directory: "D:\\work\\rtacc\\examples\\PLCP")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)"}
