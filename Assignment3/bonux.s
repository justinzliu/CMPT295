	.file	"bonux.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Original signal:  "
.LC1:
	.string	"%4d"
.LC2:
	.string	"Convolved signal: "
.LC3:
	.string	"   OF"
.LC4:
	.string	" %4d"
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
	movl	$4, %r12d
	call	_IO_putc@PLT
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L11:
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	addl	$1, %ebx
	call	__printf_chk@PLT
	cmpl	$20, %ebx
	je	.L10
.L5:
	cmpl	$4, %ebx
	movl	%r12d, %edx
	movl	%ebx, %eax
	cmovle	%ebx, %edx
	leaq	h(%rip), %rsi
	addl	$1, %edx
	subl	%edx, %eax
	cltq
	leaq	1(%rbp,%rax), %rdi
	call	conv@PLT
#APP
# 29 "bonux.c" 1
	movl %edx, %ecx
	
# 0 "" 2
#NO_APP
	testl	%ecx, %ecx
	jne	.L11
	leaq	.LC4(%rip), %rsi
	movsbl	%al, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	__printf_chk@PLT
	cmpl	$20, %ebx
	jne	.L5
.L10:
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
	.size	h, 5
h:
	.byte	-5
	.byte	2
	.byte	6
	.byte	2
	.byte	-5
	.globl	signal
	.align 16
	.type	signal, @object
	.size	signal, 20
signal:
	.byte	0
	.byte	0
	.byte	0
	.byte	40
	.byte	80
	.byte	60
	.byte	50
	.byte	60
	.byte	70
	.byte	40
	.byte	10
	.byte	-20
	.byte	-50
	.byte	-70
	.byte	-40
	.byte	-20
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
