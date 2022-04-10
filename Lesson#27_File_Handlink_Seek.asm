%include	'functions.asm'

section	.text
global	_start

_start:
	mov	ecx, 1		;Modo solo escritura
	mov	ebx, filename
	mov	eax, 5		;open
	int	80h

	mov	edx, 2
	mov	ecx, 0
	mov	ebx, eax
	mov	eax, 19		;lseek
	int	80h

	mov	edx, 14
	mov	ecx, contents
	mov	ebx, ebx	;el file decriptor se mueve a ebx
	mov	eax, 4		;write
	int	80h	

	call	_quit
section	.data
filename	db	'LeccionEjemplo.txt',0h
contents	db	'Texto agregado',0h
