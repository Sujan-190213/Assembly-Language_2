.MODEL SMALL
.STACK 100H
.DATA
    S DB 0
    NUM1 DB 0
    NUM2 DB 0
    AR DB 0 
    SR DB 0
    MR DB 0   
    
    RES DB 0
    REM DB 0
    
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ;SELECTION
    
    MOV AH,1
    INT 21H
    
    SUB AL,48
    MOV S,AL
    
    CMP S,1
    JE AD
    
        
    CMP S,2
    JE SB 
    
    CMP S,1
    JNE ML 
    
    CMP S,2
    JNE ML
    
    AD:
    CALL ADDITION

    
    SB:
    CALL SUBTRACTION 
    

    
    ML:
    CALL MULTIPLICATION 
    
     
    
    JMP EXIT
    

          
EXIT:    
    MOV AX,4C00H
    INT 21H
    
    MAIN ENDP  
    
ADDITION PROC 

      
      MOV AH,1
      INT 21H
      SUB AL,48
      MOV NUM1,AL
      
      MOV AH,1
      INT 21H
      SUB AL,48
      MOV NUM2,AL 
      
      MOV CL,NUM1
      ADD CL,NUM2 
      
      MOV SR,CL
      
      MOV AL,SR
      
     
      
      MOV AH,0
      MOV BL,10
      
      
      DIV BL
      
      MOV REM,AH
      
      MOV RES,AL
      ADD RES,48
      MOV DL,RES
      MOV AH,2
      INT 21H
      
      MOV DL,REM
      ADD DL,48
      MOV AH,2
      INT 21H
      
      ;JMP EXIT
       RET
ADDITION ENDP

SUBTRACTION PROC 

      
      MOV AH,1
      INT 21H
      SUB AL,48
      MOV NUM1,AL
      
      MOV AH,1
      INT 21H
      SUB AL,48
      MOV NUM2,AL 
        
        
      MOV CL,NUM1
      SUB CL,NUM2 
       
      
      MOV SR,CL
      ADD SR,48
      
      MOV DL,SR
      MOV AH,2 
      INT 21H 
      
      RET
    
SUBTRACTION ENDP 

MULTIPLICATION PROC 
  
      MOV AH,1
      INT 21H
      SUB AL,48
      MOV NUM1,AL 
      
      
      MOV AH,1
      INT 21H
      SUB AL,48
      MOV NUM2,AL 
      
      MOV AL,NUM1
      
      MOV BL,NUM2
      
      MUL BL        ;AL = AL * BL
      
      MOV MR,AL 
      
      MOV AL,MR
      
      MOV AH,0
      MOV BL,10
      
      DIV BL
      
      MOV REM,AH
      
      MOV RES,AL
      ADD RES,48
      MOV DL,RES
      MOV AH,2
      INT 21H
      
      MOV DL,REM
      ADD DL,48
      MOV AH,2
      INT 21H
      
      RET
    
MULTIPLICATION ENDP

END MAIN