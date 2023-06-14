.MODEL SMALL
.STACK 100H
.DATA
I DB 0
.CODE 
MAIN PROC
   MOV AX,@DATA
   MOV DS,AX
   
   MOV AH,1
   INT 21H
   SUB AL,48
   MOV CAR,AL
   
   MOV CL,0
   MOV I,CL
   
 
   CMP AL,65
   JGE P
   
 P: 
 
     ADD AL,I
     INC I
     CMP AL,90 
   
   

   MOV AX,4C00H
   INT 21H
MAIN ENDP
END MAIN