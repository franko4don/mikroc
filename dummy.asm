
_main:

;dummy.c,5 :: 		void main() {
;dummy.c,6 :: 		TRISA.F0=1;
	BSF        TRISA+0, 0
;dummy.c,7 :: 		TRISB=0;
	CLRF       TRISB+0
;dummy.c,8 :: 		ADCON1=0x80;
	MOVLW      128
	MOVWF      ADCON1+0
;dummy.c,9 :: 		TRISC=0;
	CLRF       TRISC+0
;dummy.c,10 :: 		TRISD=0;
	CLRF       TRISD+0
;dummy.c,11 :: 		PORTC=0;
	CLRF       PORTC+0
;dummy.c,12 :: 		PORTD=0;
	CLRF       PORTD+0
;dummy.c,13 :: 		while(1){
L_main0:
;dummy.c,15 :: 		for(i=0; i<9; i++){
	CLRF       R3+0
	CLRF       R3+1
L_main2:
	MOVLW      128
	XORWF      R3+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      9
	SUBWF      R3+0, 0
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;dummy.c,16 :: 		PORTB=lookup[i];
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _lookup+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;dummy.c,17 :: 		PORTD.F0=1;
	BSF        PORTD+0, 0
;dummy.c,18 :: 		delay_ms(2000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;dummy.c,15 :: 		for(i=0; i<9; i++){
	INCF       R3+0, 1
	BTFSC      STATUS+0, 2
	INCF       R3+1, 1
;dummy.c,19 :: 		}
	GOTO       L_main2
L_main3:
;dummy.c,20 :: 		}
	GOTO       L_main0
;dummy.c,21 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
