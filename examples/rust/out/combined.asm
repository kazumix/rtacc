	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"main.e3660c07faadc8b7-cgu.0"
	.def	__RNvCs5QKde7ScR4H_7___rustc17rust_begin_unwind;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	__RNvCs5QKde7ScR4H_7___rustc17rust_begin_unwind # -- Begin function _RNvCs5QKde7ScR4H_7___rustc17rust_begin_unwind
	.p2align	4
__RNvCs5QKde7ScR4H_7___rustc17rust_begin_unwind: # @_RNvCs5QKde7ScR4H_7___rustc17rust_begin_unwind
# %bb.0:                                # %start
	.p2align	4
LBB0_1:                                 # %bb1
                                        # =>This Inner Loop Header: Depth=1
	jmp	LBB0_1
                                        # -- End function
	.def	__ZN4main18run_mailbox_thread17h27ae20d6c3d1706dE;
	.scl	3;
	.type	32;
	.endef
	.p2align	4                               # -- Begin function _ZN4main18run_mailbox_thread17h27ae20d6c3d1706dE
__ZN4main18run_mailbox_thread17h27ae20d6c3d1706dE: # @_ZN4main18run_mailbox_thread17h27ae20d6c3d1706dE
# %bb.0:                                # %start
	testl	%edx, %edx
	je	LBB1_10
# %bb.1:                                # %bb20
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	%eax
	movl	(%edx), %esi
	movl	%ecx, %ebx
	testb	%bl, %bl
	je	LBB1_4
# %bb.2:                                # %bb2
	movzwl	6(%edx), %eax
	cmpw	$-1, %ax
	je	LBB1_9
# %bb.3:                                # %bb22
	movzwl	4(%edx), %ecx
	jmp	LBB1_6
LBB1_4:                                 # %bb3
	movzwl	4(%edx), %eax
	cmpw	$-1, %ax
	je	LBB1_9
# %bb.5:                                # %bb24
	movzwl	6(%edx), %ecx
LBB1_6:                                 # %bb24
	cmpw	$-1, %cx
	movw	%cx, 2(%esp)                    # 2-byte Spill
	je	LBB1_9
# %bb.7:                                # %bb42
	movzwl	%ax, %ebp
	pushl	$0
	pushl	$-1
	pushl	%ebp
	calll	_ReceiveRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	je	LBB1_8
# %bb.11:                               # %bb6
	movzwl	%ax, %edi
	pushl	%edi
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$6, %ax
	jne	LBB1_16
# %bb.12:                               # %bb9
	testb	%bl, %bl
	je	LBB1_14
# %bb.13:                               # %bb11
	movl	4(%esi), %eax
	lock		addl	%eax, 8(%esi)
	jmp	LBB1_15
LBB1_14:                                # %bb12
	movl	$1, %eax
	lock		xaddl	%eax, (%esi)
	leal	(%eax,%eax,4), %eax
	leal	10(%eax,%eax), %eax
	xchgl	%eax, 4(%esi)
LBB1_15:                                # %bb13
	movzwl	2(%esp), %eax                   # 2-byte Folded Reload
	pushl	$0
	pushl	%edi
	pushl	%eax
	calll	_SendRtHandle
	addl	$12, %esp
LBB1_16:                                # %bb4.backedge
	pushl	$0
	pushl	$-1
	pushl	%ebp
	calll	_ReceiveRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	je	LBB1_8
# %bb.17:                               # %bb6.1
	movzwl	%ax, %edi
	pushl	%edi
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$6, %ax
	jne	LBB1_22
# %bb.18:                               # %bb9.1
	testb	%bl, %bl
	je	LBB1_19
# %bb.20:                               # %bb11.1
	movl	4(%esi), %eax
	lock		addl	%eax, 8(%esi)
	jmp	LBB1_21
LBB1_19:                                # %bb12.1
	movl	$1, %eax
	lock		xaddl	%eax, (%esi)
	leal	(%eax,%eax,4), %eax
	leal	10(%eax,%eax), %eax
	xchgl	%eax, 4(%esi)
LBB1_21:                                # %bb13.1
	movzwl	2(%esp), %eax                   # 2-byte Folded Reload
	pushl	$0
	pushl	%edi
	pushl	%eax
	calll	_SendRtHandle
	addl	$12, %esp
LBB1_22:                                # %bb4.backedge.1
	pushl	$0
	pushl	$-1
	pushl	%ebp
	calll	_ReceiveRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	je	LBB1_8
# %bb.23:                               # %bb6.2
	movzwl	%ax, %edi
	pushl	%edi
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$6, %ax
	jne	LBB1_28
# %bb.24:                               # %bb9.2
	testb	%bl, %bl
	je	LBB1_25
# %bb.26:                               # %bb11.2
	movl	4(%esi), %eax
	lock		addl	%eax, 8(%esi)
	jmp	LBB1_27
LBB1_25:                                # %bb12.2
	movl	$1, %eax
	lock		xaddl	%eax, (%esi)
	leal	(%eax,%eax,4), %eax
	leal	10(%eax,%eax), %eax
	xchgl	%eax, 4(%esi)
LBB1_27:                                # %bb13.2
	movzwl	2(%esp), %eax                   # 2-byte Folded Reload
	pushl	$0
	pushl	%edi
	pushl	%eax
	calll	_SendRtHandle
	addl	$12, %esp
LBB1_28:                                # %bb4.backedge.2
	pushl	$0
	pushl	$-1
	pushl	%ebp
	calll	_ReceiveRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	je	LBB1_8
# %bb.29:                               # %bb6.3
	movzwl	%ax, %edi
	pushl	%edi
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$6, %ax
	jne	LBB1_34
# %bb.30:                               # %bb9.3
	testb	%bl, %bl
	je	LBB1_31
# %bb.32:                               # %bb11.3
	movl	4(%esi), %eax
	lock		addl	%eax, 8(%esi)
	jmp	LBB1_33
LBB1_31:                                # %bb12.3
	movl	$1, %eax
	lock		xaddl	%eax, (%esi)
	leal	(%eax,%eax,4), %eax
	leal	10(%eax,%eax), %eax
	xchgl	%eax, 4(%esi)
LBB1_33:                                # %bb13.3
	movzwl	2(%esp), %eax                   # 2-byte Folded Reload
	pushl	$0
	pushl	%edi
	pushl	%eax
	calll	_SendRtHandle
	addl	$12, %esp
LBB1_34:                                # %bb4.backedge.3
	pushl	$0
	pushl	$-1
	pushl	%ebp
	calll	_ReceiveRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	je	LBB1_8
# %bb.35:                               # %bb6.4
	movzwl	%ax, %edi
	pushl	%edi
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$6, %ax
	jne	LBB1_8
# %bb.36:                               # %bb9.4
	testb	%bl, %bl
	je	LBB1_37
# %bb.38:                               # %bb11.4
	movl	4(%esi), %eax
	lock		addl	%eax, 8(%esi)
	jmp	LBB1_39
LBB1_37:                                # %bb12.4
	movl	$1, %eax
	lock		xaddl	%eax, (%esi)
	leal	(%eax,%eax,4), %eax
	leal	10(%eax,%eax), %eax
	xchgl	%eax, 4(%esi)
LBB1_39:                                # %bb13.4
	movzwl	2(%esp), %eax                   # 2-byte Folded Reload
	pushl	$0
	pushl	%edi
	pushl	%eax
	calll	_SendRtHandle
	addl	$12, %esp
LBB1_8:                                 # %bb15
	movzbl	%bl, %eax
	incl	%eax
	lock		orl	%eax, 12(%esi)
LBB1_9:
	addl	$4, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
LBB1_10:                                # %bb18
	retl
                                        # -- End function
	.def	__ZN64_$LT$main..intime..RtBuffer$u20$as$u20$core..ops..drop..Drop$GT$4drop17h909f5cc35e68ca85E;
	.scl	2;
	.type	32;
	.endef
	.globl	__ZN64_$LT$main..intime..RtBuffer$u20$as$u20$core..ops..drop..Drop$GT$4drop17h909f5cc35e68ca85E # -- Begin function _ZN64_$LT$main..intime..RtBuffer$u20$as$u20$core..ops..drop..Drop$GT$4drop17h909f5cc35e68ca85E
	.p2align	4
__ZN64_$LT$main..intime..RtBuffer$u20$as$u20$core..ops..drop..Drop$GT$4drop17h909f5cc35e68ca85E: # @"_ZN64_$LT$main..intime..RtBuffer$u20$as$u20$core..ops..drop..Drop$GT$4drop17h909f5cc35e68ca85E"
# %bb.0:                                # %start
	pushl	%esi
	movl	8(%esp), %esi
	movl	72(%esi), %eax
	testl	%eax, %eax
	jne	LBB2_1
LBB2_5:                                 # %bb7
	pushl	64(%esi)
	calll	_FreeRtMemory
	addl	$4, %esp
	popl	%esi
	retl
	.p2align	4
LBB2_3:                                 # %bb6thread-pre-split
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	72(%esi), %ecx
LBB2_4:                                 # %bb6
                                        #   in Loop: Header=BB2_1 Depth=1
	testl	%ecx, %ecx
	movl	%ecx, %eax
	je	LBB2_5
LBB2_1:                                 # %bb2
                                        # =>This Inner Loop Header: Depth=1
	leal	-1(%eax), %ecx
	cmpl	$16, %eax
	movl	%ecx, 72(%esi)
	ja	LBB2_4
# %bb.2:                                # %bb9
                                        #   in Loop: Header=BB2_1 Depth=1
	movzwl	-2(%esi,%eax,4), %ecx
	cmpb	$0, -4(%esi,%eax,4)
	movw	$0, -4(%esi,%eax,4)
	je	LBB2_3
# %bb.6:                                # %bb3
                                        #   in Loop: Header=BB2_1 Depth=1
	movzwl	%cx, %eax
	pushl	%eax
	calll	_DeleteRtMemoryHandle
	addl	$4, %esp
	jmp	LBB2_3
                                        # -- End function
	.def	__ZN65_$LT$main..intime..RtMailbox$u20$as$u20$core..ops..drop..Drop$GT$4drop17hec2df81bbdf27664E;
	.scl	2;
	.type	32;
	.endef
	.globl	__ZN65_$LT$main..intime..RtMailbox$u20$as$u20$core..ops..drop..Drop$GT$4drop17hec2df81bbdf27664E # -- Begin function _ZN65_$LT$main..intime..RtMailbox$u20$as$u20$core..ops..drop..Drop$GT$4drop17hec2df81bbdf27664E
	.p2align	4
__ZN65_$LT$main..intime..RtMailbox$u20$as$u20$core..ops..drop..Drop$GT$4drop17hec2df81bbdf27664E: # @"_ZN65_$LT$main..intime..RtMailbox$u20$as$u20$core..ops..drop..Drop$GT$4drop17hec2df81bbdf27664E"
# %bb.0:                                # %start
	movl	4(%esp), %eax
	movzwl	(%eax), %eax
	pushl	%eax
	calll	_DeleteRtMailbox
	addl	$4, %esp
	retl
                                        # -- End function
	.def	__ZN74_$LT$main..intime..RtMappedSharedView$u20$as$u20$core..ops..drop..Drop$GT$4drop17h2d26ee5493617c26E;
	.scl	2;
	.type	32;
	.endef
	.globl	__ZN74_$LT$main..intime..RtMappedSharedView$u20$as$u20$core..ops..drop..Drop$GT$4drop17h2d26ee5493617c26E # -- Begin function _ZN74_$LT$main..intime..RtMappedSharedView$u20$as$u20$core..ops..drop..Drop$GT$4drop17h2d26ee5493617c26E
	.p2align	4
__ZN74_$LT$main..intime..RtMappedSharedView$u20$as$u20$core..ops..drop..Drop$GT$4drop17h2d26ee5493617c26E: # @"_ZN74_$LT$main..intime..RtMappedSharedView$u20$as$u20$core..ops..drop..Drop$GT$4drop17h2d26ee5493617c26E"
# %bb.0:                                # %start
	movl	4(%esp), %eax
	pushl	(%eax)
	calll	_FreeRtMemory
	addl	$4, %esp
	retl
                                        # -- End function
	.def	_main;
	.scl	2;
	.type	32;
	.endef
	.globl	_main                           # -- Begin function main
	.p2align	4
_main:                                  # @main
# %bb.0:                                # %start
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$88, %esp
	pushl	$4096                           # imm = 0x1000
	calll	_AllocateRtMemory
	addl	$4, %esp
	testl	%eax, %eax
	je	LBB5_34
# %bb.1:                                # %bb2.i.i
	movl	%eax, %edi
	movw	$0, 12(%esp)
	movw	$0, 16(%esp)
	movw	$0, 20(%esp)
	movw	$0, 24(%esp)
	movw	$0, 28(%esp)
	movw	$0, 32(%esp)
	movw	$0, 36(%esp)
	movw	$0, 40(%esp)
	movw	$0, 44(%esp)
	movw	$0, 48(%esp)
	movw	$0, 52(%esp)
	movw	$0, 56(%esp)
	movw	$0, 60(%esp)
	movw	$0, 64(%esp)
	movw	$0, 68(%esp)
	movw	$0, 72(%esp)
	movl	%eax, 76(%esp)
	movl	$4096, 80(%esp)                 # imm = 0x1000
	pushl	$4096                           # imm = 0x1000
	pushl	$0
	pushl	%eax
	calll	_memset
	addl	$12, %esp
	pushl	$4096                           # imm = 0x1000
	pushl	%edi
	calll	_CreateRtMemoryHandle
	addl	$8, %esp
	cmpw	$-1, %ax
	je	LBB5_32
# %bb.2:                                # %bb7.i
	movw	$1, 12(%esp)
	movw	%ax, 14(%esp)
	movw	%ax, 2(%esp)                    # 2-byte Spill
	movl	$1, 84(%esp)
	pushl	$0
	calll	_CreateRtMailbox
	addl	$4, %esp
	cmpw	$-1, %ax
	je	LBB5_6
# %bb.3:                                # %bb11.i
	movl	%eax, %ebx
	pushl	$0
	calll	_CreateRtMailbox
	addl	$4, %esp
	cmpw	$-1, %ax
	movzwl	%bx, %ebp
	je	LBB5_20
# %bb.4:                                # %bb14.i
	movl	%edi, 4(%esp)
	movl	%eax, %esi
	leal	4(%esp), %edi
	movw	%bx, 8(%esp)
	movw	%ax, 10(%esp)
	pushl	%edi
	pushl	$4096                           # imm = 0x1000
	pushl	$_rust_thread_a_entry
	pushl	$0
	calll	_CreateRtThread
	addl	$16, %esp
	cmpw	$-1, %ax
	je	LBB5_5
# %bb.15:                               # %bb16.i
	pushl	%edi
	pushl	$4096                           # imm = 0x1000
	pushl	$_rust_thread_b_entry
	pushl	$0
	calll	_CreateRtThread
	addl	$16, %esp
	cmpw	$-1, %ax
	je	LBB5_16
# %bb.18:                               # %bb20.i
	movzwl	2(%esp), %eax                   # 2-byte Folded Reload
	pushl	$0
	pushl	%eax
	pushl	%ebp
	calll	_SendRtHandle
	addl	$12, %esp
	testb	%al, %al
	je	LBB5_19
# %bb.22:                               # %bb47.i.preheader
	movl	$5000, %edi                     # imm = 0x1388
	.p2align	4
LBB5_23:                                # %bb47.i
                                        # =>This Inner Loop Header: Depth=1
	movl	4(%esp), %eax
	movl	12(%eax), %eax
	notl	%eax
	testb	$3, %al
	je	LBB5_24
# %bb.31:                               # %bb29.i
                                        #   in Loop: Header=BB5_23 Depth=1
	pushl	$10
	calll	_RtSleep
	addl	$4, %esp
	decl	%edi
	jne	LBB5_23
LBB5_24:                                # %bb31.i
	movl	4(%esp), %eax
	pushl	$150
	pushl	12(%eax)
	pushl	8(%eax)
	pushl	4(%eax)
	pushl	(%eax)
	pushl	$L_alloc_3486fa9b496d4a3254c3f827bc865bba
	calll	_printf
	addl	$24, %esp
	movzwl	%si, %eax
	pushl	%eax
	calll	_DeleteRtMailbox
	addl	$4, %esp
	pushl	%ebp
	calll	_DeleteRtMailbox
	addl	$4, %esp
	movl	84(%esp), %eax
	testl	%eax, %eax
	jne	LBB5_25
LBB5_29:                                # %"_ZN4core3ptr43drop_in_place$LT$main..intime..RtBuffer$GT$17hdbd290d14cddc333E.exit"
	pushl	76(%esp)
	calll	_FreeRtMemory
	addl	$4, %esp
	xorl	%eax, %eax
	jmp	LBB5_30
LBB5_34:                                # %bb43.i
	pushl	$L_str.6
	calll	_puts
	jmp	LBB5_14
	.p2align	4
LBB5_27:                                # %bb6thread-pre-split.i.i
                                        #   in Loop: Header=BB5_25 Depth=1
	movl	84(%esp), %ecx
LBB5_28:                                # %bb6.i.i
                                        #   in Loop: Header=BB5_25 Depth=1
	testl	%ecx, %ecx
	movl	%ecx, %eax
	je	LBB5_29
LBB5_25:                                # %bb2.i.i2
                                        # =>This Inner Loop Header: Depth=1
	leal	-1(%eax), %ecx
	cmpl	$16, %eax
	movl	%ecx, 84(%esp)
	ja	LBB5_28
# %bb.26:                               # %bb9.i.i
                                        #   in Loop: Header=BB5_25 Depth=1
	movzwl	10(%esp,%eax,4), %ecx
	cmpb	$0, 8(%esp,%eax,4)
	movw	$0, 8(%esp,%eax,4)
	je	LBB5_27
# %bb.35:                               # %bb3.i.i
                                        #   in Loop: Header=BB5_25 Depth=1
	movzwl	%cx, %eax
	pushl	%eax
	calll	_DeleteRtMemoryHandle
	addl	$4, %esp
	jmp	LBB5_27
LBB5_32:                                # %bb40.i
	pushl	$L_str.5
	calll	_puts
	addl	$4, %esp
	jmp	LBB5_13
LBB5_6:                                 # %bb44.i
	pushl	$L_str.1
	calll	_puts
	jmp	LBB5_7
LBB5_20:                                # %bb45.i
	pushl	$L_str.1
	calll	_puts
	jmp	LBB5_21
LBB5_5:
	movl	$L_str.2, %eax
	jmp	LBB5_17
LBB5_16:
	movl	$L_str.3, %eax
	jmp	LBB5_17
LBB5_19:
	movl	$L_str.4, %eax
LBB5_17:                                # %bb36.i
	pushl	%eax
	calll	_puts
	addl	$4, %esp
	movzwl	%si, %eax
	pushl	%eax
	calll	_DeleteRtMailbox
LBB5_21:                                # %bb38.i
	addl	$4, %esp
	pushl	%ebp
	calll	_DeleteRtMailbox
LBB5_7:                                 # %bb2.i.i.i
	addl	$4, %esp
	movl	$1, %eax
	jmp	LBB5_8
	.p2align	4
LBB5_10:                                # %bb6thread-pre-split.i.i.i
                                        #   in Loop: Header=BB5_8 Depth=1
	movl	84(%esp), %ecx
LBB5_11:                                # %bb6.i.i.i
                                        #   in Loop: Header=BB5_8 Depth=1
	testl	%ecx, %ecx
	movl	%ecx, %eax
	je	LBB5_12
LBB5_8:                                 # %bb2.i.i.i
                                        # =>This Inner Loop Header: Depth=1
	leal	-1(%eax), %ecx
	cmpl	$16, %eax
	movl	%ecx, 84(%esp)
	ja	LBB5_11
# %bb.9:                                # %bb9.i.i.i
                                        #   in Loop: Header=BB5_8 Depth=1
	movzwl	10(%esp,%eax,4), %ecx
	cmpb	$0, 8(%esp,%eax,4)
	movw	$0, 8(%esp,%eax,4)
	je	LBB5_10
# %bb.33:                               # %bb3.i.i.i
                                        #   in Loop: Header=BB5_8 Depth=1
	movzwl	%cx, %eax
	pushl	%eax
	calll	_DeleteRtMemoryHandle
	addl	$4, %esp
	jmp	LBB5_10
LBB5_12:                                # %"_ZN4core3ptr43drop_in_place$LT$main..intime..RtBuffer$GT$17hdbd290d14cddc333E.exit.loopexit.i"
	movl	76(%esp), %edi
LBB5_13:                                # %"_ZN4core3ptr43drop_in_place$LT$main..intime..RtBuffer$GT$17hdbd290d14cddc333E.exit.i"
	pushl	%edi
	calll	_FreeRtMemory
LBB5_14:                                # %_ZN4main3run17hae284cc88ca322e5E.exit
	addl	$4, %esp
	movl	$1, %eax
LBB5_30:                                # %_ZN4main3run17hae284cc88ca322e5E.exit
	addl	$88, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_rust_thread_a_entry;
	.scl	2;
	.type	32;
	.endef
	.globl	_rust_thread_a_entry            # -- Begin function rust_thread_a_entry
	.p2align	4
_rust_thread_a_entry:                   # @rust_thread_a_entry
# %bb.0:                                # %start
	movl	4(%esp), %edx
	xorl	%ecx, %ecx
	jmp	__ZN4main18run_mailbox_thread17h27ae20d6c3d1706dE # TAILCALL
                                        # -- End function
	.def	_rust_thread_b_entry;
	.scl	2;
	.type	32;
	.endef
	.globl	_rust_thread_b_entry            # -- Begin function rust_thread_b_entry
	.p2align	4
_rust_thread_b_entry:                   # @rust_thread_b_entry
# %bb.0:                                # %start
	movl	4(%esp), %edx
	movl	$1, %ecx
	jmp	__ZN4main18run_mailbox_thread17h27ae20d6c3d1706dE # TAILCALL
                                        # -- End function
	.section	.rdata,"dr"
L_alloc_3486fa9b496d4a3254c3f827bc865bba: # @alloc_3486fa9b496d4a3254c3f827bc865bba
	.asciz	"rust_rt_mailbox: seq=%d value=%d sum_seen=%d done_bits=%d (expect sum_seen=%d)\n"

L_str.1:                                # @str.1
	.asciz	"CreateRtMailbox failed"

L_str.2:                                # @str.2
	.asciz	"CreateRtThread(A) failed"

L_str.3:                                # @str.3
	.asciz	"CreateRtThread(B) failed"

L_str.4:                                # @str.4
	.asciz	"SendRtHandle(kick) failed"

L_str.5:                                # @str.5
	.asciz	"CreateRtMemoryHandle failed"

L_str.6:                                # @str.6
	.asciz	"AllocateRtMemory failed"

	.addrsig
