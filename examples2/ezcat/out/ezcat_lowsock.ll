; ModuleID = 'D:\work\rtacc\examples2\ezcat\ezcat_lowsock.c'
source_filename = "D:\\work\\rtacc\\examples2\\ezcat\\ezcat_lowsock.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.sockaddr_dl = type { i8, i8, i16, i8, i8, i8, i8, [46 x i8] }

$LibVersion_0x0701 = comdat any

$"??_C@_06HBELJPBO@socket?$AA@" = comdat any

$"??_C@_07FADHOGD@_socket?$AA@" = comdat any

$"??_C@_04NPNJNMMP@bind?$AA@" = comdat any

$"??_C@_05FFOBDAFD@_bind?$AA@" = comdat any

$"??_C@_04MIIPNNEF@send?$AA@" = comdat any

$"??_C@_05ECLHDBNJ@_send?$AA@" = comdat any

$"??_C@_04IFMDBHHF@recv?$AA@" = comdat any

$"??_C@_05PPLPLOJ@_recv?$AA@" = comdat any

$"??_C@_0L@BIONKJCH@getifaddrs?$AA@" = comdat any

$"??_C@_0M@EGFABLNJ@_getifaddrs?$AA@" = comdat any

$"??_C@_0M@KLMKCJPH@freeifaddrs?$AA@" = comdat any

$"??_C@_0N@PBJBELFO@_freeifaddrs?$AA@" = comdat any

$"??_C@_0P@GFPCJLDD@if_nametoindex?$AA@" = comdat any

$"??_C@_0BA@BICJHMNP@_if_nametoindex?$AA@" = comdat any

$"??_C@_05MJIHFMJI@ioctl?$AA@" = comdat any

$"??_C@_06DALELLBL@_ioctl?$AA@" = comdat any

$"??_C@_05LBOHBHFK@close?$AA@" = comdat any

$"??_C@_06EINEPANJ@_close?$AA@" = comdat any

$"??_C@_0N@PBPLELHF@EZCAT_NETLIB?$AA@" = comdat any

$"??_C@_0L@PADFLHID@netlib?4rsl?$AA@" = comdat any

$"??_C@_06FIJBKAFI@INTIME?$AA@" = comdat any

$"??_C@_06FMLKHOIK@intime?$AA@" = comdat any

$"??_C@_06JDAHEHBG@Intime?$AA@" = comdat any

$"??_C@_0BO@NHKEAEGN@C?3?2Program?5Files?5?$CIx86?$CJ?2INtime?$AA@" = comdat any

$"??_C@_0BI@HCBJLJDJ@C?3?2Program?5Files?2INtime?$AA@" = comdat any

$"??_C@_03PDOMKJON@bin?$AA@" = comdat any

$"??_C@_06JBHCDJDK@RT?2bin?$AA@" = comdat any

$"??_C@_06FJGDAFJA@rt?2bin?$AA@" = comdat any

$"??_C@_03FDNOAGND@Bin?$AA@" = comdat any

$"??_C@_0L@MGKODJNM@EZCAT_CLIB?$AA@" = comdat any

$"??_C@_08IAHGEPHD@clib?4rsl?$AA@" = comdat any

$"??_C@_0N@FCEHPMED@EZCAT_LISTIF?$AA@" = comdat any

$"??_C@_0CA@CALMBEKF@ezcat?3?5?5?5?$CFs?5?5index?$DN?$CFu?5?5alen?$DN?$CFu?6?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@s_open_errno = internal unnamed_addr global i32 0, align 4
@s_open_detail = internal unnamed_addr global i32 0, align 4
@s_netlib = internal global i16 0, align 2
@s_clib = internal global i16 0, align 2
@s_socket = internal unnamed_addr global ptr null, align 4
@s_bind = internal unnamed_addr global ptr null, align 4
@s_send = internal unnamed_addr global ptr null, align 4
@s_recv = internal unnamed_addr global ptr null, align 4
@s_ioctl = internal unnamed_addr global ptr null, align 4
@s_close = internal unnamed_addr global ptr null, align 4
@"??_C@_06HBELJPBO@socket?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"socket\00", comdat, align 1
@"??_C@_07FADHOGD@_socket?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"_socket\00", comdat, align 1
@"??_C@_04NPNJNMMP@bind?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"bind\00", comdat, align 1
@"??_C@_05FFOBDAFD@_bind?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"_bind\00", comdat, align 1
@"??_C@_04MIIPNNEF@send?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"send\00", comdat, align 1
@"??_C@_05ECLHDBNJ@_send?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"_send\00", comdat, align 1
@"??_C@_04IFMDBHHF@recv?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"recv\00", comdat, align 1
@"??_C@_05PPLPLOJ@_recv?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"_recv\00", comdat, align 1
@"??_C@_0L@BIONKJCH@getifaddrs?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"getifaddrs\00", comdat, align 1
@"??_C@_0M@EGFABLNJ@_getifaddrs?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"_getifaddrs\00", comdat, align 1
@s_getifaddrs = internal unnamed_addr global ptr null, align 4
@"??_C@_0M@KLMKCJPH@freeifaddrs?$AA@" = linkonce_odr dso_local unnamed_addr constant [12 x i8] c"freeifaddrs\00", comdat, align 1
@"??_C@_0N@PBJBELFO@_freeifaddrs?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"_freeifaddrs\00", comdat, align 1
@s_freeifaddrs = internal unnamed_addr global ptr null, align 4
@"??_C@_0P@GFPCJLDD@if_nametoindex?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"if_nametoindex\00", comdat, align 1
@"??_C@_0BA@BICJHMNP@_if_nametoindex?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"_if_nametoindex\00", comdat, align 1
@s_if_nametoindex = internal unnamed_addr global ptr null, align 4
@"??_C@_05MJIHFMJI@ioctl?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"ioctl\00", comdat, align 1
@"??_C@_06DALELLBL@_ioctl?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"_ioctl\00", comdat, align 1
@"??_C@_05LBOHBHFK@close?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"close\00", comdat, align 1
@"??_C@_06EINEPANJ@_close?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"_close\00", comdat, align 1
@"??_C@_0N@PBPLELHF@EZCAT_NETLIB?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"EZCAT_NETLIB\00", comdat, align 1
@"??_C@_0L@PADFLHID@netlib?4rsl?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"netlib.rsl\00", comdat, align 1
@ez_load_rsl_under_intime.env_intime = internal unnamed_addr constant [4 x ptr] [ptr @"??_C@_06FIJBKAFI@INTIME?$AA@", ptr @"??_C@_06FMLKHOIK@intime?$AA@", ptr @"??_C@_06JDAHEHBG@Intime?$AA@", ptr null], align 4
@"??_C@_06FIJBKAFI@INTIME?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"INTIME\00", comdat, align 1
@"??_C@_06FMLKHOIK@intime?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"intime\00", comdat, align 1
@"??_C@_06JDAHEHBG@Intime?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"Intime\00", comdat, align 1
@ez_load_rsl_under_intime.roots_fallback = internal unnamed_addr constant [3 x ptr] [ptr @"??_C@_0BO@NHKEAEGN@C?3?2Program?5Files?5?$CIx86?$CJ?2INtime?$AA@", ptr @"??_C@_0BI@HCBJLJDJ@C?3?2Program?5Files?2INtime?$AA@", ptr null], align 4
@"??_C@_0BO@NHKEAEGN@C?3?2Program?5Files?5?$CIx86?$CJ?2INtime?$AA@" = linkonce_odr dso_local unnamed_addr constant [30 x i8] c"C:\\Program Files (x86)\\INtime\00", comdat, align 1
@"??_C@_0BI@HCBJLJDJ@C?3?2Program?5Files?2INtime?$AA@" = linkonce_odr dso_local unnamed_addr constant [24 x i8] c"C:\\Program Files\\INtime\00", comdat, align 1
@ez_load_rsl_under_intime.subdirs = internal unnamed_addr constant [5 x ptr] [ptr @"??_C@_03PDOMKJON@bin?$AA@", ptr @"??_C@_06JBHCDJDK@RT?2bin?$AA@", ptr @"??_C@_06FJGDAFJA@rt?2bin?$AA@", ptr @"??_C@_03FDNOAGND@Bin?$AA@", ptr null], align 4
@"??_C@_03PDOMKJON@bin?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"bin\00", comdat, align 1
@"??_C@_06JBHCDJDK@RT?2bin?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"RT\\bin\00", comdat, align 1
@"??_C@_06FJGDAFJA@rt?2bin?$AA@" = linkonce_odr dso_local unnamed_addr constant [7 x i8] c"rt\\bin\00", comdat, align 1
@"??_C@_03FDNOAGND@Bin?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"Bin\00", comdat, align 1
@"??_C@_0L@MGKODJNM@EZCAT_CLIB?$AA@" = linkonce_odr dso_local unnamed_addr constant [11 x i8] c"EZCAT_CLIB\00", comdat, align 1
@"??_C@_08IAHGEPHD@clib?4rsl?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"clib.rsl\00", comdat, align 1
@"??_C@_0N@FCEHPMED@EZCAT_LISTIF?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"EZCAT_LISTIF\00", comdat, align 1
@"??_C@_0CA@CALMBEKF@ezcat?3?5?5?5?$CFs?5?5index?$DN?$CFu?5?5alen?$DN?$CFu?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [32 x i8] c"ezcat:   %s  index=%u  alen=%u\0A\00", comdat, align 1
@str = private unnamed_addr constant [45 x i8] c"ezcat: AF_LINK with MAC (name, index, alen):\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local i32 @ezcat_lowsock_last_open_errno() local_unnamed_addr #0 {
  %1 = load i32, ptr @s_open_errno, align 4
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 8) i32 @ezcat_lowsock_last_open_detail() local_unnamed_addr #0 {
  %1 = load i32, ptr @s_open_detail, align 4
  ret i32 %1
}

; Function Attrs: nounwind
define dso_local range(i32 -1, 1) i32 @ezcat_lowsock_open(ptr noundef writeonly captures(address_is_null) %0, ptr noundef %1) local_unnamed_addr #1 {
  %3 = alloca ptr, align 4
  %4 = alloca %struct.sockaddr_dl, align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #10
  store i32 0, ptr @s_open_errno, align 4
  store i32 0, ptr @s_open_detail, align 4
  %5 = icmp ne ptr %0, null
  %6 = icmp ne ptr %1, null
  %7 = and i1 %5, %6
  br i1 %7, label %8, label %378

8:                                                ; preds = %2
  %9 = load i8, ptr %1, align 1
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %378, label %11

11:                                               ; preds = %8
  %12 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i64 0, ptr %12, align 4
  store i32 -1, ptr %0, align 4
  %13 = load ptr, ptr @s_socket, align 4
  %14 = icmp eq ptr %13, null
  br i1 %14, label %17, label %15

15:                                               ; preds = %11
  %16 = load ptr, ptr @s_getifaddrs, align 4
  br label %220

17:                                               ; preds = %11
  %18 = load i16, ptr @s_netlib, align 2
  %19 = icmp eq i16 %18, 0
  br i1 %19, label %20, label %41

20:                                               ; preds = %17
  %21 = tail call ptr @getenv(ptr noundef nonnull @"??_C@_0N@PBPLELHF@EZCAT_NETLIB?$AA@")
  %22 = icmp eq ptr %21, null
  br i1 %22, label %29, label %23

23:                                               ; preds = %20
  %24 = load i8, ptr %21, align 1
  %25 = icmp eq i8 %24, 0
  br i1 %25, label %29, label %26

26:                                               ; preds = %23
  %27 = tail call zeroext i16 @LoadRtLibrary(ptr noundef nonnull %21) #10
  %28 = icmp eq i16 %27, 0
  br i1 %28, label %29, label %35

29:                                               ; preds = %26, %23, %20
  %30 = tail call fastcc i32 @ez_load_rsl_under_intime(ptr noundef nonnull @s_netlib, ptr noundef nonnull @"??_C@_0L@PADFLHID@netlib?4rsl?$AA@")
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %37, label %32

32:                                               ; preds = %29
  %33 = tail call zeroext i16 @LoadRtLibrary(ptr noundef nonnull @"??_C@_0L@PADFLHID@netlib?4rsl?$AA@") #10
  %34 = icmp eq i16 %33, 0
  br i1 %34, label %190, label %35

35:                                               ; preds = %32, %26
  %36 = phi i16 [ %27, %26 ], [ %33, %32 ]
  store i16 %36, ptr @s_netlib, align 2
  br label %41

37:                                               ; preds = %29
  %38 = load i16, ptr @s_netlib, align 2
  %39 = icmp eq i16 %38, 0
  br i1 %39, label %40, label %41

40:                                               ; preds = %37
  store ptr null, ptr @s_socket, align 4
  br label %56

41:                                               ; preds = %37, %35, %17
  %42 = phi i16 [ %38, %37 ], [ %36, %35 ], [ %18, %17 ]
  %43 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %42, ptr noundef nonnull @"??_C@_07FADHOGD@_socket?$AA@") #10
  %44 = icmp eq ptr %43, null
  br i1 %44, label %45, label %47

45:                                               ; preds = %41
  %46 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %42, ptr noundef nonnull @"??_C@_06HBELJPBO@socket?$AA@") #10
  br label %47

47:                                               ; preds = %45, %41
  %48 = phi ptr [ %46, %45 ], [ %43, %41 ]
  %49 = load i16, ptr @s_netlib, align 2
  store ptr %48, ptr @s_socket, align 4
  %50 = icmp eq i16 %49, 0
  br i1 %50, label %56, label %51

51:                                               ; preds = %47
  %52 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %49, ptr noundef nonnull @"??_C@_05FFOBDAFD@_bind?$AA@") #10
  %53 = icmp eq ptr %52, null
  br i1 %53, label %54, label %57

54:                                               ; preds = %51
  %55 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %49, ptr noundef nonnull @"??_C@_04NPNJNMMP@bind?$AA@") #10
  br label %57

56:                                               ; preds = %47, %40
  store ptr null, ptr @s_bind, align 4
  br label %67

57:                                               ; preds = %54, %51
  %58 = phi ptr [ %55, %54 ], [ %52, %51 ]
  %59 = load i16, ptr @s_netlib, align 2
  store ptr %58, ptr @s_bind, align 4
  %60 = icmp eq i16 %59, 0
  br i1 %60, label %61, label %62

61:                                               ; preds = %57
  store ptr null, ptr @s_send, align 4
  br label %76

62:                                               ; preds = %57
  %63 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %59, ptr noundef nonnull @"??_C@_05ECLHDBNJ@_send?$AA@") #10
  %64 = icmp eq ptr %63, null
  br i1 %64, label %65, label %67

65:                                               ; preds = %62
  %66 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %59, ptr noundef nonnull @"??_C@_04MIIPNNEF@send?$AA@") #10
  br label %67

67:                                               ; preds = %65, %62, %56
  %68 = phi ptr [ null, %56 ], [ %66, %65 ], [ %63, %62 ]
  %69 = load i16, ptr @s_netlib, align 2
  store ptr %68, ptr @s_send, align 4
  %70 = icmp eq i16 %69, 0
  br i1 %70, label %76, label %71

71:                                               ; preds = %67
  %72 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %69, ptr noundef nonnull @"??_C@_05PPLPLOJ@_recv?$AA@") #10
  %73 = icmp eq ptr %72, null
  br i1 %73, label %74, label %77

74:                                               ; preds = %71
  %75 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %69, ptr noundef nonnull @"??_C@_04IFMDBHHF@recv?$AA@") #10
  br label %77

76:                                               ; preds = %67, %61
  store ptr null, ptr @s_recv, align 4
  br label %87

77:                                               ; preds = %74, %71
  %78 = phi ptr [ %75, %74 ], [ %72, %71 ]
  %79 = load i16, ptr @s_netlib, align 2
  store ptr %78, ptr @s_recv, align 4
  %80 = icmp eq i16 %79, 0
  br i1 %80, label %81, label %82

81:                                               ; preds = %77
  store ptr null, ptr @s_getifaddrs, align 4
  br label %96

82:                                               ; preds = %77
  %83 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %79, ptr noundef nonnull @"??_C@_0M@EGFABLNJ@_getifaddrs?$AA@") #10
  %84 = icmp eq ptr %83, null
  br i1 %84, label %85, label %87

85:                                               ; preds = %82
  %86 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %79, ptr noundef nonnull @"??_C@_0L@BIONKJCH@getifaddrs?$AA@") #10
  br label %87

87:                                               ; preds = %85, %82, %76
  %88 = phi ptr [ null, %76 ], [ %86, %85 ], [ %83, %82 ]
  %89 = load i16, ptr @s_netlib, align 2
  store ptr %88, ptr @s_getifaddrs, align 4
  %90 = icmp eq i16 %89, 0
  br i1 %90, label %96, label %91

91:                                               ; preds = %87
  %92 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %89, ptr noundef nonnull @"??_C@_0N@PBJBELFO@_freeifaddrs?$AA@") #10
  %93 = icmp eq ptr %92, null
  br i1 %93, label %94, label %97

94:                                               ; preds = %91
  %95 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %89, ptr noundef nonnull @"??_C@_0M@KLMKCJPH@freeifaddrs?$AA@") #10
  br label %97

96:                                               ; preds = %87, %81
  store ptr null, ptr @s_freeifaddrs, align 4
  br label %106

97:                                               ; preds = %94, %91
  %98 = phi ptr [ %95, %94 ], [ %92, %91 ]
  %99 = load i16, ptr @s_netlib, align 2
  store ptr %98, ptr @s_freeifaddrs, align 4
  %100 = icmp eq i16 %99, 0
  br i1 %100, label %106, label %101

101:                                              ; preds = %97
  %102 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %99, ptr noundef nonnull @"??_C@_0BA@BICJHMNP@_if_nametoindex?$AA@") #10
  %103 = icmp eq ptr %102, null
  br i1 %103, label %104, label %106

104:                                              ; preds = %101
  %105 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %99, ptr noundef nonnull @"??_C@_0P@GFPCJLDD@if_nametoindex?$AA@") #10
  br label %106

106:                                              ; preds = %104, %101, %97, %96
  %107 = phi ptr [ null, %96 ], [ null, %97 ], [ %102, %101 ], [ %105, %104 ]
  store ptr %107, ptr @s_if_nametoindex, align 4
  %108 = load i16, ptr @s_clib, align 2
  %109 = icmp eq i16 %108, 0
  br i1 %109, label %110, label %131

110:                                              ; preds = %106
  %111 = tail call ptr @getenv(ptr noundef nonnull @"??_C@_0L@MGKODJNM@EZCAT_CLIB?$AA@")
  %112 = icmp eq ptr %111, null
  br i1 %112, label %119, label %113

113:                                              ; preds = %110
  %114 = load i8, ptr %111, align 1
  %115 = icmp eq i8 %114, 0
  br i1 %115, label %119, label %116

116:                                              ; preds = %113
  %117 = tail call zeroext i16 @LoadRtLibrary(ptr noundef nonnull %111) #10
  %118 = icmp eq i16 %117, 0
  br i1 %118, label %119, label %125

119:                                              ; preds = %116, %113, %110
  %120 = tail call fastcc i32 @ez_load_rsl_under_intime(ptr noundef nonnull @s_clib, ptr noundef nonnull @"??_C@_08IAHGEPHD@clib?4rsl?$AA@")
  %121 = icmp eq i32 %120, 0
  br i1 %121, label %127, label %122

122:                                              ; preds = %119
  %123 = tail call zeroext i16 @LoadRtLibrary(ptr noundef nonnull @"??_C@_08IAHGEPHD@clib?4rsl?$AA@") #10
  %124 = icmp eq i16 %123, 0
  br i1 %124, label %190, label %125

125:                                              ; preds = %122, %116
  %126 = phi i16 [ %117, %116 ], [ %123, %122 ]
  store i16 %126, ptr @s_clib, align 2
  br label %131

127:                                              ; preds = %119
  %128 = load i16, ptr @s_clib, align 2
  %129 = icmp eq i16 %128, 0
  br i1 %129, label %130, label %131

130:                                              ; preds = %127
  store ptr null, ptr @s_ioctl, align 4
  br label %146

131:                                              ; preds = %127, %125, %106
  %132 = phi i16 [ %128, %127 ], [ %126, %125 ], [ %108, %106 ]
  %133 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %132, ptr noundef nonnull @"??_C@_06DALELLBL@_ioctl?$AA@") #10
  %134 = icmp eq ptr %133, null
  br i1 %134, label %135, label %137

135:                                              ; preds = %131
  %136 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %132, ptr noundef nonnull @"??_C@_05MJIHFMJI@ioctl?$AA@") #10
  br label %137

137:                                              ; preds = %135, %131
  %138 = phi ptr [ %136, %135 ], [ %133, %131 ]
  %139 = load i16, ptr @s_clib, align 2
  store ptr %138, ptr @s_ioctl, align 4
  %140 = icmp eq i16 %139, 0
  br i1 %140, label %146, label %141

141:                                              ; preds = %137
  %142 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %139, ptr noundef nonnull @"??_C@_06EINEPANJ@_close?$AA@") #10
  %143 = icmp eq ptr %142, null
  br i1 %143, label %144, label %146

144:                                              ; preds = %141
  %145 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %139, ptr noundef nonnull @"??_C@_05LBOHBHFK@close?$AA@") #10
  br label %146

146:                                              ; preds = %144, %141, %137, %130
  %147 = phi ptr [ null, %130 ], [ null, %137 ], [ %142, %141 ], [ %145, %144 ]
  store ptr %147, ptr @s_close, align 4
  %148 = load ptr, ptr @s_getifaddrs, align 4
  %149 = icmp ne ptr %148, null
  %150 = load ptr, ptr @s_freeifaddrs, align 4
  %151 = icmp ne ptr %150, null
  %152 = select i1 %149, i1 %151, i1 false
  br i1 %152, label %165, label %153

153:                                              ; preds = %146
  br i1 %149, label %158, label %154

154:                                              ; preds = %153
  %155 = load i16, ptr @s_clib, align 2
  %156 = tail call fastcc ptr @ez_rsl_proc(i16 noundef zeroext %155, ptr noundef nonnull @"??_C@_0M@EGFABLNJ@_getifaddrs?$AA@", ptr noundef nonnull @"??_C@_0L@BIONKJCH@getifaddrs?$AA@")
  store ptr %156, ptr @s_getifaddrs, align 4
  %157 = load ptr, ptr @s_freeifaddrs, align 4
  br label %158

158:                                              ; preds = %154, %153
  %159 = phi ptr [ %157, %154 ], [ %150, %153 ]
  %160 = icmp eq ptr %159, null
  br i1 %160, label %161, label %165

161:                                              ; preds = %158
  %162 = load i16, ptr @s_clib, align 2
  %163 = tail call fastcc ptr @ez_rsl_proc(i16 noundef zeroext %162, ptr noundef nonnull @"??_C@_0N@PBJBELFO@_freeifaddrs?$AA@", ptr noundef nonnull @"??_C@_0M@KLMKCJPH@freeifaddrs?$AA@")
  store ptr %163, ptr @s_freeifaddrs, align 4
  %164 = icmp eq ptr %163, null
  br label %165

165:                                              ; preds = %161, %158, %146
  %166 = phi i1 [ false, %158 ], [ %164, %161 ], [ false, %146 ]
  %167 = load ptr, ptr @s_socket, align 4
  %168 = load ptr, ptr @s_bind, align 4
  %169 = load ptr, ptr @s_send, align 4
  %170 = load ptr, ptr @s_recv, align 4
  %171 = insertelement <4 x ptr> poison, ptr %167, i64 0
  %172 = insertelement <4 x ptr> %171, ptr %168, i64 1
  %173 = insertelement <4 x ptr> %172, ptr %169, i64 2
  %174 = insertelement <4 x ptr> %173, ptr %170, i64 3
  %175 = freeze <4 x ptr> %174
  %176 = load ptr, ptr @s_ioctl, align 4
  %177 = freeze ptr %176
  %178 = icmp ne ptr %177, null
  %179 = load ptr, ptr @s_close, align 4
  %180 = icmp ne ptr %179, null
  %181 = icmp eq <4 x ptr> %175, zeroinitializer
  %182 = bitcast <4 x i1> %181 to i4
  %183 = icmp eq i4 %182, 0
  %184 = and i1 %183, %178
  %185 = select i1 %184, i1 %180, i1 false
  br i1 %185, label %186, label %190

186:                                              ; preds = %165
  %187 = load ptr, ptr @s_getifaddrs, align 4
  %188 = icmp eq ptr %187, null
  %189 = select i1 %188, i1 true, i1 %166
  br i1 %189, label %190, label %220

190:                                              ; preds = %122, %165, %32, %186
  %191 = load i16, ptr @s_netlib, align 2
  %192 = icmp eq i16 %191, 0
  br i1 %192, label %193, label %194

193:                                              ; preds = %190
  store i32 1, ptr @s_open_detail, align 4
  br label %378

194:                                              ; preds = %190
  %195 = load i16, ptr @s_clib, align 2
  %196 = icmp eq i16 %195, 0
  br i1 %196, label %197, label %198

197:                                              ; preds = %194
  store i32 7, ptr @s_open_detail, align 4
  br label %378

198:                                              ; preds = %194
  %199 = load ptr, ptr @s_socket, align 4
  %200 = load ptr, ptr @s_bind, align 4
  %201 = load ptr, ptr @s_send, align 4
  %202 = load ptr, ptr @s_recv, align 4
  %203 = insertelement <4 x ptr> poison, ptr %199, i64 0
  %204 = insertelement <4 x ptr> %203, ptr %200, i64 1
  %205 = insertelement <4 x ptr> %204, ptr %201, i64 2
  %206 = insertelement <4 x ptr> %205, ptr %202, i64 3
  %207 = freeze <4 x ptr> %206
  %208 = load ptr, ptr @s_ioctl, align 4
  %209 = freeze ptr %208
  %210 = icmp ne ptr %209, null
  %211 = load ptr, ptr @s_close, align 4
  %212 = icmp ne ptr %211, null
  %213 = icmp eq <4 x ptr> %207, zeroinitializer
  %214 = bitcast <4 x i1> %213 to i4
  %215 = icmp eq i4 %214, 0
  %216 = and i1 %215, %210
  %217 = select i1 %216, i1 %212, i1 false
  br i1 %217, label %219, label %218

218:                                              ; preds = %198
  store i32 2, ptr @s_open_detail, align 4
  br label %378

219:                                              ; preds = %198
  store i32 3, ptr @s_open_detail, align 4
  br label %378

220:                                              ; preds = %15, %186
  %221 = phi ptr [ %16, %15 ], [ %187, %186 ]
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(54) %4, i8 0, i32 54, i1 false)
  %222 = getelementptr inbounds nuw i8, ptr %0, i32 4
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #10
  store ptr null, ptr %3, align 4
  %223 = call i32 %221(ptr noundef nonnull %3) #10
  %224 = icmp eq i32 %223, 0
  br i1 %224, label %225, label %348

225:                                              ; preds = %220
  %226 = load ptr, ptr %3, align 4
  %227 = icmp eq ptr %226, null
  br i1 %227, label %280, label %228

228:                                              ; preds = %225, %277
  %229 = phi ptr [ %278, %277 ], [ %226, %225 ]
  %230 = getelementptr inbounds nuw i8, ptr %229, i32 4
  %231 = load ptr, ptr %230, align 1
  %232 = icmp eq ptr %231, null
  br i1 %232, label %277, label %233

233:                                              ; preds = %228
  %234 = call i32 @strcmp(ptr noundef nonnull readonly dereferenceable(1) %231, ptr noundef nonnull readonly dereferenceable(1) %1) #10
  %235 = icmp eq i32 %234, 0
  br i1 %235, label %265, label %236

236:                                              ; preds = %233
  %237 = load i8, ptr %231, align 1
  %238 = icmp eq i8 %237, 0
  br i1 %238, label %260, label %239

239:                                              ; preds = %236, %255
  %240 = phi i8 [ %258, %255 ], [ %237, %236 ]
  %241 = phi ptr [ %256, %255 ], [ %231, %236 ]
  %242 = phi ptr [ %257, %255 ], [ %1, %236 ]
  %243 = load i8, ptr %242, align 1
  %244 = icmp eq i8 %243, 0
  br i1 %244, label %260, label %245

245:                                              ; preds = %239
  %246 = add i8 %240, -65
  %247 = icmp ult i8 %246, 26
  %248 = or disjoint i8 %240, 32
  %249 = select i1 %247, i8 %248, i8 %240
  %250 = add i8 %243, -65
  %251 = icmp ult i8 %250, 26
  %252 = or disjoint i8 %243, 32
  %253 = select i1 %251, i8 %252, i8 %243
  %254 = icmp eq i8 %249, %253
  br i1 %254, label %255, label %277

255:                                              ; preds = %245
  %256 = getelementptr inbounds nuw i8, ptr %241, i32 1
  %257 = getelementptr inbounds nuw i8, ptr %242, i32 1
  %258 = load i8, ptr %256, align 1
  %259 = icmp eq i8 %258, 0
  br i1 %259, label %260, label %239, !llvm.loop !7

260:                                              ; preds = %255, %239, %236
  %261 = phi ptr [ %1, %236 ], [ %242, %239 ], [ %257, %255 ]
  %262 = phi i8 [ 0, %236 ], [ %240, %239 ], [ 0, %255 ]
  %263 = load i8, ptr %261, align 1
  %264 = icmp eq i8 %262, %263
  br i1 %264, label %265, label %277

265:                                              ; preds = %260, %233
  %266 = getelementptr inbounds nuw i8, ptr %229, i32 12
  %267 = load ptr, ptr %266, align 1
  %268 = icmp eq ptr %267, null
  br i1 %268, label %277, label %269

269:                                              ; preds = %265
  %270 = getelementptr inbounds nuw i8, ptr %267, i32 1
  %271 = load i8, ptr %270, align 1
  %272 = icmp eq i8 %271, 18
  br i1 %272, label %273, label %277

273:                                              ; preds = %269
  %274 = getelementptr inbounds nuw i8, ptr %267, i32 6
  %275 = load i8, ptr %274, align 1
  %276 = icmp ult i8 %275, 6
  br i1 %276, label %277, label %349

277:                                              ; preds = %245, %273, %269, %265, %260, %228
  %278 = load ptr, ptr %229, align 1
  %279 = icmp eq ptr %278, null
  br i1 %279, label %280, label %228, !llvm.loop !9

280:                                              ; preds = %277, %225
  %281 = load ptr, ptr @s_if_nametoindex, align 4
  %282 = icmp eq ptr %281, null
  br i1 %282, label %310, label %283

283:                                              ; preds = %280
  %284 = call i32 %281(ptr noundef nonnull %1) #10
  %285 = icmp eq i32 %284, 0
  %286 = load ptr, ptr %3, align 4
  %287 = icmp eq ptr %286, null
  %288 = select i1 %285, i1 true, i1 %287
  br i1 %288, label %310, label %289

289:                                              ; preds = %283, %307
  %290 = phi ptr [ %308, %307 ], [ %286, %283 ]
  %291 = getelementptr inbounds nuw i8, ptr %290, i32 12
  %292 = load ptr, ptr %291, align 1
  %293 = icmp eq ptr %292, null
  br i1 %293, label %307, label %294

294:                                              ; preds = %289
  %295 = getelementptr inbounds nuw i8, ptr %292, i32 1
  %296 = load i8, ptr %295, align 1
  %297 = icmp eq i8 %296, 18
  br i1 %297, label %298, label %307

298:                                              ; preds = %294
  %299 = getelementptr inbounds nuw i8, ptr %292, i32 2
  %300 = load i16, ptr %299, align 1
  %301 = zext i16 %300 to i32
  %302 = icmp eq i32 %284, %301
  br i1 %302, label %303, label %307

303:                                              ; preds = %298
  %304 = getelementptr inbounds nuw i8, ptr %292, i32 6
  %305 = load i8, ptr %304, align 1
  %306 = icmp ult i8 %305, 6
  br i1 %306, label %307, label %349

307:                                              ; preds = %303, %298, %294, %289
  %308 = load ptr, ptr %290, align 1
  %309 = icmp eq ptr %308, null
  br i1 %309, label %310, label %289, !llvm.loop !10

310:                                              ; preds = %307, %283, %280
  %311 = phi ptr [ %226, %280 ], [ %286, %283 ], [ %286, %307 ]
  %312 = call ptr @getenv(ptr noundef nonnull @"??_C@_0N@FCEHPMED@EZCAT_LISTIF?$AA@")
  %313 = icmp eq ptr %312, null
  br i1 %313, label %345, label %314

314:                                              ; preds = %310
  %315 = load i8, ptr %312, align 1
  switch i8 %315, label %345 [
    i8 49, label %316
    i8 121, label %316
    i8 89, label %316
  ]

316:                                              ; preds = %314, %314, %314
  %317 = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %318 = icmp eq ptr %311, null
  br i1 %318, label %345, label %319

319:                                              ; preds = %316, %342
  %320 = phi ptr [ %343, %342 ], [ %311, %316 ]
  %321 = getelementptr inbounds nuw i8, ptr %320, i32 4
  %322 = load ptr, ptr %321, align 1
  %323 = icmp eq ptr %322, null
  br i1 %323, label %342, label %324

324:                                              ; preds = %319
  %325 = getelementptr inbounds nuw i8, ptr %320, i32 12
  %326 = load ptr, ptr %325, align 1
  %327 = icmp eq ptr %326, null
  br i1 %327, label %342, label %328

328:                                              ; preds = %324
  %329 = getelementptr inbounds nuw i8, ptr %326, i32 1
  %330 = load i8, ptr %329, align 1
  %331 = icmp eq i8 %330, 18
  br i1 %331, label %332, label %342

332:                                              ; preds = %328
  %333 = getelementptr inbounds nuw i8, ptr %326, i32 6
  %334 = load i8, ptr %333, align 1
  %335 = icmp ult i8 %334, 6
  br i1 %335, label %342, label %336

336:                                              ; preds = %332
  %337 = zext i8 %334 to i32
  %338 = getelementptr inbounds nuw i8, ptr %326, i32 2
  %339 = load i16, ptr %338, align 1
  %340 = zext i16 %339 to i32
  %341 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CA@CALMBEKF@ezcat?3?5?5?5?$CFs?5?5index?$DN?$CFu?5?5alen?$DN?$CFu?6?$AA@", ptr noundef nonnull %322, i32 noundef %340, i32 noundef %337)
  br label %342

342:                                              ; preds = %336, %332, %328, %324, %319
  %343 = load ptr, ptr %320, align 1
  %344 = icmp eq ptr %343, null
  br i1 %344, label %345, label %319, !llvm.loop !11

345:                                              ; preds = %342, %316, %314, %310
  %346 = load ptr, ptr @s_freeifaddrs, align 4
  %347 = load ptr, ptr %3, align 4
  call void %346(ptr noundef %347) #10
  br label %348

348:                                              ; preds = %345, %220
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #10
  store i32 4, ptr @s_open_detail, align 4
  store i32 6, ptr @s_open_errno, align 4
  br label %378

349:                                              ; preds = %273, %303
  %350 = phi ptr [ %292, %303 ], [ %267, %273 ]
  %351 = phi ptr [ %286, %303 ], [ %226, %273 ]
  %352 = getelementptr inbounds nuw i8, ptr %350, i32 8
  %353 = getelementptr inbounds nuw i8, ptr %350, i32 5
  %354 = load i8, ptr %353, align 1
  %355 = zext i8 %354 to i32
  %356 = getelementptr inbounds nuw i8, ptr %352, i32 %355
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(6) %222, ptr noundef nonnull readonly align 1 dereferenceable(6) %356, i32 6, i1 false)
  %357 = load i8, ptr %350, align 1
  %358 = zext i8 %357 to i32
  call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %4, ptr nonnull readonly align 1 %350, i32 %358, i1 false)
  %359 = load ptr, ptr @s_freeifaddrs, align 4
  call void %359(ptr noundef %351) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #10
  %360 = load ptr, ptr @s_socket, align 4
  %361 = call i32 %360(i32 noundef 18, i32 noundef 3, i32 noundef 34980) #10
  %362 = icmp slt i32 %361, 0
  br i1 %362, label %363, label %366

363:                                              ; preds = %349
  store i32 5, ptr @s_open_detail, align 4
  %364 = call ptr @_thread_ptr() #10
  %365 = load i32, ptr %364, align 4
  store i32 %365, ptr @s_open_errno, align 4
  br label %378

366:                                              ; preds = %349
  %367 = load ptr, ptr @s_bind, align 4
  %368 = load i8, ptr %4, align 1
  %369 = zext i8 %368 to i32
  %370 = call i32 %367(i32 noundef %361, ptr noundef nonnull %4, i32 noundef %369) #10
  %371 = icmp eq i32 %370, 0
  br i1 %371, label %377, label %372

372:                                              ; preds = %366
  store i32 6, ptr @s_open_detail, align 4
  %373 = call ptr @_thread_ptr() #10
  %374 = load i32, ptr %373, align 4
  store i32 %374, ptr @s_open_errno, align 4
  %375 = load ptr, ptr @s_close, align 4
  %376 = call i32 %375(i32 noundef %361) #10
  br label %378

377:                                              ; preds = %366
  store i32 %361, ptr %0, align 4
  br label %378

378:                                              ; preds = %193, %218, %219, %197, %2, %8, %377, %372, %363, %348
  %379 = phi i32 [ -1, %2 ], [ -1, %348 ], [ -1, %363 ], [ -1, %372 ], [ 0, %377 ], [ -1, %8 ], [ -1, %197 ], [ -1, %219 ], [ -1, %218 ], [ -1, %193 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #10
  ret i32 %379
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #3

declare dso_local ptr @_thread_ptr() local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: nounwind
define dso_local void @ezcat_lowsock_close(ptr noundef captures(address_is_null) %0) local_unnamed_addr #1 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %11, label %3

3:                                                ; preds = %1
  %4 = load i32, ptr %0, align 4
  %5 = icmp sgt i32 %4, -1
  %6 = load ptr, ptr @s_close, align 4
  %7 = icmp ne ptr %6, null
  %8 = select i1 %5, i1 %7, i1 false
  br i1 %8, label %9, label %11

9:                                                ; preds = %3
  %10 = tail call i32 %6(i32 noundef %4) #10
  store i32 -1, ptr %0, align 4
  br label %11

11:                                               ; preds = %1, %9, %3
  ret void
}

; Function Attrs: nounwind
define dso_local range(i32 -2, -2147483648) i32 @ezcat_lowsock_txrx(ptr noundef readonly captures(address_is_null) %0, ptr noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) local_unnamed_addr #1 {
  %6 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %6) #10
  store i32 1, ptr %6, align 4
  %7 = icmp eq ptr %0, null
  br i1 %7, label %62, label %8

8:                                                ; preds = %5
  %9 = load i32, ptr %0, align 4
  %10 = icmp slt i32 %9, 0
  %11 = icmp eq ptr %1, null
  %12 = or i1 %11, %10
  %13 = icmp slt i32 %2, 1
  %14 = or i1 %13, %12
  %15 = icmp slt i32 %3, %2
  %16 = or i1 %15, %14
  br i1 %16, label %62, label %17

17:                                               ; preds = %8
  %18 = load ptr, ptr @s_ioctl, align 4
  %19 = call i32 %18(i32 noundef %9, i32 noundef -2147195266, ptr noundef nonnull %6) #10
  %20 = icmp ne i32 %19, 0
  %21 = load ptr, ptr @s_send, align 4
  %22 = load i32, ptr %0, align 4
  %23 = call i32 %21(i32 noundef %22, ptr noundef nonnull %1, i32 noundef %2, i32 noundef 0) #10
  %24 = icmp eq i32 %23, %2
  br i1 %24, label %25, label %29

25:                                               ; preds = %17
  %26 = icmp eq i32 %4, 0
  br i1 %26, label %56, label %27

27:                                               ; preds = %25
  %28 = getelementptr inbounds nuw i8, ptr %1, i32 12
  br label %30

29:                                               ; preds = %17
  br i1 %20, label %62, label %57

30:                                               ; preds = %27, %44
  %31 = phi i32 [ 0, %27 ], [ %46, %44 ]
  %32 = load ptr, ptr @s_recv, align 4
  %33 = load i32, ptr %0, align 4
  %34 = call i32 %32(i32 noundef %33, ptr noundef nonnull %1, i32 noundef %3, i32 noundef 0) #10
  %35 = icmp slt i32 %34, 0
  br i1 %35, label %36, label %49

36:                                               ; preds = %30
  %37 = call ptr @_thread_ptr() #10
  %38 = load i32, ptr %37, align 4
  %39 = icmp eq i32 %38, 95
  br i1 %39, label %44, label %40

40:                                               ; preds = %36
  %41 = call ptr @_thread_ptr() #10
  %42 = load i32, ptr %41, align 4
  %43 = icmp eq i32 %42, 11
  br i1 %43, label %44, label %48

44:                                               ; preds = %36, %40, %49, %55
  %45 = call zeroext i8 @RtSleep(i32 noundef 1) #10
  %46 = add nuw i32 %31, 1
  %47 = icmp eq i32 %46, %4
  br i1 %47, label %56, label %30, !llvm.loop !12

48:                                               ; preds = %40
  br i1 %20, label %62, label %57

49:                                               ; preds = %30
  %50 = icmp samesign ugt i32 %34, 13
  br i1 %50, label %51, label %44

51:                                               ; preds = %49
  %52 = load i16, ptr %28, align 1
  %53 = icmp ne i16 %52, -30556
  %54 = select i1 %53, i1 true, i1 %20
  br i1 %54, label %55, label %57

55:                                               ; preds = %51
  br i1 %53, label %44, label %62

56:                                               ; preds = %44, %25
  br i1 %20, label %62, label %57

57:                                               ; preds = %51, %56, %48, %29
  %58 = phi i32 [ -2, %56 ], [ -1, %29 ], [ -1, %48 ], [ %34, %51 ]
  store i32 0, ptr %6, align 4
  %59 = load ptr, ptr @s_ioctl, align 4
  %60 = load i32, ptr %0, align 4
  %61 = call i32 %59(i32 noundef %60, i32 noundef -2147195266, ptr noundef nonnull %6) #10
  br label %62

62:                                               ; preds = %55, %57, %56, %48, %29, %5, %8
  %63 = phi i32 [ -1, %48 ], [ -1, %5 ], [ -1, %29 ], [ -2, %56 ], [ -1, %8 ], [ %58, %57 ], [ %34, %55 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #10
  ret i32 %63
}

declare dso_local zeroext i8 @RtSleep(i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define internal fastcc ptr @ez_rsl_proc(i16 noundef zeroext %0, ptr noundef %1, ptr noundef %2) unnamed_addr #1 {
  %4 = icmp eq i16 %0, 0
  br i1 %4, label %16, label %5

5:                                                ; preds = %3
  %6 = icmp eq ptr %1, null
  br i1 %6, label %10, label %7

7:                                                ; preds = %5
  %8 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %0, ptr noundef nonnull %1) #10
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %16

10:                                               ; preds = %7, %5
  %11 = icmp eq ptr %2, null
  br i1 %11, label %15, label %12

12:                                               ; preds = %10
  %13 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %0, ptr noundef nonnull %2) #10
  %14 = icmp eq ptr %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %12, %10
  br label %16

16:                                               ; preds = %12, %7, %3, %15
  %17 = phi ptr [ null, %15 ], [ null, %3 ], [ %8, %7 ], [ %13, %12 ]
  ret ptr %17
}

; Function Attrs: nofree nounwind memory(read)
declare dso_local noundef ptr @getenv(ptr noundef captures(none)) local_unnamed_addr #5

; Function Attrs: nounwind
define internal fastcc range(i32 -1, 1) i32 @ez_load_rsl_under_intime(ptr noundef writeonly captures(address_is_null) %0, ptr noundef readonly captures(address_is_null) %1) unnamed_addr #1 {
  %3 = alloca [280 x i8], align 1
  %4 = alloca [300 x i8], align 1
  %5 = alloca [320 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #10
  %6 = icmp eq ptr %1, null
  %7 = icmp eq ptr %0, null
  br label %8

8:                                                ; preds = %2, %113
  %9 = phi i32 [ 0, %2 ], [ %114, %113 ]
  %10 = getelementptr inbounds nuw ptr, ptr @ez_load_rsl_under_intime.env_intime, i32 %9
  %11 = load ptr, ptr %10, align 4
  %12 = call ptr @getenv(ptr noundef %11)
  %13 = icmp eq ptr %12, null
  br i1 %13, label %113, label %14

14:                                               ; preds = %8
  %15 = load i8, ptr %12, align 1
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %113, label %17

17:                                               ; preds = %14, %20
  %18 = phi i8 [ %22, %20 ], [ %15, %14 ]
  %19 = phi ptr [ %21, %20 ], [ %12, %14 ]
  switch i8 %18, label %23 [
    i8 32, label %20
    i8 9, label %20
  ]

20:                                               ; preds = %17, %17
  %21 = getelementptr inbounds nuw i8, ptr %19, i32 1
  %22 = load i8, ptr %21, align 1
  br label %17, !llvm.loop !13

23:                                               ; preds = %17
  %24 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %19) #10
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %46, label %26

26:                                               ; preds = %23, %31
  %27 = phi i32 [ %32, %31 ], [ %24, %23 ]
  %28 = getelementptr i8, ptr %19, i32 %27
  %29 = getelementptr i8, ptr %28, i32 -1
  %30 = load i8, ptr %29, align 1
  switch i8 %30, label %34 [
    i8 32, label %31
    i8 9, label %31
  ]

31:                                               ; preds = %26, %26
  %32 = add i32 %27, -1
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %46, label %26, !llvm.loop !14

34:                                               ; preds = %26
  %35 = icmp eq i32 %27, 1
  br i1 %35, label %46, label %36

36:                                               ; preds = %34
  %37 = icmp eq i8 %18, 34
  %38 = icmp eq i8 %30, 34
  %39 = and i1 %37, %38
  %40 = add i32 %27, -2
  %41 = zext i1 %39 to i32
  %42 = getelementptr inbounds nuw i8, ptr %19, i32 %41
  %43 = select i1 %39, i32 %40, i32 %27
  %44 = add i32 %43, -280
  %45 = icmp ult i32 %44, -281
  br i1 %45, label %113, label %46

46:                                               ; preds = %31, %23, %34, %36
  %47 = phi i32 [ %43, %36 ], [ 1, %34 ], [ 0, %23 ], [ 0, %31 ]
  %48 = phi ptr [ %42, %36 ], [ %19, %34 ], [ %19, %23 ], [ %19, %31 ]
  call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %3, ptr nonnull align 1 %48, i32 %47, i1 false)
  %49 = getelementptr inbounds nuw i8, ptr %3, i32 %47
  store i8 0, ptr %49, align 1
  %50 = load i8, ptr %3, align 1
  %51 = icmp eq i8 %50, 0
  br i1 %51, label %113, label %52

52:                                               ; preds = %46
  %53 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %3) #10
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %64, label %55

55:                                               ; preds = %52, %60
  %56 = phi i32 [ %61, %60 ], [ %53, %52 ]
  %57 = getelementptr i8, ptr %3, i32 %56
  %58 = getelementptr i8, ptr %57, i32 -1
  %59 = load i8, ptr %58, align 1
  switch i8 %59, label %64 [
    i8 92, label %60
    i8 47, label %60
  ]

60:                                               ; preds = %55, %55
  %61 = add i32 %56, -1
  %62 = getelementptr inbounds nuw i8, ptr %3, i32 %61
  store i8 0, ptr %62, align 1
  %63 = icmp eq i32 %61, 0
  br i1 %63, label %64, label %55, !llvm.loop !15

64:                                               ; preds = %55, %60, %52
  %65 = call i32 @strlen(ptr noundef nonnull readonly dereferenceable(1) %3) #10
  %66 = add i32 %65, 1
  %67 = icmp eq i32 %65, 0
  %68 = getelementptr i8, ptr %3, i32 %65
  %69 = getelementptr i8, ptr %68, i32 -1
  %70 = getelementptr inbounds nuw i8, ptr %4, i32 %65
  br label %71

71:                                               ; preds = %64, %110
  %72 = phi i32 [ 0, %64 ], [ %111, %110 ]
  %73 = getelementptr inbounds nuw ptr, ptr @ez_load_rsl_under_intime.subdirs, i32 %72
  %74 = load ptr, ptr %73, align 4
  %75 = call i32 @strlen(ptr noundef nonnull readonly dereferenceable(1) %74) #10
  %76 = add i32 %75, 1
  %77 = add i32 %76, %66
  %78 = icmp ugt i32 %77, 300
  br i1 %78, label %110, label %79

79:                                               ; preds = %71
  call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %4, ptr nonnull readonly align 1 %3, i32 %65, i1 false)
  br i1 %67, label %83, label %80

80:                                               ; preds = %79
  %81 = load i8, ptr %69, align 1
  switch i8 %81, label %82 [
    i8 92, label %83
    i8 47, label %83
  ]

82:                                               ; preds = %80
  store i8 92, ptr %70, align 1
  br label %83

83:                                               ; preds = %82, %80, %80, %79
  %84 = phi i32 [ %66, %82 ], [ %65, %80 ], [ %65, %80 ], [ 0, %79 ]
  %85 = getelementptr inbounds nuw i8, ptr %4, i32 %84
  call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %85, ptr nonnull readonly align 1 %74, i32 %76, i1 false)
  br i1 %6, label %110, label %86

86:                                               ; preds = %83
  %87 = call i32 @strlen(ptr noundef nonnull readonly dereferenceable(1) %4) #10
  %88 = call i32 @strlen(ptr noundef nonnull readonly dereferenceable(1) %1) #10
  %89 = add i32 %87, 1
  %90 = add i32 %88, 1
  %91 = add i32 %90, %89
  %92 = icmp ugt i32 %91, 320
  br i1 %92, label %110, label %93

93:                                               ; preds = %86
  call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %5, ptr nonnull readonly align 1 %4, i32 %87, i1 false)
  %94 = icmp eq i32 %87, 0
  br i1 %94, label %101, label %95

95:                                               ; preds = %93
  %96 = getelementptr i8, ptr %4, i32 %87
  %97 = getelementptr i8, ptr %96, i32 -1
  %98 = load i8, ptr %97, align 1
  switch i8 %98, label %99 [
    i8 92, label %101
    i8 47, label %101
  ]

99:                                               ; preds = %95
  %100 = getelementptr inbounds nuw i8, ptr %5, i32 %87
  store i8 92, ptr %100, align 1
  br label %101

101:                                              ; preds = %99, %95, %95, %93
  %102 = phi i32 [ %89, %99 ], [ %87, %95 ], [ %87, %95 ], [ 0, %93 ]
  %103 = getelementptr inbounds nuw i8, ptr %5, i32 %102
  call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %103, ptr nonnull readonly align 1 %1, i32 %90, i1 false)
  %104 = load i8, ptr %5, align 1
  %105 = icmp eq i8 %104, 0
  %106 = select i1 %7, i1 true, i1 %105
  br i1 %106, label %110, label %107

107:                                              ; preds = %101
  %108 = call zeroext i16 @LoadRtLibrary(ptr noundef nonnull %5) #10
  %109 = icmp eq i16 %108, 0
  br i1 %109, label %110, label %187

110:                                              ; preds = %107, %101, %86, %83, %71
  %111 = add nuw nsw i32 %72, 1
  %112 = icmp eq i32 %111, 4
  br i1 %112, label %113, label %71, !llvm.loop !16

113:                                              ; preds = %110, %36, %46, %8, %14
  %114 = add nuw nsw i32 %9, 1
  %115 = icmp eq i32 %114, 3
  br i1 %115, label %116, label %8, !llvm.loop !17

116:                                              ; preds = %113, %184
  %117 = phi ptr [ %186, %184 ], [ @"??_C@_0BO@NHKEAEGN@C?3?2Program?5Files?5?$CIx86?$CJ?2INtime?$AA@", %113 ]
  %118 = phi i1 [ true, %184 ], [ false, %113 ]
  %119 = phi i32 [ 2, %184 ], [ 1, %113 ]
  %120 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %117) #10
  %121 = icmp ugt i32 %120, 279
  br i1 %121, label %184, label %122

122:                                              ; preds = %116
  %123 = add nuw nsw i32 %120, 1
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(1) %3, ptr noundef nonnull align 1 dereferenceable(1) %117, i32 %123, i1 false)
  %124 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %3) #10
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %135, label %126

126:                                              ; preds = %122, %131
  %127 = phi i32 [ %132, %131 ], [ %124, %122 ]
  %128 = getelementptr i8, ptr %3, i32 %127
  %129 = getelementptr i8, ptr %128, i32 -1
  %130 = load i8, ptr %129, align 1
  switch i8 %130, label %135 [
    i8 92, label %131
    i8 47, label %131
  ]

131:                                              ; preds = %126, %126
  %132 = add i32 %127, -1
  %133 = getelementptr inbounds nuw i8, ptr %3, i32 %132
  store i8 0, ptr %133, align 1
  %134 = icmp eq i32 %132, 0
  br i1 %134, label %135, label %126, !llvm.loop !15

135:                                              ; preds = %126, %131, %122
  %136 = call i32 @strlen(ptr noundef nonnull readonly dereferenceable(1) %3) #10
  %137 = add i32 %136, 1
  %138 = icmp eq i32 %136, 0
  %139 = getelementptr i8, ptr %3, i32 %136
  %140 = getelementptr i8, ptr %139, i32 -1
  %141 = getelementptr inbounds nuw i8, ptr %4, i32 %136
  br label %142

142:                                              ; preds = %135, %181
  %143 = phi i32 [ 0, %135 ], [ %182, %181 ]
  %144 = getelementptr inbounds nuw ptr, ptr @ez_load_rsl_under_intime.subdirs, i32 %143
  %145 = load ptr, ptr %144, align 4
  %146 = call i32 @strlen(ptr noundef nonnull readonly dereferenceable(1) %145) #10
  %147 = add i32 %146, 1
  %148 = add i32 %147, %137
  %149 = icmp ugt i32 %148, 300
  br i1 %149, label %181, label %150

150:                                              ; preds = %142
  call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %4, ptr nonnull readonly align 1 %3, i32 %136, i1 false)
  br i1 %138, label %154, label %151

151:                                              ; preds = %150
  %152 = load i8, ptr %140, align 1
  switch i8 %152, label %153 [
    i8 92, label %154
    i8 47, label %154
  ]

153:                                              ; preds = %151
  store i8 92, ptr %141, align 1
  br label %154

154:                                              ; preds = %153, %151, %151, %150
  %155 = phi i32 [ %137, %153 ], [ %136, %151 ], [ %136, %151 ], [ 0, %150 ]
  %156 = getelementptr inbounds nuw i8, ptr %4, i32 %155
  call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %156, ptr nonnull readonly align 1 %145, i32 %147, i1 false)
  br i1 %6, label %181, label %157

157:                                              ; preds = %154
  %158 = call i32 @strlen(ptr noundef nonnull readonly dereferenceable(1) %4) #10
  %159 = call i32 @strlen(ptr noundef nonnull readonly dereferenceable(1) %1) #10
  %160 = add i32 %158, 1
  %161 = add i32 %159, 1
  %162 = add i32 %161, %160
  %163 = icmp ugt i32 %162, 320
  br i1 %163, label %181, label %164

164:                                              ; preds = %157
  call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %5, ptr nonnull readonly align 1 %4, i32 %158, i1 false)
  %165 = icmp eq i32 %158, 0
  br i1 %165, label %172, label %166

166:                                              ; preds = %164
  %167 = getelementptr i8, ptr %4, i32 %158
  %168 = getelementptr i8, ptr %167, i32 -1
  %169 = load i8, ptr %168, align 1
  switch i8 %169, label %170 [
    i8 92, label %172
    i8 47, label %172
  ]

170:                                              ; preds = %166
  %171 = getelementptr inbounds nuw i8, ptr %5, i32 %158
  store i8 92, ptr %171, align 1
  br label %172

172:                                              ; preds = %170, %166, %166, %164
  %173 = phi i32 [ %160, %170 ], [ %158, %166 ], [ %158, %166 ], [ 0, %164 ]
  %174 = getelementptr inbounds nuw i8, ptr %5, i32 %173
  call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %174, ptr nonnull readonly align 1 %1, i32 %161, i1 false)
  %175 = load i8, ptr %5, align 1
  %176 = icmp eq i8 %175, 0
  %177 = select i1 %7, i1 true, i1 %176
  br i1 %177, label %181, label %178

178:                                              ; preds = %172
  %179 = call zeroext i16 @LoadRtLibrary(ptr noundef nonnull %5) #10
  %180 = icmp eq i16 %179, 0
  br i1 %180, label %181, label %187

181:                                              ; preds = %178, %172, %157, %154, %142
  %182 = add nuw nsw i32 %143, 1
  %183 = icmp eq i32 %182, 4
  br i1 %183, label %184, label %142, !llvm.loop !18

184:                                              ; preds = %181, %116
  %185 = getelementptr inbounds nuw ptr, ptr @ez_load_rsl_under_intime.roots_fallback, i32 %119
  %186 = load ptr, ptr %185, align 4
  br i1 %118, label %189, label %116, !llvm.loop !19

187:                                              ; preds = %107, %178
  %188 = phi i16 [ %179, %178 ], [ %108, %107 ]
  store i16 %188, ptr %0, align 2
  br label %189

189:                                              ; preds = %184, %187
  %190 = phi i32 [ 0, %187 ], [ -1, %184 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #10
  ret i32 %190
}

declare dso_local zeroext i16 @LoadRtLibrary(ptr noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strlen(ptr noundef captures(none)) local_unnamed_addr #6

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #7

declare dso_local ptr @GetRtProcAddress(i16 noundef zeroext, ptr noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strcmp(ptr noundef captures(none), ptr noundef captures(none)) local_unnamed_addr #6

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #8

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #9

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind memory(read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #8 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nofree nounwind }
attributes #10 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\work\\rtacc\\examples2\\ezcat\\ezcat_lowsock.c", directory: "D:\\work\\rtacc")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !8}
!12 = distinct !{!12, !8}
!13 = distinct !{!13, !8}
!14 = distinct !{!14, !8}
!15 = distinct !{!15, !8}
!16 = distinct !{!16, !8}
!17 = distinct !{!17, !8}
!18 = distinct !{!18, !8}
!19 = distinct !{!19, !8}
