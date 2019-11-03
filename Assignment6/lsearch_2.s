	.globl	lsearch_2
lsearch_2:
	#VARIABLE MAP
	#%rdi = int* A
	#%esi = n
	#%edx = target
	#%rax = return value
	#%r9 is scratch register, stores last element of A
	#%r8 = i in while loop, to store the index to current element in the array
	#rcx = i in while loop, used to count up
init:
	#if (n == 0) {
		#return -1
	#}
	testl	%esi, %esi
	jle	endl
	movslq	%esi, %rax #mov n to %rax
	leaq	-4(%rdi,%rax,4), %rax #mov A[n-1] in (%rax)
	movl	(%rax), %r9d #mov &A[n-1] to %r9
	movl	%edx, (%rax) #A[n-1] = target
	#if (target == A[0]) jump to L6
	cmpl	(%rdi), %edx
	je	zero
	#else %ecx = 1
	movl	$1, %ecx
whileloop:
	#while (A[i] != target) {
		#i++
	#}
	movl	%ecx, %r8d #keep track of current i
	addq	$1, %rcx #i++
	cmpl	%edx, -4(%rdi,%rcx,4) #if A[i] != target
	jne	whileloop
lastelhasMatch:
	#if (target == A[0]) {
		#return n-1
	#}
	movl	%r9d, (%rax) #mov A[n-1] to (%rax)
	leal	-1(%rsi), %eax #mov n-1 to (%rax)
	#always greater
	cmpl	%r8d, %eax #%rax is a address... so always greater than 0
	jg	ihasMatch
	#if n-1 <= %r8 && target != A[n-1] 
	cmpl	%edx, %r9d
	jne	noMatch
	#else repeat until equal
	rep ret
ihasMatch:
	#if (n-1 > i) {
		#return i
	#}
	movl	%r8d, %eax
	ret
zero:
	#enter if target == A[0]
	xorl	%r8d, %r8d #%r8 = 0
	jmp	lastelhasMatch
noMatch:
	#return -1
	movl	$-1, %eax
	ret
