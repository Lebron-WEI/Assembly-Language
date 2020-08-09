.section .data
iostring:
  .asciz "ab1g2hA0H56po9wK78nB"
.section .text
.globl _start
_start:
    movl     $iostring, %esi
	
L1:
	movb	(%esi), %al
	testb	%al, %al
	jz		L3
	subb	$'0', %al
	cmp		$9, %al
	ja		L2

	movl	%esi, %ebx
L4:
	movb	1(%ebx), %cl
	movb	%cl, (%ebx)
	testb	%cl, %cl
	jz		L1
	inc		%ebx
	jmp 	L4
L2:
	inc		%esi
	jmp		L1
L3:

#output
	movl	$4, %eax
	movl	$1, %ebx
	movl    $iostring, %ecx
    movl    $12, %edx
	int	$0x80
#exit
	movl	$1, %eax
	movl	$0, %ebx
	int	$0x80
