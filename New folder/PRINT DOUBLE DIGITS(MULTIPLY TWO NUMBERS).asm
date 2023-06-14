.MODEL SMALL
.STACK 100H
.DATA
    VAR1 DB 7  
    VAR2 DB 5
    
     
.CODE

MAIN PROC
         
         MOV AX,@DATA
         MOV DS,AX
         
         MOV AL,VAR1
         MOV BL,VAR2     ;MULTIPLY TWO NUMBER
         MUL BL
         
         AAM      ;ASCII AFTER MULTIPLICATION KEYWORD
         
         MOV CH,AH
         MOV CL,AL
         
         MOV DL,CH
         ADD DL,48
         MOV AH,2
         INT 21H
         
         MOV DL,CL
         ADD DL,48
         MOV AH,2
         INT 21H
         
         
      
     
    MOV AX,4C00H
    INT 21H
     
    MAIN ENDP


END MAIN