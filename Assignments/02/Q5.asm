
INCLUDE Irvine32.inc

.data

char    BYTE   "Enter any character: ",0
ascii    BYTE    "ASCII value Of the Character: ",0
count   BYTE  "1's Count: ",0

.code

main PROC

        MOV eax,0
        LEA edx,char
        CALL writestring
        CALL readchar
        CALL writechar
        CALL crlf
    

        MOV bl,00000000b
        AND ah,bl
        LEA edx, ascii
        CALL writestring
        CALL writebin
        CALL crlf
    
        MOV ecx,8
        MOV ebx,0

    L1:
	    SHR al,1
	    JNC backL1
	    ADD ebx,1
    backL1:
        LOOP L1
    
        LEA edx, count
        CALL writestring
        MOV eax,ebx
        CALL writedec
        
        

exit
main ENDp
END main