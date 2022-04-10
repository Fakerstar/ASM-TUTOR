section .text
global _start

_start:
	push byte 6
	push byte 3
	push byte 2
	mov ecx, esp
	add ecx, 8
	mov ebx, [ecx]
	mov eax, 1
	int 80h
