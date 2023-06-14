.MODEL SMALL
.STACK 100H 
.DATA
 
 NUM DB 0
 REM DB 0
 
 MSG1 DB "EVEN$"
 MSG2 DB "ODD$"
 
.CODE
MAIN PROC 
   
   MOV AX,DATA
   MOV DS,AX
   
   ;INPUT 
   
   MOV AH,1
   INT 21H
   
   MOV NUM,AL 
   
   MOV AH,0
   
   MOV BL,2
   
   DIV BL   ;AL (RES) = AL / BL  ---  AH(REM)   
   
   MOV REM,AH
   CMP AH,0
   JE EVEN
   
   MOV DL,10
   MOV AH,2
   INT 21H
   
   MOV DL,13
   MOV AH,2
   INT 21H
   
   
   MOV DL,OFFSET MSG2
   MOV AH,9
   INT 21H
   
   JMP EXIT
   
EVEN:
   
   MOV DL,10
   MOV AH,2
   INT 21H
   
   MOV DL,13
   MOV AH,2
   INT 21H
   
   MOV DL,OFFSET MSG1
   MOV AH,9
   INT 21H
   
   JMP EXIT
      

    
EXIT:
    
    MOV AX,4C00H
    INT 21H     
    
    MAIN ENDP  
END MAIN