	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"rust_rt_algorithms.f82c848ede4bbb47-cgu.0"
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
	.def	_main;
	.scl	2;
	.type	32;
	.endef
	.globl	__xmm@00000001000000030000000100000004 # -- Begin function main
	.section	.rdata,"dr",discard,__xmm@00000001000000030000000100000004
	.p2align	4, 0x0
__xmm@00000001000000030000000100000004:
	.long	4                               # 0x4
	.long	1                               # 0x1
	.long	3                               # 0x3
	.long	1                               # 0x1
	.globl	__xmm@00000004000000050000000600000009
	.section	.rdata,"dr",discard,__xmm@00000004000000050000000600000009
	.p2align	4, 0x0
__xmm@00000004000000050000000600000009:
	.long	9                               # 0x9
	.long	6                               # 0x6
	.long	5                               # 0x5
	.long	4                               # 0x4
	.globl	__xmm@00000001000000010000000200000003
	.section	.rdata,"dr",discard,__xmm@00000001000000010000000200000003
	.p2align	4, 0x0
__xmm@00000001000000010000000200000003:
	.long	3                               # 0x3
	.long	2                               # 0x2
	.long	1                               # 0x1
	.long	1                               # 0x1
	.globl	__real@40000000
	.section	.rdata,"dr",discard,__real@40000000
	.p2align	2, 0x0
__real@40000000:
	.long	0x40000000                      # float 2
	.globl	__real@49742400
	.section	.rdata,"dr",discard,__real@49742400
	.p2align	2, 0x0
__real@49742400:
	.long	0x49742400                      # float 1.0E+6
	.globl	__real@4effffff
	.section	.rdata,"dr",discard,__real@4effffff
	.p2align	2, 0x0
__real@4effffff:
	.long	0x4effffff                      # float 2.14748352E+9
	.globl	__real@bfb504f3
	.section	.rdata,"dr",discard,__real@bfb504f3
	.p2align	2, 0x0
__real@bfb504f3:
	.long	0xbfb504f3                      # float -1.41421354
	.globl	__xmm@7fffffff7fffffff7fffffff7fffffff
	.section	.rdata,"dr",discard,__xmm@7fffffff7fffffff7fffffff7fffffff
	.p2align	4, 0x0
__xmm@7fffffff7fffffff7fffffff7fffffff:
	.long	0x7fffffff                      # float NaN
	.long	0x7fffffff                      # float NaN
	.long	0x7fffffff                      # float NaN
	.long	0x7fffffff                      # float NaN
	.globl	__real@38d1b717
	.section	.rdata,"dr",discard,__real@38d1b717
	.p2align	2, 0x0
__real@38d1b717:
	.long	0x38d1b717                      # float 9.99999974E-5
	.text
	.globl	_main
	.p2align	4
_main:                                  # @main
# %bb.0:                                # %bb2.i.4.i
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$124, %esp
	movaps	__xmm@00000001000000030000000100000004, %xmm1 # xmm1 = [4,1,3,1]
	xorps	%xmm0, %xmm0
	movsd	%xmm0, 56(%esp)
	movsd	%xmm0, 48(%esp)
	movsd	%xmm0, 40(%esp)
	movsd	%xmm0, 32(%esp)
	movsd	%xmm0, 24(%esp)
	movups	%xmm1, (%esp)
	movl	$1, 12(%esp)
	movl	$5, 16(%esp)
	movl	4(%esp), %eax
	cmpl	$4, %eax
	jg	LBB1_1
# %bb.2:                                # %bb6.i.i.4.i.1
	movl	%eax, 16(%esp)
	movl	%esp, %eax
	movl	$4, 4(%esp)
	jmp	LBB1_3
LBB1_1:
	leal	16(%esp), %eax
LBB1_3:                                 # %bb2.i.i.5.i.preheader
	movl	$5, (%eax)
	movl	$9, 20(%esp)
	movl	$6, 64(%esp)
	movl	8(%esp), %eax
	cmpl	$8, %eax
	jg	LBB1_4
# %bb.5:                                # %bb6.i.i.5.i
	movl	%eax, 20(%esp)
	movl	(%esp), %eax
	cmpl	$8, %eax
	jg	LBB1_6
# %bb.7:                                # %bb6.i.i.5.i.1
	movl	%eax, 8(%esp)
	movl	%esp, %eax
	jmp	LBB1_8
LBB1_4:
	leal	20(%esp), %eax
	jmp	LBB1_8
LBB1_6:
	leal	8(%esp), %eax
LBB1_8:                                 # %bb6.5.i
	movl	$9, (%eax)
	movl	64(%esp), %ecx
	cmpl	$16, %ecx
	je	LBB1_49
# %bb.9:                                # %bb2.i.6.i
	movl	$2, (%esp,%ecx,4)
	incl	64(%esp)
	testl	%ecx, %ecx
	movl	(%esp,%ecx,4), %eax
	je	LBB1_10
	.p2align	4
LBB1_11:                                # %bb2.i.i.6.i
                                        # =>This Inner Loop Header: Depth=1
	leal	-1(%ecx), %esi
	movl	%esi, %edx
	shrl	%edx
	movl	(%esp,%edx,4), %edi
	cmpl	%edi, %eax
	jle	LBB1_12
# %bb.13:                               # %bb6.i.i.6.i
                                        #   in Loop: Header=BB1_11 Depth=1
	movl	%edi, (%esp,%ecx,4)
	cmpl	$1, %esi
	movl	%edx, %ecx
	ja	LBB1_11
	jmp	LBB1_14
LBB1_10:
	xorl	%edx, %edx
	jmp	LBB1_14
LBB1_12:
	movl	%ecx, %edx
LBB1_14:                                # %bb6.6.i
	movl	%eax, (%esp,%edx,4)
	movl	64(%esp), %eax
	cmpl	$16, %eax
	jne	LBB1_15
LBB1_49:                                # %bb4.i
	pushl	$L_str
LBB1_50:                                # %_ZN18rust_rt_algorithms13run_heap_demo17h953ca05ae413df46E.exit
	calll	_puts
	addl	$4, %esp
LBB1_51:                                # %_ZN18rust_rt_algorithms13run_heap_demo17h953ca05ae413df46E.exit
	xorl	%ebx, %ebx
LBB1_52:                                # %_ZN18rust_rt_algorithms13run_heap_demo17h953ca05ae413df46E.exit
	movss	__real@49742400, %xmm0          # xmm0 = [1.0E+6,0.0E+0,0.0E+0,0.0E+0]
	movss	__real@40000000, %xmm1          # xmm1 = [2.0E+0,0.0E+0,0.0E+0,0.0E+0]
	#APP

	sqrtss	%xmm1, %xmm1

	#NO_APP
	movl	$2147483647, %ecx               # imm = 0x7FFFFFFF
	movups	%xmm1, 76(%esp)                 # 16-byte Spill
	mulss	%xmm1, %xmm0
	ucomiss	__real@4effffff, %xmm0
	cvttss2si	%xmm0, %eax
	cmovbel	%eax, %ecx
	xorl	%eax, %eax
	ucomiss	%xmm0, %xmm0
	cmovnpl	%ecx, %eax
	pushl	%eax
	pushl	$L_alloc_5d231b875d4ca813da63a117cabf1a69
	calll	_printf
	addl	$8, %esp
	movups	76(%esp), %xmm0                 # 16-byte Reload
	addss	__real@bfb504f3, %xmm0
	andps	__xmm@7fffffff7fffffff7fffffff7fffffff, %xmm0
	movups	%xmm0, 76(%esp)                 # 16-byte Spill
	pushl	$1500000                        # imm = 0x16E360
	pushl	$L_alloc_8109a7e01150c96d0bf8d9504bc28a98
	calll	_printf
	addl	$8, %esp
	movss	__real@38d1b717, %xmm0          # xmm0 = [9.99999974E-5,0.0E+0,0.0E+0,0.0E+0]
	movl	$L_str.7, %ecx
	movl	$L_str.6, %edx
	ucomiss	76(%esp), %xmm0                 # 16-byte Folded Reload
	seta	%al
	andb	%bl, %al
	cmovnel	%ecx, %edx
	xorb	$1, %al
	movzbl	%al, %esi
	pushl	%edx
	calll	_puts
	addl	$4, %esp
	movl	%esi, %eax
	addl	$124, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB1_15:                                # %bb2.i.7.i
	movl	$6, (%esp,%eax,4)
	incl	64(%esp)
	xorl	%esi, %esi
	testl	%eax, %eax
	movl	$0, %edx
	movl	(%esp,%eax,4), %ecx
	je	LBB1_19
	.p2align	4
LBB1_16:                                # %bb2.i.i.7.i
                                        # =>This Inner Loop Header: Depth=1
	leal	-1(%eax), %edi
	movl	%edi, %edx
	shrl	%edx
	movl	(%esp,%edx,4), %ebx
	cmpl	%ebx, %ecx
	jle	LBB1_17
# %bb.18:                               # %bb6.i.i.7.i
                                        #   in Loop: Header=BB1_16 Depth=1
	movl	%ebx, (%esp,%eax,4)
	cmpl	$1, %edi
	movl	%edx, %eax
	ja	LBB1_16
	jmp	LBB1_19
LBB1_17:
	movl	%eax, %edx
LBB1_19:                                # %bb6.7.i
	movaps	__xmm@00000004000000050000000600000009, %xmm0 # xmm0 = [9,6,5,4]
	movaps	__xmm@00000001000000010000000200000003, %xmm1 # xmm1 = [3,2,1,1]
	xorl	%edi, %edi
	movl	%ecx, (%esp,%edx,4)
	movups	%xmm0, 92(%esp)
	movups	%xmm1, 108(%esp)
	jmp	LBB1_20
LBB1_42:                                #   in Loop: Header=BB1_20 Depth=1
	movl	%ebx, %edx
LBB1_46:                                # %"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$19sift_down_to_bottom17h25e808b2afe512c3E.exit.i36.i"
                                        #   in Loop: Header=BB1_20 Depth=1
	movl	76(%esp), %esi                  # 4-byte Reload
	movl	72(%esp), %ebx                  # 4-byte Reload
	movl	68(%esp), %ebp                  # 4-byte Reload
	movl	%eax, (%esp,%edx,4)
LBB1_47:                                # %"_ZN8heapless11binary_heap27BinaryHeap$LT$T$C$K$C$_$GT$13pop_unchecked17h67b037f6d069bcc3E.exit50.i"
                                        #   in Loop: Header=BB1_20 Depth=1
	addl	$4, %edi
	pushl	%ebp
	pushl	%esi
	incl	%esi
	pushl	$L_alloc_9eb6ad1bb2761d7967bbb21aee962b44
	calll	_printf
	addl	$12, %esp
	cmpl	%ebx, %ebp
	jne	LBB1_48
LBB1_20:                                # %bb7.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_38 Depth 2
                                        #     Child Loop BB1_41 Depth 2
	cmpl	$32, %edi
	je	LBB1_23
# %bb.21:                               # %bb9.i
                                        #   in Loop: Header=BB1_20 Depth=1
	movl	64(%esp), %eax
	testl	%eax, %eax
	je	LBB1_22
# %bb.34:                               # %bb24.i
                                        #   in Loop: Header=BB1_20 Depth=1
	movl	%eax, %ecx
	movl	92(%esp,%edi), %ebx
	decl	%ecx
	movl	%ecx, 64(%esp)
	movl	-4(%esp,%eax,4), %eax
	je	LBB1_35
# %bb.36:                               # %bb2.i10.i
                                        #   in Loop: Header=BB1_20 Depth=1
	movl	(%esp), %edx
	movl	%ebx, 72(%esp)                  # 4-byte Spill
	movl	%esi, 76(%esp)                  # 4-byte Spill
	movl	%eax, (%esp)
	movl	%edx, 68(%esp)                  # 4-byte Spill
	xorl	%edx, %edx
	cmpl	$1, %ecx
	je	LBB1_46
# %bb.37:                               # %bb2.i.i13.i.preheader
                                        #   in Loop: Header=BB1_20 Depth=1
	xorl	%ebp, %ebp
	movl	$1, %edx
	jmp	LBB1_38
	.p2align	4
LBB1_39:                                #   in Loop: Header=BB1_38 Depth=2
	movl	%edx, %ebx
	movl	(%esp,%edx,4), %edx
	movl	%edx, (%esp,%ebp,4)
	leal	1(%ebx,%ebx), %edx
	movl	%ebx, %ebp
	cmpl	%ecx, %edx
	jae	LBB1_40
LBB1_38:                                # %bb2.i.i13.i
                                        #   Parent Loop BB1_20 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	1(%edx), %ebx
	cmpl	%ecx, %ebx
	jae	LBB1_39
# %bb.43:                               # %bb3.i.i43.i
                                        #   in Loop: Header=BB1_38 Depth=2
	movl	(%esp,%edx,4), %esi
	cmpl	4(%esp,%edx,4), %esi
	jg	LBB1_39
# %bb.44:                               # %bb3.i.i43.i
                                        #   in Loop: Header=BB1_38 Depth=2
	movl	%ebx, %edx
	jmp	LBB1_39
	.p2align	4
LBB1_35:                                #   in Loop: Header=BB1_20 Depth=1
	movl	%eax, %ebp
	jmp	LBB1_47
	.p2align	4
LBB1_40:                                # %bb2.i.preheader.i.i24.i
                                        #   in Loop: Header=BB1_20 Depth=1
	movl	%eax, (%esp,%ebx,4)
	.p2align	4
LBB1_41:                                # %bb2.i.i.i28.i
                                        #   Parent Loop BB1_20 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	-1(%ebx), %ecx
	movl	%ecx, %edx
	shrl	%edx
	movl	(%esp,%edx,4), %ebp
	cmpl	%ebp, %eax
	jle	LBB1_42
# %bb.45:                               # %bb6.i.i.i40.i
                                        #   in Loop: Header=BB1_41 Depth=2
	movl	%ebp, (%esp,%ebx,4)
	cmpl	$2, %ecx
	movl	%edx, %ebx
	jae	LBB1_41
	jmp	LBB1_46
LBB1_23:                                # %bb10.i
	movl	64(%esp), %eax
	testl	%eax, %eax
	sete	%bl
	je	LBB1_52
# %bb.24:                               # %bb28.i
	movl	%eax, %ecx
	decl	%ecx
	movl	%ecx, 64(%esp)
	je	LBB1_52
# %bb.25:                               # %bb2.i6.i
	movl	-4(%esp,%eax,4), %eax
	cmpl	$1, %ecx
	movl	%eax, (%esp)
	je	LBB1_52
# %bb.26:                               # %bb2.i.i7.i.preheader
	xorl	%edx, %edx
	movl	$1, %edi
	jmp	LBB1_27
	.p2align	4
LBB1_28:                                #   in Loop: Header=BB1_27 Depth=1
	movl	%edi, %esi
	movl	(%esp,%edi,4), %edi
	movl	%edi, (%esp,%edx,4)
	leal	1(%esi,%esi), %edi
	movl	%esi, %edx
	cmpl	%ecx, %edi
	jae	LBB1_29
LBB1_27:                                # %bb2.i.i7.i
                                        # =>This Inner Loop Header: Depth=1
	leal	1(%edi), %esi
	cmpl	%ecx, %esi
	jae	LBB1_28
# %bb.32:                               # %bb3.i.i.i
                                        #   in Loop: Header=BB1_27 Depth=1
	movl	(%esp,%edi,4), %ebp
	cmpl	4(%esp,%edi,4), %ebp
	jg	LBB1_28
# %bb.33:                               # %bb3.i.i.i
                                        #   in Loop: Header=BB1_27 Depth=1
	movl	%esi, %edi
	jmp	LBB1_28
LBB1_22:                                # %bb23.i
	pushl	$L_str.5
	jmp	LBB1_50
LBB1_48:                                # %bb13.i
	pushl	%ebx
	pushl	%ebp
	pushl	$L_alloc_5417d29f1a01a8b6dc8cee7e1e1cab8e
	calll	_printf
	addl	$12, %esp
	jmp	LBB1_51
LBB1_29:                                # %bb2.i.preheader.i.i.i
	movl	%eax, (%esp,%esi,4)
	.p2align	4
LBB1_30:                                # %bb2.i.i.i.i
                                        # =>This Inner Loop Header: Depth=1
	leal	-1(%esi), %ecx
	movl	%ecx, %edx
	shrl	%edx
	movl	(%esp,%edx,4), %edi
	cmpl	%edi, %eax
	jle	LBB1_52
# %bb.31:                               # %bb6.i.i.i.i
                                        #   in Loop: Header=BB1_30 Depth=1
	movl	%edi, (%esp,%esi,4)
	cmpl	$2, %ecx
	movl	%edx, %esi
	jae	LBB1_30
	jmp	LBB1_52
                                        # -- End function
	.section	.rdata,"dr"
L_alloc_9eb6ad1bb2761d7967bbb21aee962b44: # @alloc_9eb6ad1bb2761d7967bbb21aee962b44
	.asciz	"heap pop[%d] = %d\n"

L_alloc_5417d29f1a01a8b6dc8cee7e1e1cab8e: # @alloc_5417d29f1a01a8b6dc8cee7e1e1cab8e
	.asciz	"heap mismatch at step: got %d expect %d\n"

L_alloc_5d231b875d4ca813da63a117cabf1a69: # @alloc_5d231b875d4ca813da63a117cabf1a69
	.asciz	"sqrt(2)*1e6 (libm): %d\n"

L_alloc_8109a7e01150c96d0bf8d9504bc28a98: # @alloc_8109a7e01150c96d0bf8d9504bc28a98
	.asciz	"micromath sqrt(2)*1e6: %d\n"

L_str:                                  # @str
	.asciz	"heapless BinaryHeap push overflow"

L_str.5:                                # @str.5
	.asciz	"heapless BinaryHeap pop underflow"

L_str.6:                                # @str.6
	.asciz	"rust_rt_algorithms: FAIL"

L_str.7:                                # @str.7
	.asciz	"rust_rt_algorithms: PASS (heapless + libm + micromath approx)"

	.addrsig
	.globl	__fltused
