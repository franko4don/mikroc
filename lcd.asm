
_main:

;lcd.c,14 :: 		void main() {
;lcd.c,15 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;lcd.c,16 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd.c,17 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd.c,18 :: 		Lcd_Out(1,1,frank);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _frank+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lcd.c,19 :: 		Lcd_Out(2,1,frank);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _frank+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lcd.c,20 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;lcd.c,21 :: 		while(1){
L_main1:
;lcd.c,23 :: 		for(i=0; i<4; i++){
	CLRF       main_i_L1+0
	CLRF       main_i_L1+1
L_main3:
	MOVLW      128
	XORWF      main_i_L1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      4
	SUBWF      main_i_L1+0, 0
L__main8:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;lcd.c,24 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd.c,25 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;lcd.c,23 :: 		for(i=0; i<4; i++){
	INCF       main_i_L1+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L1+1, 1
;lcd.c,26 :: 		}
	GOTO       L_main3
L_main4:
;lcd.c,27 :: 		}
	GOTO       L_main1
;lcd.c,28 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
