; Subtract 2 single-digit numbers with string (Non-Equation) — SUB_NUM.asm
; Copyright (c) 2021 Janrey Licas
; This code is licensed under MIT license. (see LICENSE for details)

.MODEL TINY
.DATA
FST_INPUT_INST DB  "Please input a number: $"
SEC_INPUT_INST DB  "Please input another number: $"
OTPT_RESULT_STR DB "The difference of the two number is $"
.CODE
ORG 100H
__ASM__ENTRYPOINT:
MAIN PROC
    MOV AH, 09H
    MOV DX, OFFSET FST_INPUT_INST ; Output First Instruction
    INT 21H

    MOV AH, 01H ; Get Input of First Number
    INT 21H
    MOV BL, AL
    SUB BL, 30H ; OK

    MOV AH, 02H ; ! REDUNDANT! Might Fix Later.
    MOV DL, 0AH
    INT 21H

    MOV AH, 09H
    MOV DX, OFFSET SEC_INPUT_INST ; Output Second Instruction
    INT 21H

    MOV AH, 01H ; Get Input of Second Number
    INT 21H
    MOV CL, AL
    SUB CL, 30H

    MOV AH, 02H
    MOV DL, 0AH ; Display a space.
    INT 21H


    MOV AH, 09H
    MOV DX, OFFSET OTPT_RESULT_STR ; Output Result String
    INT 21H

    MOV AH, 02H ; Output Difference
    SUB BL, CL  ; Can be vice-versa.
    ADD BL, 30H
    MOV DL, BL

    INT 21H
    INT 20H
    MAIN ENDP
END __ASM__ENTRYPOINT