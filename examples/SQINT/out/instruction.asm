	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"instruction.c"
	.def	_push;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_push                           # -- Begin function push
	.p2align	4
_push:                                  # @push
# %bb.0:
	pushl	%ebx
	movzbl	8(%esp), %ebx
	movl	_stackptr, %eax
	movb	%bl, _stack(%eax)
	leal	1(%eax), %ecx
	movl	%ecx, _stackptr
	cmpl	$256, %eax                      # imm = 0x100
	jl	LBB0_2
# %bb.1:
	pushl	$"??_C@_00CNPNBAHC@?$AA@"
	pushl	$288                            # imm = 0x120
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	pushl	$"??_C@_09FOLKACJL@STACKOVER?$AA@"
	calll	_INtime_Halt
	addl	$4, %esp
LBB0_2:
	movl	%ebx, %eax
	popl	%ebx
	retl
                                        # -- End function
	.def	_pop;
	.scl	2;
	.type	32;
	.endef
	.globl	_pop                            # -- Begin function pop
	.p2align	4
_pop:                                   # @pop
# %bb.0:
	movl	_stackptr, %eax
	testl	%eax, %eax
	jg	LBB1_2
# %bb.1:
	pushl	$"??_C@_00CNPNBAHC@?$AA@"
	pushl	$289                            # imm = 0x121
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	pushl	$"??_C@_0L@LMAGOADG@STACKUNDER?$AA@"
	calll	_INtime_Halt
	addl	$4, %esp
	movl	_stackptr, %eax
LBB1_2:
	leal	-1(%eax), %ecx
	movl	%ecx, _stackptr
	movzbl	_stack-1(%eax), %eax
	retl
                                        # -- End function
	.def	_NOP;
	.scl	2;
	.type	32;
	.endef
	.globl	_NOP                            # -- Begin function NOP
	.p2align	4
_NOP:                                   # @NOP
# %bb.0:
	movl	4(%esp), %eax
	retl
                                        # -- End function
	.def	_LD;
	.scl	2;
	.type	32;
	.endef
	.globl	_LD                             # -- Begin function LD
	.p2align	4
_LD:                                    # @LD
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	16(%esp), %edi
	movl	12(%esp), %esi
	movzwl	4(%edi), %eax
	cmpl	$32769, %eax                    # imm = 0x8001
	jne	LBB3_2
# %bb.1:
	movl	(%edi), %eax
	movl	(%eax), %edi
	movzwl	4(%edi), %eax
LBB3_2:
	movw	%ax, 4(%esi)
	pushl	%edi
	calll	_Type_GetSize
	addl	$4, %esp
	movzwl	%ax, %eax
	leal	-1(%eax), %ecx
	cmpl	$7, %ecx
	ja	LBB3_3
# %bb.5:
	jmpl	*LJTI3_0(,%ecx,4)
LBB3_6:
	pushl	%edi
	pushl	(%esi)
	calll	_LD_byte
	jmp	LBB3_10
LBB3_3:
	cmpl	$83, %eax
	jne	LBB3_11
# %bb.4:
	pushl	%edi
	pushl	(%esi)
	calll	_LD_string
	jmp	LBB3_10
LBB3_8:
	pushl	%edi
	pushl	(%esi)
	calll	_LD_dword
	jmp	LBB3_10
LBB3_9:
	pushl	%edi
	pushl	(%esi)
	calll	_LD_qword
	jmp	LBB3_10
LBB3_7:
	pushl	%edi
	pushl	(%esi)
	calll	_LD_word
LBB3_10:
	addl	$8, %esp
LBB3_11:
	cmpb	$0, 12(%edi)
	je	LBB3_13
# %bb.12:
	movb	$1, 12(%esi)
	movzbl	13(%edi), %eax
	movb	%al, 13(%esi)
	movl	(%edi), %ecx
	movl	(%ecx), %ecx
	btl	%eax, %ecx
	setb	14(%esi)
	leal	14(%esi), %eax
	movw	$1536, 4(%esi)                  # imm = 0x600
	movl	%eax, (%esi)
LBB3_13:
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	retl
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI3_0:
	.long	LBB3_6
	.long	LBB3_7
	.long	LBB3_11
	.long	LBB3_8
	.long	LBB3_11
	.long	LBB3_11
	.long	LBB3_11
	.long	LBB3_9
                                        # -- End function
	.def	_LDN;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_LDN                            # -- Begin function LDN
	.p2align	4
_LDN:                                   # @LDN
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	16(%esp), %edi
	movl	12(%esp), %esi
	movzwl	4(%edi), %eax
	movw	%ax, 4(%esi)
	pushl	%edi
	calll	_Type_GetSize
	addl	$4, %esp
	movzwl	%ax, %eax
	leal	-1(%eax), %ecx
	movl	%eax, %edx
	xorl	%ecx, %edx
	cmpl	%ecx, %edx
	jbe	LBB4_8
# %bb.1:
	rep		bsfl	%eax, %eax
	cmpl	$3, %eax
	ja	LBB4_8
# %bb.2:
	jmpl	*LJTI4_0(,%eax,4)
LBB4_3:
	pushl	%edi
	pushl	(%esi)
	calll	_LDN_byte
	jmp	LBB4_7
LBB4_5:
	pushl	%edi
	pushl	(%esi)
	calll	_LDN_dword
	jmp	LBB4_7
LBB4_6:
	pushl	%edi
	pushl	(%esi)
	calll	_LDN_qword
	jmp	LBB4_7
LBB4_4:
	pushl	%edi
	pushl	(%esi)
	calll	_LDN_word
LBB4_7:
	addl	$8, %esp
LBB4_8:
	cmpb	$0, 12(%edi)
	je	LBB4_10
# %bb.9:
	movb	$1, 12(%esi)
	movzbl	13(%edi), %ecx
	movb	%cl, 13(%esi)
	movl	(%edi), %eax
	movl	(%eax), %eax
	shrl	%cl, %eax
	notb	%al
	orb	$-2, %al
	leal	14(%esi), %ecx
	movb	%al, 14(%esi)
	movw	$1536, 4(%esi)                  # imm = 0x600
	movl	%ecx, (%esi)
LBB4_10:
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	retl
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI4_0:
	.long	LBB4_3
	.long	LBB4_4
	.long	LBB4_5
	.long	LBB4_6
                                        # -- End function
	.def	_ST;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_ST                             # -- Begin function ST
	.p2align	4
_ST:                                    # @ST
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	16(%esp), %edi
	cmpw	$-32767, 4(%edi)                # imm = 0x8001
	jne	LBB5_2
# %bb.1:
	movl	(%edi), %eax
	movl	(%eax), %edi
LBB5_2:
	movl	12(%esp), %esi
	cmpb	$0, 12(%edi)
	je	LBB5_4
# %bb.3:
	movl	(%esi), %eax
	movzbl	(%eax), %eax
	andl	$1, %eax
	movzbl	13(%edi), %ecx
	movl	$-2, %edx
	roll	%cl, %edx
	movl	(%edi), %ecx
	andl	%edx, (%ecx)
	movzbl	13(%edi), %ecx
	shll	%cl, %eax
	movl	(%edi), %ecx
	orl	%eax, (%ecx)
	jmp	LBB5_13
LBB5_4:
	movzwl	4(%esi), %eax
	movw	%ax, 4(%edi)
	pushl	%esi
	calll	_Type_GetSize
	addl	$4, %esp
	movzwl	%ax, %eax
	leal	-1(%eax), %ecx
	cmpl	$7, %ecx
	ja	LBB5_5
# %bb.7:
	jmpl	*LJTI5_0(,%ecx,4)
LBB5_8:
	pushl	(%esi)
	pushl	%edi
	calll	_ST_byte
	jmp	LBB5_12
LBB5_5:
	cmpl	$83, %eax
	jne	LBB5_13
# %bb.6:
	pushl	(%esi)
	pushl	%edi
	calll	_ST_string
	jmp	LBB5_12
LBB5_10:
	pushl	(%esi)
	pushl	%edi
	calll	_ST_dword
	jmp	LBB5_12
LBB5_11:
	pushl	(%esi)
	pushl	%edi
	calll	_ST_qword
	jmp	LBB5_12
LBB5_9:
	pushl	(%esi)
	pushl	%edi
	calll	_ST_word
LBB5_12:
	addl	$8, %esp
LBB5_13:
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	retl
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI5_0:
	.long	LBB5_8
	.long	LBB5_9
	.long	LBB5_13
	.long	LBB5_10
	.long	LBB5_13
	.long	LBB5_13
	.long	LBB5_13
	.long	LBB5_11
                                        # -- End function
	.def	_STN;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_STN                            # -- Begin function STN
	.p2align	4
_STN:                                   # @STN
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	16(%esp), %edi
	cmpw	$-32767, 4(%edi)                # imm = 0x8001
	jne	LBB6_2
# %bb.1:
	movl	(%edi), %eax
	movl	(%eax), %edi
LBB6_2:
	movl	12(%esp), %esi
	cmpb	$0, 12(%edi)
	je	LBB6_4
# %bb.3:
	movl	(%esi), %eax
	movzbl	(%eax), %eax
	notl	%eax
	andl	$1, %eax
	movzbl	13(%edi), %ecx
	movl	$-2, %edx
	roll	%cl, %edx
	movl	(%edi), %ecx
	andl	%edx, (%ecx)
	movzbl	13(%edi), %ecx
	shll	%cl, %eax
	movl	(%edi), %ecx
	orl	%eax, (%ecx)
	jmp	LBB6_12
LBB6_4:
	movzwl	4(%esi), %eax
	movw	%ax, 4(%edi)
	pushl	%esi
	calll	_Type_GetSize
	addl	$4, %esp
	movzwl	%ax, %eax
	leal	-1(%eax), %ecx
	movl	%eax, %edx
	xorl	%ecx, %edx
	cmpl	%ecx, %edx
	jbe	LBB6_12
# %bb.5:
	rep		bsfl	%eax, %eax
	cmpl	$3, %eax
	ja	LBB6_12
# %bb.6:
	jmpl	*LJTI6_0(,%eax,4)
LBB6_7:
	pushl	(%esi)
	pushl	%edi
	calll	_STN_byte
	jmp	LBB6_11
LBB6_9:
	pushl	(%esi)
	pushl	%edi
	calll	_STN_dword
	jmp	LBB6_11
LBB6_10:
	pushl	(%esi)
	pushl	%edi
	calll	_STN_qword
	jmp	LBB6_11
LBB6_8:
	pushl	(%esi)
	pushl	%edi
	calll	_STN_word
LBB6_11:
	addl	$8, %esp
LBB6_12:
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	retl
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI6_0:
	.long	LBB6_7
	.long	LBB6_8
	.long	LBB6_9
	.long	LBB6_10
                                        # -- End function
	.def	_S;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_S                              # -- Begin function S
	.p2align	4
_S:                                     # @S
# %bb.0:
	pushl	%esi
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpw	$-32767, 4(%edx)                # imm = 0x8001
	jne	LBB7_2
# %bb.1:
	movl	(%edx), %ecx
	movl	(%ecx), %edx
LBB7_2:
	movl	(%eax), %ecx
	testb	$1, (%ecx)
	je	LBB7_6
# %bb.3:
	cmpb	$0, 12(%edx)
	je	LBB7_5
# %bb.4:
	movzbl	13(%edx), %ecx
	movl	$1, %esi
	shll	%cl, %esi
	movl	(%edx), %ecx
	orl	%esi, (%ecx)
	popl	%esi
	retl
LBB7_5:
	movw	$1536, 4(%edx)                  # imm = 0x600
	movl	(%edx), %ecx
	movb	$1, (%ecx)
LBB7_6:
	popl	%esi
	retl
                                        # -- End function
	.def	_SN;
	.scl	2;
	.type	32;
	.endef
	.globl	_SN                             # -- Begin function SN
	.p2align	4
_SN:                                    # @SN
# %bb.0:
	pushl	%esi
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpw	$-32767, 4(%edx)                # imm = 0x8001
	jne	LBB8_2
# %bb.1:
	movl	(%edx), %ecx
	movl	(%ecx), %edx
LBB8_2:
	movl	(%eax), %ecx
	testb	$1, (%ecx)
	jne	LBB8_6
# %bb.3:
	cmpb	$0, 12(%edx)
	je	LBB8_5
# %bb.4:
	movzbl	13(%edx), %ecx
	movl	$1, %esi
	shll	%cl, %esi
	movl	(%edx), %ecx
	orl	%esi, (%ecx)
	popl	%esi
	retl
LBB8_5:
	movw	$1536, 4(%edx)                  # imm = 0x600
	movl	(%edx), %ecx
	movb	$1, (%ecx)
LBB8_6:
	popl	%esi
	retl
                                        # -- End function
	.def	_R;
	.scl	2;
	.type	32;
	.endef
	.globl	_R                              # -- Begin function R
	.p2align	4
_R:                                     # @R
# %bb.0:
	pushl	%esi
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpw	$-32767, 4(%edx)                # imm = 0x8001
	jne	LBB9_2
# %bb.1:
	movl	(%edx), %ecx
	movl	(%ecx), %edx
LBB9_2:
	movl	(%eax), %ecx
	testb	$1, (%ecx)
	je	LBB9_6
# %bb.3:
	cmpb	$0, 12(%edx)
	je	LBB9_5
# %bb.4:
	movzbl	13(%edx), %ecx
	movl	$-2, %esi
	roll	%cl, %esi
	movl	(%edx), %ecx
	andl	%esi, (%ecx)
	popl	%esi
	retl
LBB9_5:
	movw	$1536, 4(%edx)                  # imm = 0x600
	movl	(%edx), %ecx
	movb	$0, (%ecx)
LBB9_6:
	popl	%esi
	retl
                                        # -- End function
	.def	_RN;
	.scl	2;
	.type	32;
	.endef
	.globl	_RN                             # -- Begin function RN
	.p2align	4
_RN:                                    # @RN
# %bb.0:
	pushl	%esi
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpw	$-32767, 4(%edx)                # imm = 0x8001
	jne	LBB10_2
# %bb.1:
	movl	(%edx), %ecx
	movl	(%ecx), %edx
LBB10_2:
	movl	(%eax), %ecx
	testb	$1, (%ecx)
	jne	LBB10_6
# %bb.3:
	cmpb	$0, 12(%edx)
	je	LBB10_5
# %bb.4:
	movzbl	13(%edx), %ecx
	movl	$-2, %esi
	roll	%cl, %esi
	movl	(%edx), %ecx
	andl	%esi, (%ecx)
	popl	%esi
	retl
LBB10_5:
	movw	$1536, 4(%edx)                  # imm = 0x600
	movl	(%edx), %ecx
	movb	$0, (%ecx)
LBB10_6:
	popl	%esi
	retl
                                        # -- End function
	.def	_AND;
	.scl	2;
	.type	32;
	.endef
	.globl	_AND                            # -- Begin function AND
	.p2align	4
_AND:                                   # @AND
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	20(%esp), %edi
	movl	16(%esp), %esi
	pushl	%esi
	calll	_Variant_Read_Bool
	addl	$4, %esp
	movl	%eax, %ebx
	pushl	%edi
	calll	_Variant_Read_Bool
	addl	$4, %esp
	andb	%bl, %al
	andb	$1, %al
	movw	$1536, 4(%esi)                  # imm = 0x600
	movl	(%esi), %ecx
	movb	%al, (%ecx)
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_ANDN;
	.scl	2;
	.type	32;
	.endef
	.globl	_ANDN                           # -- Begin function ANDN
	.p2align	4
_ANDN:                                  # @ANDN
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	20(%esp), %edi
	movl	16(%esp), %esi
	pushl	%esi
	calll	_Variant_Read_Bool
	addl	$4, %esp
	movl	%eax, %ebx
	pushl	%edi
	calll	_Variant_Read_Bool
	addl	$4, %esp
	testb	$1, %al
	sete	%al
	andb	%bl, %al
	movw	$1536, 4(%esi)                  # imm = 0x600
	movl	(%esi), %ecx
	movb	%al, (%ecx)
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_OR;
	.scl	2;
	.type	32;
	.endef
	.globl	_OR                             # -- Begin function OR
	.p2align	4
_OR:                                    # @OR
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	20(%esp), %edi
	movl	16(%esp), %esi
	pushl	%esi
	calll	_Variant_Read_Bool
	addl	$4, %esp
	movl	%eax, %ebx
	pushl	%edi
	calll	_Variant_Read_Bool
	addl	$4, %esp
	orb	%bl, %al
	andb	$1, %al
	movw	$1536, 4(%esi)                  # imm = 0x600
	movl	(%esi), %ecx
	movb	%al, (%ecx)
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_ORN;
	.scl	2;
	.type	32;
	.endef
	.globl	_ORN                            # -- Begin function ORN
	.p2align	4
_ORN:                                   # @ORN
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	20(%esp), %edi
	movl	16(%esp), %esi
	pushl	%esi
	calll	_Variant_Read_Bool
	addl	$4, %esp
	movl	%eax, %ebx
	pushl	%edi
	calll	_Variant_Read_Bool
	addl	$4, %esp
	testb	$1, %al
	sete	%al
	orb	%bl, %al
	andb	$1, %al
	movw	$1536, 4(%esi)                  # imm = 0x600
	movl	(%esi), %ecx
	movb	%al, (%ecx)
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_NOT;
	.scl	2;
	.type	32;
	.endef
	.globl	_NOT                            # -- Begin function NOT
	.p2align	4
_NOT:                                   # @NOT
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	pushl	%esi
	calll	_Variant_Read_Bool
	addl	$4, %esp
	notb	%al
	andb	$1, %al
	movw	$1536, 4(%esi)                  # imm = 0x600
	movl	(%esi), %ecx
	movb	%al, (%ecx)
	movl	%esi, %eax
	popl	%esi
	retl
                                        # -- End function
	.def	_EQ;
	.scl	2;
	.type	32;
	.endef
	.globl	_EQ                             # -- Begin function EQ
	.p2align	4
_EQ:                                    # @EQ
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	andl	$-8, %esp
	subl	$24, %esp
	movl	12(%ebp), %edi
	movl	8(%ebp), %esi
	cmpw	$1536, 4(%esi)                  # imm = 0x600
	jne	LBB16_3
# %bb.1:
	cmpw	$1536, 4(%edi)                  # imm = 0x600
	jne	LBB16_3
# %bb.2:
	pushl	%esi
	calll	_Variant_Read_Bool
	addl	$4, %esp
	movl	%eax, %ebx
	pushl	%edi
	calll	_Variant_Read_Bool
	addl	$4, %esp
	cmpb	%al, %bl
	sete	%al
	jmp	LBB16_4
LBB16_3:
	pushl	%esi
	calll	_Variant_Read_Lreal
	addl	$4, %esp
	fstpl	8(%esp)
	pushl	%edi
	calll	_Variant_Read_Lreal
	addl	$4, %esp
	fstpl	(%esp)
	movsd	(%esp), %xmm0                   # xmm0 = mem[0],zero
	cmpeqsd	8(%esp), %xmm0
	movd	%xmm0, %eax
	andl	$1, %eax
LBB16_4:
	movw	$1536, 4(%esi)                  # imm = 0x600
	movl	(%esi), %ecx
	movb	%al, (%ecx)
	movl	%esi, %eax
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_JMP;
	.scl	2;
	.type	32;
	.endef
	.globl	_JMP                            # -- Begin function JMP
	.p2align	4
_JMP:                                   # @JMP
# %bb.0:
	movl	4(%esp), %eax
	retl
                                        # -- End function
	.def	_JMPC;
	.scl	2;
	.type	32;
	.endef
	.globl	_JMPC                           # -- Begin function JMPC
	.p2align	4
_JMPC:                                  # @JMPC
# %bb.0:
	movl	4(%esp), %eax
	retl
                                        # -- End function
	.def	_JMPCN;
	.scl	2;
	.type	32;
	.endef
	.globl	_JMPCN                          # -- Begin function JMPCN
	.p2align	4
_JMPCN:                                 # @JMPCN
# %bb.0:
	movl	4(%esp), %eax
	retl
                                        # -- End function
	.def	_CAL;
	.scl	2;
	.type	32;
	.endef
	.globl	_CAL                            # -- Begin function CAL
	.p2align	4
_CAL:                                   # @CAL
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	movl	16(%esp), %eax
	movl	12(%esp), %ecx
	pushl	(%ecx)
	calll	*(%eax)
	addl	$4, %esp
	movl	%esi, %eax
	popl	%esi
	retl
                                        # -- End function
	.def	_CALC;
	.scl	2;
	.type	32;
	.endef
	.globl	_CALC                           # -- Begin function CALC
	.p2align	4
_CALC:                                  # @CALC
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	movl	(%esi), %eax
	testb	$1, (%eax)
	je	LBB21_2
# %bb.1:
	movl	16(%esp), %eax
	movl	12(%esp), %ecx
	pushl	(%ecx)
	calll	*(%eax)
	addl	$4, %esp
LBB21_2:
	movl	%esi, %eax
	popl	%esi
	retl
                                        # -- End function
	.def	_CALCN;
	.scl	2;
	.type	32;
	.endef
	.globl	_CALCN                          # -- Begin function CALCN
	.p2align	4
_CALCN:                                 # @CALCN
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	movl	(%esi), %eax
	testb	$1, (%eax)
	jne	LBB22_2
# %bb.1:
	movl	16(%esp), %eax
	movl	12(%esp), %ecx
	pushl	(%ecx)
	calll	*(%eax)
	addl	$4, %esp
LBB22_2:
	movl	%esi, %eax
	popl	%esi
	retl
                                        # -- End function
	.def	_RET;
	.scl	2;
	.type	32;
	.endef
	.globl	_RET                            # -- Begin function RET
	.p2align	4
_RET:                                   # @RET
# %bb.0:
	movl	4(%esp), %eax
	movb	$1, 11(%eax)
	retl
                                        # -- End function
	.def	_RETC;
	.scl	2;
	.type	32;
	.endef
	.globl	_RETC                           # -- Begin function RETC
	.p2align	4
_RETC:                                  # @RETC
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %ecx
	cmpb	$1, (%ecx)
	jne	LBB24_2
# %bb.1:
	movb	$1, 11(%eax)
LBB24_2:
	retl
                                        # -- End function
	.def	_RETCN;
	.scl	2;
	.type	32;
	.endef
	.globl	_RETCN                          # -- Begin function RETCN
	.p2align	4
_RETCN:                                 # @RETCN
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB25_1
# %bb.2:
	retl
LBB25_1:
	movb	$1, 11(%eax)
	retl
                                        # -- End function
	.def	_CLR;
	.scl	2;
	.type	32;
	.endef
	.globl	_CLR                            # -- Begin function CLR
	.p2align	4
_CLR:                                   # @CLR
# %bb.0:
	movl	4(%esp), %eax
	retl
                                        # -- End function
	.def	_END;
	.scl	2;
	.type	32;
	.endef
	.globl	_END                            # -- Begin function END
	.p2align	4
_END:                                   # @END
# %bb.0:
	movl	4(%esp), %eax
	movb	$1, 11(%eax)
	retl
                                        # -- End function
	.def	_VAR;
	.scl	2;
	.type	32;
	.endef
	.globl	_VAR                            # -- Begin function VAR
	.p2align	4
_VAR:                                   # @VAR
# %bb.0:
	pushl	%ebx
	pushl	%esi
	movzbl	_Instruction_UFB, %ebx
	pushl	12(%esp)
	calll	_Scope_variable
	addl	$4, %esp
	cmpb	$1, %bl
	je	LBB28_2
# %bb.1:
	pushl	$0
	pushl	%eax
	movl	%eax, %esi
	calll	_Rtedge_TagCreateByInstruction
	addl	$8, %esp
	pushl	$35
	pushl	%esi
	calll	_strrchr
	addl	$8, %esp
	movl	%eax, %esi
	incl	%esi
	calll	_Scope_get
	pushl	%esi
	pushl	%eax
	calll	_Userfunction_AddArgument
	addl	$8, %esp
LBB28_2:
	xorl	%eax, %eax
	popl	%esi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Instruction_IsUFB;
	.scl	2;
	.type	32;
	.endef
	.globl	_Instruction_IsUFB              # -- Begin function Instruction_IsUFB
	.p2align	4
_Instruction_IsUFB:                     # @Instruction_IsUFB
# %bb.0:
	cmpb	$1, _Instruction_UFB
	sete	%al
	retl
                                        # -- End function
	.def	_FU;
	.scl	2;
	.type	32;
	.endef
	.globl	_FU                             # -- Begin function FU
	.p2align	4
_FU:                                    # @FU
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	pushl	%esi
	calll	_Scope_variable
	addl	$4, %esp
	pushl	$0
	pushl	%eax
	calll	_Rtedge_TagCreateByInstruction
	addl	$8, %esp
	pushl	$0
	pushl	%esi
	calll	_Rtedge_TagCreateByInstruction
	addl	$8, %esp
	calll	_Scope_get
	pushl	%eax
	calll	_Userfunction_Add
	addl	$4, %esp
	movb	$1, _Instruction_UF
	movb	$0, _Instruction_UFB
	xorl	%eax, %eax
	popl	%esi
	retl
                                        # -- End function
	.def	_FB;
	.scl	2;
	.type	32;
	.endef
	.globl	_FB                             # -- Begin function FB
	.p2align	4
_FB:                                    # @FB
# %bb.0:
	pushl	4(%esp)
	calll	_Scope_variable
	addl	$4, %esp
	calll	_Scope_get
	pushl	%eax
	calll	_UserFB_Add
	addl	$4, %esp
	movb	$0, _Instruction_UF
	movb	$1, _Instruction_UFB
	xorl	%eax, %eax
	retl
                                        # -- End function
	.def	_LABEL;
	.scl	2;
	.type	32;
	.endef
	.globl	_LABEL                          # -- Begin function LABEL
	.p2align	4
_LABEL:                                 # @LABEL
# %bb.0:
	movl	4(%esp), %eax
	retl
                                        # -- End function
	.def	_Instruction_CalcHash;
	.scl	2;
	.type	32;
	.endef
	.globl	_Instruction_CalcHash           # -- Begin function Instruction_CalcHash
	.p2align	4
_Instruction_CalcHash:                  # @Instruction_CalcHash
# %bb.0:
	subl	$16, %esp
	movl	%esp, %eax
	pushl	20(%esp)
	pushl	%eax
	calll	__Hash
	addl	$8, %esp
	movzwl	4(%esp), %eax
	addl	$16, %esp
	retl
                                        # -- End function
	.def	_Instruction_CreateCatalog;
	.scl	2;
	.type	32;
	.endef
	.globl	_Instruction_CreateCatalog      # -- Begin function Instruction_CreateCatalog
	.p2align	4
_Instruction_CreateCatalog:             # @Instruction_CreateCatalog
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$16, %esp
	pushl	$262140                         # imm = 0x3FFFC
	pushl	$0
	pushl	$_InstructionCatalog
	calll	_memset
	addl	$12, %esp
	xorl	%esi, %esi
	movl	%esp, %edi
	jmp	LBB34_1
	.p2align	4
LBB34_3:                                #   in Loop: Header=BB34_1 Depth=1
	movl	%ebx, _InstructionCatalog(,%eax,4)
LBB34_4:                                #   in Loop: Header=BB34_1 Depth=1
	addl	$19, %esi
	cmpl	$513, %esi                      # imm = 0x201
	je	LBB34_5
LBB34_1:                                # =>This Inner Loop Header: Depth=1
	leal	_InstructionTemplate(%esi), %ebx
	pushl	_InstructionTemplate(%esi)
	pushl	%edi
	calll	__Hash
	addl	$8, %esp
	movzwl	4(%esp), %eax
	cmpl	$0, _InstructionCatalog(,%eax,4)
	je	LBB34_3
# %bb.2:                                #   in Loop: Header=BB34_1 Depth=1
	pushl	(%ebx)
	pushl	$"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@"
	calll	_printf
	addl	$8, %esp
	jmp	LBB34_4
LBB34_5:
	movl	$2, _status_instruction
	xorl	%eax, %eax
	addl	$16, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Instruction_CreateUserfunctionCatalog;
	.scl	2;
	.type	32;
	.endef
	.globl	_Instruction_CreateUserfunctionCatalog # -- Begin function Instruction_CreateUserfunctionCatalog
	.p2align	4
_Instruction_CreateUserfunctionCatalog: # @Instruction_CreateUserfunctionCatalog
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$16, %esp
	movl	36(%esp), %esi
	movl	32(%esp), %edi
	movl	%esp, %eax
	pushl	%edi
	pushl	%eax
	calll	__Hash
	addl	$8, %esp
	movzwl	4(%esp), %ebx
	cmpl	$0, _InstructionCatalog(,%ebx,4)
	je	LBB35_2
# %bb.1:
	pushl	%edi
	pushl	$"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@"
	calll	_printf
	addl	$8, %esp
LBB35_2:
	movl	%esi, _InstructionCatalog(,%ebx,4)
	movl	$2, _status_instruction
	xorl	%eax, %eax
	addl	$16, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Instruction_GetTemplate;
	.scl	2;
	.type	32;
	.endef
	.globl	_Instruction_GetTemplate        # -- Begin function Instruction_GetTemplate
	.p2align	4
_Instruction_GetTemplate:               # @Instruction_GetTemplate
# %bb.0:
	pushl	%edi
	pushl	%esi
	subl	$16, %esp
	movl	28(%esp), %edi
	movl	%esp, %eax
	pushl	%edi
	pushl	%eax
	calll	__Hash
	addl	$8, %esp
	movzwl	4(%esp), %eax
	movl	_InstructionCatalog(,%eax,4), %esi
	xorl	%eax, %eax
	testl	%esi, %esi
	je	LBB36_3
# %bb.1:
	movl	(%esi), %ecx
	testl	%ecx, %ecx
	je	LBB36_3
# %bb.2:
	pushl	%edi
	pushl	%ecx
	calll	_strcmp
	addl	$8, %esp
	movl	%eax, %ecx
	xorl	%eax, %eax
	testl	%ecx, %ecx
	cmovel	%esi, %eax
LBB36_3:
	addl	$16, %esp
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Instruction_IsUF;
	.scl	2;
	.type	32;
	.endef
	.globl	_Instruction_IsUF               # -- Begin function Instruction_IsUF
	.p2align	4
_Instruction_IsUF:                      # @Instruction_IsUF
# %bb.0:
	cmpb	$1, _Instruction_UF
	sete	%al
	retl
                                        # -- End function
	.def	_Instruction_FUFBReset;
	.scl	2;
	.type	32;
	.endef
	.globl	_Instruction_FUFBReset          # -- Begin function Instruction_FUFBReset
	.p2align	4
_Instruction_FUFBReset:                 # @Instruction_FUFBReset
# %bb.0:
	movb	$0, _Instruction_UF
	movb	$0, _Instruction_UFB
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_status_instruction             # @status_instruction
	.p2align	2, 0x0
_status_instruction:
	.long	0                               # 0x0

	.globl	_Instruction_UF                 # @Instruction_UF
_Instruction_UF:
	.byte	0                               # 0x0

	.globl	_Instruction_UFB                # @Instruction_UFB
_Instruction_UFB:
	.byte	0                               # 0x0

	.globl	_InstructionCatalog             # @InstructionCatalog
	.p2align	2, 0x0
_InstructionCatalog:
	.zero	262140

	.globl	_stack                          # @stack
_stack:
	.zero	256

	.globl	_stackptr                       # @stackptr
	.p2align	2, 0x0
_stackptr:
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_00CNPNBAHC@?$AA@"
	.globl	"??_C@_00CNPNBAHC@?$AA@"        # @"??_C@_00CNPNBAHC@?$AA@"
"??_C@_00CNPNBAHC@?$AA@":
	.zero	1

	.section	.rdata,"dr",discard,"??_C@_09FOLKACJL@STACKOVER?$AA@"
	.globl	"??_C@_09FOLKACJL@STACKOVER?$AA@" # @"??_C@_09FOLKACJL@STACKOVER?$AA@"
"??_C@_09FOLKACJL@STACKOVER?$AA@":
	.asciz	"STACKOVER"

	.section	.rdata,"dr",discard,"??_C@_0L@LMAGOADG@STACKUNDER?$AA@"
	.globl	"??_C@_0L@LMAGOADG@STACKUNDER?$AA@" # @"??_C@_0L@LMAGOADG@STACKUNDER?$AA@"
"??_C@_0L@LMAGOADG@STACKUNDER?$AA@":
	.asciz	"STACKUNDER"

	.section	.rdata,"dr",discard,"??_C@_03MJAIKILM@VAR?$AA@"
	.globl	"??_C@_03MJAIKILM@VAR?$AA@"     # @"??_C@_03MJAIKILM@VAR?$AA@"
"??_C@_03MJAIKILM@VAR?$AA@":
	.asciz	"VAR"

	.section	.rdata,"dr",discard,"??_C@_02LDGFHOIO@FU?$AA@"
	.globl	"??_C@_02LDGFHOIO@FU?$AA@"      # @"??_C@_02LDGFHOIO@FU?$AA@"
"??_C@_02LDGFHOIO@FU?$AA@":
	.asciz	"FU"

	.section	.rdata,"dr",discard,"??_C@_02LGOGPKBI@FB?$AA@"
	.globl	"??_C@_02LGOGPKBI@FB?$AA@"      # @"??_C@_02LGOGPKBI@FB?$AA@"
"??_C@_02LGOGPKBI@FB?$AA@":
	.asciz	"FB"

	.section	.rdata,"dr",discard,"??_C@_03JBLDIHBA@UFU?$AA@"
	.globl	"??_C@_03JBLDIHBA@UFU?$AA@"     # @"??_C@_03JBLDIHBA@UFU?$AA@"
"??_C@_03JBLDIHBA@UFU?$AA@":
	.asciz	"UFU"

	.section	.rdata,"dr",discard,"??_C@_05EILEDKCG@LABEL?$AA@"
	.globl	"??_C@_05EILEDKCG@LABEL?$AA@"   # @"??_C@_05EILEDKCG@LABEL?$AA@"
"??_C@_05EILEDKCG@LABEL?$AA@":
	.asciz	"LABEL"

	.section	.rdata,"dr",discard,"??_C@_03GEANJIEE@NOP?$AA@"
	.globl	"??_C@_03GEANJIEE@NOP?$AA@"     # @"??_C@_03GEANJIEE@NOP?$AA@"
"??_C@_03GEANJIEE@NOP?$AA@":
	.asciz	"NOP"

	.section	.rdata,"dr",discard,"??_C@_02ONCLNIEI@LD?$AA@"
	.globl	"??_C@_02ONCLNIEI@LD?$AA@"      # @"??_C@_02ONCLNIEI@LD?$AA@"
"??_C@_02ONCLNIEI@LD?$AA@":
	.asciz	"LD"

	.section	.rdata,"dr",discard,"??_C@_03BGBAIAPB@LDN?$AA@"
	.globl	"??_C@_03BGBAIAPB@LDN?$AA@"     # @"??_C@_03BGBAIAPB@LDN?$AA@"
"??_C@_03BGBAIAPB@LDN?$AA@":
	.asciz	"LDN"

	.section	.rdata,"dr",discard,"??_C@_02LAJDCOFE@ST?$AA@"
	.globl	"??_C@_02LAJDCOFE@ST?$AA@"      # @"??_C@_02LAJDCOFE@ST?$AA@"
"??_C@_02LAJDCOFE@ST?$AA@":
	.asciz	"ST"

	.section	.rdata,"dr",discard,"??_C@_03CEMGEEI@STN?$AA@"
	.globl	"??_C@_03CEMGEEI@STN?$AA@"      # @"??_C@_03CEMGEEI@STN?$AA@"
"??_C@_03CEMGEEI@STN?$AA@":
	.asciz	"STN"

	.section	.rdata,"dr",discard,"??_C@_01CPLAODJH@S?$AA@"
	.globl	"??_C@_01CPLAODJH@S?$AA@"       # @"??_C@_01CPLAODJH@S?$AA@"
"??_C@_01CPLAODJH@S?$AA@":
	.asciz	"S"

	.section	.rdata,"dr",discard,"??_C@_02LONEIP@SN?$AA@"
	.globl	"??_C@_02LONEIP@SN?$AA@"        # @"??_C@_02LONEIP@SN?$AA@"
"??_C@_02LONEIP@SN?$AA@":
	.asciz	"SN"

	.section	.rdata,"dr",discard,"??_C@_01DGKLNCNG@R?$AA@"
	.globl	"??_C@_01DGKLNCNG@R?$AA@"       # @"??_C@_01DGKLNCNG@R?$AA@"
"??_C@_01DGKLNCNG@R?$AA@":
	.asciz	"R"

	.section	.rdata,"dr",discard,"??_C@_02BHMLOLI@RN?$AA@"
	.globl	"??_C@_02BHMLOLI@RN?$AA@"       # @"??_C@_02BHMLOLI@RN?$AA@"
"??_C@_02BHMLOLI@RN?$AA@":
	.asciz	"RN"

	.section	.rdata,"dr",discard,"??_C@_03BDACDFHA@AND?$AA@"
	.globl	"??_C@_03BDACDFHA@AND?$AA@"     # @"??_C@_03BDACDFHA@AND?$AA@"
"??_C@_03BDACDFHA@AND?$AA@":
	.asciz	"AND"

	.section	.rdata,"dr",discard,"??_C@_04DOOMBBIC@ANDN?$AA@"
	.globl	"??_C@_04DOOMBBIC@ANDN?$AA@"    # @"??_C@_04DOOMBBIC@ANDN?$AA@"
"??_C@_04DOOMBBIC@ANDN?$AA@":
	.asciz	"ANDN"

	.section	.rdata,"dr",discard,"??_C@_02PDPFNDMG@OR?$AA@"
	.globl	"??_C@_02PDPFNDMG@OR?$AA@"      # @"??_C@_02PDPFNDMG@OR?$AA@"
"??_C@_02PDPFNDMG@OR?$AA@":
	.asciz	"OR"

	.section	.rdata,"dr",discard,"??_C@_03BMAOPANN@ORN?$AA@"
	.globl	"??_C@_03BMAOPANN@ORN?$AA@"     # @"??_C@_03BMAOPANN@ORN?$AA@"
"??_C@_03BMAOPANN@ORN?$AA@":
	.asciz	"ORN"

	.section	.rdata,"dr",discard,"??_C@_03HKIODAMO@CAL?$AA@"
	.globl	"??_C@_03HKIODAMO@CAL?$AA@"     # @"??_C@_03HKIODAMO@CAL?$AA@"
"??_C@_03HKIODAMO@CAL?$AA@":
	.asciz	"CAL"

	.section	.rdata,"dr",discard,"??_C@_04KHPCHNEB@CALC?$AA@"
	.globl	"??_C@_04KHPCHNEB@CALC?$AA@"    # @"??_C@_04KHPCHNEB@CALC?$AA@"
"??_C@_04KHPCHNEB@CALC?$AA@":
	.asciz	"CALC"

	.section	.rdata,"dr",discard,"??_C@_05GPIGOBPA@CALCN?$AA@"
	.globl	"??_C@_05GPIGOBPA@CALCN?$AA@"   # @"??_C@_05GPIGOBPA@CALCN?$AA@"
"??_C@_05GPIGOBPA@CALCN?$AA@":
	.asciz	"CALCN"

	.section	.rdata,"dr",discard,"??_C@_03BHDJDALB@RET?$AA@"
	.globl	"??_C@_03BHDJDALB@RET?$AA@"     # @"??_C@_03BHDJDALB@RET?$AA@"
"??_C@_03BHDJDALB@RET?$AA@":
	.asciz	"RET"

	.section	.rdata,"dr",discard,"??_C@_04GHCFKGOM@RETC?$AA@"
	.globl	"??_C@_04GHCFKGOM@RETC?$AA@"    # @"??_C@_04GHCFKGOM@RETC?$AA@"
"??_C@_04GHCFKGOM@RETC?$AA@":
	.asciz	"RETC"

	.section	.rdata,"dr",discard,"??_C@_05MHCBOJHO@RETCN?$AA@"
	.globl	"??_C@_05MHCBOJHO@RETCN?$AA@"   # @"??_C@_05MHCBOJHO@RETCN?$AA@"
"??_C@_05MHCBOJHO@RETCN?$AA@":
	.asciz	"RETCN"

	.section	.rdata,"dr",discard,"??_C@_03GBFNEA@NOT?$AA@"
	.globl	"??_C@_03GBFNEA@NOT?$AA@"       # @"??_C@_03GBFNEA@NOT?$AA@"
"??_C@_03GBFNEA@NOT?$AA@":
	.asciz	"NOT"

	.section	.rdata,"dr",discard,"??_C@_02NFEPAFND@EQ?$AA@"
	.globl	"??_C@_02NFEPAFND@EQ?$AA@"      # @"??_C@_02NFEPAFND@EQ?$AA@"
"??_C@_02NFEPAFND@EQ?$AA@":
	.asciz	"EQ"

	.section	.rdata,"dr",discard,"??_C@_03JMGAKCCH@END?$AA@"
	.globl	"??_C@_03JMGAKCCH@END?$AA@"     # @"??_C@_03JMGAKCCH@END?$AA@"
"??_C@_03JMGAKCCH@END?$AA@":
	.asciz	"END"

	.data
	.globl	_InstructionTemplate            # @InstructionTemplate
_InstructionTemplate:
	.long	"??_C@_03MJAIKILM@VAR?$AA@"
	.short	1                               # 0x1
	.byte	1                               # 0x1
	.short	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_VAR
	.short	0                               # 0x0
	.long	"??_C@_02LDGFHOIO@FU?$AA@"
	.short	2                               # 0x2
	.byte	1                               # 0x1
	.short	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_FU
	.short	0                               # 0x0
	.long	"??_C@_02LGOGPKBI@FB?$AA@"
	.short	3                               # 0x3
	.byte	1                               # 0x1
	.short	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_FB
	.short	0                               # 0x0
	.long	"??_C@_03JBLDIHBA@UFU?$AA@"
	.short	2                               # 0x2
	.byte	1                               # 0x1
	.short	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_Logic_RunPOU
	.short	0                               # 0x0
	.long	"??_C@_05EILEDKCG@LABEL?$AA@"
	.short	4                               # 0x4
	.byte	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_LABEL
	.short	0                               # 0x0
	.long	"??_C@_03GEANJIEE@NOP?$AA@"
	.short	0                               # 0x0
	.byte	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_NOP
	.short	0                               # 0x0
	.long	"??_C@_02ONCLNIEI@LD?$AA@"
	.short	5                               # 0x5
	.byte	0                               # 0x0
	.short	32769                           # 0x8001
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_LD
	.short	0                               # 0x0
	.long	"??_C@_03BGBAIAPB@LDN?$AA@"
	.short	7                               # 0x7
	.byte	0                               # 0x0
	.short	32769                           # 0x8001
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_LDN
	.short	0                               # 0x0
	.long	"??_C@_02LAJDCOFE@ST?$AA@"
	.short	9                               # 0x9
	.byte	0                               # 0x0
	.short	32769                           # 0x8001
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_ST
	.short	0                               # 0x0
	.long	"??_C@_03CEMGEEI@STN?$AA@"
	.short	11                              # 0xb
	.byte	0                               # 0x0
	.short	32769                           # 0x8001
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_STN
	.short	0                               # 0x0
	.long	"??_C@_01CPLAODJH@S?$AA@"
	.short	13                              # 0xd
	.byte	0                               # 0x0
	.short	1536                            # 0x600
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_S
	.short	0                               # 0x0
	.long	"??_C@_02LONEIP@SN?$AA@"
	.short	14                              # 0xe
	.byte	0                               # 0x0
	.short	1536                            # 0x600
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_SN
	.short	0                               # 0x0
	.long	"??_C@_01DGKLNCNG@R?$AA@"
	.short	15                              # 0xf
	.byte	0                               # 0x0
	.short	1536                            # 0x600
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_R
	.short	0                               # 0x0
	.long	"??_C@_02BHMLOLI@RN?$AA@"
	.short	16                              # 0x10
	.byte	0                               # 0x0
	.short	1536                            # 0x600
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_RN
	.short	0                               # 0x0
	.long	"??_C@_03BDACDFHA@AND?$AA@"
	.short	17                              # 0x11
	.byte	0                               # 0x0
	.short	1536                            # 0x600
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_AND
	.short	0                               # 0x0
	.long	"??_C@_04DOOMBBIC@ANDN?$AA@"
	.short	19                              # 0x13
	.byte	0                               # 0x0
	.short	1536                            # 0x600
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_ANDN
	.short	0                               # 0x0
	.long	"??_C@_02PDPFNDMG@OR?$AA@"
	.short	21                              # 0x15
	.byte	0                               # 0x0
	.short	1536                            # 0x600
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_OR
	.short	0                               # 0x0
	.long	"??_C@_03BMAOPANN@ORN?$AA@"
	.short	23                              # 0x17
	.byte	0                               # 0x0
	.short	1536                            # 0x600
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_ORN
	.short	0                               # 0x0
	.long	"??_C@_03HKIODAMO@CAL?$AA@"
	.short	32                              # 0x20
	.byte	0                               # 0x0
	.short	32774                           # 0x8006
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_CAL
	.short	0                               # 0x0
	.long	"??_C@_04KHPCHNEB@CALC?$AA@"
	.short	33                              # 0x21
	.byte	0                               # 0x0
	.short	32774                           # 0x8006
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_CALC
	.short	0                               # 0x0
	.long	"??_C@_05GPIGOBPA@CALCN?$AA@"
	.short	34                              # 0x22
	.byte	0                               # 0x0
	.short	32774                           # 0x8006
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_CALCN
	.short	0                               # 0x0
	.long	"??_C@_03BHDJDALB@RET?$AA@"
	.short	35                              # 0x23
	.byte	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_RET
	.short	0                               # 0x0
	.long	"??_C@_04GHCFKGOM@RETC?$AA@"
	.short	36                              # 0x24
	.byte	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_RETC
	.short	0                               # 0x0
	.long	"??_C@_05MHCBOJHO@RETCN?$AA@"
	.short	37                              # 0x25
	.byte	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_RETCN
	.short	0                               # 0x0
	.long	"??_C@_03GBFNEA@NOT?$AA@"
	.short	38                              # 0x26
	.byte	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_NOT
	.short	0                               # 0x0
	.long	"??_C@_02NFEPAFND@EQ?$AA@"
	.short	38                              # 0x26
	.byte	0                               # 0x0
	.short	32769                           # 0x8001
	.short	32769                           # 0x8001
	.short	0                               # 0x0
	.long	_EQ
	.short	0                               # 0x0
	.long	"??_C@_03JMGAKCCH@END?$AA@"
	.short	39                              # 0x27
	.byte	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_END
	.short	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@"
	.globl	"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@" # @"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@"
"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@":
	.asciz	"instruction hash conflict! %s. skipped.\n"

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
	.addrsig_sym _NOP
	.addrsig_sym _LD
	.addrsig_sym _LDN
	.addrsig_sym _ST
	.addrsig_sym _STN
	.addrsig_sym _S
	.addrsig_sym _SN
	.addrsig_sym _R
	.addrsig_sym _RN
	.addrsig_sym _AND
	.addrsig_sym _ANDN
	.addrsig_sym _OR
	.addrsig_sym _ORN
	.addrsig_sym _NOT
	.addrsig_sym _EQ
	.addrsig_sym _CAL
	.addrsig_sym _CALC
	.addrsig_sym _CALCN
	.addrsig_sym _RET
	.addrsig_sym _RETC
	.addrsig_sym _RETCN
	.addrsig_sym _END
	.addrsig_sym _VAR
	.addrsig_sym _FU
	.addrsig_sym _FB
	.addrsig_sym _LABEL
	.addrsig_sym _Logic_RunPOU
	.addrsig_sym _InstructionTemplate
	.globl	__fltused
