	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"type.c"
	.def	_Type_GetSize;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Type_GetSize                   # -- Begin function Type_GetSize
	.p2align	4
_Type_GetSize:                          # @Type_GetSize
# %bb.0:
	movl	4(%esp), %edx
	movzwl	4(%edx), %ecx
	movl	$1, %eax
	cmpl	$781, %ecx                      # imm = 0x30D
	jg	LBB0_5
# %bb.1:
	leal	-16(%ecx), %edx
	cmpl	$3, %edx
	jbe	LBB0_21
# %bb.2:
	leal	-260(%ecx), %edx
	cmpl	$3, %edx
	jbe	LBB0_22
# %bb.3:
	addl	$-512, %ecx                     # imm = 0xFE00
	cmpl	$3, %ecx
	ja	LBB0_13
# %bb.4:
	jmpl	*LJTI0_2(,%ecx,4)
LBB0_20:
	retl
LBB0_5:
	cmpl	$1345, %ecx                     # imm = 0x541
	jg	LBB0_10
# %bb.6:
	leal	-1058(%ecx), %eax
	cmpl	$3, %eax
	jae	LBB0_7
# %bb.18:
	movl	6(%edx), %eax
	testl	%eax, %eax
	je	LBB0_13
# %bb.19:
	movzwl	5(%eax), %eax
	retl
LBB0_10:
	cmpl	$1535, %ecx                     # imm = 0x5FF
	jg	LBB0_14
# %bb.11:
	cmpl	$1346, %ecx                     # imm = 0x542
	je	LBB0_17
# %bb.12:
	cmpl	$1347, %ecx                     # imm = 0x543
	je	LBB0_16
	jmp	LBB0_13
LBB0_21:
	jmpl	*LJTI0_0(,%edx,4)
LBB0_22:
	jmpl	*LJTI0_1(,%edx,4)
LBB0_23:
	movl	$2, %eax
	retl
LBB0_7:
	cmpl	$782, %ecx                      # imm = 0x30E
	je	LBB0_16
# %bb.8:
	cmpl	$783, %ecx                      # imm = 0x30F
	jne	LBB0_13
LBB0_9:
	movl	$8, %eax
	retl
LBB0_14:
	cmpl	$1536, %ecx                     # imm = 0x600
	je	LBB0_20
# %bb.15:
	cmpl	$32769, %ecx                    # imm = 0x8001
	jne	LBB0_13
LBB0_16:
	movl	$4, %eax
	retl
LBB0_13:
	xorl	%eax, %eax
	retl
LBB0_17:
	movl	$83, %eax
	retl
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI0_0:
	.long	LBB0_20
	.long	LBB0_23
	.long	LBB0_16
	.long	LBB0_9
LJTI0_1:
	.long	LBB0_20
	.long	LBB0_23
	.long	LBB0_16
	.long	LBB0_9
LJTI0_2:
	.long	LBB0_20
	.long	LBB0_23
	.long	LBB0_16
	.long	LBB0_9
                                        # -- End function
	.def	_Type_GetName;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Type_GetName                   # -- Begin function Type_GetName
	.p2align	4
_Type_GetName:                          # @Type_GetName
# %bb.0:
	movl	_typematch, %eax
	testl	%eax, %eax
	je	LBB1_1
# %bb.3:
	movzwl	4(%esp), %ecx
	cmpw	_typematch+4, %cx
	je	LBB1_2
# %bb.4:                                # %.preheader.preheader
	movl	$_typematch+18, %edx
	.p2align	4
LBB1_5:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	-4(%edx), %eax
	testl	%eax, %eax
	je	LBB1_1
# %bb.6:                                #   in Loop: Header=BB1_5 Depth=1
	cmpw	(%edx), %cx
	leal	14(%edx), %edx
	jne	LBB1_5
LBB1_2:                                 # %.loopexit
	retl
LBB1_1:
	xorl	%eax, %eax
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.section	.rdata,"dr",discard,"??_C@_05NCFAHBAN@BOOL?$CD?$AA@"
	.globl	"??_C@_05NCFAHBAN@BOOL?$CD?$AA@" # @"??_C@_05NCFAHBAN@BOOL?$CD?$AA@"
"??_C@_05NCFAHBAN@BOOL?$CD?$AA@":
	.asciz	"BOOL#"

	.section	.rdata,"dr",discard,"??_C@_05DPBDMADO@SINT?$CD?$AA@"
	.globl	"??_C@_05DPBDMADO@SINT?$CD?$AA@" # @"??_C@_05DPBDMADO@SINT?$CD?$AA@"
"??_C@_05DPBDMADO@SINT?$CD?$AA@":
	.asciz	"SINT#"

	.section	.rdata,"dr",discard,"??_C@_04MCOJOMNJ@INT?$CD?$AA@"
	.globl	"??_C@_04MCOJOMNJ@INT?$CD?$AA@" # @"??_C@_04MCOJOMNJ@INT?$CD?$AA@"
"??_C@_04MCOJOMNJ@INT?$CD?$AA@":
	.asciz	"INT#"

	.section	.rdata,"dr",discard,"??_C@_05CBMAPCBN@DINT?$CD?$AA@"
	.globl	"??_C@_05CBMAPCBN@DINT?$CD?$AA@" # @"??_C@_05CBMAPCBN@DINT?$CD?$AA@"
"??_C@_05CBMAPCBN@DINT?$CD?$AA@":
	.asciz	"DINT#"

	.section	.rdata,"dr",discard,"??_C@_05MNJDHAHA@LINT?$CD?$AA@"
	.globl	"??_C@_05MNJDHAHA@LINT?$CD?$AA@" # @"??_C@_05MNJDHAHA@LINT?$CD?$AA@"
"??_C@_05MNJDHAHA@LINT?$CD?$AA@":
	.asciz	"LINT#"

	.section	.rdata,"dr",discard,"??_C@_06GCFAHIPD@USINT?$CD?$AA@"
	.globl	"??_C@_06GCFAHIPD@USINT?$CD?$AA@" # @"??_C@_06GCFAHIPD@USINT?$CD?$AA@"
"??_C@_06GCFAHIPD@USINT?$CD?$AA@":
	.asciz	"USINT#"

	.section	.rdata,"dr",discard,"??_C@_05OJEKCDCD@UINT?$CD?$AA@"
	.globl	"??_C@_05OJEKCDCD@UINT?$CD?$AA@" # @"??_C@_05OJEKCDCD@UINT?$CD?$AA@"
"??_C@_05OJEKCDCD@UINT?$CD?$AA@":
	.asciz	"UINT#"

	.section	.rdata,"dr",discard,"??_C@_06HMIDEKNA@UDINT?$CD?$AA@"
	.globl	"??_C@_06HMIDEKNA@UDINT?$CD?$AA@" # @"??_C@_06HMIDEKNA@UDINT?$CD?$AA@"
"??_C@_06HMIDEKNA@UDINT?$CD?$AA@":
	.asciz	"UDINT#"

	.section	.rdata,"dr",discard,"??_C@_06JANAMILN@ULINT?$CD?$AA@"
	.globl	"??_C@_06JANAMILN@ULINT?$CD?$AA@" # @"??_C@_06JANAMILN@ULINT?$CD?$AA@"
"??_C@_06JANAMILN@ULINT?$CD?$AA@":
	.asciz	"ULINT#"

	.section	.rdata,"dr",discard,"??_C@_05CNEHJGCP@TIME?$CD?$AA@"
	.globl	"??_C@_05CNEHJGCP@TIME?$CD?$AA@" # @"??_C@_05CNEHJGCP@TIME?$CD?$AA@"
"??_C@_05CNEHJGCP@TIME?$CD?$AA@":
	.asciz	"TIME#"

	.section	.rdata,"dr",discard,"??_C@_05HLOJBMAE@REAL?$CD?$AA@"
	.globl	"??_C@_05HLOJBMAE@REAL?$CD?$AA@" # @"??_C@_05HLOJBMAE@REAL?$CD?$AA@"
"??_C@_05HLOJBMAE@REAL?$CD?$AA@":
	.asciz	"REAL#"

	.section	.rdata,"dr",discard,"??_C@_06NEOMHNNE@LREAL?$CD?$AA@"
	.globl	"??_C@_06NEOMHNNE@LREAL?$CD?$AA@" # @"??_C@_06NEOMHNNE@LREAL?$CD?$AA@"
"??_C@_06NEOMHNNE@LREAL?$CD?$AA@":
	.asciz	"LREAL#"

	.section	.rdata,"dr",discard,"??_C@_05LFDJPIDO@BYTE?$CD?$AA@"
	.globl	"??_C@_05LFDJPIDO@BYTE?$CD?$AA@" # @"??_C@_05LFDJPIDO@BYTE?$CD?$AA@"
"??_C@_05LFDJPIDO@BYTE?$CD?$AA@":
	.asciz	"BYTE#"

	.section	.rdata,"dr",discard,"??_C@_05CNCLDMNP@WORD?$CD?$AA@"
	.globl	"??_C@_05CNCLDMNP@WORD?$CD?$AA@" # @"??_C@_05CNCLDMNP@WORD?$CD?$AA@"
"??_C@_05CNCLDMNP@WORD?$CD?$AA@":
	.asciz	"WORD#"

	.section	.rdata,"dr",discard,"??_C@_06LBMBBDGI@DWORD?$CD?$AA@"
	.globl	"??_C@_06LBMBBDGI@DWORD?$CD?$AA@" # @"??_C@_06LBMBBDGI@DWORD?$CD?$AA@"
"??_C@_06LBMBBDGI@DWORD?$CD?$AA@":
	.asciz	"DWORD#"

	.section	.rdata,"dr",discard,"??_C@_06IECHKAAB@QWORD?$CD?$AA@"
	.globl	"??_C@_06IECHKAAB@QWORD?$CD?$AA@" # @"??_C@_06IECHKAAB@QWORD?$CD?$AA@"
"??_C@_06IECHKAAB@QWORD?$CD?$AA@":
	.asciz	"QWORD#"

	.section	.rdata,"dr",discard,"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@"
	.globl	"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@" # @"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@"
"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@":
	.asciz	"FUNCTION#"

	.section	.rdata,"dr",discard,"??_C@_07DCPMEJPJ@STRING?$CD?$AA@"
	.globl	"??_C@_07DCPMEJPJ@STRING?$CD?$AA@" # @"??_C@_07DCPMEJPJ@STRING?$CD?$AA@"
"??_C@_07DCPMEJPJ@STRING?$CD?$AA@":
	.asciz	"STRING#"

	.section	.rdata,"dr",discard,"??_C@_06HNBGDGBN@ARRAY?$CD?$AA@"
	.globl	"??_C@_06HNBGDGBN@ARRAY?$CD?$AA@" # @"??_C@_06HNBGDGBN@ARRAY?$CD?$AA@"
"??_C@_06HNBGDGBN@ARRAY?$CD?$AA@":
	.asciz	"ARRAY#"

	.section	.rdata,"dr",discard,"??_C@_07HLOGPGIO@STRUCT?$CD?$AA@"
	.globl	"??_C@_07HLOGPGIO@STRUCT?$CD?$AA@" # @"??_C@_07HLOGPGIO@STRUCT?$CD?$AA@"
"??_C@_07HLOGPGIO@STRUCT?$CD?$AA@":
	.asciz	"STRUCT#"

	.section	.rdata,"dr",discard,"??_C@_04PKEBDEEL@ANY?$CD?$AA@"
	.globl	"??_C@_04PKEBDEEL@ANY?$CD?$AA@" # @"??_C@_04PKEBDEEL@ANY?$CD?$AA@"
"??_C@_04PKEBDEEL@ANY?$CD?$AA@":
	.asciz	"ANY#"

	.data
	.globl	_typematch                      # @typematch
	.p2align	2, 0x0
_typematch:
	.long	"??_C@_05NCFAHBAN@BOOL?$CD?$AA@"
	.short	1536                            # 0x600
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	"??_C@_05DPBDMADO@SINT?$CD?$AA@"
	.short	260                             # 0x104
	.long	2                               # 0x2
	.long	1                               # 0x1
	.long	"??_C@_04MCOJOMNJ@INT?$CD?$AA@"
	.short	261                             # 0x105
	.long	4                               # 0x4
	.long	2                               # 0x2
	.long	"??_C@_05CBMAPCBN@DINT?$CD?$AA@"
	.short	262                             # 0x106
	.long	6                               # 0x6
	.long	4                               # 0x4
	.long	"??_C@_05MNJDHAHA@LINT?$CD?$AA@"
	.short	263                             # 0x107
	.long	8                               # 0x8
	.long	8                               # 0x8
	.long	"??_C@_06GCFAHIPD@USINT?$CD?$AA@"
	.short	512                             # 0x200
	.long	3                               # 0x3
	.long	1                               # 0x1
	.long	"??_C@_05OJEKCDCD@UINT?$CD?$AA@"
	.short	513                             # 0x201
	.long	5                               # 0x5
	.long	2                               # 0x2
	.long	"??_C@_06HMIDEKNA@UDINT?$CD?$AA@"
	.short	514                             # 0x202
	.long	7                               # 0x7
	.long	4                               # 0x4
	.long	"??_C@_06JANAMILN@ULINT?$CD?$AA@"
	.short	515                             # 0x203
	.long	9                               # 0x9
	.long	8                               # 0x8
	.long	"??_C@_05CNEHJGCP@TIME?$CD?$AA@"
	.short	1347                            # 0x543
	.long	7                               # 0x7
	.long	4                               # 0x4
	.long	"??_C@_05HLOJBMAE@REAL?$CD?$AA@"
	.short	782                             # 0x30e
	.long	10                              # 0xa
	.long	4                               # 0x4
	.long	"??_C@_06NEOMHNNE@LREAL?$CD?$AA@"
	.short	783                             # 0x30f
	.long	11                              # 0xb
	.long	8                               # 0x8
	.long	"??_C@_05LFDJPIDO@BYTE?$CD?$AA@"
	.short	16                              # 0x10
	.long	3                               # 0x3
	.long	1                               # 0x1
	.long	"??_C@_05CNCLDMNP@WORD?$CD?$AA@"
	.short	17                              # 0x11
	.long	5                               # 0x5
	.long	2                               # 0x2
	.long	"??_C@_06LBMBBDGI@DWORD?$CD?$AA@"
	.short	18                              # 0x12
	.long	7                               # 0x7
	.long	4                               # 0x4
	.long	"??_C@_06IECHKAAB@QWORD?$CD?$AA@"
	.short	19                              # 0x13
	.long	9                               # 0x9
	.long	8                               # 0x8
	.long	"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@"
	.short	1059                            # 0x423
	.long	13                              # 0xd
	.long	4294967295                      # 0xffffffff
	.long	"??_C@_07DCPMEJPJ@STRING?$CD?$AA@"
	.short	1346                            # 0x542
	.long	13                              # 0xd
	.long	83                              # 0x53
	.long	"??_C@_06HNBGDGBN@ARRAY?$CD?$AA@"
	.short	1058                            # 0x422
	.long	13                              # 0xd
	.long	4294967295                      # 0xffffffff
	.long	"??_C@_07HLOGPGIO@STRUCT?$CD?$AA@"
	.short	1060                            # 0x424
	.long	13                              # 0xd
	.long	4294967295                      # 0xffffffff
	.long	"??_C@_04PKEBDEEL@ANY?$CD?$AA@"
	.short	32769                           # 0x8001
	.long	7                               # 0x7
	.long	4                               # 0x4
	.zero	14

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
