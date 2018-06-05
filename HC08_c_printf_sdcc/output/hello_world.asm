;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module hello_world
	.optsdcc -mhc08
	
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
	.area XINIT   (CODE)
	.area CONST   (CODE)
	.area DSEG    (PAG)
	.area OSEG    (PAG, OVR)
	.area XSEG
	.area XISEG
	.area	CODEIVT (ABS)
	.org	0xfffe
	.dw	__sdcc_gs_init_startup

	.area GSINIT0
__sdcc_gs_init_startup:
	ldhx	#0x8000
	txs
	jsr	__sdcc_external_startup
	beq	__sdcc_init_data
	jmp	__sdcc_program_startup
__sdcc_init_data:
; _hc08_genXINIT() start
        ldhx #0
00001$:
        cphx #l_XINIT
        beq  00002$
        lda  s_XINIT,x
        sta  s_XISEG,x
        aix  #1
        bra  00001$
00002$:
; _hc08_genXINIT() end
	.area GSFINAL
	jmp	__sdcc_program_startup

	.area CSEG
__sdcc_program_startup:
	jsr	_main
	bra	.
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _printf
	.globl _CONFIG
	.globl _DDRA
	.globl _PTA
	.globl _putchar
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DSEG    (PAG)
_PTA	=	0x0000
_DDRA	=	0x0004
_CONFIG	=	0x001f
;--------------------------------------------------------
; overlayable items in ram 
;--------------------------------------------------------
;--------------------------------------------------------
; absolute ram data
;--------------------------------------------------------
	.area IABS    (ABS)
	.area IABS    (ABS)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG
;--------------------------------------------------------
; extended address mode data
;--------------------------------------------------------
	.area XSEG
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'putchar'
;------------------------------------------------------------
;x                         Allocated to registers 
;------------------------------------------------------------
;hello_world.c:25: void putchar(char x)  {  
;	-----------------------------------------
;	 function putchar
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_putchar:
;hello_world.c:34: __endasm; 
        ;;bclr	#0,_PTA ;this line is not working 360 3.6.0
        ;;;;	http:
        ;;;;	use * as pointer to PORT A, it works, opcode 0x11, address
        ;;;;	2018-JUN-05, xiaolaba
	        bclr	#0,*_PTA ; clear bit0 of PORT A
	        jsr	0xFED6
	rts
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;hello_world.c:38: int main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_main:
;hello_world.c:40: CONFIG=0x01; // Disable COP
	mov	#0x01,*_CONFIG
;hello_world.c:41: while (1) {
00102$:
;hello_world.c:42: printf("Hello World, this HC08 talking! xiaolaba, SDCC 3.6.0 usage example\n");
	lda	#___str_0
	psha
	lda	#>___str_0
	psha
	jsr	_printf
	ais	#2
	bra	00102$
	rts
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_0:
	.ascii "Hello World, this HC08 talking! xiaolaba, SDCC 3.6.0 usage e"
	.ascii "xample"
	.db 0x0a
	.db 0x00
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
