
INCLUDE Irvine32.inc

.data
sizee dword 10
array SDWORD SIZEOF sizee DUP(30,-40,20,65,80,45)
j DWORD ?
k DWORD ?


.code

    main PROC
   	    MOV j, 20
   	    MOV k, 50
   	    MOV ESI, OFFSET array
   	    MOV ECX, sizee
   	    CALL ArraySum
   	    CALL WriteInt
   	    CALL crlf

   	    MOV j, 35
   	    MOV k, 90
   	    MOV ESI, OFFSET array
   	    MOV ECX, sizee
        CALL ArraySum
   	    CALL WriteInt
   	    CALL crlf
     exit
     
     main ENDP

ArraySum PROC USES ecx esi
   	 MOV eax, 0

   	 L1:
   		 MOV ebx, [esi]
   		 cmp ebx, j
   		 jge loop11
   		 jmp trvs

   		 loop11:
   			 cmp ebx, k
   			 jle loop22
   			 jmp trvs
   		 loop22:
   			 add eax, ebx
   		 trvs:
   			 add esi, 4

   	 loop L1
     ret
ArraySum ENDP

END main