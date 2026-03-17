	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"plccontrol.c"
	.def	_PLCcontrol_Start;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_PLCcontrol_Start               # -- Begin function PLCcontrol_Start
	.p2align	4
_PLCcontrol_Start:                      # @PLCcontrol_Start
# %bb.0:
	calll	_Engine_IsStart
	testb	%al, %al
	jne	LBB0_2
# %bb.1:
	calll	_Logic_Begin
	calll	_Engine_Start
	movl	$6, _status_plccontrol
LBB0_2:
	pushl	$1
	calll	_Indicate_STATE_RUN
	addl	$4, %esp
	pushl	$0
	calll	_Indicate_STATE_STOP
	addl	$4, %esp
	pushl	$0
	calll	_Indicate_STATE_STEP
	addl	$4, %esp
	pushl	$0
	calll	_Indicate_STATE_HALT
	addl	$4, %esp
	pushl	$0
	calll	_Indicate_DEBUG_EXCEPTICODE
	addl	$4, %esp
	retl
                                        # -- End function
	.def	_PLCcontrol_Stop;
	.scl	2;
	.type	32;
	.endef
	.globl	_PLCcontrol_Stop                # -- Begin function PLCcontrol_Stop
	.p2align	4
_PLCcontrol_Stop:                       # @PLCcontrol_Stop
# %bb.0:
	calll	_Engine_IsStart
	testb	%al, %al
	je	LBB1_2
# %bb.1:
	calll	_Engine_Stop
	calll	_Engine_WaitStop
	calll	_Logic_Final
	calll	_Retain_Save
	movl	$0, _status_plccontrol
LBB1_2:
	pushl	$0
	calll	_Indicate_STATE_RUN
	addl	$4, %esp
	pushl	$1
	calll	_Indicate_STATE_STOP
	addl	$4, %esp
	pushl	$0
	calll	_Indicate_STATE_STEP
	addl	$4, %esp
	pushl	$0
	calll	_Indicate_STATE_HALT
	addl	$4, %esp
	pushl	$0
	calll	_Indicate_DEBUG_EXCEPTICODE
	addl	$4, %esp
	retl
                                        # -- End function
	.def	_PLCcontrol_RetainSave;
	.scl	2;
	.type	32;
	.endef
	.globl	_PLCcontrol_RetainSave          # -- Begin function PLCcontrol_RetainSave
	.p2align	4
_PLCcontrol_RetainSave:                 # @PLCcontrol_RetainSave
# %bb.0:
	jmp	_Retain_Save                    # TAILCALL
                                        # -- End function
	.def	_PLCcontrol_Halt;
	.scl	2;
	.type	32;
	.endef
	.globl	_PLCcontrol_Halt                # -- Begin function PLCcontrol_Halt
	.p2align	4
_PLCcontrol_Halt:                       # @PLCcontrol_Halt
# %bb.0:
	calll	_Engine_IsStart
	testb	%al, %al
	je	LBB3_2
# %bb.1:
	calll	_Engine_Stop
	calll	_Retain_Save
	movl	$8, _status_plccontrol
LBB3_2:
	pushl	$0
	calll	_Indicate_STATE_RUN
	addl	$4, %esp
	pushl	$0
	calll	_Indicate_STATE_STOP
	addl	$4, %esp
	pushl	$0
	calll	_Indicate_STATE_STEP
	addl	$4, %esp
	pushl	$1
	calll	_Indicate_STATE_HALT
	addl	$4, %esp
	jmp	_Indicate_DEBUG_EXCEPTICODE     # TAILCALL
                                        # -- End function
	.def	_PLCcontrol_Reset;
	.scl	2;
	.type	32;
	.endef
	.globl	_PLCcontrol_Reset               # -- Begin function PLCcontrol_Reset
	.p2align	4
_PLCcontrol_Reset:                      # @PLCcontrol_Reset
# %bb.0:
	calll	_Retain_Save
	calll	_Variable_Reset_All
	calll	_Rtedge_SetTagDefaultValue
	jmp	_Retain_Load                    # TAILCALL
                                        # -- End function
	.def	_PLCcontrol_RetainLoad;
	.scl	2;
	.type	32;
	.endef
	.globl	_PLCcontrol_RetainLoad          # -- Begin function PLCcontrol_RetainLoad
	.p2align	4
_PLCcontrol_RetainLoad:                 # @PLCcontrol_RetainLoad
# %bb.0:
	jmp	_Retain_Load                    # TAILCALL
                                        # -- End function
	.def	_PLCcontrol_ColdStart;
	.scl	2;
	.type	32;
	.endef
	.globl	_PLCcontrol_ColdStart           # -- Begin function PLCcontrol_ColdStart
	.p2align	4
_PLCcontrol_ColdStart:                  # @PLCcontrol_ColdStart
# %bb.0:
	calll	_Retain_Save
	calll	_Variable_Reset_All
	calll	_Rtedge_SetTagDefaultValue
	calll	_Retain_Load
	jmp	_PLCcontrol_Start               # TAILCALL
                                        # -- End function
	.def	_PLCcontrol_HotStart;
	.scl	2;
	.type	32;
	.endef
	.globl	_PLCcontrol_HotStart            # -- Begin function PLCcontrol_HotStart
	.p2align	4
_PLCcontrol_HotStart:                   # @PLCcontrol_HotStart
# %bb.0:
	jmp	_PLCcontrol_Start               # TAILCALL
                                        # -- End function
	.def	_PLCcontrol_Download;
	.scl	2;
	.type	32;
	.endef
	.globl	_PLCcontrol_Download            # -- Begin function PLCcontrol_Download
	.p2align	4
_PLCcontrol_Download:                   # @PLCcontrol_Download
# %bb.0:
	calll	_Project_Load
	pushl	$1
	calll	_Indicate_STATE_LOADING
	addl	$4, %esp
	jmp	_Retain_Load                    # TAILCALL
                                        # -- End function
	.def	_PLCcontrol_Swap;
	.scl	2;
	.type	32;
	.endef
	.globl	_PLCcontrol_Swap                # -- Begin function PLCcontrol_Swap
	.p2align	4
_PLCcontrol_Swap:                       # @PLCcontrol_Swap
# %bb.0:
	calll	_Logic_Swap
	jmp	_Variable_Swap                  # TAILCALL
                                        # -- End function
	.def	_PLCcontrol_StepEnable;
	.scl	2;
	.type	32;
	.endef
	.globl	_PLCcontrol_StepEnable          # -- Begin function PLCcontrol_StepEnable
	.p2align	4
_PLCcontrol_StepEnable:                 # @PLCcontrol_StepEnable
# %bb.0:
	jmp	_Step_Enable                    # TAILCALL
                                        # -- End function
	.def	_PLCcontrol_StepDisable;
	.scl	2;
	.type	32;
	.endef
	.globl	_PLCcontrol_StepDisable         # -- Begin function PLCcontrol_StepDisable
	.p2align	4
_PLCcontrol_StepDisable:                # @PLCcontrol_StepDisable
# %bb.0:
	jmp	_Step_Disable                   # TAILCALL
                                        # -- End function
	.def	_PLCcontrol_StepStep;
	.scl	2;
	.type	32;
	.endef
	.globl	_PLCcontrol_StepStep            # -- Begin function PLCcontrol_StepStep
	.p2align	4
_PLCcontrol_StepStep:                   # @PLCcontrol_StepStep
# %bb.0:
	jmp	_Step_Trigger                   # TAILCALL
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_status_plccontrol              # @status_plccontrol
	.p2align	2, 0x0
_status_plccontrol:
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
