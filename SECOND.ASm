          .MODEL SMALL
          .STACK 100H
          .DATA
				MESSAGE DB  0DH,0AH,"The Current System Time (Seconds): "
				NIBLE1 DB ?
				NIBLE2 DB ?,0DH,0AH,"$"
          .CODE
MAIN     PROC
			MOV  AX,@DATA		;Get Data memory Segment
			MOV  DS,AX			;Initialise Stack Segment
	
			MOV AH,2CH			;get System time function
			INT 21H				;Get System time, DH holds seconds
								;For Division operation Accumulator AX has to be used
			MOV BL,10			;repeattive division by 10 operand (Divisor)
			MOV AH,0			;Upper byte of dividend = 0
			MOV AL,DH			;Get seconds
			DIV BL				;Divide second by 10 i.e AL = Quotient, AH = remainder
			ADD AL,30H			;Convert Quotient to ASCII. Note ASCII for 0 is 48
			MOV NIBLE1,AL		;Store ASCII code for Seconds Upper nibble

			ADD AH,48			;Convert Remainder (seconds lower nibble) to ASCII
			MOV NIBLE2,AH		;save it at designated position
			
			MOV DX,OFFSET MESSAGE
			MOV  AH,9			;Display Character String function
			INT  21H			;Display the message   
          
			MOV  AX,4C00H		;Terminate program function i.e. AH = 4CH
			INT  21H			;terminate Program
MAIN     ENDP
END
