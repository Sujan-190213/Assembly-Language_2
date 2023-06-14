.MODEL SMALL
.STACK 100H
.DATA
 ARR1 DB 2,4,6,8     
 ARR2 DB 7,4,3,1
 A DB ?                            
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV SI,OFFSET ARR1
    MOV DI,OFFSET ARR2
    
    MOV CX,4
    
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