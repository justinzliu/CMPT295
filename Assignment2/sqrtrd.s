	.globl sqrt
sqrt:
	movl $15,%ecx
	movl $32768,%edx
	xorl %eax,%eax
loop:
	cmpl $4294967295,%ecx
	je compare
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
compare:
	leal (%eax),%edx
	decl %edx
	imul %edx,%edx
	neg %edx
	addl %edi,%edx
	leal (%eax),%ecx
	incl %ecx
	imul %ecx,%ecx
	subl %edi,%ecx
	cmpl %ecx,%edx
	jge roundup
	jmp endl
roundup:
	incl %eax
	jmp endl
endl:
	ret