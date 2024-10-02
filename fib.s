	.data
	.word 2, 4, 6, 8
n:	.word 5
#n:	.word 6 => sum(fib(6)) => 20
#n:	.word 14 => sum(fib(14)) => 986

	.text
main:
	add t0, x0, x0		# fib_0 <-- 0
	addi t1, x0, 1		# fib_1 <-- 1
	add t2, x0, x0		# sum <-- 0
	la t4, n		# load address of n
	lw t4, 0(t4)		# t4 <-- n as loop counter
fib:
	beq t4, x0, finish	# for j = n down to 1
				# let i = n - j + 1
	add t3, t1, t0		# fib_i+1 = fib_i + fib_i-1
	add t2, t2, t1		# sum <-- sum + fib_i
	mv t0, t1		# set up for fib_i+1
	mv t1, t3		
	addi t4, t4, -1		# decrement counter
	j fib			# loop again
finish:
	addi a0, x0, 1		# set up to print result
	addi a1, t2, 0		# place result in a1
	ecall			# should print 12
	addi a0, x0, 10		# set up exit call
	ecall			# exit


# n  fib(n) sum
# 0  0      0
# 1  1      1
# 2  1      2
# 3  2      4
# 4  3      7
# 5  5      12
# 6  8      20
# 7  13     33
# 8  21     54
# 9  34     88
# 10 55     143
# 11 89     232
# 12 144    376
# 13 233    609
# 14 377    986
