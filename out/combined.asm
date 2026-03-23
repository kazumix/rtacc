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
	calll	_IlRtedgeTags_Init
	.p2align	4
LBB0_1:                                 # =>This Inner Loop Header: Depth=1
	calll	_test
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
	subl	$12, %esp
	movl	$0, (%esp)
LBB4_1:                                 # =>This Inner Loop Header: Depth=1
	cmpl	$10, (%esp)
	jae	LBB4_4
# %bb.2:                                #   in Loop: Header=BB4_1 Depth=1
	movl	(%esp), %eax
	movl	_k_il_rtedge_scalar_specs(,%eax,4), %ecx
	calll	_il_rtedge_apply_instruction_spec
# %bb.3:                                #   in Loop: Header=BB4_1 Depth=1
	movl	(%esp), %eax
	addl	$1, %eax
	movl	%eax, (%esp)
	jmp	LBB4_1
LBB4_4:
	movl	$0, (%esp)
LBB4_5:                                 # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_7 Depth 2
	cmpl	$3, (%esp)
	jae	LBB4_12
# %bb.6:                                #   in Loop: Header=BB4_5 Depth=1
	leal	_k_il_fb_instances, %eax
	imull	$12, (%esp), %ecx
	addl	%ecx, %eax
	movl	%eax, 8(%esp)
	movl	8(%esp), %eax
	movl	(%eax), %ecx
	calll	_il_rtedge_apply_instruction_spec
	movl	$0, 4(%esp)
LBB4_7:                                 #   Parent Loop BB4_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	4(%esp), %eax
	movl	8(%esp), %ecx
	cmpl	8(%ecx), %eax
	jae	LBB4_10
# %bb.8:                                #   in Loop: Header=BB4_7 Depth=2
	movl	8(%esp), %eax
	movl	4(%eax), %eax
	movl	4(%esp), %ecx
	movl	(%eax,%ecx,4), %ecx
	calll	_il_rtedge_apply_instruction_spec
# %bb.9:                                #   in Loop: Header=BB4_7 Depth=2
	movl	4(%esp), %eax
	addl	$1, %eax
	movl	%eax, 4(%esp)
	jmp	LBB4_7
LBB4_10:                                #   in Loop: Header=BB4_5 Depth=1
# %bb.11:                               #   in Loop: Header=BB4_5 Depth=1
	movl	(%esp), %eax
	addl	$1, %eax
	movl	%eax, (%esp)
	jmp	LBB4_5
LBB4_12:
	calll	_il_rtedge_invoke_slots_init
	addl	$12, %esp
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
	.def	_il_rtedge_invoke_slots_init;
	.scl	3;
	.type	32;
	.endef
	.p2align	4                               # -- Begin function il_rtedge_invoke_slots_init
_il_rtedge_invoke_slots_init:           # @il_rtedge_invoke_slots_init
# %bb.0:
	movl	$_il_mem_StartSW, _il_slot_StartSW
	movl	$_il_mem_EndSW, _il_slot_EndSW
	movl	$_il_mem_AI_1, _il_slot_AI_1
	movl	$_il_mem_Active, _il_slot_Active
	movl	$_il_mem_LimitOver, _il_slot_LimitOver
	movl	$_il_mem_LimitOverCount, _il_slot_LimitOverCount
	movl	$_il_mem_Err, _il_slot_Err
	movl	$_il_mem_TP1_Q, _il_slot_TP1_Q
	movl	$_il_mem_TP2_Q, _il_slot_TP2_Q
	movl	$_il_mem_LED1, _il_slot_LED1
	movl	$_il_mem_CTU_1_CU, _il_slot_CTU_1_CU
	movl	$_il_mem_CTU_1_RESET, _il_slot_CTU_1_RESET
	movl	$_il_mem_CTU_1_PV, _il_slot_CTU_1_PV
	movl	$_il_mem_CTU_1__prev_cu, _il_slot_CTU_1__prev_cu
	movl	$_il_mem_CTU_1_Q, _il_slot_CTU_1_Q
	movl	$_il_mem_CTU_1_CV, _il_slot_CTU_1_CV
	movl	$_il_mem_TP_1_IN, _il_slot_TP_1_IN
	movl	$_il_mem_TP_1_PT, _il_slot_TP_1_PT
	movl	$_il_mem_TP_1__elapsed, _il_slot_TP_1__elapsed
	movl	$_il_mem_TP_1__running, _il_slot_TP_1__running
	movl	$_il_mem_TP_1_Q, _il_slot_TP_1_Q
	movl	$_il_mem_TP_2_IN, _il_slot_TP_2_IN
	movl	$_il_mem_TP_2_PT, _il_slot_TP_2_PT
	movl	$_il_mem_TP_2__elapsed, _il_slot_TP_2__elapsed
	movl	$_il_mem_TP_2__running, _il_slot_TP_2__running
	movl	$_il_mem_TP_2_Q, _il_slot_TP_2_Q
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
	pushl	$"??_C@_00CNPNBAHC@?$AA@"
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
	.def	_test_slots_init;
	.scl	2;
	.type	32;
	.endef
	.globl	_test_slots_init                # -- Begin function test_slots_init
	.p2align	4
_test_slots_init:                       # @test_slots_init
# %bb.0:                                # %entry
	movl	$_il_mem_StartSW, _il_slot_StartSW
	movl	$_il_mem_EndSW, _il_slot_EndSW
	movl	$_il_mem_AI_1, _il_slot_AI_1
	movl	$_il_mem_Active, _il_slot_Active
	movl	$_il_mem_LimitOver, _il_slot_LimitOver
	movl	$_il_mem_LimitOverCount, _il_slot_LimitOverCount
	movl	$_il_mem_Err, _il_slot_Err
	movl	$_il_mem_TP1_Q, _il_slot_TP1_Q
	movl	$_il_mem_TP2_Q, _il_slot_TP2_Q
	movl	$_il_mem_LED1, _il_slot_LED1
	movl	$_il_mem_CTU_1_CU, _il_slot_CTU_1_CU
	movl	$_il_mem_CTU_1_RESET, _il_slot_CTU_1_RESET
	movl	$_il_mem_CTU_1_PV, _il_slot_CTU_1_PV
	movl	$_il_mem_CTU_1__prev_cu, _il_slot_CTU_1__prev_cu
	movl	$_il_mem_CTU_1_Q, _il_slot_CTU_1_Q
	movl	$_il_mem_CTU_1_CV, _il_slot_CTU_1_CV
	movl	$_il_mem_TP_1_IN, _il_slot_TP_1_IN
	movl	$_il_mem_TP_1_PT, _il_slot_TP_1_PT
	movl	$_il_mem_TP_1__elapsed, _il_slot_TP_1__elapsed
	movl	$_il_mem_TP_1__running, _il_slot_TP_1__running
	movl	$_il_mem_TP_1_Q, _il_slot_TP_1_Q
	movl	$_il_mem_TP_2_IN, _il_slot_TP_2_IN
	movl	$_il_mem_TP_2_PT, _il_slot_TP_2_PT
	movl	$_il_mem_TP_2__elapsed, _il_slot_TP_2__elapsed
	movl	$_il_mem_TP_2__running, _il_slot_TP_2__running
	movl	$_il_mem_TP_2_Q, _il_slot_TP_2_Q
	retl
                                        # -- End function
	.def	_ctu_step;
	.scl	2;
	.type	32;
	.endef
	.globl	_ctu_step                       # -- Begin function ctu_step
	.p2align	4
_ctu_step:                              # @ctu_step
# %bb.0:                                # %entry
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	40(%esp), %esi
	movl	20(%esp), %edi
	movl	24(%esp), %ebp
	movl	32(%esp), %eax
	movl	28(%esp), %ecx
	movl	36(%esp), %edx
	movzbl	(%edi), %ebx
	xorl	%edi, %edi
	movb	(%esi), %bh
	cmpb	$0, (%ebp)
	jne	LBB9_2
# %bb.1:                                # %entry
	movl	(%edx), %edi
LBB9_2:                                 # %entry
	notb	%bh
	andb	%bl, %bh
	movzbl	%bh, %ebp
	addl	%edi, %ebp
	cmpl	(%ecx), %ebp
	movl	%ebp, (%edx)
	movb	%bl, (%esi)
	setge	(%eax)
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_tp_step;
	.scl	2;
	.type	32;
	.endef
	.globl	_tp_step                        # -- Begin function tp_step
	.p2align	4
_tp_step:                               # @tp_step
# %bb.0:                                # %entry
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	20(%esp), %edi
	movl	32(%esp), %esi
	movl	24(%esp), %edx
	movl	36(%esp), %ebp
	movl	28(%esp), %ecx
	movzbl	(%edi), %ebx
	movl	%ebx, %eax
	addl	(%esi), %ebx
	cmpl	(%edx), %ebx
	movl	%ebx, (%esi)
	setge	%dl
	andb	%al, %dl
	movb	%dl, (%ecx)
	movb	%al, (%ebp)
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_test;
	.scl	2;
	.type	32;
	.endef
	.globl	_test                           # -- Begin function test
	.p2align	4
_test:                                  # @test
# %bb.0:                                # %entry
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$80, %esp
	movl	_il_slot_TP_1_IN, %edi
	movl	_il_slot_StartSW, %eax
	movl	_il_slot_AI_1, %ecx
	movl	_il_slot_EndSW, %esi
	movl	_il_slot_Active, %edx
	movl	_il_slot_CTU_1_RESET, %ebp
	movl	%edi, 24(%esp)                  # 4-byte Spill
	movl	_il_slot_TP_1_PT, %edi
	movzbl	(%eax), %eax
	movl	%ecx, 16(%esp)                  # 4-byte Spill
	movl	_il_slot_LimitOver, %ecx
	movzbl	(%esi), %ebx
	movl	%esi, 4(%esp)                   # 4-byte Spill
	movl	_il_slot_CTU_1__prev_cu, %esi
	movl	%edi, 12(%esp)                  # 4-byte Spill
	movl	_il_slot_TP_1__elapsed, %edi
	movl	%ecx, 20(%esp)                  # 4-byte Spill
	movl	_il_slot_LimitOverCount, %ecx
	orb	(%edx), %al
	notb	%bl
	movl	%edi, 28(%esp)                  # 4-byte Spill
	movl	_il_slot_TP_1__running, %edi
	andb	%al, %bl
	movl	%ecx, 64(%esp)                  # 4-byte Spill
	movl	_il_slot_Err, %ecx
	movl	_il_slot_TP1_Q, %eax
	andb	$1, %bl
	movl	%edi, 36(%esp)                  # 4-byte Spill
	movl	_il_slot_TP_1_Q, %edi
	movl	%ecx, 76(%esp)                  # 4-byte Spill
	movl	%eax, 52(%esp)                  # 4-byte Spill
	movl	_il_slot_TP2_Q, %eax
	movl	_il_slot_CTU_1_PV, %ecx
	movl	%edi, 32(%esp)                  # 4-byte Spill
	movl	_il_slot_TP_2_IN, %edi
	movl	%eax, 68(%esp)                  # 4-byte Spill
	movl	_il_slot_LED1, %eax
	movl	%ecx, (%esp)                    # 4-byte Spill
	movl	_il_slot_CTU_1_Q, %ecx
	movl	%edi, 44(%esp)                  # 4-byte Spill
	movl	_il_slot_TP_2_PT, %edi
	movl	%eax, 72(%esp)                  # 4-byte Spill
	movl	%ecx, 8(%esp)                   # 4-byte Spill
	movl	_il_slot_CTU_1_CU, %eax
	movl	_il_slot_CTU_1_CV, %ecx
	movl	%edi, 40(%esp)                  # 4-byte Spill
	movl	_il_slot_TP_2__elapsed, %edi
	movl	%edi, 48(%esp)                  # 4-byte Spill
	movl	_il_slot_TP_2__running, %edi
	movl	%edi, 60(%esp)                  # 4-byte Spill
	movl	_il_slot_TP_2_Q, %edi
	movb	%bl, (%edx)
	movl	$-901, %ebx                     # imm = 0xFC7B
	movl	%edi, 56(%esp)                  # 4-byte Spill
	movl	16(%esp), %edi                  # 4-byte Reload
	addl	(%edi), %ebx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$-1001, %ebx                    # imm = 0xFC17
	setb	(%edi)
	setb	%bl
	movl	$0, %edi
	andb	(%edx), %bl
	movl	4(%esp), %edx                   # 4-byte Reload
	movb	%bl, (%eax)
	movzbl	(%edx), %edx
	movb	%dl, (%ebp)
	movl	(%esp), %edx                    # 4-byte Reload
	movl	$5, (%edx)
	cmpb	$0, (%ebp)
	movzbl	(%eax), %eax
	movzbl	(%esi), %edx
	jne	LBB11_2
# %bb.1:                                # %entry
	movl	(%ecx), %edi
LBB11_2:                                # %entry
	notb	%dl
	movl	76(%esp), %ebx                  # 4-byte Reload
	andb	%al, %dl
	movzbl	%dl, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	8(%esp), %eax                   # 4-byte Reload
	cmpl	$5, %edx
	movl	68(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	setge	(%ebx)
	movl	(%ecx), %eax
	movl	64(%esp), %ecx                  # 4-byte Reload
	movl	%eax, (%ecx)
	movl	24(%esp), %ecx                  # 4-byte Reload
	movzbl	(%esi), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	12(%esp), %eax                  # 4-byte Reload
	movl	$1000, (%eax)                   # imm = 0x3E8
	movzbl	(%ecx), %eax
	movl	%eax, %ecx
	addl	(%edi), %eax
	movl	%eax, (%edi)
	movl	32(%esp), %edi                  # 4-byte Reload
	cmpl	$1000, %eax                     # imm = 0x3E8
	setge	%al
	andb	%cl, %al
	movb	%al, (%edi)
	movl	36(%esp), %eax                  # 4-byte Reload
	movb	%cl, (%eax)
	movl	52(%esp), %ecx                  # 4-byte Reload
	movzbl	(%edi), %eax
	movl	48(%esp), %edi                  # 4-byte Reload
	movb	%al, (%ecx)
	movl	44(%esp), %ecx                  # 4-byte Reload
	xorb	$1, %al
	movb	%al, (%ecx)
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$1000, (%eax)                   # imm = 0x3E8
	movzbl	(%ecx), %eax
	movl	%eax, %ecx
	addl	(%edi), %eax
	movl	%eax, (%edi)
	movl	56(%esp), %edi                  # 4-byte Reload
	cmpl	$1000, %eax                     # imm = 0x3E8
	setge	%al
	andb	%cl, %al
	movb	%al, (%edi)
	movl	60(%esp), %eax                  # 4-byte Reload
	movb	%cl, (%eax)
	movl	72(%esp), %ecx                  # 4-byte Reload
	movzbl	(%edi), %eax
	movb	%al, (%esi)
	andb	(%ebx), %al
	movb	%al, (%ecx)
	xorl	%eax, %eax
	addl	$80, %esp
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

	.lcomm	_il_rtedge_tag_count,4,4        # @il_rtedge_tag_count
	.lcomm	_il_rtedge_tag_storage,14336    # @il_rtedge_tag_storage
	.section	.rdata,"dr"
	.p2align	2, 0x0                          # @k_il_rtedge_scalar_specs
_k_il_rtedge_scalar_specs:
	.long	"??_C@_0N@OJIOACIB@BOOL?$CDStartSW?$AA@"
	.long	"??_C@_0L@KCHCODLI@BOOL?$CDEndSW?$AA@"
	.long	"??_C@_09HJPOANEL@UINT?$CDAI_1?$AA@"
	.long	"??_C@_0M@FDLKECOC@BOOL?$CDActive?$AA@"
	.long	"??_C@_0P@JLEBCDPH@BOOL?$CDLimitOver?$AA@"
	.long	"??_C@_0BD@MFAPEFPK@INT?$CDLimitOverCount?$AA@"
	.long	"??_C@_08LDCBIFIH@BOOL?$CDErr?$AA@"
	.long	"??_C@_0L@NHHKJFBD@BOOL?$CDTP1_Q?$AA@"
	.long	"??_C@_0L@MFMPDKPN@BOOL?$CDTP2_Q?$AA@"
	.long	"??_C@_09PFDIALPP@BOOL?$CDLED1?$AA@"

	.p2align	2, 0x0                          # @k_il_fb_instances
_k_il_fb_instances:
	.long	"??_C@_0BD@IJGJPBAE@FUNCTION?$CDCTU?$CDCTU_1?$AA@"
	.long	_k_il_rtedge_ctu1_pin_tags
	.long	6                               # 0x6
	.long	"??_C@_0BB@KKNGKHLB@FUNCTION?$CDTP?$CDTP_1?$AA@"
	.long	_k_il_rtedge_tp1_pin_tags
	.long	5                               # 0x5
	.long	"??_C@_0BB@IBPLPEHC@FUNCTION?$CDTP?$CDTP_2?$AA@"
	.long	_k_il_rtedge_tp2_pin_tags
	.long	5                               # 0x5

	.section	.rdata,"dr",discard,"??_C@_0N@OJIOACIB@BOOL?$CDStartSW?$AA@"
	.globl	"??_C@_0N@OJIOACIB@BOOL?$CDStartSW?$AA@" # @"??_C@_0N@OJIOACIB@BOOL?$CDStartSW?$AA@"
"??_C@_0N@OJIOACIB@BOOL?$CDStartSW?$AA@":
	.asciz	"BOOL#StartSW"

	.section	.rdata,"dr",discard,"??_C@_0L@KCHCODLI@BOOL?$CDEndSW?$AA@"
	.globl	"??_C@_0L@KCHCODLI@BOOL?$CDEndSW?$AA@" # @"??_C@_0L@KCHCODLI@BOOL?$CDEndSW?$AA@"
"??_C@_0L@KCHCODLI@BOOL?$CDEndSW?$AA@":
	.asciz	"BOOL#EndSW"

	.section	.rdata,"dr",discard,"??_C@_09HJPOANEL@UINT?$CDAI_1?$AA@"
	.globl	"??_C@_09HJPOANEL@UINT?$CDAI_1?$AA@" # @"??_C@_09HJPOANEL@UINT?$CDAI_1?$AA@"
"??_C@_09HJPOANEL@UINT?$CDAI_1?$AA@":
	.asciz	"UINT#AI_1"

	.section	.rdata,"dr",discard,"??_C@_0M@FDLKECOC@BOOL?$CDActive?$AA@"
	.globl	"??_C@_0M@FDLKECOC@BOOL?$CDActive?$AA@" # @"??_C@_0M@FDLKECOC@BOOL?$CDActive?$AA@"
"??_C@_0M@FDLKECOC@BOOL?$CDActive?$AA@":
	.asciz	"BOOL#Active"

	.section	.rdata,"dr",discard,"??_C@_0P@JLEBCDPH@BOOL?$CDLimitOver?$AA@"
	.globl	"??_C@_0P@JLEBCDPH@BOOL?$CDLimitOver?$AA@" # @"??_C@_0P@JLEBCDPH@BOOL?$CDLimitOver?$AA@"
"??_C@_0P@JLEBCDPH@BOOL?$CDLimitOver?$AA@":
	.asciz	"BOOL#LimitOver"

	.section	.rdata,"dr",discard,"??_C@_0BD@MFAPEFPK@INT?$CDLimitOverCount?$AA@"
	.globl	"??_C@_0BD@MFAPEFPK@INT?$CDLimitOverCount?$AA@" # @"??_C@_0BD@MFAPEFPK@INT?$CDLimitOverCount?$AA@"
"??_C@_0BD@MFAPEFPK@INT?$CDLimitOverCount?$AA@":
	.asciz	"INT#LimitOverCount"

	.section	.rdata,"dr",discard,"??_C@_08LDCBIFIH@BOOL?$CDErr?$AA@"
	.globl	"??_C@_08LDCBIFIH@BOOL?$CDErr?$AA@" # @"??_C@_08LDCBIFIH@BOOL?$CDErr?$AA@"
"??_C@_08LDCBIFIH@BOOL?$CDErr?$AA@":
	.asciz	"BOOL#Err"

	.section	.rdata,"dr",discard,"??_C@_0L@NHHKJFBD@BOOL?$CDTP1_Q?$AA@"
	.globl	"??_C@_0L@NHHKJFBD@BOOL?$CDTP1_Q?$AA@" # @"??_C@_0L@NHHKJFBD@BOOL?$CDTP1_Q?$AA@"
"??_C@_0L@NHHKJFBD@BOOL?$CDTP1_Q?$AA@":
	.asciz	"BOOL#TP1_Q"

	.section	.rdata,"dr",discard,"??_C@_0L@MFMPDKPN@BOOL?$CDTP2_Q?$AA@"
	.globl	"??_C@_0L@MFMPDKPN@BOOL?$CDTP2_Q?$AA@" # @"??_C@_0L@MFMPDKPN@BOOL?$CDTP2_Q?$AA@"
"??_C@_0L@MFMPDKPN@BOOL?$CDTP2_Q?$AA@":
	.asciz	"BOOL#TP2_Q"

	.section	.rdata,"dr",discard,"??_C@_09PFDIALPP@BOOL?$CDLED1?$AA@"
	.globl	"??_C@_09PFDIALPP@BOOL?$CDLED1?$AA@" # @"??_C@_09PFDIALPP@BOOL?$CDLED1?$AA@"
"??_C@_09PFDIALPP@BOOL?$CDLED1?$AA@":
	.asciz	"BOOL#LED1"

	.section	.rdata,"dr",discard,"??_C@_0BD@IJGJPBAE@FUNCTION?$CDCTU?$CDCTU_1?$AA@"
	.globl	"??_C@_0BD@IJGJPBAE@FUNCTION?$CDCTU?$CDCTU_1?$AA@" # @"??_C@_0BD@IJGJPBAE@FUNCTION?$CDCTU?$CDCTU_1?$AA@"
"??_C@_0BD@IJGJPBAE@FUNCTION?$CDCTU?$CDCTU_1?$AA@":
	.asciz	"FUNCTION#CTU#CTU_1"

	.section	.rdata,"dr"
	.p2align	2, 0x0                          # @k_il_rtedge_ctu1_pin_tags
_k_il_rtedge_ctu1_pin_tags:
	.long	"??_C@_0O@CONIEAAG@BOOL?$CDCTU_1_CU?$AA@"
	.long	"??_C@_0BB@KFKIFIPE@BOOL?$CDCTU_1_RESET?$AA@"
	.long	"??_C@_0N@EKPILEMJ@INT?$CDCTU_1_PV?$AA@"
	.long	"??_C@_0N@PLIFCNF@BOOL?$CDCTU_1_Q?$AA@"
	.long	"??_C@_0N@FEJIKJOA@INT?$CDCTU_1_CV?$AA@"
	.long	"??_C@_0BE@HKBADBCF@BOOL?$CDCTU_1__prev_cu?$AA@"

	.section	.rdata,"dr",discard,"??_C@_0BB@KKNGKHLB@FUNCTION?$CDTP?$CDTP_1?$AA@"
	.globl	"??_C@_0BB@KKNGKHLB@FUNCTION?$CDTP?$CDTP_1?$AA@" # @"??_C@_0BB@KKNGKHLB@FUNCTION?$CDTP?$CDTP_1?$AA@"
"??_C@_0BB@KKNGKHLB@FUNCTION?$CDTP?$CDTP_1?$AA@":
	.asciz	"FUNCTION#TP#TP_1"

	.section	.rdata,"dr"
	.p2align	2, 0x0                          # @k_il_rtedge_tp1_pin_tags
_k_il_rtedge_tp1_pin_tags:
	.long	"??_C@_0N@EBIPFNC@BOOL?$CDTP_1_IN?$AA@"
	.long	"??_C@_0M@BEHIIIMH@INT?$CDTP_1_PT?$AA@"
	.long	"??_C@_0BC@OOGKHIAJ@INT?$CDTP_1__elapsed?$AA@"
	.long	"??_C@_0BD@MEEJDDCF@BOOL?$CDTP_1__running?$AA@"
	.long	"??_C@_0M@NAKMDDEI@BOOL?$CDTP_1_Q?$AA@"

	.section	.rdata,"dr",discard,"??_C@_0BB@IBPLPEHC@FUNCTION?$CDTP?$CDTP_2?$AA@"
	.globl	"??_C@_0BB@IBPLPEHC@FUNCTION?$CDTP?$CDTP_2?$AA@" # @"??_C@_0BB@IBPLPEHC@FUNCTION?$CDTP?$CDTP_2?$AA@"
"??_C@_0BB@IBPLPEHC@FUNCTION?$CDTP?$CDTP_2?$AA@":
	.asciz	"FUNCTION#TP#TP_2"

	.section	.rdata,"dr"
	.p2align	2, 0x0                          # @k_il_rtedge_tp2_pin_tags
_k_il_rtedge_tp2_pin_tags:
	.long	"??_C@_0N@EDLIIPAC@BOOL?$CDTP_2_IN?$AA@"
	.long	"??_C@_0M@FDNIPCBH@INT?$CDTP_2_PT?$AA@"
	.long	"??_C@_0BC@HHIIBOAI@INT?$CDTP_2__elapsed?$AA@"
	.long	"??_C@_0BD@FNKLFFCE@BOOL?$CDTP_2__running?$AA@"
	.long	"??_C@_0M@MCBJJMKG@BOOL?$CDTP_2_Q?$AA@"

	.section	.rdata,"dr",discard,"??_C@_0O@CONIEAAG@BOOL?$CDCTU_1_CU?$AA@"
	.globl	"??_C@_0O@CONIEAAG@BOOL?$CDCTU_1_CU?$AA@" # @"??_C@_0O@CONIEAAG@BOOL?$CDCTU_1_CU?$AA@"
"??_C@_0O@CONIEAAG@BOOL?$CDCTU_1_CU?$AA@":
	.asciz	"BOOL#CTU_1_CU"

	.section	.rdata,"dr",discard,"??_C@_0BB@KFKIFIPE@BOOL?$CDCTU_1_RESET?$AA@"
	.globl	"??_C@_0BB@KFKIFIPE@BOOL?$CDCTU_1_RESET?$AA@" # @"??_C@_0BB@KFKIFIPE@BOOL?$CDCTU_1_RESET?$AA@"
"??_C@_0BB@KFKIFIPE@BOOL?$CDCTU_1_RESET?$AA@":
	.asciz	"BOOL#CTU_1_RESET"

	.section	.rdata,"dr",discard,"??_C@_0N@EKPILEMJ@INT?$CDCTU_1_PV?$AA@"
	.globl	"??_C@_0N@EKPILEMJ@INT?$CDCTU_1_PV?$AA@" # @"??_C@_0N@EKPILEMJ@INT?$CDCTU_1_PV?$AA@"
"??_C@_0N@EKPILEMJ@INT?$CDCTU_1_PV?$AA@":
	.asciz	"INT#CTU_1_PV"

	.section	.rdata,"dr",discard,"??_C@_0N@PLIFCNF@BOOL?$CDCTU_1_Q?$AA@"
	.globl	"??_C@_0N@PLIFCNF@BOOL?$CDCTU_1_Q?$AA@" # @"??_C@_0N@PLIFCNF@BOOL?$CDCTU_1_Q?$AA@"
"??_C@_0N@PLIFCNF@BOOL?$CDCTU_1_Q?$AA@":
	.asciz	"BOOL#CTU_1_Q"

	.section	.rdata,"dr",discard,"??_C@_0N@FEJIKJOA@INT?$CDCTU_1_CV?$AA@"
	.globl	"??_C@_0N@FEJIKJOA@INT?$CDCTU_1_CV?$AA@" # @"??_C@_0N@FEJIKJOA@INT?$CDCTU_1_CV?$AA@"
"??_C@_0N@FEJIKJOA@INT?$CDCTU_1_CV?$AA@":
	.asciz	"INT#CTU_1_CV"

	.section	.rdata,"dr",discard,"??_C@_0BE@HKBADBCF@BOOL?$CDCTU_1__prev_cu?$AA@"
	.globl	"??_C@_0BE@HKBADBCF@BOOL?$CDCTU_1__prev_cu?$AA@" # @"??_C@_0BE@HKBADBCF@BOOL?$CDCTU_1__prev_cu?$AA@"
"??_C@_0BE@HKBADBCF@BOOL?$CDCTU_1__prev_cu?$AA@":
	.asciz	"BOOL#CTU_1__prev_cu"

	.section	.rdata,"dr",discard,"??_C@_0N@EBIPFNC@BOOL?$CDTP_1_IN?$AA@"
	.globl	"??_C@_0N@EBIPFNC@BOOL?$CDTP_1_IN?$AA@" # @"??_C@_0N@EBIPFNC@BOOL?$CDTP_1_IN?$AA@"
"??_C@_0N@EBIPFNC@BOOL?$CDTP_1_IN?$AA@":
	.asciz	"BOOL#TP_1_IN"

	.section	.rdata,"dr",discard,"??_C@_0M@BEHIIIMH@INT?$CDTP_1_PT?$AA@"
	.globl	"??_C@_0M@BEHIIIMH@INT?$CDTP_1_PT?$AA@" # @"??_C@_0M@BEHIIIMH@INT?$CDTP_1_PT?$AA@"
"??_C@_0M@BEHIIIMH@INT?$CDTP_1_PT?$AA@":
	.asciz	"INT#TP_1_PT"

	.section	.rdata,"dr",discard,"??_C@_0BC@OOGKHIAJ@INT?$CDTP_1__elapsed?$AA@"
	.globl	"??_C@_0BC@OOGKHIAJ@INT?$CDTP_1__elapsed?$AA@" # @"??_C@_0BC@OOGKHIAJ@INT?$CDTP_1__elapsed?$AA@"
"??_C@_0BC@OOGKHIAJ@INT?$CDTP_1__elapsed?$AA@":
	.asciz	"INT#TP_1__elapsed"

	.section	.rdata,"dr",discard,"??_C@_0BD@MEEJDDCF@BOOL?$CDTP_1__running?$AA@"
	.globl	"??_C@_0BD@MEEJDDCF@BOOL?$CDTP_1__running?$AA@" # @"??_C@_0BD@MEEJDDCF@BOOL?$CDTP_1__running?$AA@"
"??_C@_0BD@MEEJDDCF@BOOL?$CDTP_1__running?$AA@":
	.asciz	"BOOL#TP_1__running"

	.section	.rdata,"dr",discard,"??_C@_0M@NAKMDDEI@BOOL?$CDTP_1_Q?$AA@"
	.globl	"??_C@_0M@NAKMDDEI@BOOL?$CDTP_1_Q?$AA@" # @"??_C@_0M@NAKMDDEI@BOOL?$CDTP_1_Q?$AA@"
"??_C@_0M@NAKMDDEI@BOOL?$CDTP_1_Q?$AA@":
	.asciz	"BOOL#TP_1_Q"

	.section	.rdata,"dr",discard,"??_C@_0N@EDLIIPAC@BOOL?$CDTP_2_IN?$AA@"
	.globl	"??_C@_0N@EDLIIPAC@BOOL?$CDTP_2_IN?$AA@" # @"??_C@_0N@EDLIIPAC@BOOL?$CDTP_2_IN?$AA@"
"??_C@_0N@EDLIIPAC@BOOL?$CDTP_2_IN?$AA@":
	.asciz	"BOOL#TP_2_IN"

	.section	.rdata,"dr",discard,"??_C@_0M@FDNIPCBH@INT?$CDTP_2_PT?$AA@"
	.globl	"??_C@_0M@FDNIPCBH@INT?$CDTP_2_PT?$AA@" # @"??_C@_0M@FDNIPCBH@INT?$CDTP_2_PT?$AA@"
"??_C@_0M@FDNIPCBH@INT?$CDTP_2_PT?$AA@":
	.asciz	"INT#TP_2_PT"

	.section	.rdata,"dr",discard,"??_C@_0BC@HHIIBOAI@INT?$CDTP_2__elapsed?$AA@"
	.globl	"??_C@_0BC@HHIIBOAI@INT?$CDTP_2__elapsed?$AA@" # @"??_C@_0BC@HHIIBOAI@INT?$CDTP_2__elapsed?$AA@"
"??_C@_0BC@HHIIBOAI@INT?$CDTP_2__elapsed?$AA@":
	.asciz	"INT#TP_2__elapsed"

	.section	.rdata,"dr",discard,"??_C@_0BD@FNKLFFCE@BOOL?$CDTP_2__running?$AA@"
	.globl	"??_C@_0BD@FNKLFFCE@BOOL?$CDTP_2__running?$AA@" # @"??_C@_0BD@FNKLFFCE@BOOL?$CDTP_2__running?$AA@"
"??_C@_0BD@FNKLFFCE@BOOL?$CDTP_2__running?$AA@":
	.asciz	"BOOL#TP_2__running"

	.section	.rdata,"dr",discard,"??_C@_0M@MCBJJMKG@BOOL?$CDTP_2_Q?$AA@"
	.globl	"??_C@_0M@MCBJJMKG@BOOL?$CDTP_2_Q?$AA@" # @"??_C@_0M@MCBJJMKG@BOOL?$CDTP_2_Q?$AA@"
"??_C@_0M@MCBJJMKG@BOOL?$CDTP_2_Q?$AA@":
	.asciz	"BOOL#TP_2_Q"

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

	.bss
	.globl	_il_mem_StartSW                 # @il_mem_StartSW
_il_mem_StartSW:
	.byte	0                               # 0x0

	.globl	_il_slot_StartSW                # @il_slot_StartSW
	.p2align	2, 0x0
_il_slot_StartSW:
	.long	0

	.globl	_il_mem_EndSW                   # @il_mem_EndSW
_il_mem_EndSW:
	.byte	0                               # 0x0

	.globl	_il_slot_EndSW                  # @il_slot_EndSW
	.p2align	2, 0x0
_il_slot_EndSW:
	.long	0

	.globl	_il_mem_AI_1                    # @il_mem_AI_1
	.p2align	2, 0x0
_il_mem_AI_1:
	.long	0                               # 0x0

	.globl	_il_slot_AI_1                   # @il_slot_AI_1
	.p2align	2, 0x0
_il_slot_AI_1:
	.long	0

	.globl	_il_mem_Active                  # @il_mem_Active
_il_mem_Active:
	.byte	0                               # 0x0

	.globl	_il_slot_Active                 # @il_slot_Active
	.p2align	2, 0x0
_il_slot_Active:
	.long	0

	.globl	_il_mem_LimitOver               # @il_mem_LimitOver
_il_mem_LimitOver:
	.byte	0                               # 0x0

	.globl	_il_slot_LimitOver              # @il_slot_LimitOver
	.p2align	2, 0x0
_il_slot_LimitOver:
	.long	0

	.globl	_il_mem_LimitOverCount          # @il_mem_LimitOverCount
	.p2align	2, 0x0
_il_mem_LimitOverCount:
	.long	0                               # 0x0

	.globl	_il_slot_LimitOverCount         # @il_slot_LimitOverCount
	.p2align	2, 0x0
_il_slot_LimitOverCount:
	.long	0

	.globl	_il_mem_Err                     # @il_mem_Err
_il_mem_Err:
	.byte	0                               # 0x0

	.globl	_il_slot_Err                    # @il_slot_Err
	.p2align	2, 0x0
_il_slot_Err:
	.long	0

	.globl	_il_mem_TP1_Q                   # @il_mem_TP1_Q
_il_mem_TP1_Q:
	.byte	0                               # 0x0

	.globl	_il_slot_TP1_Q                  # @il_slot_TP1_Q
	.p2align	2, 0x0
_il_slot_TP1_Q:
	.long	0

	.globl	_il_mem_TP2_Q                   # @il_mem_TP2_Q
_il_mem_TP2_Q:
	.byte	0                               # 0x0

	.globl	_il_slot_TP2_Q                  # @il_slot_TP2_Q
	.p2align	2, 0x0
_il_slot_TP2_Q:
	.long	0

	.globl	_il_mem_LED1                    # @il_mem_LED1
_il_mem_LED1:
	.byte	0                               # 0x0

	.globl	_il_slot_LED1                   # @il_slot_LED1
	.p2align	2, 0x0
_il_slot_LED1:
	.long	0

	.globl	_il_mem_CTU_1_CU                # @il_mem_CTU_1_CU
_il_mem_CTU_1_CU:
	.byte	0                               # 0x0

	.globl	_il_slot_CTU_1_CU               # @il_slot_CTU_1_CU
	.p2align	2, 0x0
_il_slot_CTU_1_CU:
	.long	0

	.globl	_il_mem_CTU_1_RESET             # @il_mem_CTU_1_RESET
_il_mem_CTU_1_RESET:
	.byte	0                               # 0x0

	.globl	_il_slot_CTU_1_RESET            # @il_slot_CTU_1_RESET
	.p2align	2, 0x0
_il_slot_CTU_1_RESET:
	.long	0

	.globl	_il_mem_CTU_1_PV                # @il_mem_CTU_1_PV
	.p2align	2, 0x0
_il_mem_CTU_1_PV:
	.long	0                               # 0x0

	.globl	_il_slot_CTU_1_PV               # @il_slot_CTU_1_PV
	.p2align	2, 0x0
_il_slot_CTU_1_PV:
	.long	0

	.globl	_il_mem_CTU_1__prev_cu          # @il_mem_CTU_1__prev_cu
_il_mem_CTU_1__prev_cu:
	.byte	0                               # 0x0

	.globl	_il_slot_CTU_1__prev_cu         # @il_slot_CTU_1__prev_cu
	.p2align	2, 0x0
_il_slot_CTU_1__prev_cu:
	.long	0

	.globl	_il_mem_CTU_1_Q                 # @il_mem_CTU_1_Q
_il_mem_CTU_1_Q:
	.byte	0                               # 0x0

	.globl	_il_slot_CTU_1_Q                # @il_slot_CTU_1_Q
	.p2align	2, 0x0
_il_slot_CTU_1_Q:
	.long	0

	.globl	_il_mem_CTU_1_CV                # @il_mem_CTU_1_CV
	.p2align	2, 0x0
_il_mem_CTU_1_CV:
	.long	0                               # 0x0

	.globl	_il_slot_CTU_1_CV               # @il_slot_CTU_1_CV
	.p2align	2, 0x0
_il_slot_CTU_1_CV:
	.long	0

	.globl	_il_mem_TP_1_IN                 # @il_mem_TP_1_IN
_il_mem_TP_1_IN:
	.byte	0                               # 0x0

	.globl	_il_slot_TP_1_IN                # @il_slot_TP_1_IN
	.p2align	2, 0x0
_il_slot_TP_1_IN:
	.long	0

	.globl	_il_mem_TP_1_PT                 # @il_mem_TP_1_PT
	.p2align	2, 0x0
_il_mem_TP_1_PT:
	.long	0                               # 0x0

	.globl	_il_slot_TP_1_PT                # @il_slot_TP_1_PT
	.p2align	2, 0x0
_il_slot_TP_1_PT:
	.long	0

	.globl	_il_mem_TP_1__elapsed           # @il_mem_TP_1__elapsed
	.p2align	2, 0x0
_il_mem_TP_1__elapsed:
	.long	0                               # 0x0

	.globl	_il_slot_TP_1__elapsed          # @il_slot_TP_1__elapsed
	.p2align	2, 0x0
_il_slot_TP_1__elapsed:
	.long	0

	.globl	_il_mem_TP_1__running           # @il_mem_TP_1__running
_il_mem_TP_1__running:
	.byte	0                               # 0x0

	.globl	_il_slot_TP_1__running          # @il_slot_TP_1__running
	.p2align	2, 0x0
_il_slot_TP_1__running:
	.long	0

	.globl	_il_mem_TP_1_Q                  # @il_mem_TP_1_Q
_il_mem_TP_1_Q:
	.byte	0                               # 0x0

	.globl	_il_slot_TP_1_Q                 # @il_slot_TP_1_Q
	.p2align	2, 0x0
_il_slot_TP_1_Q:
	.long	0

	.globl	_il_mem_TP_2_IN                 # @il_mem_TP_2_IN
_il_mem_TP_2_IN:
	.byte	0                               # 0x0

	.globl	_il_slot_TP_2_IN                # @il_slot_TP_2_IN
	.p2align	2, 0x0
_il_slot_TP_2_IN:
	.long	0

	.globl	_il_mem_TP_2_PT                 # @il_mem_TP_2_PT
	.p2align	2, 0x0
_il_mem_TP_2_PT:
	.long	0                               # 0x0

	.globl	_il_slot_TP_2_PT                # @il_slot_TP_2_PT
	.p2align	2, 0x0
_il_slot_TP_2_PT:
	.long	0

	.globl	_il_mem_TP_2__elapsed           # @il_mem_TP_2__elapsed
	.p2align	2, 0x0
_il_mem_TP_2__elapsed:
	.long	0                               # 0x0

	.globl	_il_slot_TP_2__elapsed          # @il_slot_TP_2__elapsed
	.p2align	2, 0x0
_il_slot_TP_2__elapsed:
	.long	0

	.globl	_il_mem_TP_2__running           # @il_mem_TP_2__running
_il_mem_TP_2__running:
	.byte	0                               # 0x0

	.globl	_il_slot_TP_2__running          # @il_slot_TP_2__running
	.p2align	2, 0x0
_il_slot_TP_2__running:
	.long	0

	.globl	_il_mem_TP_2_Q                  # @il_mem_TP_2_Q
_il_mem_TP_2_Q:
	.byte	0                               # 0x0

	.globl	_il_slot_TP_2_Q                 # @il_slot_TP_2_Q
	.p2align	2, 0x0
_il_slot_TP_2_Q:
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
	.addrsig_sym _k_il_fb_instances
	.addrsig_sym _k_il_rtedge_ctu1_pin_tags
	.addrsig_sym _k_il_rtedge_tp1_pin_tags
	.addrsig_sym _k_il_rtedge_tp2_pin_tags
	.addrsig_sym _il_mem_StartSW
	.addrsig_sym _il_mem_EndSW
	.addrsig_sym _il_mem_AI_1
	.addrsig_sym _il_mem_Active
	.addrsig_sym _il_mem_LimitOver
	.addrsig_sym _il_mem_LimitOverCount
	.addrsig_sym _il_mem_Err
	.addrsig_sym _il_mem_TP1_Q
	.addrsig_sym _il_mem_TP2_Q
	.addrsig_sym _il_mem_LED1
	.addrsig_sym _il_mem_CTU_1_CU
	.addrsig_sym _il_mem_CTU_1_RESET
	.addrsig_sym _il_mem_CTU_1_PV
	.addrsig_sym _il_mem_CTU_1__prev_cu
	.addrsig_sym _il_mem_CTU_1_Q
	.addrsig_sym _il_mem_CTU_1_CV
	.addrsig_sym _il_mem_TP_1_IN
	.addrsig_sym _il_mem_TP_1_PT
	.addrsig_sym _il_mem_TP_1__elapsed
	.addrsig_sym _il_mem_TP_1__running
	.addrsig_sym _il_mem_TP_1_Q
	.addrsig_sym _il_mem_TP_2_IN
	.addrsig_sym _il_mem_TP_2_PT
	.addrsig_sym _il_mem_TP_2__elapsed
	.addrsig_sym _il_mem_TP_2__running
	.addrsig_sym _il_mem_TP_2_Q
