.MODEL SMALL
.STACK 100H
.DATA
  NUMBER DB 0

.CODE

MAIN PROC
    
    MOV AH,1
    INT 21H
    
    MOV LP,AL
    MOV AX,0
    
    XOR CX,CX
    
    MOV CX,AX  
    
    MOV DL,9
    MOV FN,DL
    MOV BL,1

    
LABEL: 
    
     CMP AL,NUMBER
     JE EXIT
     
     MOV AL,FN
     
     MUL BL
     
     
     
EXIT:
     


    
    
    MOV AX,4C00H
    INT 21H
    
    MAIN ENDP  
END MAIN