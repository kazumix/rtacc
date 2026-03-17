	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"engine.c"
	.def	_Engine_Init;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Engine_Init                    # -- Begin function Engine_Init
	.p2align	4
_Engine_Init:                           # @Engine_Init
# %bb.0:
	pushl	%ebx
	movb	$0, _Engine_PhaseStop
	movl	$0, _systickcount
	xorps	%xmm0, %xmm0
	movsd	%xmm0, _curdelay
	movsd	%xmm0, _maxdelay
	movsd	%xmm0, _mindelay
	movl	$0, _uiEnd+4
	movl	$0, _uiEnd
	movl	$0, _uiBegin+4
	movl	$0, _uiBegin
	cmpw	$0, _hPulseSem
	jne	LBB0_2
# %bb.1:
	pushl	$0
	pushl	$1
	pushl	$0
	calll	_CreateRtSemaphore
	addl	$12, %esp
	movw	%ax, _hPulseSem
	movzwl	%ax, %eax
	pushl	$"??_C@_05IAHGNKDM@PULSE?$AA@"
	pushl	%eax
	pushl	$0
	calll	_Catalog
	addl	$12, %esp
LBB0_2:
	calll	_Config_Get_BasePriority
	movzbl	%al, %ebx
	addl	$2, %ebx
	cmpw	$0, _hSQengineThread
	jne	LBB0_5
# %bb.3:
	movzbl	%bl, %eax
	pushl	$0
	pushl	$32768                          # imm = 0x8000
	pushl	$_Engine_Thread
	pushl	%eax
	calll	_CreateRtThread
	addl	$16, %esp
	movw	%ax, _hSQengineThread
	cmpw	$-1, %ax
	jne	LBB0_5
# %bb.4:
	movw	$0, _hSQengineThread
	pushl	$"??_C@_0BM@MDFECNNP@Cannot?5create?5Engine_Thread?$AA@"
	calll	_Fail
	addl	$4, %esp
LBB0_5:
	pushl	%ebx
	calll	_Indicate_TASK_Prio
	addl	$4, %esp
	pushl	$32768                          # imm = 0x8000
	calll	_Indicate_TASK_Stack
	addl	$4, %esp
	calll	_Config_Get_BasePriority
	cmpw	$0, _hPulseThread
	jne	LBB0_8
# %bb.6:
	movzbl	%al, %eax
	pushl	$0
	pushl	$8192                           # imm = 0x2000
	pushl	$_Engine_PulseThread
	pushl	%eax
	calll	_CreateRtThread
	addl	$16, %esp
	movw	%ax, _hPulseThread
	cmpw	$-1, %ax
	jne	LBB0_8
# %bb.7:
	movw	$0, _hPulseThread
	pushl	$"??_C@_0CB@FNKGDICM@Cannot?5create?5Engine_PulseThread@"
	calll	_Fail
	addl	$4, %esp
LBB0_8:
	pushl	$10
	pushl	$"??_C@_06LKDHJJCH@ENGINE?$AA@"
	pushl	$0
	calll	_LookupRtHandle
	addl	$12, %esp
	pushl	$10
	pushl	$"??_C@_09LJDFFONP@PACEMAKER?$AA@"
	pushl	$0
	calll	_LookupRtHandle
	addl	$12, %esp
	movl	$2, _status_engine
	popl	%ebx
	retl
                                        # -- End function
	.def	_Engine_Reset;
	.scl	2;
	.type	32;
	.endef
	.globl	_Engine_Reset                   # -- Begin function Engine_Reset
	.p2align	4
_Engine_Reset:                          # @Engine_Reset
# %bb.0:
	movb	$0, _Engine_PhaseStop
	movl	$0, _systickcount
	xorps	%xmm0, %xmm0
	movsd	%xmm0, _curdelay
	movsd	%xmm0, _maxdelay
	movsd	%xmm0, _mindelay
	movl	$0, _uiEnd+4
	movl	$0, _uiEnd
	movl	$0, _uiBegin+4
	movl	$0, _uiBegin
	retl
                                        # -- End function
	.def	_Engine_Thread;
	.scl	2;
	.type	32;
	.endef
	.globl	_Engine_Thread                  # -- Begin function Engine_Thread
	.p2align	4
_Engine_Thread:                         # @Engine_Thread
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	$_Logic_Scan, _lpfnSeq_Ctrl
	pushl	$0
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movzwl	%ax, %eax
	pushl	$"??_C@_06LKDHJJCH@ENGINE?$AA@"
	pushl	%eax
	pushl	$0
	calll	_Catalog
	addl	$12, %esp
	.p2align	4
LBB2_1:                                 # =>This Inner Loop Header: Depth=1
	movb	$1, _Engine_PhaseStop
	calll	_Engine_WaitTrigger
	movb	$0, _Engine_PhaseStop
	calll	_WatchDog_GetPentiumCounter
	movl	%eax, %esi
	movl	%edx, %edi
	calll	*_lpfnSeq_Ctrl
	calll	_WatchDog_GetPentiumCounter
	pushl	%edx
	pushl	%eax
	pushl	%edi
	pushl	%esi
	calll	_Watchdog_Process
	addl	$16, %esp
	jmp	LBB2_1
                                        # -- End function
	.def	_Engine_PulseThread;
	.scl	2;
	.type	32;
	.endef
	.globl	_Engine_PulseThread             # -- Begin function Engine_PulseThread
	.p2align	4
_Engine_PulseThread:                    # @Engine_PulseThread
# %bb.0:
	pushl	%esi
	pushl	$0
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movzwl	%ax, %eax
	pushl	$"??_C@_09LJDFFONP@PACEMAKER?$AA@"
	pushl	%eax
	pushl	$0
	calll	_Catalog
	addl	$12, %esp
	calll	_Config_Get_ScanFreq
	pushl	%eax
	calll	_Indicate_TASK_Period_us
	addl	$4, %esp
	pushl	$1
	calll	_knRtSleep
	addl	$4, %esp
	xorl	%esi, %esi
	jmp	LBB3_1
LBB3_8:                                 #   in Loop: Header=BB3_1 Depth=1
	calll	_WatchDog_Action_OverRun
	.p2align	4
LBB3_1:                                 # =>This Inner Loop Header: Depth=1
	calll	_InternalClock_Wait
	incl	%esi
	pushl	%esi
	calll	_InternalClock_IsPlcFireTiming
	addl	$4, %esp
	movl	%eax, %esi
	testl	%eax, %eax
	jne	LBB3_1
# %bb.2:                                #   in Loop: Header=BB3_1 Depth=1
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB3_1
# %bb.3:                                #   in Loop: Header=BB3_1 Depth=1
	cmpb	$0, 32(%eax)
	je	LBB3_1
# %bb.4:                                #   in Loop: Header=BB3_1 Depth=1
	cmpw	$0, _hPulseSem
	je	LBB3_8
# %bb.5:                                #   in Loop: Header=BB3_1 Depth=1
	calll	_Step_IsEnable
	testb	%al, %al
	je	LBB3_7
# %bb.6:                                #   in Loop: Header=BB3_1 Depth=1
	calll	_Step_WaitTrigger
LBB3_7:                                 #   in Loop: Header=BB3_1 Depth=1
	movzwl	_hPulseSem, %eax
	pushl	$1
	pushl	%eax
	calll	_ReleaseRtSemaphore
	addl	$8, %esp
	testb	%al, %al
	jne	LBB3_1
	jmp	LBB3_8
                                        # -- End function
	.def	_Engine_Tigger;
	.scl	2;
	.type	32;
	.endef
	.globl	_Engine_Tigger                  # -- Begin function Engine_Tigger
	.p2align	4
_Engine_Tigger:                         # @Engine_Tigger
# %bb.0:
	cmpw	$0, _hPulseSem
	je	LBB4_4
# %bb.1:
	calll	_Step_IsEnable
	testb	%al, %al
	je	LBB4_3
# %bb.2:
	calll	_Step_WaitTrigger
LBB4_3:
	movzwl	_hPulseSem, %eax
	pushl	$1
	pushl	%eax
	calll	_ReleaseRtSemaphore
	addl	$8, %esp
	retl
LBB4_4:
	xorl	%eax, %eax
	retl
                                        # -- End function
	.def	_Engine_AbsDelay;
	.scl	2;
	.type	32;
	.endef
	.globl	__xmm@43300000000000004330000000000000 # -- Begin function Engine_AbsDelay
	.section	.rdata,"dr",discard,__xmm@43300000000000004330000000000000
	.p2align	4, 0x0
__xmm@43300000000000004330000000000000:
	.quad	0x4330000000000000              # double 4503599627370496
	.quad	0x4330000000000000              # double 4503599627370496
	.globl	__real@4330000000000000
	.section	.rdata,"dr",discard,__real@4330000000000000
	.p2align	3, 0x0
__real@4330000000000000:
	.quad	0x4330000000000000              # double 4503599627370496
	.globl	__xmm@7fffffffffffffff7fffffffffffffff
	.section	.rdata,"dr",discard,__xmm@7fffffffffffffff7fffffffffffffff
	.p2align	4, 0x0
__xmm@7fffffffffffffff7fffffffffffffff:
	.quad	0x7fffffffffffffff              # double NaN
	.quad	0x7fffffffffffffff              # double NaN
	.text
	.globl	_Engine_AbsDelay
	.p2align	4
_Engine_AbsDelay:                       # @Engine_AbsDelay
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-8, %esp
	subl	$8, %esp
	calll	_Config_Get_ScanFreq
	imull	$1000, %eax, %eax               # imm = 0x3E8
	movd	%eax, %xmm0
	por	__xmm@43300000000000004330000000000000, %xmm0
	subsd	__real@4330000000000000, %xmm0
	movsd	8(%ebp), %xmm1                  # xmm1 = mem[0],zero
	subsd	%xmm0, %xmm1
	andpd	__xmm@7fffffffffffffff7fffffffffffffff, %xmm1
	movlpd	%xmm1, (%esp)
	fldl	(%esp)
	movl	%ebp, %esp
	popl	%ebp
	retl
                                        # -- End function
	.def	_Engine_WaitTrigger;
	.scl	2;
	.type	32;
	.endef
	.globl	__real@3fb999999999999a         # -- Begin function Engine_WaitTrigger
	.section	.rdata,"dr",discard,__real@3fb999999999999a
	.p2align	3, 0x0
__real@3fb999999999999a:
	.quad	0x3fb999999999999a              # double 0.10000000000000001
	.globl	__real@3feccccccccccccd
	.section	.rdata,"dr",discard,__real@3feccccccccccccd
	.p2align	3, 0x0
__real@3feccccccccccccd:
	.quad	0x3feccccccccccccd              # double 0.90000000000000002
	.globl	__real@41e0000000000000
	.section	.rdata,"dr",discard,__real@41e0000000000000
	.p2align	3, 0x0
__real@41e0000000000000:
	.quad	0x41e0000000000000              # double 2147483648
	.text
	.globl	_Engine_WaitTrigger
	.p2align	4
_Engine_WaitTrigger:                    # @Engine_WaitTrigger
# %bb.0:
	movzwl	_hPulseSem, %eax
	testw	%ax, %ax
	je	LBB6_6
# %bb.1:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	andl	$-16, %esp
	subl	$32, %esp
	movzwl	%ax, %eax
	pushl	$-1
	pushl	$1
	pushl	%eax
	calll	_WaitForRtSemaphore
	addl	$12, %esp
	calll	_WatchDog_GetPentiumCounter
	movl	%edx, _uiEnd+4
	movl	%eax, _uiEnd
	movl	_uiBegin+4, %esi
	movl	_uiBegin, %ecx
	movl	%ecx, %edi
	orl	%esi, %edi
	je	LBB6_5
# %bb.2:
	pushl	%edx
	pushl	%eax
	pushl	%esi
	pushl	%ecx
	calll	_Watchdog_Calc
	addl	$16, %esp
	fstpl	8(%esp)
	movsd	8(%esp), %xmm0                  # xmm0 = mem[0],zero
	movaps	%xmm0, 16(%esp)                 # 16-byte Spill
	calll	_Config_Get_ScanFreq
	movapd	16(%esp), %xmm3                 # 16-byte Reload
	imull	$1000, %eax, %eax               # imm = 0x3E8
	movd	%eax, %xmm0
	por	__xmm@43300000000000004330000000000000, %xmm0
	subsd	__real@4330000000000000, %xmm0
	subsd	%xmm0, %xmm3
	andpd	__xmm@7fffffffffffffff7fffffffffffffff, %xmm3
	movsd	_maxdelay, %xmm0                # xmm0 = mem[0],zero
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	movapd	%xmm3, %xmm2
	movapd	%xmm3, %xmm1
	jne	LBB6_3
	jnp	LBB6_4
LBB6_3:
	movsd	_curdelay, %xmm2                # xmm2 = mem[0],zero
	movsd	__real@3fb999999999999a, %xmm1  # xmm1 = [1.0000000000000001E-1,0.0E+0]
	mulsd	__real@3feccccccccccccd, %xmm2
	mulsd	%xmm3, %xmm1
	addsd	%xmm1, %xmm2
	movapd	%xmm2, %xmm1
	movapd	%xmm2, %xmm3
	maxsd	%xmm0, %xmm2
	minsd	_mindelay, %xmm1
LBB6_4:
	movsd	%xmm3, _curdelay
	movsd	%xmm2, _maxdelay
	movsd	%xmm1, _mindelay
	movl	_uiEnd+4, %edx
	movl	_uiEnd, %eax
LBB6_5:
	movl	%eax, _uiBegin
	movl	%edx, _uiBegin+4
	movl	_systickcount, %eax
	incl	%eax
	movl	%eax, _systickcount
	pushl	%eax
	calll	_Indicate_SYSTICK_CNT
	addl	$4, %esp
	movsd	_curdelay, %xmm0                # xmm0 = mem[0],zero
	cvttsd2si	%xmm0, %eax
	subsd	__real@41e0000000000000, %xmm0
	cvttsd2si	%xmm0, %ecx
	movl	%eax, %edx
	sarl	$31, %edx
	andl	%ecx, %edx
	orl	%eax, %edx
	pushl	%edx
	calll	_Indicate_TASK_CurDelay_ns
	addl	$4, %esp
	movsd	_maxdelay, %xmm0                # xmm0 = mem[0],zero
	cvttsd2si	%xmm0, %eax
	subsd	__real@41e0000000000000, %xmm0
	cvttsd2si	%xmm0, %ecx
	movl	%eax, %edx
	sarl	$31, %edx
	andl	%ecx, %edx
	orl	%eax, %edx
	pushl	%edx
	calll	_Indicate_TASK_MaxDelay_ns
	addl	$4, %esp
	movsd	_mindelay, %xmm0                # xmm0 = mem[0],zero
	cvttsd2si	%xmm0, %eax
	subsd	__real@41e0000000000000, %xmm0
	cvttsd2si	%xmm0, %ecx
	movl	%eax, %edx
	sarl	$31, %edx
	andl	%ecx, %edx
	orl	%eax, %edx
	pushl	%edx
	calll	_Indicate_TASK_MinDelay_ns
	addl	$4, %esp
	leal	-8(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebp
LBB6_6:
	retl
                                        # -- End function
	.def	_Engine_Stop;
	.scl	2;
	.type	32;
	.endef
	.globl	_Engine_Stop                    # -- Begin function Engine_Stop
	.p2align	4
_Engine_Stop:                           # @Engine_Stop
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB7_2
# %bb.1:
	movb	$0, 32(%eax)
LBB7_2:
	movl	$8, _status_engine
	retl
                                        # -- End function
	.def	_Engine_Start;
	.scl	2;
	.type	32;
	.endef
	.globl	_Engine_Start                   # -- Begin function Engine_Start
	.p2align	4
_Engine_Start:                          # @Engine_Start
# %bb.0:
	calll	_Watchdog_Reset
	movb	$0, _Engine_PhaseStop
	movl	$0, _systickcount
	xorps	%xmm0, %xmm0
	movsd	%xmm0, _curdelay
	movsd	%xmm0, _maxdelay
	movsd	%xmm0, _mindelay
	movl	$0, _uiEnd+4
	movl	$0, _uiEnd
	movl	$0, _uiBegin+4
	movl	$0, _uiBegin
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB8_2
# %bb.1:
	movb	$1, 32(%eax)
LBB8_2:
	movl	$6, _status_engine
	retl
                                        # -- End function
	.def	_Engine_IsStart;
	.scl	2;
	.type	32;
	.endef
	.globl	_Engine_IsStart                 # -- Begin function Engine_IsStart
	.p2align	4
_Engine_IsStart:                        # @Engine_IsStart
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB9_1
# %bb.3:
	movzbl	32(%eax), %eax
                                        # kill: def $al killed $al killed $eax
	retl
LBB9_1:
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	retl
                                        # -- End function
	.def	_Engine_WaitStop;
	.scl	2;
	.type	32;
	.endef
	.globl	_Engine_WaitStop                # -- Begin function Engine_WaitStop
	.p2align	4
_Engine_WaitStop:                       # @Engine_WaitStop
# %bb.0:
	cmpb	$0, _Engine_PhaseStop
	jne	LBB10_3
	.p2align	4
LBB10_1:                                # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	$1
	calll	_knRtSleep
	addl	$4, %esp
	cmpb	$0, _Engine_PhaseStop
	je	LBB10_1
LBB10_3:                                # %.loopexit
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_status_engine                  # @status_engine
	.p2align	2, 0x0
_status_engine:
	.long	0                               # 0x0

	.globl	_hSQengineThread                # @hSQengineThread
	.p2align	1, 0x0
_hSQengineThread:
	.short	0                               # 0x0

	.globl	_hPulseThread                   # @hPulseThread
	.p2align	1, 0x0
_hPulseThread:
	.short	0                               # 0x0

	.globl	_hPulseSem                      # @hPulseSem
	.p2align	1, 0x0
_hPulseSem:
	.short	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_05IAHGNKDM@PULSE?$AA@"
	.globl	"??_C@_05IAHGNKDM@PULSE?$AA@"   # @"??_C@_05IAHGNKDM@PULSE?$AA@"
"??_C@_05IAHGNKDM@PULSE?$AA@":
	.asciz	"PULSE"

	.section	.rdata,"dr",discard,"??_C@_0BM@MDFECNNP@Cannot?5create?5Engine_Thread?$AA@"
	.globl	"??_C@_0BM@MDFECNNP@Cannot?5create?5Engine_Thread?$AA@" # @"??_C@_0BM@MDFECNNP@Cannot?5create?5Engine_Thread?$AA@"
"??_C@_0BM@MDFECNNP@Cannot?5create?5Engine_Thread?$AA@":
	.asciz	"Cannot create Engine_Thread"

	.section	.rdata,"dr",discard,"??_C@_0CB@FNKGDICM@Cannot?5create?5Engine_PulseThread@"
	.globl	"??_C@_0CB@FNKGDICM@Cannot?5create?5Engine_PulseThread@" # @"??_C@_0CB@FNKGDICM@Cannot?5create?5Engine_PulseThread@"
"??_C@_0CB@FNKGDICM@Cannot?5create?5Engine_PulseThread@":
	.asciz	"Cannot create Engine_PulseThread"

	.section	.rdata,"dr",discard,"??_C@_06LKDHJJCH@ENGINE?$AA@"
	.globl	"??_C@_06LKDHJJCH@ENGINE?$AA@"  # @"??_C@_06LKDHJJCH@ENGINE?$AA@"
"??_C@_06LKDHJJCH@ENGINE?$AA@":
	.asciz	"ENGINE"

	.section	.rdata,"dr",discard,"??_C@_09LJDFFONP@PACEMAKER?$AA@"
	.globl	"??_C@_09LJDFFONP@PACEMAKER?$AA@" # @"??_C@_09LJDFFONP@PACEMAKER?$AA@"
"??_C@_09LJDFFONP@PACEMAKER?$AA@":
	.asciz	"PACEMAKER"

	.bss
	.globl	_Engine_PhaseStop               # @Engine_PhaseStop
_Engine_PhaseStop:
	.byte	0                               # 0x0

	.lcomm	_systickcount,4,4               # @systickcount
	.lcomm	_curdelay,8,8                   # @curdelay
	.lcomm	_maxdelay,8,8                   # @maxdelay
	.lcomm	_mindelay,8,8                   # @mindelay
	.lcomm	_uiEnd,8,8                      # @uiEnd
	.lcomm	_uiBegin,8,8                    # @uiBegin
	.globl	_lpfnSeq_Ctrl                   # @lpfnSeq_Ctrl
	.p2align	2, 0x0
_lpfnSeq_Ctrl:
	.long	0

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
	.addrsig_sym _Engine_Thread
	.addrsig_sym _Engine_PulseThread
	.addrsig_sym _Logic_Scan
	.globl	__fltused
