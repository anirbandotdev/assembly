strlen:
	push ebx 
	mov ebx , eax

nextchar:
	cmp byte [eax] , 0
	jz done
	inc eax 
	jmp nextchar

done:
	sub eax , ebx
	pop ebx
	ret

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



quit:
	mov eax , 1
	mov ebx , 0

	int 80h
