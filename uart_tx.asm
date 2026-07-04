
ORG 0000H
MAIN:
MOV TMOD, #20H ;      Timer-1 Mode-2 (8-bit auto-reload)
MOV TH1, #0FDH ;       9600 bps @ 11.0592 MHz
MOV SCON, #50H ;      UART Mode-1, REN enabled
SETB TR1 ;           Start Timer-1
TX_LOOP:
MOV SBUF, #'A' ; Transmit ASCII 'A'
WAIT_TX:
JNB TI, WAIT_TX ; Wait for transmission
CLR TI
SJMP TX_LOOP ; Repeat transmission
END
FOR RECEIVER(CODE)
ORG 0000H
MAIN:
; -------- UART INITIALIZATION --------
MOV TMOD, #20H ;         Timer-1 Mode-2
MOV TH1, #0FDH ;        9600 bps
MOV SCON, #50H ;        Serial Mode-1
SETB TR1 ;           Start Timer-1
; -------- LCD PORT INITIALIZATION --------
MOV P2, #00H ; LCD data bus
CLR P3.3 ; RS = 0
CLR P3.4 ; RW = 0
CLR P3.5 ; EN = 0
ACALL LCD_INIT ; Initialize LCD
RX_LOOP:
JNB RI, RX_LOOP ; Wait for received character
MOV A, SBUF ; Read received data
CLR RI
ACALL LCD_DATA ; Display received character
SJMP RX_LOOP
; ----------------------------------------
; LCD INITIALIZATION
; ----------------------------------------
LCD_INIT:
MOV A, #38H ; 8-bit, 2-line, 5×7 font
ACALL LCD_CMD
MOV A, #0CH ; Display ON, cursor OFF
ACALL LCD_CMD
MOV A, #01H ; Clear display
ACALL LCD_CMD
MOV A, #06H ; Entry mode: increment cursor
ACALL LCD_CMD
RET
; ----------------------------------------
; SEND LCD COMMAND
; ----------------------------------------
LCD_CMD:
MOV P2, A
CLR P3.3 ; RS = 0
CLR P3.4 ; RW = 0
SETB P3.5 ; EN = 1
ACALL DELAY
CLR P3.5 ; EN = 0
ACALL DELAY
RET
; ----------------------------------------
; SEND LCD DATA (CHARACTER)
; ----------------------------------------
LCD_DATA:
MOV P2, A
SETB P3.3 ; RS = 1
CLR P3.4 ; RW = 0
SETB P3.5 ; EN = 1
ACALL DELAY
CLR P3.5 ; EN = 0
ACALL DELAY
RET
; ----------------------------------------
; SOFTWARE DELAY
; ----------------------------------------
DELAY:
MOV R7,#255
D1:
MOV R6,#255
D2:
DJNZ R6, D2
DJNZ R7, D1
RET
END