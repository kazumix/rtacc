	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"comment.c"
	.def	_Comment_ClearNest;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Comment_ClearNest              # -- Begin function Comment_ClearNest
	.p2align	4
_Comment_ClearNest:                     # @Comment_ClearNest
# %bb.0:
	movl	$0, _commentnest
	retl
                                        # -- End function
	.def	_Comment_SearchBracket;
	.scl	2;
	.type	32;
	.endef
	.globl	_Comment_SearchBracket          # -- Begin function Comment_SearchBracket
	.p2align	4
_Comment_SearchBracket:                 # @Comment_SearchBracket
# %bb.0:
	movl	8(%esp), %ecx
	movl	4(%esp), %edx
	jmp	LBB1_1
	.p2align	4
LBB1_7:                                 #   in Loop: Header=BB1_1 Depth=1
	cmpb	$41, 1(%edx)
	je	LBB1_8
LBB1_10:                                #   in Loop: Header=BB1_1 Depth=1
	incl	%edx
LBB1_1:                                 # =>This Inner Loop Header: Depth=1
	movzbl	(%edx), %eax
	cmpl	$40, %eax
	je	LBB1_5
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	cmpl	$42, %eax
	je	LBB1_7
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	testl	%eax, %eax
	jne	LBB1_10
	jmp	LBB1_4
	.p2align	4
LBB1_5:                                 #   in Loop: Header=BB1_1 Depth=1
	cmpb	$42, 1(%edx)
	jne	LBB1_10
# %bb.6:
	movl	$1, %eax
	movl	%edx, (%ecx)
	retl
LBB1_4:
	xorl	%edx, %edx
	movl	%edx, (%ecx)
	retl
LBB1_8:
	movl	$2, %eax
	movl	%edx, (%ecx)
	retl
                                        # -- End function
	.def	_Comment_ProcessBracket;
	.scl	2;
	.type	32;
	.endef
	.globl	_Comment_ProcessBracket         # -- Begin function Comment_ProcessBracket
	.p2align	4
_Comment_ProcessBracket:                # @Comment_ProcessBracket
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	xorl	%eax, %eax
	movl	16(%esp), %esi
	movl	%esi, %edi
	xorl	%ecx, %ecx
	jmp	LBB2_1
	.p2align	4
LBB2_6:                                 #   in Loop: Header=BB2_1 Depth=1
	cmpb	$41, (%edi)
	je	LBB2_7
LBB2_1:                                 # =>This Inner Loop Header: Depth=1
	incl	%edi
	movzbl	-1(%edi), %edx
	cmpl	$40, %edx
	je	LBB2_8
# %bb.2:                                #   in Loop: Header=BB2_1 Depth=1
	cmpl	$42, %edx
	je	LBB2_6
# %bb.3:                                #   in Loop: Header=BB2_1 Depth=1
	testl	%edx, %edx
	jne	LBB2_1
	jmp	LBB2_4
	.p2align	4
LBB2_8:                                 #   in Loop: Header=BB2_1 Depth=1
	cmpb	$42, (%edi)
	jne	LBB2_1
# %bb.9:                                #   in Loop: Header=BB2_1 Depth=1
	movl	_commentnest, %edx
	leal	1(%edx), %ebx
	movl	%ebx, _commentnest
	leal	-1(%edi), %ebx
	testl	%edx, %edx
	cmovel	%ebx, %ecx
	jmp	LBB2_10
LBB2_7:                                 #   in Loop: Header=BB2_1 Depth=1
	decl	_commentnest
	cmovel	%edi, %eax
LBB2_10:                                #   in Loop: Header=BB2_1 Depth=1
	incl	%edi
	testl	%ecx, %ecx
	je	LBB2_1
# %bb.11:                               #   in Loop: Header=BB2_1 Depth=1
	testl	%eax, %eax
	je	LBB2_1
# %bb.12:                               #   in Loop: Header=BB2_1 Depth=1
	subl	%ecx, %eax
	incl	%eax
	pushl	%eax
	pushl	$32
	pushl	%ecx
	calll	_memset
	addl	$12, %esp
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	jmp	LBB2_1
LBB2_4:
	testl	%ecx, %ecx
	je	LBB2_13
# %bb.5:
	movb	$0, (%ecx)
	jmp	LBB2_17
LBB2_13:
	testl	%eax, %eax
	je	LBB2_15
# %bb.14:
	subl	%esi, %eax
	incl	%eax
	pushl	%eax
	pushl	$32
	pushl	%esi
	calll	_memset
	addl	$12, %esp
	jmp	LBB2_17
LBB2_15:
	cmpl	$0, _commentnest
	jle	LBB2_17
# %bb.16:
	movb	$0, (%esi)
LBB2_17:
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.lcomm	_commentnest,4,4                # @commentnest
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
