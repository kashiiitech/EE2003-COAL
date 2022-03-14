INCLUDE irvine32.inc

.data

msg1 byte "Enter a Number: ", 0
msg2 byte "Factorial of the Number is: ", 0

.code
	main PROC 
		MOV edx, OFFSET msg1
		CALL WriteString
		MOV eax, 0
		CALL Readdec
		MOV ecx, eax
		MOV eax, 0
		PUSH ecx
		CALL FACTORIAL

	exit
	main ENDP 


FACTORIAL PROC
		PUSH ebp
		MOV ebp, esp

		MOV ecx, [ebp+8]
		MOV eax, ecx
		
		L1:
			MOV ebx, ecx
			SUB ebx, 1
			CMP ebx, 0
			JG fac
			JMP move
				fac:	
					MUL ebx
		move:
			LOOP L1
		
		CALL CRLF
		MOV edx, OFFSET msg2
		CALL WriteString
		CALL WriteDec
		CALL CRLF



		MOV esp, ebp
		POP ebp
	
	RET
FACTORIAL ENDP

END main