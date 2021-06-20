; 3 Stacked Rectangle Rendering — STCK_REC.asm
; Copyright (c) 2021 Janrey Licas
; This code is licensed under MIT license. (see LICENSE for details)

.MODEL TINY
.CODE

MOV AX, 03H     ; Pre-entrypoint. Clear the screen.
INT 10H
MOV DH, 0DH     ; Set the column once for the Green Rectangle Rendering.

; The following approach displays the rectangles reversed and based from their stack state.

GREEN_RECT:     ; ! Render the green rectangle first then let other rectangles override some parts.
MOV AH, 02H
MOV DL, 19H
INT 10H         ; Set the cursor position.
MOV AH, 09H     ; Set to iterate-able screen fill mode.
MOV BL, 22H     ; Set the color to green.
MOV CX, 18H     ; Do it 32 - 8 times.
INT 10H
INC DH
CMP DH, 14H
JL GREEN_RECT   ; Jump ONLY when DH is less than 14H until we could fill the width of the Green Rectangle.
MOV DH, 06H     ; Once done on GREEN_RECT, implicitly JUMP on ORANGE_RECT and move to an appropriate column.

ORANGE_RECT:    ; ! Render the orange rectangle on top of GREEN_RECT.
MOV AH, 02H
MOV DL, 1EH
INT 10H         ; Set the cursor position.
MOV AH, 09H     ; Set to iterate-able screen fill mode.
MOV BL, 66H     ; Set the screen color attribute to orange color.
MOV CX, 18H     ; Do it 32 - 8 times.
INT 10H
INC DH
CMP DH, 0EH
JL ORANGE_RECT  ; Jump until we could fill the width of the Orange Rectangle.
MOV DH, 03H     ; Once done on ORANGE_RECT, implicitly JUMP on PURPLE_RECT and move to an appropriate column.

PURPLE_RECT:    ; ! render purple rectangle on top of orange rect.
MOV AH, 02H
MOV DL, 0BH
INT 10H         ; Set the cursor position.
MOV AH, 09H     ; Set to iterate-able screen fill mode.
MOV BL, 55H     ; Set the screen attribute color to Purple.
MOV CX, 18H     ; Do it 32 - 8 times.
INT 10H
INC DH
CMP DH, 0BH
JL PURPLE_RECT ; Jump until we could fill the width of the purple rectangle.

MOV AX, 4C00H ; Syscall to screen termination.
INT 21H
END