%include "asm_io.inc"

	segment .data

addMsg db " + ", 0
subMsg db " - ", 0
mulMsg db " * ", 0
divMsg db " \ ", 0
equal db " = ", 0
ask1 db "Enter first integer: ", 0
ask2 db "Enter second integer: ", 0
rStr db " r. ", 0
	segment .bss

a resd 1
b resd 1

input1 resd 1
input2 resd 1

	segment .text
global _asm_main

	_asm_main:
enter 0,0
pusha

mov eax, ask1
call print_string
call read_int
mov [a], eax
mov eax, ask2
call print_string
call read_int
mov [b], eax

;Addition
mov eax, [a]
call print_int
mov eax, addMsg
call print_string
mov eax, [b]
call print_int
mov eax, equal
call print_string
mov eax, [a]
add eax, [b]
call print_int
call print_nl

;Subtraction
mov eax, [a]
call print_int
mov eax, subMsg
call print_string
mov eax, [b]
call print_int
mov eax, equal
call print_string
mov eax, [a]
sub eax, [b]
call print_int
call print_nl

;Multiplication
mov eax, [a]
call print_int
mov eax, mulMsg
call print_string
mov eax, [b]
call print_int
mov eax, equal
call print_string
mov eax, [a]
imul eax, [b]
call print_int
call print_nl


;Division
mov edx, 0
mov eax, [a]
call print_int
mov eax, divMsg
call print_string
mov eax, [b]
call print_int
mov eax, equal
call print_string
mov eax, [a]
mov ecx, [b]
div ecx
call print_int
mov eax, rStr
call print_string
mov eax, edx
call print_int
call print_nl

popa
mov eax,0
leave
ret
