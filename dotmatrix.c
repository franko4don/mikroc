int mrow[]={0x80,0x40,0x20,0x10,0x08};
int mcol[]={0x00,0xbf,0xdf,0xbf,0x00};
void main() {
TRISB=0;
TRISC=0;
while(1){
unsigned int i,j;
unsigned long k;
delay_ms(100);
for(j=0; j<5; j++){
for(k=0; k<150; k++){
for(i=j; i<5; i++){
PORTB=~mrow[i];
PORTC=~mcol[i-j];
delay_ms(2);
}
}

}
PORTB=0;
PORTC=0;
delay_ms(500);
}
}