                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.0 #9615 (MINGW64)
                              4 ;--------------------------------------------------------
                              5 	.module qt2_blink
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
   FFFE EE 00                21 	.dw	__sdcc_gs_init_startup
                             22 
                             23 	.area GSINIT0
   EE00                      24 __sdcc_gs_init_startup:
   EE00 45 01 00      [ 3]   25 	ldhx	#0x0100
   EE03 94            [ 2]   26 	txs
   EE04 CD EE 66      [ 5]   27 	jsr	__sdcc_external_startup
   EE07 27 03         [ 3]   28 	beq	__sdcc_init_data
   EE09 CC EE 21      [ 3]   29 	jmp	__sdcc_program_startup
   EE0C                      30 __sdcc_init_data:
                             31 ; _hc08_genXINIT() start
   EE0C 45 00 00      [ 3]   32         ldhx #0
   EE0F                      33 00001$:
   EE0F 65 00 00      [ 3]   34         cphx #l_XINIT
   EE12 27 0A         [ 3]   35         beq  00002$
   EE14 D6 EE 68      [ 4]   36         lda  s_XINIT,x
   EE17 D7 00 82      [ 4]   37         sta  s_XISEG,x
   EE1A AF 01         [ 2]   38         aix  #1
   EE1C 20 F1         [ 3]   39         bra  00001$
   EE1E                      40 00002$:
                             41 ; _hc08_genXINIT() end
                             42 	.area GSFINAL
   EE1E CC EE 21      [ 3]   43 	jmp	__sdcc_program_startup
                             44 
                             45 	.area CSEG
   EE21                      46 __sdcc_program_startup:
   EE21 CD EE 5A      [ 5]   47 	jsr	_main
   EE24 20 FE         [ 3]   48 	bra	.
                             49 ;--------------------------------------------------------
                             50 ; Public variables in this module
                             51 ;--------------------------------------------------------
                             52 	.globl _main
                             53 	.globl _blinkLED
                             54 	.globl _delay
                             55 	.globl _delay1ms
                             56 	.globl _COPCTL
                             57 	.globl _OSCTRIMVAL
                             58 	.globl _FLBPR
                             59 	.globl _LVISR
                             60 	.globl _BRKSCR
                             61 	.globl _BRK
                             62 	.globl _BRKL
                             63 	.globl _BRKH
                             64 	.globl _FLCR
                             65 	.globl _INT3
                             66 	.globl _INT2
                             67 	.globl _INT1
                             68 	.globl _BFCF
                             69 	.globl _BRKAR
                             70 	.globl _SRSR
                             71 	.globl _BSR
                             72 	.globl _ADICLK
                             73 	.globl _ADR
                             74 	.globl _ADSCR
                             75 	.globl _OSCTRIM
                             76 	.globl _OSCSTAT
                             77 	.globl _TCH1
                             78 	.globl _TCH1L
                             79 	.globl _TCH1H
                             80 	.globl _TSC1
                             81 	.globl _TCH0
                             82 	.globl _TCH0L
                             83 	.globl _TCH0H
                             84 	.globl _TSC0
                             85 	.globl _TMOD
                             86 	.globl _TMODL
                             87 	.globl _TMODH
                             88 	.globl _TCNT
                             89 	.globl _TCNTL
                             90 	.globl _TCNTH
                             91 	.globl _TSC
                             92 	.globl _CONFIG1
                             93 	.globl _CONFIG2
                             94 	.globl _INTSCR
                             95 	.globl _KBIER
                             96 	.globl _KBSCR
                             97 	.globl _PTBPUE
                             98 	.globl _PTAPUE
                             99 	.globl _DDRB
                            100 	.globl _DDRA
                            101 	.globl _PTB
                            102 	.globl _PTA
                            103 ;--------------------------------------------------------
                            104 ; ram data
                            105 ;--------------------------------------------------------
                            106 	.area DSEG    (PAG)
                     0000   107 _PTA	=	0x0000
                     0001   108 _PTB	=	0x0001
                     0004   109 _DDRA	=	0x0004
                     0005   110 _DDRB	=	0x0005
                     000B   111 _PTAPUE	=	0x000b
                     000C   112 _PTBPUE	=	0x000c
                     001A   113 _KBSCR	=	0x001a
                     001B   114 _KBIER	=	0x001b
                     001D   115 _INTSCR	=	0x001d
                     001E   116 _CONFIG2	=	0x001e
                     001F   117 _CONFIG1	=	0x001f
                     0020   118 _TSC	=	0x0020
                     0021   119 _TCNTH	=	0x0021
                     0022   120 _TCNTL	=	0x0022
                     0021   121 _TCNT	=	0x0021
                     0023   122 _TMODH	=	0x0023
                     0024   123 _TMODL	=	0x0024
                     0023   124 _TMOD	=	0x0023
                     0025   125 _TSC0	=	0x0025
                     0026   126 _TCH0H	=	0x0026
                     0027   127 _TCH0L	=	0x0027
                     0026   128 _TCH0	=	0x0026
                     0028   129 _TSC1	=	0x0028
                     0029   130 _TCH1H	=	0x0029
                     002A   131 _TCH1L	=	0x002a
                     0029   132 _TCH1	=	0x0029
                     0036   133 _OSCSTAT	=	0x0036
                     0038   134 _OSCTRIM	=	0x0038
                     003C   135 _ADSCR	=	0x003c
                     003E   136 _ADR	=	0x003e
                     003F   137 _ADICLK	=	0x003f
   0080                     138 _delay_sloc0_1_0:
   0080                     139 	.ds 2
                            140 ;--------------------------------------------------------
                            141 ; overlayable items in ram 
                            142 ;--------------------------------------------------------
                            143 ;--------------------------------------------------------
                            144 ; absolute ram data
                            145 ;--------------------------------------------------------
                            146 	.area IABS    (ABS)
                            147 	.area IABS    (ABS)
                            148 ;--------------------------------------------------------
                            149 ; absolute external ram data
                            150 ;--------------------------------------------------------
                            151 	.area XABS    (ABS)
                            152 ;--------------------------------------------------------
                            153 ; external initialized ram data
                            154 ;--------------------------------------------------------
                            155 	.area XISEG
                            156 ;--------------------------------------------------------
                            157 ; extended address mode data
                            158 ;--------------------------------------------------------
                            159 	.area XSEG
                     FE00   160 _BSR	=	0xfe00
                     FE01   161 _SRSR	=	0xfe01
                     FE02   162 _BRKAR	=	0xfe02
                     FE03   163 _BFCF	=	0xfe03
                     FE04   164 _INT1	=	0xfe04
                     FE05   165 _INT2	=	0xfe05
                     FE06   166 _INT3	=	0xfe06
                     FE08   167 _FLCR	=	0xfe08
                     FE09   168 _BRKH	=	0xfe09
                     FE0A   169 _BRKL	=	0xfe0a
                     FE09   170 _BRK	=	0xfe09
                     FE0B   171 _BRKSCR	=	0xfe0b
                     FE0C   172 _LVISR	=	0xfe0c
                     FFBE   173 _FLBPR	=	0xffbe
                     FFC0   174 _OSCTRIMVAL	=	0xffc0
                     FFFF   175 _COPCTL	=	0xffff
                            176 ;--------------------------------------------------------
                            177 ; global & static initialisations
                            178 ;--------------------------------------------------------
                            179 	.area HOME    (CODE)
                            180 	.area GSINIT  (CODE)
                            181 	.area GSFINAL (CODE)
                            182 	.area GSINIT  (CODE)
                            183 ;--------------------------------------------------------
                            184 ; Home
                            185 ;--------------------------------------------------------
                            186 	.area HOME    (CODE)
                            187 	.area HOME    (CODE)
                            188 ;--------------------------------------------------------
                            189 ; code
                            190 ;--------------------------------------------------------
                            191 	.area CSEG    (CODE)
                            192 ;------------------------------------------------------------
                            193 ;Allocation info for local variables in function 'delay1ms'
                            194 ;------------------------------------------------------------
                            195 ;qt2_blink.c:26: void delay1ms() {
                            196 ;	-----------------------------------------
                            197 ;	 function delay1ms
                            198 ;	-----------------------------------------
                            199 ;	Register assignment is optimal.
                            200 ;	Stack space usage: 0 bytes.
   EE26                     201 _delay1ms:
                            202 ;qt2_blink.c:60: __endasm;
                            203     ;;	jsr [5]
   EE26 A6 C7         [ 2]  204 	    lda	#200-1 ; [2]
                            205     ;
   EE28                     206 	    loopa:
   EE28 62            [ 3]  207 	      nsa	; [3]
   EE29 62            [ 3]  208 	      nsa	; [3]
   EE2A 62            [ 3]  209 	      nsa	; [3]
   EE2B 62            [ 3]  210 	      nsa	; [3]
   EE2C 9D            [ 1]  211 	      nop	; [1]
   EE2D 4B F9         [ 3]  212 	    dbnza	loopa ; [3]
   EE2F 62            [ 3]  213 	    nsa	; [3]
   EE30 9D            [ 1]  214 	    nop	; [1]
   EE31 9D            [ 1]  215 	    nop	; [1]
                            216     ;;	rts ; [4]
   EE32 81            [ 4]  217 	rts
                            218 ;------------------------------------------------------------
                            219 ;Allocation info for local variables in function 'delay'
                            220 ;------------------------------------------------------------
                            221 ;sloc0                     Allocated with name '_delay_sloc0_1_0'
                            222 ;ms                        Allocated to registers 
                            223 ;------------------------------------------------------------
                            224 ;qt2_blink.c:66: void delay(unsigned int ms) {
                            225 ;	-----------------------------------------
                            226 ;	 function delay
                            227 ;	-----------------------------------------
                            228 ;	Register assignment is optimal.
                            229 ;	Stack space usage: 0 bytes.
   EE33                     230 _delay:
   EE33 89            [ 2]  231 	pshx
   EE34 97            [ 1]  232 	tax
   EE35 8A            [ 2]  233 	pulh
                            234 ;qt2_blink.c:67: while(ms--) {
   EE36                     235 00101$:
   EE36 35 80         [ 4]  236 	sthx	*_delay_sloc0_1_0
   EE38 AF FF         [ 2]  237 	aix	#-1
   EE3A B6 81         [ 3]  238 	lda	*(_delay_sloc0_1_0 + 1)
   EE3C BA 80         [ 3]  239 	ora	*_delay_sloc0_1_0
   EE3E 27 09         [ 3]  240 	beq	00104$
                            241 ;qt2_blink.c:68: delay1ms();
   EE40 89            [ 2]  242 	pshx
   EE41 8B            [ 2]  243 	pshh
   EE42 CD EE 26      [ 5]  244 	jsr	_delay1ms
   EE45 8A            [ 2]  245 	pulh
   EE46 88            [ 2]  246 	pulx
   EE47 20 ED         [ 3]  247 	bra	00101$
   EE49                     248 00104$:
   EE49 81            [ 4]  249 	rts
                            250 ;------------------------------------------------------------
                            251 ;Allocation info for local variables in function 'blinkLED'
                            252 ;------------------------------------------------------------
                            253 ;qt2_blink.c:73: void blinkLED() {
                            254 ;	-----------------------------------------
                            255 ;	 function blinkLED
                            256 ;	-----------------------------------------
                            257 ;	Register assignment is optimal.
                            258 ;	Stack space usage: 0 bytes.
   EE4A                     259 _blinkLED:
                            260 ;qt2_blink.c:75: while(1) {
   EE4A                     261 00102$:
                            262 ;qt2_blink.c:76: PTA ^= myLED; // toggle LED PIN, on / off 
   EE4A B6 00         [ 3]  263 	lda	*_PTA
   EE4C A8 08         [ 2]  264 	eor	#0x08
   EE4E B7 00         [ 3]  265 	sta	*_PTA
                            266 ;qt2_blink.c:77: delay(500);  // delay about 500ms = 0.5 second
   EE50 A6 F4         [ 2]  267 	lda	#0xf4
   EE52 AE 01         [ 2]  268 	ldx	#0x01
   EE54 CD EE 33      [ 5]  269 	jsr	_delay
   EE57 20 F1         [ 3]  270 	bra	00102$
   EE59 81            [ 4]  271 	rts
                            272 ;------------------------------------------------------------
                            273 ;Allocation info for local variables in function 'main'
                            274 ;------------------------------------------------------------
                            275 ;qt2_blink.c:83: void main() {
                            276 ;	-----------------------------------------
                            277 ;	 function main
                            278 ;	-----------------------------------------
                            279 ;	Register assignment is optimal.
                            280 ;	Stack space usage: 0 bytes.
   EE5A                     281 _main:
                            282 ;qt2_blink.c:85: OSCTRIM = osck; //calibrate the CPU frequency
   EE5A 6E 80 38      [ 4]  283 	mov	#0x80,*_OSCTRIM
                            284 ;qt2_blink.c:86: CONFIG1=0x01; // Disable COP
   EE5D 6E 01 1F      [ 4]  285 	mov	#0x01,*_CONFIG1
                            286 ;qt2_blink.c:88: DDRA = myLED; // LED PIN as Output
   EE60 6E 08 04      [ 4]  287 	mov	#0x08,*_DDRA
                            288 ;qt2_blink.c:90: blinkLED();
   EE63 CC EE 4A      [ 3]  289 	jmp	_blinkLED
                            290 	.area CSEG    (CODE)
                            291 	.area CONST   (CODE)
                            292 	.area XINIT   (CODE)
                            293 	.area CABS    (ABS,CODE)
