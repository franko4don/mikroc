void main() {
TRISC=0;
TRISB=0;
PORTC=0;
PORTB=0;
while(1){
PORTC=0xff;
delay_ms(2000);
PORTC=0;
delay_ms(2000);
}
}