#line 1 "C:/Users/FRANKCHUKY/Desktop/MikroC projects/receiver.c"
int good;
int counter;
int bitManipulate;
int encodedSignal=0;
int bitRead(int signal,int bitPosition){
 bitManipulate=0x01;
 bitManipulate<<=bitPosition;
 return (signal&bitManipulate);
}

void bitWrite(int position,int shifts){
shifts<<=position;
encodedSignal^=shifts;
}

void delay3ms(){
 counter=0;
 TMR0=0;
 OPTION_REG=0xd2;
 INTCON=0x00;
 TMR0IE_bit=1;
 TMR0IF_bit=0;
 while(1){
 if(TMR0IF_bit){
 counter++;
 TMR0IF_bit=0;
 }
 if(counter==93)break;
 }


}

void delay500us(){
 counter=0;
 TMR0=0;
 OPTION_REG=0xd2;
 INTCON=0x00;
 TMR0IE_bit=1;
 while(1){
 if(TMR0IF_bit){
 counter++;
 TMR0IF_bit=0;
 }
 if(counter==15)break;
 }


}

void delay725us(){
 counter=0;
 TMR0=0;
 OPTION_REG=0xd2;
 INTCON=0x00;
 TMR0IE_bit=1;
 while(1){
 if(TMR0IF_bit){
 counter++;
 TMR0IF_bit=0;
 }
 if(counter==23)break;
 }


}

void delay20us(){
 counter=0;
 TMR0=0;
 OPTION_REG=0xd2;
 INTCON=0x00;
 TMR0IE_bit=1;
 while(1){
 if(TMR0IF_bit){
 counter++;
 TMR0IF_bit=0;
 }
 if(counter==6)break;
 }


}

void reception(){
 int i;
 for(i=0; i<10; i++){
 delay20us();
 good=1;
 if(PORTB.F0==0){
 good=0;
 i=100;
 }
 }

 if(good==1){
 while(1){
 if(PORTB.F0==0){
 delay725us();
 for(i=0; i<8; i++){
 if(PORTB.F0==1){
 bitWrite(i,0x01);
 PORTB.F1=1;
 }else{
 bitWrite(i,0x00);
 PORTB.F1=0;
 }
 delay500us();
 }
 break;
 }
 }
 PORTC=encodedSignal;
 }

}

void main() {
 TRISB=0x01;
 TRISC=0;
 PORTC=0;
 PORTB=0;

 while(1){
 PORTB=0;
 if(PORTB.F0==1){
 encodedSignal=0;
 reception();
}
}
}
