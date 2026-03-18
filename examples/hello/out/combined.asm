	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"main.c"
	.def	_main;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_main                           # -- Begin function main
	.p2align	4
_main:                                  # @main
# %bb.0:
	pushl	%esi
	xorl	%esi, %esi
	.p2align	4
LBB0_1:                                 # =>This Inner Loop Header: Depth=1
	pushl	$100
	calll	_RtSleep
	addl	$4, %esp
	pushl	%esi
	pushl	$"??_C@_0BB@IHCNNFND@Hello?5rtacc?$CB?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	incl	%esi
	cmpl	$50, %esi
	jne	LBB0_1
# %bb.2:
	xorl	%eax, %eax
	popl	%esi
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.section	.rdata,"dr",discard,"??_C@_0BB@IHCNNFND@Hello?5rtacc?$CB?5?$CFd?6?$AA@"
	.globl	"??_C@_0BB@IHCNNFND@Hello?5rtacc?$CB?5?$CFd?6?$AA@" # @"??_C@_0BB@IHCNNFND@Hello?5rtacc?$CB?5?$CFd?6?$AA@"
"??_C@_0BB@IHCNNFND@Hello?5rtacc?$CB?5?$CFd?6?$AA@":
	.asciz	"Hello rtacc! %d\n"

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
