; ModuleID = 'lib.40b242b3fbb4bdb6-cgu.0'
source_filename = "lib.40b242b3fbb4bdb6-cgu.0"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i686-pc-windows-msvc"

; __rustc::rust_begin_unwind
; Function Attrs: nofree norecurse noreturn nosync nounwind memory(none) uwtable
define void @_RNvCs5QKde7ScR4H_7___rustc17rust_begin_unwind(ptr noalias noundef readonly align 4 captures(none) dereferenceable(12) %_1) unnamed_addr #0 {
start:
  br label %bb1

bb1:                                              ; preds = %bb1, %start
  br label %bb1
}

; Function Attrs: nounwind uwtable
define void @rust_thread1_entry(ptr noundef captures(address_is_null) %lp_param) unnamed_addr #1 {
start:
  %0 = icmp eq ptr %lp_param, null
  br i1 %0, label %bb5, label %bb6.preheader

bb6.preheader:                                    ; preds = %start
  %1 = atomicrmw add ptr %lp_param, i32 1 seq_cst, align 4
  tail call void @RtSleep(i32 noundef 50) #2
  %2 = atomicrmw add ptr %lp_param, i32 1 seq_cst, align 4
  tail call void @RtSleep(i32 noundef 50) #2
  %3 = atomicrmw add ptr %lp_param, i32 1 seq_cst, align 4
  tail call void @RtSleep(i32 noundef 50) #2
  %4 = atomicrmw add ptr %lp_param, i32 1 seq_cst, align 4
  tail call void @RtSleep(i32 noundef 50) #2
  %5 = atomicrmw add ptr %lp_param, i32 1 seq_cst, align 4
  tail call void @RtSleep(i32 noundef 50) #2
  %_16 = getelementptr inbounds nuw i8, ptr %lp_param, i32 4
  %6 = atomicrmw add ptr %_16, i32 1 seq_cst, align 4
  br label %bb5

bb5:                                              ; preds = %start, %bb6.preheader
  ret void
}

; Function Attrs: nounwind uwtable
define void @rust_thread2_entry(ptr noundef captures(address_is_null) %lp_param) unnamed_addr #1 {
start:
  %0 = icmp eq ptr %lp_param, null
  br i1 %0, label %bb5, label %bb6.preheader

bb6.preheader:                                    ; preds = %start
  %1 = atomicrmw add ptr %lp_param, i32 1 seq_cst, align 4
  tail call void @RtSleep(i32 noundef 30) #2
  %2 = atomicrmw add ptr %lp_param, i32 1 seq_cst, align 4
  tail call void @RtSleep(i32 noundef 30) #2
  %3 = atomicrmw add ptr %lp_param, i32 1 seq_cst, align 4
  tail call void @RtSleep(i32 noundef 30) #2
  %4 = atomicrmw add ptr %lp_param, i32 1 seq_cst, align 4
  tail call void @RtSleep(i32 noundef 30) #2
  %5 = atomicrmw add ptr %lp_param, i32 1 seq_cst, align 4
  tail call void @RtSleep(i32 noundef 30) #2
  %_16 = getelementptr inbounds nuw i8, ptr %lp_param, i32 4
  %6 = atomicrmw add ptr %_16, i32 1 seq_cst, align 4
  br label %bb5

bb5:                                              ; preds = %start, %bb6.preheader
  ret void
}

; Function Attrs: nounwind uwtable
declare void @RtSleep(i32 noundef) unnamed_addr #1

attributes #0 = { nofree norecurse noreturn nosync nounwind memory(none) uwtable "target-cpu"="pentium4" }
attributes #1 = { nounwind uwtable "target-cpu"="pentium4" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{!"rustc version 1.94.0 (4a4ef493e 2026-03-02)"}
