
_main:

;onoff.c,1 :: 		void main() {
;onoff.c,2 :: 		TRISC=0;
	CLRF       TRISC+0
;onoff.c,3 :: 		TRISB=0;
	CLRF       TRISB+0
;onoff.c,4 :: 		PORTC=0;
	CLRF       PORTC+0
;onoff.c,5 :: 		PORTB=0;
	CLRF       PORTB+0
;onoff.c,6 :: 		while(1){
L_main0:
;onoff.c,7 :: 		PORTC=0xff;
	MOVLW      255
	MOVWF      PORTC+0
;onoff.c,8 :: 		delay_ms(2000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;onoff.c,9 :: 		PORTC=0;
	CLRF       PORTC+0
;onoff.c,10 :: 		delay_ms(2000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;onoff.c,11 :: 		}
	GOTO       L_main0
;onoff.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
