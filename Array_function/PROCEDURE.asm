.MODEL SMALL
.STACK 100H
.DATA
  STR DB 'SUJAN DHALI $'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    
    CALL USER
    MOV AH,2
    MOV DL,10
    INT 21H
    
    MOV AH,2
    MOV DL,13
    INT 21H
    
    MOV DX,OFFSET STR
    MOV AH,9
    INT 21H

    
    MOV AX,4C00H
    INT 21H
    
    MAIN ENDP 

    USER PROC 
        
           MOV DX,OFFSET STR
           MOV AH,9
           INT 21H  
           RET  
           
    USER ENDP 

END MAIN