	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"exception.c"
	.def	_Exception_Init;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Exception_Init                 # -- Begin function Exception_Init
	.p2align	4
_Exception_Init:                        # @Exception_Init
# %bb.0:
	movb	$0, _exceptionNOW
	retl
                                        # -- End function
	.def	_Exception_Set;
	.scl	2;
	.type	32;
	.endef
	.globl	__xmm@00000000000000000000007900000000 # -- Begin function Exception_Set
	.section	.rdata,"dr",discard,__xmm@00000000000000000000007900000000
	.p2align	4, 0x0
__xmm@00000000000000000000007900000000:
	.long	0                               # 0x0
	.long	121                             # 0x79
	.long	0                               # 0x0
	.long	0                               # 0x0
	.text
	.globl	_Exception_Set
	.p2align	4
_Exception_Set:                         # @Exception_Set
# %bb.0:
	cmpb	$0, _exceptionNOW
	jne	LBB1_2
# %bb.1:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	24(%esp), %esi
	movl	20(%esp), %edi
	movl	16(%esp), %ebx
	subl	$24, %esp
	movsd	__xmm@00000000000000000000007900000000, %xmm0 # xmm0 = [0,121,0,0]
	movups	%xmm0, (%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	calll	_Api_Request
	addl	$24, %esp
	movb	$1, _exceptionNOW
	pushl	%edi
	pushl	%ebx
	pushl	%esi
	calll	_Errorlog_Add
	addl	$12, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
LBB1_2:
	retl
                                        # -- End function
	.def	_Exception_Clear;
	.scl	2;
	.type	32;
	.endef
	.globl	_Exception_Clear                # -- Begin function Exception_Clear
	.p2align	4
_Exception_Clear:                       # @Exception_Clear
# %bb.0:
	movb	$0, _exceptionNOW
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_status_exception               # @status_exception
	.p2align	2, 0x0
_status_exception:
	.long	0                               # 0x0

	.lcomm	_exceptionNOW,1                 # @exceptionNOW
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
