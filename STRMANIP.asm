; String Manipulation to Reversed Output — STRMANIP.asm
; Copyright (c) 2021 Janrey Licas
; This code is licensed under MIT license. (see LICENSE for details)

.MODEL TINY
.DATA
STRING_TO_BCKW DB 0DH, 0AH, "Stressed!$"    ; Re-evaluated String.
.CODE
    MOV AX, @DATA                           ; Required! Move .data to AX Register.
    MOV DS, AX                              ; Required! Init .data to DS.
    LEA DX, STRING_TO_BCKW                  ; Store Offset Address STRING_TO_BCKW to DX.
    MOV AH, 09H                             ; Output the (original) STRING_TO_BCKW.
    INT 21H                                 ; Execute.
    MOV AH, 02H                             ; Set the Display Mode Here.
    MOV DL, 0AH                             ; New Line, of course.
    INT 21H                                 ; Do it.
GET_STR_DELIMITER: ; Implicitly Jump Here on Purpose. Calculate Distance from Base to $ Char Address.
    MOV AL, [STRING_TO_BCKW + SI + 2]       ; Get Real Data on Base + SourceIndex + 2.
    INC SI                                  ; Increment.
    CMP AL, 24H                             ; Was the current char a $?
    JNE GET_STR_DELIMITER                   ; If not, then keep jumping till we meet "$".
OG_STR_TO_REV_ITER: ; Implicitly Jump Here on Purpose. Now go back by decrementing.
    MOV AL, [STRING_TO_BCKW + SI]           ; Re-initialize AL by starting back exactly at "$" address position.
    DEC SI                                  ; Decrement.
    MOV DL, AL                              ; Move that content to display so it would look reversed.
    INT 21H                                 ; Do it.
    CMP SI, 01H                             ; Do source gets back to base index + 1? (We ignore NL in this case)
    JNE OG_STR_TO_REV_ITER                  ; If not then jump back til it goes zero.
    MOV AX, 4C00H                           ; Perform Termination.
    INT 21H                                 ; Done.
END