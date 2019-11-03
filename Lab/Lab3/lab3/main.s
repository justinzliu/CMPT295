	.file	"main.c"
	.text
	.p2align 4,,15
	.globl	get_byte_by_order
	.type	get_byte_by_order, @function
get_byte_by_order:
.LFB23:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L2
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L3:
	addl	$1, %edx
	sarl	$8, %edi
	cmpl	%edx, %esi
	jne	.L3
.L2:
	movzbl	%dil, %eax
	ret
	.cfi_endproc
.LFE23:
	.size	get_byte_by_order, .-get_byte_by_order
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"x = %.08x\n"
.LC1:
	.string	"x = %d\n"
.LC2:
	.string	"y = %x\n"
.LC3:
	.string	"y = %d\n"
.LC4:
	.string	"x = "
.LC5:
	.string	"%02x "
.LC6:
	.string	"y = "
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC5(%rip), %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	x(%rip), %edx
	xorl	%ebx, %ebx
	call	__printf_chk@PLT
	movl	x(%rip), %edx
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	y(%rip), %edx
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	y(%rip), %edx
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	x(%rip), %edx
.L7:
	xorl	%eax, %eax
	movzbl	%dl, %edx
	movq	%rbp, %rsi
	movl	$1, %edi
	addl	$1, %ebx
	call	__printf_chk@PLT
	cmpl	$4, %ebx
	je	.L20
	movl	x(%rip), %edx
	xorl	%eax, %eax
.L8:
	addl	$1, %eax
	sarl	$8, %edx
	cmpl	%eax, %ebx
	jg	.L8
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L20:
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	leaq	x(%rip), %rbp
	xorl	%ebx, %ebx
	call	_IO_putc@PLT
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L10:
	movl	%ebx, %esi
	movq	%rbp, %rdi
	addl	$1, %ebx
	call	get_byte_by_addr@PLT
	leaq	.LC5(%rip), %rsi
	movl	%eax, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	cmpl	$4, %ebx
	jne	.L10
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	leaq	.LC5(%rip), %rbp
	xorl	%ebx, %ebx
	call	_IO_putc@PLT
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	y(%rip), %edx
.L11:
	xorl	%eax, %eax
	movzbl	%dl, %edx
	movq	%rbp, %rsi
	movl	$1, %edi
	addl	$1, %ebx
	call	__printf_chk@PLT
	cmpl	$4, %ebx
	je	.L21
	movl	y(%rip), %edx
	xorl	%eax, %eax
.L12:
	addl	$1, %eax
	sarl	$8, %edx
	cmpl	%eax, %ebx
	jg	.L12
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L21:
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	leaq	y(%rip), %rbp
	xorl	%ebx, %ebx
	call	_IO_putc@PLT
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L14:
	movl	%ebx, %esi
	movq	%rbp, %rdi
	addl	$1, %ebx
	call	get_byte_by_addr@PLT
	leaq	.LC5(%rip), %rsi
	movl	%eax, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	cmpl	$4, %ebx
	jne	.L14
	movq	stdout(%rip), %rsi
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movl	$10, %edi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	_IO_putc@PLT
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.globl	y
	.data
	.align 4
	.type	y, @object
	.size	y, 4
y:
	.long	2908479998
	.globl	x
	.align 4
	.type	x, @object
	.size	x, 4
x:
	.long	233876875
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
