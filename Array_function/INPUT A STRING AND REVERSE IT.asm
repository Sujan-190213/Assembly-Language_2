.MODEL SMALL
.STACK 100H  
.DATA
  STRING DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ;FIRST INDEX
    
    MOV SI,OFFSET STRING
    
    ;COUNTER
    MOV CX,5
    
    ;INPUT
    
   INPUT:
    
    MOV AH,1
    INT 21H
    MOV [SI],AL 
    MOV BX,[SI]      
    PUSH BX 
    INC SI
    LOOP INPUT    
    
   MOV DL,10
   MOV AH,2
   INT 21H
   
   MOV DL,13
   MOV AH,2
   INT 21H
   
  
  MOV CX,5
  
  L2:
  
  POP DX     ;VALUE IN DL
  MOV AH,2
  INT 21H 
  LOOP L2  
 
 MOV AX,4C00H
 INT 21H
    
 MAIN ENDP   
END MAIN    