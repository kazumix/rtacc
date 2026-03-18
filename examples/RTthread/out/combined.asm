	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"RTthread.c"
	.def	_thread1;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_thread1                        # -- Begin function thread1
	.p2align	4
_thread1:                               # @thread1
# %bb.0:
	pushl	$L_str
	calll	_puts
	addl	$4, %esp
	.p2align	4
LBB0_1:                                 # =>This Inner Loop Header: Depth=1
	pushl	$1000                           # imm = 0x3E8
	calll	_RtSleep
	addl	$4, %esp
	pushl	$L_str.1
	calll	_puts
	addl	$4, %esp
	jmp	LBB0_1
                                        # -- End function
	.def	_thread2;
	.scl	2;
	.type	32;
	.endef
	.globl	_thread2                        # -- Begin function thread2
	.p2align	4
_thread2:                               # @thread2
# %bb.0:
	pushl	$L_str.2
	calll	_puts
	addl	$4, %esp
	.p2align	4
LBB1_1:                                 # =>This Inner Loop Header: Depth=1
	pushl	$1500                           # imm = 0x5DC
	calll	_RtSleep
	addl	$4, %esp
	pushl	$L_str.3
	calll	_puts
	addl	$4, %esp
	jmp	LBB1_1
                                        # -- End function
	.def	_main;
	.scl	2;
	.type	32;
	.endef
	.globl	_main                           # -- Begin function main
	.p2align	4
_main:                                  # @main
# %bb.0:
	pushl	%esi
	pushl	$L_str.4
	calll	_puts
	addl	$4, %esp
	pushl	$0
	pushl	$4096                           # imm = 0x1000
	pushl	$_thread1
	pushl	$170
	calll	_CreateRtThread
	addl	$16, %esp
	movl	%eax, %esi
	pushl	$0
	pushl	$4096                           # imm = 0x1000
	pushl	$_thread2
	pushl	$172
	calll	_CreateRtThread
	addl	$16, %esp
	cmpw	$-1, %si
	je	LBB2_2
# %bb.1:
	cmpw	$-1, %ax
	je	LBB2_2
# %bb.3:
	pushl	$L_str.5
	calll	_puts
	addl	$4, %esp
	pushl	$0
	calll	_SuspendRtThread
	addl	$4, %esp
	xorl	%eax, %eax
	popl	%esi
	retl
LBB2_2:
	pushl	$L_str.6
	calll	_puts
	addl	$4, %esp
	movl	$-1, %eax
	popl	%esi
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.section	.rdata,"dr"
L_str:                                  # @str
	.asciz	"thread1 start"

L_str.1:                                # @str.1
	.asciz	"thread1 running"

L_str.2:                                # @str.2
	.asciz	"thread2 start"

L_str.3:                                # @str.3
	.asciz	"thread2 running"

L_str.4:                                # @str.4
	.asciz	"INtime RTthread test"

L_str.5:                                # @str.5
	.asciz	"CreateRtThread success"

L_str.6:                                # @str.6
	.asciz	"CreateRtThread failed"

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
	.short	1
	.short	0
	.short	22011                           # Backend version
	.short	0
	.short	0
	.short	0
	.asciz	"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)" # Null-terminated compiler version string
	.p2align	2, 0x0
Ltmp5:
Ltmp1:
	.p2align	2, 0x0
	.addrsig
	.addrsig_sym _thread1
	.addrsig_sym _thread2
