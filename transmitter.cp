#line 1 "C:/Users/FRANKCHUKY/Desktop/MikroC projects/transmitter.c"
int rawValues[10]={0,1,2,3,4,5,6,7,8,9};
int counter;
int bitManipulate;
int bitRead(int signal,int bitPosition){
 bitManipulate=0x01;
 bitManipulate<<=bitPosition;
 return (signal&bitManipulate);
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

void preamble(){
 int i;
 for(i=0; i<20; i++){
 PORTC.F0=1;
 delay500us();
 PORTC.F0=0;
 delay500us();
 }
}

void transmitSignal(int signal){
 int j;
 preamble();
 PORTC.F0=1;
 delay3ms();
 PORTC.F0=0;
 delay500us();
 for(j=0; j<8; j++){
 if(bitRead(signal,j)!=0){
 PORTC.F0=1;
 }else{
 PORTC.F0=0;
 }
 delay500us();
 }
 PORTC.F0=0;
}



int encodeSignal(int rawSignal){
int i;
int encodedSignal=0x00;
 for(i=0; i<4; i++){
 if((rawSignal&0x08)==0x08){
 encodedSignal^=0x02;
 encodedSignal<<=2;
 }else{
 encodedSignal^=0x01;
 encodedSignal<<=2;
 }

 rawSignal=rawSignal<<1;
 }
return encodedSignal>>2;
}



void main() {
 TRISB=0xff;
 TRISC=0;
 PORTC=0x00;
 while(1){
 if(PORTB.F0==1){
 transmitSignal(encodeSignal(0));
 }

 if(PORTB.F1==1){

 transmitSignal(encodeSignal(1));
 }

 if(PORTB.F2==1){
 transmitSignal(encodeSignal(2));
 }

 if(PORTB.F3==1){
 transmitSignal(encodeSignal(3));
 }

 if(PORTB.F4==1){
 transmitSignal(encodeSignal(4));
 }

 if(PORTB.F5==1){
 transmitSignal(encodeSignal(5));
 }
 if(PORTB.F6==1){
 transmitSignal(encodeSignal(6));
 }
 if(PORTB.F7==1){
 transmitSignal(encodeSignal(7));
 }

 }

}
