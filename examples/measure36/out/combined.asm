	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"measure36.ll"
	.def	_ctu_step;
	.scl	2;
	.type	32;
	.endef
	.text
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
	jne	LBB0_2
# %bb.1:                                # %entry
	movl	(%edx), %edi
LBB0_2:                                 # %entry
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
	.def	_ton_step;
	.scl	2;
	.type	32;
	.endef
	.globl	_ton_step                       # -- Begin function ton_step
	.p2align	4
_ton_step:                              # @ton_step
# %bb.0:                                # %entry
	pushl	%ebx
	pushl	%esi
	movl	12(%esp), %esi
	xorl	%edx, %edx
	movl	24(%esp), %eax
	movl	20(%esp), %ecx
	movl	$0, %ebx
	cmpb	$0, (%esi)
	je	LBB2_2
# %bb.1:                                # %ton_in_true
	movl	16(%esp), %edx
	movl	(%edx), %esi
	movl	(%ecx), %edx
	incl	%edx
	cmpl	%esi, %edx
	cmovgel	%esi, %edx
	setge	%bl
LBB2_2:                                 # %common.ret
	movl	%edx, (%ecx)
	movb	%bl, (%eax)
	popl	%esi
	popl	%ebx
	retl
                                        # -- End function
	.def	_r_trig_step;
	.scl	2;
	.type	32;
	.endef
	.globl	_r_trig_step                    # -- Begin function r_trig_step
	.p2align	4
_r_trig_step:                           # @r_trig_step
# %bb.0:                                # %entry
	movl	4(%esp), %edx
	movl	12(%esp), %ecx
	movl	8(%esp), %eax
	movzbl	(%edx), %edx
	movb	(%ecx), %dh
	notb	%dh
	andb	%dl, %dh
	movb	%dh, (%eax)
	movb	%dl, (%ecx)
	retl
                                        # -- End function
	.def	_f_trig_step;
	.scl	2;
	.type	32;
	.endef
	.globl	_f_trig_step                    # -- Begin function f_trig_step
	.p2align	4
_f_trig_step:                           # @f_trig_step
# %bb.0:                                # %entry
	movl	4(%esp), %edx
	movl	12(%esp), %ecx
	movl	8(%esp), %eax
	movzbl	(%edx), %edx
	movb	%dl, %dh
	notb	%dh
	andb	(%ecx), %dh
	andb	$1, %dh
	movb	%dh, (%eax)
	movb	%dl, (%ecx)
	retl
                                        # -- End function
	.def	_measure36;
	.scl	2;
	.type	32;
	.endef
	.globl	_measure36                      # -- Begin function measure36
	.p2align	4
_measure36:                             # @measure36
# %bb.0:                                # %entry
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$796, %esp                      # imm = 0x31C
	movl	_il_slot_TON_1_Q, %esi
	movl	_il_slot_ECAT_Slave5_DI1, %eax
	movl	_il_slot_input01, %ecx
	movl	_il_slot_inCLR03, %edi
	movl	_il_slot_inCLR0402, %edx
	movl	_il_slot_TON_1_IN, %ebp
	movl	%esi, 224(%esp)                 # 4-byte Spill
	movl	_il_slot_resTimer01, %esi
	movl	%eax, 792(%esp)                 # 4-byte Spill
	movzbl	(%eax), %ebx
	movl	_il_slot_inBIa0404, %eax
	movl	%ecx, 88(%esp)                  # 4-byte Spill
	movl	_il_slot_inBia0101, %ecx
	movl	%edx, 748(%esp)                 # 4-byte Spill
	movl	%edi, 744(%esp)                 # 4-byte Spill
	movl	%ebp, 752(%esp)                 # 4-byte Spill
	movl	%esi, 260(%esp)                 # 4-byte Spill
	movl	_il_slot_passed01, %esi
	movl	%eax, 128(%esp)                 # 4-byte Spill
	movl	_il_slot_inBIa0504, %eax
	movl	%ecx, 160(%esp)                 # 4-byte Spill
	movl	_il_slot_inBia0102, %ecx
	movl	%esi, 216(%esp)                 # 4-byte Spill
	movl	_il_slot_TIME_1m, %esi
	movl	%eax, 132(%esp)                 # 4-byte Spill
	movl	_il_slot_inCLR01, %eax
	movl	%ecx, 156(%esp)                 # 4-byte Spill
	movl	_il_slot_inBia0202, %ecx
	movl	%esi, 212(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_2_PT, %esi
	movl	%eax, 136(%esp)                 # 4-byte Spill
	movl	_il_slot_inCLR02, %eax
	movl	%ecx, 148(%esp)                 # 4-byte Spill
	movl	_il_slot_inBia0203, %ecx
	movl	%esi, 72(%esp)                  # 4-byte Spill
	movl	_il_slot_TON_2_Q, %esi
	movl	%eax, 144(%esp)                 # 4-byte Spill
	movl	_il_slot_inCLR0401, %eax
	movl	%ecx, 164(%esp)                 # 4-byte Spill
	movl	_il_slot_inBia0303, %ecx
	movl	%esi, 232(%esp)                 # 4-byte Spill
	movl	_il_slot_resTimer02, %esi
	movl	%eax, 104(%esp)                 # 4-byte Spill
	movl	_il_slot_inCounter, %eax
	movl	%ecx, 168(%esp)                 # 4-byte Spill
	movl	%esi, 248(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_2_ET, %esi
	movl	%eax, 76(%esp)                  # 4-byte Spill
	movl	_il_slot_inCounter2, %eax
	movl	%esi, (%esp)                    # 4-byte Spill
	movl	_il_slot_passed02, %esi
	movl	%eax, 84(%esp)                  # 4-byte Spill
	movl	_il_slot_inCounter3, %eax
	movl	%esi, 228(%esp)                 # 4-byte Spill
	movl	_il_slot_resLD_T01, %esi
	movl	%eax, 96(%esp)                  # 4-byte Spill
	movl	_il_slot_inCounter04, %eax
	movl	%esi, 236(%esp)                 # 4-byte Spill
	movl	_il_slot_resLD_T02, %esi
	movl	%eax, 108(%esp)                 # 4-byte Spill
	movl	_il_slot_inCounter05, %eax
	movl	%esi, 240(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_1_CU, %esi
	movl	%eax, 116(%esp)                 # 4-byte Spill
	movl	_il_slot_inCounter06, %eax
	movl	%esi, 256(%esp)                 # 4-byte Spill
	movl	_il_slot_enableCnt, %esi
	movl	%eax, 124(%esp)                 # 4-byte Spill
	movl	_il_slot_inDIFU, %eax
	movl	%esi, 656(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_1_RESET, %esi
	movl	%eax, 140(%esp)                 # 4-byte Spill
	movl	_il_slot_inDIFD, %eax
	movl	%esi, 252(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_1_PV, %esi
	movl	%eax, 152(%esp)                 # 4-byte Spill
	movl	_il_slot_inTIMER01, %eax
	movl	%esi, 244(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_1__prev_cu, %esi
	movl	%eax, 208(%esp)                 # 4-byte Spill
	movl	_il_slot_inTimER02, %eax
	movl	208(%esp), %ecx                 # 4-byte Reload
	movl	%esi, 52(%esp)                  # 4-byte Spill
	movl	_il_slot_CTU_1_Q, %esi
	movl	%eax, 80(%esp)                  # 4-byte Spill
	movl	_il_slot_inTimeR03, %eax
	movl	%esi, 268(%esp)                 # 4-byte Spill
	movl	_il_slot_outConter, %esi
	movl	%eax, 92(%esp)                  # 4-byte Spill
	movl	_il_slot_inTimer05, %eax
	movl	%esi, 280(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_1_CV, %esi
	movl	%eax, 100(%esp)                 # 4-byte Spill
	movl	_il_slot_inTimer06, %eax
	movl	%esi, 4(%esp)                   # 4-byte Spill
	movl	_il_slot_valCounter, %esi
	movl	%eax, 112(%esp)                 # 4-byte Spill
	movl	_il_slot_inTimer07, %eax
	movl	%esi, 264(%esp)                 # 4-byte Spill
	movl	_il_slot_resLD_C, %esi
	movl	%eax, 120(%esp)                 # 4-byte Spill
	movl	_il_slot_resLD, %eax
	movl	%esi, 272(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_3_IN, %esi
	movl	%eax, 176(%esp)                 # 4-byte Spill
	movl	_il_slot_C005, %eax
	movl	%esi, 284(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_3_PT, %esi
	movl	%eax, 172(%esp)                 # 4-byte Spill
	movl	_il_slot_resAND, %eax
	movl	%esi, 276(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_3_Q, %esi
	movl	%eax, 180(%esp)                 # 4-byte Spill
	movl	_il_slot_C010, %eax
	movl	%esi, 296(%esp)                 # 4-byte Spill
	movl	_il_slot_resT5, %esi
	movl	%eax, 184(%esp)                 # 4-byte Spill
	movl	_il_slot_resOR, %eax
	movl	%esi, 292(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_3_ET, %esi
	movl	%eax, 188(%esp)                 # 4-byte Spill
	movl	_il_slot_resOUT, %eax
	movl	%esi, 8(%esp)                   # 4-byte Spill
	movl	_il_slot_passed03, %esi
	movl	%eax, 196(%esp)                 # 4-byte Spill
	movl	_il_slot_C024, %eax
	movl	%esi, 288(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_2_CU, %esi
	movl	%eax, 192(%esp)                 # 4-byte Spill
	movl	_il_slot_resRES, %eax
	movl	%esi, 304(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_2_RESET, %esi
	movl	%eax, 200(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_2_IN, %eax
	movl	%esi, 308(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_2_PV, %esi
	movl	%eax, 48(%esp)                  # 4-byte Spill
	movl	_il_slot_TON_1_PT, %eax
	movl	%esi, 300(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_2__prev_cu, %esi
	movl	%eax, 204(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_1_ET, %eax
	movl	%esi, 56(%esp)                  # 4-byte Spill
	movl	_il_slot_CTU_2_Q, %esi
	movl	%eax, 220(%esp)                 # 4-byte Spill
	movl	160(%esp), %eax                 # 4-byte Reload
	movl	%esi, 320(%esp)                 # 4-byte Spill
	movl	_il_slot_outConter2, %esi
	movl	%esi, 316(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_2_CV, %esi
	movl	%esi, 12(%esp)                  # 4-byte Spill
	movl	_il_slot_valCounter2, %esi
	movl	%esi, 312(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_4_IN, %esi
	movl	%esi, 328(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_4_PT, %esi
	movl	%esi, 324(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_4_Q, %esi
	movl	%esi, 340(%esp)                 # 4-byte Spill
	movl	_il_slot_outTimer, %esi
	movl	%esi, 348(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_4_ET, %esi
	movl	%esi, 16(%esp)                  # 4-byte Spill
	movl	_il_slot_passed04, %esi
	movl	%esi, 336(%esp)                 # 4-byte Spill
	movl	_il_slot_C046, %esi
	movl	%esi, 332(%esp)                 # 4-byte Spill
	movl	_il_slot_resAND_T, %esi
	movl	%esi, 344(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_3_CU, %esi
	movl	%esi, 356(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_3_RESET, %esi
	movl	%esi, 360(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_3_PV, %esi
	movl	%esi, 352(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_3__prev_cu, %esi
	movl	%esi, 60(%esp)                  # 4-byte Spill
	movl	_il_slot_CTU_3_Q, %esi
	movl	%esi, 372(%esp)                 # 4-byte Spill
	movl	_il_slot_outCounter3, %esi
	movl	%esi, 384(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_3_CV, %esi
	movl	%esi, 20(%esp)                  # 4-byte Spill
	movl	_il_slot_valCounter3, %esi
	movl	%esi, 368(%esp)                 # 4-byte Spill
	movl	_il_slot_C052, %esi
	movl	%esi, 364(%esp)                 # 4-byte Spill
	movl	_il_slot_resAND_C, %esi
	movl	%esi, 376(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_5_IN, %esi
	movl	%esi, 388(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_5_PT, %esi
	movl	%esi, 380(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_5_Q, %esi
	movl	%esi, 400(%esp)                 # 4-byte Spill
	movl	_il_slot_outTimer05, %esi
	movl	%esi, 396(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_5_ET, %esi
	movl	%esi, 24(%esp)                  # 4-byte Spill
	movl	_il_slot_passed05, %esi
	movl	%esi, 392(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_4_CU, %esi
	movl	%esi, 408(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_4_RESET, %esi
	movl	%esi, 412(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_4_PV, %esi
	movl	%esi, 404(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_4__prev_cu, %esi
	movl	%esi, 68(%esp)                  # 4-byte Spill
	movl	_il_slot_CTU_4_Q, %esi
	movl	%esi, 424(%esp)                 # 4-byte Spill
	movl	_il_slot_outConter04, %esi
	movl	%esi, 420(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_4_CV, %esi
	movl	%esi, 28(%esp)                  # 4-byte Spill
	movl	_il_slot_valCounter04, %esi
	movl	%esi, 416(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_6_IN, %esi
	movl	%esi, 432(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_6_PT, %esi
	movl	%esi, 428(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_6_Q, %esi
	movl	%esi, 444(%esp)                 # 4-byte Spill
	movl	_il_slot_outTimer06, %esi
	movl	%esi, 452(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_6_ET, %esi
	movl	%esi, 32(%esp)                  # 4-byte Spill
	movl	_il_slot_passed06, %esi
	movl	%esi, 440(%esp)                 # 4-byte Spill
	movl	_il_slot_C065, %esi
	movl	%esi, 436(%esp)                 # 4-byte Spill
	movl	_il_slot_resOR_T, %esi
	movl	%esi, 448(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_5_CU, %esi
	movl	%esi, 460(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_5_RESET, %esi
	movl	%esi, 464(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_5_PV, %esi
	movl	%esi, 456(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_5__prev_cu, %esi
	movl	%esi, 64(%esp)                  # 4-byte Spill
	movl	_il_slot_CTU_5_Q, %esi
	movl	%esi, 476(%esp)                 # 4-byte Spill
	movl	_il_slot_outCounter05, %esi
	movl	%esi, 488(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_5_CV, %esi
	movl	%esi, 36(%esp)                  # 4-byte Spill
	movl	_il_slot_valCounter05, %esi
	movl	%esi, 472(%esp)                 # 4-byte Spill
	movl	_il_slot_C069, %esi
	movl	%esi, 468(%esp)                 # 4-byte Spill
	movl	_il_slot_resOR_C, %esi
	movl	%esi, 480(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_7_IN, %esi
	movl	%esi, 492(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_7_PT, %esi
	movl	%esi, 484(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_7_Q, %esi
	movl	%esi, 504(%esp)                 # 4-byte Spill
	movl	_il_slot_outTimer07, %esi
	movl	%esi, 500(%esp)                 # 4-byte Spill
	movl	_il_slot_TON_7_ET, %esi
	movl	%esi, 40(%esp)                  # 4-byte Spill
	movl	_il_slot_passed07, %esi
	movl	%esi, 496(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_6_CU, %esi
	movl	%esi, 512(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_6_RESET, %esi
	movl	%esi, 516(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_6_PV, %esi
	movl	%esi, 508(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_6__prev_cu, %esi
	movl	%esi, 520(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_6_Q, %esi
	movl	%esi, 532(%esp)                 # 4-byte Spill
	movl	_il_slot_outCounter06, %esi
	movl	%esi, 528(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_6_CV, %esi
	movl	%esi, 44(%esp)                  # 4-byte Spill
	movl	_il_slot_valCounter06, %esi
	movl	%esi, 524(%esp)                 # 4-byte Spill
	movl	_il_slot_C083, %esi
	movl	%esi, 536(%esp)                 # 4-byte Spill
	movl	_il_slot_IL_u5909_u6570_1, %esi
	movl	%esi, 540(%esp)                 # 4-byte Spill
	movl	_il_slot_C085, %esi
	movl	%esi, 544(%esp)                 # 4-byte Spill
	movl	_il_slot_resANL, %esi
	movl	%esi, 548(%esp)                 # 4-byte Spill
	movl	_il_slot_IL_u5909_u6570_2, %esi
	movl	%esi, 556(%esp)                 # 4-byte Spill
	movl	_il_slot_C089, %esi
	movl	%esi, 552(%esp)                 # 4-byte Spill
	movl	_il_slot_C091, %esi
	movl	%esi, 560(%esp)                 # 4-byte Spill
	movl	_il_slot_resORL, %esi
	movl	%esi, 564(%esp)                 # 4-byte Spill
	movl	_il_slot_setten0101, %esi
	movl	%esi, 672(%esp)                 # 4-byte Spill
	movl	_il_slot_setten0102, %esi
	movl	%esi, 568(%esp)                 # 4-byte Spill
	movl	_il_slot_IL_u5909_u6570_3, %esi
	movl	%esi, 644(%esp)                 # 4-byte Spill
	movl	_il_slot_setten0103, %esi
	movl	%esi, 572(%esp)                 # 4-byte Spill
	movl	_il_slot_IL_u5909_u6570_4, %esi
	movl	%esi, 600(%esp)                 # 4-byte Spill
	movl	_il_slot_setten0104, %esi
	movl	%esi, 580(%esp)                 # 4-byte Spill
	movl	_il_slot_resCoil01, %esi
	movl	%esi, 576(%esp)                 # 4-byte Spill
	movl	_il_slot_setten0204, %esi
	movl	%esi, 584(%esp)                 # 4-byte Spill
	movl	_il_slot_resCoil02, %esi
	movl	%esi, 588(%esp)                 # 4-byte Spill
	movl	_il_slot_setten0304, %esi
	movl	%esi, 592(%esp)                 # 4-byte Spill
	movl	_il_slot_resCoil03, %esi
	movl	%esi, 596(%esp)                 # 4-byte Spill
	movl	_il_slot_setten0403, %esi
	movl	%esi, 604(%esp)                 # 4-byte Spill
	movl	_il_slot_resCoil04, %esi
	movl	%esi, 608(%esp)                 # 4-byte Spill
	movl	_il_slot_setten0503, %esi
	movl	%esi, 612(%esp)                 # 4-byte Spill
	movl	_il_slot_resCoil05, %esi
	movl	%esi, 616(%esp)                 # 4-byte Spill
	movl	_il_slot_setten0603, %esi
	movl	%esi, 620(%esp)                 # 4-byte Spill
	movl	_il_slot_resCoil06, %esi
	movl	%esi, 624(%esp)                 # 4-byte Spill
	movl	_il_slot_setten0702, %esi
	movl	%esi, 628(%esp)                 # 4-byte Spill
	movl	_il_slot_resCoil07, %esi
	movl	%esi, 632(%esp)                 # 4-byte Spill
	movl	_il_slot_setten0802, %esi
	movl	%esi, 636(%esp)                 # 4-byte Spill
	movl	_il_slot_resCoil08, %esi
	movl	%esi, 640(%esp)                 # 4-byte Spill
	movl	_il_slot_setten0902, %esi
	movl	%esi, 648(%esp)                 # 4-byte Spill
	movl	_il_slot_resCoil09, %esi
	movl	%esi, 652(%esp)                 # 4-byte Spill
	movl	_il_slot_resBia01, %esi
	movl	%esi, 668(%esp)                 # 4-byte Spill
	movl	_il_slot_resBia02, %esi
	movl	%esi, 660(%esp)                 # 4-byte Spill
	movl	_il_slot_IL_u5909_u6570_5, %esi
	movl	%esi, 664(%esp)                 # 4-byte Spill
	movl	_il_slot_resBia03, %esi
	movl	%esi, 676(%esp)                 # 4-byte Spill
	movl	_il_slot_resCLR01, %esi
	movl	%esi, 680(%esp)                 # 4-byte Spill
	movl	_il_slot_resCLR02, %esi
	movl	%esi, 684(%esp)                 # 4-byte Spill
	movl	_il_slot_resCLR03, %esi
	movl	%esi, 688(%esp)                 # 4-byte Spill
	movl	_il_slot_resCLR04, %esi
	movl	%esi, 692(%esp)                 # 4-byte Spill
	movl	_il_slot_R_TRIG_1_CLK, %esi
	movl	%esi, 696(%esp)                 # 4-byte Spill
	movl	_il_slot_R_TRIG_1__prev_clk, %esi
	movl	%esi, 704(%esp)                 # 4-byte Spill
	movl	_il_slot_R_TRIG_1_Q, %esi
	movl	%esi, 700(%esp)                 # 4-byte Spill
	movl	_il_slot_outDIFU, %esi
	movl	%esi, 712(%esp)                 # 4-byte Spill
	movl	_il_slot_holdDIFU, %esi
	movl	%esi, 708(%esp)                 # 4-byte Spill
	movl	_il_slot_resDIFU, %esi
	movl	%esi, 716(%esp)                 # 4-byte Spill
	movl	_il_slot_F_TRIG_1_CLK, %esi
	movl	%esi, 720(%esp)                 # 4-byte Spill
	movl	_il_slot_F_TRIG_1__prev_clk, %esi
	movl	%esi, 728(%esp)                 # 4-byte Spill
	movl	_il_slot_F_TRIG_1_Q, %esi
	movl	%esi, 724(%esp)                 # 4-byte Spill
	movl	_il_slot_outDIFD, %esi
	movl	%esi, 736(%esp)                 # 4-byte Spill
	movl	_il_slot_holdDIFD, %esi
	movl	%esi, 732(%esp)                 # 4-byte Spill
	movl	_il_slot_resDIFD, %esi
	movl	%esi, 740(%esp)                 # 4-byte Spill
	movl	_il_slot_ECAT_Slave5_DO1, %esi
	movl	%esi, 760(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_7_CU, %esi
	movl	%esi, 768(%esp)                 # 4-byte Spill
	movl	_il_slot_CT_Reset, %esi
	movl	%esi, 788(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_7_RESET, %esi
	movl	%esi, 764(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_7_PV, %esi
	movl	%esi, 756(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_7__prev_cu, %esi
	movl	%esi, 772(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_7_Q, %esi
	movl	%esi, 776(%esp)                 # 4-byte Spill
	movl	_il_slot_CTU_7_CV, %esi
	movl	%esi, 784(%esp)                 # 4-byte Spill
	movl	_il_slot_ECAT_Slave4_AO1, %esi
	movl	%esi, 780(%esp)                 # 4-byte Spill
	movl	88(%esp), %esi                  # 4-byte Reload
	movb	%bl, (%esi)
	movb	%bl, (%eax)
	movl	156(%esp), %eax                 # 4-byte Reload
	movb	%bl, (%eax)
	movl	148(%esp), %eax                 # 4-byte Reload
	movb	%bl, (%eax)
	movl	164(%esp), %eax                 # 4-byte Reload
	movb	%bl, (%eax)
	movl	168(%esp), %eax                 # 4-byte Reload
	movb	%bl, (%eax)
	movl	128(%esp), %eax                 # 4-byte Reload
	movb	%bl, (%eax)
	movl	132(%esp), %eax                 # 4-byte Reload
	movb	%bl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movb	%bl, (%eax)
	movl	144(%esp), %eax                 # 4-byte Reload
	movb	%bl, (%eax)
	movl	104(%esp), %eax                 # 4-byte Reload
	movb	%bl, (%edi)
	movl	220(%esp), %edi                 # 4-byte Reload
	movb	%bl, (%eax)
	movl	76(%esp), %eax                  # 4-byte Reload
	movb	%bl, (%edx)
	movl	176(%esp), %edx                 # 4-byte Reload
	movb	%bl, (%eax)
	movl	84(%esp), %eax                  # 4-byte Reload
	movb	%bl, (%eax)
	movl	96(%esp), %eax                  # 4-byte Reload
	movb	%bl, (%eax)
	movl	108(%esp), %eax                 # 4-byte Reload
	movb	%bl, (%eax)
	movl	116(%esp), %eax                 # 4-byte Reload
	movb	%bl, (%eax)
	movl	124(%esp), %eax                 # 4-byte Reload
	movb	%bl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movb	%bl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movb	%bl, (%eax)
	movl	80(%esp), %eax                  # 4-byte Reload
	movb	%bl, (%ecx)
	movb	%bl, (%eax)
	movl	92(%esp), %eax                  # 4-byte Reload
	movb	%bl, (%eax)
	movl	100(%esp), %eax                 # 4-byte Reload
	movb	%bl, (%eax)
	movl	112(%esp), %eax                 # 4-byte Reload
	movb	%bl, (%eax)
	movl	120(%esp), %eax                 # 4-byte Reload
	movb	%bl, (%eax)
	xorl	%ebx, %ebx
	movzbl	(%esi), %eax
	movb	%al, (%edx)
	movl	172(%esp), %edx                 # 4-byte Reload
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	184(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%edx), %al
	movl	188(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	196(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%edx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%edx)
	movl	$0, %edx
	movzbl	(%ecx), %eax
	movl	48(%esp), %ecx                  # 4-byte Reload
	movb	%al, (%ebp)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%ebp)
	jne	LBB5_2
# %bb.1:                                # %ton_in_true.i
	movl	(%edi), %edx
	movl	$30000, %eax                    # imm = 0x7530
	incl	%edx
	cmpl	$30000, %edx                    # imm = 0x7530
	cmovll	%edx, %eax
	setge	%dl
LBB5_2:                                 # %ton_step.exit
	movl	%eax, (%edi)
	movl	224(%esp), %eax                 # 4-byte Reload
	movl	260(%esp), %ecx                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%ecx)
	movl	216(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movb	%al, (%edx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	72(%esp), %edx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_4
# %bb.3:                                # %ton_in_true.i653
	movl	(%esp), %edx                    # 4-byte Reload
	movl	72(%esp), %eax                  # 4-byte Reload
	movl	(%edx), %ebx
	movl	(%eax), %eax
	incl	%ebx
	cmpl	%eax, %ebx
	cmovgel	%eax, %ebx
	setge	%al
LBB5_4:                                 # %ton_step.exit659
	movl	(%esp), %esi                    # 4-byte Reload
	movl	232(%esp), %edx                 # 4-byte Reload
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	248(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	228(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	252(%esp), %esi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	236(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%ecx)
	movl	240(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	256(%esp), %edx                 # 4-byte Reload
	movb	%al, (%ecx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_6
# %bb.5:                                # %ton_step.exit659
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_6:                                 # %ton_step.exit659
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_8
# %bb.7:                                # %ton_in_true.i664
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_8:                                 # %ton_step.exit670
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_10
# %bb.9:                                # %ton_step.exit670
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_10:                                # %ton_step.exit670
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_12
# %bb.11:                               # %ton_in_true.i685
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_12:                                # %ton_step.exit691
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_14
# %bb.13:                               # %ton_step.exit691
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_14:                                # %ton_step.exit691
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_16
# %bb.15:                               # %ton_in_true.i706
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_16:                                # %ton_step.exit712
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	520(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%ebp), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	jne	LBB5_18
# %bb.17:                               # %ton_step.exit712
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_18:                                # %ton_step.exit712
	notb	%ah
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_20
# %bb.19:                               # %ton_in_true.i727
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_20:                                # %ton_step.exit733
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_22
# %bb.21:                               # %ton_step.exit733
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_22:                                # %ton_step.exit733
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_24
# %bb.23:                               # %ton_in_true.i748
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_24:                                # %ton_step.exit754
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_26
# %bb.25:                               # %ton_step.exit754
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_26:                                # %ton_step.exit754
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_28
# %bb.27:                               # %ton_in_true.i773
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_28:                                # %ton_step.exit779
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_30
# %bb.29:                               # %ton_in_true.i783
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_30:                                # %ton_step.exit789
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_32
# %bb.31:                               # %ton_step.exit789
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_32:                                # %ton_step.exit789
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_34
# %bb.33:                               # %ton_in_true.i804
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_34:                                # %ton_step.exit810
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_36
# %bb.35:                               # %ton_step.exit810
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_36:                                # %ton_step.exit810
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_38
# %bb.37:                               # %ton_in_true.i825
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_38:                                # %ton_step.exit831
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_40
# %bb.39:                               # %ton_step.exit831
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_40:                                # %ton_step.exit831
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_42
# %bb.41:                               # %ton_in_true.i846
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_42:                                # %ton_step.exit852
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_44
# %bb.43:                               # %ton_step.exit852
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_44:                                # %ton_step.exit852
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_46
# %bb.45:                               # %ton_in_true.i867
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_46:                                # %ton_step.exit873
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_48
# %bb.47:                               # %ton_step.exit873
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_48:                                # %ton_step.exit873
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_50
# %bb.49:                               # %ton_in_true.i888
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_50:                                # %ton_step.exit894
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_52
# %bb.51:                               # %ton_step.exit894
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_52:                                # %ton_step.exit894
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_54
# %bb.53:                               # %ton_in_true.i917
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_54:                                # %ton_step.exit923
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_56
# %bb.55:                               # %ton_in_true.i927
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_56:                                # %ton_step.exit933
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_58
# %bb.57:                               # %ton_step.exit933
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_58:                                # %ton_step.exit933
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_60
# %bb.59:                               # %ton_in_true.i948
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_60:                                # %ton_step.exit954
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_62
# %bb.61:                               # %ton_step.exit954
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_62:                                # %ton_step.exit954
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_64
# %bb.63:                               # %ton_in_true.i969
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_64:                                # %ton_step.exit975
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_66
# %bb.65:                               # %ton_step.exit975
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_66:                                # %ton_step.exit975
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_68
# %bb.67:                               # %ton_in_true.i990
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_68:                                # %ton_step.exit996
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_70
# %bb.69:                               # %ton_step.exit996
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_70:                                # %ton_step.exit996
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_72
# %bb.71:                               # %ton_in_true.i1011
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_72:                                # %ton_step.exit1017
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_74
# %bb.73:                               # %ton_step.exit1017
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_74:                                # %ton_step.exit1017
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_76
# %bb.75:                               # %ton_in_true.i1032
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_76:                                # %ton_step.exit1038
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_78
# %bb.77:                               # %ton_step.exit1038
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_78:                                # %ton_step.exit1038
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_80
# %bb.79:                               # %ton_in_true.i1061
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_80:                                # %ton_step.exit1067
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_82
# %bb.81:                               # %ton_in_true.i1071
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_82:                                # %ton_step.exit1077
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_84
# %bb.83:                               # %ton_step.exit1077
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_84:                                # %ton_step.exit1077
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_86
# %bb.85:                               # %ton_in_true.i1092
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_86:                                # %ton_step.exit1098
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_88
# %bb.87:                               # %ton_step.exit1098
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_88:                                # %ton_step.exit1098
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_90
# %bb.89:                               # %ton_in_true.i1113
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_90:                                # %ton_step.exit1119
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_92
# %bb.91:                               # %ton_step.exit1119
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_92:                                # %ton_step.exit1119
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_94
# %bb.93:                               # %ton_in_true.i1134
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_94:                                # %ton_step.exit1140
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_96
# %bb.95:                               # %ton_step.exit1140
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_96:                                # %ton_step.exit1140
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_98
# %bb.97:                               # %ton_in_true.i1155
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_98:                                # %ton_step.exit1161
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_100
# %bb.99:                               # %ton_step.exit1161
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_100:                               # %ton_step.exit1161
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_102
# %bb.101:                              # %ton_in_true.i1176
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_102:                               # %ton_step.exit1182
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_104
# %bb.103:                              # %ton_step.exit1182
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_104:                               # %ton_step.exit1182
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_106
# %bb.105:                              # %ton_in_true.i1205
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_106:                               # %ton_step.exit1211
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_108
# %bb.107:                              # %ton_in_true.i1215
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_108:                               # %ton_step.exit1221
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_110
# %bb.109:                              # %ton_step.exit1221
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_110:                               # %ton_step.exit1221
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_112
# %bb.111:                              # %ton_in_true.i1236
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_112:                               # %ton_step.exit1242
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_114
# %bb.113:                              # %ton_step.exit1242
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_114:                               # %ton_step.exit1242
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_116
# %bb.115:                              # %ton_in_true.i1257
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_116:                               # %ton_step.exit1263
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_118
# %bb.117:                              # %ton_step.exit1263
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_118:                               # %ton_step.exit1263
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_120
# %bb.119:                              # %ton_in_true.i1278
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_120:                               # %ton_step.exit1284
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_122
# %bb.121:                              # %ton_step.exit1284
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_122:                               # %ton_step.exit1284
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_124
# %bb.123:                              # %ton_in_true.i1299
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_124:                               # %ton_step.exit1305
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_126
# %bb.125:                              # %ton_step.exit1305
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_126:                               # %ton_step.exit1305
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_128
# %bb.127:                              # %ton_in_true.i1320
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_128:                               # %ton_step.exit1326
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_130
# %bb.129:                              # %ton_step.exit1326
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_130:                               # %ton_step.exit1326
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_132
# %bb.131:                              # %ton_in_true.i1349
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_132:                               # %ton_step.exit1355
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_134
# %bb.133:                              # %ton_in_true.i1359
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_134:                               # %ton_step.exit1365
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_136
# %bb.135:                              # %ton_step.exit1365
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_136:                               # %ton_step.exit1365
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_138
# %bb.137:                              # %ton_in_true.i1380
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_138:                               # %ton_step.exit1386
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_140
# %bb.139:                              # %ton_step.exit1386
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_140:                               # %ton_step.exit1386
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_142
# %bb.141:                              # %ton_in_true.i1401
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_142:                               # %ton_step.exit1407
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_144
# %bb.143:                              # %ton_step.exit1407
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_144:                               # %ton_step.exit1407
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_146
# %bb.145:                              # %ton_in_true.i1422
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_146:                               # %ton_step.exit1428
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_148
# %bb.147:                              # %ton_step.exit1428
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_148:                               # %ton_step.exit1428
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_150
# %bb.149:                              # %ton_in_true.i1443
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_150:                               # %ton_step.exit1449
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_152
# %bb.151:                              # %ton_step.exit1449
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_152:                               # %ton_step.exit1449
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_154
# %bb.153:                              # %ton_in_true.i1464
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_154:                               # %ton_step.exit1470
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_156
# %bb.155:                              # %ton_step.exit1470
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_156:                               # %ton_step.exit1470
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_158
# %bb.157:                              # %ton_in_true.i1493
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_158:                               # %ton_step.exit1499
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_160
# %bb.159:                              # %ton_in_true.i1503
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_160:                               # %ton_step.exit1509
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_162
# %bb.161:                              # %ton_step.exit1509
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_162:                               # %ton_step.exit1509
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_164
# %bb.163:                              # %ton_in_true.i1524
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_164:                               # %ton_step.exit1530
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_166
# %bb.165:                              # %ton_step.exit1530
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_166:                               # %ton_step.exit1530
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_168
# %bb.167:                              # %ton_in_true.i1545
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_168:                               # %ton_step.exit1551
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_170
# %bb.169:                              # %ton_step.exit1551
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_170:                               # %ton_step.exit1551
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_172
# %bb.171:                              # %ton_in_true.i1566
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_172:                               # %ton_step.exit1572
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_174
# %bb.173:                              # %ton_step.exit1572
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_174:                               # %ton_step.exit1572
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_176
# %bb.175:                              # %ton_in_true.i1587
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_176:                               # %ton_step.exit1593
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_178
# %bb.177:                              # %ton_step.exit1593
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_178:                               # %ton_step.exit1593
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_180
# %bb.179:                              # %ton_in_true.i1608
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_180:                               # %ton_step.exit1614
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_182
# %bb.181:                              # %ton_step.exit1614
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_182:                               # %ton_step.exit1614
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_184
# %bb.183:                              # %ton_in_true.i1637
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_184:                               # %ton_step.exit1643
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_186
# %bb.185:                              # %ton_in_true.i1647
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_186:                               # %ton_step.exit1653
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_188
# %bb.187:                              # %ton_step.exit1653
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_188:                               # %ton_step.exit1653
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_190
# %bb.189:                              # %ton_in_true.i1668
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_190:                               # %ton_step.exit1674
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_192
# %bb.191:                              # %ton_step.exit1674
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_192:                               # %ton_step.exit1674
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_194
# %bb.193:                              # %ton_in_true.i1689
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_194:                               # %ton_step.exit1695
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_196
# %bb.195:                              # %ton_step.exit1695
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_196:                               # %ton_step.exit1695
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_198
# %bb.197:                              # %ton_in_true.i1710
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_198:                               # %ton_step.exit1716
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_200
# %bb.199:                              # %ton_step.exit1716
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_200:                               # %ton_step.exit1716
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_202
# %bb.201:                              # %ton_in_true.i1731
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_202:                               # %ton_step.exit1737
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_204
# %bb.203:                              # %ton_step.exit1737
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_204:                               # %ton_step.exit1737
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_206
# %bb.205:                              # %ton_in_true.i1752
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_206:                               # %ton_step.exit1758
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_208
# %bb.207:                              # %ton_step.exit1758
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_208:                               # %ton_step.exit1758
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_210
# %bb.209:                              # %ton_in_true.i1781
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_210:                               # %ton_step.exit1787
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_212
# %bb.211:                              # %ton_in_true.i1791
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_212:                               # %ton_step.exit1797
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_214
# %bb.213:                              # %ton_step.exit1797
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_214:                               # %ton_step.exit1797
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_216
# %bb.215:                              # %ton_in_true.i1812
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_216:                               # %ton_step.exit1818
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_218
# %bb.217:                              # %ton_step.exit1818
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_218:                               # %ton_step.exit1818
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_220
# %bb.219:                              # %ton_in_true.i1833
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_220:                               # %ton_step.exit1839
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_222
# %bb.221:                              # %ton_step.exit1839
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_222:                               # %ton_step.exit1839
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_224
# %bb.223:                              # %ton_in_true.i1854
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_224:                               # %ton_step.exit1860
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_226
# %bb.225:                              # %ton_step.exit1860
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_226:                               # %ton_step.exit1860
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_228
# %bb.227:                              # %ton_in_true.i1875
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_228:                               # %ton_step.exit1881
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_230
# %bb.229:                              # %ton_step.exit1881
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_230:                               # %ton_step.exit1881
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_232
# %bb.231:                              # %ton_in_true.i1896
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_232:                               # %ton_step.exit1902
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_234
# %bb.233:                              # %ton_step.exit1902
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_234:                               # %ton_step.exit1902
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_236
# %bb.235:                              # %ton_in_true.i1925
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_236:                               # %ton_step.exit1931
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_238
# %bb.237:                              # %ton_in_true.i1935
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_238:                               # %ton_step.exit1941
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_240
# %bb.239:                              # %ton_step.exit1941
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_240:                               # %ton_step.exit1941
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_242
# %bb.241:                              # %ton_in_true.i1956
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_242:                               # %ton_step.exit1962
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_244
# %bb.243:                              # %ton_step.exit1962
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_244:                               # %ton_step.exit1962
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_246
# %bb.245:                              # %ton_in_true.i1977
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_246:                               # %ton_step.exit1983
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_248
# %bb.247:                              # %ton_step.exit1983
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_248:                               # %ton_step.exit1983
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_250
# %bb.249:                              # %ton_in_true.i1998
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_250:                               # %ton_step.exit2004
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_252
# %bb.251:                              # %ton_step.exit2004
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_252:                               # %ton_step.exit2004
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_254
# %bb.253:                              # %ton_in_true.i2019
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_254:                               # %ton_step.exit2025
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_256
# %bb.255:                              # %ton_step.exit2025
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_256:                               # %ton_step.exit2025
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_258
# %bb.257:                              # %ton_in_true.i2040
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_258:                               # %ton_step.exit2046
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_260
# %bb.259:                              # %ton_step.exit2046
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_260:                               # %ton_step.exit2046
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_262
# %bb.261:                              # %ton_in_true.i2069
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_262:                               # %ton_step.exit2075
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_264
# %bb.263:                              # %ton_in_true.i2079
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_264:                               # %ton_step.exit2085
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_266
# %bb.265:                              # %ton_step.exit2085
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_266:                               # %ton_step.exit2085
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_268
# %bb.267:                              # %ton_in_true.i2100
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_268:                               # %ton_step.exit2106
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_270
# %bb.269:                              # %ton_step.exit2106
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_270:                               # %ton_step.exit2106
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_272
# %bb.271:                              # %ton_in_true.i2121
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_272:                               # %ton_step.exit2127
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_274
# %bb.273:                              # %ton_step.exit2127
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_274:                               # %ton_step.exit2127
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_276
# %bb.275:                              # %ton_in_true.i2142
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_276:                               # %ton_step.exit2148
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_278
# %bb.277:                              # %ton_step.exit2148
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_278:                               # %ton_step.exit2148
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_280
# %bb.279:                              # %ton_in_true.i2163
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_280:                               # %ton_step.exit2169
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_282
# %bb.281:                              # %ton_step.exit2169
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_282:                               # %ton_step.exit2169
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_284
# %bb.283:                              # %ton_in_true.i2184
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_284:                               # %ton_step.exit2190
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_286
# %bb.285:                              # %ton_step.exit2190
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_286:                               # %ton_step.exit2190
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_288
# %bb.287:                              # %ton_in_true.i2213
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_288:                               # %ton_step.exit2219
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_290
# %bb.289:                              # %ton_in_true.i2223
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_290:                               # %ton_step.exit2229
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_292
# %bb.291:                              # %ton_step.exit2229
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_292:                               # %ton_step.exit2229
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_294
# %bb.293:                              # %ton_in_true.i2244
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_294:                               # %ton_step.exit2250
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_296
# %bb.295:                              # %ton_step.exit2250
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_296:                               # %ton_step.exit2250
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_298
# %bb.297:                              # %ton_in_true.i2265
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_298:                               # %ton_step.exit2271
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_300
# %bb.299:                              # %ton_step.exit2271
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_300:                               # %ton_step.exit2271
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_302
# %bb.301:                              # %ton_in_true.i2286
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_302:                               # %ton_step.exit2292
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_304
# %bb.303:                              # %ton_step.exit2292
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_304:                               # %ton_step.exit2292
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_306
# %bb.305:                              # %ton_in_true.i2307
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_306:                               # %ton_step.exit2313
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_308
# %bb.307:                              # %ton_step.exit2313
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_308:                               # %ton_step.exit2313
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_310
# %bb.309:                              # %ton_in_true.i2328
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_310:                               # %ton_step.exit2334
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_312
# %bb.311:                              # %ton_step.exit2334
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_312:                               # %ton_step.exit2334
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_314
# %bb.313:                              # %ton_in_true.i2357
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_314:                               # %ton_step.exit2363
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_316
# %bb.315:                              # %ton_in_true.i2367
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_316:                               # %ton_step.exit2373
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_318
# %bb.317:                              # %ton_step.exit2373
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_318:                               # %ton_step.exit2373
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_320
# %bb.319:                              # %ton_in_true.i2388
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_320:                               # %ton_step.exit2394
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_322
# %bb.321:                              # %ton_step.exit2394
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_322:                               # %ton_step.exit2394
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_324
# %bb.323:                              # %ton_in_true.i2409
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_324:                               # %ton_step.exit2415
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_326
# %bb.325:                              # %ton_step.exit2415
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_326:                               # %ton_step.exit2415
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_328
# %bb.327:                              # %ton_in_true.i2430
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_328:                               # %ton_step.exit2436
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_330
# %bb.329:                              # %ton_step.exit2436
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_330:                               # %ton_step.exit2436
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_332
# %bb.331:                              # %ton_in_true.i2451
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_332:                               # %ton_step.exit2457
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_334
# %bb.333:                              # %ton_step.exit2457
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_334:                               # %ton_step.exit2457
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_336
# %bb.335:                              # %ton_in_true.i2472
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_336:                               # %ton_step.exit2478
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_338
# %bb.337:                              # %ton_step.exit2478
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_338:                               # %ton_step.exit2478
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_340
# %bb.339:                              # %ton_in_true.i2501
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_340:                               # %ton_step.exit2507
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_342
# %bb.341:                              # %ton_in_true.i2511
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_342:                               # %ton_step.exit2517
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_344
# %bb.343:                              # %ton_step.exit2517
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_344:                               # %ton_step.exit2517
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_346
# %bb.345:                              # %ton_in_true.i2532
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_346:                               # %ton_step.exit2538
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_348
# %bb.347:                              # %ton_step.exit2538
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_348:                               # %ton_step.exit2538
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_350
# %bb.349:                              # %ton_in_true.i2553
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_350:                               # %ton_step.exit2559
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_352
# %bb.351:                              # %ton_step.exit2559
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_352:                               # %ton_step.exit2559
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_354
# %bb.353:                              # %ton_in_true.i2574
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_354:                               # %ton_step.exit2580
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_356
# %bb.355:                              # %ton_step.exit2580
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_356:                               # %ton_step.exit2580
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_358
# %bb.357:                              # %ton_in_true.i2595
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_358:                               # %ton_step.exit2601
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_360
# %bb.359:                              # %ton_step.exit2601
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_360:                               # %ton_step.exit2601
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_362
# %bb.361:                              # %ton_in_true.i2616
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_362:                               # %ton_step.exit2622
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_364
# %bb.363:                              # %ton_step.exit2622
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_364:                               # %ton_step.exit2622
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_366
# %bb.365:                              # %ton_in_true.i2645
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_366:                               # %ton_step.exit2651
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_368
# %bb.367:                              # %ton_in_true.i2655
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_368:                               # %ton_step.exit2661
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_370
# %bb.369:                              # %ton_step.exit2661
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_370:                               # %ton_step.exit2661
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_372
# %bb.371:                              # %ton_in_true.i2676
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_372:                               # %ton_step.exit2682
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_374
# %bb.373:                              # %ton_step.exit2682
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_374:                               # %ton_step.exit2682
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_376
# %bb.375:                              # %ton_in_true.i2697
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_376:                               # %ton_step.exit2703
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_378
# %bb.377:                              # %ton_step.exit2703
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_378:                               # %ton_step.exit2703
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_380
# %bb.379:                              # %ton_in_true.i2718
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_380:                               # %ton_step.exit2724
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_382
# %bb.381:                              # %ton_step.exit2724
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_382:                               # %ton_step.exit2724
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_384
# %bb.383:                              # %ton_in_true.i2739
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_384:                               # %ton_step.exit2745
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_386
# %bb.385:                              # %ton_step.exit2745
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_386:                               # %ton_step.exit2745
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_388
# %bb.387:                              # %ton_in_true.i2760
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_388:                               # %ton_step.exit2766
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_390
# %bb.389:                              # %ton_step.exit2766
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_390:                               # %ton_step.exit2766
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_392
# %bb.391:                              # %ton_in_true.i2789
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_392:                               # %ton_step.exit2795
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_394
# %bb.393:                              # %ton_in_true.i2799
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_394:                               # %ton_step.exit2805
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_396
# %bb.395:                              # %ton_step.exit2805
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_396:                               # %ton_step.exit2805
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_398
# %bb.397:                              # %ton_in_true.i2820
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_398:                               # %ton_step.exit2826
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_400
# %bb.399:                              # %ton_step.exit2826
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_400:                               # %ton_step.exit2826
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_402
# %bb.401:                              # %ton_in_true.i2841
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_402:                               # %ton_step.exit2847
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_404
# %bb.403:                              # %ton_step.exit2847
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_404:                               # %ton_step.exit2847
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_406
# %bb.405:                              # %ton_in_true.i2862
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_406:                               # %ton_step.exit2868
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_408
# %bb.407:                              # %ton_step.exit2868
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_408:                               # %ton_step.exit2868
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_410
# %bb.409:                              # %ton_in_true.i2883
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_410:                               # %ton_step.exit2889
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_412
# %bb.411:                              # %ton_step.exit2889
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_412:                               # %ton_step.exit2889
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_414
# %bb.413:                              # %ton_in_true.i2904
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_414:                               # %ton_step.exit2910
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_416
# %bb.415:                              # %ton_step.exit2910
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_416:                               # %ton_step.exit2910
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_418
# %bb.417:                              # %ton_in_true.i2933
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_418:                               # %ton_step.exit2939
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_420
# %bb.419:                              # %ton_in_true.i2943
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_420:                               # %ton_step.exit2949
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_422
# %bb.421:                              # %ton_step.exit2949
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_422:                               # %ton_step.exit2949
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_424
# %bb.423:                              # %ton_in_true.i2964
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_424:                               # %ton_step.exit2970
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_426
# %bb.425:                              # %ton_step.exit2970
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_426:                               # %ton_step.exit2970
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_428
# %bb.427:                              # %ton_in_true.i2985
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_428:                               # %ton_step.exit2991
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_430
# %bb.429:                              # %ton_step.exit2991
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_430:                               # %ton_step.exit2991
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_432
# %bb.431:                              # %ton_in_true.i3006
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_432:                               # %ton_step.exit3012
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_434
# %bb.433:                              # %ton_step.exit3012
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_434:                               # %ton_step.exit3012
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_436
# %bb.435:                              # %ton_in_true.i3027
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_436:                               # %ton_step.exit3033
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_438
# %bb.437:                              # %ton_step.exit3033
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_438:                               # %ton_step.exit3033
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_440
# %bb.439:                              # %ton_in_true.i3048
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_440:                               # %ton_step.exit3054
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_442
# %bb.441:                              # %ton_step.exit3054
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_442:                               # %ton_step.exit3054
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_444
# %bb.443:                              # %ton_in_true.i3077
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_444:                               # %ton_step.exit3083
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_446
# %bb.445:                              # %ton_in_true.i3087
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_446:                               # %ton_step.exit3093
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_448
# %bb.447:                              # %ton_step.exit3093
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_448:                               # %ton_step.exit3093
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_450
# %bb.449:                              # %ton_in_true.i3108
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_450:                               # %ton_step.exit3114
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_452
# %bb.451:                              # %ton_step.exit3114
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_452:                               # %ton_step.exit3114
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_454
# %bb.453:                              # %ton_in_true.i3129
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_454:                               # %ton_step.exit3135
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_456
# %bb.455:                              # %ton_step.exit3135
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_456:                               # %ton_step.exit3135
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_458
# %bb.457:                              # %ton_in_true.i3150
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_458:                               # %ton_step.exit3156
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_460
# %bb.459:                              # %ton_step.exit3156
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_460:                               # %ton_step.exit3156
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_462
# %bb.461:                              # %ton_in_true.i3171
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_462:                               # %ton_step.exit3177
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_464
# %bb.463:                              # %ton_step.exit3177
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_464:                               # %ton_step.exit3177
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_466
# %bb.465:                              # %ton_in_true.i3192
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_466:                               # %ton_step.exit3198
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_468
# %bb.467:                              # %ton_step.exit3198
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_468:                               # %ton_step.exit3198
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_470
# %bb.469:                              # %ton_in_true.i3221
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_470:                               # %ton_step.exit3227
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_472
# %bb.471:                              # %ton_in_true.i3231
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_472:                               # %ton_step.exit3237
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_474
# %bb.473:                              # %ton_step.exit3237
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_474:                               # %ton_step.exit3237
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_476
# %bb.475:                              # %ton_in_true.i3252
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_476:                               # %ton_step.exit3258
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_478
# %bb.477:                              # %ton_step.exit3258
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_478:                               # %ton_step.exit3258
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_480
# %bb.479:                              # %ton_in_true.i3273
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_480:                               # %ton_step.exit3279
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_482
# %bb.481:                              # %ton_step.exit3279
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_482:                               # %ton_step.exit3279
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_484
# %bb.483:                              # %ton_in_true.i3294
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_484:                               # %ton_step.exit3300
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_486
# %bb.485:                              # %ton_step.exit3300
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_486:                               # %ton_step.exit3300
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_488
# %bb.487:                              # %ton_in_true.i3315
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_488:                               # %ton_step.exit3321
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_490
# %bb.489:                              # %ton_step.exit3321
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_490:                               # %ton_step.exit3321
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_492
# %bb.491:                              # %ton_in_true.i3336
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_492:                               # %ton_step.exit3342
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_494
# %bb.493:                              # %ton_step.exit3342
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_494:                               # %ton_step.exit3342
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_496
# %bb.495:                              # %ton_in_true.i3365
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_496:                               # %ton_step.exit3371
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_498
# %bb.497:                              # %ton_in_true.i3375
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_498:                               # %ton_step.exit3381
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_500
# %bb.499:                              # %ton_step.exit3381
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_500:                               # %ton_step.exit3381
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_502
# %bb.501:                              # %ton_in_true.i3396
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_502:                               # %ton_step.exit3402
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_504
# %bb.503:                              # %ton_step.exit3402
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_504:                               # %ton_step.exit3402
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_506
# %bb.505:                              # %ton_in_true.i3417
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_506:                               # %ton_step.exit3423
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_508
# %bb.507:                              # %ton_step.exit3423
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_508:                               # %ton_step.exit3423
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_510
# %bb.509:                              # %ton_in_true.i3438
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_510:                               # %ton_step.exit3444
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_512
# %bb.511:                              # %ton_step.exit3444
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_512:                               # %ton_step.exit3444
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_514
# %bb.513:                              # %ton_in_true.i3459
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_514:                               # %ton_step.exit3465
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_516
# %bb.515:                              # %ton_step.exit3465
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_516:                               # %ton_step.exit3465
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_518
# %bb.517:                              # %ton_in_true.i3480
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_518:                               # %ton_step.exit3486
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_520
# %bb.519:                              # %ton_step.exit3486
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_520:                               # %ton_step.exit3486
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_522
# %bb.521:                              # %ton_in_true.i3509
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_522:                               # %ton_step.exit3515
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_524
# %bb.523:                              # %ton_in_true.i3519
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_524:                               # %ton_step.exit3525
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_526
# %bb.525:                              # %ton_step.exit3525
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_526:                               # %ton_step.exit3525
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_528
# %bb.527:                              # %ton_in_true.i3540
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_528:                               # %ton_step.exit3546
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_530
# %bb.529:                              # %ton_step.exit3546
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_530:                               # %ton_step.exit3546
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_532
# %bb.531:                              # %ton_in_true.i3561
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_532:                               # %ton_step.exit3567
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_534
# %bb.533:                              # %ton_step.exit3567
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_534:                               # %ton_step.exit3567
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_536
# %bb.535:                              # %ton_in_true.i3582
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_536:                               # %ton_step.exit3588
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_538
# %bb.537:                              # %ton_step.exit3588
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_538:                               # %ton_step.exit3588
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_540
# %bb.539:                              # %ton_in_true.i3603
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_540:                               # %ton_step.exit3609
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_542
# %bb.541:                              # %ton_step.exit3609
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_542:                               # %ton_step.exit3609
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_544
# %bb.543:                              # %ton_in_true.i3624
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_544:                               # %ton_step.exit3630
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_546
# %bb.545:                              # %ton_step.exit3630
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_546:                               # %ton_step.exit3630
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_548
# %bb.547:                              # %ton_in_true.i3653
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_548:                               # %ton_step.exit3659
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_550
# %bb.549:                              # %ton_in_true.i3663
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_550:                               # %ton_step.exit3669
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_552
# %bb.551:                              # %ton_step.exit3669
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_552:                               # %ton_step.exit3669
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_554
# %bb.553:                              # %ton_in_true.i3684
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_554:                               # %ton_step.exit3690
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_556
# %bb.555:                              # %ton_step.exit3690
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_556:                               # %ton_step.exit3690
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_558
# %bb.557:                              # %ton_in_true.i3705
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_558:                               # %ton_step.exit3711
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_560
# %bb.559:                              # %ton_step.exit3711
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_560:                               # %ton_step.exit3711
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_562
# %bb.561:                              # %ton_in_true.i3726
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_562:                               # %ton_step.exit3732
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_564
# %bb.563:                              # %ton_step.exit3732
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_564:                               # %ton_step.exit3732
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_566
# %bb.565:                              # %ton_in_true.i3747
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_566:                               # %ton_step.exit3753
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_568
# %bb.567:                              # %ton_step.exit3753
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_568:                               # %ton_step.exit3753
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_570
# %bb.569:                              # %ton_in_true.i3768
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_570:                               # %ton_step.exit3774
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_572
# %bb.571:                              # %ton_step.exit3774
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_572:                               # %ton_step.exit3774
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_574
# %bb.573:                              # %ton_in_true.i3797
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_574:                               # %ton_step.exit3803
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_576
# %bb.575:                              # %ton_in_true.i3807
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_576:                               # %ton_step.exit3813
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_578
# %bb.577:                              # %ton_step.exit3813
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_578:                               # %ton_step.exit3813
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_580
# %bb.579:                              # %ton_in_true.i3828
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_580:                               # %ton_step.exit3834
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_582
# %bb.581:                              # %ton_step.exit3834
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_582:                               # %ton_step.exit3834
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_584
# %bb.583:                              # %ton_in_true.i3849
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_584:                               # %ton_step.exit3855
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_586
# %bb.585:                              # %ton_step.exit3855
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_586:                               # %ton_step.exit3855
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_588
# %bb.587:                              # %ton_in_true.i3870
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_588:                               # %ton_step.exit3876
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_590
# %bb.589:                              # %ton_step.exit3876
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_590:                               # %ton_step.exit3876
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_592
# %bb.591:                              # %ton_in_true.i3891
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_592:                               # %ton_step.exit3897
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_594
# %bb.593:                              # %ton_step.exit3897
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_594:                               # %ton_step.exit3897
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_596
# %bb.595:                              # %ton_in_true.i3912
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_596:                               # %ton_step.exit3918
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_598
# %bb.597:                              # %ton_step.exit3918
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_598:                               # %ton_step.exit3918
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_600
# %bb.599:                              # %ton_in_true.i3941
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_600:                               # %ton_step.exit3947
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_602
# %bb.601:                              # %ton_in_true.i3951
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_602:                               # %ton_step.exit3957
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_604
# %bb.603:                              # %ton_step.exit3957
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_604:                               # %ton_step.exit3957
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_606
# %bb.605:                              # %ton_in_true.i3972
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_606:                               # %ton_step.exit3978
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_608
# %bb.607:                              # %ton_step.exit3978
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_608:                               # %ton_step.exit3978
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_610
# %bb.609:                              # %ton_in_true.i3993
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_610:                               # %ton_step.exit3999
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_612
# %bb.611:                              # %ton_step.exit3999
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_612:                               # %ton_step.exit3999
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_614
# %bb.613:                              # %ton_in_true.i4014
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_614:                               # %ton_step.exit4020
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_616
# %bb.615:                              # %ton_step.exit4020
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_616:                               # %ton_step.exit4020
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_618
# %bb.617:                              # %ton_in_true.i4035
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_618:                               # %ton_step.exit4041
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_620
# %bb.619:                              # %ton_step.exit4041
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_620:                               # %ton_step.exit4041
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_622
# %bb.621:                              # %ton_in_true.i4056
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_622:                               # %ton_step.exit4062
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_624
# %bb.623:                              # %ton_step.exit4062
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_624:                               # %ton_step.exit4062
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_626
# %bb.625:                              # %ton_in_true.i4085
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_626:                               # %ton_step.exit4091
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_628
# %bb.627:                              # %ton_in_true.i4095
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_628:                               # %ton_step.exit4101
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_630
# %bb.629:                              # %ton_step.exit4101
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_630:                               # %ton_step.exit4101
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_632
# %bb.631:                              # %ton_in_true.i4116
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_632:                               # %ton_step.exit4122
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_634
# %bb.633:                              # %ton_step.exit4122
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_634:                               # %ton_step.exit4122
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_636
# %bb.635:                              # %ton_in_true.i4137
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_636:                               # %ton_step.exit4143
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_638
# %bb.637:                              # %ton_step.exit4143
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_638:                               # %ton_step.exit4143
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_640
# %bb.639:                              # %ton_in_true.i4158
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_640:                               # %ton_step.exit4164
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_642
# %bb.641:                              # %ton_step.exit4164
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_642:                               # %ton_step.exit4164
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_644
# %bb.643:                              # %ton_in_true.i4179
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_644:                               # %ton_step.exit4185
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_646
# %bb.645:                              # %ton_step.exit4185
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_646:                               # %ton_step.exit4185
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_648
# %bb.647:                              # %ton_in_true.i4200
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_648:                               # %ton_step.exit4206
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_650
# %bb.649:                              # %ton_step.exit4206
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_650:                               # %ton_step.exit4206
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_652
# %bb.651:                              # %ton_in_true.i4229
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_652:                               # %ton_step.exit4235
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_654
# %bb.653:                              # %ton_in_true.i4239
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_654:                               # %ton_step.exit4245
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_656
# %bb.655:                              # %ton_step.exit4245
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_656:                               # %ton_step.exit4245
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_658
# %bb.657:                              # %ton_in_true.i4260
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_658:                               # %ton_step.exit4266
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_660
# %bb.659:                              # %ton_step.exit4266
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_660:                               # %ton_step.exit4266
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_662
# %bb.661:                              # %ton_in_true.i4281
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_662:                               # %ton_step.exit4287
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_664
# %bb.663:                              # %ton_step.exit4287
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_664:                               # %ton_step.exit4287
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_666
# %bb.665:                              # %ton_in_true.i4302
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_666:                               # %ton_step.exit4308
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_668
# %bb.667:                              # %ton_step.exit4308
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_668:                               # %ton_step.exit4308
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_670
# %bb.669:                              # %ton_in_true.i4323
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_670:                               # %ton_step.exit4329
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_672
# %bb.671:                              # %ton_step.exit4329
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_672:                               # %ton_step.exit4329
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_674
# %bb.673:                              # %ton_in_true.i4344
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_674:                               # %ton_step.exit4350
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_676
# %bb.675:                              # %ton_step.exit4350
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_676:                               # %ton_step.exit4350
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_678
# %bb.677:                              # %ton_in_true.i4373
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_678:                               # %ton_step.exit4379
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_680
# %bb.679:                              # %ton_in_true.i4383
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_680:                               # %ton_step.exit4389
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_682
# %bb.681:                              # %ton_step.exit4389
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_682:                               # %ton_step.exit4389
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_684
# %bb.683:                              # %ton_in_true.i4404
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_684:                               # %ton_step.exit4410
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_686
# %bb.685:                              # %ton_step.exit4410
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_686:                               # %ton_step.exit4410
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_688
# %bb.687:                              # %ton_in_true.i4425
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_688:                               # %ton_step.exit4431
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_690
# %bb.689:                              # %ton_step.exit4431
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_690:                               # %ton_step.exit4431
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_692
# %bb.691:                              # %ton_in_true.i4446
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_692:                               # %ton_step.exit4452
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_694
# %bb.693:                              # %ton_step.exit4452
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_694:                               # %ton_step.exit4452
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_696
# %bb.695:                              # %ton_in_true.i4467
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_696:                               # %ton_step.exit4473
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_698
# %bb.697:                              # %ton_step.exit4473
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_698:                               # %ton_step.exit4473
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_700
# %bb.699:                              # %ton_in_true.i4488
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_700:                               # %ton_step.exit4494
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_702
# %bb.701:                              # %ton_step.exit4494
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_702:                               # %ton_step.exit4494
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_704
# %bb.703:                              # %ton_in_true.i4517
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_704:                               # %ton_step.exit4523
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_706
# %bb.705:                              # %ton_in_true.i4527
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_706:                               # %ton_step.exit4533
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_708
# %bb.707:                              # %ton_step.exit4533
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_708:                               # %ton_step.exit4533
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_710
# %bb.709:                              # %ton_in_true.i4548
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_710:                               # %ton_step.exit4554
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_712
# %bb.711:                              # %ton_step.exit4554
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_712:                               # %ton_step.exit4554
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_714
# %bb.713:                              # %ton_in_true.i4569
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_714:                               # %ton_step.exit4575
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_716
# %bb.715:                              # %ton_step.exit4575
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_716:                               # %ton_step.exit4575
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_718
# %bb.717:                              # %ton_in_true.i4590
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_718:                               # %ton_step.exit4596
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_720
# %bb.719:                              # %ton_step.exit4596
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_720:                               # %ton_step.exit4596
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_722
# %bb.721:                              # %ton_in_true.i4611
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_722:                               # %ton_step.exit4617
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_724
# %bb.723:                              # %ton_step.exit4617
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_724:                               # %ton_step.exit4617
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_726
# %bb.725:                              # %ton_in_true.i4632
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_726:                               # %ton_step.exit4638
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_728
# %bb.727:                              # %ton_step.exit4638
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_728:                               # %ton_step.exit4638
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_730
# %bb.729:                              # %ton_in_true.i4661
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_730:                               # %ton_step.exit4667
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_732
# %bb.731:                              # %ton_in_true.i4671
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_732:                               # %ton_step.exit4677
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_734
# %bb.733:                              # %ton_step.exit4677
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_734:                               # %ton_step.exit4677
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_736
# %bb.735:                              # %ton_in_true.i4692
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_736:                               # %ton_step.exit4698
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_738
# %bb.737:                              # %ton_step.exit4698
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_738:                               # %ton_step.exit4698
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_740
# %bb.739:                              # %ton_in_true.i4713
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_740:                               # %ton_step.exit4719
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_742
# %bb.741:                              # %ton_step.exit4719
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_742:                               # %ton_step.exit4719
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_744
# %bb.743:                              # %ton_in_true.i4734
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_744:                               # %ton_step.exit4740
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_746
# %bb.745:                              # %ton_step.exit4740
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_746:                               # %ton_step.exit4740
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_748
# %bb.747:                              # %ton_in_true.i4755
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_748:                               # %ton_step.exit4761
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_750
# %bb.749:                              # %ton_step.exit4761
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_750:                               # %ton_step.exit4761
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_752
# %bb.751:                              # %ton_in_true.i4776
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_752:                               # %ton_step.exit4782
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_754
# %bb.753:                              # %ton_step.exit4782
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_754:                               # %ton_step.exit4782
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_756
# %bb.755:                              # %ton_in_true.i4805
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_756:                               # %ton_step.exit4811
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_758
# %bb.757:                              # %ton_in_true.i4815
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_758:                               # %ton_step.exit4821
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_760
# %bb.759:                              # %ton_step.exit4821
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_760:                               # %ton_step.exit4821
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_762
# %bb.761:                              # %ton_in_true.i4836
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_762:                               # %ton_step.exit4842
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_764
# %bb.763:                              # %ton_step.exit4842
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_764:                               # %ton_step.exit4842
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_766
# %bb.765:                              # %ton_in_true.i4857
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_766:                               # %ton_step.exit4863
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_768
# %bb.767:                              # %ton_step.exit4863
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_768:                               # %ton_step.exit4863
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_770
# %bb.769:                              # %ton_in_true.i4878
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_770:                               # %ton_step.exit4884
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_772
# %bb.771:                              # %ton_step.exit4884
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_772:                               # %ton_step.exit4884
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_774
# %bb.773:                              # %ton_in_true.i4899
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_774:                               # %ton_step.exit4905
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_776
# %bb.775:                              # %ton_step.exit4905
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_776:                               # %ton_step.exit4905
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_778
# %bb.777:                              # %ton_in_true.i4920
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_778:                               # %ton_step.exit4926
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_780
# %bb.779:                              # %ton_step.exit4926
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_780:                               # %ton_step.exit4926
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_782
# %bb.781:                              # %ton_in_true.i4949
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_782:                               # %ton_step.exit4955
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_784
# %bb.783:                              # %ton_in_true.i4959
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_784:                               # %ton_step.exit4965
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_786
# %bb.785:                              # %ton_step.exit4965
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_786:                               # %ton_step.exit4965
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_788
# %bb.787:                              # %ton_in_true.i4980
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_788:                               # %ton_step.exit4986
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_790
# %bb.789:                              # %ton_step.exit4986
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_790:                               # %ton_step.exit4986
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_792
# %bb.791:                              # %ton_in_true.i5001
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_792:                               # %ton_step.exit5007
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_794
# %bb.793:                              # %ton_step.exit5007
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_794:                               # %ton_step.exit5007
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_796
# %bb.795:                              # %ton_in_true.i5022
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_796:                               # %ton_step.exit5028
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_798
# %bb.797:                              # %ton_step.exit5028
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_798:                               # %ton_step.exit5028
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_800
# %bb.799:                              # %ton_in_true.i5043
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_800:                               # %ton_step.exit5049
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_802
# %bb.801:                              # %ton_step.exit5049
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_802:                               # %ton_step.exit5049
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_804
# %bb.803:                              # %ton_in_true.i5064
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_804:                               # %ton_step.exit5070
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_806
# %bb.805:                              # %ton_step.exit5070
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_806:                               # %ton_step.exit5070
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_808
# %bb.807:                              # %ton_in_true.i5093
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_808:                               # %ton_step.exit5099
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_810
# %bb.809:                              # %ton_in_true.i5103
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_810:                               # %ton_step.exit5109
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_812
# %bb.811:                              # %ton_step.exit5109
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_812:                               # %ton_step.exit5109
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_814
# %bb.813:                              # %ton_in_true.i5124
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_814:                               # %ton_step.exit5130
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_816
# %bb.815:                              # %ton_step.exit5130
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_816:                               # %ton_step.exit5130
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_818
# %bb.817:                              # %ton_in_true.i5145
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_818:                               # %ton_step.exit5151
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_820
# %bb.819:                              # %ton_step.exit5151
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_820:                               # %ton_step.exit5151
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_822
# %bb.821:                              # %ton_in_true.i5166
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_822:                               # %ton_step.exit5172
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_824
# %bb.823:                              # %ton_step.exit5172
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_824:                               # %ton_step.exit5172
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_826
# %bb.825:                              # %ton_in_true.i5187
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_826:                               # %ton_step.exit5193
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_828
# %bb.827:                              # %ton_step.exit5193
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_828:                               # %ton_step.exit5193
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_830
# %bb.829:                              # %ton_in_true.i5208
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_830:                               # %ton_step.exit5214
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_832
# %bb.831:                              # %ton_step.exit5214
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_832:                               # %ton_step.exit5214
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_834
# %bb.833:                              # %ton_in_true.i5237
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_834:                               # %ton_step.exit5243
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_836
# %bb.835:                              # %ton_in_true.i5247
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_836:                               # %ton_step.exit5253
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_838
# %bb.837:                              # %ton_step.exit5253
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_838:                               # %ton_step.exit5253
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_840
# %bb.839:                              # %ton_in_true.i5268
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_840:                               # %ton_step.exit5274
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_842
# %bb.841:                              # %ton_step.exit5274
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_842:                               # %ton_step.exit5274
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_844
# %bb.843:                              # %ton_in_true.i5289
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_844:                               # %ton_step.exit5295
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_846
# %bb.845:                              # %ton_step.exit5295
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_846:                               # %ton_step.exit5295
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_848
# %bb.847:                              # %ton_in_true.i5310
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_848:                               # %ton_step.exit5316
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_850
# %bb.849:                              # %ton_step.exit5316
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_850:                               # %ton_step.exit5316
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_852
# %bb.851:                              # %ton_in_true.i5331
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_852:                               # %ton_step.exit5337
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_854
# %bb.853:                              # %ton_step.exit5337
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_854:                               # %ton_step.exit5337
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_856
# %bb.855:                              # %ton_in_true.i5352
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_856:                               # %ton_step.exit5358
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_858
# %bb.857:                              # %ton_step.exit5358
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_858:                               # %ton_step.exit5358
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_860
# %bb.859:                              # %ton_in_true.i5381
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_860:                               # %ton_step.exit5387
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_862
# %bb.861:                              # %ton_in_true.i5391
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_862:                               # %ton_step.exit5397
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_864
# %bb.863:                              # %ton_step.exit5397
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_864:                               # %ton_step.exit5397
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_866
# %bb.865:                              # %ton_in_true.i5412
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_866:                               # %ton_step.exit5418
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_868
# %bb.867:                              # %ton_step.exit5418
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_868:                               # %ton_step.exit5418
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_870
# %bb.869:                              # %ton_in_true.i5433
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_870:                               # %ton_step.exit5439
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_872
# %bb.871:                              # %ton_step.exit5439
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_872:                               # %ton_step.exit5439
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_874
# %bb.873:                              # %ton_in_true.i5454
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_874:                               # %ton_step.exit5460
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_876
# %bb.875:                              # %ton_step.exit5460
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_876:                               # %ton_step.exit5460
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_878
# %bb.877:                              # %ton_in_true.i5475
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_878:                               # %ton_step.exit5481
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_880
# %bb.879:                              # %ton_step.exit5481
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_880:                               # %ton_step.exit5481
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_882
# %bb.881:                              # %ton_in_true.i5496
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_882:                               # %ton_step.exit5502
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_884
# %bb.883:                              # %ton_step.exit5502
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_884:                               # %ton_step.exit5502
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	728(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movb	%al, (%ecx)
	movl	724(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	(%edi), %dl
	andb	$1, %dl
	movb	%dl, (%ecx)
	movb	%al, (%edi)
	movl	736(%esp), %edx                 # 4-byte Reload
	movl	732(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%edx)
	orb	(%edi), %al
	andb	$1, %al
	movb	%al, (%edi)
	movzbl	(%edx), %edx
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_886
# %bb.885:                              # %ton_in_true.i5525
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_886:                               # %ton_step.exit5531
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %edi                  # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_888
# %bb.887:                              # %ton_in_true.i5535
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%edi), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_888:                               # %ton_step.exit5541
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%edi)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	52(%esp), %edi                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_890
# %bb.889:                              # %ton_step.exit5541
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %edi
LBB5_890:                               # %ton_step.exit5541
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	52(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %edi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%edi)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_892
# %bb.891:                              # %ton_in_true.i5556
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_892:                               # %ton_step.exit5562
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_894
# %bb.893:                              # %ton_step.exit5562
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_894:                               # %ton_step.exit5562
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	56(%esp), %edi                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_896
# %bb.895:                              # %ton_in_true.i5577
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_896:                               # %ton_step.exit5583
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %edi                  # 4-byte Reload
	movl	%ebx, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%edi), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %edi
	jne	LBB5_898
# %bb.897:                              # %ton_step.exit5583
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_898:                               # %ton_step.exit5583
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	20(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_900
# %bb.899:                              # %ton_in_true.i5598
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_900:                               # %ton_step.exit5604
	movl	24(%esp), %edi                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	cmpb	$0, (%edx)
	movl	$0, %edi
	movl	%ebp, %esi
	jne	LBB5_902
# %bb.901:                              # %ton_step.exit5604
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_902:                               # %ton_step.exit5604
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	28(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edi), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_904
# %bb.903:                              # %ton_in_true.i5619
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_904:                               # %ton_step.exit5625
	movl	32(%esp), %edi                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movzbl	(%edi), %eax
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	movl	464(%esp), %edi                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %edi
	jne	LBB5_906
# %bb.905:                              # %ton_step.exit5625
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_906:                               # %ton_step.exit5625
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	36(%esp), %edi                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%edi)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%edi), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_908
# %bb.907:                              # %ton_in_true.i5640
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %ebx                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_908:                               # %ton_step.exit5646
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%ebx, (%edi)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	xorl	%ebx, %ebx
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	516(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	512(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%edi)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%edi)
	movzbl	(%edx), %eax
	movb	(%esi), %ah
	movl	$0, %edi
	jne	LBB5_910
# %bb.909:                              # %ton_step.exit5646
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%ecx), %edi
LBB5_910:                               # %ton_step.exit5646
	notb	%ah
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	580(%esp), %ebp                 # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%edi, %edx
	movl	644(%esp), %edi                 # 4-byte Reload
	movl	%edx, (%ecx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ecx), %eax
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	544(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %edx
	orb	(%ecx), %dl
	movl	556(%esp), %ecx                 # 4-byte Reload
	andb	%al, %dl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	560(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %dl
	movl	672(%esp), %ecx                 # 4-byte Reload
	orb	%al, %dl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %dl
	movb	%dl, (%eax)
	movl	568(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	%eax, %edx
	andb	$1, %dl
	movb	%dl, (%edi)
	movl	572(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	600(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ebp), %al
	movl	576(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%ebp)
	movl	584(%esp), %ebp                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ebp), %al
	movl	588(%esp), %ebp                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ebp)
	movzbl	(%edx), %eax
	movl	592(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	596(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	604(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	608(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	612(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	andb	(%edx), %al
	movl	616(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	620(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	168(%esp), %edi                 # 4-byte Reload
	andb	(%edx), %al
	movl	624(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	628(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	632(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	636(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edx), %al
	movl	640(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	148(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	648(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	668(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	160(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %al
	movl	164(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edx), %al
	movl	660(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	664(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	680(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	748(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	696(%esp), %ecx                 # 4-byte Reload
	andb	(%edi), %dl
	movl	700(%esp), %edi                 # 4-byte Reload
	andb	%al, %dl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	704(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	notb	%dl
	andb	%al, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movl	724(%esp), %edi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	720(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	728(%esp), %ecx                 # 4-byte Reload
	movl	%eax, %edx
	notb	%dl
	andb	(%ecx), %dl
	andb	$1, %dl
	movb	%dl, (%edi)
	movb	%al, (%ecx)
	movl	736(%esp), %ecx                 # 4-byte Reload
	movl	732(%esp), %edx                 # 4-byte Reload
	movzbl	(%edi), %eax
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movzbl	(%ecx), %edx
	movl	176(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %edx
	movl	184(%esp), %ecx                 # 4-byte Reload
	notb	%dl
	andb	%al, %dl
	movl	180(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movl	752(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	188(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movb	%al, (%ecx)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	$1, %al
	movb	%al, (%ecx)
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movb	%al, (%ecx)
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	movl	220(%esp), %edx                 # 4-byte Reload
	jne	LBB5_912
# %bb.911:                              # %ton_in_true.i5669
	movl	(%edx), %eax
	movl	$30000, %ebx                    # imm = 0x7530
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %ebx
	setge	%al
LBB5_912:                               # %ton_step.exit5675
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	260(%esp), %esi                 # 4-byte Reload
	movl	%ebx, (%edx)
	movl	72(%esp), %ebx                  # 4-byte Reload
	xorl	%edi, %edi
	movb	%al, (%ecx)
	movb	%al, (%esi)
	movl	216(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	$0, %edx
	movb	%al, (%ecx)
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	656(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ebx)
	movl	48(%esp), %eax                  # 4-byte Reload
	cmpb	$1, (%eax)
	movl	$0, %eax
	jne	LBB5_914
# %bb.913:                              # %ton_in_true.i5679
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%ebx), %edx
	movl	(%eax), %eax
	incl	%eax
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	setge	%dl
LBB5_914:                               # %ton_step.exit5685
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	248(%esp), %ebx                 # 4-byte Reload
	movl	%eax, (%ebp)
	movl	232(%esp), %eax                 # 4-byte Reload
	movb	%dl, (%eax)
	movb	%dl, (%ebx)
	movl	228(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebp), %eax
	movl	520(%esp), %ebp                 # 4-byte Reload
	movb	%al, (%edx)
	movl	236(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	252(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	240(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebx), %eax
	movl	52(%esp), %ebx                  # 4-byte Reload
	movb	%al, (%edx)
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%ebx), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %ebx
	jne	LBB5_916
# %bb.915:                              # %ton_step.exit5685
	movl	4(%esp), %edx                   # 4-byte Reload
	movl	(%edx), %ebx
LBB5_916:                               # %ton_step.exit5685
	notb	%ah
	movl	4(%esp), %esi                   # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%ebx, %edx
	movl	52(%esp), %ebx                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	280(%esp), %edx                 # 4-byte Reload
	movb	%al, (%ebx)
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	264(%esp), %ebx                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%esi), %eax
	movl	%eax, (%ebx)
	movzbl	(%edx), %eax
	movl	272(%esp), %edx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	80(%esp), %eax                  # 4-byte Reload
	movl	284(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_918
# %bb.917:                              # %ton_in_true.i5700
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$30000, %edi                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %edi
	setge	%al
LBB5_918:                               # %ton_step.exit5706
	movl	8(%esp), %esi                   # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %ebx                  # 4-byte Reload
	movl	%edi, (%esi)
	movb	%al, (%edx)
	movl	292(%esp), %edx                 # 4-byte Reload
	xorl	%edi, %edi
	movb	%al, (%edx)
	movl	288(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	308(%esp), %esi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%ebx), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %ebx
	jne	LBB5_920
# %bb.919:                              # %ton_step.exit5706
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %ebx
LBB5_920:                               # %ton_step.exit5706
	notb	%ah
	movl	12(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%ebx, %edx
	movl	56(%esp), %ebx                  # 4-byte Reload
	movl	%edx, (%esi)
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	312(%esp), %edx                 # 4-byte Reload
	movb	%al, (%ebx)
	movl	320(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	316(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%esi), %eax
	movl	%eax, (%edx)
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_922
# %bb.921:                              # %ton_in_true.i5721
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$30000, %edi                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %edi
	setge	%al
LBB5_922:                               # %ton_step.exit5727
	movl	16(%esp), %esi                  # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movl	60(%esp), %ebx                  # 4-byte Reload
	movl	%edi, (%esi)
	movb	%al, (%edx)
	movl	348(%esp), %edx                 # 4-byte Reload
	xorl	%edi, %edi
	movb	%al, (%edx)
	movzbl	(%esi), %eax
	movl	336(%esp), %esi                 # 4-byte Reload
	movb	%al, (%esi)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	344(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	356(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%esi)
	movl	352(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movb	(%ebx), %ah
	movb	(%edx), %al
	cmpb	$0, (%esi)
	movl	$0, %ebx
	jne	LBB5_924
# %bb.923:                              # %ton_step.exit5727
	movl	20(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %ebx
LBB5_924:                               # %ton_step.exit5727
	notb	%ah
	movl	60(%esp), %esi                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%ebx, %edx
	movl	20(%esp), %ebx                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%ebx)
	movb	%al, (%esi)
	movl	372(%esp), %eax                 # 4-byte Reload
	movl	384(%esp), %edx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%ebx), %eax
	movl	%eax, (%esi)
	movl	364(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	notb	%al
	andb	(%edx), %al
	movl	376(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	388(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_926
# %bb.925:                              # %ton_in_true.i5742
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$30000, %edi                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %edi
	setge	%al
LBB5_926:                               # %ton_step.exit5748
	movl	24(%esp), %ebx                  # 4-byte Reload
	movl	400(%esp), %edx                 # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	%edi, (%ebx)
	movb	%al, (%edx)
	movl	396(%esp), %edx                 # 4-byte Reload
	movl	408(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	392(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebx), %eax
	movl	$0, %ebx
	movb	%al, (%edx)
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movb	(%esi), %ah
	xorl	%edi, %edi
	cmpb	$0, (%edx)
	movl	%ebp, %esi
	jne	LBB5_928
# %bb.927:                              # %ton_step.exit5748
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %ebx
LBB5_928:                               # %ton_step.exit5748
	notb	%ah
	movl	68(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%ebx, %edx
	movl	28(%esp), %ebx                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%ebx)
	movb	%al, (%ebp)
	movl	424(%esp), %eax                 # 4-byte Reload
	movl	416(%esp), %edx                 # 4-byte Reload
	setge	(%eax)
	movl	420(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%ebx), %eax
	movl	%eax, (%edx)
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	432(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_930
# %bb.929:                              # %ton_in_true.i5763
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	$30000, %edi                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %edi
	setge	%al
LBB5_930:                               # %ton_step.exit5769
	movl	32(%esp), %ebx                  # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	64(%esp), %ebp                  # 4-byte Reload
	movl	%edi, (%ebx)
	movb	%al, (%edx)
	movl	452(%esp), %edx                 # 4-byte Reload
	movl	440(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movzbl	(%ebx), %eax
	movl	464(%esp), %ebx                 # 4-byte Reload
	movb	%al, (%edi)
	movl	436(%esp), %eax                 # 4-byte Reload
	xorl	%edi, %edi
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	448(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movzbl	(%ecx), %eax
	movb	%al, (%ebx)
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	cmpb	$0, (%ebx)
	movzbl	(%edx), %eax
	movb	(%ebp), %ah
	movl	$0, %ebx
	jne	LBB5_932
# %bb.931:                              # %ton_step.exit5769
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %ebx
LBB5_932:                               # %ton_step.exit5769
	notb	%ah
	movl	64(%esp), %ebp                  # 4-byte Reload
	andb	%al, %ah
	movzbl	%ah, %edx
	addl	%ebx, %edx
	movl	36(%esp), %ebx                  # 4-byte Reload
	cmpl	$5000, %edx                     # imm = 0x1388
	movl	%edx, (%ebx)
	movb	%al, (%ebp)
	movl	476(%esp), %eax                 # 4-byte Reload
	movl	488(%esp), %edx                 # 4-byte Reload
	movl	472(%esp), %ebp                 # 4-byte Reload
	setge	(%eax)
	setge	(%edx)
	movl	(%ebx), %eax
	movl	%eax, (%ebp)
	movl	468(%esp), %eax                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%edx), %al
	movl	480(%esp), %edx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	492(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	$30000, (%eax)                  # imm = 0x7530
	movl	$0, %eax
	cmpb	$1, (%edx)
	jne	LBB5_934
# %bb.933:                              # %ton_in_true.i5784
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	$30000, %edi                    # imm = 0x7530
	movl	(%eax), %eax
	incl	%eax
	cmpl	$30000, %eax                    # imm = 0x7530
	cmovll	%eax, %edi
	setge	%al
LBB5_934:                               # %ton_step.exit5790
	movl	40(%esp), %ebx                  # 4-byte Reload
	movl	504(%esp), %edx                 # 4-byte Reload
	movl	%edi, (%ebx)
	movb	%al, (%edx)
	movl	500(%esp), %edx                 # 4-byte Reload
	movl	512(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edx)
	movl	496(%esp), %edx                 # 4-byte Reload
	movzbl	(%ebx), %eax
	movl	772(%esp), %ebx                 # 4-byte Reload
	movb	%al, (%edx)
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	516(%esp), %edx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%edi)
	movzbl	(%ecx), %eax
	movb	%al, (%edx)
	movl	508(%esp), %eax                 # 4-byte Reload
	movl	$5000, (%eax)                   # imm = 0x1388
	movzbl	(%edi), %eax
	movzbl	(%esi), %ecx
	cmpb	$0, (%edx)
	movl	$0, %edi
	jne	LBB5_936
# %bb.935:                              # %ton_step.exit5790
	movl	44(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edi
LBB5_936:                               # %ton_step.exit5790
	notb	%cl
	movl	44(%esp), %edx                  # 4-byte Reload
	andb	%al, %cl
	movzbl	%cl, %ecx
	addl	%edi, %ecx
	movl	580(%esp), %edi                 # 4-byte Reload
	movl	%ecx, (%edx)
	movb	%al, (%esi)
	movl	532(%esp), %eax                 # 4-byte Reload
	cmpl	$5000, %ecx                     # imm = 0x1388
	movl	524(%esp), %ecx                 # 4-byte Reload
	movl	88(%esp), %esi                  # 4-byte Reload
	setge	(%eax)
	movl	528(%esp), %eax                 # 4-byte Reload
	setge	(%eax)
	movl	(%edx), %eax
	movl	544(%esp), %edx                 # 4-byte Reload
	movl	%eax, (%ecx)
	movl	536(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	orb	(%ecx), %al
	movl	540(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movzbl	(%esi), %ecx
	orb	(%edx), %cl
	movl	560(%esp), %edx                 # 4-byte Reload
	andb	%al, %cl
	movl	548(%esp), %eax                 # 4-byte Reload
	movb	%cl, (%eax)
	movl	556(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	644(%esp), %esi                 # 4-byte Reload
	movb	%al, (%ecx)
	movl	552(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %ecx
	andb	(%edx), %cl
	movl	672(%esp), %edx                 # 4-byte Reload
	orb	%al, %cl
	movl	564(%esp), %eax                 # 4-byte Reload
	andb	$1, %cl
	movb	%cl, (%eax)
	movl	568(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ecx), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	%cl, (%esi)
	movl	572(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	600(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	andb	(%edi), %al
	movl	576(%esp), %edi                 # 4-byte Reload
	movb	%al, (%edi)
	movl	584(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	andb	(%edi), %al
	movl	588(%esp), %edi                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edi)
	movl	784(%esp), %edi                 # 4-byte Reload
	movzbl	(%ecx), %eax
	movl	592(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	596(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	604(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	andb	(%ecx), %al
	movl	608(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	612(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	andb	(%ecx), %al
	movl	616(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	620(%esp), %ecx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	700(%esp), %esi                 # 4-byte Reload
	andb	(%ecx), %al
	movl	624(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	628(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ecx), %al
	movl	632(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	636(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	andb	(%ecx), %al
	movl	640(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	648(%esp), %ecx                 # 4-byte Reload
	movzbl	(%edx), %eax
	movl	668(%esp), %edx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	652(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	148(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%ecx), %al
	movl	160(%esp), %ecx                 # 4-byte Reload
	andb	(%ecx), %al
	movl	164(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%edx)
	andb	(%ecx), %al
	movl	660(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%ecx)
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	132(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	orb	(%ecx), %al
	movl	664(%esp), %ecx                 # 4-byte Reload
	andb	$1, %al
	movb	%al, (%ecx)
	movzbl	(%edx), %ecx
	movl	168(%esp), %edx                 # 4-byte Reload
	andb	(%edx), %cl
	movl	748(%esp), %edx                 # 4-byte Reload
	andb	%al, %cl
	movl	676(%esp), %eax                 # 4-byte Reload
	movb	%cl, (%eax)
	movl	136(%esp), %eax                 # 4-byte Reload
	movl	680(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	684(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	744(%esp), %eax                 # 4-byte Reload
	movl	688(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	104(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %ecx
	andb	(%edx), %cl
	movl	704(%esp), %edx                 # 4-byte Reload
	andb	%al, %cl
	movl	692(%esp), %eax                 # 4-byte Reload
	movb	%cl, (%eax)
	movl	140(%esp), %eax                 # 4-byte Reload
	movl	696(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movzbl	(%edx), %ecx
	notb	%cl
	andb	%al, %cl
	movb	%cl, (%esi)
	movb	%al, (%edx)
	movl	712(%esp), %ecx                 # 4-byte Reload
	movl	708(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	724(%esp), %esi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movl	728(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %ecx
	notb	%cl
	andb	%al, %cl
	movl	716(%esp), %eax                 # 4-byte Reload
	movb	%cl, (%eax)
	movl	152(%esp), %eax                 # 4-byte Reload
	movl	720(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	%eax, %ecx
	notb	%cl
	andb	(%edx), %cl
	andb	$1, %cl
	movb	%cl, (%esi)
	movb	%al, (%edx)
	movl	736(%esp), %ecx                 # 4-byte Reload
	movl	732(%esp), %edx                 # 4-byte Reload
	movzbl	(%esi), %eax
	movl	788(%esp), %esi                 # 4-byte Reload
	movb	%al, (%ecx)
	orb	(%edx), %al
	andb	$1, %al
	movb	%al, (%edx)
	movl	764(%esp), %edx                 # 4-byte Reload
	movzbl	(%ecx), %ecx
	notb	%cl
	andb	%al, %cl
	movl	740(%esp), %eax                 # 4-byte Reload
	movb	%cl, (%eax)
	movl	792(%esp), %eax                 # 4-byte Reload
	movl	760(%esp), %ecx                 # 4-byte Reload
	movzbl	(%eax), %eax
	movb	%al, (%ecx)
	movl	768(%esp), %ecx                 # 4-byte Reload
	movb	%al, (%ecx)
	movzbl	(%esi), %eax
	movb	%al, (%edx)
	movl	756(%esp), %eax                 # 4-byte Reload
	movl	$32767, (%eax)                  # imm = 0x7FFF
	movzbl	(%ecx), %eax
	cmpb	$0, (%edx)
	movzbl	(%ebx), %ecx
	movl	$0, %edx
	jne	LBB5_938
# %bb.937:                              # %ton_step.exit5790
	movl	(%edi), %edx
LBB5_938:                               # %ton_step.exit5790
	notb	%cl
	andb	%al, %cl
	movzbl	%cl, %ecx
	addl	%edx, %ecx
	movl	%ecx, (%edi)
	movb	%al, (%ebx)
	movl	776(%esp), %eax                 # 4-byte Reload
	cmpl	$32767, %ecx                    # imm = 0x7FFF
	movl	780(%esp), %ecx                 # 4-byte Reload
	setge	(%eax)
	setge	(%esi)
	movl	(%edi), %eax
	movl	%eax, (%ecx)
	xorl	%eax, %eax
	addl	$796, %esp                      # imm = 0x31C
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.bss
	.globl	_il_mem_ECAT_Slave5_DI1         # @il_mem_ECAT_Slave5_DI1
_il_mem_ECAT_Slave5_DI1:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_ECAT_Slave5_DI1        # @il_slot_ECAT_Slave5_DI1
	.p2align	2, 0x0
_il_slot_ECAT_Slave5_DI1:
	.long	_il_mem_ECAT_Slave5_DI1

	.bss
	.globl	_il_mem_input01                 # @il_mem_input01
_il_mem_input01:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_input01                # @il_slot_input01
	.p2align	2, 0x0
_il_slot_input01:
	.long	_il_mem_input01

	.bss
	.globl	_il_mem_inBia0101               # @il_mem_inBia0101
_il_mem_inBia0101:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inBia0101              # @il_slot_inBia0101
	.p2align	2, 0x0
_il_slot_inBia0101:
	.long	_il_mem_inBia0101

	.bss
	.globl	_il_mem_inBia0102               # @il_mem_inBia0102
_il_mem_inBia0102:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inBia0102              # @il_slot_inBia0102
	.p2align	2, 0x0
_il_slot_inBia0102:
	.long	_il_mem_inBia0102

	.bss
	.globl	_il_mem_inBia0202               # @il_mem_inBia0202
_il_mem_inBia0202:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inBia0202              # @il_slot_inBia0202
	.p2align	2, 0x0
_il_slot_inBia0202:
	.long	_il_mem_inBia0202

	.bss
	.globl	_il_mem_inBia0203               # @il_mem_inBia0203
_il_mem_inBia0203:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inBia0203              # @il_slot_inBia0203
	.p2align	2, 0x0
_il_slot_inBia0203:
	.long	_il_mem_inBia0203

	.bss
	.globl	_il_mem_inBia0303               # @il_mem_inBia0303
_il_mem_inBia0303:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inBia0303              # @il_slot_inBia0303
	.p2align	2, 0x0
_il_slot_inBia0303:
	.long	_il_mem_inBia0303

	.bss
	.globl	_il_mem_inBIa0404               # @il_mem_inBIa0404
_il_mem_inBIa0404:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inBIa0404              # @il_slot_inBIa0404
	.p2align	2, 0x0
_il_slot_inBIa0404:
	.long	_il_mem_inBIa0404

	.bss
	.globl	_il_mem_inBIa0504               # @il_mem_inBIa0504
_il_mem_inBIa0504:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inBIa0504              # @il_slot_inBIa0504
	.p2align	2, 0x0
_il_slot_inBIa0504:
	.long	_il_mem_inBIa0504

	.bss
	.globl	_il_mem_inCLR01                 # @il_mem_inCLR01
_il_mem_inCLR01:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inCLR01                # @il_slot_inCLR01
	.p2align	2, 0x0
_il_slot_inCLR01:
	.long	_il_mem_inCLR01

	.bss
	.globl	_il_mem_inCLR02                 # @il_mem_inCLR02
_il_mem_inCLR02:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inCLR02                # @il_slot_inCLR02
	.p2align	2, 0x0
_il_slot_inCLR02:
	.long	_il_mem_inCLR02

	.bss
	.globl	_il_mem_inCLR03                 # @il_mem_inCLR03
_il_mem_inCLR03:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inCLR03                # @il_slot_inCLR03
	.p2align	2, 0x0
_il_slot_inCLR03:
	.long	_il_mem_inCLR03

	.bss
	.globl	_il_mem_inCLR0401               # @il_mem_inCLR0401
_il_mem_inCLR0401:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inCLR0401              # @il_slot_inCLR0401
	.p2align	2, 0x0
_il_slot_inCLR0401:
	.long	_il_mem_inCLR0401

	.bss
	.globl	_il_mem_inCLR0402               # @il_mem_inCLR0402
_il_mem_inCLR0402:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inCLR0402              # @il_slot_inCLR0402
	.p2align	2, 0x0
_il_slot_inCLR0402:
	.long	_il_mem_inCLR0402

	.bss
	.globl	_il_mem_inCounter               # @il_mem_inCounter
_il_mem_inCounter:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inCounter              # @il_slot_inCounter
	.p2align	2, 0x0
_il_slot_inCounter:
	.long	_il_mem_inCounter

	.bss
	.globl	_il_mem_inCounter2              # @il_mem_inCounter2
_il_mem_inCounter2:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inCounter2             # @il_slot_inCounter2
	.p2align	2, 0x0
_il_slot_inCounter2:
	.long	_il_mem_inCounter2

	.bss
	.globl	_il_mem_inCounter3              # @il_mem_inCounter3
_il_mem_inCounter3:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inCounter3             # @il_slot_inCounter3
	.p2align	2, 0x0
_il_slot_inCounter3:
	.long	_il_mem_inCounter3

	.bss
	.globl	_il_mem_inCounter04             # @il_mem_inCounter04
_il_mem_inCounter04:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inCounter04            # @il_slot_inCounter04
	.p2align	2, 0x0
_il_slot_inCounter04:
	.long	_il_mem_inCounter04

	.bss
	.globl	_il_mem_inCounter05             # @il_mem_inCounter05
_il_mem_inCounter05:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inCounter05            # @il_slot_inCounter05
	.p2align	2, 0x0
_il_slot_inCounter05:
	.long	_il_mem_inCounter05

	.bss
	.globl	_il_mem_inCounter06             # @il_mem_inCounter06
_il_mem_inCounter06:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inCounter06            # @il_slot_inCounter06
	.p2align	2, 0x0
_il_slot_inCounter06:
	.long	_il_mem_inCounter06

	.bss
	.globl	_il_mem_inDIFU                  # @il_mem_inDIFU
_il_mem_inDIFU:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inDIFU                 # @il_slot_inDIFU
	.p2align	2, 0x0
_il_slot_inDIFU:
	.long	_il_mem_inDIFU

	.bss
	.globl	_il_mem_inDIFD                  # @il_mem_inDIFD
_il_mem_inDIFD:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inDIFD                 # @il_slot_inDIFD
	.p2align	2, 0x0
_il_slot_inDIFD:
	.long	_il_mem_inDIFD

	.bss
	.globl	_il_mem_inTIMER01               # @il_mem_inTIMER01
_il_mem_inTIMER01:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inTIMER01              # @il_slot_inTIMER01
	.p2align	2, 0x0
_il_slot_inTIMER01:
	.long	_il_mem_inTIMER01

	.bss
	.globl	_il_mem_inTimER02               # @il_mem_inTimER02
_il_mem_inTimER02:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inTimER02              # @il_slot_inTimER02
	.p2align	2, 0x0
_il_slot_inTimER02:
	.long	_il_mem_inTimER02

	.bss
	.globl	_il_mem_inTimeR03               # @il_mem_inTimeR03
_il_mem_inTimeR03:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inTimeR03              # @il_slot_inTimeR03
	.p2align	2, 0x0
_il_slot_inTimeR03:
	.long	_il_mem_inTimeR03

	.bss
	.globl	_il_mem_inTimer05               # @il_mem_inTimer05
_il_mem_inTimer05:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inTimer05              # @il_slot_inTimer05
	.p2align	2, 0x0
_il_slot_inTimer05:
	.long	_il_mem_inTimer05

	.bss
	.globl	_il_mem_inTimer06               # @il_mem_inTimer06
_il_mem_inTimer06:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inTimer06              # @il_slot_inTimer06
	.p2align	2, 0x0
_il_slot_inTimer06:
	.long	_il_mem_inTimer06

	.bss
	.globl	_il_mem_inTimer07               # @il_mem_inTimer07
_il_mem_inTimer07:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_inTimer07              # @il_slot_inTimer07
	.p2align	2, 0x0
_il_slot_inTimer07:
	.long	_il_mem_inTimer07

	.bss
	.globl	_il_mem_resLD                   # @il_mem_resLD
_il_mem_resLD:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resLD                  # @il_slot_resLD
	.p2align	2, 0x0
_il_slot_resLD:
	.long	_il_mem_resLD

	.bss
	.globl	_il_mem_C005                    # @il_mem_C005
_il_mem_C005:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_C005                   # @il_slot_C005
	.p2align	2, 0x0
_il_slot_C005:
	.long	_il_mem_C005

	.bss
	.globl	_il_mem_resAND                  # @il_mem_resAND
_il_mem_resAND:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resAND                 # @il_slot_resAND
	.p2align	2, 0x0
_il_slot_resAND:
	.long	_il_mem_resAND

	.bss
	.globl	_il_mem_C007                    # @il_mem_C007
_il_mem_C007:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_C007                   # @il_slot_C007
	.p2align	2, 0x0
_il_slot_C007:
	.long	_il_mem_C007

	.bss
	.globl	_il_mem_C010                    # @il_mem_C010
_il_mem_C010:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_C010                   # @il_slot_C010
	.p2align	2, 0x0
_il_slot_C010:
	.long	_il_mem_C010

	.bss
	.globl	_il_mem_resOR                   # @il_mem_resOR
_il_mem_resOR:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resOR                  # @il_slot_resOR
	.p2align	2, 0x0
_il_slot_resOR:
	.long	_il_mem_resOR

	.bss
	.globl	_il_mem_C015                    # @il_mem_C015
_il_mem_C015:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_C015                   # @il_slot_C015
	.p2align	2, 0x0
_il_slot_C015:
	.long	_il_mem_C015

	.bss
	.globl	_il_mem_resOUT                  # @il_mem_resOUT
_il_mem_resOUT:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resOUT                 # @il_slot_resOUT
	.p2align	2, 0x0
_il_slot_resOUT:
	.long	_il_mem_resOUT

	.bss
	.globl	_il_mem_resSET                  # @il_mem_resSET
_il_mem_resSET:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resSET                 # @il_slot_resSET
	.p2align	2, 0x0
_il_slot_resSET:
	.long	_il_mem_resSET

	.bss
	.globl	_il_mem_C024                    # @il_mem_C024
_il_mem_C024:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_C024                   # @il_slot_C024
	.p2align	2, 0x0
_il_slot_C024:
	.long	_il_mem_C024

	.bss
	.globl	_il_mem_resRES                  # @il_mem_resRES
_il_mem_resRES:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resRES                 # @il_slot_resRES
	.p2align	2, 0x0
_il_slot_resRES:
	.long	_il_mem_resRES

	.bss
	.globl	_il_mem_TON_1_IN                # @il_mem_TON_1_IN
_il_mem_TON_1_IN:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TON_1_IN               # @il_slot_TON_1_IN
	.p2align	2, 0x0
_il_slot_TON_1_IN:
	.long	_il_mem_TON_1_IN

	.bss
	.globl	_il_mem_TON_2_IN                # @il_mem_TON_2_IN
_il_mem_TON_2_IN:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TON_2_IN               # @il_slot_TON_2_IN
	.p2align	2, 0x0
_il_slot_TON_2_IN:
	.long	_il_mem_TON_2_IN

	.bss
	.globl	_il_mem_TON_1_PT                # @il_mem_TON_1_PT
	.p2align	2, 0x0
_il_mem_TON_1_PT:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_TON_1_PT               # @il_slot_TON_1_PT
	.p2align	2, 0x0
_il_slot_TON_1_PT:
	.long	_il_mem_TON_1_PT

	.bss
	.globl	_il_mem_TON_1_Q                 # @il_mem_TON_1_Q
_il_mem_TON_1_Q:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TON_1_Q                # @il_slot_TON_1_Q
	.p2align	2, 0x0
_il_slot_TON_1_Q:
	.long	_il_mem_TON_1_Q

	.bss
	.globl	_il_mem_resTimer01              # @il_mem_resTimer01
_il_mem_resTimer01:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resTimer01             # @il_slot_resTimer01
	.p2align	2, 0x0
_il_slot_resTimer01:
	.long	_il_mem_resTimer01

	.bss
	.globl	_il_mem_TON_1_ET                # @il_mem_TON_1_ET
_il_mem_TON_1_ET:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TON_1_ET               # @il_slot_TON_1_ET
	.p2align	2, 0x0
_il_slot_TON_1_ET:
	.long	_il_mem_TON_1_ET

	.bss
	.globl	_il_mem_passed01                # @il_mem_passed01
_il_mem_passed01:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_passed01               # @il_slot_passed01
	.p2align	2, 0x0
_il_slot_passed01:
	.long	_il_mem_passed01

	.bss
	.globl	_il_mem_TIME_1m                 # @il_mem_TIME_1m
_il_mem_TIME_1m:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TIME_1m                # @il_slot_TIME_1m
	.p2align	2, 0x0
_il_slot_TIME_1m:
	.long	_il_mem_TIME_1m

	.bss
	.globl	_il_mem_TON_2_PT                # @il_mem_TON_2_PT
_il_mem_TON_2_PT:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TON_2_PT               # @il_slot_TON_2_PT
	.p2align	2, 0x0
_il_slot_TON_2_PT:
	.long	_il_mem_TON_2_PT

	.bss
	.globl	_il_mem_TON_2_Q                 # @il_mem_TON_2_Q
_il_mem_TON_2_Q:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TON_2_Q                # @il_slot_TON_2_Q
	.p2align	2, 0x0
_il_slot_TON_2_Q:
	.long	_il_mem_TON_2_Q

	.bss
	.globl	_il_mem_resTimer02              # @il_mem_resTimer02
_il_mem_resTimer02:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resTimer02             # @il_slot_resTimer02
	.p2align	2, 0x0
_il_slot_resTimer02:
	.long	_il_mem_resTimer02

	.bss
	.globl	_il_mem_TON_2_ET                # @il_mem_TON_2_ET
_il_mem_TON_2_ET:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TON_2_ET               # @il_slot_TON_2_ET
	.p2align	2, 0x0
_il_slot_TON_2_ET:
	.long	_il_mem_TON_2_ET

	.bss
	.globl	_il_mem_passed02                # @il_mem_passed02
_il_mem_passed02:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_passed02               # @il_slot_passed02
	.p2align	2, 0x0
_il_slot_passed02:
	.long	_il_mem_passed02

	.bss
	.globl	_il_mem_resLD_T01               # @il_mem_resLD_T01
_il_mem_resLD_T01:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resLD_T01              # @il_slot_resLD_T01
	.p2align	2, 0x0
_il_slot_resLD_T01:
	.long	_il_mem_resLD_T01

	.bss
	.globl	_il_mem_resLD_T02               # @il_mem_resLD_T02
_il_mem_resLD_T02:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resLD_T02              # @il_slot_resLD_T02
	.p2align	2, 0x0
_il_slot_resLD_T02:
	.long	_il_mem_resLD_T02

	.bss
	.globl	_il_mem_CTU_1_CU                # @il_mem_CTU_1_CU
_il_mem_CTU_1_CU:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_1_CU               # @il_slot_CTU_1_CU
	.p2align	2, 0x0
_il_slot_CTU_1_CU:
	.long	_il_mem_CTU_1_CU

	.bss
	.globl	_il_mem_enableCnt               # @il_mem_enableCnt
_il_mem_enableCnt:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_enableCnt              # @il_slot_enableCnt
	.p2align	2, 0x0
_il_slot_enableCnt:
	.long	_il_mem_enableCnt

	.bss
	.globl	_il_mem_CTU_1_RESET             # @il_mem_CTU_1_RESET
_il_mem_CTU_1_RESET:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_1_RESET            # @il_slot_CTU_1_RESET
	.p2align	2, 0x0
_il_slot_CTU_1_RESET:
	.long	_il_mem_CTU_1_RESET

	.bss
	.globl	_il_mem_CTU_1_PV                # @il_mem_CTU_1_PV
	.p2align	2, 0x0
_il_mem_CTU_1_PV:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_CTU_1_PV               # @il_slot_CTU_1_PV
	.p2align	2, 0x0
_il_slot_CTU_1_PV:
	.long	_il_mem_CTU_1_PV

	.bss
	.globl	_il_mem_CTU_1__prev_cu          # @il_mem_CTU_1__prev_cu
_il_mem_CTU_1__prev_cu:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_1__prev_cu         # @il_slot_CTU_1__prev_cu
	.p2align	2, 0x0
_il_slot_CTU_1__prev_cu:
	.long	_il_mem_CTU_1__prev_cu

	.bss
	.globl	_il_mem_CTU_1_Q                 # @il_mem_CTU_1_Q
_il_mem_CTU_1_Q:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_1_Q                # @il_slot_CTU_1_Q
	.p2align	2, 0x0
_il_slot_CTU_1_Q:
	.long	_il_mem_CTU_1_Q

	.bss
	.globl	_il_mem_outConter               # @il_mem_outConter
_il_mem_outConter:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_outConter              # @il_slot_outConter
	.p2align	2, 0x0
_il_slot_outConter:
	.long	_il_mem_outConter

	.bss
	.globl	_il_mem_CTU_1_CV                # @il_mem_CTU_1_CV
	.p2align	2, 0x0
_il_mem_CTU_1_CV:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_CTU_1_CV               # @il_slot_CTU_1_CV
	.p2align	2, 0x0
_il_slot_CTU_1_CV:
	.long	_il_mem_CTU_1_CV

	.bss
	.globl	_il_mem_valCounter              # @il_mem_valCounter
	.p2align	2, 0x0
_il_mem_valCounter:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_valCounter             # @il_slot_valCounter
	.p2align	2, 0x0
_il_slot_valCounter:
	.long	_il_mem_valCounter

	.bss
	.globl	_il_mem_resLD_C                 # @il_mem_resLD_C
_il_mem_resLD_C:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resLD_C                # @il_slot_resLD_C
	.p2align	2, 0x0
_il_slot_resLD_C:
	.long	_il_mem_resLD_C

	.bss
	.globl	_il_mem_TON_3_IN                # @il_mem_TON_3_IN
_il_mem_TON_3_IN:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TON_3_IN               # @il_slot_TON_3_IN
	.p2align	2, 0x0
_il_slot_TON_3_IN:
	.long	_il_mem_TON_3_IN

	.bss
	.globl	_il_mem_TON_3_PT                # @il_mem_TON_3_PT
	.p2align	2, 0x0
_il_mem_TON_3_PT:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_TON_3_PT               # @il_slot_TON_3_PT
	.p2align	2, 0x0
_il_slot_TON_3_PT:
	.long	_il_mem_TON_3_PT

	.bss
	.globl	_il_mem_TON_3_Q                 # @il_mem_TON_3_Q
_il_mem_TON_3_Q:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TON_3_Q                # @il_slot_TON_3_Q
	.p2align	2, 0x0
_il_slot_TON_3_Q:
	.long	_il_mem_TON_3_Q

	.bss
	.globl	_il_mem_resT5                   # @il_mem_resT5
_il_mem_resT5:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resT5                  # @il_slot_resT5
	.p2align	2, 0x0
_il_slot_resT5:
	.long	_il_mem_resT5

	.bss
	.globl	_il_mem_TON_3_ET                # @il_mem_TON_3_ET
_il_mem_TON_3_ET:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TON_3_ET               # @il_slot_TON_3_ET
	.p2align	2, 0x0
_il_slot_TON_3_ET:
	.long	_il_mem_TON_3_ET

	.bss
	.globl	_il_mem_passed03                # @il_mem_passed03
_il_mem_passed03:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_passed03               # @il_slot_passed03
	.p2align	2, 0x0
_il_slot_passed03:
	.long	_il_mem_passed03

	.bss
	.globl	_il_mem_CTU_2_CU                # @il_mem_CTU_2_CU
_il_mem_CTU_2_CU:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_2_CU               # @il_slot_CTU_2_CU
	.p2align	2, 0x0
_il_slot_CTU_2_CU:
	.long	_il_mem_CTU_2_CU

	.bss
	.globl	_il_mem_CTU_2_RESET             # @il_mem_CTU_2_RESET
_il_mem_CTU_2_RESET:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_2_RESET            # @il_slot_CTU_2_RESET
	.p2align	2, 0x0
_il_slot_CTU_2_RESET:
	.long	_il_mem_CTU_2_RESET

	.bss
	.globl	_il_mem_CTU_2_PV                # @il_mem_CTU_2_PV
	.p2align	2, 0x0
_il_mem_CTU_2_PV:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_CTU_2_PV               # @il_slot_CTU_2_PV
	.p2align	2, 0x0
_il_slot_CTU_2_PV:
	.long	_il_mem_CTU_2_PV

	.bss
	.globl	_il_mem_CTU_2__prev_cu          # @il_mem_CTU_2__prev_cu
_il_mem_CTU_2__prev_cu:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_2__prev_cu         # @il_slot_CTU_2__prev_cu
	.p2align	2, 0x0
_il_slot_CTU_2__prev_cu:
	.long	_il_mem_CTU_2__prev_cu

	.bss
	.globl	_il_mem_CTU_2_Q                 # @il_mem_CTU_2_Q
_il_mem_CTU_2_Q:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_2_Q                # @il_slot_CTU_2_Q
	.p2align	2, 0x0
_il_slot_CTU_2_Q:
	.long	_il_mem_CTU_2_Q

	.bss
	.globl	_il_mem_outConter2              # @il_mem_outConter2
_il_mem_outConter2:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_outConter2             # @il_slot_outConter2
	.p2align	2, 0x0
_il_slot_outConter2:
	.long	_il_mem_outConter2

	.bss
	.globl	_il_mem_CTU_2_CV                # @il_mem_CTU_2_CV
	.p2align	2, 0x0
_il_mem_CTU_2_CV:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_CTU_2_CV               # @il_slot_CTU_2_CV
	.p2align	2, 0x0
_il_slot_CTU_2_CV:
	.long	_il_mem_CTU_2_CV

	.bss
	.globl	_il_mem_valCounter2             # @il_mem_valCounter2
	.p2align	2, 0x0
_il_mem_valCounter2:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_valCounter2            # @il_slot_valCounter2
	.p2align	2, 0x0
_il_slot_valCounter2:
	.long	_il_mem_valCounter2

	.bss
	.globl	_il_mem_TON_4_IN                # @il_mem_TON_4_IN
_il_mem_TON_4_IN:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TON_4_IN               # @il_slot_TON_4_IN
	.p2align	2, 0x0
_il_slot_TON_4_IN:
	.long	_il_mem_TON_4_IN

	.bss
	.globl	_il_mem_TON_4_PT                # @il_mem_TON_4_PT
	.p2align	2, 0x0
_il_mem_TON_4_PT:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_TON_4_PT               # @il_slot_TON_4_PT
	.p2align	2, 0x0
_il_slot_TON_4_PT:
	.long	_il_mem_TON_4_PT

	.bss
	.globl	_il_mem_TON_4_Q                 # @il_mem_TON_4_Q
_il_mem_TON_4_Q:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TON_4_Q                # @il_slot_TON_4_Q
	.p2align	2, 0x0
_il_slot_TON_4_Q:
	.long	_il_mem_TON_4_Q

	.bss
	.globl	_il_mem_outTimer                # @il_mem_outTimer
_il_mem_outTimer:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_outTimer               # @il_slot_outTimer
	.p2align	2, 0x0
_il_slot_outTimer:
	.long	_il_mem_outTimer

	.bss
	.globl	_il_mem_TON_4_ET                # @il_mem_TON_4_ET
_il_mem_TON_4_ET:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TON_4_ET               # @il_slot_TON_4_ET
	.p2align	2, 0x0
_il_slot_TON_4_ET:
	.long	_il_mem_TON_4_ET

	.bss
	.globl	_il_mem_passed04                # @il_mem_passed04
_il_mem_passed04:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_passed04               # @il_slot_passed04
	.p2align	2, 0x0
_il_slot_passed04:
	.long	_il_mem_passed04

	.bss
	.globl	_il_mem_C046                    # @il_mem_C046
_il_mem_C046:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_C046                   # @il_slot_C046
	.p2align	2, 0x0
_il_slot_C046:
	.long	_il_mem_C046

	.bss
	.globl	_il_mem_resAND_T                # @il_mem_resAND_T
_il_mem_resAND_T:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resAND_T               # @il_slot_resAND_T
	.p2align	2, 0x0
_il_slot_resAND_T:
	.long	_il_mem_resAND_T

	.bss
	.globl	_il_mem_CTU_3_CU                # @il_mem_CTU_3_CU
_il_mem_CTU_3_CU:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_3_CU               # @il_slot_CTU_3_CU
	.p2align	2, 0x0
_il_slot_CTU_3_CU:
	.long	_il_mem_CTU_3_CU

	.bss
	.globl	_il_mem_CTU_3_RESET             # @il_mem_CTU_3_RESET
_il_mem_CTU_3_RESET:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_3_RESET            # @il_slot_CTU_3_RESET
	.p2align	2, 0x0
_il_slot_CTU_3_RESET:
	.long	_il_mem_CTU_3_RESET

	.bss
	.globl	_il_mem_CTU_3_PV                # @il_mem_CTU_3_PV
	.p2align	2, 0x0
_il_mem_CTU_3_PV:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_CTU_3_PV               # @il_slot_CTU_3_PV
	.p2align	2, 0x0
_il_slot_CTU_3_PV:
	.long	_il_mem_CTU_3_PV

	.bss
	.globl	_il_mem_CTU_3__prev_cu          # @il_mem_CTU_3__prev_cu
_il_mem_CTU_3__prev_cu:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_3__prev_cu         # @il_slot_CTU_3__prev_cu
	.p2align	2, 0x0
_il_slot_CTU_3__prev_cu:
	.long	_il_mem_CTU_3__prev_cu

	.bss
	.globl	_il_mem_CTU_3_Q                 # @il_mem_CTU_3_Q
_il_mem_CTU_3_Q:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_3_Q                # @il_slot_CTU_3_Q
	.p2align	2, 0x0
_il_slot_CTU_3_Q:
	.long	_il_mem_CTU_3_Q

	.bss
	.globl	_il_mem_outCounter3             # @il_mem_outCounter3
_il_mem_outCounter3:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_outCounter3            # @il_slot_outCounter3
	.p2align	2, 0x0
_il_slot_outCounter3:
	.long	_il_mem_outCounter3

	.bss
	.globl	_il_mem_CTU_3_CV                # @il_mem_CTU_3_CV
	.p2align	2, 0x0
_il_mem_CTU_3_CV:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_CTU_3_CV               # @il_slot_CTU_3_CV
	.p2align	2, 0x0
_il_slot_CTU_3_CV:
	.long	_il_mem_CTU_3_CV

	.bss
	.globl	_il_mem_valCounter3             # @il_mem_valCounter3
	.p2align	2, 0x0
_il_mem_valCounter3:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_valCounter3            # @il_slot_valCounter3
	.p2align	2, 0x0
_il_slot_valCounter3:
	.long	_il_mem_valCounter3

	.bss
	.globl	_il_mem_C052                    # @il_mem_C052
_il_mem_C052:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_C052                   # @il_slot_C052
	.p2align	2, 0x0
_il_slot_C052:
	.long	_il_mem_C052

	.bss
	.globl	_il_mem_resAND_C                # @il_mem_resAND_C
_il_mem_resAND_C:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resAND_C               # @il_slot_resAND_C
	.p2align	2, 0x0
_il_slot_resAND_C:
	.long	_il_mem_resAND_C

	.bss
	.globl	_il_mem_TON_5_IN                # @il_mem_TON_5_IN
_il_mem_TON_5_IN:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TON_5_IN               # @il_slot_TON_5_IN
	.p2align	2, 0x0
_il_slot_TON_5_IN:
	.long	_il_mem_TON_5_IN

	.bss
	.globl	_il_mem_TON_5_PT                # @il_mem_TON_5_PT
	.p2align	2, 0x0
_il_mem_TON_5_PT:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_TON_5_PT               # @il_slot_TON_5_PT
	.p2align	2, 0x0
_il_slot_TON_5_PT:
	.long	_il_mem_TON_5_PT

	.bss
	.globl	_il_mem_TON_5_Q                 # @il_mem_TON_5_Q
_il_mem_TON_5_Q:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TON_5_Q                # @il_slot_TON_5_Q
	.p2align	2, 0x0
_il_slot_TON_5_Q:
	.long	_il_mem_TON_5_Q

	.bss
	.globl	_il_mem_outTimer05              # @il_mem_outTimer05
_il_mem_outTimer05:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_outTimer05             # @il_slot_outTimer05
	.p2align	2, 0x0
_il_slot_outTimer05:
	.long	_il_mem_outTimer05

	.bss
	.globl	_il_mem_TON_5_ET                # @il_mem_TON_5_ET
_il_mem_TON_5_ET:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TON_5_ET               # @il_slot_TON_5_ET
	.p2align	2, 0x0
_il_slot_TON_5_ET:
	.long	_il_mem_TON_5_ET

	.bss
	.globl	_il_mem_passed05                # @il_mem_passed05
_il_mem_passed05:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_passed05               # @il_slot_passed05
	.p2align	2, 0x0
_il_slot_passed05:
	.long	_il_mem_passed05

	.bss
	.globl	_il_mem_C055                    # @il_mem_C055
_il_mem_C055:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_C055                   # @il_slot_C055
	.p2align	2, 0x0
_il_slot_C055:
	.long	_il_mem_C055

	.bss
	.globl	_il_mem_CTU_4_CU                # @il_mem_CTU_4_CU
_il_mem_CTU_4_CU:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_4_CU               # @il_slot_CTU_4_CU
	.p2align	2, 0x0
_il_slot_CTU_4_CU:
	.long	_il_mem_CTU_4_CU

	.bss
	.globl	_il_mem_CTU_4_RESET             # @il_mem_CTU_4_RESET
_il_mem_CTU_4_RESET:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_4_RESET            # @il_slot_CTU_4_RESET
	.p2align	2, 0x0
_il_slot_CTU_4_RESET:
	.long	_il_mem_CTU_4_RESET

	.bss
	.globl	_il_mem_CTU_4_PV                # @il_mem_CTU_4_PV
	.p2align	2, 0x0
_il_mem_CTU_4_PV:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_CTU_4_PV               # @il_slot_CTU_4_PV
	.p2align	2, 0x0
_il_slot_CTU_4_PV:
	.long	_il_mem_CTU_4_PV

	.bss
	.globl	_il_mem_CTU_4__prev_cu          # @il_mem_CTU_4__prev_cu
_il_mem_CTU_4__prev_cu:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_4__prev_cu         # @il_slot_CTU_4__prev_cu
	.p2align	2, 0x0
_il_slot_CTU_4__prev_cu:
	.long	_il_mem_CTU_4__prev_cu

	.bss
	.globl	_il_mem_CTU_4_Q                 # @il_mem_CTU_4_Q
_il_mem_CTU_4_Q:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_4_Q                # @il_slot_CTU_4_Q
	.p2align	2, 0x0
_il_slot_CTU_4_Q:
	.long	_il_mem_CTU_4_Q

	.bss
	.globl	_il_mem_outConter04             # @il_mem_outConter04
_il_mem_outConter04:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_outConter04            # @il_slot_outConter04
	.p2align	2, 0x0
_il_slot_outConter04:
	.long	_il_mem_outConter04

	.bss
	.globl	_il_mem_CTU_4_CV                # @il_mem_CTU_4_CV
	.p2align	2, 0x0
_il_mem_CTU_4_CV:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_CTU_4_CV               # @il_slot_CTU_4_CV
	.p2align	2, 0x0
_il_slot_CTU_4_CV:
	.long	_il_mem_CTU_4_CV

	.bss
	.globl	_il_mem_valCounter04            # @il_mem_valCounter04
	.p2align	2, 0x0
_il_mem_valCounter04:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_valCounter04           # @il_slot_valCounter04
	.p2align	2, 0x0
_il_slot_valCounter04:
	.long	_il_mem_valCounter04

	.bss
	.globl	_il_mem_C061                    # @il_mem_C061
_il_mem_C061:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_C061                   # @il_slot_C061
	.p2align	2, 0x0
_il_slot_C061:
	.long	_il_mem_C061

	.bss
	.globl	_il_mem_TON_6_IN                # @il_mem_TON_6_IN
_il_mem_TON_6_IN:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TON_6_IN               # @il_slot_TON_6_IN
	.p2align	2, 0x0
_il_slot_TON_6_IN:
	.long	_il_mem_TON_6_IN

	.bss
	.globl	_il_mem_TON_6_PT                # @il_mem_TON_6_PT
	.p2align	2, 0x0
_il_mem_TON_6_PT:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_TON_6_PT               # @il_slot_TON_6_PT
	.p2align	2, 0x0
_il_slot_TON_6_PT:
	.long	_il_mem_TON_6_PT

	.bss
	.globl	_il_mem_TON_6_Q                 # @il_mem_TON_6_Q
_il_mem_TON_6_Q:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TON_6_Q                # @il_slot_TON_6_Q
	.p2align	2, 0x0
_il_slot_TON_6_Q:
	.long	_il_mem_TON_6_Q

	.bss
	.globl	_il_mem_outTimer06              # @il_mem_outTimer06
_il_mem_outTimer06:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_outTimer06             # @il_slot_outTimer06
	.p2align	2, 0x0
_il_slot_outTimer06:
	.long	_il_mem_outTimer06

	.bss
	.globl	_il_mem_TON_6_ET                # @il_mem_TON_6_ET
_il_mem_TON_6_ET:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TON_6_ET               # @il_slot_TON_6_ET
	.p2align	2, 0x0
_il_slot_TON_6_ET:
	.long	_il_mem_TON_6_ET

	.bss
	.globl	_il_mem_passed06                # @il_mem_passed06
_il_mem_passed06:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_passed06               # @il_slot_passed06
	.p2align	2, 0x0
_il_slot_passed06:
	.long	_il_mem_passed06

	.bss
	.globl	_il_mem_C065                    # @il_mem_C065
_il_mem_C065:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_C065                   # @il_slot_C065
	.p2align	2, 0x0
_il_slot_C065:
	.long	_il_mem_C065

	.bss
	.globl	_il_mem_resOR_T                 # @il_mem_resOR_T
_il_mem_resOR_T:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resOR_T                # @il_slot_resOR_T
	.p2align	2, 0x0
_il_slot_resOR_T:
	.long	_il_mem_resOR_T

	.bss
	.globl	_il_mem_CTU_5_CU                # @il_mem_CTU_5_CU
_il_mem_CTU_5_CU:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_5_CU               # @il_slot_CTU_5_CU
	.p2align	2, 0x0
_il_slot_CTU_5_CU:
	.long	_il_mem_CTU_5_CU

	.bss
	.globl	_il_mem_CTU_5_RESET             # @il_mem_CTU_5_RESET
_il_mem_CTU_5_RESET:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_5_RESET            # @il_slot_CTU_5_RESET
	.p2align	2, 0x0
_il_slot_CTU_5_RESET:
	.long	_il_mem_CTU_5_RESET

	.bss
	.globl	_il_mem_CTU_5_PV                # @il_mem_CTU_5_PV
	.p2align	2, 0x0
_il_mem_CTU_5_PV:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_CTU_5_PV               # @il_slot_CTU_5_PV
	.p2align	2, 0x0
_il_slot_CTU_5_PV:
	.long	_il_mem_CTU_5_PV

	.bss
	.globl	_il_mem_CTU_5__prev_cu          # @il_mem_CTU_5__prev_cu
_il_mem_CTU_5__prev_cu:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_5__prev_cu         # @il_slot_CTU_5__prev_cu
	.p2align	2, 0x0
_il_slot_CTU_5__prev_cu:
	.long	_il_mem_CTU_5__prev_cu

	.bss
	.globl	_il_mem_CTU_5_Q                 # @il_mem_CTU_5_Q
_il_mem_CTU_5_Q:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_5_Q                # @il_slot_CTU_5_Q
	.p2align	2, 0x0
_il_slot_CTU_5_Q:
	.long	_il_mem_CTU_5_Q

	.bss
	.globl	_il_mem_outCounter05            # @il_mem_outCounter05
_il_mem_outCounter05:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_outCounter05           # @il_slot_outCounter05
	.p2align	2, 0x0
_il_slot_outCounter05:
	.long	_il_mem_outCounter05

	.bss
	.globl	_il_mem_CTU_5_CV                # @il_mem_CTU_5_CV
	.p2align	2, 0x0
_il_mem_CTU_5_CV:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_CTU_5_CV               # @il_slot_CTU_5_CV
	.p2align	2, 0x0
_il_slot_CTU_5_CV:
	.long	_il_mem_CTU_5_CV

	.bss
	.globl	_il_mem_valCounter05            # @il_mem_valCounter05
	.p2align	2, 0x0
_il_mem_valCounter05:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_valCounter05           # @il_slot_valCounter05
	.p2align	2, 0x0
_il_slot_valCounter05:
	.long	_il_mem_valCounter05

	.bss
	.globl	_il_mem_C069                    # @il_mem_C069
_il_mem_C069:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_C069                   # @il_slot_C069
	.p2align	2, 0x0
_il_slot_C069:
	.long	_il_mem_C069

	.bss
	.globl	_il_mem_resOR_C                 # @il_mem_resOR_C
_il_mem_resOR_C:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resOR_C                # @il_slot_resOR_C
	.p2align	2, 0x0
_il_slot_resOR_C:
	.long	_il_mem_resOR_C

	.bss
	.globl	_il_mem_TON_7_IN                # @il_mem_TON_7_IN
_il_mem_TON_7_IN:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TON_7_IN               # @il_slot_TON_7_IN
	.p2align	2, 0x0
_il_slot_TON_7_IN:
	.long	_il_mem_TON_7_IN

	.bss
	.globl	_il_mem_TON_7_PT                # @il_mem_TON_7_PT
	.p2align	2, 0x0
_il_mem_TON_7_PT:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_TON_7_PT               # @il_slot_TON_7_PT
	.p2align	2, 0x0
_il_slot_TON_7_PT:
	.long	_il_mem_TON_7_PT

	.bss
	.globl	_il_mem_TON_7_Q                 # @il_mem_TON_7_Q
_il_mem_TON_7_Q:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TON_7_Q                # @il_slot_TON_7_Q
	.p2align	2, 0x0
_il_slot_TON_7_Q:
	.long	_il_mem_TON_7_Q

	.bss
	.globl	_il_mem_outTimer07              # @il_mem_outTimer07
_il_mem_outTimer07:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_outTimer07             # @il_slot_outTimer07
	.p2align	2, 0x0
_il_slot_outTimer07:
	.long	_il_mem_outTimer07

	.bss
	.globl	_il_mem_TON_7_ET                # @il_mem_TON_7_ET
_il_mem_TON_7_ET:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_TON_7_ET               # @il_slot_TON_7_ET
	.p2align	2, 0x0
_il_slot_TON_7_ET:
	.long	_il_mem_TON_7_ET

	.bss
	.globl	_il_mem_passed07                # @il_mem_passed07
_il_mem_passed07:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_passed07               # @il_slot_passed07
	.p2align	2, 0x0
_il_slot_passed07:
	.long	_il_mem_passed07

	.bss
	.globl	_il_mem_C075                    # @il_mem_C075
_il_mem_C075:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_C075                   # @il_slot_C075
	.p2align	2, 0x0
_il_slot_C075:
	.long	_il_mem_C075

	.bss
	.globl	_il_mem_CTU_6_CU                # @il_mem_CTU_6_CU
_il_mem_CTU_6_CU:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_6_CU               # @il_slot_CTU_6_CU
	.p2align	2, 0x0
_il_slot_CTU_6_CU:
	.long	_il_mem_CTU_6_CU

	.bss
	.globl	_il_mem_CTU_6_RESET             # @il_mem_CTU_6_RESET
_il_mem_CTU_6_RESET:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_6_RESET            # @il_slot_CTU_6_RESET
	.p2align	2, 0x0
_il_slot_CTU_6_RESET:
	.long	_il_mem_CTU_6_RESET

	.bss
	.globl	_il_mem_CTU_6_PV                # @il_mem_CTU_6_PV
	.p2align	2, 0x0
_il_mem_CTU_6_PV:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_CTU_6_PV               # @il_slot_CTU_6_PV
	.p2align	2, 0x0
_il_slot_CTU_6_PV:
	.long	_il_mem_CTU_6_PV

	.bss
	.globl	_il_mem_CTU_6__prev_cu          # @il_mem_CTU_6__prev_cu
_il_mem_CTU_6__prev_cu:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_6__prev_cu         # @il_slot_CTU_6__prev_cu
	.p2align	2, 0x0
_il_slot_CTU_6__prev_cu:
	.long	_il_mem_CTU_6__prev_cu

	.bss
	.globl	_il_mem_CTU_6_Q                 # @il_mem_CTU_6_Q
_il_mem_CTU_6_Q:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_6_Q                # @il_slot_CTU_6_Q
	.p2align	2, 0x0
_il_slot_CTU_6_Q:
	.long	_il_mem_CTU_6_Q

	.bss
	.globl	_il_mem_outCounter06            # @il_mem_outCounter06
_il_mem_outCounter06:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_outCounter06           # @il_slot_outCounter06
	.p2align	2, 0x0
_il_slot_outCounter06:
	.long	_il_mem_outCounter06

	.bss
	.globl	_il_mem_CTU_6_CV                # @il_mem_CTU_6_CV
	.p2align	2, 0x0
_il_mem_CTU_6_CV:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_CTU_6_CV               # @il_slot_CTU_6_CV
	.p2align	2, 0x0
_il_slot_CTU_6_CV:
	.long	_il_mem_CTU_6_CV

	.bss
	.globl	_il_mem_valCounter06            # @il_mem_valCounter06
	.p2align	2, 0x0
_il_mem_valCounter06:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_valCounter06           # @il_slot_valCounter06
	.p2align	2, 0x0
_il_slot_valCounter06:
	.long	_il_mem_valCounter06

	.bss
	.globl	_il_mem_C078                    # @il_mem_C078
_il_mem_C078:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_C078                   # @il_slot_C078
	.p2align	2, 0x0
_il_slot_C078:
	.long	_il_mem_C078

	.bss
	.globl	_il_mem_C083                    # @il_mem_C083
_il_mem_C083:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_C083                   # @il_slot_C083
	.p2align	2, 0x0
_il_slot_C083:
	.long	_il_mem_C083

	.bss
	.globl	_il_mem_IL_u5909_u6570_1        # @il_mem_IL_u5909_u6570_1
_il_mem_IL_u5909_u6570_1:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_IL_u5909_u6570_1       # @il_slot_IL_u5909_u6570_1
	.p2align	2, 0x0
_il_slot_IL_u5909_u6570_1:
	.long	_il_mem_IL_u5909_u6570_1

	.bss
	.globl	_il_mem_C085                    # @il_mem_C085
_il_mem_C085:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_C085                   # @il_slot_C085
	.p2align	2, 0x0
_il_slot_C085:
	.long	_il_mem_C085

	.bss
	.globl	_il_mem_resANL                  # @il_mem_resANL
_il_mem_resANL:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resANL                 # @il_slot_resANL
	.p2align	2, 0x0
_il_slot_resANL:
	.long	_il_mem_resANL

	.bss
	.globl	_il_mem_IL_u5909_u6570_2        # @il_mem_IL_u5909_u6570_2
_il_mem_IL_u5909_u6570_2:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_IL_u5909_u6570_2       # @il_slot_IL_u5909_u6570_2
	.p2align	2, 0x0
_il_slot_IL_u5909_u6570_2:
	.long	_il_mem_IL_u5909_u6570_2

	.bss
	.globl	_il_mem_C089                    # @il_mem_C089
_il_mem_C089:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_C089                   # @il_slot_C089
	.p2align	2, 0x0
_il_slot_C089:
	.long	_il_mem_C089

	.bss
	.globl	_il_mem_C091                    # @il_mem_C091
_il_mem_C091:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_C091                   # @il_slot_C091
	.p2align	2, 0x0
_il_slot_C091:
	.long	_il_mem_C091

	.bss
	.globl	_il_mem_resORL                  # @il_mem_resORL
_il_mem_resORL:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resORL                 # @il_slot_resORL
	.p2align	2, 0x0
_il_slot_resORL:
	.long	_il_mem_resORL

	.bss
	.globl	_il_mem_setten0101              # @il_mem_setten0101
_il_mem_setten0101:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_setten0101             # @il_slot_setten0101
	.p2align	2, 0x0
_il_slot_setten0101:
	.long	_il_mem_setten0101

	.bss
	.globl	_il_mem_setten0102              # @il_mem_setten0102
_il_mem_setten0102:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_setten0102             # @il_slot_setten0102
	.p2align	2, 0x0
_il_slot_setten0102:
	.long	_il_mem_setten0102

	.bss
	.globl	_il_mem_IL_u5909_u6570_3        # @il_mem_IL_u5909_u6570_3
_il_mem_IL_u5909_u6570_3:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_IL_u5909_u6570_3       # @il_slot_IL_u5909_u6570_3
	.p2align	2, 0x0
_il_slot_IL_u5909_u6570_3:
	.long	_il_mem_IL_u5909_u6570_3

	.bss
	.globl	_il_mem_setten0103              # @il_mem_setten0103
_il_mem_setten0103:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_setten0103             # @il_slot_setten0103
	.p2align	2, 0x0
_il_slot_setten0103:
	.long	_il_mem_setten0103

	.bss
	.globl	_il_mem_IL_u5909_u6570_4        # @il_mem_IL_u5909_u6570_4
_il_mem_IL_u5909_u6570_4:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_IL_u5909_u6570_4       # @il_slot_IL_u5909_u6570_4
	.p2align	2, 0x0
_il_slot_IL_u5909_u6570_4:
	.long	_il_mem_IL_u5909_u6570_4

	.bss
	.globl	_il_mem_setten0104              # @il_mem_setten0104
_il_mem_setten0104:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_setten0104             # @il_slot_setten0104
	.p2align	2, 0x0
_il_slot_setten0104:
	.long	_il_mem_setten0104

	.bss
	.globl	_il_mem_resCoil01               # @il_mem_resCoil01
_il_mem_resCoil01:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resCoil01              # @il_slot_resCoil01
	.p2align	2, 0x0
_il_slot_resCoil01:
	.long	_il_mem_resCoil01

	.bss
	.globl	_il_mem_setten0204              # @il_mem_setten0204
_il_mem_setten0204:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_setten0204             # @il_slot_setten0204
	.p2align	2, 0x0
_il_slot_setten0204:
	.long	_il_mem_setten0204

	.bss
	.globl	_il_mem_resCoil02               # @il_mem_resCoil02
_il_mem_resCoil02:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resCoil02              # @il_slot_resCoil02
	.p2align	2, 0x0
_il_slot_resCoil02:
	.long	_il_mem_resCoil02

	.bss
	.globl	_il_mem_setten0304              # @il_mem_setten0304
_il_mem_setten0304:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_setten0304             # @il_slot_setten0304
	.p2align	2, 0x0
_il_slot_setten0304:
	.long	_il_mem_setten0304

	.bss
	.globl	_il_mem_resCoil03               # @il_mem_resCoil03
_il_mem_resCoil03:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resCoil03              # @il_slot_resCoil03
	.p2align	2, 0x0
_il_slot_resCoil03:
	.long	_il_mem_resCoil03

	.bss
	.globl	_il_mem_setten0403              # @il_mem_setten0403
_il_mem_setten0403:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_setten0403             # @il_slot_setten0403
	.p2align	2, 0x0
_il_slot_setten0403:
	.long	_il_mem_setten0403

	.bss
	.globl	_il_mem_resCoil04               # @il_mem_resCoil04
_il_mem_resCoil04:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resCoil04              # @il_slot_resCoil04
	.p2align	2, 0x0
_il_slot_resCoil04:
	.long	_il_mem_resCoil04

	.bss
	.globl	_il_mem_setten0503              # @il_mem_setten0503
_il_mem_setten0503:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_setten0503             # @il_slot_setten0503
	.p2align	2, 0x0
_il_slot_setten0503:
	.long	_il_mem_setten0503

	.bss
	.globl	_il_mem_resCoil05               # @il_mem_resCoil05
_il_mem_resCoil05:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resCoil05              # @il_slot_resCoil05
	.p2align	2, 0x0
_il_slot_resCoil05:
	.long	_il_mem_resCoil05

	.bss
	.globl	_il_mem_setten0603              # @il_mem_setten0603
_il_mem_setten0603:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_setten0603             # @il_slot_setten0603
	.p2align	2, 0x0
_il_slot_setten0603:
	.long	_il_mem_setten0603

	.bss
	.globl	_il_mem_resCoil06               # @il_mem_resCoil06
_il_mem_resCoil06:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resCoil06              # @il_slot_resCoil06
	.p2align	2, 0x0
_il_slot_resCoil06:
	.long	_il_mem_resCoil06

	.bss
	.globl	_il_mem_setten0702              # @il_mem_setten0702
_il_mem_setten0702:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_setten0702             # @il_slot_setten0702
	.p2align	2, 0x0
_il_slot_setten0702:
	.long	_il_mem_setten0702

	.bss
	.globl	_il_mem_resCoil07               # @il_mem_resCoil07
_il_mem_resCoil07:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resCoil07              # @il_slot_resCoil07
	.p2align	2, 0x0
_il_slot_resCoil07:
	.long	_il_mem_resCoil07

	.bss
	.globl	_il_mem_setten0802              # @il_mem_setten0802
_il_mem_setten0802:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_setten0802             # @il_slot_setten0802
	.p2align	2, 0x0
_il_slot_setten0802:
	.long	_il_mem_setten0802

	.bss
	.globl	_il_mem_resCoil08               # @il_mem_resCoil08
_il_mem_resCoil08:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resCoil08              # @il_slot_resCoil08
	.p2align	2, 0x0
_il_slot_resCoil08:
	.long	_il_mem_resCoil08

	.bss
	.globl	_il_mem_setten0902              # @il_mem_setten0902
_il_mem_setten0902:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_setten0902             # @il_slot_setten0902
	.p2align	2, 0x0
_il_slot_setten0902:
	.long	_il_mem_setten0902

	.bss
	.globl	_il_mem_resCoil09               # @il_mem_resCoil09
_il_mem_resCoil09:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resCoil09              # @il_slot_resCoil09
	.p2align	2, 0x0
_il_slot_resCoil09:
	.long	_il_mem_resCoil09

	.bss
	.globl	_il_mem_resBia01                # @il_mem_resBia01
_il_mem_resBia01:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resBia01               # @il_slot_resBia01
	.p2align	2, 0x0
_il_slot_resBia01:
	.long	_il_mem_resBia01

	.bss
	.globl	_il_mem_resBia02                # @il_mem_resBia02
_il_mem_resBia02:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resBia02               # @il_slot_resBia02
	.p2align	2, 0x0
_il_slot_resBia02:
	.long	_il_mem_resBia02

	.bss
	.globl	_il_mem_IL_u5909_u6570_5        # @il_mem_IL_u5909_u6570_5
_il_mem_IL_u5909_u6570_5:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_IL_u5909_u6570_5       # @il_slot_IL_u5909_u6570_5
	.p2align	2, 0x0
_il_slot_IL_u5909_u6570_5:
	.long	_il_mem_IL_u5909_u6570_5

	.bss
	.globl	_il_mem_resBia03                # @il_mem_resBia03
_il_mem_resBia03:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resBia03               # @il_slot_resBia03
	.p2align	2, 0x0
_il_slot_resBia03:
	.long	_il_mem_resBia03

	.bss
	.globl	_il_mem_resCLR01                # @il_mem_resCLR01
_il_mem_resCLR01:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resCLR01               # @il_slot_resCLR01
	.p2align	2, 0x0
_il_slot_resCLR01:
	.long	_il_mem_resCLR01

	.bss
	.globl	_il_mem_resCLR02                # @il_mem_resCLR02
_il_mem_resCLR02:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resCLR02               # @il_slot_resCLR02
	.p2align	2, 0x0
_il_slot_resCLR02:
	.long	_il_mem_resCLR02

	.bss
	.globl	_il_mem_resCLR03                # @il_mem_resCLR03
_il_mem_resCLR03:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resCLR03               # @il_slot_resCLR03
	.p2align	2, 0x0
_il_slot_resCLR03:
	.long	_il_mem_resCLR03

	.bss
	.globl	_il_mem_resCLR04                # @il_mem_resCLR04
_il_mem_resCLR04:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resCLR04               # @il_slot_resCLR04
	.p2align	2, 0x0
_il_slot_resCLR04:
	.long	_il_mem_resCLR04

	.bss
	.globl	_il_mem_R_TRIG_1_CLK            # @il_mem_R_TRIG_1_CLK
_il_mem_R_TRIG_1_CLK:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_R_TRIG_1_CLK           # @il_slot_R_TRIG_1_CLK
	.p2align	2, 0x0
_il_slot_R_TRIG_1_CLK:
	.long	_il_mem_R_TRIG_1_CLK

	.bss
	.globl	_il_mem_R_TRIG_1__prev_clk      # @il_mem_R_TRIG_1__prev_clk
_il_mem_R_TRIG_1__prev_clk:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_R_TRIG_1__prev_clk     # @il_slot_R_TRIG_1__prev_clk
	.p2align	2, 0x0
_il_slot_R_TRIG_1__prev_clk:
	.long	_il_mem_R_TRIG_1__prev_clk

	.bss
	.globl	_il_mem_R_TRIG_1_Q              # @il_mem_R_TRIG_1_Q
_il_mem_R_TRIG_1_Q:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_R_TRIG_1_Q             # @il_slot_R_TRIG_1_Q
	.p2align	2, 0x0
_il_slot_R_TRIG_1_Q:
	.long	_il_mem_R_TRIG_1_Q

	.bss
	.globl	_il_mem_outDIFU                 # @il_mem_outDIFU
_il_mem_outDIFU:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_outDIFU                # @il_slot_outDIFU
	.p2align	2, 0x0
_il_slot_outDIFU:
	.long	_il_mem_outDIFU

	.bss
	.globl	_il_mem_holdDIFU                # @il_mem_holdDIFU
_il_mem_holdDIFU:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_holdDIFU               # @il_slot_holdDIFU
	.p2align	2, 0x0
_il_slot_holdDIFU:
	.long	_il_mem_holdDIFU

	.bss
	.globl	_il_mem_resDIFU                 # @il_mem_resDIFU
_il_mem_resDIFU:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resDIFU                # @il_slot_resDIFU
	.p2align	2, 0x0
_il_slot_resDIFU:
	.long	_il_mem_resDIFU

	.bss
	.globl	_il_mem_F_TRIG_1_CLK            # @il_mem_F_TRIG_1_CLK
_il_mem_F_TRIG_1_CLK:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_F_TRIG_1_CLK           # @il_slot_F_TRIG_1_CLK
	.p2align	2, 0x0
_il_slot_F_TRIG_1_CLK:
	.long	_il_mem_F_TRIG_1_CLK

	.bss
	.globl	_il_mem_F_TRIG_1__prev_clk      # @il_mem_F_TRIG_1__prev_clk
_il_mem_F_TRIG_1__prev_clk:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_F_TRIG_1__prev_clk     # @il_slot_F_TRIG_1__prev_clk
	.p2align	2, 0x0
_il_slot_F_TRIG_1__prev_clk:
	.long	_il_mem_F_TRIG_1__prev_clk

	.bss
	.globl	_il_mem_F_TRIG_1_Q              # @il_mem_F_TRIG_1_Q
_il_mem_F_TRIG_1_Q:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_F_TRIG_1_Q             # @il_slot_F_TRIG_1_Q
	.p2align	2, 0x0
_il_slot_F_TRIG_1_Q:
	.long	_il_mem_F_TRIG_1_Q

	.bss
	.globl	_il_mem_outDIFD                 # @il_mem_outDIFD
_il_mem_outDIFD:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_outDIFD                # @il_slot_outDIFD
	.p2align	2, 0x0
_il_slot_outDIFD:
	.long	_il_mem_outDIFD

	.bss
	.globl	_il_mem_holdDIFD                # @il_mem_holdDIFD
_il_mem_holdDIFD:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_holdDIFD               # @il_slot_holdDIFD
	.p2align	2, 0x0
_il_slot_holdDIFD:
	.long	_il_mem_holdDIFD

	.bss
	.globl	_il_mem_resDIFD                 # @il_mem_resDIFD
_il_mem_resDIFD:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_resDIFD                # @il_slot_resDIFD
	.p2align	2, 0x0
_il_slot_resDIFD:
	.long	_il_mem_resDIFD

	.bss
	.globl	_il_mem_ECAT_Slave5_DO1         # @il_mem_ECAT_Slave5_DO1
_il_mem_ECAT_Slave5_DO1:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_ECAT_Slave5_DO1        # @il_slot_ECAT_Slave5_DO1
	.p2align	2, 0x0
_il_slot_ECAT_Slave5_DO1:
	.long	_il_mem_ECAT_Slave5_DO1

	.bss
	.globl	_il_mem_CTU_7_CU                # @il_mem_CTU_7_CU
_il_mem_CTU_7_CU:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_7_CU               # @il_slot_CTU_7_CU
	.p2align	2, 0x0
_il_slot_CTU_7_CU:
	.long	_il_mem_CTU_7_CU

	.bss
	.globl	_il_mem_CT_Reset                # @il_mem_CT_Reset
_il_mem_CT_Reset:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CT_Reset               # @il_slot_CT_Reset
	.p2align	2, 0x0
_il_slot_CT_Reset:
	.long	_il_mem_CT_Reset

	.bss
	.globl	_il_mem_CTU_7_RESET             # @il_mem_CTU_7_RESET
_il_mem_CTU_7_RESET:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_7_RESET            # @il_slot_CTU_7_RESET
	.p2align	2, 0x0
_il_slot_CTU_7_RESET:
	.long	_il_mem_CTU_7_RESET

	.bss
	.globl	_il_mem_CTU_7_PV                # @il_mem_CTU_7_PV
	.p2align	2, 0x0
_il_mem_CTU_7_PV:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_CTU_7_PV               # @il_slot_CTU_7_PV
	.p2align	2, 0x0
_il_slot_CTU_7_PV:
	.long	_il_mem_CTU_7_PV

	.bss
	.globl	_il_mem_CTU_7__prev_cu          # @il_mem_CTU_7__prev_cu
_il_mem_CTU_7__prev_cu:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_7__prev_cu         # @il_slot_CTU_7__prev_cu
	.p2align	2, 0x0
_il_slot_CTU_7__prev_cu:
	.long	_il_mem_CTU_7__prev_cu

	.bss
	.globl	_il_mem_CTU_7_Q                 # @il_mem_CTU_7_Q
_il_mem_CTU_7_Q:
	.byte	0                               # 0x0

	.data
	.globl	_il_slot_CTU_7_Q                # @il_slot_CTU_7_Q
	.p2align	2, 0x0
_il_slot_CTU_7_Q:
	.long	_il_mem_CTU_7_Q

	.bss
	.globl	_il_mem_CTU_7_CV                # @il_mem_CTU_7_CV
	.p2align	2, 0x0
_il_mem_CTU_7_CV:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_CTU_7_CV               # @il_slot_CTU_7_CV
	.p2align	2, 0x0
_il_slot_CTU_7_CV:
	.long	_il_mem_CTU_7_CV

	.bss
	.globl	_il_mem_ECAT_Slave4_AO1         # @il_mem_ECAT_Slave4_AO1
	.p2align	2, 0x0
_il_mem_ECAT_Slave4_AO1:
	.long	0                               # 0x0

	.data
	.globl	_il_slot_ECAT_Slave4_AO1        # @il_slot_ECAT_Slave4_AO1
	.p2align	2, 0x0
_il_slot_ECAT_Slave4_AO1:
	.long	_il_mem_ECAT_Slave4_AO1

	.addrsig
	.addrsig_sym _il_mem_ECAT_Slave5_DI1
	.addrsig_sym _il_mem_input01
	.addrsig_sym _il_mem_inBia0101
	.addrsig_sym _il_mem_inBia0102
	.addrsig_sym _il_mem_inBia0202
	.addrsig_sym _il_mem_inBia0203
	.addrsig_sym _il_mem_inBia0303
	.addrsig_sym _il_mem_inBIa0404
	.addrsig_sym _il_mem_inBIa0504
	.addrsig_sym _il_mem_inCLR01
	.addrsig_sym _il_mem_inCLR02
	.addrsig_sym _il_mem_inCLR03
	.addrsig_sym _il_mem_inCLR0401
	.addrsig_sym _il_mem_inCLR0402
	.addrsig_sym _il_mem_inCounter
	.addrsig_sym _il_mem_inCounter2
	.addrsig_sym _il_mem_inCounter3
	.addrsig_sym _il_mem_inCounter04
	.addrsig_sym _il_mem_inCounter05
	.addrsig_sym _il_mem_inCounter06
	.addrsig_sym _il_mem_inDIFU
	.addrsig_sym _il_mem_inDIFD
	.addrsig_sym _il_mem_inTIMER01
	.addrsig_sym _il_mem_inTimER02
	.addrsig_sym _il_mem_inTimeR03
	.addrsig_sym _il_mem_inTimer05
	.addrsig_sym _il_mem_inTimer06
	.addrsig_sym _il_mem_inTimer07
	.addrsig_sym _il_mem_resLD
	.addrsig_sym _il_mem_C005
	.addrsig_sym _il_mem_resAND
	.addrsig_sym _il_mem_C007
	.addrsig_sym _il_mem_C010
	.addrsig_sym _il_mem_resOR
	.addrsig_sym _il_mem_C015
	.addrsig_sym _il_mem_resOUT
	.addrsig_sym _il_mem_resSET
	.addrsig_sym _il_mem_C024
	.addrsig_sym _il_mem_resRES
	.addrsig_sym _il_mem_TON_1_IN
	.addrsig_sym _il_mem_TON_2_IN
	.addrsig_sym _il_mem_TON_1_PT
	.addrsig_sym _il_mem_TON_1_Q
	.addrsig_sym _il_mem_resTimer01
	.addrsig_sym _il_mem_TON_1_ET
	.addrsig_sym _il_mem_passed01
	.addrsig_sym _il_mem_TIME_1m
	.addrsig_sym _il_mem_TON_2_PT
	.addrsig_sym _il_mem_TON_2_Q
	.addrsig_sym _il_mem_resTimer02
	.addrsig_sym _il_mem_TON_2_ET
	.addrsig_sym _il_mem_passed02
	.addrsig_sym _il_mem_resLD_T01
	.addrsig_sym _il_mem_resLD_T02
	.addrsig_sym _il_mem_CTU_1_CU
	.addrsig_sym _il_mem_enableCnt
	.addrsig_sym _il_mem_CTU_1_RESET
	.addrsig_sym _il_mem_CTU_1_PV
	.addrsig_sym _il_mem_CTU_1__prev_cu
	.addrsig_sym _il_mem_CTU_1_Q
	.addrsig_sym _il_mem_outConter
	.addrsig_sym _il_mem_CTU_1_CV
	.addrsig_sym _il_mem_valCounter
	.addrsig_sym _il_mem_resLD_C
	.addrsig_sym _il_mem_TON_3_IN
	.addrsig_sym _il_mem_TON_3_PT
	.addrsig_sym _il_mem_TON_3_Q
	.addrsig_sym _il_mem_resT5
	.addrsig_sym _il_mem_TON_3_ET
	.addrsig_sym _il_mem_passed03
	.addrsig_sym _il_mem_CTU_2_CU
	.addrsig_sym _il_mem_CTU_2_RESET
	.addrsig_sym _il_mem_CTU_2_PV
	.addrsig_sym _il_mem_CTU_2__prev_cu
	.addrsig_sym _il_mem_CTU_2_Q
	.addrsig_sym _il_mem_outConter2
	.addrsig_sym _il_mem_CTU_2_CV
	.addrsig_sym _il_mem_valCounter2
	.addrsig_sym _il_mem_TON_4_IN
	.addrsig_sym _il_mem_TON_4_PT
	.addrsig_sym _il_mem_TON_4_Q
	.addrsig_sym _il_mem_outTimer
	.addrsig_sym _il_mem_TON_4_ET
	.addrsig_sym _il_mem_passed04
	.addrsig_sym _il_mem_C046
	.addrsig_sym _il_mem_resAND_T
	.addrsig_sym _il_mem_CTU_3_CU
	.addrsig_sym _il_mem_CTU_3_RESET
	.addrsig_sym _il_mem_CTU_3_PV
	.addrsig_sym _il_mem_CTU_3__prev_cu
	.addrsig_sym _il_mem_CTU_3_Q
	.addrsig_sym _il_mem_outCounter3
	.addrsig_sym _il_mem_CTU_3_CV
	.addrsig_sym _il_mem_valCounter3
	.addrsig_sym _il_mem_C052
	.addrsig_sym _il_mem_resAND_C
	.addrsig_sym _il_mem_TON_5_IN
	.addrsig_sym _il_mem_TON_5_PT
	.addrsig_sym _il_mem_TON_5_Q
	.addrsig_sym _il_mem_outTimer05
	.addrsig_sym _il_mem_TON_5_ET
	.addrsig_sym _il_mem_passed05
	.addrsig_sym _il_mem_C055
	.addrsig_sym _il_mem_CTU_4_CU
	.addrsig_sym _il_mem_CTU_4_RESET
	.addrsig_sym _il_mem_CTU_4_PV
	.addrsig_sym _il_mem_CTU_4__prev_cu
	.addrsig_sym _il_mem_CTU_4_Q
	.addrsig_sym _il_mem_outConter04
	.addrsig_sym _il_mem_CTU_4_CV
	.addrsig_sym _il_mem_valCounter04
	.addrsig_sym _il_mem_C061
	.addrsig_sym _il_mem_TON_6_IN
	.addrsig_sym _il_mem_TON_6_PT
	.addrsig_sym _il_mem_TON_6_Q
	.addrsig_sym _il_mem_outTimer06
	.addrsig_sym _il_mem_TON_6_ET
	.addrsig_sym _il_mem_passed06
	.addrsig_sym _il_mem_C065
	.addrsig_sym _il_mem_resOR_T
	.addrsig_sym _il_mem_CTU_5_CU
	.addrsig_sym _il_mem_CTU_5_RESET
	.addrsig_sym _il_mem_CTU_5_PV
	.addrsig_sym _il_mem_CTU_5__prev_cu
	.addrsig_sym _il_mem_CTU_5_Q
	.addrsig_sym _il_mem_outCounter05
	.addrsig_sym _il_mem_CTU_5_CV
	.addrsig_sym _il_mem_valCounter05
	.addrsig_sym _il_mem_C069
	.addrsig_sym _il_mem_resOR_C
	.addrsig_sym _il_mem_TON_7_IN
	.addrsig_sym _il_mem_TON_7_PT
	.addrsig_sym _il_mem_TON_7_Q
	.addrsig_sym _il_mem_outTimer07
	.addrsig_sym _il_mem_TON_7_ET
	.addrsig_sym _il_mem_passed07
	.addrsig_sym _il_mem_C075
	.addrsig_sym _il_mem_CTU_6_CU
	.addrsig_sym _il_mem_CTU_6_RESET
	.addrsig_sym _il_mem_CTU_6_PV
	.addrsig_sym _il_mem_CTU_6__prev_cu
	.addrsig_sym _il_mem_CTU_6_Q
	.addrsig_sym _il_mem_outCounter06
	.addrsig_sym _il_mem_CTU_6_CV
	.addrsig_sym _il_mem_valCounter06
	.addrsig_sym _il_mem_C078
	.addrsig_sym _il_mem_C083
	.addrsig_sym _il_mem_IL_u5909_u6570_1
	.addrsig_sym _il_mem_C085
	.addrsig_sym _il_mem_resANL
	.addrsig_sym _il_mem_IL_u5909_u6570_2
	.addrsig_sym _il_mem_C089
	.addrsig_sym _il_mem_C091
	.addrsig_sym _il_mem_resORL
	.addrsig_sym _il_mem_setten0101
	.addrsig_sym _il_mem_setten0102
	.addrsig_sym _il_mem_IL_u5909_u6570_3
	.addrsig_sym _il_mem_setten0103
	.addrsig_sym _il_mem_IL_u5909_u6570_4
	.addrsig_sym _il_mem_setten0104
	.addrsig_sym _il_mem_resCoil01
	.addrsig_sym _il_mem_setten0204
	.addrsig_sym _il_mem_resCoil02
	.addrsig_sym _il_mem_setten0304
	.addrsig_sym _il_mem_resCoil03
	.addrsig_sym _il_mem_setten0403
	.addrsig_sym _il_mem_resCoil04
	.addrsig_sym _il_mem_setten0503
	.addrsig_sym _il_mem_resCoil05
	.addrsig_sym _il_mem_setten0603
	.addrsig_sym _il_mem_resCoil06
	.addrsig_sym _il_mem_setten0702
	.addrsig_sym _il_mem_resCoil07
	.addrsig_sym _il_mem_setten0802
	.addrsig_sym _il_mem_resCoil08
	.addrsig_sym _il_mem_setten0902
	.addrsig_sym _il_mem_resCoil09
	.addrsig_sym _il_mem_resBia01
	.addrsig_sym _il_mem_resBia02
	.addrsig_sym _il_mem_IL_u5909_u6570_5
	.addrsig_sym _il_mem_resBia03
	.addrsig_sym _il_mem_resCLR01
	.addrsig_sym _il_mem_resCLR02
	.addrsig_sym _il_mem_resCLR03
	.addrsig_sym _il_mem_resCLR04
	.addrsig_sym _il_mem_R_TRIG_1_CLK
	.addrsig_sym _il_mem_R_TRIG_1__prev_clk
	.addrsig_sym _il_mem_R_TRIG_1_Q
	.addrsig_sym _il_mem_outDIFU
	.addrsig_sym _il_mem_holdDIFU
	.addrsig_sym _il_mem_resDIFU
	.addrsig_sym _il_mem_F_TRIG_1_CLK
	.addrsig_sym _il_mem_F_TRIG_1__prev_clk
	.addrsig_sym _il_mem_F_TRIG_1_Q
	.addrsig_sym _il_mem_outDIFD
	.addrsig_sym _il_mem_holdDIFD
	.addrsig_sym _il_mem_resDIFD
	.addrsig_sym _il_mem_ECAT_Slave5_DO1
	.addrsig_sym _il_mem_CTU_7_CU
	.addrsig_sym _il_mem_CT_Reset
	.addrsig_sym _il_mem_CTU_7_RESET
	.addrsig_sym _il_mem_CTU_7_PV
	.addrsig_sym _il_mem_CTU_7__prev_cu
	.addrsig_sym _il_mem_CTU_7_Q
	.addrsig_sym _il_mem_CTU_7_CV
	.addrsig_sym _il_mem_ECAT_Slave4_AO1
