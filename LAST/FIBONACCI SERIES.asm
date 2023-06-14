;PRINT FIBONACCI SERIES

.MODEL SMALL
.STACK 100H
.DATA
  FIRST DB 0
  SECOND DB 0
  THIRD DB 0  
       
.CODE
MAIN PROC
    
     MOV AX,DATA
     MOV DS,AX
     
     XOR CX,CX
     
     MOV AH,1
     INT 21H
                        ; SUPPOSE 5 NUMBERS
     SUB AL,48  
     
     MOV AH,0
   
     MOV DL,1 
     MOV FIRST,DL
     MOV BL,1 
     MOV SECOND,BL
     
     SUB AL,2 
     MOV CX,AX
     
     MOV DL,10
     MOV AH,2
     INT 21H   
         
     MOV DL,13
     MOV AH,2
     INT 21H
     
     MOV DL,FIRST 
     ADD DL,48
     MOV AH,2
     INT 21H  
     
     
     MOV DL,10
     MOV AH,2
     INT 21H   
         
     MOV DL,13
     MOV AH,2
     INT 21H   
     
     
     MOV DL,SECOND 
     ADD DL,48
     MOV AH,2     
     INT 21H                    
                         
                         
  LABEL:
         
         MOV DL,10
         MOV AH,2
         INT 21H   
         
         MOV DL,13
         MOV AH,2
         INT 21H
         
         MOV BL,FIRST
         ADD BL,SECOND
         MOV THIRD,BL 
         
         MOV DL,SECOND
         MOV FIRST,DL  
         MOV SECOND,BL
         
         
         MOV AH,2
         MOV DL,THIRD 
         ADD DL,48
         INT 21H
         
         
         DEC CL
         CMP CL,0
         JE EXIT
         JMP LABEL
                                       
    
EXIT:     
    MOV AX,4C00H
    INT 21H
    
    MAIN ENDP

END MAIN





