int store[]={0,0,0,0};
char temp[15];
float v,answer;
sbit LCD_RS at RD0_bit;
sbit LCD_EN at RD1_bit;
sbit LCD_D7 at RC7_bit;
sbit LCD_D6 at RC6_bit;
sbit LCD_D5 at RC5_bit;
sbit LCD_D4 at RC4_bit;
sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_EN_Direction at TRISD1_bit;
sbit LCD_D7_Direction at TRISC7_bit;
sbit LCD_D6_Direction at TRISC6_bit;
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D4_Direction at TRISC4_bit;
char frank1[] ="ENTER FLOOR";
char frank2[] ="NUMBER";
char first[] ="FIRST FLOOR";
char moving[] ="GOING UP";
char second[] ="SECOND FLOOR";
char third[] ="THIRD FLOOR";
char fourth[] ="FOURTH FLOOR";
char select[]= "SELECTED"  ;
 void delay(){
int counter=0;
      TMR0=0;
     OPTION_REG=0x57;
     INTCON=0x00;
     TMR0IE_bit=1;
     while(1){
       if(TMR0IF_bit){
           counter++;
           TMR0IF_bit=0;
       }
       if(counter==45)break;
     }


}

void tempDisplay(){
 Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(1,3,frank1);
 Lcd_Out(2,6,frank2);
}

void lcd_Initialize(){
  Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
}



void main() {
 TRISC=0x0f0;
 TRISB.F0=1;
 TRISB.F1=1;
 TRISB.F2=1;
 TRISB.F3=1;
 TRISB.F4=1;
 TRISC.F0=0;
 TRISC.F1=0;
 TRISC.F2=0;
 TRISC.F3=0;
 TRISD.F2=0;
  TRISD.F3=0;
 PORTB=0;
 PORTC=0;
 PORTD=0;
 lcd_Initialize();
 tempDisplay();
  ADCON1=0X80;

 while(1){
        v= Adc_Read(1);
       answer=  (v*5)/1023;
if(PORTB.F0==0&&answer>=2.5){
 store[0]=1;
 //PORTC.F3=1;
  lcd_Initialize();
  Lcd_Out(1,1,first);
  Lcd_Out(2,1,select);
  delay_ms(1000);
  lcd_Initialize();
   tempDisplay();
}

if(PORTB.F1==0&&answer>=2.5){
 store[1]=1;
// PORTC.F2=1;
  lcd_Initialize();
  Lcd_Out(1,1,second);
  Lcd_Out(2,1,select);
  delay_ms(1000);
  lcd_Initialize();
   tempDisplay();
}

if(PORTB.F2==0&&answer>=2.5){
 store[2]=1;
 //PORTC.F1=1;
   lcd_Initialize();
  Lcd_Out(1,1,third);
  Lcd_Out(2,1,select);
  delay_ms(1000);
  lcd_Initialize();
   tempDisplay();
}

if(PORTB.F3==0&&answer>=2.5){
 store[3]=1;
 //PORTC.F0=1;
   lcd_Initialize();
  Lcd_Out(1,1,fourth);
  Lcd_Out(2,1,select);
  delay_ms(1000);
  lcd_Initialize();
   tempDisplay();
}

if(PORTB.F4==0){
delay();
delay();
delay();
 PORTD.F2=1;

  if(store[0]==1){

  lcd_Initialize();
  Lcd_Out(1,1,moving);
  delay();
  lcd_Initialize();
  Lcd_Out(1,1,first);
  PORTC.F0=1;
   delay();
   delay();
     PORTC.F0=0;
  }
    delay();
   if(store[1]==1){

  lcd_Initialize();
  Lcd_Out(1,1,moving);
  delay();
  lcd_Initialize();
  Lcd_Out(1,1,second);
  PORTC.F1=1;
  delay();
  delay();
    PORTC.F1=0;
  }
   delay();
   if(store[2]==1){

  lcd_Initialize();
  Lcd_Out(1,1,moving);
  delay();
  lcd_Initialize();
  Lcd_Out(1,1,third);
  PORTC.F2=1;
  delay();
  delay();
    PORTC.F2=0;
  }
   delay();
   if(store[3]==1){
  lcd_Initialize();
  Lcd_Out(1,1,moving);
  delay();
  lcd_Initialize();
  Lcd_Out(1,1,fourth);
       PORTC.F3=1;
  delay();
  delay();
    PORTC.F3=0;
  }
  delay();
    if(store[0]==0&&store[1]==0&&store[2]==0&&store[3]==0){
             PORTC=0;
   store[0]=0;
   store[1]=0;
   store[2]=0;
   store[3]=0;
   PORTD.F2=0;
   tempDisplay();
    }else{
        PORTC=0;
   store[0]=0;
   store[1]=0;
   store[2]=0;
   store[3]=0;
   tempDisplay();
      delay();
   delay();
   PORTD.F2=0;
   PORTD.F3=1;
   delay();
   delay();
   delay();
   PORTD.F3=0;
    }
  

}


 }
}