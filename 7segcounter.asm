
_segment:

;7segcounter.c,8 :: 		void segment(){
;7segcounter.c,9 :: 		if(i>9){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__segment12
	MOVF       _i+0, 0
	SUBLW      9
L__segment12:
	BTFSC      STATUS+0, 0
	GOTO       L_segment0
;7segcounter.c,10 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;7segcounter.c,11 :: 		j++;
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;7segcounter.c,12 :: 		}
L_segment0:
;7segcounter.c,14 :: 		if(j>=9){
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__segment13
	MOVLW      9
	SUBWF      _j+0, 0
L__segment13:
	BTFSS      STATUS+0, 0
	GOTO       L_segment1
;7segcounter.c,15 :: 		j=-1;
	MOVLW      255
	MOVWF      _j+0
	MOVLW      255
	MOVWF      _j+1
;7segcounter.c,16 :: 		}
L_segment1:
;7segcounter.c,17 :: 		first=lookup[i];
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _lookup+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      _first+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      _first+1
;7segcounter.c,18 :: 		second=lookup[j];
	MOVF       _j+0, 0
	MOVWF      R0+0
	MOVF       _j+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _lookup+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _second+0
	MOVF       R0+1, 0
	MOVWF      _second+1
;7segcounter.c,19 :: 		PORTB=second;
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;7segcounter.c,20 :: 		PORTA.F1=0;
	BCF        PORTA+0, 1
;7segcounter.c,21 :: 		PORTA.F2=1;
	BSF        PORTA+0, 2
;7segcounter.c,22 :: 		delay_ms(2);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_segment2:
	DECFSZ     R13+0, 1
	GOTO       L_segment2
	DECFSZ     R12+0, 1
	GOTO       L_segment2
	NOP
	NOP
;7segcounter.c,23 :: 		PORTA.F2=0;
	BCF        PORTA+0, 2
;7segcounter.c,24 :: 		PORTB=first;
	MOVF       _first+0, 0
	MOVWF      PORTB+0
;7segcounter.c,25 :: 		PORTA.F1=1;
	BSF        PORTA+0, 1
;7segcounter.c,26 :: 		delay_ms(2);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_segment3:
	DECFSZ     R13+0, 1
	GOTO       L_segment3
	DECFSZ     R12+0, 1
	GOTO       L_segment3
	NOP
	NOP
;7segcounter.c,27 :: 		PORTA.F1=0;
	BCF        PORTA+0, 1
;7segcounter.c,28 :: 		}
L_end_segment:
	RETURN
; end of _segment

_debounce:

;7segcounter.c,30 :: 		void debounce(){
;7segcounter.c,31 :: 		while(1){
L_debounce4:
;7segcounter.c,32 :: 		segment();
	CALL       _segment+0
;7segcounter.c,33 :: 		if(PORTA.F0==1)break;
	BTFSS      PORTA+0, 0
	GOTO       L_debounce6
	GOTO       L_debounce5
L_debounce6:
;7segcounter.c,34 :: 		}
	GOTO       L_debounce4
L_debounce5:
;7segcounter.c,35 :: 		}
L_end_debounce:
	RETURN
; end of _debounce

_main:

;7segcounter.c,37 :: 		void main() {
;7segcounter.c,39 :: 		TRISA=0b00000001;
	MOVLW      1
	MOVWF      TRISA+0
;7segcounter.c,40 :: 		TRISB=0;
	CLRF       TRISB+0
;7segcounter.c,41 :: 		first=lookup[0];
	MOVF       _lookup+0, 0
	MOVWF      _first+0
	MOVF       _lookup+1, 0
	MOVWF      _first+1
;7segcounter.c,42 :: 		second=lookup[0] ;
	MOVF       _lookup+0, 0
	MOVWF      _second+0
	MOVF       _lookup+1, 0
	MOVWF      _second+1
;7segcounter.c,43 :: 		while(1){
L_main7:
;7segcounter.c,44 :: 		segment();
	CALL       _segment+0
;7segcounter.c,45 :: 		if(PORTA.F0==0){
	BTFSC      PORTA+0, 0
	GOTO       L_main9
;7segcounter.c,46 :: 		debounce();
	CALL       _debounce+0
;7segcounter.c,47 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;7segcounter.c,48 :: 		if(i>=5){
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      5
	SUBWF      _i+0, 0
L__main16:
	BTFSS      STATUS+0, 0
	GOTO       L_main10
;7segcounter.c,50 :: 		PORTA.F3=1;}
	BSF        PORTA+0, 3
L_main10:
;7segcounter.c,51 :: 		second=lookup[j];
	MOVF       _j+0, 0
	MOVWF      R0+0
	MOVF       _j+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _lookup+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      _second+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      _second+1
;7segcounter.c,52 :: 		}
L_main9:
;7segcounter.c,54 :: 		}
	GOTO       L_main7
;7segcounter.c,55 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
