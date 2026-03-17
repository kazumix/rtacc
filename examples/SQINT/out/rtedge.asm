	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"rtedge.c"
	.def	_Rtedge_TagCreate;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Rtedge_TagCreate               # -- Begin function Rtedge_TagCreate
	.p2align	4
_Rtedge_TagCreate:                      # @Rtedge_TagCreate
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$56, %esp
	movzwl	80(%esp), %edi
	movl	76(%esp), %esi
	leal	-1058(%edi), %eax
	cmpw	$3, %ax
	setb	%bl
	cmpl	$1346, %edi                     # imm = 0x542
	sete	%bh
	testl	%esi, %esi
	je	LBB0_4
# %bb.1:
	leal	6(%esp), %eax
	pushl	$2
	pushl	%eax
	pushl	$"??_C@_04KOACHJEN@Type?$AA@"
	pushl	%esi
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	jne	LBB0_4
# %bb.2:
	movb	%bl, 3(%esp)                    # 1-byte Spill
	pushl	%esi
	calll	_Rtedge_TagGetIecType
	addl	$4, %esp
	movzwl	%ax, %ecx
	cmpl	$1058, %ecx                     # imm = 0x422
	sete	%al
	movb	$1, %bl
	cmpw	%cx, %di
	je	LBB0_15
# %bb.3:
	orb	3(%esp), %bh                    # 1-byte Folded Reload
	andb	%al, %bh
	jne	LBB0_15
LBB0_4:
	movw	$99, %ax
	cmpl	$0, _typematch
	je	LBB0_9
# %bb.5:                                # %.preheader.preheader
	movl	$_typematch+4, %ecx
	.p2align	4
LBB0_6:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	cmpw	(%ecx), %di
	je	LBB0_7
# %bb.8:                                #   in Loop: Header=BB0_6 Depth=1
	cmpl	$0, 10(%ecx)
	leal	14(%ecx), %ecx
	jne	LBB0_6
	jmp	LBB0_9
LBB0_7:
	movzwl	2(%ecx), %eax
LBB0_9:                                 # %.loopexit
	movl	88(%esp), %ecx
	movl	84(%esp), %edx
	movzwl	%di, %edi
	leal	-1058(%edi), %ebx
	cmpl	$3, %ebx
	jb	LBB0_12
# %bb.10:                               # %.loopexit
	cmpl	$1346, %edi                     # imm = 0x542
	jne	LBB0_11
LBB0_12:
	testl	%edx, %edx
	movl	$1, %ebx
	cmovnel	%edx, %ebx
	testl	%ecx, %ecx
	movl	$"??_C@_00CNPNBAHC@?$AA@", %edx
	cmovnel	%ecx, %edx
	cmpl	$1346, %edi                     # imm = 0x542
	movl	$"??_C@_07DCPMEJPJ@STRING?$CD?$AA@", %ecx
	cmovnel	%edx, %ecx
	movl	$83, %edx
	cmovnel	%ebx, %edx
	leal	4(%esp), %ebx
	leal	6(%esp), %ebp
	movzwl	%ax, %eax
	movzwl	%dx, %edi
	pushl	%ebx
	pushl	$49
	pushl	%ebp
	pushl	$"??_C@_00CNPNBAHC@?$AA@"
	pushl	%ecx
	pushl	%edi
	pushl	%eax
	pushl	%esi
	calll	*__imp__EgTagCreateSegment
	addl	$32, %esp
	testl	%eax, %eax
	sete	%bl
	jne	LBB0_15
# %bb.13:
	pushl	$"??_C@_0CG@DCLCJKIA@Rtedge_TagCreate?3zero?5clear?5temp@"
	pushl	%edi
	calll	_Heap_Alloc
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB0_15
# %bb.14:
	pushl	%edi
	pushl	%eax
	pushl	$0
	pushl	%esi
	movl	%eax, %esi
	calll	*__imp__EgTagWriteSegment
	addl	$16, %esp
	pushl	%esi
	calll	_Heap_Free
	addl	$4, %esp
	jmp	LBB0_15
LBB0_11:
	testl	%edx, %edx
	movl	$"??_C@_00CNPNBAHC@?$AA@", %edi
	cmovel	%edi, %edx
	testl	%ecx, %ecx
	cmovel	%edi, %ecx
	movzwl	%ax, %eax
	pushl	%edx
	pushl	%ecx
	pushl	%eax
	pushl	%esi
	calll	*__imp__EgTagCreateEx
	addl	$16, %esp
	testl	%eax, %eax
	sete	%bl
LBB0_15:
	movl	%ebx, %eax
	addl	$56, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Rtedge_TagIsExist;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_TagIsExist              # -- Begin function Rtedge_TagIsExist
	.p2align	4
_Rtedge_TagIsExist:                     # @Rtedge_TagIsExist
# %bb.0:
	pushl	%eax
	movl	8(%esp), %eax
	testl	%eax, %eax
	je	LBB1_1
# %bb.2:
	leal	2(%esp), %ecx
	pushl	$2
	pushl	%ecx
	pushl	$"??_C@_04KOACHJEN@Type?$AA@"
	pushl	%eax
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	sete	%al
                                        # kill: def $al killed $al killed $eax
	popl	%ecx
	retl
LBB1_1:
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	popl	%ecx
	retl
                                        # -- End function
	.def	_Rtedge_TagGetIecType;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_TagGetIecType           # -- Begin function Rtedge_TagGetIecType
	.p2align	4
_Rtedge_TagGetIecType:                  # @Rtedge_TagGetIecType
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	%eax
	movl	20(%esp), %edi
	leal	2(%esp), %eax
	pushl	$2
	pushl	%eax
	pushl	$"??_C@_04KOACHJEN@Type?$AA@"
	pushl	%edi
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	cmpl	$0, _typematch
	je	LBB2_5
# %bb.1:
	movzwl	2(%esp), %eax
	movl	$_typematch+4, %ecx
	.p2align	4
LBB2_2:                                 # =>This Inner Loop Header: Depth=1
	cmpl	%eax, 2(%ecx)
	je	LBB2_3
# %bb.4:                                #   in Loop: Header=BB2_2 Depth=1
	cmpl	$0, 10(%ecx)
	leal	14(%ecx), %ecx
	jne	LBB2_2
LBB2_5:
	xorl	%esi, %esi
	jmp	LBB2_6
LBB2_3:
	movzwl	(%ecx), %esi
LBB2_6:                                 # %.loopexit2
	pushl	$600                            # imm = 0x258
	pushl	$_Rtedge_TagGetIecType.source
	pushl	$"??_C@_06CLBDIDBH@Source?$AA@"
	pushl	%edi
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	je	LBB2_7
LBB2_12:                                # %.loopexit
	movl	%esi, %eax
	addl	$4, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
LBB2_7:
	movl	_typematch, %ebx
	testl	%ebx, %ebx
	je	LBB2_12
# %bb.8:                                # %.preheader.preheader
	movl	$_typematch+14, %edi
	.p2align	4
LBB2_9:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebx
	calll	_strlen
	addl	$4, %esp
	pushl	%eax
	pushl	%ebx
	pushl	$_Rtedge_TagGetIecType.source
	calll	_strncmp
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB2_10
# %bb.11:                               #   in Loop: Header=BB2_9 Depth=1
	movl	(%edi), %ebx
	addl	$14, %edi
	testl	%ebx, %ebx
	jne	LBB2_9
	jmp	LBB2_12
LBB2_10:
	movzwl	-10(%edi), %esi
	jmp	LBB2_12
                                        # -- End function
	.def	_Rtedge_ConvertToEdgeType;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_ConvertToEdgeType       # -- Begin function Rtedge_ConvertToEdgeType
	.p2align	4
_Rtedge_ConvertToEdgeType:              # @Rtedge_ConvertToEdgeType
# %bb.0:
	movw	$99, %ax
	cmpl	$0, _typematch
	je	LBB3_5
# %bb.1:                                # %.preheader.preheader
	movzwl	4(%esp), %ecx
	movl	$_typematch+4, %edx
	.p2align	4
LBB3_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	cmpw	(%edx), %cx
	je	LBB3_3
# %bb.4:                                #   in Loop: Header=BB3_2 Depth=1
	cmpl	$0, 10(%edx)
	leal	14(%edx), %edx
	jne	LBB3_2
LBB3_5:                                 # %.loopexit
	retl
LBB3_3:
	movzwl	2(%edx), %eax
	retl
                                        # -- End function
	.def	_Rtedge_TagCreateByInstruction;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_TagCreateByInstruction  # -- Begin function Rtedge_TagCreateByInstruction
	.p2align	4
_Rtedge_TagCreateByInstruction:         # @Rtedge_TagCreateByInstruction
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	%eax
	movl	24(%esp), %ebp
	testl	%ebp, %ebp
	je	LBB4_21
# %bb.1:
	pushl	%ebp
	calll	_strlen
	addl	$4, %esp
	movl	_typematch, %esi
	testl	%esi, %esi
	je	LBB4_21
# %bb.2:                                # %.preheader.preheader
	incl	%eax
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$_typematch+14, %ebx
	.p2align	4
LBB4_3:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%esi
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %edi
	pushl	%eax
	pushl	%esi
	pushl	%ebp
	calll	_strncmp
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB4_4
# %bb.20:                               #   in Loop: Header=BB4_3 Depth=1
	movl	(%ebx), %esi
	addl	$14, %ebx
	testl	%esi, %esi
	jne	LBB4_3
LBB4_21:
	xorl	%eax, %eax
LBB4_22:                                # %.loopexit
                                        # kill: def $al killed $al killed $eax
	addl	$4, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB4_4:
	pushl	$"??_C@_0CO@JPBCBDJ@Rtedge_TagCreateByInstruction?3cl@"
	pushl	4(%esp)                         # 4-byte Folded Reload
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	%eax, %esi
	pushl	%ebp
	pushl	%eax
	calll	_strcpy
	addl	$8, %esp
	movzwl	-10(%ebx), %ebx
	cmpl	$1346, %ebx                     # imm = 0x542
	je	LBB4_7
# %bb.5:
	cmpl	$1059, %ebx                     # imm = 0x423
	jne	LBB4_13
# %bb.6:
	pushl	$35
	pushl	%esi
	calll	_strrchr
	addl	$8, %esp
	movl	%eax, %ebp
	movb	$0, (%eax)
	incl	%ebp
	movl	%esi, %eax
	addl	%edi, %eax
	pushl	%eax
	calll	_Functionblock_GetSize
	addl	$4, %esp
	pushl	%esi
	pushl	%eax
	pushl	$1059                           # imm = 0x423
	pushl	%ebp
	calll	_Rtedge_TagCreate
	addl	$16, %esp
	movl	%eax, %ebx
	pushl	%ebp
	calll	_Functionblock_Register
	addl	$4, %esp
	jmp	LBB4_19
LBB4_7:
	movl	%esi, %ebp
	addl	%edi, %ebp
	pushl	%ebp
	calll	_Variable_Search
	addl	$4, %esp
	movl	%eax, %edi
	testl	%eax, %eax
	jne	LBB4_9
# %bb.8:
	pushl	$1346                           # imm = 0x542
	pushl	%ebp
	calll	_Variable_Add
	addl	$8, %esp
	movl	%eax, %edi
LBB4_9:
	cmpb	$0, 28(%esp)
	je	LBB4_10
# %bb.12:
	pushl	$83
	jmp	LBB4_18
LBB4_13:
	movl	%esi, %ebp
	addl	%edi, %ebp
	pushl	%ebp
	calll	_Variable_Search
	addl	$4, %esp
	movl	%eax, %edi
	testl	%eax, %eax
	jne	LBB4_15
# %bb.14:
	movzwl	%bx, %eax
	pushl	%eax
	pushl	%ebp
	calll	_Variable_Add
	addl	$8, %esp
	movl	%eax, %edi
LBB4_15:
	cmpb	$0, 28(%esp)
	je	LBB4_16
# %bb.17:
	pushl	$8
LBB4_18:
	calll	_Variable_Body
	addl	$4, %esp
	movl	%eax, (%edi)
	xorl	%ebx, %ebx
	jmp	LBB4_19
LBB4_10:
	pushl	$"??_C@_07DCPMEJPJ@STRING?$CD?$AA@"
	pushl	$83
	pushl	$1346                           # imm = 0x542
	jmp	LBB4_11
LBB4_16:
	movzwl	%bx, %eax
	pushl	$0
	pushl	$0
	pushl	%eax
LBB4_11:
	pushl	%ebp
	calll	_Rtedge_TagCreate
	addl	$16, %esp
	movl	%eax, %ebx
	pushl	%ebp
	pushl	%edi
	calll	_Variable_LinkBody
	addl	$8, %esp
LBB4_19:
	pushl	%esi
	calll	_Heap_Free
	addl	$4, %esp
	movl	%ebx, %eax
	jmp	LBB4_22
                                        # -- End function
	.def	_Rtedge_ConvertToIecType;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_ConvertToIecType        # -- Begin function Rtedge_ConvertToIecType
	.p2align	4
_Rtedge_ConvertToIecType:               # @Rtedge_ConvertToIecType
# %bb.0:
	cmpl	$0, _typematch
	je	LBB5_1
# %bb.3:
	movzwl	4(%esp), %eax
	movl	$_typematch+4, %ecx
	.p2align	4
LBB5_4:                                 # =>This Inner Loop Header: Depth=1
	cmpl	%eax, 2(%ecx)
	je	LBB5_5
# %bb.6:                                #   in Loop: Header=BB5_4 Depth=1
	cmpl	$0, 10(%ecx)
	leal	14(%ecx), %ecx
	jne	LBB5_4
LBB5_1:
	xorl	%eax, %eax
                                        # kill: def $ax killed $ax killed $eax
	retl
LBB5_5:
	movzwl	(%ecx), %eax
                                        # kill: def $ax killed $ax killed $eax
	retl
                                        # -- End function
	.def	_Rtedge_TagGetPointer;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_TagGetPointer           # -- Begin function Rtedge_TagGetPointer
	.p2align	4
_Rtedge_TagGetPointer:                  # @Rtedge_TagGetPointer
# %bb.0:
	pushl	%eax
	movl	8(%esp), %eax
	movl	$0, (%esp)
	movl	%esp, %ecx
	pushl	$4
	pushl	%ecx
	pushl	$"??_C@_05HKHPEFOF@Entry?$AA@"
	pushl	%eax
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	movl	%eax, %ecx
	xorl	%eax, %eax
	testl	%ecx, %ecx
	jne	LBB6_2
# %bb.1:
	movl	(%esp), %eax
LBB6_2:
	popl	%ecx
	retl
                                        # -- End function
	.def	_Rtedge_TypeSize;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_TypeSize                # -- Begin function Rtedge_TypeSize
	.p2align	4
_Rtedge_TypeSize:                       # @Rtedge_TypeSize
# %bb.0:
	xorl	%eax, %eax
	cmpl	$0, _typematch
	je	LBB7_5
# %bb.1:                                # %.preheader.preheader
	movzwl	4(%esp), %ecx
	movl	$_typematch+14, %edx
	.p2align	4
LBB7_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	cmpw	-10(%edx), %cx
	je	LBB7_3
# %bb.4:                                #   in Loop: Header=BB7_2 Depth=1
	cmpl	$0, (%edx)
	leal	14(%edx), %edx
	jne	LBB7_2
LBB7_5:                                 # %.loopexit
	retl
LBB7_3:
	movl	-4(%edx), %eax
	xorl	%ecx, %ecx
	cmpl	$-1, %eax
	movzwl	%ax, %eax
	cmovel	%ecx, %eax
	retl
                                        # -- End function
	.def	_Rtedge_SizeOf;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_SizeOf                  # -- Begin function Rtedge_SizeOf
	.p2align	4
_Rtedge_SizeOf:                         # @Rtedge_SizeOf
# %bb.0:
	cmpl	$0, _typematch
	je	LBB8_1
# %bb.3:                                # %.preheader.preheader
	movl	4(%esp), %ecx
	movzwl	4(%ecx), %eax
	movl	$_typematch+14, %edx
	.p2align	4
LBB8_4:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	cmpw	-10(%edx), %ax
	je	LBB8_5
# %bb.8:                                #   in Loop: Header=BB8_4 Depth=1
	cmpl	$0, (%edx)
	leal	14(%edx), %edx
	jne	LBB8_4
LBB8_1:
	xorl	%eax, %eax
                                        # kill: def $ax killed $ax killed $eax
	retl
LBB8_5:
	movl	-4(%edx), %eax
	cmpl	$-1, %eax
	je	LBB8_6
# %bb.2:                                # %.loopexit
                                        # kill: def $ax killed $ax killed $eax
	retl
LBB8_6:
	movl	6(%ecx), %eax
	testl	%eax, %eax
	je	LBB8_1
# %bb.7:
	movzwl	5(%eax), %eax
                                        # kill: def $ax killed $ax killed $eax
	retl
                                        # -- End function
	.def	_Rtedge_GetStructureName;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_GetStructureName        # -- Begin function Rtedge_GetStructureName
	.p2align	4
_Rtedge_GetStructureName:               # @Rtedge_GetStructureName
# %bb.0:
	pushl	$600                            # imm = 0x258
	pushl	$_Rtedge_GetStructureName.name
	pushl	$"??_C@_06CLBDIDBH@Source?$AA@"
	pushl	16(%esp)
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	je	LBB9_1
LBB9_5:
	xorl	%eax, %eax
	retl
LBB9_1:
	movl	$1431458899, %eax               # imm = 0x55525453
	xorl	_Rtedge_GetStructureName.name, %eax
	movl	$592724821, %ecx                # imm = 0x23544355
	xorl	_Rtedge_GetStructureName.name+3, %ecx
	orl	%eax, %ecx
	je	LBB9_2
# %bb.3:
	pushl	$9
	pushl	$L___const.Rtedge_GetStructureName.tag2
	pushl	$_Rtedge_GetStructureName.name
	calll	_memcmp
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB9_5
# %bb.4:
	movl	$_Rtedge_GetStructureName.name+9, %eax
	retl
LBB9_2:
	movl	$_Rtedge_GetStructureName.name+7, %eax
	retl
                                        # -- End function
	.def	_Rtedge_IsStructure;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_IsStructure             # -- Begin function Rtedge_IsStructure
	.p2align	4
_Rtedge_IsStructure:                    # @Rtedge_IsStructure
# %bb.0:
	pushl	$600                            # imm = 0x258
	pushl	$_Rtedge_GetStructureName.name
	pushl	$"??_C@_06CLBDIDBH@Source?$AA@"
	pushl	16(%esp)
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	je	LBB10_1
LBB10_3:
	xorl	%eax, %eax
LBB10_4:
                                        # kill: def $al killed $al killed $eax
	retl
LBB10_1:
	movl	$1431458899, %ecx               # imm = 0x55525453
	xorl	_Rtedge_GetStructureName.name, %ecx
	movl	$592724821, %edx                # imm = 0x23544355
	xorl	_Rtedge_GetStructureName.name+3, %edx
	movb	$1, %al
	orl	%ecx, %edx
	je	LBB10_4
# %bb.2:
	pushl	$9
	pushl	$L___const.Rtedge_GetStructureName.tag2
	pushl	$_Rtedge_GetStructureName.name
	calll	_memcmp
	addl	$12, %esp
	movl	%eax, %ecx
	movb	$1, %al
	testl	%ecx, %ecx
	jne	LBB10_3
	jmp	LBB10_4
                                        # -- End function
	.def	_Rtedge_GetArrayName;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_GetArrayName            # -- Begin function Rtedge_GetArrayName
	.p2align	4
_Rtedge_GetArrayName:                   # @Rtedge_GetArrayName
# %bb.0:
	pushl	$600                            # imm = 0x258
	pushl	$_Rtedge_GetArrayName.name
	pushl	$"??_C@_06CLBDIDBH@Source?$AA@"
	pushl	16(%esp)
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	jne	LBB11_3
# %bb.1:
	movl	$1095914049, %eax               # imm = 0x41525241
	xorl	_Rtedge_GetArrayName.name, %eax
	movzwl	_Rtedge_GetArrayName.name+4, %ecx
	xorl	$9049, %ecx                     # imm = 0x2359
	orl	%eax, %ecx
	je	LBB11_2
LBB11_3:
	xorl	%eax, %eax
	retl
LBB11_2:
	movl	$_Rtedge_GetArrayName.name+6, %eax
	retl
                                        # -- End function
	.def	_Rtedge_IsArray;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_IsArray                 # -- Begin function Rtedge_IsArray
	.p2align	4
_Rtedge_IsArray:                        # @Rtedge_IsArray
# %bb.0:
	pushl	$600                            # imm = 0x258
	pushl	$_Rtedge_GetArrayName.name
	pushl	$"??_C@_06CLBDIDBH@Source?$AA@"
	pushl	16(%esp)
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	jne	LBB12_3
# %bb.1:
	movl	$1095914049, %eax               # imm = 0x41525241
	xorl	_Rtedge_GetArrayName.name, %eax
	movzwl	_Rtedge_GetArrayName.name+4, %ecx
	xorl	$9049, %ecx                     # imm = 0x2359
	orl	%eax, %ecx
	je	LBB12_2
LBB12_3:
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	retl
LBB12_2:
	movb	$1, %al
                                        # kill: def $al killed $al killed $eax
	retl
                                        # -- End function
	.def	_Rtedge_Compile;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_Compile                 # -- Begin function Rtedge_Compile
	.p2align	4
_Rtedge_Compile:                        # @Rtedge_Compile
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$12, %esp
	movl	32(%esp), %edi
	xorl	%esi, %esi
	testl	%edi, %edi
	je	LBB13_8
# %bb.1:
	leal	10(%esp), %eax
	pushl	$2
	pushl	%eax
	pushl	$"??_C@_04KOACHJEN@Type?$AA@"
	pushl	%edi
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	jne	LBB13_8
# %bb.2:
	pushl	%edi
	calll	_Rtedge_TagGetIecType
	addl	$4, %esp
	movl	%eax, %esi
	movl	$0, (%esp)
	movl	%esp, %eax
	pushl	$4
	pushl	%eax
	pushl	$"??_C@_05HKHPEFOF@Entry?$AA@"
	pushl	%edi
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	xorl	%ebx, %ebx
	testl	%eax, %eax
	movl	(%esp), %eax
	movl	%eax, 4(%esp)                   # 4-byte Spill
	cmovel	%eax, %ebx
	movzwl	%si, %ebp
	pushl	%ebp
	pushl	%edi
	calll	_Variable_Add
	addl	$8, %esp
	movl	%eax, %esi
	movw	%bp, 4(%eax)
	movl	%ebx, 6(%eax)
	leal	-1058(%ebp), %eax
	cmpl	$2, %eax
	movl	4(%esp), %eax                   # 4-byte Reload
	jb	LBB13_5
# %bb.3:
	cmpl	$1346, %ebp                     # imm = 0x542
	je	LBB13_5
# %bb.4:
	cmpl	$1, 385(%eax)
	jne	LBB13_6
LBB13_5:
	movl	23(%eax), %ebx
LBB13_7:
	movl	%ebx, (%esi)
LBB13_8:
	movl	%esi, %eax
	addl	$12, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB13_6:
	addl	$15, %ebx
	jmp	LBB13_7
                                        # -- End function
	.def	_Rtedge_GetPointer;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_GetPointer              # -- Begin function Rtedge_GetPointer
	.p2align	4
_Rtedge_GetPointer:                     # @Rtedge_GetPointer
# %bb.0:
	movl	4(%esp), %eax
	movzwl	8(%esp), %ecx
	leal	-1058(%ecx), %edx
	cmpl	$2, %edx
	jb	LBB14_3
# %bb.1:
	cmpl	$1346, %ecx                     # imm = 0x542
	je	LBB14_3
# %bb.2:
	cmpl	$1, 385(%eax)
	jne	LBB14_4
LBB14_3:
	movl	23(%eax), %eax
	retl
LBB14_4:
	addl	$15, %eax
	retl
                                        # -- End function
	.def	_Rtedge_TagRead_UInt32;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_TagRead_UInt32          # -- Begin function Rtedge_TagRead_UInt32
	.p2align	4
_Rtedge_TagRead_UInt32:                 # @Rtedge_TagRead_UInt32
# %bb.0:
	pushl	$4
	pushl	12(%esp)
	pushl	12(%esp)
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	sete	%al
	retl
                                        # -- End function
	.def	_Rtedge_TagWrite_UInt32;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_TagWrite_UInt32         # -- Begin function Rtedge_TagWrite_UInt32
	.p2align	4
_Rtedge_TagWrite_UInt32:                # @Rtedge_TagWrite_UInt32
# %bb.0:
	leal	8(%esp), %eax
	pushl	$4
	pushl	%eax
	pushl	12(%esp)
	calll	*__imp__EgTagWrite
	addl	$12, %esp
	testl	%eax, %eax
	sete	%al
	retl
                                        # -- End function
	.def	_Rtedge_IsDirectMemory;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_IsDirectMemory          # -- Begin function Rtedge_IsDirectMemory
	.p2align	4
_Rtedge_IsDirectMemory:                 # @Rtedge_IsDirectMemory
# %bb.0:
	movl	4(%esp), %eax
	cmpl	$1, 385(%eax)
	sete	%al
	retl
                                        # -- End function
	.def	_Rtedge_SetTagDefaultValue;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_SetTagDefaultValue      # -- Begin function Rtedge_SetTagDefaultValue
	.p2align	4
_Rtedge_SetTagDefaultValue:             # @Rtedge_SetTagDefaultValue
# %bb.0:
	calll	*__imp__EgTagSetDefaultValue
	testl	%eax, %eax
	sete	%al
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.section	.rdata,"dr",discard,"??_C@_00CNPNBAHC@?$AA@"
	.globl	"??_C@_00CNPNBAHC@?$AA@"        # @"??_C@_00CNPNBAHC@?$AA@"
"??_C@_00CNPNBAHC@?$AA@":
	.zero	1

	.section	.rdata,"dr",discard,"??_C@_07DCPMEJPJ@STRING?$CD?$AA@"
	.globl	"??_C@_07DCPMEJPJ@STRING?$CD?$AA@" # @"??_C@_07DCPMEJPJ@STRING?$CD?$AA@"
"??_C@_07DCPMEJPJ@STRING?$CD?$AA@":
	.asciz	"STRING#"

	.section	.rdata,"dr",discard,"??_C@_0CG@DCLCJKIA@Rtedge_TagCreate?3zero?5clear?5temp@"
	.globl	"??_C@_0CG@DCLCJKIA@Rtedge_TagCreate?3zero?5clear?5temp@" # @"??_C@_0CG@DCLCJKIA@Rtedge_TagCreate?3zero?5clear?5temp@"
"??_C@_0CG@DCLCJKIA@Rtedge_TagCreate?3zero?5clear?5temp@":
	.asciz	"Rtedge_TagCreate:zero clear temporary"

	.section	.rdata,"dr",discard,"??_C@_0CO@JPBCBDJ@Rtedge_TagCreateByInstruction?3cl@"
	.globl	"??_C@_0CO@JPBCBDJ@Rtedge_TagCreateByInstruction?3cl@" # @"??_C@_0CO@JPBCBDJ@Rtedge_TagCreateByInstruction?3cl@"
"??_C@_0CO@JPBCBDJ@Rtedge_TagCreateByInstruction?3cl@":
	.asciz	"Rtedge_TagCreateByInstruction:clone temporary"

	.section	.rdata,"dr",discard,"??_C@_04KOACHJEN@Type?$AA@"
	.globl	"??_C@_04KOACHJEN@Type?$AA@"    # @"??_C@_04KOACHJEN@Type?$AA@"
"??_C@_04KOACHJEN@Type?$AA@":
	.asciz	"Type"

	.lcomm	_Rtedge_TagGetIecType.source,600 # @Rtedge_TagGetIecType.source
	.section	.rdata,"dr",discard,"??_C@_06CLBDIDBH@Source?$AA@"
	.globl	"??_C@_06CLBDIDBH@Source?$AA@"  # @"??_C@_06CLBDIDBH@Source?$AA@"
"??_C@_06CLBDIDBH@Source?$AA@":
	.asciz	"Source"

	.section	.rdata,"dr",discard,"??_C@_05HKHPEFOF@Entry?$AA@"
	.globl	"??_C@_05HKHPEFOF@Entry?$AA@"   # @"??_C@_05HKHPEFOF@Entry?$AA@"
"??_C@_05HKHPEFOF@Entry?$AA@":
	.asciz	"Entry"

	.lcomm	_Rtedge_GetStructureName.name,600 # @Rtedge_GetStructureName.name
	.section	.rdata,"dr"
L___const.Rtedge_GetStructureName.tag1: # @__const.Rtedge_GetStructureName.tag1
	.asciz	"STRUCT#"

L___const.Rtedge_GetStructureName.tag2: # @__const.Rtedge_GetStructureName.tag2
	.asciz	"FUNCTION#"

	.lcomm	_Rtedge_GetArrayName.name,600   # @Rtedge_GetArrayName.name
L___const.Rtedge_GetArrayName.tag:      # @__const.Rtedge_GetArrayName.tag
	.asciz	"ARRAY#"

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
	.addrsig_sym _Rtedge_TagGetIecType.source
	.addrsig_sym _Rtedge_GetStructureName.name
	.addrsig_sym _Rtedge_GetArrayName.name
