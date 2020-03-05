%include "asm_io.inc"

segment .data
num1 db 5
num2 db 4

segment .text
	global asm_main

asm_main:
enter 0,0
pusha
mov eax, 0
add eax, num1
add eax, num2
int 21h
popa
mov eax,0
leave
ret