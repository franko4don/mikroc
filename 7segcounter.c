 float value;
 int lookup[]={0xc0,0xf9,0x0a4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};
 int first=0;
 int second=0;
  int i=0;
  int j=0;

 void segment(){
 if(i>9){
 i=0;
 j++;
 }

 if(j>=9){
 j=-1;
 }
 first=lookup[i];
 second=lookup[j];
 PORTB=second;
 PORTA.F1=0;
 PORTA.F2=1;
 delay_ms(2);
 PORTA.F2=0;
 PORTB=first;
 PORTA.F1=1;
 delay_ms(2);
 PORTA.F1=0;
 }

  void debounce(){
 while(1){
  segment();
  if(PORTA.F0==1)break;
 }
 }

void main() {

TRISA=0b00000001;
TRISB=0;
first=lookup[0];
second=lookup[0] ;
 while(1){
 segment();
 if(PORTA.F0==0){
 debounce();
 i++;
 if(i>=5){

 PORTA.F3=1;}
 second=lookup[j];
 }

 }
}