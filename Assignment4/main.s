	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Original signal:  "
.LC1:
	.string	"%4d"
.LC2:
	.string	"Convolved signal: "
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%rsp, %r15
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	leaq	25(%r15), %rax
	movq	%r15, %rbp
	movq	%r15, %rbx
	.p2align 4,,10
	.p2align 3
.L2:
	movb	$-128, (%rbx)
	addq	$1, %rbx
	cmpq	%rax, %rbx
	jne	.L2
	leaq	signal(%rip), %r12
	leaq	.LC0(%rip), %rdi
	leaq	.LC1(%rip), %r13
	leaq	15(%r12), %r14
	call	puts@PLT
	.p2align 4,,10
	.p2align 3
.L3:
	movsbl	(%r12), %edx
	xorl	%eax, %eax
	movq	%r13, %rsi
	movl	$1, %edi
	addq	$1, %r12
	call	__printf_chk@PLT
	cmpq	%r14, %r12
	jne	.L3
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	leaq	.LC1(%rip), %r12
	call	_IO_putc@PLT
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc@PLT
	leaq	4(%r15), %r8
	leaq	h(%rip), %rdx
	leaq	signal(%rip), %rdi
	movl	$3, %ecx
	movl	$15, %esi
	call	conv_arr@PLT
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	.p2align 4,,10
	.p2align 3
.L4:
	movsbl	0(%rbp), %edx
	xorl	%eax, %eax
	movq	%r12, %rsi
	movl	$1, %edi
	addq	$1, %rbp
	call	__printf_chk@PLT
	cmpq	%rbx, %rbp
	jne	.L4
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc@PLT
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc@PLT
	movq	40(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L11
	addq	$56, %rsp
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
.L11:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.globl	h
	.data
	.type	h, @object
	.size	h, 3
h:
	.byte	1
	.byte	2
	.byte	3
	.globl	signal
	.align 8
	.type	signal, @object
	.size	signal, 15
signal:
	.byte	0
	.byte	4
	.byte	8
	.byte	6
	.byte	5
	.byte	6
	.byte	7
	.byte	4
	.byte	1
	.byte	-2
	.byte	-5
	.byte	-7
	.byte	-4
	.byte	-2
	.byte	0
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
