
_seven:

;tempdisplaywith7segment.c,6 :: 		void seven(){
;tempdisplaywith7segment.c,8 :: 		for(i=0; i<250; i++){
	CLRF       R1+0
	CLRF       R1+1
L_seven0:
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__seven12
	MOVLW      250
	SUBWF      R1+0, 0
L__seven12:
	BTFSC      STATUS+0, 0
	GOTO       L_seven1
;tempdisplaywith7segment.c,9 :: 		PORTB=seg3;
	MOVF       _seg3+0, 0
	MOVWF      PORTB+0
;tempdisplaywith7segment.c,10 :: 		PORTD.F3=1;
	BSF        PORTD+0, 3
;tempdisplaywith7segment.c,11 :: 		delay_ms(1);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_seven3:
	DECFSZ     R13+0, 1
	GOTO       L_seven3
	DECFSZ     R12+0, 1
	GOTO       L_seven3
	NOP
;tempdisplaywith7segment.c,12 :: 		PORTD.F3=0;
	BCF        PORTD+0, 3
;tempdisplaywith7segment.c,14 :: 		PORTB=seg4;
	MOVF       _seg4+0, 0
	MOVWF      PORTB+0
;tempdisplaywith7segment.c,15 :: 		PORTD.F0=1;
	BSF        PORTD+0, 0
;tempdisplaywith7segment.c,16 :: 		delay_ms(1);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_seven4:
	DECFSZ     R13+0, 1
	GOTO       L_seven4
	DECFSZ     R12+0, 1
	GOTO       L_seven4
	NOP
;tempdisplaywith7segment.c,17 :: 		PORTD.F0=0;
	BCF        PORTD+0, 0
;tempdisplaywith7segment.c,19 :: 		PORTB=seg2;
	MOVF       _seg2+0, 0
	MOVWF      PORTB+0
;tempdisplaywith7segment.c,20 :: 		PORTC.F1=1;
	BSF        PORTC+0, 1
;tempdisplaywith7segment.c,21 :: 		delay_ms(1);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_seven5:
	DECFSZ     R13+0, 1
	GOTO       L_seven5
	DECFSZ     R12+0, 1
	GOTO       L_seven5
	NOP
;tempdisplaywith7segment.c,22 :: 		PORTC.F1=0;
	BCF        PORTC+0, 1
;tempdisplaywith7segment.c,24 :: 		PORTB=seg1;
	MOVF       _seg1+0, 0
	MOVWF      PORTB+0
;tempdisplaywith7segment.c,25 :: 		PORTD.F2=1;
	BSF        PORTD+0, 2
;tempdisplaywith7segment.c,26 :: 		delay_ms(1);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_seven6:
	DECFSZ     R13+0, 1
	GOTO       L_seven6
	DECFSZ     R12+0, 1
	GOTO       L_seven6
	NOP
;tempdisplaywith7segment.c,27 :: 		PORTD.F2=0;
	BCF        PORTD+0, 2
;tempdisplaywith7segment.c,8 :: 		for(i=0; i<250; i++){
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;tempdisplaywith7segment.c,29 :: 		}
	GOTO       L_seven0
L_seven1:
;tempdisplaywith7segment.c,30 :: 		}
L_end_seven:
	RETURN
; end of _seven

_main:

;tempdisplaywith7segment.c,32 :: 		void main() {
;tempdisplaywith7segment.c,34 :: 		TRISB=0;
	CLRF       TRISB+0
;tempdisplaywith7segment.c,35 :: 		ADCON1=0x80;
	MOVLW      128
	MOVWF      ADCON1+0
;tempdisplaywith7segment.c,36 :: 		TRISC=0;
	CLRF       TRISC+0
;tempdisplaywith7segment.c,37 :: 		TRISD=0;
	CLRF       TRISD+0
;tempdisplaywith7segment.c,38 :: 		PORTC=0;
	CLRF       PORTC+0
;tempdisplaywith7segment.c,39 :: 		PORTD=0;
	CLRF       PORTD+0
;tempdisplaywith7segment.c,40 :: 		seg1=lookup[0];
	MOVF       _lookup+0, 0
	MOVWF      _seg1+0
	MOVF       _lookup+1, 0
	MOVWF      _seg1+1
;tempdisplaywith7segment.c,41 :: 		seg2=lookup[0];
	MOVF       _lookup+0, 0
	MOVWF      _seg2+0
	MOVF       _lookup+1, 0
	MOVWF      _seg2+1
;tempdisplaywith7segment.c,42 :: 		seg3=lookup[0];
	MOVF       _lookup+0, 0
	MOVWF      _seg3+0
	MOVF       _lookup+1, 0
	MOVWF      _seg3+1
;tempdisplaywith7segment.c,43 :: 		seg4=0xC6;
	MOVLW      198
	MOVWF      _seg4+0
	CLRF       _seg4+1
;tempdisplaywith7segment.c,44 :: 		seven();
	CALL       _seven+0
;tempdisplaywith7segment.c,45 :: 		ADC_Init();
	CALL       _ADC_Init+0
;tempdisplaywith7segment.c,46 :: 		while(1){
L_main7:
;tempdisplaywith7segment.c,47 :: 		value=ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       R0+0, 0
	MOVWF      _value+0
	MOVF       R0+1, 0
	MOVWF      _value+1
	MOVF       R0+2, 0
	MOVWF      _value+2
	MOVF       R0+3, 0
	MOVWF      _value+3
;tempdisplaywith7segment.c,48 :: 		answer=(value*5)/1023;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      192
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _answer+0
	MOVF       R0+1, 0
	MOVWF      _answer+1
	MOVF       R0+2, 0
	MOVWF      _answer+2
	MOVF       R0+3, 0
	MOVWF      _answer+3
;tempdisplaywith7segment.c,50 :: 		answer*=100;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _answer+0
	MOVF       R0+1, 0
	MOVWF      _answer+1
	MOVF       R0+2, 0
	MOVWF      _answer+2
	MOVF       R0+3, 0
	MOVWF      _answer+3
;tempdisplaywith7segment.c,51 :: 		if((int)answer>43){
	CALL       _Double2Int+0
	MOVLW      128
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVF       R0+0, 0
	SUBLW      43
L__main14:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;tempdisplaywith7segment.c,52 :: 		PORTD.F4=0;
	BCF        PORTD+0, 4
;tempdisplaywith7segment.c,53 :: 		}else{
	GOTO       L_main10
L_main9:
;tempdisplaywith7segment.c,54 :: 		PORTD.F4=1;
	BSF        PORTD+0, 4
;tempdisplaywith7segment.c,55 :: 		}
L_main10:
;tempdisplaywith7segment.c,56 :: 		first=answer/10;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	MOVF       _answer+0, 0
	MOVWF      R0+0
	MOVF       _answer+1, 0
	MOVWF      R0+1
	MOVF       _answer+2, 0
	MOVWF      R0+2
	MOVF       _answer+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _first+0
	MOVF       R0+1, 0
	MOVWF      _first+1
;tempdisplaywith7segment.c,57 :: 		second=(answer-(first*10));
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	CALL       _Int2Double+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       _answer+0, 0
	MOVWF      R0+0
	MOVF       _answer+1, 0
	MOVWF      R0+1
	MOVF       _answer+2, 0
	MOVWF      R0+2
	MOVF       _answer+3, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _second+0
	MOVF       R0+1, 0
	MOVWF      _second+1
;tempdisplaywith7segment.c,58 :: 		seg1=lookup[first];
	MOVF       _first+0, 0
	MOVWF      R2+0
	MOVF       _first+1, 0
	MOVWF      R2+1
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	MOVF       R2+0, 0
	ADDLW      _lookup+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      _seg1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      _seg1+1
;tempdisplaywith7segment.c,59 :: 		seg2=lookup[second];
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	MOVF       R2+0, 0
	ADDLW      _lookup+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      _seg2+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      _seg2+1
;tempdisplaywith7segment.c,60 :: 		seven();
	CALL       _seven+0
;tempdisplaywith7segment.c,61 :: 		}
	GOTO       L_main7
;tempdisplaywith7segment.c,62 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
