section .data
msg db 'Antoher example of a message',0Ah

section .text
global _start

_start:
	mov eax, msg
	call _CalculateLen ;llama a la subrutina _CalculateLen
	
	mov edx, eax
	mov ecx, msg
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov eax, 1
	mov ebx, 0
	int 80h


_CalculateLen:
	push ebx ;Guardamos en la pila el valor de ebx, por si el ordenador lo estaba usando
	mov ebx, eax
	
_NextChar:
	cmp byte [eax], 0
	jz _Finished
	add eax, 1
	jmp _NextChar

_Finished:
	sub eax, ebx
	pop ebx ;Recuperamos el valor de ebx de la pila
	ret
