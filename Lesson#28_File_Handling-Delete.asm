%include	'functions.asm'
section	.text
global _start

_start:
	mov	ebx, filename
	mov	eax, 10		;unlink
	int	80h

	call	_quit

section	.data
filename	db	'LeccionEjemplo.txt'
