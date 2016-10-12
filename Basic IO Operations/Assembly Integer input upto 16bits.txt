 cin PROC
    Start:
    MOV BX,0
    MOV CX,0              

    MOV AH,1	         
    INT 21h                
    
    CMP AL,'-'
    JE minus
    
    CMP AL,'+'
    JE plus
    
    CMP AL,0dh	        
    JE endInput
    
    JMP input
    
    minus:
    MOV CX,1	       
    
    plus:
    MOV AH,1
    INT 21h
    
    Input:
    CMP AL,'0'
    JNGE not_digit
    CMP AL,'9'
    JNLE not_digit
    SUB AL,48
    MOV AH,0
    PUSH AX                
    MOV AX,10              
    MUL BX               
    MOV BX,AX
    POP AX              
    ADD BX,AX             
    MOV AH,1	             
    INT 21h
    CMP AL,' '
    JE endInput                 
    CMP AL,0dh	         
    JNE Input
    OR CX,CX                         ;check negative
    JE endInput
    NEG BX
    ;MOV tmp,BX
    endInput:
    RET
    
    not_digit:
    MOV AH,2
    MOV DL,10
    INT 21h
    MOV DL,13
    INT 21h
    JMP Start
   ENDP cin