	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"functionblock.c"
	.def	_Functionblock_Dummy;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Functionblock_Dummy            # -- Begin function Functionblock_Dummy
	.p2align	4
_Functionblock_Dummy:                   # @Functionblock_Dummy
# %bb.0:
	retl
                                        # -- End function
	.def	_Functionblock_Add;
	.scl	2;
	.type	32;
	.endef
	.globl	_Functionblock_Add              # -- Begin function Functionblock_Add
	.p2align	4
_Functionblock_Add:                     # @Functionblock_Add
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %edi
	pushl	$"??_C@_0BI@KIBLMIFL@Functionblock_Add?3entry?$AA@"
	pushl	$20
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	%eax, %esi
	movl	$0, 16(%eax)
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	incl	%eax
	pushl	$"??_C@_0BH@GMAJPKBL@Functionblock_Add?3name?$AA@"
	pushl	%eax
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	%eax, (%esi)
	pushl	%edi
	pushl	%eax
	calll	_strcpy
	addl	$8, %esp
	cmpl	$0, _FbList
	je	LBB1_1
# %bb.2:
	movl	_FbBottom, %eax
	movl	%esi, 16(%eax)
	jmp	LBB1_3
LBB1_1:
	movl	%esi, _FbList
LBB1_3:
	movl	%esi, _FbBottom
	movl	$2, _status_funcblock
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Functionblock_AddConnector;
	.scl	2;
	.type	32;
	.endef
	.globl	_Functionblock_AddConnector     # -- Begin function Functionblock_AddConnector
	.p2align	4
_Functionblock_AddConnector:            # @Functionblock_AddConnector
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %esi
	movl	16(%esp), %edi
	pushl	$"??_C@_0BL@DLCPKPLN@Functionblock_AddConnector?$AA@"
	pushl	$14
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	$0, 10(%eax)
	movzwl	8(%edi), %ecx
	movw	%cx, 8(%eax)
	movsd	(%edi), %xmm0                   # xmm0 = mem[0],zero
	movsd	%xmm0, (%eax)
	movl	12(%esi), %ecx
	testl	%ecx, %ecx
	je	LBB2_1
	.p2align	4
LBB2_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	%ecx, %edx
	movl	10(%ecx), %ecx
	testl	%ecx, %ecx
	jne	LBB2_2
# %bb.3:
	movl	%eax, 10(%edx)
	jmp	LBB2_4
LBB2_1:
	movl	%eax, 12(%esi)
LBB2_4:
	movl	$2, _status_funcblock
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Functionblock_Search;
	.scl	2;
	.type	32;
	.endef
	.globl	_Functionblock_Search           # -- Begin function Functionblock_Search
	.p2align	4
_Functionblock_Search:                  # @Functionblock_Search
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	_FbList, %edi
	xorl	%esi, %esi
	testl	%edi, %edi
	je	LBB3_5
# %bb.1:                                # %.preheader.preheader
	movl	16(%esp), %ebx
	.p2align	4
LBB3_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebx
	pushl	(%edi)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB3_3
# %bb.4:                                #   in Loop: Header=BB3_2 Depth=1
	movl	16(%edi), %edi
	testl	%edi, %edi
	jne	LBB3_2
	jmp	LBB3_5
LBB3_3:
	movl	%edi, %esi
LBB3_5:                                 # %.loopexit
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Functionblock_Clear;
	.scl	2;
	.type	32;
	.endef
	.globl	_Functionblock_Clear            # -- Begin function Functionblock_Clear
	.p2align	4
_Functionblock_Clear:                   # @Functionblock_Clear
# %bb.0:
	pushl	%esi
	movl	_FbList, %esi
	testl	%esi, %esi
	je	LBB4_3
	.p2align	4
LBB4_1:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	(%esi)
	calll	_Heap_Free
	addl	$4, %esp
	movl	16(%esi), %esi
	pushl	_FbList
	calll	_Heap_Free
	addl	$4, %esp
	movl	%esi, _FbList
	testl	%esi, %esi
	jne	LBB4_1
LBB4_3:                                 # %.loopexit
	movl	$0, _FbBottom
	movl	$0, _FbList
	movl	$0, _status_funcblock
	popl	%esi
	retl
                                        # -- End function
	.def	_Functionblock_GetEntry;
	.scl	2;
	.type	32;
	.endef
	.globl	_Functionblock_GetEntry         # -- Begin function Functionblock_GetEntry
	.p2align	4
_Functionblock_GetEntry:                # @Functionblock_GetEntry
# %bb.0:
	pushl	4(%esp)
	calll	_Rtedge_GetStructureName
	addl	$4, %esp
	movzwl	_hBlockFuncRSL, %ecx
	pushl	%eax
	pushl	%ecx
	calll	_GetRtProcAddress
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_Functionblock_Load;
	.scl	2;
	.type	32;
	.endef
	.globl	_Functionblock_Load             # -- Begin function Functionblock_Load
	.p2align	4
_Functionblock_Load:                    # @Functionblock_Load
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	%eax
	movl	24(%esp), %edi
	pushl	%edi
	calll	_INtime_RslLoad
	addl	$4, %esp
	movw	%ax, _hBlockFuncRSL
	testw	%ax, %ax
	je	LBB6_17
# %bb.1:
	movzwl	%ax, %eax
	pushl	$"??_C@_0P@POEJAJGK@FunctionBlocks?$AA@"
	pushl	%eax
	calll	_GetRtProcAddress
	addl	$8, %esp
	movl	%eax, %esi
	movzwl	_hBlockFuncRSL, %eax
	pushl	$"??_C@_0BC@ENDAEKAI@NumFunctionBlocks?$AA@"
	pushl	%eax
	calll	_GetRtProcAddress
	addl	$8, %esp
	testl	%esi, %esi
	je	LBB6_3
# %bb.2:
	testl	%eax, %eax
	je	LBB6_3
# %bb.4:
	movzwl	(%eax), %eax
	movl	$6, _status_funcblock
	movl	%eax, (%esp)                    # 4-byte Spill
	testl	%eax, %eax
	je	LBB6_17
# %bb.5:                                # %.preheader5.preheader
	xorl	%ebp, %ebp
	jmp	LBB6_6
	.p2align	4
LBB6_16:                                # %.loopexit
                                        #   in Loop: Header=BB6_6 Depth=1
	incl	%ebp
	cmpl	(%esp), %ebp                    # 4-byte Folded Reload
	je	LBB6_17
LBB6_6:                                 # %.preheader5
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_11 Depth 2
                                        #       Child Loop BB6_13 Depth 3
	movl	(%esi,%ebp,4), %eax
	movl	(%eax), %ebx
	pushl	$"??_C@_0BI@KIBLMIFL@Functionblock_Add?3entry?$AA@"
	pushl	$20
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	%eax, %edi
	movl	$0, 16(%eax)
	pushl	%ebx
	calll	_strlen
	addl	$4, %esp
	incl	%eax
	pushl	$"??_C@_0BH@GMAJPKBL@Functionblock_Add?3name?$AA@"
	pushl	%eax
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	%eax, (%edi)
	pushl	%ebx
	pushl	%eax
	calll	_strcpy
	addl	$8, %esp
	cmpl	$0, _FbList
	je	LBB6_7
# %bb.8:                                #   in Loop: Header=BB6_6 Depth=1
	movl	_FbBottom, %eax
	movl	%edi, 16(%eax)
	jmp	LBB6_9
	.p2align	4
LBB6_7:                                 #   in Loop: Header=BB6_6 Depth=1
	movl	%edi, _FbList
LBB6_9:                                 #   in Loop: Header=BB6_6 Depth=1
	movl	%edi, _FbBottom
	movl	$2, _status_funcblock
	movl	(%esi,%ebp,4), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%edi)
	movl	(%esi,%ebp,4), %ebx
	cmpl	$0, 10(%ebx)
	je	LBB6_16
# %bb.10:                               #   in Loop: Header=BB6_6 Depth=1
	addl	$8, %ebx
	jmp	LBB6_11
	.p2align	4
LBB6_12:                                #   in Loop: Header=BB6_11 Depth=2
	movl	%eax, 12(%edi)
LBB6_15:                                #   in Loop: Header=BB6_11 Depth=2
	movl	$2, _status_funcblock
	cmpl	$0, 12(%ebx)
	leal	10(%ebx), %ebx
	je	LBB6_16
LBB6_11:                                #   Parent Loop BB6_6 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_13 Depth 3
	pushl	$"??_C@_0BL@DLCPKPLN@Functionblock_AddConnector?$AA@"
	pushl	$14
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	$0, 10(%eax)
	movzwl	8(%ebx), %ecx
	movw	%cx, 8(%eax)
	movsd	(%ebx), %xmm0                   # xmm0 = mem[0],zero
	movsd	%xmm0, (%eax)
	movl	12(%edi), %ecx
	testl	%ecx, %ecx
	je	LBB6_12
	.p2align	4
LBB6_13:                                # %.preheader
                                        #   Parent Loop BB6_6 Depth=1
                                        #     Parent Loop BB6_11 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	%ecx, %edx
	movl	10(%ecx), %ecx
	testl	%ecx, %ecx
	jne	LBB6_13
# %bb.14:                               #   in Loop: Header=BB6_11 Depth=2
	movl	%eax, 10(%edx)
	jmp	LBB6_15
LBB6_17:                                # %.loopexit6
	addl	$4, %esp
	jmp	LBB6_18
LBB6_3:
	pushl	%edi
	pushl	$208
	pushl	$0
	calll	_Errorlog_Add
	addl	$16, %esp
LBB6_18:                                # %.loopexit6
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Functionblock_Unload;
	.scl	2;
	.type	32;
	.endef
	.globl	_Functionblock_Unload           # -- Begin function Functionblock_Unload
	.p2align	4
_Functionblock_Unload:                  # @Functionblock_Unload
# %bb.0:
	movzwl	_hBlockFuncRSL, %eax
	testw	%ax, %ax
	je	LBB7_2
# %bb.1:
	movzwl	%ax, %eax
	pushl	%eax
	calll	_FreeRtLibrary
	addl	$4, %esp
	movw	$0, _hBlockFuncRSL
LBB7_2:
	movl	$0, _status_funcblock
	retl
                                        # -- End function
	.def	_Functionblock_Register;
	.scl	2;
	.type	32;
	.endef
	.globl	_Functionblock_Register         # -- Begin function Functionblock_Register
	.p2align	4
_Functionblock_Register:                # @Functionblock_Register
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	16(%esp), %edi
	pushl	%edi
	calll	_Rtedge_GetStructureName
	addl	$4, %esp
	movl	%eax, %esi
	testl	%eax, %eax
	cmovel	%edi, %esi
	movl	_FbList, %ebx
	testl	%ebx, %ebx
	je	LBB8_7
	.p2align	4
LBB8_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%esi
	pushl	(%ebx)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB8_4
# %bb.3:                                #   in Loop: Header=BB8_2 Depth=1
	movl	16(%ebx), %ebx
	testl	%ebx, %ebx
	jne	LBB8_2
	jmp	LBB8_7
LBB8_4:
	pushl	%esi
	calll	_Variable_Search
	addl	$4, %esp
	testl	%eax, %eax
	jne	LBB8_6
# %bb.5:
	pushl	$1059                           # imm = 0x423
	pushl	%esi
	calll	_Variable_Add
	addl	$8, %esp
	movl	4(%ebx), %ecx
	movl	%ecx, (%eax)
	movb	$1, 10(%eax)
LBB8_6:
	pushl	12(%ebx)
	pushl	%edi
	calll	_Structure_CreateCatalog
	addl	$8, %esp
LBB8_7:                                 # %.loopexit
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Functionblock_GetSize;
	.scl	2;
	.type	32;
	.endef
	.globl	_Functionblock_GetSize          # -- Begin function Functionblock_GetSize
	.p2align	4
_Functionblock_GetSize:                 # @Functionblock_GetSize
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	_FbList, %edi
	xorl	%esi, %esi
	testl	%edi, %edi
	je	LBB9_7
# %bb.1:                                # %.preheader3.preheader
	movl	16(%esp), %ebx
	.p2align	4
LBB9_2:                                 # %.preheader3
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebx
	pushl	(%edi)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB9_4
# %bb.3:                                #   in Loop: Header=BB9_2 Depth=1
	movl	16(%edi), %edi
	testl	%edi, %edi
	jne	LBB9_2
	jmp	LBB9_7
LBB9_4:
	movl	12(%edi), %edi
	testl	%edi, %edi
	je	LBB9_7
# %bb.5:                                # %.preheader.preheader
	xorl	%esi, %esi
	.p2align	4
LBB9_6:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movzwl	(%edi), %eax
	pushl	%eax
	calll	_Rtedge_TypeSize
	addl	$4, %esp
	addl	%eax, %esi
	movl	10(%edi), %edi
	testl	%edi, %edi
	jne	LBB9_6
LBB9_7:                                 # %.loopexit
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Functionblock_Display;
	.scl	2;
	.type	32;
	.endef
	.globl	_Functionblock_Display          # -- Begin function Functionblock_Display
	.p2align	4
_Functionblock_Display:                 # @Functionblock_Display
# %bb.0:
	pushl	%edi
	pushl	%esi
	pushl	$L_str
	calll	_puts
	addl	$4, %esp
	movl	_FbList, %esi
	testl	%esi, %esi
	je	LBB10_3
# %bb.1:                                # %.preheader.preheader
	movl	$1, %edi
	.p2align	4
LBB10_2:                                # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	4(%esi)
	pushl	(%esi)
	pushl	%edi
	pushl	$"??_C@_0BG@JCCPOPHJ@?5?5FB?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@"
	calll	_printf
	addl	$16, %esp
	incl	%edi
	movl	16(%esi), %esi
	testl	%esi, %esi
	jne	LBB10_2
LBB10_3:                                # %.loopexit
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
	.globl	_status_funcblock               # @status_funcblock
	.p2align	2, 0x0
_status_funcblock:
	.long	0                               # 0x0

	.globl	_FbList                         # @FbList
	.p2align	2, 0x0
_FbList:
	.long	0

	.globl	_FbBottom                       # @FbBottom
	.p2align	2, 0x0
_FbBottom:
	.long	0

	.section	.rdata,"dr",discard,"??_C@_0BI@KIBLMIFL@Functionblock_Add?3entry?$AA@"
	.globl	"??_C@_0BI@KIBLMIFL@Functionblock_Add?3entry?$AA@" # @"??_C@_0BI@KIBLMIFL@Functionblock_Add?3entry?$AA@"
"??_C@_0BI@KIBLMIFL@Functionblock_Add?3entry?$AA@":
	.asciz	"Functionblock_Add:entry"

	.section	.rdata,"dr",discard,"??_C@_0BH@GMAJPKBL@Functionblock_Add?3name?$AA@"
	.globl	"??_C@_0BH@GMAJPKBL@Functionblock_Add?3name?$AA@" # @"??_C@_0BH@GMAJPKBL@Functionblock_Add?3name?$AA@"
"??_C@_0BH@GMAJPKBL@Functionblock_Add?3name?$AA@":
	.asciz	"Functionblock_Add:name"

	.section	.rdata,"dr",discard,"??_C@_0BL@DLCPKPLN@Functionblock_AddConnector?$AA@"
	.globl	"??_C@_0BL@DLCPKPLN@Functionblock_AddConnector?$AA@" # @"??_C@_0BL@DLCPKPLN@Functionblock_AddConnector?$AA@"
"??_C@_0BL@DLCPKPLN@Functionblock_AddConnector?$AA@":
	.asciz	"Functionblock_AddConnector"

	.lcomm	_hBlockFuncRSL,2,2              # @hBlockFuncRSL
	.section	.rdata,"dr",discard,"??_C@_0P@POEJAJGK@FunctionBlocks?$AA@"
	.globl	"??_C@_0P@POEJAJGK@FunctionBlocks?$AA@" # @"??_C@_0P@POEJAJGK@FunctionBlocks?$AA@"
"??_C@_0P@POEJAJGK@FunctionBlocks?$AA@":
	.asciz	"FunctionBlocks"

	.section	.rdata,"dr",discard,"??_C@_0BC@ENDAEKAI@NumFunctionBlocks?$AA@"
	.globl	"??_C@_0BC@ENDAEKAI@NumFunctionBlocks?$AA@" # @"??_C@_0BC@ENDAEKAI@NumFunctionBlocks?$AA@"
"??_C@_0BC@ENDAEKAI@NumFunctionBlocks?$AA@":
	.asciz	"NumFunctionBlocks"

	.section	.rdata,"dr",discard,"??_C@_0BG@JCCPOPHJ@?5?5FB?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@"
	.globl	"??_C@_0BG@JCCPOPHJ@?5?5FB?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@" # @"??_C@_0BG@JCCPOPHJ@?5?5FB?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@"
"??_C@_0BG@JCCPOPHJ@?5?5FB?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@":
	.asciz	"  FB(%03d) %-14s  %p\n"

	.section	.rdata,"dr"
L_str:                                  # @str
	.asciz	"Functionblock list"

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
