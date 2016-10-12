;12289 - One-Two-Three

ORG 100h

.data
     str DB 10 dup('$')    
.code    
    main PROC
     MOV AX,@data
     MOV DS,AX
     ;single digit input-testcase    
     MOV AH,1
     INT 21h
     MOV CL,AL
     SUB CL,48
     INT 21h  ;for 'Enter'
     CALL endl
     case:
     CMP CL,0
     JE stop
     
     
     ;input string
     CALL read_str
     CALL endl
     SUB CL,1
     lp:
     MOV SI,2 ;to access first index of string
     traverse:
     MOV BL,str[SI]
     CMP BL,'o'
     JE one
     CMP BL,'t'
     JE tw1
     INC SI
     MOV BL,str[SI]
     CMP BL,'n'
     JE p1
     CMP BL,'w'
     JE p2
     CMP BL,'h'
     JE p3
     
     tw1:
     INC SI
     MOV BL,str[SI]
     CMP BL,'h'
     JE tw2
     CMP BL,'w'
     JE tw3
     INC SI
     MOV BL,str[SI]
     CMP BL,'o'
     JE p2
     CMP BL,'r'
     JE p3
     
     tw3:
     INC SI
     MOV BL,str[SI]
     CMP BL,'r'
     JE an
     JMP p2
     
     an:
     INC SI
     MOV BL,str[SI]
     CMP BL,'e'
     JE p3
     JMP p2
     
     tw2:
     INC SI
     MOV BL,str[SI]
     CMP BL,'o'
     JE pp2
     JMP p3
     
     pp2:
     INC SI
     MOV BL,str[SI]
     CMP BL,'e'
     JE p3
     JMP p2 
           
           
     one:
     INC SI
     MOV BL,str[SI]
     CMP BL,'n'
     JE p1
     CMP BL,'w'
     JE two
     CMP BL,'h'
     JE p3
     
     two:
     INC SI
     MOV BL,str[SI]
     CMP BL,'o'
     JE p2
     CMP BL,'r'
     JE p3
     JMP p1
     
     p3:
     MOV DL,'3'
     MOV AH,2
     INT 21h
     CALL endl
     JMP case
     
     p2:
     MOV DL,'2'
     MOV AH,2
     INT 21h
     CALL endl
     JMP case
     
     p1:
     MOV DL,'1'
     MOV AH,2
     INT 21h
     CALL endl
     JMP case
     
     
     
     stop:    
     MOV AH,4ch
     INT 21h     
         
    ENDP main
    
    read_str PROC
    MOV AH,0ah
    LEA DX,str
    INT 21h
    RET
    read_str ENDP
    
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
   endl ENDP
   
   print_str PROC
    CALL endl
    LEA DX,str+2
    MOV AH,9
    INT 21h
    RET
   print_str ENDP

    
   
    
   