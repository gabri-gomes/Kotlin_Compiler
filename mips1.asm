main:
li $t0, 7
li $t1, 4
move $t3, $t0
move $t4, $t1
add $t2, $t3, $t4
move $t3, $t2
li $v0, 1
move $a0, $t3
syscall
