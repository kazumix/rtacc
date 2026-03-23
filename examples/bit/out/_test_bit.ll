; llst: simple ST -> LLVM IR memory=stack
define i32 @_test_bit() {
entry:
  %t1 = alloca i32
  store i32 0, ptr %t1
  %t2 = alloca i32
  store i32 0, ptr %t2
  %t3 = alloca i32
  store i32 0, ptr %t3
  %t4 = load i32, ptr %t1
  %t5 = lshr i32 %t4, 1
  %t6 = and i32 %t5, 1
  %t7 = icmp ne i32 %t6, 0
  %t8 = zext i1 %t7 to i32
  %t9 = load i32, ptr %t2
  %t10 = lshr i32 %t9, 1
  %t11 = and i32 %t10, 1
  %t12 = icmp ne i32 %t11, 0
  %t13 = zext i1 %t12 to i32
  %t14 = and i32 %t8, %t13
  %t15 = load i32, ptr %t3
  %t16 = shl i32 1, 8
  %t17 = xor i32 %t16, -1
  %t18 = and i32 %t15, %t17
  %t19 = icmp ne i32 %t14, 0
  %t20 = zext i1 %t19 to i32
  %t21 = shl i32 %t20, 8
  %t22 = or i32 %t18, %t21
  store i32 %t22, ptr %t3
  ret i32 0
}