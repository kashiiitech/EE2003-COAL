INCLUDE IRVINE32.INC
.data

diff DWORD 3 DUP(?)

Number1 QWORD 1010101010b
Number2 QWORD 1111000001b


.code

main PROC

MOV esi, offset Number1
MOV edi, offset Number2

MOV ebx, OFFSET diff
MOV ecx, 2 

CALL Extended_Sub

CALL WriteBin
EXIT
main ENDP

Extended_Sub proc

PUSHAD
clc

    L1:

        MOV eax,[esi]
        SBB eax,[edi]
        PUSHFD
        MOV [ebx],eax
        ADD esi, TYPE num1
        ADD edi, TYPE num2
        SUB ebx, 4
        POPFD
    LOOP L1

SBB word ptr [ebx],0
POPAD

MOV eax,[ebx]
RET
Extended_sub ENDP

END MAIN
