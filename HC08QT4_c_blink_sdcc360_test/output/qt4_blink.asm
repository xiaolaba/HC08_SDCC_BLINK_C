;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module qt4_blink
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
	ldhx	#0x0100
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
	.globl _blinkLED
	.globl _delay
	.globl _delay1ms
	.globl _COPCTL
	.globl _OSCTRIMVAL
	.globl _FLBPR
	.globl _LVISR
	.globl _BRKSCR
	.globl _BRK
	.globl _BRKL
	.globl _BRKH
	.globl _FLCR
	.globl _INT3
	.globl _INT2
	.globl _INT1
	.globl _BFCF
	.globl _BRKAR
	.globl _SRSR
	.globl _BSR
	.globl _ADICLK
	.globl _ADR
	.globl _ADSCR
	.globl _OSCTRIM
	.globl _OSCSTAT
	.globl _TCH1
	.globl _TCH1L
	.globl _TCH1H
	.globl _TSC1
	.globl _TCH0
	.globl _TCH0L
	.globl _TCH0H
	.globl _TSC0
	.globl _TMOD
	.globl _TMODL
	.globl _TMODH
	.globl _TCNT
	.globl _TCNTL
	.globl _TCNTH
	.globl _TSC
	.globl _CONFIG1
	.globl _CONFIG2
	.globl _INTSCR
	.globl _KBIER
	.globl _KBSCR
	.globl _PTBPUE
	.globl _PTAPUE
	.globl _DDRB
	.globl _DDRA
	.globl _PTB
	.globl _PTA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DSEG    (PAG)
_PTA	=	0x0000
_PTB	=	0x0001
_DDRA	=	0x0004
_DDRB	=	0x0005
_PTAPUE	=	0x000b
_PTBPUE	=	0x000c
_KBSCR	=	0x001a
_KBIER	=	0x001b
_INTSCR	=	0x001d
_CONFIG2	=	0x001e
_CONFIG1	=	0x001f
_TSC	=	0x0020
_TCNTH	=	0x0021
_TCNTL	=	0x0022
_TCNT	=	0x0021
_TMODH	=	0x0023
_TMODL	=	0x0024
_TMOD	=	0x0023
_TSC0	=	0x0025
_TCH0H	=	0x0026
_TCH0L	=	0x0027
_TCH0	=	0x0026
_TSC1	=	0x0028
_TCH1H	=	0x0029
_TCH1L	=	0x002a
_TCH1	=	0x0029
_OSCSTAT	=	0x0036
_OSCTRIM	=	0x0038
_ADSCR	=	0x003c
_ADR	=	0x003e
_ADICLK	=	0x003f
_delay_sloc0_1_0:
	.ds 2
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
_BSR	=	0xfe00
_SRSR	=	0xfe01
_BRKAR	=	0xfe02
_BFCF	=	0xfe03
_INT1	=	0xfe04
_INT2	=	0xfe05
_INT3	=	0xfe06
_FLCR	=	0xfe08
_BRKH	=	0xfe09
_BRKL	=	0xfe0a
_BRK	=	0xfe09
_BRKSCR	=	0xfe0b
_LVISR	=	0xfe0c
_FLBPR	=	0xffbe
_OSCTRIMVAL	=	0xffc0
_COPCTL	=	0xffff
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
;Allocation info for local variables in function 'delay1ms'
;------------------------------------------------------------
;qt4_blink.c:25: void delay1ms() {
;	-----------------------------------------
;	 function delay1ms
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_delay1ms:
;qt4_blink.c:65: __endasm;
    ;;	jsr [5]
	    lda	#200-1 ; [2]
    ;
	    loopa:
	      nsa	; [3]
	      nsa	; [3]
	      nsa	; [3]
	      nsa	; [3]
	      nop	; [1]
	    dbnza	loopa ; [3]
	    nsa	; [3]
	    nop	; [1]
	    nop	; [1]
    ;;	rts ; [4]
	rts
;------------------------------------------------------------
;Allocation info for local variables in function 'delay'
;------------------------------------------------------------
;sloc0                     Allocated with name '_delay_sloc0_1_0'
;ms                        Allocated to registers 
;------------------------------------------------------------
;qt4_blink.c:72: void delay(unsigned int ms) {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_delay:
	pshx
	tax
	pulh
;qt4_blink.c:73: while(ms--) {
00101$:
	sthx	*_delay_sloc0_1_0
	aix	#-1
	lda	*(_delay_sloc0_1_0 + 1)
	ora	*_delay_sloc0_1_0
	beq	00104$
;qt4_blink.c:74: delay1ms();
	pshx
	pshh
	jsr	_delay1ms
	pulh
	pulx
	bra	00101$
00104$:
	rts
;------------------------------------------------------------
;Allocation info for local variables in function 'blinkLED'
;------------------------------------------------------------
;qt4_blink.c:81: void blinkLED() {
;	-----------------------------------------
;	 function blinkLED
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_blinkLED:
;qt4_blink.c:83: while(1) {
00102$:
;qt4_blink.c:84: PTA ^= myLED; // toggle LED PIN, on / off 
	lda	*_PTA
	eor	#0x08
	sta	*_PTA
;qt4_blink.c:85: delay(500);  // delay about 500ms = 0.5 second
	lda	#0xf4
	ldx	#0x01
	jsr	_delay
	bra	00102$
	rts
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;qt4_blink.c:91: void main() {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_main:
;qt4_blink.c:93: OSCTRIM = osck; //calibrate the CPU frequency
	mov	#0x80,*_OSCTRIM
;qt4_blink.c:94: CONFIG1=0x01; // Disable COP
	mov	#0x01,*_CONFIG1
;qt4_blink.c:96: DDRA = myLED; // LED PIN as Output
	mov	#0x08,*_DDRA
;qt4_blink.c:98: blinkLED();
	jmp	_blinkLED
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
