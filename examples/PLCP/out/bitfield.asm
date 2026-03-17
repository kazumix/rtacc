	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"bitfield.c"
	.def	_Bitfield_Check;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Bitfield_Check                 # -- Begin function Bitfield_Check
	.p2align	4
_Bitfield_Check:                        # @Bitfield_Check
# %bb.0:
	pushl	%esi
	pushl	%eax
	movl	12(%esp), %esi
	movl	16(%esp), %eax
	movb	$0, 2(%esi)
	movw	$0, (%esi)
	testl	%eax, %eax
	je	LBB0_4
# %bb.1:
	movl	$-1, (%esp)
	pushl	$46
	pushl	%eax
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB0_4
# %bb.2:
	movl	%esp, %ecx
	pushl	%ecx
	pushl	$"??_C@_04HGICJEGC@?4X?$CFd?$AA@"
	pushl	%eax
	calll	_sscanf
	addl	$12, %esp
	cmpl	$1, %eax
	sete	%cl
	movl	(%esp), %eax
	cmpl	$64, %eax
	setb	%dl
	andb	%cl, %dl
	cmpb	$1, %dl
	jne	LBB0_4
# %bb.3:
	movb	$1, (%esi)
	movb	%al, 1(%esi)
	movb	$0, 2(%esi)
LBB0_4:
	movl	%esi, %eax
	addl	$4, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_LD_byte;
	.scl	2;
	.type	32;
	.endef
	.globl	_LD_byte                        # -- Begin function LD_byte
	.p2align	4
_LD_byte:                               # @LD_byte
# %bb.0:
	pushl	%ebx
	movl	12(%esp), %ecx
	movl	8(%esp), %eax
	cmpb	$0, 12(%ecx)
	je	LBB1_2
# %bb.1:
	movl	(%ecx), %edx
	movzbl	(%edx), %edx
	movzbl	13(%ecx), %ecx
	btl	%ecx, %edx
	setb	%cl
	jmp	LBB1_3
LBB1_2:
	movl	(%ecx), %edx
	movzbl	(%edx), %edx
	movl	%edx, %ebx
	andb	$1, %bl
	cmpw	$1536, 4(%ecx)                  # imm = 0x600
	movzbl	%bl, %ecx
	cmovnel	%edx, %ecx
LBB1_3:
	movb	%cl, (%eax)
	popl	%ebx
	retl
                                        # -- End function
	.def	_LDN_byte;
	.scl	2;
	.type	32;
	.endef
	.globl	_LDN_byte                       # -- Begin function LDN_byte
	.p2align	4
_LDN_byte:                              # @LDN_byte
# %bb.0:
	movl	8(%esp), %ecx
	movl	4(%esp), %eax
	cmpb	$0, 12(%ecx)
	je	LBB2_2
# %bb.1:
	movl	(%ecx), %edx
	movzbl	(%edx), %edx
	movzbl	13(%ecx), %ecx
	shrl	%cl, %edx
	jmp	LBB2_3
LBB2_2:
	cmpw	$1536, 4(%ecx)                  # imm = 0x600
	movl	(%ecx), %ecx
	movzbl	(%ecx), %edx
	jne	LBB2_4
LBB2_3:
	notb	%dl
	andb	$1, %dl
	movb	%dl, (%eax)
	retl
LBB2_4:
	notb	%dl
	movb	%dl, (%eax)
	retl
                                        # -- End function
	.def	_LD_word;
	.scl	2;
	.type	32;
	.endef
	.globl	_LD_word                        # -- Begin function LD_word
	.p2align	4
_LD_word:                               # @LD_word
# %bb.0:
	pushl	%esi
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpb	$0, 12(%edx)
	movl	(%edx), %ecx
	movzwl	(%ecx), %ecx
	je	LBB3_2
# %bb.1:
	movzwl	%cx, %esi
	movzbl	13(%edx), %edx
	xorl	%ecx, %ecx
	btl	%edx, %esi
	setb	%cl
LBB3_2:
	movw	%cx, (%eax)
	popl	%esi
	retl
                                        # -- End function
	.def	_LDN_word;
	.scl	2;
	.type	32;
	.endef
	.globl	_LDN_word                       # -- Begin function LDN_word
	.p2align	4
_LDN_word:                              # @LDN_word
# %bb.0:
	pushl	%esi
	movl	12(%esp), %ecx
	movl	8(%esp), %eax
	cmpb	$0, 12(%ecx)
	movl	(%ecx), %edx
	movzwl	(%edx), %edx
	je	LBB4_2
# %bb.1:
	movzbl	13(%ecx), %esi
	xorl	%ecx, %ecx
	btl	%esi, %edx
	setae	%cl
	jmp	LBB4_3
LBB4_2:
	notl	%edx
	movl	%edx, %ecx
LBB4_3:
	movw	%cx, (%eax)
	popl	%esi
	retl
                                        # -- End function
	.def	_LD_dword;
	.scl	2;
	.type	32;
	.endef
	.globl	_LD_dword                       # -- Begin function LD_dword
	.p2align	4
_LD_dword:                              # @LD_dword
# %bb.0:
	pushl	%ebx
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpb	$0, 12(%edx)
	movl	(%edx), %ecx
	movl	(%ecx), %ecx
	je	LBB5_2
# %bb.1:
	movzbl	13(%edx), %edx
	xorl	%ebx, %ebx
	btl	%edx, %ecx
	setb	%bl
	movl	%ebx, %ecx
LBB5_2:
	movl	%ecx, (%eax)
	popl	%ebx
	retl
                                        # -- End function
	.def	_LDN_dword;
	.scl	2;
	.type	32;
	.endef
	.globl	_LDN_dword                      # -- Begin function LDN_dword
	.p2align	4
_LDN_dword:                             # @LDN_dword
# %bb.0:
	pushl	%esi
	movl	12(%esp), %ecx
	movl	8(%esp), %eax
	cmpb	$0, 12(%ecx)
	movl	(%ecx), %edx
	movl	(%edx), %edx
	je	LBB6_2
# %bb.1:
	movzbl	13(%ecx), %esi
	xorl	%ecx, %ecx
	btl	%esi, %edx
	setae	%cl
	jmp	LBB6_3
LBB6_2:
	notl	%edx
	movl	%edx, %ecx
LBB6_3:
	movl	%ecx, (%eax)
	popl	%esi
	retl
                                        # -- End function
	.def	_LD_qword;
	.scl	2;
	.type	32;
	.endef
	.globl	_LD_qword                       # -- Begin function LD_qword
	.p2align	4
_LD_qword:                              # @LD_qword
# %bb.0:
	movl	8(%esp), %eax
	pushl	(%eax)
	pushl	8(%esp)
	calll	_Variable_Copy64
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_LDN_qword;
	.scl	2;
	.type	32;
	.endef
	.globl	_LDN_qword                      # -- Begin function LDN_qword
	.p2align	4
_LDN_qword:                             # @LDN_qword
# %bb.0:
	movl	8(%esp), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	notl	%eax
	pushl	%eax
	pushl	8(%esp)
	calll	_Variable_Copy64
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_LD_string;
	.scl	2;
	.type	32;
	.endef
	.globl	_LD_string                      # -- Begin function LD_string
	.p2align	4
_LD_string:                             # @LD_string
# %bb.0:
	movl	8(%esp), %eax
	pushl	(%eax)
	pushl	8(%esp)
	calll	_String_Copy
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_ST_string;
	.scl	2;
	.type	32;
	.endef
	.globl	_ST_string                      # -- Begin function ST_string
	.p2align	4
_ST_string:                             # @ST_string
# %bb.0:
	movl	4(%esp), %eax
	pushl	8(%esp)
	pushl	(%eax)
	calll	_String_Copy
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_ST_byte;
	.scl	2;
	.type	32;
	.endef
	.globl	_ST_byte                        # -- Begin function ST_byte
	.p2align	4
_ST_byte:                               # @ST_byte
# %bb.0:
	pushl	%ebx
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpb	$0, 12(%eax)
	je	LBB11_2
# %bb.1:
	movzbl	13(%eax), %ecx
	movl	$1, %ebx
	shll	%cl, %ebx
	movl	(%eax), %ecx
	notb	%bl
	andb	%bl, (%ecx)
	movzbl	(%edx), %edx
	andl	$1, %edx
	movzbl	13(%eax), %ecx
	shll	%cl, %edx
	movl	(%eax), %eax
	orb	%dl, (%eax)
	popl	%ebx
	retl
LBB11_2:
	movzbl	(%edx), %ecx
	movl	(%eax), %eax
	movb	%cl, (%eax)
	popl	%ebx
	retl
                                        # -- End function
	.def	_STN_byte;
	.scl	2;
	.type	32;
	.endef
	.globl	_STN_byte                       # -- Begin function STN_byte
	.p2align	4
_STN_byte:                              # @STN_byte
# %bb.0:
	pushl	%ebx
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpb	$0, 12(%eax)
	je	LBB12_2
# %bb.1:
	movzbl	13(%eax), %ecx
	movl	$1, %ebx
	shll	%cl, %ebx
	movl	(%eax), %ecx
	notb	%bl
	andb	%bl, (%ecx)
	movzbl	(%edx), %edx
	notl	%edx
	andl	$1, %edx
	movzbl	13(%eax), %ecx
	shll	%cl, %edx
	movl	(%eax), %eax
	orb	%dl, (%eax)
	popl	%ebx
	retl
LBB12_2:
	movzbl	(%edx), %ecx
	notb	%cl
	movl	(%eax), %eax
	movb	%cl, (%eax)
	popl	%ebx
	retl
                                        # -- End function
	.def	_ST_word;
	.scl	2;
	.type	32;
	.endef
	.globl	_ST_word                        # -- Begin function ST_word
	.p2align	4
_ST_word:                               # @ST_word
# %bb.0:
	pushl	%esi
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpb	$0, 12(%eax)
	je	LBB13_2
# %bb.1:
	movzbl	13(%eax), %ecx
	movl	$-2, %esi
	roll	%cl, %esi
	movl	(%eax), %ecx
	andw	%si, (%ecx)
	movzwl	(%edx), %edx
	andl	$1, %edx
	movzbl	13(%eax), %ecx
	shll	%cl, %edx
	movl	(%eax), %eax
	orw	%dx, (%eax)
	popl	%esi
	retl
LBB13_2:
	movzwl	(%edx), %ecx
	movl	(%eax), %eax
	movw	%cx, (%eax)
	popl	%esi
	retl
                                        # -- End function
	.def	_STN_word;
	.scl	2;
	.type	32;
	.endef
	.globl	_STN_word                       # -- Begin function STN_word
	.p2align	4
_STN_word:                              # @STN_word
# %bb.0:
	pushl	%esi
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpb	$0, 12(%eax)
	je	LBB14_2
# %bb.1:
	movzbl	13(%eax), %ecx
	movl	$-2, %esi
	roll	%cl, %esi
	movl	(%eax), %ecx
	andw	%si, (%ecx)
	movzwl	(%edx), %edx
	notl	%edx
	andl	$1, %edx
	movzbl	13(%eax), %ecx
	shll	%cl, %edx
	movl	(%eax), %eax
	orw	%dx, (%eax)
	popl	%esi
	retl
LBB14_2:
	movzwl	(%edx), %ecx
	notl	%ecx
	movl	(%eax), %eax
	movw	%cx, (%eax)
	popl	%esi
	retl
                                        # -- End function
	.def	_ST_dword;
	.scl	2;
	.type	32;
	.endef
	.globl	_ST_dword                       # -- Begin function ST_dword
	.p2align	4
_ST_dword:                              # @ST_dword
# %bb.0:
	pushl	%esi
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpb	$0, 12(%eax)
	je	LBB15_2
# %bb.1:
	movzbl	13(%eax), %ecx
	movl	$-2, %esi
	roll	%cl, %esi
	movl	(%eax), %ecx
	andl	%esi, (%ecx)
	movl	(%edx), %edx
	andl	$1, %edx
	movzbl	13(%eax), %ecx
	shll	%cl, %edx
	movl	(%eax), %eax
	orl	%edx, (%eax)
	popl	%esi
	retl
LBB15_2:
	movl	(%edx), %ecx
	movl	(%eax), %eax
	movl	%ecx, (%eax)
	popl	%esi
	retl
                                        # -- End function
	.def	_STN_dword;
	.scl	2;
	.type	32;
	.endef
	.globl	_STN_dword                      # -- Begin function STN_dword
	.p2align	4
_STN_dword:                             # @STN_dword
# %bb.0:
	pushl	%esi
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpb	$0, 12(%eax)
	je	LBB16_2
# %bb.1:
	movzbl	13(%eax), %ecx
	movl	$-2, %esi
	roll	%cl, %esi
	movl	(%eax), %ecx
	andl	%esi, (%ecx)
	movl	(%edx), %edx
	notl	%edx
	andl	$1, %edx
	movzbl	13(%eax), %ecx
	shll	%cl, %edx
	movl	(%eax), %eax
	orl	%edx, (%eax)
	popl	%esi
	retl
LBB16_2:
	movl	(%edx), %ecx
	notl	%ecx
	movl	(%eax), %eax
	movl	%ecx, (%eax)
	popl	%esi
	retl
                                        # -- End function
	.def	_ST_qword;
	.scl	2;
	.type	32;
	.endef
	.globl	_ST_qword                       # -- Begin function ST_qword
	.p2align	4
_ST_qword:                              # @ST_qword
# %bb.0:
	movl	4(%esp), %eax
	pushl	8(%esp)
	pushl	(%eax)
	calll	_Variable_Copy64
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_STN_qword;
	.scl	2;
	.type	32;
	.endef
	.globl	_STN_qword                      # -- Begin function STN_qword
	.p2align	4
_STN_qword:                             # @STN_qword
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-8, %esp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	(%ecx), %edx
	movl	4(%ecx), %ecx
	notl	%ecx
	notl	%edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%esp, %ecx
	pushl	%ecx
	pushl	(%eax)
	calll	_Variable_Copy64
	addl	$8, %esp
	movl	%ebp, %esp
	popl	%ebp
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.section	.rdata,"dr",discard,"??_C@_04HGICJEGC@?4X?$CFd?$AA@"
	.globl	"??_C@_04HGICJEGC@?4X?$CFd?$AA@" # @"??_C@_04HGICJEGC@?4X?$CFd?$AA@"
"??_C@_04HGICJEGC@?4X?$CFd?$AA@":
	.asciz	".X%d"

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
