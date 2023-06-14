.MODEL SMALL

.STACK 100H

.DATA
    A DW ?
    B DW ?
    SUM DW ?
    REM1 DW ?
    REM2 DW ?
    RES DB ? 
    MSG1 DB "FIRST NUMBER:$"
    MSG2 DB 10,13,"SECOND NUMBER:$"
    MSG DB 10,13,'RESULT IS:$'
.CODE
MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX 
    
    
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AX,48;TAKE 1ST DIGIT
    
    MOV AH,0     ;CLEAR AH
    MOV BX,10
    MUL BX  ;MULTIPLY 1ST DIGIT BY 10
    MOV A,AX;STORE IT TO A
    
    MOV AH,1
    INT 21H
    SUB AX,48;TAKE 2ND DIGIT
    MOV AH,0
    ADD AX,A ;ADD 2ND+A DIGIT
    
    MUL BX   ;MULTIPLY AX BY 10
    MOV A,AX 
    
    MOV AH,1
    INT 21H
    SUB AX,48;TAKE 3RD DIGIT
    MOV AH,0
    ADD AX,A;ADD 3RD DIGIT TO A    
    
    
    
    
    MOV A,AX
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AX,48; TAKE 1ST DIGIT
    
    MOV AH,0
    MOV BX,10
    MUL BX   ;MULTIPLY 1ST DIGIT BY 10
    MOV B,AX
    
    MOV AH,1
    INT 21H
    SUB AX,48;TAKE 2ND DIGIT
    MOV AH,0
    ADD AX,B;ADD B+2ND DIGIT
    
    MUL BX   ;MULTIPLY AX BY 10
    MOV B,AX
    
    MOV AH,1
    INT 21H
    MOV AH,0
    SUB AX,48;TAKE 3RD DIGIT
    ADD AX,B
    MOV B,AX
    
    ;ADDITION
    
    MOV AX,A
    ADD AX,B
    MOV SUM,AX
    
    ;CALCULATION PART
    
    MOV BX,10
    DIV BX
    MOV REM1,DX
    MOV DX,0
    DIV BX
    MOV REM2,DX 
    MOV RES,AL
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    MOV DL,RES
    ADD DL,48
    MOV AH,2
    INT 21h
    
    MOV AX,REM2
    MOV DL,AL
    ADD DL,48
    MOV AH,2
    INT 21H
    
    MOV AX,REM1
    MOV DL,AL
    ADD DL,48
    MOV AH,2
    INT 21H
    
        
    MOV AX,4C00H
    INT 21H
    MAIN ENDP
END MAIN