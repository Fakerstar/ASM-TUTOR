%include	'functions.asm'

section .text
global 	_start

_start:
	mov	ecx, 0777
	mov	ebx, filename
	mov	eax, 8
	int	80h
	
	mov	edx, 19
	mov	ecx, contents
	mov	ebx, eax
	mov	eax, 4
	int	80h

	mov	ecx, 0
	mov	ebx, filename
	mov	eax, 5
	int	80h

	mov	edx, 19
	mov	ecx, filecontents
	mov	ebx, eax
	mov	eax, 3
	int	80h
	
	mov	eax, filecontents
	call	_printLF

	mov	ebx,eax
	mov	eax, 6
	int	80h

	call 	_quit

section	.bss
filecontents	resb	255

section	.data
filename	db	'LeccionEjemplo.txt',0h
contents	db	'Prueba de escritura',0h
