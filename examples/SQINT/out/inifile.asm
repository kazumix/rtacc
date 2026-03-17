	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"inifile.c"
	.def	_IniFile_Open;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_IniFile_Open                   # -- Begin function IniFile_Open
	.p2align	4
_IniFile_Open:                          # @IniFile_Open
# %bb.0:
	pushl	$"??_C@_02BMJICGCB@rt?$AA@"
	pushl	8(%esp)
	calll	_fopen
	addl	$8, %esp
	movl	%eax, _IniFile_Open.fp
	retl
                                        # -- End function
	.def	_IniFile_Close;
	.scl	2;
	.type	32;
	.endef
	.globl	_IniFile_Close                  # -- Begin function IniFile_Close
	.p2align	4
_IniFile_Close:                         # @IniFile_Close
# %bb.0:
	movl	4(%esp), %eax
	testl	%eax, %eax
	je	LBB1_2
# %bb.1:
	pushl	%eax
	calll	_fclose
	addl	$4, %esp
LBB1_2:
	movl	$2, _status_inifile
	retl
                                        # -- End function
	.def	_IniFile_GetLine;
	.scl	2;
	.type	32;
	.endef
	.globl	_IniFile_GetLine                # -- Begin function IniFile_GetLine
	.p2align	4
_IniFile_GetLine:                       # @IniFile_GetLine
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
	.def	_IniFile_TrimLine;
	.scl	2;
	.type	32;
	.endef
	.globl	_IniFile_TrimLine               # -- Begin function IniFile_TrimLine
	.p2align	4
_IniFile_TrimLine:                      # @IniFile_TrimLine
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	pushl	$59
	pushl	%esi
	calll	_strchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB3_2
# %bb.1:
	movb	$0, (%eax)
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
	popl	%esi
	retl
                                        # -- End function
	.def	_IniFile_GetProfileString;
	.scl	2;
	.type	32;
	.endef
	.globl	_IniFile_GetProfileString       # -- Begin function IniFile_GetProfileString
	.p2align	4
_IniFile_GetProfileString:              # @IniFile_GetProfileString
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$128, %esp
	movl	160(%esp), %esi
	movl	156(%esp), %edi
	movl	144(%esp), %ecx
	testl	%ecx, %ecx
	je	LBB4_1
# %bb.2:
	movl	148(%esp), %edx
	movl	%esp, %ebx
	pushl	%ebx
	pushl	156(%esp)
	calll	_LowlevelGetProfileString
	addl	$8, %esp
	testb	%al, %al
	je	LBB4_4
# %bb.3:
	pushl	%edi
	jmp	LBB4_5
LBB4_1:
	pushl	%edi
	pushl	%esi
	calll	_strcpy
	addl	$8, %esp
	pushl	%esi
	calll	_strlen
	addl	$132, %esp
	jmp	LBB4_6
LBB4_4:
	pushl	%ebx
LBB4_5:
	pushl	%esi
	calll	_strcpy
	addl	$8, %esp
	pushl	%esi
	calll	_strlen
	addl	$4, %esp
	addl	$128, %esp
LBB4_6:
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_LowlevelGetProfileString;
	.scl	3;
	.type	32;
	.endef
	.p2align	4                               # -- Begin function LowlevelGetProfileString
_LowlevelGetProfileString:              # @LowlevelGetProfileString
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$396, %esp                      # imm = 0x18C
	movl	%edx, 4(%esp)                   # 4-byte Spill
	movl	%ecx, %edi
	movl	420(%esp), %esi
	pushl	$0
	pushl	$0
	pushl	%ecx
	calll	_fseek
	addl	$12, %esp
	movb	$0, (%esi)
	movb	$0, 268(%esp)
	movb	$0, 2(%esp)
	movw	$2336, (%esp)                   # imm = 0x920
	movb	$0, 12(%esp)
	leal	140(%esp), %ebp
	movl	%edi, 8(%esp)                   # 4-byte Spill
	pushl	%edi
	pushl	$127
	pushl	%ebp
	calll	_fgets
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB5_14
# %bb.1:
	leal	12(%esp), %edi
	jmp	LBB5_2
LBB5_12:                                #   in Loop: Header=BB5_2 Depth=1
	pushl	%edi
	leal	272(%esp), %eax
	pushl	%eax
	calll	_strcpy
	addl	$8, %esp
	.p2align	4
LBB5_13:                                #   in Loop: Header=BB5_2 Depth=1
	movb	$0, 2(%esp)
	movw	$2336, (%esp)                   # imm = 0x920
	movb	$0, 12(%esp)
	pushl	8(%esp)                         # 4-byte Folded Reload
	pushl	$127
	pushl	%ebp
	calll	_fgets
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB5_14
LBB5_2:                                 # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_5 Depth 2
	movb	$0, 267(%esp)
	pushl	$L___const.SectionAndKey_get.dlm1
	pushl	%ebp
	calll	_strcspn
	addl	$8, %esp
	movb	$0, 140(%esp,%eax)
	pushl	%ebp
	calll	_strlen
	addl	$4, %esp
	testl	%eax, %eax
	je	LBB5_3
# %bb.4:                                # %.preheader.preheader
                                        #   in Loop: Header=BB5_2 Depth=1
	movl	%eax, %esi
	xorl	%edi, %edi
	xorl	%ebp, %ebp
	jmp	LBB5_5
	.p2align	4
LBB5_7:                                 #   in Loop: Header=BB5_5 Depth=2
	incl	%ebp
	movzwl	%bp, %eax
	cmpl	%eax, %esi
	jbe	LBB5_8
LBB5_5:                                 # %.preheader
                                        #   Parent Loop BB5_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsbl	140(%esp,%ebp), %ebx
	pushl	%ebx
	leal	4(%esp), %eax
	pushl	%eax
	calll	_strchr
	addl	$8, %esp
	testl	%eax, %eax
	jne	LBB5_7
# %bb.6:                                #   in Loop: Header=BB5_5 Depth=2
	movzwl	%di, %eax
	incl	%edi
	movb	%bl, 12(%esp,%eax)
                                        # kill: def $di killed $di killed $edi def $edi
	jmp	LBB5_7
	.p2align	4
LBB5_8:                                 #   in Loop: Header=BB5_2 Depth=1
	movzwl	%di, %eax
	leal	140(%esp), %ebp
	leal	12(%esp), %edi
	jmp	LBB5_9
	.p2align	4
LBB5_3:                                 #   in Loop: Header=BB5_2 Depth=1
	xorl	%eax, %eax
LBB5_9:                                 #   in Loop: Header=BB5_2 Depth=1
	movb	$0, 12(%esp,%eax)
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	cmpl	$3, %eax
	jb	LBB5_13
# %bb.10:                               #   in Loop: Header=BB5_2 Depth=1
	cmpb	$91, 12(%esp)
	jne	LBB5_15
# %bb.11:                               #   in Loop: Header=BB5_2 Depth=1
	cmpb	$93, 11(%esp,%eax)
	je	LBB5_12
LBB5_15:                                #   in Loop: Header=BB5_2 Depth=1
	pushl	4(%esp)                         # 4-byte Folded Reload
	leal	272(%esp), %eax
	pushl	%eax
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	jne	LBB5_13
# %bb.16:                               #   in Loop: Header=BB5_2 Depth=1
	pushl	416(%esp)
	pushl	%edi
	calll	_strstr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB5_13
# %bb.17:                               #   in Loop: Header=BB5_2 Depth=1
	movl	%eax, %ebx
	pushl	416(%esp)
	calll	_strlen
	addl	$4, %esp
	cmpb	$61, (%ebx,%eax)
	jne	LBB5_13
# %bb.18:
	addl	%ebx, %eax
	incl	%eax
	pushl	%eax
	pushl	424(%esp)
	calll	_strcpy
	addl	$8, %esp
	xorl	%eax, %eax
	jmp	LBB5_19
LBB5_14:                                # %.loopexit
	movb	$-1, %al
LBB5_19:
                                        # kill: def $al killed $al killed $eax
	addl	$396, %esp                      # imm = 0x18C
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_IniFile_GetProfileInt;
	.scl	2;
	.type	32;
	.endef
	.globl	_IniFile_GetProfileInt          # -- Begin function IniFile_GetProfileInt
	.p2align	4
_IniFile_GetProfileInt:                 # @IniFile_GetProfileInt
# %bb.0:
	pushl	%edi
	pushl	%esi
	subl	$128, %esp
	movl	152(%esp), %esi
	movl	140(%esp), %ecx
	testl	%ecx, %ecx
	je	LBB6_3
# %bb.1:
	movl	144(%esp), %edx
	movl	%esp, %edi
	pushl	%edi
	pushl	152(%esp)
	calll	_LowlevelGetProfileString
	addl	$8, %esp
	testb	%al, %al
	jne	LBB6_3
# %bb.2:
	pushl	%edi
	calll	_atoi
	addl	$4, %esp
	movl	%eax, %esi
LBB6_3:
	movl	%esi, %eax
	addl	$128, %esp
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_IniFile_SeekSection;
	.scl	2;
	.type	32;
	.endef
	.globl	_IniFile_SeekSection            # -- Begin function IniFile_SeekSection
	.p2align	4
_IniFile_SeekSection:                   # @IniFile_SeekSection
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$128, %esp
	movl	148(%esp), %edi
	pushl	$0
	pushl	$0
	pushl	%edi
	calll	_fseek
	addl	$12, %esp
	testl	%edi, %edi
	je	LBB7_9
# %bb.1:                                # %.preheader.preheader
	movl	152(%esp), %ebx
	movl	%esp, %ebp
	xorl	%esi, %esi
	jmp	LBB7_3
	.p2align	4
LBB7_2:                                 #   in Loop: Header=BB7_3 Depth=1
	pushl	%ebx
	pushl	%ebp
	calll	_strcmp
	addl	$8, %esp
	incl	%esi
	testl	%eax, %eax
	je	LBB7_10
LBB7_3:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%edi
	pushl	$128
	pushl	%ebp
	calll	_fgets
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB7_9
# %bb.4:                                #   in Loop: Header=BB7_3 Depth=1
	pushl	$59
	pushl	%ebp
	calll	_strchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB7_6
# %bb.5:                                #   in Loop: Header=BB7_3 Depth=1
	movb	$0, (%eax)
LBB7_6:                                 #   in Loop: Header=BB7_3 Depth=1
	pushl	$10
	pushl	%ebp
	calll	_strchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB7_2
# %bb.7:                                #   in Loop: Header=BB7_3 Depth=1
	movb	$0, (%eax)
	jmp	LBB7_2
LBB7_9:
	xorl	%esi, %esi
LBB7_10:                                # %.loopexit
	movl	%esi, %eax
	addl	$128, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_IniFile_PargeTimer;
	.scl	2;
	.type	32;
	.endef
	.globl	_IniFile_PargeTimer             # -- Begin function IniFile_PargeTimer
	.p2align	4
_IniFile_PargeTimer:                    # @IniFile_PargeTimer
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	28(%esp), %esi
	movl	24(%esp), %edi
	movl	20(%esp), %ebx
	pushl	$"??_C@_03GEMDPLAE@?$DN?6?$AN?$AA@"
	pushl	20(%esp)
	calll	_strtok
	addl	$8, %esp
	movl	%eax, (%ebx)
	pushl	$"??_C@_03PJBEMDLN@?3?6?$AN?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	movl	%eax, (%edi)
	pushl	$"??_C@_02LIIHNNHG@?6?$AN?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	movl	%eax, (%esi)
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_IniFile_Load;
	.scl	2;
	.type	32;
	.endef
	.globl	_IniFile_Load                   # -- Begin function IniFile_Load
	.p2align	4
_IniFile_Load:                          # @IniFile_Load
# %bb.0:
	pushl	%edi
	pushl	%esi
	subl	$128, %esp
	pushl	$"??_C@_02BMJICGCB@rt?$AA@"
	pushl	144(%esp)
	calll	_fopen
	addl	$8, %esp
	movl	%eax, _IniFile_Open.fp
	testl	%eax, %eax
	je	LBB9_11
# %bb.1:
	movl	%eax, %esi
	movl	%esp, %edi
	movl	%eax, %ecx
	movl	$L___const.IniFile_Load.cTabGlobal, %edx
	pushl	%edi
	pushl	$"??_C@_08PHDJDNOC@PRIORITY?$AA@"
	calll	_LowlevelGetProfileString
	addl	$8, %esp
	movl	%eax, %ecx
	movb	$-116, %al
	testb	%cl, %cl
	jne	LBB9_3
# %bb.2:
	pushl	%edi
	calll	_atoi
	addl	$4, %esp
LBB9_3:
	movzbl	%al, %eax
	pushl	%eax
	calll	_Config_Set_BasePriority
	addl	$4, %esp
	movl	%esi, %ecx
	movl	$L___const.IniFile_Load.cTabGlobal, %edx
	pushl	%edi
	pushl	$"??_C@_08KFNFNIOC@SCANRATE?$AA@"
	calll	_LowlevelGetProfileString
	addl	$8, %esp
	movl	%eax, %ecx
	movl	$1000, %eax                     # imm = 0x3E8
	testb	%cl, %cl
	jne	LBB9_5
# %bb.4:
	pushl	%edi
	calll	_atoi
	addl	$4, %esp
LBB9_5:
	pushl	%eax
	calll	_Config_Set_ScanFreq
	addl	$4, %esp
	movl	%esi, %ecx
	movl	$L___const.IniFile_Load.cTabGlobal, %edx
	pushl	%edi
	pushl	$"??_C@_07FCKKGCNH@OVERRUN?$AA@"
	calll	_LowlevelGetProfileString
	addl	$8, %esp
	movl	%eax, %ecx
	xorl	%eax, %eax
	testb	%cl, %cl
	jne	LBB9_7
# %bb.6:
	pushl	%edi
	calll	_atoi
	addl	$4, %esp
LBB9_7:
	pushl	%eax
	calll	_Config_Set_Overrun
	addl	$4, %esp
	movl	%esi, %ecx
	movl	$L___const.IniFile_Load.cTabGlobal, %edx
	pushl	%edi
	pushl	$"??_C@_07BIBLEOKI@NOPRINT?$AA@"
	calll	_LowlevelGetProfileString
	addl	$8, %esp
	testb	%al, %al
	jne	LBB9_10
# %bb.8:
	pushl	%edi
	calll	_atoi
	addl	$4, %esp
	testl	%eax, %eax
	je	LBB9_10
# %bb.9:
	pushl	$0
	calll	_Config_Set_PrintMode
	addl	$4, %esp
LBB9_10:
	movl	%esi, %ecx
	movl	$L___const.IniFile_Load.cTabGlobal, %edx
	pushl	%edi
	pushl	$"??_C@_0L@DHMCEGLJ@IODRV_PATH?$AA@"
	calll	_LowlevelGetProfileString
	addl	$8, %esp
	pushl	%esi
	calll	_fclose
	addl	$4, %esp
	movl	$2, _status_inifile
LBB9_11:
	xorl	%eax, %eax
	addl	$128, %esp
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
	.globl	_status_inifile                 # @status_inifile
	.p2align	2, 0x0
_status_inifile:
	.long	0                               # 0x0

	.lcomm	_IniFile_Open.fp,4,4            # @IniFile_Open.fp
	.section	.rdata,"dr",discard,"??_C@_02BMJICGCB@rt?$AA@"
	.globl	"??_C@_02BMJICGCB@rt?$AA@"      # @"??_C@_02BMJICGCB@rt?$AA@"
"??_C@_02BMJICGCB@rt?$AA@":
	.asciz	"rt"

	.section	.rdata,"dr",discard,"??_C@_03GEMDPLAE@?$DN?6?$AN?$AA@"
	.globl	"??_C@_03GEMDPLAE@?$DN?6?$AN?$AA@" # @"??_C@_03GEMDPLAE@?$DN?6?$AN?$AA@"
"??_C@_03GEMDPLAE@?$DN?6?$AN?$AA@":
	.asciz	"=\n\r"

	.section	.rdata,"dr",discard,"??_C@_03PJBEMDLN@?3?6?$AN?$AA@"
	.globl	"??_C@_03PJBEMDLN@?3?6?$AN?$AA@" # @"??_C@_03PJBEMDLN@?3?6?$AN?$AA@"
"??_C@_03PJBEMDLN@?3?6?$AN?$AA@":
	.asciz	":\n\r"

	.section	.rdata,"dr",discard,"??_C@_02LIIHNNHG@?6?$AN?$AA@"
	.globl	"??_C@_02LIIHNNHG@?6?$AN?$AA@"  # @"??_C@_02LIIHNNHG@?6?$AN?$AA@"
"??_C@_02LIIHNNHG@?6?$AN?$AA@":
	.asciz	"\n\r"

	.section	.rdata,"dr"
L___const.IniFile_Load.cTabGlobal:      # @__const.IniFile_Load.cTabGlobal
	.asciz	"[PLC_SETTING]"

	.section	.rdata,"dr",discard,"??_C@_08PHDJDNOC@PRIORITY?$AA@"
	.globl	"??_C@_08PHDJDNOC@PRIORITY?$AA@" # @"??_C@_08PHDJDNOC@PRIORITY?$AA@"
"??_C@_08PHDJDNOC@PRIORITY?$AA@":
	.asciz	"PRIORITY"

	.section	.rdata,"dr",discard,"??_C@_08KFNFNIOC@SCANRATE?$AA@"
	.globl	"??_C@_08KFNFNIOC@SCANRATE?$AA@" # @"??_C@_08KFNFNIOC@SCANRATE?$AA@"
"??_C@_08KFNFNIOC@SCANRATE?$AA@":
	.asciz	"SCANRATE"

	.section	.rdata,"dr",discard,"??_C@_07FCKKGCNH@OVERRUN?$AA@"
	.globl	"??_C@_07FCKKGCNH@OVERRUN?$AA@" # @"??_C@_07FCKKGCNH@OVERRUN?$AA@"
"??_C@_07FCKKGCNH@OVERRUN?$AA@":
	.asciz	"OVERRUN"

	.section	.rdata,"dr",discard,"??_C@_07BIBLEOKI@NOPRINT?$AA@"
	.globl	"??_C@_07BIBLEOKI@NOPRINT?$AA@" # @"??_C@_07BIBLEOKI@NOPRINT?$AA@"
"??_C@_07BIBLEOKI@NOPRINT?$AA@":
	.asciz	"NOPRINT"

	.section	.rdata,"dr",discard,"??_C@_0L@DHMCEGLJ@IODRV_PATH?$AA@"
	.globl	"??_C@_0L@DHMCEGLJ@IODRV_PATH?$AA@" # @"??_C@_0L@DHMCEGLJ@IODRV_PATH?$AA@"
"??_C@_0L@DHMCEGLJ@IODRV_PATH?$AA@":
	.asciz	"IODRV_PATH"

	.section	.rdata,"dr"
L___const.SectionAndKey_get.dlm1:       # @__const.SectionAndKey_get.dlm1
	.asciz	"\n\r;#"

L___const.SectionAndKey_get.dlm3:       # @__const.SectionAndKey_get.dlm3
	.asciz	" \t"

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
