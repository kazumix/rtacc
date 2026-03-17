	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"variant.c"
	.def	_Variant_IsEmpty;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Variant_IsEmpty                # -- Begin function Variant_IsEmpty
	.p2align	4
_Variant_IsEmpty:                       # @Variant_IsEmpty
# %bb.0:
	movl	4(%esp), %eax
	cmpw	$0, 4(%eax)
	setne	%al
	retl
                                        # -- End function
	.def	_Variant_IsWriteable;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_IsWriteable            # -- Begin function Variant_IsWriteable
	.p2align	4
_Variant_IsWriteable:                   # @Variant_IsWriteable
# %bb.0:
	movl	4(%esp), %eax
	movl	6(%eax), %eax
	movzbl	(%eax), %eax
	retl
                                        # -- End function
	.def	_Variant_Read_Lreal;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Lreal             # -- Begin function Variant_Read_Lreal
	.p2align	4
_Variant_Read_Lreal:                    # @Variant_Read_Lreal
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	fldl	(%eax)
	retl
                                        # -- End function
	.def	_Variant_Read_Real;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Real              # -- Begin function Variant_Read_Real
	.p2align	4
_Variant_Read_Real:                     # @Variant_Read_Real
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	flds	(%eax)
	retl
                                        # -- End function
	.def	_Variant_Read_Lint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Lint              # -- Begin function Variant_Read_Lint
	.p2align	4
_Variant_Read_Lint:                     # @Variant_Read_Lint
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %ecx
	movl	(%ecx), %eax
	movl	4(%ecx), %edx
	retl
                                        # -- End function
	.def	_Variant_Read_Dint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Dint              # -- Begin function Variant_Read_Dint
	.p2align	4
_Variant_Read_Dint:                     # @Variant_Read_Dint
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	retl
                                        # -- End function
	.def	_Variant_Read_Int;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Int               # -- Begin function Variant_Read_Int
	.p2align	4
_Variant_Read_Int:                      # @Variant_Read_Int
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	movzwl	(%eax), %eax
	retl
                                        # -- End function
	.def	_Variant_Read_Sint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Sint              # -- Begin function Variant_Read_Sint
	.p2align	4
_Variant_Read_Sint:                     # @Variant_Read_Sint
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	movzbl	(%eax), %eax
	retl
                                        # -- End function
	.def	_Variant_Read_Ulint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Ulint             # -- Begin function Variant_Read_Ulint
	.p2align	4
_Variant_Read_Ulint:                    # @Variant_Read_Ulint
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %ecx
	movl	(%ecx), %eax
	movl	4(%ecx), %edx
	retl
                                        # -- End function
	.def	_Variant_Read_Udint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Udint             # -- Begin function Variant_Read_Udint
	.p2align	4
_Variant_Read_Udint:                    # @Variant_Read_Udint
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	retl
                                        # -- End function
	.def	_Variant_Read_Uint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Uint              # -- Begin function Variant_Read_Uint
	.p2align	4
_Variant_Read_Uint:                     # @Variant_Read_Uint
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	movzwl	(%eax), %eax
	retl
                                        # -- End function
	.def	_Variant_Read_Usint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Usint             # -- Begin function Variant_Read_Usint
	.p2align	4
_Variant_Read_Usint:                    # @Variant_Read_Usint
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	movzbl	(%eax), %eax
	retl
                                        # -- End function
	.def	_Variant_Read_Qword;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Qword             # -- Begin function Variant_Read_Qword
	.p2align	4
_Variant_Read_Qword:                    # @Variant_Read_Qword
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %ecx
	movl	(%ecx), %eax
	movl	4(%ecx), %edx
	retl
                                        # -- End function
	.def	_Variant_Read_Dword;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Dword             # -- Begin function Variant_Read_Dword
	.p2align	4
_Variant_Read_Dword:                    # @Variant_Read_Dword
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	retl
                                        # -- End function
	.def	_Variant_Read_Word;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Word              # -- Begin function Variant_Read_Word
	.p2align	4
_Variant_Read_Word:                     # @Variant_Read_Word
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	movzwl	(%eax), %eax
	retl
                                        # -- End function
	.def	_Variant_Read_Byte;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Byte              # -- Begin function Variant_Read_Byte
	.p2align	4
_Variant_Read_Byte:                     # @Variant_Read_Byte
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	movzbl	(%eax), %eax
	retl
                                        # -- End function
	.def	_Variant_Read_Bool;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Bool              # -- Begin function Variant_Read_Bool
	.p2align	4
_Variant_Read_Bool:                     # @Variant_Read_Bool
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	movzbl	(%eax), %eax
	retl
                                        # -- End function
	.def	_Variant_Read_String;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_String            # -- Begin function Variant_Read_String
	.p2align	4
_Variant_Read_String:                   # @Variant_Read_String
# %bb.0:
	movl	4(%esp), %eax
	movl	8(%esp), %ecx
	movl	(%ecx), %ecx
	movl	79(%ecx), %edx
	movl	%edx, 79(%eax)
	movups	64(%ecx), %xmm0
	movups	%xmm0, 64(%eax)
	movups	48(%ecx), %xmm0
	movups	%xmm0, 48(%eax)
	movups	32(%ecx), %xmm0
	movups	%xmm0, 32(%eax)
	movups	(%ecx), %xmm0
	movups	16(%ecx), %xmm1
	movups	%xmm1, 16(%eax)
	movups	%xmm0, (%eax)
	retl
                                        # -- End function
	.def	_Variant_Read_Array;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Array             # -- Begin function Variant_Read_Array
	.p2align	4
_Variant_Read_Array:                    # @Variant_Read_Array
# %bb.0:
	movl	4(%esp), %eax
	movl	8(%esp), %ecx
	movl	(%ecx), %ecx
	movzbl	2(%ecx), %edx
	movb	%dl, 2(%eax)
	movzwl	(%ecx), %ecx
	movw	%cx, (%eax)
	retl
                                        # -- End function
	.def	_Variant_Write_Lreal;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Lreal            # -- Begin function Variant_Write_Lreal
	.p2align	4
_Variant_Write_Lreal:                   # @Variant_Write_Lreal
# %bb.0:
	movl	4(%esp), %eax
	movw	$783, 4(%eax)                   # imm = 0x30F
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB19_2
# %bb.1:
	movsd	8(%esp), %xmm0                  # xmm0 = mem[0],zero
	movl	(%eax), %eax
	movsd	%xmm0, (%eax)
LBB19_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Real;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Real             # -- Begin function Variant_Write_Real
	.p2align	4
_Variant_Write_Real:                    # @Variant_Write_Real
# %bb.0:
	movl	4(%esp), %eax
	movw	$782, 4(%eax)                   # imm = 0x30E
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB20_2
# %bb.1:
	movss	8(%esp), %xmm0                  # xmm0 = mem[0],zero,zero,zero
	movl	(%eax), %eax
	movss	%xmm0, (%eax)
LBB20_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Lint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Lint             # -- Begin function Variant_Write_Lint
	.p2align	4
_Variant_Write_Lint:                    # @Variant_Write_Lint
# %bb.0:
	movl	4(%esp), %eax
	movw	$263, 4(%eax)                   # imm = 0x107
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB21_2
# %bb.1:
	movl	12(%esp), %ecx
	movl	8(%esp), %edx
	movl	(%eax), %eax
	movl	%ecx, 4(%eax)
	movl	%edx, (%eax)
LBB21_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Dint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Dint             # -- Begin function Variant_Write_Dint
	.p2align	4
_Variant_Write_Dint:                    # @Variant_Write_Dint
# %bb.0:
	movl	4(%esp), %eax
	movw	$262, 4(%eax)                   # imm = 0x106
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB22_2
# %bb.1:
	movl	8(%esp), %ecx
	movl	(%eax), %eax
	movl	%ecx, (%eax)
LBB22_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Int;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Int              # -- Begin function Variant_Write_Int
	.p2align	4
_Variant_Write_Int:                     # @Variant_Write_Int
# %bb.0:
	movl	4(%esp), %eax
	movw	$261, 4(%eax)                   # imm = 0x105
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB23_2
# %bb.1:
	movzwl	8(%esp), %ecx
	movl	(%eax), %eax
	movw	%cx, (%eax)
LBB23_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Sint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Sint             # -- Begin function Variant_Write_Sint
	.p2align	4
_Variant_Write_Sint:                    # @Variant_Write_Sint
# %bb.0:
	movl	4(%esp), %eax
	movw	$260, 4(%eax)                   # imm = 0x104
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB24_2
# %bb.1:
	movzbl	8(%esp), %ecx
	movl	(%eax), %eax
	movb	%cl, (%eax)
LBB24_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Ulint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Ulint            # -- Begin function Variant_Write_Ulint
	.p2align	4
_Variant_Write_Ulint:                   # @Variant_Write_Ulint
# %bb.0:
	movl	4(%esp), %eax
	movw	$515, 4(%eax)                   # imm = 0x203
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB25_2
# %bb.1:
	movl	12(%esp), %ecx
	movl	8(%esp), %edx
	movl	(%eax), %eax
	movl	%ecx, 4(%eax)
	movl	%edx, (%eax)
LBB25_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Udint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Udint            # -- Begin function Variant_Write_Udint
	.p2align	4
_Variant_Write_Udint:                   # @Variant_Write_Udint
# %bb.0:
	movl	4(%esp), %eax
	movw	$514, 4(%eax)                   # imm = 0x202
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB26_2
# %bb.1:
	movl	8(%esp), %ecx
	movl	(%eax), %eax
	movl	%ecx, (%eax)
LBB26_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Uint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Uint             # -- Begin function Variant_Write_Uint
	.p2align	4
_Variant_Write_Uint:                    # @Variant_Write_Uint
# %bb.0:
	movl	4(%esp), %eax
	movw	$513, 4(%eax)                   # imm = 0x201
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB27_2
# %bb.1:
	movzwl	8(%esp), %ecx
	movl	(%eax), %eax
	movw	%cx, (%eax)
LBB27_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Usint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Usint            # -- Begin function Variant_Write_Usint
	.p2align	4
_Variant_Write_Usint:                   # @Variant_Write_Usint
# %bb.0:
	movl	4(%esp), %eax
	movw	$512, 4(%eax)                   # imm = 0x200
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB28_2
# %bb.1:
	movzbl	8(%esp), %ecx
	movl	(%eax), %eax
	movb	%cl, (%eax)
LBB28_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Qword;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Qword            # -- Begin function Variant_Write_Qword
	.p2align	4
_Variant_Write_Qword:                   # @Variant_Write_Qword
# %bb.0:
	movl	4(%esp), %eax
	movw	$19, 4(%eax)
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB29_2
# %bb.1:
	movl	12(%esp), %ecx
	movl	8(%esp), %edx
	movl	(%eax), %eax
	movl	%ecx, 4(%eax)
	movl	%edx, (%eax)
LBB29_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Dword;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Dword            # -- Begin function Variant_Write_Dword
	.p2align	4
_Variant_Write_Dword:                   # @Variant_Write_Dword
# %bb.0:
	movl	4(%esp), %eax
	movw	$18, 4(%eax)
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB30_2
# %bb.1:
	movl	8(%esp), %ecx
	movl	(%eax), %eax
	movl	%ecx, (%eax)
LBB30_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Word;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Word             # -- Begin function Variant_Write_Word
	.p2align	4
_Variant_Write_Word:                    # @Variant_Write_Word
# %bb.0:
	movl	4(%esp), %eax
	movw	$17, 4(%eax)
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB31_2
# %bb.1:
	movzwl	8(%esp), %ecx
	movl	(%eax), %eax
	movw	%cx, (%eax)
LBB31_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Byte;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Byte             # -- Begin function Variant_Write_Byte
	.p2align	4
_Variant_Write_Byte:                    # @Variant_Write_Byte
# %bb.0:
	movl	4(%esp), %eax
	movw	$16, 4(%eax)
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB32_2
# %bb.1:
	movzbl	8(%esp), %ecx
	movl	(%eax), %eax
	movb	%cl, (%eax)
LBB32_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Bool;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Bool             # -- Begin function Variant_Write_Bool
	.p2align	4
_Variant_Write_Bool:                    # @Variant_Write_Bool
# %bb.0:
	movl	4(%esp), %eax
	movw	$1536, 4(%eax)                  # imm = 0x600
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB33_2
# %bb.1:
	movzbl	8(%esp), %ecx
	movl	(%eax), %eax
	movb	%cl, (%eax)
LBB33_2:
	retl
                                        # -- End function
	.def	_Variant_Write_String;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_String           # -- Begin function Variant_Write_String
	.p2align	4
_Variant_Write_String:                  # @Variant_Write_String
# %bb.0:
	movl	4(%esp), %eax
	movw	$1346, 4(%eax)                  # imm = 0x542
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB34_2
# %bb.1:
	leal	8(%esp), %ecx
	movl	(%eax), %eax
	movl	79(%ecx), %edx
	movl	%edx, 79(%eax)
	movups	64(%ecx), %xmm0
	movups	%xmm0, 64(%eax)
	movups	48(%ecx), %xmm0
	movups	%xmm0, 48(%eax)
	movups	32(%ecx), %xmm0
	movups	%xmm0, 32(%eax)
	movups	(%ecx), %xmm0
	movups	16(%ecx), %xmm1
	movups	%xmm1, 16(%eax)
	movups	%xmm0, (%eax)
LBB34_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Array;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Array            # -- Begin function Variant_Write_Array
	.p2align	4
_Variant_Write_Array:                   # @Variant_Write_Array
# %bb.0:
	movl	4(%esp), %eax
	movw	$1058, 4(%eax)                  # imm = 0x422
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB35_2
# %bb.1:
	leal	8(%esp), %ecx
	movl	(%eax), %eax
	movzbl	2(%ecx), %edx
	movb	%dl, 2(%eax)
	movzwl	(%ecx), %ecx
	movw	%cx, (%eax)
LBB35_2:
	retl
                                        # -- End function
	.def	_Variant_Write;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write                  # -- Begin function Variant_Write
	.p2align	4
_Variant_Write:                         # @Variant_Write
# %bb.0:
	movl	8(%esp), %ecx
	movl	4(%esp), %eax
	movzwl	4(%ecx), %edx
	movw	%dx, 4(%eax)
	movl	6(%eax), %edx
	cmpb	$0, (%edx)
	je	LBB36_2
# %bb.1:
	movl	(%ecx), %ecx
	movsd	(%ecx), %xmm0                   # xmm0 = mem[0],zero
	movl	(%eax), %eax
	movsd	%xmm0, (%eax)
LBB36_2:
	retl
                                        # -- End function
	.def	_Variant_Read;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read                   # -- Begin function Variant_Read
	.p2align	4
_Variant_Read:                          # @Variant_Read
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	16(%esp), %edi
	movzwl	4(%edi), %ebx
	xorl	%edx, %edx
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	cmpl	$511, %ebx                      # imm = 0x1FF
	jle	LBB37_4
# %bb.1:
	cmpl	$1057, %ebx                     # imm = 0x421
	jg	LBB37_7
# %bb.2:
	leal	-512(%ebx), %esi
	cmpl	$3, %esi
	ja	LBB37_15
# %bb.3:
	jmpl	*LJTI37_2(,%esi,4)
LBB37_4:
	leal	-16(%ebx), %esi
	cmpl	$3, %esi
	jbe	LBB37_11
# %bb.5:
	addl	$-260, %ebx                     # imm = 0xFEFC
	cmpl	$3, %ebx
	ja	LBB37_25
# %bb.6:
	jmpl	*LJTI37_1(,%ebx,4)
LBB37_7:
	cmpl	$1345, %ebx                     # imm = 0x541
	jle	LBB37_19
# %bb.8:
	cmpl	$1346, %ebx                     # imm = 0x542
	je	LBB37_21
# %bb.9:
	cmpl	$1347, %ebx                     # imm = 0x543
	je	LBB37_18
# %bb.10:
	movl	$0, %esi
	cmpl	$1536, %ebx                     # imm = 0x600
	je	LBB37_12
	jmp	LBB37_23
LBB37_11:
	jmpl	*LJTI37_0(,%esi,4)
LBB37_12:
	movl	(%edi), %eax
	movzbl	(%eax), %eax
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	xorl	%edx, %edx
	jmp	LBB37_23
LBB37_13:
	movl	(%edi), %ecx
	movl	(%ecx), %eax
	movl	4(%ecx), %edx
	jmp	LBB37_22
LBB37_14:
	movl	(%edi), %eax
	movzwl	(%eax), %eax
	movl	%eax, %ecx
	shrl	$8, %ecx
	xorl	%esi, %esi
	jmp	LBB37_23
LBB37_15:
	cmpl	$782, %ebx                      # imm = 0x30E
	je	LBB37_18
# %bb.16:
	movl	$0, %esi
	cmpl	$783, %ebx                      # imm = 0x30F
	jne	LBB37_23
# %bb.17:
	movl	(%edi), %edx
	movl	(%edx), %eax
	movzwl	1(%edx), %ecx
	movl	%eax, %esi
	andl	$-65536, %esi                   # imm = 0xFFFF0000
	movl	4(%edx), %edx
	jmp	LBB37_23
LBB37_18:
	movl	(%edi), %eax
	movl	(%eax), %eax
	jmp	LBB37_22
LBB37_19:
	cmpl	$1058, %ebx                     # imm = 0x422
	je	LBB37_21
# %bb.20:
	cmpl	$1060, %ebx                     # imm = 0x424
	jne	LBB37_25
LBB37_21:
	movl	(%edi), %eax
LBB37_22:
	movl	%eax, %ecx
	shrl	$8, %ecx
	movl	%eax, %esi
	andl	$-65536, %esi                   # imm = 0xFFFF0000
LBB37_23:
	shll	$8, %ecx
	movzbl	%al, %eax
	orl	%ecx, %eax
	movzwl	%ax, %eax
	orl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
LBB37_25:
	xorl	%esi, %esi
	jmp	LBB37_23
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI37_0:
	.long	LBB37_12
	.long	LBB37_14
	.long	LBB37_18
	.long	LBB37_13
LJTI37_1:
	.long	LBB37_12
	.long	LBB37_14
	.long	LBB37_18
	.long	LBB37_13
LJTI37_2:
	.long	LBB37_12
	.long	LBB37_14
	.long	LBB37_18
	.long	LBB37_13
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_VARIANT_EMPTY                  # @VARIANT_EMPTY
_VARIANT_EMPTY:
	.zero	15

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
	.globl	__fltused
