%include 'functions.asm'

section .data
msg db 'First message using functions',0Ah
msg2 db 'Second message using functions',0Ah

section .text
global _start

_start:
	mov eax, msg
	call _print

	mov eax, msg2
	call _print

	call _quit
