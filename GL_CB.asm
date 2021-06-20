; Logo Design, Google Cardboard Design in 8-bit 80x80 Terminal. — GL_CB.asm
; Copyright (c) 2021 Janrey Licas
; This code is licensed under MIT license. (see LICENSE for details)

.MODEL TINY
.CODE
MOV AX, 03H     ; Pre-initialization.
INT 10H         ; Initiate Clear Screen
MOV AH, 02H     ; Move Screen in Initial Configuration.
MOV DL, 19H     ; Column.
MOV DH, 05H     ; Row.
INT 10H

; Whole Rendering Code.
JMP TOP_HEADER_BODY_CARDBOARD
JMP WHOLE_BODY_CARDBOARD 	; Once we done rendering the box, go to whole body render.
MOV AX, 4C00H 				; Syscall to Termination.
INT 21H

TOP_HEADER_BODY_CARDBOARD:
JMP __EDGE_CURVED_SIDES_HEADER_CARDBOARD
JMP __RENDER_BODY_HEADER_CARDBOARD

__EDGE_CURVED_SIDES_HEADER_CARDBOARD:
MOV AH, 09H
MOV BL, 66H
MOV CX, 1DH
INT 10H
MOV AH, 02H
DEC DL
DEC DL
DEC DL
INC DH
INT 10H
MOV AH, 09H
MOV CX, 23H
INT 10H

__RENDER_BODY_HEADER_CARDBOARD:
MOV AH, 02H
INC DH
INT 10H		; Increment by one to Render the Body.
MOV AH, 09H
MOV BL, 66H ; Use Brown Color.
MOV CX, 23H ; To be reduced later.
INT 10H 	; Don't do another Curved Sides, let the Whole (Second) Body Renderer do it.
CMP DH, 10H
JL __RENDER_BODY_HEADER_CARDBOARD

WHOLE_BODY_CARDBOARD:
JMP __EDGE_CURVED_TOP_SECOND_BODY_CARDBOARD
JMP __WHOLE_BODY_ITER_RENDER ; Whole Body
JMP __EDGE_CURVED_BOTTOM_SECOND_BODY_CARDBOARD
JMP WHOLE_EYE_LEFT_CARDBOARD
JMP WHOLE_EYE_RGHT_CARDBOARD
JMP TRIANGULAR_BOTTOM_ON_CARDBOARD

__EDGE_CURVED_TOP_SECOND_BODY_CARDBOARD:
MOV AH, 02H
MOV DH, 08H
MOV DL, 14H
INT 10H 	; Adjust Offset of Box Rendereing.
MOV AH, 09H
MOV BL, 77H ; Use Cyan instead.
MOV CX, 27H
INT 10H     ; Render First Curved.
MOV AH, 02H
DEC DL
DEC DL
DEC DL
INC DH
INT 10H
MOV AH, 09H
MOV CX, 2DH
INT 10H

__WHOLE_BODY_ITER_RENDER:
MOV AH, 02H
INC DH
INT 10H
MOV AH, 09H
MOV CX, 2DH
INT 10H
CMP DH, 11H
JL __WHOLE_BODY_ITER_RENDER

__EDGE_CURVED_BOTTOM_SECOND_BODY_CARDBOARD:
MOV AH, 02H
INC DH
INC DL
INC DL
INT 10H 	; Adjust Offset of Box Rendereing.
MOV AH, 09H
MOV BL, 77H ; Use Cyan Color.
MOV CX, 29H
INT 10H		; Render First Curved.


WHOLE_EYE_LEFT_CARDBOARD:  ; Have to do this manually.
MOV AH, 02H ; 1st Line
MOV DH, 0BH
MOV DL, 17H
INT 10H
MOV AH, 09H
MOV BL, 66H
MOV CX, 09H
INT 10H
MOV AH, 02H ; 2nd Line
INC DH
INT 10H
MOV AH, 09H
MOV CX, 09H
INT 10H

MOV AH, 02H ; 3nd Line
INC DH
INT 10H
MOV AH, 09H
MOV CX, 09H
INT 10H
MOV AH, 02H ; 4th Line
INC DH
INT 10H
MOV AH, 09H
MOV CX, 09H
INT 10H


WHOLE_EYE_RGHT_CARDBOARD:
MOV AH, 02H ; 1st Line
MOV DH, 0BH
MOV DL, 30H
INT 10H
MOV AH, 09H
MOV CX, 09H
INT 10H
MOV AH, 02H ; 2nd Line
INC DH
INT 10H
MOV AH, 09H
MOV CX, 09H
INT 10H
MOV AH, 02H ; 3nd Line
INC DH
INT 10H
MOV AH, 09H
MOV CX, 09H
INT 10H
MOV AH, 02H ; 4th Line
INC DH
INT 10H
MOV AH, 09H
MOV CX, 09H
INT 10H

TRIANGULAR_BOTTOM_ON_CARDBOARD:
MOV AH, 02H
MOV DL, 27H
MOV DH, 0EH ; Position in the quite BELOW center of the Whole Body Rectangle.
INT 10H
MOV CX, 03H ; Explicitly Declare this as Constant Temporarily.
JMP __TRIANGULAR_ITER_RENDER_BROWN_ON_BODY_CARDBOARD
RET 		; End of Whole Rendering, Go back to Parent Label.

__TRIANGULAR_ITER_RENDER_BROWN_ON_BODY_CARDBOARD:
MOV AH, 09H
MOV BL, 66H
INT 10H
INC CX
INC CX

MOV AH, 02H
DEC DL
INC DH		; Position in the quite BELOW center of the Whole Body Rectangle.
INT 10H
CMP DH, 011H
JL __TRIANGULAR_ITER_RENDER_BROWN_ON_BODY_CARDBOARD
JMP __TRIANGULAR_ITER_RENDER_BLACK_ON_BODY_CARDBOARD

__TRIANGULAR_ITER_RENDER_BLACK_ON_BODY_CARDBOARD: ; Then Render last two triangle with black.
MOV AH, 09H
MOV BL, 00H
INT 10H
INC CX
INC CX
MOV AH, 02H
DEC DL
INC DH		; Position in the quite BELOW center of the Whole Body Rectangle.
INT 10H
CMP DH, 013H
JL __TRIANGULAR_ITER_RENDER_BLACK_ON_BODY_CARDBOARD
END