
_bitRead:

;receiver.c,5 :: 		int bitRead(int signal,int bitPosition){
;receiver.c,6 :: 		bitManipulate=0x01;
	MOVLW      1
	MOVWF      _bitManipulate+0
	MOVLW      0
	MOVWF      _bitManipulate+1
;receiver.c,7 :: 		bitManipulate<<=bitPosition;
	MOVF       FARG_bitRead_bitPosition+0, 0
	MOVWF      R2+0
	MOVF       _bitManipulate+0, 0
	MOVWF      R0+0
	MOVF       _bitManipulate+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__bitRead33:
	BTFSC      STATUS+0, 2
	GOTO       L__bitRead34
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__bitRead33
L__bitRead34:
	MOVF       R0+0, 0
	MOVWF      _bitManipulate+0
	MOVF       R0+1, 0
	MOVWF      _bitManipulate+1
;receiver.c,8 :: 		return (signal&bitManipulate);
	MOVF       FARG_bitRead_signal+0, 0
	ANDWF      R0+0, 1
	MOVF       FARG_bitRead_signal+1, 0
	ANDWF      R0+1, 1
;receiver.c,9 :: 		}
L_end_bitRead:
	RETURN
; end of _bitRead

_bitWrite:

;receiver.c,11 :: 		void bitWrite(int position,int shifts){
;receiver.c,12 :: 		shifts<<=position;
	MOVF       FARG_bitWrite_position+0, 0
	MOVWF      R2+0
	MOVF       FARG_bitWrite_shifts+0, 0
	MOVWF      R0+0
	MOVF       FARG_bitWrite_shifts+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__bitWrite36:
	BTFSC      STATUS+0, 2
	GOTO       L__bitWrite37
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__bitWrite36
L__bitWrite37:
	MOVF       R0+0, 0
	MOVWF      FARG_bitWrite_shifts+0
	MOVF       R0+1, 0
	MOVWF      FARG_bitWrite_shifts+1
;receiver.c,13 :: 		encodedSignal^=shifts;
	MOVF       R0+0, 0
	XORWF      _encodedSignal+0, 1
	MOVF       R0+1, 0
	XORWF      _encodedSignal+1, 1
;receiver.c,14 :: 		}
L_end_bitWrite:
	RETURN
; end of _bitWrite

_delay3ms:

;receiver.c,16 :: 		void delay3ms(){
;receiver.c,17 :: 		counter=0;
	CLRF       _counter+0
	CLRF       _counter+1
;receiver.c,18 :: 		TMR0=0;
	CLRF       TMR0+0
;receiver.c,19 :: 		OPTION_REG=0xd2;
	MOVLW      210
	MOVWF      OPTION_REG+0
;receiver.c,20 :: 		INTCON=0x00;
	CLRF       INTCON+0
;receiver.c,21 :: 		TMR0IE_bit=1;
	BSF        TMR0IE_bit+0, 5
;receiver.c,22 :: 		TMR0IF_bit=0;
	BCF        TMR0IF_bit+0, 2
;receiver.c,23 :: 		while(1){
L_delay3ms0:
;receiver.c,24 :: 		if(TMR0IF_bit){
	BTFSS      TMR0IF_bit+0, 2
	GOTO       L_delay3ms2
;receiver.c,25 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;receiver.c,26 :: 		TMR0IF_bit=0;
	BCF        TMR0IF_bit+0, 2
;receiver.c,27 :: 		}
L_delay3ms2:
;receiver.c,28 :: 		if(counter==93)break;
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay3ms39
	MOVLW      93
	XORWF      _counter+0, 0
L__delay3ms39:
	BTFSS      STATUS+0, 2
	GOTO       L_delay3ms3
	GOTO       L_delay3ms1
L_delay3ms3:
;receiver.c,29 :: 		}
	GOTO       L_delay3ms0
L_delay3ms1:
;receiver.c,32 :: 		}
L_end_delay3ms:
	RETURN
; end of _delay3ms

_delay500us:

;receiver.c,34 :: 		void delay500us(){
;receiver.c,35 :: 		counter=0;
	CLRF       _counter+0
	CLRF       _counter+1
;receiver.c,36 :: 		TMR0=0;
	CLRF       TMR0+0
;receiver.c,37 :: 		OPTION_REG=0xd2;
	MOVLW      210
	MOVWF      OPTION_REG+0
;receiver.c,38 :: 		INTCON=0x00;
	CLRF       INTCON+0
;receiver.c,39 :: 		TMR0IE_bit=1;
	BSF        TMR0IE_bit+0, 5
;receiver.c,40 :: 		while(1){
L_delay500us4:
;receiver.c,41 :: 		if(TMR0IF_bit){
	BTFSS      TMR0IF_bit+0, 2
	GOTO       L_delay500us6
;receiver.c,42 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;receiver.c,43 :: 		TMR0IF_bit=0;
	BCF        TMR0IF_bit+0, 2
;receiver.c,44 :: 		}
L_delay500us6:
;receiver.c,45 :: 		if(counter==15)break;
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay500us41
	MOVLW      15
	XORWF      _counter+0, 0
L__delay500us41:
	BTFSS      STATUS+0, 2
	GOTO       L_delay500us7
	GOTO       L_delay500us5
L_delay500us7:
;receiver.c,46 :: 		}
	GOTO       L_delay500us4
L_delay500us5:
;receiver.c,49 :: 		}
L_end_delay500us:
	RETURN
; end of _delay500us

_delay725us:

;receiver.c,51 :: 		void delay725us(){
;receiver.c,52 :: 		counter=0;
	CLRF       _counter+0
	CLRF       _counter+1
;receiver.c,53 :: 		TMR0=0;
	CLRF       TMR0+0
;receiver.c,54 :: 		OPTION_REG=0xd2;
	MOVLW      210
	MOVWF      OPTION_REG+0
;receiver.c,55 :: 		INTCON=0x00;
	CLRF       INTCON+0
;receiver.c,56 :: 		TMR0IE_bit=1;
	BSF        TMR0IE_bit+0, 5
;receiver.c,57 :: 		while(1){
L_delay725us8:
;receiver.c,58 :: 		if(TMR0IF_bit){
	BTFSS      TMR0IF_bit+0, 2
	GOTO       L_delay725us10
;receiver.c,59 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;receiver.c,60 :: 		TMR0IF_bit=0;
	BCF        TMR0IF_bit+0, 2
;receiver.c,61 :: 		}
L_delay725us10:
;receiver.c,62 :: 		if(counter==23)break;
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay725us43
	MOVLW      23
	XORWF      _counter+0, 0
L__delay725us43:
	BTFSS      STATUS+0, 2
	GOTO       L_delay725us11
	GOTO       L_delay725us9
L_delay725us11:
;receiver.c,63 :: 		}
	GOTO       L_delay725us8
L_delay725us9:
;receiver.c,66 :: 		}
L_end_delay725us:
	RETURN
; end of _delay725us

_delay20us:

;receiver.c,68 :: 		void delay20us(){
;receiver.c,69 :: 		counter=0;
	CLRF       _counter+0
	CLRF       _counter+1
;receiver.c,70 :: 		TMR0=0;
	CLRF       TMR0+0
;receiver.c,71 :: 		OPTION_REG=0xd2;
	MOVLW      210
	MOVWF      OPTION_REG+0
;receiver.c,72 :: 		INTCON=0x00;
	CLRF       INTCON+0
;receiver.c,73 :: 		TMR0IE_bit=1;
	BSF        TMR0IE_bit+0, 5
;receiver.c,74 :: 		while(1){
L_delay20us12:
;receiver.c,75 :: 		if(TMR0IF_bit){
	BTFSS      TMR0IF_bit+0, 2
	GOTO       L_delay20us14
;receiver.c,76 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;receiver.c,77 :: 		TMR0IF_bit=0;
	BCF        TMR0IF_bit+0, 2
;receiver.c,78 :: 		}
L_delay20us14:
;receiver.c,79 :: 		if(counter==6)break;
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay20us45
	MOVLW      6
	XORWF      _counter+0, 0
L__delay20us45:
	BTFSS      STATUS+0, 2
	GOTO       L_delay20us15
	GOTO       L_delay20us13
L_delay20us15:
;receiver.c,80 :: 		}
	GOTO       L_delay20us12
L_delay20us13:
;receiver.c,83 :: 		}
L_end_delay20us:
	RETURN
; end of _delay20us

_reception:

;receiver.c,85 :: 		void reception(){
;receiver.c,87 :: 		for(i=0; i<10; i++){
	CLRF       reception_i_L0+0
	CLRF       reception_i_L0+1
L_reception16:
	MOVLW      128
	XORWF      reception_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__reception47
	MOVLW      10
	SUBWF      reception_i_L0+0, 0
L__reception47:
	BTFSC      STATUS+0, 0
	GOTO       L_reception17
;receiver.c,88 :: 		delay20us();
	CALL       _delay20us+0
;receiver.c,89 :: 		good=1;
	MOVLW      1
	MOVWF      _good+0
	MOVLW      0
	MOVWF      _good+1
;receiver.c,90 :: 		if(PORTB.F0==0){
	BTFSC      PORTB+0, 0
	GOTO       L_reception19
;receiver.c,91 :: 		good=0;
	CLRF       _good+0
	CLRF       _good+1
;receiver.c,92 :: 		i=100;
	MOVLW      100
	MOVWF      reception_i_L0+0
	MOVLW      0
	MOVWF      reception_i_L0+1
;receiver.c,93 :: 		}
L_reception19:
;receiver.c,87 :: 		for(i=0; i<10; i++){
	INCF       reception_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       reception_i_L0+1, 1
;receiver.c,94 :: 		}
	GOTO       L_reception16
L_reception17:
;receiver.c,96 :: 		if(good==1){
	MOVLW      0
	XORWF      _good+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__reception48
	MOVLW      1
	XORWF      _good+0, 0
L__reception48:
	BTFSS      STATUS+0, 2
	GOTO       L_reception20
;receiver.c,97 :: 		while(1){
L_reception21:
;receiver.c,98 :: 		if(PORTB.F0==0){
	BTFSC      PORTB+0, 0
	GOTO       L_reception23
;receiver.c,99 :: 		delay725us();
	CALL       _delay725us+0
;receiver.c,100 :: 		for(i=0; i<8; i++){
	CLRF       reception_i_L0+0
	CLRF       reception_i_L0+1
L_reception24:
	MOVLW      128
	XORWF      reception_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__reception49
	MOVLW      8
	SUBWF      reception_i_L0+0, 0
L__reception49:
	BTFSC      STATUS+0, 0
	GOTO       L_reception25
;receiver.c,101 :: 		if(PORTB.F0==1){
	BTFSS      PORTB+0, 0
	GOTO       L_reception27
;receiver.c,102 :: 		bitWrite(i,0x01);
	MOVF       reception_i_L0+0, 0
	MOVWF      FARG_bitWrite_position+0
	MOVF       reception_i_L0+1, 0
	MOVWF      FARG_bitWrite_position+1
	MOVLW      1
	MOVWF      FARG_bitWrite_shifts+0
	MOVLW      0
	MOVWF      FARG_bitWrite_shifts+1
	CALL       _bitWrite+0
;receiver.c,103 :: 		PORTB.F1=1;
	BSF        PORTB+0, 1
;receiver.c,104 :: 		}else{
	GOTO       L_reception28
L_reception27:
;receiver.c,105 :: 		bitWrite(i,0x00);
	MOVF       reception_i_L0+0, 0
	MOVWF      FARG_bitWrite_position+0
	MOVF       reception_i_L0+1, 0
	MOVWF      FARG_bitWrite_position+1
	CLRF       FARG_bitWrite_shifts+0
	CLRF       FARG_bitWrite_shifts+1
	CALL       _bitWrite+0
;receiver.c,106 :: 		PORTB.F1=0;
	BCF        PORTB+0, 1
;receiver.c,107 :: 		}
L_reception28:
;receiver.c,108 :: 		delay500us();
	CALL       _delay500us+0
;receiver.c,100 :: 		for(i=0; i<8; i++){
	INCF       reception_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       reception_i_L0+1, 1
;receiver.c,109 :: 		}
	GOTO       L_reception24
L_reception25:
;receiver.c,110 :: 		break;
	GOTO       L_reception22
;receiver.c,111 :: 		}
L_reception23:
;receiver.c,112 :: 		}
	GOTO       L_reception21
L_reception22:
;receiver.c,113 :: 		PORTC=encodedSignal;
	MOVF       _encodedSignal+0, 0
	MOVWF      PORTC+0
;receiver.c,114 :: 		}
L_reception20:
;receiver.c,116 :: 		}
L_end_reception:
	RETURN
; end of _reception

_main:

;receiver.c,118 :: 		void main() {
;receiver.c,119 :: 		TRISB=0x01;
	MOVLW      1
	MOVWF      TRISB+0
;receiver.c,120 :: 		TRISC=0;
	CLRF       TRISC+0
;receiver.c,121 :: 		PORTC=0;
	CLRF       PORTC+0
;receiver.c,122 :: 		PORTB=0;
	CLRF       PORTB+0
;receiver.c,124 :: 		while(1){
L_main29:
;receiver.c,125 :: 		PORTB=0;
	CLRF       PORTB+0
;receiver.c,126 :: 		if(PORTB.F0==1){
	BTFSS      PORTB+0, 0
	GOTO       L_main31
;receiver.c,127 :: 		encodedSignal=0;
	CLRF       _encodedSignal+0
	CLRF       _encodedSignal+1
;receiver.c,128 :: 		reception();
	CALL       _reception+0
;receiver.c,129 :: 		}
L_main31:
;receiver.c,130 :: 		}
	GOTO       L_main29
;receiver.c,131 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
