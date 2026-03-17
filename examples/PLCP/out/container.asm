	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"container.c"
	.def	_Container_Set_Catalogname;
	.scl	2;
	.type	32;
	.endef
	.text
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
LBB0_1:                                 # =>This Inner Loop Header: Depth=1
	cmpl	$129, %esi
	je	LBB0_2
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
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
	jne	LBB0_1
# %bb.4:
	movb	$1, %al
	jmp	LBB0_5
LBB0_2:
	xorl	%eax, %eax
LBB0_5:
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
	ja	LBB2_1
# %bb.2:
	movzwl	L_switch.table.Container_TagCreate-2(%eax,%eax), %eax
                                        # kill: def $ax killed $ax killed $eax
	retl
LBB2_1:
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
	jne	LBB3_2
# %bb.1:
	movl	(%esp), %eax
LBB3_2:
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
	ja	LBB4_1
# %bb.2:
	movzwl	L_switch.table.Container_TagCreate-2(%ebx,%ebx), %ebp
	jmp	LBB4_3
LBB4_1:
	xorl	%ebp, %ebp
LBB4_3:
	movl	64(%esp), %edi
	leal	4(%esp), %esi
	pushl	$2
	pushl	%esi
	pushl	$"??_C@_04KOACHJEN@Type?$AA@"
	pushl	68(%esp)
	calll	*__imp__EgTagGetProperty
	addl	$16, %esp
	testl	%eax, %eax
	je	LBB4_11
# %bb.4:
	movl	72(%esp), %ecx
	movl	68(%esp), %eax
	cmpl	$12, %ebx
	jne	LBB4_5
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
	jne	LBB4_8
# %bb.10:
	pushl	%edi
	pushl	%esi
	calll	*__imp__EgTagWriteString
	addl	$8, %esp
	testl	%eax, %eax
	jne	LBB4_8
	jmp	LBB4_11
LBB4_5:
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
	jne	LBB4_8
# %bb.6:
	leal	64(%esp), %eax
	pushl	%esi
	pushl	%eax
	pushl	%edi
	calll	*__imp__EgTagWrite
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB4_11
LBB4_8:
	xorl	%eax, %eax
	jmp	LBB4_12
LBB4_11:
	movb	$1, %al
LBB4_12:
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
	jne	LBB7_2
# %bb.1:
	pushl	$47
	pushl	$__ModuleName
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB7_4
LBB7_2:
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
	je	LBB7_4
# %bb.3:
	movb	$0, (%eax)
LBB7_4:
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
	jne	LBB8_2
# %bb.1:
	pushl	$1024                           # imm = 0x400
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, _Container_Log$.messBuff
	testl	%eax, %eax
	je	LBB8_3
LBB8_2:
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
LBB8_3:
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
	pushl	%esi
	subl	$12, %esp
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
	movl	%esp, %esi
	jmp	LBB12_1
	.p2align	4
LBB12_4:                                #   in Loop: Header=BB12_1 Depth=1
	pushl	$0
	calll	_Indicate_Run
	addl	$4, %esp
	movzwl	_hExitEvent, %eax
	pushl	$1
	pushl	%eax
	calll	_ReleaseRtSemaphore
	addl	$8, %esp
LBB12_1:                                # =>This Inner Loop Header: Depth=1
	pushl	%esi
	pushl	$-1
	pushl	$12
	calll	_RtNotifyEvent
	addl	$12, %esp
	testb	%al, %al
	je	LBB12_5
# %bb.2:                                # %.preheader
                                        #   in Loop: Header=BB12_1 Depth=1
	movl	(%esp), %eax
	cmpl	$255, %eax
	je	LBB12_4
# %bb.3:                                # %.preheader
                                        #   in Loop: Header=BB12_1 Depth=1
	cmpl	$8, %eax
	je	LBB12_4
	jmp	LBB12_1
LBB12_5:                                # %.loopexit
	addl	$12, %esp
	popl	%esi
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
	subl	$12, %esp
	movl	20(%esp), %eax
	cmpl	$101, %eax
	je	LBB13_12
# %bb.1:
	cmpl	$103, %eax
	je	LBB13_8
# %bb.2:
	cmpl	$102, %eax
	jne	LBB13_16
# %bb.3:
	movl	$"??_C@_0BJ@OPOGIFPF@EM_SERVICE_RUN?5recieved?4?$AA@", (%esp)
	movl	_Container_Log$.messBuff, %eax
	testl	%eax, %eax
	jne	LBB13_5
# %bb.4:
	pushl	$1024                           # imm = 0x400
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, _Container_Log$.messBuff
	testl	%eax, %eax
	je	LBB13_6
LBB13_5:
	leal	4(%esp), %ecx
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
LBB13_6:
	pushl	$1
	jmp	LBB13_7
LBB13_8:
	movl	$"??_C@_0BL@DPPAKCHP@EM_SERVICE_PAUSE?5recieved?4?$AA@", 4(%esp)
	movl	_Container_Log$.messBuff, %eax
	testl	%eax, %eax
	jne	LBB13_10
# %bb.9:
	pushl	$1024                           # imm = 0x400
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, _Container_Log$.messBuff
	testl	%eax, %eax
	je	LBB13_11
LBB13_10:
	leal	8(%esp), %ecx
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
LBB13_11:
	pushl	$0
LBB13_7:
	calll	_Indicate_Run
	addl	$4, %esp
	jmp	LBB13_16
LBB13_12:
	movl	$"??_C@_0BK@LMHOIIID@EM_SERVICE_STOP?5recieved?4?$AA@", 8(%esp)
	movl	_Container_Log$.messBuff, %eax
	testl	%eax, %eax
	jne	LBB13_14
# %bb.13:
	pushl	$1024                           # imm = 0x400
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, _Container_Log$.messBuff
	testl	%eax, %eax
	je	LBB13_15
LBB13_14:
	leal	12(%esp), %ecx
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
LBB13_15:
	pushl	$0
	calll	_Indicate_Run
	addl	$4, %esp
	movzwl	_hExitEvent, %eax
	pushl	$1
	pushl	%eax
	calll	_ReleaseRtSemaphore
	addl	$8, %esp
LBB13_16:
	xorl	%eax, %eax
	addl	$12, %esp
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
	pushl	%edi
	pushl	%esi
	subl	$276, %esp                      # imm = 0x114
	movl	%esp, %esi
	pushl	$276                            # imm = 0x114
	pushl	$0
	pushl	%esi
	calll	_memset
	addl	$12, %esp
	movb	$1, 1(%esp)
	movw	$-1, 2(%esp)
	movl	$_Container_EgdeMsgHandler, 4(%esp)
	pushl	%esi
	calll	*__imp__EgInit
	addl	$4, %esp
	pushl	$100
	calll	_RtSleep
	addl	$4, %esp
	calll	_Property_Init
	calll	_Indicate_Init
	calll	_Trigger_Init
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
	calll	_Property_Get_Priority
	addb	$10, %al
	movzbl	%al, %eax
	pushl	%eax
	pushl	$0
	calll	_SetRtThreadPriority
	addl	$8, %esp
	movl	$1, %edi
	pushl	$3
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movzwl	%ax, %esi
	.p2align	4
LBB14_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$129, %edi
	je	LBB14_3
# %bb.2:                                #   in Loop: Header=BB14_1 Depth=1
	pushl	%edi
	pushl	$"??_C@_03LHGCEHCD@PLC?$AA@"
	pushl	$"??_C@_07NFKFJBIP@?$CFs_?$CF03d?$AA@"
	pushl	$_catalogProc
	calll	_sprintf
	addl	$16, %esp
	pushl	$0
	pushl	$_catalogProc
	pushl	%esi
	calll	_LookupRtHandle
	addl	$12, %esp
	incl	%edi
	cmpw	$-1, %ax
	jne	LBB14_1
LBB14_3:
	pushl	$_catalogProc
	pushl	%esi
	calll	_UncatalogRtHandle
	addl	$8, %esp
	pushl	$1
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movzwl	%ax, %eax
	pushl	$_catalogProc
	pushl	%eax
	pushl	%esi
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
	calll	_Property_Get_Priority
	addb	$8, %al
	movzbl	%al, %eax
	pushl	$0
	pushl	$4096                           # imm = 0x1000
	pushl	$_ExitEvent_RtaMsgHandler
	pushl	%eax
	calll	_CreateRtThread
	addl	$16, %esp
	pushl	$1
	calll	_Indicate_STATE_ON
	addl	$4, %esp
	pushl	$0
	calll	_Indicate_STATE_LOADING
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
	pushl	$1
	calll	_Indicate_STATE_RUN
	addl	$4, %esp
	calll	_Errorlog_Count
	pushl	%eax
	calll	_Indicate_ERRORS
	addl	$4, %esp
	calll	_Property_Get_Autorun
	xorl	%ecx, %ecx
	testb	%al, %al
	setne	%cl
	pushl	%ecx
	calll	_Indicate_Run
	addl	$280, %esp                      # imm = 0x118
	popl	%esi
	popl	%edi
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
	pushl	$0
	calll	_Indicate_STATE_ON
	addl	$4, %esp
	pushl	$0
	calll	_Indicate_STATE_LOADING
	addl	$4, %esp
	pushl	$0
	calll	_Indicate_STATE_STOP
	addl	$4, %esp
	pushl	$0
	calll	_Indicate_STATE_RUN
	addl	$4, %esp
	pushl	$0
	calll	_Indicate_STATE_STEP
	addl	$4, %esp
	pushl	$0
	calll	_Indicate_STATE_HALT
	addl	$4, %esp
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
	je	LBB16_11
# %bb.1:                                # %.preheader.preheader
	addl	$30, %esi
	movl	__imp__ServiceRealName, %edi
	movl	%esp, %ebx
	movl	__imp__EgTagGetProperty, %ebp
	jmp	LBB16_2
	.p2align	4
LBB16_7:                                #   in Loop: Header=BB16_2 Depth=1
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
	je	LBB16_8
LBB16_9:                                #   in Loop: Header=BB16_2 Depth=1
	movl	%ecx, -16(%esi)
LBB16_10:                               #   in Loop: Header=BB16_2 Depth=1
	movl	(%esi), %eax
	addl	$30, %esi
	testl	%eax, %eax
	je	LBB16_11
LBB16_2:                                # %.preheader
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
	je	LBB16_5
# %bb.3:                                #   in Loop: Header=BB16_2 Depth=1
	cmpb	$0, -18(%esi)
	je	LBB16_10
# %bb.4:                                #   in Loop: Header=BB16_2 Depth=1
	pushl	-8(%esi)
	pushl	-12(%esi)
	pushl	-22(%esi)
	pushl	-26(%esi)
	pushl	$__ContainerTagName
	calll	_Container_TagCreate
	addl	$20, %esp
	testb	%al, %al
	je	LBB16_11
LBB16_5:                                #   in Loop: Header=BB16_2 Depth=1
	pushl	$4
	pushl	%ebx
	pushl	$"??_C@_05FNNGFGLF@Index?$AA@"
	pushl	$__ContainerTagName
	calll	*%ebp
	addl	$16, %esp
	xorl	%ecx, %ecx
	testl	%eax, %eax
	jne	LBB16_7
# %bb.6:                                #   in Loop: Header=BB16_2 Depth=1
	movl	(%esp), %ecx
	jmp	LBB16_7
	.p2align	4
LBB16_8:                                #   in Loop: Header=BB16_2 Depth=1
	movl	(%esp), %ecx
	addl	$15, %ecx
	movb	$1, -17(%esi)
	jmp	LBB16_9
LBB16_11:                               # %.loopexit
	xorl	%eax, %eax
	addl	$4, %esp
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

	.section	.rdata,"dr",discard,"??_C@_03LHGCEHCD@PLC?$AA@"
	.globl	"??_C@_03LHGCEHCD@PLC?$AA@"     # @"??_C@_03LHGCEHCD@PLC?$AA@"
"??_C@_03LHGCEHCD@PLC?$AA@":
	.asciz	"PLC"

	.section	.rdata,"dr",discard,"??_C@_07NFKFJBIP@?$CFs_?$CF03d?$AA@"
	.globl	"??_C@_07NFKFJBIP@?$CFs_?$CF03d?$AA@" # @"??_C@_07NFKFJBIP@?$CFs_?$CF03d?$AA@"
"??_C@_07NFKFJBIP@?$CFs_?$CF03d?$AA@":
	.asciz	"%s_%03d"

	.section	.rdata,"dr",discard,"??_C@_04KOACHJEN@Type?$AA@"
	.globl	"??_C@_04KOACHJEN@Type?$AA@"    # @"??_C@_04KOACHJEN@Type?$AA@"
"??_C@_04KOACHJEN@Type?$AA@":
	.asciz	"Type"

	.section	.rdata,"dr",discard,"??_C@_05FNNGFGLF@Index?$AA@"
	.globl	"??_C@_05FNNGFGLF@Index?$AA@"   # @"??_C@_05FNNGFGLF@Index?$AA@"
"??_C@_05FNNGFGLF@Index?$AA@":
	.asciz	"Index"

	.section	.rdata,"dr",discard,"??_C@_00CNPNBAHC@?$AA@"
	.globl	"??_C@_00CNPNBAHC@?$AA@"        # @"??_C@_00CNPNBAHC@?$AA@"
"??_C@_00CNPNBAHC@?$AA@":
	.zero	1

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
	.section	.rdata,"dr",discard,"??_C@_05HKHPEFOF@Entry?$AA@"
	.globl	"??_C@_05HKHPEFOF@Entry?$AA@"   # @"??_C@_05HKHPEFOF@Entry?$AA@"
"??_C@_05HKHPEFOF@Entry?$AA@":
	.asciz	"Entry"

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
	.addrsig_sym _ExitEvent_RtaMsgHandler
	.addrsig_sym _Container_EgdeMsgHandler
	.addrsig_sym __ContainerTagName
	.addrsig_sym __ModuleName
	.addrsig_sym _catalogProc
	.addrsig_sym _Container_CreateTagsFromList.dummy
