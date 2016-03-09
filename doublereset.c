int check=0;
void main() {
TRISB=0;
TRISC=0xff;
PORTB=0x00;
//PORTB.F1=1;
while(1){
 if(PORTC.F0==0){
 if(check==0){
 PORTB.F0=1;
 delay_ms(2000);
 check++;
 }else{
 PORTB.F1=1;
 check=0;
  delay_ms(200);
  PORTB.F1=0;
  delay_ms(200);
 }
 }
 }
}