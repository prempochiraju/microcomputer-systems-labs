.data
promptA: .asciiz "Enter A: "
promptB: .asciiz "Enter B: "

.text
.globl main
main:
    # Print promptA
    li $v0, 4
    la $a0, promptA
    syscall

    # Read A
    li $v0, 5
    syscall
    move $t0, $v0      # save A temporarily

    # Print promptB
    li $v0, 4
    la $a0, promptB
    syscall

    # Read B
    li $v0, 5
    syscall
    move $a1, $v0      # B -> argument register

    # Reload A into $a0
    move $a0, $t0      # A -> argument register

    # Call procedure
    jal addfun

    # Print result
    move $a0, $v0
    li $v0, 1
    syscall

    # Exit program
    
    li $v0, 10
    syscall

addfun:
    addu $v0, $a0, $a1
    jr   $ra
