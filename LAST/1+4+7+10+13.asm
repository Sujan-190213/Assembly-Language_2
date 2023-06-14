
.MODEL SMALL
.STACK 100H
.DATA
    M DB 0 
    N DB 0
       
.CODE
MAIN PROC
    
     MOV AX,DATA
     MOV DS,AX
     
     XOR CX,CX
     
     MOV AH,1
     INT 21H
                        ; SUPPOSE 5 NUMBERS
     SUB AL,48  
     MOV N,AL           ;ITERATION NUMBER
     MOV AH,0
     
     MOV CX,AX
     
     MOV DL,10
     MOV AH,2 
     INT 21H
     
     MOV DL,13
     MOV AH,2
     INT 21H
                               
 
 MOV CL,1 
            
  LOOP1: 
        
        
        MOV AH,2
        MOV M,CL
        MOV DL,M
        ADD DL,48
        INT 21H
        
        MOV AH,2
        MOV DL,'-'
        INT 21H  
        
        ADD CL,1    
        
        CMP CL,N
        JMP LOOP2
            
        JMP LOOP1    

           
LOOP2: 

     MOV DL,10
     MOV AH,2 
     INT 21H
     
     MOV DL,13
     MOV AH,2
     INT 21H
           
     
    
        
    MOV AX,4C00H
    INT 21H
    
    MAIN ENDP

END MAIN





