.MODEL SMALL
.STACK 100H


.CODE 
MAIN PROC 
    
    
    MOV AL,8
    MOV BL,4
    MOV CL,5
    
    
    
    CMP AL,BL
    JG A
    
   JMP B
   
   
   A:
   
   CMP AL,CL
   JG YES_A 
   
  JMP B
  
  
  
 B:
 
   CMP BL,CL
   JG YES_B
   
   
    MOV DL,CL
  ADD DL,48
  MOV AH,2
  INT 21H
    JMP EXIT
  
 
  
  YES_A:
  
  MOV DL,AL
  ADD DL,48
  MOV AH,2
  INT 21H
    JMP EXIT 
    
    
    
     YES_B:
  
  MOV DL,BL
  ADD DL,48
  MOV AH,2
  INT 21H
    JMP EXIT
  
 EXIT:   
       
       
       
   MOV AX,4C00H
   INT 21H
   MAIN ENDP
   END MAIN