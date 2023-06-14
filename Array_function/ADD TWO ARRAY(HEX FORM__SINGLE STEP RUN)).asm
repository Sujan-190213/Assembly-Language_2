.MODEL SMALL
.STACK 100H
.DATA
 ARR1 DB 2H,4H,6H,8H,10H     ;[2,4,6,8,10]
 ARR2 DB 1H,3H,5H,7H,9H
                             ;[1,3,5,7,9]
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV SI,OFFSET ARR1
    MOV DI,OFFSET ARR2
    
    MOV CX,5
    
    P:
    
    MOV AL,[SI]
    MOV AH,[DI]
    ADD AH,AL
    INC SI
    INC DI
    
    LOOP P

    
    MOV AX,4C00H
    INT 21H 
        
    MAIN ENDP
END MAIN