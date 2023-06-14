.MODEL SMALL
.STACK 100H
.DATA
     NUM1 DB ?
     NUM2 DB ?  
     RES DB 0 
     REM DB 0
     
.CODE
MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
        ;INPUT 1ST NUM
        
        MOV AH,1
        INT 21H
        SUB AL,48
        MOV NUM1,AL
        
        
        ;INPUT 2ND NUM  
        
        MOV AH,1
        INT 21H 
        SUB AL,48
        MOV NUM2,AL
                      
                      
         MOV DL,NUM1
         CMP DL,NUM2
         JE SUM 
         JNE SUBT
        
               
 SUM:
      MOV DL,NUM1
      ADD DL,NUM2  
      
      MOV RES,DL 
      
      MOV AL,RES
      
      MOV AH,0
      MOV BL,10
      
      DIV BL   ;AL = AL /BL  RES(AL) = 1 REM(AH) = 0   5 5
      
      MOV REM,AH
      
      ;PRINT RES
      
             MOV DL,AL
             ADD DL,48
             MOV AH,2
             INT 21H 


               
      ;PRINT REM         
      
      MOV DL,REM 
      ADD DL,48
      
      MOV AH,2
      INT 21H                     
      
      
      JMP EXIT                        
                               
 SUBT:
      MOV AL,NUM1
      SUB AL,NUM2                         
      
      ADD AL,48
      MOV RES,AL
     
      MOV DL,RES 
      MOV AH,2
      INT 21H                           
      JMP EXIT
      
                             
   
    
EXIT:
    
    MOV AX,4C00H
    INT 21H
    
    MAIN ENDP
END MAIN