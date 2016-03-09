
_main:

;dotmatrix.c,3 :: 		void main() {
;dotmatrix.c,4 :: 		TRISB=0;
	CLRF       TRISB+0
;dotmatrix.c,5 :: 		TRISC=0;
	CLRF       TRISC+0
;dotmatrix.c,6 :: 		while(1){
L_main0:
;dotmatrix.c,9 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
;dotmatrix.c,10 :: 		for(j=0; j<5; j++){
	CLRF       R6+0
	CLRF       R6+1
L_main3:
	MOVLW      0
	SUBWF      R6+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main15
	MOVLW      5
	SUBWF      R6+0, 0
L__main15:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;dotmatrix.c,11 :: 		for(k=0; k<150; k++){
	CLRF       main_k_L1+0
	CLRF       main_k_L1+1
	CLRF       main_k_L1+2
	CLRF       main_k_L1+3
L_main6:
	MOVLW      0
	SUBWF      main_k_L1+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      0
	SUBWF      main_k_L1+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      0
	SUBWF      main_k_L1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      150
	SUBWF      main_k_L1+0, 0
L__main16:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;dotmatrix.c,12 :: 		for(i=j; i<5; i++){
	MOVF       R6+0, 0
	MOVWF      R4+0
	MOVF       R6+1, 0
	MOVWF      R4+1
L_main9:
	MOVLW      0
	SUBWF      R4+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main17
	MOVLW      5
	SUBWF      R4+0, 0
L__main17:
	BTFSC      STATUS+0, 0
	GOTO       L_main10
;dotmatrix.c,13 :: 		PORTB=~mrow[i];
	MOVF       R4+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _mrow+0
	MOVWF      FSR
	COMF       INDF+0, 0
	MOVWF      PORTB+0
;dotmatrix.c,14 :: 		PORTC=~mcol[i-j];
	MOVF       R6+0, 0
	SUBWF      R4+0, 0
	MOVWF      R2+0
	MOVF       R6+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      R4+1, 0
	MOVWF      R2+1
	MOVF       R2+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _mcol+0
	MOVWF      FSR
	COMF       INDF+0, 0
	MOVWF      PORTC+0
;dotmatrix.c,15 :: 		delay_ms(2);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	NOP
	NOP
;dotmatrix.c,12 :: 		for(i=j; i<5; i++){
	INCF       R4+0, 1
	BTFSC      STATUS+0, 2
	INCF       R4+1, 1
;dotmatrix.c,16 :: 		}
	GOTO       L_main9
L_main10:
;dotmatrix.c,11 :: 		for(k=0; k<150; k++){
	MOVF       main_k_L1+0, 0
	MOVWF      R0+0
	MOVF       main_k_L1+1, 0
	MOVWF      R0+1
	MOVF       main_k_L1+2, 0
	MOVWF      R0+2
	MOVF       main_k_L1+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      main_k_L1+0
	MOVF       R0+1, 0
	MOVWF      main_k_L1+1
	MOVF       R0+2, 0
	MOVWF      main_k_L1+2
	MOVF       R0+3, 0
	MOVWF      main_k_L1+3
;dotmatrix.c,17 :: 		}
	GOTO       L_main6
L_main7:
;dotmatrix.c,10 :: 		for(j=0; j<5; j++){
	INCF       R6+0, 1
	BTFSC      STATUS+0, 2
	INCF       R6+1, 1
;dotmatrix.c,19 :: 		}
	GOTO       L_main3
L_main4:
;dotmatrix.c,20 :: 		PORTB=0;
	CLRF       PORTB+0
;dotmatrix.c,21 :: 		PORTC=0;
	CLRF       PORTC+0
;dotmatrix.c,22 :: 		delay_ms(500);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
;dotmatrix.c,23 :: 		}
	GOTO       L_main0
;dotmatrix.c,24 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
