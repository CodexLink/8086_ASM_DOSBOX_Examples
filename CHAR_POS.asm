; Character Positioning via Manipulation — CHAR_POS.asm
; Copyright (c) 2021 Janrey Licas
; This code is licensed under MIT license. (see LICENSE for details)

.MODEL TINY
.DATA
STRING DB "Stressed!", 0DH, 0AH, "$" ; Concatenate New Line and Carriage Return.
.CODE
MAIN PROC
    MOV AX, @DATA           ; Move .data to AX Register.
    MOV DS, AX              ; Init .data to DS.
    MOV DX, OFFSET STRING   ; Store Offset Address STRING to DX.
    MOV AH, 09H             ; Output the STRING.
    INT 21H                 ; DO IT.
    MOV BX, OFFSET STRING   ; Get BX to Refer to Offset Address of STRING.

    ; Each Letters are actually stored under char * pattern.
    ; Meaning each letters have their own addreses.

    MOV AL, [BX]            ; Starting Offset Address of BX to be stored in AL.
    MOV AH, [BX + 1]        ; By Incrementation of 1, Store 2nd Character to AH.
    MOV [BX], AH            ; Let the 2nd character be the 1st character,
    MOV [BX+1], AL          ; VICE-VERSA

    MOV AH, 9H              ; Display String
    MOV DX, OFFSET STRING   ; Move Whole Offset Address of String to DX to DIsplay.
    INT 21H                 ; Do it
    MOV AH, 4CH             ; Perform Termination
    INT 21H                 ; Done.
MAIN ENDP
END