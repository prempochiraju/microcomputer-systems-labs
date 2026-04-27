.data
    promptA: .asciiz "Enter A: "
    promptG: .asciiz "Enter G: "
    promptH: .asciiz "Enter H: "
    promptK: .asciiz "Enter K: "
    promptM: .asciiz "Enter M: "
    promptOut: .asciiz "Your result is: "
.text
.globl main

main:
    # Show Enter A
    li $v0, 4
    la $a0, promptA
    syscall
    
    # Fetch A
    li $v0, 5
    syscall
    move $s0, $v0  
    
    
bne $s0, $zero, ELSE_PART #Changed $a0 -> $s0

    # Show Enter K
    li $v0, 4
    la $a0, promptK
    syscall
    
    # Fetch K
    li $v0, 5
    syscall
    move $s1, $v0  
    
    # Show Enter M
    li $v0, 4
    la $a0, promptM
    syscall
    
    # Fetch M
    li $v0, 5
    syscall
    move $s2, $v0  

    # b = update(g,h)
    move $a0, $s1
    move $a1, $s2
    jal update

    # Print results
    move $s5, $v0       

    j PRINT



ELSE_PART:
# c = update(k,m)

    # Show Enter G
    li $v0, 4
    la $a0, promptG
    syscall
    
    # Fetch G
    li $v0, 5
    syscall
    move $s3, $v0  
    
    # Show Enter H
    li $v0, 4
    la $a0, promptH
    syscall

    # Fetch H
    li $v0, 5
    syscall
    move $s4, $v0  
    move $a0, $s3
    move $a1, $s4
    jal update
    move $s5, $v0
    j PRINT


update:

addi $sp,$sp,-4 #changed $s0 to sore insted od $a0
sw $s0, 0($sp)
add $s0,$a0,$a1

# t0 = a - b
sub $t0,$a0,$a1

# v0 = (a+b) - (a-b)
sub $v0,$s0,$t0
lw $s0, 0($sp)
addi $sp,$sp,4


# TODO: restore $s0 from stack
jr $ra

PRINT:
    move $a0, $s5 #Syscall 1 prints the integer in $a0, not $a1
    li   $v0, 1
    syscall

    li $v0, 10
    syscall

