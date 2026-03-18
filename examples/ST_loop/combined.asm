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
	pushl	$15
	pushl	$"??_C@_0BG@NADEDGPL@STloop?$CI?$CJ?5returned?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	movl	$15, %eax
	retl
                                        # -- End function
	.def	_STloop;
	.scl	2;
	.type	32;
	.endef
	.globl	_STloop                         # -- Begin function STloop
	.p2align	4
_STloop:                                # @STloop
# %bb.0:                                # %entry
	movl	$15, %eax
	retl
                                        # -- End function
	.section	.rdata,"dr",discard,"??_C@_0BG@NADEDGPL@STloop?$CI?$CJ?5returned?5?$CFd?6?$AA@"
	.globl	"??_C@_0BG@NADEDGPL@STloop?$CI?$CJ?5returned?5?$CFd?6?$AA@" # @"??_C@_0BG@NADEDGPL@STloop?$CI?$CJ?5returned?5?$CFd?6?$AA@"
"??_C@_0BG@NADEDGPL@STloop?$CI?$CJ?5returned?5?$CFd?6?$AA@":
	.asciz	"STloop() returned %d\n"

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
