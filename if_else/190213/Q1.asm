.MODEL SMALL
.STACK 100H 
.DATA
 
 REM DB 0
 NUM DB 0
 
.CODE
MAIN PROC 
   
   MOV AX,@DATA
   MOV DS,AX
              
   MOV CL,15
   
   
LOOP1:

   MOV AL,CL   
    
   MOV AH,0
   
   MOV BL,2
   
   DIV BL   ;AL (RES =7 ) = AL / BL  ---  AH(REM =1)   
   
   MOV REM,AH
   CMP AH,0
   JNE ODD
   
  
   JMP EXIT
   
ODD:
   
   
   MOV DL,CL
   ADD DL,48
   MOV AH,2
   INT 21H 
   
   DEC CL
   
   CMP CL,0
   JE EXIT
   
   JMP LOOP1   

    
EXIT:
    
    MOV AX,4C00H
    INT 21H     
    
    MAIN ENDP  
END MAIN