/*
Blink Demo for ImageCraft ICC08
Hardware: HC08 Welcome Kit
http://www.elektronikladen.de/kit08.html
LED on PTC2 (HC908GP32 MCU)
*/

// How to compile, SDCC 3.6.0 used
// SDDC manual page 25

// C:_Program_Files_SDCC_include_hc08
#include <mc68hc908gp32.h>

//----------------------------------------------------------------------------
//#include <iogp32.h>
//----------------------------------------------------------------------------

// this is not working syntax with SDCC or the inline assembler
/*
void delay1ms() {
	// 122 * [10] = 1220 cycles
	// at 1.2288MHz Bus Clock -> 0.993ms 
	asm("\
		lda  #122   ; \n\
loopa:	nop     ; [1] \n\
		nsa         ; [3] \n\
		nsa         ; [3] \n\
		dbnza loopa ; [3] \
		");
	}
*/


// working syntax with SDCC or the inline assembler
// see SDCC manual, page 49
void delay1ms() {
	// 122 * [10] = 1220 cycles
	// at 1.2288MHz Bus Clock -> 0.993ms 
	__asm
		lda  #122
loopa:
    nop     ; [1]
		nsa         ; [3]
		nsa         ; [3]
		dbnza loopa ; [3]
	__endasm;
	}

//----------------------------------------------------------------------------

void delay(unsigned int ms) {

	while(ms--) {
		delay1ms();
		}
	}

//----------------------------------------------------------------------------

void main() {

	DDRC |= 0x04;		// PTC2 Output
	while(1) {
		PTC  ^= 0x04;	// toggle PTC2
		delay(500);
		}
	}

//----------------------------------------------------------------------------

