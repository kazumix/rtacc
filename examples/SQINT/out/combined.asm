	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"llvm-link"
	.def	_main;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_main                           # -- Begin function main
	.p2align	4
_main:                                  # @main
# %bb.0:
	pushl	8(%esp)
	pushl	8(%esp)
	calll	_plcmain
	addl	$8, %esp
	xorl	%eax, %eax
	retl
                                        # -- End function
	.def	_seq_control;
	.scl	2;
	.type	32;
	.endef
	.globl	_seq_control                    # -- Begin function seq_control
	.p2align	4
_seq_control:                           # @seq_control
# %bb.0:
	retl
                                        # -- End function
	.def	_Watchdog_Init;
	.scl	2;
	.type	32;
	.endef
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
	.def	_Api_Init;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_Init                       # -- Begin function Api_Init
	.p2align	4
_Api_Init:                              # @Api_Init
# %bb.0:
	pushl	%esi
	cmpw	$0, _hAPImbx
	je	LBB8_1
# %bb.2:                                # %Catalog.exit
	cmpw	$0, _hAPImbxRES
	je	LBB8_3
LBB8_4:
	cmpw	$0, _hAPIthread
	je	LBB8_5
LBB8_6:                                 # %Catalog.exit2
	movl	$6, _status_api
	popl	%esi
	retl
LBB8_1:
	pushl	$0
	calll	_CreateRtMailbox
	addl	$4, %esp
	movw	%ax, _hAPImbx
	movzwl	%ax, %eax
	pushl	$"??_C@_06GNHHIIJE@APIREQ?$AA@"
	pushl	%eax
	pushl	$0
	calll	_CatalogRtHandle
	addl	$12, %esp
	cmpw	$0, _hAPImbxRES
	jne	LBB8_4
LBB8_3:                                 # %Catalog.exit1
	pushl	$0
	calll	_CreateRtMailbox
	addl	$4, %esp
	movw	%ax, _hAPImbxRES
	movzwl	%ax, %eax
	pushl	$"??_C@_03LABEMFEH@API?$AA@"
	pushl	%eax
	pushl	$0
	calll	_CatalogRtHandle
	addl	$12, %esp
	pushl	$4096                           # imm = 0x1000
	calll	_AllocateRtMemory
	addl	$4, %esp
	movl	%eax, %esi
	movl	%eax, _letter
	pushl	$4096                           # imm = 0x1000
	pushl	$0
	pushl	%eax
	calll	_memset
	addl	$12, %esp
	pushl	$4096                           # imm = 0x1000
	pushl	%esi
	calll	_CreateRtMemoryHandle
	addl	$8, %esp
	movzwl	_hAPImbx, %ecx
	movzwl	_hAPImbxRES, %edx
	movzwl	%ax, %eax
	pushl	%ecx
	pushl	%eax
	pushl	%edx
	calll	_SendRtHandle
	addl	$12, %esp
	cmpw	$0, _hAPIthread
	jne	LBB8_6
LBB8_5:
	movzbl	_bBasePriority, %eax
	addb	$4, %al
	movzbl	%al, %eax
	pushl	$0
	pushl	$8192                           # imm = 0x2000
	pushl	$_Api_Thread
	pushl	%eax
	calll	_CreateRtThread
	addl	$16, %esp
	movw	%ax, _hAPIthread
	movzwl	%ax, %eax
	pushl	$"??_C@_09BGEIHPFA@APITHREAD?$AA@"
	pushl	%eax
	pushl	$0
	calll	_CatalogRtHandle
	addl	$12, %esp
	jmp	LBB8_6
                                        # -- End function
	.def	_Api_Thread;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_Thread                     # -- Begin function Api_Thread
	.p2align	4
_Api_Thread:                            # @Api_Thread
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$16, %esp
	movl	_letter, %esi
	leal	2(%esp), %edi
	leal	4(%esp), %ebx
	jmp	LBB9_1
	.p2align	4
LBB9_2:                                 #   in Loop: Header=BB9_1 Depth=1
	movl	$200, 4(%esp)
	pushl	%ebx
	calll	_Api_Dispatch
	addl	$4, %esp
LBB9_1:                                 # =>This Inner Loop Header: Depth=1
	movzwl	_hAPImbx, %eax
	pushl	%edi
	pushl	$-1
	pushl	%eax
	calll	_ReceiveRtHandle
	addl	$12, %esp
	movzwl	%ax, %ebp
	pushl	%ebp
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$6, %ax
	jne	LBB9_2
# %bb.3:                                #   in Loop: Header=BB9_1 Depth=1
	pushl	%esi
	calll	_Api_Dispatch
	addl	$4, %esp
	movzwl	_hAPImbx, %eax
	movzwl	2(%esp), %ecx
	pushl	%eax
	pushl	%ebp
	pushl	%ecx
	calll	_SendRtHandle
	addl	$12, %esp
	jmp	LBB9_1
                                        # -- End function
	.def	_Api_Dispatch;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_Dispatch                   # -- Begin function Api_Dispatch
	.p2align	4
_Api_Dispatch:                          # @Api_Dispatch
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	20(%esp), %esi
	movl	(%esi), %eax
	leal	-100(%eax), %ecx
	cmpl	$23, %ecx
	ja	LBB10_1
# %bb.20:
	jmpl	*LJTI10_0(,%ecx,4)
LBB10_4:
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	jmp	_PLCcontrol_Stop                # TAILCALL
LBB10_1:
	cmpl	$201, %eax
	je	LBB10_15
# %bb.2:
	cmpl	$200, %eax
	je	LBB10_3
LBB10_18:
	pushl	$"??_C@_00CNPNBAHC@?$AA@"
	pushl	$256                            # imm = 0x100
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	movl	$0, 4(%esi)
	jmp	LBB10_19
LBB10_11:
	calll	_Project_Load
	movl	_indicate+164, %eax
	movb	$1, (%eax)
	calll	_Retain_Load
	calll	_Logic_Swap
	calll	_Variable_Swap
	cmpb	$0, _bPrintMode
	je	LBB10_19
LBB10_3:
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	jmp	_Status_DetailDisplay           # TAILCALL
LBB10_7:
	movl	8(%esi), %ebx
	movl	12(%esi), %edi
	addl	$16, %esi
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB10_10
# %bb.8:                                # %Engine_IsStart.exit.i
	cmpb	$0, 32(%eax)
	je	LBB10_10
# %bb.9:                                # %Engine_Stop.exit.i
	movb	$0, 32(%eax)
	movl	$8, _status_engine
	calll	_Retain_Save
	movl	$8, _status_plccontrol
LBB10_10:                               # %PLCcontrol_Halt.exit
	movl	_indicate+224, %eax
	movb	$0, (%eax)
	movl	_indicate+194, %eax
	movb	$0, (%eax)
	movl	_indicate+254, %eax
	movb	$0, (%eax)
	movl	_indicate+284, %eax
	movb	$1, (%eax)
	movl	_indicate+674, %eax
	movl	%ebx, (%eax)
	pushl	%esi
	pushl	%ebx
	pushl	%edi
	calll	_Errorlog_Add
	addl	$12, %esp
	pushl	$"??_C@_0N@OKJONGND@Api_Dispatch?$AA@"
	pushl	$65518                          # imm = 0xFFEE
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB10_19
LBB10_12:
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	jmp	_Retain_Save                    # TAILCALL
LBB10_5:
	calll	_Retain_Save
	calll	_Variable_Reset_All
	calll	*__imp__EgTagSetDefaultValue
	calll	_Retain_Load
LBB10_6:
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	jmp	_PLCcontrol_Start               # TAILCALL
LBB10_13:
	calll	_Retain_Save
	calll	_Variable_Reset_All
	calll	*__imp__EgTagSetDefaultValue
LBB10_14:
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	jmp	_Retain_Load                    # TAILCALL
LBB10_15:
	pushl	$L_str.4
	calll	_puts
	addl	$4, %esp
	movl	_RUNplcLogic, %esi
	testl	%esi, %esi
	je	LBB10_21
# %bb.16:                               # %.preheader.i.preheader
	movl	$1, %edi
	xorl	%ebx, %ebx
	.p2align	4
LBB10_17:                               # %.preheader.i
                                        # =>This Inner Loop Header: Depth=1
	movl	12(%esi), %eax
	cmpl	$_VARIANT_EMPTY, %eax
	cmovel	%ebx, %eax
	movl	8(%esi), %ecx
	cmpl	$_VARIANT_EMPTY, %ecx
	cmovel	%ebx, %ecx
	movl	(%esi), %edx
	movl	4(%esi), %ebp
	cmpl	$_VARIANT_EMPTY, %ebp
	cmovel	%ebx, %ebp
	pushl	20(%esi)
	pushl	16(%esi)
	pushl	%eax
	pushl	%ecx
	pushl	%ebp
	pushl	(%edx)
	pushl	%edi
	pushl	$"??_C@_0CI@IHKJGMPN@?5?5line?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5?5?$CF0@"
	calll	_printf
	addl	$32, %esp
	movl	24(%esi), %esi
	incl	%edi
	testl	%esi, %esi
	jne	LBB10_17
	jmp	LBB10_19
LBB10_21:
	pushl	$L_str.1.254
	calll	_puts
	addl	$4, %esp
LBB10_19:                               # %Logic_Disasm.exit
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI10_0:
	.long	LBB10_4
	.long	LBB10_13
	.long	LBB10_18
	.long	LBB10_18
	.long	LBB10_18
	.long	LBB10_18
	.long	LBB10_18
	.long	LBB10_18
	.long	LBB10_18
	.long	LBB10_18
	.long	LBB10_5
	.long	LBB10_6
	.long	LBB10_18
	.long	LBB10_18
	.long	LBB10_18
	.long	LBB10_18
	.long	LBB10_18
	.long	LBB10_18
	.long	LBB10_18
	.long	LBB10_18
	.long	LBB10_11
	.long	LBB10_7
	.long	LBB10_12
	.long	LBB10_14
                                        # -- End function
	.def	_Api_DumpLog;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Api_DumpLog                    # -- Begin function Api_DumpLog
	.p2align	4
_Api_DumpLog:                           # @Api_DumpLog
# %bb.0:
	jmp	_Status_DetailDisplay           # TAILCALL
                                        # -- End function
	.def	_Api_PlcStop;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_PlcStop                    # -- Begin function Api_PlcStop
	.p2align	4
_Api_PlcStop:                           # @Api_PlcStop
# %bb.0:
	jmp	_PLCcontrol_Stop                # TAILCALL
                                        # -- End function
	.def	_Api_PlcReset;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_PlcReset                   # -- Begin function Api_PlcReset
	.p2align	4
_Api_PlcReset:                          # @Api_PlcReset
# %bb.0:
	calll	_Retain_Save
	calll	_Variable_Reset_All
	calll	*__imp__EgTagSetDefaultValue
	jmp	_Retain_Load                    # TAILCALL
                                        # -- End function
	.def	_Api_PlcStartCold;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_PlcStartCold               # -- Begin function Api_PlcStartCold
	.p2align	4
_Api_PlcStartCold:                      # @Api_PlcStartCold
# %bb.0:
	calll	_Retain_Save
	calll	_Variable_Reset_All
	calll	*__imp__EgTagSetDefaultValue
	calll	_Retain_Load
	jmp	_PLCcontrol_Start               # TAILCALL
                                        # -- End function
	.def	_Api_PlcStartWarm;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_PlcStartWarm               # -- Begin function Api_PlcStartWarm
	.p2align	4
_Api_PlcStartWarm:                      # @Api_PlcStartWarm
# %bb.0:
	jmp	_PLCcontrol_Start               # TAILCALL
                                        # -- End function
	.def	_Api_PlcHalt;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_PlcHalt                    # -- Begin function Api_PlcHalt
	.p2align	4
_Api_PlcHalt:                           # @Api_PlcHalt
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB16_3
# %bb.1:                                # %Engine_IsStart.exit.i
	cmpb	$0, 32(%eax)
	je	LBB16_3
# %bb.2:                                # %Engine_Stop.exit.i
	movb	$0, 32(%eax)
	movl	$8, _status_engine
	calll	_Retain_Save
	movl	$8, _status_plccontrol
LBB16_3:                                # %PLCcontrol_Halt.exit
	movl	_indicate+224, %eax
	movb	$0, (%eax)
	movl	_indicate+194, %eax
	movb	$0, (%eax)
	movl	_indicate+254, %eax
	movb	$0, (%eax)
	movl	_indicate+284, %eax
	movb	$1, (%eax)
	movl	_indicate+674, %eax
	movl	%esi, (%eax)
	popl	%esi
	retl
                                        # -- End function
	.def	_Api_PlcDownload;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_PlcDownload                # -- Begin function Api_PlcDownload
	.p2align	4
_Api_PlcDownload:                       # @Api_PlcDownload
# %bb.0:
	calll	_Project_Load
	movl	_indicate+164, %eax
	movb	$1, (%eax)
	calll	_Retain_Load
	calll	_Logic_Swap
	calll	_Variable_Swap
	cmpb	$0, _bPrintMode
	jne	_Status_DetailDisplay           # TAILCALL
# %bb.1:
	retl
                                        # -- End function
	.def	_Api_PlcRetainSave;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_PlcRetainSave              # -- Begin function Api_PlcRetainSave
	.p2align	4
_Api_PlcRetainSave:                     # @Api_PlcRetainSave
# %bb.0:
	jmp	_Retain_Save                    # TAILCALL
                                        # -- End function
	.def	_Api_PlcRetainLoad;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_PlcRetainLoad              # -- Begin function Api_PlcRetainLoad
	.p2align	4
_Api_PlcRetainLoad:                     # @Api_PlcRetainLoad
# %bb.0:
	jmp	_Retain_Load                    # TAILCALL
                                        # -- End function
	.def	_Api_PlcDisasm;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_PlcDisasm                  # -- Begin function Api_PlcDisasm
	.p2align	4
_Api_PlcDisasm:                         # @Api_PlcDisasm
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	$L_str.4
	calll	_puts
	addl	$4, %esp
	movl	_RUNplcLogic, %esi
	testl	%esi, %esi
	je	LBB20_4
# %bb.1:                                # %.preheader.i.preheader
	movl	$1, %edi
	xorl	%ebx, %ebx
	.p2align	4
LBB20_2:                                # %.preheader.i
                                        # =>This Inner Loop Header: Depth=1
	movl	12(%esi), %eax
	cmpl	$_VARIANT_EMPTY, %eax
	cmovel	%ebx, %eax
	movl	8(%esi), %ecx
	cmpl	$_VARIANT_EMPTY, %ecx
	cmovel	%ebx, %ecx
	movl	(%esi), %edx
	movl	4(%esi), %ebp
	cmpl	$_VARIANT_EMPTY, %ebp
	cmovel	%ebx, %ebp
	pushl	20(%esi)
	pushl	16(%esi)
	pushl	%eax
	pushl	%ecx
	pushl	%ebp
	pushl	(%edx)
	pushl	%edi
	pushl	$"??_C@_0CI@IHKJGMPN@?5?5line?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5?5?$CF0@"
	calll	_printf
	addl	$32, %esp
	movl	24(%esi), %esi
	incl	%edi
	testl	%esi, %esi
	jne	LBB20_2
	jmp	LBB20_3
LBB20_4:
	pushl	$L_str.1.254
	calll	_puts
	addl	$4, %esp
LBB20_3:                                # %Logic_Disasm.exit
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Api_StepEnable;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_StepEnable                 # -- Begin function Api_StepEnable
	.p2align	4
_Api_StepEnable:                        # @Api_StepEnable
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB21_2
# %bb.1:
	movb	$1, 33(%eax)
	movl	$6, _status_step
	movl	_indicate+254, %eax
	movb	$1, (%eax)
LBB21_2:                                # %PLCcontrol_StepEnable.exit
	retl
                                        # -- End function
	.def	_Api_StepDisable;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_StepDisable                # -- Begin function Api_StepDisable
	.p2align	4
_Api_StepDisable:                       # @Api_StepDisable
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB22_4
# %bb.1:
	movb	$0, 33(%eax)
	movl	$2, _status_step
	movzwl	35(%eax), %eax
	pushl	%eax
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$4, %ax
	jne	LBB22_3
# %bb.2:
	movl	_sqtbl, %eax
	movzwl	35(%eax), %eax
	pushl	$1
	pushl	%eax
	calll	_ReleaseRtSemaphore
	addl	$8, %esp
LBB22_3:
	movl	_indicate+254, %eax
	movb	$0, (%eax)
LBB22_4:                                # %PLCcontrol_StepDisable.exit
	retl
                                        # -- End function
	.def	_Api_StepStep;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_StepStep                   # -- Begin function Api_StepStep
	.p2align	4
_Api_StepStep:                          # @Api_StepStep
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB23_3
# %bb.1:
	movzwl	35(%eax), %eax
	pushl	%eax
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$4, %ax
	jne	LBB23_3
# %bb.2:
	movl	_sqtbl, %eax
	movzwl	35(%eax), %eax
	pushl	$1
	pushl	%eax
	calll	_ReleaseRtSemaphore
	addl	$8, %esp
LBB23_3:                                # %PLCcontrol_StepStep.exit
	retl
                                        # -- End function
	.def	_Api_Request;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_Request                    # -- Begin function Api_Request
	.p2align	4
_Api_Request:                           # @Api_Request
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	%eax
	movl	40(%esp), %ecx
	movl	24(%esp), %eax
	testl	%ecx, %ecx
	je	LBB24_2
# %bb.1:
	movl	$0, (%ecx)
LBB24_2:
	movzwl	%ax, %eax
	pushl	$0
	pushl	$"??_C@_03LABEMFEH@API?$AA@"
	pushl	%eax
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	je	LBB24_3
# %bb.4:
	movl	%esp, %ecx
	movzwl	%ax, %ebx
	pushl	%ecx
	pushl	$0
	pushl	%ebx
	calll	_ReceiveRtHandle
	addl	$12, %esp
	movl	$-1, %edi
	cmpw	$-1, %ax
	je	LBB24_14
# %bb.5:
	movzwl	%ax, %ebp
	pushl	%ebp
	calll	_MapRtSharedMemory
	addl	$4, %esp
	testl	%eax, %eax
	je	LBB24_14
# %bb.6:
	movl	%eax, %esi
	movl	36(%esp), %eax
	movl	28(%esp), %ecx
	movl	%ecx, (%esi)
	leal	4(%esi), %edi
	movl	%eax, 4(%esi)
	testl	%eax, %eax
	je	LBB24_8
# %bb.7:
	shll	$2, %eax
	movl	%esi, %ecx
	addl	$8, %ecx
	pushl	%eax
	pushl	36(%esp)
	pushl	%ecx
	calll	_memcpy
	addl	$12, %esp
LBB24_8:
	movzwl	(%esp), %eax
	pushl	%ebx
	pushl	%ebp
	pushl	%eax
	calll	_SendRtHandle
	addl	$12, %esp
	movl	%esp, %eax
	pushl	%eax
	pushl	$-1
	pushl	%ebx
	calll	_ReceiveRtHandle
	addl	$12, %esp
	movw	%ax, 2(%esp)                    # 2-byte Spill
	movl	%edi, %ebp
	movl	(%edi), %edi
	testl	%edi, %edi
	je	LBB24_9
# %bb.10:
	movl	44(%esp), %eax
	leal	4(,%edi,4), %ecx
	leal	(,%eax,4), %edx
	cmpl	%edx, %ecx
	jbe	LBB24_12
# %bb.11:
	decl	%eax
	movl	%eax, (%ebp)
	movl	%edx, %ecx
	movl	%eax, %edi
LBB24_12:
	pushl	%ecx
	pushl	%ebp
	pushl	48(%esp)
	calll	_memcpy
	addl	$12, %esp
	jmp	LBB24_13
LBB24_3:
	movl	$-1, %edi
	jmp	LBB24_14
LBB24_9:
	xorl	%edi, %edi
LBB24_13:
	pushl	%esi
	calll	_FreeRtMemory
	addl	$4, %esp
	movzwl	(%esp), %eax
	movzwl	2(%esp), %ecx                   # 2-byte Folded Reload
	pushl	%eax
	pushl	%ecx
	pushl	%ebx
	calll	_SendRtHandle
	addl	$12, %esp
LBB24_14:
	movl	%edi, %eax
	addl	$4, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Argument_PathFromFolder;
	.scl	2;
	.type	32;
	.endef
	.globl	_Argument_PathFromFolder        # -- Begin function Argument_PathFromFolder
	.p2align	4
_Argument_PathFromFolder:               # @Argument_PathFromFolder
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$136, %esp
	movl	156(%esp), %esi
	movl	152(%esp), %ebx
	pushl	160(%esp)
	pushl	$0
	pushl	%esi
	calll	_memset
	addl	$12, %esp
	leal	8(%esp), %edi
	pushl	%ebx
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
	movw	$77, 4(%esp)
	movl	$1414416722, (%esp)             # imm = 0x544E4952
	pushl	$3
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movl	%esp, %ecx
	movzwl	%ax, %eax
	pushl	$0
	pushl	%ecx
	pushl	%eax
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	movl	$92, %eax
	movl	$47, %ecx
	cmovel	%eax, %ecx
	pushl	%ecx
	pushl	%edi
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB25_2
# %bb.1:
	movb	$0, 1(%eax)
	pushl	%edi
	pushl	%esi
	calll	_strcpy
	addl	$8, %esp
LBB25_2:
	addl	$136, %esp
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
	subl	$136, %esp
	movl	156(%esp), %edi
	movl	152(%esp), %esi
	pushl	160(%esp)
	pushl	$0
	pushl	%edi
	calll	_memset
	addl	$12, %esp
	leal	8(%esp), %ebx
	pushl	%esi
	pushl	%ebx
	calll	_strcpy
	addl	$8, %esp
	movw	$77, 4(%esp)
	movl	$1414416722, (%esp)             # imm = 0x544E4952
	pushl	$3
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movl	%esp, %ecx
	movzwl	%ax, %eax
	pushl	$0
	pushl	%ecx
	pushl	%eax
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
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
	je	LBB26_3
# %bb.1:
	movb	$0, (%eax)
	testl	%esi, %esi
	je	LBB26_3
# %bb.2:
	incl	%esi
	pushl	%esi
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
LBB26_3:
	addl	$136, %esp
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
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	16(%esp), %ebx
	pushl	%ebx
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %edi
	incl	%edi
	pushl	%edi
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB27_1
# %bb.2:
	movl	%eax, %esi
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%esi, (%eax)
	movl	%edi, 4(%eax)
	movl	$"??_C@_0BC@NALIPHCK@Argument_PouFiles?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB27_3
# %bb.4:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB27_5
LBB27_1:                                # %Heap_Alloc.exit.thread
	pushl	$"??_C@_0BC@NALIPHCK@Argument_PouFiles?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB27_20
LBB27_3:
	movl	%eax, _heaplist
LBB27_5:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
	pushl	%ebx
	pushl	%esi
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
	je	LBB27_8
# %bb.6:                                # %.preheader.preheader
	movl	%eax, %edi
	.p2align	4
LBB27_7:                                # %.preheader
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
	jne	LBB27_7
LBB27_8:                                # %.loopexit
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB27_19
# %bb.9:
	cmpl	%esi, (%ecx)
	je	LBB27_10
	.p2align	4
LBB27_11:                               # %.preheader.i
                                        # =>This Inner Loop Header: Depth=1
	movl	16(%ecx), %eax
	testl	%eax, %eax
	je	LBB27_19
# %bb.12:                               #   in Loop: Header=BB27_11 Depth=1
	movl	%ecx, %edx
	movl	%eax, %ecx
	cmpl	%esi, (%eax)
	jne	LBB27_11
	jmp	LBB27_13
LBB27_10:
	movl	%ecx, %edx
	movl	%ecx, %eax
LBB27_13:                               # %.loopexit5.i
	movl	16(%eax), %ecx
	testl	%ecx, %ecx
	je	LBB27_14
# %bb.16:
	movl	%ecx, 16(%edx)
	jmp	LBB27_18
LBB27_14:
	cmpl	%eax, %edx
	je	LBB27_15
# %bb.17:
	movl	$0, 16(%edx)
	movl	%edx, _heapbottom
	jmp	LBB27_18
LBB27_15:
	movl	$0, _heaplist
	movl	$0, _heapbottom
LBB27_18:
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB27_19:                               # %Heap_Free.exit
	pushl	%esi
	calll	_free
	addl	$4, %esp
LBB27_20:                               # %Heap_Free.exit
	popl	%esi
	popl	%edi
	popl	%ebx
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
	subl	$392, %esp                      # imm = 0x188
	movl	416(%esp), %eax
	movl	(%eax), %eax
	xorps	%xmm0, %xmm0
	movups	%xmm0, 136(%esp)
	movups	%xmm0, 152(%esp)
	movups	%xmm0, 168(%esp)
	movups	%xmm0, 184(%esp)
	movups	%xmm0, 200(%esp)
	movups	%xmm0, 216(%esp)
	movups	%xmm0, 232(%esp)
	movups	%xmm0, 248(%esp)
	leal	264(%esp), %edi
	pushl	%eax
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
	movw	$77, 12(%esp)
	movl	$1414416722, 8(%esp)            # imm = 0x544E4952
	pushl	$3
	calll	_GetRtThreadHandles
	addl	$4, %esp
	leal	8(%esp), %ecx
	movzwl	%ax, %eax
	pushl	$0
	pushl	%ecx
	pushl	%eax
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	movl	$92, %esi
	movl	$47, %ebx
	movl	$47, %eax
	cmovel	%esi, %eax
	pushl	%eax
	pushl	%edi
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB28_2
# %bb.1:
	movb	$0, 1(%eax)
	leal	136(%esp), %eax
	pushl	%edi
	pushl	%eax
	calll	_strcpy
	addl	$8, %esp
LBB28_2:
	leal	136(%esp), %ebp
	pushl	%ebp
	pushl	$_WorkFolder
	calll	_strcpy
	addl	$8, %esp
	pushl	%ebp
	pushl	$_RtaFolder
	calll	_strcpy
	addl	$8, %esp
	movl	416(%esp), %eax
	movl	(%eax), %eax
	xorps	%xmm0, %xmm0
	movups	%xmm0, 120(%esp)
	movups	%xmm0, 104(%esp)
	movups	%xmm0, 88(%esp)
	movups	%xmm0, 72(%esp)
	movups	%xmm0, 56(%esp)
	movups	%xmm0, 40(%esp)
	movups	%xmm0, 24(%esp)
	movups	%xmm0, 8(%esp)
	pushl	%eax
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
	movw	$77, 4(%esp)
	movl	$1414416722, (%esp)             # imm = 0x544E4952
	pushl	$3
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movl	%esp, %ecx
	movzwl	%ax, %eax
	pushl	$0
	pushl	%ecx
	pushl	%eax
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	cmovel	%esi, %ebx
	pushl	%ebx
	pushl	%edi
	calll	_strrchr
	addl	$8, %esp
	movl	%eax, %esi
	pushl	$46
	pushl	%edi
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	leal	8(%esp), %ebx
	je	LBB28_5
# %bb.3:
	movb	$0, (%eax)
	testl	%esi, %esi
	je	LBB28_5
# %bb.4:
	incl	%esi
	pushl	%esi
	pushl	%ebx
	calll	_strcpy
	addl	$8, %esp
LBB28_5:
	pushl	%ebx
	pushl	$_BaseName
	calll	_strcpy
	addl	$8, %esp
	pushl	%ebp
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
	pushl	%ebx
	pushl	%edi
	calll	_strcat
	addl	$8, %esp
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	movl	$1096045102, 264(%esp,%eax)     # imm = 0x4154522E
	movb	$0, 268(%esp,%eax)
	pushl	%edi
	pushl	$_RtaFilePath
	calll	_strcpy
	addl	$8, %esp
	pushl	%ebp
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
	pushl	%ebx
	pushl	%edi
	calll	_strcat
	addl	$8, %esp
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	movl	$1229867310, 264(%esp,%eax)     # imm = 0x494E492E
	movb	$0, 268(%esp,%eax)
	pushl	%edi
	pushl	$_IniFilePath
	calll	_strcpy
	addl	$8, %esp
	pushl	%ebp
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
	pushl	%edi
	pushl	$_RslFolder
	calll	_strcpy
	addl	$400, %esp                      # imm = 0x190
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
	je	LBB29_1
# %bb.2:
	retl
LBB29_1:
	movb	$1, _bStepMode
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
	je	LBB30_1
# %bb.2:
	retl
LBB30_1:
	movb	$0, _bPrintMode
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
	je	LBB31_1
# %bb.2:
	retl
LBB31_1:
	movb	$1, _bPrintMode
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
	je	LBB32_1
# %bb.2:
	retl
LBB32_1:
	movb	$1, _bRemote
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
	je	LBB33_1
# %bb.2:
	popl	%esi
	retl
LBB33_1:
	addl	$10, %esi
	pushl	%esi
	calll	_atoi
	addl	$4, %esp
	movb	%al, _bBasePriority
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
	je	LBB34_1
# %bb.2:
	popl	%esi
	retl
LBB34_1:
	addl	$10, %esi
	pushl	%esi
	calll	_atoi
	addl	$4, %esp
	movl	%eax, _dwScanFreq
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
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$392, %esp                      # imm = 0x188
	movl	412(%esp), %esi
	pushl	$8
	pushl	$"??_C@_08PPAPKFEF@?9INTPRT?1?$AA@"
	pushl	%esi
	calll	_strnicmp
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB35_7
# %bb.1:
	movb	$1, _byRunMode
	addl	$8, %esi
	pushl	%esi
	pushl	$_MnmFilePath
	calll	_strcpy
	addl	$8, %esp
	xorps	%xmm0, %xmm0
	movups	%xmm0, 136(%esp)
	movups	%xmm0, 152(%esp)
	movups	%xmm0, 168(%esp)
	movups	%xmm0, 184(%esp)
	movups	%xmm0, 200(%esp)
	movups	%xmm0, 216(%esp)
	movups	%xmm0, 232(%esp)
	movups	%xmm0, 248(%esp)
	leal	264(%esp), %ebx
	pushl	$_MnmFilePath
	pushl	%ebx
	calll	_strcpy
	addl	$8, %esp
	movw	$77, 12(%esp)
	movl	$1414416722, 8(%esp)            # imm = 0x544E4952
	pushl	$3
	calll	_GetRtThreadHandles
	addl	$4, %esp
	leal	8(%esp), %edi
	movzwl	%ax, %eax
	pushl	$0
	pushl	%edi
	pushl	%eax
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	movl	$92, %ebp
	movl	$47, %esi
	movl	$47, %eax
	cmovel	%ebp, %eax
	pushl	%eax
	pushl	%ebx
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB35_3
# %bb.2:
	movb	$0, 1(%eax)
	leal	136(%esp), %eax
	pushl	%ebx
	pushl	%eax
	calll	_strcpy
	addl	$8, %esp
LBB35_3:
	leal	136(%esp), %eax
	pushl	%eax
	pushl	$_WorkFolder
	calll	_strcpy
	addl	$8, %esp
	xorps	%xmm0, %xmm0
	movups	%xmm0, 8(%esp)
	movups	%xmm0, 24(%esp)
	movups	%xmm0, 40(%esp)
	movups	%xmm0, 56(%esp)
	movups	%xmm0, 72(%esp)
	movups	%xmm0, 88(%esp)
	movups	%xmm0, 104(%esp)
	movups	%xmm0, 120(%esp)
	pushl	$_MnmFilePath
	pushl	%ebx
	calll	_strcpy
	addl	$8, %esp
	movw	$77, 4(%esp)
	movl	$1414416722, (%esp)             # imm = 0x544E4952
	pushl	$3
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movl	%esp, %ecx
	movzwl	%ax, %eax
	pushl	$0
	pushl	%ecx
	pushl	%eax
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	cmovel	%ebp, %esi
	pushl	%esi
	pushl	%ebx
	calll	_strrchr
	addl	$8, %esp
	movl	%eax, %esi
	pushl	$46
	pushl	%ebx
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB35_6
# %bb.4:
	movb	$0, (%eax)
	testl	%esi, %esi
	je	LBB35_6
# %bb.5:
	incl	%esi
	pushl	%esi
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
LBB35_6:
	pushl	%edi
	pushl	$_BaseName
	calll	_strcpy
	addl	$8, %esp
LBB35_7:
	addl	$392, %esp                      # imm = 0x188
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
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
	je	LBB36_1
# %bb.2:
	popl	%esi
	retl
LBB36_1:
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
	je	LBB37_1
# %bb.2:
	popl	%esi
	retl
LBB37_1:
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
	je	LBB38_1
# %bb.2:
	popl	%esi
	retl
LBB38_1:
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
	jl	LBB39_21
# %bb.1:
	movl	$1, %ebp
	movl	%esp, %ebx
	movl	$4543567, %edi                  # imm = 0x45544F
	jmp	LBB39_2
	.p2align	4
LBB39_20:                               #   in Loop: Header=BB39_2 Depth=1
	incl	%ebp
	cmpl	%ebp, %esi
	je	LBB39_21
LBB39_2:                                # =>This Inner Loop Header: Depth=1
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
	jne	LBB39_4
# %bb.3:                                #   in Loop: Header=BB39_2 Depth=1
	movb	$1, _bStepMode
LBB39_4:                                #   in Loop: Header=BB39_2 Depth=1
	pushl	$9
	pushl	$"??_C@_08OIIOOAJL@?9NOPRINT?$AA@"
	pushl	%ebx
	calll	_memcmp
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB39_6
# %bb.5:                                #   in Loop: Header=BB39_2 Depth=1
	movb	$0, _bPrintMode
LBB39_6:                                #   in Loop: Header=BB39_2 Depth=1
	movl	(%esp), %eax
	movl	$1230131245, %ecx               # imm = 0x4952502D
	xorl	%ecx, %eax
	movl	3(%esp), %ecx
	movl	$5525065, %edx                  # imm = 0x544E49
	xorl	%edx, %ecx
	orl	%eax, %ecx
	jne	LBB39_8
# %bb.7:                                #   in Loop: Header=BB39_2 Depth=1
	movb	$1, _bPrintMode
LBB39_8:                                #   in Loop: Header=BB39_2 Depth=1
	movl	(%esp), %eax
	movl	$1296388653, %ecx               # imm = 0x4D45522D
	xorl	%ecx, %eax
	movl	4(%esp), %ecx
	xorl	%edi, %ecx
	orl	%eax, %ecx
	jne	LBB39_10
# %bb.9:                                #   in Loop: Header=BB39_2 Depth=1
	movb	$1, _bRemote
LBB39_10:                               #   in Loop: Header=BB39_2 Depth=1
	pushl	$10
	pushl	$"??_C@_0L@JJOKJJEO@?9PRIORITY?1?$AA@"
	pushl	%ebx
	calll	_strnicmp
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB39_12
# %bb.11:                               #   in Loop: Header=BB39_2 Depth=1
	leal	10(%esp), %eax
	pushl	%eax
	calll	_atoi
	addl	$4, %esp
	movb	%al, _bBasePriority
LBB39_12:                               #   in Loop: Header=BB39_2 Depth=1
	pushl	$10
	pushl	$"??_C@_0L@JJLIHFKL@?9SCANRATE?1?$AA@"
	pushl	%ebx
	calll	_strnicmp
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB39_14
# %bb.13:                               #   in Loop: Header=BB39_2 Depth=1
	leal	10(%esp), %eax
	pushl	%eax
	calll	_atoi
	addl	$4, %esp
	movl	%eax, _dwScanFreq
LBB39_14:                               #   in Loop: Header=BB39_2 Depth=1
	pushl	%ebx
	calll	_Argument_Intprt
	addl	$4, %esp
	pushl	$5
	pushl	$"??_C@_05HGAABLCC@?9POU?1?$AA@"
	pushl	%ebx
	calll	_strnicmp
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB39_16
# %bb.15:                               #   in Loop: Header=BB39_2 Depth=1
	leal	5(%esp), %eax
	pushl	%eax
	calll	_Argument_PouFiles
	addl	$4, %esp
LBB39_16:                               #   in Loop: Header=BB39_2 Depth=1
	pushl	$7
	pushl	$"??_C@_07BAHIKDNH@?9BEGIN?1?$AA@"
	pushl	%ebx
	calll	_strnicmp
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB39_18
# %bb.17:                               #   in Loop: Header=BB39_2 Depth=1
	leal	7(%esp), %eax
	pushl	%eax
	calll	_Poufile_Set_Begin
	addl	$4, %esp
LBB39_18:                               #   in Loop: Header=BB39_2 Depth=1
	pushl	$7
	pushl	$"??_C@_07FINFNJEP@?9FINAL?1?$AA@"
	pushl	%ebx
	calll	_strnicmp
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB39_20
# %bb.19:                               #   in Loop: Header=BB39_2 Depth=1
	leal	7(%esp), %eax
	pushl	%eax
	calll	_Poufile_Set_Final
	addl	$4, %esp
	jmp	LBB39_20
LBB39_21:                               # %.loopexit
	addl	$512, %esp                      # imm = 0x200
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Basicfunction_Load;
	.scl	2;
	.type	32;
	.endef
	.globl	_Basicfunction_Load             # -- Begin function Basicfunction_Load
	.p2align	4
_Basicfunction_Load:                    # @Basicfunction_Load
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	pushl	%esi
	calll	_INtime_RslLoad
	addl	$4, %esp
	movw	%ax, _hBasicFuncRSL
	testw	%ax, %ax
	je	LBB40_4
# %bb.1:
	movzwl	%ax, %eax
	pushl	$"??_C@_0P@FHFAIKGM@BasicFunctions?$AA@"
	pushl	%eax
	calll	_GetRtProcAddress
	addl	$8, %esp
	movl	%eax, _BasicFunctions
	movzwl	_hBasicFuncRSL, %eax
	pushl	$"??_C@_0BC@OECJMJAO@NumBasicFunctions?$AA@"
	pushl	%eax
	calll	_GetRtProcAddress
	addl	$8, %esp
	cmpl	$0, _BasicFunctions
	je	LBB40_5
# %bb.2:
	testl	%eax, %eax
	je	LBB40_5
# %bb.3:
	movzwl	(%eax), %eax
	movw	%ax, _NumBasicFunctions
	movl	$6, _status_basicfunc
LBB40_4:
	popl	%esi
	retl
LBB40_5:
	pushl	%esi
	pushl	$208
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_Basicfunction_Unload;
	.scl	2;
	.type	32;
	.endef
	.globl	_Basicfunction_Unload           # -- Begin function Basicfunction_Unload
	.p2align	4
_Basicfunction_Unload:                  # @Basicfunction_Unload
# %bb.0:
	movzwl	_hBasicFuncRSL, %eax
	testw	%ax, %ax
	je	LBB41_2
# %bb.1:
	movzwl	%ax, %eax
	pushl	%eax
	calll	_FreeRtLibrary
	addl	$4, %esp
	movw	$0, _hBasicFuncRSL
LBB41_2:
	movl	$0, _status_basicfunc
	retl
                                        # -- End function
	.def	_Basicfunction_CreateCatalog;
	.scl	2;
	.type	32;
	.endef
	.globl	__xmm@1032547698badcfeefcdab8967452301 # -- Begin function Basicfunction_CreateCatalog
	.section	.rdata,"dr",discard,__xmm@1032547698badcfeefcdab8967452301
	.p2align	4, 0x0
__xmm@1032547698badcfeefcdab8967452301:
	.long	1732584193                      # 0x67452301
	.long	4023233417                      # 0xefcdab89
	.long	2562383102                      # 0x98badcfe
	.long	271733878                       # 0x10325476
	.text
	.globl	_Basicfunction_CreateCatalog
	.p2align	4
_Basicfunction_CreateCatalog:           # @Basicfunction_CreateCatalog
# %bb.0:
	cmpw	$0, _NumBasicFunctions
	je	LBB42_11
# %bb.1:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$112, %esp
	movl	_BasicFunctions, %eax
	xorl	%edx, %edx
	leal	24(%esp), %ebp
	jmp	LBB42_2
	.p2align	4
LBB42_8:                                #   in Loop: Header=BB42_2 Depth=1
	movl	%edx, _InstructionCatalog(,%ecx,4)
LBB42_9:                                #   in Loop: Header=BB42_2 Depth=1
	movl	4(%esp), %edx                   # 4-byte Reload
	incl	%edx
	movzwl	_NumBasicFunctions, %ecx
	cmpl	%ecx, %edx
	jae	LBB42_10
LBB42_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB42_5 Depth 2
	leal	(%edx,%edx,8), %ecx
	movl	%edx, 4(%esp)                   # 4-byte Spill
	leal	(%edx,%ecx,2), %ecx
	movl	%ecx, (%esp)                    # 4-byte Spill
	movl	(%eax,%ecx), %edi
	movaps	__xmm@1032547698badcfeefcdab8967452301, %xmm0 # xmm0 = [1732584193,4023233417,2562383102,271733878]
	movups	%xmm0, 24(%esp)
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %ebx
	leal	(,%eax,8), %eax
	movl	%eax, 40(%esp)
	movl	%ebx, %eax
	shrl	$29, %eax
	movl	%eax, 44(%esp)
	movl	$0, %eax
	cmpl	$64, %ebx
	jb	LBB42_6
# %bb.3:                                #   in Loop: Header=BB42_2 Depth=1
	movups	48(%edi), %xmm0
	leal	48(%esp), %edx
	movups	%xmm0, 48(%edx)
	movups	32(%edi), %xmm0
	movups	%xmm0, 32(%edx)
	movups	(%edi), %xmm0
	movups	16(%edi), %xmm1
	movups	%xmm1, 16(%edx)
	movups	%xmm0, (%edx)
	movl	%ebp, %ecx
	calll	_MD5Transform
	movl	$64, %eax
	cmpl	$128, %ebx
	jb	LBB42_6
# %bb.4:                                # %.preheader.i.i.i.preheader
                                        #   in Loop: Header=BB42_2 Depth=1
	movl	$64, %esi
	.p2align	4
LBB42_5:                                # %.preheader.i.i.i
                                        #   Parent Loop BB42_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	(%edi,%esi), %edx
	movl	%ebp, %ecx
	calll	_MD5Transform
	leal	64(%esi), %eax
	addl	$127, %esi
	cmpl	%ebx, %esi
	movl	%eax, %esi
	jb	LBB42_5
LBB42_6:                                # %Instruction_CalcHash.exit
                                        #   in Loop: Header=BB42_2 Depth=1
	subl	%eax, %ebx
	addl	%eax, %edi
	pushl	%ebx
	pushl	%edi
	leal	56(%esp), %eax
	pushl	%eax
	calll	_memcpy
	addl	$12, %esp
	pushl	%ebp
	leal	12(%esp), %eax
	pushl	%eax
	calll	_MD5Final
	addl	$8, %esp
	movzwl	12(%esp), %ecx
	movl	_BasicFunctions, %eax
	movl	(%esp), %edx                    # 4-byte Reload
	addl	%eax, %edx
	cmpl	$0, _InstructionCatalog(,%ecx,4)
	je	LBB42_8
# %bb.7:                                #   in Loop: Header=BB42_2 Depth=1
	pushl	(%edx)
	pushl	$"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@"
	calll	_printf
	addl	$8, %esp
	movl	_BasicFunctions, %eax
	jmp	LBB42_9
LBB42_10:
	addl	$112, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
LBB42_11:                               # %.loopexit
	movl	$2, _status_basicfunc
	xorl	%eax, %eax
	retl
                                        # -- End function
	.def	_Basicfunction_Display;
	.scl	2;
	.type	32;
	.endef
	.globl	_Basicfunction_Display          # -- Begin function Basicfunction_Display
	.p2align	4
_Basicfunction_Display:                 # @Basicfunction_Display
# %bb.0:
	pushl	%edi
	pushl	%esi
	pushl	$L_str
	calll	_puts
	addl	$4, %esp
	cmpw	$0, _NumBasicFunctions
	je	LBB43_4
# %bb.1:                                # %.preheader.preheader
	movl	$1, %edi
	xorl	%esi, %esi
	.p2align	4
LBB43_2:                                # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	_BasicFunctions, %eax
	pushl	13(%eax,%esi)
	pushl	(%eax,%esi)
	pushl	%edi
	pushl	$"??_C@_0BM@NHPPFOEA@?5?5function?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@"
	calll	_printf
	addl	$16, %esp
	movzwl	_NumBasicFunctions, %eax
	addl	$19, %esi
	cmpl	%eax, %edi
	leal	1(%edi), %edi
	jb	LBB43_2
	jmp	LBB43_3
LBB43_4:
	pushl	$L_str.1.254
	calll	_puts
	addl	$4, %esp
LBB43_3:                                # %.loopexit
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Bitfield_Check;
	.scl	2;
	.type	32;
	.endef
	.globl	_Bitfield_Check                 # -- Begin function Bitfield_Check
	.p2align	4
_Bitfield_Check:                        # @Bitfield_Check
# %bb.0:
	pushl	%esi
	pushl	%eax
	movl	12(%esp), %esi
	movl	16(%esp), %eax
	movb	$0, 2(%esi)
	movw	$0, (%esi)
	testl	%eax, %eax
	je	LBB44_4
# %bb.1:
	movl	$-1, (%esp)
	pushl	$46
	pushl	%eax
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB44_4
# %bb.2:
	movl	%esp, %ecx
	pushl	%ecx
	pushl	$"??_C@_04HGICJEGC@?4X?$CFd?$AA@"
	pushl	%eax
	calll	_sscanf
	addl	$12, %esp
	cmpl	$1, %eax
	sete	%cl
	movl	(%esp), %eax
	cmpl	$64, %eax
	setb	%dl
	andb	%cl, %dl
	cmpb	$1, %dl
	jne	LBB44_4
# %bb.3:
	movb	$1, (%esi)
	movb	%al, 1(%esi)
	movb	$0, 2(%esi)
LBB44_4:
	movl	%esi, %eax
	addl	$4, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_LD_byte;
	.scl	2;
	.type	32;
	.endef
	.globl	_LD_byte                        # -- Begin function LD_byte
	.p2align	4
_LD_byte:                               # @LD_byte
# %bb.0:
	pushl	%ebx
	movl	12(%esp), %ecx
	movl	8(%esp), %eax
	cmpb	$0, 12(%ecx)
	je	LBB45_2
# %bb.1:
	movl	(%ecx), %edx
	movzbl	(%edx), %edx
	movzbl	13(%ecx), %ecx
	btl	%ecx, %edx
	setb	%cl
	jmp	LBB45_3
LBB45_2:
	movl	(%ecx), %edx
	movzbl	(%edx), %edx
	movl	%edx, %ebx
	andb	$1, %bl
	cmpw	$1536, 4(%ecx)                  # imm = 0x600
	movzbl	%bl, %ecx
	cmovnel	%edx, %ecx
LBB45_3:
	movb	%cl, (%eax)
	popl	%ebx
	retl
                                        # -- End function
	.def	_LDN_byte;
	.scl	2;
	.type	32;
	.endef
	.globl	_LDN_byte                       # -- Begin function LDN_byte
	.p2align	4
_LDN_byte:                              # @LDN_byte
# %bb.0:
	movl	8(%esp), %ecx
	movl	4(%esp), %eax
	cmpb	$0, 12(%ecx)
	je	LBB46_2
# %bb.1:
	movl	(%ecx), %edx
	movzbl	(%edx), %edx
	movzbl	13(%ecx), %ecx
	shrl	%cl, %edx
	jmp	LBB46_3
LBB46_2:
	cmpw	$1536, 4(%ecx)                  # imm = 0x600
	movl	(%ecx), %ecx
	movzbl	(%ecx), %edx
	jne	LBB46_4
LBB46_3:
	notb	%dl
	andb	$1, %dl
	movb	%dl, (%eax)
	retl
LBB46_4:
	notb	%dl
	movb	%dl, (%eax)
	retl
                                        # -- End function
	.def	_LD_word;
	.scl	2;
	.type	32;
	.endef
	.globl	_LD_word                        # -- Begin function LD_word
	.p2align	4
_LD_word:                               # @LD_word
# %bb.0:
	pushl	%esi
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpb	$0, 12(%edx)
	movl	(%edx), %ecx
	movzwl	(%ecx), %ecx
	je	LBB47_2
# %bb.1:
	movzwl	%cx, %esi
	movzbl	13(%edx), %edx
	xorl	%ecx, %ecx
	btl	%edx, %esi
	setb	%cl
LBB47_2:
	movw	%cx, (%eax)
	popl	%esi
	retl
                                        # -- End function
	.def	_LDN_word;
	.scl	2;
	.type	32;
	.endef
	.globl	_LDN_word                       # -- Begin function LDN_word
	.p2align	4
_LDN_word:                              # @LDN_word
# %bb.0:
	pushl	%esi
	movl	12(%esp), %ecx
	movl	8(%esp), %eax
	cmpb	$0, 12(%ecx)
	movl	(%ecx), %edx
	movzwl	(%edx), %edx
	je	LBB48_2
# %bb.1:
	movzbl	13(%ecx), %esi
	xorl	%ecx, %ecx
	btl	%esi, %edx
	setae	%cl
	jmp	LBB48_3
LBB48_2:
	notl	%edx
	movl	%edx, %ecx
LBB48_3:
	movw	%cx, (%eax)
	popl	%esi
	retl
                                        # -- End function
	.def	_LD_dword;
	.scl	2;
	.type	32;
	.endef
	.globl	_LD_dword                       # -- Begin function LD_dword
	.p2align	4
_LD_dword:                              # @LD_dword
# %bb.0:
	pushl	%ebx
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpb	$0, 12(%edx)
	movl	(%edx), %ecx
	movl	(%ecx), %ecx
	je	LBB49_2
# %bb.1:
	movzbl	13(%edx), %edx
	xorl	%ebx, %ebx
	btl	%edx, %ecx
	setb	%bl
	movl	%ebx, %ecx
LBB49_2:
	movl	%ecx, (%eax)
	popl	%ebx
	retl
                                        # -- End function
	.def	_LDN_dword;
	.scl	2;
	.type	32;
	.endef
	.globl	_LDN_dword                      # -- Begin function LDN_dword
	.p2align	4
_LDN_dword:                             # @LDN_dword
# %bb.0:
	pushl	%esi
	movl	12(%esp), %ecx
	movl	8(%esp), %eax
	cmpb	$0, 12(%ecx)
	movl	(%ecx), %edx
	movl	(%edx), %edx
	je	LBB50_2
# %bb.1:
	movzbl	13(%ecx), %esi
	xorl	%ecx, %ecx
	btl	%esi, %edx
	setae	%cl
	jmp	LBB50_3
LBB50_2:
	notl	%edx
	movl	%edx, %ecx
LBB50_3:
	movl	%ecx, (%eax)
	popl	%esi
	retl
                                        # -- End function
	.def	_LD_qword;
	.scl	2;
	.type	32;
	.endef
	.globl	_LD_qword                       # -- Begin function LD_qword
	.p2align	4
_LD_qword:                              # @LD_qword
# %bb.0:
	pushl	%ebx
	pushl	%esi
	movl	12(%esp), %esi
	movl	16(%esp), %eax
	movl	(%eax), %eax
	movl	(%eax), %ebx
	movl	4(%eax), %ecx
	.p2align	4
LBB51_1:                                # =>This Inner Loop Header: Depth=1
	movl	(%esi), %eax
	movl	4(%esi), %edx
	lock		cmpxchg8b	(%esi)
	jne	LBB51_1
# %bb.2:                                # %Variable_Copy64.exit
	popl	%esi
	popl	%ebx
	retl
                                        # -- End function
	.def	_LDN_qword;
	.scl	2;
	.type	32;
	.endef
	.globl	_LDN_qword                      # -- Begin function LDN_qword
	.p2align	4
_LDN_qword:                             # @LDN_qword
# %bb.0:
	pushl	%ebx
	pushl	%esi
	movl	12(%esp), %esi
	movl	16(%esp), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	notl	%eax
	movl	(%eax), %ebx
	movl	4(%eax), %ecx
	.p2align	4
LBB52_1:                                # =>This Inner Loop Header: Depth=1
	movl	(%esi), %eax
	movl	4(%esi), %edx
	lock		cmpxchg8b	(%esi)
	jne	LBB52_1
# %bb.2:                                # %Variable_Copy64.exit
	popl	%esi
	popl	%ebx
	retl
                                        # -- End function
	.def	_LD_string;
	.scl	2;
	.type	32;
	.endef
	.globl	_LD_string                      # -- Begin function LD_string
	.p2align	4
_LD_string:                             # @LD_string
# %bb.0:
	movl	4(%esp), %eax
	movl	8(%esp), %ecx
	movl	(%ecx), %ecx
	testl	%eax, %eax
	sete	%dl
	testl	%ecx, %ecx
	sete	%dh
	orb	%dl, %dh
	jne	LBB53_2
# %bb.1:
	movl	79(%ecx), %edx
	movl	%edx, 79(%eax)
	movups	64(%ecx), %xmm0
	movups	%xmm0, 64(%eax)
	movups	48(%ecx), %xmm0
	movups	%xmm0, 48(%eax)
	movups	32(%ecx), %xmm0
	movups	%xmm0, 32(%eax)
	movups	(%ecx), %xmm0
	movups	16(%ecx), %xmm1
	movups	%xmm1, 16(%eax)
	movups	%xmm0, (%eax)
LBB53_2:                                # %String_Copy.exit
	retl
                                        # -- End function
	.def	_ST_string;
	.scl	2;
	.type	32;
	.endef
	.globl	_ST_string                      # -- Begin function ST_string
	.p2align	4
_ST_string:                             # @ST_string
# %bb.0:
	movl	8(%esp), %ecx
	movl	4(%esp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	sete	%dl
	testl	%ecx, %ecx
	sete	%dh
	orb	%dl, %dh
	jne	LBB54_2
# %bb.1:
	movl	79(%ecx), %edx
	movl	%edx, 79(%eax)
	movups	64(%ecx), %xmm0
	movups	%xmm0, 64(%eax)
	movups	48(%ecx), %xmm0
	movups	%xmm0, 48(%eax)
	movups	32(%ecx), %xmm0
	movups	%xmm0, 32(%eax)
	movups	(%ecx), %xmm0
	movups	16(%ecx), %xmm1
	movups	%xmm1, 16(%eax)
	movups	%xmm0, (%eax)
LBB54_2:                                # %String_Copy.exit
	retl
                                        # -- End function
	.def	_ST_byte;
	.scl	2;
	.type	32;
	.endef
	.globl	_ST_byte                        # -- Begin function ST_byte
	.p2align	4
_ST_byte:                               # @ST_byte
# %bb.0:
	pushl	%ebx
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpb	$0, 12(%eax)
	je	LBB55_2
# %bb.1:
	movzbl	13(%eax), %ecx
	movl	$1, %ebx
	shll	%cl, %ebx
	movl	(%eax), %ecx
	notb	%bl
	andb	%bl, (%ecx)
	movzbl	(%edx), %edx
	andl	$1, %edx
	movzbl	13(%eax), %ecx
	shll	%cl, %edx
	movl	(%eax), %eax
	orb	%dl, (%eax)
	popl	%ebx
	retl
LBB55_2:
	movzbl	(%edx), %ecx
	movl	(%eax), %eax
	movb	%cl, (%eax)
	popl	%ebx
	retl
                                        # -- End function
	.def	_STN_byte;
	.scl	2;
	.type	32;
	.endef
	.globl	_STN_byte                       # -- Begin function STN_byte
	.p2align	4
_STN_byte:                              # @STN_byte
# %bb.0:
	pushl	%ebx
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpb	$0, 12(%eax)
	je	LBB56_2
# %bb.1:
	movzbl	13(%eax), %ecx
	movl	$1, %ebx
	shll	%cl, %ebx
	movl	(%eax), %ecx
	notb	%bl
	andb	%bl, (%ecx)
	movzbl	(%edx), %edx
	notl	%edx
	andl	$1, %edx
	movzbl	13(%eax), %ecx
	shll	%cl, %edx
	movl	(%eax), %eax
	orb	%dl, (%eax)
	popl	%ebx
	retl
LBB56_2:
	movzbl	(%edx), %ecx
	notb	%cl
	movl	(%eax), %eax
	movb	%cl, (%eax)
	popl	%ebx
	retl
                                        # -- End function
	.def	_ST_word;
	.scl	2;
	.type	32;
	.endef
	.globl	_ST_word                        # -- Begin function ST_word
	.p2align	4
_ST_word:                               # @ST_word
# %bb.0:
	pushl	%esi
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpb	$0, 12(%eax)
	je	LBB57_2
# %bb.1:
	movzbl	13(%eax), %ecx
	movl	$-2, %esi
	roll	%cl, %esi
	movl	(%eax), %ecx
	andw	%si, (%ecx)
	movzwl	(%edx), %edx
	andl	$1, %edx
	movzbl	13(%eax), %ecx
	shll	%cl, %edx
	movl	(%eax), %eax
	orw	%dx, (%eax)
	popl	%esi
	retl
LBB57_2:
	movzwl	(%edx), %ecx
	movl	(%eax), %eax
	movw	%cx, (%eax)
	popl	%esi
	retl
                                        # -- End function
	.def	_STN_word;
	.scl	2;
	.type	32;
	.endef
	.globl	_STN_word                       # -- Begin function STN_word
	.p2align	4
_STN_word:                              # @STN_word
# %bb.0:
	pushl	%esi
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpb	$0, 12(%eax)
	je	LBB58_2
# %bb.1:
	movzbl	13(%eax), %ecx
	movl	$-2, %esi
	roll	%cl, %esi
	movl	(%eax), %ecx
	andw	%si, (%ecx)
	movzwl	(%edx), %edx
	notl	%edx
	andl	$1, %edx
	movzbl	13(%eax), %ecx
	shll	%cl, %edx
	movl	(%eax), %eax
	orw	%dx, (%eax)
	popl	%esi
	retl
LBB58_2:
	movzwl	(%edx), %ecx
	notl	%ecx
	movl	(%eax), %eax
	movw	%cx, (%eax)
	popl	%esi
	retl
                                        # -- End function
	.def	_ST_dword;
	.scl	2;
	.type	32;
	.endef
	.globl	_ST_dword                       # -- Begin function ST_dword
	.p2align	4
_ST_dword:                              # @ST_dword
# %bb.0:
	pushl	%esi
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpb	$0, 12(%eax)
	je	LBB59_2
# %bb.1:
	movzbl	13(%eax), %ecx
	movl	$-2, %esi
	roll	%cl, %esi
	movl	(%eax), %ecx
	andl	%esi, (%ecx)
	movl	(%edx), %edx
	andl	$1, %edx
	movzbl	13(%eax), %ecx
	shll	%cl, %edx
	movl	(%eax), %eax
	orl	%edx, (%eax)
	popl	%esi
	retl
LBB59_2:
	movl	(%edx), %ecx
	movl	(%eax), %eax
	movl	%ecx, (%eax)
	popl	%esi
	retl
                                        # -- End function
	.def	_STN_dword;
	.scl	2;
	.type	32;
	.endef
	.globl	_STN_dword                      # -- Begin function STN_dword
	.p2align	4
_STN_dword:                             # @STN_dword
# %bb.0:
	pushl	%esi
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpb	$0, 12(%eax)
	je	LBB60_2
# %bb.1:
	movzbl	13(%eax), %ecx
	movl	$-2, %esi
	roll	%cl, %esi
	movl	(%eax), %ecx
	andl	%esi, (%ecx)
	movl	(%edx), %edx
	notl	%edx
	andl	$1, %edx
	movzbl	13(%eax), %ecx
	shll	%cl, %edx
	movl	(%eax), %eax
	orl	%edx, (%eax)
	popl	%esi
	retl
LBB60_2:
	movl	(%edx), %ecx
	notl	%ecx
	movl	(%eax), %eax
	movl	%ecx, (%eax)
	popl	%esi
	retl
                                        # -- End function
	.def	_ST_qword;
	.scl	2;
	.type	32;
	.endef
	.globl	_ST_qword                       # -- Begin function ST_qword
	.p2align	4
_ST_qword:                              # @ST_qword
# %bb.0:
	pushl	%ebx
	pushl	%esi
	movl	16(%esp), %eax
	movl	12(%esp), %ecx
	movl	(%ecx), %esi
	movl	(%eax), %ebx
	movl	4(%eax), %ecx
	.p2align	4
LBB61_1:                                # =>This Inner Loop Header: Depth=1
	movl	(%esi), %eax
	movl	4(%esi), %edx
	lock		cmpxchg8b	(%esi)
	jne	LBB61_1
# %bb.2:                                # %Variable_Copy64.exit
	popl	%esi
	popl	%ebx
	retl
                                        # -- End function
	.def	_STN_qword;
	.scl	2;
	.type	32;
	.endef
	.globl	_STN_qword                      # -- Begin function STN_qword
	.p2align	4
_STN_qword:                             # @STN_qword
# %bb.0:
	pushl	%ebx
	pushl	%esi
	movl	12(%esp), %eax
	movl	16(%esp), %ecx
	movl	(%ecx), %ebx
	movl	4(%ecx), %ecx
	notl	%ecx
	notl	%ebx
	movl	(%eax), %esi
	.p2align	4
LBB62_1:                                # =>This Inner Loop Header: Depth=1
	movl	(%esi), %eax
	movl	4(%esi), %edx
	lock		cmpxchg8b	(%esi)
	jne	LBB62_1
# %bb.2:                                # %Variable_Copy64.exit
	popl	%esi
	popl	%ebx
	retl
                                        # -- End function
	.def	_BlueScreen_Process;
	.scl	2;
	.type	32;
	.endef
	.globl	_BlueScreen_Process             # -- Begin function BlueScreen_Process
	.p2align	4
_BlueScreen_Process:                    # @BlueScreen_Process
# %bb.0:
	retl
                                        # -- End function
	.def	_Comment_ClearNest;
	.scl	2;
	.type	32;
	.endef
	.globl	_Comment_ClearNest              # -- Begin function Comment_ClearNest
	.p2align	4
_Comment_ClearNest:                     # @Comment_ClearNest
# %bb.0:
	movl	$0, _commentnest
	retl
                                        # -- End function
	.def	_Comment_SearchBracket;
	.scl	2;
	.type	32;
	.endef
	.globl	_Comment_SearchBracket          # -- Begin function Comment_SearchBracket
	.p2align	4
_Comment_SearchBracket:                 # @Comment_SearchBracket
# %bb.0:
	movl	8(%esp), %ecx
	movl	4(%esp), %edx
	jmp	LBB65_1
	.p2align	4
LBB65_7:                                #   in Loop: Header=BB65_1 Depth=1
	cmpb	$41, 1(%edx)
	je	LBB65_8
LBB65_10:                               #   in Loop: Header=BB65_1 Depth=1
	incl	%edx
LBB65_1:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%edx), %eax
	cmpl	$40, %eax
	je	LBB65_5
# %bb.2:                                #   in Loop: Header=BB65_1 Depth=1
	cmpl	$42, %eax
	je	LBB65_7
# %bb.3:                                #   in Loop: Header=BB65_1 Depth=1
	testl	%eax, %eax
	jne	LBB65_10
	jmp	LBB65_4
	.p2align	4
LBB65_5:                                #   in Loop: Header=BB65_1 Depth=1
	cmpb	$42, 1(%edx)
	jne	LBB65_10
# %bb.6:
	movl	$1, %eax
	movl	%edx, (%ecx)
	retl
LBB65_4:
	xorl	%edx, %edx
	movl	%edx, (%ecx)
	retl
LBB65_8:
	movl	$2, %eax
	movl	%edx, (%ecx)
	retl
                                        # -- End function
	.def	_Comment_ProcessBracket;
	.scl	2;
	.type	32;
	.endef
	.globl	_Comment_ProcessBracket         # -- Begin function Comment_ProcessBracket
	.p2align	4
_Comment_ProcessBracket:                # @Comment_ProcessBracket
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	xorl	%eax, %eax
	movl	16(%esp), %esi
	movl	%esi, %edi
	xorl	%ecx, %ecx
	jmp	LBB66_1
	.p2align	4
LBB66_6:                                #   in Loop: Header=BB66_1 Depth=1
	cmpb	$41, (%edi)
	je	LBB66_7
LBB66_1:                                # =>This Inner Loop Header: Depth=1
	incl	%edi
	movzbl	-1(%edi), %edx
	cmpl	$40, %edx
	je	LBB66_8
# %bb.2:                                #   in Loop: Header=BB66_1 Depth=1
	cmpl	$42, %edx
	je	LBB66_6
# %bb.3:                                #   in Loop: Header=BB66_1 Depth=1
	testl	%edx, %edx
	jne	LBB66_1
	jmp	LBB66_4
	.p2align	4
LBB66_8:                                #   in Loop: Header=BB66_1 Depth=1
	cmpb	$42, (%edi)
	jne	LBB66_1
# %bb.9:                                #   in Loop: Header=BB66_1 Depth=1
	movl	_commentnest, %edx
	leal	1(%edx), %ebx
	movl	%ebx, _commentnest
	leal	-1(%edi), %ebx
	testl	%edx, %edx
	cmovel	%ebx, %ecx
	jmp	LBB66_10
LBB66_7:                                #   in Loop: Header=BB66_1 Depth=1
	decl	_commentnest
	cmovel	%edi, %eax
LBB66_10:                               #   in Loop: Header=BB66_1 Depth=1
	incl	%edi
	testl	%ecx, %ecx
	je	LBB66_1
# %bb.11:                               #   in Loop: Header=BB66_1 Depth=1
	testl	%eax, %eax
	je	LBB66_1
# %bb.12:                               #   in Loop: Header=BB66_1 Depth=1
	subl	%ecx, %eax
	incl	%eax
	pushl	%eax
	pushl	$32
	pushl	%ecx
	calll	_memset
	addl	$12, %esp
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	jmp	LBB66_1
LBB66_4:
	testl	%ecx, %ecx
	je	LBB66_13
# %bb.5:
	movb	$0, (%ecx)
	jmp	LBB66_17
LBB66_13:
	testl	%eax, %eax
	je	LBB66_15
# %bb.14:
	subl	%esi, %eax
	incl	%eax
	pushl	%eax
	pushl	$32
	pushl	%esi
	calll	_memset
	addl	$12, %esp
	jmp	LBB66_17
LBB66_15:
	cmpl	$0, _commentnest
	jle	LBB66_17
# %bb.16:
	movb	$0, (%esi)
LBB66_17:
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Config_Init;
	.scl	2;
	.type	32;
	.endef
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
	subl	$8, %esp
	movw	$77, 4(%esp)
	movl	$1414416722, (%esp)             # imm = 0x544E4952
	pushl	$3
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movl	%esp, %ecx
	movzwl	%ax, %eax
	pushl	$0
	pushl	%ecx
	pushl	%eax
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	movl	$"??_C@_09OABCBDAM@C?3?2INplc?2?$AA@", %ecx
	movl	$"??_C@_01KMDKNFGN@?1?$AA@", %eax
	cmovel	%ecx, %eax
	addl	$8, %esp
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
	.def	_Container_Set_Catalogname;
	.scl	2;
	.type	32;
	.endef
	.globl	_Container_Set_Catalogname      # -- Begin function Container_Set_Catalogname
	.p2align	4
_Container_Set_Catalogname:             # @Container_Set_Catalogname
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	$1, %esi
	movl	20(%esp), %edi
	movzwl	16(%esp), %ebx
	.p2align	4
LBB101_1:                               # =>This Inner Loop Header: Depth=1
	cmpl	$129, %esi
	je	LBB101_2
# %bb.3:                                #   in Loop: Header=BB101_1 Depth=1
	pushl	%esi
	pushl	$"??_C@_03LHGCEHCD@PLC?$AA@"
	pushl	$"??_C@_07NFKFJBIP@?$CFs_?$CF03d?$AA@"
	pushl	%edi
	calll	_sprintf
	addl	$16, %esp
	pushl	$0
	pushl	%edi
	pushl	%ebx
	calll	_LookupRtHandle
	addl	$12, %esp
	incl	%esi
	cmpw	$-1, %ax
	jne	LBB101_1
# %bb.4:
	movb	$1, %al
	jmp	LBB101_5
LBB101_2:
	xorl	%eax, %eax
LBB101_5:
                                        # kill: def $al killed $al killed $eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Container_TagCheck;
	.scl	2;
	.type	32;
	.endef
	.globl	_Container_TagCheck             # -- Begin function Container_TagCheck
	.p2align	4
_Container_TagCheck:                    # @Container_TagCheck
# %bb.0:
	pushl	%eax
	leal	2(%esp), %eax
	pushl	$2
	pushl	%eax
	pushl	$"??_C@_04KOACHJEN@Type?$AA@"
	pushl	20(%esp)
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	sete	%al
	popl	%ecx
	retl
                                        # -- End function
	.def	_Container_TagSize;
	.scl	2;
	.type	32;
	.endef
	.globl	_Container_TagSize              # -- Begin function Container_TagSize
	.p2align	4
_Container_TagSize:                     # @Container_TagSize
# %bb.0:
	movl	4(%esp), %eax
	leal	-1(%eax), %ecx
	cmpl	$6, %ecx
	ja	LBB103_1
# %bb.2:
	movzwl	L_switch.table.Container_TagCreate-2(%eax,%eax), %eax
                                        # kill: def $ax killed $ax killed $eax
	retl
LBB103_1:
	xorl	%eax, %eax
                                        # kill: def $ax killed $ax killed $eax
	retl
                                        # -- End function
	.def	_Container_TagGetIndex;
	.scl	2;
	.type	32;
	.endef
	.globl	_Container_TagGetIndex          # -- Begin function Container_TagGetIndex
	.p2align	4
_Container_TagGetIndex:                 # @Container_TagGetIndex
# %bb.0:
	pushl	%eax
	movl	%esp, %eax
	pushl	$4
	pushl	%eax
	pushl	$"??_C@_05FNNGFGLF@Index?$AA@"
	pushl	20(%esp)
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	movl	%eax, %ecx
	xorl	%eax, %eax
	testl	%ecx, %ecx
	jne	LBB104_2
# %bb.1:
	movl	(%esp), %eax
LBB104_2:
	popl	%ecx
	retl
                                        # -- End function
	.def	_Container_TagCreate;
	.scl	2;
	.type	32;
	.endef
	.globl	_Container_TagCreate            # -- Begin function Container_TagCreate
	.p2align	4
_Container_TagCreate:                   # @Container_TagCreate
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$36, %esp
	movl	60(%esp), %ebx
	leal	-1(%ebx), %eax
	cmpl	$6, %eax
	ja	LBB105_1
# %bb.2:
	movzwl	L_switch.table.Container_TagCreate-2(%ebx,%ebx), %ebp
	jmp	LBB105_3
LBB105_1:
	xorl	%ebp, %ebp
LBB105_3:
	movl	64(%esp), %edi
	leal	4(%esp), %esi
	pushl	$2
	pushl	%esi
	pushl	$"??_C@_04KOACHJEN@Type?$AA@"
	pushl	68(%esp)
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	je	LBB105_11
# %bb.4:
	movl	72(%esp), %ecx
	movl	68(%esp), %eax
	cmpl	$12, %ebx
	jne	LBB105_5
# %bb.9:
	testl	%ecx, %ecx
	movl	$"??_C@_00CNPNBAHC@?$AA@", %edx
	cmovel	%edx, %ecx
	testl	%eax, %eax
	cmovel	%edx, %eax
	leal	2(%esp), %edx
	pushl	%edx
	pushl	$32
	pushl	%esi
	pushl	%ecx
	pushl	%eax
	pushl	$80
	pushl	$12
	movl	84(%esp), %esi
	pushl	%esi
	calll	*__imp__EgTagCreateSegment
	addl	$32, %esp
	testl	%eax, %eax
	jne	LBB105_8
# %bb.10:
	pushl	%edi
	pushl	%esi
	calll	*__imp__EgTagWriteString
	addl	$8, %esp
	testl	%eax, %eax
	jne	LBB105_8
	jmp	LBB105_11
LBB105_5:
	testl	%ecx, %ecx
	movl	$"??_C@_00CNPNBAHC@?$AA@", %edx
	cmovel	%edx, %ecx
	testl	%eax, %eax
	cmovel	%edx, %eax
	movzwl	%bp, %esi
	movzwl	%bx, %edx
	pushl	%ecx
	pushl	%eax
	pushl	%esi
	pushl	%edx
	movl	72(%esp), %edi
	pushl	%edi
	calll	*__imp__EgTagCreate
	addl	$20, %esp
	testl	%eax, %eax
	jne	LBB105_8
# %bb.6:
	leal	64(%esp), %eax
	pushl	%esi
	pushl	%eax
	pushl	%edi
	calll	*__imp__EgTagWrite
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB105_11
LBB105_8:
	xorl	%eax, %eax
	jmp	LBB105_12
LBB105_11:
	movb	$1, %al
LBB105_12:
                                        # kill: def $al killed $al killed $eax
	addl	$36, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Container_GetModuleName;
	.scl	2;
	.type	32;
	.endef
	.globl	_Container_GetModuleName        # -- Begin function Container_GetModuleName
	.p2align	4
_Container_GetModuleName:               # @Container_GetModuleName
# %bb.0:
	movl	__imp__ServiceRealName, %eax
	retl
                                        # -- End function
	.def	_Container_GetTagName;
	.scl	2;
	.type	32;
	.endef
	.globl	_Container_GetTagName           # -- Begin function Container_GetTagName
	.p2align	4
_Container_GetTagName:                  # @Container_GetTagName
# %bb.0:
	movl	__imp__ServiceRealName, %eax
	pushl	4(%esp)
	pushl	%eax
	pushl	$"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
	pushl	$__ContainerTagName
	calll	_sprintf
	addl	$16, %esp
	movl	$__ContainerTagName, %eax
	retl
                                        # -- End function
	.def	_Container_SetModuleName;
	.scl	2;
	.type	32;
	.endef
	.globl	_Container_SetModuleName        # -- Begin function Container_SetModuleName
	.p2align	4
_Container_SetModuleName:               # @Container_SetModuleName
# %bb.0:
	pushl	%esi
	pushl	8(%esp)
	pushl	$__ModuleName
	calll	_strcpy
	addl	$8, %esp
	pushl	$92
	pushl	$__ModuleName
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	jne	LBB108_2
# %bb.1:
	pushl	$47
	pushl	$__ModuleName
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB108_4
LBB108_2:
	incl	%eax
	pushl	%eax
	movl	%eax, %esi
	calll	_strlen
	addl	$4, %esp
	incl	%eax
	pushl	%eax
	pushl	%esi
	pushl	$__ModuleName
	calll	_memmove
	addl	$12, %esp
	pushl	$46
	pushl	$__ModuleName
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB108_4
# %bb.3:
	movb	$0, (%eax)
LBB108_4:
	popl	%esi
	retl
                                        # -- End function
	.def	_Container_Log$;
	.scl	2;
	.type	32;
	.endef
	.globl	_Container_Log$                 # -- Begin function Container_Log$
	.p2align	4
_Container_Log$:                        # @"Container_Log$"
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	24(%esp), %esi
	movl	_Container_Log$.messBuff, %eax
	testl	%eax, %eax
	jne	LBB109_2
# %bb.1:
	pushl	$1024                           # imm = 0x400
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, _Container_Log$.messBuff
	testl	%eax, %eax
	je	LBB109_3
LBB109_2:
	movl	20(%esp), %ebx
	movl	16(%esp), %edi
	leal	28(%esp), %ecx
	pushl	%ecx
	pushl	%esi
	pushl	%eax
	calll	_vsprintf
	addl	$12, %esp
	pushl	_Container_Log$.messBuff
	pushl	%ebx
	pushl	%edi
	calll	*__imp__EgFW_PrintLog
	addl	$12, %esp
LBB109_3:
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_ExitEvent_Init;
	.scl	2;
	.type	32;
	.endef
	.globl	_ExitEvent_Init                 # -- Begin function ExitEvent_Init
	.p2align	4
_ExitEvent_Init:                        # @ExitEvent_Init
# %bb.0:
	pushl	$0
	pushl	$1
	pushl	$0
	calll	_CreateRtSemaphore
	addl	$12, %esp
	movw	%ax, _hExitEvent
	movzwl	%ax, %eax
	pushl	$"??_C@_04LBABLPF@Exit?$AA@"
	pushl	%eax
	pushl	$0
	calll	_CatalogRtHandle
	addl	$12, %esp
	retl
                                        # -- End function
	.def	_ExitEvent_Wait;
	.scl	2;
	.type	32;
	.endef
	.globl	_ExitEvent_Wait                 # -- Begin function ExitEvent_Wait
	.p2align	4
_ExitEvent_Wait:                        # @ExitEvent_Wait
# %bb.0:
	movzwl	_hExitEvent, %eax
	pushl	$-1
	pushl	$1
	pushl	%eax
	calll	_WaitForRtSemaphore
	addl	$12, %esp
	retl
                                        # -- End function
	.def	_ExitEvent_Post;
	.scl	2;
	.type	32;
	.endef
	.globl	_ExitEvent_Post                 # -- Begin function ExitEvent_Post
	.p2align	4
_ExitEvent_Post:                        # @ExitEvent_Post
# %bb.0:
	movzwl	_hExitEvent, %eax
	pushl	$1
	pushl	%eax
	calll	_ReleaseRtSemaphore
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_ExitEvent_RtaMsgHandler;
	.scl	2;
	.type	32;
	.endef
	.globl	_ExitEvent_RtaMsgHandler        # -- Begin function ExitEvent_RtaMsgHandler
	.p2align	4
_ExitEvent_RtaMsgHandler:               # @ExitEvent_RtaMsgHandler
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$16, %esp
	calll	_SynchronizeRtLoader
	pushl	$0
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movzwl	%ax, %eax
	pushl	$"??_C@_06HHNOBIIB@Notify?$AA@"
	pushl	%eax
	pushl	$0
	calll	_CatalogRtHandle
	addl	$12, %esp
	leal	4(%esp), %esi
	pushl	%esi
	pushl	$-1
	pushl	$12
	calll	_RtNotifyEvent
	addl	$12, %esp
	testb	%al, %al
	je	LBB113_6
# %bb.1:                                # %.preheader.preheader
	leal	3(%esp), %edi
	movl	__imp__EgTagWriteByIndex, %ebx
	jmp	LBB113_2
	.p2align	4
LBB113_4:                               #   in Loop: Header=BB113_2 Depth=1
	movb	$0, 3(%esp)
	pushl	$1
	pushl	%edi
	pushl	_indicate+86
	calll	*%ebx
	addl	$12, %esp
	movzwl	_hExitEvent, %eax
	pushl	$1
	pushl	%eax
	calll	_ReleaseRtSemaphore
	addl	$8, %esp
LBB113_5:                               #   in Loop: Header=BB113_2 Depth=1
	pushl	%esi
	pushl	$-1
	pushl	$12
	calll	_RtNotifyEvent
	addl	$12, %esp
	testb	%al, %al
	je	LBB113_6
LBB113_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	4(%esp), %eax
	cmpl	$255, %eax
	je	LBB113_4
# %bb.3:                                # %.preheader
                                        #   in Loop: Header=BB113_2 Depth=1
	cmpl	$8, %eax
	je	LBB113_4
	jmp	LBB113_5
LBB113_6:                               # %.loopexit
	addl	$16, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Container_EgdeMsgHandler;
	.scl	2;
	.type	32;
	.endef
	.globl	_Container_EgdeMsgHandler       # -- Begin function Container_EgdeMsgHandler
	.p2align	4
_Container_EgdeMsgHandler:              # @Container_EgdeMsgHandler
# %bb.0:
	subl	$16, %esp
	movl	24(%esp), %eax
	cmpl	$101, %eax
	je	LBB114_12
# %bb.1:
	cmpl	$103, %eax
	je	LBB114_8
# %bb.2:
	cmpl	$102, %eax
	jne	LBB114_16
# %bb.3:
	movl	$"??_C@_0BJ@OPOGIFPF@EM_SERVICE_RUN?5recieved?4?$AA@", 4(%esp)
	movl	_Container_Log$.messBuff, %eax
	testl	%eax, %eax
	jne	LBB114_5
# %bb.4:
	pushl	$1024                           # imm = 0x400
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, _Container_Log$.messBuff
	testl	%eax, %eax
	je	LBB114_6
LBB114_5:
	leal	8(%esp), %ecx
	pushl	%ecx
	pushl	$"??_C@_0BJ@OPOGIFPF@EM_SERVICE_RUN?5recieved?4?$AA@"
	pushl	%eax
	calll	_vsprintf
	addl	$12, %esp
	movl	__imp__ServiceRealName, %eax
	pushl	_Container_Log$.messBuff
	pushl	$"??_C@_03GOLGPOF@DBG?$AA@"
	pushl	%eax
	calll	*__imp__EgFW_PrintLog
	addl	$12, %esp
LBB114_6:
	movb	$1, 1(%esp)
	leal	1(%esp), %eax
	jmp	LBB114_7
LBB114_8:
	movl	$"??_C@_0BL@DPPAKCHP@EM_SERVICE_PAUSE?5recieved?4?$AA@", 8(%esp)
	movl	_Container_Log$.messBuff, %eax
	testl	%eax, %eax
	jne	LBB114_10
# %bb.9:
	pushl	$1024                           # imm = 0x400
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, _Container_Log$.messBuff
	testl	%eax, %eax
	je	LBB114_11
LBB114_10:
	leal	12(%esp), %ecx
	pushl	%ecx
	pushl	$"??_C@_0BL@DPPAKCHP@EM_SERVICE_PAUSE?5recieved?4?$AA@"
	pushl	%eax
	calll	_vsprintf
	addl	$12, %esp
	movl	__imp__ServiceRealName, %eax
	pushl	_Container_Log$.messBuff
	pushl	$"??_C@_03GOLGPOF@DBG?$AA@"
	pushl	%eax
	calll	*__imp__EgFW_PrintLog
	addl	$12, %esp
LBB114_11:
	movb	$0, 2(%esp)
	leal	2(%esp), %eax
LBB114_7:
	pushl	$1
	pushl	%eax
	pushl	_indicate+86
	calll	*__imp__EgTagWriteByIndex
	addl	$12, %esp
	jmp	LBB114_16
LBB114_12:
	movl	$"??_C@_0BK@LMHOIIID@EM_SERVICE_STOP?5recieved?4?$AA@", 12(%esp)
	movl	_Container_Log$.messBuff, %eax
	testl	%eax, %eax
	jne	LBB114_14
# %bb.13:
	pushl	$1024                           # imm = 0x400
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, _Container_Log$.messBuff
	testl	%eax, %eax
	je	LBB114_15
LBB114_14:
	leal	16(%esp), %ecx
	pushl	%ecx
	pushl	$"??_C@_0BK@LMHOIIID@EM_SERVICE_STOP?5recieved?4?$AA@"
	pushl	%eax
	calll	_vsprintf
	addl	$12, %esp
	movl	__imp__ServiceRealName, %eax
	pushl	_Container_Log$.messBuff
	pushl	$"??_C@_03GOLGPOF@DBG?$AA@"
	pushl	%eax
	calll	*__imp__EgFW_PrintLog
	addl	$12, %esp
LBB114_15:
	movb	$0, 3(%esp)
	leal	3(%esp), %eax
	pushl	$1
	pushl	%eax
	pushl	_indicate+86
	calll	*__imp__EgTagWriteByIndex
	addl	$12, %esp
	movzwl	_hExitEvent, %eax
	pushl	$1
	pushl	%eax
	calll	_ReleaseRtSemaphore
	addl	$8, %esp
LBB114_16:
	xorl	%eax, %eax
	addl	$16, %esp
	retl
                                        # -- End function
	.def	_Container_Init;
	.scl	2;
	.type	32;
	.endef
	.globl	_Container_Init                 # -- Begin function Container_Init
	.p2align	4
_Container_Init:                        # @Container_Init
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$280, %esp                      # imm = 0x118
	leal	4(%esp), %esi
	pushl	$276                            # imm = 0x114
	pushl	$0
	pushl	%esi
	calll	_memset
	addl	$12, %esp
	movb	$1, 5(%esp)
	movw	$-1, 6(%esp)
	movl	$_Container_EgdeMsgHandler, 8(%esp)
	pushl	%esi
	calll	*__imp__EgInit
	addl	$4, %esp
	pushl	$100
	calll	_RtSleep
	addl	$4, %esp
	cmpl	$0, _property
	je	LBB115_3
# %bb.1:                                # %.preheader.i.preheader
	movl	$_property, %esi
	.p2align	4
LBB115_2:                               # %.preheader.i
                                        # =>This Inner Loop Header: Depth=1
	pushl	%esi
	calll	*13(%esi)
	addl	$4, %esp
	cmpl	$0, 29(%esi)
	leal	29(%esi), %esi
	jne	LBB115_2
LBB115_3:                               # %Property_Init.exit
	pushl	$_indicate
	calll	_Container_CreateTagsFromList
	addl	$4, %esp
	pushl	$_trigger
	calll	_Container_CreateTagsFromList
	addl	$4, %esp
	movl	$140, (%esp)
	movl	__imp__ServiceRealName, %edi
	pushl	$"??_C@_08KGEIBGG@Priority?$AA@"
	pushl	%edi
	pushl	$"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
	pushl	$__ContainerTagName
	calll	_sprintf
	addl	$16, %esp
	movl	%esp, %esi
	movl	__imp__EgTagRead, %ebx
	pushl	$4
	pushl	%esi
	pushl	$__ContainerTagName
	calll	*%ebx
	addl	$12, %esp
	movzbl	(%esp), %eax
	addb	$6, %al
	movzbl	%al, %eax
	pushl	$0
	pushl	$4096                           # imm = 0x1000
	pushl	$_Trigger_DetectThread
	pushl	%eax
	calll	_CreateRtThread
	addl	$16, %esp
	pushl	$0
	pushl	$1
	pushl	$0
	calll	_CreateRtSemaphore
	addl	$12, %esp
	movw	%ax, _hExitEvent
	movzwl	%ax, %eax
	pushl	$"??_C@_04LBABLPF@Exit?$AA@"
	pushl	%eax
	pushl	$0
	calll	_CatalogRtHandle
	addl	$12, %esp
	pushl	$0
	pushl	$0
	calll	_SetRtProcessMaxPriority
	addl	$8, %esp
	movl	$140, (%esp)
	pushl	$"??_C@_08KGEIBGG@Priority?$AA@"
	pushl	%edi
	pushl	$"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
	pushl	$__ContainerTagName
	calll	_sprintf
	addl	$16, %esp
	pushl	$4
	pushl	%esi
	pushl	$__ContainerTagName
	calll	*%ebx
	addl	$12, %esp
	movzbl	(%esp), %eax
	addb	$10, %al
	movzbl	%al, %eax
	pushl	%eax
	pushl	$0
	calll	_SetRtThreadPriority
	addl	$8, %esp
	movl	$1, %ebp
	pushl	$3
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movzwl	%ax, %ebx
	.p2align	4
LBB115_4:                               # =>This Inner Loop Header: Depth=1
	cmpl	$129, %ebp
	je	LBB115_6
# %bb.5:                                #   in Loop: Header=BB115_4 Depth=1
	pushl	%ebp
	pushl	$"??_C@_03LHGCEHCD@PLC?$AA@"
	pushl	$"??_C@_07NFKFJBIP@?$CFs_?$CF03d?$AA@"
	pushl	$_catalogProc
	calll	_sprintf
	addl	$16, %esp
	pushl	$0
	pushl	$_catalogProc
	pushl	%ebx
	calll	_LookupRtHandle
	addl	$12, %esp
	incl	%ebp
	cmpw	$-1, %ax
	jne	LBB115_4
LBB115_6:
	pushl	$_catalogProc
	pushl	%ebx
	calll	_UncatalogRtHandle
	addl	$8, %esp
	pushl	$1
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movzwl	%ax, %eax
	pushl	$_catalogProc
	pushl	%eax
	pushl	%ebx
	calll	_CatalogRtHandle
	addl	$12, %esp
	pushl	$0
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movzwl	%ax, %eax
	pushl	$"??_C@_04KGFMLCPK@Main?$AA@"
	pushl	%eax
	pushl	$0
	calll	_CatalogRtHandle
	addl	$12, %esp
	movl	$140, (%esp)
	pushl	$"??_C@_08KGEIBGG@Priority?$AA@"
	pushl	%edi
	pushl	$"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
	pushl	$__ContainerTagName
	calll	_sprintf
	addl	$16, %esp
	pushl	$4
	pushl	%esi
	pushl	$__ContainerTagName
	calll	*__imp__EgTagRead
	addl	$12, %esp
	movzbl	(%esp), %eax
	addb	$8, %al
	movzbl	%al, %eax
	pushl	$0
	pushl	$4096                           # imm = 0x1000
	pushl	$_ExitEvent_RtaMsgHandler
	pushl	%eax
	calll	_CreateRtThread
	addl	$16, %esp
	movl	_indicate+134, %eax
	movb	$1, (%eax)
	movl	_indicate+164, %eax
	movb	$0, (%eax)
	movl	_indicate+194, %eax
	movb	$0, (%eax)
	movl	_indicate+254, %eax
	movb	$0, (%eax)
	movl	_indicate+284, %eax
	movb	$0, (%eax)
	movl	_indicate+224, %eax
	movb	$1, (%eax)
	movl	_plcErrList, %ecx
	xorl	%eax, %eax
	testl	%ecx, %ecx
	je	LBB115_9
	.p2align	4
LBB115_7:                               # %.preheader.i1
                                        # =>This Inner Loop Header: Depth=1
	incl	%eax
	movl	12(%ecx), %ecx
	testl	%ecx, %ecx
	jne	LBB115_7
LBB115_9:                               # %Errorlog_Count.exit
	movl	_indicate+734, %ecx
	movl	%eax, (%ecx)
	movb	$1, (%esp)
	pushl	$"??_C@_07ICCLJJJJ@AutoRun?$AA@"
	pushl	%edi
	pushl	$"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
	pushl	$__ContainerTagName
	calll	_sprintf
	addl	$16, %esp
	pushl	$1
	pushl	%esi
	pushl	$__ContainerTagName
	calll	*__imp__EgTagRead
	addl	$12, %esp
	cmpb	$0, (%esp)
	setne	(%esp)
	pushl	$1
	pushl	%esi
	pushl	_indicate+86
	calll	*__imp__EgTagWriteByIndex
	addl	$292, %esp                      # imm = 0x124
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Container_Finish;
	.scl	2;
	.type	32;
	.endef
	.globl	_Container_Finish               # -- Begin function Container_Finish
	.p2align	4
_Container_Finish:                      # @Container_Finish
# %bb.0:
	pushl	$3
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movzwl	%ax, %eax
	pushl	$_catalogProc
	pushl	%eax
	calll	_UncatalogRtHandle
	addl	$8, %esp
	movl	_indicate+134, %eax
	movb	$0, (%eax)
	movl	_indicate+164, %eax
	movb	$0, (%eax)
	movl	_indicate+194, %eax
	movb	$0, (%eax)
	movl	_indicate+224, %eax
	movb	$0, (%eax)
	movl	_indicate+254, %eax
	movb	$0, (%eax)
	movl	_indicate+284, %eax
	movb	$0, (%eax)
	jmpl	*__imp__EgFinalize              # TAILCALL
                                        # -- End function
	.def	_Container_CreateTagsFromList;
	.scl	2;
	.type	32;
	.endef
	.globl	_Container_CreateTagsFromList   # -- Begin function Container_CreateTagsFromList
	.p2align	4
_Container_CreateTagsFromList:          # @Container_CreateTagsFromList
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	%eax
	movl	24(%esp), %esi
	movl	(%esi), %eax
	testl	%eax, %eax
	je	LBB117_11
# %bb.1:                                # %.preheader.preheader
	addl	$30, %esi
	movl	__imp__ServiceRealName, %edi
	movl	%esp, %ebx
	movl	__imp__EgTagGetProperty, %ebp
	jmp	LBB117_2
	.p2align	4
LBB117_7:                               #   in Loop: Header=BB117_2 Depth=1
	movl	%ecx, -4(%esi)
	movl	$0, (%esp)
	pushl	$4
	pushl	%ebx
	pushl	$"??_C@_05HKHPEFOF@Entry?$AA@"
	pushl	$__ContainerTagName
	calll	*%ebp
	addl	$16, %esp
	movl	$_Container_CreateTagsFromList.dummy, %ecx
	testl	%eax, %eax
	je	LBB117_8
LBB117_9:                               #   in Loop: Header=BB117_2 Depth=1
	movl	%ecx, -16(%esi)
LBB117_10:                              #   in Loop: Header=BB117_2 Depth=1
	movl	(%esi), %eax
	addl	$30, %esi
	testl	%eax, %eax
	je	LBB117_11
LBB117_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%eax
	pushl	%edi
	pushl	$"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
	pushl	$__ContainerTagName
	calll	_sprintf
	addl	$16, %esp
	pushl	$2
	pushl	%ebx
	pushl	$"??_C@_04KOACHJEN@Type?$AA@"
	pushl	$__ContainerTagName
	calll	*%ebp
	addl	$16, %esp
	testl	%eax, %eax
	je	LBB117_5
# %bb.3:                                #   in Loop: Header=BB117_2 Depth=1
	cmpb	$0, -18(%esi)
	je	LBB117_10
# %bb.4:                                #   in Loop: Header=BB117_2 Depth=1
	pushl	-8(%esi)
	pushl	-12(%esi)
	pushl	-22(%esi)
	pushl	-26(%esi)
	pushl	$__ContainerTagName
	calll	_Container_TagCreate
	addl	$20, %esp
	testb	%al, %al
	je	LBB117_11
LBB117_5:                               #   in Loop: Header=BB117_2 Depth=1
	pushl	$4
	pushl	%ebx
	pushl	$"??_C@_05FNNGFGLF@Index?$AA@"
	pushl	$__ContainerTagName
	calll	*%ebp
	addl	$16, %esp
	xorl	%ecx, %ecx
	testl	%eax, %eax
	jne	LBB117_7
# %bb.6:                                #   in Loop: Header=BB117_2 Depth=1
	movl	(%esp), %ecx
	jmp	LBB117_7
	.p2align	4
LBB117_8:                               #   in Loop: Header=BB117_2 Depth=1
	movl	(%esp), %ecx
	addl	$15, %ecx
	movb	$1, -17(%esi)
	jmp	LBB117_9
LBB117_11:                              # %.loopexit
	xorl	%eax, %eax
	addl	$4, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Engine_Init;
	.scl	2;
	.type	32;
	.endef
	.globl	_Engine_Init                    # -- Begin function Engine_Init
	.p2align	4
_Engine_Init:                           # @Engine_Init
# %bb.0:
	pushl	%ebx
	movb	$0, _Engine_PhaseStop
	movl	$0, _systickcount
	cmpw	$0, _hPulseSem
	jne	LBB118_2
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
	calll	_CatalogRtHandle
	addl	$12, %esp
LBB118_2:                               # %Catalog.exit
	movzbl	_bBasePriority, %ebx
	addl	$2, %ebx
	cmpw	$0, _hSQengineThread
	jne	LBB118_5
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
	jne	LBB118_5
# %bb.4:
	movw	$0, _hSQengineThread
	pushl	$"??_C@_0BM@MDFECNNP@Cannot?5create?5Engine_Thread?$AA@"
	calll	_Fail
	addl	$4, %esp
LBB118_5:
	movl	_indicate+404, %eax
	movl	%ebx, (%eax)
	movl	_indicate+374, %eax
	movl	$32768, (%eax)                  # imm = 0x8000
	cmpw	$0, _hPulseThread
	jne	LBB118_8
# %bb.6:
	movzbl	_bBasePriority, %eax
	pushl	$0
	pushl	$8192                           # imm = 0x2000
	pushl	$_Engine_PulseThread
	pushl	%eax
	calll	_CreateRtThread
	addl	$16, %esp
	movw	%ax, _hPulseThread
	cmpw	$-1, %ax
	jne	LBB118_8
# %bb.7:
	movw	$0, _hPulseThread
	pushl	$"??_C@_0CB@FNKGDICM@Cannot?5create?5Engine_PulseThread@"
	calll	_Fail
	addl	$4, %esp
LBB118_8:
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
	.def	_Engine_Thread;
	.scl	2;
	.type	32;
	.endef
	.globl	_Engine_Thread                  # -- Begin function Engine_Thread
	.p2align	4
_Engine_Thread:                         # @Engine_Thread
# %bb.0:                                # %Catalog.exit
	movl	$_Logic_Scan, _lpfnSeq_Ctrl
	pushl	$0
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movzwl	%ax, %eax
	pushl	$"??_C@_06LKDHJJCH@ENGINE?$AA@"
	pushl	%eax
	pushl	$0
	calll	_CatalogRtHandle
	addl	$12, %esp
	jmp	LBB119_1
	.p2align	4
LBB119_3:                               # %Engine_WaitTrigger.exit
                                        #   in Loop: Header=BB119_1 Depth=1
	movb	$0, _Engine_PhaseStop
	calll	*_lpfnSeq_Ctrl
LBB119_1:                               # =>This Inner Loop Header: Depth=1
	movb	$1, _Engine_PhaseStop
	movzwl	_hPulseSem, %eax
	testw	%ax, %ax
	je	LBB119_3
# %bb.2:                                #   in Loop: Header=BB119_1 Depth=1
	movzwl	%ax, %eax
	pushl	$-1
	pushl	$1
	pushl	%eax
	calll	_WaitForRtSemaphore
	addl	$12, %esp
	movl	_systickcount, %eax
	incl	%eax
	movl	%eax, _systickcount
	movl	_indicate+704, %ecx
	movl	%eax, (%ecx)
	movl	_indicate+584, %eax
	movl	$0, (%eax)
	movl	_indicate+554, %eax
	movl	$0, (%eax)
	movl	_indicate+524, %eax
	movl	$0, (%eax)
	jmp	LBB119_3
                                        # -- End function
	.def	_Engine_PulseThread;
	.scl	2;
	.type	32;
	.endef
	.globl	_Engine_PulseThread             # -- Begin function Engine_PulseThread
	.p2align	4
_Engine_PulseThread:                    # @Engine_PulseThread
# %bb.0:                                # %Catalog.exit
	pushl	%edi
	pushl	%esi
	pushl	$0
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movzwl	%ax, %eax
	pushl	$"??_C@_09LJDFFONP@PACEMAKER?$AA@"
	pushl	%eax
	pushl	$0
	calll	_CatalogRtHandle
	addl	$12, %esp
	movl	_dwScanFreq, %eax
	movl	_indicate+314, %ecx
	movl	%eax, (%ecx)
	pushl	$1
	calll	_knRtSleep
	addl	$4, %esp
	xorl	%esi, %esi
	jmp	LBB120_1
	.p2align	4
LBB120_3:                               #   in Loop: Header=BB120_1 Depth=1
	testl	%esi, %esi
	je	LBB120_4
LBB120_1:                               # =>This Inner Loop Header: Depth=1
	pushl	$1
	calll	_knRtSleep
	addl	$4, %esp
	incl	%esi
	movl	_dwScanFreq, %eax
	xorl	%edx, %edx
	divl	_dwKtickInUsecs
	cmpl	%eax, %esi
	jb	LBB120_3
# %bb.2:                                #   in Loop: Header=BB120_1 Depth=1
	xorl	%esi, %esi
	jmp	LBB120_3
	.p2align	4
LBB120_4:                               #   in Loop: Header=BB120_1 Depth=1
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB120_1
# %bb.5:                                #   in Loop: Header=BB120_1 Depth=1
	cmpb	$0, 32(%eax)
	je	LBB120_1
# %bb.6:                                #   in Loop: Header=BB120_1 Depth=1
	cmpw	$0, _hPulseSem
	je	LBB120_1
# %bb.7:                                # %Step_IsEnable.exit
                                        #   in Loop: Header=BB120_1 Depth=1
	cmpb	$0, 33(%eax)
	je	LBB120_10
# %bb.8:                                #   in Loop: Header=BB120_1 Depth=1
	movl	_status_step, %edi
	movzwl	35(%eax), %eax
	pushl	%eax
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$4, %ax
	jne	LBB120_10
# %bb.9:                                #   in Loop: Header=BB120_1 Depth=1
	movl	$4, _status_step
	movl	_sqtbl, %eax
	movzwl	35(%eax), %eax
	pushl	$-1
	pushl	$1
	pushl	%eax
	calll	_WaitForRtSemaphore
	addl	$12, %esp
	movl	%edi, _status_step
LBB120_10:                              # %Step_WaitTrigger.exit
                                        #   in Loop: Header=BB120_1 Depth=1
	movzwl	_hPulseSem, %eax
	pushl	$1
	pushl	%eax
	calll	_ReleaseRtSemaphore
	addl	$8, %esp
	jmp	LBB120_1
                                        # -- End function
	.def	_Engine_WaitTrigger;
	.scl	2;
	.type	32;
	.endef
	.globl	_Engine_WaitTrigger             # -- Begin function Engine_WaitTrigger
	.p2align	4
_Engine_WaitTrigger:                    # @Engine_WaitTrigger
# %bb.0:
	movzwl	_hPulseSem, %eax
	testw	%ax, %ax
	je	LBB121_2
# %bb.1:
	movzwl	%ax, %eax
	pushl	$-1
	pushl	$1
	pushl	%eax
	calll	_WaitForRtSemaphore
	addl	$12, %esp
	movl	_systickcount, %eax
	incl	%eax
	movl	%eax, _systickcount
	movl	_indicate+704, %ecx
	movl	%eax, (%ecx)
	movl	_indicate+584, %eax
	movl	$0, (%eax)
	movl	_indicate+554, %eax
	movl	$0, (%eax)
	movl	_indicate+524, %eax
	movl	$0, (%eax)
LBB121_2:
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
	retl
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
	je	LBB123_6
# %bb.1:
	pushl	%esi
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB123_5
# %bb.2:                                # %Step_IsEnable.exit
	cmpb	$0, 33(%eax)
	je	LBB123_5
# %bb.3:
	movl	_status_step, %esi
	movzwl	35(%eax), %eax
	pushl	%eax
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$4, %ax
	jne	LBB123_5
# %bb.4:
	movl	$4, _status_step
	movl	_sqtbl, %eax
	movzwl	35(%eax), %eax
	pushl	$-1
	pushl	$1
	pushl	%eax
	calll	_WaitForRtSemaphore
	addl	$12, %esp
	movl	%esi, _status_step
LBB123_5:                               # %Step_WaitTrigger.exit
	movzwl	_hPulseSem, %eax
	pushl	$1
	pushl	%eax
	calll	_ReleaseRtSemaphore
	addl	$8, %esp
	popl	%esi
	retl
LBB123_6:
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
	imull	$1000, _dwScanFreq, %eax        # imm = 0x3E8
	movd	%eax, %xmm0
	por	__xmm@43300000000000004330000000000000, %xmm0
	movsd	8(%ebp), %xmm1                  # xmm1 = mem[0],zero
	subsd	__real@4330000000000000, %xmm0
	subsd	%xmm0, %xmm1
	andpd	__xmm@7fffffffffffffff7fffffffffffffff, %xmm1
	movlpd	%xmm1, (%esp)
	fldl	(%esp)
	movl	%ebp, %esp
	popl	%ebp
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
	je	LBB125_2
# %bb.1:
	movb	$0, 32(%eax)
LBB125_2:
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
	movb	$0, _Engine_PhaseStop
	movl	$0, _systickcount
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB126_2
# %bb.1:
	movb	$1, 32(%eax)
LBB126_2:
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
	je	LBB127_1
# %bb.3:
	movzbl	32(%eax), %eax
                                        # kill: def $al killed $al killed $eax
	retl
LBB127_1:
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
	jne	LBB128_3
	.p2align	4
LBB128_1:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	$1
	calll	_knRtSleep
	addl	$4, %esp
	cmpb	$0, _Engine_PhaseStop
	je	LBB128_1
LBB128_3:                               # %.loopexit
	retl
                                        # -- End function
	.def	_Errorlog_Add;
	.scl	2;
	.type	32;
	.endef
	.globl	_Errorlog_Add                   # -- Begin function Errorlog_Add
	.p2align	4
_Errorlog_Add:                          # @Errorlog_Add
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	28(%esp), %edi
	movl	24(%esp), %ebx
	movl	20(%esp), %ebp
	pushl	$16
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %esi
	testl	%eax, %eax
	je	LBB129_1
# %bb.2:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%esi, (%eax)
	movl	$16, 4(%eax)
	movl	$"??_C@_0N@PIEAMHDF@Errorlog_Add?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB129_3
# %bb.4:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB129_5
LBB129_1:
	pushl	$"??_C@_0N@PIEAMHDF@Errorlog_Add?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB129_6
LBB129_3:
	movl	%eax, _heaplist
LBB129_5:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB129_6:                               # %Heap_Alloc.exit
	movl	%ebp, (%esi)
	movl	%ebx, 4(%esi)
	testl	%edi, %edi
	movl	$"??_C@_00CNPNBAHC@?$AA@", %eax
	cmovnel	%edi, %eax
	movl	%eax, 8(%esi)
	movl	$0, 12(%esi)
	cmpl	$0, _plcErrList
	je	LBB129_7
# %bb.8:
	movl	_plcErrBottom, %eax
	movl	%esi, 12(%eax)
	jmp	LBB129_9
LBB129_7:
	movl	%esi, _plcErrList
LBB129_9:
	movl	%esi, _plcErrBottom
	movl	$2, _status_errorlog
	movl	_errors, %eax
	incl	%eax
	movl	%eax, _errors
	movl	_indicate+734, %ecx
	movl	%eax, (%ecx)
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Errorlog_Clear;
	.scl	2;
	.type	32;
	.endef
	.globl	_Errorlog_Clear                 # -- Begin function Errorlog_Clear
	.p2align	4
_Errorlog_Clear:                        # @Errorlog_Clear
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	_plcErrList, %esi
	jmp	LBB130_1
	.p2align	4
LBB130_6:                               # %.loopexit5.i
                                        #   in Loop: Header=BB130_1 Depth=1
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB130_7
# %bb.9:                                #   in Loop: Header=BB130_1 Depth=1
	movl	%edx, 16(%ecx)
LBB130_11:                              #   in Loop: Header=BB130_1 Depth=1
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB130_12:                              # %Heap_Free.exit
                                        #   in Loop: Header=BB130_1 Depth=1
	pushl	%edi
	calll	_free
	addl	$4, %esp
	movl	%esi, _plcErrList
LBB130_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB130_4 Depth 2
	testl	%esi, %esi
	je	LBB130_13
# %bb.2:                                # %.preheader
                                        #   in Loop: Header=BB130_1 Depth=1
	movl	%esi, %edi
	movl	12(%esi), %esi
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB130_12
# %bb.3:                                #   in Loop: Header=BB130_1 Depth=1
	movl	%ecx, %eax
	cmpl	%edi, (%ecx)
	je	LBB130_6
	.p2align	4
LBB130_4:                               # %.preheader.i
                                        #   Parent Loop BB130_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB130_12
# %bb.5:                                #   in Loop: Header=BB130_4 Depth=2
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%edi, (%edx)
	jne	LBB130_4
	jmp	LBB130_6
LBB130_7:                               #   in Loop: Header=BB130_1 Depth=1
	cmpl	%eax, %ecx
	je	LBB130_8
# %bb.10:                               #   in Loop: Header=BB130_1 Depth=1
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB130_11
LBB130_8:                               #   in Loop: Header=BB130_1 Depth=1
	movl	$0, _heaplist
	movl	$0, _heapbottom
	jmp	LBB130_11
LBB130_13:                              # %.loopexit
	movl	$0, _plcErrList
	movl	$0, _plcErrBottom
	movl	$0, _status_errorlog
	movl	$0, _errors
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Errorlog_Message;
	.scl	2;
	.type	32;
	.endef
	.globl	_Errorlog_Message               # -- Begin function Errorlog_Message
	.p2align	4
_Errorlog_Message:                      # @Errorlog_Message
# %bb.0:
	movl	4(%esp), %ecx
	movzwl	_errormessages, %edx
	xorl	%eax, %eax
	cmpl	%edx, %ecx
	jne	LBB131_1
LBB131_7:                               # %._crit_edge
	movl	_errormessages+4(,%eax,8), %eax
	retl
LBB131_1:                               # %.lr.ph.preheader
	xorl	%eax, %eax
	.p2align	4
LBB131_2:                               # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$52, %eax
	je	LBB131_3
# %bb.9:                                #   in Loop: Header=BB131_2 Depth=1
	movzwl	_errormessages+8(,%eax,8), %edx
	cmpl	%edx, %ecx
	je	LBB131_6
# %bb.10:                               #   in Loop: Header=BB131_2 Depth=1
	movzwl	_errormessages+16(,%eax,8), %edx
	cmpl	%edx, %ecx
	je	LBB131_5
# %bb.11:                               #   in Loop: Header=BB131_2 Depth=1
	movzwl	_errormessages+24(,%eax,8), %edx
	cmpl	%edx, %ecx
	je	LBB131_4
# %bb.12:                               #   in Loop: Header=BB131_2 Depth=1
	movzwl	_errormessages+32(,%eax,8), %edx
	addl	$4, %eax
	cmpl	%edx, %ecx
	jne	LBB131_2
	jmp	LBB131_7
LBB131_3:
	movl	$"??_C@_0O@NIPGCINC@Unknown?5error?$AA@", %eax
	retl
LBB131_6:                               # %.._crit_edge.loopexit_crit_edge
	incl	%eax
	movl	_errormessages+4(,%eax,8), %eax
	retl
LBB131_5:                               # %.._crit_edge.loopexitsplit_crit_edge
	addl	$2, %eax
	movl	_errormessages+4(,%eax,8), %eax
	retl
LBB131_4:                               # %.._crit_edge.loopexitsplitsplit_crit_edge
	addl	$3, %eax
	movl	_errormessages+4(,%eax,8), %eax
	retl
                                        # -- End function
	.def	_Errorlog_Display;
	.scl	2;
	.type	32;
	.endef
	.globl	_Errorlog_Display               # -- Begin function Errorlog_Display
	.p2align	4
_Errorlog_Display:                      # @Errorlog_Display
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	$L_str.35
	calll	_puts
	addl	$4, %esp
	movl	_plcErrList, %esi
	testl	%esi, %esi
	je	LBB132_6
# %bb.1:                                # %.preheader.preheader
	movl	16(%esp), %ebx
	xorl	%edi, %edi
	jmp	LBB132_2
LBB132_10:                              # %.._crit_edge.loopexit_crit_edge
                                        #   in Loop: Header=BB132_2 Depth=1
	incl	%ecx
	.p2align	4
LBB132_11:                              # %._crit_edge
                                        #   in Loop: Header=BB132_2 Depth=1
	movl	_errormessages+4(,%ecx,8), %ecx
LBB132_12:                              # %.loopexit
                                        #   in Loop: Header=BB132_2 Depth=1
	pushl	8(%esi)
	pushl	%ecx
	pushl	%eax
	pushl	(%esi)
	pushl	%ebx
	pushl	$"??_C@_0BN@DCLOIMMC@?5?5?$CFs?$CI?$CFd?$CJ?$IB?$EA?3?5ERROR?5?$CFd?5?$CFs?4?5?$CFs?6?$AA@"
	calll	_printf
	addl	$24, %esp
	movl	12(%esi), %esi
	incl	%edi
	testl	%esi, %esi
	je	LBB132_13
LBB132_2:                               # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB132_4 Depth 2
	movl	4(%esi), %eax
	movzwl	_errormessages, %edx
	movl	$0, %ecx
	cmpl	%edx, %eax
	je	LBB132_11
# %bb.3:                                # %.lr.ph.preheader
                                        #   in Loop: Header=BB132_2 Depth=1
	xorl	%ecx, %ecx
	.p2align	4
LBB132_4:                               # %.lr.ph
                                        #   Parent Loop BB132_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$52, %ecx
	je	LBB132_5
# %bb.14:                               #   in Loop: Header=BB132_4 Depth=2
	movzwl	_errormessages+8(,%ecx,8), %edx
	cmpl	%edx, %eax
	je	LBB132_10
# %bb.15:                               #   in Loop: Header=BB132_4 Depth=2
	movzwl	_errormessages+16(,%ecx,8), %edx
	cmpl	%edx, %eax
	je	LBB132_9
# %bb.16:                               #   in Loop: Header=BB132_4 Depth=2
	movzwl	_errormessages+24(,%ecx,8), %edx
	cmpl	%edx, %eax
	je	LBB132_8
# %bb.17:                               #   in Loop: Header=BB132_4 Depth=2
	movzwl	_errormessages+32(,%ecx,8), %edx
	addl	$4, %ecx
	cmpl	%edx, %eax
	jne	LBB132_4
	jmp	LBB132_11
LBB132_5:                               #   in Loop: Header=BB132_2 Depth=1
	movl	$"??_C@_0O@NIPGCINC@Unknown?5error?$AA@", %ecx
	jmp	LBB132_12
LBB132_9:                               # %.._crit_edge.loopexitsplit_crit_edge
                                        #   in Loop: Header=BB132_2 Depth=1
	addl	$2, %ecx
	jmp	LBB132_11
LBB132_8:                               # %.._crit_edge.loopexitsplitsplit_crit_edge
                                        #   in Loop: Header=BB132_2 Depth=1
	addl	$3, %ecx
	jmp	LBB132_11
LBB132_13:
	pushl	%edi
	pushl	$"??_C@_0P@FIPLEFNG@?5?5?$CFd?5Error?$CIs?$CJ?6?$AA@"
	calll	_printf
	addl	$8, %esp
	jmp	LBB132_7
LBB132_6:
	pushl	$L_str.1.254
	calll	_puts
	addl	$4, %esp
LBB132_7:
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Errorlog_Count;
	.scl	2;
	.type	32;
	.endef
	.globl	_Errorlog_Count                 # -- Begin function Errorlog_Count
	.p2align	4
_Errorlog_Count:                        # @Errorlog_Count
# %bb.0:
	movl	_plcErrList, %ecx
	xorl	%eax, %eax
	testl	%ecx, %ecx
	je	LBB133_3
	.p2align	4
LBB133_1:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	incl	%eax
	movl	12(%ecx), %ecx
	testl	%ecx, %ecx
	jne	LBB133_1
LBB133_3:                               # %.loopexit
	retl
                                        # -- End function
	.def	_Exception_Init;
	.scl	2;
	.type	32;
	.endef
	.globl	_Exception_Init                 # -- Begin function Exception_Init
	.p2align	4
_Exception_Init:                        # @Exception_Init
# %bb.0:
	movb	$0, _exceptionNOW
	retl
                                        # -- End function
	.def	_Exception_Set;
	.scl	2;
	.type	32;
	.endef
	.globl	__xmm@00000000000000000000007900000000 # -- Begin function Exception_Set
	.section	.rdata,"dr",discard,__xmm@00000000000000000000007900000000
	.p2align	4, 0x0
__xmm@00000000000000000000007900000000:
	.long	0                               # 0x0
	.long	121                             # 0x79
	.long	0                               # 0x0
	.long	0                               # 0x0
	.text
	.globl	_Exception_Set
	.p2align	4
_Exception_Set:                         # @Exception_Set
# %bb.0:
	cmpb	$0, _exceptionNOW
	jne	LBB135_2
# %bb.1:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	24(%esp), %esi
	movl	20(%esp), %edi
	movl	16(%esp), %ebx
	subl	$24, %esp
	movsd	__xmm@00000000000000000000007900000000, %xmm0 # xmm0 = [0,121,0,0]
	movups	%xmm0, (%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	calll	_Api_Request
	addl	$24, %esp
	movb	$1, _exceptionNOW
	pushl	%edi
	pushl	%ebx
	pushl	%esi
	calll	_Errorlog_Add
	addl	$12, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
LBB135_2:
	retl
                                        # -- End function
	.def	_Exception_Clear;
	.scl	2;
	.type	32;
	.endef
	.globl	_Exception_Clear                # -- Begin function Exception_Clear
	.p2align	4
_Exception_Clear:                       # @Exception_Clear
# %bb.0:
	movb	$0, _exceptionNOW
	retl
                                        # -- End function
	.def	_Functionblock_Dummy;
	.scl	2;
	.type	32;
	.endef
	.globl	_Functionblock_Dummy            # -- Begin function Functionblock_Dummy
	.p2align	4
_Functionblock_Dummy:                   # @Functionblock_Dummy
# %bb.0:
	retl
                                        # -- End function
	.def	_Functionblock_Add;
	.scl	2;
	.type	32;
	.endef
	.globl	_Functionblock_Add              # -- Begin function Functionblock_Add
	.p2align	4
_Functionblock_Add:                     # @Functionblock_Add
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	20(%esp), %ebp
	pushl	$20
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %esi
	testl	%eax, %eax
	je	LBB138_1
# %bb.2:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%esi, (%eax)
	movl	$20, 4(%eax)
	movl	$"??_C@_0BI@KIBLMIFL@Functionblock_Add?3entry?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB138_3
# %bb.4:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB138_5
LBB138_1:
	pushl	$"??_C@_0BI@KIBLMIFL@Functionblock_Add?3entry?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB138_6
LBB138_3:
	movl	%eax, _heaplist
LBB138_5:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB138_6:                               # %Heap_Alloc.exit
	movl	$0, 16(%esi)
	pushl	%ebp
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %ebx
	incl	%ebx
	pushl	%ebx
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %edi
	testl	%eax, %eax
	je	LBB138_7
# %bb.8:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%edi, (%eax)
	movl	%ebx, 4(%eax)
	movl	$"??_C@_0BH@GMAJPKBL@Functionblock_Add?3name?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB138_9
# %bb.10:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB138_11
LBB138_7:
	pushl	$"??_C@_0BH@GMAJPKBL@Functionblock_Add?3name?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB138_12
LBB138_9:
	movl	%eax, _heaplist
LBB138_11:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB138_12:                              # %Heap_Alloc.exit1
	movl	%edi, (%esi)
	pushl	%ebp
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
	cmpl	$0, _FbList
	je	LBB138_13
# %bb.14:
	movl	_FbBottom, %eax
	movl	%esi, 16(%eax)
	jmp	LBB138_15
LBB138_13:
	movl	%esi, _FbList
LBB138_15:
	movl	%esi, _FbBottom
	movl	$2, _status_funcblock
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Functionblock_AddConnector;
	.scl	2;
	.type	32;
	.endef
	.globl	_Functionblock_AddConnector     # -- Begin function Functionblock_AddConnector
	.p2align	4
_Functionblock_AddConnector:            # @Functionblock_AddConnector
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	20(%esp), %ebx
	movl	16(%esp), %edi
	pushl	$14
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %esi
	testl	%eax, %eax
	je	LBB139_1
# %bb.2:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%esi, (%eax)
	movl	$14, 4(%eax)
	movl	$"??_C@_0BL@DLCPKPLN@Functionblock_AddConnector?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB139_3
# %bb.4:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB139_5
LBB139_1:
	pushl	$"??_C@_0BL@DLCPKPLN@Functionblock_AddConnector?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB139_6
LBB139_3:
	movl	%eax, _heaplist
LBB139_5:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB139_6:                               # %Heap_Alloc.exit
	movl	$0, 10(%esi)
	movzwl	8(%ebx), %eax
	movw	%ax, 8(%esi)
	movsd	(%ebx), %xmm0                   # xmm0 = mem[0],zero
	movsd	%xmm0, (%esi)
	movl	12(%edi), %eax
	testl	%eax, %eax
	je	LBB139_7
	.p2align	4
LBB139_8:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	%eax, %ecx
	movl	10(%eax), %eax
	testl	%eax, %eax
	jne	LBB139_8
# %bb.9:
	movl	%esi, 10(%ecx)
	jmp	LBB139_10
LBB139_7:
	movl	%esi, 12(%edi)
LBB139_10:
	movl	$2, _status_funcblock
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Functionblock_Search;
	.scl	2;
	.type	32;
	.endef
	.globl	_Functionblock_Search           # -- Begin function Functionblock_Search
	.p2align	4
_Functionblock_Search:                  # @Functionblock_Search
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	_FbList, %edi
	xorl	%esi, %esi
	testl	%edi, %edi
	je	LBB140_5
# %bb.1:                                # %.preheader.preheader
	movl	16(%esp), %ebx
	.p2align	4
LBB140_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebx
	pushl	(%edi)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB140_3
# %bb.4:                                #   in Loop: Header=BB140_2 Depth=1
	movl	16(%edi), %edi
	testl	%edi, %edi
	jne	LBB140_2
	jmp	LBB140_5
LBB140_3:
	movl	%edi, %esi
LBB140_5:                               # %.loopexit
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Functionblock_Clear;
	.scl	2;
	.type	32;
	.endef
	.globl	_Functionblock_Clear            # -- Begin function Functionblock_Clear
	.p2align	4
_Functionblock_Clear:                   # @Functionblock_Clear
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	_FbList, %esi
	testl	%esi, %esi
	jne	LBB141_1
LBB141_26:                              # %.loopexit
	movl	$0, _FbBottom
	movl	$0, _FbList
	movl	$0, _status_funcblock
	popl	%esi
	popl	%edi
	retl
	.p2align	4
LBB141_18:                              # %.loopexit5.i2
                                        #   in Loop: Header=BB141_1 Depth=1
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB141_19
# %bb.21:                               #   in Loop: Header=BB141_1 Depth=1
	movl	%edx, 16(%ecx)
LBB141_23:                              #   in Loop: Header=BB141_1 Depth=1
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB141_24:                              # %.loopexit.i3
                                        #   in Loop: Header=BB141_1 Depth=1
	pushl	%esi
	calll	_free
	addl	$4, %esp
LBB141_25:                              # %Heap_Free.exit4
                                        #   in Loop: Header=BB141_1 Depth=1
	movl	%edi, _FbList
	movl	%edi, %esi
	testl	%edi, %edi
	je	LBB141_26
LBB141_1:                               # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB141_5 Depth 2
                                        #     Child Loop BB141_16 Depth 2
	movl	(%esi), %edi
	testl	%edi, %edi
	je	LBB141_2
# %bb.3:                                #   in Loop: Header=BB141_1 Depth=1
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB141_13
# %bb.4:                                #   in Loop: Header=BB141_1 Depth=1
	movl	%ecx, %eax
	cmpl	%edi, (%ecx)
	je	LBB141_7
	.p2align	4
LBB141_5:                               # %.preheader.i
                                        #   Parent Loop BB141_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB141_13
# %bb.6:                                #   in Loop: Header=BB141_5 Depth=2
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%edi, (%edx)
	jne	LBB141_5
LBB141_7:                               # %.loopexit5.i
                                        #   in Loop: Header=BB141_1 Depth=1
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB141_8
# %bb.10:                               #   in Loop: Header=BB141_1 Depth=1
	movl	%edx, 16(%ecx)
	jmp	LBB141_12
	.p2align	4
LBB141_2:                               # %Heap_Free.exit.thread
                                        #   in Loop: Header=BB141_1 Depth=1
	movl	16(%esi), %edi
	jmp	LBB141_14
LBB141_19:                              #   in Loop: Header=BB141_1 Depth=1
	cmpl	%eax, %ecx
	je	LBB141_20
# %bb.22:                               #   in Loop: Header=BB141_1 Depth=1
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB141_23
LBB141_8:                               #   in Loop: Header=BB141_1 Depth=1
	cmpl	%eax, %ecx
	je	LBB141_9
# %bb.11:                               #   in Loop: Header=BB141_1 Depth=1
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB141_12
LBB141_20:                              #   in Loop: Header=BB141_1 Depth=1
	movl	$0, _heaplist
	movl	$0, _heapbottom
	jmp	LBB141_23
LBB141_9:                               #   in Loop: Header=BB141_1 Depth=1
	movl	$0, _heaplist
	movl	$0, _heapbottom
	.p2align	4
LBB141_12:                              #   in Loop: Header=BB141_1 Depth=1
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB141_13:                              # %Heap_Free.exit
                                        #   in Loop: Header=BB141_1 Depth=1
	pushl	%edi
	calll	_free
	addl	$4, %esp
	movl	16(%esi), %edi
	movl	_FbList, %esi
	testl	%esi, %esi
	je	LBB141_25
LBB141_14:                              #   in Loop: Header=BB141_1 Depth=1
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB141_24
# %bb.15:                               #   in Loop: Header=BB141_1 Depth=1
	movl	%ecx, %eax
	cmpl	%esi, (%ecx)
	je	LBB141_18
	.p2align	4
LBB141_16:                              # %.preheader.i1
                                        #   Parent Loop BB141_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB141_24
# %bb.17:                               #   in Loop: Header=BB141_16 Depth=2
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%esi, (%edx)
	jne	LBB141_16
	jmp	LBB141_18
                                        # -- End function
	.def	_Functionblock_GetEntry;
	.scl	2;
	.type	32;
	.endef
	.globl	_Functionblock_GetEntry         # -- Begin function Functionblock_GetEntry
	.p2align	4
_Functionblock_GetEntry:                # @Functionblock_GetEntry
# %bb.0:
	pushl	$600                            # imm = 0x258
	pushl	$_Rtedge_GetStructureName.name
	pushl	$"??_C@_06CLBDIDBH@Source?$AA@"
	pushl	16(%esp)
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	je	LBB142_1
LBB142_5:
	xorl	%eax, %eax
LBB142_6:                               # %Rtedge_GetStructureName.exit
	movzwl	_hBlockFuncRSL, %ecx
	pushl	%eax
	pushl	%ecx
	calll	_GetRtProcAddress
	addl	$8, %esp
	retl
LBB142_1:
	movl	$1431458899, %eax               # imm = 0x55525453
	xorl	_Rtedge_GetStructureName.name, %eax
	movl	$592724821, %ecx                # imm = 0x23544355
	xorl	_Rtedge_GetStructureName.name+3, %ecx
	orl	%eax, %ecx
	je	LBB142_2
# %bb.3:
	pushl	$9
	pushl	$L___const.Rtedge_GetStructureName.tag2
	pushl	$_Rtedge_GetStructureName.name
	calll	_memcmp
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB142_5
# %bb.4:
	movl	$_Rtedge_GetStructureName.name+9, %eax
	jmp	LBB142_6
LBB142_2:
	movl	$_Rtedge_GetStructureName.name+7, %eax
	jmp	LBB142_6
                                        # -- End function
	.def	_Functionblock_Load;
	.scl	2;
	.type	32;
	.endef
	.globl	_Functionblock_Load             # -- Begin function Functionblock_Load
	.p2align	4
_Functionblock_Load:                    # @Functionblock_Load
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$12, %esp
	movl	32(%esp), %esi
	pushl	%esi
	calll	_INtime_RslLoad
	addl	$4, %esp
	movw	%ax, _hBlockFuncRSL
	testw	%ax, %ax
	je	LBB143_35
# %bb.1:
	movzwl	%ax, %eax
	pushl	$"??_C@_0P@POEJAJGK@FunctionBlocks?$AA@"
	pushl	%eax
	calll	_GetRtProcAddress
	addl	$8, %esp
	movl	%eax, %edi
	movzwl	_hBlockFuncRSL, %eax
	pushl	$"??_C@_0BC@ENDAEKAI@NumFunctionBlocks?$AA@"
	pushl	%eax
	calll	_GetRtProcAddress
	addl	$8, %esp
	movl	%edi, (%esp)                    # 4-byte Spill
	testl	%edi, %edi
	je	LBB143_3
# %bb.2:
	testl	%eax, %eax
	je	LBB143_3
# %bb.4:
	movzwl	(%eax), %eax
	movl	$6, _status_funcblock
	movl	%eax, 4(%esp)                   # 4-byte Spill
	testl	%eax, %eax
	je	LBB143_35
# %bb.5:                                # %.preheader7.preheader
	xorl	%esi, %esi
	jmp	LBB143_6
	.p2align	4
LBB143_34:                              # %.loopexit
                                        #   in Loop: Header=BB143_6 Depth=1
	incl	%esi
	cmpl	4(%esp), %esi                   # 4-byte Folded Reload
	je	LBB143_35
LBB143_6:                               # %.preheader7
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB143_23 Depth 2
                                        #       Child Loop BB143_31 Depth 3
	movl	(%esp), %eax                    # 4-byte Reload
	movl	(%eax,%esi,4), %eax
	movl	(%eax), %ebx
	pushl	$20
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %edi
	testl	%eax, %eax
	je	LBB143_7
# %bb.8:                                #   in Loop: Header=BB143_6 Depth=1
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%edi, (%eax)
	movl	$20, 4(%eax)
	movl	$"??_C@_0BI@KIBLMIFL@Functionblock_Add?3entry?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB143_9
# %bb.10:                               #   in Loop: Header=BB143_6 Depth=1
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB143_11
	.p2align	4
LBB143_7:                               #   in Loop: Header=BB143_6 Depth=1
	pushl	$"??_C@_0BI@KIBLMIFL@Functionblock_Add?3entry?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB143_12
	.p2align	4
LBB143_9:                               #   in Loop: Header=BB143_6 Depth=1
	movl	%eax, _heaplist
LBB143_11:                              #   in Loop: Header=BB143_6 Depth=1
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB143_12:                              # %Heap_Alloc.exit
                                        #   in Loop: Header=BB143_6 Depth=1
	movl	$0, 16(%edi)
	movl	%ebx, 8(%esp)                   # 4-byte Spill
	pushl	%ebx
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %ebp
	incl	%ebp
	pushl	%ebp
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %ebx
	testl	%eax, %eax
	je	LBB143_13
# %bb.14:                               #   in Loop: Header=BB143_6 Depth=1
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%ebx, (%eax)
	movl	%ebp, 4(%eax)
	movl	$"??_C@_0BH@GMAJPKBL@Functionblock_Add?3name?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB143_15
# %bb.16:                               #   in Loop: Header=BB143_6 Depth=1
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB143_17
	.p2align	4
LBB143_13:                              #   in Loop: Header=BB143_6 Depth=1
	pushl	$"??_C@_0BH@GMAJPKBL@Functionblock_Add?3name?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB143_18
	.p2align	4
LBB143_15:                              #   in Loop: Header=BB143_6 Depth=1
	movl	%eax, _heaplist
LBB143_17:                              #   in Loop: Header=BB143_6 Depth=1
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB143_18:                              # %Heap_Alloc.exit5
                                        #   in Loop: Header=BB143_6 Depth=1
	movl	%ebx, (%edi)
	pushl	8(%esp)                         # 4-byte Folded Reload
	pushl	%ebx
	calll	_strcpy
	addl	$8, %esp
	cmpl	$0, _FbList
	je	LBB143_19
# %bb.20:                               #   in Loop: Header=BB143_6 Depth=1
	movl	_FbBottom, %eax
	movl	%edi, 16(%eax)
	jmp	LBB143_21
	.p2align	4
LBB143_19:                              #   in Loop: Header=BB143_6 Depth=1
	movl	%edi, _FbList
LBB143_21:                              #   in Loop: Header=BB143_6 Depth=1
	movl	%edi, _FbBottom
	movl	$2, _status_funcblock
	movl	(%esp), %ecx                    # 4-byte Reload
	movl	(%ecx,%esi,4), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%edi)
	movl	(%ecx,%esi,4), %ebp
	cmpl	$0, 10(%ebp)
	je	LBB143_34
# %bb.22:                               #   in Loop: Header=BB143_6 Depth=1
	addl	$8, %ebp
	jmp	LBB143_23
	.p2align	4
LBB143_30:                              #   in Loop: Header=BB143_23 Depth=2
	movl	%ebx, 12(%edi)
LBB143_33:                              #   in Loop: Header=BB143_23 Depth=2
	movl	$2, _status_funcblock
	cmpl	$0, 12(%ebp)
	leal	10(%ebp), %ebp
	je	LBB143_34
LBB143_23:                              #   Parent Loop BB143_6 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB143_31 Depth 3
	pushl	$14
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %ebx
	testl	%eax, %eax
	je	LBB143_24
# %bb.25:                               #   in Loop: Header=BB143_23 Depth=2
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%ebx, (%eax)
	movl	$14, 4(%eax)
	movl	$"??_C@_0BL@DLCPKPLN@Functionblock_AddConnector?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB143_26
# %bb.27:                               #   in Loop: Header=BB143_23 Depth=2
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB143_28
	.p2align	4
LBB143_24:                              #   in Loop: Header=BB143_23 Depth=2
	pushl	$"??_C@_0BL@DLCPKPLN@Functionblock_AddConnector?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB143_29
	.p2align	4
LBB143_26:                              #   in Loop: Header=BB143_23 Depth=2
	movl	%eax, _heaplist
LBB143_28:                              #   in Loop: Header=BB143_23 Depth=2
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB143_29:                              # %Heap_Alloc.exit6
                                        #   in Loop: Header=BB143_23 Depth=2
	movl	$0, 10(%ebx)
	movzwl	8(%ebp), %eax
	movw	%ax, 8(%ebx)
	movsd	(%ebp), %xmm0                   # xmm0 = mem[0],zero
	movsd	%xmm0, (%ebx)
	movl	12(%edi), %eax
	testl	%eax, %eax
	je	LBB143_30
	.p2align	4
LBB143_31:                              # %.preheader
                                        #   Parent Loop BB143_6 Depth=1
                                        #     Parent Loop BB143_23 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	%eax, %ecx
	movl	10(%eax), %eax
	testl	%eax, %eax
	jne	LBB143_31
# %bb.32:                               #   in Loop: Header=BB143_23 Depth=2
	movl	%ebx, 10(%ecx)
	jmp	LBB143_33
LBB143_35:                              # %.loopexit8
	addl	$12, %esp
	jmp	LBB143_36
LBB143_3:
	pushl	%esi
	pushl	$208
	pushl	$0
	calll	_Errorlog_Add
	addl	$24, %esp
LBB143_36:                              # %.loopexit8
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Functionblock_Unload;
	.scl	2;
	.type	32;
	.endef
	.globl	_Functionblock_Unload           # -- Begin function Functionblock_Unload
	.p2align	4
_Functionblock_Unload:                  # @Functionblock_Unload
# %bb.0:
	movzwl	_hBlockFuncRSL, %eax
	testw	%ax, %ax
	je	LBB144_2
# %bb.1:
	movzwl	%ax, %eax
	pushl	%eax
	calll	_FreeRtLibrary
	addl	$4, %esp
	movw	$0, _hBlockFuncRSL
LBB144_2:
	movl	$0, _status_funcblock
	retl
                                        # -- End function
	.def	_Functionblock_Register;
	.scl	2;
	.type	32;
	.endef
	.globl	_Functionblock_Register         # -- Begin function Functionblock_Register
	.p2align	4
_Functionblock_Register:                # @Functionblock_Register
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	20(%esp), %esi
	pushl	$600                            # imm = 0x258
	pushl	$_Rtedge_GetStructureName.name
	pushl	$"??_C@_06CLBDIDBH@Source?$AA@"
	pushl	%esi
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	movl	%esi, %edi
	testl	%eax, %eax
	jne	LBB145_4
# %bb.1:
	movl	$1431458899, %eax               # imm = 0x55525453
	xorl	_Rtedge_GetStructureName.name, %eax
	movl	$592724821, %ecx                # imm = 0x23544355
	xorl	_Rtedge_GetStructureName.name+3, %ecx
	orl	%eax, %ecx
	je	LBB145_2
# %bb.3:
	pushl	$9
	pushl	$L___const.Rtedge_GetStructureName.tag2
	pushl	$_Rtedge_GetStructureName.name
	calll	_memcmp
	addl	$12, %esp
	testl	%eax, %eax
	movl	$_Rtedge_GetStructureName.name+9, %edi
	cmovnel	%esi, %edi
	jmp	LBB145_4
LBB145_2:
	movl	$_Rtedge_GetStructureName.name+7, %edi
LBB145_4:                               # %Rtedge_GetStructureName.exit
	movl	_FbList, %ebx
	testl	%ebx, %ebx
	je	LBB145_14
	.p2align	4
LBB145_6:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%edi
	pushl	(%ebx)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB145_8
# %bb.7:                                #   in Loop: Header=BB145_6 Depth=1
	movl	16(%ebx), %ebx
	testl	%ebx, %ebx
	jne	LBB145_6
	jmp	LBB145_14
LBB145_8:
	movl	_variablelist, %ebp
	testl	%ebp, %ebp
	je	LBB145_12
	.p2align	4
LBB145_10:                              # %.preheader.i
                                        # =>This Inner Loop Header: Depth=1
	pushl	%edi
	pushl	(%ebp)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB145_13
# %bb.11:                               #   in Loop: Header=BB145_10 Depth=1
	movl	19(%ebp), %ebp
	testl	%ebp, %ebp
	jne	LBB145_10
LBB145_12:                              # %.loopexit
	pushl	$1059                           # imm = 0x423
	pushl	%edi
	calll	_Variable_Add
	addl	$8, %esp
	movl	4(%ebx), %ecx
	movl	%ecx, (%eax)
	movb	$1, 10(%eax)
LBB145_13:                              # %Variable_Search.exit
	pushl	12(%ebx)
	pushl	%esi
	calll	_Structure_CreateCatalog
	addl	$8, %esp
LBB145_14:                              # %.loopexit2
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Functionblock_GetSize;
	.scl	2;
	.type	32;
	.endef
	.globl	_Functionblock_GetSize          # -- Begin function Functionblock_GetSize
	.p2align	4
_Functionblock_GetSize:                 # @Functionblock_GetSize
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	_FbList, %edi
	xorl	%esi, %esi
	testl	%edi, %edi
	je	LBB146_13
# %bb.1:                                # %.preheader3.preheader
	movl	16(%esp), %ebx
	.p2align	4
LBB146_2:                               # %.preheader3
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebx
	pushl	(%edi)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB146_4
# %bb.3:                                #   in Loop: Header=BB146_2 Depth=1
	movl	16(%edi), %edi
	testl	%edi, %edi
	jne	LBB146_2
	jmp	LBB146_13
LBB146_4:
	movl	12(%edi), %eax
	testl	%eax, %eax
	je	LBB146_13
# %bb.5:                                # %.preheader
	xorl	%ecx, %ecx
	movl	_typematch, %edx
	xorl	%esi, %esi
	jmp	LBB146_6
	.p2align	4
LBB146_9:                               #   in Loop: Header=BB146_6 Depth=1
	movl	-4(%ebx), %edi
	cmpl	$-1, %edi
	movzwl	%di, %edi
	cmovel	%ecx, %edi
LBB146_12:                              # %Rtedge_TypeSize.exit
                                        #   in Loop: Header=BB146_6 Depth=1
	addl	%edi, %esi
	movl	10(%eax), %eax
	testl	%eax, %eax
	je	LBB146_13
LBB146_6:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB146_8 Depth 2
	movl	$0, %edi
	testl	%edx, %edx
	je	LBB146_12
# %bb.7:                                # %.preheader.i.preheader
                                        #   in Loop: Header=BB146_6 Depth=1
	movzwl	(%eax), %edi
	movl	$_typematch+14, %ebx
	.p2align	4
LBB146_8:                               # %.preheader.i
                                        #   Parent Loop BB146_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpw	-10(%ebx), %di
	je	LBB146_9
# %bb.10:                               #   in Loop: Header=BB146_8 Depth=2
	cmpl	$0, (%ebx)
	leal	14(%ebx), %ebx
	jne	LBB146_8
# %bb.11:                               #   in Loop: Header=BB146_6 Depth=1
	xorl	%edi, %edi
	jmp	LBB146_12
LBB146_13:                              # %.loopexit
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Functionblock_Display;
	.scl	2;
	.type	32;
	.endef
	.globl	_Functionblock_Display          # -- Begin function Functionblock_Display
	.p2align	4
_Functionblock_Display:                 # @Functionblock_Display
# %bb.0:
	pushl	%edi
	pushl	%esi
	pushl	$L_str.39
	calll	_puts
	addl	$4, %esp
	movl	_FbList, %esi
	testl	%esi, %esi
	je	LBB147_3
# %bb.1:                                # %.preheader.preheader
	movl	$1, %edi
	.p2align	4
LBB147_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	4(%esi)
	pushl	(%esi)
	pushl	%edi
	pushl	$"??_C@_0BG@JCCPOPHJ@?5?5FB?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@"
	calll	_printf
	addl	$16, %esp
	incl	%edi
	movl	16(%esi), %esi
	testl	%esi, %esi
	jne	LBB147_2
LBB147_3:                               # %.loopexit
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Heap_Add;
	.scl	2;
	.type	32;
	.endef
	.globl	_Heap_Add                       # -- Begin function Heap_Add
	.p2align	4
_Heap_Add:                              # @Heap_Add
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	24(%esp), %esi
	movl	20(%esp), %edi
	movl	16(%esp), %ebx
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%ebx, (%eax)
	movl	%edi, 4(%eax)
	movl	%esi, 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB148_1
# %bb.2:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB148_3
LBB148_1:
	movl	%eax, _heaplist
LBB148_3:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Heap_Clear;
	.scl	2;
	.type	32;
	.endef
	.globl	_Heap_Clear                     # -- Begin function Heap_Clear
	.p2align	4
_Heap_Clear:                            # @Heap_Clear
# %bb.0:
	movl	_heaplist, %eax
	testl	%eax, %eax
	je	LBB149_4
# %bb.1:                                # %.preheader.preheader
	pushl	%esi
	.p2align	4
LBB149_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	16(%eax), %esi
	pushl	%eax
	calll	_free
	addl	$4, %esp
	movl	%esi, _heaplist
	movl	%esi, %eax
	testl	%esi, %esi
	jne	LBB149_2
# %bb.3:
	popl	%esi
LBB149_4:                               # %.loopexit
	movl	$0, _heaplist
	movl	$0, _heapbottom
	movl	$0, _status_heap
	retl
                                        # -- End function
	.def	_Heap_Del;
	.scl	2;
	.type	32;
	.endef
	.globl	_Heap_Del                       # -- Begin function Heap_Del
	.p2align	4
_Heap_Del:                              # @Heap_Del
# %bb.0:
	pushl	%esi
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB150_11
# %bb.1:
	movl	8(%esp), %esi
	cmpl	%esi, (%ecx)
	je	LBB150_2
	.p2align	4
LBB150_3:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	16(%ecx), %eax
	testl	%eax, %eax
	je	LBB150_11
# %bb.4:                                #   in Loop: Header=BB150_3 Depth=1
	movl	%ecx, %edx
	movl	%eax, %ecx
	cmpl	%esi, (%eax)
	jne	LBB150_3
	jmp	LBB150_5
LBB150_2:
	movl	%ecx, %edx
	movl	%ecx, %eax
LBB150_5:                               # %.loopexit4
	movl	16(%eax), %ecx
	testl	%ecx, %ecx
	je	LBB150_6
# %bb.8:
	movl	%ecx, 16(%edx)
	jmp	LBB150_10
LBB150_6:
	cmpl	%eax, %edx
	je	LBB150_7
# %bb.9:
	movl	$0, 16(%edx)
	movl	%edx, _heapbottom
	jmp	LBB150_10
LBB150_7:
	movl	$0, _heaplist
	movl	$0, _heapbottom
LBB150_10:
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB150_11:                              # %.loopexit
	popl	%esi
	retl
                                        # -- End function
	.def	_Heap_Display;
	.scl	2;
	.type	32;
	.endef
	.globl	_Heap_Display                   # -- Begin function Heap_Display
	.p2align	4
_Heap_Display:                          # @Heap_Display
# %bb.0:
	pushl	%edi
	pushl	%esi
	pushl	$L_str.40
	calll	_puts
	addl	$4, %esp
	movl	_heaplist, %esi
	testl	%esi, %esi
	je	LBB151_4
# %bb.1:                                # %.preheader.preheader
	movl	$1, %edi
	.p2align	4
LBB151_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	8(%esi)
	pushl	4(%esi)
	pushl	12(%esi)
	pushl	(%esi)
	pushl	%edi
	pushl	$"??_C@_0CI@CHIKLELK@?5?5Heap?$CI?$CF03d?$CJ?5?$CFp?5?5Order?$CD?$CFd?5?$CFd?5byt@"
	calll	_printf
	addl	$24, %esp
	movl	16(%esi), %esi
	incl	%edi
	testl	%esi, %esi
	jne	LBB151_2
	jmp	LBB151_3
LBB151_4:
	pushl	$L_str.1.254
	calll	_puts
	addl	$4, %esp
LBB151_3:                               # %.loopexit
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Heap_Alloc;
	.scl	2;
	.type	32;
	.endef
	.globl	_Heap_Alloc                     # -- Begin function Heap_Alloc
	.p2align	4
_Heap_Alloc:                            # @Heap_Alloc
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	20(%esp), %edi
	movl	16(%esp), %ebx
	pushl	%ebx
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %esi
	testl	%eax, %eax
	je	LBB152_1
# %bb.2:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%esi, (%eax)
	movl	%ebx, 4(%eax)
	movl	%edi, 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB152_3
# %bb.4:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB152_5
LBB152_1:
	pushl	%edi
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB152_6
LBB152_3:
	movl	%eax, _heaplist
LBB152_5:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB152_6:
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Heap_Free;
	.scl	2;
	.type	32;
	.endef
	.globl	_Heap_Free                      # -- Begin function Heap_Free
	.p2align	4
_Heap_Free:                             # @Heap_Free
# %bb.0:
	pushl	%esi
	movl	8(%esp), %ecx
	testl	%ecx, %ecx
	je	LBB153_13
# %bb.1:
	movl	_heaplist, %edx
	testl	%edx, %edx
	je	LBB153_12
# %bb.2:
	cmpl	%ecx, (%edx)
	je	LBB153_3
	.p2align	4
LBB153_4:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	16(%edx), %eax
	testl	%eax, %eax
	je	LBB153_12
# %bb.5:                                #   in Loop: Header=BB153_4 Depth=1
	movl	%edx, %esi
	movl	%eax, %edx
	cmpl	%ecx, (%eax)
	jne	LBB153_4
	jmp	LBB153_6
LBB153_13:
	popl	%esi
	retl
LBB153_3:
	movl	%edx, %esi
	movl	%edx, %eax
LBB153_6:                               # %.loopexit5
	movl	16(%eax), %ecx
	testl	%ecx, %ecx
	je	LBB153_7
# %bb.9:
	movl	%ecx, 16(%esi)
	jmp	LBB153_11
LBB153_7:
	cmpl	%eax, %esi
	je	LBB153_8
# %bb.10:
	movl	$0, 16(%esi)
	movl	%esi, _heapbottom
	jmp	LBB153_11
LBB153_8:
	movl	$0, _heaplist
	movl	$0, _heapbottom
LBB153_11:
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB153_12:                              # %.loopexit
	popl	%esi
	jmp	_free                           # TAILCALL
                                        # -- End function
	.def	_Indicate_Status;
	.scl	2;
	.type	32;
	.endef
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
	xorl	%eax, %eax
	retl
                                        # -- End function
	.def	_IniFile_Open;
	.scl	2;
	.type	32;
	.endef
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
	je	LBB182_2
# %bb.1:
	pushl	%eax
	calll	_fclose
	addl	$4, %esp
LBB182_2:
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
	je	LBB183_2
# %bb.1:
	pushl	%eax
	pushl	16(%esp)
	pushl	16(%esp)
	calll	_fgets
	addl	$12, %esp
	retl
LBB183_2:
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
	je	LBB184_2
# %bb.1:
	movb	$0, (%eax)
LBB184_2:
	pushl	$10
	pushl	%esi
	calll	_strchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB184_4
# %bb.3:
	movb	$0, (%eax)
LBB184_4:
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
	je	LBB185_1
# %bb.2:
	movl	148(%esp), %edx
	movl	%esp, %ebx
	pushl	%ebx
	pushl	156(%esp)
	calll	_LowlevelGetProfileString
	addl	$8, %esp
	testb	%al, %al
	je	LBB185_4
# %bb.3:
	pushl	%edi
	jmp	LBB185_5
LBB185_1:
	pushl	%edi
	pushl	%esi
	calll	_strcpy
	addl	$8, %esp
	pushl	%esi
	calll	_strlen
	addl	$132, %esp
	jmp	LBB185_6
LBB185_4:
	pushl	%ebx
LBB185_5:
	pushl	%esi
	calll	_strcpy
	addl	$8, %esp
	pushl	%esi
	calll	_strlen
	addl	$4, %esp
	addl	$128, %esp
LBB185_6:
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
	je	LBB186_14
# %bb.1:
	leal	12(%esp), %edi
	jmp	LBB186_2
LBB186_12:                              #   in Loop: Header=BB186_2 Depth=1
	pushl	%edi
	leal	272(%esp), %eax
	pushl	%eax
	calll	_strcpy
	addl	$8, %esp
	.p2align	4
LBB186_13:                              #   in Loop: Header=BB186_2 Depth=1
	movb	$0, 2(%esp)
	movw	$2336, (%esp)                   # imm = 0x920
	movb	$0, 12(%esp)
	pushl	8(%esp)                         # 4-byte Folded Reload
	pushl	$127
	pushl	%ebp
	calll	_fgets
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB186_14
LBB186_2:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB186_5 Depth 2
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
	je	LBB186_3
# %bb.4:                                # %.preheader.preheader
                                        #   in Loop: Header=BB186_2 Depth=1
	movl	%eax, %esi
	xorl	%edi, %edi
	xorl	%ebp, %ebp
	jmp	LBB186_5
	.p2align	4
LBB186_7:                               #   in Loop: Header=BB186_5 Depth=2
	incl	%ebp
	movzwl	%bp, %eax
	cmpl	%eax, %esi
	jbe	LBB186_8
LBB186_5:                               # %.preheader
                                        #   Parent Loop BB186_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsbl	140(%esp,%ebp), %ebx
	pushl	%ebx
	leal	4(%esp), %eax
	pushl	%eax
	calll	_strchr
	addl	$8, %esp
	testl	%eax, %eax
	jne	LBB186_7
# %bb.6:                                #   in Loop: Header=BB186_5 Depth=2
	movzwl	%di, %eax
	incl	%edi
	movb	%bl, 12(%esp,%eax)
                                        # kill: def $di killed $di killed $edi def $edi
	jmp	LBB186_7
	.p2align	4
LBB186_8:                               #   in Loop: Header=BB186_2 Depth=1
	movzwl	%di, %eax
	leal	140(%esp), %ebp
	leal	12(%esp), %edi
	jmp	LBB186_9
	.p2align	4
LBB186_3:                               #   in Loop: Header=BB186_2 Depth=1
	xorl	%eax, %eax
LBB186_9:                               #   in Loop: Header=BB186_2 Depth=1
	movb	$0, 12(%esp,%eax)
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	cmpl	$3, %eax
	jb	LBB186_13
# %bb.10:                               #   in Loop: Header=BB186_2 Depth=1
	cmpb	$91, 12(%esp)
	jne	LBB186_15
# %bb.11:                               #   in Loop: Header=BB186_2 Depth=1
	cmpb	$93, 11(%esp,%eax)
	je	LBB186_12
LBB186_15:                              #   in Loop: Header=BB186_2 Depth=1
	pushl	4(%esp)                         # 4-byte Folded Reload
	leal	272(%esp), %eax
	pushl	%eax
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	jne	LBB186_13
# %bb.16:                               #   in Loop: Header=BB186_2 Depth=1
	pushl	416(%esp)
	pushl	%edi
	calll	_strstr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB186_13
# %bb.17:                               #   in Loop: Header=BB186_2 Depth=1
	movl	%eax, %ebx
	pushl	416(%esp)
	calll	_strlen
	addl	$4, %esp
	cmpb	$61, (%ebx,%eax)
	jne	LBB186_13
# %bb.18:
	addl	%ebx, %eax
	incl	%eax
	pushl	%eax
	pushl	424(%esp)
	calll	_strcpy
	addl	$8, %esp
	xorl	%eax, %eax
	jmp	LBB186_19
LBB186_14:                              # %.loopexit
	movb	$-1, %al
LBB186_19:
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
	je	LBB187_3
# %bb.1:
	movl	144(%esp), %edx
	movl	%esp, %edi
	pushl	%edi
	pushl	152(%esp)
	calll	_LowlevelGetProfileString
	addl	$8, %esp
	testb	%al, %al
	jne	LBB187_3
# %bb.2:
	pushl	%edi
	calll	_atoi
	addl	$4, %esp
	movl	%eax, %esi
LBB187_3:
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
	je	LBB188_9
# %bb.1:                                # %.preheader.preheader
	movl	152(%esp), %ebx
	movl	%esp, %ebp
	xorl	%esi, %esi
	jmp	LBB188_3
	.p2align	4
LBB188_2:                               #   in Loop: Header=BB188_3 Depth=1
	pushl	%ebx
	pushl	%ebp
	calll	_strcmp
	addl	$8, %esp
	incl	%esi
	testl	%eax, %eax
	je	LBB188_10
LBB188_3:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%edi
	pushl	$128
	pushl	%ebp
	calll	_fgets
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB188_9
# %bb.4:                                #   in Loop: Header=BB188_3 Depth=1
	pushl	$59
	pushl	%ebp
	calll	_strchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB188_6
# %bb.5:                                #   in Loop: Header=BB188_3 Depth=1
	movb	$0, (%eax)
LBB188_6:                               #   in Loop: Header=BB188_3 Depth=1
	pushl	$10
	pushl	%ebp
	calll	_strchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB188_2
# %bb.7:                                #   in Loop: Header=BB188_3 Depth=1
	movb	$0, (%eax)
	jmp	LBB188_2
LBB188_9:
	xorl	%esi, %esi
LBB188_10:                              # %.loopexit
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
	je	LBB190_11
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
	jne	LBB190_3
# %bb.2:
	pushl	%edi
	calll	_atoi
	addl	$4, %esp
LBB190_3:
	movb	%al, _bBasePriority
	movl	%esi, %ecx
	movl	$L___const.IniFile_Load.cTabGlobal, %edx
	pushl	%edi
	pushl	$"??_C@_08KFNFNIOC@SCANRATE?$AA@"
	calll	_LowlevelGetProfileString
	addl	$8, %esp
	movl	%eax, %ecx
	movl	$1000, %eax                     # imm = 0x3E8
	testb	%cl, %cl
	jne	LBB190_5
# %bb.4:
	pushl	%edi
	calll	_atoi
	addl	$4, %esp
LBB190_5:
	movl	%eax, _dwScanFreq
	movl	%esi, %ecx
	movl	$L___const.IniFile_Load.cTabGlobal, %edx
	pushl	%edi
	pushl	$"??_C@_07FCKKGCNH@OVERRUN?$AA@"
	calll	_LowlevelGetProfileString
	addl	$8, %esp
	movl	%eax, %ecx
	xorl	%eax, %eax
	testb	%cl, %cl
	jne	LBB190_7
# %bb.6:
	pushl	%edi
	calll	_atoi
	addl	$4, %esp
LBB190_7:
	movl	%eax, _dwOverRunCnt
	movl	%esi, %ecx
	movl	$L___const.IniFile_Load.cTabGlobal, %edx
	pushl	%edi
	pushl	$"??_C@_07BIBLEOKI@NOPRINT?$AA@"
	calll	_LowlevelGetProfileString
	addl	$8, %esp
	testb	%al, %al
	jne	LBB190_10
# %bb.8:
	pushl	%edi
	calll	_atoi
	addl	$4, %esp
	testl	%eax, %eax
	je	LBB190_10
# %bb.9:
	movb	$0, _bPrintMode
LBB190_10:
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
LBB190_11:
	xorl	%eax, %eax
	addl	$128, %esp
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_VAR;
	.scl	2;
	.type	32;
	.endef
	.globl	_VAR                            # -- Begin function VAR
	.p2align	4
_VAR:                                   # @VAR
# %bb.0:
	pushl	%ebx
	pushl	%esi
	movzbl	_Instruction_UFB, %ebx
	pushl	12(%esp)
	calll	_Scope_variable
	addl	$4, %esp
	cmpb	$1, %bl
	je	LBB191_2
# %bb.1:
	pushl	$0
	pushl	%eax
	movl	%eax, %esi
	calll	_Rtedge_TagCreateByInstruction
	addl	$8, %esp
	pushl	$35
	pushl	%esi
	calll	_strrchr
	addl	$8, %esp
	incl	%eax
	pushl	%eax
	pushl	$_scope
	calll	_Userfunction_AddArgument
	addl	$8, %esp
LBB191_2:
	xorl	%eax, %eax
	popl	%esi
	popl	%ebx
	retl
                                        # -- End function
	.def	_FU;
	.scl	2;
	.type	32;
	.endef
	.globl	_FU                             # -- Begin function FU
	.p2align	4
_FU:                                    # @FU
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	pushl	%esi
	calll	_Scope_variable
	addl	$4, %esp
	pushl	$0
	pushl	%eax
	calll	_Rtedge_TagCreateByInstruction
	addl	$8, %esp
	pushl	$0
	pushl	%esi
	calll	_Rtedge_TagCreateByInstruction
	addl	$8, %esp
	pushl	$_scope
	calll	_Userfunction_Add
	addl	$4, %esp
	movb	$1, _Instruction_UF
	movb	$0, _Instruction_UFB
	xorl	%eax, %eax
	popl	%esi
	retl
                                        # -- End function
	.def	_FB;
	.scl	2;
	.type	32;
	.endef
	.globl	_FB                             # -- Begin function FB
	.p2align	4
_FB:                                    # @FB
# %bb.0:
	pushl	4(%esp)
	calll	_Scope_variable
	addl	$4, %esp
	pushl	$_scope
	calll	_UserFB_Add
	addl	$4, %esp
	movb	$0, _Instruction_UF
	movb	$1, _Instruction_UFB
	xorl	%eax, %eax
	retl
                                        # -- End function
	.def	_LABEL;
	.scl	2;
	.type	32;
	.endef
	.globl	_LABEL                          # -- Begin function LABEL
	.p2align	4
_LABEL:                                 # @LABEL
# %bb.0:
	movl	4(%esp), %eax
	retl
                                        # -- End function
	.def	_NOP;
	.scl	2;
	.type	32;
	.endef
	.globl	_NOP                            # -- Begin function NOP
	.p2align	4
_NOP:                                   # @NOP
# %bb.0:
	movl	4(%esp), %eax
	retl
                                        # -- End function
	.def	_LD;
	.scl	2;
	.type	32;
	.endef
	.globl	_LD                             # -- Begin function LD
	.p2align	4
_LD:                                    # @LD
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	24(%esp), %edi
	movl	20(%esp), %esi
	movzwl	4(%edi), %eax
	cmpl	$32769, %eax                    # imm = 0x8001
	jne	LBB196_2
# %bb.1:
	movl	(%edi), %eax
	movl	(%eax), %edi
	movzwl	4(%edi), %eax
LBB196_2:
	movw	%ax, 4(%esi)
	pushl	%edi
	calll	_Type_GetSize
	addl	$4, %esp
	leal	-1(%eax), %ecx
	cmpl	$7, %ecx
	ja	LBB196_3
# %bb.7:
	jmpl	*LJTI196_0(,%ecx,4)
LBB196_8:
	movl	(%esi), %eax
	cmpb	$0, 12(%edi)
	je	LBB196_10
# %bb.9:
	movl	(%edi), %ecx
	movzbl	(%ecx), %ecx
	movzbl	13(%edi), %edx
	btl	%edx, %ecx
	setb	%cl
	movb	%cl, (%eax)
	cmpb	$0, 12(%edi)
	jne	LBB196_20
	jmp	LBB196_21
LBB196_3:
	cmpl	$83, %eax
	jne	LBB196_19
# %bb.4:
	movl	(%esi), %eax
	testl	%eax, %eax
	je	LBB196_19
# %bb.5:
	movl	(%edi), %ecx
	testl	%ecx, %ecx
	je	LBB196_19
# %bb.6:
	movl	79(%ecx), %edx
	movl	%edx, 79(%eax)
	movups	64(%ecx), %xmm0
	movups	%xmm0, 64(%eax)
	movups	48(%ecx), %xmm0
	movups	%xmm0, 48(%eax)
	movups	32(%ecx), %xmm0
	movups	%xmm0, 32(%eax)
	movups	(%ecx), %xmm0
	movups	16(%ecx), %xmm1
	movups	%xmm1, 16(%eax)
	movups	%xmm0, (%eax)
	cmpb	$0, 12(%edi)
	jne	LBB196_20
	jmp	LBB196_21
LBB196_14:
	movl	(%esi), %eax
	cmpb	$0, 12(%edi)
	movl	(%edi), %ecx
	movl	(%ecx), %ecx
	je	LBB196_16
# %bb.15:
	movzbl	13(%edi), %edx
	xorl	%ebx, %ebx
	btl	%edx, %ecx
	setb	%bl
	movl	%ebx, %ecx
LBB196_16:                              # %LD_dword.exit
	movl	%ecx, (%eax)
	cmpb	$0, 12(%edi)
	jne	LBB196_20
	jmp	LBB196_21
LBB196_17:
	movl	(%esi), %ebp
	movl	(%edi), %eax
	movl	(%eax), %ebx
	movl	4(%eax), %ecx
	.p2align	4
LBB196_18:                              # =>This Inner Loop Header: Depth=1
	movl	(%ebp), %eax
	movl	4(%ebp), %edx
	lock		cmpxchg8b	(%ebp)
	jne	LBB196_18
	jmp	LBB196_19
LBB196_11:
	movl	(%esi), %eax
	cmpb	$0, 12(%edi)
	movl	(%edi), %ecx
	movzwl	(%ecx), %ecx
	je	LBB196_13
# %bb.12:
	movzwl	%cx, %edx
	movzbl	13(%edi), %ebx
	xorl	%ecx, %ecx
	btl	%ebx, %edx
	setb	%cl
LBB196_13:                              # %LD_word.exit
	movw	%cx, (%eax)
LBB196_19:                              # %LD_qword.exit
	cmpb	$0, 12(%edi)
	je	LBB196_21
LBB196_20:
	movb	$1, 12(%esi)
	movzbl	13(%edi), %eax
	movb	%al, 13(%esi)
	movl	(%edi), %ecx
	movl	(%ecx), %ecx
	btl	%eax, %ecx
	setb	14(%esi)
	leal	14(%esi), %eax
	movw	$1536, 4(%esi)                  # imm = 0x600
	movl	%eax, (%esi)
LBB196_21:
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB196_10:
	movl	(%edi), %ecx
	movzbl	(%ecx), %ecx
	movl	%ecx, %edx
	andb	$1, %dl
	cmpw	$1536, 4(%edi)                  # imm = 0x600
	movzbl	%dl, %edx
	cmovnel	%ecx, %edx
	movb	%dl, (%eax)
	cmpb	$0, 12(%edi)
	jne	LBB196_20
	jmp	LBB196_21
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI196_0:
	.long	LBB196_8
	.long	LBB196_11
	.long	LBB196_19
	.long	LBB196_14
	.long	LBB196_19
	.long	LBB196_19
	.long	LBB196_19
	.long	LBB196_17
                                        # -- End function
	.def	_LDN;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_LDN                            # -- Begin function LDN
	.p2align	4
_LDN:                                   # @LDN
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	24(%esp), %edi
	movl	20(%esp), %esi
	movzwl	4(%edi), %eax
	movw	%ax, 4(%esi)
	pushl	%edi
	calll	_Type_GetSize
	addl	$4, %esp
	leal	-1(%eax), %ecx
	movl	%eax, %edx
	xorl	%ecx, %edx
	cmpl	%ecx, %edx
	jbe	LBB197_16
# %bb.1:
	rep		bsfl	%eax, %eax
	cmpl	$3, %eax
	ja	LBB197_16
# %bb.2:
	jmpl	*LJTI197_0(,%eax,4)
LBB197_3:
	movl	(%esi), %eax
	cmpb	$0, 12(%edi)
	je	LBB197_5
# %bb.4:
	movl	(%edi), %ecx
	movzbl	(%ecx), %edx
	movzbl	13(%edi), %ecx
	shrl	%cl, %edx
	notb	%dl
	andb	$1, %dl
	movb	%dl, (%eax)
	jmp	LBB197_16
LBB197_11:
	movl	(%esi), %eax
	cmpb	$0, 12(%edi)
	movl	(%edi), %ecx
	movl	(%ecx), %ecx
	je	LBB197_13
# %bb.12:
	movzbl	13(%edi), %edx
	xorl	%ebx, %ebx
	btl	%edx, %ecx
	setae	%bl
	movl	%ebx, (%eax)
	jmp	LBB197_16
LBB197_14:
	movl	(%esi), %ebp
	movl	(%edi), %eax
	movl	(%eax), %eax
	notl	%eax
	movl	(%eax), %ebx
	movl	4(%eax), %ecx
	.p2align	4
LBB197_15:                              # =>This Inner Loop Header: Depth=1
	movl	(%ebp), %eax
	movl	4(%ebp), %edx
	lock		cmpxchg8b	(%ebp)
	jne	LBB197_15
	jmp	LBB197_16
LBB197_8:
	movl	(%esi), %eax
	cmpb	$0, 12(%edi)
	movl	(%edi), %ecx
	movzwl	(%ecx), %ecx
	je	LBB197_10
# %bb.9:
	movzbl	13(%edi), %edx
	xorl	%ebx, %ebx
	btl	%edx, %ecx
	setae	%bl
	movw	%bx, (%eax)
	jmp	LBB197_16
LBB197_13:
	notl	%ecx
	movl	%ecx, (%eax)
	jmp	LBB197_16
LBB197_5:
	cmpw	$1536, 4(%edi)                  # imm = 0x600
	movl	(%edi), %ecx
	movzbl	(%ecx), %ecx
	notb	%cl
	jne	LBB197_7
# %bb.6:
	andb	$1, %cl
LBB197_7:
	movb	%cl, (%eax)
	jmp	LBB197_16
LBB197_10:
	notl	%ecx
	movw	%cx, (%eax)
LBB197_16:                              # %LDN_qword.exit
	cmpb	$0, 12(%edi)
	je	LBB197_18
# %bb.17:
	movb	$1, 12(%esi)
	movzbl	13(%edi), %ecx
	movb	%cl, 13(%esi)
	movl	(%edi), %eax
	movl	(%eax), %eax
	shrl	%cl, %eax
	notb	%al
	orb	$-2, %al
	leal	14(%esi), %ecx
	movb	%al, 14(%esi)
	movw	$1536, 4(%esi)                  # imm = 0x600
	movl	%ecx, (%esi)
LBB197_18:
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI197_0:
	.long	LBB197_3
	.long	LBB197_8
	.long	LBB197_11
	.long	LBB197_14
                                        # -- End function
	.def	_ST;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_ST                             # -- Begin function ST
	.p2align	4
_ST:                                    # @ST
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	20(%esp), %edi
	cmpw	$-32767, 4(%edi)                # imm = 0x8001
	jne	LBB198_2
# %bb.1:
	movl	(%edi), %eax
	movl	(%eax), %edi
LBB198_2:
	movl	16(%esp), %esi
	cmpb	$0, 12(%edi)
	je	LBB198_4
# %bb.3:
	movl	(%esi), %eax
	movzbl	(%eax), %eax
	andl	$1, %eax
	movzbl	13(%edi), %ecx
	movl	$-2, %edx
	roll	%cl, %edx
	movl	(%edi), %ecx
	andl	%edx, (%ecx)
	movzbl	13(%edi), %ecx
	shll	%cl, %eax
	movl	(%edi), %ecx
	orl	%eax, (%ecx)
LBB198_15:                              # %ST_qword.exit
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
LBB198_4:
	movzwl	4(%esi), %eax
	movw	%ax, 4(%edi)
	pushl	%esi
	calll	_Type_GetSize
	addl	$4, %esp
	leal	-1(%eax), %ecx
	cmpl	$7, %ecx
	ja	LBB198_5
# %bb.9:
	jmpl	*LJTI198_0(,%ecx,4)
LBB198_10:                              # %ST_byte.exit
	movl	(%esi), %eax
	movzbl	(%eax), %eax
	movl	(%edi), %ecx
	movb	%al, (%ecx)
	jmp	LBB198_15
LBB198_5:
	cmpl	$83, %eax
	jne	LBB198_15
# %bb.6:
	movl	(%esi), %eax
	testl	%eax, %eax
	je	LBB198_15
# %bb.7:
	movl	(%edi), %ecx
	testl	%ecx, %ecx
	je	LBB198_15
# %bb.8:
	movl	79(%eax), %edx
	movl	%edx, 79(%ecx)
	movups	64(%eax), %xmm0
	movups	%xmm0, 64(%ecx)
	movups	48(%eax), %xmm0
	movups	%xmm0, 48(%ecx)
	movups	32(%eax), %xmm0
	movups	%xmm0, 32(%ecx)
	movups	(%eax), %xmm0
	movups	16(%eax), %xmm1
	movups	%xmm1, 16(%ecx)
	movups	%xmm0, (%ecx)
	jmp	LBB198_15
LBB198_12:                              # %ST_dword.exit
	movl	(%esi), %eax
	movl	(%eax), %eax
	movl	(%edi), %ecx
	movl	%eax, (%ecx)
	jmp	LBB198_15
LBB198_13:
	movl	(%esi), %eax
	movl	(%edi), %edi
	movl	(%eax), %ebx
	movl	4(%eax), %ecx
	.p2align	4
LBB198_14:                              # =>This Inner Loop Header: Depth=1
	movl	(%edi), %eax
	movl	4(%edi), %edx
	lock		cmpxchg8b	(%edi)
	jne	LBB198_14
	jmp	LBB198_15
LBB198_11:                              # %ST_word.exit
	movl	(%esi), %eax
	movzwl	(%eax), %eax
	movl	(%edi), %ecx
	movw	%ax, (%ecx)
	jmp	LBB198_15
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI198_0:
	.long	LBB198_10
	.long	LBB198_11
	.long	LBB198_15
	.long	LBB198_12
	.long	LBB198_15
	.long	LBB198_15
	.long	LBB198_15
	.long	LBB198_13
                                        # -- End function
	.def	_STN;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_STN                            # -- Begin function STN
	.p2align	4
_STN:                                   # @STN
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	20(%esp), %edi
	cmpw	$-32767, 4(%edi)                # imm = 0x8001
	jne	LBB199_2
# %bb.1:
	movl	(%edi), %eax
	movl	(%eax), %edi
LBB199_2:
	movl	16(%esp), %esi
	cmpb	$0, 12(%edi)
	je	LBB199_4
# %bb.3:
	movl	(%esi), %eax
	movzbl	(%eax), %eax
	notl	%eax
	andl	$1, %eax
	movzbl	13(%edi), %ecx
	movl	$-2, %edx
	roll	%cl, %edx
	movl	(%edi), %ecx
	andl	%edx, (%ecx)
	movzbl	13(%edi), %ecx
	shll	%cl, %eax
	movl	(%edi), %ecx
	orl	%eax, (%ecx)
	jmp	LBB199_12
LBB199_4:
	movzwl	4(%esi), %eax
	movw	%ax, 4(%edi)
	pushl	%esi
	calll	_Type_GetSize
	addl	$4, %esp
	leal	-1(%eax), %ecx
	movl	%eax, %edx
	xorl	%ecx, %edx
	cmpl	%ecx, %edx
	jbe	LBB199_12
# %bb.5:
	rep		bsfl	%eax, %eax
	cmpl	$3, %eax
	ja	LBB199_12
# %bb.6:
	jmpl	*LJTI199_0(,%eax,4)
LBB199_7:                               # %STN_byte.exit
	movl	(%esi), %eax
	movzbl	(%eax), %eax
	notb	%al
	movl	(%edi), %ecx
	movb	%al, (%ecx)
	jmp	LBB199_12
LBB199_9:                               # %STN_dword.exit
	movl	(%esi), %eax
	movl	(%eax), %eax
	notl	%eax
	movl	(%edi), %ecx
	movl	%eax, (%ecx)
	jmp	LBB199_12
LBB199_10:
	movl	(%esi), %eax
	movl	(%eax), %ebx
	movl	4(%eax), %ecx
	notl	%ecx
	notl	%ebx
	movl	(%edi), %edi
	.p2align	4
LBB199_11:                              # =>This Inner Loop Header: Depth=1
	movl	(%edi), %eax
	movl	4(%edi), %edx
	lock		cmpxchg8b	(%edi)
	jne	LBB199_11
	jmp	LBB199_12
LBB199_8:                               # %STN_word.exit
	movl	(%esi), %eax
	movzwl	(%eax), %eax
	notl	%eax
	movl	(%edi), %ecx
	movw	%ax, (%ecx)
LBB199_12:                              # %STN_qword.exit
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI199_0:
	.long	LBB199_7
	.long	LBB199_8
	.long	LBB199_9
	.long	LBB199_10
                                        # -- End function
	.def	_S;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_S                              # -- Begin function S
	.p2align	4
_S:                                     # @S
# %bb.0:
	pushl	%esi
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpw	$-32767, 4(%edx)                # imm = 0x8001
	jne	LBB200_2
# %bb.1:
	movl	(%edx), %ecx
	movl	(%ecx), %edx
LBB200_2:
	movl	(%eax), %ecx
	testb	$1, (%ecx)
	je	LBB200_6
# %bb.3:
	cmpb	$0, 12(%edx)
	je	LBB200_5
# %bb.4:
	movzbl	13(%edx), %ecx
	movl	$1, %esi
	shll	%cl, %esi
	movl	(%edx), %ecx
	orl	%esi, (%ecx)
	popl	%esi
	retl
LBB200_5:
	movw	$1536, 4(%edx)                  # imm = 0x600
	movl	(%edx), %ecx
	movb	$1, (%ecx)
LBB200_6:
	popl	%esi
	retl
                                        # -- End function
	.def	_SN;
	.scl	2;
	.type	32;
	.endef
	.globl	_SN                             # -- Begin function SN
	.p2align	4
_SN:                                    # @SN
# %bb.0:
	pushl	%esi
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpw	$-32767, 4(%edx)                # imm = 0x8001
	jne	LBB201_2
# %bb.1:
	movl	(%edx), %ecx
	movl	(%ecx), %edx
LBB201_2:
	movl	(%eax), %ecx
	testb	$1, (%ecx)
	jne	LBB201_6
# %bb.3:
	cmpb	$0, 12(%edx)
	je	LBB201_5
# %bb.4:
	movzbl	13(%edx), %ecx
	movl	$1, %esi
	shll	%cl, %esi
	movl	(%edx), %ecx
	orl	%esi, (%ecx)
	popl	%esi
	retl
LBB201_5:
	movw	$1536, 4(%edx)                  # imm = 0x600
	movl	(%edx), %ecx
	movb	$1, (%ecx)
LBB201_6:
	popl	%esi
	retl
                                        # -- End function
	.def	_R;
	.scl	2;
	.type	32;
	.endef
	.globl	_R                              # -- Begin function R
	.p2align	4
_R:                                     # @R
# %bb.0:
	pushl	%esi
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpw	$-32767, 4(%edx)                # imm = 0x8001
	jne	LBB202_2
# %bb.1:
	movl	(%edx), %ecx
	movl	(%ecx), %edx
LBB202_2:
	movl	(%eax), %ecx
	testb	$1, (%ecx)
	je	LBB202_6
# %bb.3:
	cmpb	$0, 12(%edx)
	je	LBB202_5
# %bb.4:
	movzbl	13(%edx), %ecx
	movl	$-2, %esi
	roll	%cl, %esi
	movl	(%edx), %ecx
	andl	%esi, (%ecx)
	popl	%esi
	retl
LBB202_5:
	movw	$1536, 4(%edx)                  # imm = 0x600
	movl	(%edx), %ecx
	movb	$0, (%ecx)
LBB202_6:
	popl	%esi
	retl
                                        # -- End function
	.def	_RN;
	.scl	2;
	.type	32;
	.endef
	.globl	_RN                             # -- Begin function RN
	.p2align	4
_RN:                                    # @RN
# %bb.0:
	pushl	%esi
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpw	$-32767, 4(%edx)                # imm = 0x8001
	jne	LBB203_2
# %bb.1:
	movl	(%edx), %ecx
	movl	(%ecx), %edx
LBB203_2:
	movl	(%eax), %ecx
	testb	$1, (%ecx)
	jne	LBB203_6
# %bb.3:
	cmpb	$0, 12(%edx)
	je	LBB203_5
# %bb.4:
	movzbl	13(%edx), %ecx
	movl	$-2, %esi
	roll	%cl, %esi
	movl	(%edx), %ecx
	andl	%esi, (%ecx)
	popl	%esi
	retl
LBB203_5:
	movw	$1536, 4(%edx)                  # imm = 0x600
	movl	(%edx), %ecx
	movb	$0, (%ecx)
LBB203_6:
	popl	%esi
	retl
                                        # -- End function
	.def	_AND;
	.scl	2;
	.type	32;
	.endef
	.globl	_AND                            # -- Begin function AND
	.p2align	4
_AND:                                   # @AND
# %bb.0:
	movl	8(%esp), %ecx
	movl	4(%esp), %eax
	movl	(%eax), %edx
	movl	(%ecx), %ecx
	movzbl	(%ecx), %ecx
	andb	(%edx), %cl
	andb	$1, %cl
	movw	$1536, 4(%eax)                  # imm = 0x600
	movb	%cl, (%edx)
	retl
                                        # -- End function
	.def	_ANDN;
	.scl	2;
	.type	32;
	.endef
	.globl	_ANDN                           # -- Begin function ANDN
	.p2align	4
_ANDN:                                  # @ANDN
# %bb.0:
	movl	8(%esp), %ecx
	movl	4(%esp), %eax
	movl	(%ecx), %ecx
	testb	$1, (%ecx)
	movl	(%eax), %ecx
	sete	%dl
	andb	(%ecx), %dl
	movw	$1536, 4(%eax)                  # imm = 0x600
	movb	%dl, (%ecx)
	retl
                                        # -- End function
	.def	_OR;
	.scl	2;
	.type	32;
	.endef
	.globl	_OR                             # -- Begin function OR
	.p2align	4
_OR:                                    # @OR
# %bb.0:
	movl	8(%esp), %ecx
	movl	4(%esp), %eax
	movl	(%eax), %edx
	movl	(%ecx), %ecx
	movzbl	(%ecx), %ecx
	orb	(%edx), %cl
	andb	$1, %cl
	movw	$1536, 4(%eax)                  # imm = 0x600
	movb	%cl, (%edx)
	retl
                                        # -- End function
	.def	_ORN;
	.scl	2;
	.type	32;
	.endef
	.globl	_ORN                            # -- Begin function ORN
	.p2align	4
_ORN:                                   # @ORN
# %bb.0:
	movl	8(%esp), %ecx
	movl	4(%esp), %eax
	movl	(%ecx), %ecx
	testb	$1, (%ecx)
	movl	(%eax), %ecx
	sete	%dl
	orb	(%ecx), %dl
	andb	$1, %dl
	movw	$1536, 4(%eax)                  # imm = 0x600
	movb	%dl, (%ecx)
	retl
                                        # -- End function
	.def	_CAL;
	.scl	2;
	.type	32;
	.endef
	.globl	_CAL                            # -- Begin function CAL
	.p2align	4
_CAL:                                   # @CAL
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	movl	16(%esp), %eax
	movl	12(%esp), %ecx
	pushl	(%ecx)
	calll	*(%eax)
	addl	$4, %esp
	movl	%esi, %eax
	popl	%esi
	retl
                                        # -- End function
	.def	_CALC;
	.scl	2;
	.type	32;
	.endef
	.globl	_CALC                           # -- Begin function CALC
	.p2align	4
_CALC:                                  # @CALC
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	movl	(%esi), %eax
	testb	$1, (%eax)
	je	LBB209_2
# %bb.1:
	movl	16(%esp), %eax
	movl	12(%esp), %ecx
	pushl	(%ecx)
	calll	*(%eax)
	addl	$4, %esp
LBB209_2:
	movl	%esi, %eax
	popl	%esi
	retl
                                        # -- End function
	.def	_CALCN;
	.scl	2;
	.type	32;
	.endef
	.globl	_CALCN                          # -- Begin function CALCN
	.p2align	4
_CALCN:                                 # @CALCN
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	movl	(%esi), %eax
	testb	$1, (%eax)
	jne	LBB210_2
# %bb.1:
	movl	16(%esp), %eax
	movl	12(%esp), %ecx
	pushl	(%ecx)
	calll	*(%eax)
	addl	$4, %esp
LBB210_2:
	movl	%esi, %eax
	popl	%esi
	retl
                                        # -- End function
	.def	_RET;
	.scl	2;
	.type	32;
	.endef
	.globl	_RET                            # -- Begin function RET
	.p2align	4
_RET:                                   # @RET
# %bb.0:
	movl	4(%esp), %eax
	movb	$1, 11(%eax)
	retl
                                        # -- End function
	.def	_RETC;
	.scl	2;
	.type	32;
	.endef
	.globl	_RETC                           # -- Begin function RETC
	.p2align	4
_RETC:                                  # @RETC
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %ecx
	cmpb	$1, (%ecx)
	jne	LBB212_2
# %bb.1:
	movb	$1, 11(%eax)
LBB212_2:
	retl
                                        # -- End function
	.def	_RETCN;
	.scl	2;
	.type	32;
	.endef
	.globl	_RETCN                          # -- Begin function RETCN
	.p2align	4
_RETCN:                                 # @RETCN
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB213_1
# %bb.2:
	retl
LBB213_1:
	movb	$1, 11(%eax)
	retl
                                        # -- End function
	.def	_NOT;
	.scl	2;
	.type	32;
	.endef
	.globl	_NOT                            # -- Begin function NOT
	.p2align	4
_NOT:                                   # @NOT
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %ecx
	movzbl	(%ecx), %edx
	notb	%dl
	andb	$1, %dl
	movw	$1536, 4(%eax)                  # imm = 0x600
	movb	%dl, (%ecx)
	retl
                                        # -- End function
	.def	_EQ;
	.scl	2;
	.type	32;
	.endef
	.globl	_EQ                             # -- Begin function EQ
	.p2align	4
_EQ:                                    # @EQ
# %bb.0:
	pushl	%ebx
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	cmpw	$1536, 4(%eax)                  # imm = 0x600
	jne	LBB215_3
# %bb.1:
	cmpw	$1536, 4(%edx)                  # imm = 0x600
	jne	LBB215_3
# %bb.2:
	movl	(%eax), %ecx
	movzbl	(%ecx), %ebx
	movl	(%edx), %edx
	cmpb	(%edx), %bl
	sete	%dl
	jmp	LBB215_4
LBB215_3:
	movl	(%eax), %ecx
	movl	(%edx), %edx
	movsd	(%edx), %xmm0                   # xmm0 = mem[0],zero
	cmpeqsd	(%ecx), %xmm0
	movd	%xmm0, %edx
	andl	$1, %edx
LBB215_4:
	movw	$1536, 4(%eax)                  # imm = 0x600
	movb	%dl, (%ecx)
	popl	%ebx
	retl
                                        # -- End function
	.def	_END;
	.scl	2;
	.type	32;
	.endef
	.globl	_END                            # -- Begin function END
	.p2align	4
_END:                                   # @END
# %bb.0:
	movl	4(%esp), %eax
	movb	$1, 11(%eax)
	retl
                                        # -- End function
	.def	_push;
	.scl	2;
	.type	32;
	.endef
	.globl	_push                           # -- Begin function push
	.p2align	4
_push:                                  # @push
# %bb.0:
	pushl	%ebx
	movzbl	8(%esp), %ebx
	movl	_stackptr, %eax
	movb	%bl, _stack(%eax)
	leal	1(%eax), %ecx
	movl	%ecx, _stackptr
	cmpl	$256, %eax                      # imm = 0x100
	jl	LBB217_2
# %bb.1:
	pushl	$"??_C@_00CNPNBAHC@?$AA@"
	pushl	$288                            # imm = 0x120
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	pushl	$0
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movzwl	%ax, %eax
	pushl	$"??_C@_09FOLKACJL@STACKOVER?$AA@"
	pushl	%eax
	pushl	$0
	calll	_CatalogRtHandle
	addl	$12, %esp
	pushl	$0
	calll	_SuspendRtThread
	addl	$4, %esp
LBB217_2:
	movl	%ebx, %eax
	popl	%ebx
	retl
                                        # -- End function
	.def	_pop;
	.scl	2;
	.type	32;
	.endef
	.globl	_pop                            # -- Begin function pop
	.p2align	4
_pop:                                   # @pop
# %bb.0:
	movl	_stackptr, %eax
	testl	%eax, %eax
	jg	LBB218_2
# %bb.1:
	pushl	$"??_C@_00CNPNBAHC@?$AA@"
	pushl	$289                            # imm = 0x121
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	pushl	$0
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movzwl	%ax, %eax
	pushl	$"??_C@_0L@LMAGOADG@STACKUNDER?$AA@"
	pushl	%eax
	pushl	$0
	calll	_CatalogRtHandle
	addl	$12, %esp
	pushl	$0
	calll	_SuspendRtThread
	addl	$4, %esp
	movl	_stackptr, %eax
LBB218_2:
	leal	-1(%eax), %ecx
	movl	%ecx, _stackptr
	movzbl	_stack-1(%eax), %eax
	retl
                                        # -- End function
	.def	_JMP;
	.scl	2;
	.type	32;
	.endef
	.globl	_JMP                            # -- Begin function JMP
	.p2align	4
_JMP:                                   # @JMP
# %bb.0:
	movl	4(%esp), %eax
	retl
                                        # -- End function
	.def	_JMPC;
	.scl	2;
	.type	32;
	.endef
	.globl	_JMPC                           # -- Begin function JMPC
	.p2align	4
_JMPC:                                  # @JMPC
# %bb.0:
	movl	4(%esp), %eax
	retl
                                        # -- End function
	.def	_JMPCN;
	.scl	2;
	.type	32;
	.endef
	.globl	_JMPCN                          # -- Begin function JMPCN
	.p2align	4
_JMPCN:                                 # @JMPCN
# %bb.0:
	movl	4(%esp), %eax
	retl
                                        # -- End function
	.def	_CLR;
	.scl	2;
	.type	32;
	.endef
	.globl	_CLR                            # -- Begin function CLR
	.p2align	4
_CLR:                                   # @CLR
# %bb.0:
	movl	4(%esp), %eax
	retl
                                        # -- End function
	.def	_Instruction_IsUFB;
	.scl	2;
	.type	32;
	.endef
	.globl	_Instruction_IsUFB              # -- Begin function Instruction_IsUFB
	.p2align	4
_Instruction_IsUFB:                     # @Instruction_IsUFB
# %bb.0:
	cmpb	$1, _Instruction_UFB
	sete	%al
	retl
                                        # -- End function
	.def	_Instruction_CalcHash;
	.scl	2;
	.type	32;
	.endef
	.globl	_Instruction_CalcHash           # -- Begin function Instruction_CalcHash
	.p2align	4
_Instruction_CalcHash:                  # @Instruction_CalcHash
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$104, %esp
	movl	124(%esp), %ebx
	movaps	__xmm@1032547698badcfeefcdab8967452301, %xmm0 # xmm0 = [1732584193,4023233417,2562383102,271733878]
	movups	%xmm0, (%esp)
	pushl	%ebx
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %esi
	leal	(,%eax,8), %eax
	movl	%eax, 16(%esp)
	movl	%esi, %eax
	shrl	$29, %eax
	movl	%eax, 20(%esp)
	xorl	%eax, %eax
	cmpl	$64, %esi
	jb	LBB224_4
# %bb.1:
	leal	24(%esp), %edx
	movups	48(%ebx), %xmm0
	movups	%xmm0, 72(%esp)
	movups	32(%ebx), %xmm0
	movups	%xmm0, 56(%esp)
	movups	(%ebx), %xmm0
	movups	16(%ebx), %xmm1
	movups	%xmm1, 40(%esp)
	movups	%xmm0, 24(%esp)
	movl	%esp, %ecx
	calll	_MD5Transform
	movl	$64, %eax
	cmpl	$128, %esi
	jb	LBB224_4
# %bb.2:                                # %.preheader.i.i.preheader
	movl	$64, %ebp
	movl	%esp, %edi
	.p2align	4
LBB224_3:                               # %.preheader.i.i
                                        # =>This Inner Loop Header: Depth=1
	leal	(%ebx,%ebp), %edx
	movl	%edi, %ecx
	calll	_MD5Transform
	leal	64(%ebp), %eax
	addl	$127, %ebp
	cmpl	%esi, %ebp
	movl	%eax, %ebp
	jb	LBB224_3
LBB224_4:                               # %_Hash.exit
	subl	%eax, %esi
	addl	%eax, %ebx
	leal	24(%esp), %eax
	pushl	%esi
	pushl	%ebx
	pushl	%eax
	calll	_memcpy
	addl	$12, %esp
	movl	%esp, %eax
	leal	88(%esp), %ecx
	pushl	%eax
	pushl	%ecx
	calll	_MD5Final
	addl	$8, %esp
	movzwl	92(%esp), %eax
	addl	$104, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Instruction_CreateCatalog;
	.scl	2;
	.type	32;
	.endef
	.globl	_Instruction_CreateCatalog      # -- Begin function Instruction_CreateCatalog
	.p2align	4
_Instruction_CreateCatalog:             # @Instruction_CreateCatalog
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$112, %esp
	pushl	$262140                         # imm = 0x3FFFC
	pushl	$0
	pushl	$_InstructionCatalog
	calll	_memset
	addl	$12, %esp
	xorl	%eax, %eax
	leal	24(%esp), %ebp
	jmp	LBB225_1
	.p2align	4
LBB225_7:                               #   in Loop: Header=BB225_1 Depth=1
	movl	%edi, _InstructionCatalog(,%eax,4)
LBB225_8:                               #   in Loop: Header=BB225_1 Depth=1
	movl	(%esp), %eax                    # 4-byte Reload
	incl	%eax
	cmpl	$27, %eax
	je	LBB225_9
LBB225_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB225_4 Depth 2
	leal	(%eax,%eax,8), %ecx
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	%ecx, 4(%esp)                   # 4-byte Spill
	movl	_InstructionTemplate(%eax,%ecx,2), %esi
	movaps	__xmm@1032547698badcfeefcdab8967452301, %xmm0 # xmm0 = [1732584193,4023233417,2562383102,271733878]
	movups	%xmm0, 24(%esp)
	pushl	%esi
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %ebx
	leal	(,%eax,8), %eax
	movl	%eax, 40(%esp)
	movl	%ebx, %eax
	shrl	$29, %eax
	movl	%eax, 44(%esp)
	movl	$0, %eax
	cmpl	$64, %ebx
	jb	LBB225_5
# %bb.2:                                #   in Loop: Header=BB225_1 Depth=1
	movups	48(%esi), %xmm0
	leal	48(%esp), %edx
	movups	%xmm0, 48(%edx)
	movups	32(%esi), %xmm0
	movups	%xmm0, 32(%edx)
	movups	(%esi), %xmm0
	movups	16(%esi), %xmm1
	movups	%xmm1, 16(%edx)
	movups	%xmm0, (%edx)
	movl	%ebp, %ecx
	calll	_MD5Transform
	movl	$64, %eax
	cmpl	$128, %ebx
	jb	LBB225_5
# %bb.3:                                # %.preheader.i.i.preheader
                                        #   in Loop: Header=BB225_1 Depth=1
	movl	$64, %edi
	.p2align	4
LBB225_4:                               # %.preheader.i.i
                                        #   Parent Loop BB225_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	(%esi,%edi), %edx
	movl	%ebp, %ecx
	calll	_MD5Transform
	leal	64(%edi), %eax
	addl	$127, %edi
	cmpl	%ebx, %edi
	movl	%eax, %edi
	jb	LBB225_4
LBB225_5:                               # %_Hash.exit
                                        #   in Loop: Header=BB225_1 Depth=1
	movl	(%esp), %ecx                    # 4-byte Reload
	movl	4(%esp), %edx                   # 4-byte Reload
	leal	(%ecx,%edx,2), %edi
	addl	$_InstructionTemplate, %edi
	subl	%eax, %ebx
	addl	%eax, %esi
	pushl	%ebx
	pushl	%esi
	leal	56(%esp), %eax
	pushl	%eax
	calll	_memcpy
	addl	$12, %esp
	pushl	%ebp
	leal	12(%esp), %eax
	pushl	%eax
	calll	_MD5Final
	addl	$8, %esp
	movzwl	12(%esp), %eax
	cmpl	$0, _InstructionCatalog(,%eax,4)
	je	LBB225_7
# %bb.6:                                #   in Loop: Header=BB225_1 Depth=1
	pushl	(%edi)
	pushl	$"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@"
	calll	_printf
	addl	$8, %esp
	jmp	LBB225_8
LBB225_9:
	movl	$2, _status_instruction
	xorl	%eax, %eax
	addl	$112, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Instruction_CreateUserfunctionCatalog;
	.scl	2;
	.type	32;
	.endef
	.globl	_Instruction_CreateUserfunctionCatalog # -- Begin function Instruction_CreateUserfunctionCatalog
	.p2align	4
_Instruction_CreateUserfunctionCatalog: # @Instruction_CreateUserfunctionCatalog
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$104, %esp
	movl	124(%esp), %ebx
	movaps	__xmm@1032547698badcfeefcdab8967452301, %xmm0 # xmm0 = [1732584193,4023233417,2562383102,271733878]
	movups	%xmm0, (%esp)
	pushl	%ebx
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %esi
	leal	(,%eax,8), %eax
	movl	%eax, 16(%esp)
	movl	%esi, %eax
	shrl	$29, %eax
	movl	%eax, 20(%esp)
	xorl	%eax, %eax
	cmpl	$64, %esi
	jb	LBB226_4
# %bb.1:
	leal	24(%esp), %edx
	movups	48(%ebx), %xmm0
	movups	%xmm0, 72(%esp)
	movups	32(%ebx), %xmm0
	movups	%xmm0, 56(%esp)
	movups	(%ebx), %xmm0
	movups	16(%ebx), %xmm1
	movups	%xmm1, 40(%esp)
	movups	%xmm0, 24(%esp)
	movl	%esp, %ecx
	calll	_MD5Transform
	movl	$64, %eax
	cmpl	$128, %esi
	jb	LBB226_4
# %bb.2:                                # %.preheader.i.i.preheader
	movl	$64, %ebp
	movl	%esp, %edi
	.p2align	4
LBB226_3:                               # %.preheader.i.i
                                        # =>This Inner Loop Header: Depth=1
	leal	(%ebx,%ebp), %edx
	movl	%edi, %ecx
	calll	_MD5Transform
	leal	64(%ebp), %eax
	addl	$127, %ebp
	cmpl	%esi, %ebp
	movl	%eax, %ebp
	jb	LBB226_3
LBB226_4:                               # %_Hash.exit
	movl	128(%esp), %edi
	subl	%eax, %esi
	addl	%ebx, %eax
	leal	24(%esp), %ecx
	pushl	%esi
	pushl	%eax
	pushl	%ecx
	calll	_memcpy
	addl	$12, %esp
	movl	%esp, %eax
	leal	88(%esp), %ecx
	pushl	%eax
	pushl	%ecx
	calll	_MD5Final
	addl	$8, %esp
	movzwl	92(%esp), %esi
	cmpl	$0, _InstructionCatalog(,%esi,4)
	je	LBB226_6
# %bb.5:
	pushl	%ebx
	pushl	$"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@"
	calll	_printf
	addl	$8, %esp
LBB226_6:
	movl	%edi, _InstructionCatalog(,%esi,4)
	movl	$2, _status_instruction
	xorl	%eax, %eax
	addl	$104, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Instruction_GetTemplate;
	.scl	2;
	.type	32;
	.endef
	.globl	_Instruction_GetTemplate        # -- Begin function Instruction_GetTemplate
	.p2align	4
_Instruction_GetTemplate:               # @Instruction_GetTemplate
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$104, %esp
	movl	124(%esp), %ebp
	movaps	__xmm@1032547698badcfeefcdab8967452301, %xmm0 # xmm0 = [1732584193,4023233417,2562383102,271733878]
	movups	%xmm0, (%esp)
	pushl	%ebp
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %edi
	leal	(,%eax,8), %eax
	movl	%eax, 16(%esp)
	movl	%edi, %eax
	shrl	$29, %eax
	movl	%eax, 20(%esp)
	movl	$0, %eax
	cmpl	$64, %edi
	jb	LBB227_4
# %bb.1:
	leal	24(%esp), %edx
	movups	48(%ebp), %xmm0
	movups	%xmm0, 72(%esp)
	movups	32(%ebp), %xmm0
	movups	%xmm0, 56(%esp)
	movups	(%ebp), %xmm0
	movups	16(%ebp), %xmm1
	movups	%xmm1, 40(%esp)
	movups	%xmm0, 24(%esp)
	movl	%esp, %ecx
	calll	_MD5Transform
	movl	$64, %eax
	cmpl	$128, %edi
	jb	LBB227_4
# %bb.2:                                # %.preheader.i.i.preheader
	movl	$64, %esi
	movl	%esp, %ebx
	.p2align	4
LBB227_3:                               # %.preheader.i.i
                                        # =>This Inner Loop Header: Depth=1
	leal	(%esi,%ebp), %edx
	movl	%ebx, %ecx
	calll	_MD5Transform
	leal	64(%esi), %eax
	addl	$127, %esi
	cmpl	%edi, %esi
	movl	%eax, %esi
	jb	LBB227_3
LBB227_4:                               # %_Hash.exit
	subl	%eax, %edi
	addl	%ebp, %eax
	leal	24(%esp), %ecx
	pushl	%edi
	pushl	%eax
	pushl	%ecx
	calll	_memcpy
	addl	$12, %esp
	movl	%esp, %eax
	leal	88(%esp), %ecx
	pushl	%eax
	pushl	%ecx
	calll	_MD5Final
	addl	$8, %esp
	movzwl	92(%esp), %eax
	movl	_InstructionCatalog(,%eax,4), %edi
	testl	%edi, %edi
	je	LBB227_5
# %bb.6:
	movl	(%edi), %eax
	testl	%eax, %eax
	movl	$0, %ecx
	je	LBB227_8
# %bb.7:
	pushl	%ebp
	pushl	%eax
	calll	_strcmp
	addl	$8, %esp
	xorl	%ecx, %ecx
	testl	%eax, %eax
	cmovel	%edi, %ecx
	jmp	LBB227_8
LBB227_5:
	xorl	%ecx, %ecx
LBB227_8:
	movl	%ecx, %eax
	addl	$104, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Instruction_IsUF;
	.scl	2;
	.type	32;
	.endef
	.globl	_Instruction_IsUF               # -- Begin function Instruction_IsUF
	.p2align	4
_Instruction_IsUF:                      # @Instruction_IsUF
# %bb.0:
	cmpb	$1, _Instruction_UF
	sete	%al
	retl
                                        # -- End function
	.def	_Instruction_FUFBReset;
	.scl	2;
	.type	32;
	.endef
	.globl	_Instruction_FUFBReset          # -- Begin function Instruction_FUFBReset
	.p2align	4
_Instruction_FUFBReset:                 # @Instruction_FUFBReset
# %bb.0:
	movb	$0, _Instruction_UF
	movb	$0, _Instruction_UFB
	retl
                                        # -- End function
	.def	_InternalClock_GetUsecs;
	.scl	2;
	.type	32;
	.endef
	.globl	_InternalClock_GetUsecs         # -- Begin function InternalClock_GetUsecs
	.p2align	4
_InternalClock_GetUsecs:                # @InternalClock_GetUsecs
# %bb.0:
	movl	_dwKtickInUsecs, %eax
	retl
                                        # -- End function
	.def	_InternalClock_Wait;
	.scl	2;
	.type	32;
	.endef
	.globl	_InternalClock_Wait             # -- Begin function InternalClock_Wait
	.p2align	4
_InternalClock_Wait:                    # @InternalClock_Wait
# %bb.0:
	pushl	$1
	calll	_knRtSleep
	addl	$4, %esp
	retl
                                        # -- End function
	.def	_InternalClock_IsPlcFireTiming;
	.scl	2;
	.type	32;
	.endef
	.globl	_InternalClock_IsPlcFireTiming  # -- Begin function InternalClock_IsPlcFireTiming
	.p2align	4
_InternalClock_IsPlcFireTiming:         # @InternalClock_IsPlcFireTiming
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	movl	_dwScanFreq, %eax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	divl	_dwKtickInUsecs
	cmpl	%eax, %esi
	cmovbl	%esi, %ecx
	movl	%ecx, %eax
	popl	%esi
	retl
                                        # -- End function
	.def	_Label_CalcHash;
	.scl	2;
	.type	32;
	.endef
	.globl	_Label_CalcHash                 # -- Begin function Label_CalcHash
	.p2align	4
_Label_CalcHash:                        # @Label_CalcHash
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$104, %esp
	movl	124(%esp), %ebx
	movaps	__xmm@1032547698badcfeefcdab8967452301, %xmm0 # xmm0 = [1732584193,4023233417,2562383102,271733878]
	movups	%xmm0, (%esp)
	pushl	%ebx
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %esi
	leal	(,%eax,8), %eax
	movl	%eax, 16(%esp)
	movl	%esi, %eax
	shrl	$29, %eax
	movl	%eax, 20(%esp)
	xorl	%eax, %eax
	cmpl	$64, %esi
	jb	LBB233_4
# %bb.1:
	leal	24(%esp), %edx
	movups	48(%ebx), %xmm0
	movups	%xmm0, 72(%esp)
	movups	32(%ebx), %xmm0
	movups	%xmm0, 56(%esp)
	movups	(%ebx), %xmm0
	movups	16(%ebx), %xmm1
	movups	%xmm1, 40(%esp)
	movups	%xmm0, 24(%esp)
	movl	%esp, %ecx
	calll	_MD5Transform
	movl	$64, %eax
	cmpl	$128, %esi
	jb	LBB233_4
# %bb.2:                                # %.preheader.i.i.preheader
	movl	$64, %ebp
	movl	%esp, %edi
	.p2align	4
LBB233_3:                               # %.preheader.i.i
                                        # =>This Inner Loop Header: Depth=1
	leal	(%ebx,%ebp), %edx
	movl	%edi, %ecx
	calll	_MD5Transform
	leal	64(%ebp), %eax
	addl	$127, %ebp
	cmpl	%esi, %ebp
	movl	%eax, %ebp
	jb	LBB233_3
LBB233_4:                               # %_Hash.exit
	subl	%eax, %esi
	addl	%eax, %ebx
	leal	24(%esp), %eax
	pushl	%esi
	pushl	%ebx
	pushl	%eax
	calll	_memcpy
	addl	$12, %esp
	movl	%esp, %eax
	leal	88(%esp), %ecx
	pushl	%eax
	pushl	%ecx
	calll	_MD5Final
	addl	$8, %esp
	movzwl	92(%esp), %eax
	andl	$4095, %eax                     # imm = 0xFFF
                                        # kill: def $ax killed $ax killed $eax
	addl	$104, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Label_Add;
	.scl	2;
	.type	32;
	.endef
	.globl	_Label_Add                      # -- Begin function Label_Add
	.p2align	4
_Label_Add:                             # @Label_Add
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$108, %esp
	movl	128(%esp), %ebp
	pushl	$16
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %esi
	testl	%eax, %eax
	je	LBB234_1
# %bb.2:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%esi, (%eax)
	movl	$16, 4(%eax)
	movl	$"??_C@_09DADJEEPI@Label_Add?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB234_3
# %bb.4:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB234_5
LBB234_1:
	pushl	$"??_C@_09DADJEEPI@Label_Add?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB234_6
LBB234_3:
	movl	%eax, _heaplist
LBB234_5:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB234_6:                               # %Heap_Alloc.exit
	pushl	%ebp
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %ebx
	incl	%ebx
	pushl	%ebx
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %edi
	testl	%eax, %eax
	je	LBB234_7
# %bb.8:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%edi, (%eax)
	movl	%ebx, 4(%eax)
	movl	$"??_C@_0BE@DBGJIEJN@Label_Add?3labelname?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB234_9
# %bb.10:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB234_11
LBB234_7:
	pushl	$"??_C@_0BE@DBGJIEJN@Label_Add?3labelname?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB234_12
LBB234_9:
	movl	%eax, _heaplist
LBB234_11:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB234_12:                              # %Heap_Alloc.exit1
	movl	%edi, (%esi)
	pushl	%ebp
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
	movl	132(%esp), %eax
	movl	%eax, 4(%esi)
	movl	136(%esp), %eax
	movl	%eax, 8(%esi)
	movl	$0, 12(%esi)
	cmpl	$0, _plcLabel
	je	LBB234_13
# %bb.14:
	movl	_plcLabelBottom, %eax
	movl	%esi, 12(%eax)
	jmp	LBB234_15
LBB234_13:
	movl	%esi, _plcLabel
LBB234_15:
	movl	%esi, (%esp)                    # 4-byte Spill
	movl	%esi, _plcLabelBottom
	movaps	__xmm@1032547698badcfeefcdab8967452301, %xmm0 # xmm0 = [1732584193,4023233417,2562383102,271733878]
	movups	%xmm0, 4(%esp)
	pushl	%ebp
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %edi
	leal	(,%eax,8), %eax
	movl	%eax, 20(%esp)
	movl	%edi, %eax
	shrl	$29, %eax
	movl	%eax, 24(%esp)
	xorl	%eax, %eax
	cmpl	$64, %edi
	movl	%ebp, %esi
	jb	LBB234_19
# %bb.16:
	leal	28(%esp), %edx
	movups	48(%esi), %xmm0
	movups	%xmm0, 76(%esp)
	movups	32(%esi), %xmm0
	movups	%xmm0, 60(%esp)
	movups	(%esi), %xmm0
	movups	16(%esi), %xmm1
	movups	%xmm1, 44(%esp)
	movups	%xmm0, 28(%esp)
	leal	4(%esp), %ecx
	calll	_MD5Transform
	movl	$64, %eax
	cmpl	$128, %edi
	jb	LBB234_19
# %bb.17:                               # %.preheader.i.i.preheader
	movl	$64, %ebp
	leal	4(%esp), %ebx
	.p2align	4
LBB234_18:                              # %.preheader.i.i
                                        # =>This Inner Loop Header: Depth=1
	leal	(%esi,%ebp), %edx
	movl	%ebx, %ecx
	calll	_MD5Transform
	leal	64(%ebp), %eax
	addl	$127, %ebp
	cmpl	%edi, %ebp
	movl	%eax, %ebp
	jb	LBB234_18
LBB234_19:                              # %_Hash.exit
	subl	%eax, %edi
	addl	%esi, %eax
	leal	28(%esp), %ecx
	pushl	%edi
	pushl	%eax
	pushl	%ecx
	calll	_memcpy
	addl	$12, %esp
	leal	4(%esp), %eax
	leal	92(%esp), %ecx
	pushl	%eax
	pushl	%ecx
	calll	_MD5Final
	addl	$8, %esp
	movl	$4095, %eax                     # imm = 0xFFF
	andl	96(%esp), %eax
	cmpl	$0, _LabelCatalog(,%eax,4)
	je	LBB234_21
# %bb.20:
	pushl	%esi
	pushl	$"??_C@_0CD@PBMEOOHM@label?5hash?5conflict?$CB?5?$CFs?4?5skipped@"
	calll	_printf
	addl	$8, %esp
LBB234_21:
	movl	$2, _status_label
	movl	(%esp), %eax                    # 4-byte Reload
	addl	$108, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Label_Clear;
	.scl	2;
	.type	32;
	.endef
	.globl	_Label_Clear                    # -- Begin function Label_Clear
	.p2align	4
_Label_Clear:                           # @Label_Clear
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	_plcLabel, %esi
	jmp	LBB235_1
	.p2align	4
LBB235_6:                               # %.loopexit5.i
                                        #   in Loop: Header=BB235_1 Depth=1
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB235_7
# %bb.9:                                #   in Loop: Header=BB235_1 Depth=1
	movl	%edx, 16(%ecx)
LBB235_11:                              #   in Loop: Header=BB235_1 Depth=1
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB235_12:                              # %Heap_Free.exit
                                        #   in Loop: Header=BB235_1 Depth=1
	pushl	%edi
	calll	_free
	addl	$4, %esp
	movl	%esi, _plcLabel
LBB235_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB235_4 Depth 2
	testl	%esi, %esi
	je	LBB235_13
# %bb.2:                                # %.preheader
                                        #   in Loop: Header=BB235_1 Depth=1
	movl	%esi, %edi
	movl	12(%esi), %esi
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB235_12
# %bb.3:                                #   in Loop: Header=BB235_1 Depth=1
	movl	%ecx, %eax
	cmpl	%edi, (%ecx)
	je	LBB235_6
	.p2align	4
LBB235_4:                               # %.preheader.i
                                        #   Parent Loop BB235_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB235_12
# %bb.5:                                #   in Loop: Header=BB235_4 Depth=2
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%edi, (%edx)
	jne	LBB235_4
	jmp	LBB235_6
LBB235_7:                               #   in Loop: Header=BB235_1 Depth=1
	cmpl	%eax, %ecx
	je	LBB235_8
# %bb.10:                               #   in Loop: Header=BB235_1 Depth=1
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB235_11
LBB235_8:                               #   in Loop: Header=BB235_1 Depth=1
	movl	$0, _heaplist
	movl	$0, _heapbottom
	jmp	LBB235_11
LBB235_13:                              # %.loopexit
	movl	$0, _plcLabelBottom
	movl	$0, _plcLabel
	movl	$0, _status_label
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Label_Display;
	.scl	2;
	.type	32;
	.endef
	.globl	_Label_Display                  # -- Begin function Label_Display
	.p2align	4
_Label_Display:                         # @Label_Display
# %bb.0:
	pushl	%edi
	pushl	%esi
	pushl	$L_str.86
	calll	_puts
	addl	$4, %esp
	movl	_plcLabel, %esi
	testl	%esi, %esi
	je	LBB236_4
# %bb.1:                                # %.preheader.preheader
	movl	$1, %edi
	.p2align	4
LBB236_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	8(%esi)
	pushl	(%esi)
	pushl	%edi
	pushl	$"??_C@_0BI@HABOLDNE@?5?5label?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?6?$AA@"
	calll	_printf
	addl	$16, %esp
	movl	12(%esi), %esi
	incl	%edi
	testl	%esi, %esi
	jne	LBB236_2
	jmp	LBB236_3
LBB236_4:
	pushl	$L_str.1.254
	calll	_puts
	addl	$4, %esp
LBB236_3:                               # %.loopexit
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Label_Search;
	.scl	2;
	.type	32;
	.endef
	.globl	_Label_Search                   # -- Begin function Label_Search
	.p2align	4
_Label_Search:                          # @Label_Search
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	_plcLabel, %edi
	xorl	%esi, %esi
	testl	%edi, %edi
	je	LBB237_5
# %bb.1:                                # %.preheader.preheader
	movl	16(%esp), %ebx
	.p2align	4
LBB237_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	(%edi)
	pushl	%ebx
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB237_3
# %bb.4:                                #   in Loop: Header=BB237_2 Depth=1
	movl	12(%edi), %edi
	testl	%edi, %edi
	jne	LBB237_2
	jmp	LBB237_5
LBB237_3:
	movl	%edi, %esi
LBB237_5:                               # %.loopexit
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Label_SetAnchor;
	.scl	2;
	.type	32;
	.endef
	.globl	_Label_SetAnchor                # -- Begin function Label_SetAnchor
	.p2align	4
_Label_SetAnchor:                       # @Label_SetAnchor
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	_plcLabel, %esi
	testl	%esi, %esi
	je	LBB238_5
# %bb.1:                                # %.preheader.preheader
	movl	28(%esp), %edi
	movl	24(%esp), %ebx
	movl	20(%esp), %ebp
	.p2align	4
LBB238_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	(%esi)
	pushl	%ebp
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB238_4
# %bb.3:                                #   in Loop: Header=BB238_2 Depth=1
	movl	12(%esi), %esi
	testl	%esi, %esi
	jne	LBB238_2
	jmp	LBB238_5
LBB238_4:
	movl	%ebx, 4(%esi)
	movl	%edi, 8(%esi)
LBB238_5:                               # %.loopexit
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Literal_StrTime;
	.scl	2;
	.type	32;
	.endef
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
	je	LBB239_5
# %bb.1:
	pushl	$"??_C@_08CBABJGOP@dDhHmMsS?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	xorl	%ebp, %ebp
	testl	%eax, %eax
	je	LBB239_6
# %bb.2:
	movl	%eax, 16(%esp)                  # 4-byte Spill
	pushl	$"??_C@_08CBABJGOP@dDhHmMsS?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB239_7
# %bb.3:
	movl	%eax, 12(%esp)                  # 4-byte Spill
	pushl	$"??_C@_08CBABJGOP@dDhHmMsS?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB239_24
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
	jmp	LBB239_10
LBB239_5:
	movl	$0, 16(%esp)                    # 4-byte Folded Spill
	movl	$0, 12(%esp)                    # 4-byte Folded Spill
	xorl	%ebp, %ebp
	xorl	%esi, %esi
	xorl	%edi, %edi
	jmp	LBB239_10
LBB239_6:
	movl	$1, %edi
	movl	$0, 16(%esp)                    # 4-byte Folded Spill
	jmp	LBB239_8
LBB239_7:
	movl	$2, %edi
LBB239_8:
	movl	$0, 12(%esp)                    # 4-byte Folded Spill
LBB239_9:
	xorl	%esi, %esi
LBB239_10:
	pushl	$"??_C@_0L@FPFMPDDA@0123456789?$AA@"
	pushl	%ebx
	calll	_strtok
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB239_27
# %bb.11:
	movl	%eax, %ebx
	pushl	$"??_C@_0L@FPFMPDDA@0123456789?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	movl	$0, 28(%esp)                    # 4-byte Folded Spill
	movl	%eax, 32(%esp)                  # 4-byte Spill
	testl	%eax, %eax
	je	LBB239_15
# %bb.12:
	pushl	$"??_C@_0L@FPFMPDDA@0123456789?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	movl	%eax, 20(%esp)                  # 4-byte Spill
	testl	%eax, %eax
	je	LBB239_16
# %bb.13:
	movl	%ebp, 8(%esp)                   # 4-byte Spill
	movl	%esi, %ebp
	pushl	$"??_C@_0L@FPFMPDDA@0123456789?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB239_25
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
	jmp	LBB239_26
LBB239_15:
	movl	$1, %ecx
	jmp	LBB239_17
LBB239_16:
	movl	$2, %ecx
LBB239_17:
	movl	$0, 20(%esp)                    # 4-byte Folded Spill
	xorl	%eax, %eax
	cmpl	$0, 4(%esp)                     # 4-byte Folded Reload
	je	LBB239_27
LBB239_18:
	cmpl	%ecx, %edi
	jne	LBB239_23
# %bb.19:                               # %sub_0
	movzbl	(%ebx), %edx
	xorl	%edi, %edi
	leal	-68(%edx), %ecx
	cmpl	$47, %ecx
	ja	LBB239_51
# %bb.20:                               # %sub_0
	movl	%esi, 24(%esp)                  # 4-byte Spill
	xorl	%esi, %esi
	jmpl	*LJTI239_0(,%ecx,4)
LBB239_21:                              # %.tail13
	cmpb	$0, 1(%ebx)
	jne	LBB239_33
# %bb.22:
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$L___const.Literal_StrTime.keyword+8, %ebx
	jmp	LBB239_54
LBB239_23:
	pushl	$"??_C@_0BN@MHJGFLCK@time?5format?5unit?5pair?5error?4?$AA@"
	jmp	LBB239_28
LBB239_24:
	movl	$3, %edi
	jmp	LBB239_9
LBB239_25:
	movl	$3, %ecx
	xorl	%eax, %eax
LBB239_26:
	movl	%ebp, %esi
	movl	8(%esp), %ebp                   # 4-byte Reload
	cmpl	$0, 4(%esp)                     # 4-byte Folded Reload
	jne	LBB239_18
LBB239_27:
	pushl	$"??_C@_0CC@CIMFJLML@time?5format?5unit?5not?5found?5error@"
LBB239_28:
	pushl	$8193                           # imm = 0x2001
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	xorl	%eax, %eax
	xorl	%esi, %esi
LBB239_29:
	movl	%esi, %edx
	addl	$196, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB239_30:                              # %.tail
	cmpb	$0, 1(%ebx)
	jne	LBB239_33
# %bb.31:
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$L___const.Literal_StrTime.keyword, %ebx
	jmp	LBB239_54
LBB239_32:                              # %.tail17
	cmpb	$0, 1(%ebx)
	je	LBB239_52
LBB239_33:                              # %sub_030
	cmpl	$115, %edx
	je	LBB239_42
# %bb.34:                               # %sub_030
	cmpl	$83, %edx
	je	LBB239_40
# %bb.35:                               # %sub_030
	xorl	%edi, %edi
	movl	$0, %esi
	cmpl	$77, %edx
	jne	LBB239_74
LBB239_36:                              # %.tail29
	cmpb	$0, 1(%ebx)
	je	LBB239_50
# %bb.37:                               # %sub_147
	xorl	%edi, %edi
	cmpb	$83, 1(%ebx)
	movl	$0, %esi
	jne	LBB239_74
# %bb.38:                               # %.tail45
	xorl	%edi, %edi
	cmpb	$0, 2(%ebx)
	jne	LBB239_74
# %bb.39:
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$L___const.Literal_StrTime.keyword+72, %ebx
	jmp	LBB239_54
LBB239_40:                              # %.tail37
	xorl	%edi, %edi
	cmpb	$0, 1(%ebx)
	movl	$0, %esi
	jne	LBB239_74
# %bb.41:
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$L___const.Literal_StrTime.keyword+56, %ebx
	jmp	LBB239_54
LBB239_42:                              # %.tail33
	xorl	%edi, %edi
	cmpb	$0, 1(%ebx)
	movl	$0, %esi
	jne	LBB239_74
# %bb.43:
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$L___const.Literal_StrTime.keyword+48, %ebx
	jmp	LBB239_54
LBB239_44:                              # %.tail25
	cmpb	$0, 1(%ebx)
	je	LBB239_53
# %bb.45:                               # %sub_143
	xorl	%edi, %edi
	cmpb	$115, 1(%ebx)
	movl	$0, %esi
	jne	LBB239_74
# %bb.46:                               # %.tail41
	xorl	%edi, %edi
	cmpb	$0, 2(%ebx)
	jne	LBB239_74
# %bb.47:
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$L___const.Literal_StrTime.keyword+64, %ebx
	jmp	LBB239_54
LBB239_48:                              # %.tail21
	xorl	%edi, %edi
	cmpb	$0, 1(%ebx)
	movl	$0, %esi
	jne	LBB239_74
# %bb.49:
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$L___const.Literal_StrTime.keyword+24, %ebx
	jmp	LBB239_54
LBB239_50:
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$L___const.Literal_StrTime.keyword+40, %ebx
	jmp	LBB239_54
LBB239_51:
	xorl	%esi, %esi
	jmp	LBB239_74
LBB239_52:
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$L___const.Literal_StrTime.keyword+16, %ebx
	jmp	LBB239_54
LBB239_53:
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$L___const.Literal_StrTime.keyword+32, %ebx
LBB239_54:
	pushl	4(%esp)                         # 4-byte Folded Reload
	calll	_atoi
	addl	$4, %esp
	imull	4(%ebx), %eax
	cmpl	$0, 16(%esp)                    # 4-byte Folded Reload
	je	LBB239_59
# %bb.55:
	movl	%ebp, 8(%esp)                   # 4-byte Spill
	movl	%eax, %esi
	sarl	$31, %esi
	movl	(%ebx), %ebp
	movl	%eax, %edi
	testl	%ebp, %ebp
	je	LBB239_74
# %bb.56:                               # %.preheader54.preheader
	addl	$8, %ebx
	.p2align	4
LBB239_57:                              # %.preheader54
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebp
	pushl	36(%esp)                        # 4-byte Folded Reload
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB239_60
# %bb.58:                               #   in Loop: Header=BB239_57 Depth=1
	movl	(%ebx), %ebp
	addl	$8, %ebx
	testl	%ebp, %ebp
	jne	LBB239_57
	jmp	LBB239_74
LBB239_59:
	movl	%eax, %esi
	sarl	$31, %esi
	jmp	LBB239_29
LBB239_60:
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
	je	LBB239_29
# %bb.61:                               # %.preheader52.preheader
	movl	%eax, 4(%esp)                   # 4-byte Spill
LBB239_62:                              # %.preheader52
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebp
	pushl	24(%esp)                        # 4-byte Folded Reload
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB239_65
# %bb.63:                               #   in Loop: Header=BB239_62 Depth=1
	movl	(%ebx), %ebp
	addl	$8, %ebx
	testl	%ebp, %ebp
	jne	LBB239_62
	jmp	LBB239_64
LBB239_65:
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
	je	LBB239_70
# %bb.66:                               # %.preheader50.preheader
	movl	%edx, 4(%esp)                   # 4-byte Spill
	movl	28(%esp), %edi                  # 4-byte Reload
LBB239_67:                              # %.preheader50
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebp
	pushl	%edi
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB239_71
# %bb.68:                               #   in Loop: Header=BB239_67 Depth=1
	movl	(%ebx), %ebp
	addl	$8, %ebx
	testl	%ebp, %ebp
	jne	LBB239_67
LBB239_64:
	movl	4(%esp), %edi                   # 4-byte Reload
LBB239_74:                              # %.loopexit
	pushl	$"??_C@_0CA@OKGOHEMN@time?5format?5unknown?5unit?5error?4?$AA@"
	pushl	$8193                           # imm = 0x2001
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
LBB239_75:
	movl	%edi, %eax
	jmp	LBB239_29
LBB239_70:
	movl	%edx, %eax
	jmp	LBB239_29
LBB239_71:
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
	je	LBB239_75
LBB239_72:                              # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebp
	pushl	4(%esp)                         # 4-byte Folded Reload
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB239_76
# %bb.73:                               #   in Loop: Header=BB239_72 Depth=1
	movl	(%ebx), %ebp
	addl	$8, %ebx
	testl	%ebp, %ebp
	jne	LBB239_72
	jmp	LBB239_74
LBB239_76:
	pushl	24(%esp)                        # 4-byte Folded Reload
	calll	_atoi
	addl	$4, %esp
	imull	-4(%ebx), %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	addl	%eax, %edi
	adcl	%ecx, %esi
	jmp	LBB239_75
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI239_0:
	.long	LBB239_21
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_48
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_36
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_40
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_30
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_32
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_44
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_74
	.long	LBB239_42
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
	je	LBB240_9
# %bb.1:                                # %sub_0
	cmpl	$56, %esi
	je	LBB240_7
# %bb.2:                                # %sub_0
	cmpl	$50, %esi
	jne	LBB240_6
# %bb.3:                                # %.tail
	cmpb	$35, 1(%edx)
	jne	LBB240_6
# %bb.4:
	movl	$2, %esi
	movl	$L___const.Literal_StrBase.keyword, %eax
	jmp	LBB240_5
LBB240_7:                               # %.tail1
	cmpb	$35, 1(%edx)
	jne	LBB240_6
# %bb.8:
	movl	$2, %esi
	movl	$L___const.Literal_StrBase.keyword+8, %eax
	jmp	LBB240_5
LBB240_9:                               # %sub_17
	cmpb	$48, 1(%edx)
	jne	LBB240_12
# %bb.10:                               # %.tail5
	cmpb	$35, 2(%edx)
	jne	LBB240_12
# %bb.11:
	movl	$3, %esi
	movl	$L___const.Literal_StrBase.keyword+16, %eax
	jmp	LBB240_5
LBB240_12:                              # %sub_111
	cmpb	$54, 1(%edx)
	jne	LBB240_6
# %bb.13:                               # %.tail9
	cmpb	$35, 2(%edx)
	jne	LBB240_6
# %bb.14:
	movl	$3, %esi
	movl	$L___const.Literal_StrBase.keyword+24, %eax
LBB240_5:
	movl	4(%eax), %eax
	addl	%esi, %edx
	movl	%edx, (%ecx)
LBB240_6:                               # %.tail9.thread
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
	je	LBB241_9
# %bb.1:
	pushl	$"??_C@_04LOAJBDKD@true?$AA@"
	pushl	%esi
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB241_9
# %bb.2:
	pushl	$"??_C@_05MAJJAKPI@FALSE?$AA@"
	pushl	%esi
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB241_8
# %bb.3:
	pushl	$"??_C@_05LAPONLG@false?$AA@"
	pushl	%esi
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB241_8
# %bb.4:
	cmpb	$49, (%esi)
	jne	LBB241_8
# %bb.5:
	cmpb	$0, 1(%esi)
	sete	%bl
	jmp	LBB241_9
LBB241_8:
	xorl	%ebx, %ebx
LBB241_9:
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
	je	LBB242_9
# %bb.1:
	cmpl	$56, %edx
	je	LBB242_7
# %bb.2:
	cmpl	$50, %edx
	jne	LBB242_6
# %bb.3:
	cmpb	$35, 1(%eax)
	jne	LBB242_6
# %bb.4:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword, %ecx
	jmp	LBB242_5
LBB242_7:
	cmpb	$35, 1(%eax)
	jne	LBB242_6
# %bb.8:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword+8, %ecx
	jmp	LBB242_5
LBB242_9:
	movzbl	1(%eax), %edx
	cmpl	$54, %edx
	je	LBB242_13
# %bb.10:
	cmpl	$48, %edx
	jne	LBB242_6
# %bb.11:
	cmpb	$35, 2(%eax)
	jne	LBB242_6
# %bb.12:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+16, %ecx
	jmp	LBB242_5
LBB242_13:
	cmpb	$35, 2(%eax)
	jne	LBB242_6
# %bb.14:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+24, %ecx
LBB242_5:
	movl	4(%ecx), %ecx
	addl	%edx, %eax
LBB242_6:                               # %.thread
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
	je	LBB243_9
# %bb.1:
	cmpl	$56, %edx
	je	LBB243_7
# %bb.2:
	cmpl	$50, %edx
	jne	LBB243_6
# %bb.3:
	cmpb	$35, 1(%eax)
	jne	LBB243_6
# %bb.4:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword, %ecx
	jmp	LBB243_5
LBB243_7:
	cmpb	$35, 1(%eax)
	jne	LBB243_6
# %bb.8:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword+8, %ecx
	jmp	LBB243_5
LBB243_9:
	movzbl	1(%eax), %edx
	cmpl	$54, %edx
	je	LBB243_13
# %bb.10:
	cmpl	$48, %edx
	jne	LBB243_6
# %bb.11:
	cmpb	$35, 2(%eax)
	jne	LBB243_6
# %bb.12:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+16, %ecx
	jmp	LBB243_5
LBB243_13:
	cmpb	$35, 2(%eax)
	jne	LBB243_6
# %bb.14:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+24, %ecx
LBB243_5:
	movl	4(%ecx), %ecx
	addl	%edx, %eax
LBB243_6:                               # %.thread
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
	je	LBB244_9
# %bb.1:
	cmpl	$56, %edx
	je	LBB244_7
# %bb.2:
	cmpl	$50, %edx
	jne	LBB244_6
# %bb.3:
	cmpb	$35, 1(%eax)
	jne	LBB244_6
# %bb.4:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword, %ecx
	jmp	LBB244_5
LBB244_7:
	cmpb	$35, 1(%eax)
	jne	LBB244_6
# %bb.8:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword+8, %ecx
	jmp	LBB244_5
LBB244_9:
	movzbl	1(%eax), %edx
	cmpl	$54, %edx
	je	LBB244_13
# %bb.10:
	cmpl	$48, %edx
	jne	LBB244_6
# %bb.11:
	cmpb	$35, 2(%eax)
	jne	LBB244_6
# %bb.12:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+16, %ecx
	jmp	LBB244_5
LBB244_13:
	cmpb	$35, 2(%eax)
	jne	LBB244_6
# %bb.14:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+24, %ecx
LBB244_5:
	movl	4(%ecx), %ecx
	addl	%edx, %eax
LBB244_6:                               # %.thread
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
	je	LBB245_9
# %bb.1:
	cmpl	$56, %edx
	je	LBB245_7
# %bb.2:
	cmpl	$50, %edx
	jne	LBB245_6
# %bb.3:
	cmpb	$35, 1(%eax)
	jne	LBB245_6
# %bb.4:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword, %ecx
	jmp	LBB245_5
LBB245_7:
	cmpb	$35, 1(%eax)
	jne	LBB245_6
# %bb.8:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword+8, %ecx
	jmp	LBB245_5
LBB245_9:
	movzbl	1(%eax), %edx
	cmpl	$54, %edx
	je	LBB245_13
# %bb.10:
	cmpl	$48, %edx
	jne	LBB245_6
# %bb.11:
	cmpb	$35, 2(%eax)
	jne	LBB245_6
# %bb.12:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+16, %ecx
	jmp	LBB245_5
LBB245_13:
	cmpb	$35, 2(%eax)
	jne	LBB245_6
# %bb.14:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+24, %ecx
LBB245_5:
	movl	4(%ecx), %ecx
	addl	%edx, %eax
LBB245_6:                               # %.thread
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
	je	LBB246_9
# %bb.1:
	cmpl	$56, %edx
	je	LBB246_7
# %bb.2:
	cmpl	$50, %edx
	jne	LBB246_6
# %bb.3:
	cmpb	$35, 1(%eax)
	jne	LBB246_6
# %bb.4:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword, %ecx
	jmp	LBB246_5
LBB246_7:
	cmpb	$35, 1(%eax)
	jne	LBB246_6
# %bb.8:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword+8, %ecx
	jmp	LBB246_5
LBB246_9:
	movzbl	1(%eax), %edx
	cmpl	$54, %edx
	je	LBB246_13
# %bb.10:
	cmpl	$48, %edx
	jne	LBB246_6
# %bb.11:
	cmpb	$35, 2(%eax)
	jne	LBB246_6
# %bb.12:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+16, %ecx
	jmp	LBB246_5
LBB246_13:
	cmpb	$35, 2(%eax)
	jne	LBB246_6
# %bb.14:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+24, %ecx
LBB246_5:
	movl	4(%ecx), %ecx
	addl	%edx, %eax
LBB246_6:                               # %.thread
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
	je	LBB247_9
# %bb.1:
	cmpl	$56, %edx
	je	LBB247_7
# %bb.2:
	cmpl	$50, %edx
	jne	LBB247_6
# %bb.3:
	cmpb	$35, 1(%eax)
	jne	LBB247_6
# %bb.4:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword, %ecx
	jmp	LBB247_5
LBB247_7:
	cmpb	$35, 1(%eax)
	jne	LBB247_6
# %bb.8:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword+8, %ecx
	jmp	LBB247_5
LBB247_9:
	movzbl	1(%eax), %edx
	cmpl	$54, %edx
	je	LBB247_13
# %bb.10:
	cmpl	$48, %edx
	jne	LBB247_6
# %bb.11:
	cmpb	$35, 2(%eax)
	jne	LBB247_6
# %bb.12:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+16, %ecx
	jmp	LBB247_5
LBB247_13:
	cmpb	$35, 2(%eax)
	jne	LBB247_6
# %bb.14:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+24, %ecx
LBB247_5:
	movl	4(%ecx), %ecx
	addl	%edx, %eax
LBB247_6:                               # %.thread
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
	je	LBB248_9
# %bb.1:
	cmpl	$56, %edx
	je	LBB248_7
# %bb.2:
	cmpl	$50, %edx
	jne	LBB248_6
# %bb.3:
	cmpb	$35, 1(%eax)
	jne	LBB248_6
# %bb.4:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword, %ecx
	jmp	LBB248_5
LBB248_7:
	cmpb	$35, 1(%eax)
	jne	LBB248_6
# %bb.8:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword+8, %ecx
	jmp	LBB248_5
LBB248_9:
	movzbl	1(%eax), %edx
	cmpl	$54, %edx
	je	LBB248_13
# %bb.10:
	cmpl	$48, %edx
	jne	LBB248_6
# %bb.11:
	cmpb	$35, 2(%eax)
	jne	LBB248_6
# %bb.12:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+16, %ecx
	jmp	LBB248_5
LBB248_13:
	cmpb	$35, 2(%eax)
	jne	LBB248_6
# %bb.14:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+24, %ecx
LBB248_5:
	movl	4(%ecx), %ecx
	addl	%edx, %eax
LBB248_6:                               # %.thread
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
	je	LBB249_9
# %bb.1:
	cmpl	$56, %edx
	je	LBB249_7
# %bb.2:
	cmpl	$50, %edx
	jne	LBB249_6
# %bb.3:
	cmpb	$35, 1(%eax)
	jne	LBB249_6
# %bb.4:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword, %ecx
	jmp	LBB249_5
LBB249_7:
	cmpb	$35, 1(%eax)
	jne	LBB249_6
# %bb.8:
	movl	$2, %edx
	movl	$L___const.Literal_StrBase.keyword+8, %ecx
	jmp	LBB249_5
LBB249_9:
	movzbl	1(%eax), %edx
	cmpl	$54, %edx
	je	LBB249_13
# %bb.10:
	cmpl	$48, %edx
	jne	LBB249_6
# %bb.11:
	cmpb	$35, 2(%eax)
	jne	LBB249_6
# %bb.12:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+16, %ecx
	jmp	LBB249_5
LBB249_13:
	cmpb	$35, 2(%eax)
	jne	LBB249_6
# %bb.14:
	movl	$3, %edx
	movl	$L___const.Literal_StrBase.keyword+24, %ecx
LBB249_5:
	movl	4(%ecx), %ecx
	addl	%edx, %eax
LBB249_6:                               # %.thread
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
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	20(%esp), %ebx
	pushl	%ebx
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %edi
	pushl	$83
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %esi
	testl	%eax, %eax
	je	LBB254_1
# %bb.2:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%esi, (%eax)
	movl	$83, 4(%eax)
	movl	$"??_C@_0O@NOPHFFNJ@Variable_Body?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB254_3
# %bb.4:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB254_5
LBB254_1:
	pushl	$"??_C@_0O@NOPHFFNJ@Variable_Body?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB254_6
LBB254_3:
	movl	%eax, _heaplist
LBB254_5:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB254_6:                               # %Variable_Body.exit
	decl	%edi
	cmpl	$80, %edi
	movl	$80, %ebp
	cmovll	%edi, %ebp
	movl	%esi, %eax
	addl	$2, %eax
	pushl	%ebp
	pushl	%ebx
	pushl	%eax
	calll	_strncpy
	addl	$12, %esp
	movw	%bp, (%esi)
	movl	%esi, %eax
	xorl	%edx, %edx
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
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
	movl	20(%esp), %ebp
	xorl	%eax, %eax
	testl	%ebp, %ebp
	je	LBB255_16
# %bb.1:                                # %.preheader.preheader
	movl	$"??_C@_05NCFAHBAN@BOOL?$CD?$AA@", %esi
	movl	$L___const.Literal_Compile.keyword+12, %ebx
	.p2align	4
LBB255_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%esi
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %edi
	pushl	%eax
	pushl	%esi
	pushl	%ebp
	calll	_strncmp
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB255_5
# %bb.3:                                #   in Loop: Header=BB255_2 Depth=1
	movl	(%ebx), %esi
	addl	$12, %ebx
	testl	%esi, %esi
	jne	LBB255_2
# %bb.4:
	xorl	%eax, %eax
	jmp	LBB255_16
LBB255_5:
	pushl	$_scope
	calll	_strlen
	addl	$4, %esp
	testl	%eax, %eax
	leal	1(%edi,%eax), %eax
	cmovel	%edi, %eax
	movzwl	-8(%ebx), %esi
	addl	%ebp, %eax
	pushl	%eax
	calll	*-4(%ebx)
	addl	$4, %esp
	movl	%eax, %ebx
	movl	%edx, %edi
	pushl	%esi
	pushl	%ebp
	calll	_Variable_Add
	addl	$8, %esp
	movb	$1, 10(%eax)
	cmpl	$1346, %esi                     # imm = 0x542
	jne	LBB255_7
# %bb.6:
	movl	%ebx, %ebp
	jmp	LBB255_15
LBB255_7:
	movl	%eax, %esi
	pushl	$8
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %ebp
	testl	%eax, %eax
	je	LBB255_8
# %bb.9:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%ebp, (%eax)
	movl	$8, 4(%eax)
	movl	$"??_C@_0O@NOPHFFNJ@Variable_Body?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB255_10
# %bb.11:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB255_12
LBB255_8:
	pushl	$"??_C@_0O@NOPHFFNJ@Variable_Body?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB255_13
LBB255_10:
	movl	%eax, _heaplist
LBB255_12:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
	.p2align	4
LBB255_13:                              # %Variable_Body.exit
                                        # =>This Inner Loop Header: Depth=1
	movl	(%ebp), %eax
	movl	4(%ebp), %edx
	movl	%edi, %ecx
	lock		cmpxchg8b	(%ebp)
	jne	LBB255_13
# %bb.14:
	movl	%esi, %eax
LBB255_15:                              # %Variable_Copy64.exit
	movl	%ebp, (%eax)
LBB255_16:                              # %.loopexit
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Logic_Add;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_Add                      # -- Begin function Logic_Add
	.p2align	4
_Logic_Add:                             # @Logic_Add
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	28(%esp), %ebx
	movl	24(%esp), %ebp
	movl	20(%esp), %edi
	pushl	$28
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %esi
	testl	%eax, %eax
	je	LBB256_1
# %bb.2:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%esi, (%eax)
	movl	$28, 4(%eax)
	movl	$"??_C@_09IGONEJKP@Logic_Add?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB256_3
# %bb.4:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB256_5
LBB256_1:
	pushl	$"??_C@_09IGONEJKP@Logic_Add?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB256_6
LBB256_3:
	movl	%eax, _heaplist
LBB256_5:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB256_6:                               # %Heap_Alloc.exit
	movl	%edi, (%esi)
	movl	%ebp, 4(%esi)
	movl	%ebx, 8(%esi)
	movl	32(%esp), %eax
	movl	%eax, 12(%esi)
	movl	$0, 24(%esi)
	cmpl	$0, _plcLogic
	je	LBB256_7
# %bb.8:
	movl	_plcLogicBottom, %eax
	movl	%esi, 24(%eax)
	jmp	LBB256_9
LBB256_7:
	movl	%esi, _plcLogic
LBB256_9:
	movl	%esi, _plcLogicBottom
	movl	$2, _status_logic
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Logic_Clear;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_Clear                    # -- Begin function Logic_Clear
	.p2align	4
_Logic_Clear:                           # @Logic_Clear
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	_plcLogic, %esi
	jmp	LBB257_1
	.p2align	4
LBB257_6:                               # %.loopexit5.i
                                        #   in Loop: Header=BB257_1 Depth=1
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB257_7
# %bb.9:                                #   in Loop: Header=BB257_1 Depth=1
	movl	%edx, 16(%ecx)
LBB257_11:                              #   in Loop: Header=BB257_1 Depth=1
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB257_12:                              # %Heap_Free.exit
                                        #   in Loop: Header=BB257_1 Depth=1
	pushl	%edi
	calll	_free
	addl	$4, %esp
	movl	%esi, _plcLogic
LBB257_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB257_4 Depth 2
	testl	%esi, %esi
	je	LBB257_13
# %bb.2:                                # %.preheader
                                        #   in Loop: Header=BB257_1 Depth=1
	movl	%esi, %edi
	movl	24(%esi), %esi
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB257_12
# %bb.3:                                #   in Loop: Header=BB257_1 Depth=1
	movl	%ecx, %eax
	cmpl	%edi, (%ecx)
	je	LBB257_6
	.p2align	4
LBB257_4:                               # %.preheader.i
                                        #   Parent Loop BB257_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB257_12
# %bb.5:                                #   in Loop: Header=BB257_4 Depth=2
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%edi, (%edx)
	jne	LBB257_4
	jmp	LBB257_6
LBB257_7:                               #   in Loop: Header=BB257_1 Depth=1
	cmpl	%eax, %ecx
	je	LBB257_8
# %bb.10:                               #   in Loop: Header=BB257_1 Depth=1
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB257_11
LBB257_8:                               #   in Loop: Header=BB257_1 Depth=1
	movl	$0, _heaplist
	movl	$0, _heapbottom
	jmp	LBB257_11
LBB257_13:                              # %.loopexit
	movl	$0, _plcLogic
	movl	$0, _plcLogicBottom
	movl	$0, _status_logic
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Logic_Display;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_Display                  # -- Begin function Logic_Display
	.p2align	4
_Logic_Display:                         # @Logic_Display
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	$L_str.88
	calll	_puts
	addl	$4, %esp
	movl	_RUNplcLogic, %esi
	testl	%esi, %esi
	je	LBB258_4
# %bb.1:                                # %.preheader.preheader
	movl	$1, %edi
	xorl	%ebx, %ebx
	.p2align	4
LBB258_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	(%esi), %eax
	movl	12(%esi), %ecx
	cmpl	$_VARIANT_EMPTY, %ecx
	cmovel	%ebx, %ecx
	movl	8(%esi), %edx
	cmpl	$_VARIANT_EMPTY, %edx
	cmovel	%ebx, %edx
	movl	4(%esi), %ebp
	cmpl	$_VARIANT_EMPTY, %ebp
	cmovel	%ebx, %ebp
	pushl	13(%eax)
	pushl	%ecx
	pushl	%edx
	pushl	%ebp
	pushl	(%eax)
	pushl	%esi
	pushl	%edi
	pushl	$"??_C@_0CF@BIIKPHMI@?5?5line?$CI?$CF03d?$CJ?5?$CFp?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5@"
	calll	_printf
	addl	$32, %esp
	movl	24(%esi), %esi
	incl	%edi
	testl	%esi, %esi
	jne	LBB258_2
# %bb.3:
	pushl	$L_str.1.89
	calll	_puts
	addl	$4, %esp
	movl	_RUNplcentrypoint, %eax
	testl	%eax, %eax
	je	LBB258_4
# %bb.6:
	pushl	%eax
	pushl	$"??_C@_0BE@CKMLNBAF@?5?5entry?5point?3?5?5?$CFp?6?$AA@"
	calll	_printf
	addl	$8, %esp
	jmp	LBB258_5
LBB258_4:
	pushl	$L_str.1.254
	calll	_puts
	addl	$4, %esp
LBB258_5:
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Logic_Convert_To_Clanguage;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_Convert_To_Clanguage     # -- Begin function Logic_Convert_To_Clanguage
	.p2align	4
_Logic_Convert_To_Clanguage:            # @Logic_Convert_To_Clanguage
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %esi
	movl	_plcLogic, %edi
	pushl	%esi
	pushl	$1
	pushl	$123
	pushl	$"??_C@_0HM@OIDHGGKG@?$CDinclude?5?$DMPLCINST?4h?$DO?6int?5main?$CIin@"
	calll	_fwrite
	addl	$16, %esp
	testl	%edi, %edi
	je	LBB259_3
	.p2align	4
LBB259_1:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	(%edi), %eax
	pushl	12(%edi)
	pushl	8(%edi)
	pushl	4(%edi)
	pushl	(%eax)
	pushl	$"??_C@_0BI@JHDIMNMC@?7a?$DN?$CFs?$CI?5a?5?0?$CFp?0?5?$CFp?0?5?$CFp?$CJ?$DL?6?$AA@"
	pushl	%esi
	calll	_fprintf
	addl	$24, %esp
	movl	24(%edi), %edi
	testl	%edi, %edi
	jne	LBB259_1
LBB259_3:                               # %.loopexit
	pushl	%esi
	pushl	$1
	pushl	$2
	pushl	$"??_C@_02KGHIDFGE@?$HN?6?$AA@"
	calll	_fwrite
	addl	$16, %esp
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Logic_RunPOU;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_RunPOU                   # -- Begin function Logic_RunPOU
	.p2align	4
_Logic_RunPOU:                          # @Logic_RunPOU
# %bb.0:
	pushl	%esi
	movl	12(%esp), %esi
	movl	8(%esp), %eax
	testl	%esi, %esi
	je	LBB260_6
	.p2align	4
LBB260_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	(%esi), %ecx
	pushl	12(%esi)
	pushl	8(%esi)
	pushl	4(%esi)
	pushl	%eax
	calll	*13(%ecx)
	addl	$16, %esp
	movl	(%eax), %ecx
	testl	%ecx, %ecx
	je	LBB260_4
# %bb.3:                                #   in Loop: Header=BB260_2 Depth=1
	movsd	(%ecx), %xmm0                   # xmm0 = mem[0],zero
	movsd	%xmm0, 16(%esi)
LBB260_4:                               #   in Loop: Header=BB260_2 Depth=1
	cmpb	$1, 11(%eax)
	je	LBB260_5
# %bb.7:                                #   in Loop: Header=BB260_2 Depth=1
	movl	24(%esi), %esi
	testl	%esi, %esi
	jne	LBB260_2
LBB260_6:                               # %.loopexit
	popl	%esi
	retl
LBB260_5:
	movb	$0, 11(%eax)
	popl	%esi
	retl
                                        # -- End function
	.def	_Logic_Scan;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_Scan                     # -- Begin function Logic_Scan
	.p2align	4
_Logic_Scan:                            # @Logic_Scan
# %bb.0:
	pushl	%esi
	subl	$100, %esp
	movl	_RUNplcentrypoint, %esi
	testl	%esi, %esi
	je	LBB261_7
# %bb.1:
	xorps	%xmm0, %xmm0
	movsd	%xmm0, 4(%esp)
	movl	$0, 11(%esp)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 80(%esp)
	movups	%xmm0, 64(%esp)
	movups	%xmm0, 48(%esp)
	movups	%xmm0, 32(%esp)
	movups	%xmm0, 16(%esp)
	movl	$0, 95(%esp)
	leal	16(%esp), %eax
	movl	%eax, (%esp)
	movl	%esp, %eax
	.p2align	4
LBB261_2:                               # =>This Inner Loop Header: Depth=1
	movl	(%esi), %ecx
	pushl	12(%esi)
	pushl	8(%esi)
	pushl	4(%esi)
	pushl	%eax
	calll	*13(%ecx)
	addl	$16, %esp
	movl	(%eax), %ecx
	testl	%ecx, %ecx
	je	LBB261_4
# %bb.3:                                #   in Loop: Header=BB261_2 Depth=1
	movsd	(%ecx), %xmm0                   # xmm0 = mem[0],zero
	movsd	%xmm0, 16(%esi)
LBB261_4:                               #   in Loop: Header=BB261_2 Depth=1
	cmpb	$1, 11(%eax)
	je	LBB261_5
# %bb.6:                                #   in Loop: Header=BB261_2 Depth=1
	movl	24(%esi), %esi
	testl	%esi, %esi
	jne	LBB261_2
	jmp	LBB261_7
LBB261_5:
	movb	$0, 11(%eax)
LBB261_7:
	addl	$100, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_Logic_Begin;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_Begin                    # -- Begin function Logic_Begin
	.p2align	4
_Logic_Begin:                           # @Logic_Begin
# %bb.0:
	pushl	%esi
	subl	$100, %esp
	movl	_RUNplcbeginpoint, %esi
	testl	%esi, %esi
	je	LBB262_7
# %bb.1:
	xorps	%xmm0, %xmm0
	movsd	%xmm0, 4(%esp)
	movl	$0, 11(%esp)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 80(%esp)
	movups	%xmm0, 64(%esp)
	movups	%xmm0, 48(%esp)
	movups	%xmm0, 32(%esp)
	movups	%xmm0, 16(%esp)
	movl	$0, 95(%esp)
	leal	16(%esp), %eax
	movl	%eax, (%esp)
	movl	%esp, %eax
	.p2align	4
LBB262_2:                               # =>This Inner Loop Header: Depth=1
	movl	(%esi), %ecx
	pushl	12(%esi)
	pushl	8(%esi)
	pushl	4(%esi)
	pushl	%eax
	calll	*13(%ecx)
	addl	$16, %esp
	movl	(%eax), %ecx
	testl	%ecx, %ecx
	je	LBB262_4
# %bb.3:                                #   in Loop: Header=BB262_2 Depth=1
	movsd	(%ecx), %xmm0                   # xmm0 = mem[0],zero
	movsd	%xmm0, 16(%esi)
LBB262_4:                               #   in Loop: Header=BB262_2 Depth=1
	cmpb	$1, 11(%eax)
	je	LBB262_5
# %bb.6:                                #   in Loop: Header=BB262_2 Depth=1
	movl	24(%esi), %esi
	testl	%esi, %esi
	jne	LBB262_2
	jmp	LBB262_7
LBB262_5:
	movb	$0, 11(%eax)
LBB262_7:
	addl	$100, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_Logic_Final;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_Final                    # -- Begin function Logic_Final
	.p2align	4
_Logic_Final:                           # @Logic_Final
# %bb.0:
	pushl	%esi
	subl	$100, %esp
	movl	_RUNplcfinalpoint, %esi
	testl	%esi, %esi
	je	LBB263_7
# %bb.1:
	xorps	%xmm0, %xmm0
	movsd	%xmm0, 4(%esp)
	movl	$0, 11(%esp)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 80(%esp)
	movups	%xmm0, 64(%esp)
	movups	%xmm0, 48(%esp)
	movups	%xmm0, 32(%esp)
	movups	%xmm0, 16(%esp)
	movl	$0, 95(%esp)
	leal	16(%esp), %eax
	movl	%eax, (%esp)
	movl	%esp, %eax
	.p2align	4
LBB263_2:                               # =>This Inner Loop Header: Depth=1
	movl	(%esi), %ecx
	pushl	12(%esi)
	pushl	8(%esi)
	pushl	4(%esi)
	pushl	%eax
	calll	*13(%ecx)
	addl	$16, %esp
	movl	(%eax), %ecx
	testl	%ecx, %ecx
	je	LBB263_4
# %bb.3:                                #   in Loop: Header=BB263_2 Depth=1
	movsd	(%ecx), %xmm0                   # xmm0 = mem[0],zero
	movsd	%xmm0, 16(%esi)
LBB263_4:                               #   in Loop: Header=BB263_2 Depth=1
	cmpb	$1, 11(%eax)
	je	LBB263_5
# %bb.6:                                #   in Loop: Header=BB263_2 Depth=1
	movl	24(%esi), %esi
	testl	%esi, %esi
	jne	LBB263_2
	jmp	LBB263_7
LBB263_5:
	movb	$0, 11(%eax)
LBB263_7:
	addl	$100, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_Logic_SetEntrypoint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_SetEntrypoint            # -- Begin function Logic_SetEntrypoint
	.p2align	4
_Logic_SetEntrypoint:                   # @Logic_SetEntrypoint
# %bb.0:
	movl	4(%esp), %eax
	movl	%eax, _plcentrypoint
	retl
                                        # -- End function
	.def	_Logic_SetBeginpoint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_SetBeginpoint            # -- Begin function Logic_SetBeginpoint
	.p2align	4
_Logic_SetBeginpoint:                   # @Logic_SetBeginpoint
# %bb.0:
	movl	4(%esp), %eax
	movl	%eax, _plcbeginpoint
	retl
                                        # -- End function
	.def	_Logic_SetFinalpoint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_SetFinalpoint            # -- Begin function Logic_SetFinalpoint
	.p2align	4
_Logic_SetFinalpoint:                   # @Logic_SetFinalpoint
# %bb.0:
	movl	4(%esp), %eax
	movl	%eax, _plcfinalpoint
	retl
                                        # -- End function
	.def	_Logic_Swap;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_Swap                     # -- Begin function Logic_Swap
	.p2align	4
_Logic_Swap:                            # @Logic_Swap
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	_RUNplcLogic, %esi
	movl	_plcLogic, %eax
	movl	%eax, _RUNplcLogic
	jmp	LBB267_1
	.p2align	4
LBB267_6:                               # %.loopexit5.i
                                        #   in Loop: Header=BB267_1 Depth=1
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB267_7
# %bb.9:                                #   in Loop: Header=BB267_1 Depth=1
	movl	%edx, 16(%ecx)
LBB267_11:                              #   in Loop: Header=BB267_1 Depth=1
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB267_12:                              # %Heap_Free.exit
                                        #   in Loop: Header=BB267_1 Depth=1
	pushl	%edi
	calll	_free
	addl	$4, %esp
LBB267_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB267_4 Depth 2
	movl	%esi, _plcLogic
	testl	%esi, %esi
	je	LBB267_13
# %bb.2:                                # %.preheader
                                        #   in Loop: Header=BB267_1 Depth=1
	movl	%esi, %edi
	movl	24(%esi), %esi
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB267_12
# %bb.3:                                #   in Loop: Header=BB267_1 Depth=1
	movl	%ecx, %eax
	cmpl	%edi, (%ecx)
	je	LBB267_6
	.p2align	4
LBB267_4:                               # %.preheader.i
                                        #   Parent Loop BB267_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB267_12
# %bb.5:                                #   in Loop: Header=BB267_4 Depth=2
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%edi, (%edx)
	jne	LBB267_4
	jmp	LBB267_6
LBB267_7:                               #   in Loop: Header=BB267_1 Depth=1
	cmpl	%eax, %ecx
	je	LBB267_8
# %bb.10:                               #   in Loop: Header=BB267_1 Depth=1
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB267_11
LBB267_8:                               #   in Loop: Header=BB267_1 Depth=1
	movl	$0, _heaplist
	movl	$0, _heapbottom
	jmp	LBB267_11
LBB267_13:                              # %.loopexit
	movl	$0, _plcLogicBottom
	movl	$0, _status_logic
	movl	$0, _plcLogic
	movl	_plcentrypoint, %eax
	movl	%eax, _RUNplcentrypoint
	movl	$0, _plcentrypoint
	movl	_plcbeginpoint, %eax
	movl	%eax, _RUNplcbeginpoint
	movl	$0, _plcbeginpoint
	movl	_plcfinalpoint, %eax
	movl	%eax, _RUNplcfinalpoint
	movl	$0, _plcfinalpoint
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Logic_Disasm;
	.scl	2;
	.type	32;
	.endef
	.globl	_Logic_Disasm                   # -- Begin function Logic_Disasm
	.p2align	4
_Logic_Disasm:                          # @Logic_Disasm
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	$L_str.4
	calll	_puts
	addl	$4, %esp
	movl	_RUNplcLogic, %esi
	testl	%esi, %esi
	je	LBB268_4
# %bb.1:                                # %.preheader.preheader
	movl	$1, %edi
	xorl	%ebx, %ebx
	.p2align	4
LBB268_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	12(%esi), %eax
	cmpl	$_VARIANT_EMPTY, %eax
	cmovel	%ebx, %eax
	movl	8(%esi), %ecx
	cmpl	$_VARIANT_EMPTY, %ecx
	cmovel	%ebx, %ecx
	movl	(%esi), %edx
	movl	4(%esi), %ebp
	cmpl	$_VARIANT_EMPTY, %ebp
	cmovel	%ebx, %ebp
	pushl	20(%esi)
	pushl	16(%esi)
	pushl	%eax
	pushl	%ecx
	pushl	%ebp
	pushl	(%edx)
	pushl	%edi
	pushl	$"??_C@_0CI@IHKJGMPN@?5?5line?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5?5?$CF0@"
	calll	_printf
	addl	$32, %esp
	movl	24(%esi), %esi
	incl	%edi
	testl	%esi, %esi
	jne	LBB268_2
	jmp	LBB268_3
LBB268_4:
	pushl	$L_str.1.254
	calll	_puts
	addl	$4, %esp
LBB268_3:                               # %.loopexit
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_plcmain;
	.scl	2;
	.type	32;
	.endef
	.globl	_plcmain                        # -- Begin function plcmain
	.p2align	4
_plcmain:                               # @plcmain
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	24(%esp), %esi
	movl	_heaplist, %eax
	testl	%eax, %eax
	je	LBB269_2
	.p2align	4
LBB269_1:                               # %.preheader.i
                                        # =>This Inner Loop Header: Depth=1
	movl	16(%eax), %edi
	pushl	%eax
	calll	_free
	addl	$4, %esp
	movl	%edi, _heaplist
	movl	%edi, %eax
	testl	%edi, %edi
	jne	LBB269_1
LBB269_2:                               # %Heap_Clear.exit
	movl	$0, _heaplist
	movl	$0, _heapbottom
	movl	$0, _status_heap
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
	subl	$8, %esp
	movl	%esi, 4(%esp)
	calll	_Argument_Init
	addl	$8, %esp
	calll	_INtime_ProcessInitialize
	pushl	$4096                           # imm = 0x1000
	calll	_AllocateRtMemory
	addl	$4, %esp
	movl	%eax, _sqtbl
	testl	%eax, %eax
	je	LBB269_65
# %bb.3:                                # %Catalog.exit.i
	pushl	$4096                           # imm = 0x1000
	pushl	%eax
	calll	_CreateRtMemoryHandle
	addl	$8, %esp
	movw	%ax, _hSQTBLmem
	movzwl	%ax, %eax
	pushl	$"??_C@_05KKOJADCM@SQTBL?$AA@"
	pushl	%eax
	pushl	$0
	calll	_CatalogRtHandle
	addl	$12, %esp
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB269_5
# %bb.4:
	pushl	$4096                           # imm = 0x1000
	pushl	$0
	pushl	%eax
	calll	_memset
	addl	$12, %esp
LBB269_5:                               # %SQTBL_Create.exit
	calll	_Api_Init
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB269_10
# %bb.6:
	cmpw	$0, 41(%eax)
	jne	LBB269_8
# %bb.7:                                # %Pause_Init.exit
	pushl	$0
	pushl	$1
	pushl	$0
	calll	_CreateRtSemaphore
	addl	$12, %esp
	movl	_sqtbl, %ecx
	movw	%ax, 41(%ecx)
	movzwl	%ax, %eax
	pushl	$"??_C@_06OAFNIPMP@SQSUSP?$AA@"
	pushl	%eax
	pushl	$0
	calll	_CatalogRtHandle
	addl	$12, %esp
	movl	$2, _status_pause
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB269_10
LBB269_8:                               # %Pause_Init.exit.thread
	cmpw	$0, 35(%eax)
	jne	LBB269_10
# %bb.9:                                # %Catalog.exit.i2
	pushl	$0
	pushl	$1
	pushl	$0
	calll	_CreateRtSemaphore
	addl	$12, %esp
	movl	_sqtbl, %ecx
	movw	%ax, 35(%ecx)
	movzwl	%ax, %eax
	pushl	$"??_C@_06EAEKDHGI@SQSTEP?$AA@"
	pushl	%eax
	pushl	$0
	calll	_CatalogRtHandle
	addl	$12, %esp
	movl	$2, _status_step
LBB269_10:                              # %Step_Init.exit
	movl	20(%esp), %edi
	movb	$0, _exceptionNOW
	movl	_plcErrList, %ebx
	jmp	LBB269_11
	.p2align	4
LBB269_16:                              # %.loopexit5.i.i
                                        #   in Loop: Header=BB269_11 Depth=1
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB269_17
# %bb.19:                               #   in Loop: Header=BB269_11 Depth=1
	movl	%edx, 16(%ecx)
LBB269_21:                              #   in Loop: Header=BB269_11 Depth=1
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB269_22:                              # %Heap_Free.exit.i
                                        #   in Loop: Header=BB269_11 Depth=1
	pushl	%ebp
	calll	_free
	addl	$4, %esp
	movl	%ebx, _plcErrList
LBB269_11:                              # %Step_Init.exit
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB269_14 Depth 2
	testl	%ebx, %ebx
	je	LBB269_23
# %bb.12:                               # %.preheader.i3
                                        #   in Loop: Header=BB269_11 Depth=1
	movl	%ebx, %ebp
	movl	12(%ebx), %ebx
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB269_22
# %bb.13:                               #   in Loop: Header=BB269_11 Depth=1
	movl	%ecx, %eax
	cmpl	%ebp, (%ecx)
	je	LBB269_16
	.p2align	4
LBB269_14:                              # %.preheader.i.i
                                        #   Parent Loop BB269_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB269_22
# %bb.15:                               #   in Loop: Header=BB269_14 Depth=2
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%ebp, (%edx)
	jne	LBB269_14
	jmp	LBB269_16
LBB269_17:                              #   in Loop: Header=BB269_11 Depth=1
	cmpl	%eax, %ecx
	je	LBB269_18
# %bb.20:                               #   in Loop: Header=BB269_11 Depth=1
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB269_21
LBB269_18:                              #   in Loop: Header=BB269_11 Depth=1
	movl	$0, _heaplist
	movl	$0, _heapbottom
	jmp	LBB269_21
LBB269_23:                              # %Errorlog_Clear.exit
	movl	$0, _plcErrList
	movl	$0, _plcErrBottom
	movl	$0, _status_errorlog
	movl	$0, _errors
	calll	_Poufile_Clear
	pushl	$_IniFilePath
	calll	_IniFile_Load
	addl	$4, %esp
	pushl	%esi
	pushl	%edi
	calll	_Argument_Process
	addl	$8, %esp
	calll	_Container_Init
	calll	_INtime_ProcessCatalog
	pushl	$0
	pushl	$1
	pushl	$0
	calll	_CreateRtSemaphore
	addl	$12, %esp
	movw	%ax, _hExitEvent
	movzwl	%ax, %eax
	pushl	$"??_C@_04LBABLPF@Exit?$AA@"
	pushl	%eax
	pushl	$0
	calll	_CatalogRtHandle
	addl	$12, %esp
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB269_29
# %bb.24:
	movzbl	_bTraceMode, %ecx
	movb	%cl, 40(%eax)
	movzbl	_bStepMode, %ecx
	movb	%cl, 33(%eax)
	movzbl	_bPrintMode, %ecx
	movb	%cl, 37(%eax)
	movzbl	_bRemote, %ecx
	movb	%cl, 38(%eax)
	movzbl	_byRunMode, %ecx
	cmpl	$1, %ecx
	je	LBB269_27
# %bb.25:
	testl	%ecx, %ecx
	jne	LBB269_28
# %bb.26:
	movl	$4544581, (%eax)                # imm = 0x455845
	movl	_sqtbl, %eax
	jmp	LBB269_28
LBB269_27:
	movl	$5525577, 3(%eax)               # imm = 0x545049
	movl	$1230127955, (%eax)             # imm = 0x49524353
LBB269_28:
	movups	"??_C@_0BA@EIHPONHL@VER?405_00_00_00?$AA@", %xmm0
	movups	%xmm0, 16(%eax)
LBB269_29:                              # %SQTBL_Initialize.exit
	pushl	$"??_C@_0M@OKMJOFGL@PLCPIEC?4rsl?$AA@"
	calll	_INtime_RslLoad
	addl	$4, %esp
	movw	%ax, _hBasicFuncRSL
	testw	%ax, %ax
	je	LBB269_34
# %bb.30:
	movzwl	%ax, %eax
	pushl	$"??_C@_0P@FHFAIKGM@BasicFunctions?$AA@"
	pushl	%eax
	calll	_GetRtProcAddress
	addl	$8, %esp
	movl	%eax, _BasicFunctions
	movzwl	_hBasicFuncRSL, %eax
	pushl	$"??_C@_0BC@OECJMJAO@NumBasicFunctions?$AA@"
	pushl	%eax
	calll	_GetRtProcAddress
	addl	$8, %esp
	cmpl	$0, _BasicFunctions
	je	LBB269_32
# %bb.31:
	testl	%eax, %eax
	je	LBB269_32
# %bb.33:
	movzwl	(%eax), %eax
	movw	%ax, _NumBasicFunctions
	movl	$6, _status_basicfunc
	jmp	LBB269_34
LBB269_32:
	pushl	$"??_C@_0M@OKMJOFGL@PLCPIEC?4rsl?$AA@"
	pushl	$208
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
LBB269_34:                              # %Basicfunction_Load.exit
	pushl	$"??_C@_0L@NJCAICAP@PLCPEN?4rsl?$AA@"
	calll	_Functionblock_Load
	addl	$4, %esp
	pushl	$"??_C@_0L@JPAKFIOJ@PLCPFB?4rsl?$AA@"
	calll	_Functionblock_Load
	addl	$4, %esp
	calll	_Reservedword_CreateCatalog
	calll	_Engine_Init
	movl	_plcLogic, %esi
	jmp	LBB269_35
	.p2align	4
LBB269_40:                              # %.loopexit5.i.i6
                                        #   in Loop: Header=BB269_35 Depth=1
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB269_41
# %bb.43:                               #   in Loop: Header=BB269_35 Depth=1
	movl	%edx, 16(%ecx)
LBB269_45:                              #   in Loop: Header=BB269_35 Depth=1
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB269_46:                              # %Heap_Free.exit.i7
                                        #   in Loop: Header=BB269_35 Depth=1
	pushl	%edi
	calll	_free
	addl	$4, %esp
	movl	%esi, _plcLogic
LBB269_35:                              # %Basicfunction_Load.exit
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB269_38 Depth 2
	testl	%esi, %esi
	je	LBB269_47
# %bb.36:                               # %.preheader.i4
                                        #   in Loop: Header=BB269_35 Depth=1
	movl	%esi, %edi
	movl	24(%esi), %esi
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB269_46
# %bb.37:                               #   in Loop: Header=BB269_35 Depth=1
	movl	%ecx, %eax
	cmpl	%edi, (%ecx)
	je	LBB269_40
	.p2align	4
LBB269_38:                              # %.preheader.i.i5
                                        #   Parent Loop BB269_35 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB269_46
# %bb.39:                               #   in Loop: Header=BB269_38 Depth=2
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%edi, (%edx)
	jne	LBB269_38
	jmp	LBB269_40
LBB269_41:                              #   in Loop: Header=BB269_35 Depth=1
	cmpl	%eax, %ecx
	je	LBB269_42
# %bb.44:                               #   in Loop: Header=BB269_35 Depth=1
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB269_45
LBB269_42:                              #   in Loop: Header=BB269_35 Depth=1
	movl	$0, _heaplist
	movl	$0, _heapbottom
	jmp	LBB269_45
LBB269_47:                              # %Logic_Clear.exit
	movl	$0, _plcLogic
	movl	$0, _plcLogicBottom
	movl	$0, _status_logic
	calll	_Variable_Clear
	movl	_plcLabel, %esi
	jmp	LBB269_48
	.p2align	4
LBB269_53:                              # %.loopexit5.i.i10
                                        #   in Loop: Header=BB269_48 Depth=1
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB269_54
# %bb.56:                               #   in Loop: Header=BB269_48 Depth=1
	movl	%edx, 16(%ecx)
LBB269_58:                              #   in Loop: Header=BB269_48 Depth=1
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB269_59:                              # %Heap_Free.exit.i11
                                        #   in Loop: Header=BB269_48 Depth=1
	pushl	%edi
	calll	_free
	addl	$4, %esp
	movl	%esi, _plcLabel
LBB269_48:                              # %Logic_Clear.exit
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB269_51 Depth 2
	testl	%esi, %esi
	je	LBB269_60
# %bb.49:                               # %.preheader.i8
                                        #   in Loop: Header=BB269_48 Depth=1
	movl	%esi, %edi
	movl	12(%esi), %esi
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB269_59
# %bb.50:                               #   in Loop: Header=BB269_48 Depth=1
	movl	%ecx, %eax
	cmpl	%edi, (%ecx)
	je	LBB269_53
	.p2align	4
LBB269_51:                              # %.preheader.i.i9
                                        #   Parent Loop BB269_48 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB269_59
# %bb.52:                               #   in Loop: Header=BB269_51 Depth=2
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%edi, (%edx)
	jne	LBB269_51
	jmp	LBB269_53
LBB269_54:                              #   in Loop: Header=BB269_48 Depth=1
	cmpl	%eax, %ecx
	je	LBB269_55
# %bb.57:                               #   in Loop: Header=BB269_48 Depth=1
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB269_58
LBB269_55:                              #   in Loop: Header=BB269_48 Depth=1
	movl	$0, _heaplist
	movl	$0, _heapbottom
	jmp	LBB269_58
LBB269_60:                              # %Label_Clear.exit
	movl	$0, _plcLabelBottom
	movl	$0, _plcLabel
	movl	$0, _status_label
	cmpb	$0, _MnmFilePath
	je	LBB269_64
# %bb.61:
	calll	_Project_Load
	movl	_indicate+164, %eax
	movb	$1, (%eax)
	calll	_Retain_Load
	calll	_Logic_Swap
	calll	_Variable_Swap
	cmpb	$0, _bPrintMode
	je	LBB269_63
# %bb.62:
	calll	_Status_DetailDisplay
LBB269_63:
	calll	_Retain_Save
	calll	_Variable_Reset_All
	calll	*__imp__EgTagSetDefaultValue
	calll	_Retain_Load
	calll	_PLCcontrol_Start
LBB269_64:
	movzwl	_hExitEvent, %eax
	pushl	$-1
	pushl	$1
	pushl	%eax
	calll	_WaitForRtSemaphore
	addl	$12, %esp
	calll	_PLCcontrol_Stop
	pushl	$100
	calll	_RtSleep
	addl	$4, %esp
	movzwl	_hRootProcess, %eax
	pushl	$_BaseName
	pushl	%eax
	calll	_UncatalogRtHandle
	addl	$8, %esp
	pushl	$3
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movzwl	%ax, %eax
	pushl	$_catalogProc
	pushl	%eax
	calll	_UncatalogRtHandle
	addl	$8, %esp
	movl	_indicate+134, %eax
	movb	$0, (%eax)
	movl	_indicate+164, %eax
	movb	$0, (%eax)
	movl	_indicate+194, %eax
	movb	$0, (%eax)
	movl	_indicate+224, %eax
	movb	$0, (%eax)
	movl	_indicate+254, %eax
	movb	$0, (%eax)
	movl	_indicate+284, %eax
	movb	$0, (%eax)
	calll	*__imp__EgFinalize
	xorl	%eax, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB269_65:
	pushl	$0
	calll	_exit
                                        # -- End function
	.def	_MD5Init;
	.scl	2;
	.type	32;
	.endef
	.globl	_MD5Init                        # -- Begin function MD5Init
	.p2align	4
_MD5Init:                               # @MD5Init
# %bb.0:
	movl	4(%esp), %eax
	movl	$0, 20(%eax)
	movl	$0, 16(%eax)
	movaps	__xmm@1032547698badcfeefcdab8967452301, %xmm0 # xmm0 = [1732584193,4023233417,2562383102,271733878]
	movups	%xmm0, (%eax)
	retl
                                        # -- End function
	.def	_MD5Update;
	.scl	2;
	.type	32;
	.endef
	.globl	_MD5Update                      # -- Begin function MD5Update
	.p2align	4
_MD5Update:                             # @MD5Update
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	%eax
	movl	32(%esp), %ebp
	movl	28(%esp), %ebx
	movl	24(%esp), %esi
	movl	16(%esi), %eax
	movl	%eax, %edi
	shrl	$3, %edi
	andl	$63, %edi
	leal	(,%ebp,8), %ecx
	movl	%ebp, %edx
	shrl	$29, %edx
	addl	%eax, %ecx
	movl	%ecx, 16(%esi)
	movl	%edi, %ecx
	adcl	%edx, 20(%esi)
	movl	$64, %edi
	subl	%ecx, %edi
	xorl	%eax, %eax
	cmpl	%edi, %ebp
	jb	LBB271_5
# %bb.1:
	leal	(%esi,%ecx), %eax
	addl	$24, %eax
	pushl	%edi
	pushl	%ebx
	pushl	%eax
	movl	%ecx, 12(%esp)                  # 4-byte Spill
	calll	_memcpy
	addl	$12, %esp
	movl	%esi, %ecx
	leal	24(%esi), %edx
	calll	_MD5Transform
	movl	(%esp), %eax                    # 4-byte Reload
	xorl	$127, %eax
	xorl	%ecx, %ecx
	cmpl	%ebp, %eax
	jae	LBB271_2
	.p2align	4
LBB271_3:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	%edi, %esi
	leal	(%ebx,%edi), %edx
	movl	24(%esp), %ecx
	calll	_MD5Transform
	addl	$64, %edi
	addl	$127, %esi
	cmpl	%ebp, %esi
	jb	LBB271_3
# %bb.4:
	movl	%edi, %eax
	movl	24(%esp), %esi
	xorl	%ecx, %ecx
	jmp	LBB271_5
LBB271_2:
	movl	%edi, %eax
LBB271_5:                               # %.loopexit
	subl	%eax, %ebp
	addl	%eax, %ebx
	leal	(%esi,%ecx), %eax
	addl	$24, %eax
	pushl	%ebp
	pushl	%ebx
	pushl	%eax
	calll	_memcpy
	addl	$16, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_MD5Transform;
	.scl	3;
	.type	32;
	.endef
	.p2align	4                               # -- Begin function MD5Transform
_MD5Transform:                          # @MD5Transform
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$88, %esp
	movl	%edx, %ebp
	movl	%edx, (%esp)                    # 4-byte Spill
	movl	%ecx, 84(%esp)                  # 4-byte Spill
	movl	(%ecx), %ebx
	movl	%ebx, 80(%esp)                  # 4-byte Spill
	movl	4(%ecx), %esi
	movl	8(%ecx), %eax
	movl	%eax, 52(%esp)                  # 4-byte Spill
	movl	12(%ecx), %edi
	xorl	%edi, %eax
	andl	%esi, %eax
	xorl	%edi, %eax
	movl	%edi, 76(%esp)                  # 4-byte Spill
	movl	(%edx), %ecx
	movl	%ecx, 28(%esp)                  # 4-byte Spill
	addl	%ebx, %ecx
	addl	%eax, %ecx
	addl	$-680876936, %ecx               # imm = 0xD76AA478
	roll	$7, %ecx
	addl	%esi, %ecx
	movl	%esi, %eax
	movl	%esi, %ebx
	movl	52(%esp), %edx                  # 4-byte Reload
	xorl	%edx, %eax
	andl	%ecx, %eax
	xorl	%edx, %eax
	movl	4(%ebp), %edx
	movl	%edx, 48(%esp)                  # 4-byte Spill
	addl	%edi, %edx
	leal	(%eax,%edx), %esi
	addl	$-389564586, %esi               # imm = 0xE8C7B756
	roll	$12, %esi
	addl	%ecx, %esi
	movl	%ecx, %eax
	movl	%ebx, %ebp
	xorl	%ebx, %eax
	andl	%esi, %eax
	xorl	%ebx, %eax
	movl	%ebx, 72(%esp)                  # 4-byte Spill
	movl	(%esp), %ebx                    # 4-byte Reload
	movl	8(%ebx), %edx
	movl	%edx, 60(%esp)                  # 4-byte Spill
	movl	52(%esp), %edi                  # 4-byte Reload
	addl	%edi, %edx
	addl	%eax, %edx
	addl	$606105819, %edx                # imm = 0x242070DB
	roll	$17, %edx
	addl	%esi, %edx
	movl	%esi, %eax
	xorl	%ecx, %eax
	andl	%edx, %eax
	xorl	%ecx, %eax
	movl	12(%ebx), %edi
	movl	%edi, 16(%esp)                  # 4-byte Spill
	leal	(%edi,%ebp), %ebx
	addl	%ebx, %eax
	addl	$-1044525330, %eax              # imm = 0xC1BDCEEE
	roll	$22, %eax
	addl	%edx, %eax
	movl	%edx, %ebx
	xorl	%esi, %ebx
	andl	%eax, %ebx
	xorl	%esi, %ebx
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	16(%ebp), %edi
	movl	%edi, 4(%esp)                   # 4-byte Spill
	addl	%edi, %ecx
	addl	%ebx, %ecx
	addl	$-176418897, %ecx               # imm = 0xF57C0FAF
	roll	$7, %ecx
	addl	%eax, %ecx
	movl	%eax, %ebx
	xorl	%edx, %ebx
	andl	%ecx, %ebx
	xorl	%edx, %ebx
	movl	20(%ebp), %edi
	movl	%edi, 40(%esp)                  # 4-byte Spill
	addl	%edi, %esi
	addl	%esi, %ebx
	addl	$1200080426, %ebx               # imm = 0x4787C62A
	roll	$12, %ebx
	addl	%ecx, %ebx
	movl	%ecx, %esi
	xorl	%eax, %esi
	andl	%ebx, %esi
	xorl	%eax, %esi
	movl	24(%ebp), %edi
	movl	%edi, 12(%esp)                  # 4-byte Spill
	addl	%edi, %edx
	addl	%esi, %edx
	addl	$-1473231341, %edx              # imm = 0xA8304613
	roll	$17, %edx
	addl	%ebx, %edx
	movl	%ebx, %esi
	xorl	%ecx, %esi
	andl	%edx, %esi
	xorl	%ecx, %esi
	movl	28(%ebp), %edi
	movl	%edi, 20(%esp)                  # 4-byte Spill
	addl	%edi, %eax
	addl	%esi, %eax
	addl	$-45705983, %eax                # imm = 0xFD469501
	roll	$22, %eax
	addl	%edx, %eax
	movl	%edx, %esi
	xorl	%ebx, %esi
	andl	%eax, %esi
	xorl	%ebx, %esi
	movl	32(%ebp), %edi
	movl	%edi, 56(%esp)                  # 4-byte Spill
	addl	%edi, %ecx
	addl	%esi, %ecx
	addl	$1770035416, %ecx               # imm = 0x698098D8
	roll	$7, %ecx
	addl	%eax, %ecx
	movl	%eax, %esi
	xorl	%edx, %esi
	andl	%ecx, %esi
	xorl	%edx, %esi
	movl	36(%ebp), %edi
	movl	%edi, 8(%esp)                   # 4-byte Spill
	addl	%edi, %ebx
	addl	%ebx, %esi
	addl	$-1958414417, %esi              # imm = 0x8B44F7AF
	roll	$12, %esi
	addl	%ecx, %esi
	movl	%ecx, %ebx
	xorl	%eax, %ebx
	andl	%esi, %ebx
	xorl	%eax, %ebx
	movl	40(%ebp), %edi
	movl	%edi, 32(%esp)                  # 4-byte Spill
	addl	%edi, %edx
	addl	%edx, %ebx
	addl	$-42063, %ebx                   # imm = 0xFFFF5BB1
	roll	$17, %ebx
	addl	%esi, %ebx
	movl	%esi, %edx
	xorl	%ecx, %edx
	andl	%ebx, %edx
	xorl	%ecx, %edx
	movl	44(%ebp), %edi
	movl	%edi, 44(%esp)                  # 4-byte Spill
	addl	%edi, %eax
	addl	%edx, %eax
	addl	$-1990404162, %eax              # imm = 0x895CD7BE
	roll	$22, %eax
	addl	%ebx, %eax
	movl	%ebx, %edx
	xorl	%esi, %edx
	andl	%eax, %edx
	xorl	%esi, %edx
	movl	48(%ebp), %edi
	movl	%edi, 64(%esp)                  # 4-byte Spill
	addl	%edi, %ecx
	addl	%edx, %ecx
	addl	$1804603682, %ecx               # imm = 0x6B901122
	roll	$7, %ecx
	addl	%eax, %ecx
	movl	%eax, %edx
	xorl	%ebx, %edx
	andl	%ecx, %edx
	xorl	%ebx, %edx
	movl	52(%ebp), %edi
	movl	%edi, 36(%esp)                  # 4-byte Spill
	addl	%edi, %esi
	addl	%edx, %esi
	addl	$-40341101, %esi                # imm = 0xFD987193
	roll	$12, %esi
	addl	%ecx, %esi
	movl	%esi, %edi
	andl	%ecx, %edi
	movl	%esi, %edx
	notl	%edx
	movl	(%esp), %ebp                    # 4-byte Reload
	movl	60(%ebp), %ebp
	movl	%ebp, 24(%esp)                  # 4-byte Spill
	addl	%eax, %ebp
	movl	%ebp, 68(%esp)                  # 4-byte Spill
	andl	%edx, %eax
	orl	%edi, %eax
	movl	(%esp), %edi                    # 4-byte Reload
	movl	56(%edi), %edi
	movl	%edi, (%esp)                    # 4-byte Spill
	addl	%edi, %ebx
	addl	%ebx, %eax
	addl	$-1502002290, %eax              # imm = 0xA679438E
	roll	$17, %eax
	addl	%esi, %eax
	movl	%eax, %ebp
	andl	%esi, %ebp
	movl	%eax, %ebx
	notl	%ebx
	movl	48(%esp), %edi                  # 4-byte Reload
	addl	%ecx, %edi
	andl	%ebx, %ecx
	orl	%ebp, %ecx
	movl	68(%esp), %ebp                  # 4-byte Reload
	addl	%ebp, %ecx
	addl	$1236535329, %ecx               # imm = 0x49B40821
	roll	$22, %ecx
	addl	%eax, %ecx
	movl	%ecx, %ebp
	andl	%esi, %ebp
	andl	%eax, %edx
	orl	%ebp, %edx
	addl	%edx, %edi
	addl	$-165796510, %edi               # imm = 0xF61E2562
	roll	$5, %edi
	addl	%ecx, %edi
	movl	%edi, %edx
	andl	%eax, %edx
	andl	%ecx, %ebx
	orl	%edx, %ebx
	addl	12(%esp), %esi                  # 4-byte Folded Reload
	addl	%ebx, %esi
	addl	$-1069501632, %esi              # imm = 0xC040B340
	roll	$9, %esi
	addl	%edi, %esi
	movl	%esi, %edx
	xorl	%edi, %edx
	andl	%ecx, %edx
	xorl	%edi, %edx
	addl	44(%esp), %eax                  # 4-byte Folded Reload
	leal	(%edx,%eax), %ebx
	addl	$643717713, %ebx                # imm = 0x265E5A51
	roll	$14, %ebx
	addl	%esi, %ebx
	movl	%ebx, %eax
	xorl	%esi, %eax
	andl	%edi, %eax
	xorl	%esi, %eax
	addl	28(%esp), %ecx                  # 4-byte Folded Reload
	addl	%ecx, %eax
	addl	$-373897302, %eax               # imm = 0xE9B6C7AA
	roll	$20, %eax
	addl	%ebx, %eax
	movl	%eax, %ecx
	xorl	%ebx, %ecx
	andl	%esi, %ecx
	xorl	%ebx, %ecx
	addl	40(%esp), %edi                  # 4-byte Folded Reload
	addl	%ecx, %edi
	addl	$-701558691, %edi               # imm = 0xD62F105D
	roll	$5, %edi
	addl	%eax, %edi
	movl	%edi, %ecx
	xorl	%eax, %ecx
	andl	%ebx, %ecx
	xorl	%eax, %ecx
	addl	32(%esp), %esi                  # 4-byte Folded Reload
	addl	%ecx, %esi
	addl	$38016083, %esi                 # imm = 0x2441453
	roll	$9, %esi
	addl	%edi, %esi
	movl	%esi, %ecx
	xorl	%edi, %ecx
	andl	%eax, %ecx
	xorl	%edi, %ecx
	addl	24(%esp), %ebx                  # 4-byte Folded Reload
	addl	%ecx, %ebx
	addl	$-660478335, %ebx               # imm = 0xD8A1E681
	roll	$14, %ebx
	addl	%esi, %ebx
	movl	%ebx, %ecx
	xorl	%esi, %ecx
	andl	%edi, %ecx
	xorl	%esi, %ecx
	addl	4(%esp), %eax                   # 4-byte Folded Reload
	addl	%ecx, %eax
	addl	$-405537848, %eax               # imm = 0xE7D3FBC8
	roll	$20, %eax
	addl	%ebx, %eax
	movl	%eax, %ecx
	xorl	%ebx, %ecx
	andl	%esi, %ecx
	xorl	%ebx, %ecx
	addl	8(%esp), %edi                   # 4-byte Folded Reload
	addl	%ecx, %edi
	addl	$568446438, %edi                # imm = 0x21E1CDE6
	roll	$5, %edi
	addl	%eax, %edi
	movl	%edi, %ecx
	xorl	%eax, %ecx
	andl	%ebx, %ecx
	xorl	%eax, %ecx
	addl	(%esp), %esi                    # 4-byte Folded Reload
	addl	%ecx, %esi
	addl	$-1019803690, %esi              # imm = 0xC33707D6
	roll	$9, %esi
	addl	%edi, %esi
	movl	%esi, %ecx
	xorl	%edi, %ecx
	andl	%eax, %ecx
	xorl	%edi, %ecx
	addl	16(%esp), %ebx                  # 4-byte Folded Reload
	addl	%ecx, %ebx
	addl	$-187363961, %ebx               # imm = 0xF4D50D87
	roll	$14, %ebx
	addl	%esi, %ebx
	movl	%ebx, %ecx
	xorl	%esi, %ecx
	andl	%edi, %ecx
	xorl	%esi, %ecx
	movl	56(%esp), %ebp                  # 4-byte Reload
	addl	%ebp, %eax
	addl	%ecx, %eax
	addl	$1163531501, %eax               # imm = 0x455A14ED
	roll	$20, %eax
	addl	%ebx, %eax
	movl	%eax, %ecx
	xorl	%ebx, %ecx
	andl	%esi, %ecx
	xorl	%ebx, %ecx
	addl	36(%esp), %edi                  # 4-byte Folded Reload
	addl	%edi, %ecx
	addl	$-1444681467, %ecx              # imm = 0xA9E3E905
	roll	$5, %ecx
	addl	%eax, %ecx
	movl	%ecx, %edx
	xorl	%eax, %edx
	andl	%ebx, %edx
	xorl	%eax, %edx
	addl	60(%esp), %esi                  # 4-byte Folded Reload
	addl	%edx, %esi
	addl	$-51403784, %esi                # imm = 0xFCEFA3F8
	roll	$9, %esi
	addl	%ecx, %esi
	movl	%esi, %edx
	xorl	%ecx, %edx
	andl	%eax, %edx
	xorl	%ecx, %edx
	addl	20(%esp), %ebx                  # 4-byte Folded Reload
	leal	(%edx,%ebx), %edi
	addl	$1735328473, %edi               # imm = 0x676F02D9
	roll	$14, %edi
	addl	%esi, %edi
	movl	%edi, %edx
	xorl	%esi, %edx
	andl	%ecx, %edx
	xorl	%esi, %edx
	addl	64(%esp), %eax                  # 4-byte Folded Reload
	addl	%edx, %eax
	addl	$-1926607734, %eax              # imm = 0x8D2A4C8A
	roll	$20, %eax
	addl	%edi, %eax
	movl	%eax, %edx
	xorl	%edi, %edx
	movl	%edx, %ebx
	xorl	%esi, %ebx
	addl	40(%esp), %ecx                  # 4-byte Folded Reload
	addl	%ebx, %ecx
	addl	$-378558, %ecx                  # imm = 0xFFFA3942
	roll	$4, %ecx
	addl	%eax, %ecx
	xorl	%ecx, %edx
	addl	%ebp, %esi
	addl	%edx, %esi
	addl	$-2022574463, %esi              # imm = 0x8771F681
	roll	$11, %esi
	addl	%ecx, %esi
	movl	%esi, %edx
	xorl	%ecx, %edx
	movl	%edx, %ebx
	xorl	%eax, %ebx
	addl	44(%esp), %edi                  # 4-byte Folded Reload
	addl	%ebx, %edi
	addl	$1839030562, %edi               # imm = 0x6D9D6122
	roll	$16, %edi
	addl	%esi, %edi
	xorl	%edi, %edx
	addl	(%esp), %eax                    # 4-byte Folded Reload
	addl	%edx, %eax
	addl	$-35309556, %eax                # imm = 0xFDE5380C
	roll	$23, %eax
	addl	%edi, %eax
	movl	%edi, %edx
	xorl	%esi, %edx
	xorl	%eax, %edx
	addl	48(%esp), %ecx                  # 4-byte Folded Reload
	addl	%edx, %ecx
	addl	$-1530992060, %ecx              # imm = 0xA4BEEA44
	roll	$4, %ecx
	addl	%eax, %ecx
	movl	%eax, %edx
	xorl	%edi, %edx
	xorl	%ecx, %edx
	addl	4(%esp), %esi                   # 4-byte Folded Reload
	addl	%edx, %esi
	addl	$1272893353, %esi               # imm = 0x4BDECFA9
	roll	$11, %esi
	addl	%ecx, %esi
	movl	%ecx, %edx
	xorl	%eax, %edx
	xorl	%esi, %edx
	addl	20(%esp), %edi                  # 4-byte Folded Reload
	addl	%edx, %edi
	addl	$-155497632, %edi               # imm = 0xF6BB4B60
	roll	$16, %edi
	addl	%esi, %edi
	movl	%esi, %edx
	xorl	%ecx, %edx
	xorl	%edi, %edx
	addl	32(%esp), %eax                  # 4-byte Folded Reload
	addl	%edx, %eax
	addl	$-1094730640, %eax              # imm = 0xBEBFBC70
	roll	$23, %eax
	addl	%edi, %eax
	movl	%edi, %edx
	xorl	%esi, %edx
	xorl	%eax, %edx
	addl	36(%esp), %ecx                  # 4-byte Folded Reload
	addl	%edx, %ecx
	addl	$681279174, %ecx                # imm = 0x289B7EC6
	roll	$4, %ecx
	addl	%eax, %ecx
	movl	%eax, %edx
	xorl	%edi, %edx
	xorl	%ecx, %edx
	addl	28(%esp), %esi                  # 4-byte Folded Reload
	leal	(%edx,%esi), %ebx
	addl	$-358537222, %ebx               # imm = 0xEAA127FA
	roll	$11, %ebx
	addl	%ecx, %ebx
	movl	%ecx, %edx
	xorl	%eax, %edx
	xorl	%ebx, %edx
	addl	16(%esp), %edi                  # 4-byte Folded Reload
	addl	%edx, %edi
	addl	$-722521979, %edi               # imm = 0xD4EF3085
	roll	$16, %edi
	addl	%ebx, %edi
	movl	%ebx, %edx
	xorl	%ecx, %edx
	xorl	%edi, %edx
	addl	12(%esp), %eax                  # 4-byte Folded Reload
	addl	%edx, %eax
	addl	$76029189, %eax                 # imm = 0x4881D05
	roll	$23, %eax
	addl	%edi, %eax
	movl	%edi, %edx
	xorl	%ebx, %edx
	xorl	%eax, %edx
	addl	8(%esp), %ecx                   # 4-byte Folded Reload
	leal	(%edx,%ecx), %esi
	addl	$-640364487, %esi               # imm = 0xD9D4D039
	roll	$4, %esi
	addl	%eax, %esi
	movl	%eax, %ecx
	xorl	%edi, %ecx
	xorl	%esi, %ecx
	movl	64(%esp), %ebp                  # 4-byte Reload
	addl	%ebp, %ebx
	addl	%ecx, %ebx
	addl	$-421815835, %ebx               # imm = 0xE6DB99E5
	roll	$11, %ebx
	addl	%esi, %ebx
	movl	%esi, %ecx
	xorl	%eax, %ecx
	xorl	%ebx, %ecx
	addl	24(%esp), %edi                  # 4-byte Folded Reload
	addl	%edi, %ecx
	addl	$530742520, %ecx                # imm = 0x1FA27CF8
	roll	$16, %ecx
	addl	%ebx, %ecx
	movl	%ebx, %edx
	xorl	%esi, %edx
	xorl	%ecx, %edx
	movl	60(%esp), %edi                  # 4-byte Reload
	addl	%edi, %eax
	addl	%edx, %eax
	addl	$-995338651, %eax               # imm = 0xC4AC5665
	addl	28(%esp), %esi                  # 4-byte Folded Reload
	roll	$23, %eax
	addl	%ecx, %eax
	movl	20(%esp), %edx                  # 4-byte Reload
	addl	%ebx, %edx
	notl	%ebx
	orl	%eax, %ebx
	xorl	%ecx, %ebx
	addl	%ebx, %esi
	addl	$-198630844, %esi               # imm = 0xF4292244
	roll	$6, %esi
	addl	%eax, %esi
	movl	(%esp), %ebx                    # 4-byte Reload
	addl	%ecx, %ebx
	notl	%ecx
	orl	%esi, %ecx
	xorl	%eax, %ecx
	addl	%edx, %ecx
	addl	$1126891415, %ecx               # imm = 0x432AFF97
	roll	$10, %ecx
	addl	%esi, %ecx
	movl	40(%esp), %edx                  # 4-byte Reload
	addl	%eax, %edx
	notl	%eax
	orl	%ecx, %eax
	xorl	%esi, %eax
	addl	%ebx, %eax
	addl	$-1416354905, %eax              # imm = 0xAB9423A7
	roll	$15, %eax
	addl	%ecx, %eax
	addl	%esi, %ebp
	notl	%esi
	orl	%eax, %esi
	xorl	%ecx, %esi
	addl	%esi, %edx
	addl	$-57434055, %edx                # imm = 0xFC93A039
	roll	$21, %edx
	addl	%eax, %edx
	movl	16(%esp), %esi                  # 4-byte Reload
	addl	%ecx, %esi
	notl	%ecx
	orl	%edx, %ecx
	xorl	%eax, %ecx
	addl	%ebp, %ecx
	addl	$1700485571, %ecx               # imm = 0x655B59C3
	roll	$6, %ecx
	addl	%edx, %ecx
	movl	32(%esp), %ebx                  # 4-byte Reload
	addl	%eax, %ebx
	notl	%eax
	orl	%ecx, %eax
	xorl	%edx, %eax
	addl	%esi, %eax
	addl	$-1894986606, %eax              # imm = 0x8F0CCC92
	roll	$10, %eax
	addl	%ecx, %eax
	movl	48(%esp), %esi                  # 4-byte Reload
	addl	%edx, %esi
	notl	%edx
	orl	%eax, %edx
	xorl	%ecx, %edx
	addl	%ebx, %edx
	addl	$-1051523, %edx                 # imm = 0xFFEFF47D
	roll	$15, %edx
	addl	%eax, %edx
	movl	56(%esp), %ebx                  # 4-byte Reload
	addl	%ecx, %ebx
	notl	%ecx
	orl	%edx, %ecx
	xorl	%eax, %ecx
	addl	%esi, %ecx
	addl	$-2054922799, %ecx              # imm = 0x85845DD1
	roll	$21, %ecx
	addl	%edx, %ecx
	movl	24(%esp), %ebp                  # 4-byte Reload
	addl	%eax, %ebp
	notl	%eax
	orl	%ecx, %eax
	xorl	%edx, %eax
	addl	%ebx, %eax
	addl	$1873313359, %eax               # imm = 0x6FA87E4F
	roll	$6, %eax
	addl	%ecx, %eax
	movl	12(%esp), %esi                  # 4-byte Reload
	addl	%edx, %esi
	notl	%edx
	orl	%eax, %edx
	xorl	%ecx, %edx
	addl	%ebp, %edx
	addl	$-30611744, %edx                # imm = 0xFE2CE6E0
	roll	$10, %edx
	addl	%eax, %edx
	movl	36(%esp), %ebp                  # 4-byte Reload
	addl	%ecx, %ebp
	notl	%ecx
	orl	%edx, %ecx
	xorl	%eax, %ecx
	addl	%esi, %ecx
	addl	$-1560198380, %ecx              # imm = 0xA3014314
	roll	$15, %ecx
	addl	%edx, %ecx
	movl	4(%esp), %ebx                   # 4-byte Reload
	addl	%eax, %ebx
	notl	%eax
	orl	%ecx, %eax
	xorl	%edx, %eax
	leal	(%eax,%ebp), %esi
	addl	$1309151649, %esi               # imm = 0x4E0811A1
	roll	$21, %esi
	addl	%ecx, %esi
	movl	44(%esp), %ebp                  # 4-byte Reload
	addl	%edx, %ebp
	notl	%edx
	orl	%esi, %edx
	xorl	%ecx, %edx
	leal	(%edx,%ebx), %eax
	addl	$-145523070, %eax               # imm = 0xF7537E82
	roll	$6, %eax
	addl	%esi, %eax
	movl	%edi, %edx
	addl	%ecx, %edx
	notl	%ecx
	orl	%eax, %ecx
	xorl	%esi, %ecx
	addl	%ebp, %ecx
	addl	$-1120210379, %ecx              # imm = 0xBD3AF235
	roll	$10, %ecx
	addl	%eax, %ecx
	movl	8(%esp), %edi                   # 4-byte Reload
	addl	%esi, %edi
	notl	%esi
	orl	%ecx, %esi
	xorl	%eax, %esi
	addl	%esi, %edx
	addl	$718787259, %edx                # imm = 0x2AD7D2BB
	roll	$15, %edx
	addl	%ecx, %edx
	movl	%eax, %esi
	notl	%esi
	orl	%edx, %esi
	xorl	%ecx, %esi
	addl	%edi, %esi
	addl	$-343485551, %esi               # imm = 0xEB86D391
	addl	80(%esp), %eax                  # 4-byte Folded Reload
	roll	$21, %esi
	movl	84(%esp), %edi                  # 4-byte Reload
	movl	%eax, (%edi)
	movl	72(%esp), %eax                  # 4-byte Reload
	addl	%edx, %eax
	addl	%esi, %eax
	movl	%eax, 4(%edi)
	addl	52(%esp), %edx                  # 4-byte Folded Reload
	movl	%edx, 8(%edi)
	addl	76(%esp), %ecx                  # 4-byte Folded Reload
	movl	%ecx, 12(%edi)
	addl	$88, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_MD5Final;
	.scl	2;
	.type	32;
	.endef
	.globl	_MD5Final                       # -- Begin function MD5Final
	.p2align	4
_MD5Final:                              # @MD5Final
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$12, %esp
	movl	36(%esp), %esi
	movl	16(%esi), %ecx
	movl	20(%esi), %eax
	movl	%eax, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%ecx, %edi
	shrl	$3, %edi
	andl	$63, %edi
	xorl	%ebx, %ebx
	cmpl	$56, %edi
	setae	%bl
	shll	$6, %ebx
	orl	$56, %ebx
	subl	%edi, %ebx
	leal	(,%ebx,8), %edx
	movl	%ebx, %ebp
	shrl	$29, %ebp
	addl	%ecx, %edx
	movl	%edi, %ecx
	movl	%edx, 16(%esi)
	adcl	%eax, %ebp
	movl	%ebp, 20(%esi)
	movl	%esi, %ebp
	movl	$64, %esi
	subl	%edi, %esi
	xorl	%edi, %edi
	cmpl	%esi, %ebx
	jae	LBB273_2
# %bb.1:
	xorl	%esi, %esi
	jmp	LBB273_6
LBB273_2:
	leal	(%ecx,%ebp), %eax
	addl	$24, %eax
	pushl	%esi
	pushl	$_PADDING
	pushl	%eax
	movl	%ecx, 12(%esp)                  # 4-byte Spill
	calll	_memcpy
	addl	$12, %esp
	movl	%ebp, %ecx
	leal	24(%ebp), %edx
	calll	_MD5Transform
	movl	(%esp), %eax                    # 4-byte Reload
	xorl	$127, %eax
	xorl	%ecx, %ecx
	cmpl	%ebx, %eax
	jae	LBB273_6
# %bb.3:                                # %.preheader.preheader
	movl	%ebp, %edi
	.p2align	4
LBB273_4:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	%esi, %ebp
	leal	_PADDING(%esi), %edx
	movl	%edi, %ecx
	calll	_MD5Transform
	addl	$64, %esi
	addl	$127, %ebp
	cmpl	%ebx, %ebp
	jb	LBB273_4
# %bb.5:
	movl	%edi, %ebp
	xorl	%edi, %edi
	xorl	%ecx, %ecx
LBB273_6:                               # %.loopexit
	subl	%esi, %ebx
	leal	_PADDING(%esi), %eax
	leal	24(%ebp), %esi
	addl	%ebp, %ecx
	addl	$24, %ecx
	pushl	%ebx
	pushl	%eax
	pushl	%ecx
	calll	_memcpy
	addl	$12, %esp
	movl	16(%ebp), %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	andl	$63, %eax
	subl	$-64, %ecx
	movl	%ecx, 16(%ebp)
	sbbl	$-1, 20(%ebp)
	cmpl	$56, %eax
	jb	LBB273_8
# %bb.7:
	movl	$64, %edi
	subl	%eax, %edi
	addl	%esi, %eax
	leal	4(%esp), %ecx
	pushl	%edi
	pushl	%ecx
	pushl	%eax
	calll	_memcpy
	addl	$12, %esp
	movl	%ebp, %ecx
	movl	%esi, %edx
	calll	_MD5Transform
	xorl	%eax, %eax
LBB273_8:
	movl	$8, %ecx
	subl	%edi, %ecx
	leal	(%esp,%edi), %edx
	addl	$4, %edx
	addl	%eax, %esi
	pushl	%ecx
	pushl	%edx
	pushl	%esi
	calll	_memcpy
	addl	$12, %esp
	movzbl	(%ebp), %eax
	movl	32(%esp), %ecx
	movb	%al, (%ecx)
	movzbl	1(%ebp), %eax
	movb	%al, 1(%ecx)
	movzbl	2(%ebp), %eax
	movb	%al, 2(%ecx)
	movzbl	3(%ebp), %eax
	movb	%al, 3(%ecx)
	movzbl	4(%ebp), %eax
	movb	%al, 4(%ecx)
	movzbl	5(%ebp), %eax
	movb	%al, 5(%ecx)
	movzbl	6(%ebp), %eax
	movb	%al, 6(%ecx)
	movzbl	7(%ebp), %eax
	movb	%al, 7(%ecx)
	movzbl	8(%ebp), %eax
	movb	%al, 8(%ecx)
	movzbl	9(%ebp), %eax
	movb	%al, 9(%ecx)
	movzbl	10(%ebp), %eax
	movb	%al, 10(%ecx)
	movzbl	11(%ebp), %eax
	movb	%al, 11(%ecx)
	movzbl	12(%ebp), %eax
	movb	%al, 12(%ecx)
	movzbl	13(%ebp), %eax
	movb	%al, 13(%ecx)
	movzbl	14(%ebp), %eax
	movb	%al, 14(%ecx)
	movzbl	15(%ebp), %eax
	movb	%al, 15(%ecx)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, 80(%ebp)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 64(%ebp)
	movups	%xmm0, 48(%ebp)
	movups	%xmm0, 32(%ebp)
	movups	%xmm0, 16(%ebp)
	movups	%xmm0, (%ebp)
	addl	$12, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_MnmFile_Open;
	.scl	2;
	.type	32;
	.endef
	.globl	_MnmFile_Open                   # -- Begin function MnmFile_Open
	.p2align	4
_MnmFile_Open:                          # @MnmFile_Open
# %bb.0:
	movl	4(%esp), %eax
	movl	$0, _commentnest
	pushl	$"??_C@_02BMJICGCB@rt?$AA@"
	pushl	%eax
	calll	_fopen
	addl	$8, %esp
	movl	%eax, _MnmFile_Open.fp
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
	je	LBB275_2
# %bb.1:
	pushl	%eax
	calll	_fclose
	addl	$4, %esp
	movl	$2, _status_mnmfile
LBB275_2:
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
	je	LBB276_2
# %bb.1:
	pushl	%eax
	pushl	16(%esp)
	pushl	16(%esp)
	calll	_fgets
	addl	$12, %esp
	retl
LBB276_2:
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
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	16(%esp), %esi
	cmpb	$59, (%esi)
	jne	LBB277_2
# %bb.1:
	movb	$0, (%esi)
	jmp	LBB277_26
LBB277_2:
	pushl	$10
	pushl	%esi
	calll	_strchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB277_4
# %bb.3:
	movb	$0, (%eax)
LBB277_4:                               # %.preheader
	xorl	%eax, %eax
	movl	%esi, %edi
	xorl	%ecx, %ecx
	jmp	LBB277_5
	.p2align	4
LBB277_10:                              #   in Loop: Header=BB277_5 Depth=1
	cmpb	$41, (%edi)
	je	LBB277_11
LBB277_5:                               # =>This Inner Loop Header: Depth=1
	incl	%edi
	movzbl	-1(%edi), %edx
	cmpl	$40, %edx
	je	LBB277_12
# %bb.6:                                #   in Loop: Header=BB277_5 Depth=1
	cmpl	$42, %edx
	je	LBB277_10
# %bb.7:                                #   in Loop: Header=BB277_5 Depth=1
	testl	%edx, %edx
	jne	LBB277_5
	jmp	LBB277_8
	.p2align	4
LBB277_12:                              #   in Loop: Header=BB277_5 Depth=1
	cmpb	$42, (%edi)
	jne	LBB277_5
# %bb.13:                               #   in Loop: Header=BB277_5 Depth=1
	movl	_commentnest, %edx
	leal	1(%edx), %ebx
	movl	%ebx, _commentnest
	leal	-1(%edi), %ebx
	testl	%edx, %edx
	cmovel	%ebx, %ecx
	jmp	LBB277_14
LBB277_11:                              #   in Loop: Header=BB277_5 Depth=1
	decl	_commentnest
	cmovel	%edi, %eax
LBB277_14:                              #   in Loop: Header=BB277_5 Depth=1
	incl	%edi
	testl	%ecx, %ecx
	je	LBB277_5
# %bb.15:                               #   in Loop: Header=BB277_5 Depth=1
	testl	%eax, %eax
	je	LBB277_5
# %bb.16:                               #   in Loop: Header=BB277_5 Depth=1
	subl	%ecx, %eax
	incl	%eax
	pushl	%eax
	pushl	$32
	pushl	%ecx
	calll	_memset
	addl	$12, %esp
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	jmp	LBB277_5
LBB277_8:
	testl	%ecx, %ecx
	je	LBB277_17
# %bb.9:
	movb	$0, (%ecx)
	jmp	LBB277_21
LBB277_17:
	testl	%eax, %eax
	je	LBB277_19
# %bb.18:
	subl	%esi, %eax
	incl	%eax
	pushl	%eax
	pushl	$32
	pushl	%esi
	calll	_memset
	addl	$12, %esp
	jmp	LBB277_21
LBB277_19:
	cmpl	$0, _commentnest
	jle	LBB277_21
# %bb.20:
	movb	$0, (%esi)
LBB277_21:                              # %Comment_ProcessBracket.exit.preheader
	xorl	%eax, %eax
	movl	$8388627, %ecx                  # imm = 0x800013
	.p2align	4
LBB277_22:                              # %Comment_ProcessBracket.exit
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%esi,%eax), %edx
	addl	$-9, %edx
	cmpl	$23, %edx
	ja	LBB277_24
# %bb.23:                               # %Comment_ProcessBracket.exit
                                        #   in Loop: Header=BB277_22 Depth=1
	btl	%edx, %ecx
	jae	LBB277_24
# %bb.27:                               #   in Loop: Header=BB277_22 Depth=1
	incl	%eax
	jmp	LBB277_22
LBB277_24:
	testl	%eax, %eax
	je	LBB277_26
# %bb.25:
	addl	%esi, %eax
	pushl	%eax
	pushl	%esi
	calll	_strcpy
	addl	$8, %esp
LBB277_26:
	popl	%esi
	popl	%edi
	popl	%ebx
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
	je	LBB278_13
# %bb.1:                                # %.preheader.preheader
	movl	$0, (%esp)                      # 4-byte Folded Spill
	movl	%eax, %ecx
	xorl	%ebx, %ebx
	.p2align	4
LBB278_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%eax), %edx
	movl	%edx, %esi
	addl	$-2, %esi
	cmpl	$30, %esi
	ja	LBB278_11
# %bb.3:                                # %.preheader
                                        #   in Loop: Header=BB278_2 Depth=1
	jmpl	*LJTI278_0(,%esi,4)
LBB278_4:                               #   in Loop: Header=BB278_2 Depth=1
	testb	%bl, %bl
	je	LBB278_7
LBB278_6:                               #   in Loop: Header=BB278_2 Depth=1
	movb	$1, %bl
	jmp	LBB278_11
LBB278_7:                               #   in Loop: Header=BB278_2 Depth=1
	movb	$1, %bl
	cmpb	$0, (%esp)                      # 1-byte Folded Reload
	je	LBB278_9
# %bb.8:                                #   in Loop: Header=BB278_2 Depth=1
                                        # kill: def $bl killed $bl def $ebx
	movl	%ebx, (%esp)                    # 4-byte Spill
	xorl	%ebx, %ebx
	jmp	LBB278_12
LBB278_9:                               #   in Loop: Header=BB278_2 Depth=1
	movb	$32, %dl
	movb	$1, %bl
	movl	%ebx, (%esp)                    # 4-byte Spill
LBB278_10:                              #   in Loop: Header=BB278_2 Depth=1
	xorl	%ebx, %ebx
LBB278_11:                              #   in Loop: Header=BB278_2 Depth=1
	movb	%dl, (%ecx)
	incl	%ecx
	movzbl	(%eax), %edx
LBB278_12:                              #   in Loop: Header=BB278_2 Depth=1
	incl	%eax
	testb	%dl, %dl
	jne	LBB278_2
LBB278_13:                              # %.loopexit
	addl	$4, %esp
	popl	%esi
	popl	%ebx
	retl
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI278_0:
	.long	LBB278_6
	.long	LBB278_10
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_4
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_11
	.long	LBB278_4
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
	je	LBB279_10
# %bb.1:                                # %.preheader.preheader
	xorl	%ebx, %ebx
	movl	%eax, %esi
	jmp	LBB279_2
	.p2align	4
LBB279_4:                               #   in Loop: Header=BB279_2 Depth=1
	xorl	%ecx, %ecx
LBB279_8:                               #   in Loop: Header=BB279_2 Depth=1
	movb	%dl, (%esi)
	incl	%esi
	movzbl	(%eax), %edx
LBB279_9:                               #   in Loop: Header=BB279_2 Depth=1
	incl	%eax
	movl	%ecx, %ebx
	testb	%dl, %dl
	je	LBB279_10
LBB279_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%eax), %edx
	movl	%edx, %edi
	addl	$-2, %edi
	cmpl	$30, %edi
	ja	LBB279_7
# %bb.3:                                # %.preheader
                                        #   in Loop: Header=BB279_2 Depth=1
	movb	$1, %cl
	jmpl	*LJTI279_0(,%edi,4)
LBB279_5:                               #   in Loop: Header=BB279_2 Depth=1
	testb	%bl, %bl
	jne	LBB279_8
# %bb.6:                                #   in Loop: Header=BB279_2 Depth=1
	xorl	%ecx, %ecx
	jmp	LBB279_9
LBB279_7:                               #   in Loop: Header=BB279_2 Depth=1
	movl	%ebx, %ecx
	jmp	LBB279_8
LBB279_10:                              # %.loopexit
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI279_0:
	.long	LBB279_8
	.long	LBB279_4
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_5
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_7
	.long	LBB279_5
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
	je	LBB281_12
# %bb.1:                                # %.preheader4.preheader
	xorl	%ebx, %ebx
	movl	%eax, %edi
	jmp	LBB281_2
	.p2align	4
LBB281_5:                               #   in Loop: Header=BB281_2 Depth=1
	xorl	%ebx, %ebx
LBB281_9:                               #   in Loop: Header=BB281_2 Depth=1
	movb	%cl, (%edi)
	incl	%edi
	movzbl	(%eax), %ecx
LBB281_10:                              #   in Loop: Header=BB281_2 Depth=1
	incl	%eax
                                        # kill: def $bl killed $bl killed $ebx def $ebx
	testb	%cl, %cl
	je	LBB281_11
LBB281_2:                               # %.preheader4
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%eax), %ecx
	movl	%ecx, %edx
	addl	$-2, %edx
	cmpl	$30, %edx
	ja	LBB281_8
# %bb.3:                                # %.preheader4
                                        #   in Loop: Header=BB281_2 Depth=1
	jmpl	*LJTI281_0(,%edx,4)
LBB281_6:                               #   in Loop: Header=BB281_2 Depth=1
	testb	%bl, %bl
	movb	$1, %bl
	jne	LBB281_9
# %bb.7:                                #   in Loop: Header=BB281_2 Depth=1
	xorl	%ebx, %ebx
	jmp	LBB281_10
	.p2align	4
LBB281_4:                               #   in Loop: Header=BB281_2 Depth=1
	movb	$1, %bl
	jmp	LBB281_9
LBB281_8:                               #   in Loop: Header=BB281_2 Depth=1
                                        # kill: def $bl killed $bl killed $ebx def $ebx
	jmp	LBB281_9
LBB281_11:
	movl	(%esi), %ecx
	movl	28(%esp), %ebx
LBB281_12:
	pushl	%ecx
	calll	_String_Unpacking
	addl	$4, %esp
	pushl	(%ebx)
	calll	_String_Packing
	addl	$4, %esp
	movl	(%ebx), %eax
	testl	%eax, %eax
	je	LBB281_23
# %bb.13:                               # %.preheader3.preheader
	movl	%ebx, %ebp
	xorl	%ebx, %ebx
	movl	%eax, %esi
	jmp	LBB281_14
	.p2align	4
LBB281_16:                              #   in Loop: Header=BB281_14 Depth=1
	xorl	%ecx, %ecx
LBB281_20:                              #   in Loop: Header=BB281_14 Depth=1
	movb	%dl, (%esi)
	incl	%esi
	movzbl	(%eax), %edx
LBB281_21:                              #   in Loop: Header=BB281_14 Depth=1
	incl	%eax
	movl	%ecx, %ebx
	testb	%dl, %dl
	je	LBB281_22
LBB281_14:                              # %.preheader3
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%eax), %edx
	movl	%edx, %edi
	addl	$-2, %edi
	cmpl	$30, %edi
	ja	LBB281_19
# %bb.15:                               # %.preheader3
                                        #   in Loop: Header=BB281_14 Depth=1
	movb	$1, %cl
	jmpl	*LJTI281_1(,%edi,4)
LBB281_17:                              #   in Loop: Header=BB281_14 Depth=1
	testb	%bl, %bl
	jne	LBB281_20
# %bb.18:                               #   in Loop: Header=BB281_14 Depth=1
	xorl	%ecx, %ecx
	jmp	LBB281_21
LBB281_19:                              #   in Loop: Header=BB281_14 Depth=1
	movl	%ebx, %ecx
	jmp	LBB281_20
LBB281_22:
	movl	(%ebp), %ebp
LBB281_23:
	pushl	%ebp
	calll	_String_Unpacking
	addl	$4, %esp
	movl	32(%esp), %ebp
	pushl	(%ebp)
	calll	_String_Packing
	addl	$4, %esp
	movl	(%ebp), %eax
	testl	%eax, %eax
	je	LBB281_24
# %bb.25:                               # %.preheader.preheader
	xorl	%ebx, %ebx
	movl	%eax, %esi
	jmp	LBB281_26
	.p2align	4
LBB281_28:                              #   in Loop: Header=BB281_26 Depth=1
	xorl	%ecx, %ecx
LBB281_32:                              #   in Loop: Header=BB281_26 Depth=1
	movb	%dl, (%esi)
	incl	%esi
	movzbl	(%eax), %edx
LBB281_33:                              #   in Loop: Header=BB281_26 Depth=1
	incl	%eax
	movl	%ecx, %ebx
	testb	%dl, %dl
	je	LBB281_34
LBB281_26:                              # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%eax), %edx
	movl	%edx, %edi
	addl	$-2, %edi
	cmpl	$30, %edi
	ja	LBB281_31
# %bb.27:                               # %.preheader
                                        #   in Loop: Header=BB281_26 Depth=1
	movb	$1, %cl
	jmpl	*LJTI281_2(,%edi,4)
LBB281_29:                              #   in Loop: Header=BB281_26 Depth=1
	testb	%bl, %bl
	jne	LBB281_32
# %bb.30:                               #   in Loop: Header=BB281_26 Depth=1
	xorl	%ecx, %ecx
	jmp	LBB281_33
LBB281_31:                              #   in Loop: Header=BB281_26 Depth=1
	movl	%ebx, %ecx
	jmp	LBB281_32
LBB281_34:
	movl	(%ebp), %eax
	jmp	LBB281_35
LBB281_24:
	xorl	%eax, %eax
LBB281_35:
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
LJTI281_0:
	.long	LBB281_4
	.long	LBB281_5
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_6
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_8
	.long	LBB281_6
LJTI281_1:
	.long	LBB281_20
	.long	LBB281_16
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_17
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_19
	.long	LBB281_17
LJTI281_2:
	.long	LBB281_32
	.long	LBB281_28
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_29
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_31
	.long	LBB281_29
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
	subl	$12, %esp
	movl	32(%esp), %ebx
	movzwl	36(%esp), %edx
	movw	$4, %ax
	cmpl	$781, %edx                      # imm = 0x30D
	jle	LBB282_3
# %bb.1:
	cmpl	$32768, %edx                    # imm = 0x8000
	jle	LBB282_9
# %bb.2:
	addl	$-32769, %edx                   # imm = 0xFFFF7FFF
	cmpl	$9, %edx
	jb	LBB282_12
	jmp	LBB282_43
LBB282_3:
	cmpl	$259, %edx                      # imm = 0x103
	jle	LBB282_6
# %bb.4:
	leal	-260(%edx), %ecx
	cmpl	$4, %ecx
	jb	LBB282_12
# %bb.5:
	addl	$-512, %edx                     # imm = 0xFE00
	cmpl	$4, %edx
	jb	LBB282_12
	jmp	LBB282_43
LBB282_6:
	leal	-16(%edx), %ecx
	cmpl	$4, %ecx
	jb	LBB282_12
# %bb.7:
	testl	%edx, %edx
	jne	LBB282_43
# %bb.8:
	xorl	%eax, %eax
	testl	%ebx, %ebx
	setne	%al
	shll	$2, %eax
	jmp	LBB282_43
LBB282_9:
	leal	-782(%edx), %ecx
	cmpl	$2, %ecx
	jb	LBB282_12
# %bb.10:
	leal	-1346(%edx), %ecx
	cmpl	$2, %ecx
	jb	LBB282_12
# %bb.11:
	cmpl	$1536, %edx                     # imm = 0x600
	jne	LBB282_43
LBB282_12:
	testl	%ebx, %ebx
	je	LBB282_22
# %bb.13:
	movl	$-1, 8(%esp)
	pushl	$46
	pushl	%ebx
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB282_19
# %bb.14:
	leal	8(%esp), %ecx
	pushl	%ecx
	pushl	$"??_C@_04HGICJEGC@?4X?$CFd?$AA@"
	pushl	%eax
	calll	_sscanf
	addl	$12, %esp
	cmpl	$1, %eax
	sete	%al
	movl	8(%esp), %edi
	cmpl	$64, %edi
	setb	%cl
	testb	%cl, %al
	je	LBB282_19
# %bb.15:                               # %.thread
	pushl	%ebx
	calll	_strdup
	addl	$4, %esp
	testl	%eax, %eax
	je	LBB282_31
# %bb.16:
	movl	%eax, %esi
	pushl	$46
	pushl	%eax
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	movl	%edi, 4(%esp)                   # 4-byte Spill
	je	LBB282_18
# %bb.17:
	movb	$0, (%eax)
LBB282_18:
	movl	$0, (%esp)                      # 4-byte Folded Spill
	jmp	LBB282_21
LBB282_19:
	pushl	%ebx
	calll	_strdup
	addl	$4, %esp
	testl	%eax, %eax
	je	LBB282_31
# %bb.20:
	movl	%eax, %esi
	movb	$1, %al
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$0, 4(%esp)                     # 4-byte Folded Spill
LBB282_21:
	pushl	%esi
	calll	_Scope_variable
	addl	$4, %esp
	movl	%eax, %ebp
	jmp	LBB282_23
LBB282_22:
	movl	$0, 4(%esp)                     # 4-byte Folded Spill
	movb	$1, %al
	movl	%eax, (%esp)                    # 4-byte Spill
	xorl	%esi, %esi
	xorl	%ebp, %ebp
LBB282_23:                              # %Bitfield_Check.exit.thread
	movl	_variablelist, %edi
	testl	%edi, %edi
	je	LBB282_26
	.p2align	4
LBB282_24:                              # %.preheader.i
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebp
	pushl	(%edi)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB282_28
# %bb.25:                               #   in Loop: Header=BB282_24 Depth=1
	movl	19(%edi), %edi
	testl	%edi, %edi
	jne	LBB282_24
LBB282_26:                              # %.loopexit27
	pushl	%ebp
	calll	_Literal_Compile
	addl	$4, %esp
	testl	%eax, %eax
	jne	LBB282_33
# %bb.29:
	pushl	%ebp
	calll	_Structure_Compile
	addl	$4, %esp
	testl	%eax, %eax
	jne	LBB282_33
# %bb.32:
	pushl	%ebp
	calll	_Rtedge_Compile
	addl	$4, %esp
	testl	%eax, %eax
	je	LBB282_45
LBB282_33:
	movl	%eax, %edi
	jmp	LBB282_34
LBB282_28:                              # %Variable_Search.exit
	addl	$4, %edi
LBB282_34:
	movl	40(%esp), %eax
	cmpb	$0, (%esp)                      # 1-byte Folded Reload
	jne	LBB282_39
# %bb.35:
	movl	_variablelist, %ebp
	testl	%ebp, %ebp
	je	LBB282_38
	.p2align	4
LBB282_36:                              # %.preheader.i9
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebx
	pushl	(%ebp)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB282_40
# %bb.37:                               #   in Loop: Header=BB282_36 Depth=1
	movl	19(%ebp), %ebp
	testl	%ebp, %ebp
	jne	LBB282_36
LBB282_38:                              # %.loopexit
	pushl	$1536                           # imm = 0x600
	pushl	%ebx
	calll	_Variable_Add
	addl	$8, %esp
	movsd	(%edi), %xmm0                   # xmm0 = mem[0],zero
	movsd	%xmm0, (%eax)
	movl	8(%edi), %ecx
	movl	%ecx, 8(%eax)
	movb	$1, 12(%eax)
	movl	4(%esp), %ecx                   # 4-byte Reload
	movw	%cx, 13(%eax)
	movl	%eax, %edi
	movl	40(%esp), %eax
LBB282_39:
	movl	%edi, (%eax)
	testl	%ebx, %ebx
	jne	LBB282_41
	jmp	LBB282_42
LBB282_40:                              # %.thread26
	addl	$4, %ebp
	movl	40(%esp), %eax
	movl	%ebp, (%eax)
LBB282_41:
	pushl	%esi
	calll	_free
	addl	$4, %esp
LBB282_42:
	xorl	%eax, %eax
	jmp	LBB282_43
LBB282_45:
	testl	%ebx, %ebx
	je	LBB282_31
# %bb.46:
	pushl	%esi
	calll	_free
	addl	$4, %esp
LBB282_31:
	movw	$4, %ax
LBB282_43:
                                        # kill: def $ax killed $ax killed $eax
	addl	$12, %esp
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
	je	LBB283_2
# %bb.1:
	movb	$0, (%eax)
LBB283_2:
	pushl	$92
	pushl	$_MnmFile_Base.Label
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB283_4
# %bb.3:
	incl	%eax
	popl	%esi
	retl
LBB283_4:
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
	movl	$0, _commentnest
	pushl	$"??_C@_02BMJICGCB@rt?$AA@"
	pushl	%esi
	calll	_fopen
	addl	$8, %esp
	movl	%eax, _MnmFile_Open.fp
	movl	%eax, 20(%esp)                  # 4-byte Spill
	testl	%eax, %eax
	je	LBB284_5
# %bb.1:
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
	je	LBB284_3
# %bb.2:
	movb	$0, (%eax)
LBB284_3:
	pushl	$92
	pushl	$_MnmFile_Base.Label
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB284_6
# %bb.4:
	incl	%eax
	jmp	LBB284_7
LBB284_5:
	pushl	%esi
	pushl	$32
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	movl	$1, %esi
	jmp	LBB284_90
LBB284_6:
	movl	$_MnmFile_Base.Label, %esi
	pushl	$47
	pushl	$_MnmFile_Base.Label
	calll	_strrchr
	addl	$8, %esp
	movl	%eax, %ecx
	incl	%eax
	testl	%ecx, %ecx
	cmovel	%esi, %eax
LBB284_7:
	pushl	%edi
	pushl	$1
	pushl	%eax
	calll	_Label_Add
	addl	$12, %esp
	movl	%eax, 8(%esp)                   # 4-byte Spill
	leal	48(%esp), %ebx
	pushl	20(%esp)                        # 4-byte Folded Reload
	pushl	$128
	pushl	%ebx
	calll	_fgets
	addl	$12, %esp
	movb	$1, %cl
	movl	%ecx, 16(%esp)                  # 4-byte Spill
	testl	%eax, %eax
	je	LBB284_83
# %bb.8:                                # %.preheader
	movl	$0, (%esp)                      # 4-byte Folded Spill
	movl	$8388627, %esi                  # imm = 0x800013
	xorl	%edi, %edi
	jmp	LBB284_11
	.p2align	4
LBB284_9:                               #   in Loop: Header=BB284_11 Depth=1
	movb	$0, 48(%esp)
LBB284_10:                              #   in Loop: Header=BB284_11 Depth=1
	pushl	20(%esp)                        # 4-byte Folded Reload
	pushl	$128
	pushl	%ebx
	calll	_fgets
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB284_81
LBB284_11:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB284_16 Depth 2
                                        #     Child Loop BB284_32 Depth 2
                                        #     Child Loop BB284_39 Depth 2
	incl	%edi
	cmpb	$59, 48(%esp)
	je	LBB284_9
# %bb.12:                               #   in Loop: Header=BB284_11 Depth=1
	pushl	$10
	pushl	%ebx
	calll	_strchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB284_14
# %bb.13:                               #   in Loop: Header=BB284_11 Depth=1
	movb	$0, (%eax)
LBB284_14:                              # %.preheader72
                                        #   in Loop: Header=BB284_11 Depth=1
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	jmp	LBB284_16
	.p2align	4
LBB284_15:                              #   in Loop: Header=BB284_16 Depth=2
	cmpb	$41, (%ebx)
	je	LBB284_21
LBB284_16:                              #   Parent Loop BB284_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	incl	%ebx
	movzbl	-1(%ebx), %edx
	cmpl	$40, %edx
	je	LBB284_19
# %bb.17:                               #   in Loop: Header=BB284_16 Depth=2
	cmpl	$42, %edx
	je	LBB284_15
# %bb.18:                               #   in Loop: Header=BB284_16 Depth=2
	testl	%edx, %edx
	jne	LBB284_16
	jmp	LBB284_25
	.p2align	4
LBB284_19:                              #   in Loop: Header=BB284_16 Depth=2
	cmpb	$42, (%ebx)
	jne	LBB284_16
# %bb.20:                               #   in Loop: Header=BB284_16 Depth=2
	movl	_commentnest, %edx
	leal	1(%edx), %ebp
	movl	%ebp, _commentnest
	leal	-1(%ebx), %ebp
	testl	%edx, %edx
	cmovel	%ebp, %ecx
	jmp	LBB284_22
LBB284_21:                              #   in Loop: Header=BB284_16 Depth=2
	decl	_commentnest
	cmovel	%ebx, %eax
LBB284_22:                              #   in Loop: Header=BB284_16 Depth=2
	incl	%ebx
	testl	%ecx, %ecx
	je	LBB284_16
# %bb.23:                               #   in Loop: Header=BB284_16 Depth=2
	testl	%eax, %eax
	je	LBB284_16
# %bb.24:                               #   in Loop: Header=BB284_16 Depth=2
	subl	%ecx, %eax
	incl	%eax
	pushl	%eax
	pushl	$32
	pushl	%ecx
	calll	_memset
	addl	$12, %esp
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	jmp	LBB284_16
	.p2align	4
LBB284_25:                              #   in Loop: Header=BB284_11 Depth=1
	testl	%ecx, %ecx
	je	LBB284_27
# %bb.26:                               #   in Loop: Header=BB284_11 Depth=1
	movb	$0, (%ecx)
	leal	48(%esp), %ebx
	jmp	LBB284_31
LBB284_27:                              #   in Loop: Header=BB284_11 Depth=1
	testl	%eax, %eax
	leal	48(%esp), %ebx
	je	LBB284_29
# %bb.28:                               #   in Loop: Header=BB284_11 Depth=1
	subl	%ebx, %eax
	incl	%eax
	pushl	%eax
	pushl	$32
	pushl	%ebx
	calll	_memset
	addl	$12, %esp
	jmp	LBB284_31
LBB284_29:                              #   in Loop: Header=BB284_11 Depth=1
	cmpl	$0, _commentnest
	jle	LBB284_31
# %bb.30:                               #   in Loop: Header=BB284_11 Depth=1
	movb	$0, 48(%esp)
	.p2align	4
LBB284_31:                              # %Comment_ProcessBracket.exit.preheader
                                        #   in Loop: Header=BB284_11 Depth=1
	xorl	%eax, %eax
	.p2align	4
LBB284_32:                              # %Comment_ProcessBracket.exit
                                        #   Parent Loop BB284_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	48(%esp,%eax), %ecx
	addl	$-9, %ecx
	cmpl	$23, %ecx
	ja	LBB284_35
# %bb.33:                               # %Comment_ProcessBracket.exit
                                        #   in Loop: Header=BB284_32 Depth=2
	btl	%ecx, %esi
	jae	LBB284_35
# %bb.34:                               #   in Loop: Header=BB284_32 Depth=2
	incl	%eax
	jmp	LBB284_32
	.p2align	4
LBB284_35:                              #   in Loop: Header=BB284_11 Depth=1
	testl	%eax, %eax
	je	LBB284_37
# %bb.36:                               #   in Loop: Header=BB284_11 Depth=1
	addl	%esp, %eax
	addl	$48, %eax
	pushl	%eax
	pushl	%ebx
	calll	_strcpy
	addl	$8, %esp
LBB284_37:                              #   in Loop: Header=BB284_11 Depth=1
	cmpb	$0, 48(%esp)
	je	LBB284_10
# %bb.38:                               #   in Loop: Header=BB284_11 Depth=1
	pushl	%ebx
	calll	_String_Packing
	addl	$4, %esp
	movl	$0, 4(%esp)                     # 4-byte Folded Spill
	movl	%ebx, %eax
	movl	%ebx, %ecx
	xorl	%ebx, %ebx
	.p2align	4
LBB284_39:                              #   Parent Loop BB284_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	(%eax), %edx
	movl	%edx, %ebp
	addl	$-2, %ebp
	cmpl	$30, %ebp
	ja	LBB284_48
# %bb.40:                               #   in Loop: Header=BB284_39 Depth=2
	jmpl	*LJTI284_0(,%ebp,4)
LBB284_41:                              #   in Loop: Header=BB284_39 Depth=2
	testb	%bl, %bl
	je	LBB284_44
LBB284_43:                              #   in Loop: Header=BB284_39 Depth=2
	movb	$1, %bl
	jmp	LBB284_48
LBB284_44:                              #   in Loop: Header=BB284_39 Depth=2
	movb	$1, %bl
	cmpb	$0, 4(%esp)                     # 1-byte Folded Reload
	je	LBB284_46
# %bb.45:                               #   in Loop: Header=BB284_39 Depth=2
                                        # kill: def $bl killed $bl def $ebx
	movl	%ebx, 4(%esp)                   # 4-byte Spill
	xorl	%ebx, %ebx
	jmp	LBB284_49
LBB284_46:                              #   in Loop: Header=BB284_39 Depth=2
	movb	$32, %dl
	movb	$1, %bl
	movl	%ebx, 4(%esp)                   # 4-byte Spill
LBB284_47:                              #   in Loop: Header=BB284_39 Depth=2
	xorl	%ebx, %ebx
LBB284_48:                              #   in Loop: Header=BB284_39 Depth=2
	movb	%dl, (%ecx)
	incl	%ecx
	movzbl	(%eax), %edx
LBB284_49:                              #   in Loop: Header=BB284_39 Depth=2
	incl	%eax
	testb	%dl, %dl
	jne	LBB284_39
# %bb.50:                               #   in Loop: Header=BB284_11 Depth=1
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
	je	LBB284_63
# %bb.51:                               #   in Loop: Header=BB284_11 Depth=1
	pushl	%ebx
	calll	_Instruction_GetTemplate
	addl	$4, %esp
	testl	%eax, %eax
	je	LBB284_54
# %bb.52:                               #   in Loop: Header=BB284_11 Depth=1
	cmpb	$0, 6(%eax)
	je	LBB284_55
# %bb.53:                               #   in Loop: Header=BB284_11 Depth=1
	pushl	$0
	pushl	$0
	pushl	%ebx
	pushl	%ebp
	calll	*13(%eax)
	addl	$16, %esp
	jmp	LBB284_63
LBB284_54:                              #   in Loop: Header=BB284_11 Depth=1
	movl	8(%esp), %eax                   # 4-byte Reload
	pushl	(%eax)
	pushl	$128
	pushl	%edi
	calll	_Errorlog_Add
	addl	$12, %esp
	incl	(%esp)                          # 4-byte Folded Spill
	jmp	LBB284_63
LBB284_55:                              #   in Loop: Header=BB284_11 Depth=1
	movl	%eax, 4(%esp)                   # 4-byte Spill
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
	je	LBB284_57
# %bb.56:                               #   in Loop: Header=BB284_11 Depth=1
	movl	8(%esp), %ebx                   # 4-byte Reload
	pushl	(%ebx)
	pushl	$4
	jmp	LBB284_61
LBB284_57:                              #   in Loop: Header=BB284_11 Depth=1
	movl	40(%esp), %ebx
	pushl	%ebx
	calll	_Reservedword_Check
	addl	$4, %esp
	testb	%al, %al
	je	LBB284_59
# %bb.58:                               #   in Loop: Header=BB284_11 Depth=1
	movl	8(%esp), %ebx                   # 4-byte Reload
	pushl	(%ebx)
	pushl	$5
	jmp	LBB284_61
LBB284_59:                              #   in Loop: Header=BB284_11 Depth=1
	movl	36(%esp), %eax
	movl	%eax, 32(%esp)                  # 4-byte Spill
	pushl	%eax
	calll	_Reservedword_Check
	addl	$4, %esp
	testb	%al, %al
	je	LBB284_64
# %bb.60:                               #   in Loop: Header=BB284_11 Depth=1
	movl	8(%esp), %ebx                   # 4-byte Reload
	pushl	(%ebx)
	pushl	$6
LBB284_61:                              #   in Loop: Header=BB284_11 Depth=1
	pushl	%edi
	calll	_Errorlog_Add
	addl	$12, %esp
	pushl	(%ebx)
	pushl	$129
LBB284_62:                              #   in Loop: Header=BB284_11 Depth=1
	pushl	%edi
	calll	_Errorlog_Add
	addl	$12, %esp
	addl	$2, (%esp)                      # 4-byte Folded Spill
	.p2align	4
LBB284_63:                              #   in Loop: Header=BB284_11 Depth=1
	leal	48(%esp), %ebx
	jmp	LBB284_10
LBB284_64:                              #   in Loop: Header=BB284_11 Depth=1
	movl	$_VARIANT_EMPTY, 28(%esp)
	movl	$_VARIANT_EMPTY, 12(%esp)
	movl	$_VARIANT_EMPTY, 24(%esp)
	testl	%ebp, %ebp
	je	LBB284_67
# %bb.65:                               #   in Loop: Header=BB284_11 Depth=1
	movl	4(%esp), %eax                   # 4-byte Reload
	movzwl	7(%eax), %eax
	leal	28(%esp), %ecx
	pushl	%ecx
	pushl	%eax
	pushl	%ebp
	calll	_MnmFile_PargeArgument
	addl	$12, %esp
	testw	%ax, %ax
	je	LBB284_67
# %bb.66:                               #   in Loop: Header=BB284_11 Depth=1
	movzwl	%ax, %ebx
	movl	8(%esp), %ebp                   # 4-byte Reload
	pushl	(%ebp)
	pushl	$4
	jmp	LBB284_73
LBB284_67:                              #   in Loop: Header=BB284_11 Depth=1
	testl	%ebx, %ebx
	je	LBB284_70
# %bb.68:                               #   in Loop: Header=BB284_11 Depth=1
	movl	4(%esp), %eax                   # 4-byte Reload
	movzwl	9(%eax), %eax
	leal	12(%esp), %ecx
	pushl	%ecx
	pushl	%eax
	pushl	%ebx
	calll	_MnmFile_PargeArgument
	addl	$12, %esp
	testw	%ax, %ax
	je	LBB284_70
# %bb.69:                               #   in Loop: Header=BB284_11 Depth=1
	movzwl	%ax, %ebx
	movl	8(%esp), %ebp                   # 4-byte Reload
	pushl	(%ebp)
	pushl	$5
	jmp	LBB284_73
LBB284_70:                              #   in Loop: Header=BB284_11 Depth=1
	movl	32(%esp), %edx                  # 4-byte Reload
	testl	%edx, %edx
	je	LBB284_74
# %bb.71:                               #   in Loop: Header=BB284_11 Depth=1
	movl	4(%esp), %eax                   # 4-byte Reload
	movzwl	11(%eax), %eax
	leal	24(%esp), %ecx
	pushl	%ecx
	pushl	%eax
	pushl	%edx
	calll	_MnmFile_PargeArgument
	addl	$12, %esp
	testw	%ax, %ax
	je	LBB284_74
# %bb.72:                               #   in Loop: Header=BB284_11 Depth=1
	movzwl	%ax, %ebx
	movl	8(%esp), %ebp                   # 4-byte Reload
	pushl	(%ebp)
	pushl	$6
LBB284_73:                              #   in Loop: Header=BB284_11 Depth=1
	pushl	%edi
	calll	_Errorlog_Add
	addl	$12, %esp
	pushl	(%ebp)
	pushl	%ebx
	jmp	LBB284_62
LBB284_74:                              #   in Loop: Header=BB284_11 Depth=1
	movl	4(%esp), %ecx                   # 4-byte Reload
	cmpw	$32, 4(%ecx)
	jne	LBB284_77
# %bb.75:                               #   in Loop: Header=BB284_11 Depth=1
	pushl	%ebp
	calll	_Rtedge_GetStructureName
	addl	$4, %esp
	pushl	%eax
	calll	_Variable_Search
	addl	$4, %esp
	movl	4(%esp), %ecx                   # 4-byte Reload
	movl	%eax, 12(%esp)
	testl	%eax, %eax
	jne	LBB284_78
# %bb.76:                               #   in Loop: Header=BB284_11 Depth=1
	movl	8(%esp), %eax                   # 4-byte Reload
	pushl	(%eax)
	pushl	$8195                           # imm = 0x2003
	pushl	%edi
	calll	_Errorlog_Add
	movl	16(%esp), %ecx                  # 4-byte Reload
	addl	$12, %esp
	movl	$__Variable_Zero_FUNCTION, 12(%esp)
	movl	$__Variable_Zero_FUNCTION, %eax
	jmp	LBB284_78
LBB284_77:                              #   in Loop: Header=BB284_11 Depth=1
	movl	12(%esp), %eax
LBB284_78:                              #   in Loop: Header=BB284_11 Depth=1
	pushl	24(%esp)
	pushl	%eax
	pushl	36(%esp)
	pushl	%ecx
	movl	%ecx, %ebx
	calll	_Logic_Add
	addl	$16, %esp
	movzwl	4(%ebx), %eax
	cmpl	$39, %eax
	je	LBB284_91
# %bb.79:                               #   in Loop: Header=BB284_11 Depth=1
	cmpl	$35, %eax
	jne	LBB284_63
# %bb.80:                               # %.loopexit.loopexit
	movb	$1, %bl
	movl	$0, 16(%esp)                    # 4-byte Folded Spill
	jmp	LBB284_82
LBB284_81:
	movb	$1, %bl
LBB284_82:                              # %.loopexit
	movl	(%esp), %esi                    # 4-byte Reload
	jmp	LBB284_84
LBB284_83:
	xorl	%esi, %esi
	movb	$1, %bl
LBB284_84:                              # %.loopexit
	pushl	20(%esp)                        # 4-byte Folded Reload
	calll	_fclose
	addl	$4, %esp
	movl	$2, _status_mnmfile
	cmpb	$0, _scope
	je	LBB284_87
# %bb.85:
	cmpb	$0, 16(%esp)                    # 1-byte Folded Reload
	je	LBB284_90
# %bb.86:
	pushl	$"??_C@_03BHDJDALB@RET?$AA@"
	jmp	LBB284_89
LBB284_87:
	testb	%bl, %bl
	je	LBB284_90
# %bb.88:
	pushl	$"??_C@_03JMGAKCCH@END?$AA@"
LBB284_89:
	calll	_Instruction_GetTemplate
	addl	$4, %esp
	pushl	$_VARIANT_EMPTY
	pushl	$_VARIANT_EMPTY
	pushl	$_VARIANT_EMPTY
	pushl	%eax
	calll	_Logic_Add
	addl	$16, %esp
LBB284_90:
	movl	%esi, %eax
	addl	$176, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB284_91:
	xorl	%ebx, %ebx
	movb	$1, %al
	movl	%eax, 16(%esp)                  # 4-byte Spill
	jmp	LBB284_82
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI284_0:
	.long	LBB284_43
	.long	LBB284_47
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_41
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_48
	.long	LBB284_41
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
	je	LBB285_1
# %bb.2:
	movl	$-1, (%esp)
	pushl	$46
	pushl	%eax
	calll	_strrchr
	addl	$8, %esp
	movl	$-1, %esi
	testl	%eax, %eax
	je	LBB285_5
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
	jne	LBB285_5
# %bb.4:
	movb	$0, (%edi)
	movl	%eax, %esi
	jmp	LBB285_5
LBB285_1:
	movl	$-1, %esi
LBB285_5:
	movl	%esi, %eax
	addl	$4, %esp
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Pause_Init;
	.scl	2;
	.type	32;
	.endef
	.globl	_Pause_Init                     # -- Begin function Pause_Init
	.p2align	4
_Pause_Init:                            # @Pause_Init
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB286_3
# %bb.1:
	cmpw	$0, 41(%eax)
	je	LBB286_2
LBB286_3:
	retl
LBB286_2:                               # %Catalog.exit
	pushl	$0
	pushl	$1
	pushl	$0
	calll	_CreateRtSemaphore
	addl	$12, %esp
	movl	_sqtbl, %ecx
	movw	%ax, 41(%ecx)
	movzwl	%ax, %eax
	pushl	$"??_C@_06OAFNIPMP@SQSUSP?$AA@"
	pushl	%eax
	pushl	$0
	calll	_CatalogRtHandle
	addl	$12, %esp
	movl	$2, _status_pause
	retl
                                        # -- End function
	.def	_Pause_IsEnable;
	.scl	2;
	.type	32;
	.endef
	.globl	_Pause_IsEnable                 # -- Begin function Pause_IsEnable
	.p2align	4
_Pause_IsEnable:                        # @Pause_IsEnable
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB287_1
# %bb.3:
	cmpb	$0, 39(%eax)
	setne	%al
                                        # kill: def $al killed $al killed $eax
	retl
LBB287_1:
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	retl
                                        # -- End function
	.def	_Pause_WaitTrigger;
	.scl	2;
	.type	32;
	.endef
	.globl	_Pause_WaitTrigger              # -- Begin function Pause_WaitTrigger
	.p2align	4
_Pause_WaitTrigger:                     # @Pause_WaitTrigger
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB288_4
# %bb.1:
	pushl	%esi
	movl	_status_pause, %esi
	movzwl	41(%eax), %eax
	pushl	%eax
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$4, %ax
	jne	LBB288_3
# %bb.2:
	movl	$4, _status_pause
	movl	_sqtbl, %eax
	movzwl	41(%eax), %eax
	pushl	$-1
	pushl	$1
	pushl	%eax
	calll	_WaitForRtSemaphore
	addl	$12, %esp
	movl	%esi, _status_pause
LBB288_3:
	popl	%esi
LBB288_4:
	retl
                                        # -- End function
	.def	_Pause_Enable;
	.scl	2;
	.type	32;
	.endef
	.globl	_Pause_Enable                   # -- Begin function Pause_Enable
	.p2align	4
_Pause_Enable:                          # @Pause_Enable
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB289_2
# %bb.1:
	movb	$1, 39(%eax)
	movl	$6, _status_pause
LBB289_2:
	retl
                                        # -- End function
	.def	_Pause_Disable;
	.scl	2;
	.type	32;
	.endef
	.globl	_Pause_Disable                  # -- Begin function Pause_Disable
	.p2align	4
_Pause_Disable:                         # @Pause_Disable
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB290_2
# %bb.1:
	movb	$0, 39(%eax)
	movl	$2, _status_pause
LBB290_2:
	retl
                                        # -- End function
	.def	_PLCcontrol_Start;
	.scl	2;
	.type	32;
	.endef
	.globl	_PLCcontrol_Start               # -- Begin function PLCcontrol_Start
	.p2align	4
_PLCcontrol_Start:                      # @PLCcontrol_Start
# %bb.0:
	pushl	%esi
	subl	$100, %esp
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB291_2
# %bb.1:                                # %Engine_IsStart.exit
	cmpb	$0, 32(%eax)
	jne	LBB291_13
LBB291_2:                               # %Engine_IsStart.exit.thread
	movl	_RUNplcbeginpoint, %esi
	testl	%esi, %esi
	je	LBB291_10
# %bb.3:
	xorps	%xmm0, %xmm0
	movsd	%xmm0, 4(%esp)
	movl	$0, 11(%esp)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 80(%esp)
	movups	%xmm0, 64(%esp)
	movups	%xmm0, 48(%esp)
	movups	%xmm0, 32(%esp)
	movups	%xmm0, 16(%esp)
	movl	$0, 95(%esp)
	leal	16(%esp), %eax
	movl	%eax, (%esp)
	movl	%esp, %eax
	.p2align	4
LBB291_4:                               # =>This Inner Loop Header: Depth=1
	movl	(%esi), %ecx
	pushl	12(%esi)
	pushl	8(%esi)
	pushl	4(%esi)
	pushl	%eax
	calll	*13(%ecx)
	addl	$16, %esp
	movl	(%eax), %ecx
	testl	%ecx, %ecx
	je	LBB291_6
# %bb.5:                                #   in Loop: Header=BB291_4 Depth=1
	movsd	(%ecx), %xmm0                   # xmm0 = mem[0],zero
	movsd	%xmm0, 16(%esi)
LBB291_6:                               #   in Loop: Header=BB291_4 Depth=1
	cmpb	$1, 11(%eax)
	je	LBB291_7
# %bb.8:                                #   in Loop: Header=BB291_4 Depth=1
	movl	24(%esi), %esi
	testl	%esi, %esi
	jne	LBB291_4
	jmp	LBB291_9
LBB291_7:
	movb	$0, 11(%eax)
LBB291_9:                               # %.loopexit.i
	movl	_sqtbl, %eax
LBB291_10:                              # %Logic_Begin.exit
	movb	$0, _Engine_PhaseStop
	movl	$0, _systickcount
	testl	%eax, %eax
	je	LBB291_12
# %bb.11:
	movb	$1, 32(%eax)
LBB291_12:                              # %Engine_Start.exit
	movl	$6, _status_engine
	movl	$6, _status_plccontrol
LBB291_13:
	movl	_indicate+224, %eax
	movb	$1, (%eax)
	movl	_indicate+194, %eax
	movb	$0, (%eax)
	movl	_indicate+254, %eax
	movb	$0, (%eax)
	movl	_indicate+284, %eax
	movb	$0, (%eax)
	movl	_indicate+674, %eax
	movl	$0, (%eax)
	addl	$100, %esp
	popl	%esi
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
	pushl	%esi
	subl	$100, %esp
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB292_13
# %bb.1:                                # %Engine_IsStart.exit
	cmpb	$0, 32(%eax)
	je	LBB292_13
# %bb.2:                                # %Engine_Stop.exit
	movb	$0, 32(%eax)
	movl	$8, _status_engine
	cmpb	$0, _Engine_PhaseStop
	jne	LBB292_5
	.p2align	4
LBB292_3:                               # %.preheader.i
                                        # =>This Inner Loop Header: Depth=1
	pushl	$1
	calll	_knRtSleep
	addl	$4, %esp
	cmpb	$0, _Engine_PhaseStop
	je	LBB292_3
LBB292_5:                               # %Engine_WaitStop.exit
	movl	_RUNplcfinalpoint, %esi
	testl	%esi, %esi
	je	LBB292_12
# %bb.6:
	xorps	%xmm0, %xmm0
	movsd	%xmm0, 4(%esp)
	movl	$0, 11(%esp)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 80(%esp)
	movups	%xmm0, 64(%esp)
	movups	%xmm0, 48(%esp)
	movups	%xmm0, 32(%esp)
	movups	%xmm0, 16(%esp)
	movl	$0, 95(%esp)
	leal	16(%esp), %eax
	movl	%eax, (%esp)
	movl	%esp, %eax
	.p2align	4
LBB292_7:                               # =>This Inner Loop Header: Depth=1
	movl	(%esi), %ecx
	pushl	12(%esi)
	pushl	8(%esi)
	pushl	4(%esi)
	pushl	%eax
	calll	*13(%ecx)
	addl	$16, %esp
	movl	(%eax), %ecx
	testl	%ecx, %ecx
	je	LBB292_9
# %bb.8:                                #   in Loop: Header=BB292_7 Depth=1
	movsd	(%ecx), %xmm0                   # xmm0 = mem[0],zero
	movsd	%xmm0, 16(%esi)
LBB292_9:                               #   in Loop: Header=BB292_7 Depth=1
	cmpb	$1, 11(%eax)
	je	LBB292_10
# %bb.11:                               #   in Loop: Header=BB292_7 Depth=1
	movl	24(%esi), %esi
	testl	%esi, %esi
	jne	LBB292_7
	jmp	LBB292_12
LBB292_10:
	movb	$0, 11(%eax)
LBB292_12:                              # %Logic_Final.exit
	calll	_Retain_Save
	movl	$0, _status_plccontrol
LBB292_13:                              # %Engine_IsStart.exit.thread
	movl	_indicate+224, %eax
	movb	$0, (%eax)
	movl	_indicate+194, %eax
	movb	$1, (%eax)
	movl	_indicate+254, %eax
	movb	$0, (%eax)
	movl	_indicate+284, %eax
	movb	$0, (%eax)
	movl	_indicate+674, %eax
	movl	$0, (%eax)
	addl	$100, %esp
	popl	%esi
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
	pushl	%esi
	movl	8(%esp), %esi
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB294_3
# %bb.1:                                # %Engine_IsStart.exit
	cmpb	$0, 32(%eax)
	je	LBB294_3
# %bb.2:                                # %Engine_Stop.exit
	movb	$0, 32(%eax)
	movl	$8, _status_engine
	calll	_Retain_Save
	movl	$8, _status_plccontrol
LBB294_3:                               # %Engine_IsStart.exit.thread
	movl	_indicate+224, %eax
	movb	$0, (%eax)
	movl	_indicate+194, %eax
	movb	$0, (%eax)
	movl	_indicate+254, %eax
	movb	$0, (%eax)
	movl	_indicate+284, %eax
	movb	$1, (%eax)
	movl	_indicate+674, %eax
	movl	%esi, (%eax)
	popl	%esi
	retl
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
	calll	*__imp__EgTagSetDefaultValue
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
	calll	*__imp__EgTagSetDefaultValue
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
	movl	_indicate+164, %eax
	movb	$1, (%eax)
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
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB301_2
# %bb.1:
	movb	$1, 33(%eax)
	movl	$6, _status_step
	movl	_indicate+254, %eax
	movb	$1, (%eax)
LBB301_2:                               # %Step_Enable.exit
	retl
                                        # -- End function
	.def	_PLCcontrol_StepDisable;
	.scl	2;
	.type	32;
	.endef
	.globl	_PLCcontrol_StepDisable         # -- Begin function PLCcontrol_StepDisable
	.p2align	4
_PLCcontrol_StepDisable:                # @PLCcontrol_StepDisable
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB302_4
# %bb.1:
	movb	$0, 33(%eax)
	movl	$2, _status_step
	movzwl	35(%eax), %eax
	pushl	%eax
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$4, %ax
	jne	LBB302_3
# %bb.2:
	movl	_sqtbl, %eax
	movzwl	35(%eax), %eax
	pushl	$1
	pushl	%eax
	calll	_ReleaseRtSemaphore
	addl	$8, %esp
LBB302_3:
	movl	_indicate+254, %eax
	movb	$0, (%eax)
LBB302_4:                               # %Step_Disable.exit
	retl
                                        # -- End function
	.def	_PLCcontrol_StepStep;
	.scl	2;
	.type	32;
	.endef
	.globl	_PLCcontrol_StepStep            # -- Begin function PLCcontrol_StepStep
	.p2align	4
_PLCcontrol_StepStep:                   # @PLCcontrol_StepStep
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB303_3
# %bb.1:
	movzwl	35(%eax), %eax
	pushl	%eax
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$4, %ax
	jne	LBB303_3
# %bb.2:
	movl	_sqtbl, %eax
	movzwl	35(%eax), %eax
	pushl	$1
	pushl	%eax
	calll	_ReleaseRtSemaphore
	addl	$8, %esp
LBB303_3:                               # %Step_Trigger.exit
	retl
                                        # -- End function
	.def	_Poufile_Add;
	.scl	2;
	.type	32;
	.endef
	.globl	_Poufile_Add                    # -- Begin function Poufile_Add
	.p2align	4
_Poufile_Add:                           # @Poufile_Add
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	20(%esp), %ebp
	pushl	$8
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %esi
	testl	%eax, %eax
	je	LBB304_1
# %bb.2:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%esi, (%eax)
	movl	$8, 4(%eax)
	movl	$"??_C@_0M@EIELBOGF@Poufile_Add?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB304_3
# %bb.4:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB304_5
LBB304_1:
	pushl	$"??_C@_0M@EIELBOGF@Poufile_Add?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB304_6
LBB304_3:
	movl	%eax, _heaplist
LBB304_5:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB304_6:                               # %Heap_Alloc.exit
	pushl	%ebp
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %ebx
	incl	%ebx
	pushl	%ebx
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %edi
	testl	%eax, %eax
	je	LBB304_7
# %bb.8:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%edi, (%eax)
	movl	%ebx, 4(%eax)
	movl	$"??_C@_0BF@NFHFPGMN@Poufile_Add?3filepath?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB304_9
# %bb.10:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB304_11
LBB304_7:
	pushl	$"??_C@_0BF@NFHFPGMN@Poufile_Add?3filepath?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB304_12
LBB304_9:
	movl	%eax, _heaplist
LBB304_11:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB304_12:                              # %Heap_Alloc.exit1
	movl	%edi, (%esi)
	pushl	%ebp
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
	movl	$0, 4(%esi)
	cmpl	$0, _poulist
	je	LBB304_13
# %bb.14:
	movl	_pouBottom, %eax
	movl	%esi, 4(%eax)
	jmp	LBB304_15
LBB304_13:
	movl	%esi, _poulist
LBB304_15:
	movl	%esi, _pouBottom
	movl	$2, _status_pou
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Poufile_Clear;
	.scl	2;
	.type	32;
	.endef
	.globl	_Poufile_Clear                  # -- Begin function Poufile_Clear
	.p2align	4
_Poufile_Clear:                         # @Poufile_Clear
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	_poulist, %esi
	testl	%esi, %esi
	jne	LBB305_1
LBB305_26:                              # %.loopexit7
	movl	$0, _pouBottom
	movl	$0, _poulist
	movl	$0, _status_pou
	popl	%esi
	popl	%edi
	retl
	.p2align	4
LBB305_18:                              # %.loopexit5.i4
                                        #   in Loop: Header=BB305_1 Depth=1
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB305_19
# %bb.21:                               #   in Loop: Header=BB305_1 Depth=1
	movl	%edx, 16(%ecx)
LBB305_23:                              #   in Loop: Header=BB305_1 Depth=1
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB305_24:                              # %.loopexit.i5
                                        #   in Loop: Header=BB305_1 Depth=1
	pushl	%esi
	calll	_free
	addl	$4, %esp
LBB305_25:                              # %Heap_Free.exit6
                                        #   in Loop: Header=BB305_1 Depth=1
	movl	%edi, _poulist
	movl	%edi, %esi
	testl	%edi, %edi
	je	LBB305_26
LBB305_1:                               # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB305_5 Depth 2
                                        #     Child Loop BB305_16 Depth 2
	movl	(%esi), %edi
	testl	%edi, %edi
	je	LBB305_2
# %bb.3:                                #   in Loop: Header=BB305_1 Depth=1
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB305_13
# %bb.4:                                #   in Loop: Header=BB305_1 Depth=1
	movl	%ecx, %eax
	cmpl	%edi, (%ecx)
	je	LBB305_7
	.p2align	4
LBB305_5:                               # %.preheader.i
                                        #   Parent Loop BB305_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB305_13
# %bb.6:                                #   in Loop: Header=BB305_5 Depth=2
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%edi, (%edx)
	jne	LBB305_5
LBB305_7:                               # %.loopexit5.i
                                        #   in Loop: Header=BB305_1 Depth=1
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB305_8
# %bb.10:                               #   in Loop: Header=BB305_1 Depth=1
	movl	%edx, 16(%ecx)
	jmp	LBB305_12
	.p2align	4
LBB305_2:                               # %.thread
                                        #   in Loop: Header=BB305_1 Depth=1
	movl	4(%esi), %edi
	jmp	LBB305_14
LBB305_19:                              #   in Loop: Header=BB305_1 Depth=1
	cmpl	%eax, %ecx
	je	LBB305_20
# %bb.22:                               #   in Loop: Header=BB305_1 Depth=1
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB305_23
LBB305_8:                               #   in Loop: Header=BB305_1 Depth=1
	cmpl	%eax, %ecx
	je	LBB305_9
# %bb.11:                               #   in Loop: Header=BB305_1 Depth=1
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB305_12
LBB305_20:                              #   in Loop: Header=BB305_1 Depth=1
	movl	$0, _heaplist
	movl	$0, _heapbottom
	jmp	LBB305_23
LBB305_9:                               #   in Loop: Header=BB305_1 Depth=1
	movl	$0, _heaplist
	movl	$0, _heapbottom
	.p2align	4
LBB305_12:                              #   in Loop: Header=BB305_1 Depth=1
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB305_13:                              # %.loopexit
                                        #   in Loop: Header=BB305_1 Depth=1
	pushl	%edi
	calll	_free
	addl	$4, %esp
	movl	4(%esi), %edi
	movl	_poulist, %esi
	testl	%esi, %esi
	je	LBB305_25
LBB305_14:                              #   in Loop: Header=BB305_1 Depth=1
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB305_24
# %bb.15:                               #   in Loop: Header=BB305_1 Depth=1
	movl	%ecx, %eax
	cmpl	%esi, (%ecx)
	je	LBB305_18
	.p2align	4
LBB305_16:                              # %.preheader.i3
                                        #   Parent Loop BB305_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB305_24
# %bb.17:                               #   in Loop: Header=BB305_16 Depth=2
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%esi, (%edx)
	jne	LBB305_16
	jmp	LBB305_18
                                        # -- End function
	.def	_Poufile_Display;
	.scl	2;
	.type	32;
	.endef
	.globl	_Poufile_Display                # -- Begin function Poufile_Display
	.p2align	4
_Poufile_Display:                       # @Poufile_Display
# %bb.0:
	pushl	%edi
	pushl	%esi
	pushl	$L_str.128
	calll	_puts
	addl	$4, %esp
	movl	_poulist, %esi
	testl	%esi, %esi
	je	LBB306_4
# %bb.1:                                # %.preheader.preheader
	movl	$1, %edi
	.p2align	4
LBB306_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	(%esi)
	pushl	%edi
	pushl	$"??_C@_0BE@CDIPEEK@?5?5POUfile?$CI?$CF03d?$CJ?5?$CFs?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	4(%esi), %esi
	incl	%edi
	testl	%esi, %esi
	jne	LBB306_2
	jmp	LBB306_3
LBB306_4:
	pushl	$L_str.1.254
	calll	_puts
	addl	$4, %esp
LBB306_3:                               # %.loopexit
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Poufile_Next;
	.scl	2;
	.type	32;
	.endef
	.globl	_Poufile_Next                   # -- Begin function Poufile_Next
	.p2align	4
_Poufile_Next:                          # @Poufile_Next
# %bb.0:
	movl	_pouenum, %ecx
	testl	%ecx, %ecx
	je	LBB307_1
# %bb.3:
	movl	(%ecx), %eax
	movl	4(%ecx), %ecx
	movl	%ecx, _pouenum
	retl
LBB307_1:
	xorl	%eax, %eax
	retl
                                        # -- End function
	.def	_Poufile_First;
	.scl	2;
	.type	32;
	.endef
	.globl	_Poufile_First                  # -- Begin function Poufile_First
	.p2align	4
_Poufile_First:                         # @Poufile_First
# %bb.0:
	movl	_poulist, %ecx
	movl	%ecx, _pouenum
	testl	%ecx, %ecx
	je	LBB308_1
# %bb.3:
	movl	(%ecx), %eax
	movl	4(%ecx), %ecx
	movl	%ecx, _pouenum
	retl
LBB308_1:
	xorl	%eax, %eax
	retl
                                        # -- End function
	.def	_Poufile_Set_Begin;
	.scl	2;
	.type	32;
	.endef
	.globl	_Poufile_Set_Begin              # -- Begin function Poufile_Set_Begin
	.p2align	4
_Poufile_Set_Begin:                     # @Poufile_Set_Begin
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	20(%esp), %ebp
	pushl	$8
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %esi
	testl	%eax, %eax
	je	LBB309_1
# %bb.2:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%esi, (%eax)
	movl	$8, 4(%eax)
	movl	$"??_C@_0BC@CBLIHDML@Poufile_Set_Begin?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB309_3
# %bb.4:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB309_5
LBB309_1:
	pushl	$"??_C@_0BC@CBLIHDML@Poufile_Set_Begin?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB309_6
LBB309_3:
	movl	%eax, _heaplist
LBB309_5:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB309_6:                               # %Heap_Alloc.exit
	pushl	%ebp
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %ebx
	incl	%ebx
	pushl	%ebx
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %edi
	testl	%eax, %eax
	je	LBB309_7
# %bb.8:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%edi, (%eax)
	movl	%ebx, 4(%eax)
	movl	$"??_C@_0BL@MIJAGEAP@Poufile_Set_Begin?3filepath?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB309_9
# %bb.10:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB309_11
LBB309_7:
	pushl	$"??_C@_0BL@MIJAGEAP@Poufile_Set_Begin?3filepath?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB309_12
LBB309_9:
	movl	%eax, _heaplist
LBB309_11:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB309_12:                              # %Heap_Alloc.exit1
	movl	%edi, (%esi)
	pushl	%ebp
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
	movl	$0, 4(%esi)
	movl	%esi, _poubegin
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Poufile_Get_Begin;
	.scl	2;
	.type	32;
	.endef
	.globl	_Poufile_Get_Begin              # -- Begin function Poufile_Get_Begin
	.p2align	4
_Poufile_Get_Begin:                     # @Poufile_Get_Begin
# %bb.0:
	movl	_poubegin, %eax
	testl	%eax, %eax
	je	LBB310_1
# %bb.3:
	movl	(%eax), %eax
	retl
LBB310_1:
	movl	$"??_C@_00CNPNBAHC@?$AA@", %eax
	retl
                                        # -- End function
	.def	_Poufile_Set_Final;
	.scl	2;
	.type	32;
	.endef
	.globl	_Poufile_Set_Final              # -- Begin function Poufile_Set_Final
	.p2align	4
_Poufile_Set_Final:                     # @Poufile_Set_Final
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	20(%esp), %ebp
	pushl	$8
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %esi
	testl	%eax, %eax
	je	LBB311_1
# %bb.2:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%esi, (%eax)
	movl	$8, 4(%eax)
	movl	$"??_C@_0BC@DOPEKAGM@Poufile_Set_Final?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB311_3
# %bb.4:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB311_5
LBB311_1:
	pushl	$"??_C@_0BC@DOPEKAGM@Poufile_Set_Final?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB311_6
LBB311_3:
	movl	%eax, _heaplist
LBB311_5:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB311_6:                               # %Heap_Alloc.exit
	pushl	%ebp
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %ebx
	incl	%ebx
	pushl	%ebx
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %edi
	testl	%eax, %eax
	je	LBB311_7
# %bb.8:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%edi, (%eax)
	movl	%ebx, 4(%eax)
	movl	$"??_C@_0BL@LBOMFFJG@Poufile_Set_Final?3filepath?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB311_9
# %bb.10:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB311_11
LBB311_7:
	pushl	$"??_C@_0BL@LBOMFFJG@Poufile_Set_Final?3filepath?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB311_12
LBB311_9:
	movl	%eax, _heaplist
LBB311_11:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB311_12:                              # %Heap_Alloc.exit1
	movl	%edi, (%esi)
	pushl	%ebp
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
	movl	$0, 4(%esi)
	movl	%esi, _poufinal
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Poufile_Get_Final;
	.scl	2;
	.type	32;
	.endef
	.globl	_Poufile_Get_Final              # -- Begin function Poufile_Get_Final
	.p2align	4
_Poufile_Get_Final:                     # @Poufile_Get_Final
# %bb.0:
	movl	_poufinal, %eax
	testl	%eax, %eax
	je	LBB312_1
# %bb.3:
	movl	(%eax), %eax
	retl
LBB312_1:
	movl	$"??_C@_00CNPNBAHC@?$AA@", %eax
	retl
                                        # -- End function
	.def	_Project_Reset;
	.scl	2;
	.type	32;
	.endef
	.globl	_Project_Reset                  # -- Begin function Project_Reset
	.p2align	4
_Project_Reset:                         # @Project_Reset
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	_plcLabel, %esi
	jmp	LBB313_1
	.p2align	4
LBB313_6:                               # %.loopexit5.i.i
                                        #   in Loop: Header=BB313_1 Depth=1
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB313_7
# %bb.9:                                #   in Loop: Header=BB313_1 Depth=1
	movl	%edx, 16(%ecx)
LBB313_11:                              #   in Loop: Header=BB313_1 Depth=1
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB313_12:                              # %Heap_Free.exit.i
                                        #   in Loop: Header=BB313_1 Depth=1
	pushl	%edi
	calll	_free
	addl	$4, %esp
	movl	%esi, _plcLabel
LBB313_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB313_4 Depth 2
	testl	%esi, %esi
	je	LBB313_13
# %bb.2:                                # %.preheader.i
                                        #   in Loop: Header=BB313_1 Depth=1
	movl	%esi, %edi
	movl	12(%esi), %esi
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB313_12
# %bb.3:                                #   in Loop: Header=BB313_1 Depth=1
	movl	%ecx, %eax
	cmpl	%edi, (%ecx)
	je	LBB313_6
	.p2align	4
LBB313_4:                               # %.preheader.i.i
                                        #   Parent Loop BB313_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB313_12
# %bb.5:                                #   in Loop: Header=BB313_4 Depth=2
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%edi, (%edx)
	jne	LBB313_4
	jmp	LBB313_6
LBB313_7:                               #   in Loop: Header=BB313_1 Depth=1
	cmpl	%eax, %ecx
	je	LBB313_8
# %bb.10:                               #   in Loop: Header=BB313_1 Depth=1
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB313_11
LBB313_8:                               #   in Loop: Header=BB313_1 Depth=1
	movl	$0, _heaplist
	movl	$0, _heapbottom
	jmp	LBB313_11
LBB313_13:                              # %Label_Clear.exit
	movl	$0, _plcLabelBottom
	movl	$0, _plcLabel
	movl	$0, _status_label
	calll	_Userfunction_Clear
	movl	_UserFBList, %esi
	jmp	LBB313_14
	.p2align	4
LBB313_19:                              # %.loopexit5.i.i3
                                        #   in Loop: Header=BB313_14 Depth=1
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB313_20
# %bb.22:                               #   in Loop: Header=BB313_14 Depth=1
	movl	%edx, 16(%ecx)
LBB313_24:                              #   in Loop: Header=BB313_14 Depth=1
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB313_25:                              # %Heap_Free.exit.i4
                                        #   in Loop: Header=BB313_14 Depth=1
	pushl	%edi
	calll	_free
	addl	$4, %esp
	movl	%esi, _UserFBList
LBB313_14:                              # %Label_Clear.exit
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB313_17 Depth 2
	testl	%esi, %esi
	je	LBB313_26
# %bb.15:                               # %.preheader.i1
                                        #   in Loop: Header=BB313_14 Depth=1
	movl	%esi, %edi
	movl	16(%esi), %esi
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB313_25
# %bb.16:                               #   in Loop: Header=BB313_14 Depth=1
	movl	%ecx, %eax
	cmpl	%edi, (%ecx)
	je	LBB313_19
	.p2align	4
LBB313_17:                              # %.preheader.i.i2
                                        #   Parent Loop BB313_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB313_25
# %bb.18:                               #   in Loop: Header=BB313_17 Depth=2
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%edi, (%edx)
	jne	LBB313_17
	jmp	LBB313_19
LBB313_20:                              #   in Loop: Header=BB313_14 Depth=1
	cmpl	%eax, %ecx
	je	LBB313_21
# %bb.23:                               #   in Loop: Header=BB313_14 Depth=1
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB313_24
LBB313_21:                              #   in Loop: Header=BB313_14 Depth=1
	movl	$0, _heaplist
	movl	$0, _heapbottom
	jmp	LBB313_24
LBB313_26:                              # %UserFB_Clear.exit
	movl	$0, _UserFBBottom
	movl	$0, _UserFBList
	movl	$0, _status_userFB
	movb	$0, _Instruction_UF
	movb	$0, _Instruction_UFB
	calll	_Instruction_CreateCatalog
	calll	_Basicfunction_CreateCatalog
	movl	$0, _plcentrypoint
	movl	$0, _plcbeginpoint
	movl	$0, _plcfinalpoint
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Project_Load;
	.scl	2;
	.type	32;
	.endef
	.globl	_Project_Load                   # -- Begin function Project_Load
	.p2align	4
_Project_Load:                          # @Project_Load
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	cmpb	$0, _MnmFilePath
	je	LBB314_1
# %bb.2:
	movl	_plcLabel, %esi
	jmp	LBB314_3
	.p2align	4
LBB314_8:                               # %.loopexit5.i.i
                                        #   in Loop: Header=BB314_3 Depth=1
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB314_9
# %bb.11:                               #   in Loop: Header=BB314_3 Depth=1
	movl	%edx, 16(%ecx)
LBB314_13:                              #   in Loop: Header=BB314_3 Depth=1
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB314_14:                              # %Heap_Free.exit.i
                                        #   in Loop: Header=BB314_3 Depth=1
	pushl	%edi
	calll	_free
	addl	$4, %esp
	movl	%esi, _plcLabel
LBB314_3:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB314_6 Depth 2
	testl	%esi, %esi
	je	LBB314_15
# %bb.4:                                # %.preheader.i
                                        #   in Loop: Header=BB314_3 Depth=1
	movl	%esi, %edi
	movl	12(%esi), %esi
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB314_14
# %bb.5:                                #   in Loop: Header=BB314_3 Depth=1
	movl	%ecx, %eax
	cmpl	%edi, (%ecx)
	je	LBB314_8
	.p2align	4
LBB314_6:                               # %.preheader.i.i
                                        #   Parent Loop BB314_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB314_14
# %bb.7:                                #   in Loop: Header=BB314_6 Depth=2
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%edi, (%edx)
	jne	LBB314_6
	jmp	LBB314_8
LBB314_9:                               #   in Loop: Header=BB314_3 Depth=1
	cmpl	%eax, %ecx
	je	LBB314_10
# %bb.12:                               #   in Loop: Header=BB314_3 Depth=1
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB314_13
LBB314_10:                              #   in Loop: Header=BB314_3 Depth=1
	movl	$0, _heaplist
	movl	$0, _heapbottom
	jmp	LBB314_13
LBB314_15:                              # %Label_Clear.exit
	movl	$0, _plcLabelBottom
	movl	$0, _plcLabel
	movl	$0, _status_label
	calll	_Userfunction_Clear
	movl	_UserFBList, %esi
	jmp	LBB314_16
	.p2align	4
LBB314_21:                              # %.loopexit5.i.i7
                                        #   in Loop: Header=BB314_16 Depth=1
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB314_22
# %bb.24:                               #   in Loop: Header=BB314_16 Depth=1
	movl	%edx, 16(%ecx)
LBB314_26:                              #   in Loop: Header=BB314_16 Depth=1
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB314_27:                              # %Heap_Free.exit.i8
                                        #   in Loop: Header=BB314_16 Depth=1
	pushl	%edi
	calll	_free
	addl	$4, %esp
	movl	%esi, _UserFBList
LBB314_16:                              # %Label_Clear.exit
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB314_19 Depth 2
	testl	%esi, %esi
	je	LBB314_28
# %bb.17:                               # %.preheader.i5
                                        #   in Loop: Header=BB314_16 Depth=1
	movl	%esi, %edi
	movl	16(%esi), %esi
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB314_27
# %bb.18:                               #   in Loop: Header=BB314_16 Depth=1
	movl	%ecx, %eax
	cmpl	%edi, (%ecx)
	je	LBB314_21
	.p2align	4
LBB314_19:                              # %.preheader.i.i6
                                        #   Parent Loop BB314_16 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB314_27
# %bb.20:                               #   in Loop: Header=BB314_19 Depth=2
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%edi, (%edx)
	jne	LBB314_19
	jmp	LBB314_21
LBB314_22:                              #   in Loop: Header=BB314_16 Depth=1
	cmpl	%eax, %ecx
	je	LBB314_23
# %bb.25:                               #   in Loop: Header=BB314_16 Depth=1
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB314_26
LBB314_23:                              #   in Loop: Header=BB314_16 Depth=1
	movl	$0, _heaplist
	movl	$0, _heapbottom
	jmp	LBB314_26
LBB314_28:                              # %UserFB_Clear.exit
	movl	$0, _UserFBBottom
	movl	$0, _UserFBList
	movl	$0, _status_userFB
	movb	$0, _Instruction_UF
	movb	$0, _Instruction_UFB
	calll	_Instruction_CreateCatalog
	calll	_Basicfunction_CreateCatalog
	movl	$0, _plcentrypoint
	movl	$0, _plcbeginpoint
	movl	$0, _plcfinalpoint
	movl	_poulist, %eax
	movl	%eax, _pouenum
	xorl	%esi, %esi
	testl	%eax, %eax
	je	LBB314_53
# %bb.29:                               # %Poufile_First.exit
	movl	(%eax), %ebx
	movl	4(%eax), %eax
	movl	%eax, _pouenum
	testl	%ebx, %ebx
	je	LBB314_53
# %bb.30:                               # %.preheader.preheader
	xorl	%esi, %esi
	.p2align	4
LBB314_31:                              # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movb	$0, _Instruction_UF
	movb	$0, _Instruction_UFB
	pushl	$128
	pushl	%ebx
	pushl	$_MnmFile_Base.Label
	calll	_strncpy
	addl	$12, %esp
	pushl	$46
	pushl	$_MnmFile_Base.Label
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB314_33
# %bb.32:                               #   in Loop: Header=BB314_31 Depth=1
	movb	$0, (%eax)
LBB314_33:                              #   in Loop: Header=BB314_31 Depth=1
	pushl	$92
	pushl	$_MnmFile_Base.Label
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB314_35
# %bb.34:                               #   in Loop: Header=BB314_31 Depth=1
	movl	%eax, %edi
	incl	%edi
	jmp	LBB314_36
	.p2align	4
LBB314_35:                              #   in Loop: Header=BB314_31 Depth=1
	pushl	$47
	pushl	$_MnmFile_Base.Label
	calll	_strrchr
	addl	$8, %esp
	leal	1(%eax), %edi
	testl	%eax, %eax
	movl	$_MnmFile_Base.Label, %eax
	cmovel	%eax, %edi
LBB314_36:                              # %MnmFile_Base.exit
                                        #   in Loop: Header=BB314_31 Depth=1
	pushl	%edi
	pushl	$_scope
	calll	_strcpy
	addl	$8, %esp
	pushl	%ebx
	calll	_MnmFile_Load
	addl	$4, %esp
	addl	%eax, %esi
	jne	LBB314_51
# %bb.37:                               # %MnmFile_Base.exit
                                        #   in Loop: Header=BB314_31 Depth=1
	cmpb	$1, _Instruction_UF
	jne	LBB314_51
# %bb.38:                               #   in Loop: Header=BB314_31 Depth=1
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %ebp
	incl	%ebp
	pushl	%ebp
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %ebx
	testl	%eax, %eax
	je	LBB314_39
# %bb.40:                               #   in Loop: Header=BB314_31 Depth=1
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%ebx, (%eax)
	movl	%ebp, 4(%eax)
	movl	$"??_C@_0BH@GBGNGJD@Project_Load?3ufuncname?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB314_41
# %bb.42:                               #   in Loop: Header=BB314_31 Depth=1
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB314_43
LBB314_39:                              #   in Loop: Header=BB314_31 Depth=1
	pushl	$"??_C@_0BH@GBGNGJD@Project_Load?3ufuncname?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB314_44
LBB314_41:                              #   in Loop: Header=BB314_31 Depth=1
	movl	%eax, _heaplist
LBB314_43:                              #   in Loop: Header=BB314_31 Depth=1
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB314_44:                              # %Heap_Alloc.exit
                                        #   in Loop: Header=BB314_31 Depth=1
	pushl	%edi
	pushl	%ebx
	calll	_strcpy
	addl	$8, %esp
	pushl	$19
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %ebp
	testl	%eax, %eax
	je	LBB314_45
# %bb.46:                               #   in Loop: Header=BB314_31 Depth=1
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%ebp, (%eax)
	movl	$19, 4(%eax)
	movl	$"??_C@_0CF@BCBIENMJ@Project_Loadinstructiontemplatee@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB314_47
# %bb.48:                               #   in Loop: Header=BB314_31 Depth=1
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB314_49
LBB314_45:                              #   in Loop: Header=BB314_31 Depth=1
	pushl	$"??_C@_0CF@BCBIENMJ@Project_Loadinstructiontemplatee@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB314_50
LBB314_47:                              #   in Loop: Header=BB314_31 Depth=1
	movl	%eax, _heaplist
LBB314_49:                              #   in Loop: Header=BB314_31 Depth=1
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB314_50:                              # %Heap_Alloc.exit9
                                        #   in Loop: Header=BB314_31 Depth=1
	movb	$1, 6(%ebp)
	movl	%ebx, (%ebp)
	movl	$_Userfunction_ReplaceInstruction, 13(%ebp)
	pushl	%ebp
	pushl	%edi
	calll	_Instruction_CreateUserfunctionCatalog
	addl	$8, %esp
LBB314_51:                              #   in Loop: Header=BB314_31 Depth=1
	movl	_pouenum, %eax
	testl	%eax, %eax
	je	LBB314_53
# %bb.52:                               # %Poufile_Next.exit
                                        #   in Loop: Header=BB314_31 Depth=1
	movl	(%eax), %ebx
	movl	4(%eax), %eax
	movl	%eax, _pouenum
	testl	%ebx, %ebx
	jne	LBB314_31
LBB314_53:                              # %Poufile_First.exit.thread
	movb	$0, _Instruction_UF
	movb	$0, _Instruction_UFB
	movb	$0, _scope
	movl	_poubegin, %eax
	testl	%eax, %eax
	je	LBB314_54
# %bb.55:
	movl	(%eax), %eax
	cmpb	$0, (%eax)
	je	LBB314_58
LBB314_57:
	pushl	%eax
	calll	_MnmFile_Load
	addl	$4, %esp
	addl	%eax, %esi
LBB314_58:
	movl	_poufinal, %eax
	testl	%eax, %eax
	je	LBB314_59
# %bb.60:
	movl	(%eax), %eax
	cmpb	$0, (%eax)
	je	LBB314_63
LBB314_62:
	pushl	%eax
	calll	_MnmFile_Load
	addl	$4, %esp
	addl	%eax, %esi
LBB314_63:
	movb	$0, _scope
	cmpb	$0, _MnmFilePath
	je	LBB314_65
# %bb.64:
	pushl	$_MnmFilePath
	calll	_MnmFile_Load
	addl	$4, %esp
	addl	%eax, %esi
LBB314_65:
	movl	_plcLabel, %edi
	testl	%edi, %edi
	je	LBB314_69
# %bb.66:                               # %.preheader.i10.preheader
	movl	%edi, %ebx
	.p2align	4
LBB314_67:                              # %.preheader.i10
                                        # =>This Inner Loop Header: Depth=1
	pushl	(%ebx)
	pushl	$_BaseName
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB314_79
# %bb.68:                               #   in Loop: Header=BB314_67 Depth=1
	movl	12(%ebx), %ebx
	testl	%ebx, %ebx
	jne	LBB314_67
LBB314_69:                              # %.loopexit
	pushl	$_BaseName
	pushl	$131
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	incl	%esi
	movl	_plcLabel, %edi
	testl	%edi, %edi
	jne	LBB314_71
	jmp	LBB314_78
LBB314_1:
	xorl	%esi, %esi
	jmp	LBB314_78
LBB314_54:
	movl	$"??_C@_00CNPNBAHC@?$AA@", %eax
	cmpb	$0, (%eax)
	jne	LBB314_57
	jmp	LBB314_58
LBB314_59:
	movl	$"??_C@_00CNPNBAHC@?$AA@", %eax
	cmpb	$0, (%eax)
	jne	LBB314_62
	jmp	LBB314_63
LBB314_79:                              # %Label_Search.exit
	movl	8(%ebx), %eax
	movl	%eax, _plcentrypoint
	testl	%edi, %edi
	je	LBB314_78
LBB314_71:                              # %.preheader.i11.preheader
	movl	%edi, %ebx
	.p2align	4
LBB314_72:                              # %.preheader.i11
                                        # =>This Inner Loop Header: Depth=1
	pushl	(%ebx)
	pushl	$"??_C@_05ILMMJGEC@BEGIN?$AA@"
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB314_74
# %bb.73:                               #   in Loop: Header=BB314_72 Depth=1
	movl	12(%ebx), %ebx
	testl	%ebx, %ebx
	jne	LBB314_72
	jmp	LBB314_75
LBB314_74:                              # %Label_Search.exit12
	movl	8(%ebx), %eax
	movl	%eax, _plcbeginpoint
	.p2align	4
LBB314_75:                              # %.preheader.i13
                                        # =>This Inner Loop Header: Depth=1
	pushl	(%edi)
	pushl	$"??_C@_05JEIAEFOF@FINAL?$AA@"
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB314_77
# %bb.76:                               #   in Loop: Header=BB314_75 Depth=1
	movl	12(%edi), %edi
	testl	%edi, %edi
	jne	LBB314_75
	jmp	LBB314_78
LBB314_77:                              # %Label_Search.exit14
	movl	8(%edi), %eax
	movl	%eax, _plcfinalpoint
LBB314_78:                              # %Label_Search.exit14.thread
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Property_Process_Priority;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process_Priority      # -- Begin function Property_Process_Priority
	.p2align	4
_Property_Process_Priority:             # @Property_Process_Priority
# %bb.0:
	pushl	%eax
	movl	8(%esp), %eax
	movl	__imp__ServiceRealName, %ecx
	pushl	(%eax)
	pushl	%ecx
	pushl	$"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
	pushl	$__ContainerTagName
	calll	_sprintf
	addl	$16, %esp
	movl	%esp, %eax
	pushl	$4
	pushl	%eax
	pushl	$__ContainerTagName
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB315_1
# %bb.2:
	popl	%eax
	retl
LBB315_1:
	movzbl	(%esp), %eax
	movb	%al, _bBasePriority
	popl	%eax
	retl
                                        # -- End function
	.def	_Property_Process_Nop;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process_Nop           # -- Begin function Property_Process_Nop
	.p2align	4
_Property_Process_Nop:                  # @Property_Process_Nop
# %bb.0:
	retl
                                        # -- End function
	.def	_Property_Process_Intprt;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process_Intprt        # -- Begin function Property_Process_Intprt
	.p2align	4
_Property_Process_Intprt:               # @Property_Process_Intprt
# %bb.0:
	pushl	%esi
	subl	$344, %esp                      # imm = 0x158
	movl	352(%esp), %eax
	movl	__imp__ServiceRealName, %ecx
	pushl	(%eax)
	pushl	%ecx
	pushl	$"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
	pushl	$__ContainerTagName
	calll	_sprintf
	addl	$16, %esp
	leal	136(%esp), %esi
	pushl	$80
	pushl	%esi
	pushl	$__ContainerTagName
	calll	*__imp__EgTagReadString
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB317_4
# %bb.1:
	movb	$1, _byRunMode
	pushl	%esi
	pushl	$_MnmFilePath
	calll	_strcpy
	addl	$8, %esp
	xorps	%xmm0, %xmm0
	movups	%xmm0, 8(%esp)
	movups	%xmm0, 24(%esp)
	movups	%xmm0, 40(%esp)
	movups	%xmm0, 56(%esp)
	movups	%xmm0, 72(%esp)
	movups	%xmm0, 88(%esp)
	movups	%xmm0, 104(%esp)
	movups	%xmm0, 120(%esp)
	leal	216(%esp), %esi
	pushl	$_MnmFilePath
	pushl	%esi
	calll	_strcpy
	addl	$8, %esp
	movw	$77, 4(%esp)
	movl	$1414416722, (%esp)             # imm = 0x544E4952
	pushl	$3
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movl	%esp, %ecx
	movzwl	%ax, %eax
	pushl	$0
	pushl	%ecx
	pushl	%eax
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	movl	$92, %eax
	movl	$47, %ecx
	cmovel	%eax, %ecx
	pushl	%ecx
	pushl	%esi
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB317_3
# %bb.2:
	movb	$0, 1(%eax)
	leal	8(%esp), %eax
	pushl	%esi
	pushl	%eax
	calll	_strcpy
	addl	$8, %esp
LBB317_3:                               # %Argument_PathFromFolder.exit
	leal	8(%esp), %eax
	pushl	%eax
	pushl	$_WorkFolder
	calll	_strcpy
	addl	$8, %esp
	pushl	$128
	pushl	%esi
	pushl	$_MnmFilePath
	calll	_Argument_PathFromBase
	addl	$12, %esp
	pushl	%esi
	pushl	$_BaseName
	calll	_strcpy
	addl	$8, %esp
LBB317_4:
	addl	$344, %esp                      # imm = 0x158
	popl	%esi
	retl
                                        # -- End function
	.def	_Property_Process_Pou;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process_Pou           # -- Begin function Property_Process_Pou
	.p2align	4
_Property_Process_Pou:                  # @Property_Process_Pou
# %bb.0:
	pushl	%esi
	subl	$1024, %esp                     # imm = 0x400
	movl	1032(%esp), %eax
	movl	__imp__ServiceRealName, %ecx
	pushl	(%eax)
	pushl	%ecx
	pushl	$"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
	pushl	$__ContainerTagName
	calll	_sprintf
	addl	$16, %esp
	movl	%esp, %esi
	pushl	$1024                           # imm = 0x400
	pushl	%esi
	pushl	$__ContainerTagName
	calll	*__imp__EgTagReadString
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB318_2
# %bb.1:
	pushl	%esi
	calll	_Argument_PouFiles
	addl	$4, %esp
LBB318_2:
	addl	$1024, %esp                     # imm = 0x400
	popl	%esi
	retl
                                        # -- End function
	.def	_Property_Process_PouBegin;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process_PouBegin      # -- Begin function Property_Process_PouBegin
	.p2align	4
_Property_Process_PouBegin:             # @Property_Process_PouBegin
# %bb.0:
	pushl	%esi
	subl	$80, %esp
	movl	88(%esp), %eax
	movl	__imp__ServiceRealName, %ecx
	pushl	(%eax)
	pushl	%ecx
	pushl	$"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
	pushl	$__ContainerTagName
	calll	_sprintf
	addl	$16, %esp
	movl	%esp, %esi
	pushl	$80
	pushl	%esi
	pushl	$__ContainerTagName
	calll	*__imp__EgTagReadString
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB319_2
# %bb.1:
	pushl	%esi
	calll	_Poufile_Set_Begin
	addl	$4, %esp
LBB319_2:
	addl	$80, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_Property_Process_PouFinal;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process_PouFinal      # -- Begin function Property_Process_PouFinal
	.p2align	4
_Property_Process_PouFinal:             # @Property_Process_PouFinal
# %bb.0:
	pushl	%esi
	subl	$80, %esp
	movl	88(%esp), %eax
	movl	__imp__ServiceRealName, %ecx
	pushl	(%eax)
	pushl	%ecx
	pushl	$"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
	pushl	$__ContainerTagName
	calll	_sprintf
	addl	$16, %esp
	movl	%esp, %esi
	pushl	$80
	pushl	%esi
	pushl	$__ContainerTagName
	calll	*__imp__EgTagReadString
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB320_2
# %bb.1:
	pushl	%esi
	calll	_Poufile_Set_Final
	addl	$4, %esp
LBB320_2:
	addl	$80, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_Property_Process_NoPrint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process_NoPrint       # -- Begin function Property_Process_NoPrint
	.p2align	4
_Property_Process_NoPrint:              # @Property_Process_NoPrint
# %bb.0:
	pushl	%eax
	movl	8(%esp), %eax
	movl	__imp__ServiceRealName, %ecx
	pushl	(%eax)
	pushl	%ecx
	pushl	$"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
	pushl	$__ContainerTagName
	calll	_sprintf
	addl	$16, %esp
	movl	%esp, %eax
	pushl	$4
	pushl	%eax
	pushl	$__ContainerTagName
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB321_3
# %bb.1:
	cmpl	$1, (%esp)
	jne	LBB321_3
# %bb.2:
	movb	$0, _bPrintMode
LBB321_3:
	popl	%eax
	retl
                                        # -- End function
	.def	_Property_Process_Remote;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process_Remote        # -- Begin function Property_Process_Remote
	.p2align	4
_Property_Process_Remote:               # @Property_Process_Remote
# %bb.0:
	pushl	%eax
	movl	8(%esp), %eax
	movl	__imp__ServiceRealName, %ecx
	pushl	(%eax)
	pushl	%ecx
	pushl	$"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
	pushl	$__ContainerTagName
	calll	_sprintf
	addl	$16, %esp
	movl	%esp, %eax
	pushl	$4
	pushl	%eax
	pushl	$__ContainerTagName
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB322_1
# %bb.2:
	popl	%eax
	retl
LBB322_1:
	movzbl	(%esp), %eax
	movb	%al, _bRemote
	popl	%eax
	retl
                                        # -- End function
	.def	_Property_Process_Step;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process_Step          # -- Begin function Property_Process_Step
	.p2align	4
_Property_Process_Step:                 # @Property_Process_Step
# %bb.0:
	pushl	%eax
	movl	8(%esp), %eax
	movl	__imp__ServiceRealName, %ecx
	pushl	(%eax)
	pushl	%ecx
	pushl	$"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
	pushl	$__ContainerTagName
	calll	_sprintf
	addl	$16, %esp
	movl	%esp, %eax
	pushl	$4
	pushl	%eax
	pushl	$__ContainerTagName
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB323_1
# %bb.2:
	popl	%eax
	retl
LBB323_1:
	movzbl	(%esp), %eax
	movb	%al, _bStepMode
	popl	%eax
	retl
                                        # -- End function
	.def	_Property_Process_Scanrate;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process_Scanrate      # -- Begin function Property_Process_Scanrate
	.p2align	4
_Property_Process_Scanrate:             # @Property_Process_Scanrate
# %bb.0:
	pushl	%eax
	movl	8(%esp), %eax
	movl	__imp__ServiceRealName, %ecx
	pushl	(%eax)
	pushl	%ecx
	pushl	$"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
	pushl	$__ContainerTagName
	calll	_sprintf
	addl	$16, %esp
	movl	%esp, %eax
	pushl	$4
	pushl	%eax
	pushl	$__ContainerTagName
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB324_1
# %bb.2:
	popl	%eax
	retl
LBB324_1:
	movl	(%esp), %eax
	movl	%eax, _dwScanFreq
	popl	%eax
	retl
                                        # -- End function
	.def	_Property_Process_Retain;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process_Retain        # -- Begin function Property_Process_Retain
	.p2align	4
_Property_Process_Retain:               # @Property_Process_Retain
# %bb.0:
	pushl	%esi
	subl	$80, %esp
	movl	88(%esp), %eax
	movl	__imp__ServiceRealName, %ecx
	pushl	(%eax)
	pushl	%ecx
	pushl	$"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
	pushl	$__ContainerTagName
	calll	_sprintf
	addl	$16, %esp
	movl	%esp, %esi
	pushl	$80
	pushl	%esi
	pushl	$__ContainerTagName
	calll	*__imp__EgTagReadString
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB325_2
# %bb.1:
	pushl	%esi
	pushl	$"??_C@_0BA@FBAMOBLD@SERVICE?4?$CFs?4Save?$AA@"
	pushl	$__Retain_Save
	calll	_sprintf
	addl	$12, %esp
	pushl	%esi
	pushl	$"??_C@_0BA@FDBBBCGH@SERVICE?4?$CFs?4Load?$AA@"
	pushl	$__Retain_Load
	calll	_sprintf
	addl	$12, %esp
LBB325_2:
	addl	$80, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_Property_Process;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process               # -- Begin function Property_Process
	.p2align	4
_Property_Process:                      # @Property_Process
# %bb.0:
	cmpl	$0, _property
	je	LBB326_4
# %bb.1:                                # %.preheader.preheader
	pushl	%esi
	movl	$_property, %esi
	.p2align	4
LBB326_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%esi
	calll	*13(%esi)
	addl	$4, %esp
	cmpl	$0, 29(%esi)
	leal	29(%esi), %esi
	jne	LBB326_2
# %bb.3:
	popl	%esi
LBB326_4:                               # %.loopexit
	retl
                                        # -- End function
	.def	_Property_Get_Priority;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Get_Priority          # -- Begin function Property_Get_Priority
	.p2align	4
_Property_Get_Priority:                 # @Property_Get_Priority
# %bb.0:
	pushl	%eax
	movl	$140, (%esp)
	movl	__imp__ServiceRealName, %eax
	pushl	$"??_C@_08KGEIBGG@Priority?$AA@"
	pushl	%eax
	pushl	$"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
	pushl	$__ContainerTagName
	calll	_sprintf
	addl	$16, %esp
	movl	%esp, %eax
	pushl	$4
	pushl	%eax
	pushl	$__ContainerTagName
	calll	*__imp__EgTagRead
	addl	$12, %esp
	movl	(%esp), %eax
	popl	%ecx
	retl
                                        # -- End function
	.def	_Property_Get_Interval;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Get_Interval          # -- Begin function Property_Get_Interval
	.p2align	4
_Property_Get_Interval:                 # @Property_Get_Interval
# %bb.0:
	pushl	%eax
	movl	$1, (%esp)
	movl	__imp__ServiceRealName, %eax
	pushl	$"??_C@_08KDKDEPAG@Interval?$AA@"
	pushl	%eax
	pushl	$"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
	pushl	$__ContainerTagName
	calll	_sprintf
	addl	$16, %esp
	movl	%esp, %eax
	pushl	$4
	pushl	%eax
	pushl	$__ContainerTagName
	calll	*__imp__EgTagRead
	addl	$12, %esp
	movl	(%esp), %eax
	popl	%ecx
	retl
                                        # -- End function
	.def	_Property_Get_Autorun;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Get_Autorun           # -- Begin function Property_Get_Autorun
	.p2align	4
_Property_Get_Autorun:                  # @Property_Get_Autorun
# %bb.0:
	pushl	%eax
	movb	$1, 3(%esp)
	movl	__imp__ServiceRealName, %eax
	pushl	$"??_C@_07ICCLJJJJ@AutoRun?$AA@"
	pushl	%eax
	pushl	$"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
	pushl	$__ContainerTagName
	calll	_sprintf
	addl	$16, %esp
	leal	3(%esp), %eax
	pushl	$1
	pushl	%eax
	pushl	$__ContainerTagName
	calll	*__imp__EgTagRead
	addl	$12, %esp
	movzbl	3(%esp), %eax
	popl	%ecx
	retl
                                        # -- End function
	.def	_Property_Init;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Init                  # -- Begin function Property_Init
	.p2align	4
_Property_Init:                         # @Property_Init
# %bb.0:
	cmpl	$0, _property
	je	LBB330_4
# %bb.1:                                # %.preheader.preheader
	pushl	%esi
	movl	$_property, %esi
	.p2align	4
LBB330_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%esi
	calll	*13(%esi)
	addl	$4, %esp
	cmpl	$0, 29(%esi)
	leal	29(%esi), %esi
	jne	LBB330_2
# %bb.3:
	popl	%esi
LBB330_4:                               # %.loopexit
	movb	$1, %al
	retl
                                        # -- End function
	.def	_Reservedword_CalcHash;
	.scl	2;
	.type	32;
	.endef
	.globl	_Reservedword_CalcHash          # -- Begin function Reservedword_CalcHash
	.p2align	4
_Reservedword_CalcHash:                 # @Reservedword_CalcHash
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$104, %esp
	movl	124(%esp), %ebx
	movaps	__xmm@1032547698badcfeefcdab8967452301, %xmm0 # xmm0 = [1732584193,4023233417,2562383102,271733878]
	movups	%xmm0, (%esp)
	pushl	%ebx
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %esi
	leal	(,%eax,8), %eax
	movl	%eax, 16(%esp)
	movl	%esi, %eax
	shrl	$29, %eax
	movl	%eax, 20(%esp)
	xorl	%eax, %eax
	cmpl	$64, %esi
	jb	LBB331_4
# %bb.1:
	leal	24(%esp), %edx
	movups	48(%ebx), %xmm0
	movups	%xmm0, 72(%esp)
	movups	32(%ebx), %xmm0
	movups	%xmm0, 56(%esp)
	movups	(%ebx), %xmm0
	movups	16(%ebx), %xmm1
	movups	%xmm1, 40(%esp)
	movups	%xmm0, 24(%esp)
	movl	%esp, %ecx
	calll	_MD5Transform
	movl	$64, %eax
	cmpl	$128, %esi
	jb	LBB331_4
# %bb.2:                                # %.preheader.i.i.preheader
	movl	$64, %ebp
	movl	%esp, %edi
	.p2align	4
LBB331_3:                               # %.preheader.i.i
                                        # =>This Inner Loop Header: Depth=1
	leal	(%ebx,%ebp), %edx
	movl	%edi, %ecx
	calll	_MD5Transform
	leal	64(%ebp), %eax
	addl	$127, %ebp
	cmpl	%esi, %ebp
	movl	%eax, %ebp
	jb	LBB331_3
LBB331_4:                               # %_Hash.exit
	subl	%eax, %esi
	addl	%eax, %ebx
	leal	24(%esp), %eax
	pushl	%esi
	pushl	%ebx
	pushl	%eax
	calll	_memcpy
	addl	$12, %esp
	movl	%esp, %eax
	leal	88(%esp), %ecx
	pushl	%eax
	pushl	%ecx
	calll	_MD5Final
	addl	$8, %esp
	movzbl	92(%esp), %eax
                                        # kill: def $ax killed $ax killed $eax
	addl	$104, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Reservedword_CreateCatalog;
	.scl	2;
	.type	32;
	.endef
	.globl	_Reservedword_CreateCatalog     # -- Begin function Reservedword_CreateCatalog
	.p2align	4
_Reservedword_CreateCatalog:            # @Reservedword_CreateCatalog
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$108, %esp
	xorl	%eax, %eax
	leal	20(%esp), %ebp
	jmp	LBB332_1
	.p2align	4
LBB332_7:                               #   in Loop: Header=BB332_1 Depth=1
	leal	_ReservedwordCatalog(,%eax,2), %eax
	movl	%esi, (%eax)
LBB332_8:                               #   in Loop: Header=BB332_1 Depth=1
	movl	(%esp), %eax                    # 4-byte Reload
	incl	%eax
	cmpl	$29, %eax
	je	LBB332_9
LBB332_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB332_4 Depth 2
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	_reservedwords(,%eax,4), %esi
	movaps	__xmm@1032547698badcfeefcdab8967452301, %xmm0 # xmm0 = [1732584193,4023233417,2562383102,271733878]
	movups	%xmm0, 20(%esp)
	pushl	%esi
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %ebx
	leal	(,%eax,8), %eax
	movl	%eax, 36(%esp)
	movl	%ebx, %eax
	shrl	$29, %eax
	movl	%eax, 40(%esp)
	movl	$0, %eax
	cmpl	$64, %ebx
	jb	LBB332_5
# %bb.2:                                #   in Loop: Header=BB332_1 Depth=1
	movups	48(%esi), %xmm0
	leal	44(%esp), %edx
	movups	%xmm0, 48(%edx)
	movups	32(%esi), %xmm0
	movups	%xmm0, 32(%edx)
	movups	(%esi), %xmm0
	movups	16(%esi), %xmm1
	movups	%xmm1, 16(%edx)
	movups	%xmm0, (%edx)
	movl	%ebp, %ecx
	calll	_MD5Transform
	movl	$64, %eax
	cmpl	$128, %ebx
	jb	LBB332_5
# %bb.3:                                # %.preheader.i.i.preheader
                                        #   in Loop: Header=BB332_1 Depth=1
	movl	$64, %edi
	.p2align	4
LBB332_4:                               # %.preheader.i.i
                                        #   Parent Loop BB332_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	(%esi,%edi), %edx
	movl	%ebp, %ecx
	calll	_MD5Transform
	leal	64(%edi), %eax
	addl	$127, %edi
	cmpl	%ebx, %edi
	movl	%eax, %edi
	jb	LBB332_4
LBB332_5:                               # %_Hash.exit
                                        #   in Loop: Header=BB332_1 Depth=1
	subl	%eax, %ebx
	addl	%esi, %eax
	pushl	%ebx
	pushl	%eax
	leal	52(%esp), %eax
	pushl	%eax
	calll	_memcpy
	addl	$12, %esp
	pushl	%ebp
	leal	8(%esp), %eax
	pushl	%eax
	calll	_MD5Final
	addl	$8, %esp
	movzbl	8(%esp), %eax
	leal	(%eax,%eax,2), %eax
	cmpl	$0, _ReservedwordCatalog(%eax,%eax)
	je	LBB332_7
# %bb.6:                                #   in Loop: Header=BB332_1 Depth=1
	pushl	%esi
	pushl	$"??_C@_0CK@FHKDIDKH@reservedword?5hash?5conflict?$CB?5?$CFs?4?5@"
	calll	_printf
	addl	$8, %esp
	jmp	LBB332_8
LBB332_9:
	xorl	%eax, %eax
	addl	$108, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Reservedword_Check;
	.scl	2;
	.type	32;
	.endef
	.globl	_Reservedword_Check             # -- Begin function Reservedword_Check
	.p2align	4
_Reservedword_Check:                    # @Reservedword_Check
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$104, %esp
	movl	124(%esp), %ebp
	xorl	%eax, %eax
	testl	%ebp, %ebp
	je	LBB333_8
# %bb.1:
	movaps	__xmm@1032547698badcfeefcdab8967452301, %xmm0 # xmm0 = [1732584193,4023233417,2562383102,271733878]
	movups	%xmm0, (%esp)
	pushl	%ebp
	calll	_strlen
	xorl	%ecx, %ecx
	addl	$4, %esp
	movl	%eax, %esi
	leal	(,%eax,8), %eax
	movl	%eax, 16(%esp)
	movl	%esi, %eax
	shrl	$29, %eax
	movl	%eax, 20(%esp)
	cmpl	$64, %esi
	jb	LBB333_5
# %bb.2:
	leal	24(%esp), %edx
	movups	48(%ebp), %xmm0
	movups	%xmm0, 72(%esp)
	movups	32(%ebp), %xmm0
	movups	%xmm0, 56(%esp)
	movups	(%ebp), %xmm0
	movups	16(%ebp), %xmm1
	movups	%xmm1, 40(%esp)
	movups	%xmm0, 24(%esp)
	movl	%esp, %ecx
	calll	_MD5Transform
	movl	$64, %ecx
	cmpl	$128, %esi
	jb	LBB333_5
# %bb.3:                                # %.preheader.i.i.preheader
	movl	$64, %ebx
	movl	%esp, %edi
	.p2align	4
LBB333_4:                               # %.preheader.i.i
                                        # =>This Inner Loop Header: Depth=1
	leal	(%ebx,%ebp), %edx
	movl	%edi, %ecx
	calll	_MD5Transform
	leal	64(%ebx), %ecx
	addl	$127, %ebx
	cmpl	%esi, %ebx
	movl	%ecx, %ebx
	jb	LBB333_4
LBB333_5:                               # %_Hash.exit
	subl	%ecx, %esi
	addl	%ebp, %ecx
	leal	24(%esp), %eax
	pushl	%esi
	pushl	%ecx
	pushl	%eax
	calll	_memcpy
	addl	$12, %esp
	movl	%esp, %eax
	leal	88(%esp), %ecx
	pushl	%eax
	pushl	%ecx
	calll	_MD5Final
	addl	$8, %esp
	movzbl	92(%esp), %eax
	leal	(%eax,%eax,2), %eax
	movl	_ReservedwordCatalog(%eax,%eax), %eax
	testl	%eax, %eax
	je	LBB333_6
# %bb.7:
	pushl	%ebp
	pushl	%eax
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	sete	%al
	jmp	LBB333_8
LBB333_6:
	xorl	%eax, %eax
LBB333_8:
                                        # kill: def $al killed $al killed $eax
	addl	$104, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Retain_Set_Tagname;
	.scl	2;
	.type	32;
	.endef
	.globl	_Retain_Set_Tagname             # -- Begin function Retain_Set_Tagname
	.p2align	4
_Retain_Set_Tagname:                    # @Retain_Set_Tagname
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	pushl	%esi
	pushl	$"??_C@_0BA@FBAMOBLD@SERVICE?4?$CFs?4Save?$AA@"
	pushl	$__Retain_Save
	calll	_sprintf
	addl	$12, %esp
	pushl	%esi
	pushl	$"??_C@_0BA@FDBBBCGH@SERVICE?4?$CFs?4Load?$AA@"
	pushl	$__Retain_Load
	calll	_sprintf
	addl	$12, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_Retain_Load_Request;
	.scl	2;
	.type	32;
	.endef
	.globl	_Retain_Load_Request            # -- Begin function Retain_Load_Request
	.p2align	4
_Retain_Load_Request:                   # @Retain_Load_Request
# %bb.0:
	pushl	%eax
	movl	_Retain_Load_Request.loadordernumber, %eax
	leal	1(%eax), %ecx
	cmpl	$1, %ecx
	adcl	$1, %eax
	movl	%eax, _Retain_Load_Request.loadordernumber
	movl	%eax, (%esp)
	movl	%esp, %eax
	pushl	$4
	pushl	%eax
	pushl	$__Retain_Load
	calll	*__imp__EgTagWrite
	addl	$12, %esp
	testl	%eax, %eax
	sete	%al
	popl	%ecx
	retl
                                        # -- End function
	.def	_Retain_Save_Request;
	.scl	2;
	.type	32;
	.endef
	.globl	_Retain_Save_Request            # -- Begin function Retain_Save_Request
	.p2align	4
_Retain_Save_Request:                   # @Retain_Save_Request
# %bb.0:
	pushl	%eax
	movl	_Retain_Save_Request.saveordernumber, %eax
	leal	1(%eax), %ecx
	cmpl	$1, %ecx
	adcl	$1, %eax
	movl	%eax, _Retain_Save_Request.saveordernumber
	movl	%eax, (%esp)
	movl	%esp, %eax
	pushl	$4
	pushl	%eax
	pushl	$__Retain_Save
	calll	*__imp__EgTagWrite
	addl	$12, %esp
	testl	%eax, %eax
	sete	%al
	popl	%ecx
	retl
                                        # -- End function
	.def	_Retain_Load_Wait;
	.scl	2;
	.type	32;
	.endef
	.globl	_Retain_Load_Wait               # -- Begin function Retain_Load_Wait
	.p2align	4
_Retain_Load_Wait:                      # @Retain_Load_Wait
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	%eax
	movl	%esp, %esi
	pushl	$4
	pushl	%esi
	pushl	$__Retain_Load
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB337_1
LBB337_6:
	xorl	%eax, %eax
LBB337_7:                               # %.loopexit
                                        # kill: def $al killed $al killed $eax
	addl	$4, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
LBB337_1:                               # %.preheader.preheader
	movl	20(%esp), %edi
	movl	__imp__EgTagRead, %ebx
	.p2align	4
LBB337_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, (%esp)
	je	LBB337_3
# %bb.4:                                #   in Loop: Header=BB337_2 Depth=1
	movl	%edi, %eax
	subl	$100, %eax
	cmovael	%eax, %edi
	testl	%edi, %edi
	je	LBB337_6
# %bb.5:                                #   in Loop: Header=BB337_2 Depth=1
	pushl	$100
	calll	_RtSleepEx
	addl	$4, %esp
	pushl	$4
	pushl	%esi
	pushl	$__Retain_Load
	calll	*%ebx
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB337_2
	jmp	LBB337_6
LBB337_3:
	movb	$1, %al
	jmp	LBB337_7
                                        # -- End function
	.def	_Retain_Save_Wait;
	.scl	2;
	.type	32;
	.endef
	.globl	_Retain_Save_Wait               # -- Begin function Retain_Save_Wait
	.p2align	4
_Retain_Save_Wait:                      # @Retain_Save_Wait
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	%eax
	movl	%esp, %esi
	pushl	$4
	pushl	%esi
	pushl	$__Retain_Save
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB338_1
LBB338_6:
	xorl	%eax, %eax
LBB338_7:                               # %.loopexit
                                        # kill: def $al killed $al killed $eax
	addl	$4, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
LBB338_1:                               # %.preheader.preheader
	movl	20(%esp), %edi
	addl	$100, %edi
	movl	__imp__EgTagRead, %ebx
	.p2align	4
LBB338_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, (%esp)
	je	LBB338_3
# %bb.4:                                #   in Loop: Header=BB338_2 Depth=1
	addl	$-100, %edi
	cmpl	$101, %edi
	jb	LBB338_6
# %bb.5:                                #   in Loop: Header=BB338_2 Depth=1
	pushl	$100
	calll	_RtSleepEx
	addl	$4, %esp
	pushl	$4
	pushl	%esi
	pushl	$__Retain_Save
	calll	*%ebx
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB338_2
	jmp	LBB338_6
LBB338_3:
	movb	$1, %al
	jmp	LBB338_7
                                        # -- End function
	.def	_Retain_Save;
	.scl	2;
	.type	32;
	.endef
	.globl	_Retain_Save                    # -- Begin function Retain_Save
	.p2align	4
_Retain_Save:                           # @Retain_Save
# %bb.0:
	pushl	%esi
	subl	$8, %esp
	movl	_Retain_Save_Request.saveordernumber, %eax
	leal	1(%eax), %ecx
	cmpl	$1, %ecx
	adcl	$1, %eax
	movl	%eax, _Retain_Save_Request.saveordernumber
	movl	%eax, 4(%esp)
	leal	4(%esp), %eax
	pushl	$4
	pushl	%eax
	pushl	$__Retain_Save
	calll	*__imp__EgTagWrite
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB339_3
# %bb.2:
	movl	%esp, %esi
	pushl	$4
	pushl	%esi
	pushl	$__Retain_Save
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB339_5
LBB339_3:
	xorl	%eax, %eax
LBB339_4:
                                        # kill: def $al killed $al killed $eax
	addl	$8, %esp
	popl	%esi
	retl
LBB339_5:
	movb	$1, %al
	cmpl	$0, (%esp)
	je	LBB339_4
# %bb.6:
	pushl	$100
	calll	_RtSleepEx
	addl	$4, %esp
	pushl	$4
	pushl	%esi
	pushl	$__Retain_Save
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB339_3
# %bb.8:
	cmpl	$0, (%esp)
	je	LBB339_11
# %bb.9:
	pushl	$100
	calll	_RtSleepEx
	addl	$4, %esp
	pushl	$4
	pushl	%esi
	pushl	$__Retain_Save
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB339_3
# %bb.12:
	cmpl	$0, (%esp)
	je	LBB339_11
# %bb.13:
	pushl	$100
	calll	_RtSleepEx
	addl	$4, %esp
	pushl	$4
	pushl	%esi
	pushl	$__Retain_Save
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB339_3
# %bb.16:
	cmpl	$0, (%esp)
	movb	$1, %al
	je	LBB339_4
# %bb.17:
	pushl	$100
	calll	_RtSleepEx
	addl	$4, %esp
	pushl	$4
	pushl	%esi
	pushl	$__Retain_Save
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB339_3
# %bb.19:
	cmpl	$0, (%esp)
	sete	%al
	jmp	LBB339_4
LBB339_11:
	movb	$1, %al
	jmp	LBB339_4
                                        # -- End function
	.def	_Retain_Load;
	.scl	2;
	.type	32;
	.endef
	.globl	_Retain_Load                    # -- Begin function Retain_Load
	.p2align	4
_Retain_Load:                           # @Retain_Load
# %bb.0:
	pushl	%esi
	subl	$8, %esp
	movl	_Retain_Load_Request.loadordernumber, %eax
	leal	1(%eax), %ecx
	cmpl	$1, %ecx
	adcl	$1, %eax
	movl	%eax, _Retain_Load_Request.loadordernumber
	movl	%eax, 4(%esp)
	leal	4(%esp), %eax
	pushl	$4
	pushl	%eax
	pushl	$__Retain_Load
	calll	*__imp__EgTagWrite
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB340_3
# %bb.2:
	movl	%esp, %esi
	pushl	$4
	pushl	%esi
	pushl	$__Retain_Load
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB340_5
LBB340_3:
	xorl	%eax, %eax
LBB340_4:
                                        # kill: def $al killed $al killed $eax
	addl	$8, %esp
	popl	%esi
	retl
LBB340_5:
	movb	$1, %al
	cmpl	$0, (%esp)
	je	LBB340_4
# %bb.6:
	pushl	$100
	calll	_RtSleepEx
	addl	$4, %esp
	pushl	$4
	pushl	%esi
	pushl	$__Retain_Load
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB340_3
# %bb.8:
	cmpl	$0, (%esp)
	je	LBB340_11
# %bb.9:
	pushl	$100
	calll	_RtSleepEx
	addl	$4, %esp
	pushl	$4
	pushl	%esi
	pushl	$__Retain_Load
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB340_3
# %bb.12:
	cmpl	$0, (%esp)
	je	LBB340_11
# %bb.13:
	pushl	$100
	calll	_RtSleepEx
	addl	$4, %esp
	pushl	$4
	pushl	%esi
	pushl	$__Retain_Load
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB340_3
# %bb.16:
	cmpl	$0, (%esp)
	movb	$1, %al
	je	LBB340_4
# %bb.17:
	pushl	$100
	calll	_RtSleepEx
	addl	$4, %esp
	pushl	$4
	pushl	%esi
	pushl	$__Retain_Load
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB340_3
# %bb.19:
	cmpl	$0, (%esp)
	sete	%al
	jmp	LBB340_4
LBB340_11:
	movb	$1, %al
	jmp	LBB340_4
                                        # -- End function
	.def	_Rtedge_TagCreate;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_TagCreate               # -- Begin function Rtedge_TagCreate
	.p2align	4
_Rtedge_TagCreate:                      # @Rtedge_TagCreate
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$52, %esp
	movzwl	76(%esp), %esi
	movl	72(%esp), %edi
	leal	-1058(%esi), %eax
	cmpw	$3, %ax
	setb	%bh
	cmpl	$1346, %esi                     # imm = 0x542
	sete	%bl
	testl	%edi, %edi
	je	LBB341_4
# %bb.1:
	leal	2(%esp), %eax
	pushl	$2
	pushl	%eax
	pushl	$"??_C@_04KOACHJEN@Type?$AA@"
	pushl	%edi
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	jne	LBB341_4
# %bb.2:
	pushl	%edi
	calll	_Rtedge_TagGetIecType
	addl	$4, %esp
	movzwl	%ax, %edx
	cmpl	$1058, %edx                     # imm = 0x422
	sete	%cl
	movb	$1, %al
	cmpw	%dx, %si
	je	LBB341_31
# %bb.3:
	orb	%bh, %bl
	andb	%cl, %bl
	jne	LBB341_31
LBB341_4:
	movw	$99, %ax
	cmpl	$0, _typematch
	je	LBB341_9
# %bb.5:                                # %.preheader.preheader
	movl	$_typematch+4, %ecx
	.p2align	4
LBB341_6:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	cmpw	(%ecx), %si
	je	LBB341_7
# %bb.8:                                #   in Loop: Header=BB341_6 Depth=1
	cmpl	$0, 10(%ecx)
	leal	14(%ecx), %ecx
	jne	LBB341_6
	jmp	LBB341_9
LBB341_7:
	movzwl	2(%ecx), %eax
LBB341_9:                               # %.loopexit
	movl	84(%esp), %ecx
	movl	80(%esp), %edx
	movzwl	%si, %esi
	leal	-1058(%esi), %ebx
	cmpl	$3, %ebx
	jb	LBB341_12
# %bb.10:                               # %.loopexit
	cmpl	$1346, %esi                     # imm = 0x542
	jne	LBB341_11
LBB341_12:
	testl	%edx, %edx
	movl	$1, %ebx
	cmovnel	%edx, %ebx
	testl	%ecx, %ecx
	movl	$"??_C@_00CNPNBAHC@?$AA@", %edx
	cmovnel	%ecx, %edx
	cmpl	$1346, %esi                     # imm = 0x542
	movl	$"??_C@_07DCPMEJPJ@STRING?$CD?$AA@", %ecx
	cmovnel	%edx, %ecx
	movl	$83, %edx
	cmovnel	%ebx, %edx
	movl	%esp, %esi
	leal	2(%esp), %ebx
	movzwl	%ax, %eax
	movzwl	%dx, %ebp
	pushl	%esi
	pushl	$49
	pushl	%ebx
	pushl	$"??_C@_00CNPNBAHC@?$AA@"
	pushl	%ecx
	pushl	%ebp
	pushl	%eax
	pushl	%edi
	calll	*__imp__EgTagCreateSegment
	addl	$32, %esp
	testl	%eax, %eax
	sete	%al
	jne	LBB341_31
# %bb.13:
	movl	%eax, %ebx
	pushl	%ebp
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB341_14
# %bb.15:
	movl	%eax, %esi
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%esi, (%eax)
	movl	%ebp, 4(%eax)
	movl	$"??_C@_0CG@DCLCJKIA@Rtedge_TagCreate?3zero?5clear?5temp@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB341_16
# %bb.17:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB341_18
LBB341_11:
	testl	%edx, %edx
	movl	$"??_C@_00CNPNBAHC@?$AA@", %esi
	cmovel	%esi, %edx
	testl	%ecx, %ecx
	cmovel	%esi, %ecx
	movzwl	%ax, %eax
	pushl	%edx
	pushl	%ecx
	pushl	%eax
	pushl	%edi
	calll	*__imp__EgTagCreateEx
	addl	$16, %esp
	testl	%eax, %eax
	sete	%al
	jmp	LBB341_31
LBB341_14:                              # %Heap_Alloc.exit.thread
	pushl	$"??_C@_0CG@DCLCJKIA@Rtedge_TagCreate?3zero?5clear?5temp@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB341_30
LBB341_16:
	movl	%eax, _heaplist
LBB341_18:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
	pushl	%ebp
	pushl	%esi
	pushl	$0
	pushl	%edi
	calll	*__imp__EgTagWriteSegment
	addl	$16, %esp
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB341_29
# %bb.19:
	cmpl	%esi, (%ecx)
	je	LBB341_20
	.p2align	4
LBB341_21:                              # %.preheader.i
                                        # =>This Inner Loop Header: Depth=1
	movl	16(%ecx), %eax
	testl	%eax, %eax
	je	LBB341_29
# %bb.22:                               #   in Loop: Header=BB341_21 Depth=1
	movl	%ecx, %edx
	movl	%eax, %ecx
	cmpl	%esi, (%eax)
	jne	LBB341_21
	jmp	LBB341_23
LBB341_20:
	movl	%ecx, %edx
	movl	%ecx, %eax
LBB341_23:                              # %.loopexit5.i
	movl	16(%eax), %ecx
	testl	%ecx, %ecx
	je	LBB341_24
# %bb.26:
	movl	%ecx, 16(%edx)
	jmp	LBB341_28
LBB341_24:
	cmpl	%eax, %edx
	je	LBB341_25
# %bb.27:
	movl	$0, 16(%edx)
	movl	%edx, _heapbottom
	jmp	LBB341_28
LBB341_25:
	movl	$0, _heaplist
	movl	$0, _heapbottom
LBB341_28:
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB341_29:                              # %Heap_Free.exit
	pushl	%esi
	calll	_free
	addl	$4, %esp
LBB341_30:
	movl	%ebx, %eax
LBB341_31:
	addl	$52, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Rtedge_TagGetIecType;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_TagGetIecType           # -- Begin function Rtedge_TagGetIecType
	.p2align	4
_Rtedge_TagGetIecType:                  # @Rtedge_TagGetIecType
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	%eax
	movl	20(%esp), %edi
	leal	2(%esp), %eax
	pushl	$2
	pushl	%eax
	pushl	$"??_C@_04KOACHJEN@Type?$AA@"
	pushl	%edi
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	cmpl	$0, _typematch
	je	LBB342_5
# %bb.1:
	movzwl	2(%esp), %eax
	movl	$_typematch+4, %ecx
	.p2align	4
LBB342_2:                               # =>This Inner Loop Header: Depth=1
	cmpl	%eax, 2(%ecx)
	je	LBB342_3
# %bb.4:                                #   in Loop: Header=BB342_2 Depth=1
	cmpl	$0, 10(%ecx)
	leal	14(%ecx), %ecx
	jne	LBB342_2
LBB342_5:
	xorl	%esi, %esi
	jmp	LBB342_6
LBB342_3:
	movzwl	(%ecx), %esi
LBB342_6:                               # %.loopexit3
	pushl	$600                            # imm = 0x258
	pushl	$_Rtedge_TagGetIecType.source
	pushl	$"??_C@_06CLBDIDBH@Source?$AA@"
	pushl	%edi
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	setne	%al
	movl	_typematch, %ebx
	testl	%ebx, %ebx
	sete	%cl
	orb	%al, %cl
	jne	LBB342_11
# %bb.7:                                # %.preheader.preheader
	movl	$_typematch+14, %edi
	.p2align	4
LBB342_8:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebx
	calll	_strlen
	addl	$4, %esp
	pushl	%eax
	pushl	%ebx
	pushl	$_Rtedge_TagGetIecType.source
	calll	_strncmp
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB342_9
# %bb.10:                               #   in Loop: Header=BB342_8 Depth=1
	movl	(%edi), %ebx
	addl	$14, %edi
	testl	%ebx, %ebx
	jne	LBB342_8
	jmp	LBB342_11
LBB342_9:
	movzwl	-10(%edi), %esi
LBB342_11:                              # %.loopexit
	movl	%esi, %eax
	addl	$4, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Rtedge_TagIsExist;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_TagIsExist              # -- Begin function Rtedge_TagIsExist
	.p2align	4
_Rtedge_TagIsExist:                     # @Rtedge_TagIsExist
# %bb.0:
	pushl	%eax
	movl	8(%esp), %eax
	testl	%eax, %eax
	je	LBB343_1
# %bb.2:
	leal	2(%esp), %ecx
	pushl	$2
	pushl	%ecx
	pushl	$"??_C@_04KOACHJEN@Type?$AA@"
	pushl	%eax
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	sete	%al
                                        # kill: def $al killed $al killed $eax
	popl	%ecx
	retl
LBB343_1:
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	popl	%ecx
	retl
                                        # -- End function
	.def	_Rtedge_ConvertToEdgeType;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_ConvertToEdgeType       # -- Begin function Rtedge_ConvertToEdgeType
	.p2align	4
_Rtedge_ConvertToEdgeType:              # @Rtedge_ConvertToEdgeType
# %bb.0:
	movw	$99, %ax
	cmpl	$0, _typematch
	je	LBB344_5
# %bb.1:                                # %.preheader.preheader
	movzwl	4(%esp), %ecx
	movl	$_typematch+4, %edx
	.p2align	4
LBB344_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	cmpw	(%edx), %cx
	je	LBB344_3
# %bb.4:                                #   in Loop: Header=BB344_2 Depth=1
	cmpl	$0, 10(%edx)
	leal	14(%edx), %edx
	jne	LBB344_2
LBB344_5:                               # %.loopexit
	retl
LBB344_3:
	movzwl	2(%edx), %eax
	retl
                                        # -- End function
	.def	_Rtedge_TagCreateByInstruction;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_TagCreateByInstruction  # -- Begin function Rtedge_TagCreateByInstruction
	.p2align	4
_Rtedge_TagCreateByInstruction:         # @Rtedge_TagCreateByInstruction
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$16, %esp
	movl	36(%esp), %ebp
	testl	%ebp, %ebp
	je	LBB345_5
# %bb.1:
	pushl	%ebp
	calll	_strlen
	addl	$4, %esp
	movl	_typematch, %ebx
	testl	%ebx, %ebx
	je	LBB345_5
# %bb.2:                                # %.preheader.preheader
	incl	%eax
	movl	%eax, (%esp)                    # 4-byte Spill
	movl	$_typematch+14, %esi
	.p2align	4
LBB345_3:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebx
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %edi
	pushl	%eax
	pushl	%ebx
	pushl	%ebp
	calll	_strncmp
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB345_7
# %bb.4:                                #   in Loop: Header=BB345_3 Depth=1
	movl	(%esi), %ebx
	addl	$14, %esi
	testl	%ebx, %ebx
	jne	LBB345_3
LBB345_5:
	xorl	%eax, %eax
LBB345_6:                               # %.loopexit14
                                        # kill: def $al killed $al killed $eax
	addl	$16, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB345_7:
	pushl	(%esp)                          # 4-byte Folded Reload
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	testl	%eax, %eax
	movl	%eax, 4(%esp)                   # 4-byte Spill
	je	LBB345_10
# %bb.8:
	movl	%eax, %ebx
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%ebx, (%eax)
	movl	(%esp), %ecx                    # 4-byte Reload
	movl	%ecx, 4(%eax)
	movl	$"??_C@_0CO@JPBCBDJ@Rtedge_TagCreateByInstruction?3cl@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB345_11
# %bb.9:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB345_12
LBB345_10:
	pushl	$"??_C@_0CO@JPBCBDJ@Rtedge_TagCreateByInstruction?3cl@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB345_13
LBB345_11:
	movl	%eax, _heaplist
LBB345_12:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB345_13:                              # %Heap_Alloc.exit
	pushl	%ebp
	movl	8(%esp), %ebp                   # 4-byte Reload
	pushl	%ebp
	calll	_strcpy
	addl	$8, %esp
	movzwl	-10(%esi), %eax
	cmpl	$1346, %eax                     # imm = 0x542
	je	LBB345_20
# %bb.14:                               # %Heap_Alloc.exit
	cmpl	$1059, %eax                     # imm = 0x423
	jne	LBB345_28
# %bb.15:
	pushl	$35
	pushl	%ebp
	calll	_strrchr
	addl	$8, %esp
	movl	%ebp, %ecx
	movl	%eax, %ebp
	movb	$0, (%eax)
	incl	%ebp
	movl	_FbList, %ebx
	xorl	%esi, %esi
	testl	%ebx, %ebx
	je	LBB345_19
# %bb.16:                               # %.preheader3.i.preheader
	addl	%ecx, %edi
	.p2align	4
LBB345_17:                              # %.preheader3.i
                                        # =>This Inner Loop Header: Depth=1
	pushl	%edi
	pushl	(%ebx)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB345_44
# %bb.18:                               #   in Loop: Header=BB345_17 Depth=1
	movl	16(%ebx), %ebx
	testl	%ebx, %ebx
	jne	LBB345_17
	jmp	LBB345_19
LBB345_20:
	addl	%ebp, %edi
	movl	_variablelist, %ebx
	testl	%ebx, %ebx
	je	LBB345_23
	.p2align	4
LBB345_21:                              # %.preheader.i5
                                        # =>This Inner Loop Header: Depth=1
	pushl	%edi
	pushl	(%ebx)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB345_38
# %bb.22:                               #   in Loop: Header=BB345_21 Depth=1
	movl	19(%ebx), %ebx
	testl	%ebx, %ebx
	jne	LBB345_21
LBB345_23:                              # %.loopexit13
	pushl	$1346                           # imm = 0x542
	pushl	%edi
	calll	_Variable_Add
	addl	$8, %esp
	movl	%eax, %ebx
	cmpb	$0, 40(%esp)
	je	LBB345_39
LBB345_24:
	pushl	$83
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %edi
	testl	%eax, %eax
	je	LBB345_37
# %bb.25:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%edi, (%eax)
	movl	$83, 4(%eax)
	jmp	LBB345_26
LBB345_28:
	addl	%ebp, %edi
	movl	_variablelist, %ebx
	movzwl	%ax, %esi
	testl	%ebx, %ebx
	je	LBB345_31
	.p2align	4
LBB345_29:                              # %.preheader.i6
                                        # =>This Inner Loop Header: Depth=1
	pushl	%edi
	pushl	(%ebx)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB345_53
# %bb.30:                               #   in Loop: Header=BB345_29 Depth=1
	movl	19(%ebx), %ebx
	testl	%ebx, %ebx
	jne	LBB345_29
LBB345_31:                              # %.loopexit
	pushl	%esi
	pushl	%edi
	calll	_Variable_Add
	addl	$8, %esp
	movl	%eax, %ebx
	cmpb	$0, 40(%esp)
	je	LBB345_54
LBB345_32:
	pushl	$8
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %edi
	testl	%eax, %eax
	je	LBB345_37
# %bb.33:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%edi, (%eax)
	movl	$8, 4(%eax)
LBB345_26:
	movl	$"??_C@_0O@NOPHFFNJ@Variable_Body?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB345_27
# %bb.34:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB345_35
LBB345_37:
	pushl	$"??_C@_0O@NOPHFFNJ@Variable_Body?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB345_36
LBB345_38:                              # %Variable_Search.exit
	addl	$4, %ebx
	cmpb	$0, 40(%esp)
	jne	LBB345_24
LBB345_39:
	pushl	$"??_C@_07DCPMEJPJ@STRING?$CD?$AA@"
	pushl	$83
	pushl	$1346                           # imm = 0x542
	pushl	%edi
	calll	_Rtedge_TagCreate
	addl	$16, %esp
                                        # kill: def $al killed $al def $eax
	movl	%eax, (%esp)                    # 4-byte Spill
	pushl	%edi
	calll	_Rtedge_TagGetIecType
	addl	$4, %esp
	movl	%eax, %ebp
	movl	$0, 8(%esp)
	leal	8(%esp), %eax
	pushl	$4
	pushl	%eax
	pushl	$"??_C@_05HKHPEFOF@Entry?$AA@"
	pushl	%edi
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	setne	%cl
	movl	8(%esp), %eax
	testl	%eax, %eax
	sete	%dl
	orb	%cl, %dl
	jne	LBB345_55
# %bb.40:
	movzwl	%bp, %ecx
	leal	-1058(%ecx), %edx
	cmpl	$2, %edx
	jb	LBB345_43
# %bb.41:
	cmpl	$1346, %ecx                     # imm = 0x542
	je	LBB345_43
# %bb.42:
	cmpl	$1, 385(%eax)
	jne	LBB345_59
	jmp	LBB345_43
LBB345_44:
	movl	12(%ebx), %eax
	testl	%eax, %eax
	je	LBB345_19
# %bb.45:                               # %.preheader.i
	xorl	%ecx, %ecx
	movl	_typematch, %edx
	xorl	%esi, %esi
	jmp	LBB345_48
LBB345_46:                              #   in Loop: Header=BB345_48 Depth=1
	movl	-4(%ebx), %edi
	cmpl	$-1, %edi
	movzwl	%di, %edi
	cmovel	%ecx, %edi
LBB345_47:                              # %Rtedge_TypeSize.exit.i
                                        #   in Loop: Header=BB345_48 Depth=1
	addl	%edi, %esi
	movl	10(%eax), %eax
	testl	%eax, %eax
	je	LBB345_19
LBB345_48:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB345_50 Depth 2
	movl	$0, %edi
	testl	%edx, %edx
	je	LBB345_47
# %bb.49:                               # %.preheader.i.i.preheader
                                        #   in Loop: Header=BB345_48 Depth=1
	movzwl	(%eax), %edi
	movl	$_typematch+14, %ebx
	.p2align	4
LBB345_50:                              # %.preheader.i.i
                                        #   Parent Loop BB345_48 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpw	-10(%ebx), %di
	je	LBB345_46
# %bb.51:                               #   in Loop: Header=BB345_50 Depth=2
	cmpl	$0, (%ebx)
	leal	14(%ebx), %ebx
	jne	LBB345_50
# %bb.52:                               #   in Loop: Header=BB345_48 Depth=1
	xorl	%edi, %edi
	jmp	LBB345_47
LBB345_19:                              # %Functionblock_GetSize.exit
	movl	4(%esp), %edi                   # 4-byte Reload
	pushl	%edi
	pushl	%esi
	pushl	$1059                           # imm = 0x423
	pushl	%ebp
	calll	_Rtedge_TagCreate
	addl	$16, %esp
	movl	%eax, %ebx
	pushl	%ebp
	movl	%edi, %ebp
	calll	_Functionblock_Register
	movl	%ebx, %esi
	addl	$4, %esp
	jmp	LBB345_62
LBB345_53:                              # %Variable_Search.exit7
	addl	$4, %ebx
	cmpb	$0, 40(%esp)
	jne	LBB345_32
LBB345_54:
	pushl	$0
	pushl	$0
	pushl	%esi
	pushl	%edi
	calll	_Rtedge_TagCreate
	addl	$16, %esp
                                        # kill: def $al killed $al def $eax
	movl	%eax, (%esp)                    # 4-byte Spill
	pushl	%edi
	calll	_Rtedge_TagGetIecType
	addl	$4, %esp
	movl	%eax, %ebp
	movl	$0, 12(%esp)
	leal	12(%esp), %eax
	pushl	$4
	pushl	%eax
	pushl	$"??_C@_05HKHPEFOF@Entry?$AA@"
	pushl	%edi
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	setne	%cl
	movl	12(%esp), %eax
	testl	%eax, %eax
	sete	%dl
	orb	%cl, %dl
	je	LBB345_56
LBB345_55:
	movl	(%esp), %esi                    # 4-byte Reload
	jmp	LBB345_61
LBB345_27:
	movl	%eax, _heaplist
LBB345_35:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB345_36:                              # %Variable_Body.exit10
	movl	%edi, (%ebx)
	xorl	%esi, %esi
	jmp	LBB345_62
LBB345_56:
	movzwl	%bp, %ecx
	leal	-1058(%ecx), %edx
	cmpl	$2, %edx
	jb	LBB345_43
# %bb.57:
	cmpl	$1346, %ecx                     # imm = 0x542
	je	LBB345_43
# %bb.58:
	cmpl	$1, 385(%eax)
	jne	LBB345_59
LBB345_43:
	movl	23(%eax), %ecx
LBB345_60:                              # %Rtedge_GetPointer.exit.i
	movl	(%esp), %esi                    # 4-byte Reload
	movl	%eax, 6(%ebx)
	movw	%bp, 4(%ebx)
	movl	%ecx, (%ebx)
LBB345_61:                              # %Variable_LinkBody.exit
	movl	4(%esp), %ebp                   # 4-byte Reload
LBB345_62:                              # %Variable_LinkBody.exit
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB345_73
# %bb.63:
	cmpl	%ebp, (%ecx)
	je	LBB345_66
	.p2align	4
LBB345_64:                              # %.preheader.i11
                                        # =>This Inner Loop Header: Depth=1
	movl	16(%ecx), %eax
	testl	%eax, %eax
	je	LBB345_73
# %bb.65:                               #   in Loop: Header=BB345_64 Depth=1
	movl	%ecx, %edx
	movl	%eax, %ecx
	cmpl	%ebp, (%eax)
	jne	LBB345_64
	jmp	LBB345_67
LBB345_66:
	movl	%ecx, %edx
	movl	%ecx, %eax
LBB345_67:                              # %.loopexit5.i
	movl	16(%eax), %ecx
	testl	%ecx, %ecx
	je	LBB345_69
# %bb.68:
	movl	%ecx, 16(%edx)
	jmp	LBB345_72
LBB345_69:
	cmpl	%eax, %edx
	je	LBB345_71
# %bb.70:
	movl	$0, 16(%edx)
	movl	%edx, _heapbottom
	jmp	LBB345_72
LBB345_71:
	movl	$0, _heaplist
	movl	$0, _heapbottom
LBB345_72:
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB345_73:                              # %Heap_Free.exit
	pushl	%ebp
	calll	_free
	addl	$4, %esp
	movl	%esi, %eax
	jmp	LBB345_6
LBB345_59:
	movl	%eax, %ecx
	addl	$15, %ecx
	jmp	LBB345_60
                                        # -- End function
	.def	_Rtedge_ConvertToIecType;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_ConvertToIecType        # -- Begin function Rtedge_ConvertToIecType
	.p2align	4
_Rtedge_ConvertToIecType:               # @Rtedge_ConvertToIecType
# %bb.0:
	cmpl	$0, _typematch
	je	LBB346_1
# %bb.3:
	movzwl	4(%esp), %eax
	movl	$_typematch+4, %ecx
	.p2align	4
LBB346_4:                               # =>This Inner Loop Header: Depth=1
	cmpl	%eax, 2(%ecx)
	je	LBB346_5
# %bb.6:                                #   in Loop: Header=BB346_4 Depth=1
	cmpl	$0, 10(%ecx)
	leal	14(%ecx), %ecx
	jne	LBB346_4
LBB346_1:
	xorl	%eax, %eax
                                        # kill: def $ax killed $ax killed $eax
	retl
LBB346_5:
	movzwl	(%ecx), %eax
                                        # kill: def $ax killed $ax killed $eax
	retl
                                        # -- End function
	.def	_Rtedge_TagGetPointer;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_TagGetPointer           # -- Begin function Rtedge_TagGetPointer
	.p2align	4
_Rtedge_TagGetPointer:                  # @Rtedge_TagGetPointer
# %bb.0:
	pushl	%eax
	movl	8(%esp), %eax
	movl	$0, (%esp)
	movl	%esp, %ecx
	pushl	$4
	pushl	%ecx
	pushl	$"??_C@_05HKHPEFOF@Entry?$AA@"
	pushl	%eax
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	movl	%eax, %ecx
	xorl	%eax, %eax
	testl	%ecx, %ecx
	jne	LBB347_2
# %bb.1:
	movl	(%esp), %eax
LBB347_2:
	popl	%ecx
	retl
                                        # -- End function
	.def	_Rtedge_TypeSize;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_TypeSize                # -- Begin function Rtedge_TypeSize
	.p2align	4
_Rtedge_TypeSize:                       # @Rtedge_TypeSize
# %bb.0:
	xorl	%eax, %eax
	cmpl	$0, _typematch
	je	LBB348_5
# %bb.1:                                # %.preheader.preheader
	movzwl	4(%esp), %ecx
	movl	$_typematch+14, %edx
	.p2align	4
LBB348_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	cmpw	-10(%edx), %cx
	je	LBB348_3
# %bb.4:                                #   in Loop: Header=BB348_2 Depth=1
	cmpl	$0, (%edx)
	leal	14(%edx), %edx
	jne	LBB348_2
LBB348_5:                               # %.loopexit
	retl
LBB348_3:
	movl	-4(%edx), %eax
	xorl	%ecx, %ecx
	cmpl	$-1, %eax
	movzwl	%ax, %eax
	cmovel	%ecx, %eax
	retl
                                        # -- End function
	.def	_Rtedge_SizeOf;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_SizeOf                  # -- Begin function Rtedge_SizeOf
	.p2align	4
_Rtedge_SizeOf:                         # @Rtedge_SizeOf
# %bb.0:
	cmpl	$0, _typematch
	je	LBB349_1
# %bb.3:                                # %.preheader.preheader
	movl	4(%esp), %ecx
	movzwl	4(%ecx), %eax
	movl	$_typematch+14, %edx
	.p2align	4
LBB349_4:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	cmpw	-10(%edx), %ax
	je	LBB349_5
# %bb.8:                                #   in Loop: Header=BB349_4 Depth=1
	cmpl	$0, (%edx)
	leal	14(%edx), %edx
	jne	LBB349_4
LBB349_1:
	xorl	%eax, %eax
                                        # kill: def $ax killed $ax killed $eax
	retl
LBB349_5:
	movl	-4(%edx), %eax
	cmpl	$-1, %eax
	je	LBB349_6
# %bb.2:                                # %.loopexit
                                        # kill: def $ax killed $ax killed $eax
	retl
LBB349_6:
	movl	6(%ecx), %eax
	testl	%eax, %eax
	je	LBB349_1
# %bb.7:
	movzwl	5(%eax), %eax
                                        # kill: def $ax killed $ax killed $eax
	retl
                                        # -- End function
	.def	_Rtedge_GetStructureName;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_GetStructureName        # -- Begin function Rtedge_GetStructureName
	.p2align	4
_Rtedge_GetStructureName:               # @Rtedge_GetStructureName
# %bb.0:
	pushl	$600                            # imm = 0x258
	pushl	$_Rtedge_GetStructureName.name
	pushl	$"??_C@_06CLBDIDBH@Source?$AA@"
	pushl	16(%esp)
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	je	LBB350_1
LBB350_5:
	xorl	%eax, %eax
	retl
LBB350_1:
	movl	$1431458899, %eax               # imm = 0x55525453
	xorl	_Rtedge_GetStructureName.name, %eax
	movl	$592724821, %ecx                # imm = 0x23544355
	xorl	_Rtedge_GetStructureName.name+3, %ecx
	orl	%eax, %ecx
	je	LBB350_2
# %bb.3:
	pushl	$9
	pushl	$L___const.Rtedge_GetStructureName.tag2
	pushl	$_Rtedge_GetStructureName.name
	calll	_memcmp
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB350_5
# %bb.4:
	movl	$_Rtedge_GetStructureName.name+9, %eax
	retl
LBB350_2:
	movl	$_Rtedge_GetStructureName.name+7, %eax
	retl
                                        # -- End function
	.def	_Rtedge_IsStructure;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_IsStructure             # -- Begin function Rtedge_IsStructure
	.p2align	4
_Rtedge_IsStructure:                    # @Rtedge_IsStructure
# %bb.0:
	pushl	$600                            # imm = 0x258
	pushl	$_Rtedge_GetStructureName.name
	pushl	$"??_C@_06CLBDIDBH@Source?$AA@"
	pushl	16(%esp)
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	je	LBB351_1
LBB351_3:
	xorl	%eax, %eax
LBB351_4:
                                        # kill: def $al killed $al killed $eax
	retl
LBB351_1:
	movl	$1431458899, %ecx               # imm = 0x55525453
	xorl	_Rtedge_GetStructureName.name, %ecx
	movl	$592724821, %edx                # imm = 0x23544355
	xorl	_Rtedge_GetStructureName.name+3, %edx
	movb	$1, %al
	orl	%ecx, %edx
	je	LBB351_4
# %bb.2:
	pushl	$9
	pushl	$L___const.Rtedge_GetStructureName.tag2
	pushl	$_Rtedge_GetStructureName.name
	calll	_memcmp
	addl	$12, %esp
	movl	%eax, %ecx
	movb	$1, %al
	testl	%ecx, %ecx
	jne	LBB351_3
	jmp	LBB351_4
                                        # -- End function
	.def	_Rtedge_GetArrayName;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_GetArrayName            # -- Begin function Rtedge_GetArrayName
	.p2align	4
_Rtedge_GetArrayName:                   # @Rtedge_GetArrayName
# %bb.0:
	pushl	$600                            # imm = 0x258
	pushl	$_Rtedge_GetArrayName.name
	pushl	$"??_C@_06CLBDIDBH@Source?$AA@"
	pushl	16(%esp)
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	jne	LBB352_3
# %bb.1:
	movl	$1095914049, %eax               # imm = 0x41525241
	xorl	_Rtedge_GetArrayName.name, %eax
	movzwl	_Rtedge_GetArrayName.name+4, %ecx
	xorl	$9049, %ecx                     # imm = 0x2359
	orl	%eax, %ecx
	je	LBB352_2
LBB352_3:
	xorl	%eax, %eax
	retl
LBB352_2:
	movl	$_Rtedge_GetArrayName.name+6, %eax
	retl
                                        # -- End function
	.def	_Rtedge_IsArray;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_IsArray                 # -- Begin function Rtedge_IsArray
	.p2align	4
_Rtedge_IsArray:                        # @Rtedge_IsArray
# %bb.0:
	pushl	$600                            # imm = 0x258
	pushl	$_Rtedge_GetArrayName.name
	pushl	$"??_C@_06CLBDIDBH@Source?$AA@"
	pushl	16(%esp)
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	jne	LBB353_3
# %bb.1:
	movl	$1095914049, %eax               # imm = 0x41525241
	xorl	_Rtedge_GetArrayName.name, %eax
	movzwl	_Rtedge_GetArrayName.name+4, %ecx
	xorl	$9049, %ecx                     # imm = 0x2359
	orl	%eax, %ecx
	je	LBB353_2
LBB353_3:
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	retl
LBB353_2:
	movb	$1, %al
                                        # kill: def $al killed $al killed $eax
	retl
                                        # -- End function
	.def	_Rtedge_Compile;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_Compile                 # -- Begin function Rtedge_Compile
	.p2align	4
_Rtedge_Compile:                        # @Rtedge_Compile
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$12, %esp
	movl	32(%esp), %edi
	xorl	%esi, %esi
	testl	%edi, %edi
	je	LBB354_8
# %bb.1:
	leal	10(%esp), %eax
	pushl	$2
	pushl	%eax
	pushl	$"??_C@_04KOACHJEN@Type?$AA@"
	pushl	%edi
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	jne	LBB354_8
# %bb.2:
	pushl	%edi
	calll	_Rtedge_TagGetIecType
	addl	$4, %esp
	movl	%eax, %esi
	movl	$0, (%esp)
	movl	%esp, %eax
	pushl	$4
	pushl	%eax
	pushl	$"??_C@_05HKHPEFOF@Entry?$AA@"
	pushl	%edi
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	xorl	%ebx, %ebx
	testl	%eax, %eax
	movl	(%esp), %eax
	movl	%eax, 4(%esp)                   # 4-byte Spill
	cmovel	%eax, %ebx
	movzwl	%si, %ebp
	pushl	%ebp
	pushl	%edi
	calll	_Variable_Add
	addl	$8, %esp
	movl	%eax, %esi
	movw	%bp, 4(%eax)
	movl	%ebx, 6(%eax)
	leal	-1058(%ebp), %eax
	cmpl	$2, %eax
	movl	4(%esp), %eax                   # 4-byte Reload
	jb	LBB354_5
# %bb.3:
	cmpl	$1346, %ebp                     # imm = 0x542
	je	LBB354_5
# %bb.4:
	cmpl	$1, 385(%eax)
	jne	LBB354_6
LBB354_5:
	movl	23(%eax), %ebx
LBB354_7:
	movl	%ebx, (%esi)
LBB354_8:
	movl	%esi, %eax
	addl	$12, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB354_6:
	addl	$15, %ebx
	jmp	LBB354_7
                                        # -- End function
	.def	_Rtedge_GetPointer;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_GetPointer              # -- Begin function Rtedge_GetPointer
	.p2align	4
_Rtedge_GetPointer:                     # @Rtedge_GetPointer
# %bb.0:
	movl	4(%esp), %eax
	movzwl	8(%esp), %ecx
	leal	-1058(%ecx), %edx
	cmpl	$2, %edx
	jb	LBB355_3
# %bb.1:
	cmpl	$1346, %ecx                     # imm = 0x542
	je	LBB355_3
# %bb.2:
	cmpl	$1, 385(%eax)
	jne	LBB355_4
LBB355_3:
	movl	23(%eax), %eax
	retl
LBB355_4:
	addl	$15, %eax
	retl
                                        # -- End function
	.def	_Rtedge_TagRead_UInt32;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_TagRead_UInt32          # -- Begin function Rtedge_TagRead_UInt32
	.p2align	4
_Rtedge_TagRead_UInt32:                 # @Rtedge_TagRead_UInt32
# %bb.0:
	pushl	$4
	pushl	12(%esp)
	pushl	12(%esp)
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	sete	%al
	retl
                                        # -- End function
	.def	_Rtedge_TagWrite_UInt32;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_TagWrite_UInt32         # -- Begin function Rtedge_TagWrite_UInt32
	.p2align	4
_Rtedge_TagWrite_UInt32:                # @Rtedge_TagWrite_UInt32
# %bb.0:
	leal	8(%esp), %eax
	pushl	$4
	pushl	%eax
	pushl	12(%esp)
	calll	*__imp__EgTagWrite
	addl	$12, %esp
	testl	%eax, %eax
	sete	%al
	retl
                                        # -- End function
	.def	_Rtedge_IsDirectMemory;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_IsDirectMemory          # -- Begin function Rtedge_IsDirectMemory
	.p2align	4
_Rtedge_IsDirectMemory:                 # @Rtedge_IsDirectMemory
# %bb.0:
	movl	4(%esp), %eax
	cmpl	$1, 385(%eax)
	sete	%al
	retl
                                        # -- End function
	.def	_Rtedge_SetTagDefaultValue;
	.scl	2;
	.type	32;
	.endef
	.globl	_Rtedge_SetTagDefaultValue      # -- Begin function Rtedge_SetTagDefaultValue
	.p2align	4
_Rtedge_SetTagDefaultValue:             # @Rtedge_SetTagDefaultValue
# %bb.0:
	calll	*__imp__EgTagSetDefaultValue
	testl	%eax, %eax
	sete	%al
	retl
                                        # -- End function
	.def	_Scope_set;
	.scl	2;
	.type	32;
	.endef
	.globl	_Scope_set                      # -- Begin function Scope_set
	.p2align	4
_Scope_set:                             # @Scope_set
# %bb.0:
	movl	4(%esp), %eax
	testl	%eax, %eax
	je	LBB360_1
# %bb.2:
	pushl	%eax
	pushl	$_scope
	calll	_strcpy
	addl	$8, %esp
	movl	$_scope, %eax
	retl
LBB360_1:
	movb	$0, _scope
	movl	$_scope, %eax
	retl
                                        # -- End function
	.def	_Scope_get;
	.scl	2;
	.type	32;
	.endef
	.globl	_Scope_get                      # -- Begin function Scope_get
	.p2align	4
_Scope_get:                             # @Scope_get
# %bb.0:
	movl	$_scope, %eax
	retl
                                        # -- End function
	.def	_Scope_variable;
	.scl	2;
	.type	32;
	.endef
	.globl	_Scope_variable                 # -- Begin function Scope_variable
	.p2align	4
_Scope_variable:                        # @Scope_variable
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %esi
	cmpb	$0, _scope
	je	LBB362_5
# %bb.1:
	pushl	$35
	pushl	%esi
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB362_3
# %bb.2:
	incl	%eax
	movl	%eax, %edi
	subl	%esi, %edi
	pushl	%edi
	pushl	%esi
	pushl	$_scopedvariable
	movl	%eax, %esi
	calll	_strncpy
	addl	$12, %esp
	movb	$0, _scopedvariable(%edi)
	pushl	$_scope
	pushl	$_scopedvariable
	calll	_strcat
	jmp	LBB362_4
LBB362_5:
	movl	%esi, %eax
	jmp	LBB362_6
LBB362_3:
	pushl	$_scope
	pushl	$_scopedvariable
	calll	_strcpy
LBB362_4:
	addl	$8, %esp
	pushl	$_scopedvariable
	calll	_strlen
	addl	$4, %esp
	movw	$46, _scopedvariable(%eax)
	pushl	%esi
	pushl	$_scopedvariable
	calll	_strcat
	addl	$8, %esp
	movl	$_scopedvariable, %eax
LBB362_6:
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_SQTBL_Create;
	.scl	2;
	.type	32;
	.endef
	.globl	_SQTBL_Create                   # -- Begin function SQTBL_Create
	.p2align	4
_SQTBL_Create:                          # @SQTBL_Create
# %bb.0:
	pushl	%esi
	pushl	$4096                           # imm = 0x1000
	calll	_AllocateRtMemory
	addl	$4, %esp
	movl	%eax, _sqtbl
	testl	%eax, %eax
	je	LBB363_4
# %bb.1:                                # %Catalog.exit
	pushl	$4096                           # imm = 0x1000
	pushl	%eax
	calll	_CreateRtMemoryHandle
	addl	$8, %esp
	movw	%ax, _hSQTBLmem
	movzwl	%ax, %eax
	pushl	$"??_C@_05KKOJADCM@SQTBL?$AA@"
	pushl	%eax
	pushl	$0
	calll	_CatalogRtHandle
	addl	$12, %esp
	movl	_sqtbl, %esi
	testl	%esi, %esi
	je	LBB363_3
# %bb.2:
	pushl	$4096                           # imm = 0x1000
	pushl	$0
	pushl	%esi
	calll	_memset
	addl	$12, %esp
LBB363_3:
	xorl	%eax, %eax
	cmpl	$1, %esi
	sbbl	%eax, %eax
	popl	%esi
	retl
LBB363_4:
	pushl	$0
	calll	_exit
                                        # -- End function
	.def	_SQTBL_Initialize;
	.scl	2;
	.type	32;
	.endef
	.globl	_SQTBL_Initialize               # -- Begin function SQTBL_Initialize
	.p2align	4
_SQTBL_Initialize:                      # @SQTBL_Initialize
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB364_6
# %bb.1:
	movzbl	_bTraceMode, %ecx
	movb	%cl, 40(%eax)
	movzbl	_bStepMode, %ecx
	movb	%cl, 33(%eax)
	movzbl	_bPrintMode, %ecx
	movb	%cl, 37(%eax)
	movzbl	_bRemote, %ecx
	movb	%cl, 38(%eax)
	movzbl	_byRunMode, %ecx
	cmpl	$1, %ecx
	je	LBB364_4
# %bb.2:
	testl	%ecx, %ecx
	jne	LBB364_5
# %bb.3:
	movl	$4544581, (%eax)                # imm = 0x455845
	movl	_sqtbl, %eax
	jmp	LBB364_5
LBB364_4:
	movl	$5525577, 3(%eax)               # imm = 0x545049
	movl	$1230127955, (%eax)             # imm = 0x49524353
LBB364_5:
	movups	"??_C@_0BA@EIHPONHL@VER?405_00_00_00?$AA@", %xmm0
	movups	%xmm0, 16(%eax)
LBB364_6:
	retl
                                        # -- End function
	.def	_Step_Init;
	.scl	2;
	.type	32;
	.endef
	.globl	_Step_Init                      # -- Begin function Step_Init
	.p2align	4
_Step_Init:                             # @Step_Init
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB365_3
# %bb.1:
	cmpw	$0, 35(%eax)
	je	LBB365_2
LBB365_3:
	retl
LBB365_2:                               # %Catalog.exit
	pushl	$0
	pushl	$1
	pushl	$0
	calll	_CreateRtSemaphore
	addl	$12, %esp
	movl	_sqtbl, %ecx
	movw	%ax, 35(%ecx)
	movzwl	%ax, %eax
	pushl	$"??_C@_06EAEKDHGI@SQSTEP?$AA@"
	pushl	%eax
	pushl	$0
	calll	_CatalogRtHandle
	addl	$12, %esp
	movl	$2, _status_step
	retl
                                        # -- End function
	.def	_Step_IsEnable;
	.scl	2;
	.type	32;
	.endef
	.globl	_Step_IsEnable                  # -- Begin function Step_IsEnable
	.p2align	4
_Step_IsEnable:                         # @Step_IsEnable
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB366_1
# %bb.3:
	cmpb	$0, 33(%eax)
	setne	%al
                                        # kill: def $al killed $al killed $eax
	retl
LBB366_1:
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	retl
                                        # -- End function
	.def	_Step_Enable;
	.scl	2;
	.type	32;
	.endef
	.globl	_Step_Enable                    # -- Begin function Step_Enable
	.p2align	4
_Step_Enable:                           # @Step_Enable
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB367_2
# %bb.1:
	movb	$1, 33(%eax)
	movl	$6, _status_step
	movl	_indicate+254, %eax
	movb	$1, (%eax)
LBB367_2:
	retl
                                        # -- End function
	.def	_Step_Disable;
	.scl	2;
	.type	32;
	.endef
	.globl	_Step_Disable                   # -- Begin function Step_Disable
	.p2align	4
_Step_Disable:                          # @Step_Disable
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB368_4
# %bb.1:
	movb	$0, 33(%eax)
	movl	$2, _status_step
	movzwl	35(%eax), %eax
	pushl	%eax
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$4, %ax
	jne	LBB368_3
# %bb.2:
	movl	_sqtbl, %eax
	movzwl	35(%eax), %eax
	pushl	$1
	pushl	%eax
	calll	_ReleaseRtSemaphore
	addl	$8, %esp
LBB368_3:
	movl	_indicate+254, %eax
	movb	$0, (%eax)
LBB368_4:
	retl
                                        # -- End function
	.def	_Step_Trigger;
	.scl	2;
	.type	32;
	.endef
	.globl	_Step_Trigger                   # -- Begin function Step_Trigger
	.p2align	4
_Step_Trigger:                          # @Step_Trigger
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB369_3
# %bb.1:
	movzwl	35(%eax), %eax
	pushl	%eax
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$4, %ax
	jne	LBB369_3
# %bb.2:
	movl	_sqtbl, %eax
	movzwl	35(%eax), %eax
	pushl	$1
	pushl	%eax
	calll	_ReleaseRtSemaphore
	addl	$8, %esp
LBB369_3:
	retl
                                        # -- End function
	.def	_Step_WaitTrigger;
	.scl	2;
	.type	32;
	.endef
	.globl	_Step_WaitTrigger               # -- Begin function Step_WaitTrigger
	.p2align	4
_Step_WaitTrigger:                      # @Step_WaitTrigger
# %bb.0:
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB370_4
# %bb.1:
	pushl	%esi
	movl	_status_step, %esi
	movzwl	35(%eax), %eax
	pushl	%eax
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$4, %ax
	jne	LBB370_3
# %bb.2:
	movl	$4, _status_step
	movl	_sqtbl, %eax
	movzwl	35(%eax), %eax
	pushl	$-1
	pushl	$1
	pushl	%eax
	calll	_WaitForRtSemaphore
	addl	$12, %esp
	movl	%esi, _status_step
LBB370_3:
	popl	%esi
LBB370_4:
	retl
                                        # -- End function
	.def	_String_Clear;
	.scl	2;
	.type	32;
	.endef
	.globl	_String_Clear                   # -- Begin function String_Clear
	.p2align	4
_String_Clear:                          # @String_Clear
# %bb.0:
	movl	4(%esp), %eax
	movw	$0, (%eax)
	movb	$0, 2(%eax)
	retl
                                        # -- End function
	.def	_String_Set;
	.scl	2;
	.type	32;
	.endef
	.globl	_String_Set                     # -- Begin function String_Set
	.p2align	4
_String_Set:                            # @String_Set
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %esi
	movl	16(%esp), %edi
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	cmpl	$80, %eax
	movl	$80, %ecx
	cmovll	%eax, %ecx
	movw	%cx, (%esi)
	addl	$2, %esi
	pushl	$80
	pushl	%edi
	pushl	%esi
	calll	_strncpy
	addl	$12, %esp
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_String_Create;
	.scl	2;
	.type	32;
	.endef
	.globl	_String_Create                  # -- Begin function String_Create
	.p2align	4
_String_Create:                         # @String_Create
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %esi
	movl	16(%esp), %edi
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	cmpl	$80, %eax
	movl	$80, %ecx
	cmovll	%eax, %ecx
	movw	%cx, (%esi)
	leal	2(%esi), %ecx
	pushl	%eax
	pushl	%edi
	pushl	%ecx
	calll	_strncpy
	addl	$12, %esp
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_String_Get;
	.scl	2;
	.type	32;
	.endef
	.globl	_String_Get                     # -- Begin function String_Get
	.p2align	4
_String_Get:                            # @String_Get
# %bb.0:
	movl	4(%esp), %eax
	addl	$2, %eax
	retl
                                        # -- End function
	.def	_String_Copy;
	.scl	2;
	.type	32;
	.endef
	.globl	_String_Copy                    # -- Begin function String_Copy
	.p2align	4
_String_Copy:                           # @String_Copy
# %bb.0:
	movl	8(%esp), %ecx
	movl	4(%esp), %eax
	testl	%eax, %eax
	sete	%dl
	testl	%ecx, %ecx
	sete	%dh
	orb	%dl, %dh
	jne	LBB375_2
# %bb.1:
	movl	79(%ecx), %edx
	movl	%edx, 79(%eax)
	movups	64(%ecx), %xmm0
	movups	%xmm0, 64(%eax)
	movups	48(%ecx), %xmm0
	movups	%xmm0, 48(%eax)
	movups	32(%ecx), %xmm0
	movups	%xmm0, 32(%eax)
	movups	(%ecx), %xmm0
	movups	16(%ecx), %xmm1
	movups	%xmm1, 16(%eax)
	movups	%xmm0, (%eax)
LBB375_2:
	retl
                                        # -- End function
	.def	_String_Packing;
	.scl	2;
	.type	32;
	.endef
	.globl	__xmm@20202020202020202020202020202020 # -- Begin function String_Packing
	.section	.rdata,"dr",discard,__xmm@20202020202020202020202020202020
	.p2align	4, 0x0
__xmm@20202020202020202020202020202020:
	.zero	16,32
	.globl	__xmm@00000020000000200000002000000020
	.section	.rdata,"dr",discard,__xmm@00000020000000200000002000000020
	.p2align	4, 0x0
__xmm@00000020000000200000002000000020:
	.long	32                              # 0x20
	.long	32                              # 0x20
	.long	32                              # 0x20
	.long	32                              # 0x20
	.globl	__xmm@00000000000000000000000020200000
	.section	.rdata,"dr",discard,__xmm@00000000000000000000000020200000
	.p2align	4, 0x0
__xmm@00000000000000000000000020200000:
	.zero	1
	.zero	1
	.byte	32                              # 0x20
	.byte	32                              # 0x20
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.globl	__xmm@00000000000000000000202000000000
	.section	.rdata,"dr",discard,__xmm@00000000000000000000202000000000
	.p2align	4, 0x0
__xmm@00000000000000000000202000000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	32                              # 0x20
	.byte	32                              # 0x20
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.globl	__xmm@00000000000000002020000000000000
	.section	.rdata,"dr",discard,__xmm@00000000000000002020000000000000
	.p2align	4, 0x0
__xmm@00000000000000002020000000000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	32                              # 0x20
	.byte	32                              # 0x20
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.globl	__xmm@00000000000020200000000000000000
	.section	.rdata,"dr",discard,__xmm@00000000000020200000000000000000
	.p2align	4, 0x0
__xmm@00000000000020200000000000000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	32                              # 0x20
	.byte	32                              # 0x20
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.globl	__xmm@00000000202000000000000000000000
	.section	.rdata,"dr",discard,__xmm@00000000202000000000000000000000
	.p2align	4, 0x0
__xmm@00000000202000000000000000000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	32                              # 0x20
	.byte	32                              # 0x20
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.globl	__xmm@00002020000000000000000000000000
	.section	.rdata,"dr",discard,__xmm@00002020000000000000000000000000
	.p2align	4, 0x0
__xmm@00002020000000000000000000000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	32                              # 0x20
	.byte	32                              # 0x20
	.zero	1
	.zero	1
	.globl	__xmm@20200000000000000000000000000000
	.section	.rdata,"dr",discard,__xmm@20200000000000000000000000000000
	.p2align	4, 0x0
__xmm@20200000000000000000000000000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	32                              # 0x20
	.byte	32                              # 0x20
	.text
	.globl	_String_Packing
	.p2align	4
_String_Packing:                        # @String_Packing
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	%eax
	movl	24(%esp), %esi
	xorl	%ebp, %ebp
	testl	%esi, %esi
	je	LBB376_108
# %bb.1:
	pushl	%esi
	calll	_strlen
	addl	$4, %esp
	cmpl	$2, %eax
	jge	LBB376_2
LBB376_108:                             # %.loopexit
	movl	%ebp, %eax
	addl	$4, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB376_2:                               # %.preheader.preheader
	leal	32(%esi), %ebx
	movl	$-1, %edx
	.p2align	4
LBB376_3:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movzbl	-32(%ebx), %ecx
	testl	%ecx, %ecx
	je	LBB376_108
# %bb.4:                                # %.preheader
                                        #   in Loop: Header=BB376_3 Depth=1
	cmpl	$39, %ecx
	je	LBB376_6
# %bb.5:                                # %.preheader
                                        #   in Loop: Header=BB376_3 Depth=1
	cmpl	$34, %ecx
	je	LBB376_6
# %bb.109:                              #   in Loop: Header=BB376_3 Depth=1
	decl	%edx
	incl	%ebx
	jmp	LBB376_3
LBB376_6:
	leal	(%esi,%eax), %edi
	movl	%edx, (%esp)                    # 4-byte Spill
	addl	%edx, %eax
	leal	-31(%ebx), %esi
	.p2align	4
LBB376_7:                               # =>This Inner Loop Header: Depth=1
	decl	%edi
	cmpl	%esi, %edi
	jb	LBB376_8
# %bb.9:                                #   in Loop: Header=BB376_7 Depth=1
	movzbl	(%edi), %ecx
	decl	%eax
	cmpl	$34, %ecx
	je	LBB376_11
# %bb.10:                               #   in Loop: Header=BB376_7 Depth=1
	cmpl	$39, %ecx
	jne	LBB376_7
LBB376_11:
	movb	$2, -32(%ebx)
	movb	$3, (%edi)
	cmpl	%edi, %esi
	jae	LBB376_108
# %bb.12:
	cmpl	$8, %eax
	jb	LBB376_84
# %bb.13:
	xorl	%ebp, %ebp
	cmpl	$32, %eax
	jb	LBB376_87
# %bb.14:
	movl	%eax, %ebp
	andl	$-32, %ebp
	xorl	%esi, %esi
	movdqa	__xmm@20202020202020202020202020202020, %xmm0 # xmm0 = [32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32]
	jmp	LBB376_15
	.p2align	4
LBB376_79:                              #   in Loop: Header=BB376_15 Depth=1
	addl	$32, %esi
	cmpl	%esi, %ebp
	je	LBB376_80
LBB376_15:                              # =>This Inner Loop Header: Depth=1
	movdqu	-31(%ebx,%esi), %xmm2
	pcmpeqb	%xmm0, %xmm2
	movd	%xmm2, %edx
	testb	$1, %dl
	je	LBB376_17
# %bb.16:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -31(%ebx,%esi)
LBB376_17:                              #   in Loop: Header=BB376_15 Depth=1
	testb	$1, %dh
	je	LBB376_19
# %bb.18:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -30(%ebx,%esi)
LBB376_19:                              #   in Loop: Header=BB376_15 Depth=1
	movl	%edx, %ecx
	shrl	$16, %ecx
	testb	$1, %cl
	je	LBB376_21
# %bb.20:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -29(%ebx,%esi)
LBB376_21:                              #   in Loop: Header=BB376_15 Depth=1
	shrl	$24, %edx
	testb	$1, %dl
	je	LBB376_23
# %bb.22:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -28(%ebx,%esi)
LBB376_23:                              #   in Loop: Header=BB376_15 Depth=1
	pextrw	$2, %xmm2, %ecx
	testb	$1, %cl
	je	LBB376_25
# %bb.24:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -27(%ebx,%esi)
LBB376_25:                              #   in Loop: Header=BB376_15 Depth=1
	testb	$1, %ch
	je	LBB376_27
# %bb.26:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -26(%ebx,%esi)
LBB376_27:                              #   in Loop: Header=BB376_15 Depth=1
	pextrw	$3, %xmm2, %ecx
	testb	$1, %cl
	je	LBB376_29
# %bb.28:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -25(%ebx,%esi)
LBB376_29:                              #   in Loop: Header=BB376_15 Depth=1
	testb	$1, %ch
	je	LBB376_31
# %bb.30:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -24(%ebx,%esi)
LBB376_31:                              #   in Loop: Header=BB376_15 Depth=1
	pextrw	$4, %xmm2, %ecx
	testb	$1, %cl
	je	LBB376_33
# %bb.32:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -23(%ebx,%esi)
LBB376_33:                              #   in Loop: Header=BB376_15 Depth=1
	testb	$1, %ch
	je	LBB376_35
# %bb.34:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -22(%ebx,%esi)
LBB376_35:                              #   in Loop: Header=BB376_15 Depth=1
	movdqu	-15(%ebx,%esi), %xmm1
	pextrw	$5, %xmm2, %ecx
	testb	$1, %cl
	je	LBB376_37
# %bb.36:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -21(%ebx,%esi)
LBB376_37:                              #   in Loop: Header=BB376_15 Depth=1
	testb	$1, %ch
	je	LBB376_39
# %bb.38:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -20(%ebx,%esi)
LBB376_39:                              #   in Loop: Header=BB376_15 Depth=1
	pextrw	$6, %xmm2, %ecx
	testb	$1, %cl
	je	LBB376_41
# %bb.40:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -19(%ebx,%esi)
LBB376_41:                              #   in Loop: Header=BB376_15 Depth=1
	testb	$1, %ch
	je	LBB376_43
# %bb.42:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -18(%ebx,%esi)
LBB376_43:                              #   in Loop: Header=BB376_15 Depth=1
	pextrw	$7, %xmm2, %ecx
	testb	$1, %cl
	je	LBB376_45
# %bb.44:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -17(%ebx,%esi)
LBB376_45:                              #   in Loop: Header=BB376_15 Depth=1
	testb	$1, %ch
	je	LBB376_47
# %bb.46:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -16(%ebx,%esi)
LBB376_47:                              #   in Loop: Header=BB376_15 Depth=1
	pcmpeqb	%xmm0, %xmm1
	movd	%xmm1, %ecx
	testb	$1, %cl
	je	LBB376_49
# %bb.48:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -15(%ebx,%esi)
LBB376_49:                              #   in Loop: Header=BB376_15 Depth=1
	testb	$1, %ch
	je	LBB376_51
# %bb.50:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -14(%ebx,%esi)
LBB376_51:                              #   in Loop: Header=BB376_15 Depth=1
	movl	%ecx, %edx
	shrl	$16, %edx
	testb	$1, %dl
	je	LBB376_53
# %bb.52:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -13(%ebx,%esi)
LBB376_53:                              #   in Loop: Header=BB376_15 Depth=1
	shrl	$24, %ecx
	testb	$1, %cl
	je	LBB376_55
# %bb.54:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -12(%ebx,%esi)
LBB376_55:                              #   in Loop: Header=BB376_15 Depth=1
	pextrw	$2, %xmm1, %ecx
	testb	$1, %cl
	je	LBB376_57
# %bb.56:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -11(%ebx,%esi)
LBB376_57:                              #   in Loop: Header=BB376_15 Depth=1
	testb	$1, %ch
	je	LBB376_59
# %bb.58:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -10(%ebx,%esi)
LBB376_59:                              #   in Loop: Header=BB376_15 Depth=1
	pextrw	$3, %xmm1, %ecx
	testb	$1, %cl
	je	LBB376_61
# %bb.60:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -9(%ebx,%esi)
LBB376_61:                              #   in Loop: Header=BB376_15 Depth=1
	testb	$1, %ch
	je	LBB376_63
# %bb.62:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -8(%ebx,%esi)
LBB376_63:                              #   in Loop: Header=BB376_15 Depth=1
	pextrw	$4, %xmm1, %ecx
	testb	$1, %cl
	je	LBB376_65
# %bb.64:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -7(%ebx,%esi)
LBB376_65:                              #   in Loop: Header=BB376_15 Depth=1
	testb	$1, %ch
	je	LBB376_67
# %bb.66:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -6(%ebx,%esi)
LBB376_67:                              #   in Loop: Header=BB376_15 Depth=1
	pextrw	$5, %xmm1, %ecx
	testb	$1, %cl
	je	LBB376_69
# %bb.68:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -5(%ebx,%esi)
LBB376_69:                              #   in Loop: Header=BB376_15 Depth=1
	testb	$1, %ch
	je	LBB376_71
# %bb.70:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -4(%ebx,%esi)
LBB376_71:                              #   in Loop: Header=BB376_15 Depth=1
	pextrw	$6, %xmm1, %ecx
	testb	$1, %cl
	je	LBB376_73
# %bb.72:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -3(%ebx,%esi)
LBB376_73:                              #   in Loop: Header=BB376_15 Depth=1
	testb	$1, %ch
	je	LBB376_75
# %bb.74:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -2(%ebx,%esi)
LBB376_75:                              #   in Loop: Header=BB376_15 Depth=1
	pextrw	$7, %xmm1, %ecx
	testb	$1, %cl
	je	LBB376_77
# %bb.76:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, -1(%ebx,%esi)
LBB376_77:                              #   in Loop: Header=BB376_15 Depth=1
	testb	$1, %ch
	je	LBB376_79
# %bb.78:                               #   in Loop: Header=BB376_15 Depth=1
	movb	$1, (%ebx,%esi)
	jmp	LBB376_79
LBB376_8:
	movl	$8197, %ebp                     # imm = 0x2005
	jmp	LBB376_108
LBB376_80:
	cmpl	%ebp, %eax
	je	LBB376_107
# %bb.81:
	testb	$24, %al
	je	LBB376_82
LBB376_87:
	movl	%eax, %edx
	andl	$-8, %edx
	movdqa	__xmm@00000000000000000000202000000000, %xmm2 # xmm2 = [u,u,u,u,32,32,u,u,u,u,u,u,u,u,u,u]
	movdqa	__xmm@00000000000000002020000000000000, %xmm3 # xmm3 = [u,u,u,u,u,u,32,32,u,u,u,u,u,u,u,u]
	movdqa	__xmm@00000000000020200000000000000000, %xmm4 # xmm4 = [u,u,u,u,u,u,u,u,32,32,u,u,u,u,u,u]
	movdqa	__xmm@00000000202000000000000000000000, %xmm5 # xmm5 = [u,u,u,u,u,u,u,u,u,u,32,32,u,u,u,u]
	movdqa	__xmm@00002020000000000000000000000000, %xmm6 # xmm6 = [u,u,u,u,u,u,u,u,u,u,u,u,32,32,u,u]
	movdqa	__xmm@20200000000000000000000000000000, %xmm7 # xmm7 = [u,u,u,u,u,u,u,u,u,u,u,u,u,u,32,32]
	jmp	LBB376_88
	.p2align	4
LBB376_104:                             #   in Loop: Header=BB376_88 Depth=1
	addl	$8, %ebp
	cmpl	%ebp, %edx
	je	LBB376_105
LBB376_88:                              # =>This Inner Loop Header: Depth=1
	movq	-31(%ebx,%ebp), %xmm1           # xmm1 = mem[0],zero
	movdqa	%xmm1, %xmm0
	pcmpeqb	__xmm@00000020000000200000002000000020, %xmm0
	movd	%xmm0, %ecx
	testb	$1, %cl
	je	LBB376_90
# %bb.89:                               #   in Loop: Header=BB376_88 Depth=1
	movb	$1, -31(%ebx,%ebp)
LBB376_90:                              #   in Loop: Header=BB376_88 Depth=1
	movdqa	%xmm1, %xmm0
	pslld	$8, %xmm0
	pcmpeqb	__xmm@00000000000000000000000020200000, %xmm0
	movd	%xmm0, %ecx
	shrl	$16, %ecx
	testb	$1, %cl
	je	LBB376_92
# %bb.91:                               #   in Loop: Header=BB376_88 Depth=1
	movb	$1, -30(%ebx,%ebp)
LBB376_92:                              #   in Loop: Header=BB376_88 Depth=1
	pshuflw	$85, %xmm1, %xmm0               # xmm0 = xmm1[1,1,1,1,4,5,6,7]
	pcmpeqb	%xmm2, %xmm0
	pextrw	$2, %xmm0, %ecx
	testb	$1, %cl
	je	LBB376_94
# %bb.93:                               #   in Loop: Header=BB376_88 Depth=1
	movb	$1, -29(%ebx,%ebp)
LBB376_94:                              #   in Loop: Header=BB376_88 Depth=1
	movdqa	%xmm1, %xmm0
	psllq	$24, %xmm0
	pcmpeqb	%xmm3, %xmm0
	pextrw	$3, %xmm0, %ecx
	testb	$1, %cl
	je	LBB376_96
# %bb.95:                               #   in Loop: Header=BB376_88 Depth=1
	movb	$1, -28(%ebx,%ebp)
LBB376_96:                              #   in Loop: Header=BB376_88 Depth=1
	pshufd	$85, %xmm1, %xmm0               # xmm0 = xmm1[1,1,1,1]
	pcmpeqb	%xmm4, %xmm0
	pextrw	$4, %xmm0, %ecx
	testb	$1, %cl
	je	LBB376_98
# %bb.97:                               #   in Loop: Header=BB376_88 Depth=1
	movb	$1, -27(%ebx,%ebp)
LBB376_98:                              #   in Loop: Header=BB376_88 Depth=1
	movdqa	%xmm1, %xmm0
	pslldq	$5, %xmm0                       # xmm0 = zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7,8,9,10]
	pcmpeqb	%xmm5, %xmm0
	pextrw	$5, %xmm0, %ecx
	testb	$1, %cl
	je	LBB376_100
# %bb.99:                               #   in Loop: Header=BB376_88 Depth=1
	movb	$1, -26(%ebx,%ebp)
LBB376_100:                             #   in Loop: Header=BB376_88 Depth=1
	movdqa	%xmm1, %xmm0
	pslldq	$6, %xmm0                       # xmm0 = zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7,8,9]
	pcmpeqb	%xmm6, %xmm0
	pextrw	$6, %xmm0, %ecx
	testb	$1, %cl
	je	LBB376_102
# %bb.101:                              #   in Loop: Header=BB376_88 Depth=1
	movb	$1, -25(%ebx,%ebp)
LBB376_102:                             #   in Loop: Header=BB376_88 Depth=1
	pslldq	$7, %xmm1                       # xmm1 = zero,zero,zero,zero,zero,zero,zero,xmm1[0,1,2,3,4,5,6,7,8]
	pcmpeqb	%xmm7, %xmm1
	pextrw	$7, %xmm1, %ecx
	testb	$1, %cl
	je	LBB376_104
# %bb.103:                              #   in Loop: Header=BB376_88 Depth=1
	movb	$1, -24(%ebx,%ebp)
	jmp	LBB376_104
LBB376_105:
	cmpl	%edx, %eax
	jne	LBB376_106
LBB376_107:
	xorl	%ebp, %ebp
	jmp	LBB376_108
LBB376_106:
	movl	24(%esp), %esi
	addl	%edx, %esi
LBB376_83:                              # %.preheader54
	subl	(%esp), %esi                    # 4-byte Folded Reload
	xorl	%ebp, %ebp
	jmp	LBB376_84
	.p2align	4
LBB376_86:                              #   in Loop: Header=BB376_84 Depth=1
	incl	%esi
	cmpl	%esi, %edi
	je	LBB376_108
LBB376_84:                              # =>This Inner Loop Header: Depth=1
	cmpb	$32, (%esi)
	jne	LBB376_86
# %bb.85:                               #   in Loop: Header=BB376_84 Depth=1
	movb	$1, (%esi)
	jmp	LBB376_86
LBB376_82:
	movl	24(%esp), %esi
	addl	%ebp, %esi
	jmp	LBB376_83
                                        # -- End function
	.def	_String_Unpacking;
	.scl	2;
	.type	32;
	.endef
	.globl	__xmm@01010101010101010101010101010101 # -- Begin function String_Unpacking
	.section	.rdata,"dr",discard,__xmm@01010101010101010101010101010101
	.p2align	4, 0x0
__xmm@01010101010101010101010101010101:
	.zero	16,1
	.globl	__xmm@00000001000000010000000100000001
	.section	.rdata,"dr",discard,__xmm@00000001000000010000000100000001
	.p2align	4, 0x0
__xmm@00000001000000010000000100000001:
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.globl	__xmm@00000000000000000000000001010000
	.section	.rdata,"dr",discard,__xmm@00000000000000000000000001010000
	.p2align	4, 0x0
__xmm@00000000000000000000000001010000:
	.zero	1
	.zero	1
	.byte	1                               # 0x1
	.byte	1                               # 0x1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.globl	__xmm@00000000000000000000010100000000
	.section	.rdata,"dr",discard,__xmm@00000000000000000000010100000000
	.p2align	4, 0x0
__xmm@00000000000000000000010100000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	1                               # 0x1
	.byte	1                               # 0x1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.globl	__xmm@00000000000000000101000000000000
	.section	.rdata,"dr",discard,__xmm@00000000000000000101000000000000
	.p2align	4, 0x0
__xmm@00000000000000000101000000000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	1                               # 0x1
	.byte	1                               # 0x1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.globl	__xmm@00000000000001010000000000000000
	.section	.rdata,"dr",discard,__xmm@00000000000001010000000000000000
	.p2align	4, 0x0
__xmm@00000000000001010000000000000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	1                               # 0x1
	.byte	1                               # 0x1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.globl	__xmm@00000000010100000000000000000000
	.section	.rdata,"dr",discard,__xmm@00000000010100000000000000000000
	.p2align	4, 0x0
__xmm@00000000010100000000000000000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	1                               # 0x1
	.byte	1                               # 0x1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.globl	__xmm@00000101000000000000000000000000
	.section	.rdata,"dr",discard,__xmm@00000101000000000000000000000000
	.p2align	4, 0x0
__xmm@00000101000000000000000000000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	1                               # 0x1
	.byte	1                               # 0x1
	.zero	1
	.zero	1
	.globl	__xmm@01010000000000000000000000000000
	.section	.rdata,"dr",discard,__xmm@01010000000000000000000000000000
	.p2align	4, 0x0
__xmm@01010000000000000000000000000000:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	1                               # 0x1
	.byte	1                               # 0x1
	.text
	.globl	_String_Unpacking
	.p2align	4
_String_Unpacking:                      # @String_Unpacking
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	%eax
	movl	24(%esp), %esi
	xorl	%ebp, %ebp
	testl	%esi, %esi
	je	LBB377_79
# %bb.1:
	pushl	%esi
	calll	_strlen
	addl	$4, %esp
	cmpl	$2, %eax
	jl	LBB377_79
# %bb.2:                                # %.preheader.preheader
	leal	32(%esi), %ebx
	movl	$-1, %edi
	.p2align	4
LBB377_3:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movzbl	-32(%ebx), %ecx
	testl	%ecx, %ecx
	je	LBB377_79
# %bb.4:                                # %.preheader
                                        #   in Loop: Header=BB377_3 Depth=1
	cmpl	$2, %ecx
	je	LBB377_6
# %bb.5:                                #   in Loop: Header=BB377_3 Depth=1
	decl	%edi
	incl	%ebx
	jmp	LBB377_3
LBB377_6:
	leal	(%esi,%eax), %edx
	addl	%edi, %eax
	leal	-31(%ebx), %esi
	.p2align	4
LBB377_7:                               # =>This Inner Loop Header: Depth=1
	decl	%edx
	cmpl	%esi, %edx
	jb	LBB377_78
# %bb.8:                                #   in Loop: Header=BB377_7 Depth=1
	decl	%eax
	cmpb	$3, (%edx)
	jne	LBB377_7
# %bb.9:
	movb	$39, -32(%ebx)
	movb	$39, (%edx)
	cmpl	%edx, %esi
	jae	LBB377_79
# %bb.10:
	cmpl	$8, %eax
	jb	LBB377_106
# %bb.11:
	xorl	%ebp, %ebp
	cmpl	$32, %eax
	movl	%eax, (%esp)                    # 4-byte Spill
	jb	LBB377_83
# %bb.12:
	movl	%eax, %ebp
	andl	$-32, %ebp
	xorl	%esi, %esi
	movdqa	__xmm@01010101010101010101010101010101, %xmm0 # xmm0 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
	jmp	LBB377_14
	.p2align	4
LBB377_13:                              #   in Loop: Header=BB377_14 Depth=1
	addl	$32, %esi
	cmpl	%esi, %ebp
	je	LBB377_80
LBB377_14:                              # =>This Inner Loop Header: Depth=1
	movdqu	-31(%ebx,%esi), %xmm2
	pcmpeqb	%xmm0, %xmm2
	movd	%xmm2, %eax
	testb	$1, %al
	je	LBB377_16
# %bb.15:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -31(%ebx,%esi)
LBB377_16:                              #   in Loop: Header=BB377_14 Depth=1
	testb	$1, %ah
	je	LBB377_18
# %bb.17:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -30(%ebx,%esi)
LBB377_18:                              #   in Loop: Header=BB377_14 Depth=1
	movl	%eax, %ecx
	shrl	$16, %ecx
	testb	$1, %cl
	je	LBB377_20
# %bb.19:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -29(%ebx,%esi)
LBB377_20:                              #   in Loop: Header=BB377_14 Depth=1
	shrl	$24, %eax
	testb	$1, %al
	je	LBB377_22
# %bb.21:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -28(%ebx,%esi)
LBB377_22:                              #   in Loop: Header=BB377_14 Depth=1
	pextrw	$2, %xmm2, %ecx
	testb	$1, %cl
	je	LBB377_24
# %bb.23:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -27(%ebx,%esi)
LBB377_24:                              #   in Loop: Header=BB377_14 Depth=1
	testb	$1, %ch
	je	LBB377_26
# %bb.25:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -26(%ebx,%esi)
LBB377_26:                              #   in Loop: Header=BB377_14 Depth=1
	pextrw	$3, %xmm2, %ecx
	testb	$1, %cl
	je	LBB377_28
# %bb.27:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -25(%ebx,%esi)
LBB377_28:                              #   in Loop: Header=BB377_14 Depth=1
	testb	$1, %ch
	je	LBB377_30
# %bb.29:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -24(%ebx,%esi)
LBB377_30:                              #   in Loop: Header=BB377_14 Depth=1
	pextrw	$4, %xmm2, %ecx
	testb	$1, %cl
	je	LBB377_32
# %bb.31:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -23(%ebx,%esi)
LBB377_32:                              #   in Loop: Header=BB377_14 Depth=1
	testb	$1, %ch
	je	LBB377_34
# %bb.33:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -22(%ebx,%esi)
LBB377_34:                              #   in Loop: Header=BB377_14 Depth=1
	movdqu	-15(%ebx,%esi), %xmm1
	pextrw	$5, %xmm2, %ecx
	testb	$1, %cl
	je	LBB377_36
# %bb.35:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -21(%ebx,%esi)
LBB377_36:                              #   in Loop: Header=BB377_14 Depth=1
	testb	$1, %ch
	je	LBB377_38
# %bb.37:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -20(%ebx,%esi)
LBB377_38:                              #   in Loop: Header=BB377_14 Depth=1
	pextrw	$6, %xmm2, %ecx
	testb	$1, %cl
	je	LBB377_40
# %bb.39:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -19(%ebx,%esi)
LBB377_40:                              #   in Loop: Header=BB377_14 Depth=1
	testb	$1, %ch
	je	LBB377_42
# %bb.41:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -18(%ebx,%esi)
LBB377_42:                              #   in Loop: Header=BB377_14 Depth=1
	pextrw	$7, %xmm2, %ecx
	testb	$1, %cl
	je	LBB377_44
# %bb.43:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -17(%ebx,%esi)
LBB377_44:                              #   in Loop: Header=BB377_14 Depth=1
	testb	$1, %ch
	je	LBB377_46
# %bb.45:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -16(%ebx,%esi)
LBB377_46:                              #   in Loop: Header=BB377_14 Depth=1
	pcmpeqb	%xmm0, %xmm1
	movd	%xmm1, %ecx
	testb	$1, %cl
	je	LBB377_48
# %bb.47:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -15(%ebx,%esi)
LBB377_48:                              #   in Loop: Header=BB377_14 Depth=1
	testb	$1, %ch
	je	LBB377_50
# %bb.49:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -14(%ebx,%esi)
LBB377_50:                              #   in Loop: Header=BB377_14 Depth=1
	movl	%ecx, %eax
	shrl	$16, %eax
	testb	$1, %al
	je	LBB377_52
# %bb.51:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -13(%ebx,%esi)
LBB377_52:                              #   in Loop: Header=BB377_14 Depth=1
	shrl	$24, %ecx
	testb	$1, %cl
	movl	(%esp), %eax                    # 4-byte Reload
	je	LBB377_54
# %bb.53:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -12(%ebx,%esi)
LBB377_54:                              #   in Loop: Header=BB377_14 Depth=1
	pextrw	$2, %xmm1, %ecx
	testb	$1, %cl
	je	LBB377_56
# %bb.55:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -11(%ebx,%esi)
LBB377_56:                              #   in Loop: Header=BB377_14 Depth=1
	testb	$1, %ch
	je	LBB377_58
# %bb.57:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -10(%ebx,%esi)
LBB377_58:                              #   in Loop: Header=BB377_14 Depth=1
	pextrw	$3, %xmm1, %ecx
	testb	$1, %cl
	je	LBB377_60
# %bb.59:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -9(%ebx,%esi)
LBB377_60:                              #   in Loop: Header=BB377_14 Depth=1
	testb	$1, %ch
	je	LBB377_62
# %bb.61:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -8(%ebx,%esi)
LBB377_62:                              #   in Loop: Header=BB377_14 Depth=1
	pextrw	$4, %xmm1, %ecx
	testb	$1, %cl
	je	LBB377_64
# %bb.63:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -7(%ebx,%esi)
LBB377_64:                              #   in Loop: Header=BB377_14 Depth=1
	testb	$1, %ch
	je	LBB377_66
# %bb.65:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -6(%ebx,%esi)
LBB377_66:                              #   in Loop: Header=BB377_14 Depth=1
	pextrw	$5, %xmm1, %ecx
	testb	$1, %cl
	je	LBB377_68
# %bb.67:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -5(%ebx,%esi)
LBB377_68:                              #   in Loop: Header=BB377_14 Depth=1
	testb	$1, %ch
	je	LBB377_70
# %bb.69:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -4(%ebx,%esi)
LBB377_70:                              #   in Loop: Header=BB377_14 Depth=1
	pextrw	$6, %xmm1, %ecx
	testb	$1, %cl
	je	LBB377_72
# %bb.71:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -3(%ebx,%esi)
LBB377_72:                              #   in Loop: Header=BB377_14 Depth=1
	testb	$1, %ch
	je	LBB377_74
# %bb.73:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -2(%ebx,%esi)
LBB377_74:                              #   in Loop: Header=BB377_14 Depth=1
	pextrw	$7, %xmm1, %ecx
	testb	$1, %cl
	je	LBB377_76
# %bb.75:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, -1(%ebx,%esi)
LBB377_76:                              #   in Loop: Header=BB377_14 Depth=1
	testb	$1, %ch
	je	LBB377_13
# %bb.77:                               #   in Loop: Header=BB377_14 Depth=1
	movb	$32, (%ebx,%esi)
	jmp	LBB377_13
LBB377_78:
	movl	$8197, %ebp                     # imm = 0x2005
LBB377_79:                              # %.loopexit
	movl	%ebp, %eax
	addl	$4, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB377_80:
	cmpl	%ebp, %eax
	je	LBB377_81
# %bb.82:
	testb	$24, %al
	je	LBB377_108
LBB377_83:
	movl	%eax, %ecx
	andl	$-8, %ecx
	movdqa	__xmm@00000000000000000000010100000000, %xmm2 # xmm2 = [u,u,u,u,1,1,u,u,u,u,u,u,u,u,u,u]
	movdqa	__xmm@00000000000000000101000000000000, %xmm3 # xmm3 = [u,u,u,u,u,u,1,1,u,u,u,u,u,u,u,u]
	movdqa	__xmm@00000000000001010000000000000000, %xmm4 # xmm4 = [u,u,u,u,u,u,u,u,1,1,u,u,u,u,u,u]
	movdqa	__xmm@00000000010100000000000000000000, %xmm5 # xmm5 = [u,u,u,u,u,u,u,u,u,u,1,1,u,u,u,u]
	movdqa	__xmm@00000101000000000000000000000000, %xmm6 # xmm6 = [u,u,u,u,u,u,u,u,u,u,u,u,1,1,u,u]
	movdqa	__xmm@01010000000000000000000000000000, %xmm7 # xmm7 = [u,u,u,u,u,u,u,u,u,u,u,u,u,u,1,1]
	movl	24(%esp), %esi
	jmp	LBB377_85
	.p2align	4
LBB377_84:                              #   in Loop: Header=BB377_85 Depth=1
	addl	$8, %ebp
	cmpl	%ebp, %ecx
	je	LBB377_101
LBB377_85:                              # =>This Inner Loop Header: Depth=1
	movq	-31(%ebx,%ebp), %xmm1           # xmm1 = mem[0],zero
	movdqa	%xmm1, %xmm0
	pcmpeqb	__xmm@00000001000000010000000100000001, %xmm0
	movd	%xmm0, %eax
	testb	$1, %al
	je	LBB377_87
# %bb.86:                               #   in Loop: Header=BB377_85 Depth=1
	movb	$32, -31(%ebx,%ebp)
LBB377_87:                              #   in Loop: Header=BB377_85 Depth=1
	movdqa	%xmm1, %xmm0
	pslld	$8, %xmm0
	pcmpeqb	__xmm@00000000000000000000000001010000, %xmm0
	movd	%xmm0, %eax
	shrl	$16, %eax
	testb	$1, %al
	je	LBB377_89
# %bb.88:                               #   in Loop: Header=BB377_85 Depth=1
	movb	$32, -30(%ebx,%ebp)
LBB377_89:                              #   in Loop: Header=BB377_85 Depth=1
	pshuflw	$85, %xmm1, %xmm0               # xmm0 = xmm1[1,1,1,1,4,5,6,7]
	pcmpeqb	%xmm2, %xmm0
	pextrw	$2, %xmm0, %eax
	testb	$1, %al
	je	LBB377_91
# %bb.90:                               #   in Loop: Header=BB377_85 Depth=1
	movb	$32, -29(%ebx,%ebp)
LBB377_91:                              #   in Loop: Header=BB377_85 Depth=1
	movdqa	%xmm1, %xmm0
	psllq	$24, %xmm0
	pcmpeqb	%xmm3, %xmm0
	pextrw	$3, %xmm0, %eax
	testb	$1, %al
	je	LBB377_93
# %bb.92:                               #   in Loop: Header=BB377_85 Depth=1
	movb	$32, -28(%ebx,%ebp)
LBB377_93:                              #   in Loop: Header=BB377_85 Depth=1
	pshufd	$85, %xmm1, %xmm0               # xmm0 = xmm1[1,1,1,1]
	pcmpeqb	%xmm4, %xmm0
	pextrw	$4, %xmm0, %eax
	testb	$1, %al
	je	LBB377_95
# %bb.94:                               #   in Loop: Header=BB377_85 Depth=1
	movb	$32, -27(%ebx,%ebp)
LBB377_95:                              #   in Loop: Header=BB377_85 Depth=1
	movdqa	%xmm1, %xmm0
	pslldq	$5, %xmm0                       # xmm0 = zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7,8,9,10]
	pcmpeqb	%xmm5, %xmm0
	pextrw	$5, %xmm0, %eax
	testb	$1, %al
	je	LBB377_97
# %bb.96:                               #   in Loop: Header=BB377_85 Depth=1
	movb	$32, -26(%ebx,%ebp)
LBB377_97:                              #   in Loop: Header=BB377_85 Depth=1
	movdqa	%xmm1, %xmm0
	pslldq	$6, %xmm0                       # xmm0 = zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7,8,9]
	pcmpeqb	%xmm6, %xmm0
	pextrw	$6, %xmm0, %eax
	testb	$1, %al
	je	LBB377_99
# %bb.98:                               #   in Loop: Header=BB377_85 Depth=1
	movb	$32, -25(%ebx,%ebp)
LBB377_99:                              #   in Loop: Header=BB377_85 Depth=1
	pslldq	$7, %xmm1                       # xmm1 = zero,zero,zero,zero,zero,zero,zero,xmm1[0,1,2,3,4,5,6,7,8]
	pcmpeqb	%xmm7, %xmm1
	pextrw	$7, %xmm1, %eax
	testb	$1, %al
	je	LBB377_84
# %bb.100:                              #   in Loop: Header=BB377_85 Depth=1
	movb	$32, -24(%ebx,%ebp)
	jmp	LBB377_84
LBB377_101:
	cmpl	%ecx, (%esp)                    # 4-byte Folded Reload
	jne	LBB377_103
LBB377_81:
	xorl	%ebp, %ebp
	jmp	LBB377_79
LBB377_103:
	addl	%ecx, %esi
LBB377_104:                             # %.preheader54
	subl	%edi, %esi
	xorl	%ebp, %ebp
	jmp	LBB377_106
	.p2align	4
LBB377_105:                             #   in Loop: Header=BB377_106 Depth=1
	incl	%esi
	cmpl	%esi, %edx
	je	LBB377_79
LBB377_106:                             # =>This Inner Loop Header: Depth=1
	cmpb	$1, (%esi)
	jne	LBB377_105
# %bb.107:                              #   in Loop: Header=BB377_106 Depth=1
	movb	$32, (%esi)
	jmp	LBB377_105
LBB377_108:
	movl	24(%esp), %esi
	addl	%ebp, %esi
	jmp	LBB377_104
                                        # -- End function
	.def	_Structure_Compile;
	.scl	2;
	.type	32;
	.endef
	.globl	_Structure_Compile              # -- Begin function Structure_Compile
	.p2align	4
_Structure_Compile:                     # @Structure_Compile
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$80, %esp
	movl	96(%esp), %edi
	xorl	%esi, %esi
	testl	%edi, %edi
	je	LBB378_9
# %bb.1:
	pushl	$46
	pushl	%edi
	calll	_strchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB378_9
# %bb.2:
	movl	%esp, %ebx
	pushl	%edi
	pushl	%ebx
	calll	_strcpy
	addl	$8, %esp
	pushl	$46
	pushl	%ebx
	calll	_strrchr
	addl	$8, %esp
	movb	$0, (%eax)
	pushl	$600                            # imm = 0x258
	pushl	$_Rtedge_GetStructureName.name
	pushl	$"??_C@_06CLBDIDBH@Source?$AA@"
	pushl	%ebx
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	xorl	%esi, %esi
	testl	%eax, %eax
	je	LBB378_3
LBB378_9:
	movl	%esi, %eax
	addl	$80, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
LBB378_3:
	movl	$1431458899, %eax               # imm = 0x55525453
	xorl	_Rtedge_GetStructureName.name, %eax
	movl	$592724821, %ecx                # imm = 0x23544355
	xorl	_Rtedge_GetStructureName.name+3, %ecx
	orl	%eax, %ecx
	je	LBB378_5
# %bb.4:
	pushl	$9
	pushl	$L___const.Rtedge_GetStructureName.tag2
	pushl	$_Rtedge_GetStructureName.name
	calll	_memcmp
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB378_9
LBB378_5:
	pushl	%ebx
	calll	_Functionblock_Register
	addl	$4, %esp
	movl	_variablelist, %ebx
	testl	%ebx, %ebx
	je	LBB378_9
	.p2align	4
LBB378_7:                               # %.preheader.i
                                        # =>This Inner Loop Header: Depth=1
	pushl	%edi
	pushl	(%ebx)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB378_8
# %bb.10:                               #   in Loop: Header=BB378_7 Depth=1
	movl	19(%ebx), %ebx
	testl	%ebx, %ebx
	jne	LBB378_7
	jmp	LBB378_9
LBB378_8:
	addl	$4, %ebx
	movl	%ebx, %esi
	jmp	LBB378_9
                                        # -- End function
	.def	_Structure_CreateCatalog;
	.scl	2;
	.type	32;
	.endef
	.globl	_Structure_CreateCatalog        # -- Begin function Structure_CreateCatalog
	.p2align	4
_Structure_CreateCatalog:               # @Structure_CreateCatalog
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$92, %esp
	movl	112(%esp), %ebx
	pushl	$600                            # imm = 0x258
	pushl	$_Rtedge_GetStructureName.name
	pushl	$"??_C@_06CLBDIDBH@Source?$AA@"
	pushl	%ebx
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	je	LBB379_1
LBB379_3:                               # %Rtedge_IsStructure.exit
	pushl	$"??_C@_0BJ@EJLMNAHD@structure?5tag?5not?5found?4?$AA@"
	pushl	$8194                           # imm = 0x2002
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB379_34
LBB379_1:
	movl	$1431458899, %eax               # imm = 0x55525453
	xorl	_Rtedge_GetStructureName.name, %eax
	movl	$592724821, %ecx                # imm = 0x23544355
	xorl	_Rtedge_GetStructureName.name+3, %ecx
	orl	%eax, %ecx
	je	LBB379_4
# %bb.2:
	pushl	$9
	pushl	$L___const.Rtedge_GetStructureName.tag2
	pushl	$_Rtedge_GetStructureName.name
	calll	_memcmp
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB379_3
LBB379_4:
	movl	116(%esp), %ebp
	movl	$0, 12(%esp)
	leal	12(%esp), %eax
	pushl	$4
	pushl	%eax
	pushl	$"??_C@_05HKHPEFOF@Entry?$AA@"
	pushl	%ebx
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	xorl	%ecx, %ecx
	testl	%eax, %eax
	movl	12(%esp), %eax
	movl	%eax, 4(%esp)                   # 4-byte Spill
	cmovel	%eax, %ecx
	movl	%ecx, 8(%esp)                   # 4-byte Spill
	movl	_variablelist, %esi
	testl	%esi, %esi
	je	LBB379_8
	.p2align	4
LBB379_6:                               # %.preheader.i
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebx
	pushl	(%esi)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB379_9
# %bb.7:                                #   in Loop: Header=BB379_6 Depth=1
	movl	19(%esi), %esi
	testl	%esi, %esi
	jne	LBB379_6
LBB379_8:                               # %.loopexit4
	pushl	$1059                           # imm = 0x423
	pushl	%ebx
	calll	_Variable_Add
	addl	$8, %esp
	movl	8(%esp), %ecx                   # 4-byte Reload
	movl	%ecx, 6(%eax)
	movl	4(%esp), %ecx                   # 4-byte Reload
	movl	23(%ecx), %ecx
	movl	%ecx, (%eax)
LBB379_9:                               # %Rtedge_GetStructureName.exit
	pushl	$600                            # imm = 0x258
	pushl	$_Rtedge_GetStructureName.name
	pushl	$"??_C@_06CLBDIDBH@Source?$AA@"
	pushl	%ebx
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%ebp, %ebp
	je	LBB379_33
# %bb.10:
	xorl	%edi, %edi
	jmp	LBB379_11
	.p2align	4
LBB379_28:                              #   in Loop: Header=BB379_11 Depth=1
	movl	-4(%ecx), %edi
	cmpl	$-1, %edi
	je	LBB379_29
	.p2align	4
LBB379_32:                              # %Rtedge_SizeOf.exit
                                        #   in Loop: Header=BB379_11 Depth=1
	addl	%edx, %edi
	movl	10(%ebp), %ebp
	testl	%ebp, %ebp
	je	LBB379_33
LBB379_11:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB379_27 Depth 2
	pushl	%ebx
	leal	16(%esp), %esi
	pushl	%esi
	calll	_strcpy
	addl	$8, %esp
	pushl	%esi
	calll	_strlen
	addl	$4, %esp
	movw	$46, 12(%esp,%eax)
	pushl	2(%ebp)
	pushl	%esi
	calll	_strcat
	addl	$8, %esp
	movzwl	(%ebp), %eax
	pushl	%eax
	pushl	%esi
	calll	_Variable_Add
	addl	$8, %esp
	movl	%eax, %esi
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	%eax, 6(%esi)
	movzwl	%di, %edx
	movl	4(%esp), %eax                   # 4-byte Reload
	movl	23(%eax), %eax
	addl	%edx, %eax
	movl	%eax, (%esi)
	movzwl	4(%esi), %eax
	cmpl	$32769, %eax                    # imm = 0x8001
	jne	LBB379_25
# %bb.12:                               #   in Loop: Header=BB379_11 Depth=1
	movl	%edx, (%esp)                    # 4-byte Spill
	pushl	$15
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %edi
	testl	%eax, %eax
	je	LBB379_13
# %bb.14:                               #   in Loop: Header=BB379_11 Depth=1
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%edi, (%eax)
	movl	$15, 4(%eax)
	movl	$"??_C@_0CC@PMKPPOMH@Structure_CreateCatalog?3D_ANY?5pi@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB379_15
# %bb.16:                               #   in Loop: Header=BB379_11 Depth=1
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB379_17
LBB379_13:                              #   in Loop: Header=BB379_11 Depth=1
	pushl	$"??_C@_0CC@PMKPPOMH@Structure_CreateCatalog?3D_ANY?5pi@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB379_18
LBB379_29:                              #   in Loop: Header=BB379_11 Depth=1
	movl	6(%esi), %eax
	movl	$0, %edi
	testl	%eax, %eax
	je	LBB379_32
# %bb.30:                               #   in Loop: Header=BB379_11 Depth=1
	movzwl	5(%eax), %edi
	jmp	LBB379_32
LBB379_15:                              #   in Loop: Header=BB379_11 Depth=1
	movl	%eax, _heaplist
LBB379_17:                              #   in Loop: Header=BB379_11 Depth=1
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB379_18:                              # %Heap_Alloc.exit
                                        #   in Loop: Header=BB379_11 Depth=1
	pushl	$83
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %ebx
	testl	%eax, %eax
	je	LBB379_19
# %bb.20:                               #   in Loop: Header=BB379_11 Depth=1
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%ebx, (%eax)
	movl	$83, 4(%eax)
	movl	$"??_C@_0CJ@OILNIPDE@Structure_CreateCatalog?3D_ANY?5pi@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB379_21
# %bb.22:                               #   in Loop: Header=BB379_11 Depth=1
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB379_23
LBB379_19:                              #   in Loop: Header=BB379_11 Depth=1
	pushl	$"??_C@_0CJ@OILNIPDE@Structure_CreateCatalog?3D_ANY?5pi@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	movl	(%esp), %edx                    # 4-byte Reload
	jmp	LBB379_24
LBB379_21:                              #   in Loop: Header=BB379_11 Depth=1
	movl	%eax, _heaplist
LBB379_23:                              #   in Loop: Header=BB379_11 Depth=1
	movl	(%esp), %edx                    # 4-byte Reload
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB379_24:                              # %Heap_Alloc.exit2
                                        #   in Loop: Header=BB379_11 Depth=1
	movl	%ebx, (%edi)
	movl	(%esi), %eax
	movl	%edi, (%eax)
	movzwl	4(%esi), %eax
	movl	112(%esp), %ebx
LBB379_25:                              #   in Loop: Header=BB379_11 Depth=1
	xorl	%edi, %edi
	cmpl	$0, _typematch
	je	LBB379_32
# %bb.26:                               # %.preheader.i3.preheader
                                        #   in Loop: Header=BB379_11 Depth=1
	movl	$_typematch+14, %ecx
	.p2align	4
LBB379_27:                              # %.preheader.i3
                                        #   Parent Loop BB379_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpw	-10(%ecx), %ax
	je	LBB379_28
# %bb.31:                               #   in Loop: Header=BB379_27 Depth=2
	cmpl	$0, (%ecx)
	leal	14(%ecx), %ecx
	jne	LBB379_27
	jmp	LBB379_32
LBB379_33:                              # %.loopexit
	movl	$2, _status_structure
LBB379_34:
	xorl	%eax, %eax
	addl	$92, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Structure_GetSize;
	.scl	2;
	.type	32;
	.endef
	.globl	_Structure_GetSize              # -- Begin function Structure_GetSize
	.p2align	4
_Structure_GetSize:                     # @Structure_GetSize
# %bb.0:
	xorl	%eax, %eax
	retl
                                        # -- End function
	.def	_Trigger_TagInit;
	.scl	2;
	.type	32;
	.endef
	.globl	_Trigger_TagInit                # -- Begin function Trigger_TagInit
	.p2align	4
_Trigger_TagInit:                       # @Trigger_TagInit
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %edi
	pushl	$8
	calll	_malloc
	addl	$4, %esp
	movl	%eax, %esi
	movl	%edi, (%eax)
	addl	$4, %eax
	movl	$0, 4(%esi)
	pushl	$4
	pushl	%eax
	pushl	%edi
	calll	*__imp__EgTagWriteByIndex
	addl	$12, %esp
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Trigger_TagClear;
	.scl	2;
	.type	32;
	.endef
	.globl	_Trigger_TagClear               # -- Begin function Trigger_TagClear
	.p2align	4
_Trigger_TagClear:                      # @Trigger_TagClear
# %bb.0:
	cmpl	$0, 4(%esp)
	jne	_free                           # TAILCALL
# %bb.1:
	retl
                                        # -- End function
	.def	_Trigger_TagCheck;
	.scl	2;
	.type	32;
	.endef
	.globl	_Trigger_TagCheck               # -- Begin function Trigger_TagCheck
	.p2align	4
_Trigger_TagCheck:                      # @Trigger_TagCheck
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %esi
	leal	4(%esi), %eax
	movl	4(%esi), %edi
	pushl	$4
	pushl	%eax
	pushl	(%esi)
	calll	*__imp__EgTagReadByIndex
	addl	$12, %esp
	cmpl	4(%esi), %edi
	setne	%al
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Trigger_TagFinished;
	.scl	2;
	.type	32;
	.endef
	.globl	_Trigger_TagFinished            # -- Begin function Trigger_TagFinished
	.p2align	4
_Trigger_TagFinished:                   # @Trigger_TagFinished
# %bb.0:
	movl	4(%esp), %eax
	leal	4(%eax), %ecx
	movl	$0, 4(%eax)
	pushl	$4
	pushl	%ecx
	pushl	(%eax)
	calll	*__imp__EgTagWriteByIndex
	addl	$12, %esp
	retl
                                        # -- End function
	.def	_Trigger_DetectThread;
	.scl	2;
	.type	32;
	.endef
	.globl	_Trigger_DetectThread           # -- Begin function Trigger_DetectThread
	.p2align	4
_Trigger_DetectThread:                  # @Trigger_DetectThread
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$20, %esp
	movl	$1, 4(%esp)
	movl	__imp__ServiceRealName, %eax
	pushl	$"??_C@_08KDKDEPAG@Interval?$AA@"
	pushl	%eax
	pushl	$"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
	pushl	$__ContainerTagName
	calll	_sprintf
	addl	$16, %esp
	leal	4(%esp), %eax
	pushl	$4
	pushl	%eax
	pushl	$__ContainerTagName
	calll	*__imp__EgTagRead
	addl	$12, %esp
	movl	4(%esp), %edi
	movl	_trigger+26, %ebx
	pushl	$0
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movzwl	%ax, %eax
	pushl	$"??_C@_04FIMCAEDB@Trig?$AA@"
	pushl	%eax
	pushl	$0
	calll	_CatalogRtHandle
	addl	$12, %esp
	pushl	$8
	calll	_malloc
	addl	$4, %esp
	movl	%eax, %esi
	movl	%ebx, (%eax)
	movl	$0, 4(%eax)
	movl	%eax, %ebp
	addl	$4, %ebp
	movl	%edi, 12(%esp)                  # 4-byte Spill
	movl	%ebp, 8(%esp)                   # 4-byte Spill
	jmp	LBB385_3
LBB385_22:                              #   in Loop: Header=BB385_3 Depth=1
	calll	_Project_Load
	movl	_indicate+164, %eax
	movb	$1, (%eax)
	calll	_Retain_Load
	calll	_Logic_Swap
	calll	_Variable_Swap
	cmpb	$0, _bPrintMode
	je	LBB385_2
LBB385_23:                              #   in Loop: Header=BB385_3 Depth=1
	calll	_Status_DetailDisplay
	.p2align	4
LBB385_2:                               # %Api_PlcDownload.exit
                                        #   in Loop: Header=BB385_3 Depth=1
	movl	$0, 4(%esi)
	movl	(%esi), %ebx
	movl	12(%esp), %edi                  # 4-byte Reload
	movl	8(%esp), %ebp                   # 4-byte Reload
LBB385_3:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB385_4 Depth 2
                                        #     Child Loop BB385_21 Depth 2
	pushl	$4
	pushl	%ebp
	pushl	%ebx
	calll	*__imp__EgTagWriteByIndex
	addl	$12, %esp
	movl	__imp__EgTagReadByIndex, %ebx
	.p2align	4
LBB385_4:                               #   Parent Loop BB385_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	pushl	%edi
	calll	_RtSleepEx
	addl	$4, %esp
	movb	$0, 3(%esp)
	pushl	$1
	leal	7(%esp), %eax
	pushl	%eax
	pushl	_indicate+86
	calll	*%ebx
	addl	$12, %esp
	cmpb	$0, 3(%esp)
	je	LBB385_4
# %bb.5:                                #   in Loop: Header=BB385_4 Depth=2
	incl	_Indicate_Live.live
	pushl	$4
	pushl	$_Indicate_Live.live
	pushl	_indicate+116
	calll	*__imp__EgTagWriteByIndex
	addl	$12, %esp
	movl	4(%esi), %ebx
	pushl	$4
	pushl	%ebp
	pushl	(%esi)
	calll	*__imp__EgTagReadByIndex
	addl	$12, %esp
	movl	4(%esi), %eax
	cmpl	%eax, %ebx
	movl	__imp__EgTagReadByIndex, %ebx
	je	LBB385_4
# %bb.6:                                #   in Loop: Header=BB385_3 Depth=1
	cmpl	$199, %eax
	jg	LBB385_10
# %bb.7:                                #   in Loop: Header=BB385_3 Depth=1
	addl	$-100, %eax
	cmpl	$23, %eax
	ja	LBB385_2
# %bb.8:                                #   in Loop: Header=BB385_3 Depth=1
	jmpl	*LJTI385_0(,%eax,4)
LBB385_9:                               #   in Loop: Header=BB385_3 Depth=1
	calll	_PLCcontrol_Stop
	jmp	LBB385_2
	.p2align	4
LBB385_10:                              #   in Loop: Header=BB385_3 Depth=1
	cmpl	$299, %eax                      # imm = 0x12B
	jle	LBB385_17
# %bb.11:                               #   in Loop: Header=BB385_3 Depth=1
	cmpl	$300, %eax                      # imm = 0x12C
	je	LBB385_29
# %bb.12:                               #   in Loop: Header=BB385_3 Depth=1
	cmpl	$301, %eax                      # imm = 0x12D
	je	LBB385_31
# %bb.13:                               #   in Loop: Header=BB385_3 Depth=1
	cmpl	$302, %eax                      # imm = 0x12E
	jne	LBB385_2
# %bb.14:                               #   in Loop: Header=BB385_3 Depth=1
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB385_2
# %bb.15:                               #   in Loop: Header=BB385_3 Depth=1
	movzwl	35(%eax), %eax
	pushl	%eax
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$4, %ax
	jne	LBB385_2
# %bb.16:                               #   in Loop: Header=BB385_3 Depth=1
	movl	_sqtbl, %eax
	movzwl	35(%eax), %eax
	pushl	$1
	pushl	%eax
	calll	_ReleaseRtSemaphore
	addl	$8, %esp
	jmp	LBB385_2
LBB385_17:                              #   in Loop: Header=BB385_3 Depth=1
	cmpl	$200, %eax
	je	LBB385_23
# %bb.18:                               #   in Loop: Header=BB385_3 Depth=1
	cmpl	$201, %eax
	jne	LBB385_2
# %bb.19:                               #   in Loop: Header=BB385_3 Depth=1
	pushl	$L_str.4
	calll	_puts
	addl	$4, %esp
	movl	_RUNplcLogic, %ebx
	testl	%ebx, %ebx
	je	LBB385_35
# %bb.20:                               # %.preheader.i.i.preheader
                                        #   in Loop: Header=BB385_3 Depth=1
	movl	$1, %ebp
	.p2align	4
LBB385_21:                              # %.preheader.i.i
                                        #   Parent Loop BB385_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	12(%ebx), %eax
	cmpl	$_VARIANT_EMPTY, %eax
	movl	$0, %edx
	cmovel	%edx, %eax
	movl	8(%ebx), %ecx
	cmpl	$_VARIANT_EMPTY, %ecx
	cmovel	%edx, %ecx
	movl	(%ebx), %edi
	movl	%edi, 16(%esp)                  # 4-byte Spill
	movl	4(%ebx), %edi
	cmpl	$_VARIANT_EMPTY, %edi
	cmovel	%edx, %edi
	pushl	20(%ebx)
	pushl	16(%ebx)
	pushl	%eax
	pushl	%ecx
	pushl	%edi
	movl	36(%esp), %eax                  # 4-byte Reload
	pushl	(%eax)
	pushl	%ebp
	pushl	$"??_C@_0CI@IHKJGMPN@?5?5line?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5?5?$CF0@"
	calll	_printf
	addl	$32, %esp
	movl	24(%ebx), %ebx
	incl	%ebp
	testl	%ebx, %ebx
	jne	LBB385_21
	jmp	LBB385_2
LBB385_1:                               #   in Loop: Header=BB385_3 Depth=1
	calll	_Retain_Save
	jmp	LBB385_2
LBB385_24:                              #   in Loop: Header=BB385_3 Depth=1
	calll	_Retain_Save
	calll	_Variable_Reset_All
	calll	*__imp__EgTagSetDefaultValue
	calll	_Retain_Load
	jmp	LBB385_2
LBB385_25:                              #   in Loop: Header=BB385_3 Depth=1
	calll	_Retain_Save
	calll	_Variable_Reset_All
	calll	*__imp__EgTagSetDefaultValue
	calll	_Retain_Load
LBB385_26:                              #   in Loop: Header=BB385_3 Depth=1
	calll	_PLCcontrol_Start
	jmp	LBB385_2
LBB385_27:                              #   in Loop: Header=BB385_3 Depth=1
	calll	_Retain_Load
	jmp	LBB385_2
LBB385_29:                              #   in Loop: Header=BB385_3 Depth=1
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB385_2
# %bb.30:                               #   in Loop: Header=BB385_3 Depth=1
	movb	$1, 33(%eax)
	movl	$6, _status_step
	movl	_indicate+254, %eax
	movb	$1, (%eax)
	jmp	LBB385_2
LBB385_31:                              #   in Loop: Header=BB385_3 Depth=1
	movl	_sqtbl, %eax
	testl	%eax, %eax
	je	LBB385_2
# %bb.32:                               #   in Loop: Header=BB385_3 Depth=1
	movb	$0, 33(%eax)
	movl	$2, _status_step
	movzwl	35(%eax), %eax
	pushl	%eax
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$4, %ax
	jne	LBB385_34
# %bb.33:                               #   in Loop: Header=BB385_3 Depth=1
	movl	_sqtbl, %eax
	movzwl	35(%eax), %eax
	pushl	$1
	pushl	%eax
	calll	_ReleaseRtSemaphore
	addl	$8, %esp
LBB385_34:                              #   in Loop: Header=BB385_3 Depth=1
	movl	_indicate+254, %eax
	movb	$0, (%eax)
	jmp	LBB385_2
LBB385_35:                              #   in Loop: Header=BB385_3 Depth=1
	pushl	$L_str.1.254
	calll	_puts
	addl	$4, %esp
	jmp	LBB385_2
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI385_0:
	.long	LBB385_9
	.long	LBB385_24
	.long	LBB385_2
	.long	LBB385_2
	.long	LBB385_2
	.long	LBB385_2
	.long	LBB385_2
	.long	LBB385_2
	.long	LBB385_2
	.long	LBB385_2
	.long	LBB385_25
	.long	LBB385_26
	.long	LBB385_2
	.long	LBB385_2
	.long	LBB385_2
	.long	LBB385_2
	.long	LBB385_2
	.long	LBB385_2
	.long	LBB385_2
	.long	LBB385_2
	.long	LBB385_22
	.long	LBB385_2
	.long	LBB385_1
	.long	LBB385_27
                                        # -- End function
	.def	_Trigger_Init;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Trigger_Init                   # -- Begin function Trigger_Init
	.p2align	4
_Trigger_Init:                          # @Trigger_Init
# %bb.0:
	pushl	%eax
	pushl	$_trigger
	calll	_Container_CreateTagsFromList
	addl	$4, %esp
	movl	$140, (%esp)
	movl	__imp__ServiceRealName, %eax
	pushl	$"??_C@_08KGEIBGG@Priority?$AA@"
	pushl	%eax
	pushl	$"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
	pushl	$__ContainerTagName
	calll	_sprintf
	addl	$16, %esp
	movl	%esp, %eax
	pushl	$4
	pushl	%eax
	pushl	$__ContainerTagName
	calll	*__imp__EgTagRead
	addl	$12, %esp
	movzbl	(%esp), %eax
	addb	$6, %al
	movzbl	%al, %eax
	pushl	$0
	pushl	$4096                           # imm = 0x1000
	pushl	$_Trigger_DetectThread
	pushl	%eax
	calll	_CreateRtThread
	addl	$16, %esp
	xorl	%eax, %eax
	popl	%ecx
	retl
                                        # -- End function
	.def	_Status_Topic;
	.scl	2;
	.type	32;
	.endef
	.globl	_Status_Topic                   # -- Begin function Status_Topic
	.p2align	4
_Status_Topic:                          # @Status_Topic
# %bb.0:
	movl	4(%esp), %eax
	movl	L___const.Status_Topic.topic(,%eax,4), %eax
	retl
                                        # -- End function
	.def	_Status_Display;
	.scl	2;
	.type	32;
	.endef
	.globl	_Status_Display                 # -- Begin function Status_Display
	.p2align	4
_Status_Display:                        # @Status_Display
# %bb.0:
	pushl	$L_str.202
	calll	_puts
	addl	$4, %esp
	movl	_status_errorlog, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0O@PIFKHJEH@errorlog?5list?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_logic, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0L@KDAGFJJM@logic?5list?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_inifile, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0BA@JNEKCDIC@inifile?5feature?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_mnmfile, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0BA@FANHOABO@mnmfile?5feature?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_internalclock, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0O@LFCAOOJB@internalclock?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_engine, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0P@HMNLIEBD@engine?5feature?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_bluescreen, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0BD@OAIJAOHP@bluescreen?5feature?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_instruction, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0BE@CDDLLKOB@instruction?5feature?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_pause, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0O@GKLGJKNL@pause?5feature?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_step, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0N@JGCMANAB@step?5feature?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_watchdog, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0BB@IHCPDHLN@watchdog?5feature?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_api, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0M@HFBCMFOB@api?5feature?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_plccontrol, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0BC@JAJMGGA@plc?5control?5state?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_retain, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0P@DCJKHNDF@retain?5feature?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	retl
                                        # -- End function
	.def	_Status_DetailDisplay;
	.scl	2;
	.type	32;
	.endef
	.globl	_Status_DetailDisplay           # -- Begin function Status_DetailDisplay
	.p2align	4
_Status_DetailDisplay:                  # @Status_DetailDisplay
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	calll	_Status_Display
	pushl	$L_str.40
	calll	_puts
	addl	$4, %esp
	movl	_heaplist, %esi
	testl	%esi, %esi
	je	LBB389_24
# %bb.1:                                # %.preheader.i.preheader
	movl	$1, %edi
	.p2align	4
LBB389_2:                               # %.preheader.i
                                        # =>This Inner Loop Header: Depth=1
	pushl	8(%esi)
	pushl	4(%esi)
	pushl	12(%esi)
	pushl	(%esi)
	pushl	%edi
	pushl	$"??_C@_0CI@CHIKLELK@?5?5Heap?$CI?$CF03d?$CJ?5?$CFp?5?5Order?$CD?$CFd?5?$CFd?5byt@"
	calll	_printf
	addl	$24, %esp
	movl	16(%esi), %esi
	incl	%edi
	testl	%esi, %esi
	jne	LBB389_2
	jmp	LBB389_3
LBB389_24:
	pushl	$L_str.1.254
	calll	_puts
	addl	$4, %esp
LBB389_3:                               # %Heap_Display.exit
	pushl	$L_str
	calll	_puts
	addl	$4, %esp
	cmpw	$0, _NumBasicFunctions
	je	LBB389_25
# %bb.4:                                # %.preheader.i1.preheader
	movl	$1, %edi
	xorl	%esi, %esi
	.p2align	4
LBB389_5:                               # %.preheader.i1
                                        # =>This Inner Loop Header: Depth=1
	movl	_BasicFunctions, %eax
	pushl	13(%eax,%esi)
	pushl	(%eax,%esi)
	pushl	%edi
	pushl	$"??_C@_0BM@NHPPFOEA@?5?5function?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@"
	calll	_printf
	addl	$16, %esp
	movzwl	_NumBasicFunctions, %eax
	addl	$19, %esi
	cmpl	%eax, %edi
	leal	1(%edi), %edi
	jb	LBB389_5
	jmp	LBB389_6
LBB389_25:
	pushl	$L_str.1.254
	calll	_puts
	addl	$4, %esp
LBB389_6:                               # %Basicfunction_Display.exit
	pushl	$L_str.39
	calll	_puts
	addl	$4, %esp
	movl	_FbList, %esi
	testl	%esi, %esi
	je	LBB389_9
# %bb.7:                                # %.preheader.i2.preheader
	movl	$1, %edi
	.p2align	4
LBB389_8:                               # %.preheader.i2
                                        # =>This Inner Loop Header: Depth=1
	pushl	4(%esi)
	pushl	(%esi)
	pushl	%edi
	pushl	$"??_C@_0BG@JCCPOPHJ@?5?5FB?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@"
	calll	_printf
	addl	$16, %esp
	incl	%edi
	movl	16(%esi), %esi
	testl	%esi, %esi
	jne	LBB389_8
LBB389_9:                               # %Functionblock_Display.exit
	pushl	$L_str.128
	calll	_puts
	addl	$4, %esp
	movl	_poulist, %esi
	testl	%esi, %esi
	je	LBB389_26
# %bb.10:                               # %.preheader.i3.preheader
	movl	$1, %edi
	.p2align	4
LBB389_11:                              # %.preheader.i3
                                        # =>This Inner Loop Header: Depth=1
	pushl	(%esi)
	pushl	%edi
	pushl	$"??_C@_0BE@CDIPEEK@?5?5POUfile?$CI?$CF03d?$CJ?5?$CFs?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	4(%esi), %esi
	incl	%edi
	testl	%esi, %esi
	jne	LBB389_11
	jmp	LBB389_12
LBB389_26:
	pushl	$L_str.1.254
	calll	_puts
	addl	$4, %esp
LBB389_12:                              # %Poufile_Display.exit
	calll	_Logic_Display
	pushl	$L_str.86
	calll	_puts
	addl	$4, %esp
	movl	_plcLabel, %esi
	testl	%esi, %esi
	je	LBB389_27
# %bb.13:                               # %.preheader.i4.preheader
	movl	$1, %edi
	.p2align	4
LBB389_14:                              # %.preheader.i4
                                        # =>This Inner Loop Header: Depth=1
	pushl	8(%esi)
	pushl	(%esi)
	pushl	%edi
	pushl	$"??_C@_0BI@HABOLDNE@?5?5label?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?6?$AA@"
	calll	_printf
	addl	$16, %esp
	movl	12(%esi), %esi
	incl	%edi
	testl	%esi, %esi
	jne	LBB389_14
	jmp	LBB389_15
LBB389_27:
	pushl	$L_str.1.254
	calll	_puts
	addl	$4, %esp
LBB389_15:                              # %Label_Display.exit
	pushl	$L_str.221
	calll	_puts
	addl	$4, %esp
	movl	_plcUserFuncList, %esi
	testl	%esi, %esi
	je	LBB389_28
# %bb.16:                               # %.preheader3.i.preheader
	movl	$1, %edi
	jmp	LBB389_17
	.p2align	4
LBB389_20:                              # %.loopexit.i
                                        #   in Loop: Header=BB389_17 Depth=1
	movl	8(%esi), %esi
	incl	%edi
	testl	%esi, %esi
	je	LBB389_21
LBB389_17:                              # %.preheader3.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB389_19 Depth 2
	pushl	(%esi)
	pushl	%edi
	pushl	$"??_C@_0BF@BPMKBFAL@?5?5Userfunc?$CI?$CF03d?$CJ?5?$CFs?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	4(%esi), %ebx
	testl	%ebx, %ebx
	je	LBB389_20
# %bb.18:                               # %.preheader.i5.preheader
                                        #   in Loop: Header=BB389_17 Depth=1
	movl	$1, %ebp
	.p2align	4
LBB389_19:                              # %.preheader.i5
                                        #   Parent Loop BB389_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	pushl	(%ebx)
	pushl	%ebp
	pushl	$"??_C@_0BA@BPMJOBOE@?5?5?5?5pin?$CI?$CFd?$CJ?5?$CFs?6?$AA@"
	calll	_printf
	addl	$12, %esp
	incl	%ebp
	movl	4(%ebx), %ebx
	testl	%ebx, %ebx
	jne	LBB389_19
	jmp	LBB389_20
LBB389_28:
	pushl	$L_str.1.254
	calll	_puts
	addl	$4, %esp
LBB389_21:                              # %Userfunction_Display.exit
	calll	_Variable_Display
	cmpl	$0, _plcErrList
	je	LBB389_23
# %bb.22:                               # %.preheader.i6.preheader
	pushl	$"??_C@_00CNPNBAHC@?$AA@"
	calll	_Errorlog_Display
	addl	$4, %esp
LBB389_23:                              # %Errorlog_Count.exit
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Type_GetSize;
	.scl	2;
	.type	32;
	.endef
	.globl	_Type_GetSize                   # -- Begin function Type_GetSize
	.p2align	4
_Type_GetSize:                          # @Type_GetSize
# %bb.0:
	movl	4(%esp), %edx
	movzwl	4(%edx), %ecx
	movl	$1, %eax
	cmpl	$781, %ecx                      # imm = 0x30D
	jg	LBB390_5
# %bb.1:
	leal	-16(%ecx), %edx
	cmpl	$3, %edx
	jbe	LBB390_21
# %bb.2:
	leal	-260(%ecx), %edx
	cmpl	$3, %edx
	jbe	LBB390_22
# %bb.3:
	addl	$-512, %ecx                     # imm = 0xFE00
	cmpl	$3, %ecx
	ja	LBB390_13
# %bb.4:
	jmpl	*LJTI390_2(,%ecx,4)
LBB390_20:
	retl
LBB390_5:
	cmpl	$1345, %ecx                     # imm = 0x541
	jg	LBB390_10
# %bb.6:
	leal	-1058(%ecx), %eax
	cmpl	$3, %eax
	jae	LBB390_7
# %bb.18:
	movl	6(%edx), %eax
	testl	%eax, %eax
	je	LBB390_13
# %bb.19:
	movzwl	5(%eax), %eax
	retl
LBB390_10:
	cmpl	$1535, %ecx                     # imm = 0x5FF
	jg	LBB390_14
# %bb.11:
	cmpl	$1346, %ecx                     # imm = 0x542
	je	LBB390_17
# %bb.12:
	cmpl	$1347, %ecx                     # imm = 0x543
	je	LBB390_16
	jmp	LBB390_13
LBB390_21:
	jmpl	*LJTI390_0(,%edx,4)
LBB390_22:
	jmpl	*LJTI390_1(,%edx,4)
LBB390_23:
	movl	$2, %eax
	retl
LBB390_7:
	cmpl	$782, %ecx                      # imm = 0x30E
	je	LBB390_16
# %bb.8:
	cmpl	$783, %ecx                      # imm = 0x30F
	jne	LBB390_13
LBB390_9:
	movl	$8, %eax
	retl
LBB390_14:
	cmpl	$1536, %ecx                     # imm = 0x600
	je	LBB390_20
# %bb.15:
	cmpl	$32769, %ecx                    # imm = 0x8001
	jne	LBB390_13
LBB390_16:
	movl	$4, %eax
	retl
LBB390_13:
	xorl	%eax, %eax
	retl
LBB390_17:
	movl	$83, %eax
	retl
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI390_0:
	.long	LBB390_20
	.long	LBB390_23
	.long	LBB390_16
	.long	LBB390_9
LJTI390_1:
	.long	LBB390_20
	.long	LBB390_23
	.long	LBB390_16
	.long	LBB390_9
LJTI390_2:
	.long	LBB390_20
	.long	LBB390_23
	.long	LBB390_16
	.long	LBB390_9
                                        # -- End function
	.def	_Type_GetName;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Type_GetName                   # -- Begin function Type_GetName
	.p2align	4
_Type_GetName:                          # @Type_GetName
# %bb.0:
	movl	_typematch, %eax
	testl	%eax, %eax
	je	LBB391_1
# %bb.3:
	movzwl	4(%esp), %ecx
	cmpw	_typematch+4, %cx
	je	LBB391_2
# %bb.4:                                # %.preheader.preheader
	movl	$_typematch+18, %edx
	.p2align	4
LBB391_5:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	-4(%edx), %eax
	testl	%eax, %eax
	je	LBB391_1
# %bb.6:                                #   in Loop: Header=BB391_5 Depth=1
	cmpw	(%edx), %cx
	leal	14(%edx), %edx
	jne	LBB391_5
LBB391_2:                               # %.loopexit
	retl
LBB391_1:
	xorl	%eax, %eax
	retl
                                        # -- End function
	.def	_UserFB_Add;
	.scl	2;
	.type	32;
	.endef
	.globl	_UserFB_Add                     # -- Begin function UserFB_Add
	.p2align	4
_UserFB_Add:                            # @UserFB_Add
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %edi
	pushl	$20
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %esi
	testl	%eax, %eax
	je	LBB392_1
# %bb.2:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%esi, (%eax)
	movl	$20, 4(%eax)
	movl	$"??_C@_0L@MKIBBCNB@UserFB_Add?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB392_3
# %bb.4:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB392_5
LBB392_1:
	pushl	$"??_C@_0L@MKIBBCNB@UserFB_Add?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB392_6
LBB392_3:
	movl	%eax, _heaplist
LBB392_5:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB392_6:                               # %Heap_Alloc.exit
	movl	$0, 16(%esi)
	movl	%edi, (%esi)
	cmpl	$0, _UserFBList
	je	LBB392_7
# %bb.8:
	movl	_UserFBBottom, %eax
	movl	%esi, 16(%eax)
	jmp	LBB392_9
LBB392_7:
	movl	%esi, _UserFBList
LBB392_9:
	movl	%esi, _UserFBBottom
	movl	$2, _status_userFB
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_UserFB_AddConnector;
	.scl	2;
	.type	32;
	.endef
	.globl	_UserFB_AddConnector            # -- Begin function UserFB_AddConnector
	.p2align	4
_UserFB_AddConnector:                   # @UserFB_AddConnector
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	20(%esp), %ebx
	movl	16(%esp), %edi
	pushl	$14
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %esi
	testl	%eax, %eax
	je	LBB393_1
# %bb.2:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%esi, (%eax)
	movl	$14, 4(%eax)
	movl	$"??_C@_0BE@HHDLPLIJ@UserFB_AddConnector?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB393_3
# %bb.4:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB393_5
LBB393_1:
	pushl	$"??_C@_0BE@HHDLPLIJ@UserFB_AddConnector?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB393_6
LBB393_3:
	movl	%eax, _heaplist
LBB393_5:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB393_6:                               # %Heap_Alloc.exit
	movl	$0, 10(%esi)
	movzwl	8(%ebx), %eax
	movw	%ax, 8(%esi)
	movsd	(%ebx), %xmm0                   # xmm0 = mem[0],zero
	movsd	%xmm0, (%esi)
	movl	12(%edi), %eax
	testl	%eax, %eax
	je	LBB393_7
	.p2align	4
LBB393_8:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	%eax, %ecx
	movl	10(%eax), %eax
	testl	%eax, %eax
	jne	LBB393_8
# %bb.9:
	movl	%esi, 10(%ecx)
	jmp	LBB393_10
LBB393_7:
	movl	%esi, 12(%edi)
LBB393_10:
	movl	$2, _status_userFB
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_UserFB_Search;
	.scl	2;
	.type	32;
	.endef
	.globl	_UserFB_Search                  # -- Begin function UserFB_Search
	.p2align	4
_UserFB_Search:                         # @UserFB_Search
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	_UserFBList, %edi
	xorl	%esi, %esi
	testl	%edi, %edi
	je	LBB394_5
# %bb.1:                                # %.preheader.preheader
	movl	16(%esp), %ebx
	.p2align	4
LBB394_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebx
	pushl	(%edi)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB394_3
# %bb.4:                                #   in Loop: Header=BB394_2 Depth=1
	movl	16(%edi), %edi
	testl	%edi, %edi
	jne	LBB394_2
	jmp	LBB394_5
LBB394_3:
	movl	%edi, %esi
LBB394_5:                               # %.loopexit
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_UserFB_Clear;
	.scl	2;
	.type	32;
	.endef
	.globl	_UserFB_Clear                   # -- Begin function UserFB_Clear
	.p2align	4
_UserFB_Clear:                          # @UserFB_Clear
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	_UserFBList, %esi
	jmp	LBB395_1
	.p2align	4
LBB395_6:                               # %.loopexit5.i
                                        #   in Loop: Header=BB395_1 Depth=1
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB395_7
# %bb.9:                                #   in Loop: Header=BB395_1 Depth=1
	movl	%edx, 16(%ecx)
LBB395_11:                              #   in Loop: Header=BB395_1 Depth=1
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB395_12:                              # %Heap_Free.exit
                                        #   in Loop: Header=BB395_1 Depth=1
	pushl	%edi
	calll	_free
	addl	$4, %esp
	movl	%esi, _UserFBList
LBB395_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB395_4 Depth 2
	testl	%esi, %esi
	je	LBB395_13
# %bb.2:                                # %.preheader
                                        #   in Loop: Header=BB395_1 Depth=1
	movl	%esi, %edi
	movl	16(%esi), %esi
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB395_12
# %bb.3:                                #   in Loop: Header=BB395_1 Depth=1
	movl	%ecx, %eax
	cmpl	%edi, (%ecx)
	je	LBB395_6
	.p2align	4
LBB395_4:                               # %.preheader.i
                                        #   Parent Loop BB395_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB395_12
# %bb.5:                                #   in Loop: Header=BB395_4 Depth=2
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%edi, (%edx)
	jne	LBB395_4
	jmp	LBB395_6
LBB395_7:                               #   in Loop: Header=BB395_1 Depth=1
	cmpl	%eax, %ecx
	je	LBB395_8
# %bb.10:                               #   in Loop: Header=BB395_1 Depth=1
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB395_11
LBB395_8:                               #   in Loop: Header=BB395_1 Depth=1
	movl	$0, _heaplist
	movl	$0, _heapbottom
	jmp	LBB395_11
LBB395_13:                              # %.loopexit
	movl	$0, _UserFBBottom
	movl	$0, _UserFBList
	movl	$0, _status_userFB
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_UserFB_GetEntry;
	.scl	2;
	.type	32;
	.endef
	.globl	_UserFB_GetEntry                # -- Begin function UserFB_GetEntry
	.p2align	4
_UserFB_GetEntry:                       # @UserFB_GetEntry
# %bb.0:                                # %Rtedge_GetStructureName.exit
	pushl	$600                            # imm = 0x258
	pushl	$_Rtedge_GetStructureName.name
	pushl	$"??_C@_06CLBDIDBH@Source?$AA@"
	pushl	16(%esp)
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	xorl	%eax, %eax
	retl
                                        # -- End function
	.def	_UserFB_GetSize;
	.scl	2;
	.type	32;
	.endef
	.globl	_UserFB_GetSize                 # -- Begin function UserFB_GetSize
	.p2align	4
_UserFB_GetSize:                        # @UserFB_GetSize
# %bb.0:
	xorl	%eax, %eax
	retl
                                        # -- End function
	.def	_UserFB_TagCreate;
	.scl	2;
	.type	32;
	.endef
	.globl	_UserFB_TagCreate               # -- Begin function UserFB_TagCreate
	.p2align	4
_UserFB_TagCreate:                      # @UserFB_TagCreate
# %bb.0:
	movb	$1, %al
	retl
                                        # -- End function
	.def	_UserFB_Register;
	.scl	2;
	.type	32;
	.endef
	.globl	_UserFB_Register                # -- Begin function UserFB_Register
	.p2align	4
_UserFB_Register:                       # @UserFB_Register
# %bb.0:
	retl
                                        # -- End function
	.def	_Userfunction_Add;
	.scl	2;
	.type	32;
	.endef
	.globl	_Userfunction_Add               # -- Begin function Userfunction_Add
	.p2align	4
_Userfunction_Add:                      # @Userfunction_Add
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	20(%esp), %ebp
	pushl	$12
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %esi
	testl	%eax, %eax
	je	LBB400_1
# %bb.2:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%esi, (%eax)
	movl	$12, 4(%eax)
	movl	$"??_C@_0BB@NEHNLFHE@Userfunction_Add?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB400_3
# %bb.4:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB400_5
LBB400_1:
	pushl	$"??_C@_0BB@NEHNLFHE@Userfunction_Add?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB400_6
LBB400_3:
	movl	%eax, _heaplist
LBB400_5:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB400_6:                               # %Heap_Alloc.exit
	pushl	%ebp
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %ebx
	incl	%ebx
	pushl	%ebx
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %edi
	testl	%eax, %eax
	je	LBB400_7
# %bb.8:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%edi, (%eax)
	movl	%ebx, 4(%eax)
	movl	$"??_C@_0BG@MHHPLJKP@Userfunction_Add?3name?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB400_9
# %bb.10:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB400_11
LBB400_7:
	pushl	$"??_C@_0BG@MHHPLJKP@Userfunction_Add?3name?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB400_12
LBB400_9:
	movl	%eax, _heaplist
LBB400_11:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB400_12:                              # %Heap_Alloc.exit1
	movl	%edi, (%esi)
	pushl	%ebp
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
	movl	$0, 8(%esi)
	cmpl	$0, _plcUserFuncList
	je	LBB400_13
# %bb.14:
	movl	_plcUserFuncBottom, %eax
	movl	%esi, 8(%eax)
	jmp	LBB400_15
LBB400_13:
	movl	%esi, _plcUserFuncList
LBB400_15:
	movl	%esi, _plcUserFuncBottom
	movl	$2, _status_userfunc
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Userfunction_AddArgument;
	.scl	2;
	.type	32;
	.endef
	.globl	_Userfunction_AddArgument       # -- Begin function Userfunction_AddArgument
	.p2align	4
_Userfunction_AddArgument:              # @Userfunction_AddArgument
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	_plcUserFuncList, %edi
	testl	%edi, %edi
	je	LBB401_5
# %bb.1:                                # %.preheader4.preheader
	movl	24(%esp), %esi
	movl	20(%esp), %ebx
	.p2align	4
LBB401_2:                               # %.preheader4
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebx
	pushl	(%edi)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB401_6
# %bb.3:                                #   in Loop: Header=BB401_2 Depth=1
	movl	8(%edi), %edi
	testl	%edi, %edi
	jne	LBB401_2
	jmp	LBB401_5
LBB401_6:
	movl	_variablelist, %ebp
	testl	%ebp, %ebp
	je	LBB401_5
	.p2align	4
LBB401_7:                               # %.preheader.i
                                        # =>This Inner Loop Header: Depth=1
	movl	(%ebp), %ebx
	pushl	%esi
	pushl	%ebx
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB401_11
# %bb.8:                                #   in Loop: Header=BB401_7 Depth=1
	movl	19(%ebp), %ebp
	testl	%ebp, %ebp
	jne	LBB401_7
LBB401_5:
	xorl	%eax, %eax
LBB401_22:                              # %Variable_SearchName.exit.thread
                                        # kill: def $al killed $al killed $eax
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
LBB401_11:                              # %Variable_SearchName.exit
	pushl	$8
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %esi
	testl	%eax, %eax
	je	LBB401_14
# %bb.12:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%esi, (%eax)
	movl	$8, 4(%eax)
	movl	$"??_C@_0BJ@MHLMLJEO@Userfunction_AddArgument?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB401_15
# %bb.13:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB401_16
LBB401_14:
	pushl	$"??_C@_0BJ@MHLMLJEO@Userfunction_AddArgument?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB401_17
LBB401_15:
	movl	%eax, _heaplist
LBB401_16:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB401_17:                              # %Heap_Alloc.exit
	movl	%ebx, (%esi)
	movl	$0, 4(%esi)
	movl	4(%edi), %eax
	testl	%eax, %eax
	je	LBB401_20
	.p2align	4
LBB401_18:                              # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	%eax, %ecx
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	LBB401_18
# %bb.19:
	movl	%esi, 4(%ecx)
	jmp	LBB401_21
LBB401_20:
	movl	%esi, 4(%edi)
LBB401_21:                              # %Variable_SearchName.exit.thread
	movb	$1, %al
	jmp	LBB401_22
                                        # -- End function
	.def	_Userfunction_Search;
	.scl	2;
	.type	32;
	.endef
	.globl	_Userfunction_Search            # -- Begin function Userfunction_Search
	.p2align	4
_Userfunction_Search:                   # @Userfunction_Search
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	_plcUserFuncList, %edi
	xorl	%esi, %esi
	testl	%edi, %edi
	je	LBB402_5
# %bb.1:                                # %.preheader.preheader
	movl	16(%esp), %ebx
	.p2align	4
LBB402_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebx
	pushl	(%edi)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB402_3
# %bb.4:                                #   in Loop: Header=BB402_2 Depth=1
	movl	8(%edi), %edi
	testl	%edi, %edi
	jne	LBB402_2
	jmp	LBB402_5
LBB402_3:
	movl	%edi, %esi
LBB402_5:                               # %.loopexit
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Userfunction_Clear;
	.scl	2;
	.type	32;
	.endef
	.globl	_Userfunction_Clear             # -- Begin function Userfunction_Clear
	.p2align	4
_Userfunction_Clear:                    # @Userfunction_Clear
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	_plcUserFuncList, %esi
	jmp	LBB403_1
	.p2align	4
LBB403_32:                              # %.loopexit5.i7
                                        #   in Loop: Header=BB403_1 Depth=1
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB403_33
# %bb.35:                               #   in Loop: Header=BB403_1 Depth=1
	movl	%edx, 16(%ecx)
LBB403_37:                              #   in Loop: Header=BB403_1 Depth=1
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB403_38:                              # %.loopexit.i8
                                        #   in Loop: Header=BB403_1 Depth=1
	pushl	%edi
	calll	_free
	addl	$4, %esp
LBB403_39:                              # %Heap_Free.exit9
                                        #   in Loop: Header=BB403_1 Depth=1
	movl	%esi, _plcUserFuncList
LBB403_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB403_3 Depth 2
                                        #       Child Loop BB403_6 Depth 3
                                        #     Child Loop BB403_18 Depth 2
                                        #     Child Loop BB403_30 Depth 2
	testl	%esi, %esi
	je	LBB403_40
# %bb.2:                                # %.preheader10
                                        #   in Loop: Header=BB403_1 Depth=1
	movl	4(%esi), %edi
	jmp	LBB403_3
	.p2align	4
LBB403_8:                               # %.loopexit5.i
                                        #   in Loop: Header=BB403_3 Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB403_9
# %bb.11:                               #   in Loop: Header=BB403_3 Depth=2
	movl	%edx, 16(%ecx)
LBB403_13:                              #   in Loop: Header=BB403_3 Depth=2
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB403_14:                              # %Heap_Free.exit
                                        #   in Loop: Header=BB403_3 Depth=2
	pushl	%ebx
	calll	_free
	addl	$4, %esp
	movl	%edi, 4(%esi)
LBB403_3:                               # %.preheader10
                                        #   Parent Loop BB403_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB403_6 Depth 3
	testl	%edi, %edi
	je	LBB403_15
# %bb.4:                                # %.preheader
                                        #   in Loop: Header=BB403_3 Depth=2
	movl	%edi, %ebx
	movl	4(%edi), %edi
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB403_14
# %bb.5:                                #   in Loop: Header=BB403_3 Depth=2
	movl	%ecx, %eax
	cmpl	%ebx, (%ecx)
	je	LBB403_8
	.p2align	4
LBB403_6:                               # %.preheader.i
                                        #   Parent Loop BB403_1 Depth=1
                                        #     Parent Loop BB403_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB403_14
# %bb.7:                                #   in Loop: Header=BB403_6 Depth=3
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%ebx, (%edx)
	jne	LBB403_6
	jmp	LBB403_8
LBB403_9:                               #   in Loop: Header=BB403_3 Depth=2
	cmpl	%eax, %ecx
	je	LBB403_10
# %bb.12:                               #   in Loop: Header=BB403_3 Depth=2
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB403_13
LBB403_10:                              #   in Loop: Header=BB403_3 Depth=2
	movl	$0, _heaplist
	movl	$0, _heapbottom
	jmp	LBB403_13
	.p2align	4
LBB403_15:                              # %.loopexit
                                        #   in Loop: Header=BB403_1 Depth=1
	movl	(%esi), %edi
	testl	%edi, %edi
	je	LBB403_27
# %bb.16:                               #   in Loop: Header=BB403_1 Depth=1
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB403_26
# %bb.17:                               #   in Loop: Header=BB403_1 Depth=1
	movl	%ecx, %eax
	cmpl	%edi, (%ecx)
	je	LBB403_20
	.p2align	4
LBB403_18:                              # %.preheader.i3
                                        #   Parent Loop BB403_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB403_26
# %bb.19:                               #   in Loop: Header=BB403_18 Depth=2
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%edi, (%edx)
	jne	LBB403_18
LBB403_20:                              # %.loopexit5.i4
                                        #   in Loop: Header=BB403_1 Depth=1
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB403_21
# %bb.23:                               #   in Loop: Header=BB403_1 Depth=1
	movl	%edx, 16(%ecx)
	jmp	LBB403_25
LBB403_33:                              #   in Loop: Header=BB403_1 Depth=1
	cmpl	%eax, %ecx
	je	LBB403_34
# %bb.36:                               #   in Loop: Header=BB403_1 Depth=1
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB403_37
LBB403_21:                              #   in Loop: Header=BB403_1 Depth=1
	cmpl	%eax, %ecx
	je	LBB403_22
# %bb.24:                               #   in Loop: Header=BB403_1 Depth=1
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB403_25
LBB403_34:                              #   in Loop: Header=BB403_1 Depth=1
	movl	$0, _heaplist
	movl	$0, _heapbottom
	jmp	LBB403_37
LBB403_22:                              #   in Loop: Header=BB403_1 Depth=1
	movl	$0, _heaplist
	movl	$0, _heapbottom
	.p2align	4
LBB403_25:                              #   in Loop: Header=BB403_1 Depth=1
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB403_26:                              # %.loopexit.i
                                        #   in Loop: Header=BB403_1 Depth=1
	pushl	%edi
	calll	_free
	addl	$4, %esp
LBB403_27:                              # %Heap_Free.exit5
                                        #   in Loop: Header=BB403_1 Depth=1
	movl	$0, (%esi)
	movl	8(%esi), %esi
	movl	_plcUserFuncList, %edi
	testl	%edi, %edi
	je	LBB403_39
# %bb.28:                               #   in Loop: Header=BB403_1 Depth=1
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB403_38
# %bb.29:                               #   in Loop: Header=BB403_1 Depth=1
	movl	%ecx, %eax
	cmpl	%edi, (%ecx)
	je	LBB403_32
	.p2align	4
LBB403_30:                              # %.preheader.i6
                                        #   Parent Loop BB403_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB403_38
# %bb.31:                               #   in Loop: Header=BB403_30 Depth=2
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%edi, (%edx)
	jne	LBB403_30
	jmp	LBB403_32
LBB403_40:                              # %.loopexit11
	movl	$0, _plcUserFuncBottom
	movl	$0, _plcUserFuncList
	movl	$0, _status_userfunc
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Userfunction_Display;
	.scl	2;
	.type	32;
	.endef
	.globl	_Userfunction_Display           # -- Begin function Userfunction_Display
	.p2align	4
_Userfunction_Display:                  # @Userfunction_Display
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	$L_str.221
	calll	_puts
	addl	$4, %esp
	movl	_plcUserFuncList, %esi
	testl	%esi, %esi
	je	LBB404_7
# %bb.1:                                # %.preheader3.preheader
	movl	$1, %edi
	jmp	LBB404_2
	.p2align	4
LBB404_5:                               # %.loopexit
                                        #   in Loop: Header=BB404_2 Depth=1
	movl	8(%esi), %esi
	incl	%edi
	testl	%esi, %esi
	je	LBB404_6
LBB404_2:                               # %.preheader3
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB404_4 Depth 2
	pushl	(%esi)
	pushl	%edi
	pushl	$"??_C@_0BF@BPMKBFAL@?5?5Userfunc?$CI?$CF03d?$CJ?5?$CFs?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	4(%esi), %ebx
	testl	%ebx, %ebx
	je	LBB404_5
# %bb.3:                                # %.preheader.preheader
                                        #   in Loop: Header=BB404_2 Depth=1
	movl	$1, %ebp
	.p2align	4
LBB404_4:                               # %.preheader
                                        #   Parent Loop BB404_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	pushl	(%ebx)
	pushl	%ebp
	pushl	$"??_C@_0BA@BPMJOBOE@?5?5?5?5pin?$CI?$CFd?$CJ?5?$CFs?6?$AA@"
	calll	_printf
	addl	$12, %esp
	incl	%ebp
	movl	4(%ebx), %ebx
	testl	%ebx, %ebx
	jne	LBB404_4
	jmp	LBB404_5
LBB404_7:
	pushl	$L_str.1.254
	calll	_puts
	addl	$4, %esp
LBB404_6:                               # %.loopexit4
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Userfunction_NumArgument;
	.scl	2;
	.type	32;
	.endef
	.globl	_Userfunction_NumArgument       # -- Begin function Userfunction_NumArgument
	.p2align	4
_Userfunction_NumArgument:              # @Userfunction_NumArgument
# %bb.0:
	movl	$-1, %eax
	movl	4(%esp), %ecx
	.p2align	4
LBB405_1:                               # =>This Inner Loop Header: Depth=1
	movl	4(%ecx), %ecx
	incl	%eax
	testl	%ecx, %ecx
	jne	LBB405_1
# %bb.2:
	retl
                                        # -- End function
	.def	__Userfunction_PargeArgumentFirst;
	.scl	2;
	.type	32;
	.endef
	.globl	__Userfunction_PargeArgumentFirst # -- Begin function _Userfunction_PargeArgumentFirst
	.p2align	4
__Userfunction_PargeArgumentFirst:      # @_Userfunction_PargeArgumentFirst
# %bb.0:
	pushl	$"??_C@_01IHBHIGKO@?0?$AA@"
	pushl	8(%esp)
	calll	_strtok
	addl	$8, %esp
	retl
                                        # -- End function
	.def	__Userfunction_PargeArgumentNext;
	.scl	2;
	.type	32;
	.endef
	.globl	__Userfunction_PargeArgumentNext # -- Begin function _Userfunction_PargeArgumentNext
	.p2align	4
__Userfunction_PargeArgumentNext:       # @_Userfunction_PargeArgumentNext
# %bb.0:
	pushl	$"??_C@_01IHBHIGKO@?0?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	retl
                                        # -- End function
	.def	__Userfunction_TrimArgument;
	.scl	2;
	.type	32;
	.endef
	.globl	__Userfunction_TrimArgument     # -- Begin function _Userfunction_TrimArgument
	.p2align	4
__Userfunction_TrimArgument:            # @_Userfunction_TrimArgument
# %bb.0:
	movl	4(%esp), %eax
	movl	%eax, %ecx
	jmp	LBB408_1
	.p2align	4
LBB408_4:                               #   in Loop: Header=BB408_1 Depth=1
	incl	%ecx
LBB408_5:                               #   in Loop: Header=BB408_1 Depth=1
	incl	%eax
	testb	%dl, %dl
	je	LBB408_6
LBB408_1:                               # =>This Inner Loop Header: Depth=1
	movzbl	(%eax), %edx
	movb	%dl, %dh
	andb	$-2, %dh
	cmpb	$40, %dh
	je	LBB408_5
# %bb.2:                                #   in Loop: Header=BB408_1 Depth=1
	cmpl	%ecx, %eax
	je	LBB408_4
# %bb.3:                                #   in Loop: Header=BB408_1 Depth=1
	movb	%dl, (%ecx)
	movzbl	(%eax), %edx
	jmp	LBB408_4
LBB408_6:
	retl
                                        # -- End function
	.def	_Userfunction_ReplaceInstruction;
	.scl	2;
	.type	32;
	.endef
	.globl	_Userfunction_ReplaceInstruction # -- Begin function Userfunction_ReplaceInstruction
	.p2align	4
_Userfunction_ReplaceInstruction:       # @Userfunction_ReplaceInstruction
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$20, %esp
	movl	$_plcUserFuncList, %ecx
	movl	44(%esp), %ebx
	.p2align	4
LBB409_1:                               # =>This Inner Loop Header: Depth=1
	movl	(%ecx), %esi
	pushl	%ebx
	pushl	(%esi)
	calll	_strcmp
	addl	$8, %esp
	leal	8(%esi), %ecx
	testl	%eax, %eax
	jne	LBB409_1
# %bb.2:
	movl	4(%esi), %edi
	movl	$1, %eax
	.p2align	4
LBB409_3:                               # =>This Inner Loop Header: Depth=1
	movl	4(%esi), %esi
	decl	%eax
	testl	%esi, %esi
	jne	LBB409_3
# %bb.4:
	testl	%eax, %eax
	je	LBB409_5
# %bb.6:
	pushl	$"??_C@_02LAJDCOFE@ST?$AA@"
	calll	_Instruction_GetTemplate
	addl	$4, %esp
	movl	%eax, (%esp)                    # 4-byte Spill
	pushl	$"??_C@_02ONCLNIEI@LD?$AA@"
	calll	_Instruction_GetTemplate
	addl	$4, %esp
	movl	%eax, 4(%esp)                   # 4-byte Spill
	pushl	$"??_C@_03JBLDIHBA@UFU?$AA@"
	calll	_Instruction_GetTemplate
	addl	$4, %esp
	movl	%eax, 12(%esp)                  # 4-byte Spill
	movl	_variablelist, %ebx
	xorl	%esi, %esi
	movl	$0, %eax
	testl	%ebx, %ebx
	je	LBB409_12
# %bb.7:                                # %.preheader.i.preheader
	movl	(%edi), %ebp
	.p2align	4
LBB409_8:                               # %.preheader.i
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebp
	pushl	(%ebx)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB409_9
# %bb.10:                               #   in Loop: Header=BB409_8 Depth=1
	movl	19(%ebx), %ebx
	testl	%ebx, %ebx
	jne	LBB409_8
# %bb.11:
	xorl	%eax, %eax
	jmp	LBB409_12
LBB409_5:
	pushl	%ebx
	pushl	$8196                           # imm = 0x2004
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	movl	$_VARIANT_EMPTY, %edi
	jmp	LBB409_84
LBB409_9:
	addl	$4, %ebx
	movl	%ebx, %eax
LBB409_12:                              # %Variable_Search.exit
	pushl	$0
	pushl	$0
	pushl	%eax
	pushl	12(%esp)                        # 4-byte Folded Reload
	calll	_Logic_Add
	addl	$16, %esp
	movl	4(%edi), %ebp
	movl	$0, %ebx
	movl	40(%esp), %edi
	testl	%edi, %edi
	je	LBB409_26
# %bb.13:
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %esi
	incl	%esi
	pushl	%esi
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %ebx
	testl	%eax, %eax
	je	LBB409_14
# %bb.15:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%ebx, (%eax)
	movl	%esi, 4(%eax)
	movl	$"??_C@_0CP@OIDEEJJO@Userfunction_ReplaceInstruction?3@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB409_16
# %bb.17:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB409_18
LBB409_14:
	pushl	$"??_C@_0CP@OIDEEJJO@Userfunction_ReplaceInstruction?3@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB409_19
LBB409_16:
	movl	%eax, _heaplist
LBB409_18:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB409_19:                              # %Heap_Alloc.exit
	pushl	%edi
	pushl	%ebx
	calll	_strcpy
	addl	$8, %esp
	movl	%ebx, %eax
	movl	%ebx, %ecx
	jmp	LBB409_20
	.p2align	4
LBB409_23:                              #   in Loop: Header=BB409_20 Depth=1
	incl	%ecx
LBB409_24:                              #   in Loop: Header=BB409_20 Depth=1
	incl	%eax
	testb	%dl, %dl
	je	LBB409_25
LBB409_20:                              # =>This Inner Loop Header: Depth=1
	movzbl	(%eax), %edx
	movb	%dl, %dh
	andb	$-2, %dh
	cmpb	$40, %dh
	je	LBB409_24
# %bb.21:                               #   in Loop: Header=BB409_20 Depth=1
	cmpl	%ecx, %eax
	je	LBB409_23
# %bb.22:                               #   in Loop: Header=BB409_20 Depth=1
	movb	%dl, (%ecx)
	movzbl	(%eax), %edx
	jmp	LBB409_23
LBB409_25:
	pushl	$"??_C@_01IHBHIGKO@?0?$AA@"
	pushl	%ebx
	calll	_strtok
	addl	$8, %esp
	movl	%eax, %esi
LBB409_26:
	movl	%ebx, 8(%esp)                   # 4-byte Spill
	testl	%ebp, %ebp
	je	LBB409_42
# %bb.27:                               # %.preheader.preheader
	movl	%ebp, %edi
	jmp	LBB409_28
	.p2align	4
LBB409_40:                              #   in Loop: Header=BB409_28 Depth=1
	movzwl	4(%ebp), %eax
	xorl	%esi, %esi
	pushl	%eax
	calll	_Variable_Zero
	addl	$4, %esp
	movl	%eax, %ebx
LBB409_41:                              #   in Loop: Header=BB409_28 Depth=1
	pushl	$0
	pushl	$0
	pushl	%ebx
	pushl	16(%esp)                        # 4-byte Folded Reload
	calll	_Logic_Add
	addl	$16, %esp
	pushl	$0
	pushl	$0
	pushl	%ebp
	pushl	12(%esp)                        # 4-byte Folded Reload
	calll	_Logic_Add
	addl	$16, %esp
	movl	4(%edi), %edi
	testl	%edi, %edi
	je	LBB409_42
LBB409_28:                              # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB409_31 Depth 2
                                        #     Child Loop BB409_36 Depth 2
	movl	_variablelist, %ebx
	testl	%ebx, %ebx
	je	LBB409_29
# %bb.30:                               # %.preheader.i9.preheader
                                        #   in Loop: Header=BB409_28 Depth=1
	movl	%edi, 16(%esp)                  # 4-byte Spill
	movl	(%edi), %edi
	movl	%ebx, %ebp
	.p2align	4
LBB409_31:                              # %.preheader.i9
                                        #   Parent Loop BB409_28 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	pushl	%edi
	pushl	(%ebp)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB409_32
# %bb.33:                               #   in Loop: Header=BB409_31 Depth=2
	movl	19(%ebp), %ebp
	testl	%ebp, %ebp
	jne	LBB409_31
# %bb.34:                               #   in Loop: Header=BB409_28 Depth=1
	xorl	%ebp, %ebp
	jmp	LBB409_35
	.p2align	4
LBB409_29:                              #   in Loop: Header=BB409_28 Depth=1
	xorl	%ebp, %ebp
	jmp	LBB409_38
	.p2align	4
LBB409_32:                              #   in Loop: Header=BB409_28 Depth=1
	addl	$4, %ebp
LBB409_35:                              # %Variable_Search.exit10
                                        #   in Loop: Header=BB409_28 Depth=1
	testl	%esi, %esi
	movl	16(%esp), %edi                  # 4-byte Reload
	je	LBB409_40
	.p2align	4
LBB409_36:                              # %.preheader.i11
                                        #   Parent Loop BB409_28 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	pushl	%esi
	pushl	(%ebx)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB409_85
# %bb.37:                               #   in Loop: Header=BB409_36 Depth=2
	movl	19(%ebx), %ebx
	testl	%ebx, %ebx
	jne	LBB409_36
LBB409_38:                              # %.thread
                                        #   in Loop: Header=BB409_28 Depth=1
	pushl	%esi
	calll	_Literal_Compile
	addl	$4, %esp
	movl	%eax, %ebx
	jmp	LBB409_39
LBB409_85:                              # %Variable_Search.exit12
                                        #   in Loop: Header=BB409_28 Depth=1
	addl	$4, %ebx
LBB409_39:                              #   in Loop: Header=BB409_28 Depth=1
	pushl	$"??_C@_01IHBHIGKO@?0?$AA@"
	pushl	$0
	calll	_strtok
	addl	$8, %esp
	movl	%eax, %esi
	jmp	LBB409_41
LBB409_42:                              # %.loopexit
	movl	8(%esp), %esi                   # 4-byte Reload
	testl	%esi, %esi
	movl	44(%esp), %ebx
	je	LBB409_55
# %bb.43:
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB409_54
# %bb.44:
	cmpl	%esi, (%ecx)
	je	LBB409_45
	.p2align	4
LBB409_46:                              # %.preheader.i13
                                        # =>This Inner Loop Header: Depth=1
	movl	16(%ecx), %eax
	testl	%eax, %eax
	je	LBB409_54
# %bb.47:                               #   in Loop: Header=BB409_46 Depth=1
	movl	%ecx, %edx
	movl	%eax, %ecx
	cmpl	%esi, (%eax)
	jne	LBB409_46
	jmp	LBB409_48
LBB409_45:
	movl	%ecx, %edx
	movl	%ecx, %eax
LBB409_48:                              # %.loopexit5.i
	movl	16(%eax), %ecx
	testl	%ecx, %ecx
	je	LBB409_49
# %bb.51:
	movl	%ecx, 16(%edx)
	jmp	LBB409_53
LBB409_49:
	cmpl	%eax, %edx
	je	LBB409_50
# %bb.52:
	movl	$0, 16(%edx)
	movl	%edx, _heapbottom
	jmp	LBB409_53
LBB409_50:
	movl	$0, _heaplist
	movl	$0, _heapbottom
LBB409_53:
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB409_54:                              # %Heap_Free.exit
	pushl	%esi
	calll	_free
	addl	$4, %esp
LBB409_55:                              # %.preheader.i14.preheader
	movl	$_plcLabel, %ecx
	.p2align	4
LBB409_56:                              # %.preheader.i14
                                        # =>This Inner Loop Header: Depth=1
	movl	(%ecx), %esi
	pushl	(%esi)
	pushl	%ebx
	calll	_strcmp
	addl	$8, %esp
	leal	12(%esi), %ecx
	testl	%eax, %eax
	jne	LBB409_56
# %bb.57:                               # %Label_Search.exit
	pushl	$0
	pushl	$0
	pushl	8(%esi)
	pushl	24(%esp)                        # 4-byte Folded Reload
	calll	_Logic_Add
	addl	$16, %esp
	pushl	%ebx
	calll	_strlen
	addl	$4, %esp
	leal	2(,%eax,2), %esi
	pushl	%esi
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	testl	%eax, %eax
	movl	40(%esp), %edi
	je	LBB409_58
# %bb.59:
	movl	%eax, %ebp
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%ebp, (%eax)
	movl	%esi, 4(%eax)
	movl	$"??_C@_0CP@OIDEEJJO@Userfunction_ReplaceInstruction?3@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB409_60
# %bb.61:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB409_62
LBB409_58:                              # %Heap_Alloc.exit16.thread
	pushl	$"??_C@_0CP@OIDEEJJO@Userfunction_ReplaceInstruction?3@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB409_84
LBB409_60:
	movl	%eax, _heaplist
LBB409_62:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
	pushl	%ebx
	pushl	%ebp
	calll	_strcat
	addl	$8, %esp
	pushl	%ebp
	calll	_strlen
	addl	$4, %esp
	movw	$46, (%ebp,%eax)
	pushl	%ebx
	pushl	%ebp
	calll	_strcat
	addl	$8, %esp
	movl	_variablelist, %ebx
	xorl	%edi, %edi
	testl	%ebx, %ebx
	je	LBB409_63
# %bb.64:                               # %.preheader.i17.preheader
	movl	%ebx, %esi
	.p2align	4
LBB409_65:                              # %.preheader.i17
                                        # =>This Inner Loop Header: Depth=1
	pushl	44(%esp)
	pushl	(%esi)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB409_66
# %bb.67:                               #   in Loop: Header=BB409_65 Depth=1
	movl	19(%esi), %esi
	testl	%esi, %esi
	jne	LBB409_65
# %bb.68:
	xorl	%esi, %esi
	jmp	LBB409_69
LBB409_63:
	xorl	%esi, %esi
	jmp	LBB409_72
LBB409_66:
	addl	$4, %esi
	.p2align	4
LBB409_69:                              # %.preheader.i20
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebp
	pushl	(%ebx)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB409_70
# %bb.71:                               #   in Loop: Header=BB409_69 Depth=1
	movl	19(%ebx), %ebx
	testl	%ebx, %ebx
	jne	LBB409_69
	jmp	LBB409_72
LBB409_70:
	addl	$4, %ebx
	movl	%ebx, %edi
LBB409_72:                              # %Variable_Search.exit19.thread
	pushl	$0
	pushl	$0
	pushl	%edi
	pushl	16(%esp)                        # 4-byte Folded Reload
	calll	_Logic_Add
	addl	$16, %esp
	pushl	$0
	pushl	$0
	pushl	%esi
	pushl	12(%esp)                        # 4-byte Folded Reload
	calll	_Logic_Add
	addl	$16, %esp
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	movl	40(%esp), %edi
	je	LBB409_83
# %bb.73:
	cmpl	%ebp, (%ecx)
	je	LBB409_74
	.p2align	4
LBB409_75:                              # %.preheader.i23
                                        # =>This Inner Loop Header: Depth=1
	movl	16(%ecx), %eax
	testl	%eax, %eax
	je	LBB409_83
# %bb.76:                               #   in Loop: Header=BB409_75 Depth=1
	movl	%ecx, %edx
	movl	%eax, %ecx
	cmpl	%ebp, (%eax)
	jne	LBB409_75
	jmp	LBB409_77
LBB409_74:
	movl	%ecx, %edx
	movl	%ecx, %eax
LBB409_77:                              # %.loopexit5.i24
	movl	16(%eax), %ecx
	testl	%ecx, %ecx
	je	LBB409_78
# %bb.80:
	movl	%ecx, 16(%edx)
	jmp	LBB409_82
LBB409_78:
	cmpl	%eax, %edx
	je	LBB409_79
# %bb.81:
	movl	$0, 16(%edx)
	movl	%edx, _heapbottom
	jmp	LBB409_82
LBB409_79:
	movl	$0, _heaplist
	movl	$0, _heapbottom
LBB409_82:
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB409_83:                              # %Heap_Free.exit26
	pushl	%ebp
	calll	_free
	addl	$4, %esp
LBB409_84:
	movl	%edi, %eax
	addl	$20, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_INtime_CheckDRTOS;
	.scl	2;
	.type	32;
	.endef
	.globl	_INtime_CheckDRTOS              # -- Begin function INtime_CheckDRTOS
	.p2align	4
_INtime_CheckDRTOS:                     # @INtime_CheckDRTOS
# %bb.0:
	subl	$8, %esp
	movw	$77, 4(%esp)
	movl	$1414416722, (%esp)             # imm = 0x544E4952
	pushl	$3
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movl	%esp, %ecx
	movzwl	%ax, %eax
	pushl	$0
	pushl	%ecx
	pushl	%eax
	calll	_LookupRtHandle
	addl	$12, %esp
	xorl	%ecx, %ecx
	cmpw	$-1, %ax
	setne	%cl
	movl	%ecx, %eax
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_INtime_WaitIO;
	.scl	2;
	.type	32;
	.endef
	.globl	_INtime_WaitIO                  # -- Begin function INtime_WaitIO
	.p2align	4
_INtime_WaitIO:                         # @INtime_WaitIO
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$36, %esp
	movl	$7431506, 31(%esp)              # imm = 0x716552
	movl	$1383494227, 28(%esp)           # imm = 0x52767253
	movl	$1330205778, 24(%esp)           # imm = 0x4F495452
	movl	$7369554, 19(%esp)              # imm = 0x707352
	movl	$1383494227, 16(%esp)           # imm = 0x52767253
	movl	$1330205778, 12(%esp)           # imm = 0x4F495452
	movl	$7169363, 7(%esp)               # imm = 0x6D6553
	movl	$1400271443, 4(%esp)            # imm = 0x53767253
	movl	$1330205778, (%esp)             # imm = 0x4F495452
	pushl	$3
	calll	_GetRtThreadHandles
	addl	$4, %esp
	leal	24(%esp), %esi
	movzwl	%ax, %edi
	leal	12(%esp), %ebx
	movl	%esp, %ebp
	jmp	LBB411_1
	.p2align	4
LBB411_4:                               #   in Loop: Header=BB411_1 Depth=1
	pushl	$500                            # imm = 0x1F4
	calll	_RtSleep
	addl	$4, %esp
LBB411_1:                               # =>This Inner Loop Header: Depth=1
	pushl	$0
	pushl	%esi
	pushl	%edi
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	je	LBB411_4
# %bb.2:                                #   in Loop: Header=BB411_1 Depth=1
	pushl	$0
	pushl	%ebx
	pushl	%edi
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	je	LBB411_4
# %bb.3:                                #   in Loop: Header=BB411_1 Depth=1
	pushl	$0
	pushl	%ebp
	pushl	%edi
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	je	LBB411_4
# %bb.5:
	xorl	%eax, %eax
	addl	$36, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_UsecsToKticks;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_UsecsToKticks
	.globl	_UsecsToKticks                  # -- Begin function UsecsToKticks
	.p2align	4
_UsecsToKticks:                         # @UsecsToKticks
# %bb.0:
	movl	4(%esp), %eax
	movl	_dwKtickInUsecs, %ecx
	addl	%ecx, %eax
	decl	%eax
	xorl	%edx, %edx
	divl	%ecx
	retl
                                        # -- End function
	.def	_Fail;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Fail                           # -- Begin function Fail
	.p2align	4
_Fail:                                  # @Fail
# %bb.0:
	pushl	%esi
	subl	$12, %esp
	leal	24(%esp), %eax
	pushl	%eax
	pushl	24(%esp)
	calll	_vprintf
	addl	$8, %esp
	calll	_GetLastRtError
	pushl	%eax
	pushl	$"??_C@_0O@MGBCDFJB@?6Error?5nr?$DN?$CFx?6?$AA@"
	calll	_printf
	addl	$8, %esp
	leal	5(%esp), %esi
	pushl	%esi
	pushl	$0
	calll	_GetRtExceptionHandlerInfo
	addl	$8, %esp
	movb	$0, 11(%esp)
	pushl	%esi
	calll	_SetRtExceptionHandler
	addl	$4, %esp
	cmpl	$0, _strInit
	je	LBB413_6
# %bb.1:
	movzwl	_strInit+4, %esi
	pushl	$0
	calll	_GetRtThreadHandles
	addl	$4, %esp
	cmpw	%ax, %si
	jne	LBB413_4
# %bb.2:
	cmpl	$1, _strInit
	je	LBB413_7
# %bb.3:
	addl	$12, %esp
	popl	%esi
	retl
LBB413_4:
	pushl	$5000                           # imm = 0x1388
	pushl	$"??_C@_0M@NKKLNCPM@R?$DPEXIT_MBOX?$AA@"
	pushl	$0
	calll	_LookupRtHandle
	addl	$12, %esp
	movl	$255, (%esp)
	movl	%esp, %ecx
	movzwl	%ax, %eax
	pushl	$4
	pushl	%ecx
	pushl	%eax
	calll	_SendRtData
	addl	$12, %esp
	pushl	$0
	calll	_SuspendRtThread
	addl	$4, %esp
	.p2align	4
LBB413_5:                               # =>This Inner Loop Header: Depth=1
	pushl	$655349                         # imm = 0x9FFF5
	calll	_RtSleep
	addl	$4, %esp
	jmp	LBB413_5
LBB413_6:
	pushl	$0
	calll	_exit
LBB413_7:
	movl	$3, _strInit
	pushl	$0
	calll	_exit
                                        # -- End function
	.def	_Cleanup;
	.scl	2;
	.type	32;
	.endef
	.globl	_Cleanup                        # -- Begin function Cleanup
	.p2align	4
_Cleanup:                               # @Cleanup
# %bb.0:
	movl	$3, _strInit
	pushl	$0
	calll	_exit
                                        # -- End function
	.def	_Catalog;
	.scl	2;
	.type	32;
	.endef
	.globl	_Catalog                        # -- Begin function Catalog
	.p2align	4
_Catalog:                               # @Catalog
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movzwl	20(%esp), %esi
	movzwl	16(%esp), %ebx
	movl	24(%esp), %edi
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	calll	_CatalogRtHandle
	addl	$12, %esp
	movl	%eax, %ecx
	movb	$1, %al
	testb	%cl, %cl
	jne	LBB415_6
# %bb.1:
	testw	%bx, %bx
	je	LBB415_5
# %bb.2:
	movzwl	%bx, %ebx
	pushl	$0
	pushl	%edi
	pushl	%ebx
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	je	LBB415_5
# %bb.3:
	movzwl	%ax, %eax
	pushl	%eax
	calll	_GetRtHandleType
	addl	$4, %esp
	testw	%ax, %ax
	je	LBB415_4
LBB415_5:
	xorl	%eax, %eax
LBB415_6:
                                        # kill: def $al killed $al killed $eax
LBB415_7:
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
LBB415_4:
	pushl	%edi
	pushl	%ebx
	calll	_UncatalogRtHandle
	addl	$8, %esp
	testb	%al, %al
	je	LBB415_5
# %bb.8:
	movzwl	%si, %eax
	pushl	%edi
	pushl	%eax
	pushl	%ebx
	calll	_CatalogRtHandle
	addl	$12, %esp
	jmp	LBB415_7
                                        # -- End function
	.def	_INtime_ProcessInitialize;
	.scl	2;
	.type	32;
	.endef
	.globl	_INtime_ProcessInitialize       # -- Begin function INtime_ProcessInitialize
	.p2align	4
_INtime_ProcessInitialize:              # @INtime_ProcessInitialize
# %bb.0:
	pushl	%edi
	pushl	%esi
	subl	$160, %esp
	pushl	$3
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movw	%ax, _hRootProcess
	pushl	$1
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movw	%ax, _hThisProcess
	movzwl	_hRootProcess, %edi
	movzwl	%ax, %esi
	pushl	$"??_C@_03LHGCEHCD@PLC?$AA@"
	pushl	%esi
	pushl	%edi
	calll	_CatalogRtHandle
	addl	$12, %esp
	testl	%edi, %edi
	je	LBB416_6
# %bb.1:
	testb	%al, %al
	jne	LBB416_6
# %bb.2:
	movzwl	%di, %edi
	pushl	$0
	pushl	$"??_C@_03LHGCEHCD@PLC?$AA@"
	pushl	%edi
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	je	LBB416_6
# %bb.3:
	movzwl	%ax, %eax
	pushl	%eax
	calll	_GetRtHandleType
	addl	$4, %esp
	testw	%ax, %ax
	jne	LBB416_6
# %bb.4:
	pushl	$"??_C@_03LHGCEHCD@PLC?$AA@"
	pushl	%edi
	calll	_UncatalogRtHandle
	addl	$8, %esp
	testb	%al, %al
	je	LBB416_6
# %bb.5:
	pushl	$"??_C@_03LHGCEHCD@PLC?$AA@"
	pushl	%esi
	pushl	%edi
	calll	_CatalogRtHandle
	addl	$12, %esp
LBB416_6:
	pushl	$0
	pushl	$0
	calll	_SetRtProcessMaxPriority
	addl	$8, %esp
	movw	$77, 4(%esp)
	movl	$1414416722, (%esp)             # imm = 0x544E4952
	pushl	$3
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movl	%esp, %esi
	movzwl	%ax, %eax
	pushl	$0
	pushl	%esi
	pushl	%eax
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	jne	LBB416_8
# %bb.7:
	calll	_INtime_WaitIO
LBB416_8:
	pushl	%esi
	calll	_CopyRtSystemInfo
	addl	$4, %esp
	movw	$10000, %ax                     # imm = 0x2710
	xorl	%edx, %edx
	divw	59(%esp)
	movzwl	%ax, %eax
	movl	%eax, _dwKtickInUsecs
	pushl	$240
	pushl	$0
	calll	_SetRtThreadPriority
	addl	$168, %esp
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_INtime_ProcessFinalize;
	.scl	2;
	.type	32;
	.endef
	.globl	_INtime_ProcessFinalize         # -- Begin function INtime_ProcessFinalize
	.p2align	4
_INtime_ProcessFinalize:                # @INtime_ProcessFinalize
# %bb.0:
	movzwl	_hRootProcess, %eax
	pushl	$_BaseName
	pushl	%eax
	calll	_UncatalogRtHandle
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_INtime_ProcessCatalog;
	.scl	2;
	.type	32;
	.endef
	.globl	_INtime_ProcessCatalog          # -- Begin function INtime_ProcessCatalog
	.p2align	4
_INtime_ProcessCatalog:                 # @INtime_ProcessCatalog
# %bb.0:
	pushl	%edi
	pushl	%esi
	movzwl	_hThisProcess, %esi
	movzwl	_hRootProcess, %edi
	pushl	$_BaseName
	pushl	%esi
	pushl	%edi
	calll	_CatalogRtHandle
	addl	$12, %esp
	testl	%edi, %edi
	je	LBB418_6
# %bb.1:
	testb	%al, %al
	jne	LBB418_6
# %bb.2:
	movzwl	%di, %edi
	pushl	$0
	pushl	$_BaseName
	pushl	%edi
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	je	LBB418_6
# %bb.3:
	movzwl	%ax, %eax
	pushl	%eax
	calll	_GetRtHandleType
	addl	$4, %esp
	testw	%ax, %ax
	jne	LBB418_6
# %bb.4:
	pushl	$_BaseName
	pushl	%edi
	calll	_UncatalogRtHandle
	addl	$8, %esp
	testb	%al, %al
	je	LBB418_6
# %bb.5:
	movzwl	%si, %eax
	pushl	$_BaseName
	pushl	%eax
	pushl	%edi
	calll	_CatalogRtHandle
	addl	$12, %esp
LBB418_6:
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_INtime_Halt;
	.scl	2;
	.type	32;
	.endef
	.globl	_INtime_Halt                    # -- Begin function INtime_Halt
	.p2align	4
_INtime_Halt:                           # @INtime_Halt
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	pushl	$0
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movzwl	%ax, %eax
	pushl	%esi
	pushl	%eax
	pushl	$0
	calll	_CatalogRtHandle
	addl	$12, %esp
	pushl	$0
	calll	_SuspendRtThread
	addl	$4, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_INtime_RslLoad;
	.scl	2;
	.type	32;
	.endef
	.globl	_INtime_RslLoad                 # -- Begin function INtime_RslLoad
	.p2align	4
_INtime_RslLoad:                        # @INtime_RslLoad
# %bb.0:
	pushl	%edi
	pushl	%esi
	subl	$136, %esp
	movl	148(%esp), %edi
	leal	8(%esp), %esi
	pushl	$_RslFolder
	pushl	%esi
	calll	_strcpy
	addl	$8, %esp
	pushl	%edi
	pushl	%esi
	calll	_strcat
	addl	$8, %esp
	pushl	%esi
	calll	_LoadRtLibrary
	addl	$4, %esp
	testw	%ax, %ax
	jne	LBB420_3
# %bb.1:
	movw	$77, 4(%esp)
	movl	$1414416722, (%esp)             # imm = 0x544E4952
	pushl	$3
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movl	%esp, %ecx
	movzwl	%ax, %eax
	pushl	$0
	pushl	%ecx
	pushl	%eax
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	movl	$"??_C@_09OABCBDAM@C?3?2INplc?2?$AA@", %eax
	movl	$"??_C@_01KMDKNFGN@?1?$AA@", %ecx
	cmovel	%eax, %ecx
	pushl	%ecx
	pushl	%esi
	calll	_strcpy
	addl	$8, %esp
	pushl	%edi
	pushl	%esi
	calll	_strcat
	addl	$8, %esp
	pushl	%esi
	calll	_LoadRtLibrary
	addl	$4, %esp
	testw	%ax, %ax
	jne	LBB420_3
# %bb.2:
	pushl	$_RtaFolder
	pushl	%esi
	calll	_strcpy
	addl	$8, %esp
	pushl	%edi
	pushl	%esi
	calll	_strcat
	addl	$8, %esp
	pushl	%esi
	calll	_LoadRtLibrary
	addl	$4, %esp
LBB420_3:
	addl	$136, %esp
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	__Hash;
	.scl	2;
	.type	32;
	.endef
	.globl	__Hash                          # -- Begin function _Hash
	.p2align	4
__Hash:                                 # @_Hash
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$88, %esp
	movl	112(%esp), %ebp
	movaps	__xmm@1032547698badcfeefcdab8967452301, %xmm0 # xmm0 = [1732584193,4023233417,2562383102,271733878]
	movups	%xmm0, (%esp)
	pushl	%ebp
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %edi
	leal	(,%eax,8), %eax
	movl	%eax, 16(%esp)
	movl	%edi, %eax
	shrl	$29, %eax
	movl	%eax, 20(%esp)
	xorl	%eax, %eax
	cmpl	$64, %edi
	jb	LBB421_4
# %bb.1:
	leal	24(%esp), %edx
	movups	48(%ebp), %xmm0
	movups	%xmm0, 72(%esp)
	movups	32(%ebp), %xmm0
	movups	%xmm0, 56(%esp)
	movups	(%ebp), %xmm0
	movups	16(%ebp), %xmm1
	movups	%xmm1, 40(%esp)
	movups	%xmm0, 24(%esp)
	movl	%esp, %ecx
	calll	_MD5Transform
	movl	$64, %eax
	cmpl	$128, %edi
	jb	LBB421_4
# %bb.2:                                # %.preheader.i.preheader
	movl	$64, %esi
	movl	%esp, %ebx
	.p2align	4
LBB421_3:                               # %.preheader.i
                                        # =>This Inner Loop Header: Depth=1
	leal	(%esi,%ebp), %edx
	movl	%ebx, %ecx
	calll	_MD5Transform
	leal	64(%esi), %eax
	addl	$127, %esi
	cmpl	%edi, %esi
	movl	%eax, %esi
	jb	LBB421_3
LBB421_4:                               # %MD5Update.exit
	subl	%eax, %edi
	addl	%eax, %ebp
	leal	24(%esp), %eax
	pushl	%edi
	pushl	%ebp
	pushl	%eax
	calll	_memcpy
	addl	$12, %esp
	movl	%esp, %eax
	pushl	%eax
	movl	112(%esp), %esi
	pushl	%esi
	calll	_MD5Final
	addl	$8, %esp
	movl	%esi, %eax
	addl	$88, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Variable_Add;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_Add                   # -- Begin function Variable_Add
	.p2align	4
_Variable_Add:                          # @Variable_Add
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	20(%esp), %edi
	pushl	$23
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %esi
	testl	%eax, %eax
	je	LBB422_1
# %bb.2:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%esi, (%eax)
	movl	$23, 4(%eax)
	movl	$"??_C@_0BD@PIGJDLMJ@Variable_Add?3entry?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB422_3
# %bb.4:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB422_5
LBB422_1:
	pushl	$"??_C@_0BD@PIGJDLMJ@Variable_Add?3entry?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB422_6
LBB422_3:
	movl	%eax, _heaplist
LBB422_5:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB422_6:                               # %Heap_Alloc.exit
	movl	%edi, %ebp
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	movl	%eax, %ebx
	incl	%ebx
	pushl	%ebx
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %edi
	testl	%eax, %eax
	je	LBB422_7
# %bb.8:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%edi, (%eax)
	movl	%ebx, 4(%eax)
	movl	$"??_C@_0BC@BLILFEGL@Variable_Add?3name?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB422_9
# %bb.10:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB422_11
LBB422_7:
	pushl	$"??_C@_0BC@BLILFEGL@Variable_Add?3name?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB422_12
LBB422_9:
	movl	%eax, _heaplist
LBB422_11:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB422_12:                              # %Heap_Alloc.exit1
	movl	%edi, (%esi)
	pushl	%ebp
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
	movzwl	24(%esp), %eax
	movw	%ax, 8(%esi)
	movl	$0, 19(%esi)
	cmpl	$0, _variablelist
	je	LBB422_13
# %bb.14:
	movl	_variableBottom, %eax
	movl	%esi, 19(%eax)
	jmp	LBB422_15
LBB422_13:
	movl	%esi, _variablelist
LBB422_15:
	movl	%esi, _variableBottom
	addl	$4, %esi
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Variable_Clear;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_Clear                 # -- Begin function Variable_Clear
	.p2align	4
_Variable_Clear:                        # @Variable_Clear
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	_variablelist, %esi
	testl	%esi, %esi
	jne	LBB423_1
	jmp	LBB423_28
LBB423_9:                               #   in Loop: Header=BB423_1 Depth=1
	cmpl	%eax, %ecx
	je	LBB423_10
# %bb.12:                               #   in Loop: Header=BB423_1 Depth=1
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB423_13
LBB423_10:                              #   in Loop: Header=BB423_1 Depth=1
	movl	$0, _heaplist
	movl	$0, _heapbottom
LBB423_13:                              #   in Loop: Header=BB423_1 Depth=1
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB423_14:                              # %.loopexit31
                                        #   in Loop: Header=BB423_1 Depth=1
	pushl	%edi
	calll	_free
	addl	$4, %esp
	movl	19(%esi), %edi
	movl	_variablelist, %esi
	testl	%esi, %esi
	jne	LBB423_16
	jmp	LBB423_27
	.p2align	4
LBB423_1:                               # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB423_6 Depth 2
                                        #     Child Loop BB423_18 Depth 2
	cmpl	$0, 10(%esi)
	jne	LBB423_15
# %bb.2:                                #   in Loop: Header=BB423_1 Depth=1
	cmpw	$1059, 8(%esi)                  # imm = 0x423
	je	LBB423_15
# %bb.3:                                #   in Loop: Header=BB423_1 Depth=1
	movl	4(%esi), %edi
	testl	%edi, %edi
	je	LBB423_15
# %bb.4:                                #   in Loop: Header=BB423_1 Depth=1
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB423_14
# %bb.5:                                #   in Loop: Header=BB423_1 Depth=1
	movl	%ecx, %eax
	cmpl	%edi, (%ecx)
	je	LBB423_8
	.p2align	4
LBB423_6:                               # %.preheader.i
                                        #   Parent Loop BB423_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB423_14
# %bb.7:                                #   in Loop: Header=BB423_6 Depth=2
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%edi, (%edx)
	jne	LBB423_6
LBB423_8:                               # %.loopexit5.i
                                        #   in Loop: Header=BB423_1 Depth=1
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB423_9
# %bb.11:                               #   in Loop: Header=BB423_1 Depth=1
	movl	%edx, 16(%ecx)
	jmp	LBB423_13
	.p2align	4
LBB423_15:                              # %.sink.split
                                        #   in Loop: Header=BB423_1 Depth=1
	movl	19(%esi), %edi
LBB423_16:                              #   in Loop: Header=BB423_1 Depth=1
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB423_26
# %bb.17:                               #   in Loop: Header=BB423_1 Depth=1
	movl	%ecx, %eax
	cmpl	%esi, (%ecx)
	je	LBB423_20
	.p2align	4
LBB423_18:                              # %.preheader.i2
                                        #   Parent Loop BB423_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB423_26
# %bb.19:                               #   in Loop: Header=BB423_18 Depth=2
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%esi, (%edx)
	jne	LBB423_18
LBB423_20:                              # %.loopexit5.i3
                                        #   in Loop: Header=BB423_1 Depth=1
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB423_21
# %bb.23:                               #   in Loop: Header=BB423_1 Depth=1
	movl	%edx, 16(%ecx)
	jmp	LBB423_25
LBB423_21:                              #   in Loop: Header=BB423_1 Depth=1
	cmpl	%eax, %ecx
	je	LBB423_22
# %bb.24:                               #   in Loop: Header=BB423_1 Depth=1
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB423_25
LBB423_22:                              #   in Loop: Header=BB423_1 Depth=1
	movl	$0, _heaplist
	movl	$0, _heapbottom
	.p2align	4
LBB423_25:                              #   in Loop: Header=BB423_1 Depth=1
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB423_26:                              # %.loopexit.i4
                                        #   in Loop: Header=BB423_1 Depth=1
	pushl	%esi
	calll	_free
	addl	$4, %esp
LBB423_27:                              # %Heap_Free.exit5
                                        #   in Loop: Header=BB423_1 Depth=1
	movl	%edi, _variablelist
	movl	%edi, %esi
	testl	%edi, %edi
	jne	LBB423_1
LBB423_28:                              # %.loopexit
	movl	$0, _variableBottom
	movl	$0, _variablelist
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Variable_Display;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_Display               # -- Begin function Variable_Display
	.p2align	4
_Variable_Display:                      # @Variable_Display
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	$L_str.253
	calll	_puts
	addl	$4, %esp
	movl	_RUNvariablelist, %esi
	testl	%esi, %esi
	je	LBB424_10
# %bb.1:                                # %.preheader.preheader
	movl	$1, %edi
	jmp	LBB424_4
	.p2align	4
LBB424_2:                               #   in Loop: Header=BB424_4 Depth=1
	xorl	%edx, %edx
LBB424_3:                               # %Type_GetName.exit
                                        #   in Loop: Header=BB424_4 Depth=1
	leal	4(%esi), %ebx
	pushl	%eax
	pushl	%ecx
	pushl	%edx
	pushl	(%esi)
	pushl	%ebx
	pushl	%edi
	pushl	$"??_C@_0CI@JAAMHDIA@?5?5Variable?$CI?$CF03d?$CJ?5?$CFp?5?$CF?924s?5?5?$CF?910s@"
	calll	_printf
	addl	$28, %esp
	movl	19(%esi), %esi
	incl	%edi
	testl	%esi, %esi
	je	LBB424_11
LBB424_4:                               # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB424_7 Depth 2
	cmpl	$0, 10(%esi)
	movl	$"??_C@_02MJNHLAAE@EG?$AA@", %eax
	movl	$"??_C@_02KNHHEEKP@?5?5?$AA@", %edx
	cmovel	%edx, %eax
	cmpb	$0, 14(%esi)
	movl	$"??_C@_02BIGHIPPJ@RO?$AA@", %ecx
	cmovel	%edx, %ecx
	movl	_typematch, %edx
	testl	%edx, %edx
	je	LBB424_2
# %bb.5:                                #   in Loop: Header=BB424_4 Depth=1
	movzwl	8(%esi), %ebp
	cmpw	_typematch+4, %bp
	je	LBB424_3
# %bb.6:                                # %.preheader.i.preheader
                                        #   in Loop: Header=BB424_4 Depth=1
	movl	$_typematch+18, %ebx
	.p2align	4
LBB424_7:                               # %.preheader.i
                                        #   Parent Loop BB424_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4(%ebx), %edx
	testl	%edx, %edx
	je	LBB424_2
# %bb.8:                                #   in Loop: Header=BB424_7 Depth=2
	cmpw	(%ebx), %bp
	leal	14(%ebx), %ebx
	jne	LBB424_7
	jmp	LBB424_3
LBB424_10:
	pushl	$L_str.1.254
	calll	_puts
	addl	$4, %esp
LBB424_11:                              # %.loopexit
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Variable_Search;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_Search                # -- Begin function Variable_Search
	.p2align	4
_Variable_Search:                       # @Variable_Search
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	_variablelist, %edi
	xorl	%esi, %esi
	testl	%edi, %edi
	je	LBB425_5
# %bb.1:                                # %.preheader.preheader
	movl	16(%esp), %ebx
	.p2align	4
LBB425_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebx
	pushl	(%edi)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB425_3
# %bb.4:                                #   in Loop: Header=BB425_2 Depth=1
	movl	19(%edi), %edi
	testl	%edi, %edi
	jne	LBB425_2
	jmp	LBB425_5
LBB425_3:
	addl	$4, %edi
	movl	%edi, %esi
LBB425_5:                               # %.loopexit
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Variable_SearchName;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_SearchName            # -- Begin function Variable_SearchName
	.p2align	4
_Variable_SearchName:                   # @Variable_SearchName
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	_variablelist, %edi
	testl	%edi, %edi
	je	LBB426_5
# %bb.1:
	movl	16(%esp), %ebx
	.p2align	4
LBB426_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	(%edi), %esi
	pushl	%ebx
	pushl	%esi
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB426_6
# %bb.3:                                #   in Loop: Header=BB426_2 Depth=1
	movl	19(%edi), %edi
	testl	%edi, %edi
	jne	LBB426_2
LBB426_5:
	xorl	%esi, %esi
LBB426_6:                               # %.loopexit
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Variable_Create;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_Create                # -- Begin function Variable_Create
	.p2align	4
_Variable_Create:                       # @Variable_Create
# %bb.0:
	pushl	%edi
	pushl	%esi
	movzwl	12(%esp), %edi
	pushl	$15
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %esi
	testl	%eax, %eax
	je	LBB427_1
# %bb.2:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%esi, (%eax)
	movl	$15, 4(%eax)
	movl	$"??_C@_0BA@LBHLBGIF@Variable_Create?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB427_3
# %bb.4:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB427_5
LBB427_1:
	pushl	$"??_C@_0BA@LBHLBGIF@Variable_Create?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB427_6
LBB427_3:
	movl	%eax, _heaplist
LBB427_5:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB427_6:                               # %Heap_Alloc.exit
	movl	$0, 6(%esi)
	movw	%di, 4(%esi)
	movl	$0, (%esi)
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Variable_Body;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_Body                  # -- Begin function Variable_Body
	.p2align	4
_Variable_Body:                         # @Variable_Body
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %edi
	pushl	%edi
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %esi
	testl	%eax, %eax
	je	LBB428_1
# %bb.2:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%esi, (%eax)
	movl	%edi, 4(%eax)
	movl	$"??_C@_0O@NOPHFFNJ@Variable_Body?$AA@", 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB428_3
# %bb.4:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB428_5
LBB428_1:
	pushl	$"??_C@_0O@NOPHFFNJ@Variable_Body?$AA@"
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB428_6
LBB428_3:
	movl	%eax, _heaplist
LBB428_5:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB428_6:                               # %Heap_Alloc.exit
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Variable_LinkBody;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_LinkBody              # -- Begin function Variable_LinkBody
	.p2align	4
_Variable_LinkBody:                     # @Variable_LinkBody
# %bb.0:
	pushl	%edi
	pushl	%esi
	pushl	%eax
	movl	20(%esp), %edi
	pushl	%edi
	calll	_Rtedge_TagGetIecType
	addl	$4, %esp
	movl	%eax, %esi
	movl	$0, (%esp)
	movl	%esp, %eax
	pushl	$4
	pushl	%eax
	pushl	$"??_C@_05HKHPEFOF@Entry?$AA@"
	pushl	%edi
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	setne	%dl
	movl	(%esp), %ecx
	testl	%ecx, %ecx
	sete	%dh
	xorl	%eax, %eax
	orb	%dl, %dh
	jne	LBB429_7
# %bb.1:
	movl	16(%esp), %edx
	movzwl	%si, %eax
	leal	-1058(%eax), %edi
	cmpl	$2, %edi
	jb	LBB429_4
# %bb.2:
	cmpl	$1346, %eax                     # imm = 0x542
	je	LBB429_4
# %bb.3:
	cmpl	$1, 385(%ecx)
	jne	LBB429_5
LBB429_4:
	movl	23(%ecx), %eax
LBB429_6:                               # %Rtedge_GetPointer.exit
	movl	%ecx, 6(%edx)
	movw	%si, 4(%edx)
	movl	%eax, (%edx)
LBB429_7:
	addl	$4, %esp
	popl	%esi
	popl	%edi
	retl
LBB429_5:
	movl	%ecx, %eax
	addl	$15, %eax
	jmp	LBB429_6
                                        # -- End function
	.def	_Variable_GetSize;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_GetSize               # -- Begin function Variable_GetSize
	.p2align	4
_Variable_GetSize:                      # @Variable_GetSize
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	_variablelist, %esi
	testl	%esi, %esi
	je	LBB430_4
# %bb.1:                                # %.preheader.preheader
	movl	12(%esp), %edi
	.p2align	4
LBB430_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%edi
	pushl	(%esi)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB430_5
# %bb.3:                                #   in Loop: Header=BB430_2 Depth=1
	movl	19(%esi), %esi
	testl	%esi, %esi
	jne	LBB430_2
LBB430_4:                               # %.loopexit
	pushl	$"??_C@_0BB@FLIGODG@Variable_GetSize?$AA@"
	pushl	$8194                           # imm = 0x2002
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
LBB430_12:
	xorl	%eax, %eax
LBB430_13:                              # %Rtedge_SizeOf.exit
                                        # kill: def $ax killed $ax killed $eax
	popl	%esi
	popl	%edi
	retl
LBB430_5:
	cmpl	$0, _typematch
	je	LBB430_12
# %bb.6:                                # %.preheader.i.preheader
	movzwl	8(%esi), %eax
	movl	$_typematch+14, %ecx
	.p2align	4
LBB430_7:                               # %.preheader.i
                                        # =>This Inner Loop Header: Depth=1
	cmpw	-10(%ecx), %ax
	je	LBB430_8
# %bb.11:                               #   in Loop: Header=BB430_7 Depth=1
	cmpl	$0, (%ecx)
	leal	14(%ecx), %ecx
	jne	LBB430_7
	jmp	LBB430_12
LBB430_8:
	movl	-4(%ecx), %eax
	cmpl	$-1, %eax
	jne	LBB430_13
# %bb.9:
	movl	10(%esi), %eax
	testl	%eax, %eax
	je	LBB430_12
# %bb.10:
	movzwl	5(%eax), %eax
	jmp	LBB430_13
                                        # -- End function
	.def	_Variable_Copy64;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_Copy64                # -- Begin function Variable_Copy64
	.p2align	4
_Variable_Copy64:                       # @Variable_Copy64
# %bb.0:
	pushl	%ebx
	pushl	%esi
	movl	12(%esp), %esi
	movl	16(%esp), %eax
	movl	(%eax), %ebx
	movl	4(%eax), %ecx
	.p2align	4
LBB431_1:                               # =>This Inner Loop Header: Depth=1
	movl	(%esi), %eax
	movl	4(%esi), %edx
	lock		cmpxchg8b	(%esi)
	jne	LBB431_1
# %bb.2:
	popl	%esi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Variable_GetType;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_GetType               # -- Begin function Variable_GetType
	.p2align	4
_Variable_GetType:                      # @Variable_GetType
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	_variablelist, %esi
	testl	%esi, %esi
	je	LBB432_4
# %bb.1:                                # %.preheader.preheader
	movl	12(%esp), %edi
	.p2align	4
LBB432_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%edi
	pushl	(%esi)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB432_5
# %bb.3:                                #   in Loop: Header=BB432_2 Depth=1
	movl	19(%esi), %esi
	testl	%esi, %esi
	jne	LBB432_2
LBB432_4:                               # %.loopexit
	pushl	$"??_C@_0BB@OKBGGAGP@Variable_GetType?$AA@"
	pushl	$8194                           # imm = 0x2002
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	xorl	%eax, %eax
	jmp	LBB432_6
LBB432_5:
	movzwl	8(%esi), %eax
LBB432_6:
                                        # kill: def $ax killed $ax killed $eax
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Variable_Zero;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variable_Zero                  # -- Begin function Variable_Zero
	.p2align	4
_Variable_Zero:                         # @Variable_Zero
# %bb.0:
	movzwl	4(%esp), %ecx
	cmpl	$781, %ecx                      # imm = 0x30D
	jg	LBB433_5
# %bb.1:
	leal	-16(%ecx), %eax
	cmpl	$3, %eax
	jbe	LBB433_39
# %bb.2:
	leal	-260(%ecx), %eax
	cmpl	$3, %eax
	jbe	LBB433_40
# %bb.3:
	addl	$-512, %ecx                     # imm = 0xFE00
	cmpl	$3, %ecx
	ja	LBB433_37
# %bb.4:
	jmpl	*LJTI433_2(,%ecx,4)
LBB433_25:
	movl	$__Variable_Zero_USINT, %eax
	retl
LBB433_5:
	cmpl	$1059, %ecx                     # imm = 0x423
	jle	LBB433_6
# %bb.13:
	cmpl	$1346, %ecx                     # imm = 0x542
	jle	LBB433_14
# %bb.17:
	cmpl	$1347, %ecx                     # imm = 0x543
	je	LBB433_29
# %bb.18:
	movl	$__Variable_Zero_BOOL, %eax
	cmpl	$1536, %ecx                     # imm = 0x600
	je	LBB433_38
# %bb.19:
	cmpl	$32769, %ecx                    # imm = 0x8001
	jne	LBB433_37
# %bb.20:
	movl	$__Variable_Zero_ANY, %eax
	retl
LBB433_6:
	cmpl	$1057, %ecx                     # imm = 0x421
	jg	LBB433_10
# %bb.7:
	cmpl	$782, %ecx                      # imm = 0x30E
	je	LBB433_30
# %bb.8:
	cmpl	$783, %ecx                      # imm = 0x30F
	jne	LBB433_37
# %bb.9:
	movl	$__Variable_Zero_LREAL, %eax
	retl
LBB433_39:
	jmpl	*LJTI433_0(,%eax,4)
LBB433_31:
	movl	$__Variable_Zero_BYTE, %eax
	retl
LBB433_40:
	jmpl	*LJTI433_1(,%eax,4)
LBB433_21:
	movl	$__Variable_Zero_SINT, %eax
	retl
LBB433_10:
	cmpl	$1058, %ecx                     # imm = 0x422
	je	LBB433_35
# %bb.11:
	cmpl	$1059, %ecx                     # imm = 0x423
	jne	LBB433_37
# %bb.12:
	movl	$__Variable_Zero_FUNCTION, %eax
	retl
LBB433_14:
	cmpl	$1060, %ecx                     # imm = 0x424
	je	LBB433_36
# %bb.15:
	cmpl	$1346, %ecx                     # imm = 0x542
	jne	LBB433_37
# %bb.16:
	movl	$__Variable_Zero_STRING, %eax
	retl
LBB433_30:
	movl	$__Variable_Zero_REAL, %eax
	retl
LBB433_35:
	movl	$__Variable_Zero_ARRAY, %eax
	retl
LBB433_29:
	movl	$__Variable_Zero_TIME, %eax
	retl
LBB433_33:
	movl	$__Variable_Zero_DWORD, %eax
	retl
LBB433_36:
	movl	$__Variable_Zero_STRUCT, %eax
	retl
LBB433_34:
	movl	$__Variable_Zero_QWORD, %eax
	retl
LBB433_23:
	movl	$__Variable_Zero_DINT, %eax
	retl
LBB433_32:
	movl	$__Variable_Zero_WORD, %eax
	retl
LBB433_27:
	movl	$__Variable_Zero_UDINT, %eax
	retl
LBB433_24:
	movl	$__Variable_Zero_LINT, %eax
	retl
LBB433_22:
	movl	$__Variable_Zero_INT, %eax
	retl
LBB433_28:
	movl	$__Variable_Zero_ULINT, %eax
	retl
LBB433_26:
	movl	$__Variable_Zero_UINT, %eax
	retl
LBB433_37:
	xorl	%eax, %eax
LBB433_38:
	retl
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI433_0:
	.long	LBB433_31
	.long	LBB433_32
	.long	LBB433_33
	.long	LBB433_34
LJTI433_1:
	.long	LBB433_21
	.long	LBB433_22
	.long	LBB433_23
	.long	LBB433_24
LJTI433_2:
	.long	LBB433_25
	.long	LBB433_26
	.long	LBB433_27
	.long	LBB433_28
                                        # -- End function
	.def	_Variable_Reset_All;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Variable_Reset_All             # -- Begin function Variable_Reset_All
	.p2align	4
_Variable_Reset_All:                    # @Variable_Reset_All
# %bb.0:
	pushl	%esi
	movl	_RUNvariablelist, %esi
	testl	%esi, %esi
	je	LBB434_36
# %bb.1:                                # %.preheader.preheader
	xorps	%xmm1, %xmm1
	jmp	LBB434_4
LBB434_25:                              #   in Loop: Header=BB434_4 Depth=1
	movl	$0, 4(%eax)
LBB434_2:                               #   in Loop: Header=BB434_4 Depth=1
	movl	$0, (%eax)
	.p2align	4
LBB434_3:                               #   in Loop: Header=BB434_4 Depth=1
	movl	19(%esi), %esi
	testl	%esi, %esi
	je	LBB434_36
LBB434_4:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	cmpb	$0, 14(%esi)
	jne	LBB434_3
# %bb.5:                                #   in Loop: Header=BB434_4 Depth=1
	movl	4(%esi), %eax
	testl	%eax, %eax
	je	LBB434_3
# %bb.6:                                #   in Loop: Header=BB434_4 Depth=1
	movzwl	8(%esi), %ecx
	cmpl	$511, %ecx                      # imm = 0x1FF
	jle	LBB434_11
# %bb.7:                                #   in Loop: Header=BB434_4 Depth=1
	cmpl	$1057, %ecx                     # imm = 0x421
	jg	LBB434_15
# %bb.8:                                #   in Loop: Header=BB434_4 Depth=1
	leal	-512(%ecx), %edx
	cmpl	$3, %edx
	ja	LBB434_26
# %bb.9:                                #   in Loop: Header=BB434_4 Depth=1
	jmpl	*LJTI434_2(,%edx,4)
LBB434_11:                              #   in Loop: Header=BB434_4 Depth=1
	leal	-16(%ecx), %edx
	cmpl	$3, %edx
	jbe	LBB434_19
# %bb.12:                               #   in Loop: Header=BB434_4 Depth=1
	addl	$-260, %ecx                     # imm = 0xFEFC
	cmpl	$3, %ecx
	ja	LBB434_3
# %bb.13:                               #   in Loop: Header=BB434_4 Depth=1
	jmpl	*LJTI434_1(,%ecx,4)
LBB434_15:                              #   in Loop: Header=BB434_4 Depth=1
	cmpl	$1346, %ecx                     # imm = 0x542
	jg	LBB434_21
# %bb.16:                               #   in Loop: Header=BB434_4 Depth=1
	cmpl	$1058, %ecx                     # imm = 0x422
	je	LBB434_29
# %bb.17:                               #   in Loop: Header=BB434_4 Depth=1
	cmpl	$1060, %ecx                     # imm = 0x424
	je	LBB434_29
# %bb.18:                               #   in Loop: Header=BB434_4 Depth=1
	cmpl	$1346, %ecx                     # imm = 0x542
	je	LBB434_31
	jmp	LBB434_3
LBB434_19:                              #   in Loop: Header=BB434_4 Depth=1
	jmpl	*LJTI434_0(,%edx,4)
LBB434_14:                              #   in Loop: Header=BB434_4 Depth=1
	movw	$0, (%eax)
	jmp	LBB434_3
LBB434_21:                              #   in Loop: Header=BB434_4 Depth=1
	cmpl	$1347, %ecx                     # imm = 0x543
	je	LBB434_2
# %bb.22:                               #   in Loop: Header=BB434_4 Depth=1
	cmpl	$32769, %ecx                    # imm = 0x8001
	je	LBB434_30
# %bb.23:                               #   in Loop: Header=BB434_4 Depth=1
	cmpl	$1536, %ecx                     # imm = 0x600
	jne	LBB434_3
LBB434_24:                              #   in Loop: Header=BB434_4 Depth=1
	movb	$0, (%eax)
	jmp	LBB434_3
LBB434_26:                              #   in Loop: Header=BB434_4 Depth=1
	cmpl	$782, %ecx                      # imm = 0x30E
	je	LBB434_2
# %bb.27:                               #   in Loop: Header=BB434_4 Depth=1
	cmpl	$783, %ecx                      # imm = 0x30F
	jne	LBB434_3
# %bb.28:                               #   in Loop: Header=BB434_4 Depth=1
	xorps	%xmm0, %xmm0
	movsd	%xmm0, (%eax)
	jmp	LBB434_3
LBB434_29:                              #   in Loop: Header=BB434_4 Depth=1
	movl	10(%esi), %ecx
	movzwl	5(%ecx), %ecx
	pushl	%ecx
	pushl	$0
	pushl	%eax
	calll	_memset
	xorps	%xmm1, %xmm1
	addl	$12, %esp
	jmp	LBB434_3
LBB434_30:                              #   in Loop: Header=BB434_4 Depth=1
	movl	(%eax), %eax
	movl	(%eax), %eax
LBB434_31:                              #   in Loop: Header=BB434_4 Depth=1
	movups	%xmm1, 64(%eax)
	movups	%xmm1, 48(%eax)
	movups	%xmm1, 32(%eax)
	movups	%xmm1, 16(%eax)
	movups	%xmm1, (%eax)
	movl	$0, 79(%eax)
	jmp	LBB434_3
LBB434_36:                              # %.loopexit
	popl	%esi
	retl
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI434_0:
	.long	LBB434_24
	.long	LBB434_14
	.long	LBB434_2
	.long	LBB434_25
LJTI434_1:
	.long	LBB434_24
	.long	LBB434_14
	.long	LBB434_2
	.long	LBB434_25
LJTI434_2:
	.long	LBB434_24
	.long	LBB434_14
	.long	LBB434_2
	.long	LBB434_25
                                        # -- End function
	.def	_Variable_Swap;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Variable_Swap                  # -- Begin function Variable_Swap
	.p2align	4
_Variable_Swap:                         # @Variable_Swap
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	_RUNvariablelist, %esi
	movl	_variablelist, %eax
	movl	%eax, _RUNvariablelist
	movl	%esi, _variablelist
	testl	%esi, %esi
	jne	LBB435_1
	jmp	LBB435_28
LBB435_9:                               #   in Loop: Header=BB435_1 Depth=1
	cmpl	%eax, %ecx
	je	LBB435_10
# %bb.12:                               #   in Loop: Header=BB435_1 Depth=1
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB435_13
LBB435_10:                              #   in Loop: Header=BB435_1 Depth=1
	movl	$0, _heaplist
	movl	$0, _heapbottom
LBB435_13:                              #   in Loop: Header=BB435_1 Depth=1
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB435_14:                              # %.loopexit31
                                        #   in Loop: Header=BB435_1 Depth=1
	pushl	%edi
	calll	_free
	addl	$4, %esp
	movl	19(%esi), %edi
	movl	_variablelist, %esi
	testl	%esi, %esi
	jne	LBB435_16
	jmp	LBB435_27
	.p2align	4
LBB435_1:                               # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB435_6 Depth 2
                                        #     Child Loop BB435_18 Depth 2
	cmpl	$0, 10(%esi)
	jne	LBB435_15
# %bb.2:                                #   in Loop: Header=BB435_1 Depth=1
	cmpw	$1059, 8(%esi)                  # imm = 0x423
	je	LBB435_15
# %bb.3:                                #   in Loop: Header=BB435_1 Depth=1
	movl	4(%esi), %edi
	testl	%edi, %edi
	je	LBB435_15
# %bb.4:                                #   in Loop: Header=BB435_1 Depth=1
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB435_14
# %bb.5:                                #   in Loop: Header=BB435_1 Depth=1
	movl	%ecx, %eax
	cmpl	%edi, (%ecx)
	je	LBB435_8
	.p2align	4
LBB435_6:                               # %.preheader.i
                                        #   Parent Loop BB435_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB435_14
# %bb.7:                                #   in Loop: Header=BB435_6 Depth=2
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%edi, (%edx)
	jne	LBB435_6
LBB435_8:                               # %.loopexit5.i
                                        #   in Loop: Header=BB435_1 Depth=1
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB435_9
# %bb.11:                               #   in Loop: Header=BB435_1 Depth=1
	movl	%edx, 16(%ecx)
	jmp	LBB435_13
	.p2align	4
LBB435_15:                              # %.sink.split
                                        #   in Loop: Header=BB435_1 Depth=1
	movl	19(%esi), %edi
LBB435_16:                              #   in Loop: Header=BB435_1 Depth=1
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB435_26
# %bb.17:                               #   in Loop: Header=BB435_1 Depth=1
	movl	%ecx, %eax
	cmpl	%esi, (%ecx)
	je	LBB435_20
	.p2align	4
LBB435_18:                              # %.preheader.i2
                                        #   Parent Loop BB435_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB435_26
# %bb.19:                               #   in Loop: Header=BB435_18 Depth=2
	movl	%eax, %ecx
	movl	%edx, %eax
	cmpl	%esi, (%edx)
	jne	LBB435_18
LBB435_20:                              # %.loopexit5.i3
                                        #   in Loop: Header=BB435_1 Depth=1
	movl	16(%eax), %edx
	testl	%edx, %edx
	je	LBB435_21
# %bb.23:                               #   in Loop: Header=BB435_1 Depth=1
	movl	%edx, 16(%ecx)
	jmp	LBB435_25
LBB435_21:                              #   in Loop: Header=BB435_1 Depth=1
	cmpl	%eax, %ecx
	je	LBB435_22
# %bb.24:                               #   in Loop: Header=BB435_1 Depth=1
	movl	$0, 16(%ecx)
	movl	%ecx, _heapbottom
	jmp	LBB435_25
LBB435_22:                              #   in Loop: Header=BB435_1 Depth=1
	movl	$0, _heaplist
	movl	$0, _heapbottom
	.p2align	4
LBB435_25:                              #   in Loop: Header=BB435_1 Depth=1
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB435_26:                              # %.loopexit.i4
                                        #   in Loop: Header=BB435_1 Depth=1
	pushl	%esi
	calll	_free
	addl	$4, %esp
LBB435_27:                              # %Heap_Free.exit5
                                        #   in Loop: Header=BB435_1 Depth=1
	movl	%edi, _variablelist
	movl	%edi, %esi
	testl	%edi, %edi
	jne	LBB435_1
LBB435_28:                              # %.loopexit
	movl	$0, _variableBottom
	movl	$0, _variablelist
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Variant_IsEmpty;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_IsEmpty                # -- Begin function Variant_IsEmpty
	.p2align	4
_Variant_IsEmpty:                       # @Variant_IsEmpty
# %bb.0:
	movl	4(%esp), %eax
	cmpw	$0, 4(%eax)
	setne	%al
	retl
                                        # -- End function
	.def	_Variant_IsWriteable;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_IsWriteable            # -- Begin function Variant_IsWriteable
	.p2align	4
_Variant_IsWriteable:                   # @Variant_IsWriteable
# %bb.0:
	movl	4(%esp), %eax
	movl	6(%eax), %eax
	movzbl	(%eax), %eax
	retl
                                        # -- End function
	.def	_Variant_Read_Lreal;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Lreal             # -- Begin function Variant_Read_Lreal
	.p2align	4
_Variant_Read_Lreal:                    # @Variant_Read_Lreal
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	fldl	(%eax)
	retl
                                        # -- End function
	.def	_Variant_Read_Real;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Real              # -- Begin function Variant_Read_Real
	.p2align	4
_Variant_Read_Real:                     # @Variant_Read_Real
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	flds	(%eax)
	retl
                                        # -- End function
	.def	_Variant_Read_Lint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Lint              # -- Begin function Variant_Read_Lint
	.p2align	4
_Variant_Read_Lint:                     # @Variant_Read_Lint
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %ecx
	movl	(%ecx), %eax
	movl	4(%ecx), %edx
	retl
                                        # -- End function
	.def	_Variant_Read_Dint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Dint              # -- Begin function Variant_Read_Dint
	.p2align	4
_Variant_Read_Dint:                     # @Variant_Read_Dint
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	retl
                                        # -- End function
	.def	_Variant_Read_Int;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Int               # -- Begin function Variant_Read_Int
	.p2align	4
_Variant_Read_Int:                      # @Variant_Read_Int
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	movzwl	(%eax), %eax
	retl
                                        # -- End function
	.def	_Variant_Read_Sint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Sint              # -- Begin function Variant_Read_Sint
	.p2align	4
_Variant_Read_Sint:                     # @Variant_Read_Sint
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	movzbl	(%eax), %eax
	retl
                                        # -- End function
	.def	_Variant_Read_Ulint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Ulint             # -- Begin function Variant_Read_Ulint
	.p2align	4
_Variant_Read_Ulint:                    # @Variant_Read_Ulint
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %ecx
	movl	(%ecx), %eax
	movl	4(%ecx), %edx
	retl
                                        # -- End function
	.def	_Variant_Read_Udint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Udint             # -- Begin function Variant_Read_Udint
	.p2align	4
_Variant_Read_Udint:                    # @Variant_Read_Udint
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	retl
                                        # -- End function
	.def	_Variant_Read_Uint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Uint              # -- Begin function Variant_Read_Uint
	.p2align	4
_Variant_Read_Uint:                     # @Variant_Read_Uint
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	movzwl	(%eax), %eax
	retl
                                        # -- End function
	.def	_Variant_Read_Usint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Usint             # -- Begin function Variant_Read_Usint
	.p2align	4
_Variant_Read_Usint:                    # @Variant_Read_Usint
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	movzbl	(%eax), %eax
	retl
                                        # -- End function
	.def	_Variant_Read_Qword;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Qword             # -- Begin function Variant_Read_Qword
	.p2align	4
_Variant_Read_Qword:                    # @Variant_Read_Qword
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %ecx
	movl	(%ecx), %eax
	movl	4(%ecx), %edx
	retl
                                        # -- End function
	.def	_Variant_Read_Dword;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Dword             # -- Begin function Variant_Read_Dword
	.p2align	4
_Variant_Read_Dword:                    # @Variant_Read_Dword
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	retl
                                        # -- End function
	.def	_Variant_Read_Word;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Word              # -- Begin function Variant_Read_Word
	.p2align	4
_Variant_Read_Word:                     # @Variant_Read_Word
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	movzwl	(%eax), %eax
	retl
                                        # -- End function
	.def	_Variant_Read_Byte;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Byte              # -- Begin function Variant_Read_Byte
	.p2align	4
_Variant_Read_Byte:                     # @Variant_Read_Byte
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	movzbl	(%eax), %eax
	retl
                                        # -- End function
	.def	_Variant_Read_Bool;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Bool              # -- Begin function Variant_Read_Bool
	.p2align	4
_Variant_Read_Bool:                     # @Variant_Read_Bool
# %bb.0:
	movl	4(%esp), %eax
	movl	(%eax), %eax
	movzbl	(%eax), %eax
	retl
                                        # -- End function
	.def	_Variant_Read_String;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_String            # -- Begin function Variant_Read_String
	.p2align	4
_Variant_Read_String:                   # @Variant_Read_String
# %bb.0:
	movl	4(%esp), %eax
	movl	8(%esp), %ecx
	movl	(%ecx), %ecx
	movl	79(%ecx), %edx
	movl	%edx, 79(%eax)
	movups	64(%ecx), %xmm0
	movups	%xmm0, 64(%eax)
	movups	48(%ecx), %xmm0
	movups	%xmm0, 48(%eax)
	movups	32(%ecx), %xmm0
	movups	%xmm0, 32(%eax)
	movups	(%ecx), %xmm0
	movups	16(%ecx), %xmm1
	movups	%xmm1, 16(%eax)
	movups	%xmm0, (%eax)
	retl
                                        # -- End function
	.def	_Variant_Read_Array;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read_Array             # -- Begin function Variant_Read_Array
	.p2align	4
_Variant_Read_Array:                    # @Variant_Read_Array
# %bb.0:
	movl	4(%esp), %eax
	movl	8(%esp), %ecx
	movl	(%ecx), %ecx
	movzbl	2(%ecx), %edx
	movb	%dl, 2(%eax)
	movzwl	(%ecx), %ecx
	movw	%cx, (%eax)
	retl
                                        # -- End function
	.def	_Variant_Write_Lreal;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Lreal            # -- Begin function Variant_Write_Lreal
	.p2align	4
_Variant_Write_Lreal:                   # @Variant_Write_Lreal
# %bb.0:
	movl	4(%esp), %eax
	movw	$783, 4(%eax)                   # imm = 0x30F
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB455_2
# %bb.1:
	movsd	8(%esp), %xmm0                  # xmm0 = mem[0],zero
	movl	(%eax), %eax
	movsd	%xmm0, (%eax)
LBB455_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Real;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Real             # -- Begin function Variant_Write_Real
	.p2align	4
_Variant_Write_Real:                    # @Variant_Write_Real
# %bb.0:
	movl	4(%esp), %eax
	movw	$782, 4(%eax)                   # imm = 0x30E
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB456_2
# %bb.1:
	movss	8(%esp), %xmm0                  # xmm0 = mem[0],zero,zero,zero
	movl	(%eax), %eax
	movss	%xmm0, (%eax)
LBB456_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Lint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Lint             # -- Begin function Variant_Write_Lint
	.p2align	4
_Variant_Write_Lint:                    # @Variant_Write_Lint
# %bb.0:
	movl	4(%esp), %eax
	movw	$263, 4(%eax)                   # imm = 0x107
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB457_2
# %bb.1:
	movl	12(%esp), %ecx
	movl	8(%esp), %edx
	movl	(%eax), %eax
	movl	%ecx, 4(%eax)
	movl	%edx, (%eax)
LBB457_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Dint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Dint             # -- Begin function Variant_Write_Dint
	.p2align	4
_Variant_Write_Dint:                    # @Variant_Write_Dint
# %bb.0:
	movl	4(%esp), %eax
	movw	$262, 4(%eax)                   # imm = 0x106
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB458_2
# %bb.1:
	movl	8(%esp), %ecx
	movl	(%eax), %eax
	movl	%ecx, (%eax)
LBB458_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Int;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Int              # -- Begin function Variant_Write_Int
	.p2align	4
_Variant_Write_Int:                     # @Variant_Write_Int
# %bb.0:
	movl	4(%esp), %eax
	movw	$261, 4(%eax)                   # imm = 0x105
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB459_2
# %bb.1:
	movzwl	8(%esp), %ecx
	movl	(%eax), %eax
	movw	%cx, (%eax)
LBB459_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Sint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Sint             # -- Begin function Variant_Write_Sint
	.p2align	4
_Variant_Write_Sint:                    # @Variant_Write_Sint
# %bb.0:
	movl	4(%esp), %eax
	movw	$260, 4(%eax)                   # imm = 0x104
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB460_2
# %bb.1:
	movzbl	8(%esp), %ecx
	movl	(%eax), %eax
	movb	%cl, (%eax)
LBB460_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Ulint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Ulint            # -- Begin function Variant_Write_Ulint
	.p2align	4
_Variant_Write_Ulint:                   # @Variant_Write_Ulint
# %bb.0:
	movl	4(%esp), %eax
	movw	$515, 4(%eax)                   # imm = 0x203
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB461_2
# %bb.1:
	movl	12(%esp), %ecx
	movl	8(%esp), %edx
	movl	(%eax), %eax
	movl	%ecx, 4(%eax)
	movl	%edx, (%eax)
LBB461_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Udint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Udint            # -- Begin function Variant_Write_Udint
	.p2align	4
_Variant_Write_Udint:                   # @Variant_Write_Udint
# %bb.0:
	movl	4(%esp), %eax
	movw	$514, 4(%eax)                   # imm = 0x202
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB462_2
# %bb.1:
	movl	8(%esp), %ecx
	movl	(%eax), %eax
	movl	%ecx, (%eax)
LBB462_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Uint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Uint             # -- Begin function Variant_Write_Uint
	.p2align	4
_Variant_Write_Uint:                    # @Variant_Write_Uint
# %bb.0:
	movl	4(%esp), %eax
	movw	$513, 4(%eax)                   # imm = 0x201
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB463_2
# %bb.1:
	movzwl	8(%esp), %ecx
	movl	(%eax), %eax
	movw	%cx, (%eax)
LBB463_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Usint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Usint            # -- Begin function Variant_Write_Usint
	.p2align	4
_Variant_Write_Usint:                   # @Variant_Write_Usint
# %bb.0:
	movl	4(%esp), %eax
	movw	$512, 4(%eax)                   # imm = 0x200
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB464_2
# %bb.1:
	movzbl	8(%esp), %ecx
	movl	(%eax), %eax
	movb	%cl, (%eax)
LBB464_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Qword;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Qword            # -- Begin function Variant_Write_Qword
	.p2align	4
_Variant_Write_Qword:                   # @Variant_Write_Qword
# %bb.0:
	movl	4(%esp), %eax
	movw	$19, 4(%eax)
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB465_2
# %bb.1:
	movl	12(%esp), %ecx
	movl	8(%esp), %edx
	movl	(%eax), %eax
	movl	%ecx, 4(%eax)
	movl	%edx, (%eax)
LBB465_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Dword;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Dword            # -- Begin function Variant_Write_Dword
	.p2align	4
_Variant_Write_Dword:                   # @Variant_Write_Dword
# %bb.0:
	movl	4(%esp), %eax
	movw	$18, 4(%eax)
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB466_2
# %bb.1:
	movl	8(%esp), %ecx
	movl	(%eax), %eax
	movl	%ecx, (%eax)
LBB466_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Word;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Word             # -- Begin function Variant_Write_Word
	.p2align	4
_Variant_Write_Word:                    # @Variant_Write_Word
# %bb.0:
	movl	4(%esp), %eax
	movw	$17, 4(%eax)
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB467_2
# %bb.1:
	movzwl	8(%esp), %ecx
	movl	(%eax), %eax
	movw	%cx, (%eax)
LBB467_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Byte;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Byte             # -- Begin function Variant_Write_Byte
	.p2align	4
_Variant_Write_Byte:                    # @Variant_Write_Byte
# %bb.0:
	movl	4(%esp), %eax
	movw	$16, 4(%eax)
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB468_2
# %bb.1:
	movzbl	8(%esp), %ecx
	movl	(%eax), %eax
	movb	%cl, (%eax)
LBB468_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Bool;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Bool             # -- Begin function Variant_Write_Bool
	.p2align	4
_Variant_Write_Bool:                    # @Variant_Write_Bool
# %bb.0:
	movl	4(%esp), %eax
	movw	$1536, 4(%eax)                  # imm = 0x600
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB469_2
# %bb.1:
	movzbl	8(%esp), %ecx
	movl	(%eax), %eax
	movb	%cl, (%eax)
LBB469_2:
	retl
                                        # -- End function
	.def	_Variant_Write_String;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_String           # -- Begin function Variant_Write_String
	.p2align	4
_Variant_Write_String:                  # @Variant_Write_String
# %bb.0:
	movl	4(%esp), %eax
	movw	$1346, 4(%eax)                  # imm = 0x542
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB470_2
# %bb.1:
	leal	8(%esp), %ecx
	movl	(%eax), %eax
	movl	79(%ecx), %edx
	movl	%edx, 79(%eax)
	movups	64(%ecx), %xmm0
	movups	%xmm0, 64(%eax)
	movups	48(%ecx), %xmm0
	movups	%xmm0, 48(%eax)
	movups	32(%ecx), %xmm0
	movups	%xmm0, 32(%eax)
	movups	(%ecx), %xmm0
	movups	16(%ecx), %xmm1
	movups	%xmm1, 16(%eax)
	movups	%xmm0, (%eax)
LBB470_2:
	retl
                                        # -- End function
	.def	_Variant_Write_Array;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write_Array            # -- Begin function Variant_Write_Array
	.p2align	4
_Variant_Write_Array:                   # @Variant_Write_Array
# %bb.0:
	movl	4(%esp), %eax
	movw	$1058, 4(%eax)                  # imm = 0x422
	movl	6(%eax), %ecx
	cmpb	$0, (%ecx)
	je	LBB471_2
# %bb.1:
	leal	8(%esp), %ecx
	movl	(%eax), %eax
	movzbl	2(%ecx), %edx
	movb	%dl, 2(%eax)
	movzwl	(%ecx), %ecx
	movw	%cx, (%eax)
LBB471_2:
	retl
                                        # -- End function
	.def	_Variant_Write;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Write                  # -- Begin function Variant_Write
	.p2align	4
_Variant_Write:                         # @Variant_Write
# %bb.0:
	movl	8(%esp), %ecx
	movl	4(%esp), %eax
	movzwl	4(%ecx), %edx
	movw	%dx, 4(%eax)
	movl	6(%eax), %edx
	cmpb	$0, (%edx)
	je	LBB472_2
# %bb.1:
	movl	(%ecx), %ecx
	movsd	(%ecx), %xmm0                   # xmm0 = mem[0],zero
	movl	(%eax), %eax
	movsd	%xmm0, (%eax)
LBB472_2:
	retl
                                        # -- End function
	.def	_Variant_Read;
	.scl	2;
	.type	32;
	.endef
	.globl	_Variant_Read                   # -- Begin function Variant_Read
	.p2align	4
_Variant_Read:                          # @Variant_Read
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	16(%esp), %edi
	movzwl	4(%edi), %ebx
	xorl	%edx, %edx
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	cmpl	$511, %ebx                      # imm = 0x1FF
	jle	LBB473_4
# %bb.1:
	cmpl	$1057, %ebx                     # imm = 0x421
	jg	LBB473_7
# %bb.2:
	leal	-512(%ebx), %esi
	cmpl	$3, %esi
	ja	LBB473_15
# %bb.3:
	jmpl	*LJTI473_2(,%esi,4)
LBB473_4:
	leal	-16(%ebx), %esi
	cmpl	$3, %esi
	jbe	LBB473_11
# %bb.5:
	addl	$-260, %ebx                     # imm = 0xFEFC
	cmpl	$3, %ebx
	ja	LBB473_25
# %bb.6:
	jmpl	*LJTI473_1(,%ebx,4)
LBB473_7:
	cmpl	$1345, %ebx                     # imm = 0x541
	jle	LBB473_19
# %bb.8:
	cmpl	$1346, %ebx                     # imm = 0x542
	je	LBB473_21
# %bb.9:
	cmpl	$1347, %ebx                     # imm = 0x543
	je	LBB473_18
# %bb.10:
	movl	$0, %esi
	cmpl	$1536, %ebx                     # imm = 0x600
	je	LBB473_12
	jmp	LBB473_23
LBB473_11:
	jmpl	*LJTI473_0(,%esi,4)
LBB473_12:
	movl	(%edi), %eax
	movzbl	(%eax), %eax
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	xorl	%edx, %edx
	jmp	LBB473_23
LBB473_13:
	movl	(%edi), %ecx
	movl	(%ecx), %eax
	movl	4(%ecx), %edx
	jmp	LBB473_22
LBB473_14:
	movl	(%edi), %eax
	movzwl	(%eax), %eax
	movl	%eax, %ecx
	shrl	$8, %ecx
	xorl	%esi, %esi
	jmp	LBB473_23
LBB473_15:
	cmpl	$782, %ebx                      # imm = 0x30E
	je	LBB473_18
# %bb.16:
	movl	$0, %esi
	cmpl	$783, %ebx                      # imm = 0x30F
	jne	LBB473_23
# %bb.17:
	movl	(%edi), %edx
	movl	(%edx), %eax
	movzwl	1(%edx), %ecx
	movl	%eax, %esi
	andl	$-65536, %esi                   # imm = 0xFFFF0000
	movl	4(%edx), %edx
	jmp	LBB473_23
LBB473_18:
	movl	(%edi), %eax
	movl	(%eax), %eax
	jmp	LBB473_22
LBB473_19:
	cmpl	$1058, %ebx                     # imm = 0x422
	je	LBB473_21
# %bb.20:
	cmpl	$1060, %ebx                     # imm = 0x424
	jne	LBB473_25
LBB473_21:
	movl	(%edi), %eax
LBB473_22:
	movl	%eax, %ecx
	shrl	$8, %ecx
	movl	%eax, %esi
	andl	$-65536, %esi                   # imm = 0xFFFF0000
LBB473_23:
	shll	$8, %ecx
	movzbl	%al, %eax
	orl	%ecx, %eax
	movzwl	%ax, %eax
	orl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
LBB473_25:
	xorl	%esi, %esi
	jmp	LBB473_23
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI473_0:
	.long	LBB473_12
	.long	LBB473_14
	.long	LBB473_18
	.long	LBB473_13
LJTI473_1:
	.long	LBB473_12
	.long	LBB473_14
	.long	LBB473_18
	.long	LBB473_13
LJTI473_2:
	.long	LBB473_12
	.long	LBB473_14
	.long	LBB473_18
	.long	LBB473_13
                                        # -- End function
	.bss
	.globl	_hAPImbx                        # @hAPImbx
	.p2align	1, 0x0
_hAPImbx:
	.short	0                               # 0x0

	.globl	_hAPImbxRES                     # @hAPImbxRES
	.p2align	1, 0x0
_hAPImbxRES:
	.short	0                               # 0x0

	.globl	_hAPIthread                     # @hAPIthread
	.p2align	1, 0x0
_hAPIthread:
	.short	0                               # 0x0

	.globl	_letter                         # @letter
	.p2align	2, 0x0
_letter:
	.long	0

	.section	.rdata,"dr",discard,"??_C@_06GNHHIIJE@APIREQ?$AA@"
	.globl	"??_C@_06GNHHIIJE@APIREQ?$AA@"  # @"??_C@_06GNHHIIJE@APIREQ?$AA@"
"??_C@_06GNHHIIJE@APIREQ?$AA@":
	.asciz	"APIREQ"

	.section	.rdata,"dr",discard,"??_C@_03LABEMFEH@API?$AA@"
	.globl	"??_C@_03LABEMFEH@API?$AA@"     # @"??_C@_03LABEMFEH@API?$AA@"
"??_C@_03LABEMFEH@API?$AA@":
	.asciz	"API"

	.section	.rdata,"dr",discard,"??_C@_09BGEIHPFA@APITHREAD?$AA@"
	.globl	"??_C@_09BGEIHPFA@APITHREAD?$AA@" # @"??_C@_09BGEIHPFA@APITHREAD?$AA@"
"??_C@_09BGEIHPFA@APITHREAD?$AA@":
	.asciz	"APITHREAD"

	.section	.rdata,"dr",discard,"??_C@_0N@OKJONGND@Api_Dispatch?$AA@"
	.globl	"??_C@_0N@OKJONGND@Api_Dispatch?$AA@" # @"??_C@_0N@OKJONGND@Api_Dispatch?$AA@"
"??_C@_0N@OKJONGND@Api_Dispatch?$AA@":
	.asciz	"Api_Dispatch"

	.section	.rdata,"dr",discard,"??_C@_0BC@NALIPHCK@Argument_PouFiles?$AA@"
	.globl	"??_C@_0BC@NALIPHCK@Argument_PouFiles?$AA@" # @"??_C@_0BC@NALIPHCK@Argument_PouFiles?$AA@"
"??_C@_0BC@NALIPHCK@Argument_PouFiles?$AA@":
	.asciz	"Argument_PouFiles"

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

	.bss
	.globl	_status_basicfunc               # @status_basicfunc
	.p2align	2, 0x0
_status_basicfunc:
	.long	0                               # 0x0

	.globl	_BasicFunctions                 # @BasicFunctions
	.p2align	2, 0x0
_BasicFunctions:
	.long	0

	.globl	_NumBasicFunctions              # @NumBasicFunctions
	.p2align	1, 0x0
_NumBasicFunctions:
	.short	0                               # 0x0

	.lcomm	_hBasicFuncRSL,2,2              # @hBasicFuncRSL
	.section	.rdata,"dr",discard,"??_C@_0P@FHFAIKGM@BasicFunctions?$AA@"
	.globl	"??_C@_0P@FHFAIKGM@BasicFunctions?$AA@" # @"??_C@_0P@FHFAIKGM@BasicFunctions?$AA@"
"??_C@_0P@FHFAIKGM@BasicFunctions?$AA@":
	.asciz	"BasicFunctions"

	.section	.rdata,"dr",discard,"??_C@_0BC@OECJMJAO@NumBasicFunctions?$AA@"
	.globl	"??_C@_0BC@OECJMJAO@NumBasicFunctions?$AA@" # @"??_C@_0BC@OECJMJAO@NumBasicFunctions?$AA@"
"??_C@_0BC@OECJMJAO@NumBasicFunctions?$AA@":
	.asciz	"NumBasicFunctions"

	.section	.rdata,"dr",discard,"??_C@_0BM@NHPPFOEA@?5?5function?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@"
	.globl	"??_C@_0BM@NHPPFOEA@?5?5function?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@" # @"??_C@_0BM@NHPPFOEA@?5?5function?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@"
"??_C@_0BM@NHPPFOEA@?5?5function?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@":
	.asciz	"  function(%03d) %-14s  %p\n"

	.section	.rdata,"dr"
L_str:                                  # @str
	.asciz	"Basicfunction list"

	.lcomm	_commentnest,4,4                # @commentnest
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

	.section	.rdata,"dr",discard,"??_C@_01KMDKNFGN@?1?$AA@"
	.globl	"??_C@_01KMDKNFGN@?1?$AA@"      # @"??_C@_01KMDKNFGN@?1?$AA@"
"??_C@_01KMDKNFGN@?1?$AA@":
	.asciz	"/"

	.section	.rdata,"dr",discard,"??_C@_09OABCBDAM@C?3?2INplc?2?$AA@"
	.globl	"??_C@_09OABCBDAM@C?3?2INplc?2?$AA@" # @"??_C@_09OABCBDAM@C?3?2INplc?2?$AA@"
"??_C@_09OABCBDAM@C?3?2INplc?2?$AA@":
	.asciz	"C:\\INplc\\"

	.section	.rdata,"dr",discard,"??_C@_07NFKFJBIP@?$CFs_?$CF03d?$AA@"
	.globl	"??_C@_07NFKFJBIP@?$CFs_?$CF03d?$AA@" # @"??_C@_07NFKFJBIP@?$CFs_?$CF03d?$AA@"
"??_C@_07NFKFJBIP@?$CFs_?$CF03d?$AA@":
	.asciz	"%s_%03d"

	.section	.rdata,"dr",discard,"??_C@_05FNNGFGLF@Index?$AA@"
	.globl	"??_C@_05FNNGFGLF@Index?$AA@"   # @"??_C@_05FNNGFGLF@Index?$AA@"
"??_C@_05FNNGFGLF@Index?$AA@":
	.asciz	"Index"

	.section	.rdata,"dr",discard,"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
	.globl	"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@" # @"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@"
"??_C@_0O@HNOCHMHL@SERVICE?4?$CFs?4?$CFs?$AA@":
	.asciz	"SERVICE.%s.%s"

	.lcomm	__ContainerTagName,128          # @_ContainerTagName
	.lcomm	__ModuleName,128                # @_ModuleName
	.lcomm	_Container_Log$.messBuff,4,4    # @"Container_Log$.messBuff"
	.bss
	.globl	_hExitEvent                     # @hExitEvent
	.p2align	1, 0x0
_hExitEvent:
	.short	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_04LBABLPF@Exit?$AA@"
	.globl	"??_C@_04LBABLPF@Exit?$AA@"     # @"??_C@_04LBABLPF@Exit?$AA@"
"??_C@_04LBABLPF@Exit?$AA@":
	.asciz	"Exit"

	.section	.rdata,"dr",discard,"??_C@_06HHNOBIIB@Notify?$AA@"
	.globl	"??_C@_06HHNOBIIB@Notify?$AA@"  # @"??_C@_06HHNOBIIB@Notify?$AA@"
"??_C@_06HHNOBIIB@Notify?$AA@":
	.asciz	"Notify"

	.section	.rdata,"dr",discard,"??_C@_0BJ@OPOGIFPF@EM_SERVICE_RUN?5recieved?4?$AA@"
	.globl	"??_C@_0BJ@OPOGIFPF@EM_SERVICE_RUN?5recieved?4?$AA@" # @"??_C@_0BJ@OPOGIFPF@EM_SERVICE_RUN?5recieved?4?$AA@"
"??_C@_0BJ@OPOGIFPF@EM_SERVICE_RUN?5recieved?4?$AA@":
	.asciz	"EM_SERVICE_RUN recieved."

	.section	.rdata,"dr",discard,"??_C@_03GOLGPOF@DBG?$AA@"
	.globl	"??_C@_03GOLGPOF@DBG?$AA@"      # @"??_C@_03GOLGPOF@DBG?$AA@"
"??_C@_03GOLGPOF@DBG?$AA@":
	.asciz	"DBG"

	.section	.rdata,"dr",discard,"??_C@_0BL@DPPAKCHP@EM_SERVICE_PAUSE?5recieved?4?$AA@"
	.globl	"??_C@_0BL@DPPAKCHP@EM_SERVICE_PAUSE?5recieved?4?$AA@" # @"??_C@_0BL@DPPAKCHP@EM_SERVICE_PAUSE?5recieved?4?$AA@"
"??_C@_0BL@DPPAKCHP@EM_SERVICE_PAUSE?5recieved?4?$AA@":
	.asciz	"EM_SERVICE_PAUSE recieved."

	.section	.rdata,"dr",discard,"??_C@_0BK@LMHOIIID@EM_SERVICE_STOP?5recieved?4?$AA@"
	.globl	"??_C@_0BK@LMHOIIID@EM_SERVICE_STOP?5recieved?4?$AA@" # @"??_C@_0BK@LMHOIIID@EM_SERVICE_STOP?5recieved?4?$AA@"
"??_C@_0BK@LMHOIIID@EM_SERVICE_STOP?5recieved?4?$AA@":
	.asciz	"EM_SERVICE_STOP recieved."

	.lcomm	_catalogProc,12                 # @catalogProc
	.section	.rdata,"dr",discard,"??_C@_04KGFMLCPK@Main?$AA@"
	.globl	"??_C@_04KGFMLCPK@Main?$AA@"    # @"??_C@_04KGFMLCPK@Main?$AA@"
"??_C@_04KGFMLCPK@Main?$AA@":
	.asciz	"Main"

	.lcomm	_Container_CreateTagsFromList.dummy,15 # @Container_CreateTagsFromList.dummy
	.section	.rdata,"dr"
	.p2align	1, 0x0                          # @switch.table.Container_TagCreate
L_switch.table.Container_TagCreate:
	.short	1                               # 0x1
	.short	0                               # 0x0
	.short	1                               # 0x1
	.short	2                               # 0x2
	.short	2                               # 0x2
	.short	4                               # 0x4
	.short	4                               # 0x4

	.bss
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
	.globl	_lpfnSeq_Ctrl                   # @lpfnSeq_Ctrl
	.p2align	2, 0x0
_lpfnSeq_Ctrl:
	.long	0

	.globl	_plcErrList                     # @plcErrList
	.p2align	2, 0x0
_plcErrList:
	.long	0

	.globl	_plcErrBottom                   # @plcErrBottom
	.p2align	2, 0x0
_plcErrBottom:
	.long	0

	.globl	_errors                         # @errors
	.p2align	2, 0x0
_errors:
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_02GIPFHKNO@OK?$AA@"
	.globl	"??_C@_02GIPFHKNO@OK?$AA@"      # @"??_C@_02GIPFHKNO@OK?$AA@"
"??_C@_02GIPFHKNO@OK?$AA@":
	.asciz	"OK"

	.section	.rdata,"dr",discard,"??_C@_0BP@PECHELKI@DIFF?$JG?$LN?$JH?$NP?$IC?$KK?$IP?c?$IM?$MA?$JA?$JE?$IC?p?$JC?$LE?$IC?$KG?$IC?D?$IC?$KC?$IC?$NM?$IC?$LH?$AA@"
	.globl	"??_C@_0BP@PECHELKI@DIFF?$JG?$LN?$JH?$NP?$IC?$KK?$IP?c?$IM?$MA?$JA?$JE?$IC?p?$JC?$LE?$IC?$KG?$IC?D?$IC?$KC?$IC?$NM?$IC?$LH?$AA@" # @"??_C@_0BP@PECHELKI@DIFF?$JG?$LN?$JH?$NP?$IC?$KK?$IP?c?$IM?$MA?$JA?$JE?$IC?p?$JC?$LE?$IC?$KG?$IC?D?$IC?$KC?$IC?$NM?$IC?$LH?$AA@"
"??_C@_0BP@PECHELKI@DIFF?$JG?$LN?$JH?$NP?$IC?$KK?$IP?c?$IM?$MA?$JA?$JE?$IC?p?$JC?$LE?$IC?$KG?$IC?D?$IC?$KC?$IC?$NM?$IC?$LH?$AA@":
	.asciz	"DIFF\226\275\227\337\202\252\217\343\214\300\220\224\202\360\222\264\202\246\202\304\202\242\202\334\202\267"

	.section	.rdata,"dr",discard,"??_C@_0DC@JOIKBPIG@MPS?1MPP?$JG?$LN?$JH?$NP?$JA?$JE?$ID?$HN?$IDb?$ID?$GA?$ID?$JD?$IDO?$CI?$IDX?$ID?$FO?$IDb?$IDN@"
	.globl	"??_C@_0DC@JOIKBPIG@MPS?1MPP?$JG?$LN?$JH?$NP?$JA?$JE?$ID?$HN?$IDb?$ID?$GA?$ID?$JD?$IDO?$CI?$IDX?$ID?$FO?$IDb?$IDN@" # @"??_C@_0DC@JOIKBPIG@MPS?1MPP?$JG?$LN?$JH?$NP?$JA?$JE?$ID?$HN?$IDb?$ID?$GA?$ID?$JD?$IDO?$CI?$IDX?$ID?$FO?$IDb?$IDN@"
"??_C@_0DC@JOIKBPIG@MPS?1MPP?$JG?$LN?$JH?$NP?$JA?$JE?$ID?$HN?$IDb?$ID?$GA?$ID?$JD?$IDO?$CI?$IDX?$ID?$FO?$IDb?$IDN@":
	.asciz	"MPS/MPP\226\275\227\337\220\224\203}\203b\203`\203\223\203O(\203X\203^\203b\203N)\202\311\210\331\217\355\202\252\202\240\202\350\202\334\202\267"

	.section	.rdata,"dr",discard,"??_C@_0BP@LEGDNOLK@?$JG?$LN?$JH?$NP?$II?x?$JA?$JE?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@"
	.globl	"??_C@_0BP@LEGDNOLK@?$JG?$LN?$JH?$NP?$II?x?$JA?$JE?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@" # @"??_C@_0BP@LEGDNOLK@?$JG?$LN?$JH?$NP?$II?x?$JA?$JE?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@"
"??_C@_0BP@LEGDNOLK@?$JG?$LN?$JH?$NP?$II?x?$JA?$JE?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@":
	.asciz	"\226\275\227\337\210\370\220\224\202\314\216w\222\350\202\311\210\331\217\355\202\252\202\240\202\350\202\334\202\267"

	.section	.rdata,"dr",discard,"??_C@_0CA@OMOEGCFH@?$JG?$LN?$JH?$NP?$II?x?$JA?$JE1?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@"
	.globl	"??_C@_0CA@OMOEGCFH@?$JG?$LN?$JH?$NP?$II?x?$JA?$JE1?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@" # @"??_C@_0CA@OMOEGCFH@?$JG?$LN?$JH?$NP?$II?x?$JA?$JE1?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@"
"??_C@_0CA@OMOEGCFH@?$JG?$LN?$JH?$NP?$II?x?$JA?$JE1?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@":
	.asciz	"\226\275\227\337\210\370\220\2241\202\314\216w\222\350\202\311\210\331\217\355\202\252\202\240\202\350\202\334\202\267"

	.section	.rdata,"dr",discard,"??_C@_0CA@LEPKMLHP@?$JG?$LN?$JH?$NP?$II?x?$JA?$JE2?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@"
	.globl	"??_C@_0CA@LEPKMLHP@?$JG?$LN?$JH?$NP?$II?x?$JA?$JE2?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@" # @"??_C@_0CA@LEPKMLHP@?$JG?$LN?$JH?$NP?$II?x?$JA?$JE2?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@"
"??_C@_0CA@LEPKMLHP@?$JG?$LN?$JH?$NP?$II?x?$JA?$JE2?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@":
	.asciz	"\226\275\227\337\210\370\220\2242\202\314\216w\222\350\202\311\210\331\217\355\202\252\202\240\202\350\202\334\202\267"

	.section	.rdata,"dr",discard,"??_C@_0CA@DFNPKOFI@?$JG?$LN?$JH?$NP?$II?x?$JA?$JE3?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@"
	.globl	"??_C@_0CA@DFNPKOFI@?$JG?$LN?$JH?$NP?$II?x?$JA?$JE3?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@" # @"??_C@_0CA@DFNPKOFI@?$JG?$LN?$JH?$NP?$II?x?$JA?$JE3?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@"
"??_C@_0CA@DFNPKOFI@?$JG?$LN?$JH?$NP?$II?x?$JA?$JE3?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@":
	.asciz	"\226\275\227\337\210\370\220\2243\202\314\216w\222\350\202\311\210\331\217\355\202\252\202\240\202\350\202\334\202\267"

	.section	.rdata,"dr",discard,"??_C@_0BL@HOHFBNFI@LD?$JG?$LN?$JH?$NP?$JA?$KO?$IN?$IH?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@"
	.globl	"??_C@_0BL@HOHFBNFI@LD?$JG?$LN?$JH?$NP?$JA?$KO?$IN?$IH?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@" # @"??_C@_0BL@HOHFBNFI@LD?$JG?$LN?$JH?$NP?$JA?$KO?$IN?$IH?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@"
"??_C@_0BL@HOHFBNFI@LD?$JG?$LN?$JH?$NP?$JA?$KO?$IN?$IH?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@":
	.asciz	"LD\226\275\227\337\220\256\215\207\202\311\210\331\217\355\202\252\202\240\202\350\202\334\202\267"

	.section	.rdata,"dr",discard,"??_C@_0CA@DHEPJILA@END?$JG?$LN?$JH?$NP?$IC?E?$IPI?$JH?$LJ?$IC?$LH?$IC?i?$JFK?$JHv?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@"
	.globl	"??_C@_0CA@DHEPJILA@END?$JG?$LN?$JH?$NP?$IC?E?$IPI?$JH?$LJ?$IC?$LH?$IC?i?$JFK?$JHv?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@" # @"??_C@_0CA@DHEPJILA@END?$JG?$LN?$JH?$NP?$IC?E?$IPI?$JH?$LJ?$IC?$LH?$IC?i?$JFK?$JHv?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@"
"??_C@_0CA@DHEPJILA@END?$JG?$LN?$JH?$NP?$IC?E?$IPI?$JH?$LJ?$IC?$LH?$IC?i?$JFK?$JHv?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@":
	.asciz	"END\226\275\227\337\202\305\217I\227\271\202\267\202\351\225K\227v\202\252\202\240\202\350\202\334\202\267"

	.section	.rdata,"dr",discard,"??_C@_0CB@CPJGBGMG@?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?L?$JD?G?$IC?$NN?$IN?$JO?$IC?$NN?$IC?I?$IO?$LI?$JEs?$IC?$LF?$IC?$NM?$IC?$LF?$IC?$LN@"
	.globl	"??_C@_0CB@CPJGBGMG@?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?L?$JD?G?$IC?$NN?$IN?$JO?$IC?$NN?$IC?I?$IO?$LI?$JEs?$IC?$LF?$IC?$NM?$IC?$LF?$IC?$LN@" # @"??_C@_0CB@CPJGBGMG@?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?L?$JD?G?$IC?$NN?$IN?$JO?$IC?$NN?$IC?I?$IO?$LI?$JEs?$IC?$LF?$IC?$NM?$IC?$LF?$IC?$LN@"
"??_C@_0CB@CPJGBGMG@?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?L?$JD?G?$IC?$NN?$IN?$JO?$IC?$NN?$IC?I?$IO?$LI?$JEs?$IC?$LF?$IC?$NM?$IC?$LF?$IC?$LN@":
	.asciz	"\203t\203@\203C\203\213\202\314\223\307\202\335\215\236\202\335\202\311\216\270\224s\202\265\202\334\202\265\202\275"

	.section	.rdata,"dr",discard,"??_C@_0BL@KPLAJJGP@?$JFs?$JA?$LD?$IC?H?$JF?$LG?$IO?$JK?$JH?q?$IC?p?$IM?$JP?$JCm?$IC?$LF?$IC?$NM?$IC?$LF?$IC?$LN?$AA@"
	.globl	"??_C@_0BL@KPLAJJGP@?$JFs?$JA?$LD?$IC?H?$JF?$LG?$IO?$JK?$JH?q?$IC?p?$IM?$JP?$JCm?$IC?$LF?$IC?$NM?$IC?$LF?$IC?$LN?$AA@" # @"??_C@_0BL@KPLAJJGP@?$JFs?$JA?$LD?$IC?H?$JF?$LG?$IO?$JK?$JH?q?$IC?p?$IM?$JP?$JCm?$IC?$LF?$IC?$NM?$IC?$LF?$IC?$LN?$AA@"
"??_C@_0BL@KPLAJJGP@?$JFs?$JA?$LD?$IC?H?$JF?$LG?$IO?$JK?$JH?q?$IC?p?$IM?$JP?$JCm?$IC?$LF?$IC?$NM?$IC?$LF?$IC?$LN?$AA@":
	.asciz	"\225s\220\263\202\310\225\266\216\232\227\361\202\360\214\237\222m\202\265\202\334\202\265\202\275"

	.section	.rdata,"dr",discard,"??_C@_0BJ@FHCFECBH@?$JFs?$JA?$LD?$IC?H?$JG?$LN?$JH?$NP?$IC?p?$IM?$JP?$JCm?$IC?$LF?$IC?$NM?$IC?$LF?$IC?$LN?$AA@"
	.globl	"??_C@_0BJ@FHCFECBH@?$JFs?$JA?$LD?$IC?H?$JG?$LN?$JH?$NP?$IC?p?$IM?$JP?$JCm?$IC?$LF?$IC?$NM?$IC?$LF?$IC?$LN?$AA@" # @"??_C@_0BJ@FHCFECBH@?$JFs?$JA?$LD?$IC?H?$JG?$LN?$JH?$NP?$IC?p?$IM?$JP?$JCm?$IC?$LF?$IC?$NM?$IC?$LF?$IC?$LN?$AA@"
"??_C@_0BJ@FHCFECBH@?$JFs?$JA?$LD?$IC?H?$JG?$LN?$JH?$NP?$IC?p?$IM?$JP?$JCm?$IC?$LF?$IC?$NM?$IC?$LF?$IC?$LN?$AA@":
	.asciz	"\225s\220\263\202\310\226\275\227\337\202\360\214\237\222m\202\265\202\334\202\265\202\275"

	.section	.rdata,"dr",discard,"??_C@_0BM@PGNGJEPF@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?$KK?$IM?$KJ?$IC?B?$IC?$KJ?$IC?h?$IC?$NM?$IC?$LJ?$IC?q?$AA@"
	.globl	"??_C@_0BM@PGNGJEPF@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?$KK?$IM?$KJ?$IC?B?$IC?$KJ?$IC?h?$IC?$NM?$IC?$LJ?$IC?q?$AA@" # @"??_C@_0BM@PGNGJEPF@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?$KK?$IM?$KJ?$IC?B?$IC?$KJ?$IC?h?$IC?$NM?$IC?$LJ?$IC?q?$AA@"
"??_C@_0BM@PGNGJEPF@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?$KK?$IM?$KJ?$IC?B?$IC?$KJ?$IC?h?$IC?$NM?$IC?$LJ?$IC?q?$AA@":
	.asciz	"INI\203t\203@\203C\203\213\202\252\214\251\202\302\202\251\202\350\202\334\202\271\202\361"

	.section	.rdata,"dr",discard,"??_C@_0CN@PFLFACDK@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?ITIMER?$IDZ?$IDN?$IDV?$ID?$IH?$ID?$JD?$IC?$KK?$IM?$KJ@"
	.globl	"??_C@_0CN@PFLFACDK@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?ITIMER?$IDZ?$IDN?$IDV?$ID?$IH?$ID?$JD?$IC?$KK?$IM?$KJ@" # @"??_C@_0CN@PFLFACDK@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?ITIMER?$IDZ?$IDN?$IDV?$ID?$IH?$ID?$JD?$IC?$KK?$IM?$KJ@"
"??_C@_0CN@PFLFACDK@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?ITIMER?$IDZ?$IDN?$IDV?$ID?$IH?$ID?$JD?$IC?$KK?$IM?$KJ@":
	.asciz	"INI\203t\203@\203C\203\213\202\311TIMER\203Z\203N\203V\203\207\203\223\202\252\214\251\202\302\202\251\202\350\202\334\202\271\202\361"

	.section	.rdata,"dr",discard,"??_C@_0CN@DNENAMLD@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LTIMER?$JE?T?$IN?$IG?$IC?L?$IOw?$JC?h?$IC?I?$II?Y@"
	.globl	"??_C@_0CN@DNENAMLD@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LTIMER?$JE?T?$IN?$IG?$IC?L?$IOw?$JC?h?$IC?I?$II?Y@" # @"??_C@_0CN@DNENAMLD@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LTIMER?$JE?T?$IN?$IG?$IC?L?$IOw?$JC?h?$IC?I?$II?Y@"
"??_C@_0CN@DNENAMLD@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LTIMER?$JE?T?$IN?$IG?$IC?L?$IOw?$JC?h?$IC?I?$II?Y@":
	.asciz	"INI\203t\203@\203C\203\213\202\314TIMER\224\324\215\206\202\314\216w\222\350\202\311\210\331\217\355\202\252\202\240\202\350\202\334\202\267"

	.section	.rdata,"dr",discard,"??_C@_0CN@CNLMLIB@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LTIMER?$IO?m?$JF?J?$IC?L?$IOw?$JC?h?$IC?I?$II?Y@"
	.globl	"??_C@_0CN@CNLMLIB@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LTIMER?$IO?m?$JF?J?$IC?L?$IOw?$JC?h?$IC?I?$II?Y@" # @"??_C@_0CN@CNLMLIB@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LTIMER?$IO?m?$JF?J?$IC?L?$IOw?$JC?h?$IC?I?$II?Y@"
"??_C@_0CN@CNLMLIB@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LTIMER?$IO?m?$JF?J?$IC?L?$IOw?$JC?h?$IC?I?$II?Y@":
	.asciz	"INI\203t\203@\203C\203\213\202\314TIMER\216\355\225\312\202\314\216w\222\350\202\311\210\331\217\355\202\252\202\240\202\350\202\334\202\267"

	.section	.rdata,"dr",discard,"??_C@_0CL@JDAHAPOH@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LTIMER?$JCl?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m@"
	.globl	"??_C@_0CL@JDAHAPOH@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LTIMER?$JCl?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m@" # @"??_C@_0CL@JDAHAPOH@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LTIMER?$JCl?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m@"
"??_C@_0CL@JDAHAPOH@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LTIMER?$JCl?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m@":
	.asciz	"INI\203t\203@\203C\203\213\202\314TIMER\222l\202\314\216w\222\350\202\311\210\331\217\355\202\252\202\240\202\350\202\334\202\267"

	.section	.rdata,"dr",discard,"??_C@_0CP@GMLPKJFJ@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?ICNT_INI?$IDZ?$IDN?$IDV?$ID?$IH?$ID?$JD?$IC?$KK@"
	.globl	"??_C@_0CP@GMLPKJFJ@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?ICNT_INI?$IDZ?$IDN?$IDV?$ID?$IH?$ID?$JD?$IC?$KK@" # @"??_C@_0CP@GMLPKJFJ@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?ICNT_INI?$IDZ?$IDN?$IDV?$ID?$IH?$ID?$JD?$IC?$KK@"
"??_C@_0CP@GMLPKJFJ@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?ICNT_INI?$IDZ?$IDN?$IDV?$ID?$IH?$ID?$JD?$IC?$KK@":
	.asciz	"INI\203t\203@\203C\203\213\202\311CNT_INI\203Z\203N\203V\203\207\203\223\202\252\214\251\202\302\202\251\202\350\202\334\202\271\202\361"

	.section	.rdata,"dr",discard,"??_C@_0CP@LDEJBNOH@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LCOUNTER?$JE?T?$IN?$IG?$IC?L?$IOw?$JC?h?$IC?I@"
	.globl	"??_C@_0CP@LDEJBNOH@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LCOUNTER?$JE?T?$IN?$IG?$IC?L?$IOw?$JC?h?$IC?I@" # @"??_C@_0CP@LDEJBNOH@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LCOUNTER?$JE?T?$IN?$IG?$IC?L?$IOw?$JC?h?$IC?I@"
"??_C@_0CP@LDEJBNOH@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LCOUNTER?$JE?T?$IN?$IG?$IC?L?$IOw?$JC?h?$IC?I@":
	.asciz	"INI\203t\203@\203C\203\213\202\314COUNTER\224\324\215\206\202\314\216w\222\350\202\311\210\331\217\355\202\252\202\240\202\350\202\334\202\267"

	.section	.rdata,"dr",discard,"??_C@_0CN@LNJMJHBD@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LCOUNTER?$JCl?$IC?L?$IOw?$JC?h?$IC?I?$II?Y@"
	.globl	"??_C@_0CN@LNJMJHBD@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LCOUNTER?$JCl?$IC?L?$IOw?$JC?h?$IC?I?$II?Y@" # @"??_C@_0CN@LNJMJHBD@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LCOUNTER?$JCl?$IC?L?$IOw?$JC?h?$IC?I?$II?Y@"
"??_C@_0CN@LNJMJHBD@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LCOUNTER?$JCl?$IC?L?$IOw?$JC?h?$IC?I?$II?Y@":
	.asciz	"INI\203t\203@\203C\203\213\202\314COUNTER\222l\202\314\216w\222\350\202\311\210\331\217\355\202\252\202\240\202\350\202\334\202\267"

	.section	.rdata,"dr",discard,"??_C@_0CP@BOJENBEE@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?ICHANNEL?$IDZ?$IDN?$IDV?$ID?$IH?$ID?$JD?$IC?$KK@"
	.globl	"??_C@_0CP@BOJENBEE@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?ICHANNEL?$IDZ?$IDN?$IDV?$ID?$IH?$ID?$JD?$IC?$KK@" # @"??_C@_0CP@BOJENBEE@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?ICHANNEL?$IDZ?$IDN?$IDV?$ID?$IH?$ID?$JD?$IC?$KK@"
"??_C@_0CP@BOJENBEE@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?ICHANNEL?$IDZ?$IDN?$IDV?$ID?$IH?$ID?$JD?$IC?$KK@":
	.asciz	"INI\203t\203@\203C\203\213\202\311CHANNEL\203Z\203N\203V\203\207\203\223\202\252\214\251\202\302\202\251\202\350\202\334\202\271\202\361"

	.section	.rdata,"dr",discard,"??_C@_0CP@HMFAEIJI@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LCHANNEL?$JE?T?$IN?$IG?$IC?L?$IOw?$JC?h?$IC?I@"
	.globl	"??_C@_0CP@HMFAEIJI@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LCHANNEL?$JE?T?$IN?$IG?$IC?L?$IOw?$JC?h?$IC?I@" # @"??_C@_0CP@HMFAEIJI@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LCHANNEL?$JE?T?$IN?$IG?$IC?L?$IOw?$JC?h?$IC?I@"
"??_C@_0CP@HMFAEIJI@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LCHANNEL?$JE?T?$IN?$IG?$IC?L?$IOw?$JC?h?$IC?I@":
	.asciz	"INI\203t\203@\203C\203\213\202\314CHANNEL\224\324\215\206\202\314\216w\222\350\202\311\210\331\217\355\202\252\202\240\202\350\202\334\202\267"

	.section	.rdata,"dr",discard,"??_C@_0CP@EDMGIPKK@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LCHANNEL?$IO?m?$JF?J?$IC?L?$IOw?$JC?h?$IC?I@"
	.globl	"??_C@_0CP@EDMGIPKK@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LCHANNEL?$IO?m?$JF?J?$IC?L?$IOw?$JC?h?$IC?I@" # @"??_C@_0CP@EDMGIPKK@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LCHANNEL?$IO?m?$JF?J?$IC?L?$IOw?$JC?h?$IC?I@"
"??_C@_0CP@EDMGIPKK@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LCHANNEL?$IO?m?$JF?J?$IC?L?$IOw?$JC?h?$IC?I@":
	.asciz	"INI\203t\203@\203C\203\213\202\314CHANNEL\216\355\225\312\202\314\216w\222\350\202\311\210\331\217\355\202\252\202\240\202\350\202\334\202\267"

	.section	.rdata,"dr",discard,"??_C@_0DL@BOHJMAOF@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?L?$IDh?$ID?$IJ?$IDC?$IDo?$JC?h?$IL?$GA?$IP?$JB?$IO?$KO?$CIp1@"
	.globl	"??_C@_0DL@BOHJMAOF@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?L?$IDh?$ID?$IJ?$IDC?$IDo?$JC?h?$IL?$GA?$IP?$JB?$IO?$KO?$CIp1@" # @"??_C@_0DL@BOHJMAOF@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?L?$IDh?$ID?$IJ?$IDC?$IDo?$JC?h?$IL?$GA?$IP?$JB?$IO?$KO?$CIp1@"
"??_C@_0DL@BOHJMAOF@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?L?$IDh?$ID?$IJ?$IDC?$IDo?$JC?h?$IL?$GA?$IP?$JB?$IO?$KO?$CIp1@":
	.asciz	"INI\203t\203@\203C\203\213\202\314\203h\203\211\203C\203o\222\350\213`\217\221\216\256(p1:p2:p3:p4)\202\311\210\331\217\355\202\252\202\240\202\350\202\334\202\267"

	.section	.rdata,"dr",discard,"??_C@_0BP@MIKBIDPK@PlcFunc?4RSL?$IC?L?$JD?$OA?$JF?$JE?$IN?$JB?$KC?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@"
	.globl	"??_C@_0BP@MIKBIDPK@PlcFunc?4RSL?$IC?L?$JD?$OA?$JF?$JE?$IN?$JB?$KC?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@" # @"??_C@_0BP@MIKBIDPK@PlcFunc?4RSL?$IC?L?$JD?$OA?$JF?$JE?$IN?$JB?$KC?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@"
"??_C@_0BP@MIKBIDPK@PlcFunc?4RSL?$IC?L?$JD?$OA?$JF?$JE?$IN?$JB?$KC?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@":
	.asciz	"PlcFunc.RSL\202\314\223\340\225\224\215\221\242\202\252\210\331\217\355\202\305\202\267"

	.section	.rdata,"dr",discard,"??_C@_0CA@KFLDDMBA@UserFunc?4RSL?$IC?L?$JD?$OA?$JF?$JE?$IN?$JB?$KC?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@"
	.globl	"??_C@_0CA@KFLDDMBA@UserFunc?4RSL?$IC?L?$JD?$OA?$JF?$JE?$IN?$JB?$KC?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@" # @"??_C@_0CA@KFLDDMBA@UserFunc?4RSL?$IC?L?$JD?$OA?$JF?$JE?$IN?$JB?$KC?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@"
"??_C@_0CA@KFLDDMBA@UserFunc?4RSL?$IC?L?$JD?$OA?$JF?$JE?$IN?$JB?$KC?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@":
	.asciz	"UserFunc.RSL\202\314\223\340\225\224\215\221\242\202\252\210\331\217\355\202\305\202\267"

	.section	.rdata,"dr",discard,"??_C@_0CK@HMADCKDH@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
	.globl	"??_C@_0CK@HMADCKDH@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@" # @"??_C@_0CK@HMADCKDH@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
"??_C@_0CK@HMADCKDH@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@":
	.asciz	"IOdriver.RSL\202\314\203G\203\223\203g\203\212\202\252\210\331\217\355\202\305\202\267(install)"

	.section	.rdata,"dr",discard,"??_C@_0CH@CGLILBMO@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
	.globl	"??_C@_0CH@CGLILBMO@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@" # @"??_C@_0CH@CGLILBMO@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
"??_C@_0CH@CGLILBMO@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@":
	.asciz	"IOdriver.RSL\202\314\203G\203\223\203g\203\212\202\252\210\331\217\355\202\305\202\267(init)"

	.section	.rdata,"dr",discard,"??_C@_0CH@OBOLPJBI@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
	.globl	"??_C@_0CH@OBOLPJBI@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@" # @"??_C@_0CH@OBOLPJBI@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
"??_C@_0CH@OBOLPJBI@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@":
	.asciz	"IOdriver.RSL\202\314\203G\203\223\203g\203\212\202\252\210\331\217\355\202\305\202\267(read)"

	.section	.rdata,"dr",discard,"??_C@_0CI@CMJJJDK@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
	.globl	"??_C@_0CI@CMJJJDK@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@" # @"??_C@_0CI@CMJJJDK@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
"??_C@_0CI@CMJJJDK@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@":
	.asciz	"IOdriver.RSL\202\314\203G\203\223\203g\203\212\202\252\210\331\217\355\202\305\202\267(write)"

	.section	.rdata,"dr",discard,"??_C@_0CH@HEFGOCCO@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
	.globl	"??_C@_0CH@HEFGOCCO@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@" # @"??_C@_0CH@HEFGOCCO@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
"??_C@_0CH@HEFGOCCO@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@":
	.asciz	"IOdriver.RSL\202\314\203G\203\223\203g\203\212\202\252\210\331\217\355\202\305\202\267(open)"

	.section	.rdata,"dr",discard,"??_C@_0CI@LKBDIPBF@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
	.globl	"??_C@_0CI@LKBDIPBF@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@" # @"??_C@_0CI@LKBDIPBF@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
"??_C@_0CI@LKBDIPBF@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@":
	.asciz	"IOdriver.RSL\202\314\203G\203\223\203g\203\212\202\252\210\331\217\355\202\305\202\267(close)"

	.section	.rdata,"dr",discard,"??_C@_0CI@FHIGNEGH@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
	.globl	"??_C@_0CI@FHIGNEGH@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@" # @"??_C@_0CI@FHIGNEGH@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
"??_C@_0CI@FHIGNEGH@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@":
	.asciz	"IOdriver.RSL\202\314\203G\203\223\203g\203\212\202\252\210\331\217\355\202\305\202\267(cntrl)"

	.section	.rdata,"dr",discard,"??_C@_0CH@GOKIONAJ@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
	.globl	"??_C@_0CH@GOKIONAJ@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@" # @"??_C@_0CH@GOKIONAJ@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
"??_C@_0CH@GOKIONAJ@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@":
	.asciz	"IOdriver.RSL\202\314\203G\203\223\203g\203\212\202\252\210\331\217\355\202\305\202\267(info)"

	.section	.rdata,"dr",discard,"??_C@_0CA@GFCJAJMO@IOdriver?4RSL?$IC?L?$JD?$OA?$JF?$JE?$IN?$JB?$KC?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@"
	.globl	"??_C@_0CA@GFCJAJMO@IOdriver?4RSL?$IC?L?$JD?$OA?$JF?$JE?$IN?$JB?$KC?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@" # @"??_C@_0CA@GFCJAJMO@IOdriver?4RSL?$IC?L?$JD?$OA?$JF?$JE?$IN?$JB?$KC?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@"
"??_C@_0CA@GFCJAJMO@IOdriver?4RSL?$IC?L?$JD?$OA?$JF?$JE?$IN?$JB?$KC?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@":
	.asciz	"IOdriver.RSL\202\314\223\340\225\224\215\221\242\202\252\210\331\217\355\202\305\202\267"

	.section	.rdata,"dr",discard,"??_C@_0BP@EKMPGNOO@?$IOw?$JC?h?$IC?LIOdriver?$IC?$KK?$IM?$KJ?$IC?B?$IC?$KJ?$IC?h?$IC?$NM?$IC?$LJ?$IC?q?$AA@"
	.globl	"??_C@_0BP@EKMPGNOO@?$IOw?$JC?h?$IC?LIOdriver?$IC?$KK?$IM?$KJ?$IC?B?$IC?$KJ?$IC?h?$IC?$NM?$IC?$LJ?$IC?q?$AA@" # @"??_C@_0BP@EKMPGNOO@?$IOw?$JC?h?$IC?LIOdriver?$IC?$KK?$IM?$KJ?$IC?B?$IC?$KJ?$IC?h?$IC?$NM?$IC?$LJ?$IC?q?$AA@"
"??_C@_0BP@EKMPGNOO@?$IOw?$JC?h?$IC?LIOdriver?$IC?$KK?$IM?$KJ?$IC?B?$IC?$KJ?$IC?h?$IC?$NM?$IC?$LJ?$IC?q?$AA@":
	.asciz	"\216w\222\350\202\314IOdriver\202\252\214\251\202\302\202\251\202\350\202\334\202\271\202\361"

	.section	.rdata,"dr",discard,"??_C@_0DA@GFDKCEFK@?$IOw?$JC?h?$IC?LIOdriver?$IC?LINSTALL?$IP?$II?$JH?$JN?$IC?$KK?$IDG?$ID@"
	.globl	"??_C@_0DA@GFDKCEFK@?$IOw?$JC?h?$IC?LIOdriver?$IC?LINSTALL?$IP?$II?$JH?$JN?$IC?$KK?$IDG?$ID@" # @"??_C@_0DA@GFDKCEFK@?$IOw?$JC?h?$IC?LIOdriver?$IC?LINSTALL?$IP?$II?$JH?$JN?$IC?$KK?$IDG?$ID@"
"??_C@_0DA@GFDKCEFK@?$IOw?$JC?h?$IC?LIOdriver?$IC?LINSTALL?$IP?$II?$JH?$JN?$IC?$KK?$IDG?$ID@":
	.asciz	"\216w\222\350\202\314IOdriver\202\314INSTALL\217\210\227\235\202\252\203G\203\211\201[\202\360\225\324\202\265\202\334\202\265\202\275"

	.section	.rdata,"dr",discard,"??_C@_0CN@KODNPCKB@?$IOw?$JC?h?$IC?LIOdriver?$IC?LINIT?$IP?$II?$JH?$JN?$IC?$KK?$IDG?$ID?$IJ?$IB?$FL@"
	.globl	"??_C@_0CN@KODNPCKB@?$IOw?$JC?h?$IC?LIOdriver?$IC?LINIT?$IP?$II?$JH?$JN?$IC?$KK?$IDG?$ID?$IJ?$IB?$FL@" # @"??_C@_0CN@KODNPCKB@?$IOw?$JC?h?$IC?LIOdriver?$IC?LINIT?$IP?$II?$JH?$JN?$IC?$KK?$IDG?$ID?$IJ?$IB?$FL@"
"??_C@_0CN@KODNPCKB@?$IOw?$JC?h?$IC?LIOdriver?$IC?LINIT?$IP?$II?$JH?$JN?$IC?$KK?$IDG?$ID?$IJ?$IB?$FL@":
	.asciz	"\216w\222\350\202\314IOdriver\202\314INIT\217\210\227\235\202\252\203G\203\211\201[\202\360\225\324\202\265\202\334\202\265\202\275"

	.section	.rdata,"dr",discard,"??_C@_0CN@GFOCJFCK@?$IOw?$JC?h?$IC?LIOdriver?$IC?LOPEN?$IP?$II?$JH?$JN?$IC?$KK?$IDG?$ID?$IJ?$IB?$FL@"
	.globl	"??_C@_0CN@GFOCJFCK@?$IOw?$JC?h?$IC?LIOdriver?$IC?LOPEN?$IP?$II?$JH?$JN?$IC?$KK?$IDG?$ID?$IJ?$IB?$FL@" # @"??_C@_0CN@GFOCJFCK@?$IOw?$JC?h?$IC?LIOdriver?$IC?LOPEN?$IP?$II?$JH?$JN?$IC?$KK?$IDG?$ID?$IJ?$IB?$FL@"
"??_C@_0CN@GFOCJFCK@?$IOw?$JC?h?$IC?LIOdriver?$IC?LOPEN?$IP?$II?$JH?$JN?$IC?$KK?$IDG?$ID?$IJ?$IB?$FL@":
	.asciz	"\216w\222\350\202\314IOdriver\202\314OPEN\217\210\227\235\202\252\203G\203\211\201[\202\360\225\324\202\265\202\334\202\265\202\275"

	.section	.rdata,"dr",discard,"??_C@_0BI@CCDLBIJJ@?$JFs?$JG?$LO?$IC?HAPI?$ID?$IK?$IDN?$IDG?$IDX?$IDg?$IC?E?$IC?$LH?$AA@"
	.globl	"??_C@_0BI@CCDLBIJJ@?$JFs?$JG?$LO?$IC?HAPI?$ID?$IK?$IDN?$IDG?$IDX?$IDg?$IC?E?$IC?$LH?$AA@" # @"??_C@_0BI@CCDLBIJJ@?$JFs?$JG?$LO?$IC?HAPI?$ID?$IK?$IDN?$IDG?$IDX?$IDg?$IC?E?$IC?$LH?$AA@"
"??_C@_0BI@CCDLBIJJ@?$JFs?$JG?$LO?$IC?HAPI?$ID?$IK?$IDN?$IDG?$IDX?$IDg?$IC?E?$IC?$LH?$AA@":
	.asciz	"\225s\226\276\202\310API\203\212\203N\203G\203X\203g\202\305\202\267"

	.section	.rdata,"dr",discard,"??_C@_0CB@PJAEGJNE@?$IDg?$ID?$IM?$IB?$FL?$IDX?$IDo?$IDb?$IDt?$ID?$EA?$IC?$KK?$ID?$IB?$ID?$IC?$ID?$IK?$JFs?$JB?$KL?$IC?E?$IC?$LH@"
	.globl	"??_C@_0CB@PJAEGJNE@?$IDg?$ID?$IM?$IB?$FL?$IDX?$IDo?$IDb?$IDt?$ID?$EA?$IC?$KK?$ID?$IB?$ID?$IC?$ID?$IK?$JFs?$JB?$KL?$IC?E?$IC?$LH@" # @"??_C@_0CB@PJAEGJNE@?$IDg?$ID?$IM?$IB?$FL?$IDX?$IDo?$IDb?$IDt?$ID?$EA?$IC?$KK?$ID?$IB?$ID?$IC?$ID?$IK?$JFs?$JB?$KL?$IC?E?$IC?$LH@"
"??_C@_0CB@PJAEGJNE@?$IDg?$ID?$IM?$IB?$FL?$IDX?$IDo?$IDb?$IDt?$ID?$EA?$IC?$KK?$ID?$IB?$ID?$IC?$ID?$IK?$JFs?$JB?$KL?$IC?E?$IC?$LH@":
	.asciz	"\203g\203\214\201[\203X\203o\203b\203t\203@\202\252\203\201\203\202\203\212\225s\221\253\202\305\202\267"

	.section	.rdata,"dr",discard,"??_C@_0BL@MNLIDMJL@?$IDX?$ID?$FO?$IDb?$IDN?$JG?$LN?$JH?$NP?$IDI?$IB?$FL?$IDo?$IB?$FL?$IC?$KK?$JE?$KN?$JA?$LG?$AA@"
	.globl	"??_C@_0BL@MNLIDMJL@?$IDX?$ID?$FO?$IDb?$IDN?$JG?$LN?$JH?$NP?$IDI?$IB?$FL?$IDo?$IB?$FL?$IC?$KK?$JE?$KN?$JA?$LG?$AA@" # @"??_C@_0BL@MNLIDMJL@?$IDX?$ID?$FO?$IDb?$IDN?$JG?$LN?$JH?$NP?$IDI?$IB?$FL?$IDo?$IB?$FL?$IC?$KK?$JE?$KN?$JA?$LG?$AA@"
"??_C@_0BL@MNLIDMJL@?$IDX?$ID?$FO?$IDb?$IDN?$JG?$LN?$JH?$NP?$IDI?$IB?$FL?$IDo?$IB?$FL?$IC?$KK?$JE?$KN?$JA?$LG?$AA@":
	.asciz	"\203X\203^\203b\203N\226\275\227\337\203I\201[\203o\201[\202\252\224\255\220\266"

	.section	.rdata,"dr",discard,"??_C@_0BL@KAOGLLDA@?$IDX?$ID?$FO?$IDb?$IDN?$JG?$LN?$JH?$NP?$IDA?$ID?$JD?$ID_?$IB?$FL?$IC?$KK?$JE?$KN?$JA?$LG?$AA@"
	.globl	"??_C@_0BL@KAOGLLDA@?$IDX?$ID?$FO?$IDb?$IDN?$JG?$LN?$JH?$NP?$IDA?$ID?$JD?$ID_?$IB?$FL?$IC?$KK?$JE?$KN?$JA?$LG?$AA@" # @"??_C@_0BL@KAOGLLDA@?$IDX?$ID?$FO?$IDb?$IDN?$JG?$LN?$JH?$NP?$IDA?$ID?$JD?$ID_?$IB?$FL?$IC?$KK?$JE?$KN?$JA?$LG?$AA@"
"??_C@_0BL@KAOGLLDA@?$IDX?$ID?$FO?$IDb?$IDN?$JG?$LN?$JH?$NP?$IDA?$ID?$JD?$ID_?$IB?$FL?$IC?$KK?$JE?$KN?$JA?$LG?$AA@":
	.asciz	"\203X\203^\203b\203N\226\275\227\337\203A\203\223\203_\201[\202\252\224\255\220\266"

	.section	.rdata,"dr",discard,"??_C@_0BD@MNEJHJFO@RT?$ID?$IB?$ID?$IC?$ID?$IK?$JFs?$JB?$KL?$IC?$KK?$JE?$KN?$JA?$LG?$AA@"
	.globl	"??_C@_0BD@MNEJHJFO@RT?$ID?$IB?$ID?$IC?$ID?$IK?$JFs?$JB?$KL?$IC?$KK?$JE?$KN?$JA?$LG?$AA@" # @"??_C@_0BD@MNEJHJFO@RT?$ID?$IB?$ID?$IC?$ID?$IK?$JFs?$JB?$KL?$IC?$KK?$JE?$KN?$JA?$LG?$AA@"
"??_C@_0BD@MNEJHJFO@RT?$ID?$IB?$ID?$IC?$ID?$IK?$JFs?$JB?$KL?$IC?$KK?$JE?$KN?$JA?$LG?$AA@":
	.asciz	"RT\203\201\203\202\203\212\225s\221\253\202\252\224\255\220\266"

	.section	.rdata,"dr",discard,"??_C@_0BN@PGBABNAD@?$ID?$FO?$IDC?$ID?$IA?$IM?$FO?$CIT?$CD?$CJ?$IC?L?$IP?$JB?$IO?$KO?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@"
	.globl	"??_C@_0BN@PGBABNAD@?$ID?$FO?$IDC?$ID?$IA?$IM?$FO?$CIT?$CD?$CJ?$IC?L?$IP?$JB?$IO?$KO?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@" # @"??_C@_0BN@PGBABNAD@?$ID?$FO?$IDC?$ID?$IA?$IM?$FO?$CIT?$CD?$CJ?$IC?L?$IP?$JB?$IO?$KO?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@"
"??_C@_0BN@PGBABNAD@?$ID?$FO?$IDC?$ID?$IA?$IM?$FO?$CIT?$CD?$CJ?$IC?L?$IP?$JB?$IO?$KO?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@":
	.asciz	"\203^\203C\203\200\214^(T#)\202\314\217\221\216\256\202\252\210\331\217\355\202\305\202\267"

	.section	.rdata,"dr",discard,"??_C@_0BH@OLILOBIK@?$IDG?$IDb?$IDW?$ID?$FO?$IDO?$IC?$KK?$JG?$KC?$JDo?$JI?$FO?$IC?E?$IC?$LH?$AA@"
	.globl	"??_C@_0BH@OLILOBIK@?$IDG?$IDb?$IDW?$ID?$FO?$IDO?$IC?$KK?$JG?$KC?$JDo?$JI?$FO?$IC?E?$IC?$LH?$AA@" # @"??_C@_0BH@OLILOBIK@?$IDG?$IDb?$IDW?$ID?$FO?$IDO?$IC?$KK?$JG?$KC?$JDo?$JI?$FO?$IC?E?$IC?$LH?$AA@"
"??_C@_0BH@OLILOBIK@?$IDG?$IDb?$IDW?$ID?$FO?$IDO?$IC?$KK?$JG?$KC?$JDo?$JI?$FO?$IC?E?$IC?$LH?$AA@":
	.asciz	"\203G\203b\203W\203^\203O\202\252\226\242\223o\230^\202\305\202\267"

	.section	.rdata,"dr",discard,"??_C@_0CH@HMNEGHNK@?$IDt?$ID?$EA?$ID?$JD?$IDN?$IDV?$ID?$IH?$ID?$JD?$IDu?$ID?$IN?$IDb?$IDN?$IC?$KK?$IM?$KJ?$IC?B?$IC?$KJ?$IC?h@"
	.globl	"??_C@_0CH@HMNEGHNK@?$IDt?$ID?$EA?$ID?$JD?$IDN?$IDV?$ID?$IH?$ID?$JD?$IDu?$ID?$IN?$IDb?$IDN?$IC?$KK?$IM?$KJ?$IC?B?$IC?$KJ?$IC?h@" # @"??_C@_0CH@HMNEGHNK@?$IDt?$ID?$EA?$ID?$JD?$IDN?$IDV?$ID?$IH?$ID?$JD?$IDu?$ID?$IN?$IDb?$IDN?$IC?$KK?$IM?$KJ?$IC?B?$IC?$KJ?$IC?h@"
"??_C@_0CH@HMNEGHNK@?$IDt?$ID?$EA?$ID?$JD?$IDN?$IDV?$ID?$IH?$ID?$JD?$IDu?$ID?$IN?$IDb?$IDN?$IC?$KK?$IM?$KJ?$IC?B?$IC?$KJ?$IC?h@":
	.asciz	"\203t\203@\203\223\203N\203V\203\207\203\223\203u\203\215\203b\203N\202\252\214\251\202\302\202\251\202\350\202\334\202\271\202\361"

	.section	.rdata,"dr",discard,"??_C@_0CL@MJFJACJO@?$ID?$IG?$IB?$FL?$IDU?$IDt?$ID?$EA?$ID?$JD?$IDN?$IDV?$ID?$IH?$ID?$JD?$IC?L?$JD?$PM?$JH?M?$II?x?$JA?$JE?$IC?$KK@"
	.globl	"??_C@_0CL@MJFJACJO@?$ID?$IG?$IB?$FL?$IDU?$IDt?$ID?$EA?$ID?$JD?$IDN?$IDV?$ID?$IH?$ID?$JD?$IC?L?$JD?$PM?$JH?M?$II?x?$JA?$JE?$IC?$KK@" # @"??_C@_0CL@MJFJACJO@?$ID?$IG?$IB?$FL?$IDU?$IDt?$ID?$EA?$ID?$JD?$IDN?$IDV?$ID?$IH?$ID?$JD?$IC?L?$JD?$PM?$JH?M?$II?x?$JA?$JE?$IC?$KK@"
"??_C@_0CL@MJFJACJO@?$ID?$IG?$IB?$FL?$IDU?$IDt?$ID?$EA?$ID?$JD?$IDN?$IDV?$ID?$IH?$ID?$JD?$IC?L?$JD?$PM?$JH?M?$II?x?$JA?$JE?$IC?$KK@":
	.asciz	"\203\206\201[\203U\203t\203@\203\223\203N\203V\203\207\203\223\202\314\223\374\227\315\210\370\220\224\202\252\226\242\222\350\213`\202\305\202\267"

	.section	.rdata,"dr",discard,"??_C@_0BP@GLFAFHLD@?$JF?$LG?$IO?$JK?$JH?q?$ID?$IK?$IDe?$ID?$IJ?$ID?$IL?$IC?L?$IP?$JB?$IO?$KO?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@"
	.globl	"??_C@_0BP@GLFAFHLD@?$JF?$LG?$IO?$JK?$JH?q?$ID?$IK?$IDe?$ID?$IJ?$ID?$IL?$IC?L?$IP?$JB?$IO?$KO?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@" # @"??_C@_0BP@GLFAFHLD@?$JF?$LG?$IO?$JK?$JH?q?$ID?$IK?$IDe?$ID?$IJ?$ID?$IL?$IC?L?$IP?$JB?$IO?$KO?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@"
"??_C@_0BP@GLFAFHLD@?$JF?$LG?$IO?$JK?$JH?q?$ID?$IK?$IDe?$ID?$IJ?$ID?$IL?$IC?L?$IP?$JB?$IO?$KO?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@":
	.asciz	"\225\266\216\232\227\361\203\212\203e\203\211\203\213\202\314\217\221\216\256\202\252\210\331\217\355\202\305\202\267"

	.section	.rdata,"dr",discard,"??_C@_0CA@HCKACIPG@?$JH?$JG?q?$IM?j?$IC?p?$IOg?$JHp?$IC?$LH?$IC?i?$IC?$LB?$IC?F?$IC?M?$IC?E?$IC?$KL?$IC?$NM?$IC?$LJ?$IC?q?$AA@"
	.globl	"??_C@_0CA@HCKACIPG@?$JH?$JG?q?$IM?j?$IC?p?$IOg?$JHp?$IC?$LH?$IC?i?$IC?$LB?$IC?F?$IC?M?$IC?E?$IC?$KL?$IC?$NM?$IC?$LJ?$IC?q?$AA@" # @"??_C@_0CA@HCKACIPG@?$JH?$JG?q?$IM?j?$IC?p?$IOg?$JHp?$IC?$LH?$IC?i?$IC?$LB?$IC?F?$IC?M?$IC?E?$IC?$KL?$IC?$NM?$IC?$LJ?$IC?q?$AA@"
"??_C@_0CA@HCKACIPG@?$JH?$JG?q?$IM?j?$IC?p?$IOg?$JHp?$IC?$LH?$IC?i?$IC?$LB?$IC?F?$IC?M?$IC?E?$IC?$KL?$IC?$NM?$IC?$LJ?$IC?q?$AA@":
	.asciz	"\227\226\361\214\352\202\360\216g\227p\202\267\202\351\202\261\202\306\202\315\202\305\202\253\202\334\202\271\202\361"

	.section	.rdata,"dr",discard,"??_C@_0BF@PMOIDOIH@?$ID?$IJ?$IDx?$ID?$IL?$IC?$KK?$JB?$LN?$IPd?$JC?h?$IL?$GA?$IC?E?$IC?$LH?$AA@"
	.globl	"??_C@_0BF@PMOIDOIH@?$ID?$IJ?$IDx?$ID?$IL?$IC?$KK?$JB?$LN?$IPd?$JC?h?$IL?$GA?$IC?E?$IC?$LH?$AA@" # @"??_C@_0BF@PMOIDOIH@?$ID?$IJ?$IDx?$ID?$IL?$IC?$KK?$JB?$LN?$IPd?$JC?h?$IL?$GA?$IC?E?$IC?$LH?$AA@"
"??_C@_0BF@PMOIDOIH@?$ID?$IJ?$IDx?$ID?$IL?$IC?$KK?$JB?$LN?$IPd?$JC?h?$IL?$GA?$IC?E?$IC?$LH?$AA@":
	.asciz	"\203\211\203x\203\213\202\252\221\275\217d\222\350\213`\202\305\202\267"

	.section	.rdata,"dr",discard,"??_C@_0CN@GBHBHFMC@?$ID?$IN?$IDW?$IDb?$IDN?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IB?$FL?$ID?$HM?$IDC?$ID?$JD?$IDg?$IC?$KK?$IM?$KJ@"
	.globl	"??_C@_0CN@GBHBHFMC@?$ID?$IN?$IDW?$IDb?$IDN?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IB?$FL?$ID?$HM?$IDC?$ID?$JD?$IDg?$IC?$KK?$IM?$KJ@" # @"??_C@_0CN@GBHBHFMC@?$ID?$IN?$IDW?$IDb?$IDN?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IB?$FL?$ID?$HM?$IDC?$ID?$JD?$IDg?$IC?$KK?$IM?$KJ@"
"??_C@_0CN@GBHBHFMC@?$ID?$IN?$IDW?$IDb?$IDN?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IB?$FL?$ID?$HM?$IDC?$ID?$JD?$IDg?$IC?$KK?$IM?$KJ@":
	.asciz	"\203\215\203W\203b\203N\202\314\203G\203\223\203g\203\212\201[\203|\203C\203\223\203g\202\252\214\251\202\302\202\251\202\350\202\334\202\271\202\361"

	.section	.rdata,"dr",discard,"??_C@_0BO@OBNJEPDA@?$JH?a?$IKO?$IC?I?$IC?f?$IC?hPLC?$IC?$KK?$JC?b?$IO?$HO?$IC?$LD?$IC?j?$IC?$NM?$IC?$LF?$IC?$LN?$AA@"
	.globl	"??_C@_0BO@OBNJEPDA@?$JH?a?$IKO?$IC?I?$IC?f?$IC?hPLC?$IC?$KK?$JC?b?$IO?$HO?$IC?$LD?$IC?j?$IC?$NM?$IC?$LF?$IC?$LN?$AA@" # @"??_C@_0BO@OBNJEPDA@?$JH?a?$IKO?$IC?I?$IC?f?$IC?hPLC?$IC?$KK?$JC?b?$IO?$HO?$IC?$LD?$IC?j?$IC?$NM?$IC?$LF?$IC?$LN?$AA@"
"??_C@_0BO@OBNJEPDA@?$JH?a?$IKO?$IC?I?$IC?f?$IC?hPLC?$IC?$KK?$JC?b?$IO?$HO?$IC?$LD?$IC?j?$IC?$NM?$IC?$LF?$IC?$LN?$AA@":
	.asciz	"\227\341\212O\202\311\202\346\202\350PLC\202\252\222\342\216~\202\263\202\352\202\334\202\265\202\275"

	.data
	.globl	_errormessages                  # @errormessages
	.p2align	2, 0x0
_errormessages:
	.short	0                               # 0x0
	.zero	2
	.long	"??_C@_02GIPFHKNO@OK?$AA@"
	.short	1                               # 0x1
	.zero	2
	.long	"??_C@_0BP@PECHELKI@DIFF?$JG?$LN?$JH?$NP?$IC?$KK?$IP?c?$IM?$MA?$JA?$JE?$IC?p?$JC?$LE?$IC?$KG?$IC?D?$IC?$KC?$IC?$NM?$IC?$LH?$AA@"
	.short	2                               # 0x2
	.zero	2
	.long	"??_C@_0DC@JOIKBPIG@MPS?1MPP?$JG?$LN?$JH?$NP?$JA?$JE?$ID?$HN?$IDb?$ID?$GA?$ID?$JD?$IDO?$CI?$IDX?$ID?$FO?$IDb?$IDN@"
	.short	4                               # 0x4
	.zero	2
	.long	"??_C@_0BP@LEGDNOLK@?$JG?$LN?$JH?$NP?$II?x?$JA?$JE?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@"
	.short	4                               # 0x4
	.zero	2
	.long	"??_C@_0CA@OMOEGCFH@?$JG?$LN?$JH?$NP?$II?x?$JA?$JE1?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@"
	.short	5                               # 0x5
	.zero	2
	.long	"??_C@_0CA@LEPKMLHP@?$JG?$LN?$JH?$NP?$II?x?$JA?$JE2?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@"
	.short	6                               # 0x6
	.zero	2
	.long	"??_C@_0CA@DFNPKOFI@?$JG?$LN?$JH?$NP?$II?x?$JA?$JE3?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@"
	.short	8                               # 0x8
	.zero	2
	.long	"??_C@_0BL@HOHFBNFI@LD?$JG?$LN?$JH?$NP?$JA?$KO?$IN?$IH?$IC?I?$II?Y?$IP?m?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@"
	.short	16                              # 0x10
	.zero	2
	.long	"??_C@_0CA@DHEPJILA@END?$JG?$LN?$JH?$NP?$IC?E?$IPI?$JH?$LJ?$IC?$LH?$IC?i?$JFK?$JHv?$IC?$KK?$IC?$KA?$IC?h?$IC?$NM?$IC?$LH?$AA@"
	.short	32                              # 0x20
	.zero	2
	.long	"??_C@_0CB@CPJGBGMG@?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?L?$JD?G?$IC?$NN?$IN?$JO?$IC?$NN?$IC?I?$IO?$LI?$JEs?$IC?$LF?$IC?$NM?$IC?$LF?$IC?$LN@"
	.short	64                              # 0x40
	.zero	2
	.long	"??_C@_0BL@KPLAJJGP@?$JFs?$JA?$LD?$IC?H?$JF?$LG?$IO?$JK?$JH?q?$IC?p?$IM?$JP?$JCm?$IC?$LF?$IC?$NM?$IC?$LF?$IC?$LN?$AA@"
	.short	128                             # 0x80
	.zero	2
	.long	"??_C@_0BJ@FHCFECBH@?$JFs?$JA?$LD?$IC?H?$JG?$LN?$JH?$NP?$IC?p?$IM?$JP?$JCm?$IC?$LF?$IC?$NM?$IC?$LF?$IC?$LN?$AA@"
	.short	144                             # 0x90
	.zero	2
	.long	"??_C@_0BM@PGNGJEPF@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?$KK?$IM?$KJ?$IC?B?$IC?$KJ?$IC?h?$IC?$NM?$IC?$LJ?$IC?q?$AA@"
	.short	160                             # 0xa0
	.zero	2
	.long	"??_C@_0CN@PFLFACDK@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?ITIMER?$IDZ?$IDN?$IDV?$ID?$IH?$ID?$JD?$IC?$KK?$IM?$KJ@"
	.short	161                             # 0xa1
	.zero	2
	.long	"??_C@_0CN@DNENAMLD@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LTIMER?$JE?T?$IN?$IG?$IC?L?$IOw?$JC?h?$IC?I?$II?Y@"
	.short	162                             # 0xa2
	.zero	2
	.long	"??_C@_0CN@CNLMLIB@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LTIMER?$IO?m?$JF?J?$IC?L?$IOw?$JC?h?$IC?I?$II?Y@"
	.short	163                             # 0xa3
	.zero	2
	.long	"??_C@_0CL@JDAHAPOH@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LTIMER?$JCl?$IC?L?$IOw?$JC?h?$IC?I?$II?Y?$IP?m@"
	.short	176                             # 0xb0
	.zero	2
	.long	"??_C@_0CP@GMLPKJFJ@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?ICNT_INI?$IDZ?$IDN?$IDV?$ID?$IH?$ID?$JD?$IC?$KK@"
	.short	177                             # 0xb1
	.zero	2
	.long	"??_C@_0CP@LDEJBNOH@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LCOUNTER?$JE?T?$IN?$IG?$IC?L?$IOw?$JC?h?$IC?I@"
	.short	178                             # 0xb2
	.zero	2
	.long	"??_C@_0CN@LNJMJHBD@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LCOUNTER?$JCl?$IC?L?$IOw?$JC?h?$IC?I?$II?Y@"
	.short	192                             # 0xc0
	.zero	2
	.long	"??_C@_0CP@BOJENBEE@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?ICHANNEL?$IDZ?$IDN?$IDV?$ID?$IH?$ID?$JD?$IC?$KK@"
	.short	193                             # 0xc1
	.zero	2
	.long	"??_C@_0CP@HMFAEIJI@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LCHANNEL?$JE?T?$IN?$IG?$IC?L?$IOw?$JC?h?$IC?I@"
	.short	194                             # 0xc2
	.zero	2
	.long	"??_C@_0CP@EDMGIPKK@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?LCHANNEL?$IO?m?$JF?J?$IC?L?$IOw?$JC?h?$IC?I@"
	.short	195                             # 0xc3
	.zero	2
	.long	"??_C@_0DL@BOHJMAOF@INI?$IDt?$ID?$EA?$IDC?$ID?$IL?$IC?L?$IDh?$ID?$IJ?$IDC?$IDo?$JC?h?$IL?$GA?$IP?$JB?$IO?$KO?$CIp1@"
	.short	208                             # 0xd0
	.zero	2
	.long	"??_C@_0BP@MIKBIDPK@PlcFunc?4RSL?$IC?L?$JD?$OA?$JF?$JE?$IN?$JB?$KC?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@"
	.short	209                             # 0xd1
	.zero	2
	.long	"??_C@_0CA@KFLDDMBA@UserFunc?4RSL?$IC?L?$JD?$OA?$JF?$JE?$IN?$JB?$KC?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@"
	.short	216                             # 0xd8
	.zero	2
	.long	"??_C@_0CK@HMADCKDH@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
	.short	217                             # 0xd9
	.zero	2
	.long	"??_C@_0CH@CGLILBMO@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
	.short	218                             # 0xda
	.zero	2
	.long	"??_C@_0CH@OBOLPJBI@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
	.short	219                             # 0xdb
	.zero	2
	.long	"??_C@_0CI@CMJJJDK@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
	.short	220                             # 0xdc
	.zero	2
	.long	"??_C@_0CH@HEFGOCCO@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
	.short	221                             # 0xdd
	.zero	2
	.long	"??_C@_0CI@LKBDIPBF@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
	.short	222                             # 0xde
	.zero	2
	.long	"??_C@_0CI@FHIGNEGH@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
	.short	223                             # 0xdf
	.zero	2
	.long	"??_C@_0CH@GOKIONAJ@IOdriver?4RSL?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH@"
	.short	224                             # 0xe0
	.zero	2
	.long	"??_C@_0CA@GFCJAJMO@IOdriver?4RSL?$IC?L?$JD?$OA?$JF?$JE?$IN?$JB?$KC?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@"
	.short	225                             # 0xe1
	.zero	2
	.long	"??_C@_0BP@EKMPGNOO@?$IOw?$JC?h?$IC?LIOdriver?$IC?$KK?$IM?$KJ?$IC?B?$IC?$KJ?$IC?h?$IC?$NM?$IC?$LJ?$IC?q?$AA@"
	.short	226                             # 0xe2
	.zero	2
	.long	"??_C@_0DA@GFDKCEFK@?$IOw?$JC?h?$IC?LIOdriver?$IC?LINSTALL?$IP?$II?$JH?$JN?$IC?$KK?$IDG?$ID@"
	.short	227                             # 0xe3
	.zero	2
	.long	"??_C@_0CN@KODNPCKB@?$IOw?$JC?h?$IC?LIOdriver?$IC?LINIT?$IP?$II?$JH?$JN?$IC?$KK?$IDG?$ID?$IJ?$IB?$FL@"
	.short	228                             # 0xe4
	.zero	2
	.long	"??_C@_0CN@GFOCJFCK@?$IOw?$JC?h?$IC?LIOdriver?$IC?LOPEN?$IP?$II?$JH?$JN?$IC?$KK?$IDG?$ID?$IJ?$IB?$FL@"
	.short	256                             # 0x100
	.zero	2
	.long	"??_C@_0BI@CCDLBIJJ@?$JFs?$JG?$LO?$IC?HAPI?$ID?$IK?$IDN?$IDG?$IDX?$IDg?$IC?E?$IC?$LH?$AA@"
	.short	272                             # 0x110
	.zero	2
	.long	"??_C@_0CB@PJAEGJNE@?$IDg?$ID?$IM?$IB?$FL?$IDX?$IDo?$IDb?$IDt?$ID?$EA?$IC?$KK?$ID?$IB?$ID?$IC?$ID?$IK?$JFs?$JB?$KL?$IC?E?$IC?$LH@"
	.short	288                             # 0x120
	.zero	2
	.long	"??_C@_0BL@MNLIDMJL@?$IDX?$ID?$FO?$IDb?$IDN?$JG?$LN?$JH?$NP?$IDI?$IB?$FL?$IDo?$IB?$FL?$IC?$KK?$JE?$KN?$JA?$LG?$AA@"
	.short	289                             # 0x121
	.zero	2
	.long	"??_C@_0BL@KAOGLLDA@?$IDX?$ID?$FO?$IDb?$IDN?$JG?$LN?$JH?$NP?$IDA?$ID?$JD?$ID_?$IB?$FL?$IC?$KK?$JE?$KN?$JA?$LG?$AA@"
	.short	8192                            # 0x2000
	.zero	2
	.long	"??_C@_0BD@MNEJHJFO@RT?$ID?$IB?$ID?$IC?$ID?$IK?$JFs?$JB?$KL?$IC?$KK?$JE?$KN?$JA?$LG?$AA@"
	.short	8193                            # 0x2001
	.zero	2
	.long	"??_C@_0BN@PGBABNAD@?$ID?$FO?$IDC?$ID?$IA?$IM?$FO?$CIT?$CD?$CJ?$IC?L?$IP?$JB?$IO?$KO?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@"
	.short	8194                            # 0x2002
	.zero	2
	.long	"??_C@_0BH@OLILOBIK@?$IDG?$IDb?$IDW?$ID?$FO?$IDO?$IC?$KK?$JG?$KC?$JDo?$JI?$FO?$IC?E?$IC?$LH?$AA@"
	.short	8195                            # 0x2003
	.zero	2
	.long	"??_C@_0CH@HMNEGHNK@?$IDt?$ID?$EA?$ID?$JD?$IDN?$IDV?$ID?$IH?$ID?$JD?$IDu?$ID?$IN?$IDb?$IDN?$IC?$KK?$IM?$KJ?$IC?B?$IC?$KJ?$IC?h@"
	.short	8196                            # 0x2004
	.zero	2
	.long	"??_C@_0CL@MJFJACJO@?$ID?$IG?$IB?$FL?$IDU?$IDt?$ID?$EA?$ID?$JD?$IDN?$IDV?$ID?$IH?$ID?$JD?$IC?L?$JD?$PM?$JH?M?$II?x?$JA?$JE?$IC?$KK@"
	.short	8197                            # 0x2005
	.zero	2
	.long	"??_C@_0BP@GLFAFHLD@?$JF?$LG?$IO?$JK?$JH?q?$ID?$IK?$IDe?$ID?$IJ?$ID?$IL?$IC?L?$IP?$JB?$IO?$KO?$IC?$KK?$II?Y?$IP?m?$IC?E?$IC?$LH?$AA@"
	.short	129                             # 0x81
	.zero	2
	.long	"??_C@_0CA@HCKACIPG@?$JH?$JG?q?$IM?j?$IC?p?$IOg?$JHp?$IC?$LH?$IC?i?$IC?$LB?$IC?F?$IC?M?$IC?E?$IC?$KL?$IC?$NM?$IC?$LJ?$IC?q?$AA@"
	.short	130                             # 0x82
	.zero	2
	.long	"??_C@_0BF@PMOIDOIH@?$ID?$IJ?$IDx?$ID?$IL?$IC?$KK?$JB?$LN?$IPd?$JC?h?$IL?$GA?$IC?E?$IC?$LH?$AA@"
	.short	131                             # 0x83
	.zero	2
	.long	"??_C@_0CN@GBHBHFMC@?$ID?$IN?$IDW?$IDb?$IDN?$IC?L?$IDG?$ID?$JD?$IDg?$ID?$IK?$IB?$FL?$ID?$HM?$IDC?$ID?$JD?$IDg?$IC?$KK?$IM?$KJ@"
	.short	65518                           # 0xffee
	.zero	2
	.long	"??_C@_0BO@OBNJEPDA@?$JH?a?$IKO?$IC?I?$IC?f?$IC?hPLC?$IC?$KK?$JC?b?$IO?$HO?$IC?$LD?$IC?j?$IC?$NM?$IC?$LF?$IC?$LN?$AA@"

	.section	.rdata,"dr",discard,"??_C@_0N@PIEAMHDF@Errorlog_Add?$AA@"
	.globl	"??_C@_0N@PIEAMHDF@Errorlog_Add?$AA@" # @"??_C@_0N@PIEAMHDF@Errorlog_Add?$AA@"
"??_C@_0N@PIEAMHDF@Errorlog_Add?$AA@":
	.asciz	"Errorlog_Add"

	.section	.rdata,"dr",discard,"??_C@_0O@NIPGCINC@Unknown?5error?$AA@"
	.globl	"??_C@_0O@NIPGCINC@Unknown?5error?$AA@" # @"??_C@_0O@NIPGCINC@Unknown?5error?$AA@"
"??_C@_0O@NIPGCINC@Unknown?5error?$AA@":
	.asciz	"Unknown error"

	.section	.rdata,"dr",discard,"??_C@_0BN@DCLOIMMC@?5?5?$CFs?$CI?$CFd?$CJ?$IB?$EA?3?5ERROR?5?$CFd?5?$CFs?4?5?$CFs?6?$AA@"
	.globl	"??_C@_0BN@DCLOIMMC@?5?5?$CFs?$CI?$CFd?$CJ?$IB?$EA?3?5ERROR?5?$CFd?5?$CFs?4?5?$CFs?6?$AA@" # @"??_C@_0BN@DCLOIMMC@?5?5?$CFs?$CI?$CFd?$CJ?$IB?$EA?3?5ERROR?5?$CFd?5?$CFs?4?5?$CFs?6?$AA@"
"??_C@_0BN@DCLOIMMC@?5?5?$CFs?$CI?$CFd?$CJ?$IB?$EA?3?5ERROR?5?$CFd?5?$CFs?4?5?$CFs?6?$AA@":
	.asciz	"  %s(%d)\201@: ERROR %d %s. %s\n"

	.section	.rdata,"dr",discard,"??_C@_0P@FIPLEFNG@?5?5?$CFd?5Error?$CIs?$CJ?6?$AA@"
	.globl	"??_C@_0P@FIPLEFNG@?5?5?$CFd?5Error?$CIs?$CJ?6?$AA@" # @"??_C@_0P@FIPLEFNG@?5?5?$CFd?5Error?$CIs?$CJ?6?$AA@"
"??_C@_0P@FIPLEFNG@?5?5?$CFd?5Error?$CIs?$CJ?6?$AA@":
	.asciz	"  %d Error(s)\n"

	.section	.rdata,"dr"
L_str.35:                               # @str.35
	.asciz	"ErrorLog list"

	.bss
	.globl	_status_exception               # @status_exception
	.p2align	2, 0x0
_status_exception:
	.long	0                               # 0x0

	.lcomm	_exceptionNOW,1                 # @exceptionNOW
	.globl	_status_funcblock               # @status_funcblock
	.p2align	2, 0x0
_status_funcblock:
	.long	0                               # 0x0

	.globl	_FbList                         # @FbList
	.p2align	2, 0x0
_FbList:
	.long	0

	.globl	_FbBottom                       # @FbBottom
	.p2align	2, 0x0
_FbBottom:
	.long	0

	.section	.rdata,"dr",discard,"??_C@_0BI@KIBLMIFL@Functionblock_Add?3entry?$AA@"
	.globl	"??_C@_0BI@KIBLMIFL@Functionblock_Add?3entry?$AA@" # @"??_C@_0BI@KIBLMIFL@Functionblock_Add?3entry?$AA@"
"??_C@_0BI@KIBLMIFL@Functionblock_Add?3entry?$AA@":
	.asciz	"Functionblock_Add:entry"

	.section	.rdata,"dr",discard,"??_C@_0BH@GMAJPKBL@Functionblock_Add?3name?$AA@"
	.globl	"??_C@_0BH@GMAJPKBL@Functionblock_Add?3name?$AA@" # @"??_C@_0BH@GMAJPKBL@Functionblock_Add?3name?$AA@"
"??_C@_0BH@GMAJPKBL@Functionblock_Add?3name?$AA@":
	.asciz	"Functionblock_Add:name"

	.section	.rdata,"dr",discard,"??_C@_0BL@DLCPKPLN@Functionblock_AddConnector?$AA@"
	.globl	"??_C@_0BL@DLCPKPLN@Functionblock_AddConnector?$AA@" # @"??_C@_0BL@DLCPKPLN@Functionblock_AddConnector?$AA@"
"??_C@_0BL@DLCPKPLN@Functionblock_AddConnector?$AA@":
	.asciz	"Functionblock_AddConnector"

	.lcomm	_hBlockFuncRSL,2,2              # @hBlockFuncRSL
	.section	.rdata,"dr",discard,"??_C@_0P@POEJAJGK@FunctionBlocks?$AA@"
	.globl	"??_C@_0P@POEJAJGK@FunctionBlocks?$AA@" # @"??_C@_0P@POEJAJGK@FunctionBlocks?$AA@"
"??_C@_0P@POEJAJGK@FunctionBlocks?$AA@":
	.asciz	"FunctionBlocks"

	.section	.rdata,"dr",discard,"??_C@_0BC@ENDAEKAI@NumFunctionBlocks?$AA@"
	.globl	"??_C@_0BC@ENDAEKAI@NumFunctionBlocks?$AA@" # @"??_C@_0BC@ENDAEKAI@NumFunctionBlocks?$AA@"
"??_C@_0BC@ENDAEKAI@NumFunctionBlocks?$AA@":
	.asciz	"NumFunctionBlocks"

	.section	.rdata,"dr",discard,"??_C@_0BG@JCCPOPHJ@?5?5FB?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@"
	.globl	"??_C@_0BG@JCCPOPHJ@?5?5FB?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@" # @"??_C@_0BG@JCCPOPHJ@?5?5FB?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@"
"??_C@_0BG@JCCPOPHJ@?5?5FB?$CI?$CF03d?$CJ?5?$CF?914s?5?5?$CFp?6?$AA@":
	.asciz	"  FB(%03d) %-14s  %p\n"

	.section	.rdata,"dr"
L_str.39:                               # @str.39
	.asciz	"Functionblock list"

	.bss
	.globl	_status_heap                    # @status_heap
	.p2align	2, 0x0
_status_heap:
	.long	0                               # 0x0

	.globl	_heaplist                       # @heaplist
	.p2align	2, 0x0
_heaplist:
	.long	0

	.globl	_heapbottom                     # @heapbottom
	.p2align	2, 0x0
_heapbottom:
	.long	0

	.globl	_orderNo                        # @orderNo
	.p2align	2, 0x0
_orderNo:
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_0CI@CHIKLELK@?5?5Heap?$CI?$CF03d?$CJ?5?$CFp?5?5Order?$CD?$CFd?5?$CFd?5byt@"
	.globl	"??_C@_0CI@CHIKLELK@?5?5Heap?$CI?$CF03d?$CJ?5?$CFp?5?5Order?$CD?$CFd?5?$CFd?5byt@" # @"??_C@_0CI@CHIKLELK@?5?5Heap?$CI?$CF03d?$CJ?5?$CFp?5?5Order?$CD?$CFd?5?$CFd?5byt@"
"??_C@_0CI@CHIKLELK@?5?5Heap?$CI?$CF03d?$CJ?5?$CFp?5?5Order?$CD?$CFd?5?$CFd?5byt@":
	.asciz	"  Heap(%03d) %p  Order#%d %d bytes  %s\n"

	.section	.rdata,"dr"
L_str.40:                               # @str.40
	.asciz	"Heap list"

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
	.lcomm	_IniFile_Open.fp,4,4            # @IniFile_Open.fp
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

	.bss
	.globl	_Instruction_UF                 # @Instruction_UF
_Instruction_UF:
	.byte	0                               # 0x0

	.globl	_Instruction_UFB                # @Instruction_UFB
_Instruction_UFB:
	.byte	0                               # 0x0

	.globl	_InstructionCatalog             # @InstructionCatalog
	.p2align	2, 0x0
_InstructionCatalog:
	.zero	262140

	.globl	_stack                          # @stack
_stack:
	.zero	256

	.globl	_stackptr                       # @stackptr
	.p2align	2, 0x0
_stackptr:
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_09FOLKACJL@STACKOVER?$AA@"
	.globl	"??_C@_09FOLKACJL@STACKOVER?$AA@" # @"??_C@_09FOLKACJL@STACKOVER?$AA@"
"??_C@_09FOLKACJL@STACKOVER?$AA@":
	.asciz	"STACKOVER"

	.section	.rdata,"dr",discard,"??_C@_0L@LMAGOADG@STACKUNDER?$AA@"
	.globl	"??_C@_0L@LMAGOADG@STACKUNDER?$AA@" # @"??_C@_0L@LMAGOADG@STACKUNDER?$AA@"
"??_C@_0L@LMAGOADG@STACKUNDER?$AA@":
	.asciz	"STACKUNDER"

	.section	.rdata,"dr",discard,"??_C@_02LDGFHOIO@FU?$AA@"
	.globl	"??_C@_02LDGFHOIO@FU?$AA@"      # @"??_C@_02LDGFHOIO@FU?$AA@"
"??_C@_02LDGFHOIO@FU?$AA@":
	.asciz	"FU"

	.section	.rdata,"dr",discard,"??_C@_02LGOGPKBI@FB?$AA@"
	.globl	"??_C@_02LGOGPKBI@FB?$AA@"      # @"??_C@_02LGOGPKBI@FB?$AA@"
"??_C@_02LGOGPKBI@FB?$AA@":
	.asciz	"FB"

	.section	.rdata,"dr",discard,"??_C@_03GEANJIEE@NOP?$AA@"
	.globl	"??_C@_03GEANJIEE@NOP?$AA@"     # @"??_C@_03GEANJIEE@NOP?$AA@"
"??_C@_03GEANJIEE@NOP?$AA@":
	.asciz	"NOP"

	.section	.rdata,"dr",discard,"??_C@_03BGBAIAPB@LDN?$AA@"
	.globl	"??_C@_03BGBAIAPB@LDN?$AA@"     # @"??_C@_03BGBAIAPB@LDN?$AA@"
"??_C@_03BGBAIAPB@LDN?$AA@":
	.asciz	"LDN"

	.section	.rdata,"dr",discard,"??_C@_03CEMGEEI@STN?$AA@"
	.globl	"??_C@_03CEMGEEI@STN?$AA@"      # @"??_C@_03CEMGEEI@STN?$AA@"
"??_C@_03CEMGEEI@STN?$AA@":
	.asciz	"STN"

	.section	.rdata,"dr",discard,"??_C@_02LONEIP@SN?$AA@"
	.globl	"??_C@_02LONEIP@SN?$AA@"        # @"??_C@_02LONEIP@SN?$AA@"
"??_C@_02LONEIP@SN?$AA@":
	.asciz	"SN"

	.section	.rdata,"dr",discard,"??_C@_01DGKLNCNG@R?$AA@"
	.globl	"??_C@_01DGKLNCNG@R?$AA@"       # @"??_C@_01DGKLNCNG@R?$AA@"
"??_C@_01DGKLNCNG@R?$AA@":
	.asciz	"R"

	.section	.rdata,"dr",discard,"??_C@_02BHMLOLI@RN?$AA@"
	.globl	"??_C@_02BHMLOLI@RN?$AA@"       # @"??_C@_02BHMLOLI@RN?$AA@"
"??_C@_02BHMLOLI@RN?$AA@":
	.asciz	"RN"

	.section	.rdata,"dr",discard,"??_C@_04DOOMBBIC@ANDN?$AA@"
	.globl	"??_C@_04DOOMBBIC@ANDN?$AA@"    # @"??_C@_04DOOMBBIC@ANDN?$AA@"
"??_C@_04DOOMBBIC@ANDN?$AA@":
	.asciz	"ANDN"

	.section	.rdata,"dr",discard,"??_C@_03BMAOPANN@ORN?$AA@"
	.globl	"??_C@_03BMAOPANN@ORN?$AA@"     # @"??_C@_03BMAOPANN@ORN?$AA@"
"??_C@_03BMAOPANN@ORN?$AA@":
	.asciz	"ORN"

	.section	.rdata,"dr",discard,"??_C@_03HKIODAMO@CAL?$AA@"
	.globl	"??_C@_03HKIODAMO@CAL?$AA@"     # @"??_C@_03HKIODAMO@CAL?$AA@"
"??_C@_03HKIODAMO@CAL?$AA@":
	.asciz	"CAL"

	.section	.rdata,"dr",discard,"??_C@_04KHPCHNEB@CALC?$AA@"
	.globl	"??_C@_04KHPCHNEB@CALC?$AA@"    # @"??_C@_04KHPCHNEB@CALC?$AA@"
"??_C@_04KHPCHNEB@CALC?$AA@":
	.asciz	"CALC"

	.section	.rdata,"dr",discard,"??_C@_05GPIGOBPA@CALCN?$AA@"
	.globl	"??_C@_05GPIGOBPA@CALCN?$AA@"   # @"??_C@_05GPIGOBPA@CALCN?$AA@"
"??_C@_05GPIGOBPA@CALCN?$AA@":
	.asciz	"CALCN"

	.section	.rdata,"dr",discard,"??_C@_04GHCFKGOM@RETC?$AA@"
	.globl	"??_C@_04GHCFKGOM@RETC?$AA@"    # @"??_C@_04GHCFKGOM@RETC?$AA@"
"??_C@_04GHCFKGOM@RETC?$AA@":
	.asciz	"RETC"

	.section	.rdata,"dr",discard,"??_C@_05MHCBOJHO@RETCN?$AA@"
	.globl	"??_C@_05MHCBOJHO@RETCN?$AA@"   # @"??_C@_05MHCBOJHO@RETCN?$AA@"
"??_C@_05MHCBOJHO@RETCN?$AA@":
	.asciz	"RETCN"

	.section	.rdata,"dr",discard,"??_C@_02NFEPAFND@EQ?$AA@"
	.globl	"??_C@_02NFEPAFND@EQ?$AA@"      # @"??_C@_02NFEPAFND@EQ?$AA@"
"??_C@_02NFEPAFND@EQ?$AA@":
	.asciz	"EQ"

	.data
	.globl	_InstructionTemplate            # @InstructionTemplate
_InstructionTemplate:
	.long	"??_C@_03MJAIKILM@VAR?$AA@"
	.short	1                               # 0x1
	.byte	1                               # 0x1
	.short	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_VAR
	.short	0                               # 0x0
	.long	"??_C@_02LDGFHOIO@FU?$AA@"
	.short	2                               # 0x2
	.byte	1                               # 0x1
	.short	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_FU
	.short	0                               # 0x0
	.long	"??_C@_02LGOGPKBI@FB?$AA@"
	.short	3                               # 0x3
	.byte	1                               # 0x1
	.short	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_FB
	.short	0                               # 0x0
	.long	"??_C@_03JBLDIHBA@UFU?$AA@"
	.short	2                               # 0x2
	.byte	1                               # 0x1
	.short	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_Logic_RunPOU
	.short	0                               # 0x0
	.long	"??_C@_05EILEDKCG@LABEL?$AA@"
	.short	4                               # 0x4
	.byte	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_LABEL
	.short	0                               # 0x0
	.long	"??_C@_03GEANJIEE@NOP?$AA@"
	.short	0                               # 0x0
	.byte	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_NOP
	.short	0                               # 0x0
	.long	"??_C@_02ONCLNIEI@LD?$AA@"
	.short	5                               # 0x5
	.byte	0                               # 0x0
	.short	32769                           # 0x8001
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_LD
	.short	0                               # 0x0
	.long	"??_C@_03BGBAIAPB@LDN?$AA@"
	.short	7                               # 0x7
	.byte	0                               # 0x0
	.short	32769                           # 0x8001
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_LDN
	.short	0                               # 0x0
	.long	"??_C@_02LAJDCOFE@ST?$AA@"
	.short	9                               # 0x9
	.byte	0                               # 0x0
	.short	32769                           # 0x8001
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_ST
	.short	0                               # 0x0
	.long	"??_C@_03CEMGEEI@STN?$AA@"
	.short	11                              # 0xb
	.byte	0                               # 0x0
	.short	32769                           # 0x8001
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_STN
	.short	0                               # 0x0
	.long	"??_C@_01CPLAODJH@S?$AA@"
	.short	13                              # 0xd
	.byte	0                               # 0x0
	.short	1536                            # 0x600
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_S
	.short	0                               # 0x0
	.long	"??_C@_02LONEIP@SN?$AA@"
	.short	14                              # 0xe
	.byte	0                               # 0x0
	.short	1536                            # 0x600
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_SN
	.short	0                               # 0x0
	.long	"??_C@_01DGKLNCNG@R?$AA@"
	.short	15                              # 0xf
	.byte	0                               # 0x0
	.short	1536                            # 0x600
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_R
	.short	0                               # 0x0
	.long	"??_C@_02BHMLOLI@RN?$AA@"
	.short	16                              # 0x10
	.byte	0                               # 0x0
	.short	1536                            # 0x600
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_RN
	.short	0                               # 0x0
	.long	"??_C@_03BDACDFHA@AND?$AA@"
	.short	17                              # 0x11
	.byte	0                               # 0x0
	.short	1536                            # 0x600
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_AND
	.short	0                               # 0x0
	.long	"??_C@_04DOOMBBIC@ANDN?$AA@"
	.short	19                              # 0x13
	.byte	0                               # 0x0
	.short	1536                            # 0x600
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_ANDN
	.short	0                               # 0x0
	.long	"??_C@_02PDPFNDMG@OR?$AA@"
	.short	21                              # 0x15
	.byte	0                               # 0x0
	.short	1536                            # 0x600
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_OR
	.short	0                               # 0x0
	.long	"??_C@_03BMAOPANN@ORN?$AA@"
	.short	23                              # 0x17
	.byte	0                               # 0x0
	.short	1536                            # 0x600
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_ORN
	.short	0                               # 0x0
	.long	"??_C@_03HKIODAMO@CAL?$AA@"
	.short	32                              # 0x20
	.byte	0                               # 0x0
	.short	32774                           # 0x8006
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_CAL
	.short	0                               # 0x0
	.long	"??_C@_04KHPCHNEB@CALC?$AA@"
	.short	33                              # 0x21
	.byte	0                               # 0x0
	.short	32774                           # 0x8006
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_CALC
	.short	0                               # 0x0
	.long	"??_C@_05GPIGOBPA@CALCN?$AA@"
	.short	34                              # 0x22
	.byte	0                               # 0x0
	.short	32774                           # 0x8006
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_CALCN
	.short	0                               # 0x0
	.long	"??_C@_03BHDJDALB@RET?$AA@"
	.short	35                              # 0x23
	.byte	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_RET
	.short	0                               # 0x0
	.long	"??_C@_04GHCFKGOM@RETC?$AA@"
	.short	36                              # 0x24
	.byte	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_RETC
	.short	0                               # 0x0
	.long	"??_C@_05MHCBOJHO@RETCN?$AA@"
	.short	37                              # 0x25
	.byte	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_RETCN
	.short	0                               # 0x0
	.long	"??_C@_03GBFNEA@NOT?$AA@"
	.short	38                              # 0x26
	.byte	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_NOT
	.short	0                               # 0x0
	.long	"??_C@_02NFEPAFND@EQ?$AA@"
	.short	38                              # 0x26
	.byte	0                               # 0x0
	.short	32769                           # 0x8001
	.short	32769                           # 0x8001
	.short	0                               # 0x0
	.long	_EQ
	.short	0                               # 0x0
	.long	"??_C@_03JMGAKCCH@END?$AA@"
	.short	39                              # 0x27
	.byte	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.short	0                               # 0x0
	.long	_END
	.short	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@"
	.globl	"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@" # @"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@"
"??_C@_0CJ@GAGLDBKC@instruction?5hash?5conflict?$CB?5?$CFs?4?5s@":
	.asciz	"instruction hash conflict! %s. skipped.\n"

	.bss
	.globl	_status_label                   # @status_label
	.p2align	2, 0x0
_status_label:
	.long	0                               # 0x0

	.globl	_plcLabel                       # @plcLabel
	.p2align	2, 0x0
_plcLabel:
	.long	0

	.globl	_plcLabelBottom                 # @plcLabelBottom
	.p2align	2, 0x0
_plcLabelBottom:
	.long	0

	.globl	_LabelCatalog                   # @LabelCatalog
	.p2align	2, 0x0
_LabelCatalog:
	.zero	16380

	.section	.rdata,"dr",discard,"??_C@_09DADJEEPI@Label_Add?$AA@"
	.globl	"??_C@_09DADJEEPI@Label_Add?$AA@" # @"??_C@_09DADJEEPI@Label_Add?$AA@"
"??_C@_09DADJEEPI@Label_Add?$AA@":
	.asciz	"Label_Add"

	.section	.rdata,"dr",discard,"??_C@_0BE@DBGJIEJN@Label_Add?3labelname?$AA@"
	.globl	"??_C@_0BE@DBGJIEJN@Label_Add?3labelname?$AA@" # @"??_C@_0BE@DBGJIEJN@Label_Add?3labelname?$AA@"
"??_C@_0BE@DBGJIEJN@Label_Add?3labelname?$AA@":
	.asciz	"Label_Add:labelname"

	.section	.rdata,"dr",discard,"??_C@_0CD@PBMEOOHM@label?5hash?5conflict?$CB?5?$CFs?4?5skipped@"
	.globl	"??_C@_0CD@PBMEOOHM@label?5hash?5conflict?$CB?5?$CFs?4?5skipped@" # @"??_C@_0CD@PBMEOOHM@label?5hash?5conflict?$CB?5?$CFs?4?5skipped@"
"??_C@_0CD@PBMEOOHM@label?5hash?5conflict?$CB?5?$CFs?4?5skipped@":
	.asciz	"label hash conflict! %s. skipped.\n"

	.section	.rdata,"dr",discard,"??_C@_0BI@HABOLDNE@?5?5label?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?6?$AA@"
	.globl	"??_C@_0BI@HABOLDNE@?5?5label?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?6?$AA@" # @"??_C@_0BI@HABOLDNE@?5?5label?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?6?$AA@"
"??_C@_0BI@HABOLDNE@?5?5label?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?6?$AA@":
	.asciz	"  label(%03d) %14s  %p\n"

	.section	.rdata,"dr"
L_str.86:                               # @str.86
	.asciz	"Label list"

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

	.bss
	.globl	_plcLogic                       # @plcLogic
	.p2align	2, 0x0
_plcLogic:
	.long	0

	.globl	_plcLogicBottom                 # @plcLogicBottom
	.p2align	2, 0x0
_plcLogicBottom:
	.long	0

	.globl	_plcentrypoint                  # @plcentrypoint
	.p2align	2, 0x0
_plcentrypoint:
	.long	0

	.globl	_plcbeginpoint                  # @plcbeginpoint
	.p2align	2, 0x0
_plcbeginpoint:
	.long	0

	.globl	_plcfinalpoint                  # @plcfinalpoint
	.p2align	2, 0x0
_plcfinalpoint:
	.long	0

	.globl	_RUNplcLogic                    # @RUNplcLogic
	.p2align	2, 0x0
_RUNplcLogic:
	.long	0

	.globl	_RUNplcentrypoint               # @RUNplcentrypoint
	.p2align	2, 0x0
_RUNplcentrypoint:
	.long	0

	.globl	_RUNplcbeginpoint               # @RUNplcbeginpoint
	.p2align	2, 0x0
_RUNplcbeginpoint:
	.long	0

	.globl	_RUNplcfinalpoint               # @RUNplcfinalpoint
	.p2align	2, 0x0
_RUNplcfinalpoint:
	.long	0

	.section	.rdata,"dr",discard,"??_C@_09IGONEJKP@Logic_Add?$AA@"
	.globl	"??_C@_09IGONEJKP@Logic_Add?$AA@" # @"??_C@_09IGONEJKP@Logic_Add?$AA@"
"??_C@_09IGONEJKP@Logic_Add?$AA@":
	.asciz	"Logic_Add"

	.section	.rdata,"dr",discard,"??_C@_0CF@BIIKPHMI@?5?5line?$CI?$CF03d?$CJ?5?$CFp?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5@"
	.globl	"??_C@_0CF@BIIKPHMI@?5?5line?$CI?$CF03d?$CJ?5?$CFp?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5@" # @"??_C@_0CF@BIIKPHMI@?5?5line?$CI?$CF03d?$CJ?5?$CFp?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5@"
"??_C@_0CF@BIIKPHMI@?5?5line?$CI?$CF03d?$CJ?5?$CFp?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5@":
	.asciz	"  line(%03d) %p %14s  %p %p %p   %p\n"

	.section	.rdata,"dr",discard,"??_C@_0BE@CKMLNBAF@?5?5entry?5point?3?5?5?$CFp?6?$AA@"
	.globl	"??_C@_0BE@CKMLNBAF@?5?5entry?5point?3?5?5?$CFp?6?$AA@" # @"??_C@_0BE@CKMLNBAF@?5?5entry?5point?3?5?5?$CFp?6?$AA@"
"??_C@_0BE@CKMLNBAF@?5?5entry?5point?3?5?5?$CFp?6?$AA@":
	.asciz	"  entry point:  %p\n"

	.section	.rdata,"dr",discard,"??_C@_0HM@OIDHGGKG@?$CDinclude?5?$DMPLCINST?4h?$DO?6int?5main?$CIin@"
	.globl	"??_C@_0HM@OIDHGGKG@?$CDinclude?5?$DMPLCINST?4h?$DO?6int?5main?$CIin@" # @"??_C@_0HM@OIDHGGKG@?$CDinclude?5?$DMPLCINST?4h?$DO?6int?5main?$CIin@"
"??_C@_0HM@OIDHGGKG@?$CDinclude?5?$DMPLCINST?4h?$DO?6int?5main?$CIin@":
	.asciz	"#include <PLCINST.h>\nint main(int argc, char* argv[])\n{\n\treturn plcmain(argc, argv);\n}\nvoid seq_control(void)\n{\n\tBYTE\ta=0;\n"

	.section	.rdata,"dr",discard,"??_C@_0BI@JHDIMNMC@?7a?$DN?$CFs?$CI?5a?5?0?$CFp?0?5?$CFp?0?5?$CFp?$CJ?$DL?6?$AA@"
	.globl	"??_C@_0BI@JHDIMNMC@?7a?$DN?$CFs?$CI?5a?5?0?$CFp?0?5?$CFp?0?5?$CFp?$CJ?$DL?6?$AA@" # @"??_C@_0BI@JHDIMNMC@?7a?$DN?$CFs?$CI?5a?5?0?$CFp?0?5?$CFp?0?5?$CFp?$CJ?$DL?6?$AA@"
"??_C@_0BI@JHDIMNMC@?7a?$DN?$CFs?$CI?5a?5?0?$CFp?0?5?$CFp?0?5?$CFp?$CJ?$DL?6?$AA@":
	.asciz	"\ta=%s( a ,%p, %p, %p);\n"

	.section	.rdata,"dr",discard,"??_C@_02KGHIDFGE@?$HN?6?$AA@"
	.globl	"??_C@_02KGHIDFGE@?$HN?6?$AA@"  # @"??_C@_02KGHIDFGE@?$HN?6?$AA@"
"??_C@_02KGHIDFGE@?$HN?6?$AA@":
	.asciz	"}\n"

	.section	.rdata,"dr",discard,"??_C@_0CI@IHKJGMPN@?5?5line?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5?5?$CF0@"
	.globl	"??_C@_0CI@IHKJGMPN@?5?5line?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5?5?$CF0@" # @"??_C@_0CI@IHKJGMPN@?5?5line?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5?5?$CF0@"
"??_C@_0CI@IHKJGMPN@?5?5line?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?5?$CFp?5?$CFp?5?5?5?$CF0@":
	.asciz	"  line(%03d) %14s  %p %p %p   %016I64x\n"

	.section	.rdata,"dr"
L_str.88:                               # @str.88
	.asciz	"Logic list"

L_str.1.89:                             # @str.1.89
	.asciz	"Logic entrypoint"

L_str.4:                                # @str.4
	.asciz	"Logic Disasm"

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

	.data
_PADDING:                               # @PADDING
	.byte	128                             # 0x80
	.zero	63

	.lcomm	_MnmFile_Open.fp,4,4            # @MnmFile_Open.fp
	.section	.rdata,"dr",discard,"??_C@_02BMJICGCB@rt?$AA@"
	.globl	"??_C@_02BMJICGCB@rt?$AA@"      # @"??_C@_02BMJICGCB@rt?$AA@"
"??_C@_02BMJICGCB@rt?$AA@":
	.asciz	"rt"

	.section	.rdata,"dr",discard,"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@"
	.globl	"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@" # @"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@"
"??_C@_04DNCNJDPH@?5?7?6?$AN?$AA@":
	.asciz	" \t\n\r"

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

	.section	.rdata,"dr",discard,"??_C@_06OAFNIPMP@SQSUSP?$AA@"
	.globl	"??_C@_06OAFNIPMP@SQSUSP?$AA@"  # @"??_C@_06OAFNIPMP@SQSUSP?$AA@"
"??_C@_06OAFNIPMP@SQSUSP?$AA@":
	.asciz	"SQSUSP"

	.bss
	.globl	_status_pou                     # @status_pou
	.p2align	2, 0x0
_status_pou:
	.long	0                               # 0x0

	.globl	_poulist                        # @poulist
	.p2align	2, 0x0
_poulist:
	.long	0

	.globl	_pouBottom                      # @pouBottom
	.p2align	2, 0x0
_pouBottom:
	.long	0

	.globl	_poubegin                       # @poubegin
	.p2align	2, 0x0
_poubegin:
	.long	0

	.globl	_poufinal                       # @poufinal
	.p2align	2, 0x0
_poufinal:
	.long	0

	.section	.rdata,"dr",discard,"??_C@_0M@EIELBOGF@Poufile_Add?$AA@"
	.globl	"??_C@_0M@EIELBOGF@Poufile_Add?$AA@" # @"??_C@_0M@EIELBOGF@Poufile_Add?$AA@"
"??_C@_0M@EIELBOGF@Poufile_Add?$AA@":
	.asciz	"Poufile_Add"

	.section	.rdata,"dr",discard,"??_C@_0BF@NFHFPGMN@Poufile_Add?3filepath?$AA@"
	.globl	"??_C@_0BF@NFHFPGMN@Poufile_Add?3filepath?$AA@" # @"??_C@_0BF@NFHFPGMN@Poufile_Add?3filepath?$AA@"
"??_C@_0BF@NFHFPGMN@Poufile_Add?3filepath?$AA@":
	.asciz	"Poufile_Add:filepath"

	.section	.rdata,"dr",discard,"??_C@_0BE@CDIPEEK@?5?5POUfile?$CI?$CF03d?$CJ?5?$CFs?6?$AA@"
	.globl	"??_C@_0BE@CDIPEEK@?5?5POUfile?$CI?$CF03d?$CJ?5?$CFs?6?$AA@" # @"??_C@_0BE@CDIPEEK@?5?5POUfile?$CI?$CF03d?$CJ?5?$CFs?6?$AA@"
"??_C@_0BE@CDIPEEK@?5?5POUfile?$CI?$CF03d?$CJ?5?$CFs?6?$AA@":
	.asciz	"  POUfile(%03d) %s\n"

	.bss
	.globl	_pouenum                        # @pouenum
	.p2align	2, 0x0
_pouenum:
	.long	0

	.section	.rdata,"dr",discard,"??_C@_0BC@CBLIHDML@Poufile_Set_Begin?$AA@"
	.globl	"??_C@_0BC@CBLIHDML@Poufile_Set_Begin?$AA@" # @"??_C@_0BC@CBLIHDML@Poufile_Set_Begin?$AA@"
"??_C@_0BC@CBLIHDML@Poufile_Set_Begin?$AA@":
	.asciz	"Poufile_Set_Begin"

	.section	.rdata,"dr",discard,"??_C@_0BL@MIJAGEAP@Poufile_Set_Begin?3filepath?$AA@"
	.globl	"??_C@_0BL@MIJAGEAP@Poufile_Set_Begin?3filepath?$AA@" # @"??_C@_0BL@MIJAGEAP@Poufile_Set_Begin?3filepath?$AA@"
"??_C@_0BL@MIJAGEAP@Poufile_Set_Begin?3filepath?$AA@":
	.asciz	"Poufile_Set_Begin:filepath"

	.section	.rdata,"dr",discard,"??_C@_0BC@DOPEKAGM@Poufile_Set_Final?$AA@"
	.globl	"??_C@_0BC@DOPEKAGM@Poufile_Set_Final?$AA@" # @"??_C@_0BC@DOPEKAGM@Poufile_Set_Final?$AA@"
"??_C@_0BC@DOPEKAGM@Poufile_Set_Final?$AA@":
	.asciz	"Poufile_Set_Final"

	.section	.rdata,"dr",discard,"??_C@_0BL@LBOMFFJG@Poufile_Set_Final?3filepath?$AA@"
	.globl	"??_C@_0BL@LBOMFFJG@Poufile_Set_Final?3filepath?$AA@" # @"??_C@_0BL@LBOMFFJG@Poufile_Set_Final?3filepath?$AA@"
"??_C@_0BL@LBOMFFJG@Poufile_Set_Final?3filepath?$AA@":
	.asciz	"Poufile_Set_Final:filepath"

	.section	.rdata,"dr"
L_str.128:                              # @str.128
	.asciz	"POU file list"

	.section	.rdata,"dr",discard,"??_C@_0BH@GBGNGJD@Project_Load?3ufuncname?$AA@"
	.globl	"??_C@_0BH@GBGNGJD@Project_Load?3ufuncname?$AA@" # @"??_C@_0BH@GBGNGJD@Project_Load?3ufuncname?$AA@"
"??_C@_0BH@GBGNGJD@Project_Load?3ufuncname?$AA@":
	.asciz	"Project_Load:ufuncname"

	.section	.rdata,"dr",discard,"??_C@_0CF@BCBIENMJ@Project_Loadinstructiontemplatee@"
	.globl	"??_C@_0CF@BCBIENMJ@Project_Loadinstructiontemplatee@" # @"??_C@_0CF@BCBIENMJ@Project_Loadinstructiontemplatee@"
"??_C@_0CF@BCBIENMJ@Project_Loadinstructiontemplatee@":
	.asciz	"Project_Loadinstructiontemplateentry"

	.section	.rdata,"dr",discard,"??_C@_05ILMMJGEC@BEGIN?$AA@"
	.globl	"??_C@_05ILMMJGEC@BEGIN?$AA@"   # @"??_C@_05ILMMJGEC@BEGIN?$AA@"
"??_C@_05ILMMJGEC@BEGIN?$AA@":
	.asciz	"BEGIN"

	.section	.rdata,"dr",discard,"??_C@_05JEIAEFOF@FINAL?$AA@"
	.globl	"??_C@_05JEIAEFOF@FINAL?$AA@"   # @"??_C@_05JEIAEFOF@FINAL?$AA@"
"??_C@_05JEIAEFOF@FINAL?$AA@":
	.asciz	"FINAL"

	.section	.rdata,"dr",discard,"??_C@_08KGEIBGG@Priority?$AA@"
	.globl	"??_C@_08KGEIBGG@Priority?$AA@" # @"??_C@_08KGEIBGG@Priority?$AA@"
"??_C@_08KGEIBGG@Priority?$AA@":
	.asciz	"Priority"

	.section	.rdata,"dr",discard,"??_C@_08KDKDEPAG@Interval?$AA@"
	.globl	"??_C@_08KDKDEPAG@Interval?$AA@" # @"??_C@_08KDKDEPAG@Interval?$AA@"
"??_C@_08KDKDEPAG@Interval?$AA@":
	.asciz	"Interval"

	.section	.rdata,"dr",discard,"??_C@_07HGGLMJDG@PouMain?$AA@"
	.globl	"??_C@_07HGGLMJDG@PouMain?$AA@" # @"??_C@_07HGGLMJDG@PouMain?$AA@"
"??_C@_07HGGLMJDG@PouMain?$AA@":
	.asciz	"PouMain"

	.section	.rdata,"dr",discard,"??_C@_03EHFCOOP@Pou?$AA@"
	.globl	"??_C@_03EHFCOOP@Pou?$AA@"      # @"??_C@_03EHFCOOP@Pou?$AA@"
"??_C@_03EHFCOOP@Pou?$AA@":
	.asciz	"Pou"

	.section	.rdata,"dr",discard,"??_C@_08NFPEMNNK@PouBegin?$AA@"
	.globl	"??_C@_08NFPEMNNK@PouBegin?$AA@" # @"??_C@_08NFPEMNNK@PouBegin?$AA@"
"??_C@_08NFPEMNNK@PouBegin?$AA@":
	.asciz	"PouBegin"

	.section	.rdata,"dr",discard,"??_C@_08MKLIBOHN@PouFinal?$AA@"
	.globl	"??_C@_08MKLIBOHN@PouFinal?$AA@" # @"??_C@_08MKLIBOHN@PouFinal?$AA@"
"??_C@_08MKLIBOHN@PouFinal?$AA@":
	.asciz	"PouFinal"

	.section	.rdata,"dr",discard,"??_C@_07BLJMJFEM@NoPrint?$AA@"
	.globl	"??_C@_07BLJMJFEM@NoPrint?$AA@" # @"??_C@_07BLJMJFEM@NoPrint?$AA@"
"??_C@_07BLJMJFEM@NoPrint?$AA@":
	.asciz	"NoPrint"

	.section	.rdata,"dr",discard,"??_C@_06MHHFENDB@Remote?$AA@"
	.globl	"??_C@_06MHHFENDB@Remote?$AA@"  # @"??_C@_06MHHFENDB@Remote?$AA@"
"??_C@_06MHHFENDB@Remote?$AA@":
	.asciz	"Remote"

	.section	.rdata,"dr",discard,"??_C@_04MDBAPKAP@Step?$AA@"
	.globl	"??_C@_04MDBAPKAP@Step?$AA@"    # @"??_C@_04MDBAPKAP@Step?$AA@"
"??_C@_04MDBAPKAP@Step?$AA@":
	.asciz	"Step"

	.section	.rdata,"dr",discard,"??_C@_08LMAOLDEH@Scanfreq?$AA@"
	.globl	"??_C@_08LMAOLDEH@Scanfreq?$AA@" # @"??_C@_08LMAOLDEH@Scanfreq?$AA@"
"??_C@_08LMAOLDEH@Scanfreq?$AA@":
	.asciz	"Scanfreq"

	.section	.rdata,"dr",discard,"??_C@_0L@INEEGANB@RetainInst?$AA@"
	.globl	"??_C@_0L@INEEGANB@RetainInst?$AA@" # @"??_C@_0L@INEEGANB@RetainInst?$AA@"
"??_C@_0L@INEEGANB@RetainInst?$AA@":
	.asciz	"RetainInst"

	.section	.rdata,"dr",discard,"??_C@_0N@COHPKCOK@EgRetain_001?$AA@"
	.globl	"??_C@_0N@COHPKCOK@EgRetain_001?$AA@" # @"??_C@_0N@COHPKCOK@EgRetain_001?$AA@"
"??_C@_0N@COHPKCOK@EgRetain_001?$AA@":
	.asciz	"EgRetain_001"

	.data
	.globl	_property                       # @property
	.p2align	2, 0x0
_property:
	.long	"??_C@_08KGEIBGG@Priority?$AA@"
	.long	7                               # 0x7
	.long	140                             # 0x8c
	.byte	0                               # 0x0
	.long	_Property_Process_Priority
	.long	0
	.long	0
	.long	0
	.long	"??_C@_08KDKDEPAG@Interval?$AA@"
	.long	7                               # 0x7
	.long	1                               # 0x1
	.byte	0                               # 0x0
	.long	_Property_Process_Nop
	.long	0
	.long	0
	.long	0
	.long	"??_C@_07HGGLMJDG@PouMain?$AA@"
	.long	12                              # 0xc
	.long	"??_C@_00CNPNBAHC@?$AA@"
	.byte	0                               # 0x0
	.long	_Property_Process_Intprt
	.long	0
	.long	0
	.long	0
	.long	"??_C@_03EHFCOOP@Pou?$AA@"
	.long	12                              # 0xc
	.long	"??_C@_00CNPNBAHC@?$AA@"
	.byte	0                               # 0x0
	.long	_Property_Process_Pou
	.long	0
	.long	0
	.long	0
	.long	"??_C@_08NFPEMNNK@PouBegin?$AA@"
	.long	12                              # 0xc
	.long	"??_C@_00CNPNBAHC@?$AA@"
	.byte	0                               # 0x0
	.long	_Property_Process_PouBegin
	.long	0
	.long	0
	.long	0
	.long	"??_C@_08MKLIBOHN@PouFinal?$AA@"
	.long	12                              # 0xc
	.long	"??_C@_00CNPNBAHC@?$AA@"
	.byte	0                               # 0x0
	.long	_Property_Process_PouFinal
	.long	0
	.long	0
	.long	0
	.long	"??_C@_07BLJMJFEM@NoPrint?$AA@"
	.long	1                               # 0x1
	.zero	4
	.byte	0                               # 0x0
	.long	_Property_Process_NoPrint
	.long	0
	.long	0
	.long	0
	.long	"??_C@_06MHHFENDB@Remote?$AA@"
	.long	1                               # 0x1
	.zero	4
	.byte	0                               # 0x0
	.long	_Property_Process_Remote
	.long	0
	.long	0
	.long	0
	.long	"??_C@_04MDBAPKAP@Step?$AA@"
	.long	1                               # 0x1
	.zero	4
	.byte	0                               # 0x0
	.long	_Property_Process_Step
	.long	0
	.long	0
	.long	0
	.long	"??_C@_08LMAOLDEH@Scanfreq?$AA@"
	.long	7                               # 0x7
	.long	1000                            # 0x3e8
	.byte	0                               # 0x0
	.long	_Property_Process_Scanrate
	.long	0
	.long	0
	.long	0
	.long	"??_C@_0L@INEEGANB@RetainInst?$AA@"
	.long	12                              # 0xc
	.long	"??_C@_0N@COHPKCOK@EgRetain_001?$AA@"
	.byte	0                               # 0x0
	.long	_Property_Process_Retain
	.long	0
	.long	0
	.long	0
	.zero	29

	.section	.rdata,"dr",discard,"??_C@_07ICCLJJJJ@AutoRun?$AA@"
	.globl	"??_C@_07ICCLJJJJ@AutoRun?$AA@" # @"??_C@_07ICCLJJJJ@AutoRun?$AA@"
"??_C@_07ICCLJJJJ@AutoRun?$AA@":
	.asciz	"AutoRun"

	.section	.rdata,"dr",discard,"??_C@_03MJAIKILM@VAR?$AA@"
	.globl	"??_C@_03MJAIKILM@VAR?$AA@"     # @"??_C@_03MJAIKILM@VAR?$AA@"
"??_C@_03MJAIKILM@VAR?$AA@":
	.asciz	"VAR"

	.section	.rdata,"dr",discard,"??_C@_07NGKNHKAE@END_VAR?$AA@"
	.globl	"??_C@_07NGKNHKAE@END_VAR?$AA@" # @"??_C@_07NGKNHKAE@END_VAR?$AA@"
"??_C@_07NGKNHKAE@END_VAR?$AA@":
	.asciz	"END_VAR"

	.section	.rdata,"dr",discard,"??_C@_04PPJDIBFE@BOOL?$AA@"
	.globl	"??_C@_04PPJDIBFE@BOOL?$AA@"    # @"??_C@_04PPJDIBFE@BOOL?$AA@"
"??_C@_04PPJDIBFE@BOOL?$AA@":
	.asciz	"BOOL"

	.section	.rdata,"dr",discard,"??_C@_04ELFAHOMP@BYTE?$AA@"
	.globl	"??_C@_04ELFAHOMP@BYTE?$AA@"    # @"??_C@_04ELFAHOMP@BYTE?$AA@"
"??_C@_04ELFAHOMP@BYTE?$AA@":
	.asciz	"BYTE"

	.section	.rdata,"dr",discard,"??_C@_03JMHEAPMO@INT?$AA@"
	.globl	"??_C@_03JMHEAPMO@INT?$AA@"     # @"??_C@_03JMHEAPMO@INT?$AA@"
"??_C@_03JMHEAPMO@INT?$AA@":
	.asciz	"INT"

	.section	.rdata,"dr",discard,"??_C@_04PKFANLLI@REAL?$AA@"
	.globl	"??_C@_04PKFANLLI@REAL?$AA@"    # @"??_C@_04PKFANLLI@REAL?$AA@"
"??_C@_04PKFANLLI@REAL?$AA@":
	.asciz	"REAL"

	.section	.rdata,"dr",discard,"??_C@_04OHBONDIN@TIME?$AA@"
	.globl	"??_C@_04OHBONDIN@TIME?$AA@"    # @"??_C@_04OHBONDIN@TIME?$AA@"
"??_C@_04OHBONDIN@TIME?$AA@":
	.asciz	"TIME"

	.section	.rdata,"dr",discard,"??_C@_06IGECGLFO@STRING?$AA@"
	.globl	"??_C@_06IGECGLFO@STRING?$AA@"  # @"??_C@_06IGECGLFO@STRING?$AA@"
"??_C@_06IGECGLFO@STRING?$AA@":
	.asciz	"STRING"

	.section	.rdata,"dr",discard,"??_C@_02NJNGHICB@IF?$AA@"
	.globl	"??_C@_02NJNGHICB@IF?$AA@"      # @"??_C@_02NJNGHICB@IF?$AA@"
"??_C@_02NJNGHICB@IF?$AA@":
	.asciz	"IF"

	.section	.rdata,"dr",discard,"??_C@_04LCEFDMJL@THEN?$AA@"
	.globl	"??_C@_04LCEFDMJL@THEN?$AA@"    # @"??_C@_04LCEFDMJL@THEN?$AA@"
"??_C@_04LCEFDMJL@THEN?$AA@":
	.asciz	"THEN"

	.section	.rdata,"dr",discard,"??_C@_04JLPIBDPH@ELSE?$AA@"
	.globl	"??_C@_04JLPIBDPH@ELSE?$AA@"    # @"??_C@_04JLPIBDPH@ELSE?$AA@"
"??_C@_04JLPIBDPH@ELSE?$AA@":
	.asciz	"ELSE"

	.section	.rdata,"dr",discard,"??_C@_04OGNCDOIK@CASE?$AA@"
	.globl	"??_C@_04OGNCDOIK@CASE?$AA@"    # @"??_C@_04OGNCDOIK@CASE?$AA@"
"??_C@_04OGNCDOIK@CASE?$AA@":
	.asciz	"CASE"

	.section	.rdata,"dr",discard,"??_C@_02NNFLAEJD@OF?$AA@"
	.globl	"??_C@_02NNFLAEJD@OF?$AA@"      # @"??_C@_02NNFLAEJD@OF?$AA@"
"??_C@_02NNFLAEJD@OF?$AA@":
	.asciz	"OF"

	.section	.rdata,"dr",discard,"??_C@_03JDIPNCCJ@FOR?$AA@"
	.globl	"??_C@_03JDIPNCCJ@FOR?$AA@"     # @"??_C@_03JDIPNCCJ@FOR?$AA@"
"??_C@_03JDIPNCCJ@FOR?$AA@":
	.asciz	"FOR"

	.section	.rdata,"dr",discard,"??_C@_02BMOKPDEL@TO?$AA@"
	.globl	"??_C@_02BMOKPDEL@TO?$AA@"      # @"??_C@_02BMOKPDEL@TO?$AA@"
"??_C@_02BMOKPDEL@TO?$AA@":
	.asciz	"TO"

	.section	.rdata,"dr",discard,"??_C@_02MMFADL@DO?$AA@"
	.globl	"??_C@_02MMFADL@DO?$AA@"        # @"??_C@_02MMFADL@DO?$AA@"
"??_C@_02MMFADL@DO?$AA@":
	.asciz	"DO"

	.section	.rdata,"dr",discard,"??_C@_04MOOLDHHD@STEP?$AA@"
	.globl	"??_C@_04MOOLDHHD@STEP?$AA@"    # @"??_C@_04MOOLDHHD@STEP?$AA@"
"??_C@_04MOOLDHHD@STEP?$AA@":
	.asciz	"STEP"

	.section	.rdata,"dr",discard,"??_C@_05CFKHKNMI@WHILE?$AA@"
	.globl	"??_C@_05CFKHKNMI@WHILE?$AA@"   # @"??_C@_05CFKHKNMI@WHILE?$AA@"
"??_C@_05CFKHKNMI@WHILE?$AA@":
	.asciz	"WHILE"

	.section	.rdata,"dr",discard,"??_C@_06LCBKFLKD@REPEAT?$AA@"
	.globl	"??_C@_06LCBKFLKD@REPEAT?$AA@"  # @"??_C@_06LCBKFLKD@REPEAT?$AA@"
"??_C@_06LCBKFLKD@REPEAT?$AA@":
	.asciz	"REPEAT"

	.section	.rdata,"dr",discard,"??_C@_05JCFFAPID@UNTIL?$AA@"
	.globl	"??_C@_05JCFFAPID@UNTIL?$AA@"   # @"??_C@_05JCFFAPID@UNTIL?$AA@"
"??_C@_05JCFFAPID@UNTIL?$AA@":
	.asciz	"UNTIL"

	.section	.rdata,"dr",discard,"??_C@_03BDACDFHA@AND?$AA@"
	.globl	"??_C@_03BDACDFHA@AND?$AA@"     # @"??_C@_03BDACDFHA@AND?$AA@"
"??_C@_03BDACDFHA@AND?$AA@":
	.asciz	"AND"

	.section	.rdata,"dr",discard,"??_C@_02PDPFNDMG@OR?$AA@"
	.globl	"??_C@_02PDPFNDMG@OR?$AA@"      # @"??_C@_02PDPFNDMG@OR?$AA@"
"??_C@_02PDPFNDMG@OR?$AA@":
	.asciz	"OR"

	.section	.rdata,"dr",discard,"??_C@_03CDEJPCIF@XOR?$AA@"
	.globl	"??_C@_03CDEJPCIF@XOR?$AA@"     # @"??_C@_03CDEJPCIF@XOR?$AA@"
"??_C@_03CDEJPCIF@XOR?$AA@":
	.asciz	"XOR"

	.section	.rdata,"dr",discard,"??_C@_03GBFNEA@NOT?$AA@"
	.globl	"??_C@_03GBFNEA@NOT?$AA@"       # @"??_C@_03GBFNEA@NOT?$AA@"
"??_C@_03GBFNEA@NOT?$AA@":
	.asciz	"NOT"

	.section	.rdata,"dr",discard,"??_C@_06LJMOENAO@RETURN?$AA@"
	.globl	"??_C@_06LJMOENAO@RETURN?$AA@"  # @"??_C@_06LJMOENAO@RETURN?$AA@"
"??_C@_06LJMOENAO@RETURN?$AA@":
	.asciz	"RETURN"

	.section	.rdata,"dr",discard,"??_C@_07DKOHAGLI@PROGRAM?$AA@"
	.globl	"??_C@_07DKOHAGLI@PROGRAM?$AA@" # @"??_C@_07DKOHAGLI@PROGRAM?$AA@"
"??_C@_07DKOHAGLI@PROGRAM?$AA@":
	.asciz	"PROGRAM"

	.section	.rdata,"dr",discard,"??_C@_0M@DCFEMEMK@END_PROGRAM?$AA@"
	.globl	"??_C@_0M@DCFEMEMK@END_PROGRAM?$AA@" # @"??_C@_0M@DCFEMEMK@END_PROGRAM?$AA@"
"??_C@_0M@DCFEMEMK@END_PROGRAM?$AA@":
	.asciz	"END_PROGRAM"

	.section	.rdata,"dr",discard,"??_C@_08KPDMMFC@FUNCTION?$AA@"
	.globl	"??_C@_08KPDMMFC@FUNCTION?$AA@" # @"??_C@_08KPDMMFC@FUNCTION?$AA@"
"??_C@_08KPDMMFC@FUNCTION?$AA@":
	.asciz	"FUNCTION"

	.section	.rdata,"dr",discard,"??_C@_0N@LEPAGPIA@END_FUNCTION?$AA@"
	.globl	"??_C@_0N@LEPAGPIA@END_FUNCTION?$AA@" # @"??_C@_0N@LEPAGPIA@END_FUNCTION?$AA@"
"??_C@_0N@LEPAGPIA@END_FUNCTION?$AA@":
	.asciz	"END_FUNCTION"

	.data
	.globl	_reservedwords                  # @reservedwords
	.p2align	2, 0x0
_reservedwords:
	.long	"??_C@_03MJAIKILM@VAR?$AA@"
	.long	"??_C@_07NGKNHKAE@END_VAR?$AA@"
	.long	"??_C@_04PPJDIBFE@BOOL?$AA@"
	.long	"??_C@_04ELFAHOMP@BYTE?$AA@"
	.long	"??_C@_03JMHEAPMO@INT?$AA@"
	.long	"??_C@_04PKFANLLI@REAL?$AA@"
	.long	"??_C@_04OHBONDIN@TIME?$AA@"
	.long	"??_C@_06IGECGLFO@STRING?$AA@"
	.long	"??_C@_02NJNGHICB@IF?$AA@"
	.long	"??_C@_04LCEFDMJL@THEN?$AA@"
	.long	"??_C@_04JLPIBDPH@ELSE?$AA@"
	.long	"??_C@_04OGNCDOIK@CASE?$AA@"
	.long	"??_C@_02NNFLAEJD@OF?$AA@"
	.long	"??_C@_03JDIPNCCJ@FOR?$AA@"
	.long	"??_C@_02BMOKPDEL@TO?$AA@"
	.long	"??_C@_02MMFADL@DO?$AA@"
	.long	"??_C@_04MOOLDHHD@STEP?$AA@"
	.long	"??_C@_05CFKHKNMI@WHILE?$AA@"
	.long	"??_C@_06LCBKFLKD@REPEAT?$AA@"
	.long	"??_C@_05JCFFAPID@UNTIL?$AA@"
	.long	"??_C@_03BDACDFHA@AND?$AA@"
	.long	"??_C@_02PDPFNDMG@OR?$AA@"
	.long	"??_C@_03CDEJPCIF@XOR?$AA@"
	.long	"??_C@_03GBFNEA@NOT?$AA@"
	.long	"??_C@_06LJMOENAO@RETURN?$AA@"
	.long	"??_C@_07DKOHAGLI@PROGRAM?$AA@"
	.long	"??_C@_0M@DCFEMEMK@END_PROGRAM?$AA@"
	.long	"??_C@_08KPDMMFC@FUNCTION?$AA@"
	.long	"??_C@_0N@LEPAGPIA@END_FUNCTION?$AA@"

	.bss
	.globl	_ReservedwordCatalog            # @ReservedwordCatalog
_ReservedwordCatalog:
	.zero	1530

	.section	.rdata,"dr",discard,"??_C@_0CK@FHKDIDKH@reservedword?5hash?5conflict?$CB?5?$CFs?4?5@"
	.globl	"??_C@_0CK@FHKDIDKH@reservedword?5hash?5conflict?$CB?5?$CFs?4?5@" # @"??_C@_0CK@FHKDIDKH@reservedword?5hash?5conflict?$CB?5?$CFs?4?5@"
"??_C@_0CK@FHKDIDKH@reservedword?5hash?5conflict?$CB?5?$CFs?4?5@":
	.asciz	"reservedword hash conflict! %s. skipped.\n"

	.section	.rdata,"dr",discard,"??_C@_0BA@FBAMOBLD@SERVICE?4?$CFs?4Save?$AA@"
	.globl	"??_C@_0BA@FBAMOBLD@SERVICE?4?$CFs?4Save?$AA@" # @"??_C@_0BA@FBAMOBLD@SERVICE?4?$CFs?4Save?$AA@"
"??_C@_0BA@FBAMOBLD@SERVICE?4?$CFs?4Save?$AA@":
	.asciz	"SERVICE.%s.Save"

	.lcomm	__Retain_Save,128               # @_Retain_Save
	.section	.rdata,"dr",discard,"??_C@_0BA@FDBBBCGH@SERVICE?4?$CFs?4Load?$AA@"
	.globl	"??_C@_0BA@FDBBBCGH@SERVICE?4?$CFs?4Load?$AA@" # @"??_C@_0BA@FDBBBCGH@SERVICE?4?$CFs?4Load?$AA@"
"??_C@_0BA@FDBBBCGH@SERVICE?4?$CFs?4Load?$AA@":
	.asciz	"SERVICE.%s.Load"

	.lcomm	__Retain_Load,128               # @_Retain_Load
	.lcomm	_Retain_Load_Request.loadordernumber,4,4 # @Retain_Load_Request.loadordernumber
	.lcomm	_Retain_Save_Request.saveordernumber,4,4 # @Retain_Save_Request.saveordernumber
	.section	.rdata,"dr",discard,"??_C@_0CG@DCLCJKIA@Rtedge_TagCreate?3zero?5clear?5temp@"
	.globl	"??_C@_0CG@DCLCJKIA@Rtedge_TagCreate?3zero?5clear?5temp@" # @"??_C@_0CG@DCLCJKIA@Rtedge_TagCreate?3zero?5clear?5temp@"
"??_C@_0CG@DCLCJKIA@Rtedge_TagCreate?3zero?5clear?5temp@":
	.asciz	"Rtedge_TagCreate:zero clear temporary"

	.section	.rdata,"dr",discard,"??_C@_0CO@JPBCBDJ@Rtedge_TagCreateByInstruction?3cl@"
	.globl	"??_C@_0CO@JPBCBDJ@Rtedge_TagCreateByInstruction?3cl@" # @"??_C@_0CO@JPBCBDJ@Rtedge_TagCreateByInstruction?3cl@"
"??_C@_0CO@JPBCBDJ@Rtedge_TagCreateByInstruction?3cl@":
	.asciz	"Rtedge_TagCreateByInstruction:clone temporary"

	.section	.rdata,"dr",discard,"??_C@_04KOACHJEN@Type?$AA@"
	.globl	"??_C@_04KOACHJEN@Type?$AA@"    # @"??_C@_04KOACHJEN@Type?$AA@"
"??_C@_04KOACHJEN@Type?$AA@":
	.asciz	"Type"

	.lcomm	_Rtedge_TagGetIecType.source,600 # @Rtedge_TagGetIecType.source
	.section	.rdata,"dr",discard,"??_C@_06CLBDIDBH@Source?$AA@"
	.globl	"??_C@_06CLBDIDBH@Source?$AA@"  # @"??_C@_06CLBDIDBH@Source?$AA@"
"??_C@_06CLBDIDBH@Source?$AA@":
	.asciz	"Source"

	.section	.rdata,"dr",discard,"??_C@_05HKHPEFOF@Entry?$AA@"
	.globl	"??_C@_05HKHPEFOF@Entry?$AA@"   # @"??_C@_05HKHPEFOF@Entry?$AA@"
"??_C@_05HKHPEFOF@Entry?$AA@":
	.asciz	"Entry"

	.lcomm	_Rtedge_GetStructureName.name,600 # @Rtedge_GetStructureName.name
	.section	.rdata,"dr"
L___const.Rtedge_GetStructureName.tag1: # @__const.Rtedge_GetStructureName.tag1
	.asciz	"STRUCT#"

L___const.Rtedge_GetStructureName.tag2: # @__const.Rtedge_GetStructureName.tag2
	.asciz	"FUNCTION#"

	.lcomm	_Rtedge_GetArrayName.name,600   # @Rtedge_GetArrayName.name
L___const.Rtedge_GetArrayName.tag:      # @__const.Rtedge_GetArrayName.tag
	.asciz	"ARRAY#"

	.bss
	.globl	_scope                          # @scope
_scope:
	.zero	128

	.globl	_scopedvariable                 # @scopedvariable
_scopedvariable:
	.zero	128

	.globl	_hSQTBLmem                      # @hSQTBLmem
	.p2align	1, 0x0
_hSQTBLmem:
	.short	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_05KKOJADCM@SQTBL?$AA@"
	.globl	"??_C@_05KKOJADCM@SQTBL?$AA@"   # @"??_C@_05KKOJADCM@SQTBL?$AA@"
"??_C@_05KKOJADCM@SQTBL?$AA@":
	.asciz	"SQTBL"

	.section	.rdata,"dr",discard,"??_C@_06OPMGJGJF@SCRIPT?$AA@"
	.globl	"??_C@_06OPMGJGJF@SCRIPT?$AA@"  # @"??_C@_06OPMGJGJF@SCRIPT?$AA@"
"??_C@_06OPMGJGJF@SCRIPT?$AA@":
	.asciz	"SCRIPT"

	.section	.rdata,"dr",discard,"??_C@_0BA@EIHPONHL@VER?405_00_00_00?$AA@"
	.globl	"??_C@_0BA@EIHPONHL@VER?405_00_00_00?$AA@" # @"??_C@_0BA@EIHPONHL@VER?405_00_00_00?$AA@"
"??_C@_0BA@EIHPONHL@VER?405_00_00_00?$AA@":
	.asciz	"VER.05_00_00_00"

	.bss
	.globl	_hStepSem                       # @hStepSem
	.p2align	1, 0x0
_hStepSem:
	.short	0                               # 0x0

	.globl	_sqtbl                          # @sqtbl
	.p2align	2, 0x0
_sqtbl:
	.long	0

	.section	.rdata,"dr",discard,"??_C@_06EAEKDHGI@SQSTEP?$AA@"
	.globl	"??_C@_06EAEKDHGI@SQSTEP?$AA@"  # @"??_C@_06EAEKDHGI@SQSTEP?$AA@"
"??_C@_06EAEKDHGI@SQSTEP?$AA@":
	.asciz	"SQSTEP"

	.bss
	.globl	_status_string                  # @status_string
	.p2align	2, 0x0
_status_string:
	.long	0                               # 0x0

	.globl	_status_structure               # @status_structure
	.p2align	2, 0x0
_status_structure:
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_0BJ@EJLMNAHD@structure?5tag?5not?5found?4?$AA@"
	.globl	"??_C@_0BJ@EJLMNAHD@structure?5tag?5not?5found?4?$AA@" # @"??_C@_0BJ@EJLMNAHD@structure?5tag?5not?5found?4?$AA@"
"??_C@_0BJ@EJLMNAHD@structure?5tag?5not?5found?4?$AA@":
	.asciz	"structure tag not found."

	.section	.rdata,"dr",discard,"??_C@_0CC@PMKPPOMH@Structure_CreateCatalog?3D_ANY?5pi@"
	.globl	"??_C@_0CC@PMKPPOMH@Structure_CreateCatalog?3D_ANY?5pi@" # @"??_C@_0CC@PMKPPOMH@Structure_CreateCatalog?3D_ANY?5pi@"
"??_C@_0CC@PMKPPOMH@Structure_CreateCatalog?3D_ANY?5pi@":
	.asciz	"Structure_CreateCatalog:D_ANY pin"

	.section	.rdata,"dr",discard,"??_C@_0CJ@OILNIPDE@Structure_CreateCatalog?3D_ANY?5pi@"
	.globl	"??_C@_0CJ@OILNIPDE@Structure_CreateCatalog?3D_ANY?5pi@" # @"??_C@_0CJ@OILNIPDE@Structure_CreateCatalog?3D_ANY?5pi@"
"??_C@_0CJ@OILNIPDE@Structure_CreateCatalog?3D_ANY?5pi@":
	.asciz	"Structure_CreateCatalog:D_ANY pin (body)"

	.section	.rdata,"dr",discard,"??_C@_07DFGIDBBA@Control?$AA@"
	.globl	"??_C@_07DFGIDBBA@Control?$AA@" # @"??_C@_07DFGIDBBA@Control?$AA@"
"??_C@_07DFGIDBBA@Control?$AA@":
	.asciz	"Control"

	.data
	.globl	_trigger                        # @trigger
_trigger:
	.long	"??_C@_07DFGIDBBA@Control?$AA@"
	.long	7                               # 0x7
	.zero	4
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.long	0
	.long	0
	.long	0
	.long	0
	.zero	30

	.section	.rdata,"dr",discard,"??_C@_04FIMCAEDB@Trig?$AA@"
	.globl	"??_C@_04FIMCAEDB@Trig?$AA@"    # @"??_C@_04FIMCAEDB@Trig?$AA@"
"??_C@_04FIMCAEDB@Trig?$AA@":
	.asciz	"Trig"

	.section	.rdata,"dr",discard,"??_C@_04MDHMLCKF@STOP?$AA@"
	.globl	"??_C@_04MDHMLCKF@STOP?$AA@"    # @"??_C@_04MDHMLCKF@STOP?$AA@"
"??_C@_04MDHMLCKF@STOP?$AA@":
	.asciz	"STOP"

	.section	.rdata,"dr",discard,"??_C@_00CNPNBAHC@?$AA@"
	.globl	"??_C@_00CNPNBAHC@?$AA@"        # @"??_C@_00CNPNBAHC@?$AA@"
"??_C@_00CNPNBAHC@?$AA@":
	.zero	1

	.section	.rdata,"dr",discard,"??_C@_05KACKNMMA@READY?$AA@"
	.globl	"??_C@_05KACKNMMA@READY?$AA@"   # @"??_C@_05KACKNMMA@READY?$AA@"
"??_C@_05KACKNMMA@READY?$AA@":
	.asciz	"READY"

	.section	.rdata,"dr",discard,"??_C@_04DBNKAKHO@WAIT?$AA@"
	.globl	"??_C@_04DBNKAKHO@WAIT?$AA@"    # @"??_C@_04DBNKAKHO@WAIT?$AA@"
"??_C@_04DBNKAKHO@WAIT?$AA@":
	.asciz	"WAIT"

	.section	.rdata,"dr",discard,"??_C@_03LLDCGJBK@RUN?$AA@"
	.globl	"??_C@_03LLDCGJBK@RUN?$AA@"     # @"??_C@_03LLDCGJBK@RUN?$AA@"
"??_C@_03LLDCGJBK@RUN?$AA@":
	.asciz	"RUN"

	.section	.rdata,"dr",discard,"??_C@_04NFKBMIMG@HALT?$AA@"
	.globl	"??_C@_04NFKBMIMG@HALT?$AA@"    # @"??_C@_04NFKBMIMG@HALT?$AA@"
"??_C@_04NFKBMIMG@HALT?$AA@":
	.asciz	"HALT"

	.section	.rdata,"dr"
	.p2align	2, 0x0                          # @__const.Status_Topic.topic
L___const.Status_Topic.topic:
	.long	"??_C@_04MDHMLCKF@STOP?$AA@"
	.long	"??_C@_00CNPNBAHC@?$AA@"
	.long	"??_C@_05KACKNMMA@READY?$AA@"
	.long	"??_C@_00CNPNBAHC@?$AA@"
	.long	"??_C@_04DBNKAKHO@WAIT?$AA@"
	.long	"??_C@_00CNPNBAHC@?$AA@"
	.long	"??_C@_03LLDCGJBK@RUN?$AA@"
	.long	"??_C@_00CNPNBAHC@?$AA@"
	.long	"??_C@_04NFKBMIMG@HALT?$AA@"

	.bss
	.globl	_status_errorlog                # @status_errorlog
	.p2align	2, 0x0
_status_errorlog:
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_0O@PIFKHJEH@errorlog?5list?$AA@"
	.globl	"??_C@_0O@PIFKHJEH@errorlog?5list?$AA@" # @"??_C@_0O@PIFKHJEH@errorlog?5list?$AA@"
"??_C@_0O@PIFKHJEH@errorlog?5list?$AA@":
	.asciz	"errorlog list"

	.section	.rdata,"dr",discard,"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	.globl	"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@" # @"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@":
	.asciz	"  %-20s ... %s \n"

	.bss
	.globl	_status_logic                   # @status_logic
	.p2align	2, 0x0
_status_logic:
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_0L@KDAGFJJM@logic?5list?$AA@"
	.globl	"??_C@_0L@KDAGFJJM@logic?5list?$AA@" # @"??_C@_0L@KDAGFJJM@logic?5list?$AA@"
"??_C@_0L@KDAGFJJM@logic?5list?$AA@":
	.asciz	"logic list"

	.bss
	.globl	_status_inifile                 # @status_inifile
	.p2align	2, 0x0
_status_inifile:
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_0BA@JNEKCDIC@inifile?5feature?$AA@"
	.globl	"??_C@_0BA@JNEKCDIC@inifile?5feature?$AA@" # @"??_C@_0BA@JNEKCDIC@inifile?5feature?$AA@"
"??_C@_0BA@JNEKCDIC@inifile?5feature?$AA@":
	.asciz	"inifile feature"

	.bss
	.globl	_status_mnmfile                 # @status_mnmfile
	.p2align	2, 0x0
_status_mnmfile:
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_0BA@FANHOABO@mnmfile?5feature?$AA@"
	.globl	"??_C@_0BA@FANHOABO@mnmfile?5feature?$AA@" # @"??_C@_0BA@FANHOABO@mnmfile?5feature?$AA@"
"??_C@_0BA@FANHOABO@mnmfile?5feature?$AA@":
	.asciz	"mnmfile feature"

	.data
	.globl	_status_internalclock           # @status_internalclock
	.p2align	2, 0x0
_status_internalclock:
	.long	2                               # 0x2

	.section	.rdata,"dr",discard,"??_C@_0O@LFCAOOJB@internalclock?$AA@"
	.globl	"??_C@_0O@LFCAOOJB@internalclock?$AA@" # @"??_C@_0O@LFCAOOJB@internalclock?$AA@"
"??_C@_0O@LFCAOOJB@internalclock?$AA@":
	.asciz	"internalclock"

	.bss
	.globl	_status_engine                  # @status_engine
	.p2align	2, 0x0
_status_engine:
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_0P@HMNLIEBD@engine?5feature?$AA@"
	.globl	"??_C@_0P@HMNLIEBD@engine?5feature?$AA@" # @"??_C@_0P@HMNLIEBD@engine?5feature?$AA@"
"??_C@_0P@HMNLIEBD@engine?5feature?$AA@":
	.asciz	"engine feature"

	.data
	.globl	_status_bluescreen              # @status_bluescreen
	.p2align	2, 0x0
_status_bluescreen:
	.long	2                               # 0x2

	.section	.rdata,"dr",discard,"??_C@_0BD@OAIJAOHP@bluescreen?5feature?$AA@"
	.globl	"??_C@_0BD@OAIJAOHP@bluescreen?5feature?$AA@" # @"??_C@_0BD@OAIJAOHP@bluescreen?5feature?$AA@"
"??_C@_0BD@OAIJAOHP@bluescreen?5feature?$AA@":
	.asciz	"bluescreen feature"

	.bss
	.globl	_status_instruction             # @status_instruction
	.p2align	2, 0x0
_status_instruction:
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_0BE@CDDLLKOB@instruction?5feature?$AA@"
	.globl	"??_C@_0BE@CDDLLKOB@instruction?5feature?$AA@" # @"??_C@_0BE@CDDLLKOB@instruction?5feature?$AA@"
"??_C@_0BE@CDDLLKOB@instruction?5feature?$AA@":
	.asciz	"instruction feature"

	.bss
	.globl	_status_pause                   # @status_pause
	.p2align	2, 0x0
_status_pause:
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_0O@GKLGJKNL@pause?5feature?$AA@"
	.globl	"??_C@_0O@GKLGJKNL@pause?5feature?$AA@" # @"??_C@_0O@GKLGJKNL@pause?5feature?$AA@"
"??_C@_0O@GKLGJKNL@pause?5feature?$AA@":
	.asciz	"pause feature"

	.bss
	.globl	_status_step                    # @status_step
	.p2align	2, 0x0
_status_step:
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_0N@JGCMANAB@step?5feature?$AA@"
	.globl	"??_C@_0N@JGCMANAB@step?5feature?$AA@" # @"??_C@_0N@JGCMANAB@step?5feature?$AA@"
"??_C@_0N@JGCMANAB@step?5feature?$AA@":
	.asciz	"step feature"

	.bss
	.globl	_status_watchdog                # @status_watchdog
	.p2align	2, 0x0
_status_watchdog:
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_0BB@IHCPDHLN@watchdog?5feature?$AA@"
	.globl	"??_C@_0BB@IHCPDHLN@watchdog?5feature?$AA@" # @"??_C@_0BB@IHCPDHLN@watchdog?5feature?$AA@"
"??_C@_0BB@IHCPDHLN@watchdog?5feature?$AA@":
	.asciz	"watchdog feature"

	.bss
	.globl	_status_api                     # @status_api
	.p2align	2, 0x0
_status_api:
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_0M@HFBCMFOB@api?5feature?$AA@"
	.globl	"??_C@_0M@HFBCMFOB@api?5feature?$AA@" # @"??_C@_0M@HFBCMFOB@api?5feature?$AA@"
"??_C@_0M@HFBCMFOB@api?5feature?$AA@":
	.asciz	"api feature"

	.bss
	.globl	_status_plccontrol              # @status_plccontrol
	.p2align	2, 0x0
_status_plccontrol:
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_0BC@JAJMGGA@plc?5control?5state?$AA@"
	.globl	"??_C@_0BC@JAJMGGA@plc?5control?5state?$AA@" # @"??_C@_0BC@JAJMGGA@plc?5control?5state?$AA@"
"??_C@_0BC@JAJMGGA@plc?5control?5state?$AA@":
	.asciz	"plc control state"

	.bss
	.globl	_status_retain                  # @status_retain
	.p2align	2, 0x0
_status_retain:
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_0P@DCJKHNDF@retain?5feature?$AA@"
	.globl	"??_C@_0P@DCJKHNDF@retain?5feature?$AA@" # @"??_C@_0P@DCJKHNDF@retain?5feature?$AA@"
"??_C@_0P@DCJKHNDF@retain?5feature?$AA@":
	.asciz	"retain feature"

	.section	.rdata,"dr"
L_str.202:                              # @str.202
	.asciz	"Status list"

	.section	.rdata,"dr",discard,"??_C@_05NCFAHBAN@BOOL?$CD?$AA@"
	.globl	"??_C@_05NCFAHBAN@BOOL?$CD?$AA@" # @"??_C@_05NCFAHBAN@BOOL?$CD?$AA@"
"??_C@_05NCFAHBAN@BOOL?$CD?$AA@":
	.asciz	"BOOL#"

	.section	.rdata,"dr",discard,"??_C@_05DPBDMADO@SINT?$CD?$AA@"
	.globl	"??_C@_05DPBDMADO@SINT?$CD?$AA@" # @"??_C@_05DPBDMADO@SINT?$CD?$AA@"
"??_C@_05DPBDMADO@SINT?$CD?$AA@":
	.asciz	"SINT#"

	.section	.rdata,"dr",discard,"??_C@_04MCOJOMNJ@INT?$CD?$AA@"
	.globl	"??_C@_04MCOJOMNJ@INT?$CD?$AA@" # @"??_C@_04MCOJOMNJ@INT?$CD?$AA@"
"??_C@_04MCOJOMNJ@INT?$CD?$AA@":
	.asciz	"INT#"

	.section	.rdata,"dr",discard,"??_C@_05CBMAPCBN@DINT?$CD?$AA@"
	.globl	"??_C@_05CBMAPCBN@DINT?$CD?$AA@" # @"??_C@_05CBMAPCBN@DINT?$CD?$AA@"
"??_C@_05CBMAPCBN@DINT?$CD?$AA@":
	.asciz	"DINT#"

	.section	.rdata,"dr",discard,"??_C@_05MNJDHAHA@LINT?$CD?$AA@"
	.globl	"??_C@_05MNJDHAHA@LINT?$CD?$AA@" # @"??_C@_05MNJDHAHA@LINT?$CD?$AA@"
"??_C@_05MNJDHAHA@LINT?$CD?$AA@":
	.asciz	"LINT#"

	.section	.rdata,"dr",discard,"??_C@_06GCFAHIPD@USINT?$CD?$AA@"
	.globl	"??_C@_06GCFAHIPD@USINT?$CD?$AA@" # @"??_C@_06GCFAHIPD@USINT?$CD?$AA@"
"??_C@_06GCFAHIPD@USINT?$CD?$AA@":
	.asciz	"USINT#"

	.section	.rdata,"dr",discard,"??_C@_05OJEKCDCD@UINT?$CD?$AA@"
	.globl	"??_C@_05OJEKCDCD@UINT?$CD?$AA@" # @"??_C@_05OJEKCDCD@UINT?$CD?$AA@"
"??_C@_05OJEKCDCD@UINT?$CD?$AA@":
	.asciz	"UINT#"

	.section	.rdata,"dr",discard,"??_C@_06HMIDEKNA@UDINT?$CD?$AA@"
	.globl	"??_C@_06HMIDEKNA@UDINT?$CD?$AA@" # @"??_C@_06HMIDEKNA@UDINT?$CD?$AA@"
"??_C@_06HMIDEKNA@UDINT?$CD?$AA@":
	.asciz	"UDINT#"

	.section	.rdata,"dr",discard,"??_C@_06JANAMILN@ULINT?$CD?$AA@"
	.globl	"??_C@_06JANAMILN@ULINT?$CD?$AA@" # @"??_C@_06JANAMILN@ULINT?$CD?$AA@"
"??_C@_06JANAMILN@ULINT?$CD?$AA@":
	.asciz	"ULINT#"

	.section	.rdata,"dr",discard,"??_C@_05CNEHJGCP@TIME?$CD?$AA@"
	.globl	"??_C@_05CNEHJGCP@TIME?$CD?$AA@" # @"??_C@_05CNEHJGCP@TIME?$CD?$AA@"
"??_C@_05CNEHJGCP@TIME?$CD?$AA@":
	.asciz	"TIME#"

	.section	.rdata,"dr",discard,"??_C@_05HLOJBMAE@REAL?$CD?$AA@"
	.globl	"??_C@_05HLOJBMAE@REAL?$CD?$AA@" # @"??_C@_05HLOJBMAE@REAL?$CD?$AA@"
"??_C@_05HLOJBMAE@REAL?$CD?$AA@":
	.asciz	"REAL#"

	.section	.rdata,"dr",discard,"??_C@_06NEOMHNNE@LREAL?$CD?$AA@"
	.globl	"??_C@_06NEOMHNNE@LREAL?$CD?$AA@" # @"??_C@_06NEOMHNNE@LREAL?$CD?$AA@"
"??_C@_06NEOMHNNE@LREAL?$CD?$AA@":
	.asciz	"LREAL#"

	.section	.rdata,"dr",discard,"??_C@_05LFDJPIDO@BYTE?$CD?$AA@"
	.globl	"??_C@_05LFDJPIDO@BYTE?$CD?$AA@" # @"??_C@_05LFDJPIDO@BYTE?$CD?$AA@"
"??_C@_05LFDJPIDO@BYTE?$CD?$AA@":
	.asciz	"BYTE#"

	.section	.rdata,"dr",discard,"??_C@_05CNCLDMNP@WORD?$CD?$AA@"
	.globl	"??_C@_05CNCLDMNP@WORD?$CD?$AA@" # @"??_C@_05CNCLDMNP@WORD?$CD?$AA@"
"??_C@_05CNCLDMNP@WORD?$CD?$AA@":
	.asciz	"WORD#"

	.section	.rdata,"dr",discard,"??_C@_06LBMBBDGI@DWORD?$CD?$AA@"
	.globl	"??_C@_06LBMBBDGI@DWORD?$CD?$AA@" # @"??_C@_06LBMBBDGI@DWORD?$CD?$AA@"
"??_C@_06LBMBBDGI@DWORD?$CD?$AA@":
	.asciz	"DWORD#"

	.section	.rdata,"dr",discard,"??_C@_06IECHKAAB@QWORD?$CD?$AA@"
	.globl	"??_C@_06IECHKAAB@QWORD?$CD?$AA@" # @"??_C@_06IECHKAAB@QWORD?$CD?$AA@"
"??_C@_06IECHKAAB@QWORD?$CD?$AA@":
	.asciz	"QWORD#"

	.section	.rdata,"dr",discard,"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@"
	.globl	"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@" # @"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@"
"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@":
	.asciz	"FUNCTION#"

	.section	.rdata,"dr",discard,"??_C@_07DCPMEJPJ@STRING?$CD?$AA@"
	.globl	"??_C@_07DCPMEJPJ@STRING?$CD?$AA@" # @"??_C@_07DCPMEJPJ@STRING?$CD?$AA@"
"??_C@_07DCPMEJPJ@STRING?$CD?$AA@":
	.asciz	"STRING#"

	.section	.rdata,"dr",discard,"??_C@_06HNBGDGBN@ARRAY?$CD?$AA@"
	.globl	"??_C@_06HNBGDGBN@ARRAY?$CD?$AA@" # @"??_C@_06HNBGDGBN@ARRAY?$CD?$AA@"
"??_C@_06HNBGDGBN@ARRAY?$CD?$AA@":
	.asciz	"ARRAY#"

	.section	.rdata,"dr",discard,"??_C@_07HLOGPGIO@STRUCT?$CD?$AA@"
	.globl	"??_C@_07HLOGPGIO@STRUCT?$CD?$AA@" # @"??_C@_07HLOGPGIO@STRUCT?$CD?$AA@"
"??_C@_07HLOGPGIO@STRUCT?$CD?$AA@":
	.asciz	"STRUCT#"

	.section	.rdata,"dr",discard,"??_C@_04PKEBDEEL@ANY?$CD?$AA@"
	.globl	"??_C@_04PKEBDEEL@ANY?$CD?$AA@" # @"??_C@_04PKEBDEEL@ANY?$CD?$AA@"
"??_C@_04PKEBDEEL@ANY?$CD?$AA@":
	.asciz	"ANY#"

	.data
	.globl	_typematch                      # @typematch
	.p2align	2, 0x0
_typematch:
	.long	"??_C@_05NCFAHBAN@BOOL?$CD?$AA@"
	.short	1536                            # 0x600
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	"??_C@_05DPBDMADO@SINT?$CD?$AA@"
	.short	260                             # 0x104
	.long	2                               # 0x2
	.long	1                               # 0x1
	.long	"??_C@_04MCOJOMNJ@INT?$CD?$AA@"
	.short	261                             # 0x105
	.long	4                               # 0x4
	.long	2                               # 0x2
	.long	"??_C@_05CBMAPCBN@DINT?$CD?$AA@"
	.short	262                             # 0x106
	.long	6                               # 0x6
	.long	4                               # 0x4
	.long	"??_C@_05MNJDHAHA@LINT?$CD?$AA@"
	.short	263                             # 0x107
	.long	8                               # 0x8
	.long	8                               # 0x8
	.long	"??_C@_06GCFAHIPD@USINT?$CD?$AA@"
	.short	512                             # 0x200
	.long	3                               # 0x3
	.long	1                               # 0x1
	.long	"??_C@_05OJEKCDCD@UINT?$CD?$AA@"
	.short	513                             # 0x201
	.long	5                               # 0x5
	.long	2                               # 0x2
	.long	"??_C@_06HMIDEKNA@UDINT?$CD?$AA@"
	.short	514                             # 0x202
	.long	7                               # 0x7
	.long	4                               # 0x4
	.long	"??_C@_06JANAMILN@ULINT?$CD?$AA@"
	.short	515                             # 0x203
	.long	9                               # 0x9
	.long	8                               # 0x8
	.long	"??_C@_05CNEHJGCP@TIME?$CD?$AA@"
	.short	1347                            # 0x543
	.long	7                               # 0x7
	.long	4                               # 0x4
	.long	"??_C@_05HLOJBMAE@REAL?$CD?$AA@"
	.short	782                             # 0x30e
	.long	10                              # 0xa
	.long	4                               # 0x4
	.long	"??_C@_06NEOMHNNE@LREAL?$CD?$AA@"
	.short	783                             # 0x30f
	.long	11                              # 0xb
	.long	8                               # 0x8
	.long	"??_C@_05LFDJPIDO@BYTE?$CD?$AA@"
	.short	16                              # 0x10
	.long	3                               # 0x3
	.long	1                               # 0x1
	.long	"??_C@_05CNCLDMNP@WORD?$CD?$AA@"
	.short	17                              # 0x11
	.long	5                               # 0x5
	.long	2                               # 0x2
	.long	"??_C@_06LBMBBDGI@DWORD?$CD?$AA@"
	.short	18                              # 0x12
	.long	7                               # 0x7
	.long	4                               # 0x4
	.long	"??_C@_06IECHKAAB@QWORD?$CD?$AA@"
	.short	19                              # 0x13
	.long	9                               # 0x9
	.long	8                               # 0x8
	.long	"??_C@_09DLMGLEHF@FUNCTION?$CD?$AA@"
	.short	1059                            # 0x423
	.long	13                              # 0xd
	.long	4294967295                      # 0xffffffff
	.long	"??_C@_07DCPMEJPJ@STRING?$CD?$AA@"
	.short	1346                            # 0x542
	.long	13                              # 0xd
	.long	83                              # 0x53
	.long	"??_C@_06HNBGDGBN@ARRAY?$CD?$AA@"
	.short	1058                            # 0x422
	.long	13                              # 0xd
	.long	4294967295                      # 0xffffffff
	.long	"??_C@_07HLOGPGIO@STRUCT?$CD?$AA@"
	.short	1060                            # 0x424
	.long	13                              # 0xd
	.long	4294967295                      # 0xffffffff
	.long	"??_C@_04PKEBDEEL@ANY?$CD?$AA@"
	.short	32769                           # 0x8001
	.long	7                               # 0x7
	.long	4                               # 0x4
	.zero	14

	.bss
	.globl	_status_userFB                  # @status_userFB
	.p2align	2, 0x0
_status_userFB:
	.long	0                               # 0x0

	.globl	_UserFBList                     # @UserFBList
	.p2align	2, 0x0
_UserFBList:
	.long	0

	.globl	_UserFBBottom                   # @UserFBBottom
	.p2align	2, 0x0
_UserFBBottom:
	.long	0

	.section	.rdata,"dr",discard,"??_C@_0L@MKIBBCNB@UserFB_Add?$AA@"
	.globl	"??_C@_0L@MKIBBCNB@UserFB_Add?$AA@" # @"??_C@_0L@MKIBBCNB@UserFB_Add?$AA@"
"??_C@_0L@MKIBBCNB@UserFB_Add?$AA@":
	.asciz	"UserFB_Add"

	.section	.rdata,"dr",discard,"??_C@_0BE@HHDLPLIJ@UserFB_AddConnector?$AA@"
	.globl	"??_C@_0BE@HHDLPLIJ@UserFB_AddConnector?$AA@" # @"??_C@_0BE@HHDLPLIJ@UserFB_AddConnector?$AA@"
"??_C@_0BE@HHDLPLIJ@UserFB_AddConnector?$AA@":
	.asciz	"UserFB_AddConnector"

	.bss
	.globl	_status_userfunc                # @status_userfunc
	.p2align	2, 0x0
_status_userfunc:
	.long	0                               # 0x0

	.globl	_plcUserFuncList                # @plcUserFuncList
	.p2align	2, 0x0
_plcUserFuncList:
	.long	0

	.globl	_plcUserFuncBottom              # @plcUserFuncBottom
	.p2align	2, 0x0
_plcUserFuncBottom:
	.long	0

	.section	.rdata,"dr",discard,"??_C@_0BB@NEHNLFHE@Userfunction_Add?$AA@"
	.globl	"??_C@_0BB@NEHNLFHE@Userfunction_Add?$AA@" # @"??_C@_0BB@NEHNLFHE@Userfunction_Add?$AA@"
"??_C@_0BB@NEHNLFHE@Userfunction_Add?$AA@":
	.asciz	"Userfunction_Add"

	.section	.rdata,"dr",discard,"??_C@_0BG@MHHPLJKP@Userfunction_Add?3name?$AA@"
	.globl	"??_C@_0BG@MHHPLJKP@Userfunction_Add?3name?$AA@" # @"??_C@_0BG@MHHPLJKP@Userfunction_Add?3name?$AA@"
"??_C@_0BG@MHHPLJKP@Userfunction_Add?3name?$AA@":
	.asciz	"Userfunction_Add:name"

	.section	.rdata,"dr",discard,"??_C@_0BJ@MHLMLJEO@Userfunction_AddArgument?$AA@"
	.globl	"??_C@_0BJ@MHLMLJEO@Userfunction_AddArgument?$AA@" # @"??_C@_0BJ@MHLMLJEO@Userfunction_AddArgument?$AA@"
"??_C@_0BJ@MHLMLJEO@Userfunction_AddArgument?$AA@":
	.asciz	"Userfunction_AddArgument"

	.section	.rdata,"dr",discard,"??_C@_0BF@BPMKBFAL@?5?5Userfunc?$CI?$CF03d?$CJ?5?$CFs?6?$AA@"
	.globl	"??_C@_0BF@BPMKBFAL@?5?5Userfunc?$CI?$CF03d?$CJ?5?$CFs?6?$AA@" # @"??_C@_0BF@BPMKBFAL@?5?5Userfunc?$CI?$CF03d?$CJ?5?$CFs?6?$AA@"
"??_C@_0BF@BPMKBFAL@?5?5Userfunc?$CI?$CF03d?$CJ?5?$CFs?6?$AA@":
	.asciz	"  Userfunc(%03d) %s\n"

	.section	.rdata,"dr",discard,"??_C@_0BA@BPMJOBOE@?5?5?5?5pin?$CI?$CFd?$CJ?5?$CFs?6?$AA@"
	.globl	"??_C@_0BA@BPMJOBOE@?5?5?5?5pin?$CI?$CFd?$CJ?5?$CFs?6?$AA@" # @"??_C@_0BA@BPMJOBOE@?5?5?5?5pin?$CI?$CFd?$CJ?5?$CFs?6?$AA@"
"??_C@_0BA@BPMJOBOE@?5?5?5?5pin?$CI?$CFd?$CJ?5?$CFs?6?$AA@":
	.asciz	"    pin(%d) %s\n"

	.bss
	.globl	_context                        # @context
	.p2align	2, 0x0
_context:
	.long	0

	.section	.rdata,"dr",discard,"??_C@_01IHBHIGKO@?0?$AA@"
	.globl	"??_C@_01IHBHIGKO@?0?$AA@"      # @"??_C@_01IHBHIGKO@?0?$AA@"
"??_C@_01IHBHIGKO@?0?$AA@":
	.asciz	","

	.section	.rdata,"dr",discard,"??_C@_02LAJDCOFE@ST?$AA@"
	.globl	"??_C@_02LAJDCOFE@ST?$AA@"      # @"??_C@_02LAJDCOFE@ST?$AA@"
"??_C@_02LAJDCOFE@ST?$AA@":
	.asciz	"ST"

	.section	.rdata,"dr",discard,"??_C@_02ONCLNIEI@LD?$AA@"
	.globl	"??_C@_02ONCLNIEI@LD?$AA@"      # @"??_C@_02ONCLNIEI@LD?$AA@"
"??_C@_02ONCLNIEI@LD?$AA@":
	.asciz	"LD"

	.section	.rdata,"dr",discard,"??_C@_03JBLDIHBA@UFU?$AA@"
	.globl	"??_C@_03JBLDIHBA@UFU?$AA@"     # @"??_C@_03JBLDIHBA@UFU?$AA@"
"??_C@_03JBLDIHBA@UFU?$AA@":
	.asciz	"UFU"

	.section	.rdata,"dr",discard,"??_C@_0CP@OIDEEJJO@Userfunction_ReplaceInstruction?3@"
	.globl	"??_C@_0CP@OIDEEJJO@Userfunction_ReplaceInstruction?3@" # @"??_C@_0CP@OIDEEJJO@Userfunction_ReplaceInstruction?3@"
"??_C@_0CP@OIDEEJJO@Userfunction_ReplaceInstruction?3@":
	.asciz	"Userfunction_ReplaceInstruction:work temporary"

	.section	.rdata,"dr"
L_str.221:                              # @str.221
	.asciz	"Userfunction list"

L___const.INtime_CheckDRTOS.iodRTOS:    # @__const.INtime_CheckDRTOS.iodRTOS
	.asciz	"RINTM"

L___const.INtime_WaitIO.ioReq:          # @__const.INtime_WaitIO.ioReq
	.asciz	"RTIOSrvReq"

L___const.INtime_WaitIO.ioRsp:          # @__const.INtime_WaitIO.ioRsp
	.asciz	"RTIOSrvRsp"

L___const.INtime_WaitIO.ioSem:          # @__const.INtime_WaitIO.ioSem
	.asciz	"RTIOSrvSem"

	.bss
	.globl	_dwKtickInUsecs                 # @dwKtickInUsecs
	.p2align	2, 0x0
_dwKtickInUsecs:
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_0O@MGBCDFJB@?6Error?5nr?$DN?$CFx?6?$AA@"
	.globl	"??_C@_0O@MGBCDFJB@?6Error?5nr?$DN?$CFx?6?$AA@" # @"??_C@_0O@MGBCDFJB@?6Error?5nr?$DN?$CFx?6?$AA@"
"??_C@_0O@MGBCDFJB@?6Error?5nr?$DN?$CFx?6?$AA@":
	.asciz	"\nError nr=%x\n"

	.bss
	.globl	_strInit                        # @strInit
	.p2align	2, 0x0
_strInit:
	.zero	12

	.section	.rdata,"dr",discard,"??_C@_0M@NKKLNCPM@R?$DPEXIT_MBOX?$AA@"
	.globl	"??_C@_0M@NKKLNCPM@R?$DPEXIT_MBOX?$AA@" # @"??_C@_0M@NKKLNCPM@R?$DPEXIT_MBOX?$AA@"
"??_C@_0M@NKKLNCPM@R?$DPEXIT_MBOX?$AA@":
	.asciz	"R?EXIT_MBOX"

	.bss
	.globl	_hRootProcess                   # @hRootProcess
	.p2align	1, 0x0
_hRootProcess:
	.short	0                               # 0x0

	.globl	_hThisProcess                   # @hThisProcess
	.p2align	1, 0x0
_hThisProcess:
	.short	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_03LHGCEHCD@PLC?$AA@"
	.globl	"??_C@_03LHGCEHCD@PLC?$AA@"     # @"??_C@_03LHGCEHCD@PLC?$AA@"
"??_C@_03LHGCEHCD@PLC?$AA@":
	.asciz	"PLC"

	.bss
	.globl	_variablelist                   # @variablelist
	.p2align	2, 0x0
_variablelist:
	.long	0

	.globl	_variableBottom                 # @variableBottom
	.p2align	2, 0x0
_variableBottom:
	.long	0

	.globl	_RUNvariablelist                # @RUNvariablelist
	.p2align	2, 0x0
_RUNvariablelist:
	.long	0

	.section	.rdata,"dr",discard,"??_C@_0BD@PIGJDLMJ@Variable_Add?3entry?$AA@"
	.globl	"??_C@_0BD@PIGJDLMJ@Variable_Add?3entry?$AA@" # @"??_C@_0BD@PIGJDLMJ@Variable_Add?3entry?$AA@"
"??_C@_0BD@PIGJDLMJ@Variable_Add?3entry?$AA@":
	.asciz	"Variable_Add:entry"

	.section	.rdata,"dr",discard,"??_C@_0BC@BLILFEGL@Variable_Add?3name?$AA@"
	.globl	"??_C@_0BC@BLILFEGL@Variable_Add?3name?$AA@" # @"??_C@_0BC@BLILFEGL@Variable_Add?3name?$AA@"
"??_C@_0BC@BLILFEGL@Variable_Add?3name?$AA@":
	.asciz	"Variable_Add:name"

	.section	.rdata,"dr",discard,"??_C@_02MJNHLAAE@EG?$AA@"
	.globl	"??_C@_02MJNHLAAE@EG?$AA@"      # @"??_C@_02MJNHLAAE@EG?$AA@"
"??_C@_02MJNHLAAE@EG?$AA@":
	.asciz	"EG"

	.section	.rdata,"dr",discard,"??_C@_02KNHHEEKP@?5?5?$AA@"
	.globl	"??_C@_02KNHHEEKP@?5?5?$AA@"    # @"??_C@_02KNHHEEKP@?5?5?$AA@"
"??_C@_02KNHHEEKP@?5?5?$AA@":
	.asciz	"  "

	.section	.rdata,"dr",discard,"??_C@_02BIGHIPPJ@RO?$AA@"
	.globl	"??_C@_02BIGHIPPJ@RO?$AA@"      # @"??_C@_02BIGHIPPJ@RO?$AA@"
"??_C@_02BIGHIPPJ@RO?$AA@":
	.asciz	"RO"

	.section	.rdata,"dr",discard,"??_C@_0CI@JAAMHDIA@?5?5Variable?$CI?$CF03d?$CJ?5?$CFp?5?$CF?924s?5?5?$CF?910s@"
	.globl	"??_C@_0CI@JAAMHDIA@?5?5Variable?$CI?$CF03d?$CJ?5?$CFp?5?$CF?924s?5?5?$CF?910s@" # @"??_C@_0CI@JAAMHDIA@?5?5Variable?$CI?$CF03d?$CJ?5?$CFp?5?$CF?924s?5?5?$CF?910s@"
"??_C@_0CI@JAAMHDIA@?5?5Variable?$CI?$CF03d?$CJ?5?$CFp?5?$CF?924s?5?5?$CF?910s@":
	.asciz	"  Variable(%03d) %p %-24s  %-10s %s %s\n"

	.section	.rdata,"dr",discard,"??_C@_0BA@LBHLBGIF@Variable_Create?$AA@"
	.globl	"??_C@_0BA@LBHLBGIF@Variable_Create?$AA@" # @"??_C@_0BA@LBHLBGIF@Variable_Create?$AA@"
"??_C@_0BA@LBHLBGIF@Variable_Create?$AA@":
	.asciz	"Variable_Create"

	.section	.rdata,"dr",discard,"??_C@_0O@NOPHFFNJ@Variable_Body?$AA@"
	.globl	"??_C@_0O@NOPHFFNJ@Variable_Body?$AA@" # @"??_C@_0O@NOPHFFNJ@Variable_Body?$AA@"
"??_C@_0O@NOPHFFNJ@Variable_Body?$AA@":
	.asciz	"Variable_Body"

	.section	.rdata,"dr",discard,"??_C@_0BB@FLIGODG@Variable_GetSize?$AA@"
	.globl	"??_C@_0BB@FLIGODG@Variable_GetSize?$AA@" # @"??_C@_0BB@FLIGODG@Variable_GetSize?$AA@"
"??_C@_0BB@FLIGODG@Variable_GetSize?$AA@":
	.asciz	"Variable_GetSize"

	.section	.rdata,"dr",discard,"??_C@_0BB@OKBGGAGP@Variable_GetType?$AA@"
	.globl	"??_C@_0BB@OKBGGAGP@Variable_GetType?$AA@" # @"??_C@_0BB@OKBGGAGP@Variable_GetType?$AA@"
"??_C@_0BB@OKBGGAGP@Variable_GetType?$AA@":
	.asciz	"Variable_GetType"

	.bss
	.globl	__Variable_Zero_Body_String     # @_Variable_Zero_Body_String
__Variable_Zero_Body_String:
	.zero	83

	.globl	__Variable_Zero_Body_Array      # @_Variable_Zero_Body_Array
__Variable_Zero_Body_Array:
	.zero	3

	.globl	__Variable_Zero_Body            # @_Variable_Zero_Body
	.p2align	3, 0x0
__Variable_Zero_Body:
	.zero	8

	.data
	.globl	__Variable_Zero_BOOL            # @_Variable_Zero_BOOL
__Variable_Zero_BOOL:
	.long	__Variable_Zero_Body
	.short	1536                            # 0x600
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_SINT            # @_Variable_Zero_SINT
__Variable_Zero_SINT:
	.long	__Variable_Zero_Body
	.short	260                             # 0x104
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_INT             # @_Variable_Zero_INT
__Variable_Zero_INT:
	.long	__Variable_Zero_Body
	.short	261                             # 0x105
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_DINT            # @_Variable_Zero_DINT
__Variable_Zero_DINT:
	.long	__Variable_Zero_Body
	.short	262                             # 0x106
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_LINT            # @_Variable_Zero_LINT
__Variable_Zero_LINT:
	.long	__Variable_Zero_Body
	.short	263                             # 0x107
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_USINT           # @_Variable_Zero_USINT
__Variable_Zero_USINT:
	.long	__Variable_Zero_Body
	.short	512                             # 0x200
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_UINT            # @_Variable_Zero_UINT
__Variable_Zero_UINT:
	.long	__Variable_Zero_Body
	.short	513                             # 0x201
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_UDINT           # @_Variable_Zero_UDINT
__Variable_Zero_UDINT:
	.long	__Variable_Zero_Body
	.short	514                             # 0x202
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_ULINT           # @_Variable_Zero_ULINT
__Variable_Zero_ULINT:
	.long	__Variable_Zero_Body
	.short	515                             # 0x203
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_TIME            # @_Variable_Zero_TIME
__Variable_Zero_TIME:
	.long	__Variable_Zero_Body
	.short	1347                            # 0x543
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_BYTE            # @_Variable_Zero_BYTE
__Variable_Zero_BYTE:
	.long	__Variable_Zero_Body
	.short	16                              # 0x10
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_WORD            # @_Variable_Zero_WORD
__Variable_Zero_WORD:
	.long	__Variable_Zero_Body
	.short	17                              # 0x11
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_DWORD           # @_Variable_Zero_DWORD
__Variable_Zero_DWORD:
	.long	__Variable_Zero_Body
	.short	18                              # 0x12
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_QWORD           # @_Variable_Zero_QWORD
__Variable_Zero_QWORD:
	.long	__Variable_Zero_Body
	.short	19                              # 0x13
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_FUNCTION        # @_Variable_Zero_FUNCTION
__Variable_Zero_FUNCTION:
	.long	_Functionblock_Dummy
	.short	1059                            # 0x423
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_STRING          # @_Variable_Zero_STRING
__Variable_Zero_STRING:
	.long	__Variable_Zero_Body_String
	.short	1346                            # 0x542
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_ARRAY           # @_Variable_Zero_ARRAY
__Variable_Zero_ARRAY:
	.long	__Variable_Zero_Body_Array
	.short	1058                            # 0x422
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_STRUCT          # @_Variable_Zero_STRUCT
__Variable_Zero_STRUCT:
	.long	__Variable_Zero_Body_Array
	.short	1060                            # 0x424
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_ANY             # @_Variable_Zero_ANY
__Variable_Zero_ANY:
	.long	__Variable_Zero_Body
	.short	263                             # 0x107
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_REAL            # @_Variable_Zero_REAL
__Variable_Zero_REAL:
	.long	__Variable_Zero_Body
	.short	782                             # 0x30e
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.globl	__Variable_Zero_LREAL           # @_Variable_Zero_LREAL
__Variable_Zero_LREAL:
	.long	__Variable_Zero_Body
	.short	783                             # 0x30f
	.long	0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	3

	.section	.rdata,"dr"
L_str.253:                              # @str.253
	.asciz	"PLC variable list"

L_str.1.254:                            # @str.1.254
	.asciz	"  N/A"

	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_VARIANT_EMPTY                  # @VARIANT_EMPTY
_VARIANT_EMPTY:
	.zero	15

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
	.short	1
	.short	0
	.short	22011                           # Backend version
	.short	0
	.short	0
	.short	0
	.asciz	"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)" # Null-terminated compiler version string
	.p2align	2, 0x0
Ltmp5:
Ltmp1:
	.p2align	2, 0x0
	.addrsig
	.addrsig_sym _Api_Thread
	.addrsig_sym _ExitEvent_RtaMsgHandler
	.addrsig_sym _Container_EgdeMsgHandler
	.addrsig_sym _Engine_Thread
	.addrsig_sym _Engine_PulseThread
	.addrsig_sym _Functionblock_Dummy
	.addrsig_sym _VAR
	.addrsig_sym _FU
	.addrsig_sym _FB
	.addrsig_sym _LABEL
	.addrsig_sym _NOP
	.addrsig_sym _LD
	.addrsig_sym _LDN
	.addrsig_sym _ST
	.addrsig_sym _STN
	.addrsig_sym _S
	.addrsig_sym _SN
	.addrsig_sym _R
	.addrsig_sym _RN
	.addrsig_sym _AND
	.addrsig_sym _ANDN
	.addrsig_sym _OR
	.addrsig_sym _ORN
	.addrsig_sym _CAL
	.addrsig_sym _CALC
	.addrsig_sym _CALCN
	.addrsig_sym _RET
	.addrsig_sym _RETC
	.addrsig_sym _RETCN
	.addrsig_sym _NOT
	.addrsig_sym _EQ
	.addrsig_sym _END
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
	.addrsig_sym _Logic_RunPOU
	.addrsig_sym _Logic_Scan
	.addrsig_sym _Property_Process_Priority
	.addrsig_sym _Property_Process_Nop
	.addrsig_sym _Property_Process_Intprt
	.addrsig_sym _Property_Process_Pou
	.addrsig_sym _Property_Process_PouBegin
	.addrsig_sym _Property_Process_PouFinal
	.addrsig_sym _Property_Process_NoPrint
	.addrsig_sym _Property_Process_Remote
	.addrsig_sym _Property_Process_Step
	.addrsig_sym _Property_Process_Scanrate
	.addrsig_sym _Property_Process_Retain
	.addrsig_sym _Trigger_DetectThread
	.addrsig_sym _Userfunction_ReplaceInstruction
	.addrsig_sym _WorkFolder
	.addrsig_sym _RslFolder
	.addrsig_sym _RtaFolder
	.addrsig_sym _BaseName
	.addrsig_sym _RtaFilePath
	.addrsig_sym _MnmFilePath
	.addrsig_sym _IniFilePath
	.addrsig_sym _RetainInstName
	.addrsig_sym __ContainerTagName
	.addrsig_sym __ModuleName
	.addrsig_sym _catalogProc
	.addrsig_sym _Container_CreateTagsFromList.dummy
	.addrsig_sym _indicate
	.addrsig_sym _Indicate_Live.live
	.addrsig_sym _InstructionTemplate
	.addrsig_sym _PADDING
	.addrsig_sym _MnmFile_Base.Label
	.addrsig_sym _property
	.addrsig_sym __Retain_Save
	.addrsig_sym __Retain_Load
	.addrsig_sym _Rtedge_TagGetIecType.source
	.addrsig_sym _Rtedge_GetStructureName.name
	.addrsig_sym _Rtedge_GetArrayName.name
	.addrsig_sym _scope
	.addrsig_sym _scopedvariable
	.addrsig_sym _trigger
	.addrsig_sym __Variable_Zero_Body_String
	.addrsig_sym __Variable_Zero_Body_Array
	.addrsig_sym __Variable_Zero_Body
	.addrsig_sym __Variable_Zero_BOOL
	.addrsig_sym __Variable_Zero_SINT
	.addrsig_sym __Variable_Zero_INT
	.addrsig_sym __Variable_Zero_DINT
	.addrsig_sym __Variable_Zero_LINT
	.addrsig_sym __Variable_Zero_USINT
	.addrsig_sym __Variable_Zero_UINT
	.addrsig_sym __Variable_Zero_UDINT
	.addrsig_sym __Variable_Zero_ULINT
	.addrsig_sym __Variable_Zero_TIME
	.addrsig_sym __Variable_Zero_BYTE
	.addrsig_sym __Variable_Zero_WORD
	.addrsig_sym __Variable_Zero_DWORD
	.addrsig_sym __Variable_Zero_QWORD
	.addrsig_sym __Variable_Zero_FUNCTION
	.addrsig_sym __Variable_Zero_STRING
	.addrsig_sym __Variable_Zero_ARRAY
	.addrsig_sym __Variable_Zero_STRUCT
	.addrsig_sym __Variable_Zero_ANY
	.addrsig_sym __Variable_Zero_REAL
	.addrsig_sym __Variable_Zero_LREAL
	.addrsig_sym _VARIANT_EMPTY
	.globl	__fltused
