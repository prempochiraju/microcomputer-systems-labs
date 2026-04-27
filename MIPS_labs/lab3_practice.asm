

.text
.globl main


main:
	li $s0, 0 # a (condition variable)
	li $s1, 10 # g
	li $s2, 5 # h
 	li $s3, 8 # k
 	li $s4, 2 # m
 	
 	
 	bne $s0 , $zero, ELSE_part
 	
 	move $a0, $s1
 	move $a1, $s2
 	jal update
 	move $s5, $v0
 	j Done
 	
ELSE_part:
	move $a0, $s3
	move $a1, $s4
	jal update
	move $s5, $v0
	j Done
	
Done:
li $v0, 10
syscall
update:
    addi $sp, $sp, -4
    sw   $s0, 0($sp)

    addu $s0, $a0, $a1     # s0 = a + b
    subu $t0, $a0, $a1     # t0 = a - b
    subu $v0, $s0, $t0     # v0 = (a+b) - (a-b)

    lw   $s0, 0($sp)
    addi $sp, $sp, 4
    jr   $ra
