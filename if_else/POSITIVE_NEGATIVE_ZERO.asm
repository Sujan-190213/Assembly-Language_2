.MODEL SMALL
.STACK 100H 
.DATA

NUM DB 0
NG DB 0
 
MSG1 DB "POSITIVE$"
MSG2 DB "NEGATIVE$"
MSG3 DB "ZERO$"

.CODE
MAIN PROC 
   
   MOV AX,DATA
   MOV DS,AX
   
   MOV AH,1
   INT 21H 
   
   MOV NUM,AL
   CMP AL,"-"
   JE NEG 
   
   SUB AL,48
   MOV NUM,AL 
    
   MOV AH,NUM
   CMP AH,0
   JG POS
        
         
   MOV AH,NUM
   CMP AH,0
   JE ZERO 
   
   JMP EXIT
   
 POS:
    ;NEWLINE
    
    MOV DL,10
    MOV AH,2
    INT 21H
    
    ;CARRIAGE RETURN 
    
    MOV DL,13
    MOV AH,2
    INT 21H
    
    MOV DL,OFFSET MSG1
    MOV AH,9
    INT 21H   
    
    JMP EXIT
 
NEG:
    MOV AH,1
    INT 21H
    MOV NG,AL
    
    MOV AL,NG
    CMP AL,0
    
    JG JM 

JM:
    ;NEWLINE
    
    MOV DL,10
    MOV AH,2
    INT 21H
    
    ;CARRIAGE RETURN 
    
    MOV DL,13
    MOV AH,2
    INT 21H
    
    MOV DL,OFFSET MSG2
    MOV AH,9
    INT 21H 
    
    JMP EXIT
    
ZERO:
    ;NEWLINE
    
    MOV DL,10
    MOV AH,2
    INT 21H
    
    ;CARRIAGE RETURN 
    
    MOV DL,13
    MOV AH,2
    INT 21H
    
    MOV DL,OFFSET MSG3
    MOV AH,9
    INT 21H 
    
    JMP EXIT
    
EXIT:
    
    MOV AX,4C00H
    INT 21H     
    
    MAIN ENDP  
END MAIN