.MODEL SMALL
.STACK 100H
.DATA
    VAR1 DW 7  
    VAR2 DW 5
    VAR3 DW 8
    SUM DW ?
    REM DB ?
     
.CODE

MAIN PROC
         
         MOV AX,@DATA
         MOV DS,AX
         
         MOV AX,VAR1
         ADD AX,VAR2     ;ADD THREE NUMBER  
         ADD AX,VAR3
         MOV SUM,AX
         
         
         MOV AH,0    ;CLEAR AH
         MOV BL,10
         DIV BL      ; DIVIDE AL BY BL   NOW AL >> RESULT AND AH >> REMAINDER
         
         MOV REM,AH  ;AH CONTAINS REMAINDER 
         
         MOV DL,AL
         ADD DL,48      ;DL IS NOW 1 (DECIMAL) SO CONVERTED INTO ASCII 
         MOV AH,2
         INT 21H
         
         MOV DL,REM
         ADD DL,48      ;DL IS NOW 2 (DECIMAL) SO CONVERTED INTO ASCII 
         MOV AH,2
         INT 21H
         
         
         
     
    MOV AX,4C00H
    INT 21H
     
    MAIN ENDP


END MAIN