
_initialize:

;water level controller.c,27 :: 		void initialize(){
;water level controller.c,30 :: 		}
L_end_initialize:
	RETURN
; end of _initialize

_main:

;water level controller.c,32 :: 		void main() {
;water level controller.c,33 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;water level controller.c,34 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;water level controller.c,35 :: 		CMCON=0X07;
	MOVLW      7
	MOVWF      CMCON+0
;water level controller.c,36 :: 		TRISA=0;
	CLRF       TRISA+0
;water level controller.c,37 :: 		TRISC=0X0F;
	MOVLW      15
	MOVWF      TRISC+0
;water level controller.c,38 :: 		TRISD=0;
	CLRF       TRISD+0
;water level controller.c,39 :: 		PORTD=0;
	CLRF       PORTD+0
;water level controller.c,40 :: 		PORTC=0;
	CLRF       PORTC+0
;water level controller.c,41 :: 		PORTA=0;
	CLRF       PORTA+0
;water level controller.c,42 :: 		initialize();
	CALL       _initialize+0
;water level controller.c,43 :: 		Lcd_Out(1,2,projectname1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _projectname1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;water level controller.c,44 :: 		Lcd_Out(2,2,projectname2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _projectname2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;water level controller.c,45 :: 		delay_ms(2000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;water level controller.c,46 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;water level controller.c,47 :: 		Lcd_Out(1,1,design1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _design1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;water level controller.c,48 :: 		Lcd_Out(2,1,design2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _design2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;water level controller.c,49 :: 		delay_ms(2000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
;water level controller.c,51 :: 		while(1){
L_main2:
;water level controller.c,52 :: 		if(PORTC==0x0F){
	MOVF       PORTC+0, 0
	XORLW      15
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;water level controller.c,53 :: 		initialize();
	CALL       _initialize+0
;water level controller.c,54 :: 		PORTA=0x01;
	MOVLW      1
	MOVWF      PORTA+0
;water level controller.c,55 :: 		Lcd_Out(1,2,projectname1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _projectname1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;water level controller.c,56 :: 		Lcd_Out(2,1,full);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _full+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;water level controller.c,57 :: 		PORTD.F2=0;
	BCF        PORTD+0, 2
;water level controller.c,58 :: 		}
L_main4:
;water level controller.c,60 :: 		if(PORTC==0x0E){
	MOVF       PORTC+0, 0
	XORLW      14
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;water level controller.c,61 :: 		initialize();
	CALL       _initialize+0
;water level controller.c,62 :: 		PORTA=0x02;
	MOVLW      2
	MOVWF      PORTA+0
;water level controller.c,63 :: 		Lcd_Out(1,2,projectname1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _projectname1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;water level controller.c,64 :: 		Lcd_Out(2,1,threeq);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _threeq+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;water level controller.c,65 :: 		}
L_main5:
;water level controller.c,67 :: 		if(PORTC==0x0C){
	MOVF       PORTC+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;water level controller.c,68 :: 		initialize();
	CALL       _initialize+0
;water level controller.c,69 :: 		PORTA=0x04;
	MOVLW      4
	MOVWF      PORTA+0
;water level controller.c,70 :: 		Lcd_Out(1,2,projectname1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _projectname1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;water level controller.c,71 :: 		Lcd_Out(2,1,half);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _half+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;water level controller.c,72 :: 		}
L_main6:
;water level controller.c,74 :: 		if(PORTC==0x08){
	MOVF       PORTC+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;water level controller.c,75 :: 		initialize();
	CALL       _initialize+0
;water level controller.c,76 :: 		PORTA=0x08;
	MOVLW      8
	MOVWF      PORTA+0
;water level controller.c,77 :: 		Lcd_Out(1,2,projectname1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _projectname1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;water level controller.c,78 :: 		Lcd_Out(2,1,low);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _low+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;water level controller.c,79 :: 		PORTD.F2=1;
	BSF        PORTD+0, 2
;water level controller.c,80 :: 		}
L_main7:
;water level controller.c,82 :: 		if(PORTC==0x00){
	MOVF       PORTC+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;water level controller.c,83 :: 		initialize();
	CALL       _initialize+0
;water level controller.c,84 :: 		PORTA=0x08;
	MOVLW      8
	MOVWF      PORTA+0
;water level controller.c,85 :: 		Lcd_Out(1,2,projectname1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _projectname1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;water level controller.c,86 :: 		Lcd_Out(2,1,empty);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _empty+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;water level controller.c,87 :: 		PORTD.F2=1;
	BSF        PORTD+0, 2
;water level controller.c,88 :: 		}
L_main8:
;water level controller.c,90 :: 		}
	GOTO       L_main2
;water level controller.c,91 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
