	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"trigger.c"
	.def	_Trigger_TagInit;
	.scl	2;
	.type	32;
	.endef
	.text
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
	calll	_Property_Get_Interval
	movl	%eax, %esi
	movl	_trigger+26, %ebp
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
	movl	%eax, %edi
	movl	%ebp, (%eax)
	movl	$0, 4(%eax)
	movl	%eax, %ebx
	addl	$4, %ebx
	jmp	LBB4_1
LBB4_19:                                #   in Loop: Header=BB4_1 Depth=1
	calll	_Api_PlcDownload
	.p2align	4
LBB4_25:                                #   in Loop: Header=BB4_1 Depth=1
	movl	$0, 4(%edi)
	movl	(%edi), %ebp
LBB4_1:                                 # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_2 Depth 2
	pushl	$4
	pushl	%ebx
	pushl	%ebp
	calll	*__imp__EgTagWriteByIndex
	addl	$12, %esp
	.p2align	4
LBB4_2:                                 #   Parent Loop BB4_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	pushl	%esi
	calll	_RtSleepEx
	addl	$4, %esp
	calll	_Indicate_Run_Get
	testb	%al, %al
	je	LBB4_2
# %bb.3:                                #   in Loop: Header=BB4_2 Depth=2
	calll	_Indicate_Live
	movl	4(%edi), %ebp
	pushl	$4
	pushl	%ebx
	pushl	(%edi)
	calll	*__imp__EgTagReadByIndex
	addl	$12, %esp
	movl	4(%edi), %eax
	cmpl	%eax, %ebp
	je	LBB4_2
# %bb.4:                                #   in Loop: Header=BB4_1 Depth=1
	cmpl	$199, %eax
	jg	LBB4_7
# %bb.5:                                #   in Loop: Header=BB4_1 Depth=1
	addl	$-100, %eax
	cmpl	$23, %eax
	ja	LBB4_25
# %bb.6:                                #   in Loop: Header=BB4_1 Depth=1
	jmpl	*LJTI4_0(,%eax,4)
LBB4_15:                                #   in Loop: Header=BB4_1 Depth=1
	calll	_Api_PlcStop
	jmp	LBB4_25
	.p2align	4
LBB4_7:                                 #   in Loop: Header=BB4_1 Depth=1
	cmpl	$299, %eax                      # imm = 0x12B
	jle	LBB4_8
# %bb.11:                               #   in Loop: Header=BB4_1 Depth=1
	cmpl	$300, %eax                      # imm = 0x12C
	je	LBB4_23
# %bb.12:                               #   in Loop: Header=BB4_1 Depth=1
	cmpl	$301, %eax                      # imm = 0x12D
	je	LBB4_24
# %bb.13:                               #   in Loop: Header=BB4_1 Depth=1
	cmpl	$302, %eax                      # imm = 0x12E
	jne	LBB4_25
# %bb.14:                               #   in Loop: Header=BB4_1 Depth=1
	calll	_Api_StepStep
	jmp	LBB4_25
LBB4_8:                                 #   in Loop: Header=BB4_1 Depth=1
	cmpl	$200, %eax
	je	LBB4_22
# %bb.9:                                #   in Loop: Header=BB4_1 Depth=1
	cmpl	$201, %eax
	jne	LBB4_25
# %bb.10:                               #   in Loop: Header=BB4_1 Depth=1
	calll	_Api_PlcDisasm
	jmp	LBB4_25
LBB4_20:                                #   in Loop: Header=BB4_1 Depth=1
	calll	_Api_PlcRetainSave
	jmp	LBB4_25
LBB4_16:                                #   in Loop: Header=BB4_1 Depth=1
	calll	_Api_PlcReset
	jmp	LBB4_25
LBB4_18:                                #   in Loop: Header=BB4_1 Depth=1
	calll	_Api_PlcStartWarm
	jmp	LBB4_25
LBB4_17:                                #   in Loop: Header=BB4_1 Depth=1
	calll	_Api_PlcStartCold
	jmp	LBB4_25
LBB4_21:                                #   in Loop: Header=BB4_1 Depth=1
	calll	_Api_PlcRetainLoad
	jmp	LBB4_25
LBB4_22:                                #   in Loop: Header=BB4_1 Depth=1
	calll	_Api_DumpLog
	jmp	LBB4_25
LBB4_23:                                #   in Loop: Header=BB4_1 Depth=1
	calll	_Api_StepEnable
	jmp	LBB4_25
LBB4_24:                                #   in Loop: Header=BB4_1 Depth=1
	calll	_Api_StepDisable
	jmp	LBB4_25
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI4_0:
	.long	LBB4_15
	.long	LBB4_16
	.long	LBB4_25
	.long	LBB4_25
	.long	LBB4_25
	.long	LBB4_25
	.long	LBB4_25
	.long	LBB4_25
	.long	LBB4_25
	.long	LBB4_25
	.long	LBB4_17
	.long	LBB4_18
	.long	LBB4_25
	.long	LBB4_25
	.long	LBB4_25
	.long	LBB4_25
	.long	LBB4_25
	.long	LBB4_25
	.long	LBB4_25
	.long	LBB4_25
	.long	LBB4_19
	.long	LBB4_25
	.long	LBB4_20
	.long	LBB4_21
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
	pushl	%ebx
	pushl	$_trigger
	calll	_Container_CreateTagsFromList
	addl	$4, %esp
	movl	%eax, %ebx
	calll	_Property_Get_Priority
	addb	$6, %al
	movzbl	%al, %eax
	pushl	$0
	pushl	$4096                           # imm = 0x1000
	pushl	$_Trigger_DetectThread
	pushl	%eax
	calll	_CreateRtThread
	addl	$16, %esp
	movl	%ebx, %eax
	popl	%ebx
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

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
	.addrsig_sym _Trigger_DetectThread
	.addrsig_sym _trigger
