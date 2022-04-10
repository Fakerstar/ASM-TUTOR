section .data
msg db 'Hello World!',0Ah
;len equ $-msg

section .text
global _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, 13 ;Tambien se puede usar len
	int 80h

	mov ebx, 0
	mov eax, 1 ;salida del programa
	int 80h
