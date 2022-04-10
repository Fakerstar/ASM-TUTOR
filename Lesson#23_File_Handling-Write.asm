%include 'functions.asm'

section .text
global _start

_start:
	mov	ecx, 0777
	mov	ebx, filename
	mov	eax, 8
	int 	80h

	mov	edx, 16
	mov	ecx, contents
	mov	ebx, eax
	mov	eax, 4
	int	80h

	call	_quit

section .data
filename	db	'LeccionEjemplo.txt',0h
contents	db	'Prueba escritura',0h
