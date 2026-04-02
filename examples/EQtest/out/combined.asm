	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"llvm-link"
	.def	_main;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_main                           # -- Begin function main
	.p2align	4
_main:                                  # @main
# %bb.0:
	.p2align	4
LBB0_1:                                 # =>This Inner Loop Header: Depth=1
	movzbl	_il_mem_FALSE, %eax
	notb	%al
	andb	$1, %al
	cmpl	$0, _il_mem_TRUE
	movb	%al, _il_mem_NOT1
	sete	_il_mem_patturn6_1
	pushl	$1
	calll	_RtSleepEx
	addl	$4, %esp
	jmp	LBB0_1
                                        # -- End function
	.def	_ctu_step;
	.scl	2;
	.type	32;
	.endef
	.globl	_ctu_step                       # -- Begin function ctu_step
	.p2align	4
_ctu_step:                              # @ctu_step
# %bb.0:                                # %entry
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	40(%esp), %esi
	movl	20(%esp), %edi
	movl	24(%esp), %ebp
	movl	32(%esp), %eax
	movl	28(%esp), %ecx
	movl	36(%esp), %edx
	movzbl	(%edi), %ebx
	xorl	%edi, %edi
	movb	(%esi), %bh
	cmpb	$0, (%ebp)
	jne	LBB1_2
# %bb.1:                                # %entry
	movl	(%edx), %edi
LBB1_2:                                 # %entry
	notb	%bh
	andb	%bl, %bh
	movzbl	%bh, %ebp
	addl	%edi, %ebp
	cmpl	(%ecx), %ebp
	movl	%ebp, (%edx)
	movb	%bl, (%esi)
	setge	(%eax)
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_tp_step;
	.scl	2;
	.type	32;
	.endef
	.globl	_tp_step                        # -- Begin function tp_step
	.p2align	4
_tp_step:                               # @tp_step
# %bb.0:                                # %entry
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	20(%esp), %edi
	movl	32(%esp), %esi
	movl	24(%esp), %edx
	movl	36(%esp), %ebp
	movl	28(%esp), %ecx
	movzbl	(%edi), %ebx
	movl	%ebx, %eax
	addl	(%esi), %ebx
	cmpl	(%edx), %ebx
	movl	%ebx, (%esi)
	setge	%dl
	andb	%al, %dl
	movb	%dl, (%ecx)
	movb	%al, (%ebp)
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_ton_step;
	.scl	2;
	.type	32;
	.endef
	.globl	_ton_step                       # -- Begin function ton_step
	.p2align	4
_ton_step:                              # @ton_step
# %bb.0:                                # %entry
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	16(%esp), %edx
	movl	32(%esp), %eax
	movl	28(%esp), %ecx
	movl	24(%esp), %esi
	movzbl	(%edx), %edx
	testb	%dl, %dl
	je	LBB3_1
# %bb.3:                                # %ton_in_on
	cmpb	$0, (%eax)
	je	LBB3_1
# %bb.4:                                # %ton_hold
	movl	20(%esp), %edi
	movl	(%esi), %ebx
	movl	(%edi), %edi
	incl	%ebx
	cmpl	%edi, %ebx
	cmovgel	%edi, %ebx
	movl	%ebx, (%esi)
	setge	%bl
	jmp	LBB3_2
LBB3_1:                                 # %ton_in_off
	xorl	%ebx, %ebx
	movl	$0, (%esi)
LBB3_2:                                 # %common.ret
	movb	%bl, (%ecx)
	movb	%dl, (%eax)
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_r_trig_step;
	.scl	2;
	.type	32;
	.endef
	.globl	_r_trig_step                    # -- Begin function r_trig_step
	.p2align	4
_r_trig_step:                           # @r_trig_step
# %bb.0:                                # %entry
	movl	4(%esp), %edx
	movl	12(%esp), %ecx
	movl	8(%esp), %eax
	movzbl	(%edx), %edx
	movb	(%ecx), %dh
	notb	%dh
	andb	%dl, %dh
	movb	%dh, (%eax)
	movb	%dl, (%ecx)
	retl
                                        # -- End function
	.def	_f_trig_step;
	.scl	2;
	.type	32;
	.endef
	.globl	_f_trig_step                    # -- Begin function f_trig_step
	.p2align	4
_f_trig_step:                           # @f_trig_step
# %bb.0:                                # %entry
	movl	4(%esp), %edx
	movl	12(%esp), %ecx
	movl	8(%esp), %eax
	movzbl	(%edx), %edx
	movb	%dl, %dh
	notb	%dh
	andb	(%ecx), %dh
	andb	$1, %dh
	movb	%dh, (%eax)
	movb	%dl, (%ecx)
	retl
                                        # -- End function
	.def	_EQtest;
	.scl	2;
	.type	32;
	.endef
	.globl	_EQtest                         # -- Begin function EQtest
	.p2align	4
_EQtest:                                # @EQtest
# %bb.0:                                # %entry
	movzbl	_il_mem_FALSE, %eax
	notb	%al
	andb	$1, %al
	cmpl	$0, _il_mem_TRUE
	movb	%al, _il_mem_NOT1
	sete	_il_mem_patturn6_1
	xorl	%eax, %eax
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_il_mem_NOT1                    # @il_mem_NOT1
_il_mem_NOT1:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_NOT1                   # @il_slot_NOT1
	.p2align	2, 0x0
_il_slot_NOT1:
	.long	_il_mem_NOT1

	.bss
	.globl	_il_mem_patturn6_1              # @il_mem_patturn6_1
_il_mem_patturn6_1:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_patturn6_1             # @il_slot_patturn6_1
	.p2align	2, 0x0
_il_slot_patturn6_1:
	.long	_il_mem_patturn6_1

	.bss
	.globl	_il_mem_FALSE                   # @il_mem_FALSE
_il_mem_FALSE:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_FALSE                  # @il_slot_FALSE
	.p2align	2, 0x0
_il_slot_FALSE:
	.long	_il_mem_FALSE

	.bss
	.globl	_il_mem_TRUE                    # @il_mem_TRUE
	.p2align	2, 0x0
_il_mem_TRUE:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_TRUE                   # @il_slot_TRUE
	.p2align	2, 0x0
_il_slot_TRUE:
	.long	_il_mem_TRUE

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
	.addrsig_sym _il_mem_NOT1
	.addrsig_sym _il_mem_patturn6_1
	.addrsig_sym _il_mem_FALSE
	.addrsig_sym _il_mem_TRUE
