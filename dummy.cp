#line 1 "C:/Users/FRANKCHUKY/Desktop/MikroC projects/dummy.c"
 int lookup[]={0xc0,0xf9,0x0a4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};



void main() {
TRISA.F0=1;
TRISB=0;
ADCON1=0x80;
TRISC=0;
TRISD=0;
PORTC=0;
PORTD=0;
while(1){
 int i;
 for(i=0; i<9; i++){
 PORTB=lookup[i];
 PORTD.F0=1;
 delay_ms(2000);
 }
}
}
