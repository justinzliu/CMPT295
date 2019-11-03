	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Rank"
.LC1:
	.string	"Grade"
.LC2:
	.string	"Name"
.LC3:
	.string	"%15s  %5s  %4s\n"
.LC4:
	.string	"----"
.LC5:
	.string	"-----"
.LC6:
	.string	"----------"
.LC7:
	.string	"Number who passed: %d/%d\n"
.LC8:
	.string	"  Passing average: %2.2f\n"
.LC9:
	.string	"  Overall average: %2.2f\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC10:
	.string	"Sample %d completed in %d cycles.\n"
	.section	.rodata.str1.1
.LC11:
	.string	"Average of %ld cycles.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB34:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	leaq	cycles(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	leaq	num_passed(%rip), %r12
	leaq	80(%rbp), %r13
	movq	%rbp, %r14
	.p2align 4,,10
	.p2align 3
.L2:
#APP
# 35 "main.c" 1
	cpuid
	rdtscp
	movl %eax, %esi
	
# 0 "" 2
#NO_APP
	leaq	passing_avg(%rip), %r8
	leaq	avg(%rip), %rcx
	leaq	ranks(%rip), %rdx
	leaq	grades(%rip), %rdi
	movl	%esi, start_time(%rip)
	movq	%r12, %r9
	xorl	%esi, %esi
	call	compute_ranks@PLT
#APP
# 46 "main.c" 1
	cpuid
	rdtscp
	movl %eax, %esi
	
# 0 "" 2
#NO_APP
	movl	%esi, end_time(%rip)
	subl	start_time(%rip), %esi
	addq	$4, %r14
	movl	%esi, -4(%r14)
	cmpq	%r13, %r14
	jne	.L2
	leaq	.LC0(%rip), %r8
	leaq	.LC1(%rip), %rcx
	leaq	.LC2(%rip), %rdx
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC10(%rip), %r12
	movl	$1, %ebx
	call	__printf_chk@PLT
	leaq	.LC4(%rip), %r8
	leaq	.LC5(%rip), %rcx
	leaq	.LC6(%rip), %rdx
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc@PLT
	movl	num_passed(%rip), %edx
	leaq	.LC7(%rip), %rsi
	xorl	%ecx, %ecx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	pxor	%xmm0, %xmm0
	leaq	.LC8(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	cvtss2sd	passing_avg(%rip), %xmm0
	call	__printf_chk@PLT
	pxor	%xmm0, %xmm0
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	cvtss2sd	avg(%rip), %xmm0
	call	__printf_chk@PLT
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc@PLT
	movl	cycles(%rip), %ecx
	leaq	.LC10(%rip), %rsi
	movl	$1, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	movq	$0, total(%rip)
	call	__printf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L4:
	movl	0(%rbp,%rbx,4), %ecx
	leal	1(%rbx), %edx
	xorl	%eax, %eax
	movq	%r12, %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	cmpq	$9, %rbx
	jbe	.L3
	movslq	0(%rbp,%rbx,4), %rax
	addq	%rax, total(%rip)
.L3:
	addq	$1, %rbx
	cmpq	$20, %rbx
	jne	.L4
	movq	total(%rip), %rcx
	movabsq	$7378697629483820647, %rdx
	leaq	.LC11(%rip), %rsi
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	movq	%rcx, %rax
	sarq	$63, %rcx
	movl	$1, %edi
	imulq	%rdx
	xorl	%eax, %eax
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	sarq	$2, %rdx
	subq	%rcx, %rdx
	jmp	__printf_chk@PLT
	.cfi_endproc
.LFE34:
	.size	main, .-main
	.comm	nul,8,8
	.globl	end_time
	.data
	.align 4
	.type	end_time, @object
	.size	end_time, 4
end_time:
	.long	125
	.globl	start_time
	.align 4
	.type	start_time, @object
	.size	start_time, 4
start_time:
	.long	150
	.comm	total,8,8
	.comm	cycles,80,32
	.comm	num_passed,4,4
	.comm	passing_avg,4,4
	.comm	avg,4,4
	.comm	ranks,0,4
	.comm	grades,0,4
	.comm	names,0,1
	.comm	buf,1024,32
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
