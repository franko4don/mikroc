
_delay:

;lift.c,24 :: 		void delay(){
;lift.c,25 :: 		int counter=0;
	CLRF       delay_counter_L0+0
	CLRF       delay_counter_L0+1
;lift.c,26 :: 		TMR0=0;
	CLRF       TMR0+0
;lift.c,27 :: 		OPTION_REG=0x57;
	MOVLW      87
	MOVWF      OPTION_REG+0
;lift.c,28 :: 		INTCON=0x00;
	CLRF       INTCON+0
;lift.c,29 :: 		TMR0IE_bit=1;
	BSF        TMR0IE_bit+0, 5
;lift.c,30 :: 		while(1){
L_delay0:
;lift.c,31 :: 		if(TMR0IF_bit){
	BTFSS      TMR0IF_bit+0, 2
	GOTO       L_delay2
;lift.c,32 :: 		counter++;
	INCF       delay_counter_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       delay_counter_L0+1, 1
;lift.c,33 :: 		TMR0IF_bit=0;
	BCF        TMR0IF_bit+0, 2
;lift.c,34 :: 		}
L_delay2:
;lift.c,35 :: 		if(counter==45)break;
	MOVLW      0
	XORWF      delay_counter_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay37
	MOVLW      45
	XORWF      delay_counter_L0+0, 0
L__delay37:
	BTFSS      STATUS+0, 2
	GOTO       L_delay3
	GOTO       L_delay1
L_delay3:
;lift.c,36 :: 		}
	GOTO       L_delay0
L_delay1:
;lift.c,39 :: 		}
L_end_delay:
	RETURN
; end of _delay

_tempDisplay:

;lift.c,41 :: 		void tempDisplay(){
;lift.c,42 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lift.c,43 :: 		Lcd_Out(1,3,frank1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _frank1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lift.c,44 :: 		Lcd_Out(2,6,frank2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _frank2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lift.c,45 :: 		}
L_end_tempDisplay:
	RETURN
; end of _tempDisplay

_lcd_Initialize:

;lift.c,47 :: 		void lcd_Initialize(){
;lift.c,48 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;lift.c,49 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lift.c,50 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lift.c,51 :: 		}
L_end_lcd_Initialize:
	RETURN
; end of _lcd_Initialize

_main:

;lift.c,55 :: 		void main() {
;lift.c,56 :: 		TRISC=0x0f0;
	MOVLW      240
	MOVWF      TRISC+0
;lift.c,57 :: 		TRISB.F0=1;
	BSF        TRISB+0, 0
;lift.c,58 :: 		TRISB.F1=1;
	BSF        TRISB+0, 1
;lift.c,59 :: 		TRISB.F2=1;
	BSF        TRISB+0, 2
;lift.c,60 :: 		TRISB.F3=1;
	BSF        TRISB+0, 3
;lift.c,61 :: 		TRISB.F4=1;
	BSF        TRISB+0, 4
;lift.c,62 :: 		TRISC.F0=0;
	BCF        TRISC+0, 0
;lift.c,63 :: 		TRISC.F1=0;
	BCF        TRISC+0, 1
;lift.c,64 :: 		TRISC.F2=0;
	BCF        TRISC+0, 2
;lift.c,65 :: 		TRISC.F3=0;
	BCF        TRISC+0, 3
;lift.c,66 :: 		TRISD.F2=0;
	BCF        TRISD+0, 2
;lift.c,67 :: 		TRISD.F3=0;
	BCF        TRISD+0, 3
;lift.c,68 :: 		PORTB=0;
	CLRF       PORTB+0
;lift.c,69 :: 		PORTC=0;
	CLRF       PORTC+0
;lift.c,70 :: 		PORTD=0;
	CLRF       PORTD+0
;lift.c,71 :: 		lcd_Initialize();
	CALL       _lcd_Initialize+0
;lift.c,72 :: 		tempDisplay();
	CALL       _tempDisplay+0
;lift.c,73 :: 		ADCON1=0X80;
	MOVLW      128
	MOVWF      ADCON1+0
;lift.c,75 :: 		while(1){
L_main4:
;lift.c,76 :: 		v= Adc_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       R0+0, 0
	MOVWF      _v+0
	MOVF       R0+1, 0
	MOVWF      _v+1
	MOVF       R0+2, 0
	MOVWF      _v+2
	MOVF       R0+3, 0
	MOVWF      _v+3
;lift.c,77 :: 		answer=  (v*5)/1023;
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
;lift.c,78 :: 		if(PORTB.F0==0&&answer>=2.5){
	BTFSC      PORTB+0, 0
	GOTO       L_main8
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	MOVF       _answer+0, 0
	MOVWF      R0+0
	MOVF       _answer+1, 0
	MOVWF      R0+1
	MOVF       _answer+2, 0
	MOVWF      R0+2
	MOVF       _answer+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main8
L__main35:
;lift.c,79 :: 		store[0]=1;
	MOVLW      1
	MOVWF      _store+0
	MOVLW      0
	MOVWF      _store+1
;lift.c,81 :: 		lcd_Initialize();
	CALL       _lcd_Initialize+0
;lift.c,82 :: 		Lcd_Out(1,1,first);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _first+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lift.c,83 :: 		Lcd_Out(2,1,select);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _select+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lift.c,84 :: 		delay_ms(1000);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;lift.c,85 :: 		lcd_Initialize();
	CALL       _lcd_Initialize+0
;lift.c,86 :: 		tempDisplay();
	CALL       _tempDisplay+0
;lift.c,87 :: 		}
L_main8:
;lift.c,89 :: 		if(PORTB.F1==0&&answer>=2.5){
	BTFSC      PORTB+0, 1
	GOTO       L_main12
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	MOVF       _answer+0, 0
	MOVWF      R0+0
	MOVF       _answer+1, 0
	MOVWF      R0+1
	MOVF       _answer+2, 0
	MOVWF      R0+2
	MOVF       _answer+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main12
L__main34:
;lift.c,90 :: 		store[1]=1;
	MOVLW      1
	MOVWF      _store+2
	MOVLW      0
	MOVWF      _store+3
;lift.c,92 :: 		lcd_Initialize();
	CALL       _lcd_Initialize+0
;lift.c,93 :: 		Lcd_Out(1,1,second);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _second+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lift.c,94 :: 		Lcd_Out(2,1,select);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _select+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lift.c,95 :: 		delay_ms(1000);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
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
;lift.c,96 :: 		lcd_Initialize();
	CALL       _lcd_Initialize+0
;lift.c,97 :: 		tempDisplay();
	CALL       _tempDisplay+0
;lift.c,98 :: 		}
L_main12:
;lift.c,100 :: 		if(PORTB.F2==0&&answer>=2.5){
	BTFSC      PORTB+0, 2
	GOTO       L_main16
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	MOVF       _answer+0, 0
	MOVWF      R0+0
	MOVF       _answer+1, 0
	MOVWF      R0+1
	MOVF       _answer+2, 0
	MOVWF      R0+2
	MOVF       _answer+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main16
L__main33:
;lift.c,101 :: 		store[2]=1;
	MOVLW      1
	MOVWF      _store+4
	MOVLW      0
	MOVWF      _store+5
;lift.c,103 :: 		lcd_Initialize();
	CALL       _lcd_Initialize+0
;lift.c,104 :: 		Lcd_Out(1,1,third);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _third+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lift.c,105 :: 		Lcd_Out(2,1,select);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _select+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lift.c,106 :: 		delay_ms(1000);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	DECFSZ     R11+0, 1
	GOTO       L_main17
	NOP
	NOP
;lift.c,107 :: 		lcd_Initialize();
	CALL       _lcd_Initialize+0
;lift.c,108 :: 		tempDisplay();
	CALL       _tempDisplay+0
;lift.c,109 :: 		}
L_main16:
;lift.c,111 :: 		if(PORTB.F3==0&&answer>=2.5){
	BTFSC      PORTB+0, 3
	GOTO       L_main20
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	MOVF       _answer+0, 0
	MOVWF      R0+0
	MOVF       _answer+1, 0
	MOVWF      R0+1
	MOVF       _answer+2, 0
	MOVWF      R0+2
	MOVF       _answer+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main20
L__main32:
;lift.c,112 :: 		store[3]=1;
	MOVLW      1
	MOVWF      _store+6
	MOVLW      0
	MOVWF      _store+7
;lift.c,114 :: 		lcd_Initialize();
	CALL       _lcd_Initialize+0
;lift.c,115 :: 		Lcd_Out(1,1,fourth);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _fourth+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lift.c,116 :: 		Lcd_Out(2,1,select);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _select+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lift.c,117 :: 		delay_ms(1000);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	DECFSZ     R11+0, 1
	GOTO       L_main21
	NOP
	NOP
;lift.c,118 :: 		lcd_Initialize();
	CALL       _lcd_Initialize+0
;lift.c,119 :: 		tempDisplay();
	CALL       _tempDisplay+0
;lift.c,120 :: 		}
L_main20:
;lift.c,122 :: 		if(PORTB.F4==0){
	BTFSC      PORTB+0, 4
	GOTO       L_main22
;lift.c,123 :: 		delay();
	CALL       _delay+0
;lift.c,124 :: 		delay();
	CALL       _delay+0
;lift.c,125 :: 		delay();
	CALL       _delay+0
;lift.c,126 :: 		PORTD.F2=1;
	BSF        PORTD+0, 2
;lift.c,128 :: 		if(store[0]==1){
	MOVLW      0
	XORWF      _store+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main41
	MOVLW      1
	XORWF      _store+0, 0
L__main41:
	BTFSS      STATUS+0, 2
	GOTO       L_main23
;lift.c,130 :: 		lcd_Initialize();
	CALL       _lcd_Initialize+0
;lift.c,131 :: 		Lcd_Out(1,1,moving);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _moving+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lift.c,132 :: 		delay();
	CALL       _delay+0
;lift.c,133 :: 		lcd_Initialize();
	CALL       _lcd_Initialize+0
;lift.c,134 :: 		Lcd_Out(1,1,first);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _first+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lift.c,135 :: 		PORTC.F0=1;
	BSF        PORTC+0, 0
;lift.c,136 :: 		delay();
	CALL       _delay+0
;lift.c,137 :: 		delay();
	CALL       _delay+0
;lift.c,138 :: 		PORTC.F0=0;
	BCF        PORTC+0, 0
;lift.c,139 :: 		}
L_main23:
;lift.c,140 :: 		delay();
	CALL       _delay+0
;lift.c,141 :: 		if(store[1]==1){
	MOVLW      0
	XORWF      _store+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main42
	MOVLW      1
	XORWF      _store+2, 0
L__main42:
	BTFSS      STATUS+0, 2
	GOTO       L_main24
;lift.c,143 :: 		lcd_Initialize();
	CALL       _lcd_Initialize+0
;lift.c,144 :: 		Lcd_Out(1,1,moving);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _moving+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lift.c,145 :: 		delay();
	CALL       _delay+0
;lift.c,146 :: 		lcd_Initialize();
	CALL       _lcd_Initialize+0
;lift.c,147 :: 		Lcd_Out(1,1,second);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _second+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lift.c,148 :: 		PORTC.F1=1;
	BSF        PORTC+0, 1
;lift.c,149 :: 		delay();
	CALL       _delay+0
;lift.c,150 :: 		delay();
	CALL       _delay+0
;lift.c,151 :: 		PORTC.F1=0;
	BCF        PORTC+0, 1
;lift.c,152 :: 		}
L_main24:
;lift.c,153 :: 		delay();
	CALL       _delay+0
;lift.c,154 :: 		if(store[2]==1){
	MOVLW      0
	XORWF      _store+5, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main43
	MOVLW      1
	XORWF      _store+4, 0
L__main43:
	BTFSS      STATUS+0, 2
	GOTO       L_main25
;lift.c,156 :: 		lcd_Initialize();
	CALL       _lcd_Initialize+0
;lift.c,157 :: 		Lcd_Out(1,1,moving);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _moving+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lift.c,158 :: 		delay();
	CALL       _delay+0
;lift.c,159 :: 		lcd_Initialize();
	CALL       _lcd_Initialize+0
;lift.c,160 :: 		Lcd_Out(1,1,third);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _third+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lift.c,161 :: 		PORTC.F2=1;
	BSF        PORTC+0, 2
;lift.c,162 :: 		delay();
	CALL       _delay+0
;lift.c,163 :: 		delay();
	CALL       _delay+0
;lift.c,164 :: 		PORTC.F2=0;
	BCF        PORTC+0, 2
;lift.c,165 :: 		}
L_main25:
;lift.c,166 :: 		delay();
	CALL       _delay+0
;lift.c,167 :: 		if(store[3]==1){
	MOVLW      0
	XORWF      _store+7, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main44
	MOVLW      1
	XORWF      _store+6, 0
L__main44:
	BTFSS      STATUS+0, 2
	GOTO       L_main26
;lift.c,168 :: 		lcd_Initialize();
	CALL       _lcd_Initialize+0
;lift.c,169 :: 		Lcd_Out(1,1,moving);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _moving+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lift.c,170 :: 		delay();
	CALL       _delay+0
;lift.c,171 :: 		lcd_Initialize();
	CALL       _lcd_Initialize+0
;lift.c,172 :: 		Lcd_Out(1,1,fourth);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _fourth+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lift.c,173 :: 		PORTC.F3=1;
	BSF        PORTC+0, 3
;lift.c,174 :: 		delay();
	CALL       _delay+0
;lift.c,175 :: 		delay();
	CALL       _delay+0
;lift.c,176 :: 		PORTC.F3=0;
	BCF        PORTC+0, 3
;lift.c,177 :: 		}
L_main26:
;lift.c,178 :: 		delay();
	CALL       _delay+0
;lift.c,179 :: 		if(store[0]==0&&store[1]==0&&store[2]==0&&store[3]==0){
	MOVLW      0
	XORWF      _store+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main45
	MOVLW      0
	XORWF      _store+0, 0
L__main45:
	BTFSS      STATUS+0, 2
	GOTO       L_main29
	MOVLW      0
	XORWF      _store+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main46
	MOVLW      0
	XORWF      _store+2, 0
L__main46:
	BTFSS      STATUS+0, 2
	GOTO       L_main29
	MOVLW      0
	XORWF      _store+5, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main47
	MOVLW      0
	XORWF      _store+4, 0
L__main47:
	BTFSS      STATUS+0, 2
	GOTO       L_main29
	MOVLW      0
	XORWF      _store+7, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main48
	MOVLW      0
	XORWF      _store+6, 0
L__main48:
	BTFSS      STATUS+0, 2
	GOTO       L_main29
L__main31:
;lift.c,180 :: 		PORTC=0;
	CLRF       PORTC+0
;lift.c,181 :: 		store[0]=0;
	CLRF       _store+0
	CLRF       _store+1
;lift.c,182 :: 		store[1]=0;
	CLRF       _store+2
	CLRF       _store+3
;lift.c,183 :: 		store[2]=0;
	CLRF       _store+4
	CLRF       _store+5
;lift.c,184 :: 		store[3]=0;
	CLRF       _store+6
	CLRF       _store+7
;lift.c,185 :: 		PORTD.F2=0;
	BCF        PORTD+0, 2
;lift.c,186 :: 		tempDisplay();
	CALL       _tempDisplay+0
;lift.c,187 :: 		}else{
	GOTO       L_main30
L_main29:
;lift.c,188 :: 		PORTC=0;
	CLRF       PORTC+0
;lift.c,189 :: 		store[0]=0;
	CLRF       _store+0
	CLRF       _store+1
;lift.c,190 :: 		store[1]=0;
	CLRF       _store+2
	CLRF       _store+3
;lift.c,191 :: 		store[2]=0;
	CLRF       _store+4
	CLRF       _store+5
;lift.c,192 :: 		store[3]=0;
	CLRF       _store+6
	CLRF       _store+7
;lift.c,193 :: 		tempDisplay();
	CALL       _tempDisplay+0
;lift.c,194 :: 		delay();
	CALL       _delay+0
;lift.c,195 :: 		delay();
	CALL       _delay+0
;lift.c,196 :: 		PORTD.F2=0;
	BCF        PORTD+0, 2
;lift.c,197 :: 		PORTD.F3=1;
	BSF        PORTD+0, 3
;lift.c,198 :: 		delay();
	CALL       _delay+0
;lift.c,199 :: 		delay();
	CALL       _delay+0
;lift.c,200 :: 		delay();
	CALL       _delay+0
;lift.c,201 :: 		PORTD.F3=0;
	BCF        PORTD+0, 3
;lift.c,202 :: 		}
L_main30:
;lift.c,205 :: 		}
L_main22:
;lift.c,208 :: 		}
	GOTO       L_main4
;lift.c,209 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
