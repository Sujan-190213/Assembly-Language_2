.MODEL SMALL
.STACK 100H
.DATA
  ARR1 DB 2,4,5,6
  ARR2 DB 2,4,5,6
  MSG1 DB 'BOTH ARE SAME $'
  MSG2 DB 'BOTH ARE NOT SAME $'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV SI,OFFSET ARR1
    MOV DI,OFFSET ARR2
    
    MOV CX,4
    
    LOOPX:
    
    MOV AL,[SI]
    MOV BL,[DI]
    
    CMP AL,BL
    JNE NOTSAME
    
    INC SI
    INC DI
    
    LOOP LOOPX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H 
    
    MOV AX,4C00H
    INT 21H 
    
    NOTSAME:
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H  
    
    MOV AX,4C00H
    INT 21H 
        
    MAIN ENDP
END MAIN