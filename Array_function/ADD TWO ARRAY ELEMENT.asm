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
    
    CMP CX,0
    JE EXIT
    
    MOV AL,[SI]
    MOV AH,[DI]
    ADD AH,AL
    JMP PRINT
    LOOP P
    
   PRINT:
   ADD AH,48
   MOV DL,AH
   MOV AH,2
   INT 21H
   
   
   MOV DL,10
   MOV AH,2
   INT 21H 
   
   MOV DL,13
   MOV AH,2
   INT 21H 
      
   INC SI
   INC DI
   DEC CX
   JMP P 

    
EXIT:    
    MOV AX,4C00H
    INT 21H 
        
    MAIN ENDP
END MAIN