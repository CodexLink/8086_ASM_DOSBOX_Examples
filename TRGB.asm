; T-Structure in Red and Green (Left) + Blue (Right) for Spacing — TGRB.asm
; Copyright (c) 2021 Janrey Licas
; This code is licensed under MIT license. (see LICENSE for details)

.MODEL TINY
.CODE
	MOV AX, 0B800H	; Get address for VGA color mode.
	MOV ES, AX		; Move that address in extra segment.
	MOV AH, 06H		; Set to Scroll Window Up.
	MOV	CX, 0000H
	MOV DX, 184FH	; Let Whole Screen Fill with Red First.
	MOV BH, 44H		; Set Screen to Red Color.
	INT 10H
	MOV CX, 0C00H
	MOV DX, 181AH	; Set to 12th Row and 26th Column.
	MOV BH, 20H		; Set first box to Green Color.
	INT 10H
	MOV CX, 0C35H	; Adjust Second Box Rendering to
	MOV DX, 184FH	; Set to 12th Row and 54th Column.
	MOV BH, 10H		; Set second box to Blue Color.
	INT 10H
	MOV AH, 4CH		; Perform Termination.
	INT 21h
END