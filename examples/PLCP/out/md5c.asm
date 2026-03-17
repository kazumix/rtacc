	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"md5c.c"
	.def	_MD5Init;
	.scl	2;
	.type	32;
	.endef
	.globl	__xmm@1032547698badcfeefcdab8967452301 # -- Begin function MD5Init
	.section	.rdata,"dr",discard,__xmm@1032547698badcfeefcdab8967452301
	.p2align	4, 0x0
__xmm@1032547698badcfeefcdab8967452301:
	.long	1732584193                      # 0x67452301
	.long	4023233417                      # 0xefcdab89
	.long	2562383102                      # 0x98badcfe
	.long	271733878                       # 0x10325476
	.text
	.globl	_MD5Init
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
	jb	LBB1_5
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
	jae	LBB1_2
	.p2align	4
LBB1_3:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	%edi, %esi
	leal	(%ebx,%edi), %edx
	movl	24(%esp), %ecx
	calll	_MD5Transform
	addl	$64, %edi
	addl	$127, %esi
	cmpl	%ebp, %esi
	jb	LBB1_3
# %bb.4:
	movl	%edi, %eax
	movl	24(%esp), %esi
	xorl	%ecx, %ecx
	jmp	LBB1_5
LBB1_2:
	movl	%edi, %eax
LBB1_5:                                 # %.loopexit
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
	jae	LBB3_2
# %bb.1:
	xorl	%esi, %esi
	jmp	LBB3_6
LBB3_2:
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
	jae	LBB3_6
# %bb.3:                                # %.preheader.preheader
	movl	%ebp, %edi
	.p2align	4
LBB3_4:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	%esi, %ebp
	leal	_PADDING(%esi), %edx
	movl	%edi, %ecx
	calll	_MD5Transform
	addl	$64, %esi
	addl	$127, %ebp
	cmpl	%ebx, %ebp
	jb	LBB3_4
# %bb.5:
	movl	%edi, %ebp
	xorl	%edi, %edi
	xorl	%ecx, %ecx
LBB3_6:                                 # %.loopexit
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
	jb	LBB3_8
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
LBB3_8:
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
	.data
_PADDING:                               # @PADDING
	.byte	128                             # 0x80
	.zero	63

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
	.addrsig_sym _PADDING
