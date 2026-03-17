	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"pause.c"
	.def	_Pause_Init;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Pause_Init                     # -- Begin function Pause_Init
	.p2align	4
_Pause_Init:                            # @Pause_Init
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB0_3
# %bb.1:
	cmpw	$0, 41(%eax)
	je	LBB0_2
LBB0_3:
	retl
LBB0_2:
	pushl	$0
	pushl	$1
	pushl	$0
	calll	_CreateRtSemaphore
	addl	$12, %esp
	movl	_sqtbl, %ecx
	movw	%ax, 41(%ecx)
	movzwl	%ax, %eax
	pushl	$"??_C@_06OAFNIPMP@SQSUSP?$AA@"
	pushl	%eax
	pushl	$0
	calll	_Catalog
	addl	$12, %esp
	movl	$2, _status_pause
	retl
                                        # -- End function
	.def	_Pause_IsEnable;
	.scl	2;
	.type	32;
	.endef
	.globl	_Pause_IsEnable                 # -- Begin function Pause_IsEnable
	.p2align	4
_Pause_IsEnable:                        # @Pause_IsEnable
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB1_1
# %bb.3:
	cmpb	$0, 39(%eax)
	setne	%al
                                        # kill: def $al killed $al killed $eax
	retl
LBB1_1:
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	retl
                                        # -- End function
	.def	_Pause_WaitTrigger;
	.scl	2;
	.type	32;
	.endef
	.globl	_Pause_WaitTrigger              # -- Begin function Pause_WaitTrigger
	.p2align	4
_Pause_WaitTrigger:                     # @Pause_WaitTrigger
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB2_4
# %bb.1:
	pushl	%esi
	movl	_status_pause, %esi
	movzwl	41(%eax), %eax
	pushl	%eax
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$4, %ax
	jne	LBB2_3
# %bb.2:
	movl	$4, _status_pause
	movl	_sqtbl, %eax
	movzwl	41(%eax), %eax
	pushl	$-1
	pushl	$1
	pushl	%eax
	calll	_WaitForRtSemaphore
	addl	$12, %esp
	movl	%esi, _status_pause
LBB2_3:
	popl	%esi
LBB2_4:
	retl
                                        # -- End function
	.def	_Pause_Enable;
	.scl	2;
	.type	32;
	.endef
	.globl	_Pause_Enable                   # -- Begin function Pause_Enable
	.p2align	4
_Pause_Enable:                          # @Pause_Enable
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB3_2
# %bb.1:
	movb	$1, 39(%eax)
	movl	$6, _status_pause
LBB3_2:
	retl
                                        # -- End function
	.def	_Pause_Disable;
	.scl	2;
	.type	32;
	.endef
	.globl	_Pause_Disable                  # -- Begin function Pause_Disable
	.p2align	4
_Pause_Disable:                         # @Pause_Disable
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB4_2
# %bb.1:
	movb	$0, 39(%eax)
	movl	$2, _status_pause
LBB4_2:
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_status_pause                   # @status_pause
	.p2align	2, 0x0
_status_pause:
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_06OAFNIPMP@SQSUSP?$AA@"
	.globl	"??_C@_06OAFNIPMP@SQSUSP?$AA@"  # @"??_C@_06OAFNIPMP@SQSUSP?$AA@"
"??_C@_06OAFNIPMP@SQSUSP?$AA@":
	.asciz	"SQSUSP"

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
