.MODEL SMALL
.STACK 100H
.DATA
  ARRAY DB 7,3,4,1,5
.CODE
MAIN PROC
        MOV AX,@DATA 
        MOV DS,AX
        
        ;SOURCE INDEX
        
        MOV SI,OFFSET ARRAY
        MOV CX,5
        MOV BL,[SI] 
        
        LOOP1:
           
           CMP [SI],BL
           JLE UPDATE1
           RESUME1:
           INC SI 
           LOOP LOOP1
           
           ADD BL,48
            MOV DL,BL
            MOV AH,2
            INT 21H
            
           UPDATE1:
             MOV BL,[SI] 
             JMP RESUME1
                                   
            
           
    
    MOV AX,4C00H
    INT 21H
    MAIN ENDP
END MAIN