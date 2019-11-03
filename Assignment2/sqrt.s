	.globl sqrt
sqrt:
	movl $15,%ecx
	movl $32768,%edx
	xorl %eax,%eax
loop:
	cmpl $4294967295,%ecx
	je endl
	decl %ecx
	addl %edx,%eax
	leal (%eax),%esi
	imul %eax,%esi
	cmpl %edi,%esi
	jg greater
	shr %edx
	jmp loop
greater:
	xorl %edx,%eax
	shr %edx
	jmp loop
endl:
	ret
