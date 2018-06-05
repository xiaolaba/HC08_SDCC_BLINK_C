;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module blink
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
	.globl _delay
	.globl _delay1ms
	.globl _COPCTL
	.globl _FLBPR
	.globl _LVISR
	.globl _BRKSCR
	.globl _BRKL
	.globl _BRKH
	.globl _BRK
	.globl _FLCR
	.globl _FLCTR
	.globl _INT3
	.globl _INT2
	.globl _INT1
	.globl _SBFCR
	.globl _SUBAR
	.globl _SRSR
	.globl _SBSR
	.globl _ADCLK
	.globl _ADR
	.globl _ADSCR
	.globl _PMDS
	.globl _PMRS
	.globl _PMSL
	.globl _PMSH
	.globl _PBWC
	.globl _PCTL
	.globl _T2CH1L
	.globl _T2CH1H
	.globl _T2CH1
	.globl _T2SC1
	.globl _T2CH0L
	.globl _T2CH0H
	.globl _T2CH0
	.globl _T2SC0
	.globl _T2MODL
	.globl _T2MODH
	.globl _T2MOD
	.globl _T2CNTL
	.globl _T2CNTH
	.globl _T2CNT
	.globl _T2SC
	.globl _T1CH1L
	.globl _T1CH1H
	.globl _T1CH1
	.globl _T1SC1
	.globl _T1CH0L
	.globl _T1CH0H
	.globl _T1CH0
	.globl _T1SC0
	.globl _T1MODL
	.globl _T1MODH
	.globl _T1MOD
	.globl _T1CNTL
	.globl _T1CNTH
	.globl _T1CNT
	.globl _T1SC
	.globl _CONFIG1
	.globl _CONFIG2
	.globl _INTSCR
	.globl _TBCR
	.globl _INTKBIER
	.globl _INTKBSCR
	.globl _SCBR
	.globl _SCDR
	.globl _SCS2
	.globl _SCS1
	.globl _SCC3
	.globl _SCC2
	.globl _SCC1
	.globl _SPDR
	.globl _SPSCR
	.globl _SPCR
	.globl _PTDPUE
	.globl _PTCPUE
	.globl _PTAPUE
	.globl _DDRE
	.globl _PTE
	.globl _DDRD
	.globl _DDRC
	.globl _DDRB
	.globl _DDRA
	.globl _PTD
	.globl _PTC
	.globl _PTB
	.globl _PTA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DSEG    (PAG)
_PTA	=	0x0000
_PTB	=	0x0001
_PTC	=	0x0002
_PTD	=	0x0003
_DDRA	=	0x0004
_DDRB	=	0x0005
_DDRC	=	0x0006
_DDRD	=	0x0007
_PTE	=	0x0008
_DDRE	=	0x000c
_PTAPUE	=	0x000d
_PTCPUE	=	0x000e
_PTDPUE	=	0x000f
_SPCR	=	0x0010
_SPSCR	=	0x0011
_SPDR	=	0x0012
_SCC1	=	0x0013
_SCC2	=	0x0014
_SCC3	=	0x0015
_SCS1	=	0x0016
_SCS2	=	0x0017
_SCDR	=	0x0018
_SCBR	=	0x0019
_INTKBSCR	=	0x001a
_INTKBIER	=	0x001b
_TBCR	=	0x001c
_INTSCR	=	0x001d
_CONFIG2	=	0x001e
_CONFIG1	=	0x001f
_T1SC	=	0x0020
_T1CNT	=	0x0021
_T1CNTH	=	0x0021
_T1CNTL	=	0x0022
_T1MOD	=	0x0023
_T1MODH	=	0x0023
_T1MODL	=	0x0024
_T1SC0	=	0x0025
_T1CH0	=	0x0026
_T1CH0H	=	0x0026
_T1CH0L	=	0x0027
_T1SC1	=	0x0028
_T1CH1	=	0x0029
_T1CH1H	=	0x0029
_T1CH1L	=	0x002a
_T2SC	=	0x002b
_T2CNT	=	0x002c
_T2CNTH	=	0x002c
_T2CNTL	=	0x002d
_T2MOD	=	0x002e
_T2MODH	=	0x002e
_T2MODL	=	0x002f
_T2SC0	=	0x0030
_T2CH0	=	0x0031
_T2CH0H	=	0x0031
_T2CH0L	=	0x0032
_T2SC1	=	0x0033
_T2CH1	=	0x0034
_T2CH1H	=	0x0034
_T2CH1L	=	0x0035
_PCTL	=	0x0036
_PBWC	=	0x0037
_PMSH	=	0x0038
_PMSL	=	0x0039
_PMRS	=	0x003a
_PMDS	=	0x003b
_ADSCR	=	0x003c
_ADR	=	0x003d
_ADCLK	=	0x003e
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
_SBSR	=	0xfe00
_SRSR	=	0xfe01
_SUBAR	=	0xfe02
_SBFCR	=	0xfe03
_INT1	=	0xfe04
_INT2	=	0xfe05
_INT3	=	0xfe06
_FLCTR	=	0xfe07
_FLCR	=	0xfe08
_BRK	=	0xfe09
_BRKH	=	0xfe09
_BRKL	=	0xfe0a
_BRKSCR	=	0xfe0b
_LVISR	=	0xfe0c
_FLBPR	=	0xfe7e
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
;blink.c:36: void delay1ms() {
;	-----------------------------------------
;	 function delay1ms
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_delay1ms:
;blink.c:46: __endasm;
	  lda	#122
	loopa:
	    nop	; [1]
	  nsa	; [3]
	  nsa	; [3]
	  dbnza	loopa ; [3]
	rts
;------------------------------------------------------------
;Allocation info for local variables in function 'delay'
;------------------------------------------------------------
;sloc0                     Allocated with name '_delay_sloc0_1_0'
;ms                        Allocated to registers 
;------------------------------------------------------------
;blink.c:51: void delay(unsigned int ms) {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_delay:
	pshx
	tax
	pulh
;blink.c:53: while(ms--) {
00101$:
	sthx	*_delay_sloc0_1_0
	aix	#-1
	lda	*(_delay_sloc0_1_0 + 1)
	ora	*_delay_sloc0_1_0
	beq	00104$
;blink.c:54: delay1ms();
	pshx
	pshh
	jsr	_delay1ms
	pulh
	pulx
	bra	00101$
00104$:
	rts
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;blink.c:60: void main() {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_main:
;blink.c:62: DDRC |= 0x04;		// PTC2 Output
	bset	#2,*_DDRC
;blink.c:63: while(1) {
00102$:
;blink.c:64: PTC  ^= 0x04;	// toggle PTC2
	lda	*_PTC
	eor	#0x04
	sta	*_PTC
;blink.c:65: delay(500);
	lda	#0xf4
	ldx	#0x01
	jsr	_delay
	bra	00102$
	rts
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
