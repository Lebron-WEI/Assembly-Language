.section .data
iostring:
  .asciz "ab1g2hA0H56po9wK78nB"
.section .text
.globl __start
__start:
    la      $t2, iostring
    addi    %t4, %t2, 0
L1:
    addi    %t1, (%t2)
    li      %t5, 0
    li      %t6, 'a'
    li      %t7, 'z'
    beq     %t1, %t5, L2
    blt     %t1, %t6, L3
    bgt     %t1, %t7, L3
    subu    %t1, %t1, $0x20
L3:
    addi    (%t4), t1
    addu    %t2, %t2, 1
    addu    %t3, %t3, 1
    j       L1
L2:
    addi    (%t4), t1

#output
    addiu   $v0, $0, 4004
    addiu   $a0, $0, 1
    la      $a1, iostring
    addiu   $a2, $0, 20
    syscall
    addiu   $v0, $0, 4001
    addiu   $a0, $0, 0
    syscall
