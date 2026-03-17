	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"mnmfile.c"
	.def	_MnmFile_Open;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_MnmFile_Open                   # -- Begin function MnmFile_Open
	.p2align	4
_MnmFile_Open:                          # @MnmFile_Open
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	calll	_Comment_ClearNest
	pushl	$"??_C@_02BMJICGCB@rt?$AA@"
	pushl	%esi
	calll	_fopen
	addl	$8, %esp
	movl	%eax, _MnmFile_Open.fp
	popl	%esi
	retl
                                        # -- End function
	.def	_MnmFile_Close;
	.scl	2;
	.type	32;
	.endef
	.globl	_MnmFile_Close                  # -- Begin function MnmFile_Close
	.p2align	4
_MnmFile_Close:                         # @MnmFile_Close
# %bb.0:
	movl	4(%esp), %eax
	testl	%eax, %eax
	je	LBB1_2
# %bb.1:
	pushl	%eax
	calll	_fclose
	addl	$4, %esp
	movl	$2, _status_mnmfile
LBB1_2:
	retl
                                        # -- End function
	.def	_MnmFile_GetLine;
	.scl	2;
	.type	32;
	.endef
	.globl	_MnmFile_GetLine                # -- Begin function MnmFile_GetLine
	.p2align	4
_MnmFile_GetLine:                       # @MnmFile_GetLine
# %bb.0:
	movl	4(%esp), %eax
	testl	%eax, %eax
	je	LBB2_2
# %bb.1:
	pushl	%eax
	pushl	16(%esp)
	pushl	16(%esp)
	calll	_fgets
	addl	$12, %esp
	retl
LBB2_2:
	xorl	%eax, %eax
	retl
                                        # -- End function
	.def	_MnmFile_TrimLine_Stage1;
	.scl	2;
	.type	32;
	.endef
	.globl	_MnmFile_TrimLine_Stage1        # -- Begin function MnmFile_TrimLine_Stage1
	.p2align	4
_MnmFile_TrimLine_Stage1:               # @MnmFile_TrimLine_Stage1
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	cmpb	$59, (%esi)
	jne	LBB3_2
# %bb.1:
	movb	$0, (%esi)
LBB3_10:
	popl	%esi
	retl
LBB3_2:
	pushl	$10
	pushl	%esi
	calll	_strchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB3_4
# %bb.3:
	movb	$0, (%eax)
LBB3_4:
	pushl	%esi
	calll	_Comment_ProcessBracket
	addl	$4, %esp
	xorl	%eax, %eax
	movl	$8388627, %ecx                  # imm = 0x800013
	.p2align	4
LBB3_5:                                 # =>This Inner Loop Header: Depth=1
	movzbl	(%esi,%eax), %edx
	addl	$-9, %edx
	cmpl	$23, %edx
	ja	LBB3_8
# %bb.6:                                #   in Loop: Header=BB3_5 Depth=1
	btl	%edx, %ecx
	jae	LBB3_8
# %bb.7:                                #   in Loop: Header=BB3_5 Depth=1
	incl	%eax
	jmp	LBB3_5
LBB3_8:
	testl	%eax, %eax
	je	LBB3_10
# %bb.9:
	addl	%esi, %eax
	pushl	%eax
	pushl	%esi
	calll	_strcpy
	addl	$8, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_MnmFile_TrimLine_Stage2;
	.scl	2;
	.type	32;
	.endef
	.globl	_MnmFile_TrimLine_Stage2        # -- Begin function MnmFile_TrimLine_Stage2
	.p2align	4
_MnmFile_TrimLine_Stage2:               # @MnmFile_TrimLine_Stage2
# %bb.0:
	pushl	%ebx
	pushl	%esi
	pushl	%eax
	movl	16(%esp), %eax
	testl	%eax, %eax
	je	LBB4_13
# %bb.1:                                # %.preheader.preheader
	movl	$0, (%esp)                      # 4-byte Folded Spill
	movl	%eax, %ecx
	xorl	%ebx, %ebx
	.p2align	4
LBB4_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%eax), %edx
	movl	%edx, %esi
	addl	$-2, %esi
	cmpl	$30, %esi
	ja	LBB4_11
# %bb.3:                                # %.preheader
                                        #   in Loop: Header=BB4_2 Depth=1
	jmpl	*LJTI4_0(,%esi,4)
LBB4_4:                                 #   in Loop: Header=BB4_2 Depth=1
	testb	%bl, %bl
	je	LBB4_7
LBB4_6:                                 #   in Loop: Header=BB4_2 Depth=1
	movb	$1, %bl
	jmp	LBB4_11
LBB4_7:                                 #   in Loop: Header=BB4_2 Depth=1
	movb	$1, %bl
	cmpb	$0, (%esp)                      # 1-byte Folded Reload
	je	LBB4_9
# %bb.8:                                #   in Loop: Header=BB4_2 Depth=1
                                        # kill: def $bl killed $bl def $ebx
	movl	%ebx, (%esp)                    # 4-byte Spill
	xorl	%ebx, %ebx
	jmp	LBB4_12
LBB4_9:                                 #   in Loop: Header=BB4_2 Depth=1
	movb	$32, %dl
	movb	$1, %bl
	movl	%ebx, (%esp)                    # 4-byte Spill
LBB4_10:                                #   in Loop: Header=BB4_2 Depth=1
	xorl	%ebx, %ebx
LBB4_11:                                #   in Loop: Header=BB4_2 Depth=1
	movb	%dl, (%ecx)
	incl	%ecx
	movzbl	(%eax), %edx
LBB4_12:                                #   in Loop: Header=BB4_2 Depth=1
	incl	%eax
	testb	%dl, %dl
	jne	LBB4_2
LBB4_13:                                # %.loopexit
	addl	$4, %esp
	popl	%esi
	popl	%ebx
	retl
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI4_0:
	.long	LBB4_6
	.long	LBB4_10
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_4
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_11
	.long	LBB4_4
                                        # -- End function
	.def	_MnmFile_TrimLine_Stage3;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_MnmFile_TrimLine_Stage3        # -- Begin function MnmFile_TrimLine_Stage3
	.p2align	4
_MnmFile_TrimLine_Stage3:               # @MnmFile_TrimLine_Stage3
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	16(%esp), %eax
	testl	%eax, %eax
	je	LBB5_10
# %bb.1:                                # %.preheader.preheader
	xorl	%ebx, %ebx
	movl	%eax, %esi
	jmp	LBB5_2
	.p2align	4
LBB5_4:                                 #   in Loop: Header=BB5_2 Depth=1
	xorl	%ecx, %ecx
LBB5_8:                                 #   in Loop: Header=BB5_2 Depth=1
	movb	%dl, (%esi)
	incl	%esi
	movzbl	(%eax), %edx
LBB5_9:                                 #   in Loop: Header=BB5_2 Depth=1
	incl	%eax
	movl	%ecx, %ebx
	testb	%dl, %dl
	je	LBB5_10
LBB5_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%eax), %edx
	movl	%edx, %edi
	addl	$-2, %edi
	cmpl	$30, %edi
	ja	LBB5_7
# %bb.3:                                # %.preheader
                                        #   in Loop: Header=BB5_2 Depth=1
	movb	$1, %cl
	jmpl	*LJTI5_0(,%edi,4)
LBB5_5:                                 #   in Loop: Header=BB5_2 Depth=1
	testb	%bl, %bl
	jne	LBB5_8
# %bb.6:                                #   in Loop: Header=BB5_2 Depth=1
	xorl	%ecx, %ecx
	jmp	LBB5_9
LBB5_7:                                 #   in Loop: Header=BB5_2 Depth=1
	movl	%ebx, %ecx
	jmp	LBB5_8
LBB5_10:                                # %.loopexit
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI5_0:
	.long	LBB5_8
	.long	LBB5_4
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_5
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_7
	.long	LBB5_5
                                        # -- End function
	.def	_MnmFile_PargeLine;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_MnmFile_PargeLine              # -- Begin function MnmFile_PargeLine
	.p2align	4
_MnmFile_PargeLine:                     # @MnmFile_PargeLine
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	36(%esp), %esi
	movl	32(%esp), %edi
	movl	28(%esp), %ebx
	movl	24(%esp), %ebp
	pushl	$"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@"
	pushl	24(%esp)
	calll	_strtok
	addl	$8, %esp
	movl	%eax, (%ebp)
	pushl	$"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	movl	%eax, (%ebx)
	pushl	$"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	movl	%eax, (%edi)
	pushl	$"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	movl	%eax, (%esi)
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_MnmFile_PargeCamma;
	.scl	2;
	.type	32;
	.endef
	.globl	_MnmFile_PargeCamma             # -- Begin function MnmFile_PargeCamma
	.p2align	4
_MnmFile_PargeCamma:                    # @MnmFile_PargeCamma
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	32(%esp), %edi
	movl	28(%esp), %ebx
	movl	24(%esp), %esi
	pushl	$"??_C@_01IHBHIGKO@?0?$AA@"
	pushl	24(%esp)
	calll	_strtok
	addl	$8, %esp
	movl	%eax, (%esi)
	pushl	$"??_C@_01IHBHIGKO@?0?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	movl	%eax, (%ebx)
	pushl	$"??_C@_01IHBHIGKO@?0?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	movl	%eax, (%edi)
	pushl	(%esi)
	calll	_String_Packing
	addl	$4, %esp
	movl	(%esi), %eax
	xorl	%ebp, %ebp
	movl	$0, %ecx
	testl	%eax, %eax
	je	LBB7_12
# %bb.1:                                # %.preheader4.preheader
	xorl	%ebx, %ebx
	movl	%eax, %edi
	jmp	LBB7_2
	.p2align	4
LBB7_5:                                 #   in Loop: Header=BB7_2 Depth=1
	xorl	%ebx, %ebx
LBB7_9:                                 #   in Loop: Header=BB7_2 Depth=1
	movb	%cl, (%edi)
	incl	%edi
	movzbl	(%eax), %ecx
LBB7_10:                                #   in Loop: Header=BB7_2 Depth=1
	incl	%eax
                                        # kill: def $bl killed $bl killed $ebx def $ebx
	testb	%cl, %cl
	je	LBB7_11
LBB7_2:                                 # %.preheader4
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%eax), %ecx
	movl	%ecx, %edx
	addl	$-2, %edx
	cmpl	$30, %edx
	ja	LBB7_8
# %bb.3:                                # %.preheader4
                                        #   in Loop: Header=BB7_2 Depth=1
	jmpl	*LJTI7_0(,%edx,4)
LBB7_6:                                 #   in Loop: Header=BB7_2 Depth=1
	testb	%bl, %bl
	movb	$1, %bl
	jne	LBB7_9
# %bb.7:                                #   in Loop: Header=BB7_2 Depth=1
	xorl	%ebx, %ebx
	jmp	LBB7_10
	.p2align	4
LBB7_4:                                 #   in Loop: Header=BB7_2 Depth=1
	movb	$1, %bl
	jmp	LBB7_9
LBB7_8:                                 #   in Loop: Header=BB7_2 Depth=1
                                        # kill: def $bl killed $bl killed $ebx def $ebx
	jmp	LBB7_9
LBB7_11:
	movl	(%esi), %ecx
	movl	28(%esp), %ebx
LBB7_12:
	pushl	%ecx
	calll	_String_Unpacking
	addl	$4, %esp
	pushl	(%ebx)
	calll	_String_Packing
	addl	$4, %esp
	movl	(%ebx), %eax
	testl	%eax, %eax
	je	LBB7_23
# %bb.13:                               # %.preheader3.preheader
	movl	%ebx, %ebp
	xorl	%ebx, %ebx
	movl	%eax, %esi
	jmp	LBB7_14
	.p2align	4
LBB7_16:                                #   in Loop: Header=BB7_14 Depth=1
	xorl	%ecx, %ecx
LBB7_20:                                #   in Loop: Header=BB7_14 Depth=1
	movb	%dl, (%esi)
	incl	%esi
	movzbl	(%eax), %edx
LBB7_21:                                #   in Loop: Header=BB7_14 Depth=1
	incl	%eax
	movl	%ecx, %ebx
	testb	%dl, %dl
	je	LBB7_22
LBB7_14:                                # %.preheader3
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%eax), %edx
	movl	%edx, %edi
	addl	$-2, %edi
	cmpl	$30, %edi
	ja	LBB7_19
# %bb.15:                               # %.preheader3
                                        #   in Loop: Header=BB7_14 Depth=1
	movb	$1, %cl
	jmpl	*LJTI7_1(,%edi,4)
LBB7_17:                                #   in Loop: Header=BB7_14 Depth=1
	testb	%bl, %bl
	jne	LBB7_20
# %bb.18:                               #   in Loop: Header=BB7_14 Depth=1
	xorl	%ecx, %ecx
	jmp	LBB7_21
LBB7_19:                                #   in Loop: Header=BB7_14 Depth=1
	movl	%ebx, %ecx
	jmp	LBB7_20
LBB7_22:
	movl	(%ebp), %ebp
LBB7_23:
	pushl	%ebp
	calll	_String_Unpacking
	addl	$4, %esp
	movl	32(%esp), %ebp
	pushl	(%ebp)
	calll	_String_Packing
	addl	$4, %esp
	movl	(%ebp), %eax
	testl	%eax, %eax
	je	LBB7_24
# %bb.25:                               # %.preheader.preheader
	xorl	%ebx, %ebx
	movl	%eax, %esi
	jmp	LBB7_26
	.p2align	4
LBB7_28:                                #   in Loop: Header=BB7_26 Depth=1
	xorl	%ecx, %ecx
LBB7_32:                                #   in Loop: Header=BB7_26 Depth=1
	movb	%dl, (%esi)
	incl	%esi
	movzbl	(%eax), %edx
LBB7_33:                                #   in Loop: Header=BB7_26 Depth=1
	incl	%eax
	movl	%ecx, %ebx
	testb	%dl, %dl
	je	LBB7_34
LBB7_26:                                # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%eax), %edx
	movl	%edx, %edi
	addl	$-2, %edi
	cmpl	$30, %edi
	ja	LBB7_31
# %bb.27:                               # %.preheader
                                        #   in Loop: Header=BB7_26 Depth=1
	movb	$1, %cl
	jmpl	*LJTI7_2(,%edi,4)
LBB7_29:                                #   in Loop: Header=BB7_26 Depth=1
	testb	%bl, %bl
	jne	LBB7_32
# %bb.30:                               #   in Loop: Header=BB7_26 Depth=1
	xorl	%ecx, %ecx
	jmp	LBB7_33
LBB7_31:                                #   in Loop: Header=BB7_26 Depth=1
	movl	%ebx, %ecx
	jmp	LBB7_32
LBB7_34:
	movl	(%ebp), %eax
	jmp	LBB7_35
LBB7_24:
	xorl	%eax, %eax
LBB7_35:
	pushl	%eax
	calll	_String_Unpacking
	addl	$4, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI7_0:
	.long	LBB7_4
	.long	LBB7_5
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_6
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_8
	.long	LBB7_6
LJTI7_1:
	.long	LBB7_20
	.long	LBB7_16
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_17
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_19
	.long	LBB7_17
LJTI7_2:
	.long	LBB7_32
	.long	LBB7_28
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_29
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_31
	.long	LBB7_29
                                        # -- End function
	.def	_MnmFile_PargeArgument;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_MnmFile_PargeArgument          # -- Begin function MnmFile_PargeArgument
	.p2align	4
_MnmFile_PargeArgument:                 # @MnmFile_PargeArgument
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$8, %esp
	movl	28(%esp), %ebp
	movzwl	32(%esp), %edx
	movw	$4, %ax
	cmpl	$781, %edx                      # imm = 0x30D
	jle	LBB8_3
# %bb.1:
	cmpl	$32768, %edx                    # imm = 0x8000
	jle	LBB8_9
# %bb.2:
	addl	$-32769, %edx                   # imm = 0xFFFF7FFF
	cmpl	$9, %edx
	jb	LBB8_12
	jmp	LBB8_30
LBB8_3:
	cmpl	$259, %edx                      # imm = 0x103
	jle	LBB8_6
# %bb.4:
	leal	-260(%edx), %ecx
	cmpl	$4, %ecx
	jb	LBB8_12
# %bb.5:
	addl	$-512, %edx                     # imm = 0xFE00
	cmpl	$4, %edx
	jb	LBB8_12
	jmp	LBB8_30
LBB8_6:
	leal	-16(%edx), %ecx
	cmpl	$4, %ecx
	jb	LBB8_12
# %bb.7:
	testl	%edx, %edx
	jne	LBB8_30
# %bb.8:
	xorl	%eax, %eax
	testl	%ebp, %ebp
	setne	%al
	shll	$2, %eax
	jmp	LBB8_30
LBB8_9:
	leal	-782(%edx), %ecx
	cmpl	$2, %ecx
	jb	LBB8_12
# %bb.10:
	leal	-1346(%edx), %ecx
	cmpl	$2, %ecx
	jb	LBB8_12
# %bb.11:
	cmpl	$1536, %edx                     # imm = 0x600
	jne	LBB8_30
LBB8_12:
	leal	5(%esp), %eax
	pushl	%ebp
	pushl	%eax
	calll	_Bitfield_Check
	addl	$8, %esp
	movzbl	5(%esp), %ebx
	movzwl	6(%esp), %edi
	testl	%ebp, %ebp
	je	LBB8_18
# %bb.13:
	pushl	%ebp
	calll	_strdup
	addl	$4, %esp
	testl	%eax, %eax
	je	LBB8_29
# %bb.14:
	movl	%eax, %esi
	movw	%di, 2(%esp)                    # 2-byte Spill
	testb	%bl, %bl
	je	LBB8_17
# %bb.15:
	pushl	$46
	pushl	%esi
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB8_17
# %bb.16:
	movb	$0, (%eax)
LBB8_17:
	pushl	%esi
	calll	_Scope_variable
	addl	$4, %esp
	movl	%eax, %edi
	jmp	LBB8_19
LBB8_18:
	movw	%di, 2(%esp)                    # 2-byte Spill
	xorl	%esi, %esi
	xorl	%edi, %edi
LBB8_19:
	pushl	%edi
	calll	_Variable_Search
	addl	$4, %esp
	testl	%eax, %eax
	jne	LBB8_23
# %bb.20:
	pushl	%edi
	calll	_Literal_Compile
	addl	$4, %esp
	testl	%eax, %eax
	jne	LBB8_23
# %bb.21:
	pushl	%edi
	calll	_Structure_Compile
	addl	$4, %esp
	testl	%eax, %eax
	jne	LBB8_23
# %bb.22:
	pushl	%edi
	calll	_Rtedge_Compile
	addl	$4, %esp
	testl	%eax, %eax
	je	LBB8_31
LBB8_23:
	movl	%ebp, %edi
	movl	36(%esp), %ecx
	testb	%bl, %bl
	je	LBB8_26
# %bb.24:
	movl	%eax, %ebp
	pushl	%edi
	calll	_Variable_Search
	movl	40(%esp), %ecx
	addl	$4, %esp
	testl	%eax, %eax
	jne	LBB8_26
# %bb.25:
	pushl	$1536                           # imm = 0x600
	pushl	%edi
	calll	_Variable_Add
	addl	$8, %esp
	movsd	(%ebp), %xmm0                   # xmm0 = mem[0],zero
	movsd	%xmm0, (%eax)
	movl	8(%ebp), %ecx
	movl	%ecx, 8(%eax)
	movb	%bl, 12(%eax)
	movzwl	2(%esp), %ecx                   # 2-byte Folded Reload
	movw	%cx, 13(%eax)
	movl	36(%esp), %ecx
LBB8_26:
	movl	%eax, (%ecx)
	testl	%edi, %edi
	je	LBB8_28
# %bb.27:
	pushl	%esi
	calll	_free
	addl	$4, %esp
LBB8_28:
	xorl	%eax, %eax
	jmp	LBB8_30
LBB8_31:
	testl	%ebp, %ebp
	je	LBB8_29
# %bb.32:
	pushl	%esi
	calll	_free
	addl	$4, %esp
LBB8_29:
	movw	$4, %ax
LBB8_30:
                                        # kill: def $ax killed $ax killed $eax
	addl	$8, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_MnmFile_Base;
	.scl	2;
	.type	32;
	.endef
	.globl	_MnmFile_Base                   # -- Begin function MnmFile_Base
	.p2align	4
_MnmFile_Base:                          # @MnmFile_Base
# %bb.0:
	pushl	%esi
	pushl	$128
	pushl	12(%esp)
	pushl	$_MnmFile_Base.Label
	calll	_strncpy
	addl	$12, %esp
	pushl	$46
	pushl	$_MnmFile_Base.Label
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB9_2
# %bb.1:
	movb	$0, (%eax)
LBB9_2:
	pushl	$92
	pushl	$_MnmFile_Base.Label
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB9_4
# %bb.3:
	incl	%eax
	popl	%esi
	retl
LBB9_4:
	movl	$_MnmFile_Base.Label, %esi
	pushl	$47
	pushl	$_MnmFile_Base.Label
	calll	_strrchr
	addl	$8, %esp
	movl	%eax, %ecx
	incl	%eax
	testl	%ecx, %ecx
	cmovel	%esi, %eax
	popl	%esi
	retl
                                        # -- End function
	.def	_MnmFile_Load;
	.scl	2;
	.type	32;
	.endef
	.globl	_MnmFile_Load                   # -- Begin function MnmFile_Load
	.p2align	4
_MnmFile_Load:                          # @MnmFile_Load
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$176, %esp
	movl	196(%esp), %esi
	calll	_Comment_ClearNest
	pushl	$"??_C@_02BMJICGCB@rt?$AA@"
	pushl	%esi
	calll	_fopen
	addl	$8, %esp
	movl	%eax, _MnmFile_Open.fp
	testl	%eax, %eax
	je	LBB10_5
# %bb.1:
	movl	%eax, %ebp
	pushl	$"??_C@_05EILEDKCG@LABEL?$AA@"
	calll	_Instruction_GetTemplate
	addl	$4, %esp
	pushl	$0
	pushl	$0
	pushl	$0
	pushl	%eax
	calll	_Logic_Add
	addl	$16, %esp
	movl	%eax, %edi
	pushl	$128
	pushl	%esi
	pushl	$_MnmFile_Base.Label
	calll	_strncpy
	addl	$12, %esp
	pushl	$46
	pushl	$_MnmFile_Base.Label
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB10_3
# %bb.2:
	movb	$0, (%eax)
LBB10_3:
	pushl	$92
	pushl	$_MnmFile_Base.Label
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB10_6
# %bb.4:
	incl	%eax
	jmp	LBB10_7
LBB10_5:
	pushl	%esi
	pushl	$32
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	movl	$1, %esi
	jmp	LBB10_74
LBB10_6:
	movl	$_MnmFile_Base.Label, %esi
	pushl	$47
	pushl	$_MnmFile_Base.Label
	calll	_strrchr
	addl	$8, %esp
	movl	%eax, %ecx
	incl	%eax
	testl	%ecx, %ecx
	cmovel	%esi, %eax
LBB10_7:
	pushl	%edi
	pushl	$1
	pushl	%eax
	calll	_Label_Add
	addl	$12, %esp
	movl	%eax, 12(%esp)                  # 4-byte Spill
	leal	48(%esp), %ebx
	pushl	%ebp
	pushl	$128
	pushl	%ebx
	calll	_fgets
	addl	$12, %esp
	movb	$1, %cl
	movl	%ecx, 20(%esp)                  # 4-byte Spill
	testl	%eax, %eax
	je	LBB10_67
# %bb.8:                                # %.preheader.preheader
	movl	$0, (%esp)                      # 4-byte Folded Spill
	movl	$8388627, %esi                  # imm = 0x800013
	xorl	%edi, %edi
	movl	%ebp, 4(%esp)                   # 4-byte Spill
	jmp	LBB10_11
	.p2align	4
LBB10_9:                                #   in Loop: Header=BB10_11 Depth=1
	movb	$0, 48(%esp)
LBB10_10:                               #   in Loop: Header=BB10_11 Depth=1
	pushl	%ebp
	pushl	$128
	pushl	%ebx
	calll	_fgets
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB10_65
LBB10_11:                               # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB10_15 Depth 2
                                        #     Child Loop BB10_22 Depth 2
	incl	%edi
	cmpb	$59, 48(%esp)
	je	LBB10_9
# %bb.12:                               #   in Loop: Header=BB10_11 Depth=1
	pushl	$10
	pushl	%ebx
	calll	_strchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB10_14
# %bb.13:                               #   in Loop: Header=BB10_11 Depth=1
	movb	$0, (%eax)
LBB10_14:                               #   in Loop: Header=BB10_11 Depth=1
	pushl	%ebx
	calll	_Comment_ProcessBracket
	addl	$4, %esp
	xorl	%eax, %eax
	.p2align	4
LBB10_15:                               #   Parent Loop BB10_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	48(%esp,%eax), %ecx
	addl	$-9, %ecx
	cmpl	$23, %ecx
	ja	LBB10_18
# %bb.16:                               #   in Loop: Header=BB10_15 Depth=2
	btl	%ecx, %esi
	jae	LBB10_18
# %bb.17:                               #   in Loop: Header=BB10_15 Depth=2
	incl	%eax
	jmp	LBB10_15
	.p2align	4
LBB10_18:                               #   in Loop: Header=BB10_11 Depth=1
	testl	%eax, %eax
	je	LBB10_20
# %bb.19:                               #   in Loop: Header=BB10_11 Depth=1
	addl	%esp, %eax
	addl	$48, %eax
	pushl	%eax
	pushl	%ebx
	calll	_strcpy
	addl	$8, %esp
LBB10_20:                               #   in Loop: Header=BB10_11 Depth=1
	cmpb	$0, 48(%esp)
	je	LBB10_10
# %bb.21:                               #   in Loop: Header=BB10_11 Depth=1
	pushl	%ebx
	calll	_String_Packing
	addl	$4, %esp
	movl	$0, 8(%esp)                     # 4-byte Folded Spill
	movl	%ebx, %eax
	movl	%ebx, %ecx
	xorl	%ebx, %ebx
	.p2align	4
LBB10_22:                               #   Parent Loop BB10_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	(%eax), %edx
	movl	%edx, %ebp
	addl	$-2, %ebp
	cmpl	$30, %ebp
	ja	LBB10_31
# %bb.23:                               #   in Loop: Header=BB10_22 Depth=2
	jmpl	*LJTI10_0(,%ebp,4)
LBB10_24:                               #   in Loop: Header=BB10_22 Depth=2
	testb	%bl, %bl
	je	LBB10_27
LBB10_26:                               #   in Loop: Header=BB10_22 Depth=2
	movb	$1, %bl
	jmp	LBB10_31
LBB10_27:                               #   in Loop: Header=BB10_22 Depth=2
	movb	$1, %bl
	cmpb	$0, 8(%esp)                     # 1-byte Folded Reload
	je	LBB10_29
# %bb.28:                               #   in Loop: Header=BB10_22 Depth=2
                                        # kill: def $bl killed $bl def $ebx
	movl	%ebx, 8(%esp)                   # 4-byte Spill
	xorl	%ebx, %ebx
	jmp	LBB10_32
LBB10_29:                               #   in Loop: Header=BB10_22 Depth=2
	movb	$32, %dl
	movb	$1, %bl
	movl	%ebx, 8(%esp)                   # 4-byte Spill
LBB10_30:                               #   in Loop: Header=BB10_22 Depth=2
	xorl	%ebx, %ebx
LBB10_31:                               #   in Loop: Header=BB10_22 Depth=2
	movb	%dl, (%ecx)
	incl	%ecx
	movzbl	(%eax), %edx
LBB10_32:                               #   in Loop: Header=BB10_22 Depth=2
	incl	%eax
	testb	%dl, %dl
	jne	LBB10_22
# %bb.33:                               #   in Loop: Header=BB10_11 Depth=1
	pushl	$"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@"
	leal	52(%esp), %eax
	pushl	%eax
	calll	_strtok
	addl	$8, %esp
	movl	%eax, %ebx
	pushl	$"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	movl	%eax, %ebp
	pushl	$"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	pushl	$"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	pushl	%ebp
	calll	_String_Unpacking
	addl	$4, %esp
	testl	%ebx, %ebx
	je	LBB10_46
# %bb.34:                               #   in Loop: Header=BB10_11 Depth=1
	pushl	%ebx
	calll	_Instruction_GetTemplate
	addl	$4, %esp
	testl	%eax, %eax
	je	LBB10_37
# %bb.35:                               #   in Loop: Header=BB10_11 Depth=1
	cmpb	$0, 6(%eax)
	je	LBB10_38
# %bb.36:                               #   in Loop: Header=BB10_11 Depth=1
	pushl	$0
	pushl	$0
	pushl	%ebx
	pushl	%ebp
	calll	*13(%eax)
	addl	$16, %esp
	jmp	LBB10_46
LBB10_37:                               #   in Loop: Header=BB10_11 Depth=1
	movl	12(%esp), %eax                  # 4-byte Reload
	pushl	(%eax)
	pushl	$128
	pushl	%edi
	calll	_Errorlog_Add
	addl	$12, %esp
	incl	(%esp)                          # 4-byte Folded Spill
	jmp	LBB10_46
LBB10_38:                               #   in Loop: Header=BB10_11 Depth=1
	movl	%eax, 8(%esp)                   # 4-byte Spill
	leal	36(%esp), %eax
	pushl	%eax
	leal	44(%esp), %eax
	pushl	%eax
	leal	52(%esp), %eax
	pushl	%eax
	pushl	%ebp
	calll	_MnmFile_PargeCamma
	addl	$16, %esp
	movl	44(%esp), %ebp
	pushl	%ebp
	calll	_Reservedword_Check
	addl	$4, %esp
	testb	%al, %al
	je	LBB10_40
# %bb.39:                               #   in Loop: Header=BB10_11 Depth=1
	movl	12(%esp), %ebx                  # 4-byte Reload
	pushl	(%ebx)
	pushl	$4
	jmp	LBB10_44
LBB10_40:                               #   in Loop: Header=BB10_11 Depth=1
	movl	40(%esp), %ebx
	pushl	%ebx
	calll	_Reservedword_Check
	addl	$4, %esp
	testb	%al, %al
	je	LBB10_42
# %bb.41:                               #   in Loop: Header=BB10_11 Depth=1
	movl	12(%esp), %ebx                  # 4-byte Reload
	pushl	(%ebx)
	pushl	$5
	jmp	LBB10_44
LBB10_42:                               #   in Loop: Header=BB10_11 Depth=1
	movl	36(%esp), %eax
	movl	%eax, 32(%esp)                  # 4-byte Spill
	pushl	%eax
	calll	_Reservedword_Check
	addl	$4, %esp
	testb	%al, %al
	je	LBB10_48
# %bb.43:                               #   in Loop: Header=BB10_11 Depth=1
	movl	12(%esp), %ebx                  # 4-byte Reload
	pushl	(%ebx)
	pushl	$6
LBB10_44:                               #   in Loop: Header=BB10_11 Depth=1
	pushl	%edi
	calll	_Errorlog_Add
	addl	$12, %esp
	pushl	(%ebx)
	pushl	$129
LBB10_45:                               #   in Loop: Header=BB10_11 Depth=1
	pushl	%edi
	calll	_Errorlog_Add
	addl	$12, %esp
	addl	$2, (%esp)                      # 4-byte Folded Spill
	.p2align	4
LBB10_46:                               #   in Loop: Header=BB10_11 Depth=1
	movl	4(%esp), %ebp                   # 4-byte Reload
LBB10_47:                               #   in Loop: Header=BB10_11 Depth=1
	leal	48(%esp), %ebx
	jmp	LBB10_10
LBB10_48:                               #   in Loop: Header=BB10_11 Depth=1
	movl	$_VARIANT_EMPTY, 28(%esp)
	movl	$_VARIANT_EMPTY, 16(%esp)
	movl	$_VARIANT_EMPTY, 24(%esp)
	testl	%ebp, %ebp
	je	LBB10_51
# %bb.49:                               #   in Loop: Header=BB10_11 Depth=1
	movl	8(%esp), %eax                   # 4-byte Reload
	movzwl	7(%eax), %eax
	leal	28(%esp), %ecx
	pushl	%ecx
	pushl	%eax
	pushl	%ebp
	calll	_MnmFile_PargeArgument
	addl	$12, %esp
	testw	%ax, %ax
	je	LBB10_51
# %bb.50:                               #   in Loop: Header=BB10_11 Depth=1
	movzwl	%ax, %ebx
	movl	12(%esp), %ebp                  # 4-byte Reload
	pushl	(%ebp)
	pushl	$4
	jmp	LBB10_57
LBB10_51:                               #   in Loop: Header=BB10_11 Depth=1
	testl	%ebx, %ebx
	je	LBB10_54
# %bb.52:                               #   in Loop: Header=BB10_11 Depth=1
	movl	8(%esp), %eax                   # 4-byte Reload
	movzwl	9(%eax), %eax
	leal	16(%esp), %ecx
	pushl	%ecx
	pushl	%eax
	pushl	%ebx
	calll	_MnmFile_PargeArgument
	addl	$12, %esp
	testw	%ax, %ax
	je	LBB10_54
# %bb.53:                               #   in Loop: Header=BB10_11 Depth=1
	movzwl	%ax, %ebx
	movl	12(%esp), %ebp                  # 4-byte Reload
	pushl	(%ebp)
	pushl	$5
	jmp	LBB10_57
LBB10_54:                               #   in Loop: Header=BB10_11 Depth=1
	movl	32(%esp), %edx                  # 4-byte Reload
	testl	%edx, %edx
	je	LBB10_58
# %bb.55:                               #   in Loop: Header=BB10_11 Depth=1
	movl	8(%esp), %eax                   # 4-byte Reload
	movzwl	11(%eax), %eax
	leal	24(%esp), %ecx
	pushl	%ecx
	pushl	%eax
	pushl	%edx
	calll	_MnmFile_PargeArgument
	addl	$12, %esp
	testw	%ax, %ax
	je	LBB10_58
# %bb.56:                               #   in Loop: Header=BB10_11 Depth=1
	movzwl	%ax, %ebx
	movl	12(%esp), %ebp                  # 4-byte Reload
	pushl	(%ebp)
	pushl	$6
LBB10_57:                               #   in Loop: Header=BB10_11 Depth=1
	pushl	%edi
	calll	_Errorlog_Add
	addl	$12, %esp
	pushl	(%ebp)
	pushl	%ebx
	jmp	LBB10_45
LBB10_58:                               #   in Loop: Header=BB10_11 Depth=1
	movl	8(%esp), %ecx                   # 4-byte Reload
	cmpw	$32, 4(%ecx)
	jne	LBB10_61
# %bb.59:                               #   in Loop: Header=BB10_11 Depth=1
	pushl	%ebp
	calll	_Rtedge_GetStructureName
	addl	$4, %esp
	pushl	%eax
	calll	_Variable_Search
	addl	$4, %esp
	movl	8(%esp), %ecx                   # 4-byte Reload
	movl	%eax, 16(%esp)
	testl	%eax, %eax
	jne	LBB10_62
# %bb.60:                               #   in Loop: Header=BB10_11 Depth=1
	movl	12(%esp), %eax                  # 4-byte Reload
	pushl	(%eax)
	pushl	$8195                           # imm = 0x2003
	pushl	%edi
	calll	_Errorlog_Add
	movl	20(%esp), %ecx                  # 4-byte Reload
	addl	$12, %esp
	movl	$__Variable_Zero_FUNCTION, 16(%esp)
	movl	$__Variable_Zero_FUNCTION, %eax
	jmp	LBB10_62
LBB10_61:                               #   in Loop: Header=BB10_11 Depth=1
	movl	16(%esp), %eax
LBB10_62:                               #   in Loop: Header=BB10_11 Depth=1
	pushl	24(%esp)
	pushl	%eax
	pushl	36(%esp)
	pushl	%ecx
	movl	%ecx, %ebx
	calll	_Logic_Add
	addl	$16, %esp
	movzwl	4(%ebx), %eax
	cmpl	$39, %eax
	movl	4(%esp), %ebp                   # 4-byte Reload
	je	LBB10_75
# %bb.63:                               #   in Loop: Header=BB10_11 Depth=1
	cmpl	$35, %eax
	jne	LBB10_47
# %bb.64:                               # %.loopexit.loopexit
	movb	$1, %bl
	movl	$0, 20(%esp)                    # 4-byte Folded Spill
	jmp	LBB10_66
LBB10_65:
	movb	$1, %bl
LBB10_66:                               # %.loopexit
	movl	(%esp), %esi                    # 4-byte Reload
	jmp	LBB10_68
LBB10_67:
	xorl	%esi, %esi
	movb	$1, %bl
LBB10_68:                               # %.loopexit
	pushl	%ebp
	calll	_fclose
	addl	$4, %esp
	movl	$2, _status_mnmfile
	calll	_Scope_get
	cmpb	$0, (%eax)
	je	LBB10_71
# %bb.69:
	cmpb	$0, 20(%esp)                    # 1-byte Folded Reload
	je	LBB10_74
# %bb.70:
	pushl	$"??_C@_03BHDJDALB@RET?$AA@"
	jmp	LBB10_73
LBB10_71:
	testb	%bl, %bl
	je	LBB10_74
# %bb.72:
	pushl	$"??_C@_03JMGAKCCH@END?$AA@"
LBB10_73:
	calll	_Instruction_GetTemplate
	addl	$4, %esp
	pushl	$_VARIANT_EMPTY
	pushl	$_VARIANT_EMPTY
	pushl	$_VARIANT_EMPTY
	pushl	%eax
	calll	_Logic_Add
	addl	$16, %esp
LBB10_74:
	movl	%esi, %eax
	addl	$176, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB10_75:
	xorl	%ebx, %ebx
	movb	$1, %al
	movl	%eax, 20(%esp)                  # 4-byte Spill
	jmp	LBB10_66
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI10_0:
	.long	LBB10_26
	.long	LBB10_30
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_24
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_31
	.long	LBB10_24
                                        # -- End function
	.def	_MnmFile_BitArgument;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_MnmFile_BitArgument            # -- Begin function MnmFile_BitArgument
	.p2align	4
_MnmFile_BitArgument:                   # @MnmFile_BitArgument
# %bb.0:
	pushl	%edi
	pushl	%esi
	pushl	%eax
	movl	16(%esp), %eax
	testl	%eax, %eax
	je	LBB11_1
# %bb.2:
	movl	$-1, (%esp)
	pushl	$46
	pushl	%eax
	calll	_strrchr
	addl	$8, %esp
	movl	$-1, %esi
	testl	%eax, %eax
	je	LBB11_5
# %bb.3:
	movl	%eax, %edi
	movl	%esp, %eax
	pushl	%eax
	pushl	$"??_C@_04HGICJEGC@?4X?$CFd?$AA@"
	pushl	%edi
	calll	_sscanf
	addl	$12, %esp
	cmpl	$1, %eax
	sete	%cl
	movl	(%esp), %eax
	cmpl	$64, %eax
	setb	%dl
	andb	%cl, %dl
	cmpb	$1, %dl
	jne	LBB11_5
# %bb.4:
	movb	$0, (%edi)
	movl	%eax, %esi
	jmp	LBB11_5
LBB11_1:
	movl	$-1, %esi
LBB11_5:
	movl	%esi, %eax
	addl	$4, %esp
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_status_mnmfile                 # @status_mnmfile
	.p2align	2, 0x0
_status_mnmfile:
	.long	0                               # 0x0

	.lcomm	_MnmFile_Open.fp,4,4            # @MnmFile_Open.fp
	.section	.rdata,"dr",discard,"??_C@_02BMJICGCB@rt?$AA@"
	.globl	"??_C@_02BMJICGCB@rt?$AA@"      # @"??_C@_02BMJICGCB@rt?$AA@"
"??_C@_02BMJICGCB@rt?$AA@":
	.asciz	"rt"

	.section	.rdata,"dr",discard,"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@"
	.globl	"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@" # @"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@"
"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@":
	.asciz	" \t\n\r"

	.section	.rdata,"dr",discard,"??_C@_01IHBHIGKO@?0?$AA@"
	.globl	"??_C@_01IHBHIGKO@?0?$AA@"      # @"??_C@_01IHBHIGKO@?0?$AA@"
"??_C@_01IHBHIGKO@?0?$AA@":
	.asciz	","

	.lcomm	_MnmFile_Base.Label,128         # @MnmFile_Base.Label
	.section	.rdata,"dr",discard,"??_C@_05EILEDKCG@LABEL?$AA@"
	.globl	"??_C@_05EILEDKCG@LABEL?$AA@"   # @"??_C@_05EILEDKCG@LABEL?$AA@"
"??_C@_05EILEDKCG@LABEL?$AA@":
	.asciz	"LABEL"

	.section	.rdata,"dr",discard,"??_C@_03BHDJDALB@RET?$AA@"
	.globl	"??_C@_03BHDJDALB@RET?$AA@"     # @"??_C@_03BHDJDALB@RET?$AA@"
"??_C@_03BHDJDALB@RET?$AA@":
	.asciz	"RET"

	.section	.rdata,"dr",discard,"??_C@_03JMGAKCCH@END?$AA@"
	.globl	"??_C@_03JMGAKCCH@END?$AA@"     # @"??_C@_03JMGAKCCH@END?$AA@"
"??_C@_03JMGAKCCH@END?$AA@":
	.asciz	"END"

	.section	.rdata,"dr",discard,"??_C@_04HGICJEGC@?4X?$CFd?$AA@"
	.globl	"??_C@_04HGICJEGC@?4X?$CFd?$AA@" # @"??_C@_04HGICJEGC@?4X?$CFd?$AA@"
"??_C@_04HGICJEGC@?4X?$CFd?$AA@":
	.asciz	".X%d"

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
	.addrsig_sym _MnmFile_Base.Label
	.addrsig_sym _VARIANT_EMPTY
	.addrsig_sym __Variable_Zero_FUNCTION
