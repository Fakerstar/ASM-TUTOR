;Ascii to integer function
_atoi:
	push ebx
	push ecx
	push edx
	push esi
	mov esi, eax
	mov eax, 0
	mov ecx, 0

.multiplyloop:
	xor ebx, ebx
	mov bl, [esi+ecx]
	cmp bl, 48
	jl .finished
	cmp bl, 57
	jg .finished
	
	sub bl, 48
	add eax, ebx
	mov ebx, 10
	mul ebx
	add ecx, 1
	jmp .multiplyloop

.finished:
	mov ebx, 10
	div ebx
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

;Print an integer correctly
_iprint:
	push eax
	push ecx
	push edx
	push esi
	mov ecx, 0

_divideLoop:
	add ecx, 1
	mov esi, 10
	mov edx, 0
	idiv esi
	add edx, 48
	push edx
	cmp eax, 0
	jnz _divideLoop
	
_printLoop:
	sub ecx, 1
	mov eax, esp
	call _print
	pop eax
	cmp ecx, 0
	jnz _printLoop

	pop esi
	pop edx
	pop ecx
	pop eax
	ret

;Print an integer with linefeed
_iprintLF:
	call _iprint
	push eax
	mov eax, 0Ah
	push eax
	mov eax, esp
	call _print
	pop eax
	pop eax
	ret


;Calculate the len of a message
_len:
	push ebx
	mov ebx, eax
	
_nextchar:
	cmp byte [eax], 0
	jz _finished
	add eax, 1
	jmp _nextchar

_finished:
	sub eax, ebx
	pop ebx
	ret

;Print a message
_print:
	push edx
	push ecx
	push ebx
	push eax
	call _len

	mov edx, eax
	pop eax
	mov ecx, eax
	mov ebx, 1
	mov eax, 4
	int 80h

	pop ebx
	pop ecx
	pop edx
	ret

;Print a Linefeeds
_printLF:
	call _print
	push eax
	mov eax, 0Ah
	push eax
	mov eax, esp
	call _print
	pop eax
	pop eax
	ret


;Exit program
_quit:
	mov eax, 1
	mov ebx, 0
	int 80h
	ret 
