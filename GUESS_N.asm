; Guess the Number! — GUESS_N.asm
; Copyright (c) 2021 Janrey Licas
; This code is licensed under MIT license. (see LICENSE for details)

.MODEL TINY
.DATA                ; String data to be displayed in the latter process.
GUESS_PROMPT        DB 0DH, 0AH, "Guess the number! [0-9] $"
GUESS_WRONG_HIGHER  DB 0DH, 0AH, "Wrong! maker it higher!$"
GUESS_WRONG_LOWER   DB 0DH, 0AH, "Wrong! make it lower!$"
GUESS_RIGHT         DB 0DH, 0AH, "Congratulations, you guessed the mystery number!$"
.CODE
    MOV AX, @DATA   ; Initialization of Data Segment.
    MOV DS, AX      ; Then move it in the Literal Data Segment.
__ASM__ENTRYPOINT:
    MOV AH, 09H
    LEA DX, GUESS_PROMPT
    INT 21H         ; Display the prompt first.

    MOV AH, 01H     ; And then, set character input mode.
    INT 21H

    MOV AH, 09H     ; Return back to string state to output Guess Labels.
    CMP AL, 35H     ; Parameter; Get Literal 5 since Input is ASCII.
    JL __GUESSED_LT ; Less Than
    JG __GUESSED_GT ; Greater Than
    JE __GUESS_EQ   ; Equal
    ; At this point, we did a shortcut by making one comparison statement and let it jump based from the CMP return.

; For every "__GUESS_<CONDITION>", it jumps to that instruction to display a string and JMP based from the ff condition/s:
; 1. If Equal (EQ), then display "you guessed it right!" and terminate the program.
; 2. If Less than (LT) or Greater than (GT), then display either "make it lower" or "make it higher"
; And jump to __DRY_DISP_THEN_JUMP process to do the anti-redundant execution and jump to __ASM__ENTRYPOINT.

__GUESS_EQ:
    LEA DX, GUESS_RIGHT
    INT 21H
    JMP __ASM__TERM

__GUESSED_LT:
    LEA DX, GUESS_WRONG_HIGHER
    JMP __DRY_DISP_THEN_JUMP

__GUESSED_GT:
    LEA DX, GUESS_WRONG_LOWER
    JMP __DRY_DISP_THEN_JUMP

; In one process to practice DRY principles at least.
__DRY_DISP_THEN_JUMP:
    INT 21H
    JMP __ASM__ENTRYPOINT

__ASM__TERM:
    MOV AX, 4C00H ; Since Service is already set to 09H. Call to Terminate.
    INT 21H
END