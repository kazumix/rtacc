; llil: IL -> LLVM IR (BOOL/INT/UINT/DWORD/TIME, ADD/GT/GE, CTU/TP, .Xn) memory=rtedge
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc"
@il_mem_dw1 = global i32 0, align 4
@il_slot_dw1 = global ptr null, align 4
@il_mem_dw2 = global i32 0, align 4
@il_slot_dw2 = global ptr null, align 4
@il_mem_dw3 = global i32 0, align 4
@il_slot_dw3 = global ptr null, align 4
define void @scan_slots_init() {
entry:
  ; rtedge: 将来はタグ解決。当面は stack と同じく @il_mem_* を指して動作させる。
  store ptr @il_mem_dw1, ptr @il_slot_dw1
  store ptr @il_mem_dw2, ptr @il_slot_dw2
  store ptr @il_mem_dw3, ptr @il_slot_dw3
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
define i32 @scan() {
entry:
  %ptr_dw1 = load ptr, ptr @il_slot_dw1
  %ptr_dw2 = load ptr, ptr @il_slot_dw2
  %ptr_dw3 = load ptr, ptr @il_slot_dw3
  %acc = alloca i1
  store i1 false, ptr %acc
  %int_acc = alloca i32
  store i32 0, ptr %int_acc
  %t1 = load i32, ptr %ptr_dw1
  %t2 = lshr i32 %t1, 1
  %t3 = and i32 %t2, 1
  %t4 = icmp ne i32 %t3, 0
  store i1 %t4, ptr %acc
  %t5 = load i1, ptr %acc
  %t6 = load i32, ptr %ptr_dw2
  %t7 = lshr i32 %t6, 1
  %t8 = and i32 %t7, 1
  %t9 = icmp ne i32 %t8, 0
  %t10 = and i1 %t5, %t9
  store i1 %t10, ptr %acc
  %t11 = load i1, ptr %acc
  %t12 = load i32, ptr %ptr_dw3
  %t13 = shl i32 1, 8
  %t14 = xor i32 %t13, -1
  %t15 = and i32 %t12, %t14
  %t16 = zext i1 %t11 to i32
  %t17 = shl i32 %t16, 8
  %t18 = or i32 %t15, %t17
  store i32 %t18, ptr %ptr_dw3
  ret i32 0
}