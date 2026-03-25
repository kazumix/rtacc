; ModuleID = 'main.e3660c07faadc8b7-cgu.0'
source_filename = "main.e3660c07faadc8b7-cgu.0"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i686-pc-windows-msvc"

%"core::option::Option<intime::RtHandle>" = type { i16, [1 x i16] }

@alloc_3486fa9b496d4a3254c3f827bc865bba = private unnamed_addr constant [80 x i8] c"rust_rt_mailbox: seq=%d value=%d sum_seen=%d done_bits=%d (expect sum_seen=%d)\0A\00", align 1
@str.1 = private unnamed_addr constant [23 x i8] c"CreateRtMailbox failed\00", align 1
@str.2 = private unnamed_addr constant [25 x i8] c"CreateRtThread(A) failed\00", align 1
@str.3 = private unnamed_addr constant [25 x i8] c"CreateRtThread(B) failed\00", align 1
@str.4 = private unnamed_addr constant [26 x i8] c"SendRtHandle(kick) failed\00", align 1
@str.5 = private unnamed_addr constant [28 x i8] c"CreateRtMemoryHandle failed\00", align 1
@str.6 = private unnamed_addr constant [24 x i8] c"AllocateRtMemory failed\00", align 1

; __rustc::rust_begin_unwind
; Function Attrs: nofree norecurse noreturn nosync nounwind memory(none) uwtable
define void @_RNvCs5QKde7ScR4H_7___rustc17rust_begin_unwind(ptr noalias noundef readonly align 4 captures(none) dereferenceable(12) %_1) unnamed_addr #0 {
start:
  br label %bb1

bb1:                                              ; preds = %bb1, %start
  br label %bb1
}

; main::run_mailbox_thread
; Function Attrs: nounwind uwtable
define internal fastcc void @_ZN4main18run_mailbox_thread17h27ae20d6c3d1706dE(i1 noundef zeroext %role, ptr noundef readonly captures(address_is_null) %lp_param) unnamed_addr #1 {
start:
  %0 = icmp eq ptr %lp_param, null
  br i1 %0, label %bb18, label %bb20

bb20:                                             ; preds = %start
  %_30 = load ptr, ptr %lp_param, align 4, !nonnull !2, !noundef !2
  br i1 %role, label %bb2, label %bb3

bb18:                                             ; preds = %bb15, %bb22, %bb2, %bb24, %bb3, %start
  ret void

bb2:                                              ; preds = %bb20
  %1 = getelementptr inbounds nuw i8, ptr %lp_param, i32 6
  %_10 = load i16, ptr %1, align 2, !noundef !2
  %_31 = icmp eq i16 %_10, -1
  br i1 %_31, label %bb18, label %bb22

bb3:                                              ; preds = %bb20
  %2 = getelementptr inbounds nuw i8, ptr %lp_param, i32 4
  %_7 = load i16, ptr %2, align 4, !noundef !2
  %_33 = icmp eq i16 %_7, -1
  br i1 %_33, label %bb18, label %bb24

bb24:                                             ; preds = %bb3
  %3 = getelementptr inbounds nuw i8, ptr %lp_param, i32 6
  %4 = load i16, ptr %3, align 2, !noundef !2
  %5 = icmp eq i16 %4, -1
  br i1 %5, label %bb18, label %bb42

bb42:                                             ; preds = %bb22, %bb24
  %send_mbx.sroa.8.0 = phi i16 [ %4, %bb24 ], [ %7, %bb22 ]
  %recv_mbx.sroa.4.0 = phi i16 [ %_7, %bb24 ], [ %_10, %bb22 ]
  %_51 = getelementptr inbounds nuw i8, ptr %_30, i32 4
  %_53 = getelementptr inbounds nuw i8, ptr %_30, i32 8
  %h.i = tail call noundef zeroext i16 @ReceiveRtHandle(i16 noundef zeroext range(i16 0, -1) %recv_mbx.sroa.4.0, i32 noundef -1, ptr noundef null) #7
  %_4.i.not = icmp eq i16 %h.i, -1
  br i1 %_4.i.not, label %bb15, label %bb6

bb22:                                             ; preds = %bb2
  %6 = getelementptr inbounds nuw i8, ptr %lp_param, i32 4
  %7 = load i16, ptr %6, align 4, !noundef !2
  %8 = icmp eq i16 %7, -1
  br i1 %8, label %bb18, label %bb42

bb15:                                             ; preds = %bb6.4, %bb13.4, %bb4.backedge.3, %bb4.backedge.2, %bb4.backedge.1, %bb4.backedge, %bb42
  %. = select i1 %role, i32 2, i32 1
  %_55 = getelementptr inbounds nuw i8, ptr %_30, i32 12
  %9 = atomicrmw or ptr %_55, i32 %. seq_cst, align 4
  br label %bb18

bb6:                                              ; preds = %bb42
  %_2.i = tail call noundef zeroext i16 @GetRtHandleType(i16 noundef zeroext %h.i) #7
  %_0.i = icmp eq i16 %_2.i, 6
  br i1 %_0.i, label %bb9, label %bb4.backedge

bb9:                                              ; preds = %bb6
  br i1 %role, label %bb11, label %bb12

bb11:                                             ; preds = %bb9
  %10 = load atomic i32, ptr %_51 seq_cst, align 4
  %11 = atomicrmw add ptr %_53, i32 %10 seq_cst, align 4
  br label %bb13

bb12:                                             ; preds = %bb9
  %12 = atomicrmw add ptr %_30, i32 1 seq_cst, align 4
  %13 = mul i32 %12, 10
  %_20 = add i32 %13, 10
  store atomic i32 %_20, ptr %_51 seq_cst, align 4
  br label %bb13

bb13:                                             ; preds = %bb11, %bb12
  %_4.i17 = tail call noundef zeroext i8 @SendRtHandle(i16 noundef zeroext %send_mbx.sroa.8.0, i16 noundef zeroext %h.i, i16 noundef zeroext 0) #7
  br label %bb4.backedge

bb4.backedge:                                     ; preds = %bb13, %bb6
  %h.i.1 = tail call noundef zeroext i16 @ReceiveRtHandle(i16 noundef zeroext range(i16 0, -1) %recv_mbx.sroa.4.0, i32 noundef -1, ptr noundef null) #7
  %_4.i.not.1 = icmp eq i16 %h.i.1, -1
  br i1 %_4.i.not.1, label %bb15, label %bb6.1

bb6.1:                                            ; preds = %bb4.backedge
  %_2.i.1 = tail call noundef zeroext i16 @GetRtHandleType(i16 noundef zeroext %h.i.1) #7
  %_0.i.1 = icmp eq i16 %_2.i.1, 6
  br i1 %_0.i.1, label %bb9.1, label %bb4.backedge.1

bb9.1:                                            ; preds = %bb6.1
  br i1 %role, label %bb11.1, label %bb12.1

bb12.1:                                           ; preds = %bb9.1
  %14 = atomicrmw add ptr %_30, i32 1 seq_cst, align 4
  %15 = mul i32 %14, 10
  %_20.1 = add i32 %15, 10
  store atomic i32 %_20.1, ptr %_51 seq_cst, align 4
  br label %bb13.1

bb11.1:                                           ; preds = %bb9.1
  %16 = load atomic i32, ptr %_51 seq_cst, align 4
  %17 = atomicrmw add ptr %_53, i32 %16 seq_cst, align 4
  br label %bb13.1

bb13.1:                                           ; preds = %bb11.1, %bb12.1
  %_4.i17.1 = tail call noundef zeroext i8 @SendRtHandle(i16 noundef zeroext %send_mbx.sroa.8.0, i16 noundef zeroext %h.i.1, i16 noundef zeroext 0) #7
  br label %bb4.backedge.1

bb4.backedge.1:                                   ; preds = %bb13.1, %bb6.1
  %h.i.2 = tail call noundef zeroext i16 @ReceiveRtHandle(i16 noundef zeroext range(i16 0, -1) %recv_mbx.sroa.4.0, i32 noundef -1, ptr noundef null) #7
  %_4.i.not.2 = icmp eq i16 %h.i.2, -1
  br i1 %_4.i.not.2, label %bb15, label %bb6.2

bb6.2:                                            ; preds = %bb4.backedge.1
  %_2.i.2 = tail call noundef zeroext i16 @GetRtHandleType(i16 noundef zeroext %h.i.2) #7
  %_0.i.2 = icmp eq i16 %_2.i.2, 6
  br i1 %_0.i.2, label %bb9.2, label %bb4.backedge.2

bb9.2:                                            ; preds = %bb6.2
  br i1 %role, label %bb11.2, label %bb12.2

bb12.2:                                           ; preds = %bb9.2
  %18 = atomicrmw add ptr %_30, i32 1 seq_cst, align 4
  %19 = mul i32 %18, 10
  %_20.2 = add i32 %19, 10
  store atomic i32 %_20.2, ptr %_51 seq_cst, align 4
  br label %bb13.2

bb11.2:                                           ; preds = %bb9.2
  %20 = load atomic i32, ptr %_51 seq_cst, align 4
  %21 = atomicrmw add ptr %_53, i32 %20 seq_cst, align 4
  br label %bb13.2

bb13.2:                                           ; preds = %bb11.2, %bb12.2
  %_4.i17.2 = tail call noundef zeroext i8 @SendRtHandle(i16 noundef zeroext %send_mbx.sroa.8.0, i16 noundef zeroext %h.i.2, i16 noundef zeroext 0) #7
  br label %bb4.backedge.2

bb4.backedge.2:                                   ; preds = %bb13.2, %bb6.2
  %h.i.3 = tail call noundef zeroext i16 @ReceiveRtHandle(i16 noundef zeroext range(i16 0, -1) %recv_mbx.sroa.4.0, i32 noundef -1, ptr noundef null) #7
  %_4.i.not.3 = icmp eq i16 %h.i.3, -1
  br i1 %_4.i.not.3, label %bb15, label %bb6.3

bb6.3:                                            ; preds = %bb4.backedge.2
  %_2.i.3 = tail call noundef zeroext i16 @GetRtHandleType(i16 noundef zeroext %h.i.3) #7
  %_0.i.3 = icmp eq i16 %_2.i.3, 6
  br i1 %_0.i.3, label %bb9.3, label %bb4.backedge.3

bb9.3:                                            ; preds = %bb6.3
  br i1 %role, label %bb11.3, label %bb12.3

bb12.3:                                           ; preds = %bb9.3
  %22 = atomicrmw add ptr %_30, i32 1 seq_cst, align 4
  %23 = mul i32 %22, 10
  %_20.3 = add i32 %23, 10
  store atomic i32 %_20.3, ptr %_51 seq_cst, align 4
  br label %bb13.3

bb11.3:                                           ; preds = %bb9.3
  %24 = load atomic i32, ptr %_51 seq_cst, align 4
  %25 = atomicrmw add ptr %_53, i32 %24 seq_cst, align 4
  br label %bb13.3

bb13.3:                                           ; preds = %bb11.3, %bb12.3
  %_4.i17.3 = tail call noundef zeroext i8 @SendRtHandle(i16 noundef zeroext %send_mbx.sroa.8.0, i16 noundef zeroext %h.i.3, i16 noundef zeroext 0) #7
  br label %bb4.backedge.3

bb4.backedge.3:                                   ; preds = %bb13.3, %bb6.3
  %h.i.4 = tail call noundef zeroext i16 @ReceiveRtHandle(i16 noundef zeroext range(i16 0, -1) %recv_mbx.sroa.4.0, i32 noundef -1, ptr noundef null) #7
  %_4.i.not.4 = icmp eq i16 %h.i.4, -1
  br i1 %_4.i.not.4, label %bb15, label %bb6.4

bb6.4:                                            ; preds = %bb4.backedge.3
  %_2.i.4 = tail call noundef zeroext i16 @GetRtHandleType(i16 noundef zeroext %h.i.4) #7
  %_0.i.4 = icmp eq i16 %_2.i.4, 6
  br i1 %_0.i.4, label %bb9.4, label %bb15

bb9.4:                                            ; preds = %bb6.4
  br i1 %role, label %bb11.4, label %bb12.4

bb12.4:                                           ; preds = %bb9.4
  %26 = atomicrmw add ptr %_30, i32 1 seq_cst, align 4
  %27 = mul i32 %26, 10
  %_20.4 = add i32 %27, 10
  store atomic i32 %_20.4, ptr %_51 seq_cst, align 4
  br label %bb13.4

bb11.4:                                           ; preds = %bb9.4
  %28 = load atomic i32, ptr %_51 seq_cst, align 4
  %29 = atomicrmw add ptr %_53, i32 %28 seq_cst, align 4
  br label %bb13.4

bb13.4:                                           ; preds = %bb11.4, %bb12.4
  %_4.i17.4 = tail call noundef zeroext i8 @SendRtHandle(i16 noundef zeroext %send_mbx.sroa.8.0, i16 noundef zeroext %h.i.4, i16 noundef zeroext 0) #7
  br label %bb15
}

; <main::intime::RtBuffer as core::ops::drop::Drop>::drop
; Function Attrs: nounwind uwtable
define void @"_ZN64_$LT$main..intime..RtBuffer$u20$as$u20$core..ops..drop..Drop$GT$4drop17h909f5cc35e68ca85E"(ptr noalias noundef align 4 captures(none) dereferenceable(76) %self) unnamed_addr #1 {
start:
  %0 = getelementptr inbounds nuw i8, ptr %self, i32 72
  %_32 = load i32, ptr %0, align 4, !noundef !2
  %_2.not3 = icmp eq i32 %_32, 0
  br i1 %_2.not3, label %bb7, label %bb2

bb7:                                              ; preds = %bb6, %start
  %1 = getelementptr inbounds nuw i8, ptr %self, i32 64
  %_14 = load ptr, ptr %1, align 4, !nonnull !2, !noundef !2
  %_12 = tail call noundef i32 @FreeRtMemory(ptr noundef nonnull %_14) #7
  ret void

bb2:                                              ; preds = %start, %bb6
  %_34 = phi i32 [ %_3, %bb6 ], [ %_32, %start ]
  %2 = add i32 %_34, -1
  store i32 %2, ptr %0, align 4
  %_15 = icmp ult i32 %_34, 17
  br i1 %_15, label %bb9, label %bb6

bb9:                                              ; preds = %bb2
  %_16 = getelementptr inbounds nuw %"core::option::Option<intime::RtHandle>", ptr %self, i32 %2
  %3 = load i16, ptr %_16, align 4, !range !3, !noundef !2
  %4 = getelementptr inbounds nuw i8, ptr %_16, i32 2
  %5 = load i16, ptr %4, align 2
  store i16 0, ptr %_16, align 4
  %6 = trunc nuw i16 %3 to i1
  br i1 %6, label %bb3, label %bb6thread-pre-split

bb6thread-pre-split:                              ; preds = %bb3, %bb9
  %_3.pr = load i32, ptr %0, align 4
  br label %bb6

bb6:                                              ; preds = %bb6thread-pre-split, %bb2
  %_3 = phi i32 [ %_3.pr, %bb6thread-pre-split ], [ %2, %bb2 ]
  %_2.not = icmp eq i32 %_3, 0
  br i1 %_2.not, label %bb7, label %bb2

bb3:                                              ; preds = %bb9
  %_11 = tail call noundef zeroext i8 @DeleteRtMemoryHandle(i16 noundef zeroext %5) #7
  br label %bb6thread-pre-split
}

; <main::intime::RtMailbox as core::ops::drop::Drop>::drop
; Function Attrs: nounwind uwtable
define void @"_ZN65_$LT$main..intime..RtMailbox$u20$as$u20$core..ops..drop..Drop$GT$4drop17hec2df81bbdf27664E"(ptr noalias noundef readonly align 2 captures(none) dereferenceable(2) %self) unnamed_addr #1 {
start:
  %_3 = load i16, ptr %self, align 2, !noundef !2
  %_2 = tail call noundef zeroext i8 @DeleteRtMailbox(i16 noundef zeroext %_3) #7
  ret void
}

; <main::intime::RtMappedSharedView as core::ops::drop::Drop>::drop
; Function Attrs: nounwind uwtable
define void @"_ZN74_$LT$main..intime..RtMappedSharedView$u20$as$u20$core..ops..drop..Drop$GT$4drop17h2d26ee5493617c26E"(ptr noalias noundef readonly align 4 captures(none) dereferenceable(4) %self) unnamed_addr #1 {
start:
  %_4 = load ptr, ptr %self, align 4, !nonnull !2, !noundef !2
  %_2 = tail call noundef i32 @FreeRtMemory(ptr noundef nonnull %_4) #7
  ret void
}

; Function Attrs: nounwind uwtable
define noundef range(i32 0, 2) i32 @main(i32 noundef %_argc, ptr noundef readnone captures(none) %_argv) unnamed_addr #1 {
start:
  %ctx.i = alloca [8 x i8], align 4
  %buf.i = alloca [76 x i8], align 4
  %p.i.i.i = tail call noundef ptr @AllocateRtMemory(i32 noundef 4096) #7, !noalias !4
  %0 = icmp eq ptr %p.i.i.i, null
  br i1 %0, label %bb43.i, label %bb2.i.i

bb2.i.i:                                          ; preds = %start
  tail call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(4096) %p.i.i.i, i8 0, i32 4096, i1 false), !noalias !9
  call void @llvm.lifetime.start.p0(i64 76, ptr nonnull %buf.i)
  store i16 0, ptr %buf.i, align 4
  %_4.sroa.628.0.buf.sroa_idx.i = getelementptr inbounds nuw i8, ptr %buf.i, i32 4
  store i16 0, ptr %_4.sroa.628.0.buf.sroa_idx.i, align 4
  %_4.sroa.729.0.buf.sroa_idx.i = getelementptr inbounds nuw i8, ptr %buf.i, i32 8
  store i16 0, ptr %_4.sroa.729.0.buf.sroa_idx.i, align 4
  %_4.sroa.830.0.buf.sroa_idx.i = getelementptr inbounds nuw i8, ptr %buf.i, i32 12
  store i16 0, ptr %_4.sroa.830.0.buf.sroa_idx.i, align 4
  %_4.sroa.931.0.buf.sroa_idx.i = getelementptr inbounds nuw i8, ptr %buf.i, i32 16
  store i16 0, ptr %_4.sroa.931.0.buf.sroa_idx.i, align 4
  %_4.sroa.1032.0.buf.sroa_idx.i = getelementptr inbounds nuw i8, ptr %buf.i, i32 20
  store i16 0, ptr %_4.sroa.1032.0.buf.sroa_idx.i, align 4
  %_4.sroa.1133.0.buf.sroa_idx.i = getelementptr inbounds nuw i8, ptr %buf.i, i32 24
  store i16 0, ptr %_4.sroa.1133.0.buf.sroa_idx.i, align 4
  %_4.sroa.1234.0.buf.sroa_idx.i = getelementptr inbounds nuw i8, ptr %buf.i, i32 28
  store i16 0, ptr %_4.sroa.1234.0.buf.sroa_idx.i, align 4
  %_4.sroa.1335.0.buf.sroa_idx.i = getelementptr inbounds nuw i8, ptr %buf.i, i32 32
  store i16 0, ptr %_4.sroa.1335.0.buf.sroa_idx.i, align 4
  %_4.sroa.1436.0.buf.sroa_idx.i = getelementptr inbounds nuw i8, ptr %buf.i, i32 36
  store i16 0, ptr %_4.sroa.1436.0.buf.sroa_idx.i, align 4
  %_4.sroa.1537.0.buf.sroa_idx.i = getelementptr inbounds nuw i8, ptr %buf.i, i32 40
  store i16 0, ptr %_4.sroa.1537.0.buf.sroa_idx.i, align 4
  %_4.sroa.1638.0.buf.sroa_idx.i = getelementptr inbounds nuw i8, ptr %buf.i, i32 44
  store i16 0, ptr %_4.sroa.1638.0.buf.sroa_idx.i, align 4
  %_4.sroa.1739.0.buf.sroa_idx.i = getelementptr inbounds nuw i8, ptr %buf.i, i32 48
  store i16 0, ptr %_4.sroa.1739.0.buf.sroa_idx.i, align 4
  %_4.sroa.1840.0.buf.sroa_idx.i = getelementptr inbounds nuw i8, ptr %buf.i, i32 52
  store i16 0, ptr %_4.sroa.1840.0.buf.sroa_idx.i, align 4
  %_4.sroa.1941.0.buf.sroa_idx.i = getelementptr inbounds nuw i8, ptr %buf.i, i32 56
  store i16 0, ptr %_4.sroa.1941.0.buf.sroa_idx.i, align 4
  %_4.sroa.2042.0.buf.sroa_idx.i = getelementptr inbounds nuw i8, ptr %buf.i, i32 60
  store i16 0, ptr %_4.sroa.2042.0.buf.sroa_idx.i, align 4
  %_4.sroa.2143.0.buf.sroa_idx.i = getelementptr inbounds nuw i8, ptr %buf.i, i32 64
  store ptr %p.i.i.i, ptr %_4.sroa.2143.0.buf.sroa_idx.i, align 4
  %_4.sroa.22.0.buf.sroa_idx.i = getelementptr inbounds nuw i8, ptr %buf.i, i32 68
  store i64 4294971392, ptr %_4.sroa.22.0.buf.sroa_idx.i, align 4
  tail call void @llvm.experimental.noalias.scope.decl(metadata !10)
  %1 = getelementptr inbounds nuw i8, ptr %buf.i, i32 72
  %raw.i.i = tail call noundef zeroext i16 @CreateRtMemoryHandle(ptr noundef nonnull %p.i.i.i, i32 noundef 4096) #7, !noalias !10
  %_16.i.i = icmp eq i16 %raw.i.i, -1
  br i1 %_16.i.i, label %bb40.i, label %bb7.i

bb43.i:                                           ; preds = %start
  %puts57.i = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.6)
  br label %_ZN4main3run17hae284cc88ca322e5E.exit

bb7.i:                                            ; preds = %bb2.i.i
  store i16 1, ptr %buf.i, align 4, !alias.scope !10
  %2 = getelementptr inbounds nuw i8, ptr %buf.i, i32 2
  store i16 %raw.i.i, ptr %2, align 2, !alias.scope !10
  %raw.i8.i = tail call noundef zeroext i16 @CreateRtMailbox(i16 noundef zeroext 0) #7
  %_7.i.not.i = icmp eq i16 %raw.i8.i, -1
  br i1 %_7.i.not.i, label %bb44.i, label %bb11.i

bb11.i:                                           ; preds = %bb7.i
  %raw.i9.i = tail call noundef zeroext i16 @CreateRtMailbox(i16 noundef zeroext 0) #7
  %_7.i10.not.i = icmp eq i16 %raw.i9.i, -1
  br i1 %_7.i10.not.i, label %bb45.i, label %bb14.i

bb44.i:                                           ; preds = %bb7.i
  %puts.i = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  br label %bb2.i.i.i.preheader

bb2.i.i.i.preheader:                              ; preds = %bb38.i, %bb44.i
  br label %bb2.i.i.i

bb14.i:                                           ; preds = %bb11.i
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %ctx.i)
  store ptr %p.i.i.i, ptr %ctx.i, align 4
  %3 = getelementptr inbounds nuw i8, ptr %ctx.i, i32 4
  store i16 %raw.i8.i, ptr %3, align 4
  %4 = getelementptr inbounds nuw i8, ptr %ctx.i, i32 6
  store i16 %raw.i9.i, ptr %4, align 2
  %h.i.i = call noundef zeroext i16 @CreateRtThread(i8 noundef zeroext 0, ptr noundef nonnull @rust_thread_a_entry, i32 noundef 4096, ptr noundef nonnull %ctx.i) #7
  %_7.i13.not.i = icmp eq i16 %h.i.i, -1
  br i1 %_7.i13.not.i, label %bb36.i, label %bb16.i

bb45.i:                                           ; preds = %bb11.i
  %puts52.i = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  br label %bb38.i

bb16.i:                                           ; preds = %bb14.i
  %h.i16.i = call noundef zeroext i16 @CreateRtThread(i8 noundef zeroext 0, ptr noundef nonnull @rust_thread_b_entry, i32 noundef 4096, ptr noundef nonnull %ctx.i) #7
  %_7.i17.not.i = icmp eq i16 %h.i16.i, -1
  br i1 %_7.i17.not.i, label %bb36.i, label %bb20.i

bb36.i:                                           ; preds = %bb20.i, %bb16.i, %bb14.i
  %str.4.sink.i = phi ptr [ @str.3, %bb16.i ], [ @str.4, %bb20.i ], [ @str.2, %bb14.i ]
  %puts55.i = call i32 @puts(ptr nonnull dereferenceable(1) %str.4.sink.i)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %ctx.i)
  %_2.i.i.i = call noundef zeroext i8 @DeleteRtMailbox(i16 noundef zeroext %raw.i9.i) #7, !noalias !13
  br label %bb38.i

bb20.i:                                           ; preds = %bb16.i
  %_4.i.i = call noundef zeroext i8 @SendRtHandle(i16 noundef zeroext %raw.i8.i, i16 noundef zeroext %raw.i.i, i16 noundef zeroext 0) #7
  %_0.i.not.i = icmp eq i8 %_4.i.i, 0
  br i1 %_0.i.not.i, label %bb36.i, label %bb46.i

bb38.i:                                           ; preds = %bb36.i, %bb45.i
  %_2.i.i21.i = call noundef zeroext i8 @DeleteRtMailbox(i16 noundef zeroext %raw.i8.i) #7, !noalias !18
  br label %bb2.i.i.i.preheader

bb46.i:                                           ; preds = %bb20.i, %bb29.i
  %iter.sroa.0.058.i = phi i32 [ %_52.0.i, %bb29.i ], [ 0, %bb20.i ]
  %_55.i = load ptr, ptr %ctx.i, align 4, !nonnull !2, !noundef !2
  %_57.i = getelementptr inbounds nuw i8, ptr %_55.i, i32 12
  %5 = load atomic i32, ptr %_57.i seq_cst, align 4
  %_39.i = and i32 %5, 3
  %6 = icmp eq i32 %_39.i, 3
  br i1 %6, label %bb31.i, label %bb29.i

bb31.i:                                           ; preds = %bb29.i, %bb46.i
  %_59.i = load ptr, ptr %ctx.i, align 4, !nonnull !2, !noundef !2
  %7 = load atomic i32, ptr %_59.i seq_cst, align 4
  %_63.i = getelementptr inbounds nuw i8, ptr %_59.i, i32 4
  %8 = load atomic i32, ptr %_63.i seq_cst, align 4
  %_65.i = getelementptr inbounds nuw i8, ptr %_59.i, i32 8
  %9 = load atomic i32, ptr %_65.i seq_cst, align 4
  %_67.i = getelementptr inbounds nuw i8, ptr %_59.i, i32 12
  %10 = load atomic i32, ptr %_67.i seq_cst, align 4
  %_6.i22.i = call noundef i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @alloc_3486fa9b496d4a3254c3f827bc865bba, i32 noundef %7, i32 noundef %8, i32 noundef %9, i32 noundef %10, i32 noundef 150) #7
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %ctx.i)
  %_2.i.i24.i = call noundef zeroext i8 @DeleteRtMailbox(i16 noundef zeroext %raw.i9.i) #7, !noalias !23
  %_2.i.i26.i = call noundef zeroext i8 @DeleteRtMailbox(i16 noundef zeroext %raw.i8.i) #7, !noalias !28
  call void @llvm.experimental.noalias.scope.decl(metadata !33)
  call void @llvm.experimental.noalias.scope.decl(metadata !36)
  %_32.i.i = load i32, ptr %1, align 4, !alias.scope !39, !noundef !2
  %_2.not3.i.i = icmp eq i32 %_32.i.i, 0
  br i1 %_2.not3.i.i, label %"_ZN4core3ptr43drop_in_place$LT$main..intime..RtBuffer$GT$17hdbd290d14cddc333E.exit", label %bb2.i.i2

bb2.i.i2:                                         ; preds = %bb31.i, %bb6.i.i
  %_34.i.i = phi i32 [ %_3.i.i, %bb6.i.i ], [ %_32.i.i, %bb31.i ]
  %11 = add i32 %_34.i.i, -1
  store i32 %11, ptr %1, align 4, !alias.scope !39
  %_15.i.i = icmp ult i32 %_34.i.i, 17
  br i1 %_15.i.i, label %bb9.i.i, label %bb6.i.i

bb9.i.i:                                          ; preds = %bb2.i.i2
  %_16.i.i3 = getelementptr inbounds nuw %"core::option::Option<intime::RtHandle>", ptr %buf.i, i32 %11
  %12 = load i16, ptr %_16.i.i3, align 4, !range !3, !alias.scope !39, !noundef !2
  %13 = getelementptr inbounds nuw i8, ptr %_16.i.i3, i32 2
  %14 = load i16, ptr %13, align 2, !alias.scope !39
  store i16 0, ptr %_16.i.i3, align 4, !alias.scope !39
  %15 = trunc nuw i16 %12 to i1
  br i1 %15, label %bb3.i.i, label %bb6thread-pre-split.i.i

bb6thread-pre-split.i.i:                          ; preds = %bb3.i.i, %bb9.i.i
  %_3.pr.i.i = load i32, ptr %1, align 4, !alias.scope !39
  br label %bb6.i.i

bb6.i.i:                                          ; preds = %bb6thread-pre-split.i.i, %bb2.i.i2
  %_3.i.i = phi i32 [ %_3.pr.i.i, %bb6thread-pre-split.i.i ], [ %11, %bb2.i.i2 ]
  %_2.not.i.i = icmp eq i32 %_3.i.i, 0
  br i1 %_2.not.i.i, label %"_ZN4core3ptr43drop_in_place$LT$main..intime..RtBuffer$GT$17hdbd290d14cddc333E.exit", label %bb2.i.i2

bb3.i.i:                                          ; preds = %bb9.i.i
  %_11.i.i = call noundef zeroext i8 @DeleteRtMemoryHandle(i16 noundef zeroext %14) #7, !noalias !39
  br label %bb6thread-pre-split.i.i

"_ZN4core3ptr43drop_in_place$LT$main..intime..RtBuffer$GT$17hdbd290d14cddc333E.exit": ; preds = %bb6.i.i, %bb31.i
  %_14.i.i = load ptr, ptr %_4.sroa.2143.0.buf.sroa_idx.i, align 4, !alias.scope !39, !nonnull !2, !noundef !2
  %_12.i.i = call noundef i32 @FreeRtMemory(ptr noundef nonnull %_14.i.i) #7, !noalias !39
  call void @llvm.lifetime.end.p0(i64 76, ptr nonnull %buf.i)
  br label %_ZN4main3run17hae284cc88ca322e5E.exit

bb29.i:                                           ; preds = %bb46.i
  %_52.0.i = add nuw nsw i32 %iter.sroa.0.058.i, 1
  call void @RtSleep(i32 noundef 10) #7
  %exitcond.not.i = icmp eq i32 %_52.0.i, 5000
  br i1 %exitcond.not.i, label %bb31.i, label %bb46.i

bb40.i:                                           ; preds = %bb2.i.i
  %puts56.i = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.5)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !40)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !43)
  br label %"_ZN4core3ptr43drop_in_place$LT$main..intime..RtBuffer$GT$17hdbd290d14cddc333E.exit.i"

bb2.i.i.i:                                        ; preds = %bb2.i.i.i.preheader, %bb6.i.i.i
  %_34.i.i.i = phi i32 [ %_3.i.i27.i, %bb6.i.i.i ], [ 1, %bb2.i.i.i.preheader ]
  %16 = add i32 %_34.i.i.i, -1
  store i32 %16, ptr %1, align 4, !alias.scope !46
  %_15.i.i.i = icmp ult i32 %_34.i.i.i, 17
  br i1 %_15.i.i.i, label %bb9.i.i.i, label %bb6.i.i.i

bb9.i.i.i:                                        ; preds = %bb2.i.i.i
  %_16.i.i.i = getelementptr inbounds nuw %"core::option::Option<intime::RtHandle>", ptr %buf.i, i32 %16
  %17 = load i16, ptr %_16.i.i.i, align 4, !range !3, !alias.scope !46, !noundef !2
  %18 = getelementptr inbounds nuw i8, ptr %_16.i.i.i, i32 2
  %19 = load i16, ptr %18, align 2, !alias.scope !46
  store i16 0, ptr %_16.i.i.i, align 4, !alias.scope !46
  %20 = trunc nuw i16 %17 to i1
  br i1 %20, label %bb3.i.i.i, label %bb6thread-pre-split.i.i.i

bb6thread-pre-split.i.i.i:                        ; preds = %bb3.i.i.i, %bb9.i.i.i
  %_3.pr.i.i.i = load i32, ptr %1, align 4, !alias.scope !46
  br label %bb6.i.i.i

bb6.i.i.i:                                        ; preds = %bb6thread-pre-split.i.i.i, %bb2.i.i.i
  %_3.i.i27.i = phi i32 [ %_3.pr.i.i.i, %bb6thread-pre-split.i.i.i ], [ %16, %bb2.i.i.i ]
  %_2.not.i.i.i = icmp eq i32 %_3.i.i27.i, 0
  br i1 %_2.not.i.i.i, label %"_ZN4core3ptr43drop_in_place$LT$main..intime..RtBuffer$GT$17hdbd290d14cddc333E.exit.loopexit.i", label %bb2.i.i.i

bb3.i.i.i:                                        ; preds = %bb9.i.i.i
  %_11.i.i.i = call noundef zeroext i8 @DeleteRtMemoryHandle(i16 noundef zeroext %19) #7, !noalias !46
  br label %bb6thread-pre-split.i.i.i

"_ZN4core3ptr43drop_in_place$LT$main..intime..RtBuffer$GT$17hdbd290d14cddc333E.exit.loopexit.i": ; preds = %bb6.i.i.i
  %_14.i.i.pre.i = load ptr, ptr %_4.sroa.2143.0.buf.sroa_idx.i, align 4, !alias.scope !46
  br label %"_ZN4core3ptr43drop_in_place$LT$main..intime..RtBuffer$GT$17hdbd290d14cddc333E.exit.i"

"_ZN4core3ptr43drop_in_place$LT$main..intime..RtBuffer$GT$17hdbd290d14cddc333E.exit.i": ; preds = %"_ZN4core3ptr43drop_in_place$LT$main..intime..RtBuffer$GT$17hdbd290d14cddc333E.exit.loopexit.i", %bb40.i
  %_14.i.i.i = phi ptr [ %_14.i.i.pre.i, %"_ZN4core3ptr43drop_in_place$LT$main..intime..RtBuffer$GT$17hdbd290d14cddc333E.exit.loopexit.i" ], [ %p.i.i.i, %bb40.i ]
  %_12.i.i.i = call noundef i32 @FreeRtMemory(ptr noundef nonnull %_14.i.i.i) #7, !noalias !46
  call void @llvm.lifetime.end.p0(i64 76, ptr nonnull %buf.i)
  br label %_ZN4main3run17hae284cc88ca322e5E.exit

_ZN4main3run17hae284cc88ca322e5E.exit:            ; preds = %bb43.i, %"_ZN4core3ptr43drop_in_place$LT$main..intime..RtBuffer$GT$17hdbd290d14cddc333E.exit", %"_ZN4core3ptr43drop_in_place$LT$main..intime..RtBuffer$GT$17hdbd290d14cddc333E.exit.i"
  %_0.sroa.0.2.i = phi i32 [ 1, %"_ZN4core3ptr43drop_in_place$LT$main..intime..RtBuffer$GT$17hdbd290d14cddc333E.exit.i" ], [ 0, %"_ZN4core3ptr43drop_in_place$LT$main..intime..RtBuffer$GT$17hdbd290d14cddc333E.exit" ], [ 1, %bb43.i ]
  ret i32 %_0.sroa.0.2.i
}

; Function Attrs: nounwind uwtable
define void @rust_thread_a_entry(ptr noundef readonly captures(address_is_null) %lp_param) unnamed_addr #1 {
start:
; call main::run_mailbox_thread
  tail call fastcc void @_ZN4main18run_mailbox_thread17h27ae20d6c3d1706dE(i1 noundef zeroext false, ptr noundef %lp_param) #7
  ret void
}

; Function Attrs: nounwind uwtable
define void @rust_thread_b_entry(ptr noundef readonly captures(address_is_null) %lp_param) unnamed_addr #1 {
start:
; call main::run_mailbox_thread
  tail call fastcc void @_ZN4main18run_mailbox_thread17h27ae20d6c3d1706dE(i1 noundef zeroext true, ptr noundef %lp_param) #7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #2

; Function Attrs: nofree nounwind uwtable
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) unnamed_addr #3

; Function Attrs: nounwind uwtable
declare noundef zeroext i8 @SendRtHandle(i16 noundef zeroext, i16 noundef zeroext, i16 noundef zeroext) unnamed_addr #1

; Function Attrs: nounwind uwtable
declare noundef zeroext i16 @CreateRtThread(i8 noundef zeroext, ptr noundef nonnull, i32 noundef, ptr noundef) unnamed_addr #1

; Function Attrs: nounwind uwtable
declare noundef zeroext i16 @GetRtHandleType(i16 noundef zeroext) unnamed_addr #1

; Function Attrs: nounwind uwtable
declare noundef zeroext i16 @ReceiveRtHandle(i16 noundef zeroext, i32 noundef, ptr noundef) unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #4

; Function Attrs: nounwind uwtable
declare noundef zeroext i16 @CreateRtMemoryHandle(ptr noundef, i32 noundef) unnamed_addr #1

; Function Attrs: nounwind uwtable
declare noundef ptr @AllocateRtMemory(i32 noundef) unnamed_addr #1

; Function Attrs: nounwind uwtable
declare void @RtSleep(i32 noundef) unnamed_addr #1

; Function Attrs: nounwind uwtable
declare noundef zeroext i16 @CreateRtMailbox(i16 noundef zeroext) unnamed_addr #1

; Function Attrs: nounwind uwtable
declare noundef i32 @FreeRtMemory(ptr noundef) unnamed_addr #1

; Function Attrs: nounwind uwtable
declare noundef zeroext i8 @DeleteRtMemoryHandle(i16 noundef zeroext) unnamed_addr #1

; Function Attrs: nounwind uwtable
declare noundef zeroext i8 @DeleteRtMailbox(i16 noundef zeroext) unnamed_addr #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #5

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #6

attributes #0 = { nofree norecurse noreturn nosync nounwind memory(none) uwtable "target-cpu"="pentium4" }
attributes #1 = { nounwind uwtable "target-cpu"="pentium4" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nofree nounwind uwtable "target-cpu"="pentium4" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #6 = { nofree nounwind }
attributes #7 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{!"rustc version 1.94.0 (4a4ef493e 2026-03-02)"}
!2 = !{}
!3 = !{i16 0, i16 2}
!4 = !{!5, !7}
!5 = distinct !{!5, !6, !"_ZN4main6intime8RtBuffer8allocate17h93e24f958a4fccc2E: %_0"}
!6 = distinct !{!6, !"_ZN4main6intime8RtBuffer8allocate17h93e24f958a4fccc2E"}
!7 = distinct !{!7, !8, !"_ZN4main6intime8RtBuffer15allocate_zeroed17h26ae410b7fd9b552E: %_0"}
!8 = distinct !{!8, !"_ZN4main6intime8RtBuffer15allocate_zeroed17h26ae410b7fd9b552E"}
!9 = !{!7}
!10 = !{!11}
!11 = distinct !{!11, !12, !"_ZN4main6intime8RtBuffer21create_segment_handle17ha15d14c80eaaa879E: %self"}
!12 = distinct !{!12, !"_ZN4main6intime8RtBuffer21create_segment_handle17ha15d14c80eaaa879E"}
!13 = !{!14, !16}
!14 = distinct !{!14, !15, !"_ZN65_$LT$main..intime..RtMailbox$u20$as$u20$core..ops..drop..Drop$GT$4drop17hec2df81bbdf27664E: %self"}
!15 = distinct !{!15, !"_ZN65_$LT$main..intime..RtMailbox$u20$as$u20$core..ops..drop..Drop$GT$4drop17hec2df81bbdf27664E"}
!16 = distinct !{!16, !17, !"_ZN4core3ptr44drop_in_place$LT$main..intime..RtMailbox$GT$17he7d4f3838fe02537E: %_1"}
!17 = distinct !{!17, !"_ZN4core3ptr44drop_in_place$LT$main..intime..RtMailbox$GT$17he7d4f3838fe02537E"}
!18 = !{!19, !21}
!19 = distinct !{!19, !20, !"_ZN65_$LT$main..intime..RtMailbox$u20$as$u20$core..ops..drop..Drop$GT$4drop17hec2df81bbdf27664E: %self"}
!20 = distinct !{!20, !"_ZN65_$LT$main..intime..RtMailbox$u20$as$u20$core..ops..drop..Drop$GT$4drop17hec2df81bbdf27664E"}
!21 = distinct !{!21, !22, !"_ZN4core3ptr44drop_in_place$LT$main..intime..RtMailbox$GT$17he7d4f3838fe02537E: %_1"}
!22 = distinct !{!22, !"_ZN4core3ptr44drop_in_place$LT$main..intime..RtMailbox$GT$17he7d4f3838fe02537E"}
!23 = !{!24, !26}
!24 = distinct !{!24, !25, !"_ZN65_$LT$main..intime..RtMailbox$u20$as$u20$core..ops..drop..Drop$GT$4drop17hec2df81bbdf27664E: %self"}
!25 = distinct !{!25, !"_ZN65_$LT$main..intime..RtMailbox$u20$as$u20$core..ops..drop..Drop$GT$4drop17hec2df81bbdf27664E"}
!26 = distinct !{!26, !27, !"_ZN4core3ptr44drop_in_place$LT$main..intime..RtMailbox$GT$17he7d4f3838fe02537E: %_1"}
!27 = distinct !{!27, !"_ZN4core3ptr44drop_in_place$LT$main..intime..RtMailbox$GT$17he7d4f3838fe02537E"}
!28 = !{!29, !31}
!29 = distinct !{!29, !30, !"_ZN65_$LT$main..intime..RtMailbox$u20$as$u20$core..ops..drop..Drop$GT$4drop17hec2df81bbdf27664E: %self"}
!30 = distinct !{!30, !"_ZN65_$LT$main..intime..RtMailbox$u20$as$u20$core..ops..drop..Drop$GT$4drop17hec2df81bbdf27664E"}
!31 = distinct !{!31, !32, !"_ZN4core3ptr44drop_in_place$LT$main..intime..RtMailbox$GT$17he7d4f3838fe02537E: %_1"}
!32 = distinct !{!32, !"_ZN4core3ptr44drop_in_place$LT$main..intime..RtMailbox$GT$17he7d4f3838fe02537E"}
!33 = !{!34}
!34 = distinct !{!34, !35, !"_ZN4core3ptr43drop_in_place$LT$main..intime..RtBuffer$GT$17hdbd290d14cddc333E: %_1"}
!35 = distinct !{!35, !"_ZN4core3ptr43drop_in_place$LT$main..intime..RtBuffer$GT$17hdbd290d14cddc333E"}
!36 = !{!37}
!37 = distinct !{!37, !38, !"_ZN64_$LT$main..intime..RtBuffer$u20$as$u20$core..ops..drop..Drop$GT$4drop17h909f5cc35e68ca85E: %self"}
!38 = distinct !{!38, !"_ZN64_$LT$main..intime..RtBuffer$u20$as$u20$core..ops..drop..Drop$GT$4drop17h909f5cc35e68ca85E"}
!39 = !{!37, !34}
!40 = !{!41}
!41 = distinct !{!41, !42, !"_ZN4core3ptr43drop_in_place$LT$main..intime..RtBuffer$GT$17hdbd290d14cddc333E: %_1"}
!42 = distinct !{!42, !"_ZN4core3ptr43drop_in_place$LT$main..intime..RtBuffer$GT$17hdbd290d14cddc333E"}
!43 = !{!44}
!44 = distinct !{!44, !45, !"_ZN64_$LT$main..intime..RtBuffer$u20$as$u20$core..ops..drop..Drop$GT$4drop17h909f5cc35e68ca85E: %self"}
!45 = distinct !{!45, !"_ZN64_$LT$main..intime..RtBuffer$u20$as$u20$core..ops..drop..Drop$GT$4drop17h909f5cc35e68ca85E"}
!46 = !{!44, !41}
