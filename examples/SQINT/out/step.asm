	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"step.c"
	.def	_Step_Init;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Step_Init                      # -- Begin function Step_Init
	.p2align	4
_Step_Init:                             # @Step_Init
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB0_3
# %bb.1:
	cmpw	$0, 35(%eax)
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
	movw	%ax, 35(%ecx)
	movzwl	%ax, %eax
	pushl	$"??_C@_06EAEKDHGI@SQSTEP?$AA@"
	pushl	%eax
	pushl	$0
	calll	_Catalog
	addl	$12, %esp
	movl	$2, _status_step
	retl
                                        # -- End function
	.def	_Step_IsEnable;
	.scl	2;
	.type	32;
	.endef
	.globl	_Step_IsEnable                  # -- Begin function Step_IsEnable
	.p2align	4
_Step_IsEnable:                         # @Step_IsEnable
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB1_1
# %bb.3:
	cmpb	$0, 33(%eax)
	setne	%al
                                        # kill: def $al killed $al killed $eax
	retl
LBB1_1:
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	retl
                                        # -- End function
	.def	_Step_Enable;
	.scl	2;
	.type	32;
	.endef
	.globl	_Step_Enable                    # -- Begin function Step_Enable
	.p2align	4
_Step_Enable:                           # @Step_Enable
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB2_2
# %bb.1:
	movb	$1, 33(%eax)
	movl	$6, _status_step
	pushl	$1
	calll	_Indicate_STATE_STEP
	addl	$4, %esp
LBB2_2:
	retl
                                        # -- End function
	.def	_Step_Disable;
	.scl	2;
	.type	32;
	.endef
	.globl	_Step_Disable                   # -- Begin function Step_Disable
	.p2align	4
_Step_Disable:                          # @Step_Disable
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB3_4
# %bb.1:
	movb	$0, 33(%eax)
	movl	$2, _status_step
	movzwl	35(%eax), %eax
	pushl	%eax
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$4, %ax
	jne	LBB3_3
# %bb.2:
	movl	_sqtbl, %eax
	movzwl	35(%eax), %eax
	pushl	$1
	pushl	%eax
	calll	_ReleaseRtSemaphore
	addl	$8, %esp
LBB3_3:
	pushl	$0
	calll	_Indicate_STATE_STEP
	addl	$4, %esp
LBB3_4:
	retl
                                        # -- End function
	.def	_Step_Trigger;
	.scl	2;
	.type	32;
	.endef
	.globl	_Step_Trigger                   # -- Begin function Step_Trigger
	.p2align	4
_Step_Trigger:                          # @Step_Trigger
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB4_3
# %bb.1:
	movzwl	35(%eax), %eax
	pushl	%eax
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$4, %ax
	jne	LBB4_3
# %bb.2:
	movl	_sqtbl, %eax
	movzwl	35(%eax), %eax
	pushl	$1
	pushl	%eax
	calll	_ReleaseRtSemaphore
	addl	$8, %esp
LBB4_3:
	retl
                                        # -- End function
	.def	_Step_WaitTrigger;
	.scl	2;
	.type	32;
	.endef
	.globl	_Step_WaitTrigger               # -- Begin function Step_WaitTrigger
	.p2align	4
_Step_WaitTrigger:                      # @Step_WaitTrigger
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB5_4
# %bb.1:
	pushl	%esi
	movl	_status_step, %esi
	movzwl	35(%eax), %eax
	pushl	%eax
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$4, %ax
	jne	LBB5_3
# %bb.2:
	movl	$4, _status_step
	movl	_sqtbl, %eax
	movzwl	35(%eax), %eax
	pushl	$-1
	pushl	$1
	pushl	%eax
	calll	_WaitForRtSemaphore
	addl	$12, %esp
	movl	%esi, _status_step
LBB5_3:
	popl	%esi
LBB5_4:
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_status_step                    # @status_step
	.p2align	2, 0x0
_status_step:
	.long	0                               # 0x0

	.globl	_hStepSem                       # @hStepSem
	.p2align	1, 0x0
_hStepSem:
	.short	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_06EAEKDHGI@SQSTEP?$AA@"
	.globl	"??_C@_06EAEKDHGI@SQSTEP?$AA@"  # @"??_C@_06EAEKDHGI@SQSTEP?$AA@"
"??_C@_06EAEKDHGI@SQSTEP?$AA@":
	.asciz	"SQSTEP"

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
