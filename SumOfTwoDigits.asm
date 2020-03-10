%include "asm_io.inc"

	segment .data
num1 db 5
num2 db 5
addMsg db "Addition: 5 + 5 = ", 0
subMsg db "Subraction:  5 - 5 = ", 0
mulMsg db "Multiplication:  5 * 5 = ", 0
divMsg db "Division:  5 / 5 = ", 0

	segment .text
global _asm_main

	_asm_main:
enter 0,0
pusha

mov eax, addMsg
call print_string
mov eax, 5
add eax, 5
call print_int
call print_nl

mov eax, subMsg
call print_string
mov eax, 5
sub eax, 5
call print_int
call print_nl

mov eax, mulMsg
call print_string
mov eax, 5
imul eax, 5
call print_int
call print_nl

mov eax, divMsg
call print_string
mov edx, 0
mov eax, 5
mov ecx, 5
div ecx
call print_int
call print_nl

popa
mov eax,0
leave
ret
