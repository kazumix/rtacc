; llst: simple ST -> LLVM IR
define i32 @STloop() {
entry:
  %t1 = alloca i32
  store i32 0, ptr %t1
  %t2 = alloca [5 x i32]
  %t3 = getelementptr inbounds [5 x i32], ptr %t2, i32 0, i32 0
  store i32 1, ptr %t3
  %t4 = getelementptr inbounds [5 x i32], ptr %t2, i32 0, i32 1
  store i32 2, ptr %t4
  %t5 = getelementptr inbounds [5 x i32], ptr %t2, i32 0, i32 2
  store i32 3, ptr %t5
  %t6 = getelementptr inbounds [5 x i32], ptr %t2, i32 0, i32 3
  store i32 4, ptr %t6
  %t7 = getelementptr inbounds [5 x i32], ptr %t2, i32 0, i32 4
  store i32 5, ptr %t7
  %t8 = alloca i32
  store i32 0, ptr %t8
  %t9 = alloca i32
  store i32 0, ptr %t9
  br label %loop.10
loop.10:
  %t13 = load i32, ptr %t9
  %t14 = icmp sgt i32 %t13, 4
  br i1 %t14, label %end.12, label %forbody.11
forbody.11:
  %t15 = load i32, ptr %t1
  %t16 = load i32, ptr %t9
  %t17 = getelementptr inbounds [5 x i32], ptr %t2, i32 0, i32 %t16
  %t18 = load i32, ptr %t17
  %t19 = add i32 %t15, %t18
  store i32 %t19, ptr %t1
  %t20 = load i32, ptr %t9
  %t21 = add i32 %t20, 1
  store i32 %t21, ptr %t9
  br label %loop.10
end.12:
  %t22 = load i32, ptr %t1
  ret i32 %t22
}