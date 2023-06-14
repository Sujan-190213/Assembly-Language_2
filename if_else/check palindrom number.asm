.MODEL SMALL
 .STACK 100H
 
 
 .DATA
 
 
 NUM1 DB 0
 NUM2 DB 0
 
 REM1 DB 0
 REM2 DB 0
 REM3 DB 0
 RESULT DB 0  
 SUM DB 0
 TEMP DB 0  
 
 
  
   MSG1 DB "It is a palindrom number: $"
    MSG2 DB "It is not a plindrom number: $" 
  

 
 
.CODE 
MAIN PROC 
    
    
    MOV AX,@DATA
    MOV DS,AX
      
      
      MOV SUM,0 
       MOV BL,0
    MOV DL,10
    
SCANNUM1:  



     MOV AH,01H
        INT 21H
        
        CMP AL,13
        JE PART1
        
        MOV AH,0
        SUB AL,48
        
        MOV CL,AL
        MOV AL,BL
        MUL DL
        
        ADD AL,CL
        MOV BL,AL
        MOV NUM1,BL 
        MOV AL,NUM1
        MOV TEMP,AL
        
        JMP SCANNUM1 
  
  
  
  
PART1:
  
      MOV AL,TEMP
      MOV TEMP,AL
      
       MOV AH,0
    MOV BL,10
    DIV BL
    MOV REM1,AH  
    
    
    MOV TEMP,AL
    MOV AL,0
    
    MOV AL,SUM
    MUL BL  
    MOV SUM,AL
    MOV AL,SUM
    ADD AL,REM1 
    MOV SUM,AL
    
    
    
     
     
     CMP TEMP,0
     JE PART2
     JMP PART1
     
     
     
PART2:
          
          
        MOV AH,2    
        MOV DL,10
        INT 21H     
         MOV DL,13
        INT 21H
        
        
        MOV AL,NUM1
        
       CMP AL,SUM
       JE PALINDROM
       
         
         
       MOV DX,OFFSET MSG2
        MOV AH,09H
        INT 21H 
    
     JMP EXIT 
       
       
       
       
PALINDROM:
   
       MOV DX,OFFSET MSG1
        MOV AH,09H
        INT 21H 
    
    JMP EXIT  
     
  
  
EXIT:
  
   MOV AX,4C00H
   INT 21H
   MAIN ENDP
   END MAIN