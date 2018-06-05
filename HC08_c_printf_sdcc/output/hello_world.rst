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
   FFFE 80 00                21 	.dw	__sdcc_gs_init_startup
                             22 
                             23 	.area GSINIT0
   8000                      24 __sdcc_gs_init_startup:
   8000 45 80 00      [ 3]   25 	ldhx	#0x8000
   8003 94            [ 2]   26 	txs
   8004 CD 80 39      [ 5]   27 	jsr	__sdcc_external_startup
   8007 27 03         [ 3]   28 	beq	__sdcc_init_data
   8009 CC 80 21      [ 3]   29 	jmp	__sdcc_program_startup
   800C                      30 __sdcc_init_data:
                             31 ; _hc08_genXINIT() start
   800C 45 00 00      [ 3]   32         ldhx #0
   800F                      33 00001$:
   800F 65 00 00      [ 3]   34         cphx #l_XINIT
   8012 27 0A         [ 3]   35         beq  00002$
   8014 D6 87 A7      [ 4]   36         lda  s_XINIT,x
   8017 D7 00 BA      [ 4]   37         sta  s_XISEG,x
   801A AF 01         [ 2]   38         aix  #1
   801C 20 F1         [ 3]   39         bra  00001$
   801E                      40 00002$:
                             41 ; _hc08_genXINIT() end
                             42 	.area GSFINAL
   801E CC 80 21      [ 3]   43 	jmp	__sdcc_program_startup
                             44 
                             45 	.area CSEG
   8021                      46 __sdcc_program_startup:
   8021 CD 80 2B      [ 5]   47 	jsr	_main
   8024 20 FE         [ 3]   48 	bra	.
                             49 ;--------------------------------------------------------
                             50 ; Public variables in this module
                             51 ;--------------------------------------------------------
                             52 	.globl _main
                             53 	.globl _printf
                             54 	.globl _CONFIG
                             55 	.globl _PTA
                             56 	.globl _putchar
                             57 ;--------------------------------------------------------
                             58 ; ram data
                             59 ;--------------------------------------------------------
                             60 	.area DSEG    (PAG)
                     0000    61 _PTA	=	0x0000
                             62 ;--------------------------------------------------------
                             63 ; overlayable items in ram 
                             64 ;--------------------------------------------------------
                             65 ;--------------------------------------------------------
                             66 ; absolute ram data
                             67 ;--------------------------------------------------------
                             68 	.area IABS    (ABS)
                             69 	.area IABS    (ABS)
                             70 ;--------------------------------------------------------
                             71 ; absolute external ram data
                             72 ;--------------------------------------------------------
                             73 	.area XABS    (ABS)
                             74 ;--------------------------------------------------------
                             75 ; external initialized ram data
                             76 ;--------------------------------------------------------
                             77 	.area XISEG
                             78 ;--------------------------------------------------------
                             79 ; extended address mode data
                             80 ;--------------------------------------------------------
                             81 	.area XSEG
                     001F    82 _CONFIG	=	0x001f
                             83 ;--------------------------------------------------------
                             84 ; global & static initialisations
                             85 ;--------------------------------------------------------
                             86 	.area HOME    (CODE)
                             87 	.area GSINIT  (CODE)
                             88 	.area GSFINAL (CODE)
                             89 	.area GSINIT  (CODE)
                             90 ;--------------------------------------------------------
                             91 ; Home
                             92 ;--------------------------------------------------------
                             93 	.area HOME    (CODE)
                             94 	.area HOME    (CODE)
                             95 ;--------------------------------------------------------
                             96 ; code
                             97 ;--------------------------------------------------------
                             98 	.area CSEG    (CODE)
                             99 ;------------------------------------------------------------
                            100 ;Allocation info for local variables in function 'putchar'
                            101 ;------------------------------------------------------------
                            102 ;x                         Allocated to registers 
                            103 ;------------------------------------------------------------
                            104 ;hello_world.c:24: void putchar(char x)  {  
                            105 ;	-----------------------------------------
                            106 ;	 function putchar
                            107 ;	-----------------------------------------
                            108 ;	Register assignment is optimal.
                            109 ;	Stack space usage: 0 bytes.
   8026                     110 _putchar:
                            111 ;hello_world.c:30: __endasm; 
                            112     ;bclr	0, _PTA
   8026 CD FE D6      [ 5]  113 	    jsr	0xFED6
   8029 9D            [ 1]  114 	    nop
   802A 81            [ 4]  115 	rts
                            116 ;------------------------------------------------------------
                            117 ;Allocation info for local variables in function 'main'
                            118 ;------------------------------------------------------------
                            119 ;hello_world.c:34: int main(void) {
                            120 ;	-----------------------------------------
                            121 ;	 function main
                            122 ;	-----------------------------------------
                            123 ;	Register assignment is optimal.
                            124 ;	Stack space usage: 0 bytes.
   802B                     125 _main:
                            126 ;hello_world.c:37: while (1) {
   802B                     127 00102$:
                            128 ;hello_world.c:38: printf("Hello World, this HC08 talking!\n");
   802B A6 A7         [ 2]  129 	lda	#___str_0
   802D 87            [ 2]  130 	psha
   802E A6 87         [ 2]  131 	lda	#>___str_0
   8030 87            [ 2]  132 	psha
   8031 CD 80 5E      [ 5]  133 	jsr	_printf
   8034 A7 02         [ 2]  134 	ais	#2
   8036 20 F3         [ 3]  135 	bra	00102$
   8038 81            [ 4]  136 	rts
                            137 	.area CSEG    (CODE)
                            138 	.area CONST   (CODE)
   87A7                     139 ___str_0:
   87A7 48 65 6C 6C 6F 20   140 	.ascii "Hello World, this HC08 talking!"
        57 6F 72 6C 64 2C
        20 74 68 69 73 20
        48 43 30 38 20 74
        61 6C 6B 69 6E 67
        21
   87C6 0A                  141 	.db 0x0a
   87C7 00                  142 	.db 0x00
                            143 	.area XINIT   (CODE)
                            144 	.area CABS    (ABS,CODE)
