// test sdcc 4.4.0
// 68HC908JB8 Blink Example
// Compile with: sdcc -mhc08 --stack-loc 0x013F --code-loc 0xDC00 blink_JB8.c -o blink_JB8.s19
// by xiao_laba_cn@yahoo.com

// ref :http://www.sparetimelabs.com/funwith08/funwith08.php#blinkled

/*
// compile failed
data at 0x00 volatile char PTA;
data at 0x04 volatile char DDRA;
data at 0x1F volatile char CONFIG;
*/

/*
// compile failed
volatile unsigned char PTA @ 0x00;
volatile unsigned char DDRA @ 0x04;
volatile unsigned char CONFIG @ 0x1F;
*/



// compile OK
// RAM / IO direct address variables, HC08 Von-Numen
__data __at 0x00 volatile char PTA; // port A
__data __at 0x04 volatile char DDRA;  // DDRA
__data __at 0x1F volatile char CONFIG;  // CONFIG REGISTER


/*
// compile OK
#define PTA (*(volatile unsigned char *)0x00)
#define DDRA (*(volatile unsigned char *)0x04)
#define CONFIG (*(volatile unsigned char *)0x1F)
*/






void main(void) 
{
    // Disable COP watchdog
    CONFIG = 0x01;
    
    // Set PA0 and PA1 as outputs
    DDRA = 0x03;
    
    while (1) 
    {
        // Toggle PA0 and PA1
        PTA ^= 0x03;
        
        // Simple delay loop
        volatile unsigned int i;
        for (i = 0; i < 60000; i++);	// slow blinking
        //for (i = 0; i < 30000; i++);	// fast blinking
		
    }
}