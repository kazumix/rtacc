	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"basicfunction.c"
	.def	_Basicfunction_Load;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Basicfunction_Load             # -- Begin function Basicfunction_Load
	.p2align	4
_Basicfunction_Load:                    # @Basicfunction_Load
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	pushl	%esi
	calll	_INtime_RslLoad
	addl	$4, %esp
	movw	%ax, _hBasicFuncRSL
	testw	%ax, %ax
	je	LBB0_4
# %bb.1:
	movzwl	%ax, %eax
	pushl	$"??_C@_0P@FHFAIKGM@BasicFunctions?$AA@"
	pushl	%eax
	calll	_GetRtProcAddress
	addl	$8, %esp
	movl	%eax, _BasicFunctions
	movzwl	_hBasicFuncRSL, %eax
	pushl	$"??_C@_0BC@OECJMJAO@NumBasicFunctions?$AA@"
	pushl	%eax
	calll	_GetRtProcAddress
	addl	$8, %esp
	cmpl	$0, _BasicFunctions
	je	LBB0_5
# %bb.2:
	testl	%eax, %eax
	je	LBB0_5
# %bb.3:
	movzwl	(%eax), %eax
	movw	%ax, _NumBasicFunctions
	movl	$6, _status_basicfunc
LBB0_4:
	popl	%esi
	retl
LBB0_5:
	pushl	%esi
	pushl	$208
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_Basicfunction_Unload;
	.scl	2;
	.type	32;
	.endef
	.globl	_Basicfunction_Unload           # -- Begin function Basicfunction_Unload
	.p2align	4
_Basicfunction_Unload:                  # @Basicfunction_Unload
# %bb.0:
	movzwl	_hBasicFuncRSL, %eax
	testw	%ax, %ax
	je	LBB1_2
# %bb.1:
	movzwl	%ax, %eax
	pushl	%eax
	calll	_FreeRtLibrary
	addl	$4, %esp
	movw	$0, _hBasicFuncRSL
LBB1_2:
	movl	$0, _status_basicfunc
	retl
                                        # -- End function
	.def	_Basicfunction_CreateCatalog;
	.scl	2;
	.type	32;
	.endef
	.globl	_Basicfunction_CreateCatalog    # -- Begin function Basicfunction_CreateCatalog
	.p2align	4
_Basicfunction_CreateCatalog:           # @Basicfunction_CreateCatalog
# %bb.0:
	cmpw	$0, _NumBasicFunctions
	je	LBB2_7
# %bb.1:
	pushl	%edi
	pushl	%esi
	xorl	%esi, %esi
	movl	_BasicFunctions, %eax
	xorl	%edi, %edi
	jmp	LBB2_2
	.p2align	4
LBB2_4:                                 #   in Loop: Header=BB2_2 Depth=1
	movl	%ecx, _InstructionCatalog(,%edx,4)
LBB2_5:                                 #   in Loop: Header=BB2_2 Depth=1
	incl	%edi
	movzwl	_NumBasicFunctions, %ecx
	addl	$19, %esi
	cmpl	%ecx, %edi
	jae	LBB2_6
LBB2_2:                                 # =>This Inner Loop Header: Depth=1
	pushl	(%eax,%esi)
	calll	_Instruction_CalcHash
	addl	$4, %esp
	movzwl	%ax, %edx
	movl	_BasicFunctions, %eax
	leal	(%eax,%esi), %ecx
	cmpl	$0, _InstructionCatalog(,%edx,4)
	je	LBB2_4
# %bb.3:                                #   in Loop: Header=BB2_2 Depth=1
	pushl	(%ecx)
	pushl	$"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@"
	calll	_printf
	addl	$8, %esp
	movl	_BasicFunctions, %eax
	jmp	LBB2_5
LBB2_6:
	popl	%esi
	popl	%edi
LBB2_7:                                 # %.loopexit
	movl	$2, _status_basicfunc
	xorl	%eax, %eax
	retl
                                        # -- End function
	.def	_Basicfunction_Display;
	.scl	2;
	.type	32;
	.endef
	.globl	_Basicfunction_Display          # -- Begin function Basicfunction_Display
	.p2align	4
_Basicfunction_Display:                 # @Basicfunction_Display
# %bb.0:
	pushl	%edi
	pushl	%esi
	pushl	$L_str
	calll	_puts
	addl	$4, %esp
	cmpw	$0, _NumBasicFunctions
	je	LBB3_4
# %bb.1:                                # %.preheader.preheader
	movl	$1, %edi
	xorl	%esi, %esi
	.p2align	4
LBB3_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	_BasicFunctions, %eax
	pushl	13(%eax,%esi)
	pushl	(%eax,%esi)
	pushl	%edi
	pushl	$"??_C@_0BM@NHPPFOEA@?5?5function?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@"
	calll	_printf
	addl	$16, %esp
	movzwl	_NumBasicFunctions, %eax
	addl	$19, %esi
	cmpl	%eax, %edi
	leal	1(%edi), %edi
	jb	LBB3_2
	jmp	LBB3_3
LBB3_4:
	pushl	$L_str.1
	calll	_puts
	addl	$4, %esp
LBB3_3:                                 # %.loopexit
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_status_basicfunc               # @status_basicfunc
	.p2align	2, 0x0
_status_basicfunc:
	.long	0                               # 0x0

	.globl	_BasicFunctions                 # @BasicFunctions
	.p2align	2, 0x0
_BasicFunctions:
	.long	0

	.globl	_NumBasicFunctions              # @NumBasicFunctions
	.p2align	1, 0x0
_NumBasicFunctions:
	.short	0                               # 0x0

	.lcomm	_hBasicFuncRSL,2,2              # @hBasicFuncRSL
	.section	.rdata,"dr",discard,"??_C@_0P@FHFAIKGM@BasicFunctions?$AA@"
	.globl	"??_C@_0P@FHFAIKGM@BasicFunctions?$AA@" # @"??_C@_0P@FHFAIKGM@BasicFunctions?$AA@"
"??_C@_0P@FHFAIKGM@BasicFunctions?$AA@":
	.asciz	"BasicFunctions"

	.section	.rdata,"dr",discard,"??_C@_0BC@OECJMJAO@NumBasicFunctions?$AA@"
	.globl	"??_C@_0BC@OECJMJAO@NumBasicFunctions?$AA@" # @"??_C@_0BC@OECJMJAO@NumBasicFunctions?$AA@"
"??_C@_0BC@OECJMJAO@NumBasicFunctions?$AA@":
	.asciz	"NumBasicFunctions"

	.section	.rdata,"dr",discard,"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@"
	.globl	"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@" # @"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@"
"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@":
	.asciz	"instruction hash conflict! %s. skipped.\n"

	.section	.rdata,"dr",discard,"??_C@_0BM@NHPPFOEA@?5?5function?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@"
	.globl	"??_C@_0BM@NHPPFOEA@?5?5function?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@" # @"??_C@_0BM@NHPPFOEA@?5?5function?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@"
"??_C@_0BM@NHPPFOEA@?5?5function?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@":
	.asciz	"  function(%03d) %-14s  %p\n"

	.section	.rdata,"dr"
L_str:                                  # @str
	.asciz	"Basicfunction list"

L_str.1:                                # @str.1
	.asciz	"  N/A"

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
