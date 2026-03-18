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
	pushl	$L_str
	calll	_puts
	addl	$4, %esp
	pushl	$0
	pushl	$"??_C@_0M@CCDLDBPH@0?5?$FO?50?5?$DN?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$1
	pushl	$"??_C@_0M@OOJBDBGJ@0?5?$FO?51?5?$DN?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$1
	pushl	$"??_C@_0M@LJJOHNJI@1?5?$FO?50?5?$DN?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$0
	pushl	$"??_C@_0M@HFDEHNAG@1?5?$FO?51?5?$DN?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	xorl	%eax, %eax
	retl
                                        # -- End function
	.def	_XOR_FUNC;
	.scl	2;
	.type	32;
	.endef
	.globl	_XOR_FUNC                       # -- Begin function XOR_FUNC
	.p2align	4
_XOR_FUNC:                              # @XOR_FUNC
# %bb.0:                                # %entry
	movzbl	4(%esp), %eax
	xorb	8(%esp), %al
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
