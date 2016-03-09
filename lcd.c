sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D7 at RB2_bit;
sbit LCD_D6 at RB3_bit;
sbit LCD_D5 at RB4_bit;
sbit LCD_D4 at RB5_bit;
sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D7_Direction at TRISB2_bit;
sbit LCD_D6_Direction at TRISB3_bit;
sbit LCD_D5_Direction at TRISB4_bit;
sbit LCD_D4_Direction at TRISB5_bit;
char frank[]="chuky";
void main() {
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,frank);
  Lcd_Out(2,1,frank);
 delay_ms(2000);
 while(1){
 int i;
 for(i=0; i<4; i++){
 Lcd_Cmd(_LCD_SHIFT_RIGHT);
 delay_ms(500);
 }
 }
}