	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"structure.c"
	.def	_Structure_Compile;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Structure_Compile              # -- Begin function Structure_Compile
	.p2align	4
_Structure_Compile:                     # @Structure_Compile
# %bb.0:
	pushl	%edi
	pushl	%esi
	subl	$80, %esp
	movl	92(%esp), %edi
	xorl	%esi, %esi
	testl	%edi, %edi
	je	LBB0_5
# %bb.1:
	pushl	$46
	pushl	%edi
	calll	_strchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB0_5
# %bb.2:
	movl	%esp, %esi
	pushl	%edi
	pushl	%esi
	calll	_strcpy
	addl	$8, %esp
	pushl	$46
	pushl	%esi
	calll	_strrchr
	addl	$8, %esp
	movb	$0, (%eax)
	pushl	%esi
	calll	_Rtedge_IsStructure
	addl	$4, %esp
	testb	%al, %al
	je	LBB0_3
# %bb.4:
	pushl	%esi
	calll	_Functionblock_Register
	addl	$4, %esp
	pushl	%edi
	calll	_Variable_Search
	addl	$4, %esp
	movl	%eax, %esi
	jmp	LBB0_5
LBB0_3:
	xorl	%esi, %esi
LBB0_5:
	movl	%esi, %eax
	addl	$80, %esp
	popl	%esi
	popl	%edi
	retl
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
	subl	$84, %esp
	movl	104(%esp), %ebx
	pushl	%ebx
	calll	_Rtedge_IsStructure
	addl	$4, %esp
	testb	%al, %al
	je	LBB1_1
# %bb.2:
	movl	108(%esp), %ebp
	pushl	%ebx
	calll	_Rtedge_TagGetPointer
	addl	$4, %esp
	movl	%eax, (%esp)                    # 4-byte Spill
	pushl	%ebx
	calll	_Variable_Search
	addl	$4, %esp
	testl	%eax, %eax
	jne	LBB1_4
# %bb.3:
	pushl	$1059                           # imm = 0x423
	pushl	%ebx
	calll	_Variable_Add
	addl	$8, %esp
	movl	(%esp), %ecx                    # 4-byte Reload
	movl	%ecx, 6(%eax)
	movl	23(%ecx), %ecx
	movl	%ecx, (%eax)
LBB1_4:
	pushl	%ebx
	calll	_Rtedge_GetStructureName
	addl	$4, %esp
	testl	%ebp, %ebp
	je	LBB1_9
# %bb.5:
	xorl	%esi, %esi
	jmp	LBB1_6
	.p2align	4
LBB1_8:                                 #   in Loop: Header=BB1_6 Depth=1
	pushl	%edi
	calll	_Rtedge_SizeOf
	addl	$4, %esp
	movzwl	%ax, %eax
	addl	%eax, %esi
	movl	10(%ebp), %ebp
	testl	%ebp, %ebp
	je	LBB1_9
LBB1_6:                                 # =>This Inner Loop Header: Depth=1
	pushl	%ebx
	leal	8(%esp), %edi
	pushl	%edi
	calll	_strcpy
	addl	$8, %esp
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	movw	$46, 4(%esp,%eax)
	pushl	2(%ebp)
	pushl	%edi
	calll	_strcat
	addl	$8, %esp
	movzwl	(%ebp), %eax
	pushl	%eax
	pushl	%edi
	calll	_Variable_Add
	addl	$8, %esp
	movl	%eax, %edi
	movl	(%esp), %eax                    # 4-byte Reload
	movl	%eax, 6(%edi)
	movzwl	%si, %esi
	movl	23(%eax), %eax
	addl	%esi, %eax
	movl	%eax, (%edi)
	cmpw	$-32767, 4(%edi)                # imm = 0x8001
	jne	LBB1_8
# %bb.7:                                #   in Loop: Header=BB1_6 Depth=1
	pushl	$"??_C@_0CC@PMKPPOMH@Structure_CreateCatalog?3D_ANY?5pi@"
	pushl	$15
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	%eax, %ebx
	pushl	$"??_C@_0CJ@OILNIPDE@Structure_CreateCatalog?3D_ANY?5pi@"
	pushl	$83
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	%eax, (%ebx)
	movl	(%edi), %eax
	movl	%ebx, (%eax)
	movl	104(%esp), %ebx
	jmp	LBB1_8
LBB1_9:                                 # %.loopexit
	movl	$2, _status_structure
	jmp	LBB1_10
LBB1_1:
	pushl	$"??_C@_0BJ@EJLMNAHD@structure?5tag?5not?5found?4?$AA@"
	pushl	$8194                           # imm = 0x2002
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
LBB1_10:
	xorl	%eax, %eax
	addl	$84, %esp
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
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
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
