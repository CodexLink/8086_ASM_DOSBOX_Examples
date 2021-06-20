; Light Blue-Yellow-Magenta-Cyan Column Rendering + Identifier String — LYMC.asm
; Copyright (c) 2021 Janrey Licas
; This code is licensed under MIT license. (see LICENSE for details)

.MODEL TINY
.STK
.DATA
	LB_STR_DISP DB "Light Blue$"
	YW_STR_DISP DB "Yellow$"
	MT_STR_DISP DB "Magenta$"
	CY_STR_DISP DB "Cyan$"
.CODE
    MOV AX, @DATA   ; Initiate the data segment.
    MOV DS, AX		; Move the referrable address to data segment.
	MOV AX, 1003H	; Enable Sensitivity and Turn off Blinking...
	MOV BL, 00H		; By off.
	INT 10H
	MOV AX, 0B800H	; Get address for VGA color mode.
	MOV ES, AX		; Move that address in extra segment.
	MOV AH, 06H		; Render the Light blue column.
	MOV CX, 0000H	; Set Column and Row in 0th Position as Startpoint.
	MOV DX, 1813H	; Set 24th Row and 19th Column as Endpoint.
	MOV BH, 1FH		; Set to Light blue background.
	INT 10H
	MOV CX, 0014H	; Set 0th Row and 20th Column Posiion as Startpoint.
	MOV DX, 1827H	; Set 24th Row and 39th Column as endpoint.
	MOV BH, 00E0H	; Set to Light yellow background.
	INT 10H
	MOV CX, 0028H	; Set 0th Row and 40th Column as Startpoint.
	MOV DX, 183BH	; Set 24th Row and 59th Column as Endpoint.
	MOV BH, 0D0H	; Set to Magenta-like background.
	INT 10H
	MOV CX, 003CH	; Set 0th Row and 60th Column as Startpoint.
	MOV DX, 184FH	; Set 24th Row and 79th Column as Endpoint.
	MOV BH, 0B0H	; Set to cyan background.
	INT 10H
	MOV AH, 02H		; Set to Cursor Positioning with Attribute Mode
	MOV DH, 0CH		; Set to 12th Row.
	MOV DL, 05H		; Write on the space of 1st Column, Light blue.
	MOV BH, 00H		; At Page Number 0.
	INT 10H
	MOV AH, 09H
	LEA DX, LB_STR_DISP ; Display the Light Blue String.
	INT 21H
	MOV AH, 02H
	MOV DH, 0CH		; Set 12th row again.
	MOV DL, 1BH		; Set to 25th Column for Light Yellow.
	INT 10H
	MOV AH, 09H
	LEA DX, YW_STR_DISP
	INT 21H

	; For Color Magenta.
	MOV AH, 02H
	MOV DH, 0CH		; Set 12th row again.
	MOV DL, 2FH		; Set to 47th Column for Magenta.
	INT 10H
	MOV AH, 09H
	LEA DX, MT_STR_DISP
	INT 21H

	; For Color Cyan.
	MOV AH, 02H
	MOV DH, 0CH		; Set 12th row again.
	MOV DL, 44H		; Set to 60th for Cyan.
	INT 10H
	MOV AH, 09H
	LEA DX, CY_STR_DISP
	INT 21H
	MOV AH, 4CH		; Call Termination to the Register.
	INT 21H			; Execute.
END