	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"userfunc.c"
	.def	_Userfunction_Add;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Userfunction_Add               # -- Begin function Userfunction_Add
	.p2align	4
_Userfunction_Add:                      # @Userfunction_Add
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %edi
	pushl	$"??_C@_0BB@NEHNLFHE@Userfunction_Add?$AA@"
	pushl	$12
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	%eax, %esi
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	incl	%eax
	pushl	$"??_C@_0BG@MHHPLJKP@Userfunction_Add?3name?$AA@"
	pushl	%eax
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	%eax, (%esi)
	pushl	%edi
	pushl	%eax
	calll	_strcpy
	addl	$8, %esp
	movl	$0, 8(%esi)
	cmpl	$0, _plcUserFuncList
	je	LBB0_1
# %bb.2:
	movl	_plcUserFuncBottom, %eax
	movl	%esi, 8(%eax)
	jmp	LBB0_3
LBB0_1:
	movl	%esi, _plcUserFuncList
LBB0_3:
	movl	%esi, _plcUserFuncBottom
	movl	$2, _status_userfunc
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Userfunction_AddArgument;
	.scl	2;
	.type	32;
	.endef
	.globl	_Userfunction_AddArgument       # -- Begin function Userfunction_AddArgument
	.p2align	4
_Userfunction_AddArgument:              # @Userfunction_AddArgument
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	_plcUserFuncList, %edi
	testl	%edi, %edi
	je	LBB1_5
# %bb.1:                                # %.preheader4.preheader
	movl	20(%esp), %esi
	movl	16(%esp), %ebx
	.p2align	4
LBB1_2:                                 # %.preheader4
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebx
	pushl	(%edi)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB1_6
# %bb.3:                                #   in Loop: Header=BB1_2 Depth=1
	movl	8(%edi), %edi
	testl	%edi, %edi
	jne	LBB1_2
	jmp	LBB1_5
LBB1_6:
	pushl	%esi
	calll	_Variable_SearchName
	addl	$4, %esp
	testl	%eax, %eax
	je	LBB1_5
# %bb.7:
	movl	%eax, %esi
	pushl	$"??_C@_0BJ@MHLMLJEO@Userfunction_AddArgument?$AA@"
	pushl	$8
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	%esi, (%eax)
	movl	$0, 4(%eax)
	movl	4(%edi), %ecx
	testl	%ecx, %ecx
	je	LBB1_11
	.p2align	4
LBB1_8:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	%ecx, %edx
	movl	4(%ecx), %ecx
	testl	%ecx, %ecx
	jne	LBB1_8
# %bb.9:
	movl	%eax, 4(%edx)
	jmp	LBB1_12
LBB1_5:
	xorl	%eax, %eax
LBB1_13:                                # %.loopexit
                                        # kill: def $al killed $al killed $eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
LBB1_11:
	movl	%eax, 4(%edi)
LBB1_12:                                # %.loopexit
	movb	$1, %al
	jmp	LBB1_13
                                        # -- End function
	.def	_Userfunction_Search;
	.scl	2;
	.type	32;
	.endef
	.globl	_Userfunction_Search            # -- Begin function Userfunction_Search
	.p2align	4
_Userfunction_Search:                   # @Userfunction_Search
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	_plcUserFuncList, %edi
	xorl	%esi, %esi
	testl	%edi, %edi
	je	LBB2_5
# %bb.1:                                # %.preheader.preheader
	movl	16(%esp), %ebx
	.p2align	4
LBB2_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebx
	pushl	(%edi)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB2_3
# %bb.4:                                #   in Loop: Header=BB2_2 Depth=1
	movl	8(%edi), %edi
	testl	%edi, %edi
	jne	LBB2_2
	jmp	LBB2_5
LBB2_3:
	movl	%edi, %esi
LBB2_5:                                 # %.loopexit
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Userfunction_Clear;
	.scl	2;
	.type	32;
	.endef
	.globl	_Userfunction_Clear             # -- Begin function Userfunction_Clear
	.p2align	4
_Userfunction_Clear:                    # @Userfunction_Clear
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	_plcUserFuncList, %esi
	jmp	LBB3_1
	.p2align	4
LBB3_4:                                 # %.loopexit
                                        #   in Loop: Header=BB3_1 Depth=1
	pushl	(%esi)
	calll	_Heap_Free
	addl	$4, %esp
	movl	$0, (%esi)
	movl	8(%esi), %esi
	pushl	_plcUserFuncList
	calll	_Heap_Free
	addl	$4, %esp
	movl	%esi, _plcUserFuncList
LBB3_1:                                 # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_3 Depth 2
	testl	%esi, %esi
	je	LBB3_5
# %bb.2:                                # %.preheader3
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	4(%esi), %eax
	testl	%eax, %eax
	je	LBB3_4
	.p2align	4
LBB3_3:                                 # %.preheader
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	4(%eax), %edi
	pushl	%eax
	calll	_Heap_Free
	addl	$4, %esp
	movl	%edi, 4(%esi)
	movl	%edi, %eax
	testl	%edi, %edi
	jne	LBB3_3
	jmp	LBB3_4
LBB3_5:                                 # %.loopexit4
	movl	$0, _plcUserFuncBottom
	movl	$0, _plcUserFuncList
	movl	$0, _status_userfunc
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Userfunction_Display;
	.scl	2;
	.type	32;
	.endef
	.globl	_Userfunction_Display           # -- Begin function Userfunction_Display
	.p2align	4
_Userfunction_Display:                  # @Userfunction_Display
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	$L_str
	calll	_puts
	addl	$4, %esp
	movl	_plcUserFuncList, %esi
	testl	%esi, %esi
	je	LBB4_7
# %bb.1:                                # %.preheader3.preheader
	movl	$1, %edi
	jmp	LBB4_2
	.p2align	4
LBB4_5:                                 # %.loopexit
                                        #   in Loop: Header=BB4_2 Depth=1
	movl	8(%esi), %esi
	incl	%edi
	testl	%esi, %esi
	je	LBB4_6
LBB4_2:                                 # %.preheader3
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_4 Depth 2
	pushl	(%esi)
	pushl	%edi
	pushl	$"??_C@_0BF@BPMKBFAL@?5?5Userfunc?$CI?$CF03d?$CJ?5?$CFs?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	4(%esi), %ebx
	testl	%ebx, %ebx
	je	LBB4_5
# %bb.3:                                # %.preheader.preheader
                                        #   in Loop: Header=BB4_2 Depth=1
	movl	$1, %ebp
	.p2align	4
LBB4_4:                                 # %.preheader
                                        #   Parent Loop BB4_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	pushl	(%ebx)
	pushl	%ebp
	pushl	$"??_C@_0BA@BPMJOBOE@?5?5?5?5pin?$CI?$CFd?$CJ?5?$CFs?6?$AA@"
	calll	_printf
	addl	$12, %esp
	incl	%ebp
	movl	4(%ebx), %ebx
	testl	%ebx, %ebx
	jne	LBB4_4
	jmp	LBB4_5
LBB4_7:
	pushl	$L_str.1
	calll	_puts
	addl	$4, %esp
LBB4_6:                                 # %.loopexit4
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Userfunction_NumArgument;
	.scl	2;
	.type	32;
	.endef
	.globl	_Userfunction_NumArgument       # -- Begin function Userfunction_NumArgument
	.p2align	4
_Userfunction_NumArgument:              # @Userfunction_NumArgument
# %bb.0:
	movl	$-1, %eax
	movl	4(%esp), %ecx
	.p2align	4
LBB5_1:                                 # =>This Inner Loop Header: Depth=1
	movl	4(%ecx), %ecx
	incl	%eax
	testl	%ecx, %ecx
	jne	LBB5_1
# %bb.2:
	retl
                                        # -- End function
	.def	__Userfunction_PargeArgumentFirst;
	.scl	2;
	.type	32;
	.endef
	.globl	__Userfunction_PargeArgumentFirst # -- Begin function _Userfunction_PargeArgumentFirst
	.p2align	4
__Userfunction_PargeArgumentFirst:      # @_Userfunction_PargeArgumentFirst
# %bb.0:
	pushl	$"??_C@_01IHBHIGKO@?0?$AA@"
	pushl	8(%esp)
	calll	_strtok
	addl	$8, %esp
	retl
                                        # -- End function
	.def	__Userfunction_PargeArgumentNext;
	.scl	2;
	.type	32;
	.endef
	.globl	__Userfunction_PargeArgumentNext # -- Begin function _Userfunction_PargeArgumentNext
	.p2align	4
__Userfunction_PargeArgumentNext:       # @_Userfunction_PargeArgumentNext
# %bb.0:
	pushl	$"??_C@_01IHBHIGKO@?0?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	retl
                                        # -- End function
	.def	__Userfunction_TrimArgument;
	.scl	2;
	.type	32;
	.endef
	.globl	__Userfunction_TrimArgument     # -- Begin function _Userfunction_TrimArgument
	.p2align	4
__Userfunction_TrimArgument:            # @_Userfunction_TrimArgument
# %bb.0:
	movl	4(%esp), %eax
	movl	%eax, %ecx
	jmp	LBB8_1
	.p2align	4
LBB8_4:                                 #   in Loop: Header=BB8_1 Depth=1
	incl	%ecx
LBB8_5:                                 #   in Loop: Header=BB8_1 Depth=1
	incl	%eax
	testb	%dl, %dl
	je	LBB8_6
LBB8_1:                                 # =>This Inner Loop Header: Depth=1
	movzbl	(%eax), %edx
	movb	%dl, %dh
	andb	$-2, %dh
	cmpb	$40, %dh
	je	LBB8_5
# %bb.2:                                #   in Loop: Header=BB8_1 Depth=1
	cmpl	%ecx, %eax
	je	LBB8_4
# %bb.3:                                #   in Loop: Header=BB8_1 Depth=1
	movb	%dl, (%ecx)
	movzbl	(%eax), %edx
	jmp	LBB8_4
LBB8_6:
	retl
                                        # -- End function
	.def	_Userfunction_ReplaceInstruction;
	.scl	2;
	.type	32;
	.endef
	.globl	_Userfunction_ReplaceInstruction # -- Begin function Userfunction_ReplaceInstruction
	.p2align	4
_Userfunction_ReplaceInstruction:       # @Userfunction_ReplaceInstruction
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$16, %esp
	movl	$_plcUserFuncList, %ecx
	movl	36(%esp), %ebp
	.p2align	4
LBB9_1:                                 # =>This Inner Loop Header: Depth=1
	movl	(%ecx), %edi
	pushl	40(%esp)
	pushl	(%edi)
	calll	_strcmp
	addl	$8, %esp
	leal	8(%edi), %ecx
	testl	%eax, %eax
	jne	LBB9_1
# %bb.2:
	movl	4(%edi), %esi
	movl	$1, %eax
	.p2align	4
LBB9_3:                                 # =>This Inner Loop Header: Depth=1
	movl	4(%edi), %edi
	decl	%eax
	testl	%edi, %edi
	jne	LBB9_3
# %bb.4:
	testl	%eax, %eax
	je	LBB9_5
# %bb.6:
	pushl	$"??_C@_02LAJDCOFE@ST?$AA@"
	calll	_Instruction_GetTemplate
	addl	$4, %esp
	movl	%eax, %edi
	pushl	$"??_C@_02ONCLNIEI@LD?$AA@"
	calll	_Instruction_GetTemplate
	addl	$4, %esp
	movl	%eax, 4(%esp)                   # 4-byte Spill
	pushl	$"??_C@_03JBLDIHBA@UFU?$AA@"
	calll	_Instruction_GetTemplate
	addl	$4, %esp
	movl	%eax, 12(%esp)                  # 4-byte Spill
	pushl	(%esi)
	calll	_Variable_Search
	addl	$4, %esp
	pushl	$0
	pushl	$0
	pushl	%eax
	movl	%edi, 20(%esp)                  # 4-byte Spill
	pushl	%edi
	calll	_Logic_Add
	addl	$16, %esp
	movl	4(%esi), %ebx
	testl	%ebp, %ebp
	je	LBB9_7
# %bb.8:
	pushl	%ebp
	calll	_strlen
	addl	$4, %esp
	incl	%eax
	pushl	$"??_C@_0CP@OIDEEJJO@Userfunction_ReplaceInstruction?3@"
	pushl	%eax
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	%eax, %esi
	pushl	%ebp
	pushl	%eax
	calll	_strcpy
	addl	$8, %esp
	movl	%esi, %eax
	movl	%esi, %ecx
	jmp	LBB9_9
	.p2align	4
LBB9_12:                                #   in Loop: Header=BB9_9 Depth=1
	incl	%ecx
LBB9_13:                                #   in Loop: Header=BB9_9 Depth=1
	incl	%eax
	testb	%dl, %dl
	je	LBB9_14
LBB9_9:                                 # =>This Inner Loop Header: Depth=1
	movzbl	(%eax), %edx
	movb	%dl, %dh
	andb	$-2, %dh
	cmpb	$40, %dh
	je	LBB9_13
# %bb.10:                               #   in Loop: Header=BB9_9 Depth=1
	cmpl	%ecx, %eax
	je	LBB9_12
# %bb.11:                               #   in Loop: Header=BB9_9 Depth=1
	movb	%dl, (%ecx)
	movzbl	(%eax), %edx
	jmp	LBB9_12
LBB9_14:
	pushl	$"??_C@_01IHBHIGKO@?0?$AA@"
	movl	%esi, 4(%esp)                   # 4-byte Spill
	pushl	%esi
	calll	_strtok
	addl	$8, %esp
	movl	%eax, %esi
	jmp	LBB9_15
LBB9_5:
	pushl	40(%esp)
	pushl	$8196                           # imm = 0x2004
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	movl	$_VARIANT_EMPTY, %ebx
	jmp	LBB9_26
LBB9_7:
	xorl	%esi, %esi
	movl	$0, (%esp)                      # 4-byte Folded Spill
	jmp	LBB9_15
	.p2align	4
LBB9_19:                                #   in Loop: Header=BB9_15 Depth=1
	pushl	$"??_C@_01IHBHIGKO@?0?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	movl	%eax, %esi
LBB9_21:                                #   in Loop: Header=BB9_15 Depth=1
	pushl	$0
	pushl	$0
	pushl	%edi
	pushl	16(%esp)                        # 4-byte Folded Reload
	calll	_Logic_Add
	addl	$16, %esp
	pushl	$0
	pushl	$0
	pushl	%ebp
	pushl	20(%esp)                        # 4-byte Folded Reload
	calll	_Logic_Add
	addl	$16, %esp
	movl	4(%ebx), %ebx
LBB9_15:                                # =>This Inner Loop Header: Depth=1
	testl	%ebx, %ebx
	je	LBB9_22
# %bb.16:                               # %.preheader
                                        #   in Loop: Header=BB9_15 Depth=1
	pushl	(%ebx)
	calll	_Variable_Search
	addl	$4, %esp
	movl	%eax, %ebp
	testl	%esi, %esi
	je	LBB9_20
# %bb.17:                               #   in Loop: Header=BB9_15 Depth=1
	pushl	%esi
	calll	_Variable_Search
	addl	$4, %esp
	movl	%eax, %edi
	testl	%eax, %eax
	jne	LBB9_19
# %bb.18:                               #   in Loop: Header=BB9_15 Depth=1
	pushl	%esi
	calll	_Literal_Compile
	addl	$4, %esp
	movl	%eax, %edi
	jmp	LBB9_19
	.p2align	4
LBB9_20:                                #   in Loop: Header=BB9_15 Depth=1
	movzwl	4(%ebp), %eax
	xorl	%esi, %esi
	pushl	%eax
	calll	_Variable_Zero
	addl	$4, %esp
	movl	%eax, %edi
	jmp	LBB9_21
LBB9_22:                                # %.loopexit
	movl	(%esp), %eax                    # 4-byte Reload
	testl	%eax, %eax
	je	LBB9_24
# %bb.23:
	pushl	%eax
	calll	_Heap_Free
	addl	$4, %esp
LBB9_24:
	movl	40(%esp), %esi
	pushl	%esi
	calll	_Label_Search
	addl	$4, %esp
	pushl	$0
	pushl	$0
	pushl	8(%eax)
	pushl	24(%esp)                        # 4-byte Folded Reload
	calll	_Logic_Add
	addl	$16, %esp
	pushl	%esi
	calll	_strlen
	addl	$4, %esp
	leal	2(,%eax,2), %eax
	pushl	$"??_C@_0CP@OIDEEJJO@Userfunction_ReplaceInstruction?3@"
	pushl	%eax
	calll	_Heap_Alloc
	addl	$8, %esp
	testl	%eax, %eax
	movl	36(%esp), %ebx
	je	LBB9_26
# %bb.25:
	pushl	%esi
	pushl	%eax
	movl	%eax, %edi
	calll	_strcat
	addl	$8, %esp
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	movw	$46, (%edi,%eax)
	pushl	%esi
	pushl	%edi
	calll	_strcat
	addl	$8, %esp
	pushl	%esi
	calll	_Variable_Search
	addl	$4, %esp
	movl	%eax, %esi
	pushl	%edi
	calll	_Variable_Search
	addl	$4, %esp
	pushl	$0
	pushl	$0
	pushl	%eax
	pushl	16(%esp)                        # 4-byte Folded Reload
	calll	_Logic_Add
	addl	$16, %esp
	pushl	$0
	pushl	$0
	pushl	%esi
	pushl	20(%esp)                        # 4-byte Folded Reload
	calll	_Logic_Add
	addl	$16, %esp
	pushl	%edi
	calll	_Heap_Free
	addl	$4, %esp
LBB9_26:
	movl	%ebx, %eax
	addl	$16, %esp
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
	.globl	_status_userfunc                # @status_userfunc
	.p2align	2, 0x0
_status_userfunc:
	.long	0                               # 0x0

	.globl	_plcUserFuncList                # @plcUserFuncList
	.p2align	2, 0x0
_plcUserFuncList:
	.long	0

	.globl	_plcUserFuncBottom              # @plcUserFuncBottom
	.p2align	2, 0x0
_plcUserFuncBottom:
	.long	0

	.section	.rdata,"dr",discard,"??_C@_0BB@NEHNLFHE@Userfunction_Add?$AA@"
	.globl	"??_C@_0BB@NEHNLFHE@Userfunction_Add?$AA@" # @"??_C@_0BB@NEHNLFHE@Userfunction_Add?$AA@"
"??_C@_0BB@NEHNLFHE@Userfunction_Add?$AA@":
	.asciz	"Userfunction_Add"

	.section	.rdata,"dr",discard,"??_C@_0BG@MHHPLJKP@Userfunction_Add?3name?$AA@"
	.globl	"??_C@_0BG@MHHPLJKP@Userfunction_Add?3name?$AA@" # @"??_C@_0BG@MHHPLJKP@Userfunction_Add?3name?$AA@"
"??_C@_0BG@MHHPLJKP@Userfunction_Add?3name?$AA@":
	.asciz	"Userfunction_Add:name"

	.section	.rdata,"dr",discard,"??_C@_0BJ@MHLMLJEO@Userfunction_AddArgument?$AA@"
	.globl	"??_C@_0BJ@MHLMLJEO@Userfunction_AddArgument?$AA@" # @"??_C@_0BJ@MHLMLJEO@Userfunction_AddArgument?$AA@"
"??_C@_0BJ@MHLMLJEO@Userfunction_AddArgument?$AA@":
	.asciz	"Userfunction_AddArgument"

	.section	.rdata,"dr",discard,"??_C@_0BF@BPMKBFAL@?5?5Userfunc?$CI?$CF03d?$CJ?5?$CFs?6?$AA@"
	.globl	"??_C@_0BF@BPMKBFAL@?5?5Userfunc?$CI?$CF03d?$CJ?5?$CFs?6?$AA@" # @"??_C@_0BF@BPMKBFAL@?5?5Userfunc?$CI?$CF03d?$CJ?5?$CFs?6?$AA@"
"??_C@_0BF@BPMKBFAL@?5?5Userfunc?$CI?$CF03d?$CJ?5?$CFs?6?$AA@":
	.asciz	"  Userfunc(%03d) %s\n"

	.section	.rdata,"dr",discard,"??_C@_0BA@BPMJOBOE@?5?5?5?5pin?$CI?$CFd?$CJ?5?$CFs?6?$AA@"
	.globl	"??_C@_0BA@BPMJOBOE@?5?5?5?5pin?$CI?$CFd?$CJ?5?$CFs?6?$AA@" # @"??_C@_0BA@BPMJOBOE@?5?5?5?5pin?$CI?$CFd?$CJ?5?$CFs?6?$AA@"
"??_C@_0BA@BPMJOBOE@?5?5?5?5pin?$CI?$CFd?$CJ?5?$CFs?6?$AA@":
	.asciz	"    pin(%d) %s\n"

	.bss
	.globl	_context                        # @context
	.p2align	2, 0x0
_context:
	.long	0

	.section	.rdata,"dr",discard,"??_C@_01IHBHIGKO@?0?$AA@"
	.globl	"??_C@_01IHBHIGKO@?0?$AA@"      # @"??_C@_01IHBHIGKO@?0?$AA@"
"??_C@_01IHBHIGKO@?0?$AA@":
	.asciz	","

	.section	.rdata,"dr",discard,"??_C@_02LAJDCOFE@ST?$AA@"
	.globl	"??_C@_02LAJDCOFE@ST?$AA@"      # @"??_C@_02LAJDCOFE@ST?$AA@"
"??_C@_02LAJDCOFE@ST?$AA@":
	.asciz	"ST"

	.section	.rdata,"dr",discard,"??_C@_02ONCLNIEI@LD?$AA@"
	.globl	"??_C@_02ONCLNIEI@LD?$AA@"      # @"??_C@_02ONCLNIEI@LD?$AA@"
"??_C@_02ONCLNIEI@LD?$AA@":
	.asciz	"LD"

	.section	.rdata,"dr",discard,"??_C@_03JBLDIHBA@UFU?$AA@"
	.globl	"??_C@_03JBLDIHBA@UFU?$AA@"     # @"??_C@_03JBLDIHBA@UFU?$AA@"
"??_C@_03JBLDIHBA@UFU?$AA@":
	.asciz	"UFU"

	.section	.rdata,"dr",discard,"??_C@_0CP@OIDEEJJO@Userfunction_ReplaceInstruction?3@"
	.globl	"??_C@_0CP@OIDEEJJO@Userfunction_ReplaceInstruction?3@" # @"??_C@_0CP@OIDEEJJO@Userfunction_ReplaceInstruction?3@"
"??_C@_0CP@OIDEEJJO@Userfunction_ReplaceInstruction?3@":
	.asciz	"Userfunction_ReplaceInstruction:work temporary"

	.section	.rdata,"dr"
L_str:                                  # @str
	.asciz	"Userfunction list"

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
	.addrsig_sym _VARIANT_EMPTY
