.MODEL SMALL
.STACK 100H
.DATA
 ARR1 DB 1,2,3,4,5    
 ARR2 DB ?
 A DB ?                            
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AL,0
    MOV CX,4
    MOV SI,0
    
    SUM:
    
     MOV AL,ARR1[SI]
     ADD AL,ARR1[SI+1]
     
     MOV AH,2
     ADD AL,48
     MOV DL,AL
     INT 21H
    
     INC SI
     
     LOOP SUM
    MOV AX,4C00H
    INT 21H 
        
    MAIN ENDP
END MAIN