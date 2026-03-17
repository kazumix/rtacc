	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"main.c"
	.def	_main;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_main                           # -- Begin function main
	.p2align	4
_main:                                  # @main
# %bb.0:
	pushl	%esi
	subl	$8, %esp
	movl	$0, 4(%esp)
	movl	$0, (%esp)
	movl	%esp, %esi
	pushl	%esi
	pushl	$4096                           # imm = 0x1000
	pushl	$_rust_thread1_entry
	pushl	$0
	calll	_CreateRtThread
	addl	$16, %esp
	cmpw	$-1, %ax
	je	LBB0_1
# %bb.3:
	pushl	%esi
	pushl	$4096                           # imm = 0x1000
	pushl	$_rust_thread2_entry
	pushl	$0
	calll	_CreateRtThread
	addl	$16, %esp
	cmpw	$-1, %ax
	je	LBB0_8
# %bb.4:
	movl	4(%esp), %eax
	cmpl	$1, %eax
	jg	LBB0_6
	.p2align	4
LBB0_5:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	$100
	calll	_RtSleep
	addl	$4, %esp
	movl	4(%esp), %eax
	cmpl	$2, %eax
	jl	LBB0_5
LBB0_6:                                 # %.loopexit
	pushl	(%esp)
	pushl	$"??_C@_0CM@HOMIGEAF@RustRta?3?5shared?4counter?5?$DN?5?$CFd?5?$CIex@"
	calll	_printf
	addl	$8, %esp
	xorl	%eax, %eax
	jmp	LBB0_7
LBB0_1:
	pushl	$L_str.1
	jmp	LBB0_2
LBB0_8:
	pushl	$L_str
LBB0_2:
	calll	_puts
	addl	$4, %esp
	movl	$1, %eax
LBB0_7:
	addl	$8, %esp
	popl	%esi
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.section	.rdata,"dr",discard,"??_C@_0CM@HOMIGEAF@RustRta?3?5shared?4counter?5?$DN?5?$CFd?5?$CIex@"
	.globl	"??_C@_0CM@HOMIGEAF@RustRta?3?5shared?4counter?5?$DN?5?$CFd?5?$CIex@" # @"??_C@_0CM@HOMIGEAF@RustRta?3?5shared?4counter?5?$DN?5?$CFd?5?$CIex@"
"??_C@_0CM@HOMIGEAF@RustRta?3?5shared?4counter?5?$DN?5?$CFd?5?$CIex@":
	.asciz	"RustRta: shared.counter = %d (expected 10)\n"

	.section	.rdata,"dr"
L_str:                                  # @str
	.asciz	"CreateRtThread(2) failed"

L_str.1:                                # @str.1
	.asciz	"CreateRtThread(1) failed"

	.section	.debug$S,"dr"
	.p2align	2, 0x0
	.long	4                               # Debug section magic
	.long	241
	.long	Ltmp1-Ltmp0                     # Subsection size
Ltmp0:
	.short	Ltmp3-Ltmp2                     # Record length
Ltmp2:
	.short	4353                            # Record kind: S_OBJNAME
	.long	0                               # Signature
	.byte	0                               # Object name
	.p2align	2, 0x0
Ltmp3:
	.short	Ltmp5-Ltmp4                     # Record length
Ltmp4:
	.short	4412                            # Record kind: S_COMPILE3
	.long	0                               # Flags and language
	.short	7                               # CPUType
	.short	22                              # Frontend version
	.short	1
	.short	0
	.short	0
	.short	22010                           # Backend version
	.short	0
	.short	0
	.short	0
	.asciz	"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)" # Null-terminated compiler version string
	.p2align	2, 0x0
Ltmp5:
Ltmp1:
	.p2align	2, 0x0
	.addrsig
	.addrsig_sym _rust_thread1_entry
	.addrsig_sym _rust_thread2_entry
