.section .data
 testdata:
   .int 6, -5, 3, 1, -8, 7, 0, 2, 4, 9
.section .text
.globl _start
_start:
    pushl   %ebp
    movl    %esp, %ebp
    subl    $32, %esp
    movl    $testdata, %ebx
    movl    %ebx, 4(%esp)
    movl    $10, (%esp)
    call    insert_sort
# output
    movl    %ebx, %edi
    xorl    %esi, %esi # 置%esi为0
    jmp     L6
L8:
    movl	$4, %eax
	movl	$1, %ebx
    movl    $45, 20(%esp) # 输出“-”号
    leal    20(%esp), %ecx
    movl    $1, %edx
    int     $0x80
    notl    (%edi,%esi,4) # 取相反数
    addl    $49, (%edi,%esi,4)  # ascii码转换
    leal    (%edi,%esi,4), %ecx
    movl    $1, %edx
    movl	$4, %eax
	movl	$1, %ebx
    int	    $0x80
    movl	$4, %eax
	movl	$1, %ebx
    movl    $32, 28(%esp) # 输出空格
    leal    28(%esp), %ecx
    movl    $1, %edx
    int     $0x80
    jmp     L9
L7:
    cmpl    $0, (%edi,%esi,4)
    jl      L8
    movl	$4, %eax
	movl	$1, %ebx
    addl    $48, (%edi,%esi,4) # ascii码转换
    leal    (%edi,%esi,4), %ecx
    movl    $1, %edx
    int	    $0x80
    movl	$4, %eax
	movl	$1, %ebx
    movl    $32, 28(%esp)  # 输出空格
    leal    28(%esp), %ecx
    movl    $1, %edx
    int     $0x80
L9:
    inc     %esi
L6:
    cmpl    %esi, (%esp)
    jg      L7
# exit
	movl	$1, %eax
	movl	$0, %ebx
	int	$0x80

.globl  insert_sort
.type   insert_sort, @function
insert_sort:
.LFB0:
    pushl   %ebp
    movl    %esp, %ebp
    subl    $32, %esp
    movl    12(%ebp), %ebx
    movl    $1, %ecx
    jmp     L1
L2:
    movl    (%ebx, %ecx, 4), %edi
    movl    %ecx, %eax
    dec     %eax
    jmp     L5
L4:
    movl    (%ebx, %eax, 4), %edx
    movl    %edx, 4(%ebx, %eax, 4)
    dec     %eax
L5:
    cmpl    $0, %eax
    jl      L3
    cmpl    (%ebx, %eax, 4), %edi
    jl     L4
L3:
    movl    %edi, 4(%ebx, %eax, 4)
    inc     %ecx
L1:
    cmp     %ecx, 8(%ebp)
    ja      L2
    leave
    ret


