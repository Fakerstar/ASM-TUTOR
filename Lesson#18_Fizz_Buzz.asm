%include 'functions.asm'

section .text
global _start

_start:

	mov esi, 0
	mov edi, 0
	mov ecx, 0
	
nextNumber:
	inc ecx
	
.checkFizz:
	mov edx, 0
	mov eax, ecx
	mov ebx, 3
	div ebx
	mov edi, edx
	cmp edi, 0
	jne .checkBuzz
	mov eax, fizz
	call _print

.checkBuzz:
	mov edx, 0
	mov eax, ecx
	mov ebx, 5
	div ebx
	mov esi, edx
	cmp esi, 0
	jne .checkInt
	mov eax, buzz
	call _print
	
.checkInt:
	cmp edi, 0
	je .continue
	cmp esi, 0
	je .continue
	mov eax, ecx
	call _iprint
	
.continue:
	mov eax, 0Ah
	push eax
	mov eax, esp
	call _print
	pop eax
	cmp ecx, 100
	jne nextNumber

	call _quit

section .data
fizz db 'Fizz', 0h
buzz db 'Buzz', 0h
