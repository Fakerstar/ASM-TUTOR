section .data 
msg db 'Primer Codigo',0Ah ;0Ah=\n
;len equ $-msg

section .text
global _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, 13 ;Tambien se podria definir len equ $-msg en la seccion data
	int 80h

	mov ebx, 0
	mov eax, 1
	int 80h
