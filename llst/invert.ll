; llst: simple ST BOOL function -> LLVM IR
define i1 @NotBool(i1 %x) {
entry:
  %b1 = xor i1 %x, true
  ret i1 %b1
}