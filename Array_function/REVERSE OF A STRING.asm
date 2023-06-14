.MODEL SMALL
.STACK 100H
.DATA
STRING DB ?
.CODE
MAIN PROC
  MOV AX,@DATA
  MOV DS,AX
  
  MOV SI,OFFSET STRING    ; ADDRESS OF 'S'    (SUJAN)
  MOV CX,5 
  
  INPUT:
  
  MOV AH,1
  INT 21H
  MOV [SI],AL
  INC SI
  LOOP INPUT
   
   
  MOV DL,10
  MOV AH,2
  INT 21H
  
  MOV DL,13
  MOV AH,2
  INT 21H  
  
  
  MOV SI,OFFSET STRING    ; ADDRESS OF 'S'
  MOV CX,5   
   
  L1:
  
  MOV BX,[SI]       ;VALUE OF THE SOURCE INDEX 'S'
  PUSH BX           ;PUSH THE VALUE IN THE STACK    ; N A J U S
  INC SI           
  LOOP L1  
  
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