#line 1 "C:/Users/FRANKCHUKY/Desktop/MikroC projects/water level controller.c"
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;

char projectname1[]="  WATER LEVEL ";
char projectname2[]="  CONTROLLER   ";
char design1[]="  DESIGNED BY ";
char design2[]="  ENYI ANTHONY";
char full[]="     IS 100%     ";
char threeq[]="     IS 75%     ";
char half[]="     IS 50%     ";
char low[]="     IS 25%      ";
char empty[]="  IS BELOW 25%  ";
char motor1[]="MOTOR ON";
char motor2[]="MOTOR OFF";

void initialize(){


}

void main() {
Lcd_Init();
Lcd_Cmd(_LCD_CURSOR_OFF);
CMCON=0X07;
TRISA=0;
TRISC=0X0F;
TRISD=0;
PORTD=0;
PORTC=0;
PORTA=0;
initialize();
Lcd_Out(1,2,projectname1);
Lcd_Out(2,2,projectname2);
delay_ms(2000);
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1,1,design1);
Lcd_Out(2,1,design2);
delay_ms(2000);

while(1){
if(PORTC==0x0F){
initialize();
PORTA=0x01;
Lcd_Out(1,2,projectname1);
Lcd_Out(2,1,full);
PORTD.F2=0;
}

if(PORTC==0x0E){
initialize();
PORTA=0x02;
Lcd_Out(1,2,projectname1);
Lcd_Out(2,1,threeq);
}

if(PORTC==0x0C){
initialize();
PORTA=0x04;
Lcd_Out(1,2,projectname1);
Lcd_Out(2,1,half);
}

if(PORTC==0x08){
initialize();
PORTA=0x08;
Lcd_Out(1,2,projectname1);
Lcd_Out(2,1,low);
PORTD.F2=1;
}

if(PORTC==0x00){
initialize();
PORTA=0x08;
Lcd_Out(1,2,projectname1);
Lcd_Out(2,1,empty);
PORTD.F2=1;
}

}
}
