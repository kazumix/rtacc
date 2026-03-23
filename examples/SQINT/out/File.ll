; ModuleID = '..\PLCPFB\File.c'
source_filename = "..\\PLCPFB\\File.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

$LibVersion_0x0701 = comdat any

$"??_C@_02BOGAIONP@ab?$AA@" = comdat any

$"??_C@_0O@CFPBLGNB@?$CFs?0?50x?$CFx?0?5?$CFd?6?$AA@" = comdat any

$"??_C@_01KDCPPGHE@r?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@"??_C@_02BOGAIONP@ab?$AA@" = linkonce_odr dso_local unnamed_addr constant [3 x i8] c"ab\00", comdat, align 1
@"??_C@_0O@CFPBLGNB@?$CFs?0?50x?$CFx?0?5?$CFd?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"%s, 0x%x, %d\0A\00", comdat, align 1
@"??_C@_01KDCPPGHE@r?$AA@" = linkonce_odr dso_local unnamed_addr constant [2 x i8] c"r\00", comdat, align 1
@str = private unnamed_addr constant [23 x i8] c"FileWriteTread started\00", align 1
@str.1 = private unnamed_addr constant [24 x i8] c"FileWriteTread finished\00", align 1
@str.2 = private unnamed_addr constant [22 x i8] c"FileReadTread started\00", align 1
@str.3 = private unnamed_addr constant [23 x i8] c"FileReadTread finished\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local zeroext range(i16 1, 10) i16 @ReturnErrorID(i32 noundef %0) local_unnamed_addr #0 {
  switch i32 %0, label %4 [
    i32 6, label %5
    i32 38, label %2
    i32 66, label %3
  ]

2:                                                ; preds = %1
  br label %5

3:                                                ; preds = %1
  br label %5

4:                                                ; preds = %1
  br label %5

5:                                                ; preds = %1, %4, %3, %2
  %6 = phi i16 [ 9, %4 ], [ 7, %3 ], [ 2, %2 ], [ 1, %1 ]
  ret i16 %6
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local zeroext range(i16 0, 84) i16 @ReturnDataSize(i16 noundef zeroext %0) local_unnamed_addr #0 {
  switch i16 %0, label %6 [
    i16 1536, label %7
    i16 16, label %7
    i16 260, label %7
    i16 512, label %7
    i16 261, label %2
    i16 513, label %2
    i16 17, label %2
    i16 262, label %3
    i16 514, label %3
    i16 18, label %3
    i16 782, label %3
    i16 263, label %4
    i16 515, label %4
    i16 19, label %4
    i16 783, label %4
    i16 1346, label %5
  ]

2:                                                ; preds = %1, %1, %1
  br label %7

3:                                                ; preds = %1, %1, %1, %1
  br label %7

4:                                                ; preds = %1, %1, %1, %1
  br label %7

5:                                                ; preds = %1
  br label %7

6:                                                ; preds = %1
  br label %7

7:                                                ; preds = %1, %1, %1, %1, %6, %5, %4, %3, %2
  %8 = phi i16 [ 0, %6 ], [ 83, %5 ], [ 2, %2 ], [ 4, %3 ], [ 8, %4 ], [ 1, %1 ], [ 1, %1 ], [ 1, %1 ], [ 1, %1 ]
  ret i16 %8
}

; Function Attrs: nounwind
define dso_local void @FileWriteThread(ptr noundef readonly captures(none) %0) #1 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 98
  %3 = load ptr, ptr %2, align 1
  %4 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %5 = tail call ptr @fopen(ptr noundef %3, ptr noundef nonnull @"??_C@_02BOGAIONP@ab?$AA@")
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %17

7:                                                ; preds = %1
  %8 = getelementptr inbounds nuw i8, ptr %3, i32 1113
  store i8 1, ptr %8, align 1
  %9 = getelementptr inbounds nuw i8, ptr %3, i32 1112
  store i8 0, ptr %9, align 1
  %10 = tail call i32 @GetLastRtError() #8
  switch i32 %10, label %13 [
    i32 6, label %14
    i32 38, label %11
    i32 66, label %12
  ]

11:                                               ; preds = %7
  br label %14

12:                                               ; preds = %7
  br label %14

13:                                               ; preds = %7
  br label %14

14:                                               ; preds = %7, %11, %12, %13
  %15 = phi i16 [ 9, %13 ], [ 7, %12 ], [ 2, %11 ], [ 1, %7 ]
  %16 = getelementptr inbounds nuw i8, ptr %3, i32 1114
  store i16 %15, ptr %16, align 1
  br label %68

17:                                               ; preds = %1
  %18 = getelementptr inbounds nuw i8, ptr %3, i32 85
  %19 = load i16, ptr %18, align 1
  switch i16 %19, label %24 [
    i16 1536, label %25
    i16 16, label %25
    i16 260, label %25
    i16 512, label %25
    i16 261, label %20
    i16 513, label %20
    i16 17, label %20
    i16 262, label %21
    i16 514, label %21
    i16 18, label %21
    i16 782, label %21
    i16 263, label %22
    i16 515, label %22
    i16 19, label %22
    i16 783, label %22
    i16 1346, label %23
  ]

20:                                               ; preds = %17, %17, %17
  br label %25

21:                                               ; preds = %17, %17, %17, %17
  br label %25

22:                                               ; preds = %17, %17, %17, %17
  br label %25

23:                                               ; preds = %17
  br label %25

24:                                               ; preds = %17
  br label %25

25:                                               ; preds = %17, %17, %17, %17, %20, %21, %22, %23, %24
  %26 = phi i32 [ 0, %24 ], [ 83, %23 ], [ 2, %20 ], [ 4, %21 ], [ 8, %22 ], [ 1, %17 ], [ 1, %17 ], [ 1, %17 ], [ 1, %17 ]
  %27 = getelementptr inbounds nuw i8, ptr %3, i32 81
  %28 = load i32, ptr %27, align 1
  %29 = icmp ugt i32 %28, %26
  br i1 %29, label %33, label %30

30:                                               ; preds = %25
  %31 = getelementptr inbounds nuw i8, ptr %0, i32 88
  %32 = load i32, ptr %31, align 1
  br label %33

33:                                               ; preds = %25, %30
  %34 = phi i32 [ %32, %30 ], [ %26, %25 ]
  %35 = icmp eq i16 %19, 1346
  br i1 %35, label %36, label %43

36:                                               ; preds = %33
  %37 = getelementptr inbounds nuw i8, ptr %3, i32 89
  %38 = tail call i32 @fwrite(ptr noundef nonnull %37, i32 noundef %34, i32 noundef 1, ptr noundef nonnull %5)
  %39 = load i32, ptr %27, align 1
  %40 = load i16, ptr %18, align 1
  %41 = zext i16 %40 to i32
  %42 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0O@CFPBLGNB@?$CFs?0?50x?$CFx?0?5?$CFd?6?$AA@", ptr noundef nonnull %37, i32 noundef %41, i32 noundef %39)
  br label %46

43:                                               ; preds = %33
  %44 = getelementptr inbounds nuw i8, ptr %3, i32 87
  %45 = tail call i32 @fwrite(ptr noundef nonnull %44, i32 noundef %34, i32 noundef 1, ptr noundef nonnull %5)
  br label %46

46:                                               ; preds = %43, %36
  %47 = phi i32 [ %38, %36 ], [ %45, %43 ]
  %48 = tail call i32 @fclose(ptr noundef nonnull %5)
  %49 = getelementptr inbounds nuw i8, ptr %3, i32 1112
  store i8 0, ptr %49, align 1
  %50 = icmp eq i32 %47, 1
  br i1 %50, label %51, label %53

51:                                               ; preds = %46
  %52 = getelementptr inbounds nuw i8, ptr %3, i32 1111
  store i8 1, ptr %52, align 1
  br label %68

53:                                               ; preds = %46
  %54 = getelementptr inbounds nuw i8, ptr %3, i32 1113
  store i8 1, ptr %54, align 1
  %55 = tail call i32 @GetLastRtError() #8
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %57, label %60

57:                                               ; preds = %53
  %58 = tail call ptr @_thread_ptr() #8
  %59 = load i32, ptr %58, align 4
  br label %60

60:                                               ; preds = %57, %53
  %61 = phi i32 [ %59, %57 ], [ %55, %53 ]
  switch i32 %61, label %64 [
    i32 6, label %65
    i32 38, label %62
    i32 66, label %63
  ]

62:                                               ; preds = %60
  br label %65

63:                                               ; preds = %60
  br label %65

64:                                               ; preds = %60
  br label %65

65:                                               ; preds = %60, %62, %63, %64
  %66 = phi i16 [ 9, %64 ], [ 7, %63 ], [ 2, %62 ], [ 1, %60 ]
  %67 = getelementptr inbounds nuw i8, ptr %3, i32 1114
  store i16 %66, ptr %67, align 1
  br label %68

68:                                               ; preds = %51, %65, %14
  %69 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  ret void
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare dso_local noalias noundef ptr @fopen(ptr noundef readonly captures(none), ptr noundef readonly captures(none)) local_unnamed_addr #2

declare dso_local i32 @GetLastRtError() local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fwrite(ptr noundef readonly captures(none), i32 noundef, i32 noundef, ptr noundef captures(none)) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fclose(ptr noundef captures(none)) local_unnamed_addr #2

declare dso_local ptr @_thread_ptr() local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local void @FileReadThread(ptr noundef readonly captures(none) %0) #1 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 102
  %3 = load ptr, ptr %2, align 1
  %4 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.2)
  %5 = tail call ptr @fopen(ptr noundef %3, ptr noundef nonnull @"??_C@_01KDCPPGHE@r?$AA@")
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %17

7:                                                ; preds = %1
  %8 = getelementptr inbounds nuw i8, ptr %3, i32 1117
  store i8 1, ptr %8, align 1
  %9 = getelementptr inbounds nuw i8, ptr %3, i32 1116
  store i8 0, ptr %9, align 1
  %10 = tail call i32 @GetLastRtError() #8
  switch i32 %10, label %13 [
    i32 6, label %14
    i32 38, label %11
    i32 66, label %12
  ]

11:                                               ; preds = %7
  br label %14

12:                                               ; preds = %7
  br label %14

13:                                               ; preds = %7
  br label %14

14:                                               ; preds = %7, %11, %12, %13
  %15 = phi i16 [ 9, %13 ], [ 7, %12 ], [ 2, %11 ], [ 1, %7 ]
  %16 = getelementptr inbounds nuw i8, ptr %3, i32 1118
  store i16 %15, ptr %16, align 1
  br label %69

17:                                               ; preds = %1
  %18 = getelementptr inbounds nuw i8, ptr %3, i32 85
  %19 = load i32, ptr %18, align 1
  %20 = tail call i32 @fseek(ptr noundef nonnull %5, i32 noundef %19, i32 noundef 0)
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %33, label %22

22:                                               ; preds = %17
  %23 = tail call i32 @fclose(ptr noundef nonnull %5)
  %24 = getelementptr inbounds nuw i8, ptr %3, i32 1117
  store i8 1, ptr %24, align 1
  %25 = getelementptr inbounds nuw i8, ptr %3, i32 1116
  store i8 0, ptr %25, align 1
  %26 = tail call i32 @GetLastRtError() #8
  switch i32 %26, label %29 [
    i32 6, label %30
    i32 38, label %27
    i32 66, label %28
  ]

27:                                               ; preds = %22
  br label %30

28:                                               ; preds = %22
  br label %30

29:                                               ; preds = %22
  br label %30

30:                                               ; preds = %22, %27, %28, %29
  %31 = phi i16 [ 9, %29 ], [ 7, %28 ], [ 2, %27 ], [ 1, %22 ]
  %32 = getelementptr inbounds nuw i8, ptr %3, i32 1118
  store i16 %31, ptr %32, align 1
  br label %69

33:                                               ; preds = %17
  %34 = getelementptr inbounds nuw i8, ptr %3, i32 89
  %35 = load i16, ptr %34, align 1
  switch i16 %35, label %40 [
    i16 1536, label %41
    i16 16, label %41
    i16 260, label %41
    i16 512, label %41
    i16 261, label %36
    i16 513, label %36
    i16 17, label %36
    i16 262, label %37
    i16 514, label %37
    i16 18, label %37
    i16 782, label %37
    i16 263, label %38
    i16 515, label %38
    i16 19, label %38
    i16 783, label %38
    i16 1346, label %39
  ]

36:                                               ; preds = %33, %33, %33
  br label %41

37:                                               ; preds = %33, %33, %33, %33
  br label %41

38:                                               ; preds = %33, %33, %33, %33
  br label %41

39:                                               ; preds = %33
  br label %41

40:                                               ; preds = %33
  br label %41

41:                                               ; preds = %33, %33, %33, %33, %36, %37, %38, %39, %40
  %42 = phi i32 [ 0, %40 ], [ 83, %39 ], [ 2, %36 ], [ 4, %37 ], [ 8, %38 ], [ 1, %33 ], [ 1, %33 ], [ 1, %33 ], [ 1, %33 ]
  %43 = getelementptr inbounds nuw i8, ptr %3, i32 81
  %44 = load i32, ptr %43, align 1
  %45 = icmp ugt i32 %44, %42
  br i1 %45, label %49, label %46

46:                                               ; preds = %41
  %47 = getelementptr inbounds nuw i8, ptr %0, i32 88
  %48 = load i32, ptr %47, align 1
  br label %49

49:                                               ; preds = %41, %46
  %50 = phi i32 [ %48, %46 ], [ %42, %41 ]
  %51 = icmp eq i16 %35, 1346
  %52 = select i1 %51, i32 93, i32 91
  %53 = getelementptr inbounds nuw i8, ptr %3, i32 %52
  %54 = tail call i32 @fread(ptr noundef nonnull %53, i32 noundef %50, i32 noundef 1, ptr noundef nonnull %5)
  %55 = tail call i32 @fclose(ptr noundef nonnull %5)
  %56 = getelementptr inbounds nuw i8, ptr %3, i32 1116
  store i8 0, ptr %56, align 1
  %57 = icmp eq i32 %54, 1
  br i1 %57, label %58, label %60

58:                                               ; preds = %49
  %59 = getelementptr inbounds nuw i8, ptr %3, i32 1115
  store i8 1, ptr %59, align 1
  br label %69

60:                                               ; preds = %49
  %61 = getelementptr inbounds nuw i8, ptr %3, i32 1117
  store i8 1, ptr %61, align 1
  %62 = tail call i32 @GetLastRtError() #8
  switch i32 %62, label %65 [
    i32 6, label %66
    i32 38, label %63
    i32 66, label %64
  ]

63:                                               ; preds = %60
  br label %66

64:                                               ; preds = %60
  br label %66

65:                                               ; preds = %60
  br label %66

66:                                               ; preds = %60, %63, %64, %65
  %67 = phi i16 [ 9, %65 ], [ 7, %64 ], [ 2, %63 ], [ 1, %60 ]
  %68 = getelementptr inbounds nuw i8, ptr %3, i32 1118
  store i16 %67, ptr %68, align 1
  br label %69

69:                                               ; preds = %30, %66, %58, %14
  %70 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.3)
  ret void
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fseek(ptr noundef captures(none), i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fread(ptr noundef writeonly captures(none), i32 noundef, i32 noundef, ptr noundef captures(none)) local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @FileOperation(ptr noundef %0, i8 noundef zeroext %1) local_unnamed_addr #1 {
  switch i8 %1, label %7 [
    i8 1, label %4
    i8 2, label %3
  ]

3:                                                ; preds = %2
  br label %4

4:                                                ; preds = %2, %3
  %5 = phi ptr [ @FileReadThread, %3 ], [ @FileWriteThread, %2 ]
  %6 = tail call zeroext i16 @CreateRtThread(i8 noundef zeroext -106, ptr noundef nonnull %5, i32 noundef 4096, ptr noundef %0) #8
  br label %7

7:                                                ; preds = %4, %2
  ret void
}

declare dso_local zeroext i16 @CreateRtThread(i8 noundef zeroext, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local dllexport void @FileWrite(ptr noundef %0) local_unnamed_addr #1 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 98
  %3 = load ptr, ptr %2, align 1
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = tail call dereferenceable_or_null(1116) ptr @calloc(i32 1, i32 1116)
  store ptr %6, ptr %2, align 1
  br label %7

7:                                                ; preds = %1, %5
  %8 = phi ptr [ %6, %5 ], [ %3, %1 ]
  %9 = load i8, ptr %0, align 1
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %11, label %24

11:                                               ; preds = %7
  %12 = getelementptr inbounds nuw i8, ptr %0, i32 92
  %13 = load i8, ptr %12, align 1
  %14 = icmp eq i8 %13, 1
  br i1 %14, label %19, label %15

15:                                               ; preds = %11
  %16 = getelementptr inbounds nuw i8, ptr %0, i32 94
  %17 = load i8, ptr %16, align 1
  %18 = icmp eq i8 %17, 1
  br i1 %18, label %19, label %22

19:                                               ; preds = %15, %11
  %20 = getelementptr inbounds nuw i8, ptr %0, i32 95
  store i16 0, ptr %20, align 1
  store i8 0, ptr %12, align 1
  %21 = getelementptr inbounds nuw i8, ptr %0, i32 94
  store i8 0, ptr %21, align 1
  br label %22

22:                                               ; preds = %19, %15
  %23 = getelementptr inbounds nuw i8, ptr %0, i32 97
  br label %30

24:                                               ; preds = %7
  %25 = getelementptr inbounds nuw i8, ptr %0, i32 97
  %26 = load i8, ptr %25, align 1
  %27 = icmp eq i8 %26, 0
  %28 = icmp eq i8 %9, 1
  %29 = and i1 %28, %27
  br i1 %29, label %34, label %30

30:                                               ; preds = %22, %24
  %31 = phi ptr [ %23, %22 ], [ %25, %24 ]
  %32 = getelementptr inbounds nuw i8, ptr %0, i32 93
  %33 = load i8, ptr %32, align 1
  br label %80

34:                                               ; preds = %24
  %35 = getelementptr inbounds nuw i8, ptr %0, i32 93
  %36 = load i8, ptr %35, align 1
  %37 = icmp eq i8 %36, 0
  br i1 %37, label %38, label %80

38:                                               ; preds = %34
  store i8 1, ptr %35, align 1
  %39 = getelementptr inbounds nuw i8, ptr %0, i32 3
  %40 = load i8, ptr %39, align 1
  %41 = icmp eq i8 %40, 0
  br i1 %41, label %42, label %45

42:                                               ; preds = %38
  %43 = getelementptr inbounds nuw i8, ptr %0, i32 94
  store i8 1, ptr %43, align 1
  store i8 0, ptr %35, align 1
  %44 = getelementptr inbounds nuw i8, ptr %0, i32 95
  store i16 1, ptr %44, align 1
  br label %104

45:                                               ; preds = %38
  %46 = getelementptr inbounds nuw i8, ptr %0, i32 84
  %47 = load ptr, ptr %46, align 1
  %48 = icmp eq ptr %47, null
  br i1 %48, label %49, label %52

49:                                               ; preds = %45
  %50 = getelementptr inbounds nuw i8, ptr %0, i32 94
  store i8 1, ptr %50, align 1
  store i8 0, ptr %35, align 1
  %51 = getelementptr inbounds nuw i8, ptr %0, i32 95
  store i16 6, ptr %51, align 1
  br label %104

52:                                               ; preds = %45
  %53 = getelementptr inbounds nuw i8, ptr %0, i32 88
  %54 = load i32, ptr %53, align 1
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %56, label %59

56:                                               ; preds = %52
  %57 = getelementptr inbounds nuw i8, ptr %0, i32 94
  store i8 1, ptr %57, align 1
  store i8 0, ptr %35, align 1
  %58 = getelementptr inbounds nuw i8, ptr %0, i32 95
  store i16 5, ptr %58, align 1
  br label %104

59:                                               ; preds = %52
  %60 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %8, ptr noundef nonnull dereferenceable(1) %39) #8
  %61 = load i32, ptr %53, align 1
  %62 = getelementptr inbounds nuw i8, ptr %8, i32 81
  store i32 %61, ptr %62, align 1
  %63 = load ptr, ptr %46, align 1
  %64 = getelementptr inbounds nuw i8, ptr %63, i32 4
  %65 = load i16, ptr %64, align 1
  %66 = getelementptr inbounds nuw i8, ptr %8, i32 85
  store i16 %65, ptr %66, align 1
  %67 = getelementptr inbounds nuw i8, ptr %8, i32 1111
  store i8 0, ptr %67, align 1
  %68 = getelementptr inbounds nuw i8, ptr %8, i32 1112
  store i8 1, ptr %68, align 1
  %69 = getelementptr inbounds nuw i8, ptr %8, i32 1113
  store i8 0, ptr %69, align 1
  %70 = getelementptr inbounds nuw i8, ptr %8, i32 1114
  store i16 0, ptr %70, align 1
  %71 = load ptr, ptr %46, align 1
  %72 = getelementptr inbounds nuw i8, ptr %71, i32 4
  %73 = load i16, ptr %72, align 1
  %74 = tail call zeroext i16 @ReturnDataSize(i16 noundef zeroext %73)
  %75 = zext nneg i16 %74 to i32
  %76 = getelementptr inbounds nuw i8, ptr %8, i32 87
  %77 = load ptr, ptr %71, align 1
  tail call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %76, ptr align 1 %77, i32 %75, i1 false)
  %78 = tail call zeroext i16 @CreateRtThread(i8 noundef zeroext -106, ptr noundef nonnull @FileWriteThread, i32 noundef 4096, ptr noundef nonnull %0) #8
  %79 = load i8, ptr %0, align 1
  br label %104

80:                                               ; preds = %30, %34
  %81 = phi ptr [ %31, %30 ], [ %25, %34 ]
  %82 = phi i8 [ %33, %30 ], [ %36, %34 ]
  %83 = getelementptr inbounds nuw i8, ptr %0, i32 93
  %84 = icmp eq i8 %82, 1
  br i1 %84, label %85, label %104

85:                                               ; preds = %80
  %86 = getelementptr inbounds nuw i8, ptr %8, i32 1111
  %87 = load i8, ptr %86, align 1
  %88 = icmp eq i8 %87, 1
  br i1 %88, label %93, label %89

89:                                               ; preds = %85
  %90 = getelementptr inbounds nuw i8, ptr %8, i32 1113
  %91 = load i8, ptr %90, align 1
  %92 = icmp eq i8 %91, 1
  br i1 %92, label %93, label %104

93:                                               ; preds = %89, %85
  store i8 0, ptr %83, align 1
  %94 = load i8, ptr %86, align 1
  %95 = icmp eq i8 %94, 1
  %96 = getelementptr inbounds nuw i8, ptr %0, i32 92
  %97 = getelementptr inbounds nuw i8, ptr %0, i32 94
  br i1 %95, label %98, label %100

98:                                               ; preds = %93
  store i8 1, ptr %96, align 1
  store i8 0, ptr %97, align 1
  %99 = getelementptr inbounds nuw i8, ptr %0, i32 95
  store i16 0, ptr %99, align 1
  br label %104

100:                                              ; preds = %93
  store i8 0, ptr %96, align 1
  store i8 1, ptr %97, align 1
  %101 = getelementptr inbounds nuw i8, ptr %8, i32 1114
  %102 = load i16, ptr %101, align 1
  %103 = getelementptr inbounds nuw i8, ptr %0, i32 95
  store i16 %102, ptr %103, align 1
  br label %104

104:                                              ; preds = %59, %100, %98, %89, %80, %56, %49, %42
  %105 = phi ptr [ %25, %59 ], [ %81, %100 ], [ %81, %98 ], [ %81, %89 ], [ %81, %80 ], [ %25, %56 ], [ %25, %49 ], [ %25, %42 ]
  %106 = phi i8 [ %79, %59 ], [ %9, %100 ], [ %9, %98 ], [ %9, %89 ], [ %9, %80 ], [ 1, %56 ], [ 1, %49 ], [ 1, %42 ]
  store i8 %106, ptr %105, align 1
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strcpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none)) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #5

; Function Attrs: nounwind
define dso_local dllexport void @FileRead(ptr noundef %0) local_unnamed_addr #1 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 102
  %3 = load ptr, ptr %2, align 1
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = tail call dereferenceable_or_null(1120) ptr @calloc(i32 1, i32 1120)
  store ptr %6, ptr %2, align 1
  br label %7

7:                                                ; preds = %1, %5
  %8 = phi ptr [ %6, %5 ], [ %3, %1 ]
  %9 = load i8, ptr %0, align 1
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %11, label %24

11:                                               ; preds = %7
  %12 = getelementptr inbounds nuw i8, ptr %0, i32 92
  %13 = load i8, ptr %12, align 1
  %14 = icmp eq i8 %13, 1
  br i1 %14, label %19, label %15

15:                                               ; preds = %11
  %16 = getelementptr inbounds nuw i8, ptr %0, i32 94
  %17 = load i8, ptr %16, align 1
  %18 = icmp eq i8 %17, 1
  br i1 %18, label %19, label %22

19:                                               ; preds = %15, %11
  %20 = getelementptr inbounds nuw i8, ptr %0, i32 95
  store i16 0, ptr %20, align 1
  store i8 0, ptr %12, align 1
  %21 = getelementptr inbounds nuw i8, ptr %0, i32 94
  store i8 0, ptr %21, align 1
  br label %22

22:                                               ; preds = %19, %15
  %23 = getelementptr inbounds nuw i8, ptr %0, i32 101
  br label %30

24:                                               ; preds = %7
  %25 = getelementptr inbounds nuw i8, ptr %0, i32 101
  %26 = load i8, ptr %25, align 1
  %27 = icmp eq i8 %26, 0
  %28 = icmp eq i8 %9, 1
  %29 = and i1 %28, %27
  br i1 %29, label %34, label %30

30:                                               ; preds = %22, %24
  %31 = phi ptr [ %23, %22 ], [ %25, %24 ]
  %32 = getelementptr inbounds nuw i8, ptr %0, i32 93
  %33 = load i8, ptr %32, align 1
  br label %82

34:                                               ; preds = %24
  %35 = getelementptr inbounds nuw i8, ptr %0, i32 93
  %36 = load i8, ptr %35, align 1
  %37 = icmp eq i8 %36, 0
  br i1 %37, label %38, label %82

38:                                               ; preds = %34
  store i8 1, ptr %35, align 1
  %39 = getelementptr inbounds nuw i8, ptr %0, i32 3
  %40 = getelementptr inbounds nuw i8, ptr %0, i32 97
  %41 = load ptr, ptr %40, align 1
  %42 = load ptr, ptr %41, align 1
  %43 = icmp eq ptr %42, null
  br i1 %43, label %44, label %47

44:                                               ; preds = %38
  %45 = getelementptr inbounds nuw i8, ptr %0, i32 94
  store i8 1, ptr %45, align 1
  store i8 0, ptr %35, align 1
  %46 = getelementptr inbounds nuw i8, ptr %0, i32 95
  store i16 8, ptr %46, align 1
  br label %122

47:                                               ; preds = %38
  %48 = getelementptr inbounds nuw i8, ptr %0, i32 88
  %49 = load i32, ptr %48, align 1
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %54

51:                                               ; preds = %47
  %52 = getelementptr inbounds nuw i8, ptr %0, i32 94
  store i8 1, ptr %52, align 1
  store i8 0, ptr %35, align 1
  %53 = getelementptr inbounds nuw i8, ptr %0, i32 95
  store i16 5, ptr %53, align 1
  br label %122

54:                                               ; preds = %47
  %55 = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %8, ptr noundef nonnull dereferenceable(1) %39) #8
  %56 = load i32, ptr %48, align 1
  %57 = getelementptr inbounds nuw i8, ptr %8, i32 81
  store i32 %56, ptr %57, align 1
  %58 = load ptr, ptr %40, align 1
  %59 = getelementptr inbounds nuw i8, ptr %58, i32 4
  %60 = load i16, ptr %59, align 1
  %61 = getelementptr inbounds nuw i8, ptr %8, i32 89
  store i16 %60, ptr %61, align 1
  %62 = getelementptr inbounds nuw i8, ptr %8, i32 1115
  store i8 0, ptr %62, align 1
  %63 = getelementptr inbounds nuw i8, ptr %8, i32 1116
  store i8 1, ptr %63, align 1
  %64 = getelementptr inbounds nuw i8, ptr %8, i32 1117
  store i8 0, ptr %64, align 1
  %65 = getelementptr inbounds nuw i8, ptr %8, i32 1118
  store i16 0, ptr %65, align 1
  %66 = getelementptr inbounds nuw i8, ptr %0, i32 84
  %67 = load i32, ptr %66, align 1
  %68 = getelementptr inbounds nuw i8, ptr %8, i32 85
  store i32 %67, ptr %68, align 1
  %69 = load ptr, ptr %40, align 1
  %70 = getelementptr inbounds nuw i8, ptr %69, i32 4
  %71 = load i16, ptr %70, align 1
  switch i16 %71, label %76 [
    i16 1536, label %77
    i16 16, label %77
    i16 260, label %77
    i16 512, label %77
    i16 261, label %72
    i16 513, label %72
    i16 17, label %72
    i16 262, label %73
    i16 514, label %73
    i16 18, label %73
    i16 782, label %73
    i16 263, label %74
    i16 515, label %74
    i16 19, label %74
    i16 783, label %74
    i16 1346, label %75
  ]

72:                                               ; preds = %54, %54, %54
  br label %77

73:                                               ; preds = %54, %54, %54, %54
  br label %77

74:                                               ; preds = %54, %54, %54, %54
  br label %77

75:                                               ; preds = %54
  br label %77

76:                                               ; preds = %54
  br label %77

77:                                               ; preds = %54, %54, %54, %54, %72, %73, %74, %75, %76
  %78 = phi i32 [ 0, %76 ], [ 83, %75 ], [ 2, %72 ], [ 4, %73 ], [ 8, %74 ], [ 1, %54 ], [ 1, %54 ], [ 1, %54 ], [ 1, %54 ]
  %79 = getelementptr inbounds nuw i8, ptr %8, i32 91
  %80 = load ptr, ptr %69, align 1
  tail call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %79, ptr align 1 %80, i32 %78, i1 false)
  %81 = tail call zeroext i16 @CreateRtThread(i8 noundef zeroext -106, ptr noundef nonnull @FileReadThread, i32 noundef 4096, ptr noundef nonnull %0) #8
  br label %119

82:                                               ; preds = %30, %34
  %83 = phi ptr [ %31, %30 ], [ %25, %34 ]
  %84 = phi i8 [ %33, %30 ], [ %36, %34 ]
  %85 = getelementptr inbounds nuw i8, ptr %0, i32 93
  %86 = icmp eq i8 %84, 1
  br i1 %86, label %87, label %119

87:                                               ; preds = %82
  %88 = getelementptr inbounds nuw i8, ptr %8, i32 1115
  %89 = load i8, ptr %88, align 1
  %90 = icmp eq i8 %89, 1
  br i1 %90, label %95, label %91

91:                                               ; preds = %87
  %92 = getelementptr inbounds nuw i8, ptr %8, i32 1117
  %93 = load i8, ptr %92, align 1
  %94 = icmp eq i8 %93, 1
  br i1 %94, label %95, label %119

95:                                               ; preds = %91, %87
  store i8 0, ptr %85, align 1
  %96 = load i8, ptr %88, align 1
  %97 = icmp eq i8 %96, 1
  %98 = getelementptr inbounds nuw i8, ptr %0, i32 92
  %99 = getelementptr inbounds nuw i8, ptr %0, i32 94
  br i1 %97, label %100, label %115

100:                                              ; preds = %95
  store i8 1, ptr %98, align 1
  store i8 0, ptr %99, align 1
  %101 = getelementptr inbounds nuw i8, ptr %0, i32 95
  store i16 0, ptr %101, align 1
  %102 = getelementptr inbounds nuw i8, ptr %0, i32 97
  %103 = load ptr, ptr %102, align 1
  %104 = getelementptr inbounds nuw i8, ptr %103, i32 4
  %105 = load i16, ptr %104, align 1
  switch i16 %105, label %110 [
    i16 1536, label %111
    i16 16, label %111
    i16 260, label %111
    i16 512, label %111
    i16 261, label %106
    i16 513, label %106
    i16 17, label %106
    i16 262, label %107
    i16 514, label %107
    i16 18, label %107
    i16 782, label %107
    i16 263, label %108
    i16 515, label %108
    i16 19, label %108
    i16 783, label %108
    i16 1346, label %109
  ]

106:                                              ; preds = %100, %100, %100
  br label %111

107:                                              ; preds = %100, %100, %100, %100
  br label %111

108:                                              ; preds = %100, %100, %100, %100
  br label %111

109:                                              ; preds = %100
  br label %111

110:                                              ; preds = %100
  br label %111

111:                                              ; preds = %100, %100, %100, %100, %106, %107, %108, %109, %110
  %112 = phi i32 [ 0, %110 ], [ 83, %109 ], [ 2, %106 ], [ 4, %107 ], [ 8, %108 ], [ 1, %100 ], [ 1, %100 ], [ 1, %100 ], [ 1, %100 ]
  %113 = load ptr, ptr %103, align 1
  %114 = getelementptr inbounds nuw i8, ptr %8, i32 91
  tail call void @llvm.memcpy.p0.p0.i32(ptr align 1 %113, ptr nonnull align 1 %114, i32 %112, i1 false)
  br label %119

115:                                              ; preds = %95
  store i8 0, ptr %98, align 1
  store i8 1, ptr %99, align 1
  %116 = getelementptr inbounds nuw i8, ptr %8, i32 1118
  %117 = load i16, ptr %116, align 1
  %118 = getelementptr inbounds nuw i8, ptr %0, i32 95
  store i16 %117, ptr %118, align 1
  br label %119

119:                                              ; preds = %82, %91, %111, %115, %77
  %120 = phi ptr [ %83, %82 ], [ %83, %91 ], [ %83, %111 ], [ %83, %115 ], [ %25, %77 ]
  %121 = load i8, ptr %0, align 1
  store i8 %121, ptr %120, align 1
  br label %122

122:                                              ; preds = %119, %51, %44
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #6

; Function Attrs: nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @calloc(i32 noundef, i32 noundef) local_unnamed_addr #7

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nofree nounwind }
attributes #7 = { nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCPFB\\File.c", directory: "D:\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
