.MODEL SMALL
.STACK 100H
.DATA
   NUM1 DB 0
   NUM2 DB 0
   NUM3 DB 0
   
.CODE
MAIN PROC
    MOV AX,DATA
    MOV DS,AX
    
    ;1ST NUM
    
    MOV AH,1
    INT 21H
    
    MOV NUM1,AL
    
    ;2ND NUM
    
    MOV AH,1
    INT 21H
    
    MOV NUM2,AL 
    
    ;3RD NUM
    
    MOV AH,1
    INT 21H
    
    MOV NUM3,AL
    
    IF1:
       
       MOV CL,NUM1
    
       CMP CL,NUM2
       JG IF2
       JL EXIT
       
       
    IF2:
       
       MOV BL,NUM2
       
       CMP BL,NUM3
       JL RES1
       JG RES2
       
       
    RES1:
    
        MOV DL,2
        ADD DL,48
        MOV AH,2
        INT 21H
        
        JMP EXIT  
        
    RES2:
    
        MOV DL,5
        ADD DL,48
        MOV AH,2
        INT 21H
        
        JMP EXIT          
  EXIT:   
       
       MOV AX,4C00H
       INT 21H
     
    MAIN ENDP
END MAIN     