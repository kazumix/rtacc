	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"indicate.c"
	.def	_Indicate_Status;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Indicate_Status                # -- Begin function Indicate_Status
	.p2align	4
_Indicate_Status:                       # @Indicate_Status
# %bb.0:
	leal	4(%esp), %eax
	pushl	$1
	pushl	%eax
	pushl	_indicate+26
	calll	*__imp__EgTagWriteByIndex
	addl	$12, %esp
	retl
                                        # -- End function
	.def	_Indicate_Error;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_Error                 # -- Begin function Indicate_Error
	.p2align	4
_Indicate_Error:                        # @Indicate_Error
# %bb.0:
	leal	4(%esp), %eax
	pushl	$4
	pushl	%eax
	pushl	_indicate+56
	calll	*__imp__EgTagWriteByIndex
	addl	$12, %esp
	retl
                                        # -- End function
	.def	_Indicate_Run;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_Run                   # -- Begin function Indicate_Run
	.p2align	4
_Indicate_Run:                          # @Indicate_Run
# %bb.0:
	leal	4(%esp), %eax
	pushl	$1
	pushl	%eax
	pushl	_indicate+86
	calll	*__imp__EgTagWriteByIndex
	addl	$12, %esp
	retl
                                        # -- End function
	.def	_Indicate_Run_Get;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_Run_Get               # -- Begin function Indicate_Run_Get
	.p2align	4
_Indicate_Run_Get:                      # @Indicate_Run_Get
# %bb.0:
	pushl	%eax
	movb	$0, 3(%esp)
	leal	3(%esp), %eax
	pushl	$1
	pushl	%eax
	pushl	_indicate+86
	calll	*__imp__EgTagReadByIndex
	addl	$12, %esp
	movzbl	3(%esp), %eax
	popl	%ecx
	retl
                                        # -- End function
	.def	_Indicate_Live;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_Live                  # -- Begin function Indicate_Live
	.p2align	4
_Indicate_Live:                         # @Indicate_Live
# %bb.0:
	incl	_Indicate_Live.live
	pushl	$4
	pushl	$_Indicate_Live.live
	pushl	_indicate+116
	calll	*__imp__EgTagWriteByIndex
	addl	$12, %esp
	retl
                                        # -- End function
	.def	_Indicate_STATE_ON;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_STATE_ON              # -- Begin function Indicate_STATE_ON
	.p2align	4
_Indicate_STATE_ON:                     # @Indicate_STATE_ON
# %bb.0:
	movzbl	4(%esp), %eax
	movl	_indicate+134, %ecx
	movb	%al, (%ecx)
	retl
                                        # -- End function
	.def	_Indicate_STATE_LOADING;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_STATE_LOADING         # -- Begin function Indicate_STATE_LOADING
	.p2align	4
_Indicate_STATE_LOADING:                # @Indicate_STATE_LOADING
# %bb.0:
	movzbl	4(%esp), %eax
	movl	_indicate+164, %ecx
	movb	%al, (%ecx)
	retl
                                        # -- End function
	.def	_Indicate_STATE_STOP;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_STATE_STOP            # -- Begin function Indicate_STATE_STOP
	.p2align	4
_Indicate_STATE_STOP:                   # @Indicate_STATE_STOP
# %bb.0:
	movzbl	4(%esp), %eax
	movl	_indicate+194, %ecx
	movb	%al, (%ecx)
	retl
                                        # -- End function
	.def	_Indicate_STATE_RUN;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_STATE_RUN             # -- Begin function Indicate_STATE_RUN
	.p2align	4
_Indicate_STATE_RUN:                    # @Indicate_STATE_RUN
# %bb.0:
	movzbl	4(%esp), %eax
	movl	_indicate+224, %ecx
	movb	%al, (%ecx)
	retl
                                        # -- End function
	.def	_Indicate_STATE_STEP;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_STATE_STEP            # -- Begin function Indicate_STATE_STEP
	.p2align	4
_Indicate_STATE_STEP:                   # @Indicate_STATE_STEP
# %bb.0:
	movzbl	4(%esp), %eax
	movl	_indicate+254, %ecx
	movb	%al, (%ecx)
	retl
                                        # -- End function
	.def	_Indicate_STATE_HALT;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_STATE_HALT            # -- Begin function Indicate_STATE_HALT
	.p2align	4
_Indicate_STATE_HALT:                   # @Indicate_STATE_HALT
# %bb.0:
	movzbl	4(%esp), %eax
	movl	_indicate+284, %ecx
	movb	%al, (%ecx)
	retl
                                        # -- End function
	.def	_Indicate_TASK_Period_us;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_TASK_Period_us        # -- Begin function Indicate_TASK_Period_us
	.p2align	4
_Indicate_TASK_Period_us:               # @Indicate_TASK_Period_us
# %bb.0:
	movl	4(%esp), %eax
	movl	_indicate+314, %ecx
	movl	%eax, (%ecx)
	retl
                                        # -- End function
	.def	_Indicate_TASK_Watchdog_us;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_TASK_Watchdog_us      # -- Begin function Indicate_TASK_Watchdog_us
	.p2align	4
_Indicate_TASK_Watchdog_us:             # @Indicate_TASK_Watchdog_us
# %bb.0:
	movl	4(%esp), %eax
	movl	_indicate+344, %ecx
	movl	%eax, (%ecx)
	retl
                                        # -- End function
	.def	_Indicate_TASK_Stack;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_TASK_Stack            # -- Begin function Indicate_TASK_Stack
	.p2align	4
_Indicate_TASK_Stack:                   # @Indicate_TASK_Stack
# %bb.0:
	movl	4(%esp), %eax
	movl	_indicate+374, %ecx
	movl	%eax, (%ecx)
	retl
                                        # -- End function
	.def	_Indicate_TASK_Prio;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_TASK_Prio             # -- Begin function Indicate_TASK_Prio
	.p2align	4
_Indicate_TASK_Prio:                    # @Indicate_TASK_Prio
# %bb.0:
	movl	4(%esp), %eax
	movl	_indicate+404, %ecx
	movl	%eax, (%ecx)
	retl
                                        # -- End function
	.def	_Indicate_TASK_MinDuration_ns;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_TASK_MinDuration_ns   # -- Begin function Indicate_TASK_MinDuration_ns
	.p2align	4
_Indicate_TASK_MinDuration_ns:          # @Indicate_TASK_MinDuration_ns
# %bb.0:
	movl	4(%esp), %eax
	movl	_indicate+434, %ecx
	movl	%eax, (%ecx)
	retl
                                        # -- End function
	.def	_Indicate_TASK_MaxDuration_ns;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_TASK_MaxDuration_ns   # -- Begin function Indicate_TASK_MaxDuration_ns
	.p2align	4
_Indicate_TASK_MaxDuration_ns:          # @Indicate_TASK_MaxDuration_ns
# %bb.0:
	movl	4(%esp), %eax
	movl	_indicate+464, %ecx
	movl	%eax, (%ecx)
	retl
                                        # -- End function
	.def	_Indicate_TASK_CurDuration_ns;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_TASK_CurDuration_ns   # -- Begin function Indicate_TASK_CurDuration_ns
	.p2align	4
_Indicate_TASK_CurDuration_ns:          # @Indicate_TASK_CurDuration_ns
# %bb.0:
	movl	4(%esp), %eax
	movl	_indicate+494, %ecx
	movl	%eax, (%ecx)
	retl
                                        # -- End function
	.def	_Indicate_TASK_MinDelay_ns;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_TASK_MinDelay_ns      # -- Begin function Indicate_TASK_MinDelay_ns
	.p2align	4
_Indicate_TASK_MinDelay_ns:             # @Indicate_TASK_MinDelay_ns
# %bb.0:
	movl	4(%esp), %eax
	movl	_indicate+524, %ecx
	movl	%eax, (%ecx)
	retl
                                        # -- End function
	.def	_Indicate_TASK_MaxDelay_ns;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_TASK_MaxDelay_ns      # -- Begin function Indicate_TASK_MaxDelay_ns
	.p2align	4
_Indicate_TASK_MaxDelay_ns:             # @Indicate_TASK_MaxDelay_ns
# %bb.0:
	movl	4(%esp), %eax
	movl	_indicate+554, %ecx
	movl	%eax, (%ecx)
	retl
                                        # -- End function
	.def	_Indicate_TASK_CurDelay_ns;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_TASK_CurDelay_ns      # -- Begin function Indicate_TASK_CurDelay_ns
	.p2align	4
_Indicate_TASK_CurDelay_ns:             # @Indicate_TASK_CurDelay_ns
# %bb.0:
	movl	4(%esp), %eax
	movl	_indicate+584, %ecx
	movl	%eax, (%ecx)
	retl
                                        # -- End function
	.def	_Indicate_DEBUG_FORCE;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_DEBUG_FORCE           # -- Begin function Indicate_DEBUG_FORCE
	.p2align	4
_Indicate_DEBUG_FORCE:                  # @Indicate_DEBUG_FORCE
# %bb.0:
	movzbl	4(%esp), %eax
	movl	_indicate+614, %ecx
	movb	%al, (%ecx)
	retl
                                        # -- End function
	.def	_Indicate_DEBUG_BPSET;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_DEBUG_BPSET           # -- Begin function Indicate_DEBUG_BPSET
	.p2align	4
_Indicate_DEBUG_BPSET:                  # @Indicate_DEBUG_BPSET
# %bb.0:
	movzbl	4(%esp), %eax
	movl	_indicate+644, %ecx
	movb	%al, (%ecx)
	retl
                                        # -- End function
	.def	_Indicate_DEBUG_EXCEPTICODE;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_DEBUG_EXCEPTICODE     # -- Begin function Indicate_DEBUG_EXCEPTICODE
	.p2align	4
_Indicate_DEBUG_EXCEPTICODE:            # @Indicate_DEBUG_EXCEPTICODE
# %bb.0:
	movl	4(%esp), %eax
	movl	_indicate+674, %ecx
	movl	%eax, (%ecx)
	retl
                                        # -- End function
	.def	_Indicate_SYSTICK_CNT;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_SYSTICK_CNT           # -- Begin function Indicate_SYSTICK_CNT
	.p2align	4
_Indicate_SYSTICK_CNT:                  # @Indicate_SYSTICK_CNT
# %bb.0:
	movl	4(%esp), %eax
	movl	_indicate+704, %ecx
	movl	%eax, (%ecx)
	retl
                                        # -- End function
	.def	_Indicate_ERRORS;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_ERRORS                # -- Begin function Indicate_ERRORS
	.p2align	4
_Indicate_ERRORS:                       # @Indicate_ERRORS
# %bb.0:
	movl	4(%esp), %eax
	movl	_indicate+734, %ecx
	movl	%eax, (%ecx)
	retl
                                        # -- End function
	.def	_Indicate_Init;
	.scl	2;
	.type	32;
	.endef
	.globl	_Indicate_Init                  # -- Begin function Indicate_Init
	.p2align	4
_Indicate_Init:                         # @Indicate_Init
# %bb.0:
	pushl	$_indicate
	calll	_Container_CreateTagsFromList
	addl	$4, %esp
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.section	.rdata,"dr",discard,"??_C@_06PGDKHFME@Status?$AA@"
	.globl	"??_C@_06PGDKHFME@Status?$AA@"  # @"??_C@_06PGDKHFME@Status?$AA@"
"??_C@_06PGDKHFME@Status?$AA@":
	.asciz	"Status"

	.section	.rdata,"dr",discard,"??_C@_05NAOIJFC@Error?$AA@"
	.globl	"??_C@_05NAOIJFC@Error?$AA@"    # @"??_C@_05NAOIJFC@Error?$AA@"
"??_C@_05NAOIJFC@Error?$AA@":
	.asciz	"Error"

	.section	.rdata,"dr",discard,"??_C@_03BGPLALFI@Run?$AA@"
	.globl	"??_C@_03BGPLALFI@Run?$AA@"     # @"??_C@_03BGPLALFI@Run?$AA@"
"??_C@_03BGPLALFI@Run?$AA@":
	.asciz	"Run"

	.section	.rdata,"dr",discard,"??_C@_04KKAGIOCD@Live?$AA@"
	.globl	"??_C@_04KKAGIOCD@Live?$AA@"    # @"??_C@_04KKAGIOCD@Live?$AA@"
"??_C@_04KKAGIOCD@Live?$AA@":
	.asciz	"Live"

	.section	.rdata,"dr",discard,"??_C@_08OAGHDPEJ@STATE_ON?$AA@"
	.globl	"??_C@_08OAGHDPEJ@STATE_ON?$AA@" # @"??_C@_08OAGHDPEJ@STATE_ON?$AA@"
"??_C@_08OAGHDPEJ@STATE_ON?$AA@":
	.asciz	"STATE_ON"

	.section	.rdata,"dr",discard,"??_C@_0O@IMOCLJCO@STATE_LOADING?$AA@"
	.globl	"??_C@_0O@IMOCLJCO@STATE_LOADING?$AA@" # @"??_C@_0O@IMOCLJCO@STATE_LOADING?$AA@"
"??_C@_0O@IMOCLJCO@STATE_LOADING?$AA@":
	.asciz	"STATE_LOADING"

	.section	.rdata,"dr",discard,"??_C@_0L@MMBEGDMH@STATE_STOP?$AA@"
	.globl	"??_C@_0L@MMBEGDMH@STATE_STOP?$AA@" # @"??_C@_0L@MMBEGDMH@STATE_STOP?$AA@"
"??_C@_0L@MMBEGDMH@STATE_STOP?$AA@":
	.asciz	"STATE_STOP"

	.section	.rdata,"dr",discard,"??_C@_09NDBKDPFD@STATE_RUN?$AA@"
	.globl	"??_C@_09NDBKDPFD@STATE_RUN?$AA@" # @"??_C@_09NDBKDPFD@STATE_RUN?$AA@"
"??_C@_09NDBKDPFD@STATE_RUN?$AA@":
	.asciz	"STATE_RUN"

	.section	.rdata,"dr",discard,"??_C@_0L@MBIDOGBB@STATE_STEP?$AA@"
	.globl	"??_C@_0L@MBIDOGBB@STATE_STEP?$AA@" # @"??_C@_0L@MBIDOGBB@STATE_STEP?$AA@"
"??_C@_0L@MBIDOGBB@STATE_STEP?$AA@":
	.asciz	"STATE_STEP"

	.section	.rdata,"dr",discard,"??_C@_0L@NKMJBJKE@STATE_HALT?$AA@"
	.globl	"??_C@_0L@NKMJBJKE@STATE_HALT?$AA@" # @"??_C@_0L@NKMJBJKE@STATE_HALT?$AA@"
"??_C@_0L@NKMJBJKE@STATE_HALT?$AA@":
	.asciz	"STATE_HALT"

	.section	.rdata,"dr",discard,"??_C@_0P@OBGFCEGN@TASK_Period_us?$AA@"
	.globl	"??_C@_0P@OBGFCEGN@TASK_Period_us?$AA@" # @"??_C@_0P@OBGFCEGN@TASK_Period_us?$AA@"
"??_C@_0P@OBGFCEGN@TASK_Period_us?$AA@":
	.asciz	"TASK_Period_us"

	.section	.rdata,"dr",discard,"??_C@_0BB@BIHCCKNE@TASK_Watchdog_us?$AA@"
	.globl	"??_C@_0BB@BIHCCKNE@TASK_Watchdog_us?$AA@" # @"??_C@_0BB@BIHCCKNE@TASK_Watchdog_us?$AA@"
"??_C@_0BB@BIHCCKNE@TASK_Watchdog_us?$AA@":
	.asciz	"TASK_Watchdog_us"

	.section	.rdata,"dr",discard,"??_C@_0L@OJINNFI@TASK_Stack?$AA@"
	.globl	"??_C@_0L@OJINNFI@TASK_Stack?$AA@" # @"??_C@_0L@OJINNFI@TASK_Stack?$AA@"
"??_C@_0L@OJINNFI@TASK_Stack?$AA@":
	.asciz	"TASK_Stack"

	.section	.rdata,"dr",discard,"??_C@_09FJFIOJGA@TASK_Prio?$AA@"
	.globl	"??_C@_09FJFIOJGA@TASK_Prio?$AA@" # @"??_C@_09FJFIOJGA@TASK_Prio?$AA@"
"??_C@_09FJFIOJGA@TASK_Prio?$AA@":
	.asciz	"TASK_Prio"

	.section	.rdata,"dr",discard,"??_C@_0BE@PILKOLFM@TASK_MinDuration_ns?$AA@"
	.globl	"??_C@_0BE@PILKOLFM@TASK_MinDuration_ns?$AA@" # @"??_C@_0BE@PILKOLFM@TASK_MinDuration_ns?$AA@"
"??_C@_0BE@PILKOLFM@TASK_MinDuration_ns?$AA@":
	.asciz	"TASK_MinDuration_ns"

	.section	.rdata,"dr",discard,"??_C@_0BE@NPABIMGN@TASK_MaxDuration_ns?$AA@"
	.globl	"??_C@_0BE@NPABIMGN@TASK_MaxDuration_ns?$AA@" # @"??_C@_0BE@NPABIMGN@TASK_MaxDuration_ns?$AA@"
"??_C@_0BE@NPABIMGN@TASK_MaxDuration_ns?$AA@":
	.asciz	"TASK_MaxDuration_ns"

	.section	.rdata,"dr",discard,"??_C@_0BE@HHDDEBEJ@TASK_CurDuration_ns?$AA@"
	.globl	"??_C@_0BE@HHDDEBEJ@TASK_CurDuration_ns?$AA@" # @"??_C@_0BE@HHDDEBEJ@TASK_CurDuration_ns?$AA@"
"??_C@_0BE@HHDDEBEJ@TASK_CurDuration_ns?$AA@":
	.asciz	"TASK_CurDuration_ns"

	.section	.rdata,"dr",discard,"??_C@_0BB@MPMBGPPD@TASK_MinDelay_ns?$AA@"
	.globl	"??_C@_0BB@MPMBGPPD@TASK_MinDelay_ns?$AA@" # @"??_C@_0BB@MPMBGPPD@TASK_MinDelay_ns?$AA@"
"??_C@_0BB@MPMBGPPD@TASK_MinDelay_ns?$AA@":
	.asciz	"TASK_MinDelay_ns"

	.section	.rdata,"dr",discard,"??_C@_0BB@FPLCHPBJ@TASK_MaxDelay_ns?$AA@"
	.globl	"??_C@_0BB@FPLCHPBJ@TASK_MaxDelay_ns?$AA@" # @"??_C@_0BB@FPLCHPBJ@TASK_MaxDelay_ns?$AA@"
"??_C@_0BB@FPLCHPBJ@TASK_MaxDelay_ns?$AA@":
	.asciz	"TASK_MaxDelay_ns"

	.section	.rdata,"dr",discard,"??_C@_0BB@LPIOILIH@TASK_CurDelay_ns?$AA@"
	.globl	"??_C@_0BB@LPIOILIH@TASK_CurDelay_ns?$AA@" # @"??_C@_0BB@LPIOILIH@TASK_CurDelay_ns?$AA@"
"??_C@_0BB@LPIOILIH@TASK_CurDelay_ns?$AA@":
	.asciz	"TASK_CurDelay_ns"

	.section	.rdata,"dr",discard,"??_C@_0M@NJGLOIKF@DEBUG_FORCE?$AA@"
	.globl	"??_C@_0M@NJGLOIKF@DEBUG_FORCE?$AA@" # @"??_C@_0M@NJGLOIKF@DEBUG_FORCE?$AA@"
"??_C@_0M@NJGLOIKF@DEBUG_FORCE?$AA@":
	.asciz	"DEBUG_FORCE"

	.section	.rdata,"dr",discard,"??_C@_0M@EPKCJCCH@DEBUG_BPSET?$AA@"
	.globl	"??_C@_0M@EPKCJCCH@DEBUG_BPSET?$AA@" # @"??_C@_0M@EPKCJCCH@DEBUG_BPSET?$AA@"
"??_C@_0M@EPKCJCCH@DEBUG_BPSET?$AA@":
	.asciz	"DEBUG_BPSET"

	.section	.rdata,"dr",discard,"??_C@_0BE@IHGKBEJC@DEBUG_EXCEPTIONCODE?$AA@"
	.globl	"??_C@_0BE@IHGKBEJC@DEBUG_EXCEPTIONCODE?$AA@" # @"??_C@_0BE@IHGKBEJC@DEBUG_EXCEPTIONCODE?$AA@"
"??_C@_0BE@IHGKBEJC@DEBUG_EXCEPTIONCODE?$AA@":
	.asciz	"DEBUG_EXCEPTIONCODE"

	.section	.rdata,"dr",discard,"??_C@_0M@DOKECC@SYSTICK_CNT?$AA@"
	.globl	"??_C@_0M@DOKECC@SYSTICK_CNT?$AA@" # @"??_C@_0M@DOKECC@SYSTICK_CNT?$AA@"
"??_C@_0M@DOKECC@SYSTICK_CNT?$AA@":
	.asciz	"SYSTICK_CNT"

	.section	.rdata,"dr",discard,"??_C@_06EKOMPDCK@ERRORS?$AA@"
	.globl	"??_C@_06EKOMPDCK@ERRORS?$AA@"  # @"??_C@_06EKOMPDCK@ERRORS?$AA@"
"??_C@_06EKOMPDCK@ERRORS?$AA@":
	.asciz	"ERRORS"

	.data
	.globl	_indicate                       # @indicate
_indicate:
	.long	"??_C@_06PGDKHFME@Status?$AA@"
	.long	3                               # 0x3
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_05NAOIJFC@Error?$AA@"
	.long	1                               # 0x1
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_03BGPLALFI@Run?$AA@"
	.long	1                               # 0x1
	.long	1                               # 0x1
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_04KKAGIOCD@Live?$AA@"
	.long	7                               # 0x7
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_08OAGHDPEJ@STATE_ON?$AA@"
	.long	1                               # 0x1
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_0O@IMOCLJCO@STATE_LOADING?$AA@"
	.long	1                               # 0x1
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_0L@MMBEGDMH@STATE_STOP?$AA@"
	.long	1                               # 0x1
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_09NDBKDPFD@STATE_RUN?$AA@"
	.long	1                               # 0x1
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_0L@MBIDOGBB@STATE_STEP?$AA@"
	.long	1                               # 0x1
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_0L@NKMJBJKE@STATE_HALT?$AA@"
	.long	1                               # 0x1
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_0P@OBGFCEGN@TASK_Period_us?$AA@"
	.long	7                               # 0x7
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_0BB@BIHCCKNE@TASK_Watchdog_us?$AA@"
	.long	7                               # 0x7
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_0L@OJINNFI@TASK_Stack?$AA@"
	.long	7                               # 0x7
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_09FJFIOJGA@TASK_Prio?$AA@"
	.long	7                               # 0x7
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_0BE@PILKOLFM@TASK_MinDuration_ns?$AA@"
	.long	7                               # 0x7
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_0BE@NPABIMGN@TASK_MaxDuration_ns?$AA@"
	.long	7                               # 0x7
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_0BE@HHDDEBEJ@TASK_CurDuration_ns?$AA@"
	.long	7                               # 0x7
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_0BB@MPMBGPPD@TASK_MinDelay_ns?$AA@"
	.long	7                               # 0x7
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_0BB@FPLCHPBJ@TASK_MaxDelay_ns?$AA@"
	.long	7                               # 0x7
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_0BB@LPIOILIH@TASK_CurDelay_ns?$AA@"
	.long	7                               # 0x7
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_0M@NJGLOIKF@DEBUG_FORCE?$AA@"
	.long	1                               # 0x1
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_0M@EPKCJCCH@DEBUG_BPSET?$AA@"
	.long	1                               # 0x1
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_0BE@IHGKBEJC@DEBUG_EXCEPTIONCODE?$AA@"
	.long	7                               # 0x7
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_0M@DOKECC@SYSTICK_CNT?$AA@"
	.long	7                               # 0x7
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	"??_C@_06EKOMPDCK@ERRORS?$AA@"
	.long	7                               # 0x7
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.zero	30

	.lcomm	_Indicate_Live.live,4,4         # @Indicate_Live.live
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
	.addrsig_sym _indicate
	.addrsig_sym _Indicate_Live.live
