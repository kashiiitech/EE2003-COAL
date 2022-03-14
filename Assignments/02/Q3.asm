INCLUDE irvine32.inc


.data

msg1 byte "Enter a single-digit number: ", 0
msg2 byte "Sorted Array is: ", 0
array DWORD 10 Dup(?)


.code
	main PROC 
	
			
	mov ecx, LENGTHOF array
	mov al, 0
	mov esi, 0
	L1:
		mov edx, OFFSET msg1
		call WriteString
		call ReadDec
		mov array[esi*TYPE array], eax
		inc esi

		loop L1
	

	push LENGTHOF array
	push OFFSET array
	call BUBBLE


	exit
	main ENDP 
	
	BUBBLE PROC
		push ebp
		mov ebp, esp

		mov esi, [ebp+8]
		mov edi, esi
		mov ebx, [ebp+12]
		mov ecx, ebx
		mov edi, 0

		L1:
			mov edx, ecx
			mov ecx, 9
			L2:
				mov eax, 0
				mov ebx, 0
				mov eax, array[edi * TYPE array]
				inc edi
				mov ebx, array[edi * TYPE array]
				dec edi
				
				cmp eax, ebx
					JG call_swap
					back:
				inc edi
			loop L2
		
			mov edi, 0
			inc esi
			mov ecx, edx
	
		loop L1

	call Print_Array
	
	ret

	call_swap:
		call swap
		jmp back

	mov esp, ebp
	pop ebp

	BUBBLE ENDP


	swap PROC
		xchg eax,ebx
		mov array[edi * TYPE array], eax
		inc edi
		mov array[edi * TYPE array], ebx
		dec edi
		mov eax, 0
		mov ebx, 0
		
		ret
	swap ENDP

	Print_Array PROC
		mov esi, 0
		mov ecx,10
		mov edx, OFFSET msg2
		call WriteString
		call CRLF
		mov edx, 0


		L3:
			mov eax,array[edx * TYPE array]
			call writedec
			call CRLF
			inc edx
		loop L3
	ret
Print_Array endp

END main