.data

promptA: .asciiz "Enter A: "
promptB: .asciiz "Enter B:"

.text

li $v0, 4
la $a0, promptA
syscall
li $v0, 5
syscall
addu $t0, $v0, $zero
li $v0, 4
la $a0, promptB
syscall
li $v0, 5
syscall
addu $a1, $v0, $zero
addu $a0, $t0, $zero
jal Addfun

addu $a0, $v0, $zero
li $v0, 1
syscall

li $v0, 10
syscall



Addfun: 
    addu $v0, $a1, $a0
    jr $ra


