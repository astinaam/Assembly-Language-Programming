;UVa 138 - Street Numbers

ORG 100h
.model small
.stack 100h

.data
     line11 DB '6','$'
     line12 DB '8','$'
     line21 DB '35','$'
     line22 DB '49','$'
     line31 DB '204','$'
     line32 DB '288','$'
     line41 DB '1189','$'
     line42 DB '1681','$'
     line51 DB '6930','$'
     line52 DB '9800','$'
     line61 DB '40391','$'
     line62 DB '57121','$'
     line71 DB '235416','$'
     line72 DB '332928','$'
     line81 DB '1372105','$'
     line82 DB '1940449','$'
     line91 DB '7997214','$'
     line92 DB '11309768','$'
     line01 DB '46611179','$'
     line02 DB '65918161','$'
     
.code
    main PROC
        MOV AX,@data
        MOV DS,AX
        
        MOV CX,9 
        CALL space   

        MOV AH,9
        LEA DX,line11
        INT 21h
        
        CALL space1
        
        MOV CX,9
        CALL space
        
        MOV AH,9
        LEA DX,line12
        INT 21h
        
        CALL newLine
        
        MOV CX,8
        
        CALL space   

        MOV AH,9
        LEA DX,line21
        INT 21h
        
        CALL space1
        
        MOV CX,8
        CALL space
        
        MOV AH,9
        LEA DX,line22
        INT 21h
        
        CALL newLine
        
        MOV CX,7
        CALL space   

        MOV AH,9
        LEA DX,line31
        INT 21h
        
        CALL space1
        MOV CX,7
        CALL space
        
        MOV AH,9
        LEA DX,line32
        INT 21h
        
        CALL newLine
        
        
        MOV CX,6
        CALL space   

        MOV AH,9
        LEA DX,line41
        INT 21h
        
        CALL space1
        MOV CX,6
        CALL space
        
        MOV AH,9
        LEA DX,line42
        INT 21h
        
        CALL newLine
        
        MOV CX,6
        CALL space   

        MOV AH,9
        LEA DX,line51
        INT 21h
        
        CALL space1
        MOV CX,6
        CALL space
        
        MOV AH,9
        LEA DX,line52
        INT 21h
        
        CALL newLine
        
        MOV CX,5
        CALL space   

        MOV AH,9
        LEA DX,line61
        INT 21h
        
        CALL space1
        MOV CX,5
        CALL space
        
        MOV AH,9
        LEA DX,line62
        INT 21h
        
        CALL newLine 
        
        MOV CX,4
        CALL space   

        MOV AH,9
        LEA DX,line71
        INT 21h
        
        CALL space1
        MOV CX,4 
        CALL space
        
        MOV AH,9
        LEA DX,line72
        INT 21h
        
        CALL newLine
        
        MOV CX,3
        CALL space   

        MOV AH,9
        LEA DX,line81
        INT 21h
        
        CALL space1
        MOV CX,3
        CALL space
        
        MOV AH,9
        LEA DX,line82
        INT 21h
        
        CALL newLine
        
        MOV CX,3
        CALL space   

        MOV AH,9
        LEA DX,line91
        INT 21h
        
        CALL space1
        MOV CX,2
        CALL space
        
        MOV AH,9
        LEA DX,line92
        INT 21h
        
        CALL newLine 
        
        MOV CX,2
        CALL space   

        MOV AH,9
        LEA DX,line01
        INT 21h
        
        CALL space1
        MOV CX,2 
        CALL space
        
        MOV AH,9
        LEA DX,line02
        INT 21h
        
        CALL newLine
        
    main ENDP
    
    space PROC
        lop:
        MOV AH,2
        MOV DL,' '
        INT 21h
        LOOP lop
        RET
    space ENDP
    
    space1 PROC
        MOV AH,2
        MOV DL,' '
        INT 21h
        RET
    space1 ENDP
    
    newLine PROC
        MOV AH,2
        MOV DL,10
        INT 21h
        MOV DL,13
        INT 21h
        RET
    newLine ENDP
END    
    
    
        
        