// REF : http://www.sparetimelabs.com/funwith08/funwith08.php#helloworld
// hello_world.c
// SDCC compiler used, xiaolaba
// 2018-JUN-05

///////////////////////////////////////////
// this line is not working SDCC 3.6.0
// SDCC, 3.6.0 does not work
// see manual page 41 & 56
///////////////////////////////////////////
/*
#include "printf.h" 
data at 0x00 volatile char PTA;
data at 0x1F volatile char CONFIG; 
*/

// RAM / IO direct address variables, HC08 Von-Numen
__data __at 0x00 volatile char PTA; // port A
__data __at 0x04 volatile char DDRA;  // DDRA
__data __at 0x1F volatile char CONFIG;  // CONFIG REGISTER

// for printf(), SDCC 3.6.0
#include "stdio.h" 

void putchar(char x)  {  
   (void)x;  
__asm 
        ;;bclr #0,_PTA   ;this line is not working SDCC 3.6.0
        ;;;; http://framework.sourceforge.net/hc908sh/examples/uart/uart.asm
        ;;;; use * as pointer to PORT A, it works, opcode 0x11, address
        ;;;; 2018-JUN-05, xiaolaba
        bclr #0,*_PTA    ; clear bit0 of PORT A
        jsr 0xFED6
__endasm; 
} 

//int main(int argc, char** argv) {
int main(void) {

  CONFIG=0x01; // Disable COP
  while (1) {
    printf("Hello World, this HC08 talking! xiaolaba, SDCC 3.6.0 usage example\n");
  }
}