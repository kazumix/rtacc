; llil: IL -> LLVM IR (BOOL/INT/UINT/TIME, ADD/GT/GE, CTU/TP) memory=stack
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc"
@il_mem_GeResult = global i1 false, align 1
@il_slot_GeResult = global ptr null, align 4
define void @GEtest_slots_init() {
entry:
  ; memory=stack ワンタイム初期化（main から先に呼ぶ）。Rtedge 時はここでタグ→ptr を格納する予定。
  store ptr @il_mem_GeResult, ptr @il_slot_GeResult
  ret void
}
define void @ctu_step(ptr %cu, ptr %reset, ptr %pv, ptr %q, ptr %cv, ptr %prev_cu) {
entry:
  %cu_val = load i1, ptr %cu
  %reset_val = load i1, ptr %reset
  %pv_val = load i32, ptr %pv
  %cv_old = load i32, ptr %cv
  %prev = load i1, ptr %prev_cu
  ; if reset then cv_new = 0
  %cv_after_reset = select i1 %reset_val, i32 0, i32 %cv_old
  ; rising edge: cu and !prev
  %prev_not = xor i1 %prev, true
  %rise = and i1 %cu_val, %prev_not
  %cv_inc = add i32 %cv_after_reset, 1
  %cv_new = select i1 %rise, i32 %cv_inc, i32 %cv_after_reset
  store i32 %cv_new, ptr %cv
  store i1 %cu_val, ptr %prev_cu
  ; Q = (CV >= PV)
  %q_val = icmp sge i32 %cv_new, %pv_val
  store i1 %q_val, ptr %q
  ret void
}
define void @tp_step(ptr %in, ptr %pt, ptr %q, ptr %elapsed, ptr %running) {
entry:
  %in_val = load i1, ptr %in
  %pt_val = load i32, ptr %pt
  %elapsed_val = load i32, ptr %elapsed
  %running_val = load i1, ptr %running
  ; running and in: elapsed++
  %el_inc = add i32 %elapsed_val, 1
  %el_new = select i1 %in_val, i32 %el_inc, i32 %elapsed_val
  ; Q = (elapsed >= pt) while running
  %done = icmp sge i32 %el_new, %pt_val
  %q_val = and i1 %in_val, %done
  store i32 %el_new, ptr %elapsed
  store i1 %q_val, ptr %q
  ; running = in (簡易: 毎周期 in が true ならカウント続行)
  store i1 %in_val, ptr %running
  ret void
}
define i32 @GEtest() {
entry:
  %ptr_GeResult = load ptr, ptr @il_slot_GeResult
  %acc = alloca i1
  store i1 false, ptr %acc
  %int_acc = alloca i32
  store i32 0, ptr %int_acc
  store i32 10, ptr %int_acc
  %t1 = load i32, ptr %int_acc
  %t2 = add i32 %t1, 5
  store i32 %t2, ptr %int_acc
  %t3 = load i32, ptr %int_acc
  %t4 = icmp uge i32 %t3, 14
  store i1 %t4, ptr %acc
  %t5 = load i1, ptr %acc
  store i1 %t5, ptr %ptr_GeResult
  ret i32 0
}