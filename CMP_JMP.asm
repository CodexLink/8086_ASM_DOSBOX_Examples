; Compare then Jump! — CMP_JMP.asm
; Copyright (c) 2021 Janrey Licas
; This code is licensed under MIT license. (see LICENSE for details)

.MODEL TINY
.DATA               ; Strings to output in the latter process.
INIT_QUESTION       DB 0DH, 0AH, "What is your Gender? [F/M] $"
FEMALE_STR          DB 0DH, 0AH, "You're Female.$"
MALE_STR            DB 0DH, 0AH, "You're Male.$",
INVALID_STR         DB 0DH, 0AH, "Idk what you are. Invalid Character Input, please try again.$"
RE_ASK              DB 0DH, 0AH, "Do you want to run this process again? [Y/N] $"
INVALID_REPROCESS   DB 0DH, 0AH, "Invalid Input, please answer carefully.$"
.CODE
__ASM__ENTRYPOINT:
    MOV AX, @DATA           ; Initiate Data Segment to AX Register.
    MOV DS, AX              ; Once initialized, move them in Literal Data Segment.

    MOV AH, 09H             ; Display INIT_QUESTION.
    LEA DX, INIT_QUESTION   ; Equivalent to "MOV DX, OFFSET INIT_QUESTION".
    INT 21H

    MOV AH, 01H             ; Handle Single Character Mode.
    INT 21H

    ; Cover all possible cases of input.
    CMP AL, "M"
    JE DISP_MALE
    CMP AL, "m"
    JE DISP_MALE
    CMP AL, "F"
    JE DISP_FEMALE
    CMP AL, "f"
    JE DISP_FEMALE
    JMP DISP_OTHERS         ; Display Invalid if no cases affected.

; For every "DISP_<CASE>", it will only display a certain string and jump to __PROMP_REDO process.
DISP_MALE:
    MOV AH, 09H
    LEA DX, MALE_STR
    INT 21H

    JMP __PROMPT_REDO       ; Jump to Prompt

DISP_FEMALE:
    MOV AH, 09H
    LEA DX, FEMALE_STR
    INT 21H

    JMP __PROMPT_REDO       ; Jump to Prompt

DISP_OTHERS:
    MOV AH, 09H
    LEA DX, INVALID_STR
    INT 21H

    JMP __PROMPT_REDO       ; Jump to Prompt

__PROMPT_REDO:
    MOV AH, 09H
    LEA DX, RE_ASK
    INT 21H

    MOV AH, 01H             ; Handle Single Character Mode.
    INT 21H

    CMP AL, "Y"
    JE __ASM__ENTRYPOINT
    CMP AL, "y"
    JE __ASM__ENTRYPOINT
    CMP AL, "N"
    JE __END_PROGRAM
    CMP AL, "n"
    JE __END_PROGRAM

    MOV AH, 09H
    LEA DX, INVALID_REPROCESS
    INT 21H

    JMP __PROMPT_REDO       ; If invalid, jump in this process again.

__END_PROGRAM:
    MOV AH, 4CH             ;  Perform termination by doing syscall.
    INT 21H
END