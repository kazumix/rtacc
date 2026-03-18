	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"llvm-link"
	.def	_fast_moving_average_init;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_fast_moving_average_init       # -- Begin function fast_moving_average_init
	.p2align	4
_fast_moving_average_init:              # @fast_moving_average_init
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	16(%esp), %esi
	movl	12(%esp), %edi
	testl	%edi, %edi
	sete	%al
	testl	%esi, %esi
	setle	%cl
	orb	%al, %cl
	movl	$-1, %eax
	jne	LBB0_2
# %bb.1:
	leal	8(,%esi,8), %eax
	pushl	%eax
	calll	_malloc
	addl	$4, %esp
	movl	%eax, %ecx
	movl	%eax, (%edi)
	xorl	%eax, %eax
	testl	%ecx, %ecx
	sete	%al
	cmovel	%ecx, %esi
	negl	%eax
	movl	%esi, 4(%edi)
LBB0_2:
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_fast_moving_average_free;
	.scl	2;
	.type	32;
	.endef
	.globl	_fast_moving_average_free       # -- Begin function fast_moving_average_free
	.p2align	4
_fast_moving_average_free:              # @fast_moving_average_free
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	testl	%esi, %esi
	je	LBB1_2
# %bb.1:
	pushl	(%esi)
	calll	_free
	addl	$4, %esp
	movl	$0, (%esi)
	movl	$0, 4(%esi)
LBB1_2:
	popl	%esi
	retl
                                        # -- End function
	.def	_fast_moving_average_compute;
	.scl	2;
	.type	32;
	.endef
	.globl	__xmm@00000003000000020000000100000000 # -- Begin function fast_moving_average_compute
	.section	.rdata,"dr",discard,__xmm@00000003000000020000000100000000
	.p2align	4, 0x0
__xmm@00000003000000020000000100000000:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
	.globl	__real@7ff8000000000000
	.section	.rdata,"dr",discard,__real@7ff8000000000000
	.p2align	3, 0x0
__real@7ff8000000000000:
	.quad	0x7ff8000000000000              # double NaN
	.globl	__real@00000004
	.section	.rdata,"dr",discard,__real@00000004
	.p2align	2, 0x0
__real@00000004:
	.long	4                               # 0x4
	.text
	.globl	_fast_moving_average_compute
	.p2align	4
_fast_moving_average_compute:           # @fast_moving_average_compute
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	32(%esp), %edi
	movl	$-1, %eax
	testl	%edi, %edi
	jle	LBB2_25
# %bb.1:
	movl	28(%esp), %esi
	movl	20(%esp), %ecx
	cmpl	%esi, %edi
	setg	%dl
	testl	%ecx, %ecx
	sete	%dh
	orb	%dl, %dh
	jne	LBB2_25
# %bb.2:
	movl	(%ecx), %edx
	testl	%edx, %edx
	je	LBB2_25
# %bb.3:
	cmpl	$0, 36(%esp)
	je	LBB2_25
# %bb.4:
	movl	24(%esp), %ebp
	testl	%ebp, %ebp
	je	LBB2_25
# %bb.5:
	cmpl	%esi, 4(%ecx)
	jl	LBB2_25
# %bb.6:
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, (%edx)
	movl	%esi, %eax
	andl	$3, %eax
	xorl	%ebx, %ebx
	movl	$0, %ecx
	cmpl	$4, %esi
	jb	LBB2_10
# %bb.7:
	movl	28(%esp), %ecx
	andl	$2147483644, %ecx               # imm = 0x7FFFFFFC
	xorl	%esi, %esi
	.p2align	4
LBB2_8:                                 # =>This Inner Loop Header: Depth=1
	vaddsd	(%ebp,%esi,8), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%edx,%esi,8)
	vaddsd	8(%ebp,%esi,8), %xmm0, %xmm0
	vmovsd	%xmm0, 16(%edx,%esi,8)
	vaddsd	16(%ebp,%esi,8), %xmm0, %xmm0
	vmovsd	%xmm0, 24(%edx,%esi,8)
	vaddsd	24(%ebp,%esi,8), %xmm0, %xmm0
	vmovsd	%xmm0, 32(%edx,%esi,8)
	addl	$4, %esi
	cmpl	%esi, %ecx
	jne	LBB2_8
# %bb.9:
	testl	%eax, %eax
	je	LBB2_12
LBB2_10:
	leal	(%edx,%ecx,8), %esi
	addl	$8, %esi
	leal	(,%ecx,8), %ecx
	addl	%ebp, %ecx
	.p2align	4
LBB2_11:                                # =>This Inner Loop Header: Depth=1
	vaddsd	(%ecx,%ebx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%esi,%ebx,8)
	incl	%ebx
	cmpl	%ebx, %eax
	jne	LBB2_11
LBB2_12:                                # %.loopexit8
	leal	-1(%edi), %ebx
	vcvtsi2sd	%edi, %xmm7, %xmm0
	xorl	%ebp, %ebp
	cmpl	$8, 28(%esp)
	jae	LBB2_17
LBB2_13:
	movl	28(%esp), %ecx
LBB2_14:
	movl	%ecx, %eax
	movl	%ebp, %ecx
	orl	$1, %ecx
	testb	$1, %al
	je	LBB2_24
# %bb.15:
	cmpl	%ebx, %ebp
	jae	LBB2_22
# %bb.16:
	vmovsd	__real@7ff8000000000000, %xmm1  # xmm1 = [NaN,0.0E+0]
	jmp	LBB2_23
LBB2_17:
	movl	36(%esp), %ecx
	leal	(%ecx,%edi,8), %eax
	subl	%edx, %eax
	addl	$-8, %eax
	cmpl	$32, %eax
	jb	LBB2_13
# %bb.18:
	movl	%ecx, %eax
	subl	%edx, %eax
	addl	$-8, %eax
	cmpl	$32, %eax
	movl	28(%esp), %ecx
	jb	LBB2_14
# %bb.19:
	movl	%ecx, %ebp
	leal	(,%edi,8), %ecx
	andl	$-4, %ebp
	vmovd	%ebx, %xmm1
	vpbroadcastd	%xmm1, %xmm1
	vbroadcastsd	%xmm0, %ymm2
	movl	%edx, %eax
	subl	%ecx, %eax
	addl	$8, %eax
	vmovdqa	__xmm@00000003000000020000000100000000, %xmm3 # xmm3 = [0,1,2,3]
	xorl	%ecx, %ecx
	vpbroadcastd	__real@00000004, %xmm6  # xmm6 = [4,4,4,4]
	.p2align	4
LBB2_20:                                # =>This Inner Loop Header: Depth=1
	vpcmpgtd	%xmm3, %xmm1, %xmm7
	vpcmpeqd	%xmm4, %xmm4, %xmm4
	vpxor	%xmm4, %xmm7, %xmm7
	vpmovsxdq	%xmm7, %ymm7
	leal	8(%edx), %esi
	vmaskmovpd	(%esi,%ecx,8), %ymm7, %ymm4
	vmaskmovpd	(%eax,%ecx,8), %ymm7, %ymm5
	vsubpd	%ymm5, %ymm4, %ymm4
	vdivpd	%ymm2, %ymm4, %ymm4
	vbroadcastsd	__real@7ff8000000000000, %ymm5 # ymm5 = [NaN,NaN,NaN,NaN]
	vblendvpd	%ymm7, %ymm4, %ymm5, %ymm4
	movl	36(%esp), %esi
	vmovupd	%ymm4, (%esi,%ecx,8)
	addl	$4, %ecx
	vpaddd	%xmm6, %xmm3, %xmm3
	cmpl	%ecx, %ebp
	jne	LBB2_20
# %bb.21:
	xorl	%eax, %eax
	movl	28(%esp), %ecx
	cmpl	%ebp, %ecx
	jne	LBB2_14
	jmp	LBB2_25
LBB2_22:
	vmovsd	(%edx,%ecx,8), %xmm1            # xmm1 = mem[0],zero
	movl	%ecx, %eax
	subl	%edi, %eax
	vsubsd	(%edx,%eax,8), %xmm1, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm1
LBB2_23:
	movl	36(%esp), %eax
	vmovsd	%xmm1, (%eax,%ebp,8)
	movl	%ecx, %ebp
LBB2_24:
	xorl	%eax, %eax
	cmpl	%ecx, 28(%esp)
	jne	LBB2_26
LBB2_25:                                # %.loopexit
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	vzeroupper
	retl
LBB2_26:                                # %.preheader.preheader
	shll	$3, %edi
	movl	%edx, %ecx
	subl	%edi, %ecx
	addl	$16, %ecx
	vmovsd	__real@7ff8000000000000, %xmm1  # xmm1 = [NaN,0.0E+0]
	movl	36(%esp), %edi
	jmp	LBB2_28
	.p2align	4
LBB2_27:                                #   in Loop: Header=BB2_28 Depth=1
	vmovsd	%xmm2, 8(%edi,%ebp,8)
	incl	%esi
	movl	%esi, %ebp
	cmpl	28(%esp), %esi
	je	LBB2_25
LBB2_28:                                # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm1, %xmm2
	cmpl	%ebx, %ebp
	jl	LBB2_30
# %bb.29:                               #   in Loop: Header=BB2_28 Depth=1
	vmovsd	8(%edx,%ebp,8), %xmm2           # xmm2 = mem[0],zero
	vsubsd	-8(%ecx,%ebp,8), %xmm2, %xmm2
	vdivsd	%xmm0, %xmm2, %xmm2
LBB2_30:                                #   in Loop: Header=BB2_28 Depth=1
	vmovsd	%xmm2, (%edi,%ebp,8)
	leal	1(%ebp), %esi
	vmovapd	%xmm1, %xmm2
	cmpl	%ebx, %esi
	jl	LBB2_27
# %bb.31:                               #   in Loop: Header=BB2_28 Depth=1
	vmovsd	16(%edx,%ebp,8), %xmm2          # xmm2 = mem[0],zero
	vsubsd	(%ecx,%ebp,8), %xmm2, %xmm2
	vdivsd	%xmm0, %xmm2, %xmm2
	jmp	LBB2_27
                                        # -- End function
	.def	_fast_moving_average;
	.scl	2;
	.type	32;
	.endef
	.globl	_fast_moving_average            # -- Begin function fast_moving_average
	.p2align	4
_fast_moving_average:                   # @fast_moving_average
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$16, %esp
	movl	40(%esp), %edi
	movl	$-1, %esi
	testl	%edi, %edi
	jle	LBB3_23
# %bb.1:
	leal	8(,%edi,8), %eax
	pushl	%eax
	calll	_malloc
	addl	$4, %esp
	testl	%eax, %eax
	je	LBB3_23
# %bb.2:
	movl	44(%esp), %edx
	testl	%edx, %edx
	setle	%cl
	cmpl	%edi, %edx
	seta	%dl
	orb	%cl, %dl
	movl	$-1, %esi
	jne	LBB3_22
# %bb.3:
	movl	36(%esp), %ebp
	testl	%ebp, %ebp
	sete	%cl
	cmpl	$0, 48(%esp)
	sete	%dl
	orb	%cl, %dl
	jne	LBB3_22
# %bb.4:
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, (%eax)
	movl	%edi, %ebx
	andl	$3, %ebx
	xorl	%edx, %edx
	movl	$0, %esi
	cmpl	$4, %edi
	jb	LBB3_9
# %bb.5:
	movl	%edi, %esi
	andl	$2147483644, %esi               # imm = 0x7FFFFFFC
	xorl	%ecx, %ecx
	.p2align	4
LBB3_6:                                 # =>This Inner Loop Header: Depth=1
	vaddsd	(%ebp,%ecx,8), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%eax,%ecx,8)
	vaddsd	8(%ebp,%ecx,8), %xmm0, %xmm0
	vmovsd	%xmm0, 16(%eax,%ecx,8)
	vaddsd	16(%ebp,%ecx,8), %xmm0, %xmm0
	vmovsd	%xmm0, 24(%eax,%ecx,8)
	vaddsd	24(%ebp,%ecx,8), %xmm0, %xmm0
	vmovsd	%xmm0, 32(%eax,%ecx,8)
	addl	$4, %ecx
	cmpl	%ecx, %esi
	jne	LBB3_6
# %bb.7:
	testl	%ebx, %ebx
	je	LBB3_8
LBB3_9:
	leal	(%eax,%esi,8), %ecx
	addl	$8, %ecx
	leal	(,%esi,8), %esi
	addl	%ebp, %esi
	.p2align	4
LBB3_10:                                # =>This Inner Loop Header: Depth=1
	vaddsd	(%esi,%edx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%ecx,%edx,8)
	incl	%edx
	cmpl	%edx, %ebx
	jne	LBB3_10
# %bb.11:
	movl	44(%esp), %ebp
	leal	-1(%ebp), %ebx
	xorl	%esi, %esi
	vcvtsi2sd	%ebp, %xmm7, %xmm3
	cmpl	$4, %edi
	jae	LBB3_13
# %bb.12:
	movl	48(%esp), %ecx
	jmp	LBB3_17
LBB3_13:                                # %._crit_edge
	movl	%edi, %esi
	andl	$2147483644, %esi               # imm = 0x7FFFFFFC
	jmp	LBB3_14
LBB3_8:                                 # %.thread
	movl	44(%esp), %ebp
	leal	-1(%ebp), %ebx
	vcvtsi2sd	%ebp, %xmm7, %xmm3
LBB3_14:
	vmovd	%ebx, %xmm1
	vpbroadcastd	%xmm1, %xmm1
	vmovupd	%xmm3, (%esp)                   # 16-byte Spill
	vbroadcastsd	%xmm3, %ymm2
	leal	(,%ebp,8), %ecx
	negl	%ecx
	leal	(%eax,%ecx), %edx
	addl	$8, %edx
	leal	8(%eax), %ebp
	vmovdqa	__xmm@00000003000000020000000100000000, %xmm3 # xmm3 = [0,1,2,3]
	xorl	%ecx, %ecx
	vbroadcastsd	__real@7ff8000000000000, %ymm5 # ymm5 = [NaN,NaN,NaN,NaN]
	vpbroadcastd	__real@00000004, %xmm6  # xmm6 = [4,4,4,4]
	movl	48(%esp), %edi
	.p2align	4
LBB3_15:                                # =>This Inner Loop Header: Depth=1
	vpcmpgtd	%xmm3, %xmm1, %xmm7
	vpcmpeqd	%xmm0, %xmm0, %xmm0
	vpxor	%xmm0, %xmm7, %xmm7
	vpmovsxdq	%xmm7, %ymm7
	vmaskmovpd	(%ebp,%ecx,8), %ymm7, %ymm0
	vmaskmovpd	(%edx,%ecx,8), %ymm7, %ymm4
	vsubpd	%ymm4, %ymm0, %ymm0
	vdivpd	%ymm2, %ymm0, %ymm0
	vblendvpd	%ymm7, %ymm0, %ymm5, %ymm0
	vmovupd	%ymm0, (%edi,%ecx,8)
	addl	$4, %ecx
	vpaddd	%xmm6, %xmm3, %xmm3
	cmpl	%ecx, %esi
	jne	LBB3_15
# %bb.16:
	movl	40(%esp), %edx
	cmpl	%esi, %edx
	movl	%edi, %ecx
	movl	%edx, %edi
	movl	44(%esp), %ebp
	vmovupd	(%esp), %xmm3                   # 16-byte Reload
	jne	LBB3_17
LBB3_21:
	xorl	%esi, %esi
LBB3_22:                                # %.loopexit
	pushl	%eax
	vzeroupper
	calll	_free
	addl	$4, %esp
LBB3_23:
	movl	%esi, %eax
	addl	$16, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB3_17:
	shll	$3, %ebp
	movl	%eax, %edx
	subl	%ebp, %edx
	addl	$8, %edx
	vmovsd	__real@7ff8000000000000, %xmm1  # xmm1 = [NaN,0.0E+0]
	jmp	LBB3_18
	.p2align	4
LBB3_20:                                #   in Loop: Header=BB3_18 Depth=1
	vmovsd	%xmm2, (%ecx,%esi,8)
	incl	%esi
	cmpl	%esi, %edi
	je	LBB3_21
LBB3_18:                                # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm1, %xmm2
	cmpl	%ebx, %esi
	jl	LBB3_20
# %bb.19:                               #   in Loop: Header=BB3_18 Depth=1
	vmovsd	8(%eax,%esi,8), %xmm0           # xmm0 = mem[0],zero
	vsubsd	(%edx,%esi,8), %xmm0, %xmm0
	vdivsd	%xmm3, %xmm0, %xmm2
	jmp	LBB3_20
                                        # -- End function
	.def	_main;
	.scl	2;
	.type	32;
	.endef
	.globl	__real@40dfffc000000000         # -- Begin function main
	.section	.rdata,"dr",discard,__real@40dfffc000000000
	.p2align	3, 0x0
__real@40dfffc000000000:
	.quad	0x40dfffc000000000              # double 32767
	.globl	__real@4024000000000000
	.section	.rdata,"dr",discard,__real@4024000000000000
	.p2align	3, 0x0
__real@4024000000000000:
	.quad	0x4024000000000000              # double 10
	.globl	__real@3fe0000000000000
	.section	.rdata,"dr",discard,__real@3fe0000000000000
	.p2align	3, 0x0
__real@3fe0000000000000:
	.quad	0x3fe0000000000000              # double 0.5
	.globl	__xmm@3fe00000000000003fe0000000000000
	.section	.rdata,"dr",discard,__xmm@3fe00000000000003fe0000000000000
	.p2align	4, 0x0
__xmm@3fe00000000000003fe0000000000000:
	.quad	0x3fe0000000000000              # double 0.5
	.quad	0x3fe0000000000000              # double 0.5
	.globl	__xmm@43300000000000004330000000000000
	.section	.rdata,"dr",discard,__xmm@43300000000000004330000000000000
	.p2align	4, 0x0
__xmm@43300000000000004330000000000000:
	.quad	0x4330000000000000              # double 4503599627370496
	.quad	0x4330000000000000              # double 4503599627370496
	.globl	__real@4330000000000000
	.section	.rdata,"dr",discard,__real@4330000000000000
	.p2align	3, 0x0
__real@4330000000000000:
	.quad	0x4330000000000000              # double 4503599627370496
	.globl	__real@408f400000000000
	.section	.rdata,"dr",discard,__real@408f400000000000
	.p2align	3, 0x0
__real@408f400000000000:
	.quad	0x408f400000000000              # double 1000
	.text
	.globl	_main
	.p2align	4
_main:                                  # @main
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	andl	$-16, %esp
	subl	$80, %esp
	movl	$0, (%esp)
	calll	_time
	movl	%eax, (%esp)
	calll	_srand
	movl	$8192, (%esp)                   # imm = 0x2000
	calll	_malloc
	movl	%eax, %edi
	movl	$8192, (%esp)                   # imm = 0x2000
	calll	_malloc
	movl	%eax, %esi
	testl	%edi, %edi
	sete	%al
	testl	%esi, %esi
	sete	%cl
	orb	%al, %cl
	jne	LBB4_4
# %bb.1:                                # %.preheader19.preheader
	xorl	%ebx, %ebx
	.p2align	4
LBB4_2:                                 # %.preheader19
                                        # =>This Inner Loop Header: Depth=1
	calll	_rand
	vcvtsi2sd	%eax, %xmm7, %xmm0
	vdivsd	__real@40dfffc000000000, %xmm0, %xmm0
	vmulsd	__real@4024000000000000, %xmm0, %xmm0
	vmovsd	%xmm0, (%edi,%ebx,8)
	incl	%ebx
	cmpl	$1024, %ebx                     # imm = 0x400
	jne	LBB4_2
# %bb.3:
	movl	$8200, (%esp)                   # imm = 0x2008
	calll	_malloc
	testl	%eax, %eax
	je	LBB4_4
# %bb.5:
	movl	%eax, %ebx
	calll	_clock
	movl	%eax, 36(%esp)                  # 4-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%esp)
	xorl	%eax, %eax
	vbroadcastsd	__real@3fe0000000000000, %ymm1 # ymm1 = [5.0E-1,5.0E-1,5.0E-1,5.0E-1]
	vmovddup	__real@3fe0000000000000, %xmm2  # xmm2 = [5.0E-1,5.0E-1]
                                        # xmm2 = mem[0,0]
	vmovsd	__real@3fe0000000000000, %xmm3  # xmm3 = [5.0E-1,0.0E+0]
	.p2align	4
LBB4_6:                                 # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_7 Depth 2
                                        #     Child Loop BB4_9 Depth 2
	vmovsd	%xmm0, (%ebx)
	movl	$4, %ecx
	vxorpd	%xmm4, %xmm4, %xmm4
	.p2align	4
LBB4_7:                                 #   Parent Loop BB4_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vaddsd	-32(%edi,%ecx,8), %xmm4, %xmm4
	vmovsd	%xmm4, -24(%ebx,%ecx,8)
	vaddsd	-24(%edi,%ecx,8), %xmm4, %xmm4
	vmovsd	%xmm4, -16(%ebx,%ecx,8)
	vaddsd	-16(%edi,%ecx,8), %xmm4, %xmm5
	vaddsd	-8(%edi,%ecx,8), %xmm5, %xmm4
	vmovsd	%xmm5, -8(%ebx,%ecx,8)
	vmovsd	%xmm4, (%ebx,%ecx,8)
	addl	$4, %ecx
	cmpl	$1028, %ecx                     # imm = 0x404
	jne	LBB4_7
# %bb.8:                                # %.preheader.preheader
                                        #   in Loop: Header=BB4_6 Depth=1
	movl	$10, %ecx
	.p2align	4
LBB4_9:                                 # %.preheader
                                        #   Parent Loop BB4_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovupd	-64(%ebx,%ecx,8), %ymm4
	vsubpd	-80(%ebx,%ecx,8), %ymm4, %ymm4
	vmulpd	%ymm1, %ymm4, %ymm4
	vmovupd	%ymm4, -72(%esi,%ecx,8)
	vmovupd	-32(%ebx,%ecx,8), %ymm4
	vsubpd	-48(%ebx,%ecx,8), %ymm4, %ymm4
	vmulpd	%ymm1, %ymm4, %ymm4
	vmovupd	%ymm4, -40(%esi,%ecx,8)
	vmovupd	(%ebx,%ecx,8), %ymm4
	vsubpd	-16(%ebx,%ecx,8), %ymm4, %ymm4
	vmulpd	%ymm1, %ymm4, %ymm4
	vmovupd	%ymm4, -8(%esi,%ecx,8)
	addl	$12, %ecx
	cmpl	$1030, %ecx                     # imm = 0x406
	jne	LBB4_9
# %bb.10:                               #   in Loop: Header=BB4_6 Depth=1
	vmovupd	8176(%ebx), %xmm4
	vsubpd	8160(%ebx), %xmm4, %xmm5
	vmulpd	%xmm2, %xmm5, %xmm6
	vmovupd	%xmm6, 8168(%esi)
	vmovsd	8192(%ebx), %xmm5               # xmm5 = mem[0],zero
	vsubsd	%xmm4, %xmm5, %xmm4
	vmulsd	%xmm3, %xmm4, %xmm5
	vmovsd	%xmm5, 8184(%esi)
	vaddsd	24(%esp), %xmm5, %xmm4
	vmovsd	%xmm4, 24(%esp)
	incl	%eax
	cmpl	$5000, %eax                     # imm = 0x1388
	jne	LBB4_6
# %bb.11:
	vmovapd	%xmm6, 48(%esp)                 # 16-byte Spill
	vmovsd	%xmm5, 40(%esp)                 # 8-byte Spill
	movl	$2146959360, 4(%esi)            # imm = 0x7FF80000
	movl	$0, (%esi)
	vzeroupper
	calll	_clock
	movl	%eax, 32(%esp)                  # 4-byte Spill
	movl	%ebx, (%esp)
	calll	_free
	movl	32(%esp), %eax                  # 4-byte Reload
	subl	36(%esp), %eax                  # 4-byte Folded Reload
	vmovd	%eax, %xmm0
	vpor	__xmm@43300000000000004330000000000000, %xmm0, %xmm0
	vsubsd	__real@4330000000000000, %xmm0, %xmm0
	vdivsd	__real@408f400000000000, %xmm0, %xmm0
	vmovsd	24(%esp), %xmm1                 # xmm1 = mem[0],zero
	vmovsd	%xmm1, 16(%esp)
	vmovsd	%xmm0, 8(%esp)
	movl	$5000, 4(%esp)                  # imm = 0x1388
	movl	$"??_C@_0CH@NEAECOHK@repeats?$DN?$CFd?5elapsed?$DN?$CF?46f?5sec?5sink@", (%esp)
	calll	_printf
	movl	$"??_C@_0N@JLHPNFCI@src?$CIhead8?$CJ?3?5?$AA@", (%esp)
	calll	_printf
	vmovsd	(%edi), %xmm0                   # xmm0 = mem[0],zero
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", (%esp)
	calll	_printf
	vmovsd	8(%edi), %xmm0                  # xmm0 = mem[0],zero
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", (%esp)
	calll	_printf
	vmovsd	16(%edi), %xmm0                 # xmm0 = mem[0],zero
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", (%esp)
	calll	_printf
	vmovsd	24(%edi), %xmm0                 # xmm0 = mem[0],zero
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", (%esp)
	calll	_printf
	vmovsd	32(%edi), %xmm0                 # xmm0 = mem[0],zero
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", (%esp)
	calll	_printf
	vmovsd	40(%edi), %xmm0                 # xmm0 = mem[0],zero
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", (%esp)
	calll	_printf
	vmovsd	48(%edi), %xmm0                 # xmm0 = mem[0],zero
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", (%esp)
	calll	_printf
	vmovsd	56(%edi), %xmm0                 # xmm0 = mem[0],zero
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", (%esp)
	calll	_printf
	movl	$"??_C@_0BB@HJPOOFAK@?4?4?4?5src?$CItail4?$CJ?3?5?$AA@", (%esp)
	calll	_printf
	vmovsd	8160(%edi), %xmm0               # xmm0 = mem[0],zero
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", (%esp)
	calll	_printf
	vmovsd	8168(%edi), %xmm0               # xmm0 = mem[0],zero
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", (%esp)
	calll	_printf
	vmovsd	8176(%edi), %xmm0               # xmm0 = mem[0],zero
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", (%esp)
	calll	_printf
	vmovsd	8184(%edi), %xmm0               # xmm0 = mem[0],zero
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", (%esp)
	calll	_printf
	movl	$10, (%esp)
	calll	_putchar
	movl	$"??_C@_0O@BJBDEOHD@mavg?$CIhead8?$CJ?3?5?$AA@", (%esp)
	calll	_printf
	movl	$"??_C@_04LCAEPKME@NaN?5?$AA@", (%esp)
	calll	_printf
	vmovsd	8(%esi), %xmm0                  # xmm0 = mem[0],zero
	vucomisd	%xmm0, %xmm0
	jp	LBB4_12
# %bb.13:
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@", (%esp)
	calll	_printf
	vmovsd	16(%esi), %xmm0                 # xmm0 = mem[0],zero
	vucomisd	%xmm0, %xmm0
	jp	LBB4_15
LBB4_16:
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@", (%esp)
	calll	_printf
	vmovsd	24(%esi), %xmm0                 # xmm0 = mem[0],zero
	vucomisd	%xmm0, %xmm0
	jp	LBB4_18
LBB4_19:
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@", (%esp)
	calll	_printf
	vmovsd	32(%esi), %xmm0                 # xmm0 = mem[0],zero
	vucomisd	%xmm0, %xmm0
	jp	LBB4_21
LBB4_22:
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@", (%esp)
	calll	_printf
	vmovsd	40(%esi), %xmm0                 # xmm0 = mem[0],zero
	vucomisd	%xmm0, %xmm0
	jp	LBB4_24
LBB4_25:
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@", (%esp)
	calll	_printf
	vmovsd	48(%esi), %xmm0                 # xmm0 = mem[0],zero
	vucomisd	%xmm0, %xmm0
	jp	LBB4_27
LBB4_28:
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@", (%esp)
	calll	_printf
	vmovsd	56(%esi), %xmm0                 # xmm0 = mem[0],zero
	vucomisd	%xmm0, %xmm0
	jp	LBB4_30
LBB4_31:
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@", (%esp)
LBB4_32:
	calll	_printf
	movl	$"??_C@_0BC@OPNFLFPA@?4?4?4?5mavg?$CItail4?$CJ?3?5?$AA@", (%esp)
	calll	_printf
	vmovsd	8160(%esi), %xmm0               # xmm0 = mem[0],zero
	vucomisd	%xmm0, %xmm0
	jp	LBB4_33
# %bb.34:
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@", (%esp)
	calll	_printf
	vmovapd	48(%esp), %xmm0                 # 16-byte Reload
	vucomisd	%xmm0, %xmm0
	jp	LBB4_36
LBB4_37:
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@", (%esp)
	calll	_printf
	vpermilpd	$1, 48(%esp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	vucomisd	%xmm0, %xmm0
	jp	LBB4_39
LBB4_40:
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@", (%esp)
	calll	_printf
	vmovsd	40(%esp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vucomisd	%xmm0, %xmm0
	jp	LBB4_42
LBB4_43:
	vmovsd	%xmm0, 4(%esp)
	movl	$"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@", (%esp)
LBB4_44:
	calll	_printf
	movl	$10, (%esp)
	calll	_putchar
	movl	%edi, (%esp)
	calll	_free
	movl	%esi, (%esp)
	calll	_free
	xorl	%eax, %eax
	jmp	LBB4_45
LBB4_4:
	movl	%edi, (%esp)
	calll	_free
	movl	%esi, (%esp)
	calll	_free
	movl	$-1, %eax
LBB4_45:
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB4_12:
	movl	$"??_C@_04LCAEPKME@NaN?5?$AA@", (%esp)
	calll	_printf
	vmovsd	16(%esi), %xmm0                 # xmm0 = mem[0],zero
	vucomisd	%xmm0, %xmm0
	jnp	LBB4_16
LBB4_15:
	movl	$"??_C@_04LCAEPKME@NaN?5?$AA@", (%esp)
	calll	_printf
	vmovsd	24(%esi), %xmm0                 # xmm0 = mem[0],zero
	vucomisd	%xmm0, %xmm0
	jnp	LBB4_19
LBB4_18:
	movl	$"??_C@_04LCAEPKME@NaN?5?$AA@", (%esp)
	calll	_printf
	vmovsd	32(%esi), %xmm0                 # xmm0 = mem[0],zero
	vucomisd	%xmm0, %xmm0
	jnp	LBB4_22
LBB4_21:
	movl	$"??_C@_04LCAEPKME@NaN?5?$AA@", (%esp)
	calll	_printf
	vmovsd	40(%esi), %xmm0                 # xmm0 = mem[0],zero
	vucomisd	%xmm0, %xmm0
	jnp	LBB4_25
LBB4_24:
	movl	$"??_C@_04LCAEPKME@NaN?5?$AA@", (%esp)
	calll	_printf
	vmovsd	48(%esi), %xmm0                 # xmm0 = mem[0],zero
	vucomisd	%xmm0, %xmm0
	jnp	LBB4_28
LBB4_27:
	movl	$"??_C@_04LCAEPKME@NaN?5?$AA@", (%esp)
	calll	_printf
	vmovsd	56(%esi), %xmm0                 # xmm0 = mem[0],zero
	vucomisd	%xmm0, %xmm0
	jnp	LBB4_31
LBB4_30:
	movl	$"??_C@_04LCAEPKME@NaN?5?$AA@", (%esp)
	jmp	LBB4_32
LBB4_33:
	movl	$"??_C@_04LCAEPKME@NaN?5?$AA@", (%esp)
	calll	_printf
	vmovapd	48(%esp), %xmm0                 # 16-byte Reload
	vucomisd	%xmm0, %xmm0
	jnp	LBB4_37
LBB4_36:
	movl	$"??_C@_04LCAEPKME@NaN?5?$AA@", (%esp)
	calll	_printf
	vpermilpd	$1, 48(%esp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	vucomisd	%xmm0, %xmm0
	jnp	LBB4_40
LBB4_39:
	movl	$"??_C@_04LCAEPKME@NaN?5?$AA@", (%esp)
	calll	_printf
	vmovsd	40(%esp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vucomisd	%xmm0, %xmm0
	jnp	LBB4_43
LBB4_42:
	movl	$"??_C@_04LCAEPKME@NaN?5?$AA@", (%esp)
	jmp	LBB4_44
                                        # -- End function
	.section	.rdata,"dr",discard,"??_C@_0CH@NEAECOHK@repeats?$DN?$CFd?5elapsed?$DN?$CF?46f?5sec?5sink@"
	.globl	"??_C@_0CH@NEAECOHK@repeats?$DN?$CFd?5elapsed?$DN?$CF?46f?5sec?5sink@" # @"??_C@_0CH@NEAECOHK@repeats?$DN?$CFd?5elapsed?$DN?$CF?46f?5sec?5sink@"
"??_C@_0CH@NEAECOHK@repeats?$DN?$CFd?5elapsed?$DN?$CF?46f?5sec?5sink@":
	.asciz	"repeats=%d elapsed=%.6f sec sink=%.6f\n"

	.section	.rdata,"dr",discard,"??_C@_0N@JLHPNFCI@src?$CIhead8?$CJ?3?5?$AA@"
	.globl	"??_C@_0N@JLHPNFCI@src?$CIhead8?$CJ?3?5?$AA@" # @"??_C@_0N@JLHPNFCI@src?$CIhead8?$CJ?3?5?$AA@"
"??_C@_0N@JLHPNFCI@src?$CIhead8?$CJ?3?5?$AA@":
	.asciz	"src(head8): "

	.section	.rdata,"dr",discard,"??_C@_05FMONJPMD@?$CF?43f?5?$AA@"
	.globl	"??_C@_05FMONJPMD@?$CF?43f?5?$AA@" # @"??_C@_05FMONJPMD@?$CF?43f?5?$AA@"
"??_C@_05FMONJPMD@?$CF?43f?5?$AA@":
	.asciz	"%.3f "

	.section	.rdata,"dr",discard,"??_C@_0BB@HJPOOFAK@?4?4?4?5src?$CItail4?$CJ?3?5?$AA@"
	.globl	"??_C@_0BB@HJPOOFAK@?4?4?4?5src?$CItail4?$CJ?3?5?$AA@" # @"??_C@_0BB@HJPOOFAK@?4?4?4?5src?$CItail4?$CJ?3?5?$AA@"
"??_C@_0BB@HJPOOFAK@?4?4?4?5src?$CItail4?$CJ?3?5?$AA@":
	.asciz	"... src(tail4): "

	.section	.rdata,"dr",discard,"??_C@_0O@BJBDEOHD@mavg?$CIhead8?$CJ?3?5?$AA@"
	.globl	"??_C@_0O@BJBDEOHD@mavg?$CIhead8?$CJ?3?5?$AA@" # @"??_C@_0O@BJBDEOHD@mavg?$CIhead8?$CJ?3?5?$AA@"
"??_C@_0O@BJBDEOHD@mavg?$CIhead8?$CJ?3?5?$AA@":
	.asciz	"mavg(head8): "

	.section	.rdata,"dr",discard,"??_C@_04LCAEPKME@NaN?5?$AA@"
	.globl	"??_C@_04LCAEPKME@NaN?5?$AA@"   # @"??_C@_04LCAEPKME@NaN?5?$AA@"
"??_C@_04LCAEPKME@NaN?5?$AA@":
	.asciz	"NaN "

	.section	.rdata,"dr",discard,"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@"
	.globl	"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@" # @"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@"
"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@":
	.asciz	"%.2f "

	.section	.rdata,"dr",discard,"??_C@_0BC@OPNFLFPA@?4?4?4?5mavg?$CItail4?$CJ?3?5?$AA@"
	.globl	"??_C@_0BC@OPNFLFPA@?4?4?4?5mavg?$CItail4?$CJ?3?5?$AA@" # @"??_C@_0BC@OPNFLFPA@?4?4?4?5mavg?$CItail4?$CJ?3?5?$AA@"
"??_C@_0BC@OPNFLFPA@?4?4?4?5mavg?$CItail4?$CJ?3?5?$AA@":
	.asciz	"... mavg(tail4): "

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
	.globl	__fltused
