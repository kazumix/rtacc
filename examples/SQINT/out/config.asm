	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"config.c"
	.def	_Config_Init;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Config_Init                    # -- Begin function Config_Init
	.p2align	4
_Config_Init:                           # @Config_Init
# %bb.0:
	movb	$0, _bStepMode
	movb	$1, _bPrintMode
	movb	$0, _bRemote
	movb	$0, _bTraceMode
	movb	$0, _byRunMode
	movb	$-116, _bBasePriority
	movl	$1000, _dwScanFreq              # imm = 0x3E8
	movl	$0, _dwOverRunCnt
	movb	$0, _WorkFolder
	movb	$0, _BaseName
	movb	$0, _RslFolder
	movb	$0, _RtaFolder
	movb	$0, _RtaFilePath
	movb	$0, _MnmFilePath
	movl	$1699899205, _IniFilePath       # imm = 0x65526745
	movl	$1852399988, _IniFilePath+4     # imm = 0x6E696174
	movl	$825241695, _IniFilePath+8      # imm = 0x3130305F
	movb	$0, _IniFilePath+12
	retl
                                        # -- End function
	.def	_Config_Set_StepMode;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Set_StepMode            # -- Begin function Config_Set_StepMode
	.p2align	4
_Config_Set_StepMode:                   # @Config_Set_StepMode
# %bb.0:
	movzbl	4(%esp), %eax
	movb	%al, _bStepMode
	retl
                                        # -- End function
	.def	_Config_Set_PrintMode;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Set_PrintMode           # -- Begin function Config_Set_PrintMode
	.p2align	4
_Config_Set_PrintMode:                  # @Config_Set_PrintMode
# %bb.0:
	movzbl	4(%esp), %eax
	movb	%al, _bPrintMode
	retl
                                        # -- End function
	.def	_Config_Set_RemoteMode;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Set_RemoteMode          # -- Begin function Config_Set_RemoteMode
	.p2align	4
_Config_Set_RemoteMode:                 # @Config_Set_RemoteMode
# %bb.0:
	movzbl	4(%esp), %eax
	movb	%al, _bRemote
	retl
                                        # -- End function
	.def	_Config_Set_TraceMode;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Set_TraceMode           # -- Begin function Config_Set_TraceMode
	.p2align	4
_Config_Set_TraceMode:                  # @Config_Set_TraceMode
# %bb.0:
	movzbl	4(%esp), %eax
	movb	%al, _bTraceMode
	retl
                                        # -- End function
	.def	_Config_Set_RunMode;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Set_RunMode             # -- Begin function Config_Set_RunMode
	.p2align	4
_Config_Set_RunMode:                    # @Config_Set_RunMode
# %bb.0:
	movzbl	4(%esp), %eax
	movb	%al, _byRunMode
	retl
                                        # -- End function
	.def	_Config_Set_BasePriority;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Set_BasePriority        # -- Begin function Config_Set_BasePriority
	.p2align	4
_Config_Set_BasePriority:               # @Config_Set_BasePriority
# %bb.0:
	movzbl	4(%esp), %eax
	movb	%al, _bBasePriority
	retl
                                        # -- End function
	.def	_Config_Set_ScanFreq;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Set_ScanFreq            # -- Begin function Config_Set_ScanFreq
	.p2align	4
_Config_Set_ScanFreq:                   # @Config_Set_ScanFreq
# %bb.0:
	movl	4(%esp), %eax
	movl	%eax, _dwScanFreq
	retl
                                        # -- End function
	.def	_Config_Set_Overrun;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Set_Overrun             # -- Begin function Config_Set_Overrun
	.p2align	4
_Config_Set_Overrun:                    # @Config_Set_Overrun
# %bb.0:
	movl	4(%esp), %eax
	movl	%eax, _dwOverRunCnt
	retl
                                        # -- End function
	.def	_Config_Set_WorkFolder;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Set_WorkFolder          # -- Begin function Config_Set_WorkFolder
	.p2align	4
_Config_Set_WorkFolder:                 # @Config_Set_WorkFolder
# %bb.0:
	pushl	4(%esp)
	pushl	$_WorkFolder
	calll	_strcpy
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_Config_Set_BaseName;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Set_BaseName            # -- Begin function Config_Set_BaseName
	.p2align	4
_Config_Set_BaseName:                   # @Config_Set_BaseName
# %bb.0:
	pushl	4(%esp)
	pushl	$_BaseName
	calll	_strcpy
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_Config_Set_RslFolder;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Set_RslFolder           # -- Begin function Config_Set_RslFolder
	.p2align	4
_Config_Set_RslFolder:                  # @Config_Set_RslFolder
# %bb.0:
	pushl	4(%esp)
	pushl	$_RslFolder
	calll	_strcpy
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_Config_Set_RtaFolder;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Set_RtaFolder           # -- Begin function Config_Set_RtaFolder
	.p2align	4
_Config_Set_RtaFolder:                  # @Config_Set_RtaFolder
# %bb.0:
	pushl	4(%esp)
	pushl	$_RtaFolder
	calll	_strcpy
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_Config_Set_RtaFilePath;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Set_RtaFilePath         # -- Begin function Config_Set_RtaFilePath
	.p2align	4
_Config_Set_RtaFilePath:                # @Config_Set_RtaFilePath
# %bb.0:
	pushl	4(%esp)
	pushl	$_RtaFilePath
	calll	_strcpy
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_Config_Set_IniFilePath;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Set_IniFilePath         # -- Begin function Config_Set_IniFilePath
	.p2align	4
_Config_Set_IniFilePath:                # @Config_Set_IniFilePath
# %bb.0:
	pushl	4(%esp)
	pushl	$_IniFilePath
	calll	_strcpy
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_Config_Set_MnmFilePath;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Set_MnmFilePath         # -- Begin function Config_Set_MnmFilePath
	.p2align	4
_Config_Set_MnmFilePath:                # @Config_Set_MnmFilePath
# %bb.0:
	pushl	4(%esp)
	pushl	$_MnmFilePath
	calll	_strcpy
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_Config_Set_RetainInstName;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Set_RetainInstName      # -- Begin function Config_Set_RetainInstName
	.p2align	4
_Config_Set_RetainInstName:             # @Config_Set_RetainInstName
# %bb.0:
	pushl	4(%esp)
	pushl	$_IniFilePath
	calll	_strcpy
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_Config_Get_StepMode;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Get_StepMode            # -- Begin function Config_Get_StepMode
	.p2align	4
_Config_Get_StepMode:                   # @Config_Get_StepMode
# %bb.0:
	movzbl	_bStepMode, %eax
	retl
                                        # -- End function
	.def	_Config_Get_PrintMode;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Get_PrintMode           # -- Begin function Config_Get_PrintMode
	.p2align	4
_Config_Get_PrintMode:                  # @Config_Get_PrintMode
# %bb.0:
	movzbl	_bPrintMode, %eax
	retl
                                        # -- End function
	.def	_Config_Get_RemoteMode;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Get_RemoteMode          # -- Begin function Config_Get_RemoteMode
	.p2align	4
_Config_Get_RemoteMode:                 # @Config_Get_RemoteMode
# %bb.0:
	movzbl	_bRemote, %eax
	retl
                                        # -- End function
	.def	_Config_Get_TraceMode;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Get_TraceMode           # -- Begin function Config_Get_TraceMode
	.p2align	4
_Config_Get_TraceMode:                  # @Config_Get_TraceMode
# %bb.0:
	movzbl	_bTraceMode, %eax
	retl
                                        # -- End function
	.def	_Config_Get_RunMode;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Get_RunMode             # -- Begin function Config_Get_RunMode
	.p2align	4
_Config_Get_RunMode:                    # @Config_Get_RunMode
# %bb.0:
	movzbl	_byRunMode, %eax
	retl
                                        # -- End function
	.def	_Config_Get_BasePriority;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Get_BasePriority        # -- Begin function Config_Get_BasePriority
	.p2align	4
_Config_Get_BasePriority:               # @Config_Get_BasePriority
# %bb.0:
	movzbl	_bBasePriority, %eax
	retl
                                        # -- End function
	.def	_Config_Get_ScanFreq;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Get_ScanFreq            # -- Begin function Config_Get_ScanFreq
	.p2align	4
_Config_Get_ScanFreq:                   # @Config_Get_ScanFreq
# %bb.0:
	movl	_dwScanFreq, %eax
	retl
                                        # -- End function
	.def	_Config_Get_Overrun;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Get_Overrun             # -- Begin function Config_Get_Overrun
	.p2align	4
_Config_Get_Overrun:                    # @Config_Get_Overrun
# %bb.0:
	movl	_dwOverRunCnt, %eax
	retl
                                        # -- End function
	.def	_Config_Get_WorkFolder;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Get_WorkFolder          # -- Begin function Config_Get_WorkFolder
	.p2align	4
_Config_Get_WorkFolder:                 # @Config_Get_WorkFolder
# %bb.0:
	movl	$_WorkFolder, %eax
	retl
                                        # -- End function
	.def	_Config_Get_BaseName;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Get_BaseName            # -- Begin function Config_Get_BaseName
	.p2align	4
_Config_Get_BaseName:                   # @Config_Get_BaseName
# %bb.0:
	movl	$_BaseName, %eax
	retl
                                        # -- End function
	.def	_Config_Get_RslFolder;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Get_RslFolder           # -- Begin function Config_Get_RslFolder
	.p2align	4
_Config_Get_RslFolder:                  # @Config_Get_RslFolder
# %bb.0:
	movl	$_RslFolder, %eax
	retl
                                        # -- End function
	.def	_Config_Get_RslFolder_Default;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Get_RslFolder_Default   # -- Begin function Config_Get_RslFolder_Default
	.p2align	4
_Config_Get_RslFolder_Default:          # @Config_Get_RslFolder_Default
# %bb.0:
	calll	_INtime_CheckDRTOS
	testw	%ax, %ax
	movl	$"??_C@_09OABCBDAM@C?3?2INplc?2?$AA@", %ecx
	movl	$"??_C@_01KMDKNFGN@?1?$AA@", %eax
	cmovel	%ecx, %eax
	retl
                                        # -- End function
	.def	_Config_Get_RtaFolder;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Get_RtaFolder           # -- Begin function Config_Get_RtaFolder
	.p2align	4
_Config_Get_RtaFolder:                  # @Config_Get_RtaFolder
# %bb.0:
	movl	$_RtaFolder, %eax
	retl
                                        # -- End function
	.def	_Config_Get_RtaFilePath;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Get_RtaFilePath         # -- Begin function Config_Get_RtaFilePath
	.p2align	4
_Config_Get_RtaFilePath:                # @Config_Get_RtaFilePath
# %bb.0:
	movl	$_RtaFilePath, %eax
	retl
                                        # -- End function
	.def	_Config_Get_IniFilePath;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Get_IniFilePath         # -- Begin function Config_Get_IniFilePath
	.p2align	4
_Config_Get_IniFilePath:                # @Config_Get_IniFilePath
# %bb.0:
	movl	$_IniFilePath, %eax
	retl
                                        # -- End function
	.def	_Config_Get_MnmFilePath;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Get_MnmFilePath         # -- Begin function Config_Get_MnmFilePath
	.p2align	4
_Config_Get_MnmFilePath:                # @Config_Get_MnmFilePath
# %bb.0:
	movl	$_MnmFilePath, %eax
	retl
                                        # -- End function
	.def	_Config_Get_RetainInstName;
	.scl	2;
	.type	32;
	.endef
	.globl	_Config_Get_RetainInstName      # -- Begin function Config_Get_RetainInstName
	.p2align	4
_Config_Get_RetainInstName:             # @Config_Get_RetainInstName
# %bb.0:
	movl	$_RetainInstName, %eax
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_bStepMode                      # @bStepMode
_bStepMode:
	.byte	0                               # 0x0

	.data
	.globl	_bPrintMode                     # @bPrintMode
_bPrintMode:
	.byte	1                               # 0x1

	.bss
	.globl	_bRemote                        # @bRemote
_bRemote:
	.byte	0                               # 0x0

	.globl	_bTraceMode                     # @bTraceMode
_bTraceMode:
	.byte	0                               # 0x0

	.globl	_byRunMode                      # @byRunMode
_byRunMode:
	.byte	0                               # 0x0

	.globl	_bBasePriority                  # @bBasePriority
_bBasePriority:
	.byte	0                               # 0x0

	.globl	_dwScanFreq                     # @dwScanFreq
	.p2align	2, 0x0
_dwScanFreq:
	.long	0                               # 0x0

	.globl	_dwOverRunCnt                   # @dwOverRunCnt
	.p2align	2, 0x0
_dwOverRunCnt:
	.long	0                               # 0x0

	.globl	_WorkFolder                     # @WorkFolder
_WorkFolder:
	.zero	128

	.globl	_RslFolder                      # @RslFolder
_RslFolder:
	.zero	128

	.globl	_RtaFolder                      # @RtaFolder
_RtaFolder:
	.zero	128

	.globl	_BaseName                       # @BaseName
_BaseName:
	.zero	128

	.globl	_RtaFilePath                    # @RtaFilePath
_RtaFilePath:
	.zero	128

	.globl	_MnmFilePath                    # @MnmFilePath
_MnmFilePath:
	.zero	128

	.globl	_IniFilePath                    # @IniFilePath
_IniFilePath:
	.zero	128

	.globl	_RetainInstName                 # @RetainInstName
_RetainInstName:
	.zero	128

	.section	.rdata,"dr",discard,"??_C@_0N@COHPKCOK@EgRetain_001?$AA@"
	.globl	"??_C@_0N@COHPKCOK@EgRetain_001?$AA@" # @"??_C@_0N@COHPKCOK@EgRetain_001?$AA@"
"??_C@_0N@COHPKCOK@EgRetain_001?$AA@":
	.asciz	"EgRetain_001"

	.section	.rdata,"dr",discard,"??_C@_01KMDKNFGN@?1?$AA@"
	.globl	"??_C@_01KMDKNFGN@?1?$AA@"      # @"??_C@_01KMDKNFGN@?1?$AA@"
"??_C@_01KMDKNFGN@?1?$AA@":
	.asciz	"/"

	.section	.rdata,"dr",discard,"??_C@_09OABCBDAM@C?3?2INplc?2?$AA@"
	.globl	"??_C@_09OABCBDAM@C?3?2INplc?2?$AA@" # @"??_C@_09OABCBDAM@C?3?2INplc?2?$AA@"
"??_C@_09OABCBDAM@C?3?2INplc?2?$AA@":
	.asciz	"C:\\INplc\\"

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
	.addrsig_sym _WorkFolder
	.addrsig_sym _RslFolder
	.addrsig_sym _RtaFolder
	.addrsig_sym _BaseName
	.addrsig_sym _RtaFilePath
	.addrsig_sym _MnmFilePath
	.addrsig_sym _IniFilePath
	.addrsig_sym _RetainInstName
