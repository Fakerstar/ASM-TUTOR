%include 'functions.asm'

section .data
msg db 'Another hello word',0h
msg2 db 'Second message',0h

section .text
global _start

_start:
	mov eax, msg
	call _printLF
	
	mov eax, msg2
	call _printLF

	call _quit
