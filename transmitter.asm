
_bitRead:

;transmitter.c,4 :: 		int bitRead(int signal,int bitPosition){
;transmitter.c,5 :: 		bitManipulate=0x01;
	MOVLW      1
	MOVWF      _bitManipulate+0
	MOVLW      0
	MOVWF      _bitManipulate+1
;transmitter.c,6 :: 		bitManipulate<<=bitPosition;
	MOVF       FARG_bitRead_bitPosition+0, 0
	MOVWF      R2+0
	MOVF       _bitManipulate+0, 0
	MOVWF      R0+0
	MOVF       _bitManipulate+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__bitRead32:
	BTFSC      STATUS+0, 2
	GOTO       L__bitRead33
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__bitRead32
L__bitRead33:
	MOVF       R0+0, 0
	MOVWF      _bitManipulate+0
	MOVF       R0+1, 0
	MOVWF      _bitManipulate+1
;transmitter.c,7 :: 		return (signal&bitManipulate);
	MOVF       FARG_bitRead_signal+0, 0
	ANDWF      R0+0, 1
	MOVF       FARG_bitRead_signal+1, 0
	ANDWF      R0+1, 1
;transmitter.c,8 :: 		}
L_end_bitRead:
	RETURN
; end of _bitRead

_delay3ms:

;transmitter.c,10 :: 		void delay3ms(){
;transmitter.c,11 :: 		counter=0;
	CLRF       _counter+0
	CLRF       _counter+1
;transmitter.c,12 :: 		TMR0=0;
	CLRF       TMR0+0
;transmitter.c,13 :: 		OPTION_REG=0xd2;
	MOVLW      210
	MOVWF      OPTION_REG+0
;transmitter.c,14 :: 		INTCON=0x00;
	CLRF       INTCON+0
;transmitter.c,15 :: 		TMR0IE_bit=1;
	BSF        TMR0IE_bit+0, 5
;transmitter.c,16 :: 		TMR0IF_bit=0;
	BCF        TMR0IF_bit+0, 2
;transmitter.c,17 :: 		while(1){
L_delay3ms0:
;transmitter.c,18 :: 		if(TMR0IF_bit){
	BTFSS      TMR0IF_bit+0, 2
	GOTO       L_delay3ms2
;transmitter.c,19 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;transmitter.c,20 :: 		TMR0IF_bit=0;
	BCF        TMR0IF_bit+0, 2
;transmitter.c,21 :: 		}
L_delay3ms2:
;transmitter.c,22 :: 		if(counter==93)break;
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay3ms35
	MOVLW      93
	XORWF      _counter+0, 0
L__delay3ms35:
	BTFSS      STATUS+0, 2
	GOTO       L_delay3ms3
	GOTO       L_delay3ms1
L_delay3ms3:
;transmitter.c,23 :: 		}
	GOTO       L_delay3ms0
L_delay3ms1:
;transmitter.c,26 :: 		}
L_end_delay3ms:
	RETURN
; end of _delay3ms

_delay500us:

;transmitter.c,28 :: 		void delay500us(){
;transmitter.c,29 :: 		counter=0;
	CLRF       _counter+0
	CLRF       _counter+1
;transmitter.c,30 :: 		TMR0=0;
	CLRF       TMR0+0
;transmitter.c,31 :: 		OPTION_REG=0xd2;
	MOVLW      210
	MOVWF      OPTION_REG+0
;transmitter.c,32 :: 		INTCON=0x00;
	CLRF       INTCON+0
;transmitter.c,33 :: 		TMR0IE_bit=1;
	BSF        TMR0IE_bit+0, 5
;transmitter.c,34 :: 		while(1){
L_delay500us4:
;transmitter.c,35 :: 		if(TMR0IF_bit){
	BTFSS      TMR0IF_bit+0, 2
	GOTO       L_delay500us6
;transmitter.c,36 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;transmitter.c,37 :: 		TMR0IF_bit=0;
	BCF        TMR0IF_bit+0, 2
;transmitter.c,38 :: 		}
L_delay500us6:
;transmitter.c,39 :: 		if(counter==15)break;
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay500us37
	MOVLW      15
	XORWF      _counter+0, 0
L__delay500us37:
	BTFSS      STATUS+0, 2
	GOTO       L_delay500us7
	GOTO       L_delay500us5
L_delay500us7:
;transmitter.c,40 :: 		}
	GOTO       L_delay500us4
L_delay500us5:
;transmitter.c,43 :: 		}
L_end_delay500us:
	RETURN
; end of _delay500us

_preamble:

;transmitter.c,45 :: 		void preamble(){
;transmitter.c,47 :: 		for(i=0; i<20; i++){
	CLRF       preamble_i_L0+0
	CLRF       preamble_i_L0+1
L_preamble8:
	MOVLW      128
	XORWF      preamble_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__preamble39
	MOVLW      20
	SUBWF      preamble_i_L0+0, 0
L__preamble39:
	BTFSC      STATUS+0, 0
	GOTO       L_preamble9
;transmitter.c,48 :: 		PORTC.F0=1;
	BSF        PORTC+0, 0
;transmitter.c,49 :: 		delay500us();
	CALL       _delay500us+0
;transmitter.c,50 :: 		PORTC.F0=0;
	BCF        PORTC+0, 0
;transmitter.c,51 :: 		delay500us();
	CALL       _delay500us+0
;transmitter.c,47 :: 		for(i=0; i<20; i++){
	INCF       preamble_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       preamble_i_L0+1, 1
;transmitter.c,52 :: 		}
	GOTO       L_preamble8
L_preamble9:
;transmitter.c,53 :: 		}
L_end_preamble:
	RETURN
; end of _preamble

_transmitSignal:

;transmitter.c,55 :: 		void transmitSignal(int signal){
;transmitter.c,57 :: 		preamble();
	CALL       _preamble+0
;transmitter.c,58 :: 		PORTC.F0=1;
	BSF        PORTC+0, 0
;transmitter.c,59 :: 		delay3ms();
	CALL       _delay3ms+0
;transmitter.c,60 :: 		PORTC.F0=0;
	BCF        PORTC+0, 0
;transmitter.c,61 :: 		delay500us();
	CALL       _delay500us+0
;transmitter.c,62 :: 		for(j=0; j<8; j++){
	CLRF       transmitSignal_j_L0+0
	CLRF       transmitSignal_j_L0+1
L_transmitSignal11:
	MOVLW      128
	XORWF      transmitSignal_j_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__transmitSignal41
	MOVLW      8
	SUBWF      transmitSignal_j_L0+0, 0
L__transmitSignal41:
	BTFSC      STATUS+0, 0
	GOTO       L_transmitSignal12
;transmitter.c,63 :: 		if(bitRead(signal,j)!=0){
	MOVF       FARG_transmitSignal_signal+0, 0
	MOVWF      FARG_bitRead_signal+0
	MOVF       FARG_transmitSignal_signal+1, 0
	MOVWF      FARG_bitRead_signal+1
	MOVF       transmitSignal_j_L0+0, 0
	MOVWF      FARG_bitRead_bitPosition+0
	MOVF       transmitSignal_j_L0+1, 0
	MOVWF      FARG_bitRead_bitPosition+1
	CALL       _bitRead+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__transmitSignal42
	MOVLW      0
	XORWF      R0+0, 0
L__transmitSignal42:
	BTFSC      STATUS+0, 2
	GOTO       L_transmitSignal14
;transmitter.c,64 :: 		PORTC.F0=1;
	BSF        PORTC+0, 0
;transmitter.c,65 :: 		}else{
	GOTO       L_transmitSignal15
L_transmitSignal14:
;transmitter.c,66 :: 		PORTC.F0=0;
	BCF        PORTC+0, 0
;transmitter.c,67 :: 		}
L_transmitSignal15:
;transmitter.c,68 :: 		delay500us();
	CALL       _delay500us+0
;transmitter.c,62 :: 		for(j=0; j<8; j++){
	INCF       transmitSignal_j_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       transmitSignal_j_L0+1, 1
;transmitter.c,69 :: 		}
	GOTO       L_transmitSignal11
L_transmitSignal12:
;transmitter.c,70 :: 		PORTC.F0=0;
	BCF        PORTC+0, 0
;transmitter.c,71 :: 		}
L_end_transmitSignal:
	RETURN
; end of _transmitSignal

_encodeSignal:

;transmitter.c,75 :: 		int encodeSignal(int rawSignal){
;transmitter.c,77 :: 		int encodedSignal=0x00;
	CLRF       encodeSignal_encodedSignal_L0+0
	CLRF       encodeSignal_encodedSignal_L0+1
;transmitter.c,78 :: 		for(i=0; i<4; i++){
	CLRF       R3+0
	CLRF       R3+1
L_encodeSignal16:
	MOVLW      128
	XORWF      R3+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__encodeSignal44
	MOVLW      4
	SUBWF      R3+0, 0
L__encodeSignal44:
	BTFSC      STATUS+0, 0
	GOTO       L_encodeSignal17
;transmitter.c,79 :: 		if((rawSignal&0x08)==0x08){
	MOVLW      8
	ANDWF      FARG_encodeSignal_rawSignal+0, 0
	MOVWF      R1+0
	MOVF       FARG_encodeSignal_rawSignal+1, 0
	MOVWF      R1+1
	MOVLW      0
	ANDWF      R1+1, 1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__encodeSignal45
	MOVLW      8
	XORWF      R1+0, 0
L__encodeSignal45:
	BTFSS      STATUS+0, 2
	GOTO       L_encodeSignal19
;transmitter.c,80 :: 		encodedSignal^=0x02;
	MOVLW      2
	XORWF      encodeSignal_encodedSignal_L0+0, 1
	MOVLW      0
	XORWF      encodeSignal_encodedSignal_L0+1, 1
;transmitter.c,81 :: 		encodedSignal<<=2;
	RLF        encodeSignal_encodedSignal_L0+0, 1
	RLF        encodeSignal_encodedSignal_L0+1, 1
	BCF        encodeSignal_encodedSignal_L0+0, 0
	RLF        encodeSignal_encodedSignal_L0+0, 1
	RLF        encodeSignal_encodedSignal_L0+1, 1
	BCF        encodeSignal_encodedSignal_L0+0, 0
;transmitter.c,82 :: 		}else{
	GOTO       L_encodeSignal20
L_encodeSignal19:
;transmitter.c,83 :: 		encodedSignal^=0x01;
	MOVLW      1
	XORWF      encodeSignal_encodedSignal_L0+0, 1
	MOVLW      0
	XORWF      encodeSignal_encodedSignal_L0+1, 1
;transmitter.c,84 :: 		encodedSignal<<=2;
	RLF        encodeSignal_encodedSignal_L0+0, 1
	RLF        encodeSignal_encodedSignal_L0+1, 1
	BCF        encodeSignal_encodedSignal_L0+0, 0
	RLF        encodeSignal_encodedSignal_L0+0, 1
	RLF        encodeSignal_encodedSignal_L0+1, 1
	BCF        encodeSignal_encodedSignal_L0+0, 0
;transmitter.c,85 :: 		}
L_encodeSignal20:
;transmitter.c,87 :: 		rawSignal=rawSignal<<1;
	RLF        FARG_encodeSignal_rawSignal+0, 1
	RLF        FARG_encodeSignal_rawSignal+1, 1
	BCF        FARG_encodeSignal_rawSignal+0, 0
;transmitter.c,78 :: 		for(i=0; i<4; i++){
	INCF       R3+0, 1
	BTFSC      STATUS+0, 2
	INCF       R3+1, 1
;transmitter.c,88 :: 		}
	GOTO       L_encodeSignal16
L_encodeSignal17:
;transmitter.c,89 :: 		return encodedSignal>>2;
	MOVF       encodeSignal_encodedSignal_L0+0, 0
	MOVWF      R0+0
	MOVF       encodeSignal_encodedSignal_L0+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
;transmitter.c,90 :: 		}
L_end_encodeSignal:
	RETURN
; end of _encodeSignal

_main:

;transmitter.c,94 :: 		void main() {
;transmitter.c,95 :: 		TRISB=0xff;
	MOVLW      255
	MOVWF      TRISB+0
;transmitter.c,96 :: 		TRISC=0;
	CLRF       TRISC+0
;transmitter.c,97 :: 		PORTC=0x00;
	CLRF       PORTC+0
;transmitter.c,98 :: 		while(1){
L_main21:
;transmitter.c,99 :: 		if(PORTB.F0==1){
	BTFSS      PORTB+0, 0
	GOTO       L_main23
;transmitter.c,100 :: 		transmitSignal(encodeSignal(0));
	CLRF       FARG_encodeSignal_rawSignal+0
	CLRF       FARG_encodeSignal_rawSignal+1
	CALL       _encodeSignal+0
	MOVF       R0+0, 0
	MOVWF      FARG_transmitSignal_signal+0
	MOVF       R0+1, 0
	MOVWF      FARG_transmitSignal_signal+1
	CALL       _transmitSignal+0
;transmitter.c,101 :: 		}
L_main23:
;transmitter.c,103 :: 		if(PORTB.F1==1){
	BTFSS      PORTB+0, 1
	GOTO       L_main24
;transmitter.c,105 :: 		transmitSignal(encodeSignal(1));
	MOVLW      1
	MOVWF      FARG_encodeSignal_rawSignal+0
	MOVLW      0
	MOVWF      FARG_encodeSignal_rawSignal+1
	CALL       _encodeSignal+0
	MOVF       R0+0, 0
	MOVWF      FARG_transmitSignal_signal+0
	MOVF       R0+1, 0
	MOVWF      FARG_transmitSignal_signal+1
	CALL       _transmitSignal+0
;transmitter.c,106 :: 		}
L_main24:
;transmitter.c,108 :: 		if(PORTB.F2==1){
	BTFSS      PORTB+0, 2
	GOTO       L_main25
;transmitter.c,109 :: 		transmitSignal(encodeSignal(2));
	MOVLW      2
	MOVWF      FARG_encodeSignal_rawSignal+0
	MOVLW      0
	MOVWF      FARG_encodeSignal_rawSignal+1
	CALL       _encodeSignal+0
	MOVF       R0+0, 0
	MOVWF      FARG_transmitSignal_signal+0
	MOVF       R0+1, 0
	MOVWF      FARG_transmitSignal_signal+1
	CALL       _transmitSignal+0
;transmitter.c,110 :: 		}
L_main25:
;transmitter.c,112 :: 		if(PORTB.F3==1){
	BTFSS      PORTB+0, 3
	GOTO       L_main26
;transmitter.c,113 :: 		transmitSignal(encodeSignal(3));
	MOVLW      3
	MOVWF      FARG_encodeSignal_rawSignal+0
	MOVLW      0
	MOVWF      FARG_encodeSignal_rawSignal+1
	CALL       _encodeSignal+0
	MOVF       R0+0, 0
	MOVWF      FARG_transmitSignal_signal+0
	MOVF       R0+1, 0
	MOVWF      FARG_transmitSignal_signal+1
	CALL       _transmitSignal+0
;transmitter.c,114 :: 		}
L_main26:
;transmitter.c,116 :: 		if(PORTB.F4==1){
	BTFSS      PORTB+0, 4
	GOTO       L_main27
;transmitter.c,117 :: 		transmitSignal(encodeSignal(4));
	MOVLW      4
	MOVWF      FARG_encodeSignal_rawSignal+0
	MOVLW      0
	MOVWF      FARG_encodeSignal_rawSignal+1
	CALL       _encodeSignal+0
	MOVF       R0+0, 0
	MOVWF      FARG_transmitSignal_signal+0
	MOVF       R0+1, 0
	MOVWF      FARG_transmitSignal_signal+1
	CALL       _transmitSignal+0
;transmitter.c,118 :: 		}
L_main27:
;transmitter.c,120 :: 		if(PORTB.F5==1){
	BTFSS      PORTB+0, 5
	GOTO       L_main28
;transmitter.c,121 :: 		transmitSignal(encodeSignal(5));
	MOVLW      5
	MOVWF      FARG_encodeSignal_rawSignal+0
	MOVLW      0
	MOVWF      FARG_encodeSignal_rawSignal+1
	CALL       _encodeSignal+0
	MOVF       R0+0, 0
	MOVWF      FARG_transmitSignal_signal+0
	MOVF       R0+1, 0
	MOVWF      FARG_transmitSignal_signal+1
	CALL       _transmitSignal+0
;transmitter.c,122 :: 		}
L_main28:
;transmitter.c,123 :: 		if(PORTB.F6==1){
	BTFSS      PORTB+0, 6
	GOTO       L_main29
;transmitter.c,124 :: 		transmitSignal(encodeSignal(6));
	MOVLW      6
	MOVWF      FARG_encodeSignal_rawSignal+0
	MOVLW      0
	MOVWF      FARG_encodeSignal_rawSignal+1
	CALL       _encodeSignal+0
	MOVF       R0+0, 0
	MOVWF      FARG_transmitSignal_signal+0
	MOVF       R0+1, 0
	MOVWF      FARG_transmitSignal_signal+1
	CALL       _transmitSignal+0
;transmitter.c,125 :: 		}
L_main29:
;transmitter.c,126 :: 		if(PORTB.F7==1){
	BTFSS      PORTB+0, 7
	GOTO       L_main30
;transmitter.c,127 :: 		transmitSignal(encodeSignal(7));
	MOVLW      7
	MOVWF      FARG_encodeSignal_rawSignal+0
	MOVLW      0
	MOVWF      FARG_encodeSignal_rawSignal+1
	CALL       _encodeSignal+0
	MOVF       R0+0, 0
	MOVWF      FARG_transmitSignal_signal+0
	MOVF       R0+1, 0
	MOVWF      FARG_transmitSignal_signal+1
	CALL       _transmitSignal+0
;transmitter.c,128 :: 		}
L_main30:
;transmitter.c,130 :: 		}
	GOTO       L_main21
;transmitter.c,132 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
