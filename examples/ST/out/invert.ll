; llst: simple ST BOOL function -> LLVM IR memory=stack
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc"
define i1 @NotBool( i1 %x ) {
entry:
  %b1 = xor i1 %x, true
  ret i1 %b1
}