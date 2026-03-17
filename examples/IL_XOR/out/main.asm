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
	pushl	$L_str
	calll	_puts
	addl	$4, %esp
	pushl	$0
	pushl	$0
	calll	_XOR_FUNC
	addl	$8, %esp
	pushl	%eax
	pushl	$"??_C@_0M@CCDLDBPH@0?5?$FO?50?5?$DN?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$1
	pushl	$0
	calll	_XOR_FUNC
	addl	$8, %esp
	pushl	%eax
	pushl	$"??_C@_0M@OOJBDBGJ@0?5?$FO?51?5?$DN?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$0
	pushl	$1
	calll	_XOR_FUNC
	addl	$8, %esp
	pushl	%eax
	pushl	$"??_C@_0M@LJJOHNJI@1?5?$FO?50?5?$DN?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$1
	pushl	$1
	calll	_XOR_FUNC
	addl	$8, %esp
	pushl	%eax
	pushl	$"??_C@_0M@HFDEHNAG@1?5?$FO?51?5?$DN?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	xorl	%eax, %eax
	retl
                                        # -- End function
	.section	.rdata,"dr",discard,"??_C@_0M@CCDLDBPH@0?5?$FO?50?5?$DN?5?$CFd?6?$AA@"
	.globl	"??_C@_0M@CCDLDBPH@0?5?$FO?50?5?$DN?5?$CFd?6?$AA@" # @"??_C@_0M@CCDLDBPH@0?5?$FO?50?5?$DN?5?$CFd?6?$AA@"
"??_C@_0M@CCDLDBPH@0?5?$FO?50?5?$DN?5?$CFd?6?$AA@":
	.asciz	"0 ^ 0 = %d\n"

	.section	.rdata,"dr",discard,"??_C@_0M@OOJBDBGJ@0?5?$FO?51?5?$DN?5?$CFd?6?$AA@"
	.globl	"??_C@_0M@OOJBDBGJ@0?5?$FO?51?5?$DN?5?$CFd?6?$AA@" # @"??_C@_0M@OOJBDBGJ@0?5?$FO?51?5?$DN?5?$CFd?6?$AA@"
"??_C@_0M@OOJBDBGJ@0?5?$FO?51?5?$DN?5?$CFd?6?$AA@":
	.asciz	"0 ^ 1 = %d\n"

	.section	.rdata,"dr",discard,"??_C@_0M@LJJOHNJI@1?5?$FO?50?5?$DN?5?$CFd?6?$AA@"
	.globl	"??_C@_0M@LJJOHNJI@1?5?$FO?50?5?$DN?5?$CFd?6?$AA@" # @"??_C@_0M@LJJOHNJI@1?5?$FO?50?5?$DN?5?$CFd?6?$AA@"
"??_C@_0M@LJJOHNJI@1?5?$FO?50?5?$DN?5?$CFd?6?$AA@":
	.asciz	"1 ^ 0 = %d\n"

	.section	.rdata,"dr",discard,"??_C@_0M@HFDEHNAG@1?5?$FO?51?5?$DN?5?$CFd?6?$AA@"
	.globl	"??_C@_0M@HFDEHNAG@1?5?$FO?51?5?$DN?5?$CFd?6?$AA@" # @"??_C@_0M@HFDEHNAG@1?5?$FO?51?5?$DN?5?$CFd?6?$AA@"
"??_C@_0M@HFDEHNAG@1?5?$FO?51?5?$DN?5?$CFd?6?$AA@":
	.asciz	"1 ^ 1 = %d\n"

	.section	.rdata,"dr"
L_str:                                  # @str
	.asciz	"XOR test:"

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
