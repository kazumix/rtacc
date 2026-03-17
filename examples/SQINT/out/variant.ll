; ModuleID = '..\PLCP\variant.c'
source_filename = "..\\PLCP\\variant.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.T_ANY = type <{ %union.PANYVAL, i16, ptr, i8, i8, %struct.BITFIELD }>
%union.PANYVAL = type { ptr }
%struct.BITFIELD = type { i8, i8, i8 }
%struct.STRING = type <{ i16, [81 x i8] }>
%struct.ARRAY = type <{ i16, [1 x i8] }>

$LibVersion_0x0701 = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@VARIANT_EMPTY = dso_local local_unnamed_addr global %struct.T_ANY zeroinitializer, align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define dso_local zeroext range(i8 0, 2) i8 @Variant_IsEmpty(ptr noundef readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %3 = load i16, ptr %2, align 1
  %4 = icmp ne i16 %3, 0
  %5 = zext i1 %4 to i8
  ret i8 %5
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local zeroext i8 @Variant_IsWriteable(ptr noundef readonly captures(none) %0) local_unnamed_addr #1 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 6
  %3 = load ptr, ptr %2, align 1
  %4 = load i8, ptr %3, align 1
  ret i8 %4
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local double @Variant_Read_Lreal(ptr noundef readonly captures(none) %0) local_unnamed_addr #1 {
  %2 = load ptr, ptr %0, align 1
  %3 = load double, ptr %2, align 8
  ret double %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local float @Variant_Read_Real(ptr noundef readonly captures(none) %0) local_unnamed_addr #1 {
  %2 = load ptr, ptr %0, align 1
  %3 = load float, ptr %2, align 4
  ret float %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local i64 @Variant_Read_Lint(ptr noundef readonly captures(none) %0) local_unnamed_addr #1 {
  %2 = load ptr, ptr %0, align 1
  %3 = load i64, ptr %2, align 8
  ret i64 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local i32 @Variant_Read_Dint(ptr noundef readonly captures(none) %0) local_unnamed_addr #1 {
  %2 = load ptr, ptr %0, align 1
  %3 = load i32, ptr %2, align 4
  ret i32 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local signext i16 @Variant_Read_Int(ptr noundef readonly captures(none) %0) local_unnamed_addr #1 {
  %2 = load ptr, ptr %0, align 1
  %3 = load i16, ptr %2, align 2
  ret i16 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local signext i8 @Variant_Read_Sint(ptr noundef readonly captures(none) %0) local_unnamed_addr #1 {
  %2 = load ptr, ptr %0, align 1
  %3 = load i8, ptr %2, align 1
  ret i8 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local i64 @Variant_Read_Ulint(ptr noundef readonly captures(none) %0) local_unnamed_addr #1 {
  %2 = load ptr, ptr %0, align 1
  %3 = load i64, ptr %2, align 8
  ret i64 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local i32 @Variant_Read_Udint(ptr noundef readonly captures(none) %0) local_unnamed_addr #1 {
  %2 = load ptr, ptr %0, align 1
  %3 = load i32, ptr %2, align 4
  ret i32 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local zeroext i16 @Variant_Read_Uint(ptr noundef readonly captures(none) %0) local_unnamed_addr #1 {
  %2 = load ptr, ptr %0, align 1
  %3 = load i16, ptr %2, align 2
  ret i16 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local zeroext i8 @Variant_Read_Usint(ptr noundef readonly captures(none) %0) local_unnamed_addr #1 {
  %2 = load ptr, ptr %0, align 1
  %3 = load i8, ptr %2, align 1
  ret i8 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local i64 @Variant_Read_Qword(ptr noundef readonly captures(none) %0) local_unnamed_addr #1 {
  %2 = load ptr, ptr %0, align 1
  %3 = load i64, ptr %2, align 8
  ret i64 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local i32 @Variant_Read_Dword(ptr noundef readonly captures(none) %0) local_unnamed_addr #1 {
  %2 = load ptr, ptr %0, align 1
  %3 = load i32, ptr %2, align 4
  ret i32 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local zeroext i16 @Variant_Read_Word(ptr noundef readonly captures(none) %0) local_unnamed_addr #1 {
  %2 = load ptr, ptr %0, align 1
  %3 = load i16, ptr %2, align 2
  ret i16 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local zeroext i8 @Variant_Read_Byte(ptr noundef readonly captures(none) %0) local_unnamed_addr #1 {
  %2 = load ptr, ptr %0, align 1
  %3 = load i8, ptr %2, align 1
  ret i8 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local signext i8 @Variant_Read_Bool(ptr noundef readonly captures(none) %0) local_unnamed_addr #1 {
  %2 = load ptr, ptr %0, align 1
  %3 = load i8, ptr %2, align 1
  ret i8 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Variant_Read_String(ptr dead_on_unwind noalias writable writeonly sret(%struct.STRING) align 1 captures(none) initializes((0, 83)) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #2 {
  %3 = load ptr, ptr %1, align 1
  tail call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(83) %0, ptr noundef nonnull align 1 dereferenceable(83) %3, i32 83, i1 false)
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Variant_Read_Array(ptr dead_on_unwind noalias writable writeonly sret(%struct.ARRAY) align 1 captures(none) initializes((0, 3)) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #2 {
  %3 = load ptr, ptr %1, align 1
  tail call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(3) %0, ptr noundef nonnull align 1 dereferenceable(3) %3, i32 3, i1 false)
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Variant_Write_Lreal(ptr noundef captures(none) initializes((4, 6)) %0, double noundef %1) local_unnamed_addr #2 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 783, ptr %3, align 1
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 6
  %5 = load ptr, ptr %4, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr %0, align 1
  store double %1, ptr %9, align 8
  br label %10

10:                                               ; preds = %8, %2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Variant_Write_Real(ptr noundef captures(none) initializes((4, 6)) %0, float noundef %1) local_unnamed_addr #2 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 782, ptr %3, align 1
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 6
  %5 = load ptr, ptr %4, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr %0, align 1
  store float %1, ptr %9, align 4
  br label %10

10:                                               ; preds = %8, %2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Variant_Write_Lint(ptr noundef captures(none) initializes((4, 6)) %0, i64 noundef %1) local_unnamed_addr #2 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 263, ptr %3, align 1
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 6
  %5 = load ptr, ptr %4, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr %0, align 1
  store i64 %1, ptr %9, align 8
  br label %10

10:                                               ; preds = %8, %2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Variant_Write_Dint(ptr noundef captures(none) initializes((4, 6)) %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 262, ptr %3, align 1
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 6
  %5 = load ptr, ptr %4, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr %0, align 1
  store i32 %1, ptr %9, align 4
  br label %10

10:                                               ; preds = %8, %2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Variant_Write_Int(ptr noundef captures(none) initializes((4, 6)) %0, i16 noundef signext %1) local_unnamed_addr #2 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 261, ptr %3, align 1
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 6
  %5 = load ptr, ptr %4, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr %0, align 1
  store i16 %1, ptr %9, align 2
  br label %10

10:                                               ; preds = %8, %2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Variant_Write_Sint(ptr noundef captures(none) initializes((4, 6)) %0, i8 noundef signext %1) local_unnamed_addr #2 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 260, ptr %3, align 1
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 6
  %5 = load ptr, ptr %4, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr %0, align 1
  store i8 %1, ptr %9, align 1
  br label %10

10:                                               ; preds = %8, %2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Variant_Write_Ulint(ptr noundef captures(none) initializes((4, 6)) %0, i64 noundef %1) local_unnamed_addr #2 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 515, ptr %3, align 1
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 6
  %5 = load ptr, ptr %4, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr %0, align 1
  store i64 %1, ptr %9, align 8
  br label %10

10:                                               ; preds = %8, %2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Variant_Write_Udint(ptr noundef captures(none) initializes((4, 6)) %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 514, ptr %3, align 1
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 6
  %5 = load ptr, ptr %4, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr %0, align 1
  store i32 %1, ptr %9, align 4
  br label %10

10:                                               ; preds = %8, %2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Variant_Write_Uint(ptr noundef captures(none) initializes((4, 6)) %0, i16 noundef zeroext %1) local_unnamed_addr #2 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 513, ptr %3, align 1
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 6
  %5 = load ptr, ptr %4, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr %0, align 1
  store i16 %1, ptr %9, align 2
  br label %10

10:                                               ; preds = %8, %2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Variant_Write_Usint(ptr noundef captures(none) initializes((4, 6)) %0, i8 noundef zeroext %1) local_unnamed_addr #2 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 512, ptr %3, align 1
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 6
  %5 = load ptr, ptr %4, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr %0, align 1
  store i8 %1, ptr %9, align 1
  br label %10

10:                                               ; preds = %8, %2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Variant_Write_Qword(ptr noundef captures(none) initializes((4, 6)) %0, i64 noundef %1) local_unnamed_addr #2 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 19, ptr %3, align 1
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 6
  %5 = load ptr, ptr %4, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr %0, align 1
  store i64 %1, ptr %9, align 8
  br label %10

10:                                               ; preds = %8, %2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Variant_Write_Dword(ptr noundef captures(none) initializes((4, 6)) %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 18, ptr %3, align 1
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 6
  %5 = load ptr, ptr %4, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr %0, align 1
  store i32 %1, ptr %9, align 4
  br label %10

10:                                               ; preds = %8, %2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Variant_Write_Word(ptr noundef captures(none) initializes((4, 6)) %0, i16 noundef zeroext %1) local_unnamed_addr #2 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 17, ptr %3, align 1
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 6
  %5 = load ptr, ptr %4, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr %0, align 1
  store i16 %1, ptr %9, align 2
  br label %10

10:                                               ; preds = %8, %2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Variant_Write_Byte(ptr noundef captures(none) initializes((4, 6)) %0, i8 noundef zeroext %1) local_unnamed_addr #2 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 16, ptr %3, align 1
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 6
  %5 = load ptr, ptr %4, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr %0, align 1
  store i8 %1, ptr %9, align 1
  br label %10

10:                                               ; preds = %8, %2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Variant_Write_Bool(ptr noundef captures(none) initializes((4, 6)) %0, i8 noundef signext %1) local_unnamed_addr #2 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1536, ptr %3, align 1
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 6
  %5 = load ptr, ptr %4, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr %0, align 1
  store i8 %1, ptr %9, align 1
  br label %10

10:                                               ; preds = %8, %2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Variant_Write_String(ptr noundef captures(none) initializes((4, 6)) %0, ptr noundef readonly byval(%struct.STRING) align 4 captures(none) %1) local_unnamed_addr #2 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1346, ptr %3, align 1
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 6
  %5 = load ptr, ptr %4, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr %0, align 1
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(83) %9, ptr noundef nonnull align 4 dereferenceable(83) %1, i32 83, i1 false)
  br label %10

10:                                               ; preds = %8, %2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Variant_Write_Array(ptr noundef captures(none) initializes((4, 6)) %0, ptr noundef readonly byval(%struct.ARRAY) align 4 captures(none) %1) local_unnamed_addr #2 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 1058, ptr %3, align 1
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 6
  %5 = load ptr, ptr %4, align 1
  %6 = load i8, ptr %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr %0, align 1
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(3) %9, ptr noundef nonnull align 4 dereferenceable(3) %1, i32 3, i1 false)
  br label %10

10:                                               ; preds = %8, %2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @Variant_Write(ptr noundef captures(none) initializes((4, 6)) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #2 {
  %3 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %4 = load i16, ptr %3, align 1
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i16 %4, ptr %5, align 1
  %6 = getelementptr inbounds nuw i8, ptr %0, i32 6
  %7 = load ptr, ptr %6, align 1
  %8 = load i8, ptr %7, align 1
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %14, label %10

10:                                               ; preds = %2
  %11 = load ptr, ptr %1, align 1
  %12 = load i64, ptr %11, align 8
  %13 = load ptr, ptr %0, align 1
  store i64 %12, ptr %13, align 8
  br label %14

14:                                               ; preds = %10, %2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local i64 @Variant_Read(ptr noundef readonly captures(none) %0) local_unnamed_addr #1 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %3 = load i16, ptr %2, align 1
  switch i16 %3, label %124 [
    i16 19, label %4
    i16 18, label %13
    i16 17, label %20
    i16 16, label %25
    i16 263, label %28
    i16 262, label %37
    i16 261, label %44
    i16 260, label %49
    i16 515, label %52
    i16 514, label %61
    i16 513, label %68
    i16 512, label %73
    i16 783, label %76
    i16 782, label %86
    i16 1346, label %93
    i16 1058, label %100
    i16 1060, label %107
    i16 1347, label %114
    i16 1536, label %121
  ]

4:                                                ; preds = %1
  %5 = load ptr, ptr %0, align 1
  %6 = load i32, ptr %5, align 8
  %7 = getelementptr inbounds nuw i8, ptr %5, i32 4
  %8 = load i32, ptr %7, align 4
  %9 = trunc i32 %6 to i8
  %10 = lshr i32 %6, 8
  %11 = trunc i32 %10 to i16
  %12 = and i32 %6, -65536
  br label %124

13:                                               ; preds = %1
  %14 = load ptr, ptr %0, align 1
  %15 = load i32, ptr %14, align 4
  %16 = trunc i32 %15 to i8
  %17 = lshr i32 %15, 8
  %18 = trunc i32 %17 to i16
  %19 = and i32 %15, -65536
  br label %124

20:                                               ; preds = %1
  %21 = load ptr, ptr %0, align 1
  %22 = load i16, ptr %21, align 2
  %23 = trunc i16 %22 to i8
  %24 = lshr i16 %22, 8
  br label %124

25:                                               ; preds = %1
  %26 = load ptr, ptr %0, align 1
  %27 = load i8, ptr %26, align 1
  br label %124

28:                                               ; preds = %1
  %29 = load ptr, ptr %0, align 1
  %30 = load i32, ptr %29, align 8
  %31 = getelementptr inbounds nuw i8, ptr %29, i32 4
  %32 = load i32, ptr %31, align 4
  %33 = trunc i32 %30 to i8
  %34 = lshr i32 %30, 8
  %35 = trunc i32 %34 to i16
  %36 = and i32 %30, -65536
  br label %124

37:                                               ; preds = %1
  %38 = load ptr, ptr %0, align 1
  %39 = load i32, ptr %38, align 4
  %40 = trunc i32 %39 to i8
  %41 = lshr i32 %39, 8
  %42 = trunc i32 %41 to i16
  %43 = and i32 %39, -65536
  br label %124

44:                                               ; preds = %1
  %45 = load ptr, ptr %0, align 1
  %46 = load i16, ptr %45, align 2
  %47 = trunc i16 %46 to i8
  %48 = lshr i16 %46, 8
  br label %124

49:                                               ; preds = %1
  %50 = load ptr, ptr %0, align 1
  %51 = load i8, ptr %50, align 1
  br label %124

52:                                               ; preds = %1
  %53 = load ptr, ptr %0, align 1
  %54 = load i32, ptr %53, align 8
  %55 = getelementptr inbounds nuw i8, ptr %53, i32 4
  %56 = load i32, ptr %55, align 4
  %57 = trunc i32 %54 to i8
  %58 = lshr i32 %54, 8
  %59 = trunc i32 %58 to i16
  %60 = and i32 %54, -65536
  br label %124

61:                                               ; preds = %1
  %62 = load ptr, ptr %0, align 1
  %63 = load i32, ptr %62, align 4
  %64 = trunc i32 %63 to i8
  %65 = lshr i32 %63, 8
  %66 = trunc i32 %65 to i16
  %67 = and i32 %63, -65536
  br label %124

68:                                               ; preds = %1
  %69 = load ptr, ptr %0, align 1
  %70 = load i16, ptr %69, align 2
  %71 = trunc i16 %70 to i8
  %72 = lshr i16 %70, 8
  br label %124

73:                                               ; preds = %1
  %74 = load ptr, ptr %0, align 1
  %75 = load i8, ptr %74, align 1
  br label %124

76:                                               ; preds = %1
  %77 = load ptr, ptr %0, align 1
  %78 = load i64, ptr %77, align 8
  %79 = trunc i64 %78 to i8
  %80 = lshr i64 %78, 8
  %81 = trunc i64 %80 to i16
  %82 = trunc i64 %78 to i32
  %83 = and i32 %82, -65536
  %84 = lshr i64 %78, 32
  %85 = trunc nuw i64 %84 to i32
  br label %124

86:                                               ; preds = %1
  %87 = load ptr, ptr %0, align 1
  %88 = load i32, ptr %87, align 4
  %89 = trunc i32 %88 to i8
  %90 = lshr i32 %88, 8
  %91 = trunc i32 %90 to i16
  %92 = and i32 %88, -65536
  br label %124

93:                                               ; preds = %1
  %94 = load ptr, ptr %0, align 1
  %95 = ptrtoint ptr %94 to i32
  %96 = trunc i32 %95 to i8
  %97 = lshr i32 %95, 8
  %98 = trunc i32 %97 to i16
  %99 = and i32 %95, -65536
  br label %124

100:                                              ; preds = %1
  %101 = load ptr, ptr %0, align 1
  %102 = ptrtoint ptr %101 to i32
  %103 = trunc i32 %102 to i8
  %104 = lshr i32 %102, 8
  %105 = trunc i32 %104 to i16
  %106 = and i32 %102, -65536
  br label %124

107:                                              ; preds = %1
  %108 = load ptr, ptr %0, align 1
  %109 = ptrtoint ptr %108 to i32
  %110 = trunc i32 %109 to i8
  %111 = lshr i32 %109, 8
  %112 = trunc i32 %111 to i16
  %113 = and i32 %109, -65536
  br label %124

114:                                              ; preds = %1
  %115 = load ptr, ptr %0, align 1
  %116 = load i32, ptr %115, align 4
  %117 = trunc i32 %116 to i8
  %118 = lshr i32 %116, 8
  %119 = trunc i32 %118 to i16
  %120 = and i32 %116, -65536
  br label %124

121:                                              ; preds = %1
  %122 = load ptr, ptr %0, align 1
  %123 = load i8, ptr %122, align 1
  br label %124

124:                                              ; preds = %1, %121, %114, %107, %100, %93, %86, %76, %73, %68, %61, %52, %49, %44, %37, %28, %25, %20, %13, %4
  %125 = phi i16 [ 0, %1 ], [ %11, %4 ], [ %18, %13 ], [ %24, %20 ], [ 0, %25 ], [ %35, %28 ], [ %42, %37 ], [ %48, %44 ], [ 0, %49 ], [ %59, %52 ], [ %66, %61 ], [ %72, %68 ], [ 0, %73 ], [ %81, %76 ], [ %91, %86 ], [ %98, %93 ], [ %105, %100 ], [ %112, %107 ], [ %119, %114 ], [ 0, %121 ]
  %126 = phi i32 [ 0, %1 ], [ %12, %4 ], [ %19, %13 ], [ 0, %20 ], [ 0, %25 ], [ %36, %28 ], [ %43, %37 ], [ 0, %44 ], [ 0, %49 ], [ %60, %52 ], [ %67, %61 ], [ 0, %68 ], [ 0, %73 ], [ %83, %76 ], [ %92, %86 ], [ %99, %93 ], [ %106, %100 ], [ %113, %107 ], [ %120, %114 ], [ 0, %121 ]
  %127 = phi i32 [ 0, %1 ], [ %8, %4 ], [ 0, %13 ], [ 0, %20 ], [ 0, %25 ], [ %32, %28 ], [ 0, %37 ], [ 0, %44 ], [ 0, %49 ], [ %56, %52 ], [ 0, %61 ], [ 0, %68 ], [ 0, %73 ], [ %85, %76 ], [ 0, %86 ], [ 0, %93 ], [ 0, %100 ], [ 0, %107 ], [ 0, %114 ], [ 0, %121 ]
  %128 = phi i8 [ 0, %1 ], [ %9, %4 ], [ %16, %13 ], [ %23, %20 ], [ %27, %25 ], [ %33, %28 ], [ %40, %37 ], [ %47, %44 ], [ %51, %49 ], [ %57, %52 ], [ %64, %61 ], [ %71, %68 ], [ %75, %73 ], [ %79, %76 ], [ %89, %86 ], [ %96, %93 ], [ %103, %100 ], [ %110, %107 ], [ %117, %114 ], [ %123, %121 ]
  %129 = shl i16 %125, 8
  %130 = zext i8 %128 to i16
  %131 = or disjoint i16 %129, %130
  %132 = zext i16 %131 to i32
  %133 = or disjoint i32 %126, %132
  %134 = zext i32 %127 to i64
  %135 = shl nuw i64 %134, 32
  %136 = zext i32 %133 to i64
  %137 = or disjoint i64 %135, %136
  ret i64 %137
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\variant.c", directory: "C:\\D_DRV\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)"}
