.MODEL SMALL
.STACK 100H
.DATA 
ARR DB ?
A DB 'LOWER FORM : $'
B DB 'UPPER FORM : $'
.CODE
MAIN PROC
      MOV AX,@DATA
      MOV DS,AX
      
           
      MOV AH,9 
      LEA DX,A
      INT 21H
      
      MOV SI,OFFSET ARR
      
      MOV CX,5
              
      ;INPUT
      
      INPUT:
              
      MOV AH,1
      INT 21H
      MOV [SI],AL
      INC SI
      LOOP INPUT
    
      ;AGAIN STARTING FROM SOURCE INDEX
    
      MOV SI,OFFSET ARR
      MOV CX,5 
      
      
      MOV DL,10
      MOV AH,2
      INT 21H
    
      MOV DL,13
      MOV AH,2
      INT 21H  
      
      MOV AH,9 
      LEA DX,B
      INT 21H
      
      ;OUTPUT
      
      OUTPUT:
    
      MOV AH,2
      MOV DL,[SI]
      SUB DL,32
      INT 21H
      INC SI
      LOOP OUTPUT
      
  MOV AX,4C00H
  INT 21H                   
    
MAIN ENDP
END MAIN