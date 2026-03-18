; ModuleID = '..\PLCP\bitfield.c'
source_filename = "..\\PLCP\\bitfield.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.BITFIELD = type { i8, i8, i8 }

$LibVersion_0x0701 = comdat any

$"??_C@_04HGICJEGC@?4X?$CFd?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@"??_C@_04HGICJEGC@?4X?$CFd?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c".X%d\00", comdat, align 1

; Function Attrs: nofree nounwind
define dso_local void @Bitfield_Check(ptr dead_on_unwind noalias writable writeonly sret(%struct.BITFIELD) align 1 captures(none) initializes((0, 3)) %0, ptr noundef readonly %1) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  tail call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(3) %0, i8 0, i32 3, i1 false)
  %4 = icmp eq ptr %1, null
  br i1 %4, label %19, label %5

5:                                                ; preds = %2
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #9
  store i32 -1, ptr %3, align 4
  %6 = tail call ptr @strrchr(ptr noundef nonnull dereferenceable(1) %1, i32 noundef 46) #9
  %7 = icmp eq ptr %6, null
  br i1 %7, label %18, label %8

8:                                                ; preds = %5
  %9 = call i32 (ptr, ptr, ...) @sscanf(ptr noundef nonnull %6, ptr noundef nonnull @"??_C@_04HGICJEGC@?4X?$CFd?$AA@", ptr noundef nonnull %3)
  %10 = icmp eq i32 %9, 1
  %11 = load i32, ptr %3, align 4
  %12 = icmp ult i32 %11, 64
  %13 = select i1 %10, i1 %12, i1 false
  br i1 %13, label %14, label %18

14:                                               ; preds = %8
  store i8 1, ptr %0, align 1
  %15 = trunc nuw nsw i32 %11 to i8
  %16 = getelementptr inbounds nuw i8, ptr %0, i32 1
  store i8 %15, ptr %16, align 1
  %17 = getelementptr inbounds nuw i8, ptr %0, i32 2
  store i8 0, ptr %17, align 1
  br label %18

18:                                               ; preds = %8, %14, %5
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #9
  br label %19

19:                                               ; preds = %2, %18
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local ptr @strrchr(ptr noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @sscanf(ptr noundef readonly captures(none), ptr noundef readonly captures(none), ...) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @LD_byte(ptr noundef writeonly captures(none) initializes((0, 1)) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #5 {
  %3 = getelementptr inbounds nuw i8, ptr %1, i32 12
  %4 = load i8, ptr %3, align 1
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %16, label %6

6:                                                ; preds = %2
  %7 = load ptr, ptr %1, align 1
  %8 = load i8, ptr %7, align 1
  %9 = zext i8 %8 to i32
  %10 = getelementptr inbounds nuw i8, ptr %1, i32 13
  %11 = load i8, ptr %10, align 1
  %12 = zext nneg i8 %11 to i32
  %13 = lshr i32 %9, %12
  %14 = trunc nuw i32 %13 to i8
  %15 = and i8 %14, 1
  br label %24

16:                                               ; preds = %2
  %17 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %18 = load i16, ptr %17, align 1
  %19 = icmp eq i16 %18, 1536
  %20 = load ptr, ptr %1, align 1
  %21 = load i8, ptr %20, align 1
  %22 = and i8 %21, 1
  %23 = select i1 %19, i8 %22, i8 %21
  br label %24

24:                                               ; preds = %16, %6
  %25 = phi i8 [ %15, %6 ], [ %23, %16 ]
  store i8 %25, ptr %0, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @LDN_byte(ptr noundef writeonly captures(none) initializes((0, 1)) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #5 {
  %3 = getelementptr inbounds nuw i8, ptr %1, i32 12
  %4 = load i8, ptr %3, align 1
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %17, label %6

6:                                                ; preds = %2
  %7 = load ptr, ptr %1, align 1
  %8 = load i8, ptr %7, align 1
  %9 = zext i8 %8 to i32
  %10 = getelementptr inbounds nuw i8, ptr %1, i32 13
  %11 = load i8, ptr %10, align 1
  %12 = zext nneg i8 %11 to i32
  %13 = lshr i32 %9, %12
  %14 = trunc nuw i32 %13 to i8
  %15 = and i8 %14, 1
  %16 = xor i8 %15, 1
  br label %28

17:                                               ; preds = %2
  %18 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %19 = load i16, ptr %18, align 1
  %20 = icmp eq i16 %19, 1536
  %21 = load ptr, ptr %1, align 1
  %22 = load i8, ptr %21, align 1
  br i1 %20, label %23, label %26

23:                                               ; preds = %17
  %24 = and i8 %22, 1
  %25 = xor i8 %24, 1
  br label %28

26:                                               ; preds = %17
  %27 = xor i8 %22, -1
  br label %28

28:                                               ; preds = %23, %26, %6
  %29 = phi i8 [ %16, %6 ], [ %25, %23 ], [ %27, %26 ]
  store i8 %29, ptr %0, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @LD_word(ptr noundef writeonly captures(none) initializes((0, 2)) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #5 {
  %3 = getelementptr inbounds nuw i8, ptr %1, i32 12
  %4 = load i8, ptr %3, align 1
  %5 = icmp eq i8 %4, 0
  %6 = load ptr, ptr %1, align 1
  %7 = load i16, ptr %6, align 2
  br i1 %5, label %16, label %8

8:                                                ; preds = %2
  %9 = zext i16 %7 to i32
  %10 = getelementptr inbounds nuw i8, ptr %1, i32 13
  %11 = load i8, ptr %10, align 1
  %12 = zext nneg i8 %11 to i32
  %13 = lshr i32 %9, %12
  %14 = trunc nuw i32 %13 to i16
  %15 = and i16 %14, 1
  br label %16

16:                                               ; preds = %2, %8
  %17 = phi i16 [ %15, %8 ], [ %7, %2 ]
  store i16 %17, ptr %0, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @LDN_word(ptr noundef writeonly captures(none) initializes((0, 2)) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #5 {
  %3 = getelementptr inbounds nuw i8, ptr %1, i32 12
  %4 = load i8, ptr %3, align 1
  %5 = icmp eq i8 %4, 0
  %6 = load ptr, ptr %1, align 1
  %7 = load i16, ptr %6, align 2
  br i1 %5, label %17, label %8

8:                                                ; preds = %2
  %9 = zext i16 %7 to i32
  %10 = getelementptr inbounds nuw i8, ptr %1, i32 13
  %11 = load i8, ptr %10, align 1
  %12 = zext nneg i8 %11 to i32
  %13 = lshr i32 %9, %12
  %14 = trunc nuw i32 %13 to i16
  %15 = and i16 %14, 1
  %16 = xor i16 %15, 1
  br label %19

17:                                               ; preds = %2
  %18 = xor i16 %7, -1
  br label %19

19:                                               ; preds = %17, %8
  %20 = phi i16 [ %18, %17 ], [ %16, %8 ]
  store i16 %20, ptr %0, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @LD_dword(ptr noundef writeonly captures(none) initializes((0, 4)) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #5 {
  %3 = getelementptr inbounds nuw i8, ptr %1, i32 12
  %4 = load i8, ptr %3, align 1
  %5 = icmp eq i8 %4, 0
  %6 = load ptr, ptr %1, align 1
  %7 = load i32, ptr %6, align 4
  br i1 %5, label %14, label %8

8:                                                ; preds = %2
  %9 = getelementptr inbounds nuw i8, ptr %1, i32 13
  %10 = load i8, ptr %9, align 1
  %11 = zext nneg i8 %10 to i32
  %12 = lshr i32 %7, %11
  %13 = and i32 %12, 1
  br label %14

14:                                               ; preds = %2, %8
  %15 = phi i32 [ %13, %8 ], [ %7, %2 ]
  store i32 %15, ptr %0, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @LDN_dword(ptr noundef writeonly captures(none) initializes((0, 4)) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #5 {
  %3 = getelementptr inbounds nuw i8, ptr %1, i32 12
  %4 = load i8, ptr %3, align 1
  %5 = icmp eq i8 %4, 0
  %6 = load ptr, ptr %1, align 1
  %7 = load i32, ptr %6, align 4
  br i1 %5, label %15, label %8

8:                                                ; preds = %2
  %9 = getelementptr inbounds nuw i8, ptr %1, i32 13
  %10 = load i8, ptr %9, align 1
  %11 = zext nneg i8 %10 to i32
  %12 = lshr i32 %7, %11
  %13 = and i32 %12, 1
  %14 = xor i32 %13, 1
  br label %17

15:                                               ; preds = %2
  %16 = xor i32 %7, -1
  br label %17

17:                                               ; preds = %15, %8
  %18 = phi i32 [ %16, %15 ], [ %14, %8 ]
  store i32 %18, ptr %0, align 4
  ret void
}

; Function Attrs: nounwind
define dso_local void @LD_qword(ptr noundef %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #6 {
  %3 = load ptr, ptr %1, align 1
  tail call void @Variable_Copy64(ptr noundef %0, ptr noundef %3) #9
  ret void
}

declare dso_local void @Variable_Copy64(ptr noundef, ptr noundef) local_unnamed_addr #7

; Function Attrs: nounwind
define dso_local void @LDN_qword(ptr noundef %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #6 {
  %3 = load ptr, ptr %1, align 1
  %4 = load i64, ptr %3, align 8
  %5 = trunc i64 %4 to i32
  %6 = xor i32 %5, -1
  %7 = inttoptr i32 %6 to ptr
  tail call void @Variable_Copy64(ptr noundef %0, ptr noundef %7) #9
  ret void
}

; Function Attrs: nounwind
define dso_local void @LD_string(ptr noundef %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #6 {
  %3 = load ptr, ptr %1, align 1
  tail call void @String_Copy(ptr noundef %0, ptr noundef %3) #9
  ret void
}

declare dso_local void @String_Copy(ptr noundef, ptr noundef) local_unnamed_addr #7

; Function Attrs: nounwind
define dso_local void @ST_string(ptr noundef readonly captures(none) %0, ptr noundef %1) local_unnamed_addr #6 {
  %3 = load ptr, ptr %0, align 1
  tail call void @String_Copy(ptr noundef %3, ptr noundef %1) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @ST_byte(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #8 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 12
  %4 = load i8, ptr %3, align 1
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %26, label %6

6:                                                ; preds = %2
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 13
  %8 = load i8, ptr %7, align 1
  %9 = zext nneg i8 %8 to i32
  %10 = shl nuw i32 1, %9
  %11 = load ptr, ptr %0, align 1
  %12 = load i8, ptr %11, align 1
  %13 = trunc i32 %10 to i8
  %14 = xor i8 %13, -1
  %15 = and i8 %12, %14
  store i8 %15, ptr %11, align 1
  %16 = load i8, ptr %1, align 1
  %17 = and i8 %16, 1
  %18 = zext nneg i8 %17 to i32
  %19 = load i8, ptr %7, align 1
  %20 = zext nneg i8 %19 to i32
  %21 = shl nuw i32 %18, %20
  %22 = load ptr, ptr %0, align 1
  %23 = load i8, ptr %22, align 1
  %24 = trunc i32 %21 to i8
  %25 = or i8 %23, %24
  store i8 %25, ptr %22, align 1
  br label %29

26:                                               ; preds = %2
  %27 = load i8, ptr %1, align 1
  %28 = load ptr, ptr %0, align 1
  store i8 %27, ptr %28, align 1
  br label %29

29:                                               ; preds = %26, %6
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @STN_byte(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #8 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 12
  %4 = load i8, ptr %3, align 1
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %27, label %6

6:                                                ; preds = %2
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 13
  %8 = load i8, ptr %7, align 1
  %9 = zext nneg i8 %8 to i32
  %10 = shl nuw i32 1, %9
  %11 = load ptr, ptr %0, align 1
  %12 = load i8, ptr %11, align 1
  %13 = trunc i32 %10 to i8
  %14 = xor i8 %13, -1
  %15 = and i8 %12, %14
  store i8 %15, ptr %11, align 1
  %16 = load i8, ptr %1, align 1
  %17 = and i8 %16, 1
  %18 = xor i8 %17, 1
  %19 = zext nneg i8 %18 to i32
  %20 = load i8, ptr %7, align 1
  %21 = zext nneg i8 %20 to i32
  %22 = shl nuw i32 %19, %21
  %23 = load ptr, ptr %0, align 1
  %24 = load i8, ptr %23, align 1
  %25 = trunc i32 %22 to i8
  %26 = or i8 %24, %25
  store i8 %26, ptr %23, align 1
  br label %31

27:                                               ; preds = %2
  %28 = load i8, ptr %1, align 1
  %29 = xor i8 %28, -1
  %30 = load ptr, ptr %0, align 1
  store i8 %29, ptr %30, align 1
  br label %31

31:                                               ; preds = %27, %6
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @ST_word(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #8 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 12
  %4 = load i8, ptr %3, align 1
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %26, label %6

6:                                                ; preds = %2
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 13
  %8 = load i8, ptr %7, align 1
  %9 = zext nneg i8 %8 to i32
  %10 = shl nuw i32 1, %9
  %11 = load ptr, ptr %0, align 1
  %12 = load i16, ptr %11, align 2
  %13 = trunc i32 %10 to i16
  %14 = xor i16 %13, -1
  %15 = and i16 %12, %14
  store i16 %15, ptr %11, align 2
  %16 = load i16, ptr %1, align 2
  %17 = and i16 %16, 1
  %18 = zext nneg i16 %17 to i32
  %19 = load i8, ptr %7, align 1
  %20 = zext nneg i8 %19 to i32
  %21 = shl nuw i32 %18, %20
  %22 = load ptr, ptr %0, align 1
  %23 = load i16, ptr %22, align 2
  %24 = trunc i32 %21 to i16
  %25 = or i16 %23, %24
  store i16 %25, ptr %22, align 2
  br label %29

26:                                               ; preds = %2
  %27 = load i16, ptr %1, align 2
  %28 = load ptr, ptr %0, align 1
  store i16 %27, ptr %28, align 2
  br label %29

29:                                               ; preds = %26, %6
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @STN_word(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #8 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 12
  %4 = load i8, ptr %3, align 1
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %27, label %6

6:                                                ; preds = %2
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 13
  %8 = load i8, ptr %7, align 1
  %9 = zext nneg i8 %8 to i32
  %10 = shl nuw i32 1, %9
  %11 = load ptr, ptr %0, align 1
  %12 = load i16, ptr %11, align 2
  %13 = trunc i32 %10 to i16
  %14 = xor i16 %13, -1
  %15 = and i16 %12, %14
  store i16 %15, ptr %11, align 2
  %16 = load i16, ptr %1, align 2
  %17 = and i16 %16, 1
  %18 = xor i16 %17, 1
  %19 = zext nneg i16 %18 to i32
  %20 = load i8, ptr %7, align 1
  %21 = zext nneg i8 %20 to i32
  %22 = shl nuw i32 %19, %21
  %23 = load ptr, ptr %0, align 1
  %24 = load i16, ptr %23, align 2
  %25 = trunc i32 %22 to i16
  %26 = or i16 %24, %25
  store i16 %26, ptr %23, align 2
  br label %31

27:                                               ; preds = %2
  %28 = load i16, ptr %1, align 2
  %29 = xor i16 %28, -1
  %30 = load ptr, ptr %0, align 1
  store i16 %29, ptr %30, align 2
  br label %31

31:                                               ; preds = %27, %6
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @ST_dword(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #8 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 12
  %4 = load i8, ptr %3, align 1
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %23, label %6

6:                                                ; preds = %2
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 13
  %8 = load i8, ptr %7, align 1
  %9 = zext nneg i8 %8 to i32
  %10 = shl nuw i32 1, %9
  %11 = xor i32 %10, -1
  %12 = load ptr, ptr %0, align 1
  %13 = load i32, ptr %12, align 4
  %14 = and i32 %13, %11
  store i32 %14, ptr %12, align 4
  %15 = load i32, ptr %1, align 4
  %16 = and i32 %15, 1
  %17 = load i8, ptr %7, align 1
  %18 = zext nneg i8 %17 to i32
  %19 = shl nuw i32 %16, %18
  %20 = load ptr, ptr %0, align 1
  %21 = load i32, ptr %20, align 4
  %22 = or i32 %21, %19
  store i32 %22, ptr %20, align 4
  br label %26

23:                                               ; preds = %2
  %24 = load i32, ptr %1, align 4
  %25 = load ptr, ptr %0, align 1
  store i32 %24, ptr %25, align 4
  br label %26

26:                                               ; preds = %23, %6
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @STN_dword(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #8 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 12
  %4 = load i8, ptr %3, align 1
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %24, label %6

6:                                                ; preds = %2
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 13
  %8 = load i8, ptr %7, align 1
  %9 = zext nneg i8 %8 to i32
  %10 = shl nuw i32 1, %9
  %11 = xor i32 %10, -1
  %12 = load ptr, ptr %0, align 1
  %13 = load i32, ptr %12, align 4
  %14 = and i32 %13, %11
  store i32 %14, ptr %12, align 4
  %15 = load i32, ptr %1, align 4
  %16 = and i32 %15, 1
  %17 = xor i32 %16, 1
  %18 = load i8, ptr %7, align 1
  %19 = zext nneg i8 %18 to i32
  %20 = shl nuw i32 %17, %19
  %21 = load ptr, ptr %0, align 1
  %22 = load i32, ptr %21, align 4
  %23 = or i32 %22, %20
  store i32 %23, ptr %21, align 4
  br label %28

24:                                               ; preds = %2
  %25 = load i32, ptr %1, align 4
  %26 = xor i32 %25, -1
  %27 = load ptr, ptr %0, align 1
  store i32 %26, ptr %27, align 4
  br label %28

28:                                               ; preds = %24, %6
  ret void
}

; Function Attrs: nounwind
define dso_local void @ST_qword(ptr noundef readonly captures(none) %0, ptr noundef %1) local_unnamed_addr #6 {
  %3 = load ptr, ptr %0, align 1
  tail call void @Variable_Copy64(ptr noundef %3, ptr noundef %1) #9
  ret void
}

; Function Attrs: nounwind
define dso_local void @STN_qword(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #6 {
  %3 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #9
  %4 = load i64, ptr %1, align 8
  %5 = xor i64 %4, -1
  store i64 %5, ptr %3, align 8
  %6 = load ptr, ptr %0, align 1
  call void @Variable_Copy64(ptr noundef %6, ptr noundef nonnull %3) #9
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #9
  ret void
}

attributes #0 = { nofree nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\bitfield.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
