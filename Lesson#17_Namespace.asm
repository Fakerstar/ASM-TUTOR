%include 'functions.asm'

section .text
global _start

_start:
	
subroutineOne:
	mov eax, msg1
	call _printLF
	jmp .finished

.finished:
	mov eax, msg2
	call _print
	mov eax, 1
	call _iprintLF

subroutineTwo:
	mov eax, msg1
	call _printLF
	jmp .finished

.finished:
	mov eax, msg2
	call _print
	mov eax, 2
	call _iprintLF
	
	mov eax, msg1
	call _printLF
	jmp finished

finished:
	mov eax, msg3
	call _printLF
	call _quit
	


section .data
msg1 db 'Saltando a otra rutina.', 0h
msg2 db 'Dentro de la subrutina: ', 0h
msg3 db 'Dentro de la subrutina "final".', 0h
