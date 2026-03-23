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
	pushl	%ebx
	pushl	%esi
	calll	_IlRtedgeTags_Init
	movl	$458129845, %esi                # imm = 0x1B4E81B5
	.p2align	4
LBB0_1:                                 # =>This Inner Loop Header: Depth=1
	movl	_il_slot_SW1, %eax
	movzbl	(%eax), %ebx
	movl	_il_slot_SW2, %eax
	movl	_il_slot_SW3, %ecx
	movl	_il_slot_MsTick, %edx
	andb	(%eax), %bl
	orb	(%ecx), %bl
	movl	(%edx), %ecx
	movl	_il_slot_LED1, %eax
	andb	$1, %bl
	movb	%bl, (%eax)
	movl	%ecx, %eax
	imull	%esi
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$6, %edx
	addl	%eax, %edx
	imull	$600, %edx, %eax                # imm = 0x258
	subl	%eax, %ecx
	cmpl	$300, %ecx                      # imm = 0x12C
	setl	%al
	movl	_il_slot_LED2, %ecx
	andb	%bl, %al
	movb	%al, (%ecx)
	movl	_il_slot_MsTick, %eax
	incl	(%eax)
	pushl	$1
	calll	_RtSleepEx
	addl	$4, %esp
	jmp	LBB0_1
                                        # -- End function
	.def	_il_rtedge_registry_push;
	.scl	2;
	.type	32;
	.endef
	.globl	_il_rtedge_registry_push        # -- Begin function il_rtedge_registry_push
	.p2align	4
_il_rtedge_registry_push:               # @il_rtedge_registry_push
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	16(%esp), %eax
	testl	%eax, %eax
	sete	%cl
	movl	_il_rtedge_tag_count, %esi
	cmpl	$127, %esi
	seta	%dl
	orb	%cl, %dl
	je	LBB1_2
# %bb.1:
	xorl	%eax, %eax
	jmp	LBB1_18
LBB1_2:                                 # %.preheader.preheader
	movl	$5, %edi
	cmpb	$0, -5(%eax,%edi)
	je	LBB1_14
	.p2align	4
LBB1_4:                                 # =>This Inner Loop Header: Depth=1
	cmpb	$0, -4(%eax,%edi)
	je	LBB1_16
# %bb.5:                                #   in Loop: Header=BB1_4 Depth=1
	cmpb	$0, -3(%eax,%edi)
	je	LBB1_12
# %bb.6:                                #   in Loop: Header=BB1_4 Depth=1
	cmpl	$113, %edi
	je	LBB1_7
# %bb.8:                                # %.preheader.1
                                        #   in Loop: Header=BB1_4 Depth=1
	cmpb	$0, -2(%eax,%edi)
	je	LBB1_13
# %bb.9:                                #   in Loop: Header=BB1_4 Depth=1
	cmpb	$0, -1(%eax,%edi)
	je	LBB1_15
# %bb.10:                               #   in Loop: Header=BB1_4 Depth=1
	cmpb	$0, (%eax,%edi)
	je	LBB1_17
# %bb.11:                               #   in Loop: Header=BB1_4 Depth=1
	addl	$6, %edi
	cmpb	$0, -5(%eax,%edi)
	jne	LBB1_4
LBB1_14:                                # %.preheader.splitsplitsplit_crit_edge
	addl	$-5, %edi
	jmp	LBB1_17
LBB1_16:                                # %._crit_edge
	addl	$-4, %edi
	jmp	LBB1_17
LBB1_12:                                # %.splitsplitsplitsplitsplit_crit_edge
	addl	$-3, %edi
	jmp	LBB1_17
LBB1_7:
	movl	$111, %edi
	jmp	LBB1_17
LBB1_13:                                # %.preheader.1.splitsplitsplitsplit_crit_edge
	addl	$-2, %edi
	jmp	LBB1_17
LBB1_15:                                # %.splitsplit_crit_edge
	decl	%edi
LBB1_17:
	imull	$112, %esi, %ebx
	leal	_il_rtedge_tag_storage(%ebx), %ecx
	pushl	%edi
	pushl	%eax
	pushl	%ecx
	calll	_memcpy
	addl	$12, %esp
	movb	$0, _il_rtedge_tag_storage(%ebx,%edi)
	incl	%esi
	movl	%esi, _il_rtedge_tag_count
	movb	$1, %al
LBB1_18:
                                        # kill: def $al killed $al killed $eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_IlRtedgeTags_GetRegisteredCount;
	.scl	2;
	.type	32;
	.endef
	.globl	_IlRtedgeTags_GetRegisteredCount # -- Begin function IlRtedgeTags_GetRegisteredCount
	.p2align	4
_IlRtedgeTags_GetRegisteredCount:       # @IlRtedgeTags_GetRegisteredCount
# %bb.0:
	movl	_il_rtedge_tag_count, %eax
	retl
                                        # -- End function
	.def	_IlRtedgeTags_GetRegisteredSpec;
	.scl	2;
	.type	32;
	.endef
	.globl	_IlRtedgeTags_GetRegisteredSpec # -- Begin function IlRtedgeTags_GetRegisteredSpec
	.p2align	4
_IlRtedgeTags_GetRegisteredSpec:        # @IlRtedgeTags_GetRegisteredSpec
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	16(%esp), %esi
	movl	$-1, %eax
	testl	%esi, %esi
	je	LBB3_20
# %bb.1:
	movl	20(%esp), %ecx
	testl	%ecx, %ecx
	je	LBB3_20
# %bb.2:
	movl	12(%esp), %edx
	cmpl	_il_rtedge_tag_count, %edx
	jae	LBB3_20
# %bb.3:
	imull	$112, %edx, %edx
	leal	_il_rtedge_tag_storage(%edx), %edx
	movl	$5, %edi
	cmpb	$0, -5(%edx,%edi)
	je	LBB3_15
	.p2align	4
LBB3_5:                                 # =>This Inner Loop Header: Depth=1
	cmpb	$0, -4(%edx,%edi)
	je	LBB3_17
# %bb.6:                                #   in Loop: Header=BB3_5 Depth=1
	cmpb	$0, -3(%edx,%edi)
	je	LBB3_13
# %bb.7:                                #   in Loop: Header=BB3_5 Depth=1
	cmpl	$113, %edi
	je	LBB3_8
# %bb.9:                                #   in Loop: Header=BB3_5 Depth=1
	cmpb	$0, -2(%edx,%edi)
	je	LBB3_14
# %bb.10:                               #   in Loop: Header=BB3_5 Depth=1
	cmpb	$0, -1(%edx,%edi)
	je	LBB3_16
# %bb.11:                               #   in Loop: Header=BB3_5 Depth=1
	cmpb	$0, (%edx,%edi)
	je	LBB3_18
# %bb.12:                               #   in Loop: Header=BB3_5 Depth=1
	addl	$6, %edi
	cmpb	$0, -5(%edx,%edi)
	jne	LBB3_5
LBB3_15:                                # %.splitsplitsplit_crit_edge
	addl	$-5, %edi
	cmpl	%ecx, %edi
	jb	LBB3_19
	jmp	LBB3_20
LBB3_17:                                # %._crit_edge
	addl	$-4, %edi
	cmpl	%ecx, %edi
	jb	LBB3_19
	jmp	LBB3_20
LBB3_13:                                # %.splitsplitsplitsplitsplit_crit_edge
	addl	$-3, %edi
	cmpl	%ecx, %edi
	jb	LBB3_19
	jmp	LBB3_20
LBB3_8:
	movl	$111, %edi
	cmpl	%ecx, %edi
	jb	LBB3_19
	jmp	LBB3_20
LBB3_14:                                # %.splitsplitsplitsplit_crit_edge
	addl	$-2, %edi
LBB3_18:
	cmpl	%ecx, %edi
	jae	LBB3_20
LBB3_19:
	pushl	%edi
	pushl	%edx
	pushl	%esi
	calll	_memcpy
	addl	$12, %esp
	movb	$0, (%esi,%edi)
	xorl	%eax, %eax
LBB3_20:
	popl	%esi
	popl	%edi
	retl
LBB3_16:                                # %.splitsplit_crit_edge
	decl	%edi
	cmpl	%ecx, %edi
	jb	LBB3_19
	jmp	LBB3_20
                                        # -- End function
	.def	_IlRtedgeTags_Init;
	.scl	2;
	.type	32;
	.endef
	.globl	_IlRtedgeTags_Init              # -- Begin function IlRtedgeTags_Init
	.p2align	4
_IlRtedgeTags_Init:                     # @IlRtedgeTags_Init
# %bb.0:
	pushl	%eax
	movl	$0, (%esp)
LBB4_1:                                 # =>This Inner Loop Header: Depth=1
	cmpl	$6, (%esp)
	jae	LBB4_4
# %bb.2:                                #   in Loop: Header=BB4_1 Depth=1
	movl	(%esp), %eax
	movl	_k_st2_rtedge_scalar_specs(,%eax,4), %ecx
	calll	_il_rtedge_apply_instruction_spec
# %bb.3:                                #   in Loop: Header=BB4_1 Depth=1
	movl	(%esp), %eax
	addl	$1, %eax
	movl	%eax, (%esp)
	jmp	LBB4_1
LBB4_4:
	calll	_st2_rtedge_invoke_slots_init
	calll	_IlRtedgeSlots_BindEgEntry
	popl	%eax
	retl
                                        # -- End function
	.def	_il_rtedge_apply_instruction_spec;
	.scl	3;
	.type	32;
	.endef
	.p2align	4                               # -- Begin function il_rtedge_apply_instruction_spec
_il_rtedge_apply_instruction_spec:      # @il_rtedge_apply_instruction_spec
# %bb.0:
	pushl	%esi
	subl	$112, %esp
	movzbl	(%ecx), %edx
	testb	%dl, %dl
	je	LBB5_1
# %bb.2:                                # %.preheader.preheader
	xorl	%esi, %esi
	.p2align	4
LBB5_3:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	leal	1(%esi), %eax
	movb	%dl, (%esp,%esi)
	cmpl	$110, %eax
	ja	LBB5_5
# %bb.4:                                # %.preheader
                                        #   in Loop: Header=BB5_3 Depth=1
	movzbl	1(%ecx,%esi), %edx
	movl	%eax, %esi
	testb	%dl, %dl
	jne	LBB5_3
	jmp	LBB5_5
LBB5_1:
	xorl	%eax, %eax
LBB5_5:                                 # %.loopexit
	movb	$0, (%esp,%eax)
	movl	%esp, %eax
	pushl	$0
	pushl	%eax
	calll	_Rtedge_TagCreateByInstruction
	addl	$120, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_st2_rtedge_invoke_slots_init;
	.scl	3;
	.type	32;
	.endef
	.p2align	4                               # -- Begin function st2_rtedge_invoke_slots_init
_st2_rtedge_invoke_slots_init:          # @st2_rtedge_invoke_slots_init
# %bb.0:
	movl	$_il_mem_SW1, _il_slot_SW1
	movl	$_il_mem_SW2, _il_slot_SW2
	movl	$_il_mem_SW3, _il_slot_SW3
	movl	$_il_mem_MsTick, _il_slot_MsTick
	movl	$_il_mem_LED1, _il_slot_LED1
	movl	$_il_mem_LED2, _il_slot_LED2
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
	subl	$264, %esp                      # imm = 0x108
	movl	284(%esp), %ebp
	testl	%ebp, %ebp
	je	LBB7_61
# %bb.1:
	pushl	%ebp
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %edi
	pushl	$5
	pushl	$"??_C@_05NCFAHBAN@BOOL?$CD?$AA@"
	pushl	%ebp
	calll	_strncmp
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB7_9
# %bb.2:
	pushl	$4
	pushl	$"??_C@_04MCOJOMNJ@INT?$CD?$AA@"
	pushl	%ebp
	calll	_strncmp
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB7_10
# %bb.3:
	pushl	$5
	pushl	$"??_C@_05OJEKCDCD@UINT?$CD?$AA@"
	pushl	%ebp
	calll	_strncmp
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB7_11
# %bb.4:
	pushl	$5
	pushl	$"??_C@_05CNEHJGCP@TIME?$CD?$AA@"
	pushl	%ebp
	calll	_strncmp
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB7_12
# %bb.5:
	pushl	$9
	pushl	$"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@"
	pushl	%ebp
	calll	_strncmp
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB7_13
# %bb.6:
	pushl	$7
	pushl	$"??_C@_07DCPMEJPJ@STRING?$CD?$AA@"
	pushl	%ebp
	calll	_strncmp
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB7_61
# %bb.14:
	movl	$7, (%esp)                      # 4-byte Folded Spill
	movl	$_il_kw+80, %ebx
	jmp	LBB7_15
LBB7_9:
	movl	$5, (%esp)                      # 4-byte Folded Spill
	movl	$_il_kw, %ebx
	jmp	LBB7_15
LBB7_10:
	movl	$4, (%esp)                      # 4-byte Folded Spill
	movl	$_il_kw+16, %ebx
	jmp	LBB7_15
LBB7_11:
	movl	$5, (%esp)                      # 4-byte Folded Spill
	movl	$_il_kw+32, %ebx
	jmp	LBB7_15
LBB7_12:
	movl	$5, (%esp)                      # 4-byte Folded Spill
	movl	$_il_kw+48, %ebx
	jmp	LBB7_15
LBB7_13:
	movl	$9, (%esp)                      # 4-byte Folded Spill
	movl	$_il_kw+64, %ebx
LBB7_15:
	incl	%edi
	pushl	%edi
	calll	_malloc
	addl	$4, %esp
	testl	%eax, %eax
	je	LBB7_61
# %bb.16:
	movl	%eax, %esi
	pushl	%edi
	pushl	%ebp
	pushl	%eax
	calll	_memcpy
	addl	$12, %esp
	movzwl	4(%ebx), %ecx
	movw	$99, %ax
	cmpl	$1345, %ecx                     # imm = 0x541
	jg	LBB7_26
# %bb.17:
	cmpl	$261, %ecx                      # imm = 0x105
	je	LBB7_29
# %bb.18:
	cmpl	$513, %ecx                      # imm = 0x201
	je	LBB7_34
# %bb.19:
	cmpl	$1059, %ecx                     # imm = 0x423
	jne	LBB7_37
# %bb.20:
	pushl	$35
	pushl	%esi
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB7_60
# %bb.21:
	movl	%eax, %edi
	movb	$0, (%eax)
	incl	%edi
	movl	%esi, %ebx
	movl	(%esp), %eax                    # 4-byte Reload
	addl	%eax, %ebx
	movw	$0, 6(%esp)
	movzbl	(%esi,%eax), %eax
	cmpl	$84, %eax
	je	LBB7_57
# %bb.22:
	movw	$64, %cx
	cmpl	$67, %eax
	jne	LBB7_59
# %bb.23:
	cmpb	$84, 1(%ebx)
	jne	LBB7_59
# %bb.24:
	movw	$32, %ax
	movb	$85, %cl
	movl	$2, %edx
	jmp	LBB7_58
LBB7_26:
	cmpl	$1346, %ecx                     # imm = 0x542
	je	LBB7_30
# %bb.27:
	cmpl	$1347, %ecx                     # imm = 0x543
	je	LBB7_35
# %bb.28:
	movl	$_il_kw, %edx
	cmpl	$1536, %ecx                     # imm = 0x600
	je	LBB7_36
	jmp	LBB7_37
LBB7_29:
	movl	$_il_kw+16, %edx
	jmp	LBB7_36
LBB7_30:
	movw	$0, 6(%esp)
	cmpb	$0, 288(%esp)
	jne	LBB7_38
# %bb.31:
	movl	%esi, %edi
	addl	(%esp), %edi                    # 4-byte Folded Reload
	leal	6(%esp), %eax
	leal	8(%esp), %ecx
	pushl	%eax
	pushl	$256                            # imm = 0x100
	pushl	%ecx
	pushl	$"??_C@_00CNPNBAHC@?$AA@"
	pushl	$"??_C@_07DCPMEJPJ@STRING?$CD?$AA@"
	pushl	$83
	pushl	$13
	pushl	%edi
	calll	*__imp__EgTagCreateSegment
	addl	$32, %esp
	testl	%eax, %eax
	jne	LBB7_60
# %bb.32:
	pushl	$83
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB7_38
# %bb.33:
	movl	%eax, %ebx
	pushl	$83
	jmp	LBB7_71
LBB7_34:
	movl	$_il_kw+32, %edx
	jmp	LBB7_36
LBB7_35:
	movl	$_il_kw+48, %edx
LBB7_36:
	movzwl	8(%edx), %eax
LBB7_37:
	cmpb	$0, 288(%esp)
	je	LBB7_49
LBB7_38:
	pushl	%esi
	calll	_free
	addl	$4, %esp
LBB7_39:
	movl	_il_rtedge_tag_count, %esi
	movb	$1, %al
	cmpl	$127, %esi
	ja	LBB7_62
# %bb.40:                               # %.preheader.i.preheader
	movl	$5, %edi
	cmpb	$0, -5(%ebp,%edi)
	je	LBB7_48
	.p2align	4
LBB7_41:                                # =>This Inner Loop Header: Depth=1
	cmpb	$0, -4(%ebp,%edi)
	je	LBB7_51
# %bb.42:                               #   in Loop: Header=BB7_41 Depth=1
	cmpb	$0, -3(%ebp,%edi)
	je	LBB7_52
# %bb.43:                               #   in Loop: Header=BB7_41 Depth=1
	cmpl	$113, %edi
	je	LBB7_53
# %bb.44:                               # %.preheader.i.1
                                        #   in Loop: Header=BB7_41 Depth=1
	cmpb	$0, -2(%ebp,%edi)
	je	LBB7_54
# %bb.45:                               #   in Loop: Header=BB7_41 Depth=1
	cmpb	$0, -1(%ebp,%edi)
	je	LBB7_55
# %bb.46:                               #   in Loop: Header=BB7_41 Depth=1
	cmpb	$0, (%ebp,%edi)
	je	LBB7_56
# %bb.47:                               #   in Loop: Header=BB7_41 Depth=1
	addl	$6, %edi
	cmpb	$0, -5(%ebp,%edi)
	jne	LBB7_41
LBB7_48:                                # %.preheader.i.splitsplitsplit_crit_edge
	addl	$-5, %edi
	jmp	LBB7_56
LBB7_49:
	movl	%esi, %ecx
	addl	(%esp), %ecx                    # 4-byte Folded Reload
	movzwl	%ax, %eax
	pushl	$"??_C@_00CNPNBAHC@?$AA@"
	pushl	%esi
	pushl	%eax
	pushl	%ecx
	calll	*__imp__EgTagCreateEx
	addl	$16, %esp
	movl	%eax, %edi
	pushl	%esi
	calll	_free
	addl	$4, %esp
	testl	%edi, %edi
	jne	LBB7_61
	jmp	LBB7_39
LBB7_51:                                # %._crit_edge
	addl	$-4, %edi
	jmp	LBB7_56
LBB7_52:                                # %.splitsplitsplitsplitsplit_crit_edge
	addl	$-3, %edi
	jmp	LBB7_56
LBB7_53:
	movl	$111, %edi
	jmp	LBB7_56
LBB7_54:                                # %.preheader.i.1.splitsplitsplitsplit_crit_edge
	addl	$-2, %edi
	jmp	LBB7_56
LBB7_55:                                # %.splitsplit_crit_edge
	decl	%edi
LBB7_56:
	imull	$112, %esi, %ebx
	leal	_il_rtedge_tag_storage(%ebx), %eax
	pushl	%edi
	pushl	%ebp
	pushl	%eax
	calll	_memcpy
	addl	$12, %esp
	movb	$0, _il_rtedge_tag_storage(%ebx,%edi)
	incl	%esi
	movl	%esi, _il_rtedge_tag_count
	movb	$1, %al
	jmp	LBB7_62
LBB7_57:
	movw	$40, %ax
	movb	$80, %cl
	movl	$1, %edx
LBB7_58:
	cmpb	%cl, (%ebx,%edx)
	movl	$64, %ecx
	cmovel	%eax, %ecx
LBB7_59:
	leal	6(%esp), %eax
	leal	8(%esp), %edx
	movzwl	%cx, %ecx
	pushl	%eax
	pushl	$256                            # imm = 0x100
	pushl	%edx
	pushl	$"??_C@_00CNPNBAHC@?$AA@"
	pushl	%esi
	pushl	%ecx
	pushl	$13
	pushl	%edi
	calll	*__imp__EgTagCreateSegment
	addl	$32, %esp
	testl	%eax, %eax
	je	LBB7_63
LBB7_60:
	pushl	%esi
	calll	_free
	addl	$4, %esp
LBB7_61:                                # %il_rtedge_registry_push.exit
	xorl	%eax, %eax
LBB7_62:                                # %il_rtedge_registry_push.exit
                                        # kill: def $al killed $al killed $eax
	addl	$264, %esp                      # imm = 0x108
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB7_63:
	movzbl	(%ebx), %eax
	cmpl	$84, %eax
	je	LBB7_67
# %bb.64:
	movw	$64, %cx
	cmpl	$67, %eax
	jne	LBB7_69
# %bb.65:
	cmpb	$84, 1(%ebx)
	jne	LBB7_69
# %bb.66:
	movw	$32, %ax
	movb	$85, %cl
	movl	$2, %edx
	jmp	LBB7_68
LBB7_67:
	movw	$40, %ax
	movb	$80, %cl
	movl	$1, %edx
LBB7_68:
	cmpb	%cl, (%ebx,%edx)
	movl	$64, %ecx
	cmovel	%eax, %ecx
LBB7_69:
	movzwl	%cx, %eax
	movl	%eax, (%esp)                    # 4-byte Spill
	pushl	%eax
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB7_38
# %bb.70:
	movl	%eax, %ebx
	pushl	(%esp)                          # 4-byte Folded Reload
LBB7_71:
	pushl	%ebx
	pushl	$0
	pushl	%edi
	calll	*__imp__EgTagWriteSegment
	addl	$16, %esp
	pushl	%ebx
	calll	_free
	addl	$4, %esp
	jmp	LBB7_38
                                        # -- End function
	.def	_IlRtedgeSlots_BindEgEntry;
	.scl	2;
	.type	32;
	.endef
	.globl	_IlRtedgeSlots_BindEgEntry      # -- Begin function IlRtedgeSlots_BindEgEntry
	.p2align	4
_IlRtedgeSlots_BindEgEntry:             # @IlRtedgeSlots_BindEgEntry
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	%eax
	movl	$-48, %esi
	movl	%esp, %edi
	movl	__imp__EgTagGetProperty, %ebx
	jmp	LBB8_1
	.p2align	4
LBB8_4:                                 #   in Loop: Header=BB8_1 Depth=1
	movl	23(%eax), %eax
LBB8_6:                                 #   in Loop: Header=BB8_1 Depth=1
	movl	_il_slot_binds+52(%esi), %ecx
	movl	%eax, (%ecx)
LBB8_7:                                 #   in Loop: Header=BB8_1 Depth=1
	addl	$8, %esi
	je	LBB8_8
LBB8_1:                                 # =>This Inner Loop Header: Depth=1
	movl	$0, (%esp)
	pushl	$4
	pushl	%edi
	pushl	$"??_C@_05HKHPEFOF@Entry?$AA@"
	pushl	_il_slot_binds+48(%esi)
	calll	*%ebx
	addl	$16, %esp
	testl	%eax, %eax
	setne	%cl
	movl	(%esp), %eax
	testl	%eax, %eax
	sete	%dl
	orb	%cl, %dl
	jne	LBB8_7
# %bb.2:                                #   in Loop: Header=BB8_1 Depth=1
	cmpw	$13, 3(%eax)
	je	LBB8_4
# %bb.3:                                #   in Loop: Header=BB8_1 Depth=1
	cmpl	$1, 385(%eax)
	je	LBB8_4
# %bb.5:                                #   in Loop: Header=BB8_1 Depth=1
	addl	$15, %eax
	jmp	LBB8_6
LBB8_8:
	addl	$4, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_LED2Check_slots_init;
	.scl	2;
	.type	32;
	.endef
	.globl	_LED2Check_slots_init           # -- Begin function LED2Check_slots_init
	.p2align	4
_LED2Check_slots_init:                  # @LED2Check_slots_init
# %bb.0:                                # %entry
	movl	$_il_mem_SW1, _il_slot_SW1
	movl	$_il_mem_SW2, _il_slot_SW2
	movl	$_il_mem_SW3, _il_slot_SW3
	movl	$_il_mem_MsTick, _il_slot_MsTick
	movl	$_il_mem_LED1, _il_slot_LED1
	movl	$_il_mem_LED2, _il_slot_LED2
	retl
                                        # -- End function
	.def	_LED2Check;
	.scl	2;
	.type	32;
	.endef
	.globl	_LED2Check                      # -- Begin function LED2Check
	.p2align	4
_LED2Check:                             # @LED2Check
# %bb.0:                                # %entry
	pushl	%ebx
	movl	_il_slot_SW1, %eax
	movl	_il_slot_SW3, %edx
	movl	_il_slot_MsTick, %ecx
	movzbl	(%eax), %ebx
	movl	_il_slot_SW2, %eax
	movl	(%ecx), %ecx
	andb	(%eax), %bl
	movl	_il_slot_LED1, %eax
	orb	(%edx), %bl
	movl	$458129845, %edx                # imm = 0x1B4E81B5
	andb	$1, %bl
	movb	%bl, (%eax)
	movl	%ecx, %eax
	imull	%edx
	movl	%edx, %eax
	sarl	$6, %edx
	shrl	$31, %eax
	addl	%eax, %edx
	imull	$600, %edx, %eax                # imm = 0x258
	movl	_il_slot_LED2, %edx
	subl	%eax, %ecx
	cmpl	$300, %ecx                      # imm = 0x12C
	setl	%al
	andb	%bl, %al
	movb	%al, (%edx)
	popl	%ebx
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.lcomm	_il_rtedge_tag_count,4,4        # @il_rtedge_tag_count
	.lcomm	_il_rtedge_tag_storage,14336    # @il_rtedge_tag_storage
	.section	.rdata,"dr"
	.p2align	2, 0x0                          # @k_st2_rtedge_scalar_specs
_k_st2_rtedge_scalar_specs:
	.long	"??_C@_08CDIBBFAJ@BOOL?$CDSW1?$AA@"
	.long	"??_C@_08IKMEGMK@BOOL?$CDSW2?$AA@"
	.long	"??_C@_08BBLHHHIL@BOOL?$CDSW3?$AA@"
	.long	"??_C@_0L@OAGFGOE@INT?$CDMsTick?$AA@"
	.long	"??_C@_09PFDIALPP@BOOL?$CDLED1?$AA@"
	.long	"??_C@_09NOBFFIDM@BOOL?$CDLED2?$AA@"

	.section	.rdata,"dr",discard,"??_C@_08CDIBBFAJ@BOOL?$CDSW1?$AA@"
	.globl	"??_C@_08CDIBBFAJ@BOOL?$CDSW1?$AA@" # @"??_C@_08CDIBBFAJ@BOOL?$CDSW1?$AA@"
"??_C@_08CDIBBFAJ@BOOL?$CDSW1?$AA@":
	.asciz	"BOOL#SW1"

	.section	.rdata,"dr",discard,"??_C@_08IKMEGMK@BOOL?$CDSW2?$AA@"
	.globl	"??_C@_08IKMEGMK@BOOL?$CDSW2?$AA@" # @"??_C@_08IKMEGMK@BOOL?$CDSW2?$AA@"
"??_C@_08IKMEGMK@BOOL?$CDSW2?$AA@":
	.asciz	"BOOL#SW2"

	.section	.rdata,"dr",discard,"??_C@_08BBLHHHIL@BOOL?$CDSW3?$AA@"
	.globl	"??_C@_08BBLHHHIL@BOOL?$CDSW3?$AA@" # @"??_C@_08BBLHHHIL@BOOL?$CDSW3?$AA@"
"??_C@_08BBLHHHIL@BOOL?$CDSW3?$AA@":
	.asciz	"BOOL#SW3"

	.section	.rdata,"dr",discard,"??_C@_0L@OAGFGOE@INT?$CDMsTick?$AA@"
	.globl	"??_C@_0L@OAGFGOE@INT?$CDMsTick?$AA@" # @"??_C@_0L@OAGFGOE@INT?$CDMsTick?$AA@"
"??_C@_0L@OAGFGOE@INT?$CDMsTick?$AA@":
	.asciz	"INT#MsTick"

	.section	.rdata,"dr",discard,"??_C@_09PFDIALPP@BOOL?$CDLED1?$AA@"
	.globl	"??_C@_09PFDIALPP@BOOL?$CDLED1?$AA@" # @"??_C@_09PFDIALPP@BOOL?$CDLED1?$AA@"
"??_C@_09PFDIALPP@BOOL?$CDLED1?$AA@":
	.asciz	"BOOL#LED1"

	.section	.rdata,"dr",discard,"??_C@_09NOBFFIDM@BOOL?$CDLED2?$AA@"
	.globl	"??_C@_09NOBFFIDM@BOOL?$CDLED2?$AA@" # @"??_C@_09NOBFFIDM@BOOL?$CDLED2?$AA@"
"??_C@_09NOBFFIDM@BOOL?$CDLED2?$AA@":
	.asciz	"BOOL#LED2"

	.section	.rdata,"dr",discard,"??_C@_00CNPNBAHC@?$AA@"
	.globl	"??_C@_00CNPNBAHC@?$AA@"        # @"??_C@_00CNPNBAHC@?$AA@"
"??_C@_00CNPNBAHC@?$AA@":
	.zero	1

	.section	.rdata,"dr",discard,"??_C@_07DCPMEJPJ@STRING?$CD?$AA@"
	.globl	"??_C@_07DCPMEJPJ@STRING?$CD?$AA@" # @"??_C@_07DCPMEJPJ@STRING?$CD?$AA@"
"??_C@_07DCPMEJPJ@STRING?$CD?$AA@":
	.asciz	"STRING#"

	.section	.rdata,"dr",discard,"??_C@_05NCFAHBAN@BOOL?$CD?$AA@"
	.globl	"??_C@_05NCFAHBAN@BOOL?$CD?$AA@" # @"??_C@_05NCFAHBAN@BOOL?$CD?$AA@"
"??_C@_05NCFAHBAN@BOOL?$CD?$AA@":
	.asciz	"BOOL#"

	.section	.rdata,"dr",discard,"??_C@_04MCOJOMNJ@INT?$CD?$AA@"
	.globl	"??_C@_04MCOJOMNJ@INT?$CD?$AA@" # @"??_C@_04MCOJOMNJ@INT?$CD?$AA@"
"??_C@_04MCOJOMNJ@INT?$CD?$AA@":
	.asciz	"INT#"

	.section	.rdata,"dr",discard,"??_C@_05OJEKCDCD@UINT?$CD?$AA@"
	.globl	"??_C@_05OJEKCDCD@UINT?$CD?$AA@" # @"??_C@_05OJEKCDCD@UINT?$CD?$AA@"
"??_C@_05OJEKCDCD@UINT?$CD?$AA@":
	.asciz	"UINT#"

	.section	.rdata,"dr",discard,"??_C@_05CNEHJGCP@TIME?$CD?$AA@"
	.globl	"??_C@_05CNEHJGCP@TIME?$CD?$AA@" # @"??_C@_05CNEHJGCP@TIME?$CD?$AA@"
"??_C@_05CNEHJGCP@TIME?$CD?$AA@":
	.asciz	"TIME#"

	.section	.rdata,"dr",discard,"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@"
	.globl	"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@" # @"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@"
"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@":
	.asciz	"FUNCTION#"

	.section	.rdata,"dr"
	.p2align	2, 0x0                          # @il_kw
_il_kw:
	.long	"??_C@_05NCFAHBAN@BOOL?$CD?$AA@"
	.short	1536                            # 0x600
	.zero	2
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	"??_C@_04MCOJOMNJ@INT?$CD?$AA@"
	.short	261                             # 0x105
	.zero	2
	.long	4                               # 0x4
	.long	2                               # 0x2
	.long	"??_C@_05OJEKCDCD@UINT?$CD?$AA@"
	.short	513                             # 0x201
	.zero	2
	.long	5                               # 0x5
	.long	2                               # 0x2
	.long	"??_C@_05CNEHJGCP@TIME?$CD?$AA@"
	.short	1347                            # 0x543
	.zero	2
	.long	7                               # 0x7
	.long	4                               # 0x4
	.long	"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@"
	.short	1059                            # 0x423
	.zero	2
	.long	13                              # 0xd
	.long	4294967295                      # 0xffffffff
	.long	"??_C@_07DCPMEJPJ@STRING?$CD?$AA@"
	.short	1346                            # 0x542
	.zero	2
	.long	13                              # 0xd
	.long	83                              # 0x53
	.zero	16

	.p2align	2, 0x0                          # @il_slot_binds
_il_slot_binds:
	.long	"??_C@_03KIKNLPCI@SW1?$AA@"
	.long	_il_slot_SW1
	.long	"??_C@_03IDIAOMOL@SW2?$AA@"
	.long	_il_slot_SW2
	.long	"??_C@_03JKJLNNKK@SW3?$AA@"
	.long	_il_slot_SW3
	.long	"??_C@_06INNMFNMA@MsTick?$AA@"
	.long	_il_slot_MsTick
	.long	"??_C@_04LJNKDHAL@LED1?$AA@"
	.long	_il_slot_LED1
	.long	"??_C@_04JCPHGEMI@LED2?$AA@"
	.long	_il_slot_LED2

	.section	.rdata,"dr",discard,"??_C@_05HKHPEFOF@Entry?$AA@"
	.globl	"??_C@_05HKHPEFOF@Entry?$AA@"   # @"??_C@_05HKHPEFOF@Entry?$AA@"
"??_C@_05HKHPEFOF@Entry?$AA@":
	.asciz	"Entry"

	.section	.rdata,"dr",discard,"??_C@_03KIKNLPCI@SW1?$AA@"
	.globl	"??_C@_03KIKNLPCI@SW1?$AA@"     # @"??_C@_03KIKNLPCI@SW1?$AA@"
"??_C@_03KIKNLPCI@SW1?$AA@":
	.asciz	"SW1"

	.section	.rdata,"dr",discard,"??_C@_03IDIAOMOL@SW2?$AA@"
	.globl	"??_C@_03IDIAOMOL@SW2?$AA@"     # @"??_C@_03IDIAOMOL@SW2?$AA@"
"??_C@_03IDIAOMOL@SW2?$AA@":
	.asciz	"SW2"

	.section	.rdata,"dr",discard,"??_C@_03JKJLNNKK@SW3?$AA@"
	.globl	"??_C@_03JKJLNNKK@SW3?$AA@"     # @"??_C@_03JKJLNNKK@SW3?$AA@"
"??_C@_03JKJLNNKK@SW3?$AA@":
	.asciz	"SW3"

	.section	.rdata,"dr",discard,"??_C@_06INNMFNMA@MsTick?$AA@"
	.globl	"??_C@_06INNMFNMA@MsTick?$AA@"  # @"??_C@_06INNMFNMA@MsTick?$AA@"
"??_C@_06INNMFNMA@MsTick?$AA@":
	.asciz	"MsTick"

	.section	.rdata,"dr",discard,"??_C@_04LJNKDHAL@LED1?$AA@"
	.globl	"??_C@_04LJNKDHAL@LED1?$AA@"    # @"??_C@_04LJNKDHAL@LED1?$AA@"
"??_C@_04LJNKDHAL@LED1?$AA@":
	.asciz	"LED1"

	.section	.rdata,"dr",discard,"??_C@_04JCPHGEMI@LED2?$AA@"
	.globl	"??_C@_04JCPHGEMI@LED2?$AA@"    # @"??_C@_04JCPHGEMI@LED2?$AA@"
"??_C@_04JCPHGEMI@LED2?$AA@":
	.asciz	"LED2"

	.bss
	.globl	_il_mem_SW1                     # @il_mem_SW1
_il_mem_SW1:
	.byte	0                               # 0x0

	.globl	_il_slot_SW1                    # @il_slot_SW1
	.p2align	2, 0x0
_il_slot_SW1:
	.long	0

	.globl	_il_mem_SW2                     # @il_mem_SW2
_il_mem_SW2:
	.byte	0                               # 0x0

	.globl	_il_slot_SW2                    # @il_slot_SW2
	.p2align	2, 0x0
_il_slot_SW2:
	.long	0

	.globl	_il_mem_SW3                     # @il_mem_SW3
_il_mem_SW3:
	.byte	0                               # 0x0

	.globl	_il_slot_SW3                    # @il_slot_SW3
	.p2align	2, 0x0
_il_slot_SW3:
	.long	0

	.globl	_il_mem_MsTick                  # @il_mem_MsTick
	.p2align	2, 0x0
_il_mem_MsTick:
	.long	0                               # 0x0

	.globl	_il_slot_MsTick                 # @il_slot_MsTick
	.p2align	2, 0x0
_il_slot_MsTick:
	.long	0

	.globl	_il_mem_LED1                    # @il_mem_LED1
_il_mem_LED1:
	.byte	0                               # 0x0

	.globl	_il_slot_LED1                   # @il_slot_LED1
	.p2align	2, 0x0
_il_slot_LED1:
	.long	0

	.globl	_il_mem_LED2                    # @il_mem_LED2
_il_mem_LED2:
	.byte	0                               # 0x0

	.globl	_il_slot_LED2                   # @il_slot_LED2
	.p2align	2, 0x0
_il_slot_LED2:
	.long	0

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
	.addrsig_sym _il_mem_SW1
	.addrsig_sym _il_slot_SW1
	.addrsig_sym _il_mem_SW2
	.addrsig_sym _il_slot_SW2
	.addrsig_sym _il_mem_SW3
	.addrsig_sym _il_slot_SW3
	.addrsig_sym _il_mem_MsTick
	.addrsig_sym _il_slot_MsTick
	.addrsig_sym _il_mem_LED1
	.addrsig_sym _il_slot_LED1
	.addrsig_sym _il_mem_LED2
	.addrsig_sym _il_slot_LED2
