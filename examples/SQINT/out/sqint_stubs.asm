	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"sqint_stubs.c"
	.def	_Watchdog_Init;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Watchdog_Init                  # -- Begin function Watchdog_Init
	.p2align	4
_Watchdog_Init:                         # @Watchdog_Init
# %bb.0:
	retl
                                        # -- End function
	.def	_Watchdog_Reset;
	.scl	2;
	.type	32;
	.endef
	.globl	_Watchdog_Reset                 # -- Begin function Watchdog_Reset
	.p2align	4
_Watchdog_Reset:                        # @Watchdog_Reset
# %bb.0:
	retl
                                        # -- End function
	.def	_WatchDog_GetPentiumCounter;
	.scl	2;
	.type	32;
	.endef
	.globl	_WatchDog_GetPentiumCounter     # -- Begin function WatchDog_GetPentiumCounter
	.p2align	4
_WatchDog_GetPentiumCounter:            # @WatchDog_GetPentiumCounter
# %bb.0:
	xorl	%eax, %eax
	xorl	%edx, %edx
	retl
                                        # -- End function
	.def	_Watchdog_Calc;
	.scl	2;
	.type	32;
	.endef
	.globl	_Watchdog_Calc                  # -- Begin function Watchdog_Calc
	.p2align	4
_Watchdog_Calc:                         # @Watchdog_Calc
# %bb.0:
	fldz
	retl
                                        # -- End function
	.def	_WatchDog_Action_OverRun;
	.scl	2;
	.type	32;
	.endef
	.globl	_WatchDog_Action_OverRun        # -- Begin function WatchDog_Action_OverRun
	.p2align	4
_WatchDog_Action_OverRun:               # @WatchDog_Action_OverRun
# %bb.0:
	retl
                                        # -- End function
	.def	_Watchdog_Process;
	.scl	2;
	.type	32;
	.endef
	.globl	_Watchdog_Process               # -- Begin function Watchdog_Process
	.p2align	4
_Watchdog_Process:                      # @Watchdog_Process
# %bb.0:
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_status_watchdog                # @status_watchdog
	.p2align	2, 0x0
_status_watchdog:
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
	.globl	__fltused
