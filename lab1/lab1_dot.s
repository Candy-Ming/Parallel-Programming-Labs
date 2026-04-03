	.file	"lab1_dot.cpp"
	.text
	.section	.text$_ZNKSt5ctypeIcE8do_widenEc,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNKSt5ctypeIcE8do_widenEc
	.def	_ZNKSt5ctypeIcE8do_widenEc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt5ctypeIcE8do_widenEc
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1408:
	.seh_endprologue
	movl	%edx, %eax
	ret
	.seh_endproc
	.text
	.p2align 4
	.def	__tcf_0;	.scl	3;	.type	32;	.endef
	.seh_proc	__tcf_0
__tcf_0:
.LFB9550:
	.seh_endprologue
	leaq	_ZStL8__ioinit(%rip), %rcx
	jmp	_ZNSt8ios_base4InitD1Ev
	.seh_endproc
	.p2align 4
	.globl	_Z6now_usv
	.def	_Z6now_usv;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z6now_usv
_Z6now_usv:
.LFB8784:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	cmpb	$0, _ZZ6now_usvE11initialized(%rip)
	je	.L6
.L5:
	leaq	40(%rsp), %rcx
	call	*__imp_QueryPerformanceCounter(%rip)
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	40(%rsp), %xmm0
	mulsd	.LC0(%rip), %xmm0
	cvtsi2sdq	_ZZ6now_usvE4freq(%rip), %xmm1
	divsd	%xmm1, %xmm0
	addq	$56, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	leaq	_ZZ6now_usvE4freq(%rip), %rcx
	call	*__imp_QueryPerformanceFrequency(%rip)
	movb	$1, _ZZ6now_usvE11initialized(%rip)
	jmp	.L5
	.seh_endproc
	.p2align 4
	.globl	_Z9init_dataRSt6vectorIiSaIiEERS_IS1_SaIS1_EEi
	.def	_Z9init_dataRSt6vectorIiSaIiEERS_IS1_SaIS1_EEi;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z9init_dataRSt6vectorIiSaIiEERS_IS1_SaIS1_EEi
_Z9init_dataRSt6vectorIiSaIiEERS_IS1_SaIS1_EEi:
.LFB8785:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	.seh_endprologue
	movq	%rdx, %r9
	testl	%r8d, %r8d
	jle	.L7
	leal	-1(%r8), %ebx
	movq	(%rcx), %rcx
	cmpl	$2, %ebx
	jbe	.L16
	movl	%r8d, %edx
	movdqa	.LC1(%rip), %xmm0
	movdqa	.LC2(%rip), %xmm2
	movq	%rcx, %rax
	shrl	$2, %edx
	salq	$4, %rdx
	addq	%rcx, %rdx
	.p2align 4,,10
	.p2align 3
.L10:
	movdqa	%xmm0, %xmm1
	addq	$16, %rax
	paddd	%xmm2, %xmm0
	movups	%xmm1, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L10
	movl	%r8d, %eax
	andl	$-4, %eax
	testb	$3, %r8b
	je	.L11
.L9:
	movslq	%eax, %rdx
	movl	%eax, (%rcx,%rdx,4)
	leal	1(%rax), %edx
	cmpl	%edx, %r8d
	jle	.L11
	movslq	%edx, %r10
	addl	$2, %eax
	movl	%edx, (%rcx,%r10,4)
	cmpl	%eax, %r8d
	jle	.L11
	movslq	%eax, %rdx
	movl	%eax, (%rcx,%rdx,4)
.L11:
	movl	%r8d, %esi
	movl	%r8d, %r11d
	movq	(%r9), %r10
	xorl	%ecx, %ecx
	shrl	$2, %esi
	movdqa	.LC2(%rip), %xmm3
	andl	$-4, %r11d
	salq	$4, %rsi
	.p2align 4,,10
	.p2align 3
.L15:
	movq	(%r10), %r9
	cmpl	$2, %ebx
	jbe	.L17
	movd	%ecx, %xmm4
	movdqa	.LC1(%rip), %xmm1
	movq	%r9, %rax
	leaq	(%r9,%rsi), %rdx
	pshufd	$0, %xmm4, %xmm2
	.p2align 4,,10
	.p2align 3
.L13:
	movdqa	%xmm1, %xmm0
	addq	$16, %rax
	paddd	%xmm3, %xmm1
	paddd	%xmm2, %xmm0
	movups	%xmm0, -16(%rax)
	cmpq	%rax, %rdx
	jne	.L13
	movl	%r11d, %eax
	cmpl	%r8d, %r11d
	je	.L14
.L12:
	movslq	%eax, %rdx
	leal	(%rax,%rcx), %ebp
	movl	%ebp, (%r9,%rdx,4)
	leaq	0(,%rdx,4), %rdi
	leal	1(%rax), %edx
	cmpl	%r8d, %edx
	jge	.L14
	addl	%ecx, %edx
	addl	$2, %eax
	movl	%edx, 4(%r9,%rdi)
	cmpl	%eax, %r8d
	jle	.L14
	addl	%ecx, %eax
	movl	%eax, 8(%r9,%rdi)
.L14:
	addl	$1, %ecx
	addq	$24, %r10
	cmpl	%ecx, %r8d
	jne	.L15
.L7:
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L17:
	xorl	%eax, %eax
	jmp	.L12
.L16:
	xorl	%eax, %eax
	jmp	.L9
	.seh_endproc
	.p2align 4
	.globl	_Z9dot_naiveRKSt6vectorIiSaIiEERKS_IS1_SaIS1_EERS_IxSaIxEEi
	.def	_Z9dot_naiveRKSt6vectorIiSaIiEERKS_IS1_SaIS1_EERS_IxSaIxEEi;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z9dot_naiveRKSt6vectorIiSaIiEERKS_IS1_SaIS1_EERS_IxSaIxEEi
_Z9dot_naiveRKSt6vectorIiSaIiEERKS_IS1_SaIS1_EERS_IxSaIxEEi:
.LFB8786:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%r9d, %r12d
	testl	%r9d, %r9d
	jle	.L21
	movq	(%r8), %rdi
	movl	%r9d, %ebp
	movq	(%rcx), %rbx
	movq	(%rdx), %rsi
	leaq	0(,%rbp,8), %r8
	xorl	%edx, %edx
	salq	$2, %rbp
	movq	%rdi, %rcx
	call	memset
	leal	-1(%r12), %eax
	xorl	%r10d, %r10d
	leaq	4(%rbx,%rax,4), %r11
	.p2align 4,,10
	.p2align 3
.L25:
	movq	%rsi, %rcx
	movq	%rbx, %rax
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L23:
	movq	(%rcx), %rdx
	movslq	(%rax), %r9
	addq	$4, %rax
	addq	$24, %rcx
	movslq	(%rdx,%r10), %rdx
	imulq	%r9, %rdx
	addq	%rdx, %r8
	cmpq	%rax, %r11
	jne	.L23
	movq	%r8, (%rdi,%r10,2)
	addq	$4, %r10
	cmpq	%r10, %rbp
	jne	.L25
.L21:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.seh_endproc
	.p2align 4
	.globl	_Z9dot_cacheRKSt6vectorIiSaIiEERKS_IS1_SaIS1_EERS_IxSaIxEEi
	.def	_Z9dot_cacheRKSt6vectorIiSaIiEERKS_IS1_SaIS1_EERS_IxSaIxEEi;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z9dot_cacheRKSt6vectorIiSaIiEERKS_IS1_SaIS1_EERS_IxSaIxEEi
_Z9dot_cacheRKSt6vectorIiSaIiEERKS_IS1_SaIS1_EERS_IxSaIxEEi:
.LFB8787:
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$80, %rsp
	.seh_stackalloc	80
	movaps	%xmm6, 32(%rsp)
	.seh_savexmm	%xmm6, 32
	movaps	%xmm7, 48(%rsp)
	.seh_savexmm	%xmm7, 48
	movaps	%xmm8, 64(%rsp)
	.seh_savexmm	%xmm8, 64
	.seh_endprologue
	movq	%rcx, %rbp
	movq	%rdx, %rdi
	movl	%r9d, %ebx
	testl	%r9d, %r9d
	jle	.L27
	movq	(%r8), %rcx
	movl	%r9d, %r8d
	xorl	%edx, %edx
	leal	-1(%r9), %esi
	salq	$3, %r8
	call	memset
	movl	%ebx, %r8d
	movq	(%rdi), %rdi
	movl	%esi, %edx
	movq	%rax, %rcx
	movq	0(%rbp), %rax
	shrl	$2, %r8d
	movl	%ebx, %ebp
	salq	$5, %r8
	movq	(%rdi), %r10
	andl	$-4, %ebp
	pxor	%xmm4, %xmm4
	leaq	4(%rax), %r11
	movslq	(%rax), %r9
	addq	%rcx, %r8
	leaq	(%r11,%rdx,4), %r12
	cmpl	$3, %esi
	jbe	.L34
	.p2align 4,,10
	.p2align 3
.L36:
	movd	%r9d, %xmm6
	movdqa	%xmm4, %xmm7
	movq	%r10, %rdx
	movq	%rcx, %rax
	pshufd	$0, %xmm6, %xmm3
	movdqa	%xmm4, %xmm6
	movdqa	%xmm3, %xmm5
	punpckhdq	%xmm3, %xmm5
	punpckldq	%xmm3, %xmm3
	pcmpgtd	%xmm5, %xmm7
	pcmpgtd	%xmm3, %xmm6
	.p2align 4,,10
	.p2align 3
.L30:
	movdqu	(%rdx), %xmm0
	movdqa	%xmm7, %xmm2
	addq	$32, %rax
	addq	$16, %rdx
	movdqa	%xmm4, %xmm8
	movdqa	%xmm0, %xmm1
	punpckhdq	%xmm0, %xmm1
	punpckldq	%xmm0, %xmm0
	pcmpgtd	%xmm1, %xmm8
	pmuludq	%xmm1, %xmm2
	pmuludq	%xmm5, %xmm1
	pmuludq	%xmm5, %xmm8
	paddq	%xmm8, %xmm2
	movdqa	%xmm4, %xmm8
	psllq	$32, %xmm2
	pcmpgtd	%xmm0, %xmm8
	paddq	%xmm2, %xmm1
	movdqu	-16(%rax), %xmm2
	paddq	%xmm2, %xmm1
	pmuludq	%xmm3, %xmm8
	movdqa	%xmm6, %xmm2
	pmuludq	%xmm0, %xmm2
	pmuludq	%xmm3, %xmm0
	movups	%xmm1, -16(%rax)
	paddq	%xmm8, %xmm2
	psllq	$32, %xmm2
	paddq	%xmm2, %xmm0
	movdqu	-32(%rax), %xmm2
	paddq	%xmm2, %xmm0
	movups	%xmm0, -32(%rax)
	cmpq	%r8, %rax
	jne	.L30
	movl	%ebp, %edx
	cmpl	%ebp, %ebx
	je	.L31
.L29:
	movslq	%edx, %r13
	leaq	0(,%r13,8), %rax
	leaq	0(,%r13,4), %r14
	movslq	(%r10,%r13,4), %r13
	imulq	%r9, %r13
	addq	%r13, (%rcx,%rax)
	leal	1(%rdx), %r13d
	cmpl	%r13d, %ebx
	jle	.L31
	movslq	4(%r10,%r14), %r13
	imulq	%r9, %r13
	addq	%r13, 8(%rcx,%rax)
	leal	2(%rdx), %r13d
	cmpl	%r13d, %ebx
	jle	.L31
	movslq	8(%r10,%r14), %r13
	addl	$3, %edx
	imulq	%r9, %r13
	addq	%r13, 16(%rcx,%rax)
	cmpl	%edx, %ebx
	jle	.L31
	movslq	12(%r10,%r14), %rdx
	imulq	%rdx, %r9
	addq	%r9, 24(%rcx,%rax)
.L31:
	movq	%r11, %rax
	addq	$24, %rdi
	cmpq	%r12, %r11
	je	.L27
	movslq	(%rax), %r9
	movq	(%rdi), %r10
	addq	$4, %r11
	cmpl	$3, %esi
	ja	.L36
.L34:
	xorl	%edx, %edx
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L27:
	movaps	32(%rsp), %xmm6
	movaps	48(%rsp), %xmm7
	movaps	64(%rsp), %xmm8
	addq	$80, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.seh_endproc
	.p2align 4
	.globl	_Z10dot_unrollRKSt6vectorIiSaIiEERKS_IS1_SaIS1_EERS_IxSaIxEEi
	.def	_Z10dot_unrollRKSt6vectorIiSaIiEERKS_IS1_SaIS1_EERS_IxSaIxEEi;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z10dot_unrollRKSt6vectorIiSaIiEERKS_IS1_SaIS1_EERS_IxSaIxEEi
_Z10dot_unrollRKSt6vectorIiSaIiEERKS_IS1_SaIS1_EERS_IxSaIxEEi:
.LFB8788:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$88, %rsp
	.seh_stackalloc	88
	movaps	%xmm6, 32(%rsp)
	.seh_savexmm	%xmm6, 32
	movaps	%xmm7, 48(%rsp)
	.seh_savexmm	%xmm7, 48
	movaps	%xmm8, 64(%rsp)
	.seh_savexmm	%xmm8, 64
	.seh_endprologue
	movq	%rcx, %rbp
	movq	%rdx, %rdi
	movl	%r9d, %ebx
	testl	%r9d, %r9d
	jle	.L37
	movq	(%r8), %r10
	movslq	%r9d, %r12
	xorl	%edx, %edx
	leaq	0(,%r12,8), %r8
	salq	$2, %r12
	movq	%r10, %rcx
	call	memset
	leal	-4(%rbx), %r8d
	movq	0(%rbp), %rbp
	movq	(%rdi), %rdi
	shrl	$2, %r8d
	movq	%rax, %r10
	xorl	%r9d, %r9d
	xorl	%r11d, %r11d
	addl	$1, %r8d
	pxor	%xmm4, %xmm4
	leal	0(,%r8,4), %esi
	.p2align 4,,10
	.p2align 3
.L42:
	cmpl	$3, %ebx
	jle	.L49
	movd	0(%rbp,%r11), %xmm6
	movdqa	%xmm4, %xmm7
	movq	%r10, %rax
	xorl	%edx, %edx
	movq	(%rdi,%r9), %rcx
	pshufd	$0, %xmm6, %xmm3
	movdqa	%xmm4, %xmm6
	movdqa	%xmm3, %xmm5
	punpckhdq	%xmm3, %xmm5
	punpckldq	%xmm3, %xmm3
	pcmpgtd	%xmm5, %xmm7
	pcmpgtd	%xmm3, %xmm6
	.p2align 4,,10
	.p2align 3
.L44:
	movdqu	(%rcx), %xmm0
	movdqa	%xmm4, %xmm8
	movdqa	%xmm7, %xmm2
	addl	$1, %edx
	addq	$32, %rax
	addq	$16, %rcx
	movdqa	%xmm0, %xmm1
	punpckhdq	%xmm0, %xmm1
	punpckldq	%xmm0, %xmm0
	pcmpgtd	%xmm1, %xmm8
	pmuludq	%xmm1, %xmm2
	pmuludq	%xmm5, %xmm1
	pmuludq	%xmm5, %xmm8
	paddq	%xmm8, %xmm2
	movdqa	%xmm4, %xmm8
	psllq	$32, %xmm2
	pcmpgtd	%xmm0, %xmm8
	paddq	%xmm2, %xmm1
	movdqu	-16(%rax), %xmm2
	paddq	%xmm2, %xmm1
	pmuludq	%xmm3, %xmm8
	movdqa	%xmm6, %xmm2
	pmuludq	%xmm0, %xmm2
	pmuludq	%xmm3, %xmm0
	movups	%xmm1, -16(%rax)
	paddq	%xmm8, %xmm2
	psllq	$32, %xmm2
	paddq	%xmm2, %xmm0
	movdqu	-32(%rax), %xmm2
	paddq	%xmm2, %xmm0
	movups	%xmm0, -32(%rax)
	cmpl	%r8d, %edx
	jb	.L44
	movl	%esi, %edx
	cmpl	%esi, %ebx
	jle	.L45
.L39:
	movq	(%rdi,%r9), %r13
	movslq	%edx, %r15
	movslq	0(%rbp,%r11), %rcx
	leaq	0(,%r15,8), %rax
	leaq	0(,%r15,4), %r14
	movslq	0(%r13,%r15,4), %r15
	imulq	%rcx, %r15
	addq	%r15, (%r10,%rax)
	leal	1(%rdx), %r15d
	cmpl	%ebx, %r15d
	jge	.L45
	movslq	4(%r13,%r14), %r15
	imulq	%rcx, %r15
	addq	%r15, 8(%r10,%rax)
	leal	2(%rdx), %r15d
	cmpl	%r15d, %ebx
	jle	.L45
	movslq	8(%r13,%r14), %r15
	addl	$3, %edx
	imulq	%rcx, %r15
	addq	%r15, 16(%r10,%rax)
	cmpl	%edx, %ebx
	jle	.L45
	movslq	12(%r13,%r14), %rdx
	imulq	%rdx, %rcx
	addq	%rcx, 24(%r10,%rax)
.L45:
	addq	$4, %r11
	addq	$24, %r9
	cmpq	%r12, %r11
	jne	.L42
.L37:
	movaps	32(%rsp), %xmm6
	movaps	48(%rsp), %xmm7
	movaps	64(%rsp), %xmm8
	addq	$88, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L49:
	xorl	%edx, %edx
	jmp	.L39
	.seh_endproc
	.p2align 4
	.globl	_Z10check_sameRKSt6vectorIxSaIxEES3_
	.def	_Z10check_sameRKSt6vectorIxSaIxEES3_;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z10check_sameRKSt6vectorIxSaIxEES3_
_Z10check_sameRKSt6vectorIxSaIxEES3_:
.LFB8789:
	.seh_endprologue
	xorl	%r9d, %r9d
	movq	(%rcx), %r8
	movq	8(%rcx), %rax
	movq	(%rdx), %rcx
	movq	8(%rdx), %rdx
	subq	%r8, %rax
	subq	%rcx, %rdx
	cmpq	%rax, %rdx
	jne	.L50
	sarq	$3, %rdx
	je	.L54
	xorl	%eax, %eax
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L57:
	addq	$1, %rax
	cmpq	%rdx, %rax
	je	.L54
.L52:
	movq	(%rcx,%rax,8), %r10
	cmpq	%r10, (%r8,%rax,8)
	je	.L57
	xorl	%r9d, %r9d
.L50:
	movl	%r9d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L54:
	movl	$1, %r9d
	movl	%r9d, %eax
	ret
	.seh_endproc
	.p2align 4
	.globl	_Z13choose_repeati
	.def	_Z13choose_repeati;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z13choose_repeati
_Z13choose_repeati:
.LFB8790:
	.seh_endprologue
	movl	$500, %eax
	cmpl	$100, %ecx
	jle	.L58
	movl	$100, %eax
	cmpl	$512, %ecx
	jle	.L58
	cmpl	$2048, %ecx
	movl	$5, %eax
	movl	$20, %edx
	cmovle	%edx, %eax
.L58:
	ret
	.seh_endproc
	.section	.text$_ZNSt6vectorIS_IiSaIiEESaIS1_EED1Ev,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt6vectorIS_IiSaIiEESaIS1_EED1Ev
	.def	_ZNSt6vectorIS_IiSaIiEESaIS1_EED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorIS_IiSaIiEESaIS1_EED1Ev
_ZNSt6vectorIS_IiSaIiEESaIS1_EED1Ev:
.LFB9084:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	8(%rcx), %rbx
	movq	(%rcx), %r12
	movq	%rcx, %rsi
	cmpq	%r12, %rbx
	je	.L64
	.p2align 4,,10
	.p2align 3
.L68:
	movq	(%r12), %rcx
	testq	%rcx, %rcx
	je	.L65
	movq	16(%r12), %rdx
	addq	$24, %r12
	subq	%rcx, %rdx
	call	_ZdlPvy
	cmpq	%r12, %rbx
	jne	.L68
.L66:
	movq	(%rsi), %r12
.L64:
	testq	%r12, %r12
	je	.L63
	movq	16(%rsi), %rdx
	movq	%r12, %rcx
	subq	%r12, %rdx
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%r12
	jmp	_ZdlPvy
	.p2align 4,,10
	.p2align 3
.L65:
	addq	$24, %r12
	cmpq	%r12, %rbx
	jne	.L68
	jmp	.L66
	.p2align 4,,10
	.p2align 3
.L63:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%r12
	ret
	.seh_endproc
	.section	.text$_ZNSt12_Destroy_auxILb0EE9__destroyIPSt6vectorIiSaIiEEEEvT_S6_,"x"
	.linkonce discard
	.p2align 4
	.globl	_ZNSt12_Destroy_auxILb0EE9__destroyIPSt6vectorIiSaIiEEEEvT_S6_
	.def	_ZNSt12_Destroy_auxILb0EE9__destroyIPSt6vectorIiSaIiEEEEvT_S6_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt12_Destroy_auxILb0EE9__destroyIPSt6vectorIiSaIiEEEEvT_S6_
_ZNSt12_Destroy_auxILb0EE9__destroyIPSt6vectorIiSaIiEEEEvT_S6_:
.LFB9408:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	cmpq	%rdx, %rcx
	je	.L70
	.p2align 4,,10
	.p2align 3
.L74:
	movq	(%rbx), %rcx
	testq	%rcx, %rcx
	je	.L72
	movq	16(%rbx), %rdx
	addq	$24, %rbx
	subq	%rcx, %rdx
	call	_ZdlPvy
	cmpq	%rbx, %rsi
	jne	.L74
.L70:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L72:
	addq	$24, %rbx
	cmpq	%rbx, %rsi
	jne	.L74
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 8
.LC3:
	.ascii "Select Algorithm (1:Naive, 2:Cache, 3:Unroll): \0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB8792:
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$192, %rsp
	.seh_stackalloc	192
	movaps	%xmm6, 144(%rsp)
	.seh_savexmm	%xmm6, 144
	movaps	%xmm7, 160(%rsp)
	.seh_savexmm	%xmm7, 160
	movaps	%xmm8, 176(%rsp)
	.seh_savexmm	%xmm8, 176
	.seh_endprologue
	movl	%ecx, %ebx
	movq	%rdx, %rsi
	call	__main
	movl	$0, 44(%rsp)
	cmpl	$1, %ebx
	jle	.L76
	movq	8(%rsi), %rcx
	call	atoi
	movl	%eax, 44(%rsp)
.L77:
	pxor	%xmm0, %xmm0
	movl	$120000, %ecx
	movq	$0, 64(%rsp)
	movaps	%xmm0, 48(%rsp)
.LEHB0:
	call	_Znwy
.LEHE0:
	movdqa	.LC4(%rip), %xmm6
	leaq	120000(%rax), %rdx
	movq	%rax, %xmm0
	movq	%rdx, 64(%rsp)
	punpcklqdq	%xmm0, %xmm0
	movaps	%xmm0, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L78:
	movups	%xmm6, (%rax)
	addq	$16, %rax
	cmpq	%rax, %rdx
	jne	.L78
	movl	$120000, %ecx
	movq	%rdx, 56(%rsp)
.LEHB1:
	call	_Znwy
.LEHE1:
	movq	%rax, %r13
	leaq	120000(%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L79:
	movups	%xmm6, (%rax)
	addq	$16, %rax
	cmpq	%rax, %rdx
	jne	.L79
	pxor	%xmm0, %xmm0
	movl	$720000, %ecx
	movq	$0, 96(%rsp)
	movaps	%xmm0, 80(%rsp)
.LEHB2:
	call	_Znwy
.LEHE2:
	movq	%rax, %xmm0
	movq	%rax, %r12
	pxor	%xmm6, %xmm6
	movq	%rax, %r14
	leaq	720000(%rax), %rbp
	punpcklqdq	%xmm0, %xmm0
	movq	%rbp, 96(%rsp)
	movaps	%xmm0, 80(%rsp)
	.p2align 4,,10
	.p2align 3
.L80:
	movq	$0, 16(%r14)
	movl	$120000, %ecx
	movups	%xmm6, (%r14)
.LEHB3:
	call	_Znwy
.LEHE3:
	leaq	120000(%rax), %rsi
	movq	%rax, (%r14)
	movq	%rax, %rcx
	movq	%r13, %rdx
	movq	%rsi, 16(%r14)
	movl	$120000, %r8d
	addq	$24, %r14
	call	memcpy
	movq	%rsi, -16(%r14)
	cmpq	%r14, %rbp
	jne	.L80
	movq	%r13, %rcx
	movl	$120000, %edx
	movq	%rbp, 88(%rsp)
	call	_ZdlPvy
	pxor	%xmm0, %xmm0
	movl	$240000, %ecx
	movq	$0, 128(%rsp)
	movaps	%xmm0, 112(%rsp)
.LEHB4:
	call	_Znwy
.LEHE4:
	movq	%rax, %xmm0
	movl	$240000, %r8d
	xorl	%edx, %edx
	movq	%rax, %rcx
	leaq	240000(%rax), %rbx
	punpcklqdq	%xmm0, %xmm0
	movq	%rbx, 128(%rsp)
	movaps	%xmm0, 112(%rsp)
	call	memset
	movq	%rbx, 120(%rsp)
	movq	%rax, %r9
	movl	44(%rsp), %eax
	cmpl	$1, %eax
	je	.L135
	cmpl	$2, %eax
	je	.L136
	cmpl	$3, %eax
	je	.L137
.L89:
	movl	$240000, %edx
	leaq	80(%rsp), %r12
.L101:
	movq	%r9, %rcx
	call	_ZdlPvy
.L96:
	movq	%r12, %rcx
	call	_ZNSt6vectorIS_IiSaIiEESaIS1_EED1Ev
	movq	48(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L113
	movq	64(%rsp), %rdx
	subq	%rcx, %rdx
	call	_ZdlPvy
	nop
.L113:
	movaps	144(%rsp), %xmm6
	movaps	160(%rsp), %xmm7
	xorl	%eax, %eax
	movaps	176(%rsp), %xmm8
	addq	$192, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L136:
	movq	80(%rsp), %rsi
	movq	48(%rsp), %rdi
	movl	$10, %ebx
	pxor	%xmm6, %xmm6
	leaq	720000(%rsi), %rbp
.L94:
	movq	%r9, %rcx
	movl	$240000, %r8d
	xorl	%edx, %edx
	call	memset
	movq	%rdi, %r8
	movq	%rsi, %rcx
	movq	%rax, %r9
	.p2align 4,,10
	.p2align 3
.L93:
	movd	(%r8), %xmm5
	movdqa	%xmm6, %xmm7
	movq	(%rcx), %rdx
	xorl	%eax, %eax
	pshufd	$0, %xmm5, %xmm3
	movdqa	%xmm6, %xmm5
	movdqa	%xmm3, %xmm4
	punpckhdq	%xmm3, %xmm4
	punpckldq	%xmm3, %xmm3
	pcmpgtd	%xmm4, %xmm7
	pcmpgtd	%xmm3, %xmm5
	.p2align 4,,10
	.p2align 3
.L92:
	movdqu	(%rdx,%rax), %xmm0
	movdqa	%xmm6, %xmm2
	movdqa	%xmm7, %xmm8
	movdqa	%xmm0, %xmm1
	punpckhdq	%xmm0, %xmm1
	punpckldq	%xmm0, %xmm0
	pcmpgtd	%xmm1, %xmm2
	pmuludq	%xmm1, %xmm8
	pmuludq	%xmm4, %xmm1
	pmuludq	%xmm4, %xmm2
	paddq	%xmm8, %xmm2
	movdqa	%xmm5, %xmm8
	psllq	$32, %xmm2
	pmuludq	%xmm0, %xmm8
	paddq	%xmm2, %xmm1
	movdqu	16(%r9,%rax,2), %xmm2
	paddq	%xmm2, %xmm1
	movdqa	%xmm6, %xmm2
	pcmpgtd	%xmm0, %xmm2
	pmuludq	%xmm3, %xmm0
	movups	%xmm1, 16(%r9,%rax,2)
	pmuludq	%xmm3, %xmm2
	paddq	%xmm8, %xmm2
	psllq	$32, %xmm2
	paddq	%xmm2, %xmm0
	movdqu	(%r9,%rax,2), %xmm2
	paddq	%xmm2, %xmm0
	movups	%xmm0, (%r9,%rax,2)
	addq	$16, %rax
	cmpq	$120000, %rax
	jne	.L92
	addq	$24, %rcx
	addq	$4, %r8
	cmpq	%rcx, %rbp
	jne	.L93
	subl	$1, %ebx
	jne	.L94
	jmp	.L89
.L76:
	movq	.refptr._ZSt4cout(%rip), %rcx
	movl	$47, %r8d
	leaq	.LC3(%rip), %rdx
.LEHB5:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	.refptr._ZSt3cin(%rip), %rcx
	leaq	44(%rsp), %rdx
	call	_ZNSirsERi
	jmp	.L77
.L135:
	movq	80(%rsp), %rdi
	movq	48(%rsp), %rbp
	movl	$10, %ebx
	leaq	720000(%rdi), %rsi
	.p2align 4,,10
	.p2align 3
.L90:
	movq	%r9, %rcx
	movl	$240000, %r8d
	xorl	%edx, %edx
	call	memset
	xorl	%r11d, %r11d
	movq	%rax, %r9
	.p2align 4,,10
	.p2align 3
.L88:
	movq	%rbp, %rcx
	movq	%rdi, %rax
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L87:
	movq	(%rax), %rdx
	movslq	(%rcx), %r10
	addq	$24, %rax
	addq	$4, %rcx
	movslq	(%rdx,%r11), %rdx
	imulq	%r10, %rdx
	addq	%rdx, %r8
	cmpq	%rax, %rsi
	jne	.L87
	movq	%r8, (%r9,%r11,2)
	addq	$4, %r11
	cmpq	$120000, %r11
	jne	.L88
	subl	$1, %ebx
	jne	.L90
	jmp	.L89
.L137:
	movl	$10, %ebx
	leaq	112(%rsp), %rdi
	leaq	80(%rsp), %r12
	leaq	48(%rsp), %rsi
.L95:
	movl	$30000, %r9d
	movq	%rdi, %r8
	movq	%r12, %rdx
	movq	%rsi, %rcx
	call	_Z10dot_unrollRKSt6vectorIiSaIiEERKS_IS1_SaIS1_EERS_IxSaIxEEi
	subl	$1, %ebx
	jne	.L95
	movq	112(%rsp), %r9
	testq	%r9, %r9
	je	.L96
	movq	128(%rsp), %rdx
	subq	%r9, %rdx
	jmp	.L101
.L103:
	movq	%rax, %r12
	jmp	.L98
.L104:
	leaq	80(%rsp), %rcx
	movq	%rax, %r12
	call	_ZNSt6vectorIS_IiSaIiEESaIS1_EED1Ev
.L98:
	movq	48(%rsp), %rcx
	movq	64(%rsp), %rdx
	subq	%rcx, %rdx
	testq	%rcx, %rcx
	je	.L100
	call	_ZdlPvy
.L100:
	movq	%r12, %rcx
	call	_Unwind_Resume
.LEHE5:
.L106:
	movq	%rax, %rcx
	call	__cxa_begin_catch
	movq	%r14, %rdx
	movq	%r12, %rcx
	call	_ZNSt12_Destroy_auxILb0EE9__destroyIPSt6vectorIiSaIiEEEEvT_S6_
.LEHB6:
	call	__cxa_rethrow
.LEHE6:
.L102:
	movq	%rax, %r12
.L85:
	movl	$120000, %edx
	movq	%r13, %rcx
	call	_ZdlPvy
	jmp	.L98
.L105:
	movq	%rax, %r12
	call	__cxa_end_catch
	movq	80(%rsp), %rcx
	movq	96(%rsp), %rdx
	subq	%rcx, %rdx
	testq	%rcx, %rcx
	je	.L85
	call	_ZdlPvy
	jmp	.L85
	.def	__gxx_personality_seh0;	.scl	2;	.type	32;	.endef
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
	.align 4
.LLSDA8792:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT8792-.LLSDATTD8792
.LLSDATTD8792:
	.byte	0x1
	.uleb128 .LLSDACSE8792-.LLSDACSB8792
.LLSDACSB8792:
	.uleb128 .LEHB0-.LFB8792
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB8792
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L103-.LFB8792
	.uleb128 0
	.uleb128 .LEHB2-.LFB8792
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L102-.LFB8792
	.uleb128 0
	.uleb128 .LEHB3-.LFB8792
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L106-.LFB8792
	.uleb128 0x1
	.uleb128 .LEHB4-.LFB8792
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L104-.LFB8792
	.uleb128 0
	.uleb128 .LEHB5-.LFB8792
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB6-.LFB8792
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L105-.LFB8792
	.uleb128 0
.LLSDACSE8792:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT8792:
	.section	.text.startup,"x"
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "cannot create std::vector larger than max_size()\0"
.LC6:
	.ascii "Result mismatch at n = \0"
	.align 8
.LC7:
	.ascii ",ERROR,ERROR,ERROR,ERROR,ERROR\12\0"
.LC8:
	.ascii ",\0"
.LC9:
	.ascii "\12\0"
	.text
	.p2align 4
	.globl	_Z8run_caseiiRSt14basic_ofstreamIcSt11char_traitsIcEE
	.def	_Z8run_caseiiRSt14basic_ofstreamIcSt11char_traitsIcEE;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8run_caseiiRSt14basic_ofstreamIcSt11char_traitsIcEE
_Z8run_caseiiRSt14basic_ofstreamIcSt11char_traitsIcEE:
.LFB8791:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$392, %rsp
	.seh_stackalloc	392
	movaps	%xmm6, 256(%rsp)
	.seh_savexmm	%xmm6, 256
	movaps	%xmm7, 272(%rsp)
	.seh_savexmm	%xmm7, 272
	movaps	%xmm8, 288(%rsp)
	.seh_savexmm	%xmm8, 288
	movaps	%xmm9, 304(%rsp)
	.seh_savexmm	%xmm9, 304
	movaps	%xmm10, 320(%rsp)
	.seh_savexmm	%xmm10, 320
	movaps	%xmm11, 336(%rsp)
	.seh_savexmm	%xmm11, 336
	movaps	%xmm12, 352(%rsp)
	.seh_savexmm	%xmm12, 352
	movaps	%xmm13, 368(%rsp)
	.seh_savexmm	%xmm13, 368
	.seh_endprologue
	movabsq	$2305843009213693951, %rax
	movslq	%ecx, %rsi
	movl	%edx, 472(%rsp)
	movq	%r8, 480(%rsp)
	movq	%rsi, %r15
	cmpq	%rax, %rsi
	ja	.L344
	pxor	%xmm0, %xmm0
	leaq	0(,%rsi,4), %r14
	movq	$0, 176(%rsp)
	movaps	%xmm0, 160(%rsp)
	testq	%rsi, %rsi
	je	.L140
	movq	%r14, %rcx
.LEHB7:
	call	_Znwy
.LEHE7:
	movq	%rax, %xmm0
	leaq	(%rax,%r14), %rbx
	movq	%rax, %rcx
	punpcklqdq	%xmm0, %xmm0
	movq	%rbx, 176(%rsp)
	movaps	%xmm0, 160(%rsp)
	cmpq	%rax, %rbx
	je	.L141
	movq	%r14, %r8
	xorl	%edx, %edx
	call	memset
.L141:
	movq	%r14, %rcx
	movq	%rbx, 168(%rsp)
.LEHB8:
	call	_Znwy
.LEHE8:
	movq	%rax, %r13
	addq	%r14, %rax
	movq	%rax, 32(%rsp)
	cmpq	%r13, %rax
	je	.L142
	movq	%r14, %r8
	xorl	%edx, %edx
	movq	%r13, %rcx
	call	memset
.L142:
	leaq	(%rsi,%rsi,2), %rbx
	pxor	%xmm0, %xmm0
	movq	$0, 208(%rsp)
	salq	$3, %rbx
	movaps	%xmm0, 192(%rsp)
	movq	%rbx, %rcx
.LEHB9:
	call	_Znwy
.LEHE9:
	movq	%rax, %xmm0
	movq	%rax, 40(%rsp)
	addq	%rbx, %rax
	movq	32(%rsp), %rbx
	punpcklqdq	%xmm0, %xmm0
	movq	%rax, 208(%rsp)
	movaps	%xmm0, 192(%rsp)
	subq	%r13, %rbx
	je	.L345
	movabsq	$9223372036854775804, %rax
	cmpq	32(%rsp), %r13
	je	.L346
	cmpq	%rax, %rbx
	ja	.L151
	movq	40(%rsp), %r12
	movq	%rsi, %rdi
	pxor	%xmm6, %xmm6
	.p2align 4,,10
	.p2align 3
.L152:
	movq	$0, 16(%r12)
	movq	%rbx, %rcx
	movups	%xmm6, (%r12)
.LEHB10:
	call	_Znwy
.LEHE10:
	leaq	(%rax,%rbx), %rbp
	movq	%rax, (%r12)
	movq	%rax, %rcx
	movq	%rbx, %r8
	movq	%rbp, 16(%r12)
	movq	%r13, %rdx
	addq	$24, %r12
	call	memcpy
	movq	%rbp, -16(%r12)
	subq	$1, %rdi
	jne	.L152
.L145:
	movq	32(%rsp), %rdx
	movq	%r13, %rcx
	salq	$3, %rsi
	movq	%r12, 200(%rsp)
	subq	%r13, %rdx
	call	_ZdlPvy
	movq	%rsi, %rcx
.LEHB11:
	call	_Znwy
.LEHE11:
	movq	%rax, %r14
	movq	%rsi, %r8
	addq	%rsi, %rax
	xorl	%edx, %edx
	movq	%r14, %rcx
	movq	%rax, 40(%rsp)
	call	memset
	movq	%rsi, %rcx
.LEHB12:
	call	_Znwy
.LEHE12:
	leaq	(%rax,%rsi), %rdi
	movq	%rax, %rcx
	movq	%rsi, %r8
	xorl	%edx, %edx
	movq	%rdi, 96(%rsp)
	movq	%rax, %r12
	call	memset
	pxor	%xmm0, %xmm0
	movq	%rsi, %rcx
	movq	$0, 240(%rsp)
	movaps	%xmm0, 224(%rsp)
.LEHB13:
	call	_Znwy
.LEHE13:
	movq	%rax, %xmm0
	leaq	(%rax,%rsi), %rbx
	movq	%rax, %rcx
	movq	%rsi, %r8
	punpcklqdq	%xmm0, %xmm0
	xorl	%edx, %edx
	movq	%rbx, 240(%rsp)
	subq	%r12, %rdi
	movaps	%xmm0, 224(%rsp)
	call	memset
	movq	40(%rsp), %rax
	movq	%rdi, 88(%rsp)
	movq	%rbx, 232(%rsp)
	subq	%r14, %rax
	movq	%rax, 48(%rsp)
	sarq	$3, %rax
	movq	%rax, 104(%rsp)
	testl	%r15d, %r15d
	jle	.L159
	movq	160(%rsp), %rdi
	leal	-1(%r15), %eax
	movl	%eax, 32(%rsp)
	movq	%rdi, %r13
	cmpl	$2, %eax
	jbe	.L250
	movl	%r15d, %edx
	movdqa	.LC1(%rip), %xmm0
	movdqa	.LC2(%rip), %xmm2
	movq	%rdi, %rax
	shrl	$2, %edx
	salq	$4, %rdx
	addq	%rdi, %rdx
	.p2align 4,,10
	.p2align 3
.L161:
	movdqa	%xmm0, %xmm1
	addq	$16, %rax
	paddd	%xmm2, %xmm0
	movups	%xmm1, -16(%rax)
	cmpq	%rax, %rdx
	jne	.L161
	movl	%r15d, %eax
	andl	$-4, %eax
	testb	$3, %r15b
	je	.L162
.L160:
	movslq	%eax, %rdx
	movl	%eax, 0(%r13,%rdx,4)
	leal	1(%rax), %edx
	cmpl	%edx, %r15d
	jle	.L162
	movslq	%edx, %rcx
	addl	$2, %eax
	movl	%edx, 0(%r13,%rcx,4)
	cmpl	%eax, %r15d
	jle	.L162
	movslq	%eax, %rdx
	movl	%eax, 0(%r13,%rdx,4)
.L162:
	movq	192(%rsp), %rdi
	movl	%r15d, %eax
	movl	%r15d, %r9d
	xorl	%esi, %esi
	shrl	$2, %eax
	movl	32(%rsp), %r11d
	andl	$-4, %r9d
	movdqa	.LC2(%rip), %xmm3
	movq	%rax, %r10
	movq	%rdi, %rcx
	movq	%rax, 56(%rsp)
	movl	%r9d, 64(%rsp)
	movq	(%rcx), %r8
	salq	$4, %r10
	cmpl	$2, %r11d
	jbe	.L251
	.p2align 4,,10
	.p2align 3
.L348:
	movd	%esi, %xmm7
	movdqa	.LC1(%rip), %xmm1
	movq	%r8, %rax
	leaq	(%r8,%r10), %rdx
	pshufd	$0, %xmm7, %xmm2
	.p2align 4,,10
	.p2align 3
.L164:
	movdqa	%xmm1, %xmm0
	addq	$16, %rax
	paddd	%xmm3, %xmm1
	paddd	%xmm2, %xmm0
	movups	%xmm0, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L164
	movl	%r9d, %eax
	cmpl	%r9d, %r15d
	je	.L165
.L163:
	movslq	%eax, %rdx
	leal	(%rsi,%rax), %ebp
	movl	%ebp, (%r8,%rdx,4)
	leaq	0(,%rdx,4), %rbx
	leal	1(%rax), %edx
	cmpl	%edx, %r15d
	jle	.L165
	addl	%esi, %edx
	addl	$2, %eax
	movl	%edx, 4(%r8,%rbx)
	cmpl	%eax, %r15d
	jle	.L165
	addl	%esi, %eax
	movl	%eax, 8(%r8,%rbx)
.L165:
	leal	1(%rsi), %ebp
	addq	$24, %rcx
	cmpl	%ebp, %r15d
	je	.L347
	movq	(%rcx), %r8
	movl	%ebp, %esi
	cmpl	$2, %r11d
	ja	.L348
.L251:
	xorl	%eax, %eax
	jmp	.L163
.L346:
	cmpq	%rax, %rbx
	ja	.L151
	movq	40(%rsp), %r12
	movq	%rsi, %rdi
	pxor	%xmm6, %xmm6
	.p2align 4,,10
	.p2align 3
.L149:
	movq	$0, 16(%r12)
	movq	%rbx, %rcx
	movups	%xmm6, (%r12)
.LEHB14:
	call	_Znwy
.LEHE14:
	movq	%rax, (%r12)
	addq	%rbx, %rax
	addq	$24, %r12
	movq	%rax, -8(%r12)
	movq	%rax, -16(%r12)
	subq	$1, %rdi
	jne	.L149
.L249:
	movq	32(%rsp), %r13
	jmp	.L145
	.p2align 4,,10
	.p2align 3
.L347:
	movl	%r15d, %ebx
	xorl	%edx, %edx
	movq	%r14, %rcx
	leaq	0(,%rbx,8), %rax
	movq	%rax, %r8
	movq	%rax, 72(%rsp)
	call	memset
	movl	32(%rsp), %eax
	movq	%r12, 80(%rsp)
	xorl	%r10d, %r10d
	leaq	0(,%rbx,4), %r11
	movq	%r13, %r12
	leaq	4(%r13,%rax,4), %rbx
	.p2align 4,,10
	.p2align 3
.L168:
	movq	%rdi, %rcx
	movq	%r12, %rax
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L167:
	movq	(%rcx), %rdx
	movslq	(%rax), %r9
	addq	$4, %rax
	addq	$24, %rcx
	movslq	(%rdx,%r10), %rdx
	imulq	%r9, %rdx
	addq	%rdx, %r8
	cmpq	%rax, %rbx
	jne	.L167
	movq	%r8, (%r14,%r10,2)
	addq	$4, %r10
	cmpq	%r11, %r10
	jne	.L168
	movq	80(%rsp), %r12
	movq	72(%rsp), %r8
	xorl	%edx, %edx
	movq	%r12, %rcx
	call	memset
	movq	56(%rsp), %rax
	movq	%r14, 56(%rsp)
	pxor	%xmm4, %xmm4
	movl	64(%rsp), %r14d
	salq	$5, %rax
	addq	%r12, %rax
	.p2align 4,,10
	.p2align 3
.L172:
	cmpl	$3, 32(%rsp)
	movslq	0(%r13), %r9
	movq	(%rdi), %r8
	jbe	.L253
	movd	%r9d, %xmm7
	movdqa	%xmm4, %xmm6
	movq	%r8, %rcx
	movq	%r12, %rdx
	pshufd	$0, %xmm7, %xmm3
	movdqa	%xmm4, %xmm7
	movdqa	%xmm3, %xmm5
	punpckhdq	%xmm3, %xmm5
	punpckldq	%xmm3, %xmm3
	pcmpgtd	%xmm5, %xmm7
	pcmpgtd	%xmm3, %xmm6
	.p2align 4,,10
	.p2align 3
.L170:
	movdqu	(%rcx), %xmm0
	movdqa	%xmm7, %xmm2
	addq	$32, %rdx
	addq	$16, %rcx
	movdqa	%xmm4, %xmm8
	movdqa	%xmm0, %xmm1
	punpckhdq	%xmm0, %xmm1
	punpckldq	%xmm0, %xmm0
	pcmpgtd	%xmm1, %xmm8
	pmuludq	%xmm1, %xmm2
	pmuludq	%xmm5, %xmm1
	pmuludq	%xmm5, %xmm8
	paddq	%xmm8, %xmm2
	movdqa	%xmm4, %xmm8
	psllq	$32, %xmm2
	pcmpgtd	%xmm0, %xmm8
	paddq	%xmm2, %xmm1
	movdqu	-16(%rdx), %xmm2
	paddq	%xmm2, %xmm1
	pmuludq	%xmm3, %xmm8
	movdqa	%xmm6, %xmm2
	pmuludq	%xmm0, %xmm2
	pmuludq	%xmm3, %xmm0
	movups	%xmm1, -16(%rdx)
	paddq	%xmm8, %xmm2
	psllq	$32, %xmm2
	paddq	%xmm2, %xmm0
	movdqu	-32(%rdx), %xmm2
	paddq	%xmm2, %xmm0
	movups	%xmm0, -32(%rdx)
	cmpq	%rdx, %rax
	jne	.L170
	movl	%r14d, %ecx
	cmpl	%r14d, %r15d
	je	.L171
.L169:
	movslq	%ecx, %r10
	leaq	0(,%r10,8), %rdx
	leaq	0(,%r10,4), %r11
	movslq	(%r8,%r10,4), %r10
	imulq	%r9, %r10
	addq	%r10, (%r12,%rdx)
	cmpl	%ecx, %esi
	jle	.L171
	movslq	4(%r8,%r11), %r10
	imulq	%r9, %r10
	addq	%r10, 8(%r12,%rdx)
	leal	2(%rcx), %r10d
	cmpl	%r10d, %ebp
	jle	.L171
	movslq	8(%r8,%r11), %r10
	addl	$3, %ecx
	imulq	%r9, %r10
	addq	%r10, 16(%r12,%rdx)
	cmpl	%ecx, %ebp
	jle	.L171
	movslq	12(%r8,%r11), %rcx
	imulq	%rcx, %r9
	addq	%r9, 24(%r12,%rdx)
.L171:
	addq	$4, %r13
	addq	$24, %rdi
	cmpq	%r13, %rbx
	jne	.L172
	movq	56(%rsp), %r14
.L159:
	leaq	160(%rsp), %rax
	leaq	192(%rsp), %r13
	movl	%r15d, %r9d
	leaq	224(%rsp), %r8
	movq	%r13, %rdx
	movq	%rax, %rcx
	movq	%rax, 56(%rsp)
	movq	%r8, 32(%rsp)
	call	_Z10dot_unrollRKSt6vectorIiSaIiEERKS_IS1_SaIS1_EERS_IxSaIxEEi
	movq	48(%rsp), %rdi
	cmpq	%rdi, 88(%rsp)
	jne	.L173
	movq	104(%rsp), %rdx
	testq	%rdx, %rdx
	je	.L174
	xorl	%eax, %eax
	jmp	.L175
	.p2align 4,,10
	.p2align 3
.L350:
	addq	$1, %rax
	cmpq	%rdx, %rax
	je	.L349
.L175:
	movq	(%r14,%rax,8), %rdi
	cmpq	%rdi, (%r12,%rax,8)
	je	.L350
.L173:
	movq	.refptr._ZSt4cout(%rip), %rcx
	movl	$23, %r8d
	leaq	.LC6(%rip), %rdx
.LEHB15:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	.refptr._ZSt4cout(%rip), %rcx
	movl	%r15d, %edx
	call	_ZNSolsEi
	movq	%rax, %rbx
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%rbx,%rax), %rsi
	testq	%rsi, %rsi
	je	.L351
	cmpb	$0, 56(%rsi)
	je	.L183
	movsbl	67(%rsi), %edx
.L184:
	movq	%rbx, %rcx
	call	_ZNSo3putEc
	movq	%rax, %rcx
	call	_ZNSo5flushEv
	movq	480(%rsp), %rcx
	movl	%r15d, %edx
	call	_ZNSolsEi
	movq	%rax, %rcx
	movl	$31, %r8d
	leaq	.LC7(%rip), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	224(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L185
	movq	240(%rsp), %rdx
	subq	%rcx, %rdx
	call	_ZdlPvy
.L185:
	testq	%r12, %r12
	je	.L186
	movq	96(%rsp), %rdx
	movq	%r12, %rcx
	subq	%r12, %rdx
	call	_ZdlPvy
.L186:
	testq	%r14, %r14
	je	.L187
	movq	40(%rsp), %rdx
	movq	%r14, %rcx
	subq	%r14, %rdx
	call	_ZdlPvy
.L187:
	movq	200(%rsp), %rbx
	movq	192(%rsp), %r12
	cmpq	%r12, %rbx
	je	.L224
	.p2align 4,,10
	.p2align 3
.L192:
	movq	(%r12), %rcx
	testq	%rcx, %rcx
	je	.L189
	movq	16(%r12), %rdx
	addq	$24, %r12
	subq	%rcx, %rdx
	call	_ZdlPvy
	cmpq	%rbx, %r12
	jne	.L192
.L226:
	movq	192(%rsp), %r12
.L224:
	testq	%r12, %r12
	je	.L229
	movq	208(%rsp), %rdx
	movq	%r12, %rcx
	subq	%r12, %rdx
	call	_ZdlPvy
.L229:
	movq	160(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L138
	movq	176(%rsp), %rdx
	subq	%rcx, %rdx
	call	_ZdlPvy
	nop
.L138:
	movaps	256(%rsp), %xmm6
	movaps	272(%rsp), %xmm7
	movaps	288(%rsp), %xmm8
	movaps	304(%rsp), %xmm9
	movaps	320(%rsp), %xmm10
	movaps	336(%rsp), %xmm11
	movaps	352(%rsp), %xmm12
	movaps	368(%rsp), %xmm13
	addq	$392, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L189:
	addq	$24, %r12
	cmpq	%r12, %rbx
	jne	.L192
	jmp	.L226
	.p2align 4,,10
	.p2align 3
.L253:
	xorl	%ecx, %ecx
	jmp	.L169
.L183:
	movq	%rsi, %rcx
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rsi), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movl	$10, %edx
	movq	48(%rax), %rax
	cmpq	%rcx, %rax
	je	.L184
	movq	%rsi, %rcx
	call	*%rax
	movsbl	%al, %edx
	jmp	.L184
.L140:
	leaq	160(%rsp), %rax
	xorl	%r9d, %r9d
	xorl	%r12d, %r12d
	xorl	%r14d, %r14d
	leaq	192(%rsp), %r13
	movq	%rax, %rcx
	leaq	224(%rsp), %r8
	movq	$0, 160(%rsp)
	movq	%r13, %rdx
	movq	$0, 176(%rsp)
	movq	$0, 168(%rsp)
	movq	$0, 192(%rsp)
	movq	$0, 208(%rsp)
	movq	$0, 200(%rsp)
	movq	$0, 224(%rsp)
	movq	$0, 240(%rsp)
	movq	$0, 232(%rsp)
	movq	%r8, 32(%rsp)
	movq	%rax, 56(%rsp)
	call	_Z10dot_unrollRKSt6vectorIiSaIiEERKS_IS1_SaIS1_EERS_IxSaIxEEi
	movq	$0, 48(%rsp)
	movq	$0, 40(%rsp)
	movq	$0, 96(%rsp)
.L174:
	movq	232(%rsp), %rax
	subq	224(%rsp), %rax
	cmpq	%rax, 48(%rsp)
	jne	.L173
.L178:
	cmpb	$0, _ZZ6now_usvE11initialized(%rip)
	je	.L352
.L238:
	movq	__imp_QueryPerformanceCounter(%rip), %rax
	leaq	112(%rsp), %rcx
	movq	%rax, 80(%rsp)
	call	*%rax
	pxor	%xmm9, %xmm9
	movsd	.LC0(%rip), %xmm7
	pxor	%xmm0, %xmm0
	movl	472(%rsp), %ecx
	cvtsi2sdq	112(%rsp), %xmm9
	cvtsi2sdq	_ZZ6now_usvE4freq(%rip), %xmm0
	mulsd	%xmm7, %xmm9
	divsd	%xmm0, %xmm9
	testl	%ecx, %ecx
	jle	.L196
	movq	160(%rsp), %rdi
	movq	192(%rsp), %rbp
	testl	%r15d, %r15d
	jle	.L196
	movl	%r15d, %esi
	movq	%r13, 64(%rsp)
	leal	-1(%r15), %eax
	xorl	%r11d, %r11d
	leaq	0(,%rsi,8), %rcx
	movq	%r12, 48(%rsp)
	movq	%r14, %r9
	salq	$2, %rsi
	movl	472(%rsp), %r13d
	leaq	4(%rdi,%rax,4), %rbx
	movl	%r11d, %r14d
	movq	%rcx, %r12
.L198:
	movq	%r9, %rcx
	movq	%r12, %r8
	xorl	%edx, %edx
	call	memset
	xorl	%r11d, %r11d
	movq	%rax, %r9
	.p2align 4,,10
	.p2align 3
.L197:
	movq	%rbp, %rcx
	movq	%rdi, %rax
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L199:
	movq	(%rcx), %rdx
	movslq	(%rax), %r10
	addq	$4, %rax
	addq	$24, %rcx
	movslq	(%rdx,%r11), %rdx
	imulq	%r10, %rdx
	addq	%rdx, %r8
	cmpq	%rax, %rbx
	jne	.L199
	movq	%r8, (%r9,%r11,2)
	addq	$4, %r11
	cmpq	%r11, %rsi
	jne	.L197
	addl	$1, %r14d
	cmpl	%r14d, %r13d
	jne	.L198
	movq	48(%rsp), %r12
	movq	64(%rsp), %r13
	movq	%r9, %r14
.L196:
	cmpb	$0, _ZZ6now_usvE11initialized(%rip)
	je	.L353
.L180:
	movq	80(%rsp), %rax
	leaq	120(%rsp), %rcx
	call	*%rax
	pxor	%xmm6, %xmm6
	pxor	%xmm0, %xmm0
	cmpb	$0, _ZZ6now_usvE11initialized(%rip)
	cvtsi2sdq	120(%rsp), %xmm6
	cvtsi2sdq	_ZZ6now_usvE4freq(%rip), %xmm0
	mulsd	%xmm7, %xmm6
	divsd	%xmm0, %xmm6
	je	.L354
.L201:
	movq	80(%rsp), %rax
	leaq	128(%rsp), %rcx
	call	*%rax
	pxor	%xmm8, %xmm8
	pxor	%xmm0, %xmm0
	movl	472(%rsp), %edx
	cvtsi2sdq	128(%rsp), %xmm8
	cvtsi2sdq	_ZZ6now_usvE4freq(%rip), %xmm0
	mulsd	%xmm7, %xmm8
	divsd	%xmm0, %xmm8
	testl	%edx, %edx
	jle	.L206
	movq	192(%rsp), %rax
	movq	%r14, 88(%rsp)
	movl	%r15d, %ebx
	pxor	%xmm10, %xmm10
	movq	%r13, 104(%rsp)
	andl	$-4, %ebx
	movq	%rax, 48(%rsp)
	leal	-1(%r15), %eax
	leaq	8(,%rax,8), %rdi
	movq	%rax, %rsi
	movq	%rdi, 72(%rsp)
	movq	160(%rsp), %rdi
	leaq	4(%rdi,%rax,4), %rbp
	movq	%rdi, 64(%rsp)
	movl	%r15d, %edi
	xorl	%eax, %eax
	shrl	$2, %edi
	movl	%eax, %r13d
	salq	$4, %rdi
.L207:
	testl	%r15d, %r15d
	jle	.L211
	movq	72(%rsp), %r8
	xorl	%edx, %edx
	movq	%r12, %rcx
	call	memset
	movq	48(%rsp), %r10
	movq	64(%rsp), %r8
	.p2align 4,,10
	.p2align 3
.L212:
	movslq	(%r8), %r11
	movq	(%r10), %r9
	cmpl	$3, %esi
	jbe	.L255
	movd	%r11d, %xmm4
	movdqa	%xmm10, %xmm5
	movq	%r9, %rdx
	movq	%r12, %rax
	pshufd	$0, %xmm4, %xmm2
	movdqa	%xmm10, %xmm4
	leaq	(%r9,%rdi), %rcx
	movdqa	%xmm2, %xmm3
	punpckhdq	%xmm2, %xmm3
	punpckldq	%xmm2, %xmm2
	pcmpgtd	%xmm3, %xmm5
	pcmpgtd	%xmm2, %xmm4
	.p2align 4,,10
	.p2align 3
.L209:
	movdqu	(%rdx), %xmm0
	movdqa	%xmm10, %xmm11
	addq	$16, %rdx
	addq	$32, %rax
	movdqa	%xmm5, %xmm13
	movdqa	%xmm0, %xmm1
	punpckhdq	%xmm0, %xmm1
	punpckldq	%xmm0, %xmm0
	pcmpgtd	%xmm1, %xmm11
	pmuludq	%xmm1, %xmm13
	movdqa	%xmm11, %xmm12
	movdqa	%xmm1, %xmm11
	movdqu	-16(%rax), %xmm1
	pmuludq	%xmm3, %xmm12
	pmuludq	%xmm3, %xmm11
	paddq	%xmm13, %xmm12
	psllq	$32, %xmm12
	paddq	%xmm12, %xmm11
	movdqa	%xmm4, %xmm12
	paddq	%xmm1, %xmm11
	pmuludq	%xmm0, %xmm12
	movdqa	%xmm10, %xmm1
	pcmpgtd	%xmm0, %xmm1
	pmuludq	%xmm2, %xmm0
	movups	%xmm11, -16(%rax)
	pmuludq	%xmm2, %xmm1
	paddq	%xmm12, %xmm1
	psllq	$32, %xmm1
	paddq	%xmm1, %xmm0
	movdqu	-32(%rax), %xmm1
	paddq	%xmm1, %xmm0
	movups	%xmm0, -32(%rax)
	cmpq	%rcx, %rdx
	jne	.L209
	movl	%ebx, %edx
	cmpl	%r15d, %ebx
	je	.L210
.L208:
	movslq	%edx, %r14
	leaq	0(,%r14,8), %rax
	leaq	0(,%r14,4), %rcx
	movslq	(%r9,%r14,4), %r14
	imulq	%r11, %r14
	addq	%r14, (%r12,%rax)
	leal	1(%rdx), %r14d
	cmpl	%r14d, %r15d
	jle	.L210
	movslq	4(%r9,%rcx), %r14
	imulq	%r11, %r14
	addq	%r14, 8(%r12,%rax)
	leal	2(%rdx), %r14d
	cmpl	%r14d, %r15d
	jle	.L210
	movslq	8(%r9,%rcx), %r14
	addl	$3, %edx
	imulq	%r11, %r14
	addq	%r14, 16(%r12,%rax)
	cmpl	%edx, %r15d
	jle	.L210
	movslq	12(%r9,%rcx), %rdx
	imulq	%rdx, %r11
	addq	%r11, 24(%r12,%rax)
.L210:
	addq	$4, %r8
	addq	$24, %r10
	cmpq	%r8, %rbp
	jne	.L212
.L211:
	addl	$1, %r13d
	cmpl	%r13d, 472(%rsp)
	jne	.L207
	movq	88(%rsp), %r14
	movq	104(%rsp), %r13
.L206:
	cmpb	$0, _ZZ6now_usvE11initialized(%rip)
	je	.L355
.L203:
	movq	80(%rsp), %rax
	leaq	136(%rsp), %rcx
	call	*%rax
	pxor	%xmm11, %xmm11
	pxor	%xmm0, %xmm0
	cmpb	$0, _ZZ6now_usvE11initialized(%rip)
	cvtsi2sdq	136(%rsp), %xmm11
	cvtsi2sdq	_ZZ6now_usvE4freq(%rip), %xmm0
	mulsd	%xmm7, %xmm11
	divsd	%xmm0, %xmm11
	je	.L356
.L213:
	movq	80(%rsp), %rax
	leaq	144(%rsp), %rcx
	call	*%rax
	pxor	%xmm10, %xmm10
	pxor	%xmm0, %xmm0
	movl	472(%rsp), %eax
	xorl	%ebx, %ebx
	cvtsi2sdq	144(%rsp), %xmm10
	cvtsi2sdq	_ZZ6now_usvE4freq(%rip), %xmm0
	mulsd	%xmm7, %xmm10
	divsd	%xmm0, %xmm10
	testl	%eax, %eax
	jle	.L217
	movl	472(%rsp), %esi
	movq	32(%rsp), %rdi
	movq	56(%rsp), %rbp
.L214:
	movl	%r15d, %r9d
	movq	%rdi, %r8
	movq	%r13, %rdx
	movq	%rbp, %rcx
	call	_Z10dot_unrollRKSt6vectorIiSaIiEERKS_IS1_SaIS1_EERS_IxSaIxEEi
	addl	$1, %ebx
	cmpl	%ebx, %esi
	jne	.L214
.L217:
	cmpb	$0, _ZZ6now_usvE11initialized(%rip)
	je	.L357
.L215:
	movq	80(%rsp), %rax
	leaq	152(%rsp), %rcx
	call	*%rax
	pxor	%xmm0, %xmm0
	subsd	%xmm9, %xmm6
	subsd	%xmm8, %xmm11
	movl	%r15d, %edx
	cvtsi2sdq	152(%rsp), %xmm0
	movq	.refptr._ZSt4cout(%rip), %rcx
	movq	(%rcx), %rax
	mulsd	%xmm0, %xmm7
	pxor	%xmm0, %xmm0
	movq	-24(%rax), %rax
	cvtsi2sdq	_ZZ6now_usvE4freq(%rip), %xmm0
	movq	$8, 16(%rax,%rcx)
	divsd	%xmm0, %xmm7
	pxor	%xmm0, %xmm0
	cvtsi2sdl	472(%rsp), %xmm0
	divsd	%xmm0, %xmm6
	subsd	%xmm10, %xmm7
	divsd	%xmm0, %xmm11
	movapd	%xmm6, %xmm10
	movapd	%xmm6, %xmm9
	divsd	%xmm0, %xmm7
	divsd	%xmm11, %xmm10
	divsd	%xmm7, %xmm9
	call	_ZNSolsEi
	movq	%rax, %rcx
	movq	(%rax), %rax
	movapd	%xmm6, %xmm1
	movq	-24(%rax), %rdx
	movq	$16, 16(%rcx,%rdx)
	movq	-24(%rax), %rdx
	addq	%rcx, %rdx
	movl	24(%rdx), %eax
	movq	$3, 8(%rdx)
	andl	$-261, %eax
	orl	$4, %eax
	movl	%eax, 24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_
	movq	%rax, %rcx
	movq	(%rax), %rax
	movapd	%xmm11, %xmm1
	movq	-24(%rax), %rdx
	movq	$16, 16(%rcx,%rdx)
	movq	-24(%rax), %rdx
	addq	%rcx, %rdx
	movl	24(%rdx), %eax
	movq	$3, 8(%rdx)
	andl	$-261, %eax
	orl	$4, %eax
	movl	%eax, 24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_
	movq	%rax, %rcx
	movq	(%rax), %rax
	movapd	%xmm7, %xmm1
	movq	-24(%rax), %rdx
	movq	$16, 16(%rcx,%rdx)
	movq	-24(%rax), %rdx
	addq	%rcx, %rdx
	movl	24(%rdx), %eax
	movq	$3, 8(%rdx)
	andl	$-261, %eax
	orl	$4, %eax
	movl	%eax, 24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_
	movq	%rax, %rcx
	movq	(%rax), %rax
	movapd	%xmm10, %xmm1
	movq	-24(%rax), %rdx
	movq	$16, 16(%rcx,%rdx)
	movq	-24(%rax), %rdx
	addq	%rcx, %rdx
	movl	24(%rdx), %eax
	movq	$3, 8(%rdx)
	andl	$-261, %eax
	orl	$4, %eax
	movl	%eax, 24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_
	movq	%rax, %rcx
	movq	(%rax), %rax
	movapd	%xmm9, %xmm1
	movq	-24(%rax), %rdx
	movq	$16, 16(%rcx,%rdx)
	movq	-24(%rax), %rdx
	addq	%rcx, %rdx
	movl	24(%rdx), %eax
	movq	$3, 8(%rdx)
	andl	$-261, %eax
	orl	$4, %eax
	movl	%eax, 24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_
	movq	%rax, %rbx
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%rbx,%rax), %rsi
	testq	%rsi, %rsi
	je	.L358
	cmpb	$0, 56(%rsi)
	je	.L219
	movsbl	67(%rsi), %edx
.L220:
	movq	%rbx, %rcx
	call	_ZNSo3putEc
	movq	%rax, %rcx
	call	_ZNSo5flushEv
	movq	480(%rsp), %rcx
	movl	%r15d, %edx
	call	_ZNSolsEi
	movl	$1, %r8d
	leaq	.LC8(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %r15
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	(%r15), %rax
	movapd	%xmm6, %xmm1
	movq	%r15, %rcx
	movq	-24(%rax), %rdx
	addq	%r15, %rdx
	movl	24(%rdx), %eax
	movq	$3, 8(%rdx)
	andl	$-261, %eax
	orl	$4, %eax
	movl	%eax, 24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	leaq	.LC8(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %r15
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movapd	%xmm11, %xmm1
	movq	%r15, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	leaq	.LC8(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %r15
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movapd	%xmm7, %xmm1
	movq	%r15, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	leaq	.LC8(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %r15
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movapd	%xmm10, %xmm1
	movq	%r15, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	leaq	.LC8(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %r15
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movapd	%xmm9, %xmm1
	movq	%r15, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movq	%rax, %rcx
	movl	$1, %r8d
	leaq	.LC9(%rip), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	224(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L221
	movq	240(%rsp), %rdx
	subq	%rcx, %rdx
	call	_ZdlPvy
.L221:
	testq	%r12, %r12
	je	.L222
	movq	96(%rsp), %rdx
	movq	%r12, %rcx
	subq	%r12, %rdx
	call	_ZdlPvy
.L222:
	testq	%r14, %r14
	je	.L223
	movq	40(%rsp), %rdx
	movq	%r14, %rcx
	subq	%r14, %rdx
	call	_ZdlPvy
.L223:
	movq	200(%rsp), %rbx
	movq	192(%rsp), %r12
	cmpq	%r12, %rbx
	je	.L224
.L228:
	movq	(%r12), %rcx
	testq	%rcx, %rcx
	je	.L225
.L359:
	movq	16(%r12), %rdx
	addq	$24, %r12
	subq	%rcx, %rdx
	call	_ZdlPvy
	cmpq	%r12, %rbx
	je	.L226
	movq	(%r12), %rcx
	testq	%rcx, %rcx
	jne	.L359
.L225:
	addq	$24, %r12
	cmpq	%r12, %rbx
	jne	.L228
	jmp	.L226
.L345:
	movq	40(%rsp), %r12
	pxor	%xmm0, %xmm0
	cmpq	32(%rsp), %r13
	je	.L146
	.p2align 4,,10
	.p2align 3
.L144:
	movups	%xmm0, (%r12)
	addq	$24, %r12
	movq	$0, -8(%r12)
	movq	$0, -16(%r12)
	cmpq	%r12, %rax
	jne	.L144
	jmp	.L145
	.p2align 4,,10
	.p2align 3
.L146:
	movups	%xmm0, (%r12)
	addq	$24, %r12
	movq	$0, -8(%r12)
	movq	$0, -16(%r12)
	cmpq	%r12, %rax
	jne	.L146
	jmp	.L249
.L349:
	movq	224(%rsp), %rdx
	movq	232(%rsp), %rax
	subq	%rdx, %rax
	cmpq	48(%rsp), %rax
	jne	.L173
	movq	104(%rsp), %rcx
	xorl	%eax, %eax
	jmp	.L177
	.p2align 4,,10
	.p2align 3
.L360:
	addq	$1, %rax
	cmpq	%rcx, %rax
	je	.L178
.L177:
	movq	(%rdx,%rax,8), %rdi
	cmpq	%rdi, (%r14,%rax,8)
	je	.L360
	jmp	.L173
.L255:
	xorl	%edx, %edx
	jmp	.L208
.L250:
	xorl	%eax, %eax
	jmp	.L160
.L219:
	movq	%rsi, %rcx
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rsi), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movl	$10, %edx
	movq	48(%rax), %rax
	cmpq	%rcx, %rax
	je	.L220
	movq	%rsi, %rcx
	call	*%rax
	movsbl	%al, %edx
	jmp	.L220
.L357:
	leaq	_ZZ6now_usvE4freq(%rip), %rcx
	call	*__imp_QueryPerformanceFrequency(%rip)
	movb	$1, _ZZ6now_usvE11initialized(%rip)
	jmp	.L215
.L356:
	leaq	_ZZ6now_usvE4freq(%rip), %rcx
	call	*__imp_QueryPerformanceFrequency(%rip)
	movb	$1, _ZZ6now_usvE11initialized(%rip)
	jmp	.L213
.L355:
	leaq	_ZZ6now_usvE4freq(%rip), %rcx
	call	*__imp_QueryPerformanceFrequency(%rip)
	movb	$1, _ZZ6now_usvE11initialized(%rip)
	jmp	.L203
.L354:
	leaq	_ZZ6now_usvE4freq(%rip), %rcx
	call	*__imp_QueryPerformanceFrequency(%rip)
	movb	$1, _ZZ6now_usvE11initialized(%rip)
	jmp	.L201
.L353:
	leaq	_ZZ6now_usvE4freq(%rip), %rcx
	call	*__imp_QueryPerformanceFrequency(%rip)
	movb	$1, _ZZ6now_usvE11initialized(%rip)
	jmp	.L180
.L352:
	leaq	_ZZ6now_usvE4freq(%rip), %rcx
	call	*__imp_QueryPerformanceFrequency(%rip)
	movb	$1, _ZZ6now_usvE11initialized(%rip)
	jmp	.L238
.L351:
	call	_ZSt16__throw_bad_castv
.L358:
	call	_ZSt16__throw_bad_castv
.LEHE15:
.L344:
	leaq	.LC5(%rip), %rcx
.LEHB16:
	call	_ZSt20__throw_length_errorPKc
.LEHE16:
.L151:
	movq	40(%rsp), %rax
	pxor	%xmm0, %xmm0
	movq	$0, 16(%rax)
	movups	%xmm0, (%rax)
.LEHB17:
	call	_ZSt17__throw_bad_allocv
.LEHE17:
.L265:
	movq	%rax, %rcx
.L155:
	call	__cxa_begin_catch
	movq	40(%rsp), %rcx
	movq	%r12, %rdx
	call	_ZNSt12_Destroy_auxILb0EE9__destroyIPSt6vectorIiSaIiEEEEvT_S6_
.LEHB18:
	call	__cxa_rethrow
.LEHE18:
.L266:
	movq	40(%rsp), %r12
	movq	%rax, %rcx
	jmp	.L155
.L260:
	movq	%rax, %rbx
	leaq	192(%rsp), %r13
.L236:
	movq	%r13, %rcx
	movq	%rbx, %r12
	call	_ZNSt6vectorIS_IiSaIiEESaIS1_EED1Ev
.L231:
	movq	160(%rsp), %rcx
	movq	176(%rsp), %rdx
	subq	%rcx, %rdx
	testq	%rcx, %rcx
	je	.L237
	call	_ZdlPvy
.L237:
	movq	%r12, %rcx
.LEHB19:
	call	_Unwind_Resume
.LEHE19:
.L261:
	movq	%rax, %rbx
	movq	%rsi, %rdx
	leaq	192(%rsp), %r13
.L243:
	movq	%r14, %rcx
	call	_ZdlPvy
	jmp	.L236
.L264:
	movq	%rax, %r12
	call	__cxa_end_catch
	movq	192(%rsp), %rcx
	movq	208(%rsp), %rdx
	subq	%rcx, %rdx
	testq	%rcx, %rcx
	je	.L158
	call	_ZdlPvy
.L158:
	movq	%r14, %rdx
	movq	%r13, %rcx
	call	_ZdlPvy
	jmp	.L231
.L262:
	movq	%rax, %rbx
	movq	%rsi, %rdx
	leaq	192(%rsp), %r13
.L241:
	movq	%r12, %rcx
	call	_ZdlPvy
.L234:
	movq	40(%rsp), %rdx
	subq	%r14, %rdx
	testq	%r14, %r14
	jne	.L243
	jmp	.L236
.L259:
	movq	%rax, %r12
	jmp	.L231
.L263:
	movq	224(%rsp), %rcx
	movq	240(%rsp), %rdx
	movq	%rax, %rbx
	subq	%rcx, %rdx
	testq	%rcx, %rcx
	je	.L233
	call	_ZdlPvy
.L233:
	movq	96(%rsp), %rdx
	subq	%r12, %rdx
	testq	%r12, %r12
	jne	.L241
	jmp	.L234
.L258:
	movq	%rax, %r12
	jmp	.L158
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
	.align 4
.LLSDA8791:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT8791-.LLSDATTD8791
.LLSDATTD8791:
	.byte	0x1
	.uleb128 .LLSDACSE8791-.LLSDACSB8791
.LLSDACSB8791:
	.uleb128 .LEHB7-.LFB8791
	.uleb128 .LEHE7-.LEHB7
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB8-.LFB8791
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L259-.LFB8791
	.uleb128 0
	.uleb128 .LEHB9-.LFB8791
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L258-.LFB8791
	.uleb128 0
	.uleb128 .LEHB10-.LFB8791
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L265-.LFB8791
	.uleb128 0x1
	.uleb128 .LEHB11-.LFB8791
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L260-.LFB8791
	.uleb128 0
	.uleb128 .LEHB12-.LFB8791
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L261-.LFB8791
	.uleb128 0
	.uleb128 .LEHB13-.LFB8791
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L262-.LFB8791
	.uleb128 0
	.uleb128 .LEHB14-.LFB8791
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L265-.LFB8791
	.uleb128 0x1
	.uleb128 .LEHB15-.LFB8791
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L263-.LFB8791
	.uleb128 0
	.uleb128 .LEHB16-.LFB8791
	.uleb128 .LEHE16-.LEHB16
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB17-.LFB8791
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L266-.LFB8791
	.uleb128 0x1
	.uleb128 .LEHB18-.LFB8791
	.uleb128 .LEHE18-.LEHB18
	.uleb128 .L264-.LFB8791
	.uleb128 0
	.uleb128 .LEHB19-.LFB8791
	.uleb128 .LEHE19-.LEHB19
	.uleb128 0
	.uleb128 0
.LLSDACSE8791:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT8791:
	.text
	.seh_endproc
	.section	.text.startup,"x"
	.p2align 4
	.def	_GLOBAL__sub_I__Z6now_usv;	.scl	3;	.type	32;	.endef
	.seh_proc	_GLOBAL__sub_I__Z6now_usv
_GLOBAL__sub_I__Z6now_usv:
.LFB9551:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	leaq	_ZStL8__ioinit(%rip), %rcx
	call	_ZNSt8ios_base4InitC1Ev
	leaq	__tcf_0(%rip), %rcx
	addq	$40, %rsp
	jmp	atexit
	.seh_endproc
	.section	.ctors,"w"
	.align 8
	.quad	_GLOBAL__sub_I__Z6now_usv
.lcomm _ZZ6now_usvE11initialized,1,1
.lcomm _ZZ6now_usvE4freq,8,8
.lcomm _ZStL8__ioinit,1,1
	.section .rdata,"dr"
	.align 8
.LC0:
	.long	0
	.long	1093567616
	.align 16
.LC1:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC2:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC4:
	.long	1
	.long	1
	.long	1
	.long	1
	.ident	"GCC: (tdm64-1) 10.3.0"
	.def	_ZNSt8ios_base4InitD1Ev;	.scl	2;	.type	32;	.endef
	.def	memset;	.scl	2;	.type	32;	.endef
	.def	_ZdlPvy;	.scl	2;	.type	32;	.endef
	.def	atoi;	.scl	2;	.type	32;	.endef
	.def	_Znwy;	.scl	2;	.type	32;	.endef
	.def	memcpy;	.scl	2;	.type	32;	.endef
	.def	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x;	.scl	2;	.type	32;	.endef
	.def	_ZNSirsERi;	.scl	2;	.type	32;	.endef
	.def	_Unwind_Resume;	.scl	2;	.type	32;	.endef
	.def	__cxa_begin_catch;	.scl	2;	.type	32;	.endef
	.def	__cxa_rethrow;	.scl	2;	.type	32;	.endef
	.def	__cxa_end_catch;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEi;	.scl	2;	.type	32;	.endef
	.def	_ZNSo3putEc;	.scl	2;	.type	32;	.endef
	.def	_ZNSo5flushEv;	.scl	2;	.type	32;	.endef
	.def	_ZNKSt5ctypeIcE13_M_widen_initEv;	.scl	2;	.type	32;	.endef
	.def	_ZNSo9_M_insertIdEERSoT_;	.scl	2;	.type	32;	.endef
	.def	_ZSt16__throw_bad_castv;	.scl	2;	.type	32;	.endef
	.def	_ZSt20__throw_length_errorPKc;	.scl	2;	.type	32;	.endef
	.def	_ZSt17__throw_bad_allocv;	.scl	2;	.type	32;	.endef
	.def	_ZNSt8ios_base4InitC1Ev;	.scl	2;	.type	32;	.endef
	.def	atexit;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZSt3cin, "dr"
	.globl	.refptr._ZSt3cin
	.linkonce	discard
.refptr._ZSt3cin:
	.quad	_ZSt3cin
	.section	.rdata$.refptr._ZSt4cout, "dr"
	.globl	.refptr._ZSt4cout
	.linkonce	discard
.refptr._ZSt4cout:
	.quad	_ZSt4cout
