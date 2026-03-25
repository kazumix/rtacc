	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 0
	.file	"melsec.ll"
	.def	update_timer;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	update_timer                    # -- Begin function update_timer
	.p2align	4
update_timer:                           # @update_timer
.seh_proc update_timer
# %bb.0:                                # %entry
	subq	$24, %rsp
	.seh_stackalloc 24
	.seh_endprologue
	movl	%edx, 4(%rsp)                   # 4-byte Spill
	movq	%rcx, 8(%rsp)                   # 8-byte Spill
	movq	%rcx, %rax
	addq	$8, %rax
	movq	%rax, 16(%rsp)                  # 8-byte Spill
	testb	$1, 8(%rcx)
	jne	.LBB0_1
	jmp	.LBB0_3
.LBB0_1:                                # %running_blk
	movq	8(%rsp), %rcx                   # 8-byte Reload
	movl	4(%rsp), %eax                   # 4-byte Reload
	addl	4(%rcx), %eax
	movl	%eax, 4(%rcx)
	cmpl	(%rcx), %eax
	jl	.LBB0_3
# %bb.2:                                # %done_blk
	movq	16(%rsp), %rax                  # 8-byte Reload
	movq	8(%rsp), %rcx                   # 8-byte Reload
	movb	$1, 9(%rcx)
	movb	$0, (%rax)
.LBB0_3:                                # %end
	.seh_startepilogue
	addq	$24, %rsp
	.seh_endepilogue
	retq
	.seh_endproc
                                        # -- End function
	.def	scan;
	.scl	2;
	.type	32;
	.endef
	.globl	scan                            # -- Begin function scan
	.p2align	4
scan:                                   # @scan
.seh_proc scan
# %bb.0:                                # %entry
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movl	%ecx, %edx
	movl	%edx, 52(%rsp)                  # 4-byte Spill
	leaq	T27(%rip), %rcx
	callq	update_timer
	movl	52(%rsp), %edx                  # 4-byte Reload
	leaq	T28(%rip), %rcx
	callq	update_timer
	movb	M621(%rip), %al
	movb	M133(%rip), %dl
	movb	M400(%rip), %cl
	xorb	$-1, %cl
	andb	%dl, %al
	andb	%cl, %al
	testb	$1, %al
	jne	.LBB1_1
	jmp	.LBB1_2
.LBB1_1:                                # %set_M400
	movb	$1, M400(%rip)
.LBB1_2:                                # %after_start
	testb	$1, M400(%rip)
	jne	.LBB1_3
	jmp	.LBB1_12
.LBB1_3:                                # %seq_active
	movb	M520(%rip), %al
	xorb	$-1, %al
	testb	$1, %al
	jne	.LBB1_4
	jmp	.LBB1_5
.LBB1_4:                                # %lift_down_active
	movb	$1, M517(%rip)
	jmp	.LBB1_6
.LBB1_5:                                # %lift_down_done
	movb	$0, M517(%rip)
.LBB1_6:                                # %after_lift
	movb	M145(%rip), %al
	leaq	T27(%rip), %rcx
	addq	$8, %rcx
	movq	%rcx, 32(%rsp)                  # 8-byte Spill
	movb	T27+8(%rip), %dl
	xorb	$-1, %dl
	leaq	T27(%rip), %rcx
	addq	$9, %rcx
	movq	%rcx, 40(%rsp)                  # 8-byte Spill
	movb	T27+9(%rip), %cl
	xorb	$-1, %cl
	andb	%dl, %al
	andb	%cl, %al
	testb	$1, %al
	jne	.LBB1_7
	jmp	.LBB1_8
.LBB1_7:                                # %start_t27
	movq	32(%rsp), %rax                  # 8-byte Reload
	movq	40(%rsp), %rcx                  # 8-byte Reload
	movl	$0, T27+4(%rip)
	movb	$0, (%rcx)
	movb	$1, (%rax)
.LBB1_8:                                # %check_t27_done
	testb	$1, T27+9(%rip)
	jne	.LBB1_9
	jmp	.LBB1_10
.LBB1_9:                                # %claw_seq
	movq	40(%rsp), %rax                  # 8-byte Reload
	movq	32(%rsp), %rcx                  # 8-byte Reload
	movb	$1, M521(%rip)
	movb	$0, M521(%rip)
	movb	$1, M520(%rip)
	movl	$0, T27+4(%rip)
	movb	$0, (%rcx)
	movb	$0, (%rax)
	movl	$0, T28+4(%rip)
	movb	$0, T28+9(%rip)
	movb	$1, T28+8(%rip)
.LBB1_10:                               # %check_end
	testb	$1, T28+9(%rip)
	jne	.LBB1_11
	jmp	.LBB1_12
.LBB1_11:                               # %finish_seq
	movb	$1, M516(%rip)
	movb	$0, M516(%rip)
	movb	$0, M400(%rip)
	movb	$0, M520(%rip)
	movl	$0, T27+4(%rip)
	movb	$0, T27+8(%rip)
	movb	$0, T27+9(%rip)
	movl	$0, T28+4(%rip)
	movb	$0, T28+8(%rip)
	movb	$0, T28+9(%rip)
.LBB1_12:                               # %seq_end
	.seh_startepilogue
	addq	$56, %rsp
	.seh_endepilogue
	retq
	.seh_endproc
                                        # -- End function
	.bss
	.globl	M621                            # @M621
M621:
	.byte	0                               # 0x0

	.globl	M133                            # @M133
M133:
	.byte	0                               # 0x0

	.globl	M145                            # @M145
M145:
	.byte	0                               # 0x0

	.globl	M400                            # @M400
M400:
	.byte	0                               # 0x0

	.globl	M517                            # @M517
M517:
	.byte	0                               # 0x0

	.globl	M516                            # @M516
M516:
	.byte	0                               # 0x0

	.globl	M520                            # @M520
M520:
	.byte	0                               # 0x0

	.globl	M521                            # @M521
M521:
	.byte	0                               # 0x0

	.data
	.globl	T27                             # @T27
	.p2align	3, 0x0
T27:
	.long	5                               # 0x5
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	2

	.globl	T28                             # @T28
	.p2align	3, 0x0
T28:
	.long	80                              # 0x50
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	2

	.addrsig
	.addrsig_sym update_timer
	.addrsig_sym M621
	.addrsig_sym M133
	.addrsig_sym M145
	.addrsig_sym M400
	.addrsig_sym M517
	.addrsig_sym M516
	.addrsig_sym M520
	.addrsig_sym M521
	.addrsig_sym T27
	.addrsig_sym T28
