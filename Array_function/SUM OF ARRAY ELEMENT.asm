.MODEL SMALL
.STACK 100H
.DATA
  ARR DB 1,2,3,4,5    
  RES DB ?
  REM DB ? 
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV SI,0
    MOV CX,5
    MOV AX,0
    
    SUM:
    
    ADD AL,ARR[SI]
    INC SI
    
    LOOP SUM
    
    
    MOV AH,0
    MOV BL,10
    DIV BL
    MOV REM,AH
    
    MOV RES,AL
    
    MOV DL,RES
    ADD DL,48
    MOV AH,2
    INT 21H 
    
    MOV DL,REM
    ADD DL,48
    MOV AH,2
    INT 21H

    MOV AX,4C00H
    INT 21H
    
    MAIN ENDP
END MAIN