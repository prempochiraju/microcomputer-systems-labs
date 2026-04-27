.data 0x10010000
memsorce: 
.word 10, 11,12,13,14,15,16, 0
	
.data 0x10010020
memdest:
	.space 32
.text
.global main
main:
    la $a0, memsorce
    la $a1, memedest
    li $t0,  0
    
loop: 
   lw $t1, 0($a0)
   sw $t1, 0($a1)
   
   addi $a0, $a0, 4
   addi $a1, $a1, 4
   
   beq $t1, $zero, exit
   addi $t0, $t0, 1
exit:
   li $v0, 10
   syscall