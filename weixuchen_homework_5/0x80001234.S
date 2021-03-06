.section .data
	var:.int 0x80001234
.section .text
.globl _start
_start:
	pushl	var
	call	signed_hex
	mov		$1, %eax
	mov		$0, %ebx
	int		$0x80
	
.type signed_hex, @function
signed_hex:
	push	%ebp
	mov		%esp, %ebp
	sub		$16, %esp #esp=buf
	mov		%ebx, 12(%esp)
	mov		8(%ebp), %ecx #ecx=x
	movb	$' ', 0(%esp) #buf[0]
	movb	$'0', 1(%esp) 
	movb	$'x', 2(%esp)
	movb	$0, 10(%esp)
	lea		10(%esp), %eax #eax=buf[10]
	lea		3(%esp), %ebx #ebx=buf[3]
	mov		%ecx, %edx
	andl	$0x80000000, %edx #判断符号位
	add		$1, %edx
	js		L5	
    andl    $0xf0000000, %edx
    mov     %edx, %esi
    test    %esi, %esi #判断首位是否为0
    jne     L1
	lea		4(%esp), %ebx #ebx=buf[4]
    jmp     L1
L5:
	neg		%ecx
	movb	$'-', 0(%esp)
L1:
	mov		%ecx, %edx
	andb	$0xf, %dl
	cmpb	$10, %dl
	jb		L2
	addb	$0x57, %dl
	jmp		L3
L2:
	orb		$0x30, %dl
L3:
	movb	%dl, (%eax)
	dec		%eax
	shrl	$4, %ecx
	cmpl	%ebx, %eax
	jae		L1
	mov		$4, %eax
	mov		$1, %ebx
	mov		%esp, %ecx
	mov		$11, %edx
	int		$0x80
	mov		12(%esp), %ebx
	leave
	ret

