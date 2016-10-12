;UVa 11520 - Fill the Square

ORG 100h

.data
    case DB "Case ",'$'
    tc   DB 0
    n    DB 0
    x    DB 0
    arr  DB 110 dup('$')
    tmp  DB 0
.code
    main PROC
       MOV AX,@data
       MOV DS,AX
       
       MOV AH,1
       INT 21h
       SUB AL,48 
       MOV tc,AL
       
       INT 21h             ;for 'Enter'
       CALL endl
       
       MOV CL,0
       
       
       testcase:
       MOV AH,1
       INT 21h
       MOV x,AL
       SUB AL,48
       MOV n,AL             ;input n
       
       MOV CH,AL
       
       MOV BL,CH
       MOV SI,2
       INT 21h              ;for 'Enter'
       CALL endl
       loop1:
       loop2:
       SUB CH,1
       MOV AH,1
       INT 21h
       MOV arr[SI],AL
       INC SI
       CMP CH,0
       JNE loop2
       INT 21h               ;for 'Enter'
       CALL endl
       MOV CH,n
       SUB BL,1
       CMP BL,0
       JNE loop1      
       
       processing:
       CALL casep            ;case print
       MOV AH,2
       MOV tmp,CL
       ADD tmp,1
       MOV DL,tmp
       ADD DL,48
       INT 21h
       MOV DL,':'
       INT 21h
       CALL endl
       MOV BH,n
       MOV BL,n
       MOV SI,2
       loop3:
       loop4:
       SUB BH,1
      
       MOV CH,'A'
       CMP arr[SI],'.'
       JE letter
       
       MOV AH,2
       MOV DL,arr[SI]
       INT 21h
       JMP next
       
       
       letter:
       MOV AL,x
       CBW
       MOV BP,AX
       SUB BP,48
      
       CMP arr[SI-1],CH
       JE increment
       
       CMP arr[SI+1],CH
       JE increment
       
       CMP arr[SI+BP],CH
       JE increment 
      
       CMP arr[SI-BP],CH
       JE increment
       
       MOV AH,2
       MOV arr[SI],CH
       MOV DL,arr[SI]
       INT 21h
       JMP next
       
       increment:
       INC CH
       JMP letter
       
       next:
       INC SI
       CMP BH,0
       JNE loop4
       CALL endl
       SUB BL,1
       MOV BH,n
       CMP BL,0
       JNE loop3 
       
       INC CL
       CMP CL,tc
       JNE testcase
       
       stop:
       MOV AH,4ch
       INT 21h
        
    ENDP main
    
    endl PROC
        PUSH AX
        PUSH DX
        MOV AH,2
        MOV DL,10
        INT 21h
        MOV DL,13
        INT 21h
        POP DX
        POP AX
        RET
    ENDP endl
    
    casep PROC
        PUSH AX
        PUSH DX
        MOV AH,9
        LEA DX,case
        INT 21h
        POP AX
        POP DX
        RET
    ENDP case
