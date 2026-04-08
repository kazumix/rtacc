; ModuleID = 'ezcat_lowsock_intime.c'
source_filename = "ezcat_lowsock_intime.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.ifreq = type { [16 x i8], %union.anon }
%union.anon = type { %struct.ifreq_buffer, [8 x i8] }
%struct.ifreq_buffer = type { i32, ptr }

$LibVersion_0x0701 = comdat any

$"??_C@_00CNPNBAHC@?$AA@" = comdat any

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

$"??_C@_09CINKECGM@EZCAT_MAC?$AA@" = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@s_open_errno = internal unnamed_addr global i32 0, align 4
@s_open_detail = internal unnamed_addr global i32 0, align 4
@"??_C@_00CNPNBAHC@?$AA@" = linkonce_odr dso_local unnamed_addr constant [1 x i8] zeroinitializer, comdat, align 1
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
@"??_C@_09CINKECGM@EZCAT_MAC?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"EZCAT_MAC\00", comdat, align 1

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

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef nonnull ptr @ezcat_lowsock_last_io_msg() local_unnamed_addr #1 {
  ret ptr @"??_C@_00CNPNBAHC@?$AA@"
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local void @ezcat_lowsock_list_devices() local_unnamed_addr #1 {
  ret void
}

; Function Attrs: nounwind
define dso_local range(i32 -1, 1) i32 @ezcat_lowsock_open(ptr noundef %0, ptr noundef %1) local_unnamed_addr #2 {
  %3 = alloca ptr, align 4
  %4 = alloca %struct.ifreq, align 1
  %5 = alloca ptr, align 4
  %6 = alloca [256 x i8], align 1
  store i32 0, ptr @s_open_errno, align 4
  store i32 0, ptr @s_open_detail, align 4
  %7 = icmp ne ptr %0, null
  %8 = icmp ne ptr %1, null
  %9 = and i1 %7, %8
  br i1 %9, label %10, label %478

10:                                               ; preds = %2
  %11 = load i8, ptr %1, align 1
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %478, label %13

13:                                               ; preds = %10
  %14 = getelementptr inbounds nuw i8, ptr %0, i32 4
  tail call void @llvm.memset.p0.i32(ptr noundef nonnull align 4 dereferenceable(652) %14, i8 0, i32 652, i1 false)
  store i32 -1, ptr %0, align 4
  %15 = load ptr, ptr @s_socket, align 4
  %16 = icmp eq ptr %15, null
  br i1 %16, label %19, label %17

17:                                               ; preds = %13
  %18 = load ptr, ptr @s_getifaddrs, align 4
  br label %222

19:                                               ; preds = %13
  %20 = load i16, ptr @s_netlib, align 2
  %21 = icmp eq i16 %20, 0
  br i1 %21, label %22, label %43

22:                                               ; preds = %19
  %23 = tail call ptr @getenv(ptr noundef nonnull @"??_C@_0N@PBPLELHF@EZCAT_NETLIB?$AA@")
  %24 = icmp eq ptr %23, null
  br i1 %24, label %31, label %25

25:                                               ; preds = %22
  %26 = load i8, ptr %23, align 1
  %27 = icmp eq i8 %26, 0
  br i1 %27, label %31, label %28

28:                                               ; preds = %25
  %29 = tail call zeroext i16 @LoadRtLibrary(ptr noundef nonnull %23) #12
  %30 = icmp eq i16 %29, 0
  br i1 %30, label %31, label %37

31:                                               ; preds = %28, %25, %22
  %32 = tail call fastcc i32 @ez_load_rsl_under_intime(ptr noundef nonnull @s_netlib, ptr noundef nonnull @"??_C@_0L@PADFLHID@netlib?4rsl?$AA@")
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %39, label %34

34:                                               ; preds = %31
  %35 = tail call zeroext i16 @LoadRtLibrary(ptr noundef nonnull @"??_C@_0L@PADFLHID@netlib?4rsl?$AA@") #12
  %36 = icmp eq i16 %35, 0
  br i1 %36, label %192, label %37

37:                                               ; preds = %34, %28
  %38 = phi i16 [ %29, %28 ], [ %35, %34 ]
  store i16 %38, ptr @s_netlib, align 2
  br label %43

39:                                               ; preds = %31
  %40 = load i16, ptr @s_netlib, align 2
  %41 = icmp eq i16 %40, 0
  br i1 %41, label %42, label %43

42:                                               ; preds = %39
  store ptr null, ptr @s_socket, align 4
  br label %58

43:                                               ; preds = %39, %37, %19
  %44 = phi i16 [ %40, %39 ], [ %38, %37 ], [ %20, %19 ]
  %45 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %44, ptr noundef nonnull @"??_C@_07FADHOGD@_socket?$AA@") #12
  %46 = icmp eq ptr %45, null
  br i1 %46, label %47, label %49

47:                                               ; preds = %43
  %48 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %44, ptr noundef nonnull @"??_C@_06HBELJPBO@socket?$AA@") #12
  br label %49

49:                                               ; preds = %47, %43
  %50 = phi ptr [ %48, %47 ], [ %45, %43 ]
  %51 = load i16, ptr @s_netlib, align 2
  store ptr %50, ptr @s_socket, align 4
  %52 = icmp eq i16 %51, 0
  br i1 %52, label %58, label %53

53:                                               ; preds = %49
  %54 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %51, ptr noundef nonnull @"??_C@_05FFOBDAFD@_bind?$AA@") #12
  %55 = icmp eq ptr %54, null
  br i1 %55, label %56, label %59

56:                                               ; preds = %53
  %57 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %51, ptr noundef nonnull @"??_C@_04NPNJNMMP@bind?$AA@") #12
  br label %59

58:                                               ; preds = %49, %42
  store ptr null, ptr @s_bind, align 4
  br label %69

59:                                               ; preds = %56, %53
  %60 = phi ptr [ %57, %56 ], [ %54, %53 ]
  %61 = load i16, ptr @s_netlib, align 2
  store ptr %60, ptr @s_bind, align 4
  %62 = icmp eq i16 %61, 0
  br i1 %62, label %63, label %64

63:                                               ; preds = %59
  store ptr null, ptr @s_send, align 4
  br label %78

64:                                               ; preds = %59
  %65 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %61, ptr noundef nonnull @"??_C@_05ECLHDBNJ@_send?$AA@") #12
  %66 = icmp eq ptr %65, null
  br i1 %66, label %67, label %69

67:                                               ; preds = %64
  %68 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %61, ptr noundef nonnull @"??_C@_04MIIPNNEF@send?$AA@") #12
  br label %69

69:                                               ; preds = %67, %64, %58
  %70 = phi ptr [ null, %58 ], [ %68, %67 ], [ %65, %64 ]
  %71 = load i16, ptr @s_netlib, align 2
  store ptr %70, ptr @s_send, align 4
  %72 = icmp eq i16 %71, 0
  br i1 %72, label %78, label %73

73:                                               ; preds = %69
  %74 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %71, ptr noundef nonnull @"??_C@_05PPLPLOJ@_recv?$AA@") #12
  %75 = icmp eq ptr %74, null
  br i1 %75, label %76, label %79

76:                                               ; preds = %73
  %77 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %71, ptr noundef nonnull @"??_C@_04IFMDBHHF@recv?$AA@") #12
  br label %79

78:                                               ; preds = %69, %63
  store ptr null, ptr @s_recv, align 4
  br label %89

79:                                               ; preds = %76, %73
  %80 = phi ptr [ %77, %76 ], [ %74, %73 ]
  %81 = load i16, ptr @s_netlib, align 2
  store ptr %80, ptr @s_recv, align 4
  %82 = icmp eq i16 %81, 0
  br i1 %82, label %83, label %84

83:                                               ; preds = %79
  store ptr null, ptr @s_getifaddrs, align 4
  br label %98

84:                                               ; preds = %79
  %85 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %81, ptr noundef nonnull @"??_C@_0M@EGFABLNJ@_getifaddrs?$AA@") #12
  %86 = icmp eq ptr %85, null
  br i1 %86, label %87, label %89

87:                                               ; preds = %84
  %88 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %81, ptr noundef nonnull @"??_C@_0L@BIONKJCH@getifaddrs?$AA@") #12
  br label %89

89:                                               ; preds = %87, %84, %78
  %90 = phi ptr [ null, %78 ], [ %88, %87 ], [ %85, %84 ]
  %91 = load i16, ptr @s_netlib, align 2
  store ptr %90, ptr @s_getifaddrs, align 4
  %92 = icmp eq i16 %91, 0
  br i1 %92, label %98, label %93

93:                                               ; preds = %89
  %94 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %91, ptr noundef nonnull @"??_C@_0N@PBJBELFO@_freeifaddrs?$AA@") #12
  %95 = icmp eq ptr %94, null
  br i1 %95, label %96, label %99

96:                                               ; preds = %93
  %97 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %91, ptr noundef nonnull @"??_C@_0M@KLMKCJPH@freeifaddrs?$AA@") #12
  br label %99

98:                                               ; preds = %89, %83
  store ptr null, ptr @s_freeifaddrs, align 4
  br label %108

99:                                               ; preds = %96, %93
  %100 = phi ptr [ %97, %96 ], [ %94, %93 ]
  %101 = load i16, ptr @s_netlib, align 2
  store ptr %100, ptr @s_freeifaddrs, align 4
  %102 = icmp eq i16 %101, 0
  br i1 %102, label %108, label %103

103:                                              ; preds = %99
  %104 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %101, ptr noundef nonnull @"??_C@_0BA@BICJHMNP@_if_nametoindex?$AA@") #12
  %105 = icmp eq ptr %104, null
  br i1 %105, label %106, label %108

106:                                              ; preds = %103
  %107 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %101, ptr noundef nonnull @"??_C@_0P@GFPCJLDD@if_nametoindex?$AA@") #12
  br label %108

108:                                              ; preds = %106, %103, %99, %98
  %109 = phi ptr [ null, %98 ], [ null, %99 ], [ %104, %103 ], [ %107, %106 ]
  store ptr %109, ptr @s_if_nametoindex, align 4
  %110 = load i16, ptr @s_clib, align 2
  %111 = icmp eq i16 %110, 0
  br i1 %111, label %112, label %133

112:                                              ; preds = %108
  %113 = tail call ptr @getenv(ptr noundef nonnull @"??_C@_0L@MGKODJNM@EZCAT_CLIB?$AA@")
  %114 = icmp eq ptr %113, null
  br i1 %114, label %121, label %115

115:                                              ; preds = %112
  %116 = load i8, ptr %113, align 1
  %117 = icmp eq i8 %116, 0
  br i1 %117, label %121, label %118

118:                                              ; preds = %115
  %119 = tail call zeroext i16 @LoadRtLibrary(ptr noundef nonnull %113) #12
  %120 = icmp eq i16 %119, 0
  br i1 %120, label %121, label %127

121:                                              ; preds = %118, %115, %112
  %122 = tail call fastcc i32 @ez_load_rsl_under_intime(ptr noundef nonnull @s_clib, ptr noundef nonnull @"??_C@_08IAHGEPHD@clib?4rsl?$AA@")
  %123 = icmp eq i32 %122, 0
  br i1 %123, label %129, label %124

124:                                              ; preds = %121
  %125 = tail call zeroext i16 @LoadRtLibrary(ptr noundef nonnull @"??_C@_08IAHGEPHD@clib?4rsl?$AA@") #12
  %126 = icmp eq i16 %125, 0
  br i1 %126, label %192, label %127

127:                                              ; preds = %124, %118
  %128 = phi i16 [ %119, %118 ], [ %125, %124 ]
  store i16 %128, ptr @s_clib, align 2
  br label %133

129:                                              ; preds = %121
  %130 = load i16, ptr @s_clib, align 2
  %131 = icmp eq i16 %130, 0
  br i1 %131, label %132, label %133

132:                                              ; preds = %129
  store ptr null, ptr @s_ioctl, align 4
  br label %148

133:                                              ; preds = %129, %127, %108
  %134 = phi i16 [ %130, %129 ], [ %128, %127 ], [ %110, %108 ]
  %135 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %134, ptr noundef nonnull @"??_C@_06DALELLBL@_ioctl?$AA@") #12
  %136 = icmp eq ptr %135, null
  br i1 %136, label %137, label %139

137:                                              ; preds = %133
  %138 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %134, ptr noundef nonnull @"??_C@_05MJIHFMJI@ioctl?$AA@") #12
  br label %139

139:                                              ; preds = %137, %133
  %140 = phi ptr [ %138, %137 ], [ %135, %133 ]
  %141 = load i16, ptr @s_clib, align 2
  store ptr %140, ptr @s_ioctl, align 4
  %142 = icmp eq i16 %141, 0
  br i1 %142, label %148, label %143

143:                                              ; preds = %139
  %144 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %141, ptr noundef nonnull @"??_C@_06EINEPANJ@_close?$AA@") #12
  %145 = icmp eq ptr %144, null
  br i1 %145, label %146, label %148

146:                                              ; preds = %143
  %147 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %141, ptr noundef nonnull @"??_C@_05LBOHBHFK@close?$AA@") #12
  br label %148

148:                                              ; preds = %146, %143, %139, %132
  %149 = phi ptr [ null, %132 ], [ null, %139 ], [ %144, %143 ], [ %147, %146 ]
  store ptr %149, ptr @s_close, align 4
  %150 = load ptr, ptr @s_getifaddrs, align 4
  %151 = icmp ne ptr %150, null
  %152 = load ptr, ptr @s_freeifaddrs, align 4
  %153 = icmp ne ptr %152, null
  %154 = select i1 %151, i1 %153, i1 false
  br i1 %154, label %167, label %155

155:                                              ; preds = %148
  br i1 %151, label %160, label %156

156:                                              ; preds = %155
  %157 = load i16, ptr @s_clib, align 2
  %158 = tail call fastcc ptr @ez_rsl_proc(i16 noundef zeroext %157, ptr noundef nonnull @"??_C@_0M@EGFABLNJ@_getifaddrs?$AA@", ptr noundef nonnull @"??_C@_0L@BIONKJCH@getifaddrs?$AA@")
  store ptr %158, ptr @s_getifaddrs, align 4
  %159 = load ptr, ptr @s_freeifaddrs, align 4
  br label %160

160:                                              ; preds = %156, %155
  %161 = phi ptr [ %159, %156 ], [ %152, %155 ]
  %162 = icmp eq ptr %161, null
  br i1 %162, label %163, label %167

163:                                              ; preds = %160
  %164 = load i16, ptr @s_clib, align 2
  %165 = tail call fastcc ptr @ez_rsl_proc(i16 noundef zeroext %164, ptr noundef nonnull @"??_C@_0N@PBJBELFO@_freeifaddrs?$AA@", ptr noundef nonnull @"??_C@_0M@KLMKCJPH@freeifaddrs?$AA@")
  store ptr %165, ptr @s_freeifaddrs, align 4
  %166 = icmp eq ptr %165, null
  br label %167

167:                                              ; preds = %163, %160, %148
  %168 = phi i1 [ false, %160 ], [ %166, %163 ], [ false, %148 ]
  %169 = load ptr, ptr @s_socket, align 4
  %170 = load ptr, ptr @s_bind, align 4
  %171 = load ptr, ptr @s_send, align 4
  %172 = load ptr, ptr @s_recv, align 4
  %173 = insertelement <4 x ptr> poison, ptr %169, i64 0
  %174 = insertelement <4 x ptr> %173, ptr %170, i64 1
  %175 = insertelement <4 x ptr> %174, ptr %171, i64 2
  %176 = insertelement <4 x ptr> %175, ptr %172, i64 3
  %177 = freeze <4 x ptr> %176
  %178 = load ptr, ptr @s_ioctl, align 4
  %179 = freeze ptr %178
  %180 = icmp ne ptr %179, null
  %181 = load ptr, ptr @s_close, align 4
  %182 = icmp ne ptr %181, null
  %183 = icmp eq <4 x ptr> %177, zeroinitializer
  %184 = bitcast <4 x i1> %183 to i4
  %185 = icmp eq i4 %184, 0
  %186 = and i1 %185, %180
  %187 = select i1 %186, i1 %182, i1 false
  br i1 %187, label %188, label %192

188:                                              ; preds = %167
  %189 = load ptr, ptr @s_getifaddrs, align 4
  %190 = icmp eq ptr %189, null
  %191 = select i1 %190, i1 true, i1 %168
  br i1 %191, label %192, label %222

192:                                              ; preds = %124, %167, %34, %188
  %193 = load i16, ptr @s_netlib, align 2
  %194 = icmp eq i16 %193, 0
  br i1 %194, label %195, label %196

195:                                              ; preds = %192
  store i32 1, ptr @s_open_detail, align 4
  br label %478

196:                                              ; preds = %192
  %197 = load i16, ptr @s_clib, align 2
  %198 = icmp eq i16 %197, 0
  br i1 %198, label %199, label %200

199:                                              ; preds = %196
  store i32 7, ptr @s_open_detail, align 4
  br label %478

200:                                              ; preds = %196
  %201 = load ptr, ptr @s_socket, align 4
  %202 = load ptr, ptr @s_bind, align 4
  %203 = load ptr, ptr @s_send, align 4
  %204 = load ptr, ptr @s_recv, align 4
  %205 = insertelement <4 x ptr> poison, ptr %201, i64 0
  %206 = insertelement <4 x ptr> %205, ptr %202, i64 1
  %207 = insertelement <4 x ptr> %206, ptr %203, i64 2
  %208 = insertelement <4 x ptr> %207, ptr %204, i64 3
  %209 = freeze <4 x ptr> %208
  %210 = load ptr, ptr @s_ioctl, align 4
  %211 = freeze ptr %210
  %212 = icmp ne ptr %211, null
  %213 = load ptr, ptr @s_close, align 4
  %214 = icmp ne ptr %213, null
  %215 = icmp eq <4 x ptr> %209, zeroinitializer
  %216 = bitcast <4 x i1> %215 to i4
  %217 = icmp eq i4 %216, 0
  %218 = and i1 %217, %212
  %219 = select i1 %218, i1 %214, i1 false
  br i1 %219, label %221, label %220

220:                                              ; preds = %200
  store i32 2, ptr @s_open_detail, align 4
  br label %478

221:                                              ; preds = %200
  store i32 3, ptr @s_open_detail, align 4
  br label %478

222:                                              ; preds = %17, %188
  %223 = phi ptr [ %18, %17 ], [ %189, %188 ]
  call void @llvm.lifetime.start.p0(ptr nonnull %6) #12
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(256) %6, i8 0, i32 256, i1 false)
  %224 = getelementptr inbounds nuw i8, ptr %0, i32 4
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #12
  store ptr null, ptr %5, align 4
  %225 = call i32 %223(ptr noundef nonnull %5) #12
  %226 = icmp eq i32 %225, 0
  br i1 %226, label %227, label %454

227:                                              ; preds = %222
  %228 = load ptr, ptr %5, align 4
  %229 = icmp eq ptr %228, null
  br i1 %229, label %294, label %230

230:                                              ; preds = %227, %291
  %231 = phi ptr [ %292, %291 ], [ %228, %227 ]
  %232 = getelementptr inbounds nuw i8, ptr %231, i32 4
  %233 = load ptr, ptr %232, align 1
  %234 = icmp eq ptr %233, null
  br i1 %234, label %291, label %235

235:                                              ; preds = %230
  %236 = call i32 @strcmp(ptr noundef nonnull readonly dereferenceable(1) %233, ptr noundef nonnull readonly dereferenceable(1) %1) #12
  %237 = icmp eq i32 %236, 0
  br i1 %237, label %267, label %238

238:                                              ; preds = %235
  %239 = load i8, ptr %233, align 1
  %240 = icmp eq i8 %239, 0
  br i1 %240, label %262, label %241

241:                                              ; preds = %238, %257
  %242 = phi i8 [ %260, %257 ], [ %239, %238 ]
  %243 = phi ptr [ %258, %257 ], [ %233, %238 ]
  %244 = phi ptr [ %259, %257 ], [ %1, %238 ]
  %245 = load i8, ptr %244, align 1
  %246 = icmp eq i8 %245, 0
  br i1 %246, label %262, label %247

247:                                              ; preds = %241
  %248 = add i8 %242, -65
  %249 = icmp ult i8 %248, 26
  %250 = or disjoint i8 %242, 32
  %251 = select i1 %249, i8 %250, i8 %242
  %252 = add i8 %245, -65
  %253 = icmp ult i8 %252, 26
  %254 = or disjoint i8 %245, 32
  %255 = select i1 %253, i8 %254, i8 %245
  %256 = icmp eq i8 %251, %255
  br i1 %256, label %257, label %291

257:                                              ; preds = %247
  %258 = getelementptr inbounds nuw i8, ptr %243, i32 1
  %259 = getelementptr inbounds nuw i8, ptr %244, i32 1
  %260 = load i8, ptr %258, align 1
  %261 = icmp eq i8 %260, 0
  br i1 %261, label %262, label %241, !llvm.loop !7

262:                                              ; preds = %257, %241, %238
  %263 = phi ptr [ %1, %238 ], [ %244, %241 ], [ %259, %257 ]
  %264 = phi i8 [ 0, %238 ], [ %242, %241 ], [ 0, %257 ]
  %265 = load i8, ptr %263, align 1
  %266 = icmp eq i8 %264, %265
  br i1 %266, label %267, label %291

267:                                              ; preds = %262, %235
  %268 = getelementptr inbounds nuw i8, ptr %231, i32 12
  %269 = load ptr, ptr %268, align 1
  %270 = icmp eq ptr %269, null
  br i1 %270, label %291, label %271

271:                                              ; preds = %267
  %272 = getelementptr inbounds nuw i8, ptr %269, i32 1
  %273 = load i8, ptr %272, align 1
  %274 = icmp eq i8 %273, 18
  br i1 %274, label %275, label %291

275:                                              ; preds = %271
  %276 = getelementptr inbounds nuw i8, ptr %269, i32 6
  %277 = load i8, ptr %276, align 1
  %278 = icmp ult i8 %277, 6
  br i1 %278, label %291, label %279

279:                                              ; preds = %275
  %280 = load i8, ptr %269, align 1
  %281 = icmp eq i8 %280, 0
  br i1 %281, label %291, label %282

282:                                              ; preds = %279
  %283 = getelementptr inbounds nuw i8, ptr %269, i32 8
  %284 = getelementptr inbounds nuw i8, ptr %269, i32 5
  %285 = load i8, ptr %284, align 1
  %286 = zext i8 %285 to i32
  %287 = getelementptr inbounds nuw i8, ptr %283, i32 %286
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(6) %224, ptr noundef nonnull readonly align 1 dereferenceable(6) %287, i32 6, i1 false)
  %288 = load i8, ptr %269, align 1
  %289 = zext i8 %288 to i32
  call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %6, ptr nonnull readonly align 1 %269, i32 %289, i1 false)
  %290 = load ptr, ptr @s_freeifaddrs, align 4
  call void %290(ptr noundef nonnull %228) #12
  br label %455

291:                                              ; preds = %247, %279, %275, %271, %267, %262, %230
  %292 = load ptr, ptr %231, align 1
  %293 = icmp eq ptr %292, null
  br i1 %293, label %294, label %230, !llvm.loop !9

294:                                              ; preds = %291, %227
  %295 = load ptr, ptr @s_if_nametoindex, align 4
  %296 = icmp eq ptr %295, null
  br i1 %296, label %336, label %297

297:                                              ; preds = %294
  %298 = call i32 %295(ptr noundef nonnull %1) #12
  %299 = icmp eq i32 %298, 0
  %300 = load ptr, ptr %5, align 4
  %301 = icmp eq ptr %300, null
  %302 = select i1 %299, i1 true, i1 %301
  br i1 %302, label %336, label %303

303:                                              ; preds = %297, %333
  %304 = phi ptr [ %334, %333 ], [ %300, %297 ]
  %305 = getelementptr inbounds nuw i8, ptr %304, i32 12
  %306 = load ptr, ptr %305, align 1
  %307 = icmp eq ptr %306, null
  br i1 %307, label %333, label %308

308:                                              ; preds = %303
  %309 = getelementptr inbounds nuw i8, ptr %306, i32 1
  %310 = load i8, ptr %309, align 1
  %311 = icmp eq i8 %310, 18
  br i1 %311, label %312, label %333

312:                                              ; preds = %308
  %313 = getelementptr inbounds nuw i8, ptr %306, i32 2
  %314 = load i16, ptr %313, align 1
  %315 = zext i16 %314 to i32
  %316 = icmp eq i32 %298, %315
  br i1 %316, label %317, label %333

317:                                              ; preds = %312
  %318 = getelementptr inbounds nuw i8, ptr %306, i32 6
  %319 = load i8, ptr %318, align 1
  %320 = icmp ult i8 %319, 6
  br i1 %320, label %333, label %321

321:                                              ; preds = %317
  %322 = load i8, ptr %306, align 1
  %323 = icmp eq i8 %322, 0
  br i1 %323, label %333, label %324

324:                                              ; preds = %321
  %325 = getelementptr inbounds nuw i8, ptr %306, i32 8
  %326 = getelementptr inbounds nuw i8, ptr %306, i32 5
  %327 = load i8, ptr %326, align 1
  %328 = zext i8 %327 to i32
  %329 = getelementptr inbounds nuw i8, ptr %325, i32 %328
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(6) %224, ptr noundef nonnull readonly align 1 dereferenceable(6) %329, i32 6, i1 false)
  %330 = load i8, ptr %306, align 1
  %331 = zext i8 %330 to i32
  call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %6, ptr nonnull readonly align 1 %306, i32 %331, i1 false)
  %332 = load ptr, ptr @s_freeifaddrs, align 4
  call void %332(ptr noundef %300) #12
  br label %455

333:                                              ; preds = %321, %317, %312, %308, %303
  %334 = load ptr, ptr %304, align 1
  %335 = icmp eq ptr %334, null
  br i1 %335, label %336, label %303, !llvm.loop !10

336:                                              ; preds = %333, %297, %294
  %337 = phi ptr [ %228, %294 ], [ %300, %297 ], [ %300, %333 ]
  %338 = load ptr, ptr @s_freeifaddrs, align 4
  call void %338(ptr noundef %337) #12
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #12
  %339 = load ptr, ptr @s_socket, align 4
  %340 = icmp eq ptr %339, null
  %341 = load ptr, ptr @s_ioctl, align 4
  %342 = icmp eq ptr %341, null
  %343 = select i1 %340, i1 true, i1 %342
  %344 = load ptr, ptr @s_close, align 4
  %345 = icmp eq ptr %344, null
  %346 = select i1 %343, i1 true, i1 %345
  br i1 %346, label %395, label %347

347:                                              ; preds = %336
  %348 = call i32 %339(i32 noundef 2, i32 noundef 2, i32 noundef 0) #12
  %349 = icmp slt i32 %348, 0
  br i1 %349, label %395, label %350

350:                                              ; preds = %347
  %351 = getelementptr inbounds nuw i8, ptr %4, i32 15
  %352 = getelementptr inbounds nuw i8, ptr %4, i32 17
  %353 = getelementptr inbounds nuw i8, ptr %4, i32 16
  %354 = getelementptr inbounds nuw i8, ptr %4, i32 22
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(16) %353, i8 0, i32 16, i1 false)
  %355 = call ptr @strncpy(ptr noundef nonnull dereferenceable(1) %4, ptr noundef nonnull readonly dereferenceable(1) %1, i32 noundef 16) #12
  store i8 0, ptr %351, align 1
  %356 = load ptr, ptr @s_ioctl, align 4
  %357 = call i32 %356(i32 noundef %348, i32 noundef -1071617730, ptr noundef nonnull %4) #12
  %358 = icmp ne i32 %357, 0
  %359 = load i8, ptr %352, align 1
  %360 = icmp ne i8 %359, 18
  %361 = select i1 %358, i1 true, i1 %360
  %362 = load i8, ptr %354, align 1
  %363 = icmp ult i8 %362, 6
  %364 = select i1 %361, i1 true, i1 %363
  %365 = load i8, ptr %353, align 1
  %366 = icmp eq i8 %365, 0
  %367 = select i1 %364, i1 true, i1 %366
  br i1 %367, label %378, label %368

368:                                              ; preds = %378, %350
  %369 = phi i8 [ %365, %350 ], [ %389, %378 ]
  %370 = getelementptr inbounds nuw i8, ptr %4, i32 24
  %371 = getelementptr inbounds nuw i8, ptr %4, i32 21
  %372 = load i8, ptr %371, align 1
  %373 = zext i8 %372 to i32
  %374 = getelementptr inbounds nuw i8, ptr %370, i32 %373
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(6) %224, ptr noundef nonnull readonly align 1 dereferenceable(6) %374, i32 6, i1 false)
  %375 = zext i8 %369 to i32
  call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %6, ptr nonnull readonly align 1 %353, i32 %375, i1 false)
  %376 = load ptr, ptr @s_close, align 4
  %377 = call i32 %376(i32 noundef %348) #12
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #12
  br label %455

378:                                              ; preds = %350
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(16) %353, i8 0, i32 16, i1 false)
  %379 = call ptr @strncpy(ptr noundef nonnull dereferenceable(1) %4, ptr noundef nonnull readonly dereferenceable(1) %1, i32 noundef 16) #12
  store i8 0, ptr %351, align 1
  %380 = load ptr, ptr @s_ioctl, align 4
  %381 = call i32 %380(i32 noundef %348, i32 noundef -1071617759, ptr noundef nonnull %4) #12
  %382 = icmp ne i32 %381, 0
  %383 = load i8, ptr %352, align 1
  %384 = icmp ne i8 %383, 18
  %385 = select i1 %382, i1 true, i1 %384
  %386 = load i8, ptr %354, align 1
  %387 = icmp ult i8 %386, 6
  %388 = select i1 %385, i1 true, i1 %387
  %389 = load i8, ptr %353, align 1
  %390 = icmp eq i8 %389, 0
  %391 = select i1 %388, i1 true, i1 %390
  br i1 %391, label %392, label %368

392:                                              ; preds = %378
  %393 = load ptr, ptr @s_close, align 4
  %394 = call i32 %393(i32 noundef %348) #12
  br label %395

395:                                              ; preds = %392, %347, %336
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #12
  %396 = call ptr @getenv(ptr noundef nonnull @"??_C@_09CINKECGM@EZCAT_MAC?$AA@")
  %397 = icmp eq ptr %396, null
  br i1 %397, label %454, label %398

398:                                              ; preds = %395
  %399 = load i8, ptr %396, align 1
  %400 = icmp eq i8 %399, 0
  br i1 %400, label %454, label %401

401:                                              ; preds = %398, %428
  %402 = phi i32 [ %430, %428 ], [ 0, %398 ]
  %403 = phi ptr [ %429, %428 ], [ %396, %398 ]
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #12
  store ptr null, ptr %3, align 4
  br label %404

404:                                              ; preds = %407, %401
  %405 = phi ptr [ %403, %401 ], [ %408, %407 ]
  %406 = load i8, ptr %405, align 1
  switch i8 %406, label %409 [
    i8 32, label %407
    i8 9, label %407
    i8 0, label %432
  ]

407:                                              ; preds = %404, %404
  %408 = getelementptr inbounds nuw i8, ptr %405, i32 1
  br label %404, !llvm.loop !11

409:                                              ; preds = %404
  %410 = call i32 @strtoul(ptr noundef nonnull %405, ptr noundef nonnull %3, i32 noundef 16)
  %411 = load ptr, ptr %3, align 4
  %412 = icmp eq ptr %411, %405
  %413 = icmp ugt i32 %410, 255
  %414 = select i1 %412, i1 true, i1 %413
  br i1 %414, label %432, label %415

415:                                              ; preds = %409
  %416 = trunc nuw i32 %410 to i8
  %417 = getelementptr inbounds nuw i8, ptr %224, i32 %402
  store i8 %416, ptr %417, align 1
  %418 = icmp eq i32 %402, 5
  br i1 %418, label %423, label %419

419:                                              ; preds = %415
  %420 = load i8, ptr %411, align 1
  switch i8 %420, label %432 [
    i8 58, label %421
    i8 45, label %421
  ]

421:                                              ; preds = %419, %419
  %422 = getelementptr inbounds nuw i8, ptr %411, i32 1
  br label %428

423:                                              ; preds = %415, %426
  %424 = phi ptr [ %427, %426 ], [ %411, %415 ]
  %425 = load i8, ptr %424, align 1
  switch i8 %425, label %432 [
    i8 32, label %426
    i8 9, label %426
    i8 0, label %428
  ]

426:                                              ; preds = %423, %423
  %427 = getelementptr inbounds nuw i8, ptr %424, i32 1
  br label %423, !llvm.loop !12

428:                                              ; preds = %423, %421
  %429 = phi ptr [ %422, %421 ], [ %424, %423 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #12
  %430 = add nuw nsw i32 %402, 1
  %431 = icmp eq i32 %430, 6
  br i1 %431, label %433, label %401, !llvm.loop !13

432:                                              ; preds = %419, %409, %404, %423
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #12
  br label %454

433:                                              ; preds = %428
  %434 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %1) #12
  %435 = load ptr, ptr @s_if_nametoindex, align 4
  %436 = icmp eq ptr %435, null
  br i1 %436, label %441, label %437

437:                                              ; preds = %433
  %438 = call i32 %435(ptr noundef nonnull %1) #12
  %439 = call i32 @llvm.umin.i32(i32 %438, i32 65535)
  %440 = trunc nuw i32 %439 to i16
  br label %441

441:                                              ; preds = %437, %433
  %442 = phi i16 [ %440, %437 ], [ 0, %433 ]
  %443 = call i32 @llvm.umin.i32(i32 %434, i32 15)
  %444 = getelementptr inbounds nuw i8, ptr %6, i32 8
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(248) %444, i8 0, i32 248, i1 false)
  %445 = trunc nuw nsw i32 %443 to i8
  %446 = add nuw nsw i8 %445, 14
  store i8 %446, ptr %6, align 1
  %447 = getelementptr inbounds nuw i8, ptr %6, i32 1
  store i8 18, ptr %447, align 1
  %448 = getelementptr inbounds nuw i8, ptr %6, i32 2
  store i16 %442, ptr %448, align 1
  %449 = getelementptr inbounds nuw i8, ptr %6, i32 4
  store i8 6, ptr %449, align 1
  %450 = getelementptr inbounds nuw i8, ptr %6, i32 5
  store i8 %445, ptr %450, align 1
  %451 = getelementptr inbounds nuw i8, ptr %6, i32 6
  store i8 6, ptr %451, align 1
  %452 = getelementptr inbounds nuw i8, ptr %6, i32 7
  store i8 0, ptr %452, align 1
  call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %444, ptr nonnull align 1 %1, i32 %443, i1 false)
  %453 = getelementptr inbounds nuw i8, ptr %444, i32 %443
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(6) %453, ptr noundef nonnull readonly align 1 dereferenceable(6) %224, i32 6, i1 false)
  br label %455

454:                                              ; preds = %432, %398, %395, %222
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #12
  store i32 4, ptr @s_open_detail, align 4
  store i32 6, ptr @s_open_errno, align 4
  br label %473

455:                                              ; preds = %441, %368, %282, %324
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #12
  %456 = load ptr, ptr @s_socket, align 4
  %457 = call i32 %456(i32 noundef 18, i32 noundef 3, i32 noundef 34980) #12
  %458 = icmp slt i32 %457, 0
  br i1 %458, label %459, label %462

459:                                              ; preds = %455
  store i32 5, ptr @s_open_detail, align 4
  %460 = call ptr @_thread_ptr() #12
  %461 = load i32, ptr %460, align 4
  store i32 %461, ptr @s_open_errno, align 4
  br label %473

462:                                              ; preds = %455
  %463 = load ptr, ptr @s_bind, align 4
  %464 = load i8, ptr %6, align 1
  %465 = zext i8 %464 to i32
  %466 = call i32 %463(i32 noundef %457, ptr noundef nonnull %6, i32 noundef %465) #12
  %467 = icmp eq i32 %466, 0
  br i1 %467, label %474, label %468

468:                                              ; preds = %462
  store i32 6, ptr @s_open_detail, align 4
  %469 = call ptr @_thread_ptr() #12
  %470 = load i32, ptr %469, align 4
  store i32 %470, ptr @s_open_errno, align 4
  %471 = load ptr, ptr @s_close, align 4
  %472 = call i32 %471(i32 noundef %457) #12
  br label %473

473:                                              ; preds = %454, %459, %468
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #12
  br label %478

474:                                              ; preds = %462
  store i32 %457, ptr %0, align 4
  %475 = getelementptr inbounds nuw i8, ptr %0, i32 10
  %476 = call ptr @strncpy(ptr noundef nonnull dereferenceable(1) %475, ptr noundef nonnull dereferenceable(1) %1, i32 noundef 259) #12
  %477 = getelementptr inbounds nuw i8, ptr %0, i32 269
  store i8 0, ptr %477, align 1
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #12
  br label %478

478:                                              ; preds = %474, %473, %195, %220, %221, %199, %2, %10
  %479 = phi i32 [ -1, %2 ], [ -1, %195 ], [ -1, %220 ], [ -1, %10 ], [ -1, %199 ], [ -1, %221 ], [ 0, %474 ], [ -1, %473 ]
  ret i32 %479
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #3

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #4

declare dso_local ptr @_thread_ptr() local_unnamed_addr #5

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strncpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none), i32 noundef) local_unnamed_addr #6

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #3

; Function Attrs: nounwind
define dso_local void @ezcat_lowsock_close(ptr noundef captures(address_is_null) %0) local_unnamed_addr #2 {
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
  %10 = tail call i32 %6(i32 noundef %4) #12
  store i32 -1, ptr %0, align 4
  br label %11

11:                                               ; preds = %1, %9, %3
  ret void
}

; Function Attrs: nounwind
define dso_local range(i32 -1, 1) i32 @ezcat_lowsock_send(ptr noundef readonly captures(address_is_null) %0, ptr noundef %1, i32 noundef %2) local_unnamed_addr #2 {
  %4 = icmp eq ptr %0, null
  br i1 %4, label %17, label %5

5:                                                ; preds = %3
  %6 = load i32, ptr %0, align 4
  %7 = icmp slt i32 %6, 0
  %8 = icmp eq ptr %1, null
  %9 = or i1 %8, %7
  %10 = icmp slt i32 %2, 1
  %11 = or i1 %10, %9
  br i1 %11, label %17, label %12

12:                                               ; preds = %5
  %13 = load ptr, ptr @s_send, align 4
  %14 = tail call i32 %13(i32 noundef %6, ptr noundef nonnull %1, i32 noundef %2, i32 noundef 0) #12
  %15 = icmp ne i32 %14, %2
  %16 = sext i1 %15 to i32
  br label %17

17:                                               ; preds = %12, %3, %5
  %18 = phi i32 [ -1, %3 ], [ %16, %12 ], [ -1, %5 ]
  ret i32 %18
}

; Function Attrs: nounwind
define dso_local range(i32 -2, -2147483648) i32 @ezcat_lowsock_recv_ecat(ptr noundef readonly captures(address_is_null) %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #2 {
  %5 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #12
  store i32 1, ptr %5, align 4
  %6 = icmp eq ptr %0, null
  br i1 %6, label %75, label %7

7:                                                ; preds = %4
  %8 = load i32, ptr %0, align 4
  %9 = icmp slt i32 %8, 0
  %10 = icmp eq ptr %1, null
  %11 = or i1 %10, %9
  %12 = icmp slt i32 %2, 14
  %13 = or i1 %12, %11
  br i1 %13, label %75, label %14

14:                                               ; preds = %7
  %15 = load ptr, ptr @s_ioctl, align 4
  %16 = call i32 %15(i32 noundef %8, i32 noundef -2147195266, ptr noundef nonnull %5) #12
  %17 = icmp eq i32 %16, 0
  %18 = icmp eq i32 %3, 0
  br i1 %18, label %69, label %19

19:                                               ; preds = %14
  %20 = getelementptr inbounds nuw i8, ptr %1, i32 12
  %21 = getelementptr inbounds nuw i8, ptr %1, i32 13
  %22 = getelementptr inbounds nuw i8, ptr %1, i32 16
  %23 = getelementptr inbounds nuw i8, ptr %1, i32 17
  br label %24

24:                                               ; preds = %19, %38
  %25 = phi i32 [ 0, %19 ], [ %40, %38 ]
  %26 = load ptr, ptr @s_recv, align 4
  %27 = load i32, ptr %0, align 4
  %28 = call i32 %26(i32 noundef %27, ptr noundef %1, i32 noundef %2, i32 noundef 0) #12
  %29 = icmp slt i32 %28, 0
  br i1 %29, label %30, label %43

30:                                               ; preds = %24
  %31 = call ptr @_thread_ptr() #12
  %32 = load i32, ptr %31, align 4
  %33 = icmp eq i32 %32, 95
  br i1 %33, label %38, label %34

34:                                               ; preds = %30
  %35 = call ptr @_thread_ptr() #12
  %36 = load i32, ptr %35, align 4
  %37 = icmp eq i32 %36, 11
  br i1 %37, label %38, label %42

38:                                               ; preds = %30, %34, %43, %53, %60
  %39 = call zeroext i8 @RtSleep(i32 noundef 1) #12
  %40 = add nuw i32 %25, 1
  %41 = icmp eq i32 %40, %3
  br i1 %41, label %69, label %24, !llvm.loop !14

42:                                               ; preds = %34
  br i1 %17, label %70, label %75

43:                                               ; preds = %24
  %44 = icmp samesign ugt i32 %28, 13
  br i1 %44, label %45, label %38

45:                                               ; preds = %43
  %46 = load i8, ptr %20, align 1
  %47 = zext i8 %46 to i16
  %48 = shl nuw i16 %47, 8
  %49 = load i8, ptr %21, align 1
  %50 = zext i8 %49 to i16
  %51 = or disjoint i16 %48, %50
  %52 = icmp eq i16 %51, -30556
  br i1 %52, label %68, label %53

53:                                               ; preds = %45
  %54 = icmp eq i16 %51, -30552
  %55 = and i16 %51, -4097
  %56 = icmp eq i16 %55, -32512
  %57 = or i1 %54, %56
  %58 = icmp samesign ugt i32 %28, 17
  %59 = select i1 %57, i1 %58, i1 false
  br i1 %59, label %60, label %38

60:                                               ; preds = %53
  %61 = load i8, ptr %22, align 1
  %62 = zext i8 %61 to i16
  %63 = shl nuw i16 %62, 8
  %64 = load i8, ptr %23, align 1
  %65 = zext i8 %64 to i16
  %66 = or disjoint i16 %63, %65
  %67 = icmp eq i16 %66, -30556
  br i1 %67, label %68, label %38

68:                                               ; preds = %60, %45
  br i1 %17, label %70, label %75

69:                                               ; preds = %38, %14
  br i1 %17, label %70, label %75

70:                                               ; preds = %69, %68, %42
  %71 = phi i32 [ %28, %68 ], [ -1, %42 ], [ -2, %69 ]
  store i32 0, ptr %5, align 4
  %72 = load ptr, ptr @s_ioctl, align 4
  %73 = load i32, ptr %0, align 4
  %74 = call i32 %72(i32 noundef %73, i32 noundef -2147195266, ptr noundef nonnull %5) #12
  br label %75

75:                                               ; preds = %70, %69, %68, %42, %4, %7
  %76 = phi i32 [ %28, %68 ], [ -1, %4 ], [ -1, %42 ], [ -1, %7 ], [ -2, %69 ], [ %71, %70 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #12
  ret i32 %76
}

declare dso_local zeroext i8 @RtSleep(i32 noundef) local_unnamed_addr #5

; Function Attrs: nounwind
define dso_local range(i32 -2, -2147483648) i32 @ezcat_lowsock_txrx(ptr noundef readonly captures(address_is_null) %0, ptr noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) local_unnamed_addr #2 {
  %6 = icmp eq ptr %0, null
  br i1 %6, label %22, label %7

7:                                                ; preds = %5
  %8 = load i32, ptr %0, align 4
  %9 = icmp slt i32 %8, 0
  %10 = icmp eq ptr %1, null
  %11 = or i1 %10, %9
  %12 = icmp slt i32 %2, 1
  %13 = or i1 %12, %11
  %14 = icmp slt i32 %3, %2
  %15 = or i1 %14, %13
  br i1 %15, label %22, label %16

16:                                               ; preds = %7
  %17 = load ptr, ptr @s_send, align 4
  %18 = tail call i32 %17(i32 noundef %8, ptr noundef nonnull %1, i32 noundef %2, i32 noundef 0) #12
  %19 = icmp eq i32 %18, %2
  br i1 %19, label %20, label %22

20:                                               ; preds = %16
  %21 = tail call i32 @ezcat_lowsock_recv_ecat(ptr noundef nonnull %0, ptr noundef nonnull %1, i32 noundef %3, i32 noundef %4)
  br label %22

22:                                               ; preds = %16, %5, %7, %20
  %23 = phi i32 [ %21, %20 ], [ -1, %5 ], [ -1, %7 ], [ -1, %16 ]
  ret i32 %23
}

; Function Attrs: nounwind
define internal fastcc ptr @ez_rsl_proc(i16 noundef zeroext %0, ptr noundef %1, ptr noundef %2) unnamed_addr #2 {
  %4 = icmp eq i16 %0, 0
  br i1 %4, label %16, label %5

5:                                                ; preds = %3
  %6 = icmp eq ptr %1, null
  br i1 %6, label %10, label %7

7:                                                ; preds = %5
  %8 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %0, ptr noundef nonnull %1) #12
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %16

10:                                               ; preds = %7, %5
  %11 = icmp eq ptr %2, null
  br i1 %11, label %15, label %12

12:                                               ; preds = %10
  %13 = tail call ptr @GetRtProcAddress(i16 noundef zeroext %0, ptr noundef nonnull %2) #12
  %14 = icmp eq ptr %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %12, %10
  br label %16

16:                                               ; preds = %12, %7, %3, %15
  %17 = phi ptr [ null, %15 ], [ null, %3 ], [ %8, %7 ], [ %13, %12 ]
  ret ptr %17
}

; Function Attrs: nofree nounwind memory(read)
declare dso_local noundef ptr @getenv(ptr noundef captures(none)) local_unnamed_addr #7

; Function Attrs: nounwind
define internal fastcc range(i32 -1, 1) i32 @ez_load_rsl_under_intime(ptr noundef writeonly captures(address_is_null) %0, ptr noundef readonly captures(address_is_null) %1) unnamed_addr #2 {
  %3 = alloca [280 x i8], align 1
  %4 = alloca [300 x i8], align 1
  %5 = alloca [320 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #12
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #12
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #12
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
  br label %17, !llvm.loop !15

23:                                               ; preds = %17
  %24 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %19) #12
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
  br i1 %33, label %46, label %26, !llvm.loop !16

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
  %53 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %3) #12
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
  br i1 %63, label %64, label %55, !llvm.loop !17

64:                                               ; preds = %55, %60, %52
  %65 = call i32 @strlen(ptr noundef nonnull readonly dereferenceable(1) %3) #12
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
  %75 = call i32 @strlen(ptr noundef nonnull readonly dereferenceable(1) %74) #12
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
  %87 = call i32 @strlen(ptr noundef nonnull readonly dereferenceable(1) %4) #12
  %88 = call i32 @strlen(ptr noundef nonnull readonly dereferenceable(1) %1) #12
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
  %108 = call zeroext i16 @LoadRtLibrary(ptr noundef nonnull %5) #12
  %109 = icmp eq i16 %108, 0
  br i1 %109, label %110, label %187

110:                                              ; preds = %107, %101, %86, %83, %71
  %111 = add nuw nsw i32 %72, 1
  %112 = icmp eq i32 %111, 4
  br i1 %112, label %113, label %71, !llvm.loop !18

113:                                              ; preds = %110, %36, %46, %8, %14
  %114 = add nuw nsw i32 %9, 1
  %115 = icmp eq i32 %114, 3
  br i1 %115, label %116, label %8, !llvm.loop !19

116:                                              ; preds = %113, %184
  %117 = phi ptr [ %186, %184 ], [ @"??_C@_0BO@NHKEAEGN@C?3?2Program?5Files?5?$CIx86?$CJ?2INtime?$AA@", %113 ]
  %118 = phi i1 [ true, %184 ], [ false, %113 ]
  %119 = phi i32 [ 2, %184 ], [ 1, %113 ]
  %120 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %117) #12
  %121 = icmp ugt i32 %120, 279
  br i1 %121, label %184, label %122

122:                                              ; preds = %116
  %123 = add nuw nsw i32 %120, 1
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(1) %3, ptr noundef nonnull align 1 dereferenceable(1) %117, i32 %123, i1 false)
  %124 = call i32 @strlen(ptr noundef nonnull dereferenceable(1) %3) #12
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
  br i1 %134, label %135, label %126, !llvm.loop !17

135:                                              ; preds = %126, %131, %122
  %136 = call i32 @strlen(ptr noundef nonnull readonly dereferenceable(1) %3) #12
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
  %146 = call i32 @strlen(ptr noundef nonnull readonly dereferenceable(1) %145) #12
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
  %158 = call i32 @strlen(ptr noundef nonnull readonly dereferenceable(1) %4) #12
  %159 = call i32 @strlen(ptr noundef nonnull readonly dereferenceable(1) %1) #12
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
  %179 = call zeroext i16 @LoadRtLibrary(ptr noundef nonnull %5) #12
  %180 = icmp eq i16 %179, 0
  br i1 %180, label %181, label %187

181:                                              ; preds = %178, %172, %157, %154, %142
  %182 = add nuw nsw i32 %143, 1
  %183 = icmp eq i32 %182, 4
  br i1 %183, label %184, label %142, !llvm.loop !20

184:                                              ; preds = %181, %116
  %185 = getelementptr inbounds nuw ptr, ptr @ez_load_rsl_under_intime.roots_fallback, i32 %119
  %186 = load ptr, ptr %185, align 4
  br i1 %118, label %189, label %116, !llvm.loop !21

187:                                              ; preds = %107, %178
  %188 = phi i16 [ %179, %178 ], [ %108, %107 ]
  store i16 %188, ptr %0, align 2
  br label %189

189:                                              ; preds = %184, %187
  %190 = phi i32 [ 0, %187 ], [ -1, %184 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #12
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #12
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #12
  ret i32 %190
}

declare dso_local zeroext i16 @LoadRtLibrary(ptr noundef) local_unnamed_addr #5

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strlen(ptr noundef captures(none)) local_unnamed_addr #8

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #9

declare dso_local ptr @GetRtProcAddress(i16 noundef zeroext, ptr noundef) local_unnamed_addr #5

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strcmp(ptr noundef captures(none), ptr noundef captures(none)) local_unnamed_addr #8

; Function Attrs: mustprogress nocallback nofree nounwind willreturn
declare dso_local i32 @strtoul(ptr noundef readonly, ptr noundef captures(none), i32 noundef) local_unnamed_addr #10

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #11

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree nounwind memory(read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #10 = { mustprogress nocallback nofree nounwind willreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #12 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "ezcat_lowsock_intime.c", directory: "D:\\work\\rtacc\\examples2\\ezcat")
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
!20 = distinct !{!20, !8}
!21 = distinct !{!21, !8}
