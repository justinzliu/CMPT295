	.globl get_byte_by_addr
get_byte_by_addr:
	addq %rsi, %rdi
	movb (%rdi), %al
endl:
	ret