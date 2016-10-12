                                                  ;UVa 488 - Triangle wave
ORG 100h

.data
    tc DW ?
    a  DW ?
    f  DW ?
   val DW ?
.code
    main PROC
      MOV AX,@data
      MOV DS,AX
      
      CALL cin
      MOV tc,BX
      MOV CX,BX
      CALL endl
      CALL endl
      
      testcase:
      CALL cin
      MOV a,BX
      CALL endl
      CALL cin
      CALL endl
      CALL endl
      MOV f,BX
      MOV BP,0
      frequency:
      
      MOV BX,1
      prnt:
      MOV val,BX  
      
      MOV AX,0
      frq:
      PUSH AX
      PUSH BX
      CALL cout
      POP BX
      POP AX
      INC AX
      CMP AX,BX
      JNE frq    
      
      CALL endl   
      
      INC BX
      CMP BX,a
      JNG prnt
      
      SUB BX,2   
      again:
      MOV val,BX  
      
      MOV AX,0
      ferq:
      PUSH AX
      PUSH BX
      CALL cout
      POP BX
      POP AX
      INC AX
      CMP AX,BX
      JNE ferq    
      
      CALL endl   
      
      DEC BX
      CMP BX,0
      JNE again
      
      
      CALL endl
      INC BP
      CMP BP,f
      JNE frequency
      DEC tc
      CMP tc,0
      jne testcase
      stop:
      MOV AH,4ch
      INT 21h
    ENDP main
    
    
    cout PROC
    OutPut:
    MOV CX,0	         
    MOV AX,val        
    MOV BX,10	        
    
    print:
    OR AX,AX                        ;check negative
    JGE not_neg
    PUSH AX
    MOV AH,2
    MOV DL,'-'
    INT 21h
    POP AX
    NEG AX
    
    not_neg:	         
    MOV DX,0                 
    DIV BX                
    PUSH DX                  
    INC CX	             
    CMP AX,0	          
    JNE not_neg	   

    Printing:	         
    MOV AH,2	              
    POP DX                
    ADD DL,48	          
    INT 21h	              
    LOOP Printing
    RET             
   ENDP cout
    
    endl PROC
      PUSH AX
      PUSH DX
      MOV AH,2
      MOV DL,10
      INT 21h
      MOV DL,13
      INT 21h
      POP AX
      POP DX
      RET
    ENDP endl
    
   cin PROC
    PUSH AX
    PUSH CX
    PUSH DX
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
    CMP AL,0dh	         
    JNE Input
    OR CX,CX                         ;check negative
    JE endInput
    NEG BX
    ;MOV tmp,BX
    endInput:
    POP AX
    POP CX
    POP DX
    RET
    
    not_digit:
    MOV AH,2
    MOV DL,10
    INT 21h
    MOV DL,13
    INT 21h
    JMP Start
   ENDP cin





