.data
promptA:   .asciiz "Enter a: "
promptG:   .asciiz "Enter g: "
promptH:   .asciiz "Enter h: "
promptK:   .asciiz "Enter k: "
promptM:   .asciiz "Enter m: "
resultMsg: .asciiz "Result: "
newline:   .asciiz "\n"

.text
.globl main

main:
    # -------- read a --------
    li $v0, 4
    la $a0, promptA
    syscall

    li $v0, 5
    syscall
    move $s0, $v0      # a

    # -------- read g --------
    li $v0, 4
    la $a0, promptG
    syscall

    li $v0, 5
    syscall
    move $s1, $v0      # g

    # -------- read h --------
    li $v0, 4
    la $a0, promptH
    syscall

    li $v0, 5
    syscall
    move $s2, $v0      # h

    # -------- read k --------
    li $v0, 4
    la $a0, promptK
    syscall

    li $v0, 5
    syscall
    move $s3, $v0      # k

    # -------- read m --------
    li $v0, 4
    la $a0, promptM
    syscall

    li $v0, 5
    syscall
    move $s4, $v0      # m

    # -------- if (a == 0) --------
    bne $s0, $zero, ELSE_PART

    # b = update(g,h)
    move $a0, $s1
    move $a1, $s2
    jal  update
    move $s5, $v0      # b (optional storage)
    move $t2, $v0      # value to print
    j    PRINT

ELSE_PART:
    # c = update(k,m)
    move $a0, $s3
    move $a1, $s4
    jal  update
    move $s6, $v0      # c (optional storage)
    move $t2, $v0      # value to print

PRINT:
    # print "Result: "
    li $v0, 4
    la $a0, resultMsg
    syscall

    # print integer result (saved in $t2)
    move $a0, $t2
    li $v0, 1
    syscall

    # print newline
    li $v0, 4
    la $a0, newline
    syscall

    # exit
    li $v0, 10
    syscall


# --------------------------------------------------
# update(a,b) = (a+b) - (a-b)
# args:   $a0=a, $a1=b
# return: $v0
# uses $s0 -> must save/restore (callee-saved)
# --------------------------------------------------
update:
    addi $sp, $sp, -4
    sw   $s0, 0($sp)

    addu $s0, $a0, $a1     # s0 = a + b
    subu $t0, $a0, $a1     # t0 = a - b
    subu $v0, $s0, $t0     # v0 = (a+b) - (a-b)

    lw   $s0, 0($sp)
    addi $sp, $sp, 4
    jr   $ra
