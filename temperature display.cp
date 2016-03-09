#line 1 "C:/Users/FRANKCHUKY/Desktop/MikroC projects/temperature display.c"
sbit LCD_D7 at RB3_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D7_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB0_bit;
char temp[]="TEMPERATURE";
char pick[]={'0','1','2','3','4','5','6','7','8','9'};
float value;
float answer;
int first;
int second,third;
void show(){
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,3,temp);
}

void main() {
PORTA.F0=1;
 ADCON1=0x80;
 Lcd_Init();
 show();
 while(1) {
 value=ADC_Read(0);
 answer=(value*5)/1023;
 answer*=100;
 first=answer/10;
 second=(answer-(first*10));

 Lcd_Chr(2,5,'0');
 Lcd_Chr(2,6,pick[first]);
 Lcd_Chr(2,7,pick[second]);
 Lcd_Chr(2,8,' ');
 Lcd_Chr(2,9,'"');
 Lcd_Chr(2,10,'C');

 }
}
