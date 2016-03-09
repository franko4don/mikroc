
_main:

;doublereset.c,2 :: 		void main() {
;doublereset.c,3 :: 		TRISB=0;
	CLRF       TRISB+0
;doublereset.c,4 :: 		TRISC=0xff;
	MOVLW      255
	MOVWF      TRISC+0
;doublereset.c,5 :: 		PORTB=0x00;
	CLRF       PORTB+0
;doublereset.c,7 :: 		while(1){
L_main0:
;doublereset.c,8 :: 		if(PORTC.F0==0){
	BTFSC      PORTC+0, 0
	GOTO       L_main2
;doublereset.c,9 :: 		if(check==0){
	MOVLW      0
	XORWF      _check+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVLW      0
	XORWF      _check+0, 0
L__main9:
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;doublereset.c,10 :: 		PORTB.F0=1;
	BSF        PORTB+0, 0
;doublereset.c,11 :: 		delay_ms(2000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
;doublereset.c,12 :: 		check++;
	INCF       _check+0, 1
	BTFSC      STATUS+0, 2
	INCF       _check+1, 1
;doublereset.c,13 :: 		}else{
	GOTO       L_main5
L_main3:
;doublereset.c,14 :: 		PORTB.F1=1;
	BSF        PORTB+0, 1
;doublereset.c,15 :: 		check=0;
	CLRF       _check+0
	CLRF       _check+1
;doublereset.c,16 :: 		delay_ms(200);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;doublereset.c,17 :: 		PORTB.F1=0;
	BCF        PORTB+0, 1
;doublereset.c,18 :: 		delay_ms(200);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;doublereset.c,19 :: 		}
L_main5:
;doublereset.c,20 :: 		}
L_main2:
;doublereset.c,21 :: 		}
	GOTO       L_main0
;doublereset.c,22 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
