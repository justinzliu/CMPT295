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
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	.LC0(%rip), %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	leaq	signal(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	.LC1(%rip), %r12
	leaq	20(%rbp), %r13
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	%rbp, %rbx
	call	puts@PLT
	.p2align 4,,10
	.p2align 3
.L2:
	movsbl	(%rbx), %edx
	xorl	%eax, %eax
	movq	%r12, %rsi
	movl	$1, %edi
	addq	$1, %rbx
	call	__printf_chk@PLT
	cmpq	%r13, %rbx
	jne	.L2
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	xorl	%ebx, %ebx
	movl	$2, %r12d
	call	_IO_putc@PLT
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	.p2align 4,,10
	.p2align 3
.L3:
	cmpl	$2, %ebx
	movl	%r12d, %edx
	movl	%ebx, %eax
	cmovle	%ebx, %edx
	leaq	h(%rip), %rsi
	addl	$1, %ebx
	addl	$1, %edx
	subl	%edx, %eax
	cltq
	leaq	1(%rbp,%rax), %rdi
	call	conv@PLT
	leaq	.LC1(%rip), %rsi
	movsbl	%al, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	cmpl	$20, %ebx
	jne	.L3
	movq	stdout(%rip), %rsi
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	movl	$10, %edi
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	_IO_putc@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.globl	h
	.data
	.type	h, @object
	.size	h, 3
h:
	.byte	1
	.byte	-2
	.byte	1
	.globl	signal
	.align 16
	.type	signal, @object
	.size	signal, 20
signal:
	.byte	0
	.byte	0
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
	.byte	0
	.byte	0
	.byte	0
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
