; if ( a>=b && b<c ) then print 'Y' else print 'N'

.MODEL SMALL
.STACK 100H
.DATA
  NUM1 DB 0
  NUM2 DB 0
  NUM3 DB 0
  
  RES1 DB "Y$"
  RES2 DB "N$"
.CODE
MAIN PROC
  MOV AX,@DATA
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
  
  
  ;OPERATION
  
  MOV BL,NUM1
  CMP BL,NUM2
  JGE IF1
  
  JMP EXIT
  
  IF1:
  
     MOV CL,NUM2
     CMP CL,NUM3
     JL IF2
     
     MOV DL,OFFSET RES2
     MOV AH,9
     INT 21H 
     
     JMP EXIT  
     
  IF2:
  
     MOV DL,OFFSET RES1
     MOV AH,9
     INT 21H   

EXIT:

     MOV AX,4C00H
     INT 21H
    
MAIN ENDP
END MAIN