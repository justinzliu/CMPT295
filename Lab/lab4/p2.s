	.file	"p2.c"
	.text
	.p2align 4,,15
	.globl	proc2
	.type	proc2, @function
proc2:
.LFB0:
	.cfi_startproc
	imull	%esi, %edi
	leal	-12(%rdi), %eax
	ret
	.cfi_endproc
.LFE0:
	.size	proc2, .-proc2
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
