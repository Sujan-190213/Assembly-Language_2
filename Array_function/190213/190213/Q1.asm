
.MODEL SMALL
.STACK 100H
.DATA
  FIRST DB 2
  SECOND DB 3
  THIRD DB 0  
  RES DB ?
  REM DB ?     
.CODE
MAIN PROC
    
     MOV AX,DATA
     MOV DS,AX       ;INCLUDE DATA SEGMENT TO CODE SEGMENT
     
     XOR CX,CX       ;CLEAR CX REGISTER
     
     MOV AH,1        ;INPUT HOW MANY NUMBER OF FIBONACCI NUMBER 
     INT 21H
                        
     SUB AL,48       ;ASCII TO DECIMAL (INPUT)
     
     MOV AH,0
   
     MOV DL,2        ;FIRST VALUE AS 2
     MOV FIRST,DL
     MOV BL,3 
     MOV SECOND,BL   ;SECOND VALUE AS 3
     
     SUB AL,2        ;SUBTRACT 2 BECAUSE TWO VALUE (2,3) ARE INITILIZED
     MOV CX,AX       ;LOOP COUNTING THRRE TIME (FOR THIS EXAMPLE)
     
     ;NEWLINE
     
     MOV DL,10
     MOV AH,2
     INT 21H   
     
     ;CARRIAGE RETURN 
         
     MOV DL,13
     MOV AH,2
     INT 21H
     
     ;PRINT FIRST DIGIT IN FIBONACCI NUMBER (HERE 2)
     
     MOV DL,FIRST 
     ADD DL,48     ;CONVET DECIMAL TO ASCII
     MOV AH,2
     INT 21H  
     
     ;NEWLINE
     
     MOV DL,10
     MOV AH,2
     INT 21H   
     
     ;CARRIAGE RETURN
         
     MOV DL,13
     MOV AH,2
     INT 21H   
     
     ;PRINT SECOND DIGIT IN FIBONACCI NUMBER (HERE 2)
     
     MOV DL,SECOND 
     ADD DL,48      ;CONVET DECIMAL TO ASCII
     MOV AH,2     
     INT 21H                    
                         
     CALL USER                    
                                    
    
EXIT:     
    MOV AX,4C00H   ;RETURN ACCESS TO DOS
    INT 21H
    
    MAIN ENDP  

USER PROC
      LABEL: 
  
         ;NEWLINE
         
         MOV DL,10
         MOV AH,2
         INT 21H   
         
         ;CARRIAGE RETURN
         
         MOV DL,13
         MOV AH,2
         INT 21H
         
         ;CALCULATION
         
         MOV BL,FIRST
         ADD BL,SECOND     ;ADD PREVIOUS AND NEXT VALUE (RULE FOR FIBONACCI NUMBER)
         MOV THIRD,BL      ;THIRD VALUE IS THE SUM OF THIS PREVIOUS AND NEXT VALUE
         
         MOV DL,SECOND     
         MOV FIRST,DL      ;SECOND VALUE IS NOW CONSIDER AS FIRST VALUE
         MOV SECOND,BL     ;THIRD VALUE IS NOW CONSIDER AS SECOND VALUE
         
         
         MOV AL,THIRD 
         MOV AH,0
         MOV BL,10      ;BL = 10 (FOR FINDING INDIVIDUAL ELEMENT IN THIRD VARIABLE
         
         DIV BL        ;AL = AL / BL 
         MOV REM,AH
         MOV RES,AL
         
         MOV AH,2
         MOV DL,RES
         ADD DL,48
         INT 21H
         
         MOV AH,2
         MOV DL,REM
         ADD DL,48
         INT 21H
         
         ; MOV AH,2
         ;MOV DL,THIRD 
         ;ADD DL,48          ;CONVERT DECIMAL TO ASCII
         ;INT 21H            ;PRINT THIRD VALUE
         
         
         DEC CL             ;DECREMENT THE VALUE OF CL REGISTER
         CMP CL,0           ;WHEN THE VALUE IN CL REGISTER IS 0,THE LOOP IS TERMINATED
         JE EXIT
         JMP LABEL          ;GOTO LABEL >> 'LABEL'
    
USER ENDP    

END MAIN





