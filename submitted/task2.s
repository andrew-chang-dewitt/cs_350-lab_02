	.data
	# A => 465
A:	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ,13 ,14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30
	# B => 3835
B:	.word 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 12 0,13 0,140, 150, 160, 170, 180, 190, 200, 210, 220, 230, 240, 250, 260, 270, 280, 290, 300
	.text
main:
	add t0 x0 x0	# init sum <-- 0
	la t1 A		# load pointer to A[0]
	add t2 t1 x0	# i <-- 0
	addi t3 t1 120	# loop limit <-- 120 bytes past A[0]
			# A has 30 elements of size 26 bits each
			# 26 bits < 32 bits = 4 bytes = 1 word
loop:
	lw t4 0(t2)	# word <-- value at A[i]
	add t0 t0 t4	# sum <-- sum + word
	addi t2 t2 4	# i <-- i + 4
	blt t2 t3 loop	# check if i still in range of A
exit:
	addi a0, x0, 1		# set up to print result
	addi a1, t0, 0		# place result in a1
	ecall
	addi a0, x0, 10		# set up exit call
	ecall			# exit
