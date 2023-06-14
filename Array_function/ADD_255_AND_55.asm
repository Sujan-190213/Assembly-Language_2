.MODEL SMALL
.STACK 100H
.DATA 
A DW 255 
B DW 55
FIRST DW ?
SECOND DW ?
THIRD DW ?
.CODE
MAIN PROC
      MOV AX,@DATA
      MOV DS,AX
      
           
      MOV AX,A
      ADD AX,B
      
      MOV BX,10
      DIV BX
      MOV THIRD,DX
      
      
      DIV BX
      MOV SECOND,DX
      MOV FIRST,AX 
                     
      
      MOV BX,FIRST
      MOV DL,BL
      ADD DL,48
      MOV AH,2
      INT 21H 
      
      
      MOV BX,SECOND
      MOV DL,BL
      ADD DL,48
      MOV AH,2
      INT 21H 
      
      MOV BX,THIRD
      MOV DL,BL
      ADD DL,48
      MOV AH,2
      INT 21H
      
      
  MOV AX,4C00H
  INT 21H                   
    
MAIN ENDP
END MAIN