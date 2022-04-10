%include 'functions.asm'

section .text
global _start
_start:
	mov eax, msg
	call _print
	
	mov eax, 3
	mov ebx, 0
	mov ecx, input
	mov edx, 255
	int 80h	

	mov eax, msg2
	call _print
	
	mov eax, input
	call _print

	call _quit


section .data
msg db 'Please enter your name: ', 0h
msg2 db 'Hello, ',0h

section .bss
input resb 255
