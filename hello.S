.data

msg: 
	.ascii "Hello world\n"
	.set len, . - msg			# from current addres to the addres of msg assembler will count cells
	
qmsg:
	.ascii "Hello, world?\n"
	# .set qlen, . - msg



.text

.globl _start					# declare this variable as global
_start:							# entry point for programm like main() in C
	call prn
	call qprn
	mov $1, %eax				# number of function put into eax register
	#xor %ebx, %ebx				# same as mov $0, %ebx BUT more effectiove - put 0 into ebx register
	int $0x80					# system call

qprn:
	mov $4, %eax
	mov $1, %ebx
	mov $qmsg, %ecx
	mov $14, %edx
	int $0x80
	ret

prn:
	mov $4, %eax
	mov $1, %ebx
	mov $msg, %ecx
	mov $len, %edx
	int $0x80
	ret							# return to line 11

