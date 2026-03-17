	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"main.c"
	.def	_plcmain;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_plcmain                        # -- Begin function plcmain
	.p2align	4
_plcmain:                               # @plcmain
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %esi
	movl	16(%esp), %edi
	calll	_Heap_Clear
	calll	_Config_Init
	pushl	%edi
	pushl	%esi
	calll	_Argument_Init
	addl	$8, %esp
	calll	_INtime_ProcessInitialize
	calll	_SQTBL_Create
	calll	_Api_Init
	calll	_Pause_Init
	calll	_Step_Init
	calll	_Watchdog_Init
	calll	_Exception_Init
	calll	_Errorlog_Clear
	calll	_Poufile_Clear
	calll	_Config_Get_IniFilePath
	pushl	%eax
	calll	_IniFile_Load
	addl	$4, %esp
	pushl	%edi
	pushl	%esi
	calll	_Argument_Process
	addl	$8, %esp
	calll	_Container_Init
	calll	_INtime_ProcessCatalog
	calll	_ExitEvent_Init
	calll	_SQTBL_Initialize
	pushl	$"??_C@_0M@OKMJOFGL@PLCPIEC?4rsl?$AA@"
	calll	_Basicfunction_Load
	addl	$4, %esp
	pushl	$"??_C@_0L@NJCAICAP@PLCPEN?4rsl?$AA@"
	calll	_Functionblock_Load
	addl	$4, %esp
	pushl	$"??_C@_0L@JPAKFIOJ@PLCPFB?4rsl?$AA@"
	calll	_Functionblock_Load
	addl	$4, %esp
	calll	_Reservedword_CreateCatalog
	calll	_Engine_Init
	calll	_Logic_Clear
	calll	_Variable_Clear
	calll	_Label_Clear
	calll	_Config_Get_MnmFilePath
	cmpb	$0, (%eax)
	je	LBB0_2
# %bb.1:
	calll	_PLCcontrol_Download
	calll	_PLCcontrol_Swap
	calll	_PLCcontrol_ColdStart
LBB0_2:
	calll	_ExitEvent_Wait
	calll	_PLCcontrol_Stop
	pushl	$100
	calll	_RtSleep
	addl	$4, %esp
	calll	_INtime_ProcessFinalize
	calll	_Container_Finish
	xorl	%eax, %eax
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.section	.rdata,"dr",discard,"??_C@_0M@OKMJOFGL@PLCPIEC?4rsl?$AA@"
	.globl	"??_C@_0M@OKMJOFGL@PLCPIEC?4rsl?$AA@" # @"??_C@_0M@OKMJOFGL@PLCPIEC?4rsl?$AA@"
"??_C@_0M@OKMJOFGL@PLCPIEC?4rsl?$AA@":
	.asciz	"PLCPIEC.rsl"

	.section	.rdata,"dr",discard,"??_C@_0L@NJCAICAP@PLCPEN?4rsl?$AA@"
	.globl	"??_C@_0L@NJCAICAP@PLCPEN?4rsl?$AA@" # @"??_C@_0L@NJCAICAP@PLCPEN?4rsl?$AA@"
"??_C@_0L@NJCAICAP@PLCPEN?4rsl?$AA@":
	.asciz	"PLCPEN.rsl"

	.section	.rdata,"dr",discard,"??_C@_0L@JPAKFIOJ@PLCPFB?4rsl?$AA@"
	.globl	"??_C@_0L@JPAKFIOJ@PLCPFB?4rsl?$AA@" # @"??_C@_0L@JPAKFIOJ@PLCPFB?4rsl?$AA@"
"??_C@_0L@JPAKFIOJ@PLCPFB?4rsl?$AA@":
	.asciz	"PLCPFB.rsl"

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
