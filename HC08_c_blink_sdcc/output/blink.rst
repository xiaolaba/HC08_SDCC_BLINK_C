                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.0 #9615 (MINGW64)
                              4 ;--------------------------------------------------------
                              5 	.module blink
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
   8004 CD 80 57      [ 5]   27 	jsr	__sdcc_external_startup
   8007 27 03         [ 3]   28 	beq	__sdcc_init_data
   8009 CC 80 21      [ 3]   29 	jmp	__sdcc_program_startup
   800C                      30 __sdcc_init_data:
                             31 ; _hc08_genXINIT() start
   800C 45 00 00      [ 3]   32         ldhx #0
   800F                      33 00001$:
   800F 65 00 00      [ 3]   34         cphx #l_XINIT
   8012 27 0A         [ 3]   35         beq  00002$
   8014 D6 80 59      [ 4]   36         lda  s_XINIT,x
   8017 D7 00 82      [ 4]   37         sta  s_XISEG,x
   801A AF 01         [ 2]   38         aix  #1
   801C 20 F1         [ 3]   39         bra  00001$
   801E                      40 00002$:
                             41 ; _hc08_genXINIT() end
                             42 	.area GSFINAL
   801E CC 80 21      [ 3]   43 	jmp	__sdcc_program_startup
                             44 
                             45 	.area CSEG
   8021                      46 __sdcc_program_startup:
   8021 CD 80 45      [ 5]   47 	jsr	_main
   8024 20 FE         [ 3]   48 	bra	.
                             49 ;--------------------------------------------------------
                             50 ; Public variables in this module
                             51 ;--------------------------------------------------------
                             52 	.globl _main
                             53 	.globl _delay
                             54 	.globl _delay1ms
                             55 	.globl _COPCTL
                             56 	.globl _FLBPR
                             57 	.globl _LVISR
                             58 	.globl _BRKSCR
                             59 	.globl _BRKL
                             60 	.globl _BRKH
                             61 	.globl _BRK
                             62 	.globl _FLCR
                             63 	.globl _FLCTR
                             64 	.globl _INT3
                             65 	.globl _INT2
                             66 	.globl _INT1
                             67 	.globl _SBFCR
                             68 	.globl _SUBAR
                             69 	.globl _SRSR
                             70 	.globl _SBSR
                             71 	.globl _ADCLK
                             72 	.globl _ADR
                             73 	.globl _ADSCR
                             74 	.globl _PMDS
                             75 	.globl _PMRS
                             76 	.globl _PMSL
                             77 	.globl _PMSH
                             78 	.globl _PBWC
                             79 	.globl _PCTL
                             80 	.globl _T2CH1L
                             81 	.globl _T2CH1H
                             82 	.globl _T2CH1
                             83 	.globl _T2SC1
                             84 	.globl _T2CH0L
                             85 	.globl _T2CH0H
                             86 	.globl _T2CH0
                             87 	.globl _T2SC0
                             88 	.globl _T2MODL
                             89 	.globl _T2MODH
                             90 	.globl _T2MOD
                             91 	.globl _T2CNTL
                             92 	.globl _T2CNTH
                             93 	.globl _T2CNT
                             94 	.globl _T2SC
                             95 	.globl _T1CH1L
                             96 	.globl _T1CH1H
                             97 	.globl _T1CH1
                             98 	.globl _T1SC1
                             99 	.globl _T1CH0L
                            100 	.globl _T1CH0H
                            101 	.globl _T1CH0
                            102 	.globl _T1SC0
                            103 	.globl _T1MODL
                            104 	.globl _T1MODH
                            105 	.globl _T1MOD
                            106 	.globl _T1CNTL
                            107 	.globl _T1CNTH
                            108 	.globl _T1CNT
                            109 	.globl _T1SC
                            110 	.globl _CONFIG1
                            111 	.globl _CONFIG2
                            112 	.globl _INTSCR
                            113 	.globl _TBCR
                            114 	.globl _INTKBIER
                            115 	.globl _INTKBSCR
                            116 	.globl _SCBR
                            117 	.globl _SCDR
                            118 	.globl _SCS2
                            119 	.globl _SCS1
                            120 	.globl _SCC3
                            121 	.globl _SCC2
                            122 	.globl _SCC1
                            123 	.globl _SPDR
                            124 	.globl _SPSCR
                            125 	.globl _SPCR
                            126 	.globl _PTDPUE
                            127 	.globl _PTCPUE
                            128 	.globl _PTAPUE
                            129 	.globl _DDRE
                            130 	.globl _PTE
                            131 	.globl _DDRD
                            132 	.globl _DDRC
                            133 	.globl _DDRB
                            134 	.globl _DDRA
                            135 	.globl _PTD
                            136 	.globl _PTC
                            137 	.globl _PTB
                            138 	.globl _PTA
                            139 ;--------------------------------------------------------
                            140 ; ram data
                            141 ;--------------------------------------------------------
                            142 	.area DSEG    (PAG)
                     0000   143 _PTA	=	0x0000
                     0001   144 _PTB	=	0x0001
                     0002   145 _PTC	=	0x0002
                     0003   146 _PTD	=	0x0003
                     0004   147 _DDRA	=	0x0004
                     0005   148 _DDRB	=	0x0005
                     0006   149 _DDRC	=	0x0006
                     0007   150 _DDRD	=	0x0007
                     0008   151 _PTE	=	0x0008
                     000C   152 _DDRE	=	0x000c
                     000D   153 _PTAPUE	=	0x000d
                     000E   154 _PTCPUE	=	0x000e
                     000F   155 _PTDPUE	=	0x000f
                     0010   156 _SPCR	=	0x0010
                     0011   157 _SPSCR	=	0x0011
                     0012   158 _SPDR	=	0x0012
                     0013   159 _SCC1	=	0x0013
                     0014   160 _SCC2	=	0x0014
                     0015   161 _SCC3	=	0x0015
                     0016   162 _SCS1	=	0x0016
                     0017   163 _SCS2	=	0x0017
                     0018   164 _SCDR	=	0x0018
                     0019   165 _SCBR	=	0x0019
                     001A   166 _INTKBSCR	=	0x001a
                     001B   167 _INTKBIER	=	0x001b
                     001C   168 _TBCR	=	0x001c
                     001D   169 _INTSCR	=	0x001d
                     001E   170 _CONFIG2	=	0x001e
                     001F   171 _CONFIG1	=	0x001f
                     0020   172 _T1SC	=	0x0020
                     0021   173 _T1CNT	=	0x0021
                     0021   174 _T1CNTH	=	0x0021
                     0022   175 _T1CNTL	=	0x0022
                     0023   176 _T1MOD	=	0x0023
                     0023   177 _T1MODH	=	0x0023
                     0024   178 _T1MODL	=	0x0024
                     0025   179 _T1SC0	=	0x0025
                     0026   180 _T1CH0	=	0x0026
                     0026   181 _T1CH0H	=	0x0026
                     0027   182 _T1CH0L	=	0x0027
                     0028   183 _T1SC1	=	0x0028
                     0029   184 _T1CH1	=	0x0029
                     0029   185 _T1CH1H	=	0x0029
                     002A   186 _T1CH1L	=	0x002a
                     002B   187 _T2SC	=	0x002b
                     002C   188 _T2CNT	=	0x002c
                     002C   189 _T2CNTH	=	0x002c
                     002D   190 _T2CNTL	=	0x002d
                     002E   191 _T2MOD	=	0x002e
                     002E   192 _T2MODH	=	0x002e
                     002F   193 _T2MODL	=	0x002f
                     0030   194 _T2SC0	=	0x0030
                     0031   195 _T2CH0	=	0x0031
                     0031   196 _T2CH0H	=	0x0031
                     0032   197 _T2CH0L	=	0x0032
                     0033   198 _T2SC1	=	0x0033
                     0034   199 _T2CH1	=	0x0034
                     0034   200 _T2CH1H	=	0x0034
                     0035   201 _T2CH1L	=	0x0035
                     0036   202 _PCTL	=	0x0036
                     0037   203 _PBWC	=	0x0037
                     0038   204 _PMSH	=	0x0038
                     0039   205 _PMSL	=	0x0039
                     003A   206 _PMRS	=	0x003a
                     003B   207 _PMDS	=	0x003b
                     003C   208 _ADSCR	=	0x003c
                     003D   209 _ADR	=	0x003d
                     003E   210 _ADCLK	=	0x003e
   0080                     211 _delay_sloc0_1_0:
   0080                     212 	.ds 2
                            213 ;--------------------------------------------------------
                            214 ; overlayable items in ram 
                            215 ;--------------------------------------------------------
                            216 ;--------------------------------------------------------
                            217 ; absolute ram data
                            218 ;--------------------------------------------------------
                            219 	.area IABS    (ABS)
                            220 	.area IABS    (ABS)
                            221 ;--------------------------------------------------------
                            222 ; absolute external ram data
                            223 ;--------------------------------------------------------
                            224 	.area XABS    (ABS)
                            225 ;--------------------------------------------------------
                            226 ; external initialized ram data
                            227 ;--------------------------------------------------------
                            228 	.area XISEG
                            229 ;--------------------------------------------------------
                            230 ; extended address mode data
                            231 ;--------------------------------------------------------
                            232 	.area XSEG
                     FE00   233 _SBSR	=	0xfe00
                     FE01   234 _SRSR	=	0xfe01
                     FE02   235 _SUBAR	=	0xfe02
                     FE03   236 _SBFCR	=	0xfe03
                     FE04   237 _INT1	=	0xfe04
                     FE05   238 _INT2	=	0xfe05
                     FE06   239 _INT3	=	0xfe06
                     FE07   240 _FLCTR	=	0xfe07
                     FE08   241 _FLCR	=	0xfe08
                     FE09   242 _BRK	=	0xfe09
                     FE09   243 _BRKH	=	0xfe09
                     FE0A   244 _BRKL	=	0xfe0a
                     FE0B   245 _BRKSCR	=	0xfe0b
                     FE0C   246 _LVISR	=	0xfe0c
                     FE7E   247 _FLBPR	=	0xfe7e
                     FFFF   248 _COPCTL	=	0xffff
                            249 ;--------------------------------------------------------
                            250 ; global & static initialisations
                            251 ;--------------------------------------------------------
                            252 	.area HOME    (CODE)
                            253 	.area GSINIT  (CODE)
                            254 	.area GSFINAL (CODE)
                            255 	.area GSINIT  (CODE)
                            256 ;--------------------------------------------------------
                            257 ; Home
                            258 ;--------------------------------------------------------
                            259 	.area HOME    (CODE)
                            260 	.area HOME    (CODE)
                            261 ;--------------------------------------------------------
                            262 ; code
                            263 ;--------------------------------------------------------
                            264 	.area CSEG    (CODE)
                            265 ;------------------------------------------------------------
                            266 ;Allocation info for local variables in function 'delay1ms'
                            267 ;------------------------------------------------------------
                            268 ;blink.c:36: void delay1ms() {
                            269 ;	-----------------------------------------
                            270 ;	 function delay1ms
                            271 ;	-----------------------------------------
                            272 ;	Register assignment is optimal.
                            273 ;	Stack space usage: 0 bytes.
   8026                     274 _delay1ms:
                            275 ;blink.c:46: __endasm;
   8026 A6 7A         [ 2]  276 	  lda	#122
   8028                     277 	loopa:
   8028 9D            [ 1]  278 	    nop	; [1]
   8029 62            [ 3]  279 	  nsa	; [3]
   802A 62            [ 3]  280 	  nsa	; [3]
   802B 4B FB         [ 3]  281 	  dbnza	loopa ; [3]
   802D 81            [ 4]  282 	rts
                            283 ;------------------------------------------------------------
                            284 ;Allocation info for local variables in function 'delay'
                            285 ;------------------------------------------------------------
                            286 ;sloc0                     Allocated with name '_delay_sloc0_1_0'
                            287 ;ms                        Allocated to registers 
                            288 ;------------------------------------------------------------
                            289 ;blink.c:51: void delay(unsigned int ms) {
                            290 ;	-----------------------------------------
                            291 ;	 function delay
                            292 ;	-----------------------------------------
                            293 ;	Register assignment is optimal.
                            294 ;	Stack space usage: 0 bytes.
   802E                     295 _delay:
   802E 89            [ 2]  296 	pshx
   802F 97            [ 1]  297 	tax
   8030 8A            [ 2]  298 	pulh
                            299 ;blink.c:53: while(ms--) {
   8031                     300 00101$:
   8031 35 80         [ 4]  301 	sthx	*_delay_sloc0_1_0
   8033 AF FF         [ 2]  302 	aix	#-1
   8035 B6 81         [ 3]  303 	lda	*(_delay_sloc0_1_0 + 1)
   8037 BA 80         [ 3]  304 	ora	*_delay_sloc0_1_0
   8039 27 09         [ 3]  305 	beq	00104$
                            306 ;blink.c:54: delay1ms();
   803B 89            [ 2]  307 	pshx
   803C 8B            [ 2]  308 	pshh
   803D CD 80 26      [ 5]  309 	jsr	_delay1ms
   8040 8A            [ 2]  310 	pulh
   8041 88            [ 2]  311 	pulx
   8042 20 ED         [ 3]  312 	bra	00101$
   8044                     313 00104$:
   8044 81            [ 4]  314 	rts
                            315 ;------------------------------------------------------------
                            316 ;Allocation info for local variables in function 'main'
                            317 ;------------------------------------------------------------
                            318 ;blink.c:60: void main() {
                            319 ;	-----------------------------------------
                            320 ;	 function main
                            321 ;	-----------------------------------------
                            322 ;	Register assignment is optimal.
                            323 ;	Stack space usage: 0 bytes.
   8045                     324 _main:
                            325 ;blink.c:62: DDRC |= 0x04;		// PTC2 Output
   8045 14 06         [ 4]  326 	bset	#2,*_DDRC
                            327 ;blink.c:63: while(1) {
   8047                     328 00102$:
                            329 ;blink.c:64: PTC  ^= 0x04;	// toggle PTC2
   8047 B6 02         [ 3]  330 	lda	*_PTC
   8049 A8 04         [ 2]  331 	eor	#0x04
   804B B7 02         [ 3]  332 	sta	*_PTC
                            333 ;blink.c:65: delay(500);
   804D A6 F4         [ 2]  334 	lda	#0xf4
   804F AE 01         [ 2]  335 	ldx	#0x01
   8051 CD 80 2E      [ 5]  336 	jsr	_delay
   8054 20 F1         [ 3]  337 	bra	00102$
   8056 81            [ 4]  338 	rts
                            339 	.area CSEG    (CODE)
                            340 	.area CONST   (CODE)
                            341 	.area XINIT   (CODE)
                            342 	.area CABS    (ABS,CODE)
