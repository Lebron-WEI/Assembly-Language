#sting.S
.section .data
stringvar: 
	.ascii "0123456789abcdef"
.section .text
.globl _start
_start:
	movl	$8, %ecx
	movl	$stringvar, %ebx

L1:
	movb	(%ebx), %ah
	movb	1(%ebx), %al
    movw	%ax, (%ebx)
    addl	$2, %ebx
	loop	L1

#output
	movl	$4, %eax
	movl	$1, %ebx
	movl	$stringvar, %ecx
	movl	$16, %edx
	int	$0x80

#exit
	movl	$1, %eax
	movl	$0, %ebx
	int 	$0x80
