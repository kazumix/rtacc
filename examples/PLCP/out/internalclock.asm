	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"internalclock.c"
	.def	_InternalClock_GetUsecs;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_InternalClock_GetUsecs         # -- Begin function InternalClock_GetUsecs
	.p2align	4
_InternalClock_GetUsecs:                # @InternalClock_GetUsecs
# %bb.0:
	movl	_dwKtickInUsecs, %eax
	retl
                                        # -- End function
	.def	_InternalClock_Wait;
	.scl	2;
	.type	32;
	.endef
	.globl	_InternalClock_Wait             # -- Begin function InternalClock_Wait
	.p2align	4
_InternalClock_Wait:                    # @InternalClock_Wait
# %bb.0:
	pushl	$1
	calll	_knRtSleep
	addl	$4, %esp
	retl
                                        # -- End function
	.def	_InternalClock_IsPlcFireTiming;
	.scl	2;
	.type	32;
	.endef
	.globl	_InternalClock_IsPlcFireTiming  # -- Begin function InternalClock_IsPlcFireTiming
	.p2align	4
_InternalClock_IsPlcFireTiming:         # @InternalClock_IsPlcFireTiming
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	calll	_Config_Get_ScanFreq
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	divl	_dwKtickInUsecs
	cmpl	%eax, %esi
	cmovbl	%esi, %ecx
	movl	%ecx, %eax
	popl	%esi
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.data
	.globl	_status_internalclock           # @status_internalclock
	.p2align	2, 0x0
_status_internalclock:
	.long	2                               # 0x2

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
