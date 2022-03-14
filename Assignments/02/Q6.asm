INCLUDE Irvine32.inc
   
.data


   arr1 SDWORD 1,2,3,4,5,6,7,8
   arr2 SDWORD 5,6,7,8,9,10,11,12
   counter DWORD 0

   .code

   main PROC		
        INVOKE CountNearMatches, ADDR arr1, ADDR arr1, LENGTHOF arr1
        call WriteInt
        call Crlf
        
        exit
   main ENDP

       
CountNearMatches PROTO, ADDR arr1, ADDR arr1, LENGTHOF arr1
       mov esi,ptrarr1
        mov edi,ptrarr2
        mov ecx,sizearr
   L1:
   mov ebx,0
   mov ebx,[esi]
   mov edx,0
   mov edx,[edi]
   cmp ebx,edx
   jne equal
   inc counter
   jmp here

   equal:
   jmp here

   here:
   add esi, SIZEOF SDWORD
   add edi, SIZEOF SDWORD

   loop L1

; increment count
   mov eax,0
   mov eax,counter
   mov counter,0

   ret
   CountNearMatches ENDP

END main