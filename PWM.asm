
_delay20ms:

;PWM.c,9 :: 		void delay20ms(){
;PWM.c,10 :: 		offtime=offtime1;
	MOVF       _offtime1+0, 0
	MOVWF      R0+0
	MOVF       _offtime1+1, 0
	MOVWF      R0+1
	MOVF       _offtime1+2, 0
	MOVWF      R0+2
	MOVF       _offtime1+3, 0
	MOVWF      R0+3
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _offtime+0
	MOVF       R0+1, 0
	MOVWF      _offtime+1
;PWM.c,11 :: 		ontime=ontime1;
	MOVF       _ontime1+0, 0
	MOVWF      R0+0
	MOVF       _ontime1+1, 0
	MOVWF      R0+1
	MOVF       _ontime1+2, 0
	MOVWF      R0+2
	MOVF       _ontime1+3, 0
	MOVWF      R0+3
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _ontime+0
	MOVF       R0+1, 0
	MOVWF      _ontime+1
;PWM.c,12 :: 		counter=0;
	CLRF       _counter+0
	CLRF       _counter+1
;PWM.c,13 :: 		TMR0=0;
	CLRF       TMR0+0
;PWM.c,14 :: 		OPTION_REG=0xd4;
	MOVLW      212
	MOVWF      OPTION_REG+0
;PWM.c,15 :: 		INTCON=0x00;
	CLRF       INTCON+0
;PWM.c,16 :: 		TMR0IE_bit=1;
	BSF        TMR0IE_bit+0, 5
;PWM.c,17 :: 		while(1){
L_delay20ms0:
;PWM.c,18 :: 		if(TMR0IF_bit){
	BTFSS      TMR0IF_bit+0, 2
	GOTO       L_delay20ms2
;PWM.c,19 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;PWM.c,20 :: 		TMR0IF_bit=0;
	BCF        TMR0IF_bit+0, 2
;PWM.c,21 :: 		}
L_delay20ms2:
;PWM.c,22 :: 		if(ontime1>counter){
	MOVF       _counter+0, 0
	MOVWF      R0+0
	MOVF       _counter+1, 0
	MOVWF      R0+1
	CALL       _Word2Double+0
	MOVF       _ontime1+0, 0
	MOVWF      R4+0
	MOVF       _ontime1+1, 0
	MOVWF      R4+1
	MOVF       _ontime1+2, 0
	MOVWF      R4+2
	MOVF       _ontime1+3, 0
	MOVWF      R4+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_delay20ms3
;PWM.c,23 :: 		PORTB.F0=1;
	BSF        PORTB+0, 0
;PWM.c,24 :: 		}else{
	GOTO       L_delay20ms4
L_delay20ms3:
;PWM.c,25 :: 		PORTB.F0=0;
	BCF        PORTB+0, 0
;PWM.c,26 :: 		}
L_delay20ms4:
;PWM.c,27 :: 		if(counter==count)break;
	MOVF       _counter+1, 0
	XORWF      _count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay20ms12
	MOVF       _count+0, 0
	XORWF      _counter+0, 0
L__delay20ms12:
	BTFSS      STATUS+0, 2
	GOTO       L_delay20ms5
	GOTO       L_delay20ms1
L_delay20ms5:
;PWM.c,28 :: 		}
	GOTO       L_delay20ms0
L_delay20ms1:
;PWM.c,31 :: 		}
L_end_delay20ms:
	RETURN
; end of _delay20ms

_calc:

;PWM.c,33 :: 		void calc(){
;PWM.c,35 :: 		for(i=0.0; i<=255.0; i+=2.0){
	CLRF       calc_i_L0+0
	CLRF       calc_i_L0+1
	CLRF       calc_i_L0+2
	CLRF       calc_i_L0+3
L_calc6:
	MOVF       calc_i_L0+0, 0
	MOVWF      R4+0
	MOVF       calc_i_L0+1, 0
	MOVWF      R4+1
	MOVF       calc_i_L0+2, 0
	MOVWF      R4+2
	MOVF       calc_i_L0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      127
	MOVWF      R0+2
	MOVLW      134
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_calc7
;PWM.c,36 :: 		onrate=i/255;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      134
	MOVWF      R4+3
	MOVF       calc_i_L0+0, 0
	MOVWF      R0+0
	MOVF       calc_i_L0+1, 0
	MOVWF      R0+1
	MOVF       calc_i_L0+2, 0
	MOVWF      R0+2
	MOVF       calc_i_L0+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__calc+4
	MOVF       R0+1, 0
	MOVWF      FLOC__calc+5
	MOVF       R0+2, 0
	MOVWF      FLOC__calc+6
	MOVF       R0+3, 0
	MOVWF      FLOC__calc+7
	MOVF       FLOC__calc+4, 0
	MOVWF      _onrate+0
	MOVF       FLOC__calc+5, 0
	MOVWF      _onrate+1
	MOVF       FLOC__calc+6, 0
	MOVWF      _onrate+2
	MOVF       FLOC__calc+7, 0
	MOVWF      _onrate+3
;PWM.c,37 :: 		offrate=1-onrate;
	MOVF       FLOC__calc+4, 0
	MOVWF      R4+0
	MOVF       FLOC__calc+5, 0
	MOVWF      R4+1
	MOVF       FLOC__calc+6, 0
	MOVWF      R4+2
	MOVF       FLOC__calc+7, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      0
	MOVWF      R0+2
	MOVLW      127
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _offrate+0
	MOVF       R0+1, 0
	MOVWF      _offrate+1
	MOVF       R0+2, 0
	MOVWF      _offrate+2
	MOVF       R0+3, 0
	MOVWF      _offrate+3
;PWM.c,38 :: 		ontime1=onrate*count;
	MOVF       _count+0, 0
	MOVWF      R0+0
	MOVF       _count+1, 0
	MOVWF      R0+1
	CALL       _Int2Double+0
	MOVF       R0+0, 0
	MOVWF      FLOC__calc+0
	MOVF       R0+1, 0
	MOVWF      FLOC__calc+1
	MOVF       R0+2, 0
	MOVWF      FLOC__calc+2
	MOVF       R0+3, 0
	MOVWF      FLOC__calc+3
	MOVF       FLOC__calc+4, 0
	MOVWF      R0+0
	MOVF       FLOC__calc+5, 0
	MOVWF      R0+1
	MOVF       FLOC__calc+6, 0
	MOVWF      R0+2
	MOVF       FLOC__calc+7, 0
	MOVWF      R0+3
	MOVF       FLOC__calc+0, 0
	MOVWF      R4+0
	MOVF       FLOC__calc+1, 0
	MOVWF      R4+1
	MOVF       FLOC__calc+2, 0
	MOVWF      R4+2
	MOVF       FLOC__calc+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _ontime1+0
	MOVF       R0+1, 0
	MOVWF      _ontime1+1
	MOVF       R0+2, 0
	MOVWF      _ontime1+2
	MOVF       R0+3, 0
	MOVWF      _ontime1+3
;PWM.c,39 :: 		offtime1=offrate*count;
	MOVF       _offrate+0, 0
	MOVWF      R0+0
	MOVF       _offrate+1, 0
	MOVWF      R0+1
	MOVF       _offrate+2, 0
	MOVWF      R0+2
	MOVF       _offrate+3, 0
	MOVWF      R0+3
	MOVF       FLOC__calc+0, 0
	MOVWF      R4+0
	MOVF       FLOC__calc+1, 0
	MOVWF      R4+1
	MOVF       FLOC__calc+2, 0
	MOVWF      R4+2
	MOVF       FLOC__calc+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _offtime1+0
	MOVF       R0+1, 0
	MOVWF      _offtime1+1
	MOVF       R0+2, 0
	MOVWF      _offtime1+2
	MOVF       R0+3, 0
	MOVWF      _offtime1+3
;PWM.c,40 :: 		delay20ms();
	CALL       _delay20ms+0
;PWM.c,35 :: 		for(i=0.0; i<=255.0; i+=2.0){
	MOVF       calc_i_L0+0, 0
	MOVWF      R0+0
	MOVF       calc_i_L0+1, 0
	MOVWF      R0+1
	MOVF       calc_i_L0+2, 0
	MOVWF      R0+2
	MOVF       calc_i_L0+3, 0
	MOVWF      R0+3
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      calc_i_L0+0
	MOVF       R0+1, 0
	MOVWF      calc_i_L0+1
	MOVF       R0+2, 0
	MOVWF      calc_i_L0+2
	MOVF       R0+3, 0
	MOVWF      calc_i_L0+3
;PWM.c,41 :: 		}
	GOTO       L_calc6
L_calc7:
;PWM.c,42 :: 		}
L_end_calc:
	RETURN
; end of _calc

_main:

;PWM.c,45 :: 		void main() {
;PWM.c,46 :: 		TRISB=0;
	CLRF       TRISB+0
;PWM.c,47 :: 		PORTB=0;
	CLRF       PORTB+0
;PWM.c,48 :: 		while(1){
L_main9:
;PWM.c,49 :: 		calc();
	CALL       _calc+0
;PWM.c,50 :: 		}
	GOTO       L_main9
;PWM.c,51 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
