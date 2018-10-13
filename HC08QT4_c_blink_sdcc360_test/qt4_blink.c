
// xiaolaba, 2018-OCT-12
// sdcc 3.6.0 used
// header path C:\Program Files\SDCC\include\hc08
// test for software delay, 1ms and accuracy, dempends on RC oscillator
// blink LED at about 1Hz, on 500ms, off 500ms


//    PTA =  0bxx543210  // HC908QT4, PTA0 to PTA5, 8 pin IC, i/o pin for user, bit0 to bit5
#define LED0 0b00000001  // PTA0
#define LED1 0b00000010  // PTA1
#define LED2 0b00000100  // PTA2
#define LED3 0b00001000  // PTA3
#define LED4 0b00010000  // PTA4
#define LED5 0b00100000  // PTA5

#define myLED LED3

// HC908 internal RC oscillator 12.8MHZ
// bus speed, CPU speed = 12.8/4 = 3.2MHZ
#define osck 0x80 //trim RC oscillator

#include <mc68hc908qy.h>

void delay1ms() {
  // internal RC 12.8MHz, CPU speed = 12.8/4 MHZ = 3.2MHz
  // 1 cpu cycle = (1/3.2) us
  
  // calculation for number of CPU cycles for 1ms
  // 1ms = 1000 us
  // 1000us / (1/3.2)us = 1000x3.2 = 3200 CPU cycles
  // 3200 cycles / [16] = 200 loops
  // at 3.2MHz Bus Clock -> 1ms
   
  // each call/return for this subroutine, extra 5+2+4 CPU cycles;
  // add 3 dummy instructions, 3+1+1, sum as [16], equal 1 loop
  
  // so total loops required = 200-1
  
  // working syntax with SDCC 3.6.0 or the inline assembler
  //
  // __asm
  //   ...
  //   ...
  // __endasm
  //
  // see SDCC manual, page 49
  __asm
    ;; jsr [5]        // caller need 5 CPU cycle to get here
    lda #200-1 ; [2]  // number of loops = 200, set loops need 2 CPU cycles
    
    ; // one loop 16 cpu cycles
    loopa:
      nsa ; [3]       // swap nibble of Acc
      nsa ; [3]       // restore Acc
      nsa ; [3]       // swap nibble of Acc
      nsa ; [3]       // restore Acc
      nop ; [1]       // no operation  
    dbnza loopa ; [3] // Decrement Accumulator, Branch if Not Equal ($00)
  
    nsa ; [3] // dummy 
    nop ; [1] // dummy
    nop ; [1] // dummy 
    ;; rts ; [4] // return to caller
  __endasm;
  
}
 


//----------------------------------------------------------------------------
void delay(unsigned int ms) {
  while(ms--) {
    delay1ms();
  }
}



//----------------------------------------------------------------------------
void blinkLED() {
  // blink the LED
  while(1) {
    PTA ^= myLED; // toggle LED PIN, on / off 
    delay(500);  // delay about 500ms = 0.5 second
  }
}

 
//----------------------------------------------------------------------------
void main() {

  OSCTRIM = osck; //calibrate the CPU frequency
  CONFIG1=0x01; // Disable COP
 
  DDRA = myLED; // LED PIN as Output
  
  blinkLED();

} 