
_show:

;temperature display.c,19 :: 		void show(){
;temperature display.c,20 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;temperature display.c,21 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;temperature display.c,22 :: 		Lcd_Out(1,3,temp);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperature display.c,23 :: 		}
L_end_show:
	RETURN
; end of _show

_main:

;temperature display.c,25 :: 		void main() {
;temperature display.c,26 :: 		PORTA.F0=1;
	BSF        PORTA+0, 0
;temperature display.c,27 :: 		ADCON1=0x80;
	MOVLW      128
	MOVWF      ADCON1+0
;temperature display.c,28 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;temperature display.c,29 :: 		show();
	CALL       _show+0
;temperature display.c,30 :: 		while(1) {
L_main0:
;temperature display.c,31 :: 		value=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
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
;temperature display.c,32 :: 		answer=(value*5)/1023;
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
;temperature display.c,33 :: 		answer*=100;
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
;temperature display.c,34 :: 		first=answer/10;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _first+0
	MOVF       R0+1, 0
	MOVWF      _first+1
;temperature display.c,35 :: 		second=(answer-(first*10));
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
;temperature display.c,37 :: 		Lcd_Chr(2,5,'0');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;temperature display.c,38 :: 		Lcd_Chr(2,6,pick[first]);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _first+0, 0
	ADDLW      _pick+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;temperature display.c,39 :: 		Lcd_Chr(2,7,pick[second]);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _second+0, 0
	ADDLW      _pick+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;temperature display.c,40 :: 		Lcd_Chr(2,8,' ');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;temperature display.c,41 :: 		Lcd_Chr(2,9,'"');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      34
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;temperature display.c,42 :: 		Lcd_Chr(2,10,'C');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      67
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;temperature display.c,44 :: 		}
	GOTO       L_main0
;temperature display.c,45 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
