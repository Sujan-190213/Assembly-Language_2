.MODEL SMALL
.STACK 100H 
.DATA
 
 NUM1 DB 0
 NUM2 DB 0
 NUM3 DB 0
 MSG DB "yes and summation result is = $"
 SUM DB 0
 G DB 0          
 RES DB 0
 REM DB 0          
           
.CODE
MAIN PROC 
   
   MOV AX,DATA
   MOV DS,AX
   
   MOV AH,1
   INT 21H
   SUB AL,48
   MOV NUM1,AL
   
   MOV AH,1
   INT 21H
   SUB AL,48
   MOV NUM2,AL
   
   MOV AH,1
   INT 21H
   SUB AL,48
   MOV NUM3,AL
   
   MOV BL,NUM1            
   CMP BL,NUM2
   JE S1 
         
   JMP COMPAIR      
   
   
S1:

  MOV CL,NUM1
  CMP CL,NUM3
  JE AD
  
  
  
AD:
  MOV DX,OFFSET MSG
  MOV AH,9
  INT 21H
  

  MOV CL,NUM1
  ADD CL,NUM2
  ADD CL,NUM3  
  
  
  MOV SUM,CL
  MOV AL,SUM
  
  MOV AH,0 
  MOV AL,SUM
  MOV BL,10
  DIV BL
  
  MOV REM,AH
  
 
  
  MOV DL,AL
  ADD DL,48
  MOV AH,2
  INT 21H

                   
  MOV DL,REM
  ADD DL,48
  MOV AH,2
  INT 21H
  
  JMP COMPAIR             
  
  JMP EXIT  
  
  
 
  
  
COMPAIR:

  MOV AH,NUM1
  CMP AH,NUM2
  JG L1
  
  MOV AH,NUM1
  CMP AH,NUM2
  JL L2
  
  
  L1:
  
    MOV AH,NUM1
    CMP AH,NUM3
    JG GNUM1
    
    MOV AH,NUM1
    CMP AH,NUM3
    JL GNUM3
    
    JMP EXIT
    
 GNUM1:
 
    MOV BL,NUM1
    MOV G,BL

    JMP EXIT
    
 GNUM3:
 
    MOV CL,NUM3
    MOV G,CL     
              
    JMP EXIT          
              
L2:

   MOV BH,NUM2
   CMP BH,NUM3
   JG GNUM2
   
   JMP GNUM3
                  
   JMP EXIT

GNUM2:

   MOV BH,NUM2
   MOV G,BH              
   
   JMP EXIT   
   
   
   
   
   
   
   
   
   
       
    
EXIT:
    
    MOV AX,4C00H
    INT 21H     
    
    MAIN ENDP  
END MAIN