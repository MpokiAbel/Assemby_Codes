			.MODEL SMALL
			.STACK 100H 
			.DATA
				YEAR3 DW ?,"-"
				
				MONTH1 DB ?
				MONTH2 DB ?,"-"
				
				DAY1 DB ?
				DAY2 DB ? ,0DH,0AH,"$"
				
				
				
			.CODE
MAIN 	   PROC
			MOV AX,@DATA
			MOV DS,AX
			
			MOV AH,2AH
			INT 21H
			
			MOV BL,10
			MOV AH,0
			MOV AL,DL
			DIV BL
			ADD AL,30H
			MOV DAY1,AL
			
			ADD AH,48
			MOV DAY2,AH
			
			MOV AH,0
			MOV AL,DH
			DIV BL
			ADD AL,30H
			MOV MONTH1,AL
			
			ADD AH,48
			MOV MONTH2,AH
			
			MOV AX,CX
			MOV BH,10
			DIV BX
			ADD AL,30H
			ADD AH,48
			MOV YEAR3,AX
					
			
			MOV DX,OFFSET YEAR3
			MOV AH,9
			INT 21H
			
			MOV AX,4C00H
			INT 21H
			
MAIN		ENDP
END
			
			
			
			