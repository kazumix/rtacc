	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"logic.c"
	.def	_Logic_Add;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Logic_Add                      # -- Begin function Logic_Add
	.p2align	4
_Logic_Add:                             # @Logic_Add
# %bb.0:
	pushl	$"??_C@_09IGONEJKP@Logic_Add?$AA@"
	pushl	$28
	calll	_Heap_Alloc
	addl	$8, %esp
	movups	4(%esp), %xmm0
	movups	%xmm0, (%eax)
	movl	$0, 24(%eax)
	cmpl	$0, _plcLogic
	je	LBB0_1
# %bb.2:
	movl	_plcLogicBottom, %ecx
	movl	%eax, 24(%ecx)
	jmp	LBB0_3
LBB0_1:
	movl	%eax, _plcLogic
LBB0_3:
	movl	%eax, _plcLogicBottom
	movl	$2, _status_logic
	retl
                                        # -- End function
	.def	_Logic_Clear;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_Clear                    # -- Begin function Logic_Clear
	.p2align	4
_Logic_Clear:                           # @Logic_Clear
# %bb.0:
	movl	_plcLogic, %eax
	testl	%eax, %eax
	je	LBB1_4
# %bb.1:                                # %.preheader.preheader
	pushl	%esi
	.p2align	4
LBB1_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	24(%eax), %esi
	pushl	%eax
	calll	_Heap_Free
	addl	$4, %esp
	movl	%esi, _plcLogic
	movl	%esi, %eax
	testl	%esi, %esi
	jne	LBB1_2
# %bb.3:
	popl	%esi
LBB1_4:                                 # %.loopexit
	movl	$0, _plcLogic
	movl	$0, _plcLogicBottom
	movl	$0, _status_logic
	retl
                                        # -- End function
	.def	_Logic_Display;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_Display                  # -- Begin function Logic_Display
	.p2align	4
_Logic_Display:                         # @Logic_Display
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	$L_str
	calll	_puts
	addl	$4, %esp
	movl	_RUNplcLogic, %esi
	testl	%esi, %esi
	je	LBB2_4
# %bb.1:                                # %.preheader.preheader
	movl	$1, %edi
	xorl	%ebx, %ebx
	.p2align	4
LBB2_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	(%esi), %eax
	movl	12(%esi), %ecx
	cmpl	$_VARIANT_EMPTY, %ecx
	cmovel	%ebx, %ecx
	movl	8(%esi), %edx
	cmpl	$_VARIANT_EMPTY, %edx
	cmovel	%ebx, %edx
	movl	4(%esi), %ebp
	cmpl	$_VARIANT_EMPTY, %ebp
	cmovel	%ebx, %ebp
	pushl	13(%eax)
	pushl	%ecx
	pushl	%edx
	pushl	%ebp
	pushl	(%eax)
	pushl	%esi
	pushl	%edi
	pushl	$"??_C@_0CF@BIIKPHMI@?5?5line?$CI?$CF03d?$CJ?5?$CFp?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5@"
	calll	_printf
	addl	$32, %esp
	movl	24(%esi), %esi
	incl	%edi
	testl	%esi, %esi
	jne	LBB2_2
# %bb.3:
	pushl	$L_str.1
	calll	_puts
	addl	$4, %esp
	movl	_RUNplcentrypoint, %eax
	testl	%eax, %eax
	je	LBB2_4
# %bb.6:
	pushl	%eax
	pushl	$"??_C@_0BE@CKMLNBAF@?5?5entry?5point?3?5?5?$CFp?6?$AA@"
	calll	_printf
	addl	$8, %esp
	jmp	LBB2_5
LBB2_4:
	pushl	$L_str.5
	calll	_puts
	addl	$4, %esp
LBB2_5:
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Logic_Convert_To_Clanguage;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_Convert_To_Clanguage     # -- Begin function Logic_Convert_To_Clanguage
	.p2align	4
_Logic_Convert_To_Clanguage:            # @Logic_Convert_To_Clanguage
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %esi
	movl	_plcLogic, %edi
	pushl	%esi
	pushl	$1
	pushl	$123
	pushl	$"??_C@_0HM@OIDHGGKG@?$CDinclude?5?$DMPLCINST?4h?$DO?6int?5main?$CIin@"
	calll	_fwrite
	addl	$16, %esp
	testl	%edi, %edi
	je	LBB3_3
	.p2align	4
LBB3_1:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	(%edi), %eax
	pushl	12(%edi)
	pushl	8(%edi)
	pushl	4(%edi)
	pushl	(%eax)
	pushl	$"??_C@_0BI@JHDIMNMC@?7a?$DN?$CFs?$CI?5a?5?0?$CFp?0?5?$CFp?0?5?$CFp?$CJ?$DL?6?$AA@"
	pushl	%esi
	calll	_fprintf
	addl	$24, %esp
	movl	24(%edi), %edi
	testl	%edi, %edi
	jne	LBB3_1
LBB3_3:                                 # %.loopexit
	pushl	%esi
	pushl	$1
	pushl	$2
	pushl	$"??_C@_02KGHIDFGE@?$HN?6?$AA@"
	calll	_fwrite
	addl	$16, %esp
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Logic_RunPOU;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_RunPOU                   # -- Begin function Logic_RunPOU
	.p2align	4
_Logic_RunPOU:                          # @Logic_RunPOU
# %bb.0:
	pushl	%esi
	movl	12(%esp), %esi
	movl	8(%esp), %eax
	testl	%esi, %esi
	je	LBB4_6
	.p2align	4
LBB4_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	(%esi), %ecx
	pushl	12(%esi)
	pushl	8(%esi)
	pushl	4(%esi)
	pushl	%eax
	calll	*13(%ecx)
	addl	$16, %esp
	movl	(%eax), %ecx
	testl	%ecx, %ecx
	je	LBB4_4
# %bb.3:                                #   in Loop: Header=BB4_2 Depth=1
	movsd	(%ecx), %xmm0                   # xmm0 = mem[0],zero
	movsd	%xmm0, 16(%esi)
LBB4_4:                                 #   in Loop: Header=BB4_2 Depth=1
	cmpb	$1, 11(%eax)
	je	LBB4_5
# %bb.7:                                #   in Loop: Header=BB4_2 Depth=1
	movl	24(%esi), %esi
	testl	%esi, %esi
	jne	LBB4_2
LBB4_6:                                 # %.loopexit
	popl	%esi
	retl
LBB4_5:
	movb	$0, 11(%eax)
	popl	%esi
	retl
                                        # -- End function
	.def	_Logic_Scan;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_Scan                     # -- Begin function Logic_Scan
	.p2align	4
_Logic_Scan:                            # @Logic_Scan
# %bb.0:
	pushl	%esi
	subl	$100, %esp
	movl	_RUNplcentrypoint, %esi
	testl	%esi, %esi
	je	LBB5_7
# %bb.1:
	xorps	%xmm0, %xmm0
	movsd	%xmm0, 4(%esp)
	movl	$0, 11(%esp)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 80(%esp)
	movups	%xmm0, 64(%esp)
	movups	%xmm0, 48(%esp)
	movups	%xmm0, 32(%esp)
	movups	%xmm0, 16(%esp)
	movl	$0, 95(%esp)
	leal	16(%esp), %eax
	movl	%eax, (%esp)
	movl	%esp, %eax
	.p2align	4
LBB5_2:                                 # =>This Inner Loop Header: Depth=1
	movl	(%esi), %ecx
	pushl	12(%esi)
	pushl	8(%esi)
	pushl	4(%esi)
	pushl	%eax
	calll	*13(%ecx)
	addl	$16, %esp
	movl	(%eax), %ecx
	testl	%ecx, %ecx
	je	LBB5_4
# %bb.3:                                #   in Loop: Header=BB5_2 Depth=1
	movsd	(%ecx), %xmm0                   # xmm0 = mem[0],zero
	movsd	%xmm0, 16(%esi)
LBB5_4:                                 #   in Loop: Header=BB5_2 Depth=1
	cmpb	$1, 11(%eax)
	je	LBB5_5
# %bb.6:                                #   in Loop: Header=BB5_2 Depth=1
	movl	24(%esi), %esi
	testl	%esi, %esi
	jne	LBB5_2
	jmp	LBB5_7
LBB5_5:
	movb	$0, 11(%eax)
LBB5_7:
	addl	$100, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_Logic_Begin;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_Begin                    # -- Begin function Logic_Begin
	.p2align	4
_Logic_Begin:                           # @Logic_Begin
# %bb.0:
	pushl	%esi
	subl	$100, %esp
	movl	_RUNplcbeginpoint, %esi
	testl	%esi, %esi
	je	LBB6_7
# %bb.1:
	xorps	%xmm0, %xmm0
	movsd	%xmm0, 4(%esp)
	movl	$0, 11(%esp)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 80(%esp)
	movups	%xmm0, 64(%esp)
	movups	%xmm0, 48(%esp)
	movups	%xmm0, 32(%esp)
	movups	%xmm0, 16(%esp)
	movl	$0, 95(%esp)
	leal	16(%esp), %eax
	movl	%eax, (%esp)
	movl	%esp, %eax
	.p2align	4
LBB6_2:                                 # =>This Inner Loop Header: Depth=1
	movl	(%esi), %ecx
	pushl	12(%esi)
	pushl	8(%esi)
	pushl	4(%esi)
	pushl	%eax
	calll	*13(%ecx)
	addl	$16, %esp
	movl	(%eax), %ecx
	testl	%ecx, %ecx
	je	LBB6_4
# %bb.3:                                #   in Loop: Header=BB6_2 Depth=1
	movsd	(%ecx), %xmm0                   # xmm0 = mem[0],zero
	movsd	%xmm0, 16(%esi)
LBB6_4:                                 #   in Loop: Header=BB6_2 Depth=1
	cmpb	$1, 11(%eax)
	je	LBB6_5
# %bb.6:                                #   in Loop: Header=BB6_2 Depth=1
	movl	24(%esi), %esi
	testl	%esi, %esi
	jne	LBB6_2
	jmp	LBB6_7
LBB6_5:
	movb	$0, 11(%eax)
LBB6_7:
	addl	$100, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_Logic_Final;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_Final                    # -- Begin function Logic_Final
	.p2align	4
_Logic_Final:                           # @Logic_Final
# %bb.0:
	pushl	%esi
	subl	$100, %esp
	movl	_RUNplcfinalpoint, %esi
	testl	%esi, %esi
	je	LBB7_7
# %bb.1:
	xorps	%xmm0, %xmm0
	movsd	%xmm0, 4(%esp)
	movl	$0, 11(%esp)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 80(%esp)
	movups	%xmm0, 64(%esp)
	movups	%xmm0, 48(%esp)
	movups	%xmm0, 32(%esp)
	movups	%xmm0, 16(%esp)
	movl	$0, 95(%esp)
	leal	16(%esp), %eax
	movl	%eax, (%esp)
	movl	%esp, %eax
	.p2align	4
LBB7_2:                                 # =>This Inner Loop Header: Depth=1
	movl	(%esi), %ecx
	pushl	12(%esi)
	pushl	8(%esi)
	pushl	4(%esi)
	pushl	%eax
	calll	*13(%ecx)
	addl	$16, %esp
	movl	(%eax), %ecx
	testl	%ecx, %ecx
	je	LBB7_4
# %bb.3:                                #   in Loop: Header=BB7_2 Depth=1
	movsd	(%ecx), %xmm0                   # xmm0 = mem[0],zero
	movsd	%xmm0, 16(%esi)
LBB7_4:                                 #   in Loop: Header=BB7_2 Depth=1
	cmpb	$1, 11(%eax)
	je	LBB7_5
# %bb.6:                                #   in Loop: Header=BB7_2 Depth=1
	movl	24(%esi), %esi
	testl	%esi, %esi
	jne	LBB7_2
	jmp	LBB7_7
LBB7_5:
	movb	$0, 11(%eax)
LBB7_7:
	addl	$100, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_Logic_SetEntrypoint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_SetEntrypoint            # -- Begin function Logic_SetEntrypoint
	.p2align	4
_Logic_SetEntrypoint:                   # @Logic_SetEntrypoint
# %bb.0:
	movl	4(%esp), %eax
	movl	%eax, _plcentrypoint
	retl
                                        # -- End function
	.def	_Logic_SetBeginpoint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_SetBeginpoint            # -- Begin function Logic_SetBeginpoint
	.p2align	4
_Logic_SetBeginpoint:                   # @Logic_SetBeginpoint
# %bb.0:
	movl	4(%esp), %eax
	movl	%eax, _plcbeginpoint
	retl
                                        # -- End function
	.def	_Logic_SetFinalpoint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_SetFinalpoint            # -- Begin function Logic_SetFinalpoint
	.p2align	4
_Logic_SetFinalpoint:                   # @Logic_SetFinalpoint
# %bb.0:
	movl	4(%esp), %eax
	movl	%eax, _plcfinalpoint
	retl
                                        # -- End function
	.def	_Logic_Swap;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_Swap                     # -- Begin function Logic_Swap
	.p2align	4
_Logic_Swap:                            # @Logic_Swap
# %bb.0:
	movl	_RUNplcLogic, %eax
	movl	_plcLogic, %ecx
	movl	%ecx, _RUNplcLogic
	movl	%eax, _plcLogic
	testl	%eax, %eax
	je	LBB11_4
# %bb.1:                                # %.preheader.preheader
	pushl	%esi
	.p2align	4
LBB11_2:                                # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	24(%eax), %esi
	pushl	%eax
	calll	_Heap_Free
	addl	$4, %esp
	movl	%esi, _plcLogic
	movl	%esi, %eax
	testl	%esi, %esi
	jne	LBB11_2
# %bb.3:
	popl	%esi
LBB11_4:                                # %.loopexit
	movl	$0, _plcLogicBottom
	movl	$0, _status_logic
	movl	$0, _plcLogic
	movl	_plcentrypoint, %eax
	movl	%eax, _RUNplcentrypoint
	movl	$0, _plcentrypoint
	movl	_plcbeginpoint, %eax
	movl	%eax, _RUNplcbeginpoint
	movl	$0, _plcbeginpoint
	movl	_plcfinalpoint, %eax
	movl	%eax, _RUNplcfinalpoint
	movl	$0, _plcfinalpoint
	retl
                                        # -- End function
	.def	_Logic_Disasm;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_Disasm                   # -- Begin function Logic_Disasm
	.p2align	4
_Logic_Disasm:                          # @Logic_Disasm
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	$L_str.4
	calll	_puts
	addl	$4, %esp
	movl	_RUNplcLogic, %esi
	testl	%esi, %esi
	je	LBB12_4
# %bb.1:                                # %.preheader.preheader
	movl	$1, %edi
	xorl	%ebx, %ebx
	.p2align	4
LBB12_2:                                # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	12(%esi), %eax
	cmpl	$_VARIANT_EMPTY, %eax
	cmovel	%ebx, %eax
	movl	8(%esi), %ecx
	cmpl	$_VARIANT_EMPTY, %ecx
	cmovel	%ebx, %ecx
	movl	(%esi), %edx
	movl	4(%esi), %ebp
	cmpl	$_VARIANT_EMPTY, %ebp
	cmovel	%ebx, %ebp
	pushl	20(%esi)
	pushl	16(%esi)
	pushl	%eax
	pushl	%ecx
	pushl	%ebp
	pushl	(%edx)
	pushl	%edi
	pushl	$"??_C@_0CI@IHKJGMPN@?5?5line?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5?5?$CF0@"
	calll	_printf
	addl	$32, %esp
	movl	24(%esi), %esi
	incl	%edi
	testl	%esi, %esi
	jne	LBB12_2
	jmp	LBB12_3
LBB12_4:
	pushl	$L_str.5
	calll	_puts
	addl	$4, %esp
LBB12_3:                                # %.loopexit
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_status_logic                   # @status_logic
	.p2align	2, 0x0
_status_logic:
	.long	0                               # 0x0

	.globl	_plcLogic                       # @plcLogic
	.p2align	2, 0x0
_plcLogic:
	.long	0

	.globl	_plcLogicBottom                 # @plcLogicBottom
	.p2align	2, 0x0
_plcLogicBottom:
	.long	0

	.globl	_plcentrypoint                  # @plcentrypoint
	.p2align	2, 0x0
_plcentrypoint:
	.long	0

	.globl	_plcbeginpoint                  # @plcbeginpoint
	.p2align	2, 0x0
_plcbeginpoint:
	.long	0

	.globl	_plcfinalpoint                  # @plcfinalpoint
	.p2align	2, 0x0
_plcfinalpoint:
	.long	0

	.globl	_RUNplcLogic                    # @RUNplcLogic
	.p2align	2, 0x0
_RUNplcLogic:
	.long	0

	.globl	_RUNplcentrypoint               # @RUNplcentrypoint
	.p2align	2, 0x0
_RUNplcentrypoint:
	.long	0

	.globl	_RUNplcbeginpoint               # @RUNplcbeginpoint
	.p2align	2, 0x0
_RUNplcbeginpoint:
	.long	0

	.globl	_RUNplcfinalpoint               # @RUNplcfinalpoint
	.p2align	2, 0x0
_RUNplcfinalpoint:
	.long	0

	.section	.rdata,"dr",discard,"??_C@_09IGONEJKP@Logic_Add?$AA@"
	.globl	"??_C@_09IGONEJKP@Logic_Add?$AA@" # @"??_C@_09IGONEJKP@Logic_Add?$AA@"
"??_C@_09IGONEJKP@Logic_Add?$AA@":
	.asciz	"Logic_Add"

	.section	.rdata,"dr",discard,"??_C@_0CF@BIIKPHMI@?5?5line?$CI?$CF03d?$CJ?5?$CFp?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5@"
	.globl	"??_C@_0CF@BIIKPHMI@?5?5line?$CI?$CF03d?$CJ?5?$CFp?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5@" # @"??_C@_0CF@BIIKPHMI@?5?5line?$CI?$CF03d?$CJ?5?$CFp?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5@"
"??_C@_0CF@BIIKPHMI@?5?5line?$CI?$CF03d?$CJ?5?$CFp?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5@":
	.asciz	"  line(%03d) %p %14s  %p %p %p   %p\n"

	.section	.rdata,"dr",discard,"??_C@_0BE@CKMLNBAF@?5?5entry?5point?3?5?5?$CFp?6?$AA@"
	.globl	"??_C@_0BE@CKMLNBAF@?5?5entry?5point?3?5?5?$CFp?6?$AA@" # @"??_C@_0BE@CKMLNBAF@?5?5entry?5point?3?5?5?$CFp?6?$AA@"
"??_C@_0BE@CKMLNBAF@?5?5entry?5point?3?5?5?$CFp?6?$AA@":
	.asciz	"  entry point:  %p\n"

	.section	.rdata,"dr",discard,"??_C@_0HM@OIDHGGKG@?$CDinclude?5?$DMPLCINST?4h?$DO?6int?5main?$CIin@"
	.globl	"??_C@_0HM@OIDHGGKG@?$CDinclude?5?$DMPLCINST?4h?$DO?6int?5main?$CIin@" # @"??_C@_0HM@OIDHGGKG@?$CDinclude?5?$DMPLCINST?4h?$DO?6int?5main?$CIin@"
"??_C@_0HM@OIDHGGKG@?$CDinclude?5?$DMPLCINST?4h?$DO?6int?5main?$CIin@":
	.asciz	"#include <PLCINST.h>\nint main(int argc, char* argv[])\n{\n\treturn plcmain(argc, argv);\n}\nvoid seq_control(void)\n{\n\tBYTE\ta=0;\n"

	.section	.rdata,"dr",discard,"??_C@_0BI@JHDIMNMC@?7a?$DN?$CFs?$CI?5a?5?0?$CFp?0?5?$CFp?0?5?$CFp?$CJ?$DL?6?$AA@"
	.globl	"??_C@_0BI@JHDIMNMC@?7a?$DN?$CFs?$CI?5a?5?0?$CFp?0?5?$CFp?0?5?$CFp?$CJ?$DL?6?$AA@" # @"??_C@_0BI@JHDIMNMC@?7a?$DN?$CFs?$CI?5a?5?0?$CFp?0?5?$CFp?0?5?$CFp?$CJ?$DL?6?$AA@"
"??_C@_0BI@JHDIMNMC@?7a?$DN?$CFs?$CI?5a?5?0?$CFp?0?5?$CFp?0?5?$CFp?$CJ?$DL?6?$AA@":
	.asciz	"\ta=%s( a ,%p, %p, %p);\n"

	.section	.rdata,"dr",discard,"??_C@_02KGHIDFGE@?$HN?6?$AA@"
	.globl	"??_C@_02KGHIDFGE@?$HN?6?$AA@"  # @"??_C@_02KGHIDFGE@?$HN?6?$AA@"
"??_C@_02KGHIDFGE@?$HN?6?$AA@":
	.asciz	"}\n"

	.section	.rdata,"dr",discard,"??_C@_0CI@IHKJGMPN@?5?5line?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5?5?$CF0@"
	.globl	"??_C@_0CI@IHKJGMPN@?5?5line?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5?5?$CF0@" # @"??_C@_0CI@IHKJGMPN@?5?5line?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5?5?$CF0@"
"??_C@_0CI@IHKJGMPN@?5?5line?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5?5?$CF0@":
	.asciz	"  line(%03d) %14s  %p %p %p   %016I64x\n"

	.section	.rdata,"dr"
L_str:                                  # @str
	.asciz	"Logic list"

L_str.1:                                # @str.1
	.asciz	"Logic entrypoint"

L_str.4:                                # @str.4
	.asciz	"Logic Disasm"

L_str.5:                                # @str.5
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
	.addrsig_sym _VARIANT_EMPTY
