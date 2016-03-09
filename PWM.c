unsigned int counter;
float ontime1=0;
float offtime1=0;
int  count=39;
float onrate=0;
float offrate=0;
int  ontime,offtime;

void delay20ms(){
     offtime=offtime1;
     ontime=ontime1;
      counter=0;
      TMR0=0;
     OPTION_REG=0xd4;
     INTCON=0x00;
     TMR0IE_bit=1;
     while(1){
       if(TMR0IF_bit){
           counter++;
           TMR0IF_bit=0;
       }
       if(ontime1>counter){
       PORTB.F0=1;
       }else{
       PORTB.F0=0;
       }
       if(counter==count)break;
     }


}

void calc(){
    float i;
     for(i=0.0; i<=255.0; i+=2.0){
     onrate=i/255;
     offrate=1-onrate;
     ontime1=onrate*count;
     offtime1=offrate*count;
     delay20ms();
     }
}


void main() {
 TRISB=0;
 PORTB=0;
 while(1){
 calc();
 }
}