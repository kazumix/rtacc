; ModuleID = '..\PLCP\project.c'
source_filename = "..\\PLCP\\project.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_0BH@GBGNGJD@Project_Load?3ufuncname?$AA@" = comdat any

$"??_C@_0CF@BCBIENMJ@Project_Loadinstructiontemplatee@" = comdat any

$"??_C@_00CNPNBAHC@?$AA@" = comdat any

$"??_C@_05ILMMJGEC@BEGIN?$AA@" = comdat any

$"??_C@_05JEIAEFOF@FINAL?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@"??_C@_0BH@GBGNGJD@Project_Load?3ufuncname?$AA@" = linkonce_odr dso_local unnamed_addr constant [23 x i8] c"Project_Load:ufuncname\00", comdat, align 1
@"??_C@_0CF@BCBIENMJ@Project_Loadinstructiontemplatee@" = linkonce_odr dso_local unnamed_addr constant [37 x i8] c"Project_Loadinstructiontemplateentry\00", comdat, align 1
@"??_C@_00CNPNBAHC@?$AA@" = linkonce_odr dso_local unnamed_addr constant [1 x i8] zeroinitializer, comdat, align 1
@"??_C@_05ILMMJGEC@BEGIN?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"BEGIN\00", comdat, align 1
@"??_C@_05JEIAEFOF@FINAL?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"FINAL\00", comdat, align 1

; Function Attrs: nounwind
define dso_local void @Project_Reset() local_unnamed_addr #0 {
  tail call void @Label_Clear() #4
  tail call void @Userfunction_Clear() #4
  tail call void @UserFB_Clear() #4
  tail call void @Instruction_FUFBReset() #4
  %1 = tail call i32 @Instruction_CreateCatalog() #4
  %2 = tail call i32 @Basicfunction_CreateCatalog() #4
  tail call void @Logic_SetEntrypoint(ptr noundef null) #4
  tail call void @Logic_SetBeginpoint(ptr noundef null) #4
  tail call void @Logic_SetFinalpoint(ptr noundef null) #4
  ret void
}

declare dso_local void @Label_Clear() local_unnamed_addr #1

declare dso_local void @Userfunction_Clear() local_unnamed_addr #1

declare dso_local void @UserFB_Clear() local_unnamed_addr #1

declare dso_local void @Instruction_FUFBReset() local_unnamed_addr #1

declare dso_local i32 @Instruction_CreateCatalog() local_unnamed_addr #1

declare dso_local i32 @Basicfunction_CreateCatalog() local_unnamed_addr #1

declare dso_local void @Logic_SetEntrypoint(ptr noundef) local_unnamed_addr #1

declare dso_local void @Logic_SetBeginpoint(ptr noundef) local_unnamed_addr #1

declare dso_local void @Logic_SetFinalpoint(ptr noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @Project_Load() local_unnamed_addr #0 {
  %1 = tail call ptr @Config_Get_MnmFilePath() #4
  %2 = load i8, ptr %1, align 1
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %83, label %4

4:                                                ; preds = %0
  tail call void @Label_Clear() #4
  tail call void @Userfunction_Clear() #4
  tail call void @UserFB_Clear() #4
  tail call void @Instruction_FUFBReset() #4
  %5 = tail call i32 @Instruction_CreateCatalog() #4
  %6 = tail call i32 @Basicfunction_CreateCatalog() #4
  tail call void @Logic_SetEntrypoint(ptr noundef null) #4
  tail call void @Logic_SetBeginpoint(ptr noundef null) #4
  tail call void @Logic_SetFinalpoint(ptr noundef null) #4
  %7 = tail call ptr @Poufile_First() #4
  %8 = icmp eq ptr %7, null
  br i1 %8, label %34, label %9

9:                                                ; preds = %4, %31
  %10 = phi i32 [ %15, %31 ], [ 0, %4 ]
  %11 = phi ptr [ %32, %31 ], [ %7, %4 ]
  tail call void @Instruction_FUFBReset() #4
  %12 = tail call ptr @MnmFile_Base(ptr noundef nonnull %11) #4
  %13 = tail call ptr @Scope_set(ptr noundef %12) #4
  %14 = tail call i32 @MnmFile_Load(ptr noundef nonnull %11) #4
  %15 = add nsw i32 %14, %10
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %31

17:                                               ; preds = %9
  %18 = tail call zeroext i8 @Instruction_IsUF() #4
  %19 = icmp eq i8 %18, 0
  br i1 %19, label %29, label %20

20:                                               ; preds = %17
  %21 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %12) #4
  %22 = add i32 %21, 1
  %23 = tail call ptr @Heap_Alloc(i32 noundef %22, ptr noundef nonnull @"??_C@_0BH@GBGNGJD@Project_Load?3ufuncname?$AA@") #4
  %24 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %23, ptr noundef nonnull dereferenceable(1) %12) #4
  %25 = tail call ptr @Heap_Alloc(i32 noundef 19, ptr noundef nonnull @"??_C@_0CF@BCBIENMJ@Project_Loadinstructiontemplatee@") #4
  %26 = getelementptr inbounds nuw i8, ptr %25, i32 6
  store i8 1, ptr %26, align 1
  store ptr %23, ptr %25, align 1
  %27 = getelementptr inbounds nuw i8, ptr %25, i32 13
  store ptr @Userfunction_ReplaceInstruction, ptr %27, align 1
  %28 = tail call i32 @Instruction_CreateUserfunctionCatalog(ptr noundef nonnull %12, ptr noundef nonnull %25) #4
  br label %29

29:                                               ; preds = %20, %17
  %30 = tail call zeroext i8 @Instruction_IsUFB() #4
  br label %31

31:                                               ; preds = %29, %9
  %32 = tail call ptr @Poufile_Next() #4
  %33 = icmp eq ptr %32, null
  br i1 %33, label %34, label %9, !llvm.loop !7

34:                                               ; preds = %31, %4
  %35 = phi i32 [ 0, %4 ], [ %15, %31 ]
  tail call void @Instruction_FUFBReset() #4
  %36 = tail call ptr @Scope_set(ptr noundef nonnull @"??_C@_00CNPNBAHC@?$AA@") #4
  %37 = tail call ptr @Poufile_Get_Begin() #4
  %38 = load i8, ptr %37, align 1
  %39 = icmp eq i8 %38, 0
  br i1 %39, label %43, label %40

40:                                               ; preds = %34
  %41 = tail call i32 @MnmFile_Load(ptr noundef nonnull %37) #4
  %42 = add nsw i32 %41, %35
  br label %43

43:                                               ; preds = %40, %34
  %44 = phi i32 [ %42, %40 ], [ %35, %34 ]
  %45 = tail call ptr @Poufile_Get_Final() #4
  %46 = load i8, ptr %45, align 1
  %47 = icmp eq i8 %46, 0
  br i1 %47, label %51, label %48

48:                                               ; preds = %43
  %49 = tail call i32 @MnmFile_Load(ptr noundef nonnull %45) #4
  %50 = add nsw i32 %49, %44
  br label %51

51:                                               ; preds = %48, %43
  %52 = phi i32 [ %50, %48 ], [ %44, %43 ]
  %53 = tail call ptr @Scope_set(ptr noundef nonnull @"??_C@_00CNPNBAHC@?$AA@") #4
  %54 = tail call ptr @Config_Get_MnmFilePath() #4
  %55 = load i8, ptr %54, align 1
  %56 = icmp eq i8 %55, 0
  br i1 %56, label %60, label %57

57:                                               ; preds = %51
  %58 = tail call i32 @MnmFile_Load(ptr noundef nonnull %54) #4
  %59 = add nsw i32 %58, %52
  br label %60

60:                                               ; preds = %57, %51
  %61 = phi i32 [ %59, %57 ], [ %52, %51 ]
  %62 = tail call ptr @Config_Get_BaseName() #4
  %63 = tail call ptr @Label_Search(ptr noundef %62) #4
  %64 = icmp eq ptr %63, null
  br i1 %64, label %68, label %65

65:                                               ; preds = %60
  %66 = getelementptr inbounds nuw i8, ptr %63, i32 8
  %67 = load ptr, ptr %66, align 1
  tail call void @Logic_SetEntrypoint(ptr noundef %67) #4
  br label %70

68:                                               ; preds = %60
  tail call void @Errorlog_Add(i32 noundef 0, i32 noundef 131, ptr noundef %62) #4
  %69 = add nsw i32 %61, 1
  br label %70

70:                                               ; preds = %68, %65
  %71 = phi i32 [ %61, %65 ], [ %69, %68 ]
  %72 = tail call ptr @Label_Search(ptr noundef nonnull @"??_C@_05ILMMJGEC@BEGIN?$AA@") #4
  %73 = icmp eq ptr %72, null
  br i1 %73, label %77, label %74

74:                                               ; preds = %70
  %75 = getelementptr inbounds nuw i8, ptr %72, i32 8
  %76 = load ptr, ptr %75, align 1
  tail call void @Logic_SetBeginpoint(ptr noundef %76) #4
  br label %77

77:                                               ; preds = %74, %70
  %78 = tail call ptr @Label_Search(ptr noundef nonnull @"??_C@_05JEIAEFOF@FINAL?$AA@") #4
  %79 = icmp eq ptr %78, null
  br i1 %79, label %83, label %80

80:                                               ; preds = %77
  %81 = getelementptr inbounds nuw i8, ptr %78, i32 8
  %82 = load ptr, ptr %81, align 1
  tail call void @Logic_SetFinalpoint(ptr noundef %82) #4
  br label %83

83:                                               ; preds = %77, %80, %0
  %84 = phi i32 [ 0, %0 ], [ %71, %80 ], [ %71, %77 ]
  ret i32 %84
}

declare dso_local ptr @Config_Get_MnmFilePath() local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strlen(ptr noundef captures(none)) local_unnamed_addr #2

declare dso_local ptr @Poufile_First() local_unnamed_addr #1

declare dso_local ptr @MnmFile_Base(ptr noundef) local_unnamed_addr #1

declare dso_local ptr @Scope_set(ptr noundef) local_unnamed_addr #1

declare dso_local i32 @MnmFile_Load(ptr noundef) local_unnamed_addr #1

declare dso_local zeroext i8 @Instruction_IsUF() local_unnamed_addr #1

declare dso_local ptr @Heap_Alloc(i32 noundef, ptr noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none)) local_unnamed_addr #3

declare dso_local ptr @Userfunction_ReplaceInstruction(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

declare dso_local i32 @Instruction_CreateUserfunctionCatalog(ptr noundef, ptr noundef) local_unnamed_addr #1

declare dso_local zeroext i8 @Instruction_IsUFB() local_unnamed_addr #1

declare dso_local ptr @Poufile_Next() local_unnamed_addr #1

declare dso_local ptr @Poufile_Get_Begin() local_unnamed_addr #1

declare dso_local ptr @Poufile_Get_Final() local_unnamed_addr #1

declare dso_local ptr @Config_Get_BaseName() local_unnamed_addr #1

declare dso_local ptr @Label_Search(ptr noundef) local_unnamed_addr #1

declare dso_local void @Errorlog_Add(i32 noundef, i32 noundef, ptr noundef) local_unnamed_addr #1

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\project.c", directory: "C:\\D_DRV\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
