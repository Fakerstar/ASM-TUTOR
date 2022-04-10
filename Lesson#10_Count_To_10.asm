%include	'functions.asm'

section	.text
global	_start

_start:
	mov	ecx, 0

_nextNumber:
	add	ecx, 1
	
	mov	eax, ecx
	add	eax, 48
	push	eax
	mov	eax, esp
	call	_printLF

	pop	eax
	cmp	ecx, 10
	jne	_nextNumber

	call	_quit
