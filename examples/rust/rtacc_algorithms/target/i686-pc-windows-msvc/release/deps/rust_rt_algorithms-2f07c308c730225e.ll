; ModuleID = 'rust_rt_algorithms.5e168e246ccf78ba-cgu.0'
source_filename = "rust_rt_algorithms.5e168e246ccf78ba-cgu.0"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i686-pc-windows-msvc"

@alloc_9eb6ad1bb2761d7967bbb21aee962b44 = private unnamed_addr constant [19 x i8] c"heap pop[%d] = %d\0A\00", align 1
@alloc_5417d29f1a01a8b6dc8cee7e1e1cab8e = private unnamed_addr constant [41 x i8] c"heap mismatch at step: got %d expect %d\0A\00", align 1
@alloc_5f038740266ddabc6a4761a67f05f5ba = private unnamed_addr constant [17 x i8] c"sqrt(2)*1e6: %d\0A\00", align 1
@str = private unnamed_addr constant [34 x i8] c"heapless BinaryHeap push overflow\00", align 1
@str.5 = private unnamed_addr constant [34 x i8] c"heapless BinaryHeap pop underflow\00", align 1
@str.7 = private unnamed_addr constant [25 x i8] c"rust_rt_algorithms: FAIL\00", align 1

; __rustc::rust_begin_unwind
; Function Attrs: nofree norecurse noreturn nosync nounwind memory(none) uwtable
define hidden void @_RNvCs5QKde7ScR4H_7___rustc17rust_begin_unwind(ptr noalias noundef readonly align 4 captures(none) dereferenceable(12) %_1) unnamed_addr #0 {
start:
  br label %bb1

bb1:                                              ; preds = %bb1, %start
  br label %bb1
}

; Function Attrs: nofree nounwind uwtable
define noundef i32 @main(i32 noundef %_argc, ptr noundef readnone captures(none) %_argv) unnamed_addr #1 personality ptr @__CxxFrameHandler3 {
bb2.i.i.3.i.preheader:
  %expected.i = alloca [32 x i8], align 4
  %heap.i = alloca [68 x i8], align 4
  call void @llvm.lifetime.start.p0(i64 68, ptr nonnull %heap.i)
  %_38.sroa.4.0.heap.sroa_idx.i = getelementptr inbounds nuw i8, ptr %heap.i, i32 64
  %0 = getelementptr inbounds nuw i8, ptr %heap.i, i32 16
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(48) %0, i8 0, i64 48, i1 false)
  store <4 x i32> <i32 4, i32 1, i32 3, i32 1>, ptr %heap.i, align 4, !alias.scope !2
  store i32 4, ptr %_38.sroa.4.0.heap.sroa_idx.i, align 4, !alias.scope !2
  %storemerge.lcssa.i.i.3.i.ph.sroa.gep11 = getelementptr inbounds nuw i8, ptr %heap.i, i32 4
  %storemerge.lcssa.i.i.3.i.ph.sroa.gep = getelementptr inbounds nuw i8, ptr %heap.i, i32 12
  %_28.i.i.3.i = getelementptr inbounds nuw i8, ptr %heap.i, i32 4
  %_28.val.i.i.3.i = load i32, ptr %_28.i.i.3.i, align 4, !alias.scope !5, !noundef !8
  %_31.not.i.i.3.i = icmp slt i32 %_28.val.i.i.3.i, 1
  br i1 %_31.not.i.i.3.i, label %bb6.i.i.3.i, label %bb6.3.i

bb6.i.i.3.i:                                      ; preds = %bb2.i.i.3.i.preheader
  %_37.i.i.3.i = getelementptr inbounds nuw i8, ptr %heap.i, i32 12
  store i32 %_28.val.i.i.3.i, ptr %_37.i.i.3.i, align 4, !alias.scope !5
  %_28.val.i.i.3.i.1 = load i32, ptr %heap.i, align 4, !alias.scope !5, !noundef !8
  %_31.not.i.i.3.i.1 = icmp slt i32 %_28.val.i.i.3.i.1, 1
  br i1 %_31.not.i.i.3.i.1, label %bb6.i.i.3.i.1, label %bb6.3.i

bb6.i.i.3.i.1:                                    ; preds = %bb6.i.i.3.i
  %_37.i.i.3.i.1 = getelementptr inbounds nuw i8, ptr %heap.i, i32 4
  store i32 %_28.val.i.i.3.i.1, ptr %_37.i.i.3.i.1, align 4, !alias.scope !5
  br label %bb6.3.i

bb6.3.i:                                          ; preds = %bb6.i.i.3.i.1, %bb6.i.i.3.i, %bb2.i.i.3.i.preheader
  %storemerge.lcssa.i.i.3.i.ph.sroa.phi = phi ptr [ %storemerge.lcssa.i.i.3.i.ph.sroa.gep, %bb2.i.i.3.i.preheader ], [ %storemerge.lcssa.i.i.3.i.ph.sroa.gep11, %bb6.i.i.3.i ], [ %heap.i, %bb6.i.i.3.i.1 ]
  store i32 1, ptr %storemerge.lcssa.i.i.3.i.ph.sroa.phi, align 4, !alias.scope !5, !noalias !9
  %_4.i.4.i = load i32, ptr %_38.sroa.4.0.heap.sroa_idx.i, align 4, !alias.scope !2, !noundef !8
  %_3.i.4.i = icmp eq i32 %_4.i.4.i, 16
  br i1 %_3.i.4.i, label %bb4.i, label %bb2.i.4.i

bb2.i.4.i:                                        ; preds = %bb6.3.i
  %_13.i.4.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %_4.i.4.i
  store i32 5, ptr %_13.i.4.i, align 4, !alias.scope !2
  %1 = load i32, ptr %_38.sroa.4.0.heap.sroa_idx.i, align 4, !alias.scope !2, !noundef !8
  %2 = add i32 %1, 1
  store i32 %2, ptr %_38.sroa.4.0.heap.sroa_idx.i, align 4, !alias.scope !2
  %_25.i.i.4.i = icmp ult i32 %_4.i.4.i, %2
  tail call void @llvm.assume(i1 %_25.i.i.4.i)
  %_22.i.i.4.i = load i32, ptr %_13.i.4.i, align 4, !alias.scope !5, !noundef !8
  %_6.not6.i.i.4.i = icmp eq i32 %_4.i.4.i, 0
  br i1 %_6.not6.i.i.4.i, label %bb6.4.i, label %bb2.i.i.4.i

bb2.i.i.4.i:                                      ; preds = %bb2.i.4.i, %bb6.i.i.4.i
  %storemerge7.i.i.4.i = phi i32 [ %parent2.i.i.4.i, %bb6.i.i.4.i ], [ %_4.i.4.i, %bb2.i.4.i ]
  %_9.i.i.4.i = add i32 %storemerge7.i.i.4.i, -1
  %parent2.i.i.4.i = lshr i32 %_9.i.i.4.i, 1
  %_29.i.i.4.i = icmp ult i32 %parent2.i.i.4.i, %2
  tail call void @llvm.assume(i1 %_29.i.i.4.i)
  %_28.i.i.4.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %parent2.i.i.4.i
  %_28.val.i.i.4.i = load i32, ptr %_28.i.i.4.i, align 4, !alias.scope !5, !noundef !8
  %_31.not.i.i.4.i = icmp sgt i32 %_22.i.i.4.i, %_28.val.i.i.4.i
  br i1 %_31.not.i.i.4.i, label %bb6.i.i.4.i, label %bb6.4.i

bb6.i.i.4.i:                                      ; preds = %bb2.i.i.4.i
  %_37.i.i.4.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %storemerge7.i.i.4.i
  store i32 %_28.val.i.i.4.i, ptr %_37.i.i.4.i, align 4, !alias.scope !5
  %_6.not.i.i.4.i = icmp ult i32 %_9.i.i.4.i, 2
  br i1 %_6.not.i.i.4.i, label %bb6.4.i, label %bb2.i.i.4.i

bb6.4.i:                                          ; preds = %bb6.i.i.4.i, %bb2.i.i.4.i, %bb2.i.4.i
  %storemerge.lcssa.i.i.4.i = phi i32 [ 0, %bb2.i.4.i ], [ %parent2.i.i.4.i, %bb6.i.i.4.i ], [ %storemerge7.i.i.4.i, %bb2.i.i.4.i ]
  %_5.i.i.i.i.4.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %storemerge.lcssa.i.i.4.i
  store i32 %_22.i.i.4.i, ptr %_5.i.i.i.i.4.i, align 4, !alias.scope !5, !noalias !9
  %_4.i.5.i = load i32, ptr %_38.sroa.4.0.heap.sroa_idx.i, align 4, !alias.scope !2, !noundef !8
  %_3.i.5.i = icmp eq i32 %_4.i.5.i, 16
  br i1 %_3.i.5.i, label %bb4.i, label %bb2.i.5.i

bb2.i.5.i:                                        ; preds = %bb6.4.i
  %_13.i.5.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %_4.i.5.i
  store i32 9, ptr %_13.i.5.i, align 4, !alias.scope !2
  %3 = load i32, ptr %_38.sroa.4.0.heap.sroa_idx.i, align 4, !alias.scope !2, !noundef !8
  %4 = add i32 %3, 1
  store i32 %4, ptr %_38.sroa.4.0.heap.sroa_idx.i, align 4, !alias.scope !2
  %_25.i.i.5.i = icmp ult i32 %_4.i.5.i, %4
  tail call void @llvm.assume(i1 %_25.i.i.5.i)
  %_22.i.i.5.i = load i32, ptr %_13.i.5.i, align 4, !alias.scope !5, !noundef !8
  %_6.not6.i.i.5.i = icmp eq i32 %_4.i.5.i, 0
  br i1 %_6.not6.i.i.5.i, label %bb6.5.i, label %bb2.i.i.5.i

bb2.i.i.5.i:                                      ; preds = %bb2.i.5.i, %bb6.i.i.5.i
  %storemerge7.i.i.5.i = phi i32 [ %parent2.i.i.5.i, %bb6.i.i.5.i ], [ %_4.i.5.i, %bb2.i.5.i ]
  %_9.i.i.5.i = add i32 %storemerge7.i.i.5.i, -1
  %parent2.i.i.5.i = lshr i32 %_9.i.i.5.i, 1
  %_29.i.i.5.i = icmp ult i32 %parent2.i.i.5.i, %4
  tail call void @llvm.assume(i1 %_29.i.i.5.i)
  %_28.i.i.5.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %parent2.i.i.5.i
  %_28.val.i.i.5.i = load i32, ptr %_28.i.i.5.i, align 4, !alias.scope !5, !noundef !8
  %_31.not.i.i.5.i = icmp sgt i32 %_22.i.i.5.i, %_28.val.i.i.5.i
  br i1 %_31.not.i.i.5.i, label %bb6.i.i.5.i, label %bb6.5.i

bb6.i.i.5.i:                                      ; preds = %bb2.i.i.5.i
  %_37.i.i.5.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %storemerge7.i.i.5.i
  store i32 %_28.val.i.i.5.i, ptr %_37.i.i.5.i, align 4, !alias.scope !5
  %_6.not.i.i.5.i = icmp ult i32 %_9.i.i.5.i, 2
  br i1 %_6.not.i.i.5.i, label %bb6.5.i, label %bb2.i.i.5.i

bb6.5.i:                                          ; preds = %bb6.i.i.5.i, %bb2.i.i.5.i, %bb2.i.5.i
  %storemerge.lcssa.i.i.5.i = phi i32 [ 0, %bb2.i.5.i ], [ %parent2.i.i.5.i, %bb6.i.i.5.i ], [ %storemerge7.i.i.5.i, %bb2.i.i.5.i ]
  %_5.i.i.i.i.5.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %storemerge.lcssa.i.i.5.i
  store i32 %_22.i.i.5.i, ptr %_5.i.i.i.i.5.i, align 4, !alias.scope !5, !noalias !9
  %_4.i.6.i = load i32, ptr %_38.sroa.4.0.heap.sroa_idx.i, align 4, !alias.scope !2, !noundef !8
  %_3.i.6.i = icmp eq i32 %_4.i.6.i, 16
  br i1 %_3.i.6.i, label %bb4.i, label %bb2.i.6.i

bb2.i.6.i:                                        ; preds = %bb6.5.i
  %_13.i.6.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %_4.i.6.i
  store i32 2, ptr %_13.i.6.i, align 4, !alias.scope !2
  %5 = load i32, ptr %_38.sroa.4.0.heap.sroa_idx.i, align 4, !alias.scope !2, !noundef !8
  %6 = add i32 %5, 1
  store i32 %6, ptr %_38.sroa.4.0.heap.sroa_idx.i, align 4, !alias.scope !2
  %_25.i.i.6.i = icmp ult i32 %_4.i.6.i, %6
  tail call void @llvm.assume(i1 %_25.i.i.6.i)
  %_22.i.i.6.i = load i32, ptr %_13.i.6.i, align 4, !alias.scope !5, !noundef !8
  %_6.not6.i.i.6.i = icmp eq i32 %_4.i.6.i, 0
  br i1 %_6.not6.i.i.6.i, label %bb6.6.i, label %bb2.i.i.6.i

bb2.i.i.6.i:                                      ; preds = %bb2.i.6.i, %bb6.i.i.6.i
  %storemerge7.i.i.6.i = phi i32 [ %parent2.i.i.6.i, %bb6.i.i.6.i ], [ %_4.i.6.i, %bb2.i.6.i ]
  %_9.i.i.6.i = add i32 %storemerge7.i.i.6.i, -1
  %parent2.i.i.6.i = lshr i32 %_9.i.i.6.i, 1
  %_29.i.i.6.i = icmp ult i32 %parent2.i.i.6.i, %6
  tail call void @llvm.assume(i1 %_29.i.i.6.i)
  %_28.i.i.6.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %parent2.i.i.6.i
  %_28.val.i.i.6.i = load i32, ptr %_28.i.i.6.i, align 4, !alias.scope !5, !noundef !8
  %_31.not.i.i.6.i = icmp sgt i32 %_22.i.i.6.i, %_28.val.i.i.6.i
  br i1 %_31.not.i.i.6.i, label %bb6.i.i.6.i, label %bb6.6.i

bb6.i.i.6.i:                                      ; preds = %bb2.i.i.6.i
  %_37.i.i.6.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %storemerge7.i.i.6.i
  store i32 %_28.val.i.i.6.i, ptr %_37.i.i.6.i, align 4, !alias.scope !5
  %_6.not.i.i.6.i = icmp ult i32 %_9.i.i.6.i, 2
  br i1 %_6.not.i.i.6.i, label %bb6.6.i, label %bb2.i.i.6.i

bb6.6.i:                                          ; preds = %bb6.i.i.6.i, %bb2.i.i.6.i, %bb2.i.6.i
  %storemerge.lcssa.i.i.6.i = phi i32 [ 0, %bb2.i.6.i ], [ %parent2.i.i.6.i, %bb6.i.i.6.i ], [ %storemerge7.i.i.6.i, %bb2.i.i.6.i ]
  %_5.i.i.i.i.6.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %storemerge.lcssa.i.i.6.i
  store i32 %_22.i.i.6.i, ptr %_5.i.i.i.i.6.i, align 4, !alias.scope !5, !noalias !9
  %_4.i.7.i = load i32, ptr %_38.sroa.4.0.heap.sroa_idx.i, align 4, !alias.scope !2, !noundef !8
  %_3.i.7.i = icmp eq i32 %_4.i.7.i, 16
  br i1 %_3.i.7.i, label %bb4.i, label %bb2.i.7.i

bb2.i.7.i:                                        ; preds = %bb6.6.i
  %_13.i.7.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %_4.i.7.i
  store i32 6, ptr %_13.i.7.i, align 4, !alias.scope !2
  %7 = load i32, ptr %_38.sroa.4.0.heap.sroa_idx.i, align 4, !alias.scope !2, !noundef !8
  %8 = add i32 %7, 1
  store i32 %8, ptr %_38.sroa.4.0.heap.sroa_idx.i, align 4, !alias.scope !2
  %_25.i.i.7.i = icmp ult i32 %_4.i.7.i, %8
  tail call void @llvm.assume(i1 %_25.i.i.7.i)
  %_22.i.i.7.i = load i32, ptr %_13.i.7.i, align 4, !alias.scope !5, !noundef !8
  %_6.not6.i.i.7.i = icmp eq i32 %_4.i.7.i, 0
  br i1 %_6.not6.i.i.7.i, label %bb6.7.i, label %bb2.i.i.7.i

bb2.i.i.7.i:                                      ; preds = %bb2.i.7.i, %bb6.i.i.7.i
  %storemerge7.i.i.7.i = phi i32 [ %parent2.i.i.7.i, %bb6.i.i.7.i ], [ %_4.i.7.i, %bb2.i.7.i ]
  %_9.i.i.7.i = add i32 %storemerge7.i.i.7.i, -1
  %parent2.i.i.7.i = lshr i32 %_9.i.i.7.i, 1
  %_29.i.i.7.i = icmp ult i32 %parent2.i.i.7.i, %8
  tail call void @llvm.assume(i1 %_29.i.i.7.i)
  %_28.i.i.7.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %parent2.i.i.7.i
  %_28.val.i.i.7.i = load i32, ptr %_28.i.i.7.i, align 4, !alias.scope !5, !noundef !8
  %_31.not.i.i.7.i = icmp sgt i32 %_22.i.i.7.i, %_28.val.i.i.7.i
  br i1 %_31.not.i.i.7.i, label %bb6.i.i.7.i, label %bb6.7.i

bb6.i.i.7.i:                                      ; preds = %bb2.i.i.7.i
  %_37.i.i.7.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %storemerge7.i.i.7.i
  store i32 %_28.val.i.i.7.i, ptr %_37.i.i.7.i, align 4, !alias.scope !5
  %_6.not.i.i.7.i = icmp ult i32 %_9.i.i.7.i, 2
  br i1 %_6.not.i.i.7.i, label %bb6.7.i, label %bb2.i.i.7.i

bb6.7.i:                                          ; preds = %bb6.i.i.7.i, %bb2.i.i.7.i, %bb2.i.7.i
  %storemerge.lcssa.i.i.7.i = phi i32 [ 0, %bb2.i.7.i ], [ %parent2.i.i.7.i, %bb6.i.i.7.i ], [ %storemerge7.i.i.7.i, %bb2.i.i.7.i ]
  %_5.i.i.i.i.7.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %storemerge.lcssa.i.i.7.i
  store i32 %_22.i.i.7.i, ptr %_5.i.i.i.i.7.i, align 4, !alias.scope !5, !noalias !9
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %expected.i)
  store <4 x i32> <i32 9, i32 6, i32 5, i32 4>, ptr %expected.i, align 4
  %9 = getelementptr inbounds nuw i8, ptr %expected.i, i32 16
  store <4 x i32> <i32 3, i32 2, i32 1, i32 1>, ptr %9, align 4
  br label %bb7.i

bb4.i:                                            ; preds = %bb6.6.i, %bb6.5.i, %bb6.4.i, %bb6.3.i
  %puts.i = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %_ZN18rust_rt_algorithms13run_heap_demo17hc6f6f07e7c261fc4E.exit

bb7.i:                                            ; preds = %"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$13pop_unchecked17h241fd8cac3324cbaE.exit50.i", %bb6.7.i
  %iter1.sroa.8.0.i = phi i32 [ 0, %bb6.7.i ], [ %_8.0.i.i, %"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$13pop_unchecked17h241fd8cac3324cbaE.exit50.i" ]
  %iter1.sroa.0.0.idx.i = phi i32 [ 0, %bb6.7.i ], [ %iter1.sroa.0.0.add.i, %"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$13pop_unchecked17h241fd8cac3324cbaE.exit50.i" ]
  %_6.i.i.i = icmp eq i32 %iter1.sroa.0.0.idx.i, 32
  br i1 %_6.i.i.i, label %bb10.i, label %bb9.i

bb9.i:                                            ; preds = %bb7.i
  %iter1.sroa.0.0.ptr.i = getelementptr inbounds nuw i8, ptr %expected.i, i32 %iter1.sroa.0.0.idx.i
  %iter1.sroa.0.0.add.i = add nuw nsw i32 %iter1.sroa.0.0.idx.i, 4
  %_8.0.i.i = add nuw nsw i32 %iter1.sroa.8.0.i, 1
  %exp.i = load i32, ptr %iter1.sroa.0.0.ptr.i, align 4, !noundef !8
  %_65.i = load i32, ptr %_38.sroa.4.0.heap.sroa_idx.i, align 4, !noundef !8
  %10 = icmp eq i32 %_65.i, 0
  br i1 %10, label %bb23.i, label %bb24.i

bb10.i:                                           ; preds = %bb7.i
  %_67.i = load i32, ptr %_38.sroa.4.0.heap.sroa_idx.i, align 4, !noundef !8
  %.not3.i = icmp eq i32 %_67.i, 0
  br i1 %.not3.i, label %bb26.i, label %bb28.i

bb28.i:                                           ; preds = %bb10.i
  %11 = add i32 %_67.i, -1
  store i32 %11, ptr %_38.sroa.4.0.heap.sroa_idx.i, align 4, !alias.scope !14
  %_9.i.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %11
  %12 = load i32, ptr %_9.i.i, align 4, !alias.scope !14, !noundef !8
  %13 = icmp eq i32 %11, 0
  br i1 %13, label %bb26.i, label %bb2.i6.i

bb2.i6.i:                                         ; preds = %bb28.i
  store i32 %12, ptr %heap.i, align 4, !alias.scope !14
  %_1011.i.not.i.i = icmp eq i32 %11, 1
  br i1 %_1011.i.not.i.i, label %bb26.i, label %bb2.i.i7.i

bb2.i.preheader.i.i.i:                            ; preds = %bb8.i.i.i
  %_48.i.i.i.le = getelementptr inbounds nuw i32, ptr %heap.i, i32 %child.sroa.0.1.i.i.i
  store i32 %12, ptr %_48.i.i.i.le, align 4, !alias.scope !17, !noalias !20
  %_19.i.i.i.i = load i32, ptr %_38.sroa.4.0.heap.sroa_idx.i, align 4, !alias.scope !25, !noundef !8
  %_25.i.i.i.i = icmp ult i32 %child.sroa.0.1.i.i.i, %_19.i.i.i.i
  tail call void @llvm.assume(i1 %_25.i.i.i.i)
  br label %bb2.i.i.i.i

bb2.i.i.i.i:                                      ; preds = %bb6.i.i.i.i, %bb2.i.preheader.i.i.i
  %storemerge7.i.i.i.i = phi i32 [ %parent2.i.i.i.i, %bb6.i.i.i.i ], [ %child.sroa.0.1.i.i.i, %bb2.i.preheader.i.i.i ]
  %_9.i.i.i.i = add i32 %storemerge7.i.i.i.i, -1
  %parent2.i.i.i.i = lshr i32 %_9.i.i.i.i, 1
  %_29.i.i.i.i = icmp ult i32 %parent2.i.i.i.i, %_19.i.i.i.i
  tail call void @llvm.assume(i1 %_29.i.i.i.i)
  %_28.i.i.i.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %parent2.i.i.i.i
  %_28.val.i.i.i.i = load i32, ptr %_28.i.i.i.i, align 4, !alias.scope !25, !noundef !8
  %_31.not.i.i.i.i = icmp sgt i32 %12, %_28.val.i.i.i.i
  br i1 %_31.not.i.i.i.i, label %bb6.i.i.i.i, label %bb26.i

bb6.i.i.i.i:                                      ; preds = %bb2.i.i.i.i
  %_37.i.i.i.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %storemerge7.i.i.i.i
  store i32 %_28.val.i.i.i.i, ptr %_37.i.i.i.i, align 4, !alias.scope !25
  %_6.not.i.i.i.i = icmp ult i32 %_9.i.i.i.i, 2
  br i1 %_6.not.i.i.i.i, label %bb26.i, label %bb2.i.i.i.i

bb2.i.i7.i:                                       ; preds = %bb2.i6.i, %bb8.i.i.i
  %child.sroa.0.013.i.i.i = phi i32 [ %15, %bb8.i.i.i ], [ 1, %bb2.i6.i ]
  %hole.sroa.10.012.i.i.i = phi i32 [ %child.sroa.0.1.i.i.i, %bb8.i.i.i ], [ 0, %bb2.i6.i ]
  %right.i.i.i = add nuw i32 %child.sroa.0.013.i.i.i, 1
  %_14.i.i.i = icmp ult i32 %right.i.i.i, %11
  br i1 %_14.i.i.i, label %bb3.i.i.i, label %bb8.i.i.i

bb8.i.i.i:                                        ; preds = %bb3.i.i.i, %bb2.i.i7.i
  %child.sroa.0.1.i.i.i = phi i32 [ %child.sroa.0.013.i.i.i, %bb2.i.i7.i ], [ %spec.select.i.i.i, %bb3.i.i.i ]
  %_48.i.i.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %child.sroa.0.1.i.i.i
  %_49.i.i.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %hole.sroa.10.012.i.i.i
  %14 = load i32, ptr %_48.i.i.i, align 4, !alias.scope !17
  store i32 %14, ptr %_49.i.i.i, align 4, !alias.scope !17
  %_21.i.i.i = shl i32 %child.sroa.0.1.i.i.i, 1
  %15 = or disjoint i32 %_21.i.i.i, 1
  %_10.i.i.i = icmp ult i32 %15, %11
  br i1 %_10.i.i.i, label %bb2.i.i7.i, label %bb2.i.preheader.i.i.i

bb3.i.i.i:                                        ; preds = %bb2.i.i7.i
  %_36.i.i.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %child.sroa.0.013.i.i.i
  %_40.i.i.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %right.i.i.i
  %_36.val.i.i.i = load i32, ptr %_36.i.i.i, align 4, !alias.scope !17, !noundef !8
  %_40.val.i.i.i = load i32, ptr %_40.i.i.i, align 4, !alias.scope !17, !noundef !8
  %_43.not.i.i.i = icmp sgt i32 %_36.val.i.i.i, %_40.val.i.i.i
  %spec.select.i.i.i = select i1 %_43.not.i.i.i, i32 %child.sroa.0.013.i.i.i, i32 %right.i.i.i
  br label %bb8.i.i.i

bb26.i:                                           ; preds = %bb6.i.i.i.i, %bb2.i.i.i.i, %bb2.i6.i, %bb28.i, %bb10.i
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %expected.i)
  br label %_ZN18rust_rt_algorithms13run_heap_demo17hc6f6f07e7c261fc4E.exit

bb23.i:                                           ; preds = %bb9.i
  %puts60.i = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.5)
  br label %bb17.i

bb24.i:                                           ; preds = %bb9.i
  %16 = add i32 %_65.i, -1
  store i32 %16, ptr %_38.sroa.4.0.heap.sroa_idx.i, align 4, !alias.scope !28
  %_9.i9.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %16
  %17 = load i32, ptr %_9.i9.i, align 4, !alias.scope !28, !noundef !8
  %18 = icmp eq i32 %16, 0
  br i1 %18, label %"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$13pop_unchecked17h241fd8cac3324cbaE.exit50.i", label %bb2.i10.i

bb2.i10.i:                                        ; preds = %bb24.i
  %item.sroa.0.0.copyload.i11.i = load i32, ptr %heap.i, align 4, !alias.scope !28
  store i32 %17, ptr %heap.i, align 4, !alias.scope !28
  %_1011.i.not.i12.i = icmp eq i32 %16, 1
  br i1 %_1011.i.not.i12.i, label %"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$19sift_down_to_bottom17ha9071025dd71343dE.exit.i36.i", label %bb2.i.i13.i

bb2.i.preheader.i.i24.i:                          ; preds = %bb8.i.i18.i
  %_48.i.i20.i.le = getelementptr inbounds nuw i32, ptr %heap.i, i32 %child.sroa.0.1.i.i19.i
  store i32 %17, ptr %_48.i.i20.i.le, align 4, !alias.scope !31, !noalias !34
  %_19.i.i.i26.i = load i32, ptr %_38.sroa.4.0.heap.sroa_idx.i, align 4, !alias.scope !39, !noundef !8
  %_25.i.i.i27.i = icmp ult i32 %child.sroa.0.1.i.i19.i, %_19.i.i.i26.i
  tail call void @llvm.assume(i1 %_25.i.i.i27.i)
  br label %bb2.i.i.i28.i

bb2.i.i.i28.i:                                    ; preds = %bb6.i.i.i40.i, %bb2.i.preheader.i.i24.i
  %storemerge7.i.i.i29.i = phi i32 [ %parent2.i.i.i31.i, %bb6.i.i.i40.i ], [ %child.sroa.0.1.i.i19.i, %bb2.i.preheader.i.i24.i ]
  %_9.i.i.i30.i = add i32 %storemerge7.i.i.i29.i, -1
  %parent2.i.i.i31.i = lshr i32 %_9.i.i.i30.i, 1
  %_29.i.i.i32.i = icmp ult i32 %parent2.i.i.i31.i, %_19.i.i.i26.i
  tail call void @llvm.assume(i1 %_29.i.i.i32.i)
  %_28.i.i.i33.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %parent2.i.i.i31.i
  %_28.val.i.i.i34.i = load i32, ptr %_28.i.i.i33.i, align 4, !alias.scope !39, !noundef !8
  %_31.not.i.i.i35.i = icmp sgt i32 %17, %_28.val.i.i.i34.i
  br i1 %_31.not.i.i.i35.i, label %bb6.i.i.i40.i, label %"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$19sift_down_to_bottom17ha9071025dd71343dE.exit.i36.i"

bb6.i.i.i40.i:                                    ; preds = %bb2.i.i.i28.i
  %_37.i.i.i41.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %storemerge7.i.i.i29.i
  store i32 %_28.val.i.i.i34.i, ptr %_37.i.i.i41.i, align 4, !alias.scope !39
  %_6.not.i.i.i42.i = icmp ult i32 %_9.i.i.i30.i, 2
  br i1 %_6.not.i.i.i42.i, label %"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$19sift_down_to_bottom17ha9071025dd71343dE.exit.i36.i", label %bb2.i.i.i28.i

bb2.i.i13.i:                                      ; preds = %bb2.i10.i, %bb8.i.i18.i
  %child.sroa.0.013.i.i14.i = phi i32 [ %20, %bb8.i.i18.i ], [ 1, %bb2.i10.i ]
  %hole.sroa.10.012.i.i15.i = phi i32 [ %child.sroa.0.1.i.i19.i, %bb8.i.i18.i ], [ 0, %bb2.i10.i ]
  %right.i.i16.i = add nuw i32 %child.sroa.0.013.i.i14.i, 1
  %_14.i.i17.i = icmp ult i32 %right.i.i16.i, %16
  br i1 %_14.i.i17.i, label %bb3.i.i43.i, label %bb8.i.i18.i

bb8.i.i18.i:                                      ; preds = %bb3.i.i43.i, %bb2.i.i13.i
  %child.sroa.0.1.i.i19.i = phi i32 [ %child.sroa.0.013.i.i14.i, %bb2.i.i13.i ], [ %spec.select.i.i49.i, %bb3.i.i43.i ]
  %_48.i.i20.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %child.sroa.0.1.i.i19.i
  %_49.i.i21.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %hole.sroa.10.012.i.i15.i
  %19 = load i32, ptr %_48.i.i20.i, align 4, !alias.scope !31
  store i32 %19, ptr %_49.i.i21.i, align 4, !alias.scope !31
  %_21.i.i22.i = shl i32 %child.sroa.0.1.i.i19.i, 1
  %20 = or disjoint i32 %_21.i.i22.i, 1
  %_10.i.i23.i = icmp ult i32 %20, %16
  br i1 %_10.i.i23.i, label %bb2.i.i13.i, label %bb2.i.preheader.i.i24.i

bb3.i.i43.i:                                      ; preds = %bb2.i.i13.i
  %_36.i.i44.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %child.sroa.0.013.i.i14.i
  %_40.i.i45.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %right.i.i16.i
  %_36.val.i.i46.i = load i32, ptr %_36.i.i44.i, align 4, !alias.scope !31, !noundef !8
  %_40.val.i.i47.i = load i32, ptr %_40.i.i45.i, align 4, !alias.scope !31, !noundef !8
  %_43.not.i.i48.i = icmp sgt i32 %_36.val.i.i46.i, %_40.val.i.i47.i
  %spec.select.i.i49.i = select i1 %_43.not.i.i48.i, i32 %child.sroa.0.013.i.i14.i, i32 %right.i.i16.i
  br label %bb8.i.i18.i

"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$19sift_down_to_bottom17ha9071025dd71343dE.exit.i36.i": ; preds = %bb6.i.i.i40.i, %bb2.i.i.i28.i, %bb2.i10.i
  %storemerge.lcssa.i.i.i37.i = phi i32 [ 0, %bb2.i10.i ], [ %storemerge7.i.i.i29.i, %bb2.i.i.i28.i ], [ %parent2.i.i.i31.i, %bb6.i.i.i40.i ]
  %_5.i.i.i.i.i38.i = getelementptr inbounds nuw i32, ptr %heap.i, i32 %storemerge.lcssa.i.i.i37.i
  store i32 %17, ptr %_5.i.i.i.i.i38.i, align 4, !alias.scope !39, !noalias !42
  br label %"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$13pop_unchecked17h241fd8cac3324cbaE.exit50.i"

"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$13pop_unchecked17h241fd8cac3324cbaE.exit50.i": ; preds = %"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$19sift_down_to_bottom17ha9071025dd71343dE.exit.i36.i", %bb24.i
  %item.sroa.0.0.i39.i = phi i32 [ %17, %bb24.i ], [ %item.sroa.0.0.copyload.i11.i, %"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$19sift_down_to_bottom17ha9071025dd71343dE.exit.i36.i" ]
  %_4.i51.i = tail call noundef i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @alloc_9eb6ad1bb2761d7967bbb21aee962b44, i32 noundef %iter1.sroa.8.0.i, i32 noundef %item.sroa.0.0.i39.i) #7
  %_31.not.i = icmp eq i32 %item.sroa.0.0.i39.i, %exp.i
  br i1 %_31.not.i, label %bb7.i, label %bb13.i

bb17.i:                                           ; preds = %bb13.i, %bb23.i
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %expected.i)
  br label %_ZN18rust_rt_algorithms13run_heap_demo17hc6f6f07e7c261fc4E.exit

bb13.i:                                           ; preds = %"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$13pop_unchecked17h241fd8cac3324cbaE.exit50.i"
  %_4.i52.i = tail call noundef i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @alloc_5417d29f1a01a8b6dc8cee7e1e1cab8e, i32 noundef %item.sroa.0.0.i39.i, i32 noundef %exp.i) #7
  br label %bb17.i

_ZN18rust_rt_algorithms13run_heap_demo17hc6f6f07e7c261fc4E.exit: ; preds = %bb4.i, %bb26.i, %bb17.i
  call void @llvm.lifetime.end.p0(i64 68, ptr nonnull %heap.i)
  %_3.i.i = tail call noundef i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @alloc_5f038740266ddabc6a4761a67f05f5ba, i32 noundef 1500000) #7
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.7)
  ret i32 1
}

declare i32 @__CxxFrameHandler3(...) unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #3

; Function Attrs: nofree nounwind uwtable
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #4

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #5

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #6

attributes #0 = { nofree norecurse noreturn nosync nounwind memory(none) uwtable "target-cpu"="pentium4" }
attributes #1 = { nofree nounwind uwtable "target-cpu"="pentium4" }
attributes #2 = { "target-cpu"="pentium4" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #5 = { nofree nounwind }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #7 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{!"rustc version 1.94.0 (4a4ef493e 2026-03-02)"}
!2 = !{!3}
!3 = distinct !{!3, !4, !"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$4push17hff9da50150dbd6e1E: %self"}
!4 = distinct !{!4, !"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$4push17hff9da50150dbd6e1E"}
!5 = !{!6, !3}
!6 = distinct !{!6, !7, !"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$7sift_up17h2e099c53a2563c53E: %self"}
!7 = distinct !{!7, !"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$7sift_up17h2e099c53a2563c53E"}
!8 = !{}
!9 = !{!10, !12}
!10 = distinct !{!10, !11, !"_ZN78_$LT$heapless..binary_heap..Hole$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he0161f26b80e90a5E: %self"}
!11 = distinct !{!11, !"_ZN78_$LT$heapless..binary_heap..Hole$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he0161f26b80e90a5E"}
!12 = distinct !{!12, !13, !"_ZN4core3ptr59drop_in_place$LT$heapless..binary_heap..Hole$LT$i32$GT$$GT$17h40d1e04b26bff479E: %_1"}
!13 = distinct !{!13, !"_ZN4core3ptr59drop_in_place$LT$heapless..binary_heap..Hole$LT$i32$GT$$GT$17h40d1e04b26bff479E"}
!14 = !{!15}
!15 = distinct !{!15, !16, !"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$13pop_unchecked17h241fd8cac3324cbaE: %self"}
!16 = distinct !{!16, !"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$13pop_unchecked17h241fd8cac3324cbaE"}
!17 = !{!18, !15}
!18 = distinct !{!18, !19, !"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$19sift_down_to_bottom17ha9071025dd71343dE: %self"}
!19 = distinct !{!19, !"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$19sift_down_to_bottom17ha9071025dd71343dE"}
!20 = !{!21, !23}
!21 = distinct !{!21, !22, !"_ZN78_$LT$heapless..binary_heap..Hole$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he0161f26b80e90a5E: %self"}
!22 = distinct !{!22, !"_ZN78_$LT$heapless..binary_heap..Hole$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he0161f26b80e90a5E"}
!23 = distinct !{!23, !24, !"_ZN4core3ptr59drop_in_place$LT$heapless..binary_heap..Hole$LT$i32$GT$$GT$17h40d1e04b26bff479E: %_1"}
!24 = distinct !{!24, !"_ZN4core3ptr59drop_in_place$LT$heapless..binary_heap..Hole$LT$i32$GT$$GT$17h40d1e04b26bff479E"}
!25 = !{!26, !18, !15}
!26 = distinct !{!26, !27, !"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$7sift_up17h2e099c53a2563c53E: %self"}
!27 = distinct !{!27, !"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$7sift_up17h2e099c53a2563c53E"}
!28 = !{!29}
!29 = distinct !{!29, !30, !"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$13pop_unchecked17h241fd8cac3324cbaE: %self"}
!30 = distinct !{!30, !"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$13pop_unchecked17h241fd8cac3324cbaE"}
!31 = !{!32, !29}
!32 = distinct !{!32, !33, !"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$19sift_down_to_bottom17ha9071025dd71343dE: %self"}
!33 = distinct !{!33, !"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$19sift_down_to_bottom17ha9071025dd71343dE"}
!34 = !{!35, !37}
!35 = distinct !{!35, !36, !"_ZN78_$LT$heapless..binary_heap..Hole$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he0161f26b80e90a5E: %self"}
!36 = distinct !{!36, !"_ZN78_$LT$heapless..binary_heap..Hole$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he0161f26b80e90a5E"}
!37 = distinct !{!37, !38, !"_ZN4core3ptr59drop_in_place$LT$heapless..binary_heap..Hole$LT$i32$GT$$GT$17h40d1e04b26bff479E: %_1"}
!38 = distinct !{!38, !"_ZN4core3ptr59drop_in_place$LT$heapless..binary_heap..Hole$LT$i32$GT$$GT$17h40d1e04b26bff479E"}
!39 = !{!40, !32, !29}
!40 = distinct !{!40, !41, !"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$7sift_up17h2e099c53a2563c53E: %self"}
!41 = distinct !{!41, !"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$7sift_up17h2e099c53a2563c53E"}
!42 = !{!43, !45}
!43 = distinct !{!43, !44, !"_ZN78_$LT$heapless..binary_heap..Hole$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he0161f26b80e90a5E: %self"}
!44 = distinct !{!44, !"_ZN78_$LT$heapless..binary_heap..Hole$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he0161f26b80e90a5E"}
!45 = distinct !{!45, !46, !"_ZN4core3ptr59drop_in_place$LT$heapless..binary_heap..Hole$LT$i32$GT$$GT$17h40d1e04b26bff479E: %_1"}
!46 = distinct !{!46, !"_ZN4core3ptr59drop_in_place$LT$heapless..binary_heap..Hole$LT$i32$GT$$GT$17h40d1e04b26bff479E"}
