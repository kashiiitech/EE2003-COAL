INCLUDE Irvine32.inc


.data

Number1 QWORD 10101010b  
Number2 QWORD 10010000b  
Result Dword 3 dup(?)

.code

main PROC

    MOV edi, offset Number2
    MOV esi, offset Number1
    MOV ebx, Offset Result
    MOV ecx, 2 
    CALL Extended_ADD
    CALL writebin

EXIT
main ENDP

Extended_ADD proc
    PUSHAD
    clc
        L1:
            MOV eax,[esi]
            ADC eax,[edi]
            pushfd
            MOV [ebx],eax
            add esi, TYPE Number1
            add edi, TYPE Number2
            add ebx,  4
            popfd
        LOOP L1

    ADC WORD PTR[ebx],0
    POPAD
    MOV eax,[ebx]
    RET
Extended_ADD endp

END main
