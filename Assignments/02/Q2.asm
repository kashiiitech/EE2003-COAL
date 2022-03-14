INCLUDE Irvine32.inc
.data
    msg1 byte "Enter a single-digit number: ", 0
    msg2 byte "Sorted Array is: ", 0
    array byte 10 Dup(?)
.code

    main PROC
        mov ecx, LENGTHOF array
             mov al, 0
             mov esi, 0
         L1:

                 mov edx, OFFSET msg1
                 call WriteString
                 call ReadDec
                 mov DWORD PTR array[esi*TYPE array], eax
                 inc esi
                 loop L1
        mov ecx, OFFSET array

        push ecx

        mov esi, OFFSET array

        mov ecx, LENGTHOF array

        call FindMinimum

   

        mov edi, OFFSET array

        mov ecx, LENGTHOF array

        call SelectionSort

        mov ecx, OFFSET array

        push ecx

        mov edx, OFFSET msg2

        call WriteString

        call CRLF

        call DisplayArray
        exit
main ENDP


DisplayArray PROC

    pushad

    mov eax, 0

    mov ecx, LENGTHOF array

    mov esi, 0

    L2:

        mov al, array[esi]

        call WriteDec

        mov al, TAB

        call WriteChar

        inc esi

        call Crlf

 

    loop L2

        popad

        call Crlf

    ret

 

DisplayArray ENDP

SelectionSort PROC

    dec ecx

    mov ebx, edi

    mov edx, ecx
    OuterLoop:

        mov edi, ebx

        mov esi, edi

        inc esi

        push ecx

        mov ecx, edx
        InnerLoop:

            mov al, [esi]

            cmp al , [edi]

            pushf

            inc esi

            inc edi

            popf

            jae doNotSwap

            call Swap
            doNotSwap:

        loop InnerLoop
        pop ecx

        loop OuterLoop
    ret
SelectionSort ENDP

FindMinimum PROC

    mov edi, esi
    minimumIndex:

        mov al, [esi]

        cmp al, [edi]

        jae skip

        mov edi, esi
    skip:

        inc esi
        loop minimumIndex
        ret
FindMinimum ENDP
Swap PROC

    mov al, [esi-1]

    mov ah, [edi-1]

    mov [esi-1], ah

    mov [edi-1], al

    ret
Swap ENDP
END main