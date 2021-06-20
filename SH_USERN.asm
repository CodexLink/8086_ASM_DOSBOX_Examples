; SHow Username after Input with String + Delimiter Modification — SH_USERN.asm
; Copyright (c) 2021 Janrey Licas
; This code is licensed under MIT license. (see LICENSE for details)

.MODEL SMALL
.DATA
USERNAME_BUF DB 31, ?, 31 DUP (?)
QUESTION_NAME DB 0AH, "Hello, What's your name? $"
CONCAT_TO_NAME DB 0AH, 0AH, "Hello, $"
CONFIRM_WORKING DB 0DH, 0AH, "Congratulations! Your first program is working!$"
.CODE
MAIN PROC
    MOV AX, @DATA                       ; Move .data to AX Register.
    MOV DS, AX
    MOV AH, 09H
    LEA DX, QUESTION_NAME               ; Display the Question by Address Reference.
    INT 21H
    MOV AH, 0AH
    MOV DX, OFFSET USERNAME_BUF         ; Get Array Offset Address to Fill by User Input.
    INT 21H
    LEA DX, CONCAT_TO_NAME              ; Display the String to Concatenate to Username to Output
    MOV AH, 09H
    INT 21H

    ; Input only has CR on the end case. We have to sterilize by adding $ on the last part of the string.
    MOV BL, [ USERNAME_BUF + 1 ]        ; Store Current Address Offset State + 1 = Length.
    MOV [ USERNAME_BUF + BX + 2 ], "$"  ; Store "$" on USERNAME_BUF (Base) at BX (Current Length) + 2 (After CR).

    LEA DX, [USERNAME_BUF + 2]          ; Display String Elegantly.
    MOV AH, 09H
    INT 21H

    MOV AH, 09H
    LEA DX, CONFIRM_WORKING
    INT 21H
    MOV AX, 4C00H                       ; Perform Termination
    INT 21H                             ; Done.

MAIN ENDP
END