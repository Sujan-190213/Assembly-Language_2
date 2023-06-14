.MODEL SMALL
.STACK 100H
.DATA

.CODE
  ARR DB ?
  SUM DB ?
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ;FIRST INDEX
    
    MOV SI,OFFSET ARR
    
    ;COUNTER
    MOV CX,5
    
    ;INPUT
    
   INPUT:
    
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV [SI],AL
    INC SI
    LOOP INPUT
    
    ;AGAIN STARTING FROM SOURCE INDEX
    
    MOV SI,OFFSET ARR
    MOV CX,5 
    
    
    MOV DL,10
    MOV AH,2
    INT 21H
    
    MOV DL,13
    MOV AH,2
    INT 21H
    
    MOV AX,0
    ;OUTPUT
    OUTPUT:
    
    MOV DL,[SI]
    ADD AL,DL 
    INC SI
    LOOP OUTPUT
    
    MOV SUM,AL
    
    MOV DL,SUM
    MOV AH,2
    INT 21H
    
    MOV AX,4C00H
    INT 21H
    
    MAIN ENDP
END MAIN