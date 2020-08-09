Inthandler：
    pushl   %eax
    pushl   %ebx
    pushl   %ecx
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

    popl   %eax
    popl   %ebx
    popl   %ecx
    
    iret