	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"argument.c"
	.def	_Argument_PathFromFolder;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Argument_PathFromFolder        # -- Begin function Argument_PathFromFolder
	.p2align	4
_Argument_PathFromFolder:               # @Argument_PathFromFolder
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$128, %esp
	movl	148(%esp), %esi
	movl	144(%esp), %ebx
	pushl	152(%esp)
	pushl	$0
	pushl	%esi
	calll	_memset
	addl	$12, %esp
	movl	%esp, %edi
	pushl	%ebx
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
	calll	_INtime_CheckDRTOS
	testb	%al, %al
	movl	$92, %eax
	movl	$47, %ecx
	cmovel	%eax, %ecx
	pushl	%ecx
	pushl	%edi
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB0_2
# %bb.1:
	movb	$0, 1(%eax)
	pushl	%edi
	pushl	%esi
	calll	_strcpy
	addl	$8, %esp
LBB0_2:
	addl	$128, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Argument_PathFromBase;
	.scl	2;
	.type	32;
	.endef
	.globl	_Argument_PathFromBase          # -- Begin function Argument_PathFromBase
	.p2align	4
_Argument_PathFromBase:                 # @Argument_PathFromBase
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$128, %esp
	movl	148(%esp), %edi
	movl	144(%esp), %esi
	pushl	152(%esp)
	pushl	$0
	pushl	%edi
	calll	_memset
	addl	$12, %esp
	movl	%esp, %ebx
	pushl	%esi
	pushl	%ebx
	calll	_strcpy
	addl	$8, %esp
	calll	_INtime_CheckDRTOS
	testb	%al, %al
	movl	$92, %eax
	movl	$47, %ecx
	cmovel	%eax, %ecx
	pushl	%ecx
	pushl	%ebx
	calll	_strrchr
	addl	$8, %esp
	movl	%eax, %esi
	pushl	$46
	pushl	%ebx
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB1_3
# %bb.1:
	movb	$0, (%eax)
	testl	%esi, %esi
	je	LBB1_3
# %bb.2:
	incl	%esi
	pushl	%esi
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
LBB1_3:
	addl	$128, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Argument_PouFiles;
	.scl	2;
	.type	32;
	.endef
	.globl	_Argument_PouFiles              # -- Begin function Argument_PouFiles
	.p2align	4
_Argument_PouFiles:                     # @Argument_PouFiles
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %edi
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	incl	%eax
	pushl	$"??_C@_0BC@NALIPHCK@Argument_PouFiles?$AA@"
	pushl	%eax
	calll	_Heap_Alloc
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB2_5
# %bb.1:
	movl	%eax, %esi
	pushl	%edi
	pushl	%eax
	calll	_strcpy
	addl	$8, %esp
	pushl	%esi
	calll	_String_Packing
	addl	$4, %esp
	pushl	$"??_C@_01IHBHIGKO@?0?$AA@"
	pushl	%esi
	calll	_strtok
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB2_4
# %bb.2:                                # %.preheader.preheader
	movl	%eax, %edi
	.p2align	4
LBB2_3:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%esi
	calll	_String_Unpacking
	addl	$4, %esp
	pushl	%edi
	calll	_Poufile_Add
	addl	$4, %esp
	pushl	$"??_C@_01IHBHIGKO@?0?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	movl	%eax, %edi
	testl	%eax, %eax
	jne	LBB2_3
LBB2_4:                                 # %.loopexit
	pushl	%esi
	calll	_Heap_Free
	addl	$4, %esp
LBB2_5:
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Argument_Init;
	.scl	2;
	.type	32;
	.endef
	.globl	_Argument_Init                  # -- Begin function Argument_Init
	.p2align	4
_Argument_Init:                         # @Argument_Init
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$384, %esp                      # imm = 0x180
	movl	408(%esp), %eax
	movl	(%eax), %eax
	xorps	%xmm0, %xmm0
	movups	%xmm0, 128(%esp)
	movups	%xmm0, 144(%esp)
	movups	%xmm0, 160(%esp)
	movups	%xmm0, 176(%esp)
	movups	%xmm0, 192(%esp)
	movups	%xmm0, 208(%esp)
	movups	%xmm0, 224(%esp)
	movups	%xmm0, 240(%esp)
	leal	256(%esp), %edi
	pushl	%eax
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
	calll	_INtime_CheckDRTOS
	testb	%al, %al
	movl	$92, %esi
	movl	$47, %ebp
	movl	$47, %eax
	cmovel	%esi, %eax
	pushl	%eax
	pushl	%edi
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB3_2
# %bb.1:
	movb	$0, 1(%eax)
	leal	128(%esp), %eax
	pushl	%edi
	pushl	%eax
	calll	_strcpy
	addl	$8, %esp
LBB3_2:
	leal	128(%esp), %ebx
	pushl	%ebx
	calll	_Config_Set_WorkFolder
	addl	$4, %esp
	pushl	%ebx
	calll	_Config_Set_RtaFolder
	addl	$4, %esp
	movl	408(%esp), %eax
	movl	(%eax), %eax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%esp)
	movups	%xmm0, 16(%esp)
	movups	%xmm0, 32(%esp)
	movups	%xmm0, 48(%esp)
	movups	%xmm0, 64(%esp)
	movups	%xmm0, 80(%esp)
	movups	%xmm0, 96(%esp)
	movups	%xmm0, 112(%esp)
	pushl	%eax
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
	calll	_INtime_CheckDRTOS
	testb	%al, %al
	cmovel	%esi, %ebp
	pushl	%ebp
	pushl	%edi
	calll	_strrchr
	addl	$8, %esp
	movl	%eax, %esi
	pushl	$46
	pushl	%edi
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB3_5
# %bb.3:
	movb	$0, (%eax)
	testl	%esi, %esi
	je	LBB3_5
# %bb.4:
	incl	%esi
	movl	%esp, %eax
	pushl	%esi
	pushl	%eax
	calll	_strcpy
	addl	$8, %esp
LBB3_5:
	movl	%esp, %esi
	pushl	%esi
	calll	_Config_Set_BaseName
	addl	$4, %esp
	pushl	%ebx
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
	pushl	%esi
	pushl	%edi
	calll	_strcat
	addl	$8, %esp
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	movl	$1096045102, 256(%esp,%eax)     # imm = 0x4154522E
	movb	$0, 260(%esp,%eax)
	pushl	%edi
	calll	_Config_Set_RtaFilePath
	addl	$4, %esp
	pushl	%ebx
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
	pushl	%esi
	pushl	%edi
	calll	_strcat
	addl	$8, %esp
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	movl	$1229867310, 256(%esp,%eax)     # imm = 0x494E492E
	movb	$0, 260(%esp,%eax)
	pushl	%edi
	calll	_Config_Set_IniFilePath
	addl	$4, %esp
	pushl	%ebx
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
	pushl	%edi
	calll	_Config_Set_RslFolder
	addl	$388, %esp                      # imm = 0x184
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Argument_Step;
	.scl	2;
	.type	32;
	.endef
	.globl	_Argument_Step                  # -- Begin function Argument_Step
	.p2align	4
_Argument_Step:                         # @Argument_Step
# %bb.0:
	pushl	$"??_C@_05CDJHHCF@?9STEP?$AA@"
	pushl	8(%esp)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB4_1
# %bb.2:
	retl
LBB4_1:
	pushl	$1
	calll	_Config_Set_StepMode
	addl	$4, %esp
	retl
                                        # -- End function
	.def	_Argument_NoPrint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Argument_NoPrint               # -- Begin function Argument_NoPrint
	.p2align	4
_Argument_NoPrint:                      # @Argument_NoPrint
# %bb.0:
	pushl	$"??_C@_08OIIOOAJL@?9NOPRINT?$AA@"
	pushl	8(%esp)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB5_1
# %bb.2:
	retl
LBB5_1:
	pushl	$0
	calll	_Config_Set_PrintMode
	addl	$4, %esp
	retl
                                        # -- End function
	.def	_Argument_Print;
	.scl	2;
	.type	32;
	.endef
	.globl	_Argument_Print                 # -- Begin function Argument_Print
	.p2align	4
_Argument_Print:                        # @Argument_Print
# %bb.0:
	pushl	$"??_C@_06MAGLMDKM@?9PRINT?$AA@"
	pushl	8(%esp)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB6_1
# %bb.2:
	retl
LBB6_1:
	pushl	$1
	calll	_Config_Set_PrintMode
	addl	$4, %esp
	retl
                                        # -- End function
	.def	_Argument_Remote;
	.scl	2;
	.type	32;
	.endef
	.globl	_Argument_Remote                # -- Begin function Argument_Remote
	.p2align	4
_Argument_Remote:                       # @Argument_Remote
# %bb.0:
	pushl	$"??_C@_07JGNONNOP@?9REMOTE?$AA@"
	pushl	8(%esp)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB7_1
# %bb.2:
	retl
LBB7_1:
	pushl	$1
	calll	_Config_Set_RemoteMode
	addl	$4, %esp
	retl
                                        # -- End function
	.def	_Argument_Priority;
	.scl	2;
	.type	32;
	.endef
	.globl	_Argument_Priority              # -- Begin function Argument_Priority
	.p2align	4
_Argument_Priority:                     # @Argument_Priority
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	pushl	$10
	pushl	$"??_C@_0L@JJOKJJEO@?9PRIORITY?1?$AA@"
	pushl	%esi
	calll	_strnicmp
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB8_1
# %bb.2:
	popl	%esi
	retl
LBB8_1:
	addl	$10, %esi
	pushl	%esi
	calll	_atoi
	addl	$4, %esp
	movzbl	%al, %eax
	pushl	%eax
	calll	_Config_Set_BasePriority
	addl	$4, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_Argument_ScanRate;
	.scl	2;
	.type	32;
	.endef
	.globl	_Argument_ScanRate              # -- Begin function Argument_ScanRate
	.p2align	4
_Argument_ScanRate:                     # @Argument_ScanRate
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	pushl	$10
	pushl	$"??_C@_0L@JJLIHFKL@?9SCANRATE?1?$AA@"
	pushl	%esi
	calll	_strnicmp
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB9_1
# %bb.2:
	popl	%esi
	retl
LBB9_1:
	addl	$10, %esi
	pushl	%esi
	calll	_atoi
	addl	$4, %esp
	pushl	%eax
	calll	_Config_Set_ScanFreq
	addl	$4, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_Argument_Intprt;
	.scl	2;
	.type	32;
	.endef
	.globl	_Argument_Intprt                # -- Begin function Argument_Intprt
	.p2align	4
_Argument_Intprt:                       # @Argument_Intprt
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$384, %esp                      # imm = 0x180
	movl	400(%esp), %esi
	pushl	$8
	pushl	$"??_C@_08PPAPKFEF@?9INTPRT?1?$AA@"
	pushl	%esi
	calll	_strnicmp
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB10_7
# %bb.1:
	pushl	$1
	calll	_Config_Set_RunMode
	addl	$4, %esp
	addl	$8, %esi
	pushl	%esi
	calll	_Config_Set_MnmFilePath
	addl	$4, %esp
	calll	_Config_Get_MnmFilePath
	xorps	%xmm0, %xmm0
	movups	%xmm0, 128(%esp)
	movups	%xmm0, 144(%esp)
	movups	%xmm0, 160(%esp)
	movups	%xmm0, 176(%esp)
	movups	%xmm0, 192(%esp)
	movups	%xmm0, 208(%esp)
	movups	%xmm0, 224(%esp)
	movups	%xmm0, 240(%esp)
	leal	256(%esp), %edi
	pushl	%eax
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
	calll	_INtime_CheckDRTOS
	testb	%al, %al
	movl	$92, %ebx
	movl	$47, %esi
	movl	$47, %eax
	cmovel	%ebx, %eax
	pushl	%eax
	pushl	%edi
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB10_3
# %bb.2:
	movb	$0, 1(%eax)
	leal	128(%esp), %eax
	pushl	%edi
	pushl	%eax
	calll	_strcpy
	addl	$8, %esp
LBB10_3:
	leal	128(%esp), %eax
	pushl	%eax
	calll	_Config_Set_WorkFolder
	addl	$4, %esp
	calll	_Config_Get_MnmFilePath
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%esp)
	movups	%xmm0, 16(%esp)
	movups	%xmm0, 32(%esp)
	movups	%xmm0, 48(%esp)
	movups	%xmm0, 64(%esp)
	movups	%xmm0, 80(%esp)
	movups	%xmm0, 96(%esp)
	movups	%xmm0, 112(%esp)
	pushl	%eax
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
	calll	_INtime_CheckDRTOS
	testb	%al, %al
	cmovel	%ebx, %esi
	pushl	%esi
	pushl	%edi
	calll	_strrchr
	addl	$8, %esp
	movl	%eax, %esi
	pushl	$46
	pushl	%edi
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB10_6
# %bb.4:
	movb	$0, (%eax)
	testl	%esi, %esi
	je	LBB10_6
# %bb.5:
	incl	%esi
	movl	%esp, %eax
	pushl	%esi
	pushl	%eax
	calll	_strcpy
	addl	$8, %esp
LBB10_6:
	movl	%esp, %eax
	pushl	%eax
	calll	_Config_Set_BaseName
	addl	$4, %esp
LBB10_7:
	addl	$384, %esp                      # imm = 0x180
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Argument_Pou;
	.scl	2;
	.type	32;
	.endef
	.globl	_Argument_Pou                   # -- Begin function Argument_Pou
	.p2align	4
_Argument_Pou:                          # @Argument_Pou
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	pushl	$5
	pushl	$"??_C@_05HGAABLCC@?9POU?1?$AA@"
	pushl	%esi
	calll	_strnicmp
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB11_1
# %bb.2:
	popl	%esi
	retl
LBB11_1:
	addl	$5, %esi
	pushl	%esi
	calll	_Argument_PouFiles
	addl	$4, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_Argument_Begin;
	.scl	2;
	.type	32;
	.endef
	.globl	_Argument_Begin                 # -- Begin function Argument_Begin
	.p2align	4
_Argument_Begin:                        # @Argument_Begin
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	pushl	$7
	pushl	$"??_C@_07BAHIKDNH@?9BEGIN?1?$AA@"
	pushl	%esi
	calll	_strnicmp
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB12_1
# %bb.2:
	popl	%esi
	retl
LBB12_1:
	addl	$7, %esi
	pushl	%esi
	calll	_Poufile_Set_Begin
	addl	$4, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_Argument_Final;
	.scl	2;
	.type	32;
	.endef
	.globl	_Argument_Final                 # -- Begin function Argument_Final
	.p2align	4
_Argument_Final:                        # @Argument_Final
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	pushl	$7
	pushl	$"??_C@_07FINFNJEP@?9FINAL?1?$AA@"
	pushl	%esi
	calll	_strnicmp
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB13_1
# %bb.2:
	popl	%esi
	retl
LBB13_1:
	addl	$7, %esi
	pushl	%esi
	calll	_Poufile_Set_Final
	addl	$4, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_Argument_Process;
	.scl	2;
	.type	32;
	.endef
	.globl	_Argument_Process               # -- Begin function Argument_Process
	.p2align	4
_Argument_Process:                      # @Argument_Process
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$512, %esp                      # imm = 0x200
	movl	532(%esp), %esi
	cmpl	$2, %esi
	jl	LBB14_21
# %bb.1:
	movl	$1, %ebp
	movl	%esp, %ebx
	movl	$4543567, %edi                  # imm = 0x45544F
	jmp	LBB14_2
	.p2align	4
LBB14_20:                               #   in Loop: Header=BB14_2 Depth=1
	incl	%ebp
	cmpl	%ebp, %esi
	je	LBB14_21
LBB14_2:                                # =>This Inner Loop Header: Depth=1
	movl	536(%esp), %eax
	pushl	(%eax,%ebp,4)
	pushl	%ebx
	calll	_strcpy
	addl	$8, %esp
	movl	(%esp), %eax
	movl	$1163154221, %ecx               # imm = 0x4554532D
	xorl	%ecx, %eax
	movzwl	4(%esp), %ecx
	xorl	$80, %ecx
	orl	%eax, %ecx
	jne	LBB14_4
# %bb.3:                                #   in Loop: Header=BB14_2 Depth=1
	pushl	$1
	calll	_Config_Set_StepMode
	addl	$4, %esp
LBB14_4:                                #   in Loop: Header=BB14_2 Depth=1
	pushl	$9
	pushl	$"??_C@_08OIIOOAJL@?9NOPRINT?$AA@"
	pushl	%ebx
	calll	_memcmp
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB14_6
# %bb.5:                                #   in Loop: Header=BB14_2 Depth=1
	pushl	$0
	calll	_Config_Set_PrintMode
	addl	$4, %esp
LBB14_6:                                #   in Loop: Header=BB14_2 Depth=1
	movl	(%esp), %eax
	movl	$1230131245, %ecx               # imm = 0x4952502D
	xorl	%ecx, %eax
	movl	3(%esp), %ecx
	movl	$5525065, %edx                  # imm = 0x544E49
	xorl	%edx, %ecx
	orl	%eax, %ecx
	jne	LBB14_8
# %bb.7:                                #   in Loop: Header=BB14_2 Depth=1
	pushl	$1
	calll	_Config_Set_PrintMode
	addl	$4, %esp
LBB14_8:                                #   in Loop: Header=BB14_2 Depth=1
	movl	(%esp), %eax
	movl	$1296388653, %ecx               # imm = 0x4D45522D
	xorl	%ecx, %eax
	movl	4(%esp), %ecx
	xorl	%edi, %ecx
	orl	%eax, %ecx
	jne	LBB14_10
# %bb.9:                                #   in Loop: Header=BB14_2 Depth=1
	pushl	$1
	calll	_Config_Set_RemoteMode
	addl	$4, %esp
LBB14_10:                               #   in Loop: Header=BB14_2 Depth=1
	pushl	$10
	pushl	$"??_C@_0L@JJOKJJEO@?9PRIORITY?1?$AA@"
	pushl	%ebx
	calll	_strnicmp
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB14_12
# %bb.11:                               #   in Loop: Header=BB14_2 Depth=1
	leal	10(%esp), %eax
	pushl	%eax
	calll	_atoi
	addl	$4, %esp
	movzbl	%al, %eax
	pushl	%eax
	calll	_Config_Set_BasePriority
	addl	$4, %esp
LBB14_12:                               #   in Loop: Header=BB14_2 Depth=1
	pushl	$10
	pushl	$"??_C@_0L@JJLIHFKL@?9SCANRATE?1?$AA@"
	pushl	%ebx
	calll	_strnicmp
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB14_14
# %bb.13:                               #   in Loop: Header=BB14_2 Depth=1
	leal	10(%esp), %eax
	pushl	%eax
	calll	_atoi
	addl	$4, %esp
	pushl	%eax
	calll	_Config_Set_ScanFreq
	addl	$4, %esp
LBB14_14:                               #   in Loop: Header=BB14_2 Depth=1
	pushl	%ebx
	calll	_Argument_Intprt
	addl	$4, %esp
	pushl	$5
	pushl	$"??_C@_05HGAABLCC@?9POU?1?$AA@"
	pushl	%ebx
	calll	_strnicmp
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB14_16
# %bb.15:                               #   in Loop: Header=BB14_2 Depth=1
	leal	5(%esp), %eax
	pushl	%eax
	calll	_Argument_PouFiles
	addl	$4, %esp
LBB14_16:                               #   in Loop: Header=BB14_2 Depth=1
	pushl	$7
	pushl	$"??_C@_07BAHIKDNH@?9BEGIN?1?$AA@"
	pushl	%ebx
	calll	_strnicmp
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB14_18
# %bb.17:                               #   in Loop: Header=BB14_2 Depth=1
	leal	7(%esp), %eax
	pushl	%eax
	calll	_Poufile_Set_Begin
	addl	$4, %esp
LBB14_18:                               #   in Loop: Header=BB14_2 Depth=1
	pushl	$7
	pushl	$"??_C@_07FINFNJEP@?9FINAL?1?$AA@"
	pushl	%ebx
	calll	_strnicmp
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB14_20
# %bb.19:                               #   in Loop: Header=BB14_2 Depth=1
	leal	7(%esp), %eax
	pushl	%eax
	calll	_Poufile_Set_Final
	addl	$4, %esp
	jmp	LBB14_20
LBB14_21:                               # %.loopexit
	addl	$512, %esp                      # imm = 0x200
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

	.section	.rdata,"dr",discard,"??_C@_0BC@NALIPHCK@Argument_PouFiles?$AA@"
	.globl	"??_C@_0BC@NALIPHCK@Argument_PouFiles?$AA@" # @"??_C@_0BC@NALIPHCK@Argument_PouFiles?$AA@"
"??_C@_0BC@NALIPHCK@Argument_PouFiles?$AA@":
	.asciz	"Argument_PouFiles"

	.section	.rdata,"dr",discard,"??_C@_01IHBHIGKO@?0?$AA@"
	.globl	"??_C@_01IHBHIGKO@?0?$AA@"      # @"??_C@_01IHBHIGKO@?0?$AA@"
"??_C@_01IHBHIGKO@?0?$AA@":
	.asciz	","

	.section	.rdata,"dr",discard,"??_C@_04KEPPKGIG@?4RTA?$AA@"
	.globl	"??_C@_04KEPPKGIG@?4RTA?$AA@"   # @"??_C@_04KEPPKGIG@?4RTA?$AA@"
"??_C@_04KEPPKGIG@?4RTA?$AA@":
	.asciz	".RTA"

	.section	.rdata,"dr",discard,"??_C@_04PKIPNKLG@?4INI?$AA@"
	.globl	"??_C@_04PKIPNKLG@?4INI?$AA@"   # @"??_C@_04PKIPNKLG@?4INI?$AA@"
"??_C@_04PKIPNKLG@?4INI?$AA@":
	.asciz	".INI"

	.section	.rdata,"dr",discard,"??_C@_05CDJHHCF@?9STEP?$AA@"
	.globl	"??_C@_05CDJHHCF@?9STEP?$AA@"   # @"??_C@_05CDJHHCF@?9STEP?$AA@"
"??_C@_05CDJHHCF@?9STEP?$AA@":
	.asciz	"-STEP"

	.section	.rdata,"dr",discard,"??_C@_08OIIOOAJL@?9NOPRINT?$AA@"
	.globl	"??_C@_08OIIOOAJL@?9NOPRINT?$AA@" # @"??_C@_08OIIOOAJL@?9NOPRINT?$AA@"
"??_C@_08OIIOOAJL@?9NOPRINT?$AA@":
	.asciz	"-NOPRINT"

	.section	.rdata,"dr",discard,"??_C@_06MAGLMDKM@?9PRINT?$AA@"
	.globl	"??_C@_06MAGLMDKM@?9PRINT?$AA@" # @"??_C@_06MAGLMDKM@?9PRINT?$AA@"
"??_C@_06MAGLMDKM@?9PRINT?$AA@":
	.asciz	"-PRINT"

	.section	.rdata,"dr",discard,"??_C@_07JGNONNOP@?9REMOTE?$AA@"
	.globl	"??_C@_07JGNONNOP@?9REMOTE?$AA@" # @"??_C@_07JGNONNOP@?9REMOTE?$AA@"
"??_C@_07JGNONNOP@?9REMOTE?$AA@":
	.asciz	"-REMOTE"

	.section	.rdata,"dr",discard,"??_C@_0L@JJOKJJEO@?9PRIORITY?1?$AA@"
	.globl	"??_C@_0L@JJOKJJEO@?9PRIORITY?1?$AA@" # @"??_C@_0L@JJOKJJEO@?9PRIORITY?1?$AA@"
"??_C@_0L@JJOKJJEO@?9PRIORITY?1?$AA@":
	.asciz	"-PRIORITY/"

	.section	.rdata,"dr",discard,"??_C@_0L@JJLIHFKL@?9SCANRATE?1?$AA@"
	.globl	"??_C@_0L@JJLIHFKL@?9SCANRATE?1?$AA@" # @"??_C@_0L@JJLIHFKL@?9SCANRATE?1?$AA@"
"??_C@_0L@JJLIHFKL@?9SCANRATE?1?$AA@":
	.asciz	"-SCANRATE/"

	.section	.rdata,"dr",discard,"??_C@_08PPAPKFEF@?9INTPRT?1?$AA@"
	.globl	"??_C@_08PPAPKFEF@?9INTPRT?1?$AA@" # @"??_C@_08PPAPKFEF@?9INTPRT?1?$AA@"
"??_C@_08PPAPKFEF@?9INTPRT?1?$AA@":
	.asciz	"-INTPRT/"

	.section	.rdata,"dr",discard,"??_C@_05HGAABLCC@?9POU?1?$AA@"
	.globl	"??_C@_05HGAABLCC@?9POU?1?$AA@" # @"??_C@_05HGAABLCC@?9POU?1?$AA@"
"??_C@_05HGAABLCC@?9POU?1?$AA@":
	.asciz	"-POU/"

	.section	.rdata,"dr",discard,"??_C@_07BAHIKDNH@?9BEGIN?1?$AA@"
	.globl	"??_C@_07BAHIKDNH@?9BEGIN?1?$AA@" # @"??_C@_07BAHIKDNH@?9BEGIN?1?$AA@"
"??_C@_07BAHIKDNH@?9BEGIN?1?$AA@":
	.asciz	"-BEGIN/"

	.section	.rdata,"dr",discard,"??_C@_07FINFNJEP@?9FINAL?1?$AA@"
	.globl	"??_C@_07FINFNJEP@?9FINAL?1?$AA@" # @"??_C@_07FINFNJEP@?9FINAL?1?$AA@"
"??_C@_07FINFNJEP@?9FINAL?1?$AA@":
	.asciz	"-FINAL/"

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
