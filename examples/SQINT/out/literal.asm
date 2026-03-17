	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"literal.c"
	.def	_Literal_StrTime;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Literal_StrTime                # -- Begin function Literal_StrTime
	.p2align	4
_Literal_StrTime:                       # @Literal_StrTime
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$196, %esp
	movl	216(%esp), %edi
	leal	116(%esp), %esi
	pushl	%edi
	pushl	%esi
	calll	_strcpy
	addl	$8, %esp
	leal	36(%esp), %ebx
	pushl	%edi
	pushl	%ebx
	calll	_strcpy
	addl	$8, %esp
	pushl	$"??_C@_08CBABJGOP@dDhHmMsS?$AA@"
	pushl	%esi
	calll	_strtok
	addl	$8, %esp
	movl	%eax, 4(%esp)                   # 4-byte Spill
	testl	%eax, %eax
	je	LBB0_5
# %bb.1:
	pushl	$"??_C@_08CBABJGOP@dDhHmMsS?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	xorl	%ebp, %ebp
	testl	%eax, %eax
	je	LBB0_6
# %bb.2:
	movl	%eax, 16(%esp)                  # 4-byte Spill
	pushl	$"??_C@_08CBABJGOP@dDhHmMsS?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB0_7
# %bb.3:
	movl	%eax, 12(%esp)                  # 4-byte Spill
	pushl	$"??_C@_08CBABJGOP@dDhHmMsS?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB0_24
# %bb.4:
	movl	%eax, %esi
	pushl	$"??_C@_08CBABJGOP@dDhHmMsS?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	cmpl	$1, %eax
	movl	$5, %edi
	sbbl	$0, %edi
	movl	%esi, %ebp
	movl	%eax, %esi
	jmp	LBB0_10
LBB0_5:
	movl	$0, 16(%esp)                    # 4-byte Folded Spill
	movl	$0, 12(%esp)                    # 4-byte Folded Spill
	xorl	%ebp, %ebp
	xorl	%esi, %esi
	xorl	%edi, %edi
	jmp	LBB0_10
LBB0_6:
	movl	$1, %edi
	movl	$0, 16(%esp)                    # 4-byte Folded Spill
	jmp	LBB0_8
LBB0_7:
	movl	$2, %edi
LBB0_8:
	movl	$0, 12(%esp)                    # 4-byte Folded Spill
LBB0_9:
	xorl	%esi, %esi
LBB0_10:
	pushl	$"??_C@_0L@FPFMPDDA@0123456789?$AA@"
	pushl	%ebx
	calll	_strtok
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB0_27
# %bb.11:
	movl	%eax, %ebx
	pushl	$"??_C@_0L@FPFMPDDA@0123456789?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	movl	$0, 28(%esp)                    # 4-byte Folded Spill
	movl	%eax, 32(%esp)                  # 4-byte Spill
	testl	%eax, %eax
	je	LBB0_15
# %bb.12:
	pushl	$"??_C@_0L@FPFMPDDA@0123456789?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	movl	%eax, 20(%esp)                  # 4-byte Spill
	testl	%eax, %eax
	je	LBB0_16
# %bb.13:
	movl	%ebp, 8(%esp)                   # 4-byte Spill
	movl	%esi, %ebp
	pushl	$"??_C@_0L@FPFMPDDA@0123456789?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB0_25
# %bb.14:
	movl	%eax, %esi
	pushl	$"??_C@_0L@FPFMPDDA@0123456789?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	cmpl	$1, %eax
	movl	$5, %ecx
	sbbl	$0, %ecx
	movl	%esi, 28(%esp)                  # 4-byte Spill
	jmp	LBB0_26
LBB0_15:
	movl	$1, %ecx
	jmp	LBB0_17
LBB0_16:
	movl	$2, %ecx
LBB0_17:
	movl	$0, 20(%esp)                    # 4-byte Folded Spill
	xorl	%eax, %eax
	cmpl	$0, 4(%esp)                     # 4-byte Folded Reload
	je	LBB0_27
LBB0_18:
	cmpl	%ecx, %edi
	jne	LBB0_23
# %bb.19:                               # %sub_0
	movzbl	(%ebx), %edx
	xorl	%edi, %edi
	leal	-68(%edx), %ecx
	cmpl	$47, %ecx
	ja	LBB0_51
# %bb.20:                               # %sub_0
	movl	%esi, 24(%esp)                  # 4-byte Spill
	xorl	%esi, %esi
	jmpl	*LJTI0_0(,%ecx,4)
LBB0_21:                                # %.tail13
	cmpb	$0, 1(%ebx)
	jne	LBB0_33
# %bb.22:
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$L___const.Literal_StrTime.keyword+8, %ebx
	jmp	LBB0_54
LBB0_23:
	pushl	$"??_C@_0BN@MHJGFLCK@time?5format?5unit?5pair?5error?4?$AA@"
	jmp	LBB0_28
LBB0_24:
	movl	$3, %edi
	jmp	LBB0_9
LBB0_25:
	movl	$3, %ecx
	xorl	%eax, %eax
LBB0_26:
	movl	%ebp, %esi
	movl	8(%esp), %ebp                   # 4-byte Reload
	cmpl	$0, 4(%esp)                     # 4-byte Folded Reload
	jne	LBB0_18
LBB0_27:
	pushl	$"??_C@_0CC@CIMFJLML@time?5format?5unit?5not?5found?5error@"
LBB0_28:
	pushl	$8193                           # imm = 0x2001
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	xorl	%eax, %eax
	xorl	%esi, %esi
LBB0_29:
	movl	%esi, %edx
	addl	$196, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB0_30:                                # %.tail
	cmpb	$0, 1(%ebx)
	jne	LBB0_33
# %bb.31:
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$L___const.Literal_StrTime.keyword, %ebx
	jmp	LBB0_54
LBB0_32:                                # %.tail17
	cmpb	$0, 1(%ebx)
	je	LBB0_52
LBB0_33:                                # %sub_030
	cmpl	$115, %edx
	je	LBB0_42
# %bb.34:                               # %sub_030
	cmpl	$83, %edx
	je	LBB0_40
# %bb.35:                               # %sub_030
	xorl	%edi, %edi
	movl	$0, %esi
	cmpl	$77, %edx
	jne	LBB0_74
LBB0_36:                                # %.tail29
	cmpb	$0, 1(%ebx)
	je	LBB0_50
# %bb.37:                               # %sub_147
	xorl	%edi, %edi
	cmpb	$83, 1(%ebx)
	movl	$0, %esi
	jne	LBB0_74
# %bb.38:                               # %.tail45
	xorl	%edi, %edi
	cmpb	$0, 2(%ebx)
	jne	LBB0_74
# %bb.39:
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$L___const.Literal_StrTime.keyword+72, %ebx
	jmp	LBB0_54
LBB0_40:                                # %.tail37
	xorl	%edi, %edi
	cmpb	$0, 1(%ebx)
	movl	$0, %esi
	jne	LBB0_74
# %bb.41:
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$L___const.Literal_StrTime.keyword+56, %ebx
	jmp	LBB0_54
LBB0_42:                                # %.tail33
	xorl	%edi, %edi
	cmpb	$0, 1(%ebx)
	movl	$0, %esi
	jne	LBB0_74
# %bb.43:
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$L___const.Literal_StrTime.keyword+48, %ebx
	jmp	LBB0_54
LBB0_44:                                # %.tail25
	cmpb	$0, 1(%ebx)
	je	LBB0_53
# %bb.45:                               # %sub_143
	xorl	%edi, %edi
	cmpb	$115, 1(%ebx)
	movl	$0, %esi
	jne	LBB0_74
# %bb.46:                               # %.tail41
	xorl	%edi, %edi
	cmpb	$0, 2(%ebx)
	jne	LBB0_74
# %bb.47:
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$L___const.Literal_StrTime.keyword+64, %ebx
	jmp	LBB0_54
LBB0_48:                                # %.tail21
	xorl	%edi, %edi
	cmpb	$0, 1(%ebx)
	movl	$0, %esi
	jne	LBB0_74
# %bb.49:
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$L___const.Literal_StrTime.keyword+24, %ebx
	jmp	LBB0_54
LBB0_50:
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$L___const.Literal_StrTime.keyword+40, %ebx
	jmp	LBB0_54
LBB0_51:
	xorl	%esi, %esi
	jmp	LBB0_74
LBB0_52:
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$L___const.Literal_StrTime.keyword+16, %ebx
	jmp	LBB0_54
LBB0_53:
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$L___const.Literal_StrTime.keyword+32, %ebx
LBB0_54:
	pushl	4(%esp)                         # 4-byte Folded Reload
	calll	_atoi
	addl	$4, %esp
	imull	4(%ebx), %eax
	cmpl	$0, 16(%esp)                    # 4-byte Folded Reload
	je	LBB0_59
# %bb.55:
	movl	%ebp, 8(%esp)                   # 4-byte Spill
	movl	%eax, %esi
	sarl	$31, %esi
	movl	(%ebx), %ebp
	movl	%eax, %edi
	testl	%ebp, %ebp
	je	LBB0_74
# %bb.56:                               # %.preheader54.preheader
	addl	$8, %ebx
	.p2align	4
LBB0_57:                                # %.preheader54
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebp
	pushl	36(%esp)                        # 4-byte Folded Reload
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB0_60
# %bb.58:                               #   in Loop: Header=BB0_57 Depth=1
	movl	(%ebx), %ebp
	addl	$8, %ebx
	testl	%ebp, %ebp
	jne	LBB0_57
	jmp	LBB0_74
LBB0_59:
	movl	%eax, %esi
	sarl	$31, %esi
	jmp	LBB0_29
LBB0_60:
	movl	%edi, 4(%esp)                   # 4-byte Spill
	sarl	$31, %edi
	pushl	16(%esp)                        # 4-byte Folded Reload
	calll	_atoi
	addl	$4, %esp
	imull	-4(%ebx), %eax
	movl	%eax, %esi
	sarl	$31, %esi
	addl	4(%esp), %eax                   # 4-byte Folded Reload
	adcl	%edi, %esi
	movl	12(%esp), %edi                  # 4-byte Reload
	testl	%edi, %edi
	je	LBB0_29
# %bb.61:                               # %.preheader52.preheader
	movl	%eax, 4(%esp)                   # 4-byte Spill
LBB0_62:                                # %.preheader52
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebp
	pushl	24(%esp)                        # 4-byte Folded Reload
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB0_65
# %bb.63:                               #   in Loop: Header=BB0_62 Depth=1
	movl	(%ebx), %ebp
	addl	$8, %ebx
	testl	%ebp, %ebp
	jne	LBB0_62
	jmp	LBB0_64
LBB0_65:
	pushl	%edi
	calll	_atoi
	addl	$4, %esp
	imull	-4(%ebx), %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	movl	4(%esp), %edx                   # 4-byte Reload
	addl	%eax, %edx
	adcl	%ecx, %esi
	cmpl	$0, 8(%esp)                     # 4-byte Folded Reload
	je	LBB0_70
# %bb.66:                               # %.preheader50.preheader
	movl	%edx, 4(%esp)                   # 4-byte Spill
	movl	28(%esp), %edi                  # 4-byte Reload
LBB0_67:                                # %.preheader50
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebp
	pushl	%edi
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB0_71
# %bb.68:                               #   in Loop: Header=BB0_67 Depth=1
	movl	(%ebx), %ebp
	addl	$8, %ebx
	testl	%ebp, %ebp
	jne	LBB0_67
LBB0_64:
	movl	4(%esp), %edi                   # 4-byte Reload
LBB0_74:                                # %.loopexit
	pushl	$"??_C@_0CA@OKGOHEMN@time?5format?5unknown?5unit?5error?4?$AA@"
	pushl	$8193                           # imm = 0x2001
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
LBB0_75:
	movl	%edi, %eax
	jmp	LBB0_29
LBB0_70:
	movl	%edx, %eax
	jmp	LBB0_29
LBB0_71:
	pushl	8(%esp)                         # 4-byte Folded Reload
	calll	_atoi
	addl	$4, %esp
	imull	-4(%ebx), %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	movl	4(%esp), %edi                   # 4-byte Reload
	addl	%eax, %edi
	adcl	%ecx, %esi
	cmpl	$0, 24(%esp)                    # 4-byte Folded Reload
	je	LBB0_75
LBB0_72:                                # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebp
	pushl	4(%esp)                         # 4-byte Folded Reload
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB0_76
# %bb.73:                               #   in Loop: Header=BB0_72 Depth=1
	movl	(%ebx), %ebp
	addl	$8, %ebx
	testl	%ebp, %ebp
	jne	LBB0_72
	jmp	LBB0_74
LBB0_76:
	pushl	24(%esp)                        # 4-byte Folded Reload
	calll	_atoi
	addl	$4, %esp
	imull	-4(%ebx), %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	addl	%eax, %edi
	adcl	%ecx, %esi
	jmp	LBB0_75
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI0_0:
	.long	LBB0_21
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_48
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_36
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_40
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_30
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_32
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_44
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_74
	.long	LBB0_42
                                        # -- End function
	.def	_Literal_StrBase;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Literal_StrBase                # -- Begin function Literal_StrBase
	.p2align	4
_Literal_StrBase:                       # @Literal_StrBase
# %bb.0:                                # %sub_0
	pushl	%esi
	movl	12(%esp), %ecx
	movl	8(%esp), %edx
	movl	%edx, (%ecx)
	movzbl	(%edx), %esi
	movl	$10, %eax
	cmpl	$49, %esi
	je	LBB1_9
# %bb.1:                                # %sub_0
	cmpl	$56, %esi
	je	LBB1_7
# %bb.2:                                # %sub_0
	cmpl	$50, %esi
	jne	LBB1_6
# %bb.3:                                # %.tail
	cmpb	$35, 1(%edx)
	jne	LBB1_6
# %bb.4:
	movl	$2, %esi
	movl	$L___const.Literal_StrBase.keyword, %eax
	jmp	LBB1_5
LBB1_7:                                 # %.tail1
	cmpb	$35, 1(%edx)
	jne	LBB1_6
# %bb.8:
	movl	$2, %esi
	movl	$L___const.Literal_StrBase.keyword+8, %eax
	jmp	LBB1_5
LBB1_9:                                 # %sub_17
	cmpb	$48, 1(%edx)
	jne	LBB1_12
# %bb.10:                               # %.tail5
	cmpb	$35, 2(%edx)
	jne	LBB1_12
# %bb.11:
	movl	$3, %esi
	movl	$L___const.Literal_StrBase.keyword+16, %eax
	jmp	LBB1_5
LBB1_12:                                # %sub_111
	cmpb	$54, 1(%edx)
	jne	LBB1_6
# %bb.13:                               # %.tail9
	cmpb	$35, 2(%edx)
	jne	LBB1_6
# %bb.14:
	movl	$3, %esi
	movl	$L___const.Literal_StrBase.keyword+24, %eax
LBB1_5:
	movl	4(%eax), %eax
	addl	%esi, %edx
	movl	%edx, (%ecx)
LBB1_6:                                 # %.tail9.thread
	popl	%esi
	retl
                                        # -- End function
	.def	_Literal_Strbool;
	.scl	2;
	.type	32;
	.endef
	.globl	_Literal_Strbool                # -- Begin function Literal_Strbool
	.p2align	4
_Literal_Strbool:                       # @Literal_Strbool
# %bb.0:
	pushl	%ebx
	pushl	%esi
	movl	12(%esp), %esi
	pushl	$"??_C@_04HCDDPBNL@TRUE?$AA@"
	pushl	%esi
	calll	_strcmp
	addl	$8, %esp
	movb	$1, %bl
	testl	%eax, %eax
	je	LBB2_9
# %bb.1:
	pushl	$"??_C@_04LOAJBDKD@true?$AA@"
	pushl	%esi
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB2_9
# %bb.2:
	pushl	$"??_C@_05MAJJAKPI@FALSE?$AA@"
	pushl	%esi
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB2_8
# %bb.3:
	pushl	$"??_C@_05LAPONLG@false?$AA@"
	pushl	%esi
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB2_8
# %bb.4:
	cmpb	$49, (%esi)
	jne	LBB2_8
# %bb.5:
	cmpb	$0, 1(%esi)
	sete	%bl
	jmp	LBB2_9
LBB2_8:
	xorl	%ebx, %ebx
LBB2_9:
	movzbl	%bl, %eax
	xorl	%edx, %edx
	popl	%esi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Literal_Strtoq;
	.scl	2;
	.type	32;
	.endef
	.globl	_Literal_Strtoq                 # -- Begin function Literal_Strtoq
	.p2align	4
_Literal_Strtoq:                        # @Literal_Strtoq
# %bb.0:
	pushl	%eax
	movl	8(%esp), %eax
	movzbl	(%eax), %edx
	movl	$10, %ecx
	cmpl	$49, %edx
	je	LBB3_9
# %bb.1:
	cmpl	$56, %edx
	je	LBB3_7
# %bb.2:
	cmpl	$50, %edx
	jne	LBB3_6
# %bb.3:
	cmpb	$35, 1(%eax)
	jne	LBB3_6
# %bb.4:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword, %ecx
	jmp	LBB3_5
LBB3_7:
	cmpb	$35, 1(%eax)
	jne	LBB3_6
# %bb.8:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword+8, %ecx
	jmp	LBB3_5
LBB3_9:
	movzbl	1(%eax), %edx
	cmpl	$54, %edx
	je	LBB3_13
# %bb.10:
	cmpl	$48, %edx
	jne	LBB3_6
# %bb.11:
	cmpb	$35, 2(%eax)
	jne	LBB3_6
# %bb.12:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+16, %ecx
	jmp	LBB3_5
LBB3_13:
	cmpb	$35, 2(%eax)
	jne	LBB3_6
# %bb.14:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+24, %ecx
LBB3_5:
	movl	4(%ecx), %ecx
	addl	%edx, %eax
LBB3_6:                                 # %.thread
	movl	%esp, %edx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	calll	_strtoll
	addl	$12, %esp
	popl	%ecx
	retl
                                        # -- End function
	.def	_Literal_Strtouq;
	.scl	2;
	.type	32;
	.endef
	.globl	_Literal_Strtouq                # -- Begin function Literal_Strtouq
	.p2align	4
_Literal_Strtouq:                       # @Literal_Strtouq
# %bb.0:
	pushl	%eax
	movl	8(%esp), %eax
	movzbl	(%eax), %edx
	movl	$10, %ecx
	cmpl	$49, %edx
	je	LBB4_9
# %bb.1:
	cmpl	$56, %edx
	je	LBB4_7
# %bb.2:
	cmpl	$50, %edx
	jne	LBB4_6
# %bb.3:
	cmpb	$35, 1(%eax)
	jne	LBB4_6
# %bb.4:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword, %ecx
	jmp	LBB4_5
LBB4_7:
	cmpb	$35, 1(%eax)
	jne	LBB4_6
# %bb.8:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword+8, %ecx
	jmp	LBB4_5
LBB4_9:
	movzbl	1(%eax), %edx
	cmpl	$54, %edx
	je	LBB4_13
# %bb.10:
	cmpl	$48, %edx
	jne	LBB4_6
# %bb.11:
	cmpb	$35, 2(%eax)
	jne	LBB4_6
# %bb.12:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+16, %ecx
	jmp	LBB4_5
LBB4_13:
	cmpb	$35, 2(%eax)
	jne	LBB4_6
# %bb.14:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+24, %ecx
LBB4_5:
	movl	4(%ecx), %ecx
	addl	%edx, %eax
LBB4_6:                                 # %.thread
	movl	%esp, %edx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	calll	_strtoull
	addl	$12, %esp
	popl	%ecx
	retl
                                        # -- End function
	.def	_Literal_Strtol;
	.scl	2;
	.type	32;
	.endef
	.globl	_Literal_Strtol                 # -- Begin function Literal_Strtol
	.p2align	4
_Literal_Strtol:                        # @Literal_Strtol
# %bb.0:
	pushl	%eax
	movl	8(%esp), %eax
	movzbl	(%eax), %edx
	movl	$10, %ecx
	cmpl	$49, %edx
	je	LBB5_9
# %bb.1:
	cmpl	$56, %edx
	je	LBB5_7
# %bb.2:
	cmpl	$50, %edx
	jne	LBB5_6
# %bb.3:
	cmpb	$35, 1(%eax)
	jne	LBB5_6
# %bb.4:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword, %ecx
	jmp	LBB5_5
LBB5_7:
	cmpb	$35, 1(%eax)
	jne	LBB5_6
# %bb.8:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword+8, %ecx
	jmp	LBB5_5
LBB5_9:
	movzbl	1(%eax), %edx
	cmpl	$54, %edx
	je	LBB5_13
# %bb.10:
	cmpl	$48, %edx
	jne	LBB5_6
# %bb.11:
	cmpb	$35, 2(%eax)
	jne	LBB5_6
# %bb.12:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+16, %ecx
	jmp	LBB5_5
LBB5_13:
	cmpb	$35, 2(%eax)
	jne	LBB5_6
# %bb.14:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+24, %ecx
LBB5_5:
	movl	4(%ecx), %ecx
	addl	%edx, %eax
LBB5_6:                                 # %.thread
	movl	%esp, %edx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	calll	_strtol
	addl	$12, %esp
	movl	%eax, %edx
	sarl	$31, %edx
	popl	%ecx
	retl
                                        # -- End function
	.def	_Literal_Strtoul;
	.scl	2;
	.type	32;
	.endef
	.globl	_Literal_Strtoul                # -- Begin function Literal_Strtoul
	.p2align	4
_Literal_Strtoul:                       # @Literal_Strtoul
# %bb.0:
	pushl	%eax
	movl	8(%esp), %eax
	movzbl	(%eax), %edx
	movl	$10, %ecx
	cmpl	$49, %edx
	je	LBB6_9
# %bb.1:
	cmpl	$56, %edx
	je	LBB6_7
# %bb.2:
	cmpl	$50, %edx
	jne	LBB6_6
# %bb.3:
	cmpb	$35, 1(%eax)
	jne	LBB6_6
# %bb.4:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword, %ecx
	jmp	LBB6_5
LBB6_7:
	cmpb	$35, 1(%eax)
	jne	LBB6_6
# %bb.8:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword+8, %ecx
	jmp	LBB6_5
LBB6_9:
	movzbl	1(%eax), %edx
	cmpl	$54, %edx
	je	LBB6_13
# %bb.10:
	cmpl	$48, %edx
	jne	LBB6_6
# %bb.11:
	cmpb	$35, 2(%eax)
	jne	LBB6_6
# %bb.12:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+16, %ecx
	jmp	LBB6_5
LBB6_13:
	cmpb	$35, 2(%eax)
	jne	LBB6_6
# %bb.14:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+24, %ecx
LBB6_5:
	movl	4(%ecx), %ecx
	addl	%edx, %eax
LBB6_6:                                 # %.thread
	movl	%esp, %edx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	calll	_strtoul
	addl	$12, %esp
	xorl	%edx, %edx
	popl	%ecx
	retl
                                        # -- End function
	.def	_Literal_Strtoi;
	.scl	2;
	.type	32;
	.endef
	.globl	_Literal_Strtoi                 # -- Begin function Literal_Strtoi
	.p2align	4
_Literal_Strtoi:                        # @Literal_Strtoi
# %bb.0:
	pushl	%eax
	movl	8(%esp), %eax
	movzbl	(%eax), %edx
	movl	$10, %ecx
	cmpl	$49, %edx
	je	LBB7_9
# %bb.1:
	cmpl	$56, %edx
	je	LBB7_7
# %bb.2:
	cmpl	$50, %edx
	jne	LBB7_6
# %bb.3:
	cmpb	$35, 1(%eax)
	jne	LBB7_6
# %bb.4:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword, %ecx
	jmp	LBB7_5
LBB7_7:
	cmpb	$35, 1(%eax)
	jne	LBB7_6
# %bb.8:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword+8, %ecx
	jmp	LBB7_5
LBB7_9:
	movzbl	1(%eax), %edx
	cmpl	$54, %edx
	je	LBB7_13
# %bb.10:
	cmpl	$48, %edx
	jne	LBB7_6
# %bb.11:
	cmpb	$35, 2(%eax)
	jne	LBB7_6
# %bb.12:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+16, %ecx
	jmp	LBB7_5
LBB7_13:
	cmpb	$35, 2(%eax)
	jne	LBB7_6
# %bb.14:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+24, %ecx
LBB7_5:
	movl	4(%ecx), %ecx
	addl	%edx, %eax
LBB7_6:                                 # %.thread
	movl	%esp, %edx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	calll	_strtol
	addl	$12, %esp
	cwtl
	movl	%eax, %edx
	sarl	$31, %edx
	popl	%ecx
	retl
                                        # -- End function
	.def	_Literal_Strtoui;
	.scl	2;
	.type	32;
	.endef
	.globl	_Literal_Strtoui                # -- Begin function Literal_Strtoui
	.p2align	4
_Literal_Strtoui:                       # @Literal_Strtoui
# %bb.0:
	pushl	%eax
	movl	8(%esp), %eax
	movzbl	(%eax), %edx
	movl	$10, %ecx
	cmpl	$49, %edx
	je	LBB8_9
# %bb.1:
	cmpl	$56, %edx
	je	LBB8_7
# %bb.2:
	cmpl	$50, %edx
	jne	LBB8_6
# %bb.3:
	cmpb	$35, 1(%eax)
	jne	LBB8_6
# %bb.4:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword, %ecx
	jmp	LBB8_5
LBB8_7:
	cmpb	$35, 1(%eax)
	jne	LBB8_6
# %bb.8:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword+8, %ecx
	jmp	LBB8_5
LBB8_9:
	movzbl	1(%eax), %edx
	cmpl	$54, %edx
	je	LBB8_13
# %bb.10:
	cmpl	$48, %edx
	jne	LBB8_6
# %bb.11:
	cmpb	$35, 2(%eax)
	jne	LBB8_6
# %bb.12:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+16, %ecx
	jmp	LBB8_5
LBB8_13:
	cmpb	$35, 2(%eax)
	jne	LBB8_6
# %bb.14:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+24, %ecx
LBB8_5:
	movl	4(%ecx), %ecx
	addl	%edx, %eax
LBB8_6:                                 # %.thread
	movl	%esp, %edx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	calll	_strtoul
	addl	$12, %esp
	movzwl	%ax, %eax
	xorl	%edx, %edx
	popl	%ecx
	retl
                                        # -- End function
	.def	_Literal_Strtos;
	.scl	2;
	.type	32;
	.endef
	.globl	_Literal_Strtos                 # -- Begin function Literal_Strtos
	.p2align	4
_Literal_Strtos:                        # @Literal_Strtos
# %bb.0:
	pushl	%eax
	movl	8(%esp), %eax
	movzbl	(%eax), %edx
	movl	$10, %ecx
	cmpl	$49, %edx
	je	LBB9_9
# %bb.1:
	cmpl	$56, %edx
	je	LBB9_7
# %bb.2:
	cmpl	$50, %edx
	jne	LBB9_6
# %bb.3:
	cmpb	$35, 1(%eax)
	jne	LBB9_6
# %bb.4:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword, %ecx
	jmp	LBB9_5
LBB9_7:
	cmpb	$35, 1(%eax)
	jne	LBB9_6
# %bb.8:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword+8, %ecx
	jmp	LBB9_5
LBB9_9:
	movzbl	1(%eax), %edx
	cmpl	$54, %edx
	je	LBB9_13
# %bb.10:
	cmpl	$48, %edx
	jne	LBB9_6
# %bb.11:
	cmpb	$35, 2(%eax)
	jne	LBB9_6
# %bb.12:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+16, %ecx
	jmp	LBB9_5
LBB9_13:
	cmpb	$35, 2(%eax)
	jne	LBB9_6
# %bb.14:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+24, %ecx
LBB9_5:
	movl	4(%ecx), %ecx
	addl	%edx, %eax
LBB9_6:                                 # %.thread
	movl	%esp, %edx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	calll	_strtol
	addl	$12, %esp
	movsbl	%al, %eax
	movl	%eax, %edx
	sarl	$31, %edx
	popl	%ecx
	retl
                                        # -- End function
	.def	_Literal_Strtous;
	.scl	2;
	.type	32;
	.endef
	.globl	_Literal_Strtous                # -- Begin function Literal_Strtous
	.p2align	4
_Literal_Strtous:                       # @Literal_Strtous
# %bb.0:
	pushl	%eax
	movl	8(%esp), %eax
	movzbl	(%eax), %edx
	movl	$10, %ecx
	cmpl	$49, %edx
	je	LBB10_9
# %bb.1:
	cmpl	$56, %edx
	je	LBB10_7
# %bb.2:
	cmpl	$50, %edx
	jne	LBB10_6
# %bb.3:
	cmpb	$35, 1(%eax)
	jne	LBB10_6
# %bb.4:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword, %ecx
	jmp	LBB10_5
LBB10_7:
	cmpb	$35, 1(%eax)
	jne	LBB10_6
# %bb.8:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword+8, %ecx
	jmp	LBB10_5
LBB10_9:
	movzbl	1(%eax), %edx
	cmpl	$54, %edx
	je	LBB10_13
# %bb.10:
	cmpl	$48, %edx
	jne	LBB10_6
# %bb.11:
	cmpb	$35, 2(%eax)
	jne	LBB10_6
# %bb.12:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+16, %ecx
	jmp	LBB10_5
LBB10_13:
	cmpb	$35, 2(%eax)
	jne	LBB10_6
# %bb.14:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+24, %ecx
LBB10_5:
	movl	4(%ecx), %ecx
	addl	%edx, %eax
LBB10_6:                                # %.thread
	movl	%esp, %edx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	calll	_strtoul
	addl	$12, %esp
	movzbl	%al, %eax
	xorl	%edx, %edx
	popl	%ecx
	retl
                                        # -- End function
	.def	_Literal_Strtod;
	.scl	2;
	.type	32;
	.endef
	.globl	_Literal_Strtod                 # -- Begin function Literal_Strtod
	.p2align	4
_Literal_Strtod:                        # @Literal_Strtod
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-8, %esp
	subl	$16, %esp
	leal	12(%esp), %eax
	pushl	%eax
	pushl	8(%ebp)
	calll	_strtod
	addl	$8, %esp
	fstpl	(%esp)
	movl	(%esp), %eax
	movl	4(%esp), %edx
	movl	%ebp, %esp
	popl	%ebp
	retl
                                        # -- End function
	.def	_Literal_Strtof;
	.scl	2;
	.type	32;
	.endef
	.globl	_Literal_Strtof                 # -- Begin function Literal_Strtof
	.p2align	4
_Literal_Strtof:                        # @Literal_Strtof
# %bb.0:
	subl	$8, %esp
	leal	4(%esp), %eax
	pushl	%eax
	pushl	16(%esp)
	calll	_strtof
	addl	$8, %esp
	fstps	(%esp)
	movd	(%esp), %xmm0                   # xmm0 = mem[0],zero,zero,zero
	movd	%xmm0, %eax
	xorl	%edx, %edx
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_Literal_True;
	.scl	2;
	.type	32;
	.endef
	.globl	_Literal_True                   # -- Begin function Literal_True
	.p2align	4
_Literal_True:                          # @Literal_True
# %bb.0:
	movl	$1, %eax
	xorl	%edx, %edx
	retl
                                        # -- End function
	.def	_Literal_False;
	.scl	2;
	.type	32;
	.endef
	.globl	_Literal_False                  # -- Begin function Literal_False
	.p2align	4
_Literal_False:                         # @Literal_False
# %bb.0:
	xorl	%eax, %eax
	xorl	%edx, %edx
	retl
                                        # -- End function
	.def	_Literal_String;
	.scl	2;
	.type	32;
	.endef
	.globl	_Literal_String                 # -- Begin function Literal_String
	.p2align	4
_Literal_String:                        # @Literal_String
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	16(%esp), %edi
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	decl	%eax
	cmpl	$80, %eax
	movl	$80, %ebx
	cmovll	%eax, %ebx
	pushl	$83
	calll	_Variable_Body
	addl	$4, %esp
	movl	%eax, %esi
	addl	$2, %eax
	pushl	%ebx
	pushl	%edi
	pushl	%eax
	calll	_strncpy
	addl	$12, %esp
	movw	%bx, (%esi)
	movl	%esi, %eax
	xorl	%edx, %edx
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Literal_Compile;
	.scl	2;
	.type	32;
	.endef
	.globl	_Literal_Compile                # -- Begin function Literal_Compile
	.p2align	4
_Literal_Compile:                       # @Literal_Compile
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$8, %esp
	movl	28(%esp), %edi
	testl	%edi, %edi
	je	LBB16_5
# %bb.1:
	movl	$"??_C@_05NCFAHBAN@BOOL?$CD?$AA@", %ebp
	movl	$L___const.Literal_Compile.keyword+12, %ebx
	.p2align	4
LBB16_2:                                # =>This Inner Loop Header: Depth=1
	pushl	%ebp
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %esi
	pushl	%eax
	pushl	%ebp
	pushl	%edi
	calll	_strncmp
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB16_6
# %bb.3:                                #   in Loop: Header=BB16_2 Depth=1
	movl	(%ebx), %ebp
	addl	$12, %ebx
	testl	%ebp, %ebp
	jne	LBB16_2
LBB16_5:
	xorl	%eax, %eax
	jmp	LBB16_9
LBB16_6:
	calll	_Scope_get
	pushl	%eax
	calll	_strlen
	addl	$4, %esp
	testl	%eax, %eax
	leal	1(%esi,%eax), %eax
	cmovel	%esi, %eax
	movzwl	-8(%ebx), %ebp
	addl	%edi, %eax
	pushl	%eax
	calll	*-4(%ebx)
	addl	$4, %esp
	movl	%eax, %esi
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	pushl	%ebp
	pushl	%edi
	calll	_Variable_Add
	addl	$8, %esp
	movb	$1, 10(%eax)
	cmpl	$1346, %ebp                     # imm = 0x542
	je	LBB16_8
# %bb.7:
	pushl	$8
	movl	%eax, %edi
	calll	_Variable_Body
	addl	$4, %esp
	movl	%eax, %esi
	movl	%esp, %eax
	pushl	%eax
	pushl	%esi
	calll	_Variable_Copy64
	movl	%edi, %eax
	addl	$8, %esp
LBB16_8:
	movl	%esi, (%eax)
LBB16_9:
	addl	$8, %esp
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

	.section	.rdata,"dr",discard,"??_C@_01LPLHEDKD@d?$AA@"
	.globl	"??_C@_01LPLHEDKD@d?$AA@"       # @"??_C@_01LPLHEDKD@d?$AA@"
"??_C@_01LPLHEDKD@d?$AA@":
	.asciz	"d"

	.section	.rdata,"dr",discard,"??_C@_01CKDDGHAB@D?$AA@"
	.globl	"??_C@_01CKDDGHAB@D?$AA@"       # @"??_C@_01CKDDGHAB@D?$AA@"
"??_C@_01CKDDGHAB@D?$AA@":
	.asciz	"D"

	.section	.rdata,"dr",discard,"??_C@_01BDACAMKP@h?$AA@"
	.globl	"??_C@_01BDACAMKP@h?$AA@"       # @"??_C@_01BDACAMKP@h?$AA@"
"??_C@_01BDACAMKP@h?$AA@":
	.asciz	"h"

	.section	.rdata,"dr",discard,"??_C@_01IGIGCIAN@H?$AA@"
	.globl	"??_C@_01IGIGCIAN@H?$AA@"       # @"??_C@_01IGIGCIAN@H?$AA@"
"??_C@_01IGIGCIAN@H?$AA@":
	.asciz	"H"

	.section	.rdata,"dr",discard,"??_C@_01GOHFPIOK@m?$AA@"
	.globl	"??_C@_01GOHFPIOK@m?$AA@"       # @"??_C@_01GOHFPIOK@m?$AA@"
"??_C@_01GOHFPIOK@m?$AA@":
	.asciz	"m"

	.section	.rdata,"dr",discard,"??_C@_01PLPBNMEI@M?$AA@"
	.globl	"??_C@_01PLPBNMEI@M?$AA@"       # @"??_C@_01PLPBNMEI@M?$AA@"
"??_C@_01PLPBNMEI@M?$AA@":
	.asciz	"M"

	.section	.rdata,"dr",discard,"??_C@_01LKDEMHDF@s?$AA@"
	.globl	"??_C@_01LKDEMHDF@s?$AA@"       # @"??_C@_01LKDEMHDF@s?$AA@"
"??_C@_01LKDEMHDF@s?$AA@":
	.asciz	"s"

	.section	.rdata,"dr",discard,"??_C@_01CPLAODJH@S?$AA@"
	.globl	"??_C@_01CPLAODJH@S?$AA@"       # @"??_C@_01CPLAODJH@S?$AA@"
"??_C@_01CPLAODJH@S?$AA@":
	.asciz	"S"

	.section	.rdata,"dr",discard,"??_C@_02EEKDFEKL@ms?$AA@"
	.globl	"??_C@_02EEKDFEKL@ms?$AA@"      # @"??_C@_02EEKDFEKL@ms?$AA@"
"??_C@_02EEKDFEKL@ms?$AA@":
	.asciz	"ms"

	.section	.rdata,"dr",discard,"??_C@_02OJGKDGOJ@MS?$AA@"
	.globl	"??_C@_02OJGKDGOJ@MS?$AA@"      # @"??_C@_02OJGKDGOJ@MS?$AA@"
"??_C@_02OJGKDGOJ@MS?$AA@":
	.asciz	"MS"

	.section	.rdata,"dr"
	.p2align	2, 0x0                          # @__const.Literal_StrTime.keyword
L___const.Literal_StrTime.keyword:
	.long	"??_C@_01LPLHEDKD@d?$AA@"
	.long	86400000                        # 0x5265c00
	.long	"??_C@_01CKDDGHAB@D?$AA@"
	.long	86400000                        # 0x5265c00
	.long	"??_C@_01BDACAMKP@h?$AA@"
	.long	3600000                         # 0x36ee80
	.long	"??_C@_01IGIGCIAN@H?$AA@"
	.long	3600000                         # 0x36ee80
	.long	"??_C@_01GOHFPIOK@m?$AA@"
	.long	60000                           # 0xea60
	.long	"??_C@_01PLPBNMEI@M?$AA@"
	.long	60000                           # 0xea60
	.long	"??_C@_01LKDEMHDF@s?$AA@"
	.long	1000                            # 0x3e8
	.long	"??_C@_01CPLAODJH@S?$AA@"
	.long	1000                            # 0x3e8
	.long	"??_C@_02EEKDFEKL@ms?$AA@"
	.long	1                               # 0x1
	.long	"??_C@_02OJGKDGOJ@MS?$AA@"
	.long	1                               # 0x1
	.zero	8

	.section	.rdata,"dr",discard,"??_C@_08CBABJGOP@dDhHmMsS?$AA@"
	.globl	"??_C@_08CBABJGOP@dDhHmMsS?$AA@" # @"??_C@_08CBABJGOP@dDhHmMsS?$AA@"
"??_C@_08CBABJGOP@dDhHmMsS?$AA@":
	.asciz	"dDhHmMsS"

	.section	.rdata,"dr",discard,"??_C@_0L@FPFMPDDA@0123456789?$AA@"
	.globl	"??_C@_0L@FPFMPDDA@0123456789?$AA@" # @"??_C@_0L@FPFMPDDA@0123456789?$AA@"
"??_C@_0L@FPFMPDDA@0123456789?$AA@":
	.asciz	"0123456789"

	.section	.rdata,"dr",discard,"??_C@_0CC@CIMFJLML@time?5format?5unit?5not?5found?5error@"
	.globl	"??_C@_0CC@CIMFJLML@time?5format?5unit?5not?5found?5error@" # @"??_C@_0CC@CIMFJLML@time?5format?5unit?5not?5found?5error@"
"??_C@_0CC@CIMFJLML@time?5format?5unit?5not?5found?5error@":
	.asciz	"time format unit not found error."

	.section	.rdata,"dr",discard,"??_C@_0BN@MHJGFLCK@time?5format?5unit?5pair?5error?4?$AA@"
	.globl	"??_C@_0BN@MHJGFLCK@time?5format?5unit?5pair?5error?4?$AA@" # @"??_C@_0BN@MHJGFLCK@time?5format?5unit?5pair?5error?4?$AA@"
"??_C@_0BN@MHJGFLCK@time?5format?5unit?5pair?5error?4?$AA@":
	.asciz	"time format unit pair error."

	.section	.rdata,"dr",discard,"??_C@_0CA@OKGOHEMN@time?5format?5unknown?5unit?5error?4?$AA@"
	.globl	"??_C@_0CA@OKGOHEMN@time?5format?5unknown?5unit?5error?4?$AA@" # @"??_C@_0CA@OKGOHEMN@time?5format?5unknown?5unit?5error?4?$AA@"
"??_C@_0CA@OKGOHEMN@time?5format?5unknown?5unit?5error?4?$AA@":
	.asciz	"time format unknown unit error."

	.section	.rdata,"dr",discard,"??_C@_02JJPIGAHC@2?$CD?$AA@"
	.globl	"??_C@_02JJPIGAHC@2?$CD?$AA@"   # @"??_C@_02JJPIGAHC@2?$CD?$AA@"
"??_C@_02JJPIGAHC@2?$CD?$AA@":
	.asciz	"2#"

	.section	.rdata,"dr",discard,"??_C@_02JEGPOFKE@8?$CD?$AA@"
	.globl	"??_C@_02JEGPOFKE@8?$CD?$AA@"   # @"??_C@_02JEGPOFKE@8?$CD?$AA@"
"??_C@_02JEGPOFKE@8?$CD?$AA@":
	.asciz	"8#"

	.section	.rdata,"dr",discard,"??_C@_03MOOCNNG@10?$CD?$AA@"
	.globl	"??_C@_03MOOCNNG@10?$CD?$AA@"   # @"??_C@_03MOOCNNG@10?$CD?$AA@"
"??_C@_03MOOCNNG@10?$CD?$AA@":
	.asciz	"10#"

	.section	.rdata,"dr",discard,"??_C@_03IGDFBGE@16?$CD?$AA@"
	.globl	"??_C@_03IGDFBGE@16?$CD?$AA@"   # @"??_C@_03IGDFBGE@16?$CD?$AA@"
"??_C@_03IGDFBGE@16?$CD?$AA@":
	.asciz	"16#"

	.section	.rdata,"dr"
	.p2align	2, 0x0                          # @__const.Literal_StrBase.keyword
L___const.Literal_StrBase.keyword:
	.long	"??_C@_02JJPIGAHC@2?$CD?$AA@"
	.long	2                               # 0x2
	.long	"??_C@_02JEGPOFKE@8?$CD?$AA@"
	.long	8                               # 0x8
	.long	"??_C@_03MOOCNNG@10?$CD?$AA@"
	.long	10                              # 0xa
	.long	"??_C@_03IGDFBGE@16?$CD?$AA@"
	.long	16                              # 0x10
	.zero	8

	.section	.rdata,"dr",discard,"??_C@_04HCDDPBNL@TRUE?$AA@"
	.globl	"??_C@_04HCDDPBNL@TRUE?$AA@"    # @"??_C@_04HCDDPBNL@TRUE?$AA@"
"??_C@_04HCDDPBNL@TRUE?$AA@":
	.asciz	"TRUE"

	.section	.rdata,"dr",discard,"??_C@_04LOAJBDKD@true?$AA@"
	.globl	"??_C@_04LOAJBDKD@true?$AA@"    # @"??_C@_04LOAJBDKD@true?$AA@"
"??_C@_04LOAJBDKD@true?$AA@":
	.asciz	"true"

	.section	.rdata,"dr",discard,"??_C@_05MAJJAKPI@FALSE?$AA@"
	.globl	"??_C@_05MAJJAKPI@FALSE?$AA@"   # @"??_C@_05MAJJAKPI@FALSE?$AA@"
"??_C@_05MAJJAKPI@FALSE?$AA@":
	.asciz	"FALSE"

	.section	.rdata,"dr",discard,"??_C@_05LAPONLG@false?$AA@"
	.globl	"??_C@_05LAPONLG@false?$AA@"    # @"??_C@_05LAPONLG@false?$AA@"
"??_C@_05LAPONLG@false?$AA@":
	.asciz	"false"

	.section	.rdata,"dr",discard,"??_C@_05NCFAHBAN@BOOL?$CD?$AA@"
	.globl	"??_C@_05NCFAHBAN@BOOL?$CD?$AA@" # @"??_C@_05NCFAHBAN@BOOL?$CD?$AA@"
"??_C@_05NCFAHBAN@BOOL?$CD?$AA@":
	.asciz	"BOOL#"

	.section	.rdata,"dr",discard,"??_C@_05MNJDHAHA@LINT?$CD?$AA@"
	.globl	"??_C@_05MNJDHAHA@LINT?$CD?$AA@" # @"??_C@_05MNJDHAHA@LINT?$CD?$AA@"
"??_C@_05MNJDHAHA@LINT?$CD?$AA@":
	.asciz	"LINT#"

	.section	.rdata,"dr",discard,"??_C@_05CBMAPCBN@DINT?$CD?$AA@"
	.globl	"??_C@_05CBMAPCBN@DINT?$CD?$AA@" # @"??_C@_05CBMAPCBN@DINT?$CD?$AA@"
"??_C@_05CBMAPCBN@DINT?$CD?$AA@":
	.asciz	"DINT#"

	.section	.rdata,"dr",discard,"??_C@_04MCOJOMNJ@INT?$CD?$AA@"
	.globl	"??_C@_04MCOJOMNJ@INT?$CD?$AA@" # @"??_C@_04MCOJOMNJ@INT?$CD?$AA@"
"??_C@_04MCOJOMNJ@INT?$CD?$AA@":
	.asciz	"INT#"

	.section	.rdata,"dr",discard,"??_C@_05DPBDMADO@SINT?$CD?$AA@"
	.globl	"??_C@_05DPBDMADO@SINT?$CD?$AA@" # @"??_C@_05DPBDMADO@SINT?$CD?$AA@"
"??_C@_05DPBDMADO@SINT?$CD?$AA@":
	.asciz	"SINT#"

	.section	.rdata,"dr",discard,"??_C@_06JANAMILN@ULINT?$CD?$AA@"
	.globl	"??_C@_06JANAMILN@ULINT?$CD?$AA@" # @"??_C@_06JANAMILN@ULINT?$CD?$AA@"
"??_C@_06JANAMILN@ULINT?$CD?$AA@":
	.asciz	"ULINT#"

	.section	.rdata,"dr",discard,"??_C@_06HMIDEKNA@UDINT?$CD?$AA@"
	.globl	"??_C@_06HMIDEKNA@UDINT?$CD?$AA@" # @"??_C@_06HMIDEKNA@UDINT?$CD?$AA@"
"??_C@_06HMIDEKNA@UDINT?$CD?$AA@":
	.asciz	"UDINT#"

	.section	.rdata,"dr",discard,"??_C@_05OJEKCDCD@UINT?$CD?$AA@"
	.globl	"??_C@_05OJEKCDCD@UINT?$CD?$AA@" # @"??_C@_05OJEKCDCD@UINT?$CD?$AA@"
"??_C@_05OJEKCDCD@UINT?$CD?$AA@":
	.asciz	"UINT#"

	.section	.rdata,"dr",discard,"??_C@_06GCFAHIPD@USINT?$CD?$AA@"
	.globl	"??_C@_06GCFAHIPD@USINT?$CD?$AA@" # @"??_C@_06GCFAHIPD@USINT?$CD?$AA@"
"??_C@_06GCFAHIPD@USINT?$CD?$AA@":
	.asciz	"USINT#"

	.section	.rdata,"dr",discard,"??_C@_06IECHKAAB@QWORD?$CD?$AA@"
	.globl	"??_C@_06IECHKAAB@QWORD?$CD?$AA@" # @"??_C@_06IECHKAAB@QWORD?$CD?$AA@"
"??_C@_06IECHKAAB@QWORD?$CD?$AA@":
	.asciz	"QWORD#"

	.section	.rdata,"dr",discard,"??_C@_06LBMBBDGI@DWORD?$CD?$AA@"
	.globl	"??_C@_06LBMBBDGI@DWORD?$CD?$AA@" # @"??_C@_06LBMBBDGI@DWORD?$CD?$AA@"
"??_C@_06LBMBBDGI@DWORD?$CD?$AA@":
	.asciz	"DWORD#"

	.section	.rdata,"dr",discard,"??_C@_05CNCLDMNP@WORD?$CD?$AA@"
	.globl	"??_C@_05CNCLDMNP@WORD?$CD?$AA@" # @"??_C@_05CNCLDMNP@WORD?$CD?$AA@"
"??_C@_05CNCLDMNP@WORD?$CD?$AA@":
	.asciz	"WORD#"

	.section	.rdata,"dr",discard,"??_C@_05LFDJPIDO@BYTE?$CD?$AA@"
	.globl	"??_C@_05LFDJPIDO@BYTE?$CD?$AA@" # @"??_C@_05LFDJPIDO@BYTE?$CD?$AA@"
"??_C@_05LFDJPIDO@BYTE?$CD?$AA@":
	.asciz	"BYTE#"

	.section	.rdata,"dr",discard,"??_C@_06NEOMHNNE@LREAL?$CD?$AA@"
	.globl	"??_C@_06NEOMHNNE@LREAL?$CD?$AA@" # @"??_C@_06NEOMHNNE@LREAL?$CD?$AA@"
"??_C@_06NEOMHNNE@LREAL?$CD?$AA@":
	.asciz	"LREAL#"

	.section	.rdata,"dr",discard,"??_C@_05HLOJBMAE@REAL?$CD?$AA@"
	.globl	"??_C@_05HLOJBMAE@REAL?$CD?$AA@" # @"??_C@_05HLOJBMAE@REAL?$CD?$AA@"
"??_C@_05HLOJBMAE@REAL?$CD?$AA@":
	.asciz	"REAL#"

	.section	.rdata,"dr",discard,"??_C@_05CNEHJGCP@TIME?$CD?$AA@"
	.globl	"??_C@_05CNEHJGCP@TIME?$CD?$AA@" # @"??_C@_05CNEHJGCP@TIME?$CD?$AA@"
"??_C@_05CNEHJGCP@TIME?$CD?$AA@":
	.asciz	"TIME#"

	.section	.rdata,"dr",discard,"??_C@_02NFKCNHOA@T?$CD?$AA@"
	.globl	"??_C@_02NFKCNHOA@T?$CD?$AA@"   # @"??_C@_02NFKCNHOA@T?$CD?$AA@"
"??_C@_02NFKCNHOA@T?$CD?$AA@":
	.asciz	"T#"

	.section	.rdata,"dr",discard,"??_C@_08BOJGAEJE@STRING?$CD?8?$AA@"
	.globl	"??_C@_08BOJGAEJE@STRING?$CD?8?$AA@" # @"??_C@_08BOJGAEJE@STRING?$CD?8?$AA@"
"??_C@_08BOJGAEJE@STRING?$CD?8?$AA@":
	.asciz	"STRING#'"

	.section	.rdata,"dr",discard,"??_C@_05IMECLCOB@bool?$CD?$AA@"
	.globl	"??_C@_05IMECLCOB@bool?$CD?$AA@" # @"??_C@_05IMECLCOB@bool?$CD?$AA@"
"??_C@_05IMECLCOB@bool?$CD?$AA@":
	.asciz	"bool#"

	.section	.rdata,"dr",discard,"??_C@_05JDIBLDJM@lint?$CD?$AA@"
	.globl	"??_C@_05JDIBLDJM@lint?$CD?$AA@" # @"??_C@_05JDIBLDJM@lint?$CD?$AA@"
"??_C@_05JDIBLDJM@lint?$CD?$AA@":
	.asciz	"lint#"

	.section	.rdata,"dr",discard,"??_C@_05HPNCDBPB@dint?$CD?$AA@"
	.globl	"??_C@_05HPNCDBPB@dint?$CD?$AA@" # @"??_C@_05HPNCDBPB@dint?$CD?$AA@"
"??_C@_05HPNCDBPB@dint?$CD?$AA@":
	.asciz	"dint#"

	.section	.rdata,"dr",discard,"??_C@_04JLFHCKAD@int?$CD?$AA@"
	.globl	"??_C@_04JLFHCKAD@int?$CD?$AA@" # @"??_C@_04JLFHCKAD@int?$CD?$AA@"
"??_C@_04JLFHCKAD@int?$CD?$AA@":
	.asciz	"int#"

	.section	.rdata,"dr",discard,"??_C@_05GBABADNC@sint?$CD?$AA@"
	.globl	"??_C@_05GBABADNC@sint?$CD?$AA@" # @"??_C@_05GBABADNC@sint?$CD?$AA@"
"??_C@_05GBABADNC@sint?$CD?$AA@":
	.asciz	"sint#"

	.section	.rdata,"dr",discard,"??_C@_06BHPDCMN@ulint?$CD?$AA@"
	.globl	"??_C@_06BHPDCMN@ulint?$CD?$AA@" # @"??_C@_06BHPDCMN@ulint?$CD?$AA@"
"??_C@_06BHPDCMN@ulint?$CD?$AA@":
	.asciz	"ulint#"

	.section	.rdata,"dr",discard,"??_C@_06ONCMLAKA@udint?$CD?$AA@"
	.globl	"??_C@_06ONCMLAKA@udint?$CD?$AA@" # @"??_C@_06ONCMLAKA@udint?$CD?$AA@"
"??_C@_06ONCMLAKA@udint?$CD?$AA@":
	.asciz	"udint#"

	.section	.rdata,"dr",discard,"??_C@_05LHFIOAMP@uint?$CD?$AA@"
	.globl	"??_C@_05LHFIOAMP@uint?$CD?$AA@" # @"??_C@_05LHFIOAMP@uint?$CD?$AA@"
"??_C@_05LHFIOAMP@uint?$CD?$AA@":
	.asciz	"uint#"

	.section	.rdata,"dr",discard,"??_C@_06PDPPICID@usint?$CD?$AA@"
	.globl	"??_C@_06PDPPICID@usint?$CD?$AA@" # @"??_C@_06PDPPICID@usint?$CD?$AA@"
"??_C@_06PDPPICID@usint?$CD?$AA@":
	.asciz	"usint#"

	.section	.rdata,"dr",discard,"??_C@_06BFIIFKHB@qword?$CD?$AA@"
	.globl	"??_C@_06BFIIFKHB@qword?$CD?$AA@" # @"??_C@_06BFIIFKHB@qword?$CD?$AA@"
"??_C@_06BFIIFKHB@qword?$CD?$AA@":
	.asciz	"qword#"

	.section	.rdata,"dr",discard,"??_C@_06CAGOOJBI@dword?$CD?$AA@"
	.globl	"??_C@_06CAGOOJBI@dword?$CD?$AA@" # @"??_C@_06CAGOOJBI@dword?$CD?$AA@"
"??_C@_06CAGOOJBI@dword?$CD?$AA@":
	.asciz	"dword#"

	.section	.rdata,"dr",discard,"??_C@_05HDDJPPDD@word?$CD?$AA@"
	.globl	"??_C@_05HDDJPPDD@word?$CD?$AA@" # @"??_C@_05HDDJPPDD@word?$CD?$AA@"
"??_C@_05HDDJPPDD@word?$CD?$AA@":
	.asciz	"word#"

	.section	.rdata,"dr",discard,"??_C@_05OLCLDLNC@byte?$CD?$AA@"
	.globl	"??_C@_05OLCLDLNC@byte?$CD?$AA@" # @"??_C@_05OLCLDLNC@byte?$CD?$AA@"
"??_C@_05OLCLDLNC@byte?$CD?$AA@":
	.asciz	"byte#"

	.section	.rdata,"dr",discard,"??_C@_06EFEDIHKE@lreal?$CD?$AA@"
	.globl	"??_C@_06EFEDIHKE@lreal?$CD?$AA@" # @"??_C@_06EFEDIHKE@lreal?$CD?$AA@"
"??_C@_06EFEDIHKE@lreal?$CD?$AA@":
	.asciz	"lreal#"

	.section	.rdata,"dr",discard,"??_C@_05CFPLNPOI@real?$CD?$AA@"
	.globl	"??_C@_05CFPLNPOI@real?$CD?$AA@" # @"??_C@_05CFPLNPOI@real?$CD?$AA@"
"??_C@_05CFPLNPOI@real?$CD?$AA@":
	.asciz	"real#"

	.section	.rdata,"dr",discard,"??_C@_05HDFFFFMD@time?$CD?$AA@"
	.globl	"??_C@_05HDFFFFMD@time?$CD?$AA@" # @"??_C@_05HDFFFFMD@time?$CD?$AA@"
"??_C@_05HDFFFFMD@time?$CD?$AA@":
	.asciz	"time#"

	.section	.rdata,"dr",discard,"??_C@_02ONOPJBAA@t?$CD?$AA@"
	.globl	"??_C@_02ONOPJBAA@t?$CD?$AA@"   # @"??_C@_02ONOPJBAA@t?$CD?$AA@"
"??_C@_02ONOPJBAA@t?$CD?$AA@":
	.asciz	"t#"

	.section	.rdata,"dr",discard,"??_C@_08MMPDFIPB@string?$CD?8?$AA@"
	.globl	"??_C@_08MMPDFIPB@string?$CD?8?$AA@" # @"??_C@_08MMPDFIPB@string?$CD?8?$AA@"
"??_C@_08MMPDFIPB@string?$CD?8?$AA@":
	.asciz	"string#'"

	.section	.rdata,"dr"
	.p2align	2, 0x0                          # @__const.Literal_Compile.keyword
L___const.Literal_Compile.keyword:
	.long	"??_C@_05NCFAHBAN@BOOL?$CD?$AA@"
	.short	1536                            # 0x600
	.zero	2
	.long	_Literal_Strbool
	.long	"??_C@_05MNJDHAHA@LINT?$CD?$AA@"
	.short	263                             # 0x107
	.zero	2
	.long	_Literal_Strtoq
	.long	"??_C@_05CBMAPCBN@DINT?$CD?$AA@"
	.short	262                             # 0x106
	.zero	2
	.long	_Literal_Strtol
	.long	"??_C@_04MCOJOMNJ@INT?$CD?$AA@"
	.short	261                             # 0x105
	.zero	2
	.long	_Literal_Strtoi
	.long	"??_C@_05DPBDMADO@SINT?$CD?$AA@"
	.short	260                             # 0x104
	.zero	2
	.long	_Literal_Strtos
	.long	"??_C@_06JANAMILN@ULINT?$CD?$AA@"
	.short	515                             # 0x203
	.zero	2
	.long	_Literal_Strtouq
	.long	"??_C@_06HMIDEKNA@UDINT?$CD?$AA@"
	.short	514                             # 0x202
	.zero	2
	.long	_Literal_Strtoul
	.long	"??_C@_05OJEKCDCD@UINT?$CD?$AA@"
	.short	513                             # 0x201
	.zero	2
	.long	_Literal_Strtoui
	.long	"??_C@_06GCFAHIPD@USINT?$CD?$AA@"
	.short	512                             # 0x200
	.zero	2
	.long	_Literal_Strtous
	.long	"??_C@_06IECHKAAB@QWORD?$CD?$AA@"
	.short	19                              # 0x13
	.zero	2
	.long	_Literal_Strtouq
	.long	"??_C@_06LBMBBDGI@DWORD?$CD?$AA@"
	.short	18                              # 0x12
	.zero	2
	.long	_Literal_Strtoul
	.long	"??_C@_05CNCLDMNP@WORD?$CD?$AA@"
	.short	17                              # 0x11
	.zero	2
	.long	_Literal_Strtoui
	.long	"??_C@_05LFDJPIDO@BYTE?$CD?$AA@"
	.short	16                              # 0x10
	.zero	2
	.long	_Literal_Strtous
	.long	"??_C@_06NEOMHNNE@LREAL?$CD?$AA@"
	.short	783                             # 0x30f
	.zero	2
	.long	_Literal_Strtod
	.long	"??_C@_05HLOJBMAE@REAL?$CD?$AA@"
	.short	782                             # 0x30e
	.zero	2
	.long	_Literal_Strtof
	.long	"??_C@_05CNEHJGCP@TIME?$CD?$AA@"
	.short	1347                            # 0x543
	.zero	2
	.long	_Literal_StrTime
	.long	"??_C@_02NFKCNHOA@T?$CD?$AA@"
	.short	1347                            # 0x543
	.zero	2
	.long	_Literal_StrTime
	.long	"??_C@_04HCDDPBNL@TRUE?$AA@"
	.short	1536                            # 0x600
	.zero	2
	.long	_Literal_True
	.long	"??_C@_05MAJJAKPI@FALSE?$AA@"
	.short	1536                            # 0x600
	.zero	2
	.long	_Literal_False
	.long	"??_C@_08BOJGAEJE@STRING?$CD?8?$AA@"
	.short	1346                            # 0x542
	.zero	2
	.long	_Literal_String
	.long	"??_C@_05IMECLCOB@bool?$CD?$AA@"
	.short	1536                            # 0x600
	.zero	2
	.long	_Literal_Strbool
	.long	"??_C@_05JDIBLDJM@lint?$CD?$AA@"
	.short	263                             # 0x107
	.zero	2
	.long	_Literal_Strtoq
	.long	"??_C@_05HPNCDBPB@dint?$CD?$AA@"
	.short	262                             # 0x106
	.zero	2
	.long	_Literal_Strtol
	.long	"??_C@_04JLFHCKAD@int?$CD?$AA@"
	.short	261                             # 0x105
	.zero	2
	.long	_Literal_Strtoi
	.long	"??_C@_05GBABADNC@sint?$CD?$AA@"
	.short	260                             # 0x104
	.zero	2
	.long	_Literal_Strtos
	.long	"??_C@_06BHPDCMN@ulint?$CD?$AA@"
	.short	515                             # 0x203
	.zero	2
	.long	_Literal_Strtouq
	.long	"??_C@_06ONCMLAKA@udint?$CD?$AA@"
	.short	514                             # 0x202
	.zero	2
	.long	_Literal_Strtoul
	.long	"??_C@_05LHFIOAMP@uint?$CD?$AA@"
	.short	513                             # 0x201
	.zero	2
	.long	_Literal_Strtoui
	.long	"??_C@_06PDPPICID@usint?$CD?$AA@"
	.short	512                             # 0x200
	.zero	2
	.long	_Literal_Strtous
	.long	"??_C@_06BFIIFKHB@qword?$CD?$AA@"
	.short	19                              # 0x13
	.zero	2
	.long	_Literal_Strtouq
	.long	"??_C@_06CAGOOJBI@dword?$CD?$AA@"
	.short	18                              # 0x12
	.zero	2
	.long	_Literal_Strtoul
	.long	"??_C@_05HDDJPPDD@word?$CD?$AA@"
	.short	17                              # 0x11
	.zero	2
	.long	_Literal_Strtoui
	.long	"??_C@_05OLCLDLNC@byte?$CD?$AA@"
	.short	16                              # 0x10
	.zero	2
	.long	_Literal_Strtous
	.long	"??_C@_06EFEDIHKE@lreal?$CD?$AA@"
	.short	783                             # 0x30f
	.zero	2
	.long	_Literal_Strtod
	.long	"??_C@_05CFPLNPOI@real?$CD?$AA@"
	.short	782                             # 0x30e
	.zero	2
	.long	_Literal_Strtof
	.long	"??_C@_05HDFFFFMD@time?$CD?$AA@"
	.short	1347                            # 0x543
	.zero	2
	.long	_Literal_StrTime
	.long	"??_C@_02ONOPJBAA@t?$CD?$AA@"
	.short	1347                            # 0x543
	.zero	2
	.long	_Literal_StrTime
	.long	"??_C@_04LOAJBDKD@true?$AA@"
	.short	1536                            # 0x600
	.zero	2
	.long	_Literal_True
	.long	"??_C@_05LAPONLG@false?$AA@"
	.short	1536                            # 0x600
	.zero	2
	.long	_Literal_False
	.long	"??_C@_08MMPDFIPB@string?$CD?8?$AA@"
	.short	1346                            # 0x542
	.zero	2
	.long	_Literal_String
	.zero	12

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
	.addrsig_sym _Literal_StrTime
	.addrsig_sym _Literal_Strbool
	.addrsig_sym _Literal_Strtoq
	.addrsig_sym _Literal_Strtouq
	.addrsig_sym _Literal_Strtol
	.addrsig_sym _Literal_Strtoul
	.addrsig_sym _Literal_Strtoi
	.addrsig_sym _Literal_Strtoui
	.addrsig_sym _Literal_Strtos
	.addrsig_sym _Literal_Strtous
	.addrsig_sym _Literal_Strtod
	.addrsig_sym _Literal_Strtof
	.addrsig_sym _Literal_True
	.addrsig_sym _Literal_False
	.addrsig_sym _Literal_String
	.globl	__fltused
