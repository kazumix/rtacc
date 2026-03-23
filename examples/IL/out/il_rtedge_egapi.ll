; ModuleID = 'il_rtedge_egapi.c'
source_filename = "il_rtedge_egapi.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$"??_C@_00CNPNBAHC@?$AA@" = comdat any

$"??_C@_07DCPMEJPJ@STRING?$CD?$AA@" = comdat any

$"??_C@_05NCFAHBAN@BOOL?$CD?$AA@" = comdat any

$"??_C@_04MCOJOMNJ@INT?$CD?$AA@" = comdat any

$"??_C@_05OJEKCDCD@UINT?$CD?$AA@" = comdat any

$"??_C@_05CNEHJGCP@TIME?$CD?$AA@" = comdat any

$"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@" = comdat any

@"??_C@_00CNPNBAHC@?$AA@" = linkonce_odr dso_local unnamed_addr constant [1 x i8] zeroinitializer, comdat, align 1
@"??_C@_07DCPMEJPJ@STRING?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"STRING#\00", comdat, align 1
@"??_C@_05NCFAHBAN@BOOL?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"BOOL#\00", comdat, align 1
@"??_C@_04MCOJOMNJ@INT?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"INT#\00", comdat, align 1
@"??_C@_05OJEKCDCD@UINT?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"UINT#\00", comdat, align 1
@"??_C@_05CNEHJGCP@TIME?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"TIME#\00", comdat, align 1
@"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"FUNCTION#\00", comdat, align 1
@il_kw = internal unnamed_addr constant [7 x { ptr, i16, [2 x i8], i32, i32 }] [{ ptr, i16, [2 x i8], i32, i32 } { ptr @"??_C@_05NCFAHBAN@BOOL?$CD?$AA@", i16 1536, [2 x i8] zeroinitializer, i32 1, i32 1 }, { ptr, i16, [2 x i8], i32, i32 } { ptr @"??_C@_04MCOJOMNJ@INT?$CD?$AA@", i16 261, [2 x i8] zeroinitializer, i32 4, i32 2 }, { ptr, i16, [2 x i8], i32, i32 } { ptr @"??_C@_05OJEKCDCD@UINT?$CD?$AA@", i16 513, [2 x i8] zeroinitializer, i32 5, i32 2 }, { ptr, i16, [2 x i8], i32, i32 } { ptr @"??_C@_05CNEHJGCP@TIME?$CD?$AA@", i16 1347, [2 x i8] zeroinitializer, i32 7, i32 4 }, { ptr, i16, [2 x i8], i32, i32 } { ptr @"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@", i16 1059, [2 x i8] zeroinitializer, i32 13, i32 -1 }, { ptr, i16, [2 x i8], i32, i32 } { ptr @"??_C@_07DCPMEJPJ@STRING?$CD?$AA@", i16 1346, [2 x i8] zeroinitializer, i32 13, i32 83 }, { ptr, i16, [2 x i8], i32, i32 } zeroinitializer], align 4

; Function Attrs: nounwind
define dso_local zeroext range(i8 0, 2) i8 @Rtedge_TagCreateByInstruction(ptr noundef %0, i8 noundef zeroext %1) local_unnamed_addr #0 {
  %3 = alloca [256 x i8], align 1
  %4 = alloca i16, align 2
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #8
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #8
  %5 = icmp eq ptr %0, null
  br i1 %5, label %111, label %6

6:                                                ; preds = %2
  %7 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %0) #8
  %8 = add i32 %7, 1
  %9 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(6) @"??_C@_05NCFAHBAN@BOOL?$CD?$AA@", i32 noundef 5) #8
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %86

11:                                               ; preds = %98, %95, %92, %89, %86, %6
  %12 = phi ptr [ @il_kw, %6 ], [ getelementptr inbounds nuw (i8, ptr @il_kw, i32 16), %86 ], [ getelementptr inbounds nuw (i8, ptr @il_kw, i32 32), %89 ], [ getelementptr inbounds nuw (i8, ptr @il_kw, i32 48), %92 ], [ getelementptr inbounds nuw (i8, ptr @il_kw, i32 64), %95 ], [ getelementptr inbounds nuw (i8, ptr @il_kw, i32 80), %98 ]
  %13 = phi i32 [ 5, %6 ], [ 4, %86 ], [ 5, %89 ], [ 5, %92 ], [ 9, %95 ], [ 7, %98 ]
  %14 = tail call ptr @malloc(i32 noundef %8) #9
  %15 = icmp eq ptr %14, null
  br i1 %15, label %111, label %16

16:                                               ; preds = %11
  tail call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %14, ptr nonnull align 1 %0, i32 %8, i1 false)
  %17 = getelementptr inbounds nuw i8, ptr %12, i32 4
  %18 = load i16, ptr %17, align 4
  switch i16 %18, label %83 [
    i16 1059, label %19
    i16 1346, label %64
    i16 1536, label %78
    i16 261, label %75
    i16 513, label %76
    i16 1347, label %77
  ]

19:                                               ; preds = %16
  %20 = tail call ptr @strrchr(ptr noundef nonnull dereferenceable(1) %14, i32 noundef 35) #8
  %21 = icmp eq ptr %20, null
  br i1 %21, label %22, label %23

22:                                               ; preds = %19
  tail call void @free(ptr noundef nonnull %14)
  br label %111

23:                                               ; preds = %19
  store i8 0, ptr %20, align 1
  %24 = getelementptr inbounds nuw i8, ptr %20, i32 1
  %25 = getelementptr inbounds nuw i8, ptr %14, i32 %13
  store i16 0, ptr %4, align 2
  %26 = load i8, ptr %25, align 1
  switch i8 %26, label %39 [
    i8 67, label %27
    i8 84, label %31
  ]

27:                                               ; preds = %23
  %28 = getelementptr inbounds nuw i8, ptr %25, i32 1
  %29 = load i8, ptr %28, align 1
  %30 = icmp eq i8 %29, 84
  br i1 %30, label %31, label %39

31:                                               ; preds = %27, %23
  %32 = phi i32 [ 2, %27 ], [ 1, %23 ]
  %33 = phi i8 [ 85, %27 ], [ 80, %23 ]
  %34 = phi i16 [ 32, %27 ], [ 40, %23 ]
  %35 = getelementptr inbounds nuw i8, ptr %25, i32 %32
  %36 = load i8, ptr %35, align 1
  %37 = icmp eq i8 %36, %33
  %38 = select i1 %37, i16 %34, i16 64
  br label %39

39:                                               ; preds = %31, %27, %23
  %40 = phi i16 [ 64, %27 ], [ 64, %23 ], [ %38, %31 ]
  %41 = call i32 @EgTagCreateSegment(ptr noundef nonnull %24, i16 noundef zeroext 13, i16 noundef zeroext %40, ptr noundef nonnull %14, ptr noundef nonnull @"??_C@_00CNPNBAHC@?$AA@", ptr noundef nonnull %3, i16 noundef zeroext 256, ptr noundef nonnull %4) #8
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %43, label %104

43:                                               ; preds = %39
  %44 = load i8, ptr %25, align 1
  switch i8 %44, label %57 [
    i8 67, label %45
    i8 84, label %49
  ]

45:                                               ; preds = %43
  %46 = getelementptr inbounds nuw i8, ptr %25, i32 1
  %47 = load i8, ptr %46, align 1
  %48 = icmp eq i8 %47, 84
  br i1 %48, label %49, label %57

49:                                               ; preds = %45, %43
  %50 = phi i32 [ 2, %45 ], [ 1, %43 ]
  %51 = phi i8 [ 85, %45 ], [ 80, %43 ]
  %52 = phi i16 [ 32, %45 ], [ 40, %43 ]
  %53 = getelementptr inbounds nuw i8, ptr %25, i32 %50
  %54 = load i8, ptr %53, align 1
  %55 = icmp eq i8 %54, %51
  %56 = select i1 %55, i16 %52, i16 64
  br label %57

57:                                               ; preds = %43, %45, %49
  %58 = phi i16 [ 64, %45 ], [ 64, %43 ], [ %56, %49 ]
  %59 = zext nneg i16 %58 to i32
  %60 = call ptr @calloc(i32 noundef 1, i32 noundef %59) #10
  %61 = icmp eq ptr %60, null
  br i1 %61, label %103, label %62

62:                                               ; preds = %57
  %63 = call i32 @EgTagWriteSegment(ptr noundef nonnull %24, i16 noundef zeroext 0, ptr noundef nonnull %60, i16 noundef zeroext %58) #8
  br label %101

64:                                               ; preds = %16
  %65 = getelementptr inbounds nuw i8, ptr %14, i32 %13
  store i16 0, ptr %4, align 2
  %66 = icmp eq i8 %1, 0
  br i1 %66, label %67, label %103

67:                                               ; preds = %64
  %68 = call i32 @EgTagCreateSegment(ptr noundef nonnull %65, i16 noundef zeroext 13, i16 noundef zeroext 83, ptr noundef nonnull @"??_C@_07DCPMEJPJ@STRING?$CD?$AA@", ptr noundef nonnull @"??_C@_00CNPNBAHC@?$AA@", ptr noundef nonnull %3, i16 noundef zeroext 256, ptr noundef nonnull %4) #8
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %70, label %104

70:                                               ; preds = %67
  %71 = call dereferenceable_or_null(83) ptr @calloc(i32 noundef 1, i32 noundef 83) #10
  %72 = icmp eq ptr %71, null
  br i1 %72, label %103, label %73

73:                                               ; preds = %70
  %74 = call i32 @EgTagWriteSegment(ptr noundef nonnull %65, i16 noundef zeroext 0, ptr noundef nonnull %71, i16 noundef zeroext 83) #8
  br label %101

75:                                               ; preds = %16
  br label %78

76:                                               ; preds = %16
  br label %78

77:                                               ; preds = %16
  br label %78

78:                                               ; preds = %16, %77, %76, %75
  %79 = phi ptr [ @il_kw, %16 ], [ getelementptr inbounds nuw (i8, ptr @il_kw, i32 48), %77 ], [ getelementptr inbounds nuw (i8, ptr @il_kw, i32 16), %75 ], [ getelementptr inbounds nuw (i8, ptr @il_kw, i32 32), %76 ]
  %80 = getelementptr inbounds nuw i8, ptr %79, i32 8
  %81 = load i32, ptr %80, align 4
  %82 = trunc i32 %81 to i16
  br label %83

83:                                               ; preds = %16, %78
  %84 = phi i16 [ %82, %78 ], [ 99, %16 ]
  %85 = icmp eq i8 %1, 0
  br i1 %85, label %105, label %103

86:                                               ; preds = %6
  %87 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(5) @"??_C@_04MCOJOMNJ@INT?$CD?$AA@", i32 noundef 4) #8
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %11, label %89

89:                                               ; preds = %86
  %90 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(6) @"??_C@_05OJEKCDCD@UINT?$CD?$AA@", i32 noundef 5) #8
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %11, label %92

92:                                               ; preds = %89
  %93 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(6) @"??_C@_05CNEHJGCP@TIME?$CD?$AA@", i32 noundef 5) #8
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %11, label %95

95:                                               ; preds = %92
  %96 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(10) @"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@", i32 noundef 9) #8
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %11, label %98

98:                                               ; preds = %95
  %99 = tail call i32 @strncmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(8) @"??_C@_07DCPMEJPJ@STRING?$CD?$AA@", i32 noundef 7) #8
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %11, label %111

101:                                              ; preds = %73, %62
  %102 = phi ptr [ %60, %62 ], [ %71, %73 ]
  call void @free(ptr noundef nonnull %102)
  br label %103

103:                                              ; preds = %101, %70, %57, %64, %83
  call void @free(ptr noundef nonnull %14)
  br label %109

104:                                              ; preds = %39, %67
  call void @free(ptr noundef nonnull %14)
  br label %111

105:                                              ; preds = %83
  %106 = getelementptr inbounds nuw i8, ptr %14, i32 %13
  %107 = tail call i32 @EgTagCreateEx(ptr noundef nonnull %106, i16 noundef zeroext %84, ptr noundef nonnull %14, ptr noundef nonnull @"??_C@_00CNPNBAHC@?$AA@") #8
  %108 = icmp eq i32 %107, 0
  tail call void @free(ptr noundef nonnull %14)
  br i1 %108, label %109, label %111

109:                                              ; preds = %103, %105
  %110 = call zeroext i8 @il_rtedge_registry_push(ptr noundef nonnull %0, i8 noundef zeroext %1) #8
  br label %111

111:                                              ; preds = %98, %104, %22, %11, %109, %105, %2
  %112 = phi i8 [ 0, %2 ], [ 0, %11 ], [ 0, %22 ], [ 1, %109 ], [ 0, %105 ], [ 0, %104 ], [ 0, %98 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #8
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #8
  ret i8 %112
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strlen(ptr noundef captures(none)) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strncmp(ptr noundef captures(none), ptr noundef captures(none), i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare dso_local noalias noundef ptr @malloc(i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #4

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local ptr @strrchr(ptr noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare dso_local void @free(ptr allocptr noundef captures(none)) local_unnamed_addr #5

declare dllimport i32 @EgTagCreateSegment(ptr noundef, i16 noundef zeroext, i16 noundef zeroext, ptr noundef, ptr noundef, ptr noundef, i16 noundef zeroext, ptr noundef) local_unnamed_addr #6

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite)
declare dso_local noalias noundef ptr @calloc(i32 noundef, i32 noundef) local_unnamed_addr #7

declare dllimport i32 @EgTagWriteSegment(ptr noundef, i16 noundef zeroext, ptr noundef, i16 noundef zeroext) local_unnamed_addr #6

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

declare dllimport i32 @EgTagCreateEx(ptr noundef, i16 noundef zeroext, ptr noundef, ptr noundef) local_unnamed_addr #6

declare dso_local zeroext i8 @il_rtedge_registry_push(ptr noundef, i8 noundef zeroext) local_unnamed_addr #6

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { allocsize(0) }
attributes #10 = { allocsize(0,1) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "il_rtedge_egapi.c", directory: "D:\\work\\rtacc\\examples\\IL")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
