                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.0 #9615 (MINGW64)
                              4 ;--------------------------------------------------------
                              5 	.module hello_world
                              6 	.optsdcc -mhc08
                              7 	
                              8 	.area HOME    (CODE)
                              9 	.area GSINIT0 (CODE)
                             10 	.area GSINIT  (CODE)
                             11 	.area GSFINAL (CODE)
                             12 	.area CSEG    (CODE)
                             13 	.area XINIT   (CODE)
                             14 	.area CONST   (CODE)
                             15 	.area DSEG    (PAG)
                             16 	.area OSEG    (PAG, OVR)
                             17 	.area XSEG
                             18 	.area XISEG
                             19 	.area	CODEIVT (ABS)
   FFFE                      20 	.org	0xfffe
   FFFE DC 00                21 	.dw	__sdcc_gs_init_startup
                             22 
                             23 	.area GSINIT0
   DC00                      24 __sdcc_gs_init_startup:
   DC00 45 80 00      [ 3]   25 	ldhx	#0x8000
   DC03 94            [ 2]   26 	txs
   DC04 CD DF 84      [ 5]   27 	jsr	__sdcc_external_startup
   DC07 27 03         [ 3]   28 	beq	__sdcc_init_data
   DC09 CC DC 21      [ 3]   29 	jmp	__sdcc_program_startup
   DC0C                      30 __sdcc_init_data:
                             31 ; _hc08_genXINIT() start
   DC0C 45 00 00      [ 3]   32         ldhx #0
   DC0F                      33 00001$:
   DC0F 65 00 00      [ 3]   34         cphx #l_XINIT
   DC12 27 0A         [ 3]   35         beq  00002$
   DC14 D6 E6 F2      [ 4]   36         lda  s_XINIT,x
   DC17 D7 00 CC      [ 4]   37         sta  s_XISEG,x
   DC1A AF 01         [ 2]   38         aix  #1
   DC1C 20 F1         [ 3]   39         bra  00001$
   DC1E                      40 00002$:
                             41 ; _hc08_genXINIT() end
                             42 	.area GSFINAL
   DC1E CC DC 21      [ 3]   43 	jmp	__sdcc_program_startup
                             44 
                             45 	.area CSEG
   DC21                      46 __sdcc_program_startup:
   DC21 CD DC 2C      [ 5]   47 	jsr	_main
   DC24 20 FE         [ 3]   48 	bra	.
                             49 ;--------------------------------------------------------
                             50 ; Public variables in this module
                             51 ;--------------------------------------------------------
                             52 	.globl _main
                             53 	.globl _printf
                             54 	.globl _CONFIG
                             55 	.globl _DDRA
                             56 	.globl _PTA
                             57 	.globl _putchar
                             58 ;--------------------------------------------------------
                             59 ; ram data
                             60 ;--------------------------------------------------------
                             61 	.area DSEG    (PAG)
                     0000    62 _PTA	=	0x0000
                     0004    63 _DDRA	=	0x0004
                     001F    64 _CONFIG	=	0x001f
                             65 ;--------------------------------------------------------
                             66 ; overlayable items in ram 
                             67 ;--------------------------------------------------------
                             68 ;--------------------------------------------------------
                             69 ; absolute ram data
                             70 ;--------------------------------------------------------
                             71 	.area IABS    (ABS)
                             72 	.area IABS    (ABS)
                             73 ;--------------------------------------------------------
                             74 ; absolute external ram data
                             75 ;--------------------------------------------------------
                             76 	.area XABS    (ABS)
                             77 ;--------------------------------------------------------
                             78 ; external initialized ram data
                             79 ;--------------------------------------------------------
                             80 	.area XISEG
                             81 ;--------------------------------------------------------
                             82 ; extended address mode data
                             83 ;--------------------------------------------------------
                             84 	.area XSEG
                             85 ;--------------------------------------------------------
                             86 ; global & static initialisations
                             87 ;--------------------------------------------------------
                             88 	.area HOME    (CODE)
                             89 	.area GSINIT  (CODE)
                             90 	.area GSFINAL (CODE)
                             91 	.area GSINIT  (CODE)
                             92 ;--------------------------------------------------------
                             93 ; Home
                             94 ;--------------------------------------------------------
                             95 	.area HOME    (CODE)
                             96 	.area HOME    (CODE)
                             97 ;--------------------------------------------------------
                             98 ; code
                             99 ;--------------------------------------------------------
                            100 	.area CSEG    (CODE)
                            101 ;------------------------------------------------------------
                            102 ;Allocation info for local variables in function 'putchar'
                            103 ;------------------------------------------------------------
                            104 ;x                         Allocated to registers 
                            105 ;------------------------------------------------------------
                            106 ;hello_world.c:25: void putchar(char x)  {  
                            107 ;	-----------------------------------------
                            108 ;	 function putchar
                            109 ;	-----------------------------------------
                            110 ;	Register assignment is optimal.
                            111 ;	Stack space usage: 0 bytes.
   DC26                     112 _putchar:
                            113 ;hello_world.c:34: __endasm; 
                            114         ;;bclr	#0,_PTA ;this line is not working 360 3.6.0
                            115         ;;;;	http:
                            116         ;;;;	use * as pointer to PORT A, it works, opcode 0x11, address
                            117         ;;;;	2018-JUN-05, xiaolaba
   DC26 11 00         [ 4]  118 	        bclr	#0,*_PTA ; clear bit0 of PORT A
   DC28 CD FE D6      [ 5]  119 	        jsr	0xFED6
   DC2B 81            [ 4]  120 	rts
                            121 ;------------------------------------------------------------
                            122 ;Allocation info for local variables in function 'main'
                            123 ;------------------------------------------------------------
                            124 ;hello_world.c:38: int main(void) {
                            125 ;	-----------------------------------------
                            126 ;	 function main
                            127 ;	-----------------------------------------
                            128 ;	Register assignment is optimal.
                            129 ;	Stack space usage: 0 bytes.
   DC2C                     130 _main:
                            131 ;hello_world.c:40: CONFIG=0x01; // Disable COP
   DC2C 6E 01 1F      [ 4]  132 	mov	#0x01,*_CONFIG
                            133 ;hello_world.c:41: while (1) {
   DC2F                     134 00102$:
                            135 ;hello_world.c:42: printf("Hello World, this HC08 talking! xiaolaba, SDCC 3.6.0 usage example\n");
   DC2F A6 F2         [ 2]  136 	lda	#___str_0
   DC31 87            [ 2]  137 	psha
   DC32 A6 E6         [ 2]  138 	lda	#>___str_0
   DC34 87            [ 2]  139 	psha
   DC35 CD DF A9      [ 5]  140 	jsr	_printf
   DC38 A7 02         [ 2]  141 	ais	#2
   DC3A 20 F3         [ 3]  142 	bra	00102$
   DC3C 81            [ 4]  143 	rts
                            144 	.area CSEG    (CODE)
                            145 	.area CONST   (CODE)
   E6F2                     146 ___str_0:
   E6F2 48 65 6C 6C 6F 20   147 	.ascii "Hello World, this HC08 talking! xiaolaba, SDCC 3.6.0 usage e"
        57 6F 72 6C 64 2C
        20 74 68 69 73 20
        48 43 30 38 20 74
        61 6C 6B 69 6E 67
        21 20 78 69 61 6F
        6C 61 62 61 2C 20
        53 44 43 43 20 33
        2E 36 2E 30 20 75
        73 61 67 65 20 65
   E72E 78 61 6D 70 6C 65   148 	.ascii "xample"
   E734 0A                  149 	.db 0x0a
   E735 00                  150 	.db 0x00
                            151 	.area XINIT   (CODE)
                            152 	.area CABS    (ABS,CODE)
