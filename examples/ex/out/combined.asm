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
	pushl	$0
	pushl	$8192                           # imm = 0x2000
	pushl	$_ScanThread
	pushl	$170
	calll	_CreateRtThread
	addl	$16, %esp
	cmpw	$-1, %ax
	je	LBB0_2
# %bb.1:
	pushl	$500                            # imm = 0x1F4
	calll	_RtSleep
	addl	$4, %esp
	pushl	$0
	pushl	$"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$500                            # imm = 0x1F4
	calll	_RtSleep
	addl	$4, %esp
	pushl	$1
	pushl	$"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$500                            # imm = 0x1F4
	calll	_RtSleep
	addl	$4, %esp
	pushl	$2
	pushl	$"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$500                            # imm = 0x1F4
	calll	_RtSleep
	addl	$4, %esp
	pushl	$3
	pushl	$"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$500                            # imm = 0x1F4
	calll	_RtSleep
	addl	$4, %esp
	pushl	$4
	pushl	$"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$500                            # imm = 0x1F4
	calll	_RtSleep
	addl	$4, %esp
	pushl	$5
	pushl	$"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$500                            # imm = 0x1F4
	calll	_RtSleep
	addl	$4, %esp
	pushl	$6
	pushl	$"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$500                            # imm = 0x1F4
	calll	_RtSleep
	addl	$4, %esp
	pushl	$7
	pushl	$"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$500                            # imm = 0x1F4
	calll	_RtSleep
	addl	$4, %esp
	pushl	$8
	pushl	$"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$500                            # imm = 0x1F4
	calll	_RtSleep
	addl	$4, %esp
	pushl	$9
	pushl	$"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$500                            # imm = 0x1F4
	calll	_RtSleep
	addl	$4, %esp
	pushl	$10
	pushl	$"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$500                            # imm = 0x1F4
	calll	_RtSleep
	addl	$4, %esp
	pushl	$11
	pushl	$"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$500                            # imm = 0x1F4
	calll	_RtSleep
	addl	$4, %esp
	pushl	$12
	pushl	$"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$500                            # imm = 0x1F4
	calll	_RtSleep
	addl	$4, %esp
	pushl	$13
	pushl	$"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$500                            # imm = 0x1F4
	calll	_RtSleep
	addl	$4, %esp
	pushl	$14
	pushl	$"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$500                            # imm = 0x1F4
	calll	_RtSleep
	addl	$4, %esp
	pushl	$15
	pushl	$"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$500                            # imm = 0x1F4
	calll	_RtSleep
	addl	$4, %esp
	pushl	$16
	pushl	$"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$500                            # imm = 0x1F4
	calll	_RtSleep
	addl	$4, %esp
	pushl	$17
	pushl	$"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$500                            # imm = 0x1F4
	calll	_RtSleep
	addl	$4, %esp
	pushl	$18
	pushl	$"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$500                            # imm = 0x1F4
	calll	_RtSleep
	addl	$4, %esp
	pushl	$19
	pushl	$"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@"
	calll	_printf
	addl	$8, %esp
	pushl	$0
	calll	_SuspendRtThread
	addl	$4, %esp
	xorl	%eax, %eax
	retl
LBB0_2:
	pushl	$L_str
	calll	_puts
	addl	$4, %esp
	movl	$-1, %eax
	retl
                                        # -- End function
	.def	_ScanThread;
	.scl	2;
	.type	32;
	.endef
	.globl	_ScanThread                     # -- Begin function ScanThread
	.p2align	4
_ScanThread:                            # @ScanThread
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$32, %esp
	jmp	LBB1_1
	.p2align	4
LBB1_7:                                 #   in Loop: Header=BB1_1 Depth=1
	movl	16(%esp), %edi                  # 4-byte Reload
	movl	%eax, (%edi)
	cmpb	$0, (%esi)
	cmovnel	%ebp, %eax
	movl	20(%esp), %esi                  # 4-byte Reload
	movl	%eax, (%esi)
	cmpb	$0, (%ecx)
	cmovel	%ebp, %eax
	movl	%eax, (%edx)
LBB1_1:                                 # =>This Inner Loop Header: Depth=1
	pushl	$1
	calll	_RtSleepEx
	addl	$4, %esp
	movl	_il_slot_SW1, %esi
	movl	_il_slot_SW2, %eax
	movl	_il_slot_ANS, %ecx
	movl	%ecx, 28(%esp)                  # 4-byte Spill
	movl	_il_slot_CycleMs, %ebx
	movl	_il_slot_Sub100, %ecx
	movl	%ecx, 24(%esp)                  # 4-byte Spill
	movl	_il_slot_R, %ecx
	movl	_il_slot_Cm1, %ebp
	movzbl	(%esi), %edx
	andb	(%eax), %dl
	movl	_il_slot_G10, %esi
	andb	$1, %dl
	movl	_il_slot_Sb_inc, %eax
	movl	_il_slot_Sb_ge, %edi
	movl	%edi, (%esp)                    # 4-byte Spill
	movl	_il_slot_AnsP1, %edi
	movl	%edi, 12(%esp)                  # 4-byte Spill
	movl	_il_slot_Ans_mid, %edi
	movl	%edi, 16(%esp)                  # 4-byte Spill
	movl	_il_slot_Ans_mid2, %edi
	movl	%edi, 20(%esp)                  # 4-byte Spill
	movl	_il_slot_tmpSb, %edi
	movl	%edi, 4(%esp)                   # 4-byte Spill
	movl	_il_slot_tmpSb2, %edi
	movl	%edi, 8(%esp)                   # 4-byte Spill
	movb	%dl, (%ecx)
	movl	(%ebx), %edi
	incl	%edi
	movl	%edi, (%ebp)
	xorl	%ebp, %ebp
	cmpb	$0, (%ecx)
	cmovel	%ebp, %edi
	movl	%edi, (%ebx)
	movl	$0, %edx
	cmpl	$10000, %edi                    # imm = 0x2710
	setae	(%esi)
	jae	LBB1_3
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movl	(%ebx), %edx
LBB1_3:                                 #   in Loop: Header=BB1_1 Depth=1
	movl	%edx, (%ebx)
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	(%edi), %edx
	incl	%edx
	movl	%edx, (%eax)
	movl	$0, %ebx
	cmpl	$100, %edx
	movl	(%esp), %edx                    # 4-byte Reload
	setae	(%edx)
	jae	LBB1_5
# %bb.4:                                #   in Loop: Header=BB1_1 Depth=1
	movl	(%eax), %ebx
LBB1_5:                                 #   in Loop: Header=BB1_1 Depth=1
	movl	4(%esp), %eax                   # 4-byte Reload
	movl	%ebx, (%eax)
	cmpb	$0, (%esi)
	cmovnel	%ebp, %ebx
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	%ebx, (%eax)
	cmpb	$0, (%ecx)
	cmovel	%ebp, %ebx
	movl	%ebx, (%edi)
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %eax
	incl	%eax
	movl	12(%esp), %edi                  # 4-byte Reload
	movl	%eax, (%edi)
	movl	(%esp), %edi                    # 4-byte Reload
	cmpb	$0, (%edi)
	jne	LBB1_7
# %bb.6:                                #   in Loop: Header=BB1_1 Depth=1
	movl	(%edx), %eax
	jmp	LBB1_7
                                        # -- End function
	.def	_scan_slots_init;
	.scl	2;
	.type	32;
	.endef
	.globl	_scan_slots_init                # -- Begin function scan_slots_init
	.p2align	4
_scan_slots_init:                       # @scan_slots_init
# %bb.0:                                # %entry
	movl	$_il_mem_SW1, _il_slot_SW1
	movl	$_il_mem_SW2, _il_slot_SW2
	movl	$_il_mem_ANS, _il_slot_ANS
	movl	$_il_mem_CycleMs, _il_slot_CycleMs
	movl	$_il_mem_Sub100, _il_slot_Sub100
	movl	$_il_mem_R, _il_slot_R
	movl	$_il_mem_Cm1, _il_slot_Cm1
	movl	$_il_mem_G10, _il_slot_G10
	movl	$_il_mem_Sb_inc, _il_slot_Sb_inc
	movl	$_il_mem_Sb_ge, _il_slot_Sb_ge
	movl	$_il_mem_AnsP1, _il_slot_AnsP1
	movl	$_il_mem_Ans_mid, _il_slot_Ans_mid
	movl	$_il_mem_Ans_mid2, _il_slot_Ans_mid2
	movl	$_il_mem_tmpSb, _il_slot_tmpSb
	movl	$_il_mem_tmpSb2, _il_slot_tmpSb2
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
	jne	LBB3_2
# %bb.1:                                # %entry
	movl	(%edx), %edi
LBB3_2:                                 # %entry
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
	.def	_scan;
	.scl	2;
	.type	32;
	.endef
	.globl	_scan                           # -- Begin function scan
	.p2align	4
_scan:                                  # @scan
# %bb.0:                                # %entry
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$32, %esp
	movl	_il_slot_Sb_ge, %edi
	movl	_il_slot_SW1, %esi
	movl	_il_slot_ANS, %ecx
	movl	_il_slot_SW2, %eax
	movl	_il_slot_CycleMs, %ebx
	movl	_il_slot_Cm1, %ebp
	movl	%edi, 16(%esp)                  # 4-byte Spill
	movl	_il_slot_AnsP1, %edi
	movzbl	(%esi), %edx
	movl	%ecx, 28(%esp)                  # 4-byte Spill
	movl	_il_slot_Sub100, %ecx
	movl	_il_slot_G10, %esi
	movl	%edi, 12(%esp)                  # 4-byte Spill
	movl	_il_slot_Ans_mid, %edi
	andb	(%eax), %dl
	movl	%ecx, (%esp)                    # 4-byte Spill
	movl	_il_slot_R, %ecx
	movl	_il_slot_Sb_inc, %eax
	movl	%edi, 20(%esp)                  # 4-byte Spill
	movl	_il_slot_Ans_mid2, %edi
	andb	$1, %dl
	movl	%edi, 24(%esp)                  # 4-byte Spill
	movl	_il_slot_tmpSb, %edi
	movl	%edi, 4(%esp)                   # 4-byte Spill
	movl	_il_slot_tmpSb2, %edi
	movb	%dl, (%ecx)
	movl	(%ebx), %edx
	movl	%edi, 8(%esp)                   # 4-byte Spill
	incl	%edx
	movl	%edx, (%ebp)
	xorl	%ebp, %ebp
	cmpb	$0, (%ecx)
	cmovel	%ebp, %edx
	movl	%edx, (%ebx)
	cmpl	$10000, %edx                    # imm = 0x2710
	movl	$0, %edx
	setae	(%esi)
	jae	LBB5_2
# %bb.1:                                # %entry
	movl	(%ebx), %edx
LBB5_2:                                 # %entry
	movl	%edx, (%ebx)
	movl	(%esp), %edx                    # 4-byte Reload
	movl	16(%esp), %edi                  # 4-byte Reload
	movl	$0, %ebx
	movl	(%edx), %edx
	incl	%edx
	cmpl	$100, %edx
	movl	%edx, (%eax)
	setae	(%edi)
	jae	LBB5_4
# %bb.3:                                # %entry
	movl	(%eax), %ebx
LBB5_4:                                 # %entry
	movl	4(%esp), %eax                   # 4-byte Reload
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	%ebx, (%eax)
	movl	8(%esp), %eax                   # 4-byte Reload
	cmpb	$0, (%esi)
	cmovnel	%ebp, %ebx
	movl	%ebx, (%eax)
	movl	(%esp), %eax                    # 4-byte Reload
	cmpb	$0, (%ecx)
	cmovel	%ebp, %ebx
	movl	%ebx, (%eax)
	movl	12(%esp), %ebx                  # 4-byte Reload
	movl	(%edx), %eax
	incl	%eax
	movl	%eax, (%ebx)
	cmpb	$0, (%edi)
	jne	LBB5_6
# %bb.5:                                # %entry
	movl	(%edx), %eax
LBB5_6:                                 # %entry
	movl	20(%esp), %edi                  # 4-byte Reload
	movl	%eax, (%edi)
	cmpb	$0, (%esi)
	movl	24(%esp), %esi                  # 4-byte Reload
	cmovnel	%ebp, %eax
	movl	%eax, (%esi)
	cmpb	$0, (%ecx)
	cmovel	%ebp, %eax
	movl	%eax, (%edx)
	xorl	%eax, %eax
	addl	$32, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_il_rtedge_registry_push;
	.scl	2;
	.type	32;
	.endef
	.globl	_il_rtedge_registry_push        # -- Begin function il_rtedge_registry_push
	.p2align	4
_il_rtedge_registry_push:               # @il_rtedge_registry_push
# %bb.0:
	cmpl	$0, 4(%esp)
	sete	%cl
	movl	_il_rtedge_tag_count, %eax
	cmpl	$127, %eax
	seta	%dl
	orb	%cl, %dl
	je	LBB6_2
# %bb.1:
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	retl
LBB6_2:
	incl	%eax
	movl	%eax, _il_rtedge_tag_count
	movb	$1, %al
                                        # kill: def $al killed $al killed $eax
	retl
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
LBB7_1:                                 # =>This Inner Loop Header: Depth=1
	cmpl	$3, (%esp)
	jae	LBB7_4
# %bb.2:                                #   in Loop: Header=BB7_1 Depth=1
	movl	(%esp), %eax
	movl	_k_ex_rtedge_scalar_specs(,%eax,4), %ecx
	calll	_il_rtedge_apply_instruction_spec
# %bb.3:                                #   in Loop: Header=BB7_1 Depth=1
	movl	(%esp), %eax
	addl	$1, %eax
	movl	%eax, (%esp)
	jmp	LBB7_1
LBB7_4:
	calll	_scan_slots_init
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
	je	LBB8_1
# %bb.2:                                # %.preheader.preheader
	xorl	%esi, %esi
	.p2align	4
LBB8_3:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	leal	1(%esi), %eax
	movb	%dl, (%esp,%esi)
	cmpl	$110, %eax
	ja	LBB8_5
# %bb.4:                                # %.preheader
                                        #   in Loop: Header=BB8_3 Depth=1
	movzbl	1(%ecx,%esi), %edx
	movl	%eax, %esi
	testb	%dl, %dl
	jne	LBB8_3
	jmp	LBB8_5
LBB8_1:
	xorl	%eax, %eax
LBB8_5:                                 # %.loopexit
	movb	$0, (%esp,%eax)
	movl	%esp, %eax
	pushl	$0
	pushl	%eax
	calll	_Rtedge_TagCreateByInstruction
	addl	$120, %esp
	popl	%esi
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
	je	LBB9_52
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
	je	LBB9_2
# %bb.41:
	pushl	$4
	pushl	$"??_C@_04MCOJOMNJ@INT?$CD?$AA@"
	pushl	%ebp
	calll	_strncmp
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB9_42
# %bb.43:
	pushl	$5
	pushl	$"??_C@_05OJEKCDCD@UINT?$CD?$AA@"
	pushl	%ebp
	calll	_strncmp
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB9_44
# %bb.45:
	pushl	$5
	pushl	$"??_C@_05CNEHJGCP@TIME?$CD?$AA@"
	pushl	%ebp
	calll	_strncmp
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB9_46
# %bb.47:
	pushl	$9
	pushl	$"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@"
	pushl	%ebp
	calll	_strncmp
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB9_48
# %bb.49:
	pushl	$7
	pushl	$"??_C@_07DCPMEJPJ@STRING?$CD?$AA@"
	pushl	%ebp
	calll	_strncmp
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB9_52
# %bb.50:
	movl	$7, (%esp)                      # 4-byte Folded Spill
	movl	$_il_kw+80, %ebx
	jmp	LBB9_3
LBB9_2:
	movl	$5, (%esp)                      # 4-byte Folded Spill
	movl	$_il_kw, %ebx
	jmp	LBB9_3
LBB9_42:
	movl	$4, (%esp)                      # 4-byte Folded Spill
	movl	$_il_kw+16, %ebx
	jmp	LBB9_3
LBB9_44:
	movl	$5, (%esp)                      # 4-byte Folded Spill
	movl	$_il_kw+32, %ebx
	jmp	LBB9_3
LBB9_46:
	movl	$5, (%esp)                      # 4-byte Folded Spill
	movl	$_il_kw+48, %ebx
	jmp	LBB9_3
LBB9_48:
	movl	$9, (%esp)                      # 4-byte Folded Spill
	movl	$_il_kw+64, %ebx
LBB9_3:
	incl	%edi
	pushl	%edi
	calll	_malloc
	addl	$4, %esp
	testl	%eax, %eax
	je	LBB9_52
# %bb.4:
	movl	%eax, %esi
	pushl	%edi
	pushl	%ebp
	pushl	%eax
	calll	_memcpy
	addl	$12, %esp
	movzwl	4(%ebx), %ecx
	movw	$99, %ax
	cmpl	$1345, %ecx                     # imm = 0x541
	jg	LBB9_10
# %bb.5:
	cmpl	$261, %ecx                      # imm = 0x105
	je	LBB9_33
# %bb.6:
	cmpl	$513, %ecx                      # imm = 0x201
	je	LBB9_34
# %bb.7:
	cmpl	$1059, %ecx                     # imm = 0x423
	jne	LBB9_37
# %bb.8:
	pushl	$35
	pushl	%esi
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB9_9
# %bb.13:
	movl	%eax, %edi
	movb	$0, (%eax)
	incl	%edi
	movl	%esi, %ebp
	movl	(%esp), %eax                    # 4-byte Reload
	addl	%eax, %ebp
	movw	$0, 6(%esp)
	movzbl	(%esi,%eax), %eax
	cmpl	$84, %eax
	je	LBB9_14
# %bb.15:
	movw	$64, %cx
	cmpl	$67, %eax
	jne	LBB9_19
# %bb.16:
	cmpb	$84, 1(%ebp)
	jne	LBB9_19
# %bb.17:
	movw	$32, %ax
	movb	$85, %cl
	movl	$2, %edx
	jmp	LBB9_18
LBB9_10:
	cmpl	$1346, %ecx                     # imm = 0x542
	je	LBB9_29
# %bb.11:
	cmpl	$1347, %ecx                     # imm = 0x543
	je	LBB9_35
# %bb.12:
	movl	$_il_kw, %edx
	cmpl	$1536, %ecx                     # imm = 0x600
	je	LBB9_36
	jmp	LBB9_37
LBB9_33:
	movl	$_il_kw+16, %edx
	jmp	LBB9_36
LBB9_29:
	movw	$0, 6(%esp)
	cmpb	$0, 288(%esp)
	jne	LBB9_38
# %bb.30:
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
	jne	LBB9_9
# %bb.31:
	pushl	$83
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB9_38
# %bb.32:
	movl	%eax, %ebx
	pushl	$83
	jmp	LBB9_28
LBB9_34:
	movl	$_il_kw+32, %edx
	jmp	LBB9_36
LBB9_35:
	movl	$_il_kw+48, %edx
LBB9_36:
	movzwl	8(%edx), %eax
LBB9_37:
	cmpb	$0, 288(%esp)
	je	LBB9_51
LBB9_38:
	pushl	%esi
	calll	_free
	addl	$4, %esp
LBB9_39:
	movl	_il_rtedge_tag_count, %ecx
	movb	$1, %al
	cmpl	$127, %ecx
	ja	LBB9_53
# %bb.40:
	incl	%ecx
	movl	%ecx, _il_rtedge_tag_count
	jmp	LBB9_53
LBB9_51:
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
	jne	LBB9_52
	jmp	LBB9_39
LBB9_14:
	movw	$40, %ax
	movb	$80, %cl
	movl	$1, %edx
LBB9_18:
	cmpb	%cl, (%ebp,%edx)
	movl	$64, %ecx
	cmovel	%eax, %ecx
LBB9_19:
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
	je	LBB9_20
LBB9_9:
	pushl	%esi
	calll	_free
	addl	$4, %esp
LBB9_52:
	xorl	%eax, %eax
LBB9_53:                                # %il_rtedge_registry_push.exit
                                        # kill: def $al killed $al killed $eax
	addl	$264, %esp                      # imm = 0x108
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB9_20:
	movzbl	(%ebp), %eax
	cmpl	$84, %eax
	je	LBB9_21
# %bb.22:
	movw	$64, %cx
	cmpl	$67, %eax
	jne	LBB9_26
# %bb.23:
	cmpb	$84, 1(%ebp)
	jne	LBB9_26
# %bb.24:
	movw	$32, %ax
	movb	$85, %cl
	movl	$2, %edx
	jmp	LBB9_25
LBB9_21:
	movw	$40, %ax
	movb	$80, %cl
	movl	$1, %edx
LBB9_25:
	cmpb	%cl, (%ebp,%edx)
	movl	$64, %ecx
	cmovel	%eax, %ecx
LBB9_26:
	movzwl	%cx, %ebp
	pushl	%ebp
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB9_38
# %bb.27:
	movl	%eax, %ebx
	pushl	%ebp
LBB9_28:
	pushl	%ebx
	pushl	$0
	pushl	%edi
	calll	*__imp__EgTagWriteSegment
	addl	$16, %esp
	pushl	%ebx
	calll	_free
	addl	$4, %esp
	jmp	LBB9_38
                                        # -- End function
	.def	_IlRtedgeSlots_BindEgEntry;
	.scl	2;
	.type	32;
	.endef
	.globl	_IlRtedgeSlots_BindEgEntry      # -- Begin function IlRtedgeSlots_BindEgEntry
	.p2align	4
_IlRtedgeSlots_BindEgEntry:             # @IlRtedgeSlots_BindEgEntry
# %bb.0:
	pushl	%esi
	pushl	%eax
	movl	$0, (%esp)
	movl	%esp, %esi
	pushl	$4
	pushl	%esi
	pushl	$"??_C@_05HKHPEFOF@Entry?$AA@"
	pushl	$"??_C@_03KIKNLPCI@SW1?$AA@"
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	setne	%cl
	movl	(%esp), %eax
	testl	%eax, %eax
	sete	%dl
	orb	%cl, %dl
	jne	LBB10_6
# %bb.1:
	cmpw	$13, 3(%eax)
	je	LBB10_3
# %bb.2:
	cmpl	$1, 385(%eax)
	jne	LBB10_4
LBB10_3:
	movl	23(%eax), %eax
	jmp	LBB10_5
LBB10_4:
	addl	$15, %eax
LBB10_5:
	movl	%eax, _il_slot_SW1
LBB10_6:
	movl	$0, (%esp)
	pushl	$4
	pushl	%esi
	pushl	$"??_C@_05HKHPEFOF@Entry?$AA@"
	pushl	$"??_C@_03IDIAOMOL@SW2?$AA@"
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	setne	%cl
	movl	(%esp), %eax
	testl	%eax, %eax
	sete	%dl
	orb	%cl, %dl
	jne	LBB10_12
# %bb.7:
	cmpw	$13, 3(%eax)
	je	LBB10_10
# %bb.8:
	cmpl	$1, 385(%eax)
	jne	LBB10_9
LBB10_10:
	movl	23(%eax), %eax
	jmp	LBB10_11
LBB10_9:
	addl	$15, %eax
LBB10_11:
	movl	%eax, _il_slot_SW2
LBB10_12:
	movl	$0, (%esp)
	pushl	$4
	pushl	%esi
	pushl	$"??_C@_05HKHPEFOF@Entry?$AA@"
	pushl	$"??_C@_03BGIBLBOG@ANS?$AA@"
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	setne	%cl
	movl	(%esp), %eax
	testl	%eax, %eax
	sete	%dl
	orb	%cl, %dl
	jne	LBB10_18
# %bb.13:
	cmpw	$13, 3(%eax)
	je	LBB10_16
# %bb.14:
	cmpl	$1, 385(%eax)
	jne	LBB10_15
LBB10_16:
	movl	23(%eax), %eax
	jmp	LBB10_17
LBB10_15:
	addl	$15, %eax
LBB10_17:
	movl	%eax, _il_slot_ANS
LBB10_18:
	addl	$4, %esp
	popl	%esi
	retl
                                        # -- End function
	.section	.rdata,"dr",discard,"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@"
	.globl	"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@" # @"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@"
"??_C@_0BC@LIAKHJNL@Hello?0?5World?$CB?5?$CFd?6?$AA@":
	.asciz	"Hello, World! %d\n"

	.section	.rdata,"dr"
L_str:                                  # @str
	.asciz	"CreateRtThread(ScanThread) failed"

	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_il_mem_SW1                     # @il_mem_SW1
_il_mem_SW1:
	.byte	0                               # 0x0

	.globl	_il_mem_SW2                     # @il_mem_SW2
_il_mem_SW2:
	.byte	0                               # 0x0

	.globl	_il_mem_ANS                     # @il_mem_ANS
	.p2align	2, 0x0
_il_mem_ANS:
	.long	0                               # 0x0

	.globl	_il_mem_CycleMs                 # @il_mem_CycleMs
	.p2align	2, 0x0
_il_mem_CycleMs:
	.long	0                               # 0x0

	.globl	_il_slot_CycleMs                # @il_slot_CycleMs
	.p2align	2, 0x0
_il_slot_CycleMs:
	.long	0

	.globl	_il_mem_Sub100                  # @il_mem_Sub100
	.p2align	2, 0x0
_il_mem_Sub100:
	.long	0                               # 0x0

	.globl	_il_slot_Sub100                 # @il_slot_Sub100
	.p2align	2, 0x0
_il_slot_Sub100:
	.long	0

	.globl	_il_mem_R                       # @il_mem_R
_il_mem_R:
	.byte	0                               # 0x0

	.globl	_il_slot_R                      # @il_slot_R
	.p2align	2, 0x0
_il_slot_R:
	.long	0

	.globl	_il_mem_Cm1                     # @il_mem_Cm1
	.p2align	2, 0x0
_il_mem_Cm1:
	.long	0                               # 0x0

	.globl	_il_slot_Cm1                    # @il_slot_Cm1
	.p2align	2, 0x0
_il_slot_Cm1:
	.long	0

	.globl	_il_mem_G10                     # @il_mem_G10
_il_mem_G10:
	.byte	0                               # 0x0

	.globl	_il_slot_G10                    # @il_slot_G10
	.p2align	2, 0x0
_il_slot_G10:
	.long	0

	.globl	_il_mem_Sb_inc                  # @il_mem_Sb_inc
	.p2align	2, 0x0
_il_mem_Sb_inc:
	.long	0                               # 0x0

	.globl	_il_slot_Sb_inc                 # @il_slot_Sb_inc
	.p2align	2, 0x0
_il_slot_Sb_inc:
	.long	0

	.globl	_il_mem_Sb_ge                   # @il_mem_Sb_ge
_il_mem_Sb_ge:
	.byte	0                               # 0x0

	.globl	_il_slot_Sb_ge                  # @il_slot_Sb_ge
	.p2align	2, 0x0
_il_slot_Sb_ge:
	.long	0

	.globl	_il_mem_AnsP1                   # @il_mem_AnsP1
	.p2align	2, 0x0
_il_mem_AnsP1:
	.long	0                               # 0x0

	.globl	_il_slot_AnsP1                  # @il_slot_AnsP1
	.p2align	2, 0x0
_il_slot_AnsP1:
	.long	0

	.globl	_il_mem_Ans_mid                 # @il_mem_Ans_mid
	.p2align	2, 0x0
_il_mem_Ans_mid:
	.long	0                               # 0x0

	.globl	_il_slot_Ans_mid                # @il_slot_Ans_mid
	.p2align	2, 0x0
_il_slot_Ans_mid:
	.long	0

	.globl	_il_mem_Ans_mid2                # @il_mem_Ans_mid2
	.p2align	2, 0x0
_il_mem_Ans_mid2:
	.long	0                               # 0x0

	.globl	_il_slot_Ans_mid2               # @il_slot_Ans_mid2
	.p2align	2, 0x0
_il_slot_Ans_mid2:
	.long	0

	.globl	_il_mem_tmpSb                   # @il_mem_tmpSb
	.p2align	2, 0x0
_il_mem_tmpSb:
	.long	0                               # 0x0

	.globl	_il_slot_tmpSb                  # @il_slot_tmpSb
	.p2align	2, 0x0
_il_slot_tmpSb:
	.long	0

	.globl	_il_mem_tmpSb2                  # @il_mem_tmpSb2
	.p2align	2, 0x0
_il_mem_tmpSb2:
	.long	0                               # 0x0

	.globl	_il_slot_tmpSb2                 # @il_slot_tmpSb2
	.p2align	2, 0x0
_il_slot_tmpSb2:
	.long	0

	.lcomm	_il_rtedge_tag_count,4,4        # @il_rtedge_tag_count
	.section	.rdata,"dr"
	.p2align	2, 0x0                          # @k_ex_rtedge_scalar_specs
_k_ex_rtedge_scalar_specs:
	.long	"??_C@_08CDIBBFAJ@BOOL?$CDSW1?$AA@"
	.long	"??_C@_08IKMEGMK@BOOL?$CDSW2?$AA@"
	.long	"??_C@_07GBHPHJEE@INT?$CDANS?$AA@"

	.section	.rdata,"dr",discard,"??_C@_08CDIBBFAJ@BOOL?$CDSW1?$AA@"
	.globl	"??_C@_08CDIBBFAJ@BOOL?$CDSW1?$AA@" # @"??_C@_08CDIBBFAJ@BOOL?$CDSW1?$AA@"
"??_C@_08CDIBBFAJ@BOOL?$CDSW1?$AA@":
	.asciz	"BOOL#SW1"

	.section	.rdata,"dr",discard,"??_C@_08IKMEGMK@BOOL?$CDSW2?$AA@"
	.globl	"??_C@_08IKMEGMK@BOOL?$CDSW2?$AA@" # @"??_C@_08IKMEGMK@BOOL?$CDSW2?$AA@"
"??_C@_08IKMEGMK@BOOL?$CDSW2?$AA@":
	.asciz	"BOOL#SW2"

	.section	.rdata,"dr",discard,"??_C@_07GBHPHJEE@INT?$CDANS?$AA@"
	.globl	"??_C@_07GBHPHJEE@INT?$CDANS?$AA@" # @"??_C@_07GBHPHJEE@INT?$CDANS?$AA@"
"??_C@_07GBHPHJEE@INT?$CDANS?$AA@":
	.asciz	"INT#ANS"

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

	.section	.rdata,"dr",discard,"??_C@_05HKHPEFOF@Entry?$AA@"
	.globl	"??_C@_05HKHPEFOF@Entry?$AA@"   # @"??_C@_05HKHPEFOF@Entry?$AA@"
"??_C@_05HKHPEFOF@Entry?$AA@":
	.asciz	"Entry"

	.section	.rdata,"dr",discard,"??_C@_03KIKNLPCI@SW1?$AA@"
	.globl	"??_C@_03KIKNLPCI@SW1?$AA@"     # @"??_C@_03KIKNLPCI@SW1?$AA@"
"??_C@_03KIKNLPCI@SW1?$AA@":
	.asciz	"SW1"

	.bss
	.globl	_il_slot_SW1                    # @il_slot_SW1
	.p2align	2, 0x0
_il_slot_SW1:
	.long	0

	.section	.rdata,"dr",discard,"??_C@_03IDIAOMOL@SW2?$AA@"
	.globl	"??_C@_03IDIAOMOL@SW2?$AA@"     # @"??_C@_03IDIAOMOL@SW2?$AA@"
"??_C@_03IDIAOMOL@SW2?$AA@":
	.asciz	"SW2"

	.bss
	.globl	_il_slot_SW2                    # @il_slot_SW2
	.p2align	2, 0x0
_il_slot_SW2:
	.long	0

	.section	.rdata,"dr",discard,"??_C@_03BGIBLBOG@ANS?$AA@"
	.globl	"??_C@_03BGIBLBOG@ANS?$AA@"     # @"??_C@_03BGIBLBOG@ANS?$AA@"
"??_C@_03BGIBLBOG@ANS?$AA@":
	.asciz	"ANS"

	.bss
	.globl	_il_slot_ANS                    # @il_slot_ANS
	.p2align	2, 0x0
_il_slot_ANS:
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
	.addrsig_sym _ScanThread
	.addrsig_sym _il_mem_SW1
	.addrsig_sym _il_mem_SW2
	.addrsig_sym _il_mem_ANS
	.addrsig_sym _il_mem_CycleMs
	.addrsig_sym _il_mem_Sub100
	.addrsig_sym _il_mem_R
	.addrsig_sym _il_mem_Cm1
	.addrsig_sym _il_mem_G10
	.addrsig_sym _il_mem_Sb_inc
	.addrsig_sym _il_mem_Sb_ge
	.addrsig_sym _il_mem_AnsP1
	.addrsig_sym _il_mem_Ans_mid
	.addrsig_sym _il_mem_Ans_mid2
	.addrsig_sym _il_mem_tmpSb
	.addrsig_sym _il_mem_tmpSb2
