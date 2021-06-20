; String Positioning in Column-Centric of 80x80 terminal — STR_POS.asm
; Copyright (c) 2021 Janrey Licas
; This code is licensed under MIT license. (see LICENSE for details)

.MODEL TINY
.DATA   ; String to be displayed. Basically, my information.
FN_STR DB "Janrey T. Licas$"
SN_STR DB "1810386$"
PR_STR DB "CpE Program$"
.CODE
__ASM__ENTRYPOINT:  ; Just putting this label and execute implicitly for indicator reasons.
    MOV AX, @DATA   ; Initialize Data Segment to AX Register.
    MOV DS, AX      ; Once initialized, move AX contents to Data Segment. (DS)
    MOV AX, 03H     ; Clear Screen
    INT 10H
    MOV AH, 02H     ; Adjust Column for FN_STR.
    MOV DL, 20H     ; Set cursor at 32th column.
    INT 10H
    MOV AH, 09H     ; Then set AH Register to display a string.
    LEA DX, FN_STR
    INT 21H
    MOV AH, 02H     ; Adjust Column for SN_STR.
    MOV DL, 24H     ; Set cursor at 36th column.
    MOV DH, 02H     ; Set cursor at 2nd row.
    INT 10H
    MOV AH, 09H     ; Then set to display string mode.
    LEA DX, SN_STR
    INT 21H
    MOV AH, 02H     ; Adjust Column for PR_STR.
    MOV DL, 22H     ; Set cursor at 34th column.
    MOV DH, 03H     ; Set cursor at 3rd row.
    INT 10H
    MOV AH, 09H
    LEA DX, PR_STR
    INT 21H
    MOV AH, 4CH     ; Syscall to Termination.
    INT 21H
END