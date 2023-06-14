.MODEL SMALL
.STACK 100H

.DATA

NUMBER DB 10 DUP (0) 
 I DW 0
 V DB 0


 .CODE
MAIN PROC 
    
MOV AX,@DATA
MOV DS,AX         
                
 XOR BX,BX
            
 MOV CX,9

 
 LOOP1:
 
 MOV AH,1
 INT 21H
                        
 MOV NUMBER[BX],AL
  
 INC BX
 
 LOOP LOOP1
     
     ;NEWLINE AND CARRIAGE RETURN 
     
     MOV AH,2
     MOV DL,10
     INT 21H
     MOV DL,13
     INT 21H

     ;input i = ?
     
     MOV AH,1
     INT 21H 
     MOV AH,0
     MOV BX,AX
     SUB BX,48
     MOV I,BX
   
     ;NEWLINE AND CARRIAGE RETURN 
        
     MOV AH,2
     MOV DL,10
     INT 21H
     MOV DL,13
     INT 21H
     
     ;VALUE OF i   
        
     MOV AH,1
     INT 21H
     MOV V,AL   
     MOV NUMBER[BX],AL    
     
      
     ;NEWLINE AND CARRIAGE RETURN 
      
     MOV AH,2
     MOV DL,10
     INT 21H
     MOV DL,13
     INT 21H
         
      
    MOV CX,10
    XOR BX,BX
      
      
   LOOP2:
   
   
   MOV AH,2
   MOV DL,NUMBER[BX]
   INT 21H   
      
   INC BX
    
   LOOP LOOP2  
      
         
             
  MOV AX,4C00H
INT 21H
        
MAIN ENDP
END MAIN
