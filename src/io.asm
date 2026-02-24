%include 'utils.asm'

print:
	; print without a newline
	push edx
	push ecx
	push ebx
	push eax
	call strlen

	mov edx , eax

	pop eax

	mov ecx , eax
	mov ebx , 1
	mov eax , 4
	int 80h

	pop ebx
	pop ecx
	pop edx
	ret 

sprint:
	; print with a newline
	call print
	push eax

	mov eax , 0Ah
	push eax

	mov eax , esp
	call print
	
	pop eax
	pop eax
	ret

input:
	push edx 
	push ecx
	push ebx
	push eax

	mov edx , 4
	mov ecx , esp
	mov ebx , 0
	mov eax , 3

	int 80h


	pop eax
	pop ebx
	pop ecx
	pop edx
	ret
