	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"string.c"
	.def	_String_Clear;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_String_Clear                   # -- Begin function String_Clear
	.p2align	4
_String_Clear:                          # @String_Clear
# %bb.0:
	movl	4(%esp), %eax
	movw	$0, (%eax)
	movb	$0, 2(%eax)
	retl
                                        # -- End function
	.def	_String_Set;
	.scl	2;
	.type	32;
	.endef
	.globl	_String_Set                     # -- Begin function String_Set
	.p2align	4
_String_Set:                            # @String_Set
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %esi
	movl	16(%esp), %edi
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	cmpl	$80, %eax
	movl	$80, %ecx
	cmovll	%eax, %ecx
	movw	%cx, (%esi)
	addl	$2, %esi
	pushl	$80
	pushl	%edi
	pushl	%esi
	calll	_strncpy
	addl	$12, %esp
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_String_Create;
	.scl	2;
	.type	32;
	.endef
	.globl	_String_Create                  # -- Begin function String_Create
	.p2align	4
_String_Create:                         # @String_Create
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %esi
	movl	16(%esp), %edi
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	cmpl	$80, %eax
	movl	$80, %ecx
	cmovll	%eax, %ecx
	movw	%cx, (%esi)
	leal	2(%esi), %ecx
	pushl	%eax
	pushl	%edi
	pushl	%ecx
	calll	_strncpy
	addl	$12, %esp
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_String_Get;
	.scl	2;
	.type	32;
	.endef
	.globl	_String_Get                     # -- Begin function String_Get
	.p2align	4
_String_Get:                            # @String_Get
# %bb.0:
	movl	4(%esp), %eax
	addl	$2, %eax
	retl
                                        # -- End function
	.def	_String_Copy;
	.scl	2;
	.type	32;
	.endef
	.globl	_String_Copy                    # -- Begin function String_Copy
	.p2align	4
_String_Copy:                           # @String_Copy
# %bb.0:
	movl	8(%esp), %ecx
	movl	4(%esp), %eax
	testl	%eax, %eax
	sete	%dl
	testl	%ecx, %ecx
	sete	%dh
	orb	%dl, %dh
	jne	LBB4_2
# %bb.1:
	movl	79(%ecx), %edx
	movl	%edx, 79(%eax)
	movups	64(%ecx), %xmm0
	movups	%xmm0, 64(%eax)
	movups	48(%ecx), %xmm0
	movups	%xmm0, 48(%eax)
	movups	32(%ecx), %xmm0
	movups	%xmm0, 32(%eax)
	movups	(%ecx), %xmm0
	movups	16(%ecx), %xmm1
	movups	%xmm1, 16(%eax)
	movups	%xmm0, (%eax)
LBB4_2:
	retl
                                        # -- End function
	.def	_String_Packing;
	.scl	2;
	.type	32;
	.endef
	.globl	__xmm@20202020202020202020202020202020 # -- Begin function String_Packing
	.section	.rdata,"dr",discard,__xmm@20202020202020202020202020202020
	.p2align	4, 0x0
__xmm@20202020202020202020202020202020:
	.zero	16,32
	.globl	__xmm@00000020000000200000002000000020
	.section	.rdata,"dr",discard,__xmm@00000020000000200000002000000020
	.p2align	4, 0x0
__xmm@00000020000000200000002000000020:
	.long	32                              # 0x20
	.long	32                              # 0x20
	.long	32                              # 0x20
	.long	32                              # 0x20
	.globl	__xmm@00000000000000000000000020200000
	.section	.rdata,"dr",discard,__xmm@00000000000000000000000020200000
	.p2align	4, 0x0
__xmm@00000000000000000000000020200000:
	.zero	1
	.zero	1
	.byte	32                              # 0x20
	.byte	32                              # 0x20
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.globl	__xmm@00000000000000000000202000000000
	.section	.rdata,"dr",discard,__xmm@00000000000000000000202000000000
	.p2align	4, 0x0
__xmm@00000000000000000000202000000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	32                              # 0x20
	.byte	32                              # 0x20
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.globl	__xmm@00000000000000002020000000000000
	.section	.rdata,"dr",discard,__xmm@00000000000000002020000000000000
	.p2align	4, 0x0
__xmm@00000000000000002020000000000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	32                              # 0x20
	.byte	32                              # 0x20
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.globl	__xmm@00000000000020200000000000000000
	.section	.rdata,"dr",discard,__xmm@00000000000020200000000000000000
	.p2align	4, 0x0
__xmm@00000000000020200000000000000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	32                              # 0x20
	.byte	32                              # 0x20
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.globl	__xmm@00000000202000000000000000000000
	.section	.rdata,"dr",discard,__xmm@00000000202000000000000000000000
	.p2align	4, 0x0
__xmm@00000000202000000000000000000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	32                              # 0x20
	.byte	32                              # 0x20
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.globl	__xmm@00002020000000000000000000000000
	.section	.rdata,"dr",discard,__xmm@00002020000000000000000000000000
	.p2align	4, 0x0
__xmm@00002020000000000000000000000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	32                              # 0x20
	.byte	32                              # 0x20
	.zero	1
	.zero	1
	.globl	__xmm@20200000000000000000000000000000
	.section	.rdata,"dr",discard,__xmm@20200000000000000000000000000000
	.p2align	4, 0x0
__xmm@20200000000000000000000000000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	32                              # 0x20
	.byte	32                              # 0x20
	.text
	.globl	_String_Packing
	.p2align	4
_String_Packing:                        # @String_Packing
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	%eax
	movl	24(%esp), %esi
	xorl	%ebp, %ebp
	testl	%esi, %esi
	je	LBB5_108
# %bb.1:
	pushl	%esi
	calll	_strlen
	addl	$4, %esp
	cmpl	$2, %eax
	jge	LBB5_2
LBB5_108:                               # %.loopexit
	movl	%ebp, %eax
	addl	$4, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB5_2:                                 # %.preheader.preheader
	leal	32(%esi), %ebx
	movl	$-1, %edx
	.p2align	4
LBB5_3:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movzbl	-32(%ebx), %ecx
	testl	%ecx, %ecx
	je	LBB5_108
# %bb.4:                                # %.preheader
                                        #   in Loop: Header=BB5_3 Depth=1
	cmpl	$39, %ecx
	je	LBB5_6
# %bb.5:                                # %.preheader
                                        #   in Loop: Header=BB5_3 Depth=1
	cmpl	$34, %ecx
	je	LBB5_6
# %bb.109:                              #   in Loop: Header=BB5_3 Depth=1
	decl	%edx
	incl	%ebx
	jmp	LBB5_3
LBB5_6:
	leal	(%esi,%eax), %edi
	movl	%edx, (%esp)                    # 4-byte Spill
	addl	%edx, %eax
	leal	-31(%ebx), %esi
	.p2align	4
LBB5_7:                                 # =>This Inner Loop Header: Depth=1
	decl	%edi
	cmpl	%esi, %edi
	jb	LBB5_8
# %bb.9:                                #   in Loop: Header=BB5_7 Depth=1
	movzbl	(%edi), %ecx
	decl	%eax
	cmpl	$34, %ecx
	je	LBB5_11
# %bb.10:                               #   in Loop: Header=BB5_7 Depth=1
	cmpl	$39, %ecx
	jne	LBB5_7
LBB5_11:
	movb	$2, -32(%ebx)
	movb	$3, (%edi)
	cmpl	%edi, %esi
	jae	LBB5_108
# %bb.12:
	cmpl	$8, %eax
	jb	LBB5_84
# %bb.13:
	xorl	%ebp, %ebp
	cmpl	$32, %eax
	jb	LBB5_87
# %bb.14:
	movl	%eax, %ebp
	andl	$-32, %ebp
	xorl	%esi, %esi
	movdqa	__xmm@20202020202020202020202020202020, %xmm0 # xmm0 = [32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32]
	jmp	LBB5_15
	.p2align	4
LBB5_79:                                #   in Loop: Header=BB5_15 Depth=1
	addl	$32, %esi
	cmpl	%esi, %ebp
	je	LBB5_80
LBB5_15:                                # =>This Inner Loop Header: Depth=1
	movdqu	-31(%ebx,%esi), %xmm2
	pcmpeqb	%xmm0, %xmm2
	movd	%xmm2, %edx
	testb	$1, %dl
	je	LBB5_17
# %bb.16:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -31(%ebx,%esi)
LBB5_17:                                #   in Loop: Header=BB5_15 Depth=1
	testb	$1, %dh
	je	LBB5_19
# %bb.18:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -30(%ebx,%esi)
LBB5_19:                                #   in Loop: Header=BB5_15 Depth=1
	movl	%edx, %ecx
	shrl	$16, %ecx
	testb	$1, %cl
	je	LBB5_21
# %bb.20:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -29(%ebx,%esi)
LBB5_21:                                #   in Loop: Header=BB5_15 Depth=1
	shrl	$24, %edx
	testb	$1, %dl
	je	LBB5_23
# %bb.22:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -28(%ebx,%esi)
LBB5_23:                                #   in Loop: Header=BB5_15 Depth=1
	pextrw	$2, %xmm2, %ecx
	testb	$1, %cl
	je	LBB5_25
# %bb.24:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -27(%ebx,%esi)
LBB5_25:                                #   in Loop: Header=BB5_15 Depth=1
	testb	$1, %ch
	je	LBB5_27
# %bb.26:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -26(%ebx,%esi)
LBB5_27:                                #   in Loop: Header=BB5_15 Depth=1
	pextrw	$3, %xmm2, %ecx
	testb	$1, %cl
	je	LBB5_29
# %bb.28:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -25(%ebx,%esi)
LBB5_29:                                #   in Loop: Header=BB5_15 Depth=1
	testb	$1, %ch
	je	LBB5_31
# %bb.30:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -24(%ebx,%esi)
LBB5_31:                                #   in Loop: Header=BB5_15 Depth=1
	pextrw	$4, %xmm2, %ecx
	testb	$1, %cl
	je	LBB5_33
# %bb.32:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -23(%ebx,%esi)
LBB5_33:                                #   in Loop: Header=BB5_15 Depth=1
	testb	$1, %ch
	je	LBB5_35
# %bb.34:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -22(%ebx,%esi)
LBB5_35:                                #   in Loop: Header=BB5_15 Depth=1
	movdqu	-15(%ebx,%esi), %xmm1
	pextrw	$5, %xmm2, %ecx
	testb	$1, %cl
	je	LBB5_37
# %bb.36:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -21(%ebx,%esi)
LBB5_37:                                #   in Loop: Header=BB5_15 Depth=1
	testb	$1, %ch
	je	LBB5_39
# %bb.38:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -20(%ebx,%esi)
LBB5_39:                                #   in Loop: Header=BB5_15 Depth=1
	pextrw	$6, %xmm2, %ecx
	testb	$1, %cl
	je	LBB5_41
# %bb.40:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -19(%ebx,%esi)
LBB5_41:                                #   in Loop: Header=BB5_15 Depth=1
	testb	$1, %ch
	je	LBB5_43
# %bb.42:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -18(%ebx,%esi)
LBB5_43:                                #   in Loop: Header=BB5_15 Depth=1
	pextrw	$7, %xmm2, %ecx
	testb	$1, %cl
	je	LBB5_45
# %bb.44:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -17(%ebx,%esi)
LBB5_45:                                #   in Loop: Header=BB5_15 Depth=1
	testb	$1, %ch
	je	LBB5_47
# %bb.46:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -16(%ebx,%esi)
LBB5_47:                                #   in Loop: Header=BB5_15 Depth=1
	pcmpeqb	%xmm0, %xmm1
	movd	%xmm1, %ecx
	testb	$1, %cl
	je	LBB5_49
# %bb.48:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -15(%ebx,%esi)
LBB5_49:                                #   in Loop: Header=BB5_15 Depth=1
	testb	$1, %ch
	je	LBB5_51
# %bb.50:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -14(%ebx,%esi)
LBB5_51:                                #   in Loop: Header=BB5_15 Depth=1
	movl	%ecx, %edx
	shrl	$16, %edx
	testb	$1, %dl
	je	LBB5_53
# %bb.52:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -13(%ebx,%esi)
LBB5_53:                                #   in Loop: Header=BB5_15 Depth=1
	shrl	$24, %ecx
	testb	$1, %cl
	je	LBB5_55
# %bb.54:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -12(%ebx,%esi)
LBB5_55:                                #   in Loop: Header=BB5_15 Depth=1
	pextrw	$2, %xmm1, %ecx
	testb	$1, %cl
	je	LBB5_57
# %bb.56:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -11(%ebx,%esi)
LBB5_57:                                #   in Loop: Header=BB5_15 Depth=1
	testb	$1, %ch
	je	LBB5_59
# %bb.58:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -10(%ebx,%esi)
LBB5_59:                                #   in Loop: Header=BB5_15 Depth=1
	pextrw	$3, %xmm1, %ecx
	testb	$1, %cl
	je	LBB5_61
# %bb.60:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -9(%ebx,%esi)
LBB5_61:                                #   in Loop: Header=BB5_15 Depth=1
	testb	$1, %ch
	je	LBB5_63
# %bb.62:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -8(%ebx,%esi)
LBB5_63:                                #   in Loop: Header=BB5_15 Depth=1
	pextrw	$4, %xmm1, %ecx
	testb	$1, %cl
	je	LBB5_65
# %bb.64:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -7(%ebx,%esi)
LBB5_65:                                #   in Loop: Header=BB5_15 Depth=1
	testb	$1, %ch
	je	LBB5_67
# %bb.66:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -6(%ebx,%esi)
LBB5_67:                                #   in Loop: Header=BB5_15 Depth=1
	pextrw	$5, %xmm1, %ecx
	testb	$1, %cl
	je	LBB5_69
# %bb.68:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -5(%ebx,%esi)
LBB5_69:                                #   in Loop: Header=BB5_15 Depth=1
	testb	$1, %ch
	je	LBB5_71
# %bb.70:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -4(%ebx,%esi)
LBB5_71:                                #   in Loop: Header=BB5_15 Depth=1
	pextrw	$6, %xmm1, %ecx
	testb	$1, %cl
	je	LBB5_73
# %bb.72:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -3(%ebx,%esi)
LBB5_73:                                #   in Loop: Header=BB5_15 Depth=1
	testb	$1, %ch
	je	LBB5_75
# %bb.74:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -2(%ebx,%esi)
LBB5_75:                                #   in Loop: Header=BB5_15 Depth=1
	pextrw	$7, %xmm1, %ecx
	testb	$1, %cl
	je	LBB5_77
# %bb.76:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, -1(%ebx,%esi)
LBB5_77:                                #   in Loop: Header=BB5_15 Depth=1
	testb	$1, %ch
	je	LBB5_79
# %bb.78:                               #   in Loop: Header=BB5_15 Depth=1
	movb	$1, (%ebx,%esi)
	jmp	LBB5_79
LBB5_8:
	movl	$8197, %ebp                     # imm = 0x2005
	jmp	LBB5_108
LBB5_80:
	cmpl	%ebp, %eax
	je	LBB5_107
# %bb.81:
	testb	$24, %al
	je	LBB5_82
LBB5_87:
	movl	%eax, %edx
	andl	$-8, %edx
	movdqa	__xmm@00000000000000000000202000000000, %xmm2 # xmm2 = [u,u,u,u,32,32,u,u,u,u,u,u,u,u,u,u]
	movdqa	__xmm@00000000000000002020000000000000, %xmm3 # xmm3 = [u,u,u,u,u,u,32,32,u,u,u,u,u,u,u,u]
	movdqa	__xmm@00000000000020200000000000000000, %xmm4 # xmm4 = [u,u,u,u,u,u,u,u,32,32,u,u,u,u,u,u]
	movdqa	__xmm@00000000202000000000000000000000, %xmm5 # xmm5 = [u,u,u,u,u,u,u,u,u,u,32,32,u,u,u,u]
	movdqa	__xmm@00002020000000000000000000000000, %xmm6 # xmm6 = [u,u,u,u,u,u,u,u,u,u,u,u,32,32,u,u]
	movdqa	__xmm@20200000000000000000000000000000, %xmm7 # xmm7 = [u,u,u,u,u,u,u,u,u,u,u,u,u,u,32,32]
	jmp	LBB5_88
	.p2align	4
LBB5_104:                               #   in Loop: Header=BB5_88 Depth=1
	addl	$8, %ebp
	cmpl	%ebp, %edx
	je	LBB5_105
LBB5_88:                                # =>This Inner Loop Header: Depth=1
	movq	-31(%ebx,%ebp), %xmm1           # xmm1 = mem[0],zero
	movdqa	%xmm1, %xmm0
	pcmpeqb	__xmm@00000020000000200000002000000020, %xmm0
	movd	%xmm0, %ecx
	testb	$1, %cl
	je	LBB5_90
# %bb.89:                               #   in Loop: Header=BB5_88 Depth=1
	movb	$1, -31(%ebx,%ebp)
LBB5_90:                                #   in Loop: Header=BB5_88 Depth=1
	movdqa	%xmm1, %xmm0
	pslld	$8, %xmm0
	pcmpeqb	__xmm@00000000000000000000000020200000, %xmm0
	movd	%xmm0, %ecx
	shrl	$16, %ecx
	testb	$1, %cl
	je	LBB5_92
# %bb.91:                               #   in Loop: Header=BB5_88 Depth=1
	movb	$1, -30(%ebx,%ebp)
LBB5_92:                                #   in Loop: Header=BB5_88 Depth=1
	pshuflw	$85, %xmm1, %xmm0               # xmm0 = xmm1[1,1,1,1,4,5,6,7]
	pcmpeqb	%xmm2, %xmm0
	pextrw	$2, %xmm0, %ecx
	testb	$1, %cl
	je	LBB5_94
# %bb.93:                               #   in Loop: Header=BB5_88 Depth=1
	movb	$1, -29(%ebx,%ebp)
LBB5_94:                                #   in Loop: Header=BB5_88 Depth=1
	movdqa	%xmm1, %xmm0
	psllq	$24, %xmm0
	pcmpeqb	%xmm3, %xmm0
	pextrw	$3, %xmm0, %ecx
	testb	$1, %cl
	je	LBB5_96
# %bb.95:                               #   in Loop: Header=BB5_88 Depth=1
	movb	$1, -28(%ebx,%ebp)
LBB5_96:                                #   in Loop: Header=BB5_88 Depth=1
	pshufd	$85, %xmm1, %xmm0               # xmm0 = xmm1[1,1,1,1]
	pcmpeqb	%xmm4, %xmm0
	pextrw	$4, %xmm0, %ecx
	testb	$1, %cl
	je	LBB5_98
# %bb.97:                               #   in Loop: Header=BB5_88 Depth=1
	movb	$1, -27(%ebx,%ebp)
LBB5_98:                                #   in Loop: Header=BB5_88 Depth=1
	movdqa	%xmm1, %xmm0
	pslldq	$5, %xmm0                       # xmm0 = zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7,8,9,10]
	pcmpeqb	%xmm5, %xmm0
	pextrw	$5, %xmm0, %ecx
	testb	$1, %cl
	je	LBB5_100
# %bb.99:                               #   in Loop: Header=BB5_88 Depth=1
	movb	$1, -26(%ebx,%ebp)
LBB5_100:                               #   in Loop: Header=BB5_88 Depth=1
	movdqa	%xmm1, %xmm0
	pslldq	$6, %xmm0                       # xmm0 = zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7,8,9]
	pcmpeqb	%xmm6, %xmm0
	pextrw	$6, %xmm0, %ecx
	testb	$1, %cl
	je	LBB5_102
# %bb.101:                              #   in Loop: Header=BB5_88 Depth=1
	movb	$1, -25(%ebx,%ebp)
LBB5_102:                               #   in Loop: Header=BB5_88 Depth=1
	pslldq	$7, %xmm1                       # xmm1 = zero,zero,zero,zero,zero,zero,zero,xmm1[0,1,2,3,4,5,6,7,8]
	pcmpeqb	%xmm7, %xmm1
	pextrw	$7, %xmm1, %ecx
	testb	$1, %cl
	je	LBB5_104
# %bb.103:                              #   in Loop: Header=BB5_88 Depth=1
	movb	$1, -24(%ebx,%ebp)
	jmp	LBB5_104
LBB5_105:
	cmpl	%edx, %eax
	jne	LBB5_106
LBB5_107:
	xorl	%ebp, %ebp
	jmp	LBB5_108
LBB5_106:
	movl	24(%esp), %esi
	addl	%edx, %esi
LBB5_83:                                # %.preheader54
	subl	(%esp), %esi                    # 4-byte Folded Reload
	xorl	%ebp, %ebp
	jmp	LBB5_84
	.p2align	4
LBB5_86:                                #   in Loop: Header=BB5_84 Depth=1
	incl	%esi
	cmpl	%esi, %edi
	je	LBB5_108
LBB5_84:                                # =>This Inner Loop Header: Depth=1
	cmpb	$32, (%esi)
	jne	LBB5_86
# %bb.85:                               #   in Loop: Header=BB5_84 Depth=1
	movb	$1, (%esi)
	jmp	LBB5_86
LBB5_82:
	movl	24(%esp), %esi
	addl	%ebp, %esi
	jmp	LBB5_83
                                        # -- End function
	.def	_String_Unpacking;
	.scl	2;
	.type	32;
	.endef
	.globl	__xmm@01010101010101010101010101010101 # -- Begin function String_Unpacking
	.section	.rdata,"dr",discard,__xmm@01010101010101010101010101010101
	.p2align	4, 0x0
__xmm@01010101010101010101010101010101:
	.zero	16,1
	.globl	__xmm@00000001000000010000000100000001
	.section	.rdata,"dr",discard,__xmm@00000001000000010000000100000001
	.p2align	4, 0x0
__xmm@00000001000000010000000100000001:
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.globl	__xmm@00000000000000000000000001010000
	.section	.rdata,"dr",discard,__xmm@00000000000000000000000001010000
	.p2align	4, 0x0
__xmm@00000000000000000000000001010000:
	.zero	1
	.zero	1
	.byte	1                               # 0x1
	.byte	1                               # 0x1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.globl	__xmm@00000000000000000000010100000000
	.section	.rdata,"dr",discard,__xmm@00000000000000000000010100000000
	.p2align	4, 0x0
__xmm@00000000000000000000010100000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	1                               # 0x1
	.byte	1                               # 0x1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.globl	__xmm@00000000000000000101000000000000
	.section	.rdata,"dr",discard,__xmm@00000000000000000101000000000000
	.p2align	4, 0x0
__xmm@00000000000000000101000000000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	1                               # 0x1
	.byte	1                               # 0x1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.globl	__xmm@00000000000001010000000000000000
	.section	.rdata,"dr",discard,__xmm@00000000000001010000000000000000
	.p2align	4, 0x0
__xmm@00000000000001010000000000000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	1                               # 0x1
	.byte	1                               # 0x1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.globl	__xmm@00000000010100000000000000000000
	.section	.rdata,"dr",discard,__xmm@00000000010100000000000000000000
	.p2align	4, 0x0
__xmm@00000000010100000000000000000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	1                               # 0x1
	.byte	1                               # 0x1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.globl	__xmm@00000101000000000000000000000000
	.section	.rdata,"dr",discard,__xmm@00000101000000000000000000000000
	.p2align	4, 0x0
__xmm@00000101000000000000000000000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	1                               # 0x1
	.byte	1                               # 0x1
	.zero	1
	.zero	1
	.globl	__xmm@01010000000000000000000000000000
	.section	.rdata,"dr",discard,__xmm@01010000000000000000000000000000
	.p2align	4, 0x0
__xmm@01010000000000000000000000000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	1                               # 0x1
	.byte	1                               # 0x1
	.text
	.globl	_String_Unpacking
	.p2align	4
_String_Unpacking:                      # @String_Unpacking
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	%eax
	movl	24(%esp), %esi
	xorl	%ebp, %ebp
	testl	%esi, %esi
	je	LBB6_79
# %bb.1:
	pushl	%esi
	calll	_strlen
	addl	$4, %esp
	cmpl	$2, %eax
	jl	LBB6_79
# %bb.2:                                # %.preheader.preheader
	leal	32(%esi), %ebx
	movl	$-1, %edi
	.p2align	4
LBB6_3:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movzbl	-32(%ebx), %ecx
	testl	%ecx, %ecx
	je	LBB6_79
# %bb.4:                                # %.preheader
                                        #   in Loop: Header=BB6_3 Depth=1
	cmpl	$2, %ecx
	je	LBB6_6
# %bb.5:                                #   in Loop: Header=BB6_3 Depth=1
	decl	%edi
	incl	%ebx
	jmp	LBB6_3
LBB6_6:
	leal	(%esi,%eax), %edx
	addl	%edi, %eax
	leal	-31(%ebx), %esi
	.p2align	4
LBB6_7:                                 # =>This Inner Loop Header: Depth=1
	decl	%edx
	cmpl	%esi, %edx
	jb	LBB6_78
# %bb.8:                                #   in Loop: Header=BB6_7 Depth=1
	decl	%eax
	cmpb	$3, (%edx)
	jne	LBB6_7
# %bb.9:
	movb	$39, -32(%ebx)
	movb	$39, (%edx)
	cmpl	%edx, %esi
	jae	LBB6_79
# %bb.10:
	cmpl	$8, %eax
	jb	LBB6_106
# %bb.11:
	xorl	%ebp, %ebp
	cmpl	$32, %eax
	movl	%eax, (%esp)                    # 4-byte Spill
	jb	LBB6_83
# %bb.12:
	movl	%eax, %ebp
	andl	$-32, %ebp
	xorl	%esi, %esi
	movdqa	__xmm@01010101010101010101010101010101, %xmm0 # xmm0 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
	jmp	LBB6_14
	.p2align	4
LBB6_13:                                #   in Loop: Header=BB6_14 Depth=1
	addl	$32, %esi
	cmpl	%esi, %ebp
	je	LBB6_80
LBB6_14:                                # =>This Inner Loop Header: Depth=1
	movdqu	-31(%ebx,%esi), %xmm2
	pcmpeqb	%xmm0, %xmm2
	movd	%xmm2, %eax
	testb	$1, %al
	je	LBB6_16
# %bb.15:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -31(%ebx,%esi)
LBB6_16:                                #   in Loop: Header=BB6_14 Depth=1
	testb	$1, %ah
	je	LBB6_18
# %bb.17:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -30(%ebx,%esi)
LBB6_18:                                #   in Loop: Header=BB6_14 Depth=1
	movl	%eax, %ecx
	shrl	$16, %ecx
	testb	$1, %cl
	je	LBB6_20
# %bb.19:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -29(%ebx,%esi)
LBB6_20:                                #   in Loop: Header=BB6_14 Depth=1
	shrl	$24, %eax
	testb	$1, %al
	je	LBB6_22
# %bb.21:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -28(%ebx,%esi)
LBB6_22:                                #   in Loop: Header=BB6_14 Depth=1
	pextrw	$2, %xmm2, %ecx
	testb	$1, %cl
	je	LBB6_24
# %bb.23:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -27(%ebx,%esi)
LBB6_24:                                #   in Loop: Header=BB6_14 Depth=1
	testb	$1, %ch
	je	LBB6_26
# %bb.25:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -26(%ebx,%esi)
LBB6_26:                                #   in Loop: Header=BB6_14 Depth=1
	pextrw	$3, %xmm2, %ecx
	testb	$1, %cl
	je	LBB6_28
# %bb.27:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -25(%ebx,%esi)
LBB6_28:                                #   in Loop: Header=BB6_14 Depth=1
	testb	$1, %ch
	je	LBB6_30
# %bb.29:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -24(%ebx,%esi)
LBB6_30:                                #   in Loop: Header=BB6_14 Depth=1
	pextrw	$4, %xmm2, %ecx
	testb	$1, %cl
	je	LBB6_32
# %bb.31:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -23(%ebx,%esi)
LBB6_32:                                #   in Loop: Header=BB6_14 Depth=1
	testb	$1, %ch
	je	LBB6_34
# %bb.33:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -22(%ebx,%esi)
LBB6_34:                                #   in Loop: Header=BB6_14 Depth=1
	movdqu	-15(%ebx,%esi), %xmm1
	pextrw	$5, %xmm2, %ecx
	testb	$1, %cl
	je	LBB6_36
# %bb.35:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -21(%ebx,%esi)
LBB6_36:                                #   in Loop: Header=BB6_14 Depth=1
	testb	$1, %ch
	je	LBB6_38
# %bb.37:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -20(%ebx,%esi)
LBB6_38:                                #   in Loop: Header=BB6_14 Depth=1
	pextrw	$6, %xmm2, %ecx
	testb	$1, %cl
	je	LBB6_40
# %bb.39:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -19(%ebx,%esi)
LBB6_40:                                #   in Loop: Header=BB6_14 Depth=1
	testb	$1, %ch
	je	LBB6_42
# %bb.41:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -18(%ebx,%esi)
LBB6_42:                                #   in Loop: Header=BB6_14 Depth=1
	pextrw	$7, %xmm2, %ecx
	testb	$1, %cl
	je	LBB6_44
# %bb.43:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -17(%ebx,%esi)
LBB6_44:                                #   in Loop: Header=BB6_14 Depth=1
	testb	$1, %ch
	je	LBB6_46
# %bb.45:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -16(%ebx,%esi)
LBB6_46:                                #   in Loop: Header=BB6_14 Depth=1
	pcmpeqb	%xmm0, %xmm1
	movd	%xmm1, %ecx
	testb	$1, %cl
	je	LBB6_48
# %bb.47:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -15(%ebx,%esi)
LBB6_48:                                #   in Loop: Header=BB6_14 Depth=1
	testb	$1, %ch
	je	LBB6_50
# %bb.49:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -14(%ebx,%esi)
LBB6_50:                                #   in Loop: Header=BB6_14 Depth=1
	movl	%ecx, %eax
	shrl	$16, %eax
	testb	$1, %al
	je	LBB6_52
# %bb.51:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -13(%ebx,%esi)
LBB6_52:                                #   in Loop: Header=BB6_14 Depth=1
	shrl	$24, %ecx
	testb	$1, %cl
	movl	(%esp), %eax                    # 4-byte Reload
	je	LBB6_54
# %bb.53:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -12(%ebx,%esi)
LBB6_54:                                #   in Loop: Header=BB6_14 Depth=1
	pextrw	$2, %xmm1, %ecx
	testb	$1, %cl
	je	LBB6_56
# %bb.55:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -11(%ebx,%esi)
LBB6_56:                                #   in Loop: Header=BB6_14 Depth=1
	testb	$1, %ch
	je	LBB6_58
# %bb.57:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -10(%ebx,%esi)
LBB6_58:                                #   in Loop: Header=BB6_14 Depth=1
	pextrw	$3, %xmm1, %ecx
	testb	$1, %cl
	je	LBB6_60
# %bb.59:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -9(%ebx,%esi)
LBB6_60:                                #   in Loop: Header=BB6_14 Depth=1
	testb	$1, %ch
	je	LBB6_62
# %bb.61:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -8(%ebx,%esi)
LBB6_62:                                #   in Loop: Header=BB6_14 Depth=1
	pextrw	$4, %xmm1, %ecx
	testb	$1, %cl
	je	LBB6_64
# %bb.63:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -7(%ebx,%esi)
LBB6_64:                                #   in Loop: Header=BB6_14 Depth=1
	testb	$1, %ch
	je	LBB6_66
# %bb.65:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -6(%ebx,%esi)
LBB6_66:                                #   in Loop: Header=BB6_14 Depth=1
	pextrw	$5, %xmm1, %ecx
	testb	$1, %cl
	je	LBB6_68
# %bb.67:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -5(%ebx,%esi)
LBB6_68:                                #   in Loop: Header=BB6_14 Depth=1
	testb	$1, %ch
	je	LBB6_70
# %bb.69:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -4(%ebx,%esi)
LBB6_70:                                #   in Loop: Header=BB6_14 Depth=1
	pextrw	$6, %xmm1, %ecx
	testb	$1, %cl
	je	LBB6_72
# %bb.71:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -3(%ebx,%esi)
LBB6_72:                                #   in Loop: Header=BB6_14 Depth=1
	testb	$1, %ch
	je	LBB6_74
# %bb.73:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -2(%ebx,%esi)
LBB6_74:                                #   in Loop: Header=BB6_14 Depth=1
	pextrw	$7, %xmm1, %ecx
	testb	$1, %cl
	je	LBB6_76
# %bb.75:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, -1(%ebx,%esi)
LBB6_76:                                #   in Loop: Header=BB6_14 Depth=1
	testb	$1, %ch
	je	LBB6_13
# %bb.77:                               #   in Loop: Header=BB6_14 Depth=1
	movb	$32, (%ebx,%esi)
	jmp	LBB6_13
LBB6_78:
	movl	$8197, %ebp                     # imm = 0x2005
LBB6_79:                                # %.loopexit
	movl	%ebp, %eax
	addl	$4, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB6_80:
	cmpl	%ebp, %eax
	je	LBB6_81
# %bb.82:
	testb	$24, %al
	je	LBB6_108
LBB6_83:
	movl	%eax, %ecx
	andl	$-8, %ecx
	movdqa	__xmm@00000000000000000000010100000000, %xmm2 # xmm2 = [u,u,u,u,1,1,u,u,u,u,u,u,u,u,u,u]
	movdqa	__xmm@00000000000000000101000000000000, %xmm3 # xmm3 = [u,u,u,u,u,u,1,1,u,u,u,u,u,u,u,u]
	movdqa	__xmm@00000000000001010000000000000000, %xmm4 # xmm4 = [u,u,u,u,u,u,u,u,1,1,u,u,u,u,u,u]
	movdqa	__xmm@00000000010100000000000000000000, %xmm5 # xmm5 = [u,u,u,u,u,u,u,u,u,u,1,1,u,u,u,u]
	movdqa	__xmm@00000101000000000000000000000000, %xmm6 # xmm6 = [u,u,u,u,u,u,u,u,u,u,u,u,1,1,u,u]
	movdqa	__xmm@01010000000000000000000000000000, %xmm7 # xmm7 = [u,u,u,u,u,u,u,u,u,u,u,u,u,u,1,1]
	movl	24(%esp), %esi
	jmp	LBB6_85
	.p2align	4
LBB6_84:                                #   in Loop: Header=BB6_85 Depth=1
	addl	$8, %ebp
	cmpl	%ebp, %ecx
	je	LBB6_101
LBB6_85:                                # =>This Inner Loop Header: Depth=1
	movq	-31(%ebx,%ebp), %xmm1           # xmm1 = mem[0],zero
	movdqa	%xmm1, %xmm0
	pcmpeqb	__xmm@00000001000000010000000100000001, %xmm0
	movd	%xmm0, %eax
	testb	$1, %al
	je	LBB6_87
# %bb.86:                               #   in Loop: Header=BB6_85 Depth=1
	movb	$32, -31(%ebx,%ebp)
LBB6_87:                                #   in Loop: Header=BB6_85 Depth=1
	movdqa	%xmm1, %xmm0
	pslld	$8, %xmm0
	pcmpeqb	__xmm@00000000000000000000000001010000, %xmm0
	movd	%xmm0, %eax
	shrl	$16, %eax
	testb	$1, %al
	je	LBB6_89
# %bb.88:                               #   in Loop: Header=BB6_85 Depth=1
	movb	$32, -30(%ebx,%ebp)
LBB6_89:                                #   in Loop: Header=BB6_85 Depth=1
	pshuflw	$85, %xmm1, %xmm0               # xmm0 = xmm1[1,1,1,1,4,5,6,7]
	pcmpeqb	%xmm2, %xmm0
	pextrw	$2, %xmm0, %eax
	testb	$1, %al
	je	LBB6_91
# %bb.90:                               #   in Loop: Header=BB6_85 Depth=1
	movb	$32, -29(%ebx,%ebp)
LBB6_91:                                #   in Loop: Header=BB6_85 Depth=1
	movdqa	%xmm1, %xmm0
	psllq	$24, %xmm0
	pcmpeqb	%xmm3, %xmm0
	pextrw	$3, %xmm0, %eax
	testb	$1, %al
	je	LBB6_93
# %bb.92:                               #   in Loop: Header=BB6_85 Depth=1
	movb	$32, -28(%ebx,%ebp)
LBB6_93:                                #   in Loop: Header=BB6_85 Depth=1
	pshufd	$85, %xmm1, %xmm0               # xmm0 = xmm1[1,1,1,1]
	pcmpeqb	%xmm4, %xmm0
	pextrw	$4, %xmm0, %eax
	testb	$1, %al
	je	LBB6_95
# %bb.94:                               #   in Loop: Header=BB6_85 Depth=1
	movb	$32, -27(%ebx,%ebp)
LBB6_95:                                #   in Loop: Header=BB6_85 Depth=1
	movdqa	%xmm1, %xmm0
	pslldq	$5, %xmm0                       # xmm0 = zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7,8,9,10]
	pcmpeqb	%xmm5, %xmm0
	pextrw	$5, %xmm0, %eax
	testb	$1, %al
	je	LBB6_97
# %bb.96:                               #   in Loop: Header=BB6_85 Depth=1
	movb	$32, -26(%ebx,%ebp)
LBB6_97:                                #   in Loop: Header=BB6_85 Depth=1
	movdqa	%xmm1, %xmm0
	pslldq	$6, %xmm0                       # xmm0 = zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7,8,9]
	pcmpeqb	%xmm6, %xmm0
	pextrw	$6, %xmm0, %eax
	testb	$1, %al
	je	LBB6_99
# %bb.98:                               #   in Loop: Header=BB6_85 Depth=1
	movb	$32, -25(%ebx,%ebp)
LBB6_99:                                #   in Loop: Header=BB6_85 Depth=1
	pslldq	$7, %xmm1                       # xmm1 = zero,zero,zero,zero,zero,zero,zero,xmm1[0,1,2,3,4,5,6,7,8]
	pcmpeqb	%xmm7, %xmm1
	pextrw	$7, %xmm1, %eax
	testb	$1, %al
	je	LBB6_84
# %bb.100:                              #   in Loop: Header=BB6_85 Depth=1
	movb	$32, -24(%ebx,%ebp)
	jmp	LBB6_84
LBB6_101:
	cmpl	%ecx, (%esp)                    # 4-byte Folded Reload
	jne	LBB6_103
LBB6_81:
	xorl	%ebp, %ebp
	jmp	LBB6_79
LBB6_103:
	addl	%ecx, %esi
LBB6_104:                               # %.preheader54
	subl	%edi, %esi
	xorl	%ebp, %ebp
	jmp	LBB6_106
	.p2align	4
LBB6_105:                               #   in Loop: Header=BB6_106 Depth=1
	incl	%esi
	cmpl	%esi, %edx
	je	LBB6_79
LBB6_106:                               # =>This Inner Loop Header: Depth=1
	cmpb	$1, (%esi)
	jne	LBB6_105
# %bb.107:                              #   in Loop: Header=BB6_106 Depth=1
	movb	$32, (%esi)
	jmp	LBB6_105
LBB6_108:
	movl	24(%esp), %esi
	addl	%ebp, %esi
	jmp	LBB6_104
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_status_string                  # @status_string
	.p2align	2, 0x0
_status_string:
	.long	0                               # 0x0

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
