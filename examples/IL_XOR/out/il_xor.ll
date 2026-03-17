; llst: simple ST BOOL function -> LLVM IR
define i1 @XOR_FUNC( i1 %A, i1 %B ) {
entry:
  %b1 = xor i1 %A, %B
  ret i1 %b1
}