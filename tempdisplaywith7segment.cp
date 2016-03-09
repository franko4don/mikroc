#line 1 "C:/Users/FRANKCHUKY/Desktop/MikroC projects/tempdisplaywith7segment.c"
 int lookup[]={0xc0,0xf9,0x0a4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};
float value;
float answer;
int first,second,third;
int seg1,seg2,seg3,seg4;
void seven(){
 int i;
 for(i=0; i<250; i++){
PORTB=seg3;
PORTD.F3=1;
delay_ms(1);
PORTD.F3=0;

PORTB=seg4;
PORTD.F0=1;
delay_ms(1);
PORTD.F0=0;

PORTB=seg2;
PORTC.F1=1;
delay_ms(1);
PORTC.F1=0;

PORTB=seg1;
PORTD.F2=1;
delay_ms(1);
PORTD.F2=0;

 }
}

void main() {

TRISB=0;
ADCON1=0x80;
TRISC=0;
TRISD=0;
PORTC=0;
PORTD=0;
seg1=lookup[0];
seg2=lookup[0];
seg3=lookup[0];
seg4=0xC6;
seven();
ADC_Init();
while(1){
 value=ADC_Read(1);
 answer=(value*5)/1023;

 answer*=100;
 if((int)answer>43){
 PORTD.F4=0;
 }else{
 PORTD.F4=1;
 }
 first=answer/10;
 second=(answer-(first*10));
 seg1=lookup[first];
 seg2=lookup[second];
 seven();
}
}
