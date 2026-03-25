; ビット類
@M621 = global i1 false
@M133 = global i1 false
@M145 = global i1 false
@M400 = global i1 false
@M517 = global i1 false
@M516 = global i1 false
@M520 = global i1 false
@M521 = global i1 false

; Timer 構造体: { i32 preset_ms, i32 elapsed_ms, i1 running, i1 done }
%Timer = type { i32, i32, i1, i1 }

@T26 = global %Timer { i32 0, i32 0, i1 false, i1 false } ; preset 不明のため一旦 0
@T27 = global %Timer { i32 5, i32 0, i1 false, i1 false } ; K5（ms想定）
@T28 = global %Timer { i32 80, i32 0, i1 false, i1 false } ; K80（ms想定）

define void @update_timer(%Timer* %t, i32 %dt_ms) {
entry:
  ; t->running を読む
  %running_ptr = getelementptr inbounds %Timer, %Timer* %t, i32 0, i32 2
  %running = load i1, i1* %running_ptr
  br i1 %running, label %running_blk, label %end

running_blk:
  ; elapsed += dt_ms
  %elapsed_ptr = getelementptr inbounds %Timer, %Timer* %t, i32 0, i32 1
  %elapsed = load i32, i32* %elapsed_ptr
  %new_elapsed = add i32 %elapsed, %dt_ms
  store i32 %new_elapsed, i32* %elapsed_ptr

  ; if (elapsed >= preset)
  %preset_ptr = getelementptr inbounds %Timer, %Timer* %t, i32 0, i32 0
  %preset = load i32, i32* %preset_ptr
  %cmp = icmp sge i32 %new_elapsed, %preset
  br i1 %cmp, label %done_blk, label %end

done_blk:
  ; done = true, running = false
  %done_ptr = getelementptr inbounds %Timer, %Timer* %t, i32 0, i32 3
  store i1 true, i1* %done_ptr
  store i1 false, i1* %running_ptr
  br label %end

end:
  ret void
}

define void @scan(i32 %dt_ms) {
entry:
  ; タイマ更新
  call void @update_timer(%Timer* @T26, i32 %dt_ms)
  call void @update_timer(%Timer* @T27, i32 %dt_ms)
  call void @update_timer(%Timer* @T28, i32 %dt_ms)

  ; M621, M133, M400 を読む
  %M621_val = load i1, i1* @M621
  %M133_val = load i1, i1* @M133
  %M400_val = load i1, i1* @M400

  ; if (M621 && M133 && !M400) M400 = true;
  %not_M400 = xor i1 %M400_val, true
  %start_cond_a = and i1 %M621_val, %M133_val
  %start_cond = and i1 %start_cond_a, %not_M400
  br i1 %start_cond, label %set_M400, label %after_start

set_M400:
  store i1 true, i1* @M400
  ; T26 は当面 preset=0 扱いにして、完了接点として即時有効化する
  %T26_elapsed_ptr0 = getelementptr inbounds %Timer, %Timer* @T26, i32 0, i32 1
  store i32 0, i32* %T26_elapsed_ptr0
  %T26_running_ptr0 = getelementptr inbounds %Timer, %Timer* @T26, i32 0, i32 2
  store i1 false, i1* %T26_running_ptr0
  %T26_done_ptr0 = getelementptr inbounds %Timer, %Timer* @T26, i32 0, i32 3
  store i1 true, i1* %T26_done_ptr0
  br label %after_start

after_start:
  %M400_now = load i1, i1* @M400
  br i1 %M400_now, label %seq_active, label %seq_end

seq_active:
  ; ラダー: M517 は「!M520 && M621 && M133 && T26(done) && !M516」の成立で ON
  %M520_val = load i1, i1* @M520
  %not_M520 = xor i1 %M520_val, true
  %M516_val = load i1, i1* @M516
  %not_M516 = xor i1 %M516_val, true

  %T26_done_ptr = getelementptr inbounds %Timer, %Timer* @T26, i32 0, i32 3
  %T26_done = load i1, i1* %T26_done_ptr

  %en_a = and i1 %not_M520, %T26_done
  %en_b = and i1 %en_a, %M621_val
  %en_c = and i1 %en_b, %M133_val
  %en_d = and i1 %en_c, %not_M516
  br i1 %en_d, label %lift_down_active, label %lift_down_done

lift_down_active:
  store i1 true, i1* @M517
  br label %after_lift

lift_down_done:
  store i1 false, i1* @M517
  br label %after_lift

after_lift:
  ; T27 は「M145 かつ M517 動作中」で開始し、done 後に次状態へ。
  %M145_val = load i1, i1* @M145

  %T27_running_ptr = getelementptr inbounds %Timer, %Timer* @T27, i32 0, i32 2
  %T27_running_val = load i1, i1* %T27_running_ptr
  %not_T27_running = xor i1 %T27_running_val, true

  %T27_done_ptr = getelementptr inbounds %Timer, %Timer* @T27, i32 0, i32 3
  %T27_done_val = load i1, i1* %T27_done_ptr
  %not_T27_done = xor i1 %T27_done_val, true

  %start_t27_a = and i1 %M145_val, %not_T27_running
  %start_t27_cond = and i1 %start_t27_a, %not_T27_done
  br i1 %start_t27_cond, label %start_t27, label %check_t27_done

start_t27:
  ; elapsed=0, done=false, running=true
  %T27_elapsed_ptr = getelementptr inbounds %Timer, %Timer* @T27, i32 0, i32 1
  store i32 0, i32* %T27_elapsed_ptr
  store i1 false, i1* %T27_done_ptr
  store i1 true, i1* %T27_running_ptr
  br label %check_t27_done

check_t27_done:
  %T27_done_ptr2 = getelementptr inbounds %Timer, %Timer* @T27, i32 0, i32 3
  %T27_done = load i1, i1* %T27_done_ptr2
  br i1 %T27_done, label %claw_seq, label %check_end

claw_seq:
  ; ツメ出しパルス（1 スキャン分）
  store i1 true, i1* @M521
  store i1 false, i1* @M521

  ; M520 を立ててリフトダウン完了状態へ
  store i1 true, i1* @M520

  ; T27 をリセット（次回の再トリガ防止）
  %T27_elapsed_ptr3 = getelementptr inbounds %Timer, %Timer* @T27, i32 0, i32 1
  store i32 0, i32* %T27_elapsed_ptr3
  store i1 false, i1* %T27_running_ptr
  store i1 false, i1* %T27_done_ptr

  ; T28 を起動（ツメ出し後の待ち）
  %T28_elapsed_ptr = getelementptr inbounds %Timer, %Timer* @T28, i32 0, i32 1
  %T28_running_ptr = getelementptr inbounds %Timer, %Timer* @T28, i32 0, i32 2
  %T28_done_ptr = getelementptr inbounds %Timer, %Timer* @T28, i32 0, i32 3
  store i32 0, i32* %T28_elapsed_ptr
  store i1 false, i1* %T28_done_ptr
  store i1 true, i1* %T28_running_ptr
  br label %check_end

check_end:
  ; T28.done でリフト上昇 → 終了
  %T28_done_ptr2 = getelementptr inbounds %Timer, %Timer* @T28, i32 0, i32 3
  %T28_done = load i1, i1* %T28_done_ptr2
  br i1 %T28_done, label %finish_seq, label %seq_end

finish_seq:
  ; 停止パルス
  store i1 true, i1* @M516
  store i1 false, i1* @M516

  store i1 false, i1* @M400
  store i1 false, i1* @M520

  ; T26 をリセットして次シーケンスへ
  %T26_elapsed_ptr4 = getelementptr inbounds %Timer, %Timer* @T26, i32 0, i32 1
  store i32 0, i32* %T26_elapsed_ptr4
  %T26_running_ptr4 = getelementptr inbounds %Timer, %Timer* @T26, i32 0, i32 2
  store i1 false, i1* %T26_running_ptr4
  %T26_done_ptr4 = getelementptr inbounds %Timer, %Timer* @T26, i32 0, i32 3
  store i1 false, i1* %T26_done_ptr4

  ; T27/T28 をリセットして次シーケンスへ
  %T27_elapsed_ptr4 = getelementptr inbounds %Timer, %Timer* @T27, i32 0, i32 1
  %T27_running_ptr4 = getelementptr inbounds %Timer, %Timer* @T27, i32 0, i32 2
  %T27_done_ptr4 = getelementptr inbounds %Timer, %Timer* @T27, i32 0, i32 3
  store i32 0, i32* %T27_elapsed_ptr4
  store i1 false, i1* %T27_running_ptr4
  store i1 false, i1* %T27_done_ptr4

  %T28_elapsed_ptr2 = getelementptr inbounds %Timer, %Timer* @T28, i32 0, i32 1
  %T28_running_ptr2 = getelementptr inbounds %Timer, %Timer* @T28, i32 0, i32 2
  %T28_done_ptr3 = getelementptr inbounds %Timer, %Timer* @T28, i32 0, i32 3
  store i32 0, i32* %T28_elapsed_ptr2
  store i1 false, i1* %T28_running_ptr2
  store i1 false, i1* %T28_done_ptr3

  br label %seq_end

seq_end:
  ret void
}
