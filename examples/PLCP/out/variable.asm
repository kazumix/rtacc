	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"variable.c"
	.def	_Variable_Add;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Variable_Add                   # -- Begin function Variable_Add
	.p2align	4
_Variable_Add:                          # @Variable_Add
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movzwl	20(%esp), %edi
	movl	16(%esp), %ebx
	pushl	$"??_C@_0BD@PIGJDLMJ@Variable_Add?3entry?$AA@"
	pushl	$23
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	%eax, %esi
	pushl	%ebx
	calll	_strlen
	addl	$4, %esp
	incl	%eax
	pushl	$"??_C@_0BC@BLILFEGL@Variable_Add?3name?$AA@"
	pushl	%eax
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	%eax, (%esi)
	pushl	%ebx
	pushl	%eax
	calll	_strcpy
	addl	$8, %esp
	movw	%di, 8(%esi)
	movl	$0, 19(%esi)
	cmpl	$0, _variablelist
	je	LBB0_1
# %bb.2:
	movl	_variableBottom, %ecx
	movl	%esi, 19(%ecx)
	jmp	LBB0_3
LBB0_1:
	movl	%esi, _variablelist
LBB0_3:
	movl	%esi, _variableBottom
	addl	$4, %esi
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Variable_Clear;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_Clear                 # -- Begin function Variable_Clear
	.p2align	4
_Variable_Clear:                        # @Variable_Clear
# %bb.0:
	pushl	%esi
	movl	_variablelist, %esi
	jmp	LBB1_1
	.p2align	4
LBB1_5:                                 #   in Loop: Header=BB1_1 Depth=1
	movl	19(%esi), %esi
	pushl	%eax
	calll	_Heap_Free
	addl	$4, %esp
	movl	%esi, _variablelist
LBB1_1:                                 # =>This Inner Loop Header: Depth=1
	testl	%esi, %esi
	je	LBB1_6
# %bb.2:                                # %.preheader
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$0, 10(%esi)
	movl	%esi, %eax
	jne	LBB1_5
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	cmpw	$1059, 8(%esi)                  # imm = 0x423
	movl	%esi, %eax
	je	LBB1_5
# %bb.4:                                #   in Loop: Header=BB1_1 Depth=1
	pushl	4(%esi)
	calll	_Heap_Free
	addl	$4, %esp
	movl	_variablelist, %eax
	jmp	LBB1_5
LBB1_6:                                 # %.loopexit
	movl	$0, _variableBottom
	movl	$0, _variablelist
	popl	%esi
	retl
                                        # -- End function
	.def	_Variable_Display;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_Display               # -- Begin function Variable_Display
	.p2align	4
_Variable_Display:                      # @Variable_Display
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	$L_str
	calll	_puts
	addl	$4, %esp
	movl	_RUNvariablelist, %esi
	testl	%esi, %esi
	je	LBB2_4
# %bb.1:                                # %.preheader.preheader
	movl	$1, %edi
	.p2align	4
LBB2_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, 10(%esi)
	movl	$"??_C@_02MJNHLAAE@EG?$AA@", %ebx
	movl	$"??_C@_02KNHHEEKP@?5?5?$AA@", %eax
	cmovel	%eax, %ebx
	cmpb	$0, 14(%esi)
	movl	$"??_C@_02BIGHIPPJ@RO?$AA@", %ebp
	cmovel	%eax, %ebp
	movzwl	8(%esi), %eax
	pushl	%eax
	calll	_Type_GetName
	addl	$4, %esp
	pushl	%ebx
	pushl	%ebp
	pushl	%eax
	pushl	(%esi)
	leal	4(%esi), %eax
	pushl	%eax
	pushl	%edi
	pushl	$"??_C@_0CI@JAAMHDIA@?5?5Variable?$CI?$CF03d?$CJ?5?$CFp?5?$CF?924s?5?5?$CF?910s@"
	calll	_printf
	addl	$28, %esp
	movl	19(%esi), %esi
	incl	%edi
	testl	%esi, %esi
	jne	LBB2_2
	jmp	LBB2_3
LBB2_4:
	pushl	$L_str.1
	calll	_puts
	addl	$4, %esp
LBB2_3:                                 # %.loopexit
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Variable_Search;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_Search                # -- Begin function Variable_Search
	.p2align	4
_Variable_Search:                       # @Variable_Search
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	_variablelist, %edi
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
	movl	19(%edi), %edi
	testl	%edi, %edi
	jne	LBB3_2
	jmp	LBB3_5
LBB3_3:
	addl	$4, %edi
	movl	%edi, %esi
LBB3_5:                                 # %.loopexit
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Variable_SearchName;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_SearchName            # -- Begin function Variable_SearchName
	.p2align	4
_Variable_SearchName:                   # @Variable_SearchName
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	_variablelist, %edi
	testl	%edi, %edi
	je	LBB4_5
# %bb.1:
	movl	16(%esp), %ebx
	.p2align	4
LBB4_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	(%edi), %esi
	pushl	%ebx
	pushl	%esi
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB4_6
# %bb.3:                                #   in Loop: Header=BB4_2 Depth=1
	movl	19(%edi), %edi
	testl	%edi, %edi
	jne	LBB4_2
LBB4_5:
	xorl	%esi, %esi
LBB4_6:                                 # %.loopexit
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Variable_Create;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_Create                # -- Begin function Variable_Create
	.p2align	4
_Variable_Create:                       # @Variable_Create
# %bb.0:
	pushl	%esi
	movzwl	8(%esp), %esi
	pushl	$"??_C@_0BA@LBHLBGIF@Variable_Create?$AA@"
	pushl	$15
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	$0, 6(%eax)
	movw	%si, 4(%eax)
	movl	$0, (%eax)
	popl	%esi
	retl
                                        # -- End function
	.def	_Variable_Body;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_Body                  # -- Begin function Variable_Body
	.p2align	4
_Variable_Body:                         # @Variable_Body
# %bb.0:
	pushl	$"??_C@_0O@NOPHFFNJ@Variable_Body?$AA@"
	pushl	8(%esp)
	calll	_Heap_Alloc
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_Variable_LinkBody;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_LinkBody              # -- Begin function Variable_LinkBody
	.p2align	4
_Variable_LinkBody:                     # @Variable_LinkBody
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	20(%esp), %edi
	pushl	%edi
	calll	_Rtedge_TagGetIecType
	addl	$4, %esp
	movl	%eax, %esi
	pushl	%edi
	calll	_Rtedge_TagGetPointer
	addl	$4, %esp
	testl	%eax, %eax
	je	LBB7_1
# %bb.2:
	movl	16(%esp), %edi
	movzwl	%si, %ecx
	pushl	%ecx
	pushl	%eax
	movl	%eax, %ebx
	calll	_Rtedge_GetPointer
	addl	$8, %esp
	movl	%ebx, 6(%edi)
	movw	%si, 4(%edi)
	movl	%eax, (%edi)
	jmp	LBB7_3
LBB7_1:
	xorl	%eax, %eax
LBB7_3:
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Variable_GetSize;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_GetSize               # -- Begin function Variable_GetSize
	.p2align	4
_Variable_GetSize:                      # @Variable_GetSize
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	_variablelist, %esi
	testl	%esi, %esi
	je	LBB8_4
# %bb.1:                                # %.preheader.preheader
	movl	12(%esp), %edi
	.p2align	4
LBB8_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%edi
	pushl	(%esi)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB8_5
# %bb.3:                                #   in Loop: Header=BB8_2 Depth=1
	movl	19(%esi), %esi
	testl	%esi, %esi
	jne	LBB8_2
LBB8_4:                                 # %.loopexit
	pushl	$"??_C@_0BB@FLIGODG@Variable_GetSize?$AA@"
	pushl	$8194                           # imm = 0x2002
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	xorl	%eax, %eax
	jmp	LBB8_6
LBB8_5:
	addl	$4, %esi
	pushl	%esi
	calll	_Rtedge_SizeOf
	addl	$4, %esp
LBB8_6:
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Variable_Copy64;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_Copy64                # -- Begin function Variable_Copy64
	.p2align	4
_Variable_Copy64:                       # @Variable_Copy64
# %bb.0:
	pushl	%ebx
	pushl	%esi
	movl	12(%esp), %esi
	movl	16(%esp), %eax
	movl	(%eax), %ebx
	movl	4(%eax), %ecx
	.p2align	4
LBB9_1:                                 # =>This Inner Loop Header: Depth=1
	movl	(%esi), %eax
	movl	4(%esi), %edx
	lock		cmpxchg8b	(%esi)
	jne	LBB9_1
# %bb.2:
	popl	%esi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Variable_GetType;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_GetType               # -- Begin function Variable_GetType
	.p2align	4
_Variable_GetType:                      # @Variable_GetType
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	_variablelist, %esi
	testl	%esi, %esi
	je	LBB10_4
# %bb.1:                                # %.preheader.preheader
	movl	12(%esp), %edi
	.p2align	4
LBB10_2:                                # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%edi
	pushl	(%esi)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB10_5
# %bb.3:                                #   in Loop: Header=BB10_2 Depth=1
	movl	19(%esi), %esi
	testl	%esi, %esi
	jne	LBB10_2
LBB10_4:                                # %.loopexit
	pushl	$"??_C@_0BB@OKBGGAGP@Variable_GetType?$AA@"
	pushl	$8194                           # imm = 0x2002
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	xorl	%eax, %eax
	jmp	LBB10_6
LBB10_5:
	movzwl	8(%esi), %eax
LBB10_6:
                                        # kill: def $ax killed $ax killed $eax
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Variable_Zero;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_Zero                  # -- Begin function Variable_Zero
	.p2align	4
_Variable_Zero:                         # @Variable_Zero
# %bb.0:
	movzwl	4(%esp), %ecx
	cmpl	$781, %ecx                      # imm = 0x30D
	jg	LBB11_5
# %bb.1:
	leal	-16(%ecx), %eax
	cmpl	$3, %eax
	jbe	LBB11_39
# %bb.2:
	leal	-260(%ecx), %eax
	cmpl	$3, %eax
	jbe	LBB11_40
# %bb.3:
	addl	$-512, %ecx                     # imm = 0xFE00
	cmpl	$3, %ecx
	ja	LBB11_37
# %bb.4:
	jmpl	*LJTI11_2(,%ecx,4)
LBB11_25:
	movl	$__Variable_Zero_USINT, %eax
	retl
LBB11_5:
	cmpl	$1059, %ecx                     # imm = 0x423
	jle	LBB11_6
# %bb.13:
	cmpl	$1346, %ecx                     # imm = 0x542
	jle	LBB11_14
# %bb.17:
	cmpl	$1347, %ecx                     # imm = 0x543
	je	LBB11_29
# %bb.18:
	movl	$__Variable_Zero_BOOL, %eax
	cmpl	$1536, %ecx                     # imm = 0x600
	je	LBB11_38
# %bb.19:
	cmpl	$32769, %ecx                    # imm = 0x8001
	jne	LBB11_37
# %bb.20:
	movl	$__Variable_Zero_ANY, %eax
	retl
LBB11_6:
	cmpl	$1057, %ecx                     # imm = 0x421
	jg	LBB11_10
# %bb.7:
	cmpl	$782, %ecx                      # imm = 0x30E
	je	LBB11_30
# %bb.8:
	cmpl	$783, %ecx                      # imm = 0x30F
	jne	LBB11_37
# %bb.9:
	movl	$__Variable_Zero_LREAL, %eax
	retl
LBB11_39:
	jmpl	*LJTI11_0(,%eax,4)
LBB11_31:
	movl	$__Variable_Zero_BYTE, %eax
	retl
LBB11_40:
	jmpl	*LJTI11_1(,%eax,4)
LBB11_21:
	movl	$__Variable_Zero_SINT, %eax
	retl
LBB11_10:
	cmpl	$1058, %ecx                     # imm = 0x422
	je	LBB11_35
# %bb.11:
	cmpl	$1059, %ecx                     # imm = 0x423
	jne	LBB11_37
# %bb.12:
	movl	$__Variable_Zero_FUNCTION, %eax
	retl
LBB11_14:
	cmpl	$1060, %ecx                     # imm = 0x424
	je	LBB11_36
# %bb.15:
	cmpl	$1346, %ecx                     # imm = 0x542
	jne	LBB11_37
# %bb.16:
	movl	$__Variable_Zero_STRING, %eax
	retl
LBB11_30:
	movl	$__Variable_Zero_REAL, %eax
	retl
LBB11_35:
	movl	$__Variable_Zero_ARRAY, %eax
	retl
LBB11_29:
	movl	$__Variable_Zero_TIME, %eax
	retl
LBB11_33:
	movl	$__Variable_Zero_DWORD, %eax
	retl
LBB11_36:
	movl	$__Variable_Zero_STRUCT, %eax
	retl
LBB11_34:
	movl	$__Variable_Zero_QWORD, %eax
	retl
LBB11_23:
	movl	$__Variable_Zero_DINT, %eax
	retl
LBB11_32:
	movl	$__Variable_Zero_WORD, %eax
	retl
LBB11_27:
	movl	$__Variable_Zero_UDINT, %eax
	retl
LBB11_24:
	movl	$__Variable_Zero_LINT, %eax
	retl
LBB11_22:
	movl	$__Variable_Zero_INT, %eax
	retl
LBB11_28:
	movl	$__Variable_Zero_ULINT, %eax
	retl
LBB11_26:
	movl	$__Variable_Zero_UINT, %eax
	retl
LBB11_37:
	xorl	%eax, %eax
LBB11_38:
	retl
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI11_0:
	.long	LBB11_31
	.long	LBB11_32
	.long	LBB11_33
	.long	LBB11_34
LJTI11_1:
	.long	LBB11_21
	.long	LBB11_22
	.long	LBB11_23
	.long	LBB11_24
LJTI11_2:
	.long	LBB11_25
	.long	LBB11_26
	.long	LBB11_27
	.long	LBB11_28
                                        # -- End function
	.def	_Variable_Reset_All;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Variable_Reset_All             # -- Begin function Variable_Reset_All
	.p2align	4
_Variable_Reset_All:                    # @Variable_Reset_All
# %bb.0:
	pushl	%esi
	movl	_RUNvariablelist, %esi
	testl	%esi, %esi
	je	LBB12_36
# %bb.1:                                # %.preheader.preheader
	xorps	%xmm1, %xmm1
	jmp	LBB12_4
LBB12_25:                               #   in Loop: Header=BB12_4 Depth=1
	movl	$0, 4(%eax)
LBB12_2:                                #   in Loop: Header=BB12_4 Depth=1
	movl	$0, (%eax)
	.p2align	4
LBB12_3:                                #   in Loop: Header=BB12_4 Depth=1
	movl	19(%esi), %esi
	testl	%esi, %esi
	je	LBB12_36
LBB12_4:                                # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	cmpb	$0, 14(%esi)
	jne	LBB12_3
# %bb.5:                                #   in Loop: Header=BB12_4 Depth=1
	movl	4(%esi), %eax
	testl	%eax, %eax
	je	LBB12_3
# %bb.6:                                #   in Loop: Header=BB12_4 Depth=1
	movzwl	8(%esi), %ecx
	cmpl	$511, %ecx                      # imm = 0x1FF
	jle	LBB12_11
# %bb.7:                                #   in Loop: Header=BB12_4 Depth=1
	cmpl	$1057, %ecx                     # imm = 0x421
	jg	LBB12_15
# %bb.8:                                #   in Loop: Header=BB12_4 Depth=1
	leal	-512(%ecx), %edx
	cmpl	$3, %edx
	ja	LBB12_26
# %bb.9:                                #   in Loop: Header=BB12_4 Depth=1
	jmpl	*LJTI12_2(,%edx,4)
LBB12_11:                               #   in Loop: Header=BB12_4 Depth=1
	leal	-16(%ecx), %edx
	cmpl	$3, %edx
	jbe	LBB12_19
# %bb.12:                               #   in Loop: Header=BB12_4 Depth=1
	addl	$-260, %ecx                     # imm = 0xFEFC
	cmpl	$3, %ecx
	ja	LBB12_3
# %bb.13:                               #   in Loop: Header=BB12_4 Depth=1
	jmpl	*LJTI12_1(,%ecx,4)
LBB12_15:                               #   in Loop: Header=BB12_4 Depth=1
	cmpl	$1346, %ecx                     # imm = 0x542
	jg	LBB12_21
# %bb.16:                               #   in Loop: Header=BB12_4 Depth=1
	cmpl	$1058, %ecx                     # imm = 0x422
	je	LBB12_29
# %bb.17:                               #   in Loop: Header=BB12_4 Depth=1
	cmpl	$1060, %ecx                     # imm = 0x424
	je	LBB12_29
# %bb.18:                               #   in Loop: Header=BB12_4 Depth=1
	cmpl	$1346, %ecx                     # imm = 0x542
	je	LBB12_31
	jmp	LBB12_3
LBB12_19:                               #   in Loop: Header=BB12_4 Depth=1
	jmpl	*LJTI12_0(,%edx,4)
LBB12_14:                               #   in Loop: Header=BB12_4 Depth=1
	movw	$0, (%eax)
	jmp	LBB12_3
LBB12_21:                               #   in Loop: Header=BB12_4 Depth=1
	cmpl	$1347, %ecx                     # imm = 0x543
	je	LBB12_2
# %bb.22:                               #   in Loop: Header=BB12_4 Depth=1
	cmpl	$32769, %ecx                    # imm = 0x8001
	je	LBB12_30
# %bb.23:                               #   in Loop: Header=BB12_4 Depth=1
	cmpl	$1536, %ecx                     # imm = 0x600
	jne	LBB12_3
LBB12_24:                               #   in Loop: Header=BB12_4 Depth=1
	movb	$0, (%eax)
	jmp	LBB12_3
LBB12_26:                               #   in Loop: Header=BB12_4 Depth=1
	cmpl	$782, %ecx                      # imm = 0x30E
	je	LBB12_2
# %bb.27:                               #   in Loop: Header=BB12_4 Depth=1
	cmpl	$783, %ecx                      # imm = 0x30F
	jne	LBB12_3
# %bb.28:                               #   in Loop: Header=BB12_4 Depth=1
	xorps	%xmm0, %xmm0
	movsd	%xmm0, (%eax)
	jmp	LBB12_3
LBB12_29:                               #   in Loop: Header=BB12_4 Depth=1
	movl	10(%esi), %ecx
	movzwl	5(%ecx), %ecx
	pushl	%ecx
	pushl	$0
	pushl	%eax
	calll	_memset
	xorps	%xmm1, %xmm1
	addl	$12, %esp
	jmp	LBB12_3
LBB12_30:                               #   in Loop: Header=BB12_4 Depth=1
	movl	(%eax), %eax
	movl	(%eax), %eax
LBB12_31:                               #   in Loop: Header=BB12_4 Depth=1
	movups	%xmm1, 64(%eax)
	movups	%xmm1, 48(%eax)
	movups	%xmm1, 32(%eax)
	movups	%xmm1, 16(%eax)
	movups	%xmm1, (%eax)
	movl	$0, 79(%eax)
	jmp	LBB12_3
LBB12_36:                               # %.loopexit
	popl	%esi
	retl
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI12_0:
	.long	LBB12_24
	.long	LBB12_14
	.long	LBB12_2
	.long	LBB12_25
LJTI12_1:
	.long	LBB12_24
	.long	LBB12_14
	.long	LBB12_2
	.long	LBB12_25
LJTI12_2:
	.long	LBB12_24
	.long	LBB12_14
	.long	LBB12_2
	.long	LBB12_25
                                        # -- End function
	.def	_Variable_Swap;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Variable_Swap                  # -- Begin function Variable_Swap
	.p2align	4
_Variable_Swap:                         # @Variable_Swap
# %bb.0:
	pushl	%esi
	movl	_RUNvariablelist, %esi
	movl	_variablelist, %eax
	movl	%eax, _RUNvariablelist
	jmp	LBB13_1
	.p2align	4
LBB13_5:                                #   in Loop: Header=BB13_1 Depth=1
	movl	19(%esi), %esi
	pushl	%eax
	calll	_Heap_Free
	addl	$4, %esp
LBB13_1:                                # =>This Inner Loop Header: Depth=1
	movl	%esi, _variablelist
	testl	%esi, %esi
	je	LBB13_6
# %bb.2:                                # %.preheader
                                        #   in Loop: Header=BB13_1 Depth=1
	cmpl	$0, 10(%esi)
	movl	%esi, %eax
	jne	LBB13_5
# %bb.3:                                #   in Loop: Header=BB13_1 Depth=1
	cmpw	$1059, 8(%esi)                  # imm = 0x423
	movl	%esi, %eax
	je	LBB13_5
# %bb.4:                                #   in Loop: Header=BB13_1 Depth=1
	pushl	4(%esi)
	calll	_Heap_Free
	addl	$4, %esp
	movl	_variablelist, %eax
	jmp	LBB13_5
LBB13_6:                                # %.loopexit
	movl	$0, _variableBottom
	movl	$0, _variablelist
	popl	%esi
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_variablelist                   # @variablelist
	.p2align	2, 0x0
_variablelist:
	.long	0

	.globl	_variableBottom                 # @variableBottom
	.p2align	2, 0x0
_variableBottom:
	.long	0

	.globl	_RUNvariablelist                # @RUNvariablelist
	.p2align	2, 0x0
_RUNvariablelist:
	.long	0

	.section	.rdata,"dr",discard,"??_C@_0BD@PIGJDLMJ@Variable_Add?3entry?$AA@"
	.globl	"??_C@_0BD@PIGJDLMJ@Variable_Add?3entry?$AA@" # @"??_C@_0BD@PIGJDLMJ@Variable_Add?3entry?$AA@"
"??_C@_0BD@PIGJDLMJ@Variable_Add?3entry?$AA@":
	.asciz	"Variable_Add:entry"

	.section	.rdata,"dr",discard,"??_C@_0BC@BLILFEGL@Variable_Add?3name?$AA@"
	.globl	"??_C@_0BC@BLILFEGL@Variable_Add?3name?$AA@" # @"??_C@_0BC@BLILFEGL@Variable_Add?3name?$AA@"
"??_C@_0BC@BLILFEGL@Variable_Add?3name?$AA@":
	.asciz	"Variable_Add:name"

	.section	.rdata,"dr",discard,"??_C@_02MJNHLAAE@EG?$AA@"
	.globl	"??_C@_02MJNHLAAE@EG?$AA@"      # @"??_C@_02MJNHLAAE@EG?$AA@"
"??_C@_02MJNHLAAE@EG?$AA@":
	.asciz	"EG"

	.section	.rdata,"dr",discard,"??_C@_02KNHHEEKP@?5?5?$AA@"
	.globl	"??_C@_02KNHHEEKP@?5?5?$AA@"    # @"??_C@_02KNHHEEKP@?5?5?$AA@"
"??_C@_02KNHHEEKP@?5?5?$AA@":
	.asciz	"  "

	.section	.rdata,"dr",discard,"??_C@_02BIGHIPPJ@RO?$AA@"
	.globl	"??_C@_02BIGHIPPJ@RO?$AA@"      # @"??_C@_02BIGHIPPJ@RO?$AA@"
"??_C@_02BIGHIPPJ@RO?$AA@":
	.asciz	"RO"

	.section	.rdata,"dr",discard,"??_C@_0CI@JAAMHDIA@?5?5Variable?$CI?$CF03d?$CJ?5?$CFp?5?$CF?924s?5?5?$CF?910s@"
	.globl	"??_C@_0CI@JAAMHDIA@?5?5Variable?$CI?$CF03d?$CJ?5?$CFp?5?$CF?924s?5?5?$CF?910s@" # @"??_C@_0CI@JAAMHDIA@?5?5Variable?$CI?$CF03d?$CJ?5?$CFp?5?$CF?924s?5?5?$CF?910s@"
"??_C@_0CI@JAAMHDIA@?5?5Variable?$CI?$CF03d?$CJ?5?$CFp?5?$CF?924s?5?5?$CF?910s@":
	.asciz	"  Variable(%03d) %p %-24s  %-10s %s %s\n"

	.section	.rdata,"dr",discard,"??_C@_0BA@LBHLBGIF@Variable_Create?$AA@"
	.globl	"??_C@_0BA@LBHLBGIF@Variable_Create?$AA@" # @"??_C@_0BA@LBHLBGIF@Variable_Create?$AA@"
"??_C@_0BA@LBHLBGIF@Variable_Create?$AA@":
	.asciz	"Variable_Create"

	.section	.rdata,"dr",discard,"??_C@_0O@NOPHFFNJ@Variable_Body?$AA@"
	.globl	"??_C@_0O@NOPHFFNJ@Variable_Body?$AA@" # @"??_C@_0O@NOPHFFNJ@Variable_Body?$AA@"
"??_C@_0O@NOPHFFNJ@Variable_Body?$AA@":
	.asciz	"Variable_Body"

	.section	.rdata,"dr",discard,"??_C@_0BB@FLIGODG@Variable_GetSize?$AA@"
	.globl	"??_C@_0BB@FLIGODG@Variable_GetSize?$AA@" # @"??_C@_0BB@FLIGODG@Variable_GetSize?$AA@"
"??_C@_0BB@FLIGODG@Variable_GetSize?$AA@":
	.asciz	"Variable_GetSize"

	.section	.rdata,"dr",discard,"??_C@_0BB@OKBGGAGP@Variable_GetType?$AA@"
	.globl	"??_C@_0BB@OKBGGAGP@Variable_GetType?$AA@" # @"??_C@_0BB@OKBGGAGP@Variable_GetType?$AA@"
"??_C@_0BB@OKBGGAGP@Variable_GetType?$AA@":
	.asciz	"Variable_GetType"

	.bss
	.globl	__Variable_Zero_Body_String     # @_Variable_Zero_Body_String
__Variable_Zero_Body_String:
	.zero	83

	.globl	__Variable_Zero_Body_Array      # @_Variable_Zero_Body_Array
__Variable_Zero_Body_Array:
	.zero	3

	.globl	__Variable_Zero_Body            # @_Variable_Zero_Body
	.p2align	3, 0x0
__Variable_Zero_Body:
	.zero	8

	.data
	.globl	__Variable_Zero_BOOL            # @_Variable_Zero_BOOL
__Variable_Zero_BOOL:
	.long	__Variable_Zero_Body
	.short	1536                            # 0x600
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_SINT            # @_Variable_Zero_SINT
__Variable_Zero_SINT:
	.long	__Variable_Zero_Body
	.short	260                             # 0x104
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_INT             # @_Variable_Zero_INT
__Variable_Zero_INT:
	.long	__Variable_Zero_Body
	.short	261                             # 0x105
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_DINT            # @_Variable_Zero_DINT
__Variable_Zero_DINT:
	.long	__Variable_Zero_Body
	.short	262                             # 0x106
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_LINT            # @_Variable_Zero_LINT
__Variable_Zero_LINT:
	.long	__Variable_Zero_Body
	.short	263                             # 0x107
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_USINT           # @_Variable_Zero_USINT
__Variable_Zero_USINT:
	.long	__Variable_Zero_Body
	.short	512                             # 0x200
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_UINT            # @_Variable_Zero_UINT
__Variable_Zero_UINT:
	.long	__Variable_Zero_Body
	.short	513                             # 0x201
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_UDINT           # @_Variable_Zero_UDINT
__Variable_Zero_UDINT:
	.long	__Variable_Zero_Body
	.short	514                             # 0x202
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_ULINT           # @_Variable_Zero_ULINT
__Variable_Zero_ULINT:
	.long	__Variable_Zero_Body
	.short	515                             # 0x203
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_TIME            # @_Variable_Zero_TIME
__Variable_Zero_TIME:
	.long	__Variable_Zero_Body
	.short	1347                            # 0x543
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_BYTE            # @_Variable_Zero_BYTE
__Variable_Zero_BYTE:
	.long	__Variable_Zero_Body
	.short	16                              # 0x10
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_WORD            # @_Variable_Zero_WORD
__Variable_Zero_WORD:
	.long	__Variable_Zero_Body
	.short	17                              # 0x11
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_DWORD           # @_Variable_Zero_DWORD
__Variable_Zero_DWORD:
	.long	__Variable_Zero_Body
	.short	18                              # 0x12
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_QWORD           # @_Variable_Zero_QWORD
__Variable_Zero_QWORD:
	.long	__Variable_Zero_Body
	.short	19                              # 0x13
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_FUNCTION        # @_Variable_Zero_FUNCTION
__Variable_Zero_FUNCTION:
	.long	_Functionblock_Dummy
	.short	1059                            # 0x423
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_STRING          # @_Variable_Zero_STRING
__Variable_Zero_STRING:
	.long	__Variable_Zero_Body_String
	.short	1346                            # 0x542
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_ARRAY           # @_Variable_Zero_ARRAY
__Variable_Zero_ARRAY:
	.long	__Variable_Zero_Body_Array
	.short	1058                            # 0x422
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_STRUCT          # @_Variable_Zero_STRUCT
__Variable_Zero_STRUCT:
	.long	__Variable_Zero_Body_Array
	.short	1060                            # 0x424
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_ANY             # @_Variable_Zero_ANY
__Variable_Zero_ANY:
	.long	__Variable_Zero_Body
	.short	263                             # 0x107
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_REAL            # @_Variable_Zero_REAL
__Variable_Zero_REAL:
	.long	__Variable_Zero_Body
	.short	782                             # 0x30e
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_LREAL           # @_Variable_Zero_LREAL
__Variable_Zero_LREAL:
	.long	__Variable_Zero_Body
	.short	783                             # 0x30f
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.section	.rdata,"dr"
L_str:                                  # @str
	.asciz	"PLC variable list"

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
	.addrsig_sym _Functionblock_Dummy
	.addrsig_sym __Variable_Zero_Body_String
	.addrsig_sym __Variable_Zero_Body_Array
	.addrsig_sym __Variable_Zero_Body
	.addrsig_sym __Variable_Zero_BOOL
	.addrsig_sym __Variable_Zero_SINT
	.addrsig_sym __Variable_Zero_INT
	.addrsig_sym __Variable_Zero_DINT
	.addrsig_sym __Variable_Zero_LINT
	.addrsig_sym __Variable_Zero_USINT
	.addrsig_sym __Variable_Zero_UINT
	.addrsig_sym __Variable_Zero_UDINT
	.addrsig_sym __Variable_Zero_ULINT
	.addrsig_sym __Variable_Zero_TIME
	.addrsig_sym __Variable_Zero_BYTE
	.addrsig_sym __Variable_Zero_WORD
	.addrsig_sym __Variable_Zero_DWORD
	.addrsig_sym __Variable_Zero_QWORD
	.addrsig_sym __Variable_Zero_FUNCTION
	.addrsig_sym __Variable_Zero_STRING
	.addrsig_sym __Variable_Zero_ARRAY
	.addrsig_sym __Variable_Zero_STRUCT
	.addrsig_sym __Variable_Zero_ANY
	.addrsig_sym __Variable_Zero_REAL
	.addrsig_sym __Variable_Zero_LREAL
	.globl	__fltused
