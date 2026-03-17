; ModuleID = 'type.c'
source_filename = "type.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.TYPEMATCH = type <{ ptr, i16, i32, i32 }>

$LibVersion_0x0701 = comdat any

$"??_C@_05NCFAHBAN@BOOL?$CD?$AA@" = comdat any

$"??_C@_05DPBDMADO@SINT?$CD?$AA@" = comdat any

$"??_C@_04MCOJOMNJ@INT?$CD?$AA@" = comdat any

$"??_C@_05CBMAPCBN@DINT?$CD?$AA@" = comdat any

$"??_C@_05MNJDHAHA@LINT?$CD?$AA@" = comdat any

$"??_C@_06GCFAHIPD@USINT?$CD?$AA@" = comdat any

$"??_C@_05OJEKCDCD@UINT?$CD?$AA@" = comdat any

$"??_C@_06HMIDEKNA@UDINT?$CD?$AA@" = comdat any

$"??_C@_06JANAMILN@ULINT?$CD?$AA@" = comdat any

$"??_C@_05CNEHJGCP@TIME?$CD?$AA@" = comdat any

$"??_C@_05HLOJBMAE@REAL?$CD?$AA@" = comdat any

$"??_C@_06NEOMHNNE@LREAL?$CD?$AA@" = comdat any

$"??_C@_05LFDJPIDO@BYTE?$CD?$AA@" = comdat any

$"??_C@_05CNCLDMNP@WORD?$CD?$AA@" = comdat any

$"??_C@_06LBMBBDGI@DWORD?$CD?$AA@" = comdat any

$"??_C@_06IECHKAAB@QWORD?$CD?$AA@" = comdat any

$"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@" = comdat any

$"??_C@_07DCPMEJPJ@STRING?$CD?$AA@" = comdat any

$"??_C@_06HNBGDGBN@ARRAY?$CD?$AA@" = comdat any

$"??_C@_07HLOGPGIO@STRUCT?$CD?$AA@" = comdat any

$"??_C@_04PKEBDEEL@ANY?$CD?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@"??_C@_05NCFAHBAN@BOOL?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"BOOL#\00", comdat, align 1
@"??_C@_05DPBDMADO@SINT?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"SINT#\00", comdat, align 1
@"??_C@_04MCOJOMNJ@INT?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"INT#\00", comdat, align 1
@"??_C@_05CBMAPCBN@DINT?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"DINT#\00", comdat, align 1
@"??_C@_05MNJDHAHA@LINT?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"LINT#\00", comdat, align 1
@"??_C@_06GCFAHIPD@USINT?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"USINT#\00", comdat, align 1
@"??_C@_05OJEKCDCD@UINT?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"UINT#\00", comdat, align 1
@"??_C@_06HMIDEKNA@UDINT?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"UDINT#\00", comdat, align 1
@"??_C@_06JANAMILN@ULINT?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"ULINT#\00", comdat, align 1
@"??_C@_05CNEHJGCP@TIME?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"TIME#\00", comdat, align 1
@"??_C@_05HLOJBMAE@REAL?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"REAL#\00", comdat, align 1
@"??_C@_06NEOMHNNE@LREAL?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"LREAL#\00", comdat, align 1
@"??_C@_05LFDJPIDO@BYTE?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"BYTE#\00", comdat, align 1
@"??_C@_05CNCLDMNP@WORD?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"WORD#\00", comdat, align 1
@"??_C@_06LBMBBDGI@DWORD?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"DWORD#\00", comdat, align 1
@"??_C@_06IECHKAAB@QWORD?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"QWORD#\00", comdat, align 1
@"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"FUNCTION#\00", comdat, align 1
@"??_C@_07DCPMEJPJ@STRING?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"STRING#\00", comdat, align 1
@"??_C@_06HNBGDGBN@ARRAY?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"ARRAY#\00", comdat, align 1
@"??_C@_07HLOGPGIO@STRUCT?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"STRUCT#\00", comdat, align 1
@"??_C@_04PKEBDEEL@ANY?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"ANY#\00", comdat, align 1
@typematch = dso_local local_unnamed_addr global [22 x %struct.TYPEMATCH] [%struct.TYPEMATCH <{ ptr @"??_C@_05NCFAHBAN@BOOL?$CD?$AA@", i16 1536, i32 1, i32 1 }>, %struct.TYPEMATCH <{ ptr @"??_C@_05DPBDMADO@SINT?$CD?$AA@", i16 260, i32 2, i32 1 }>, %struct.TYPEMATCH <{ ptr @"??_C@_04MCOJOMNJ@INT?$CD?$AA@", i16 261, i32 4, i32 2 }>, %struct.TYPEMATCH <{ ptr @"??_C@_05CBMAPCBN@DINT?$CD?$AA@", i16 262, i32 6, i32 4 }>, %struct.TYPEMATCH <{ ptr @"??_C@_05MNJDHAHA@LINT?$CD?$AA@", i16 263, i32 8, i32 8 }>, %struct.TYPEMATCH <{ ptr @"??_C@_06GCFAHIPD@USINT?$CD?$AA@", i16 512, i32 3, i32 1 }>, %struct.TYPEMATCH <{ ptr @"??_C@_05OJEKCDCD@UINT?$CD?$AA@", i16 513, i32 5, i32 2 }>, %struct.TYPEMATCH <{ ptr @"??_C@_06HMIDEKNA@UDINT?$CD?$AA@", i16 514, i32 7, i32 4 }>, %struct.TYPEMATCH <{ ptr @"??_C@_06JANAMILN@ULINT?$CD?$AA@", i16 515, i32 9, i32 8 }>, %struct.TYPEMATCH <{ ptr @"??_C@_05CNEHJGCP@TIME?$CD?$AA@", i16 1347, i32 7, i32 4 }>, %struct.TYPEMATCH <{ ptr @"??_C@_05HLOJBMAE@REAL?$CD?$AA@", i16 782, i32 10, i32 4 }>, %struct.TYPEMATCH <{ ptr @"??_C@_06NEOMHNNE@LREAL?$CD?$AA@", i16 783, i32 11, i32 8 }>, %struct.TYPEMATCH <{ ptr @"??_C@_05LFDJPIDO@BYTE?$CD?$AA@", i16 16, i32 3, i32 1 }>, %struct.TYPEMATCH <{ ptr @"??_C@_05CNCLDMNP@WORD?$CD?$AA@", i16 17, i32 5, i32 2 }>, %struct.TYPEMATCH <{ ptr @"??_C@_06LBMBBDGI@DWORD?$CD?$AA@", i16 18, i32 7, i32 4 }>, %struct.TYPEMATCH <{ ptr @"??_C@_06IECHKAAB@QWORD?$CD?$AA@", i16 19, i32 9, i32 8 }>, %struct.TYPEMATCH <{ ptr @"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@", i16 1059, i32 13, i32 -1 }>, %struct.TYPEMATCH <{ ptr @"??_C@_07DCPMEJPJ@STRING?$CD?$AA@", i16 1346, i32 13, i32 83 }>, %struct.TYPEMATCH <{ ptr @"??_C@_06HNBGDGBN@ARRAY?$CD?$AA@", i16 1058, i32 13, i32 -1 }>, %struct.TYPEMATCH <{ ptr @"??_C@_07HLOGPGIO@STRUCT?$CD?$AA@", i16 1060, i32 13, i32 -1 }>, %struct.TYPEMATCH <{ ptr @"??_C@_04PKEBDEEL@ANY?$CD?$AA@", i16 -32767, i32 7, i32 4 }>, %struct.TYPEMATCH zeroinitializer], align 4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 65536) i32 @Type_GetSize(ptr noundef readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %3 = load i16, ptr %2, align 1
  switch i16 %3, label %16 [
    i16 1536, label %17
    i16 260, label %17
    i16 261, label %4
    i16 262, label %5
    i16 263, label %6
    i16 512, label %17
    i16 513, label %4
    i16 514, label %5
    i16 515, label %6
    i16 1347, label %5
    i16 782, label %5
    i16 783, label %6
    i16 16, label %17
    i16 17, label %4
    i16 18, label %5
    i16 19, label %6
    i16 -32767, label %5
    i16 1346, label %7
    i16 1059, label %8
    i16 1058, label %8
    i16 1060, label %8
  ]

4:                                                ; preds = %1, %1, %1
  br label %17

5:                                                ; preds = %1, %1, %1, %1, %1, %1
  br label %17

6:                                                ; preds = %1, %1, %1, %1
  br label %17

7:                                                ; preds = %1
  br label %17

8:                                                ; preds = %1, %1, %1
  %9 = getelementptr inbounds nuw i8, ptr %0, i32 6
  %10 = load ptr, ptr %9, align 1
  %11 = icmp eq ptr %10, null
  br i1 %11, label %17, label %12

12:                                               ; preds = %8
  %13 = getelementptr inbounds nuw i8, ptr %10, i32 5
  %14 = load i16, ptr %13, align 1
  %15 = zext i16 %14 to i32
  br label %17

16:                                               ; preds = %1
  br label %17

17:                                               ; preds = %8, %1, %1, %1, %1, %16, %12, %7, %6, %5, %4
  %18 = phi i32 [ 0, %16 ], [ 83, %7 ], [ 1, %1 ], [ 2, %4 ], [ 4, %5 ], [ 8, %6 ], [ 1, %1 ], [ 1, %1 ], [ 1, %1 ], [ %15, %12 ], [ 0, %8 ]
  ret i32 %18
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local ptr @Type_GetName(i16 noundef zeroext %0) local_unnamed_addr #1 {
  %2 = load ptr, ptr @typematch, align 4
  %3 = icmp eq ptr %2, null
  br i1 %3, label %17, label %4

4:                                                ; preds = %1
  %5 = load i16, ptr getelementptr inbounds nuw (i8, ptr @typematch, i32 4), align 4
  %6 = icmp eq i16 %0, %5
  br i1 %6, label %17, label %7

7:                                                ; preds = %4, %12
  %8 = phi ptr [ %9, %12 ], [ @typematch, %4 ]
  %9 = getelementptr inbounds nuw i8, ptr %8, i32 14
  %10 = load ptr, ptr %9, align 1
  %11 = icmp eq ptr %10, null
  br i1 %11, label %16, label %12, !llvm.loop !7

12:                                               ; preds = %7
  %13 = getelementptr inbounds nuw i8, ptr %8, i32 18
  %14 = load i16, ptr %13, align 1
  %15 = icmp eq i16 %0, %14
  br i1 %15, label %17, label %7, !llvm.loop !7

16:                                               ; preds = %7
  br label %17, !llvm.loop !7

17:                                               ; preds = %12, %4, %16, %1
  %18 = phi ptr [ null, %1 ], [ %2, %4 ], [ null, %16 ], [ %10, %12 ]
  ret ptr %18
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree norecurse nosync nounwind memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "type.c", directory: "D:\\work\\rtacc\\examples\\PLCP")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
