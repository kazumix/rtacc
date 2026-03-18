; ModuleID = '..\PLCP\reservedword.c'
source_filename = "..\\PLCP\\reservedword.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.RESERVEDWORDTEMPLATE = type <{ ptr, i16 }>
%union.tHashCode = type { %struct.anon }
%struct.anon = type { i32, i32, i32, i32 }

$LibVersion_0x0701 = comdat any

$"??_C@_03MJAIKILM@VAR?$AA@" = comdat any

$"??_C@_07NGKNHKAE@END_VAR?$AA@" = comdat any

$"??_C@_04PPJDIBFE@BOOL?$AA@" = comdat any

$"??_C@_04ELFAHOMP@BYTE?$AA@" = comdat any

$"??_C@_03JMHEAPMO@INT?$AA@" = comdat any

$"??_C@_04PKFANLLI@REAL?$AA@" = comdat any

$"??_C@_04OHBONDIN@TIME?$AA@" = comdat any

$"??_C@_06IGECGLFO@STRING?$AA@" = comdat any

$"??_C@_02NJNGHICB@IF?$AA@" = comdat any

$"??_C@_04LCEFDMJL@THEN?$AA@" = comdat any

$"??_C@_04JLPIBDPH@ELSE?$AA@" = comdat any

$"??_C@_04OGNCDOIK@CASE?$AA@" = comdat any

$"??_C@_02NNFLAEJD@OF?$AA@" = comdat any

$"??_C@_03JDIPNCCJ@FOR?$AA@" = comdat any

$"??_C@_02BMOKPDEL@TO?$AA@" = comdat any

$"??_C@_02MMFADL@DO?$AA@" = comdat any

$"??_C@_04MOOLDHHD@STEP?$AA@" = comdat any

$"??_C@_05CFKHKNMI@WHILE?$AA@" = comdat any

$"??_C@_06LCBKFLKD@REPEAT?$AA@" = comdat any

$"??_C@_05JCFFAPID@UNTIL?$AA@" = comdat any

$"??_C@_03BDACDFHA@AND?$AA@" = comdat any

$"??_C@_02PDPFNDMG@OR?$AA@" = comdat any

$"??_C@_03CDEJPCIF@XOR?$AA@" = comdat any

$"??_C@_03GBFNEA@NOT?$AA@" = comdat any

$"??_C@_06LJMOENAO@RETURN?$AA@" = comdat any

$"??_C@_07DKOHAGLI@PROGRAM?$AA@" = comdat any

$"??_C@_0M@DCFEMEMK@END_PROGRAM?$AA@" = comdat any

$"??_C@_08KPDMMFC@FUNCTION?$AA@" = comdat any

$"??_C@_0N@LEPAGPIA@END_FUNCTION?$AA@" = comdat any

$"??_C@_0CK@FHKDIDKH@reservedword?5hash?5conflict?$CB?5?$CFs?4?5@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@"??_C@_03MJAIKILM@VAR?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"VAR\00", comdat, align 1
@"??_C@_07NGKNHKAE@END_VAR?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"END_VAR\00", comdat, align 1
@"??_C@_04PPJDIBFE@BOOL?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"BOOL\00", comdat, align 1
@"??_C@_04ELFAHOMP@BYTE?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"BYTE\00", comdat, align 1
@"??_C@_03JMHEAPMO@INT?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"INT\00", comdat, align 1
@"??_C@_04PKFANLLI@REAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"REAL\00", comdat, align 1
@"??_C@_04OHBONDIN@TIME?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"TIME\00", comdat, align 1
@"??_C@_06IGECGLFO@STRING?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"STRING\00", comdat, align 1
@"??_C@_02NJNGHICB@IF?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"IF\00", comdat, align 1
@"??_C@_04LCEFDMJL@THEN?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"THEN\00", comdat, align 1
@"??_C@_04JLPIBDPH@ELSE?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"ELSE\00", comdat, align 1
@"??_C@_04OGNCDOIK@CASE?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"CASE\00", comdat, align 1
@"??_C@_02NNFLAEJD@OF?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"OF\00", comdat, align 1
@"??_C@_03JDIPNCCJ@FOR?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"FOR\00", comdat, align 1
@"??_C@_02BMOKPDEL@TO?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"TO\00", comdat, align 1
@"??_C@_02MMFADL@DO?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"DO\00", comdat, align 1
@"??_C@_04MOOLDHHD@STEP?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"STEP\00", comdat, align 1
@"??_C@_05CFKHKNMI@WHILE?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"WHILE\00", comdat, align 1
@"??_C@_06LCBKFLKD@REPEAT?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"REPEAT\00", comdat, align 1
@"??_C@_05JCFFAPID@UNTIL?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"UNTIL\00", comdat, align 1
@"??_C@_03BDACDFHA@AND?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"AND\00", comdat, align 1
@"??_C@_02PDPFNDMG@OR?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"OR\00", comdat, align 1
@"??_C@_03CDEJPCIF@XOR?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"XOR\00", comdat, align 1
@"??_C@_03GBFNEA@NOT?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"NOT\00", comdat, align 1
@"??_C@_06LJMOENAO@RETURN?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"RETURN\00", comdat, align 1
@"??_C@_07DKOHAGLI@PROGRAM?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"PROGRAM\00", comdat, align 1
@"??_C@_0M@DCFEMEMK@END_PROGRAM?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"END_PROGRAM\00", comdat, align 1
@"??_C@_08KPDMMFC@FUNCTION?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"FUNCTION\00", comdat, align 1
@"??_C@_0N@LEPAGPIA@END_FUNCTION?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"END_FUNCTION\00", comdat, align 1
@reservedwords = dso_local local_unnamed_addr global [29 x ptr] [ptr @"??_C@_03MJAIKILM@VAR?$AA@", ptr @"??_C@_07NGKNHKAE@END_VAR?$AA@", ptr @"??_C@_04PPJDIBFE@BOOL?$AA@", ptr @"??_C@_04ELFAHOMP@BYTE?$AA@", ptr @"??_C@_03JMHEAPMO@INT?$AA@", ptr @"??_C@_04PKFANLLI@REAL?$AA@", ptr @"??_C@_04OHBONDIN@TIME?$AA@", ptr @"??_C@_06IGECGLFO@STRING?$AA@", ptr @"??_C@_02NJNGHICB@IF?$AA@", ptr @"??_C@_04LCEFDMJL@THEN?$AA@", ptr @"??_C@_04JLPIBDPH@ELSE?$AA@", ptr @"??_C@_04OGNCDOIK@CASE?$AA@", ptr @"??_C@_02NNFLAEJD@OF?$AA@", ptr @"??_C@_03JDIPNCCJ@FOR?$AA@", ptr @"??_C@_02BMOKPDEL@TO?$AA@", ptr @"??_C@_02MMFADL@DO?$AA@", ptr @"??_C@_04MOOLDHHD@STEP?$AA@", ptr @"??_C@_05CFKHKNMI@WHILE?$AA@", ptr @"??_C@_06LCBKFLKD@REPEAT?$AA@", ptr @"??_C@_05JCFFAPID@UNTIL?$AA@", ptr @"??_C@_03BDACDFHA@AND?$AA@", ptr @"??_C@_02PDPFNDMG@OR?$AA@", ptr @"??_C@_03CDEJPCIF@XOR?$AA@", ptr @"??_C@_03GBFNEA@NOT?$AA@", ptr @"??_C@_06LJMOENAO@RETURN?$AA@", ptr @"??_C@_07DKOHAGLI@PROGRAM?$AA@", ptr @"??_C@_0M@DCFEMEMK@END_PROGRAM?$AA@", ptr @"??_C@_08KPDMMFC@FUNCTION?$AA@", ptr @"??_C@_0N@LEPAGPIA@END_FUNCTION?$AA@"], align 4
@ReservedwordCatalog = dso_local local_unnamed_addr global [255 x %struct.RESERVEDWORDTEMPLATE] zeroinitializer, align 1
@"??_C@_0CK@FHKDIDKH@reservedword?5hash?5conflict?$CB?5?$CFs?4?5@" = linkonce_odr dso_local unnamed_addr constant [42 x i8] c"reservedword hash conflict! %s. skipped.\0A\00", comdat, align 1

; Function Attrs: nounwind
define dso_local zeroext range(i16 0, 256) i16 @Reservedword_CalcHash(ptr noundef %0) local_unnamed_addr #0 {
  %2 = alloca %union.tHashCode, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #5
  call void @_Hash(ptr dead_on_unwind nonnull writable sret(%union.tHashCode) align 1 %2, ptr noundef %0) #5
  %3 = getelementptr inbounds nuw i8, ptr %2, i32 4
  %4 = load i32, ptr %3, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #5
  %5 = trunc i32 %4 to i16
  %6 = and i16 %5, 255
  ret i16 %6
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

declare dso_local void @_Hash(ptr dead_on_unwind writable sret(%union.tHashCode) align 1, ptr noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: nounwind
define dso_local noundef i32 @Reservedword_CreateCatalog() local_unnamed_addr #0 {
  %1 = alloca %union.tHashCode, align 1
  %2 = getelementptr inbounds nuw i8, ptr %1, i32 4
  br label %3

3:                                                ; preds = %0, %15
  %4 = phi i32 [ 0, %0 ], [ %16, %15 ]
  %5 = getelementptr inbounds nuw ptr, ptr @reservedwords, i32 %4
  %6 = load ptr, ptr %5, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #5
  call void @_Hash(ptr dead_on_unwind nonnull writable sret(%union.tHashCode) align 1 %1, ptr noundef %6) #5
  %7 = load i32, ptr %2, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #5
  %8 = and i32 %7, 255
  %9 = getelementptr inbounds nuw %struct.RESERVEDWORDTEMPLATE, ptr @ReservedwordCatalog, i32 %8
  %10 = load ptr, ptr %9, align 1
  %11 = icmp eq ptr %10, null
  br i1 %11, label %14, label %12

12:                                               ; preds = %3
  %13 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CK@FHKDIDKH@reservedword?5hash?5conflict?$CB?5?$CFs?4?5@", ptr noundef %6)
  br label %15

14:                                               ; preds = %3
  store ptr %6, ptr %9, align 1
  br label %15

15:                                               ; preds = %14, %12
  %16 = add nuw nsw i32 %4, 1
  %17 = icmp eq i32 %16, 29
  br i1 %17, label %18, label %3, !llvm.loop !7

18:                                               ; preds = %15
  ret i32 0
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local zeroext range(i8 0, 2) i8 @Reservedword_Check(ptr noundef %0) local_unnamed_addr #0 {
  %2 = alloca %union.tHashCode, align 1
  %3 = icmp eq ptr %0, null
  br i1 %3, label %15, label %4

4:                                                ; preds = %1
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #5
  call void @_Hash(ptr dead_on_unwind nonnull writable sret(%union.tHashCode) align 1 %2, ptr noundef nonnull %0) #5
  %5 = getelementptr inbounds nuw i8, ptr %2, i32 4
  %6 = load i32, ptr %5, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #5
  %7 = and i32 %6, 255
  %8 = getelementptr inbounds nuw %struct.RESERVEDWORDTEMPLATE, ptr @ReservedwordCatalog, i32 %7
  %9 = load ptr, ptr %8, align 1
  %10 = icmp eq ptr %9, null
  br i1 %10, label %15, label %11

11:                                               ; preds = %4
  %12 = call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %9, ptr noundef nonnull dereferenceable(1) %0) #5
  %13 = icmp eq i32 %12, 0
  %14 = zext i1 %13 to i8
  br label %15

15:                                               ; preds = %11, %4, %1
  %16 = phi i8 [ 0, %1 ], [ %14, %11 ], [ 0, %4 ]
  ret i8 %16
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strcmp(ptr noundef captures(none), ptr noundef captures(none)) local_unnamed_addr #4

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\reservedword.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
