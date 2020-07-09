          .MODEL SMALL
          .STACK 100H
          .DATA
               MESSAGE DB  0DH,0AH,"Hello world!",0DH,0AH,"$"
               X       DW  3
               Y       DW  5
               Z       DW  ?
               VAR1    DB  33h
               VAR2    DW 0101h               
          .CODE
MAIN     PROC
          MOV  AX,@DATA
          MOV  DS,AX
          MOV  X,41H   
          MOV  CX,55H  
          MOV  Y,CX    
          MOV  Z,77H   
          MOV  DX,OFFSET MESSAGE
          MOV  AH,9
          INT  21H
PLACE:    MOV  DI,9    
          CALL SUB2     ; call a procedure
          ; PART B
          mov AL, VAR1
          mov BX, offset VAR2
          mov [BX],AL
          mov [BX+1], AL
          
          MOV  AX,4C00H
          INT  21H
MAIN     ENDP
;
; A subroutine follows. 
SUB2      PROC
          MOV  DI,77H 
          RET
SUB2      ENDP  
END  MAIN
