; Adding 2 single-digit numbers — ADD_NUM.asm
; Copyright (c) 2021 Janrey Licas
; This code is licensed under MIT license. (see LICENSE for details)

.MODEL TINY
.CODE
ORG 100H            ; Set the starting address point.

INPUT_ENTRYPOINT:
MAIN PROC
    MOV AH, 01H     ; Set mode to get input of a character.
    INT 21H         ; Save the character input stream to AL register.
    SUB AL, 30H     ; Subtract by 30 to represent actual hex single integer.
    MOV BL, AL      ; Move AL to BL Register to accomodate next input.

    MOV AH, 02H     ; Set mode to Display Character mode.
    MOV DL, 20H     ; Display a space for extra feature.
    INT 21H         ; Display the character in DL register.
    MOV DL, 2BH     ; Display a '+' sign.
    INT 21H         ; Same as goes.
    MOV DL, 20H
    INT 21H

    MOV AH, 01H     ; Once done, get another character input again.
    INT 21H
    SUB AL, 30H
    ADD BL, AL      ; Once we cleaned the 2nd input, add them up.

    MOV AH, 02H     ; The following just display space.
    MOV DL, 20H
    INT 21H
    MOV DL, 3DH     ; And also the '=' sign.
    INT 21H
    MOV DL, 20H
    INT 21H

    MOV DL, BL      ; Move the output in DL register because I forgot.
    ADD DL, 30H     ; And also add 30H to display numbers (@ ASCII 30 to 39 for number representation)
    INT 21H

    INT 20H         ; End the program.

MAIN ENDP
END INPUT_ENTRYPOINT
END