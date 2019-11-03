	.file	"main.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"It took %ld microseconds to initialize the array.\n"
	.align 8
.LC1:
	.string	"It took %ld microseconds to sort the array with qsort1.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	xorl	%edi, %edi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	A(%rip), %r14
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	$1, %r12d
	leaq	4(%r14), %r13
	movl	$1374389535, %ebx
	subq	$312, %rsp
	.cfi_def_cfa_offset 368
	movq	%fs:40, %rax
	movq	%rax, 296(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rbp
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movq	%rbp, %rsi
	xorl	%edi, %edi
	call	getrusage@PLT
	movl	$0, (%r14)
	.p2align 4,,10
	.p2align 3
.L2:
	movl	%r12d, %eax
	addl	$1, %r12d
	addq	$4, %r13
	mull	%ebx
	shrl	$5, %edx
	movl	%edx, -4(%r13)
	call	rand@PLT
	movl	%eax, %r15d
	call	rand@PLT
	movslq	%r15d, %rcx
	movl	%r15d, %edx
	imulq	$-2147418109, %rcx, %rcx
	sarl	$31, %edx
	shrq	$32, %rcx
	addl	%r15d, %ecx
	sarl	$14, %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	sall	$15, %edx
	subl	%ecx, %edx
	movslq	%eax, %rcx
	imulq	$-2147450879, %rcx, %rcx
	subl	%edx, %r15d
	cltd
	sall	$16, %r15d
	shrq	$32, %rcx
	addl	%eax, %ecx
	sarl	$15, %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	sall	$16, %edx
	subl	%ecx, %edx
	subl	%edx, %eax
	orl	%r15d, %eax
	cltd
	idivl	%r12d
	movl	-4(%r13), %eax
	movslq	%edx, %rdx
	movl	(%r14,%rdx,4), %ecx
	movl	%ecx, -4(%r13)
	cmpl	$16000000, %r12d
	movl	%eax, (%r14,%rdx,4)
	jne	.L2
	leaq	144(%rsp), %rbx
	xorl	%edi, %edi
	movq	%rbx, %rsi
	call	getrusage@PLT
	movq	144(%rsp), %rdx
	subq	(%rsp), %rdx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	imulq	$1000000, %rdx, %rdx
	addq	152(%rsp), %rdx
	subq	8(%rsp), %rdx
	call	__printf_chk@PLT
	xorl	%edi, %edi
	movq	%rbp, %rsi
	call	getrusage@PLT
	leaq	A(%rip), %rdi
	movl	$16000000, %esi
	call	qsort295_2@PLT
	xorl	%edi, %edi
	movq	%rbx, %rsi
	call	getrusage@PLT
	movq	144(%rsp), %rdx
	subq	(%rsp), %rdx
	leaq	.LC1(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	imulq	$1000000, %rdx, %rdx
	addq	152(%rsp), %rdx
	subq	8(%rsp), %rdx
	call	__printf_chk@PLT
	movq	296(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L7
	addq	$312, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.comm	A,64000000,32
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
