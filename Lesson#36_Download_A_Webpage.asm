%include	'functions.asm'

section	.text
global	_start

_start:
	xor	eax, eax
	xor	ebx, ebx
	xor	edi, edi

_socket:
	push	byte 6
	push	byte 1
	push	byte 2
	mov	ecx, esp
	mov	ebx, 1
	mov	eax, 102
	int	80h

_connect:
	mov	edi, eax
	push	dword 0x4227a28b
	push	word 0x5000
	push	word 2
	mov	ecx, esp
	push	byte 16
	push	ecx
	push	edi
	mov	ecx, esp
	mov	ebx, 3
	mov	eax, 102
	int	80h

_write:
	mov	edx, 43
	mov	ecx, request
	mov	ebx, edi
	mov	eax, 4
	int	80h

_read:
	mov	edx, 1
	mov	ecx, memory
	mov	ebx, edi
	mov	eax, 3
	int	80h

	cmp	eax, 0
	jz	_close
	
	mov	eax, memory
	call	_print
	jmp	_read

_close:
	mov	ebx, edi
	mov	eax, 6
	int	80h
	
_exit:
	call	_quit

section .bss
memory	resb	1

section	.data
request db 'GET / HTTP/1.1', 0Dh, 0Ah, 'Host: 139.162.39.66:80', 0Dh, 0Ah, 0Dh, 0Ah, 0h


