; Attribute Render with Scrolling — ATTRSCRL.asm
; Copyright (c) 2021 Janrey Licas
; This code is licensed under MIT license. (see LICENSE for details)

.MODEL TINY
.CODE
MOV AX, 0B800H 	; It is an address for the VGA card text mode.
MOV ES, AX 		; Let Extra Segment Register holds the address of the VGA card for text mode.
MOV AH, 06H 	; Set To Scroll Up The Window Mode.

; Keep note that, Column and Row were representing the (x,y).
MOV CL, 00H 	; Column Starting Point.
MOV CH, 00H 	; Row    Starting Point.

MOV DL, 17H 	; Column End Point.
MOV DH, 19H 	; Row    End Point.

MOV BH, 20H 	; Screen color attribute used to fill the screen. (Which in this case, green.)
INT 10H

;This same as goes to the explained part of this code.
MOV AH, 06H
MOV CL, 18H
MOV CH, 00H
MOV DL, 36H
MOV DH, 18H
MOV BH, 40H 	; Set to color red.
INT 10H

MOV AH, 06H
MOV CL, 36H
MOV CH, 00H
MOV DL, 4FH
MOV DH, 18H
MOV BH, 10H		; Set to color blue.
INT 10H

MOV AH, 4CH 	; Perform termination.
INT 21H		 	; Execute.
END