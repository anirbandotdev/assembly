itoa:
	push esi
	push edx
	mov esi , 10
	mov edi , 0
extract_digits:
	xor edx , edx
	div esi 
	push edx
	inc edi
	cmp eax , 0
	jne extract_digits

print_digits:
	add [esp] , 48
	
	mov edx , 1
	mov ecx , esp 
	mov ebx , 1
	mov eax , 4 
	int 80h
	dec edi
	cmp edi , 0
	pop edx
	jne print_digits 
	pop edx 
	pop esi

	ret


atoi:
    push esi
    push ecx

    mov esi, eax     
    xor ecx, ecx    

convert_loop:
    movzx eax, byte [esi] 
    cmp eax, 0
    je finished

    sub eax, '0'         

    imul ecx, ecx, 10   
    add ecx, eax       

    inc esi
    jmp convert_loop

finished:
    mov eax, ecx      

    pop ecx
    pop esi
    ret
	
