                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.0 #9615 (MINGW64)
                              4 ;--------------------------------------------------------
                              5 	.module printf
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
                             19 ;--------------------------------------------------------
                             20 ; Public variables in this module
                             21 ;--------------------------------------------------------
                             22 	.globl _putchar
                             23 	.globl _tfp_printf
                             24 ;--------------------------------------------------------
                             25 ; ram data
                             26 ;--------------------------------------------------------
                             27 	.area DSEG    (PAG)
                             28 ;--------------------------------------------------------
                             29 ; overlayable items in ram 
                             30 ;--------------------------------------------------------
                             31 ;--------------------------------------------------------
                             32 ; absolute ram data
                             33 ;--------------------------------------------------------
                             34 	.area IABS    (ABS)
                             35 	.area IABS    (ABS)
                             36 ;--------------------------------------------------------
                             37 ; absolute external ram data
                             38 ;--------------------------------------------------------
                             39 	.area XABS    (ABS)
                             40 ;--------------------------------------------------------
                             41 ; external initialized ram data
                             42 ;--------------------------------------------------------
                             43 	.area XISEG
                             44 ;--------------------------------------------------------
                             45 ; extended address mode data
                             46 ;--------------------------------------------------------
                             47 	.area XSEG
   0094                      48 _bf:
   0094                      49 	.ds 2
   0096                      50 _buf:
   0096                      51 	.ds 12
   00A2                      52 _num:
   00A2                      53 	.ds 2
   00A4                      54 _uc:
   00A4                      55 	.ds 1
   00A5                      56 _zs:
   00A5                      57 	.ds 1
                             58 ;--------------------------------------------------------
                             59 ; global & static initialisations
                             60 ;--------------------------------------------------------
                             61 	.area HOME    (CODE)
                             62 	.area GSINIT  (CODE)
                             63 	.area GSFINAL (CODE)
                             64 	.area GSINIT  (CODE)
                             65 ;--------------------------------------------------------
                             66 ; Home
                             67 ;--------------------------------------------------------
                             68 	.area HOME    (CODE)
                             69 	.area HOME    (CODE)
                             70 ;--------------------------------------------------------
                             71 ; code
                             72 ;--------------------------------------------------------
                             73 	.area CSEG    (CODE)
                             74 ;------------------------------------------------------------
                             75 ;Allocation info for local variables in function 'out'
                             76 ;------------------------------------------------------------
                             77 ;c                         Allocated to registers a 
                             78 ;------------------------------------------------------------
                             79 ;printf.c:33: static void out(char c) {
                             80 ;	-----------------------------------------
                             81 ;	 function out
                             82 ;	-----------------------------------------
                             83 ;	Register assignment is optimal.
                             84 ;	Stack space usage: 0 bytes.
   DC3D                      85 _out:
                             86 ;printf.c:34: *bf++ = c;
   DC3D CE 00 94      [ 4]   87 	ldx	_bf
   DC40 89            [ 2]   88 	pshx
   DC41 8A            [ 2]   89 	pulh
   DC42 CE 00 95      [ 4]   90 	ldx	(_bf + 1)
   DC45 F7            [ 2]   91 	sta	,x
   DC46 45 00 94      [ 3]   92 	ldhx	#_bf
   DC49 6C 01         [ 4]   93 	inc	1,x
   DC4B 26 01         [ 3]   94 	bne	00103$
   DC4D 7C            [ 3]   95 	inc	,x
   DC4E                      96 00103$:
   DC4E 81            [ 4]   97 	rts
                             98 ;------------------------------------------------------------
                             99 ;Allocation info for local variables in function 'outDgt'
                            100 ;------------------------------------------------------------
                            101 ;dgt                       Allocated to registers h 
                            102 ;------------------------------------------------------------
                            103 ;printf.c:37: static void outDgt(char dgt) {
                            104 ;	-----------------------------------------
                            105 ;	 function outDgt
                            106 ;	-----------------------------------------
                            107 ;	Register assignment is optimal.
                            108 ;	Stack space usage: 0 bytes.
   DC4F                     109 _outDgt:
   DC4F 87            [ 2]  110 	psha
   DC50 8A            [ 2]  111 	pulh
                            112 ;printf.c:38: out(dgt+(dgt<10 ? '0' : (uc ? 'A' : 'a')-10));
   DC51 8B            [ 2]  113 	pshh
   DC52 86            [ 2]  114 	pula
   DC53 A1 0A         [ 2]  115 	cmp	#0x0a
   DC55 24 05         [ 3]  116 	bcc	00103$
   DC57 5F            [ 1]  117 	clrx
   DC58 A6 30         [ 2]  118 	lda	#0x30
   DC5A 20 16         [ 3]  119 	bra	00104$
   DC5C                     120 00103$:
   DC5C C6 00 A4      [ 4]  121 	lda	_uc
   DC5F 27 05         [ 3]  122 	beq	00105$
   DC61 5F            [ 1]  123 	clrx
   DC62 A6 41         [ 2]  124 	lda	#0x41
   DC64 20 03         [ 3]  125 	bra	00106$
   DC66                     126 00105$:
   DC66 5F            [ 1]  127 	clrx
   DC67 A6 61         [ 2]  128 	lda	#0x61
   DC69                     129 00106$:
   DC69 A0 0A         [ 2]  130 	sub	#0x0a
   DC6B 87            [ 2]  131 	psha
   DC6C 49            [ 1]  132 	rola	
   DC6D 4F            [ 1]  133 	clra	
   DC6E A2 00         [ 2]  134 	sbc	#0x00
   DC70 97            [ 1]  135 	tax
   DC71 86            [ 2]  136 	pula
   DC72                     137 00104$:
   DC72 8B            [ 2]  138 	pshh
   DC73 9E EB 01      [ 4]  139 	add	1,s
   DC76 A7 01         [ 2]  140 	ais	#1
   DC78 CD DC 3D      [ 5]  141 	jsr	_out
                            142 ;printf.c:39: zs=1;
   DC7B A6 01         [ 2]  143 	lda	#0x01
   DC7D C7 00 A5      [ 4]  144 	sta	_zs
   DC80 81            [ 4]  145 	rts
                            146 ;------------------------------------------------------------
                            147 ;Allocation info for local variables in function 'divOut'
                            148 ;------------------------------------------------------------
                            149 ;div                       Allocated to stack - sp -4
                            150 ;dgt                       Allocated to registers 
                            151 ;------------------------------------------------------------
                            152 ;printf.c:42: static void divOut(unsigned int div) {
                            153 ;	-----------------------------------------
                            154 ;	 function divOut
                            155 ;	-----------------------------------------
                            156 ;	Register assignment is optimal.
                            157 ;	Stack space usage: 2 bytes.
   DC81                     158 _divOut:
   DC81 87            [ 2]  159 	psha
   DC82 89            [ 2]  160 	pshx
                            161 ;printf.c:44: num &= 0xffff; // just for testing the code  with 32 bit ints
                            162 ;printf.c:45: while (num>=div) {
   DC83 5F            [ 1]  163 	clrx
   DC84                     164 00101$:
   DC84 C6 00 A3      [ 4]  165 	lda	(_num + 1)
   DC87 9E E0 02      [ 4]  166 	sub	2,s
   DC8A C6 00 A2      [ 4]  167 	lda	_num
   DC8D 9E E2 01      [ 4]  168 	sbc	1,s
   DC90 25 16         [ 3]  169 	bcs	00112$
                            170 ;printf.c:46: num -= div;
   DC92 C6 00 A3      [ 4]  171 	lda	(_num + 1)
   DC95 9E E0 02      [ 4]  172 	sub	2,s
   DC98 C7 00 A3      [ 4]  173 	sta	(_num + 1)
   DC9B C6 00 A2      [ 4]  174 	lda	_num
   DC9E 9E E2 01      [ 4]  175 	sbc	1,s
   DCA1 C7 00 A2      [ 4]  176 	sta	_num
                            177 ;printf.c:47: dgt++;
   DCA4 AF 01         [ 2]  178 	aix	#1
   DCA6 20 DC         [ 3]  179 	bra	00101$
   DCA8                     180 00112$:
                            181 ;printf.c:49: if (zs || dgt>0) 
   DCA8 C6 00 A5      [ 4]  182 	lda	_zs
   DCAB 26 03         [ 3]  183 	bne	00104$
   DCAD 5D            [ 1]  184 	tstx
   DCAE 27 04         [ 3]  185 	beq	00107$
   DCB0                     186 00104$:
                            187 ;printf.c:50: outDgt(dgt);
   DCB0 9F            [ 1]  188 	txa
   DCB1 CD DC 4F      [ 5]  189 	jsr	_outDgt
   DCB4                     190 00107$:
   DCB4 A7 02         [ 2]  191 	ais	#2
   DCB6 81            [ 4]  192 	rts
                            193 ;------------------------------------------------------------
                            194 ;Allocation info for local variables in function 'tfp_printf'
                            195 ;------------------------------------------------------------
                            196 ;fmt                       Allocated to stack - sp -13
                            197 ;va                        Allocated to stack - sp -25
                            198 ;ch                        Allocated to stack - sp -26
                            199 ;p                         Allocated to stack - sp -28
                            200 ;lz                        Allocated to stack - sp -30
                            201 ;w                         Allocated to stack - sp -29
                            202 ;sloc0                     Allocated to stack - sp -18
                            203 ;sloc1                     Allocated to stack - sp -17
                            204 ;sloc2                     Allocated to stack - sp -20
                            205 ;sloc3                     Allocated to stack - sp -22
                            206 ;sloc4                     Allocated to stack - sp -23
                            207 ;------------------------------------------------------------
                            208 ;printf.c:53: void tfp_printf(char *fmt, ...)
                            209 ;	-----------------------------------------
                            210 ;	 function tfp_printf
                            211 ;	-----------------------------------------
                            212 ;	Register assignment might be sub-optimal.
                            213 ;	Stack space usage: 15 bytes.
   DCB7                     214 _tfp_printf:
   DCB7 A7 F1         [ 2]  215 	ais	#-15
                            216 ;printf.c:59: va_start(va,fmt);
   DCB9 95            [ 2]  217 	tsx
   DCBA AF 11         [ 2]  218 	aix	#17
   DCBC AF 02         [ 2]  219 	aix	#2
   DCBE 8B            [ 2]  220 	pshh
   DCBF 86            [ 2]  221 	pula
   DCC0 9E E7 06      [ 4]  222 	sta	6,s
   DCC3 9E EF 07      [ 4]  223 	stx	7,s
                            224 ;printf.c:61: while ((ch=*(fmt++))) {
   DCC6                     225 00136$:
   DCC6 9E E6 12      [ 4]  226 	lda	18,s
   DCC9 87            [ 2]  227 	psha
   DCCA 8A            [ 2]  228 	pulh
   DCCB 9E EE 13      [ 4]  229 	ldx	19,s
   DCCE F6            [ 2]  230 	lda	,x
   DCCF 9E E7 0D      [ 4]  231 	sta	13,s
   DCD2 AF 01         [ 2]  232 	aix	#1
   DCD4 8B            [ 2]  233 	pshh
   DCD5 86            [ 2]  234 	pula
   DCD6 9E E7 12      [ 4]  235 	sta	18,s
   DCD9 9E EF 13      [ 4]  236 	stx	19,s
   DCDC 95            [ 2]  237 	tsx
   DCDD E6 0C         [ 3]  238 	lda	12,x
   DCDF 6D 0C         [ 3]  239 	tst	12,x
   DCE1 26 03         [ 3]  240 	bne	00255$
   DCE3 CC DF 81      [ 3]  241 	jmp	00140$
   DCE6                     242 00255$:
                            243 ;printf.c:62: if (ch!='%') {
   DCE6 97            [ 1]  244 	tax
   DCE7 8C            [ 1]  245 	clrh
   DCE8 65 00 25      [ 3]  246 	cphx	#0x0025
   DCEB 27 05         [ 3]  247 	beq	00134$
                            248 ;printf.c:63: putchar(ch);
   DCED CD DC 26      [ 5]  249 	jsr	_putchar
   DCF0 20 D4         [ 3]  250 	bra	00136$
   DCF2                     251 00134$:
                            252 ;printf.c:66: char lz=0;
   DCF2 95            [ 2]  253 	tsx
   DCF3 4F            [ 1]  254 	clra
   DCF4 F7            [ 2]  255 	sta	,x
                            256 ;printf.c:67: char w=0;
   DCF5 E7 01         [ 3]  257 	sta	1,x
                            258 ;printf.c:68: ch=*(fmt++);
   DCF7 E6 11         [ 3]  259 	lda	17,x
   DCF9 87            [ 2]  260 	psha
   DCFA 8A            [ 2]  261 	pulh
   DCFB 9E EE 13      [ 4]  262 	ldx	19,s
   DCFE F6            [ 2]  263 	lda	,x
   DCFF 9E E7 05      [ 4]  264 	sta	5,s
   DD02 AF 01         [ 2]  265 	aix	#1
   DD04 8B            [ 2]  266 	pshh
   DD05 86            [ 2]  267 	pula
   DD06 9E E7 12      [ 4]  268 	sta	18,s
   DD09 9E EF 13      [ 4]  269 	stx	19,s
                            270 ;printf.c:69: if (ch=='0') {
   DD0C 9E EE 05      [ 4]  271 	ldx	5,s
   DD0F 8C            [ 1]  272 	clrh
   DD10 65 00 30      [ 3]  273 	cphx	#0x0030
   DD13 26 1B         [ 3]  274 	bne	00102$
                            275 ;printf.c:70: ch=*(fmt++);
   DD15 9E E6 12      [ 4]  276 	lda	18,s
   DD18 87            [ 2]  277 	psha
   DD19 8A            [ 2]  278 	pulh
   DD1A 9E EE 13      [ 4]  279 	ldx	19,s
   DD1D F6            [ 2]  280 	lda	,x
   DD1E 9E E7 05      [ 4]  281 	sta	5,s
   DD21 AF 01         [ 2]  282 	aix	#1
   DD23 8B            [ 2]  283 	pshh
   DD24 86            [ 2]  284 	pula
   DD25 9E E7 12      [ 4]  285 	sta	18,s
   DD28 9E EF 13      [ 4]  286 	stx	19,s
                            287 ;printf.c:71: lz=1;
   DD2B A6 01         [ 2]  288 	lda	#0x01
   DD2D 9E E7 01      [ 4]  289 	sta	1,s
   DD30                     290 00102$:
                            291 ;printf.c:62: if (ch!='%') {
   DD30 9E EE 05      [ 4]  292 	ldx	5,s
   DD33 8C            [ 1]  293 	clrh
                            294 ;printf.c:73: if (ch>='0' && ch<='9') {
   DD34 65 00 30      [ 3]  295 	cphx	#0x0030
   DD37 91 59         [ 3]  296 	blt	00108$
   DD39 65 00 39      [ 3]  297 	cphx	#0x0039
   DD3C 92 54         [ 3]  298 	bgt	00108$
                            299 ;printf.c:74: w=0;
   DD3E 95            [ 2]  300 	tsx
   DD3F 4F            [ 1]  301 	clra
   DD40 E7 01         [ 3]  302 	sta	1,x
                            303 ;printf.c:75: while (ch>='0' && ch<='9') {
   DD42 E6 11         [ 3]  304 	lda	17,x
   DD44 E7 0D         [ 3]  305 	sta	13,x
   DD46 E6 12         [ 3]  306 	lda	18,x
   DD48 E7 0E         [ 3]  307 	sta	14,x
   DD4A                     308 00104$:
                            309 ;printf.c:62: if (ch!='%') {
   DD4A 9E EE 05      [ 4]  310 	ldx	5,s
   DD4D 8C            [ 1]  311 	clrh
                            312 ;printf.c:75: while (ch>='0' && ch<='9') {
   DD4E 65 00 30      [ 3]  313 	cphx	#0x0030
   DD51 91 33         [ 3]  314 	blt	00171$
   DD53 65 00 39      [ 3]  315 	cphx	#0x0039
   DD56 92 2E         [ 3]  316 	bgt	00171$
                            317 ;printf.c:76: w=(((w<<2)+w)<<1)+ch-'0';
   DD58 95            [ 2]  318 	tsx
   DD59 E6 01         [ 3]  319 	lda	1,x
   DD5B 48            [ 1]  320 	lsla	
   DD5C 48            [ 1]  321 	lsla	
   DD5D EB 01         [ 3]  322 	add	1,x
   DD5F 48            [ 1]  323 	lsla	
   DD60 EB 04         [ 3]  324 	add	4,x
   DD62 A0 30         [ 2]  325 	sub	#0x30
   DD64 E7 01         [ 3]  326 	sta	1,x
                            327 ;printf.c:77: ch=*fmt++;
   DD66 E6 0D         [ 3]  328 	lda	13,x
   DD68 87            [ 2]  329 	psha
   DD69 8A            [ 2]  330 	pulh
   DD6A 9E EE 0F      [ 4]  331 	ldx	15,s
   DD6D F6            [ 2]  332 	lda	,x
   DD6E 9E E7 05      [ 4]  333 	sta	5,s
   DD71 AF 01         [ 2]  334 	aix	#1
   DD73 8B            [ 2]  335 	pshh
   DD74 86            [ 2]  336 	pula
   DD75 9E E7 0E      [ 4]  337 	sta	14,s
   DD78 9E EF 0F      [ 4]  338 	stx	15,s
   DD7B 95            [ 2]  339 	tsx
   DD7C E6 0D         [ 3]  340 	lda	13,x
   DD7E E7 11         [ 3]  341 	sta	17,x
   DD80 E6 0E         [ 3]  342 	lda	14,x
   DD82 E7 12         [ 3]  343 	sta	18,x
   DD84 20 C4         [ 3]  344 	bra	00104$
   DD86                     345 00171$:
   DD86 9E E6 0E      [ 4]  346 	lda	14,s
   DD89 9E E7 12      [ 4]  347 	sta	18,s
   DD8C 9E E6 0F      [ 4]  348 	lda	15,s
   DD8F 9E E7 13      [ 4]  349 	sta	19,s
   DD92                     350 00108$:
                            351 ;printf.c:80: bf=buf;
   DD92 A6 00         [ 2]  352 	lda	#>_buf
   DD94 C7 00 94      [ 4]  353 	sta	_bf
   DD97 A6 96         [ 2]  354 	lda	#_buf
   DD99 C7 00 95      [ 4]  355 	sta	(_bf + 1)
                            356 ;printf.c:81: p=bf;
   DD9C A6 00         [ 2]  357 	lda	#>_buf
   DD9E 9E E7 03      [ 4]  358 	sta	3,s
   DDA1 A6 96         [ 2]  359 	lda	#_buf
   DDA3 9E E7 04      [ 4]  360 	sta	4,s
                            361 ;printf.c:82: zs=0;
   DDA6 4F            [ 1]  362 	clra
   DDA7 C7 00 A5      [ 4]  363 	sta	_zs
                            364 ;printf.c:83: switch (ch) {
   DDAA 9E E6 05      [ 4]  365 	lda	5,s
   DDAD A1 00         [ 2]  366 	cmp	#0x00
   DDAF 26 03         [ 3]  367 	bne	00262$
   DDB1 CC DF 81      [ 3]  368 	jmp	00140$
   DDB4                     369 00262$:
   DDB4 A3 25         [ 2]  370 	cpx	#0x25
   DDB6 26 09         [ 3]  371 	bne	00263$
   DDB8 8B            [ 2]  372 	pshh
   DDB9 86            [ 2]  373 	pula
   DDBA A1 00         [ 2]  374 	cmp	#0x00
   DDBC 26 03         [ 3]  375 	bne	00263$
   DDBE CC DF 0C      [ 3]  376 	jmp	00120$
   DDC1                     377 00263$:
                            378 ;printf.c:88: num=va_arg(va, unsigned int);
   DDC1 9E E6 07      [ 4]  379 	lda	7,s
   DDC4 AB 02         [ 2]  380 	add	#0x02
   DDC6 9E E7 0F      [ 4]  381 	sta	15,s
   DDC9 9E E6 06      [ 4]  382 	lda	6,s
   DDCC A9 00         [ 2]  383 	adc	#0
   DDCE 9E E7 0E      [ 4]  384 	sta	14,s
                            385 ;printf.c:83: switch (ch) {
   DDD1 A3 58         [ 2]  386 	cpx	#0x58
   DDD3 26 05         [ 3]  387 	bne	00264$
   DDD5 8B            [ 2]  388 	pshh
   DDD6 86            [ 2]  389 	pula
   DDD7 41 00 03      [ 4]  390 	cbeqa	#0x00,00266$
   DDDA                     391 00264$:
   DDDA 4F            [ 1]  392 	clra
   DDDB 20 02         [ 3]  393 	bra	00265$
   DDDD                     394 00266$:
   DDDD A6 01         [ 2]  395 	lda	#0x01
   DDDF                     396 00265$:
   DDDF 9E E7 0D      [ 4]  397 	sta	13,s
                            398 ;printf.c:88: num=va_arg(va, unsigned int);
   DDE2 9E E6 0F      [ 4]  399 	lda	15,s
   DDE5 A0 02         [ 2]  400 	sub	#0x02
   DDE7 9E E7 0C      [ 4]  401 	sta	12,s
   DDEA 9E E6 0E      [ 4]  402 	lda	14,s
   DDED A2 00         [ 2]  403 	sbc	#0
   DDEF 9E E7 0B      [ 4]  404 	sta	11,s
   DDF2 9E E6 0C      [ 4]  405 	lda	12,s
   DDF5 9E E7 0A      [ 4]  406 	sta	10,s
   DDF8 9E E6 0B      [ 4]  407 	lda	11,s
   DDFB 9E E7 09      [ 4]  408 	sta	9,s
                            409 ;printf.c:83: switch (ch) {
   DDFE 9E 6D 0D      [ 4]  410 	tst	13,s
   DE01 27 03         [ 3]  411 	beq	00267$
   DE03 CC DE A1      [ 3]  412 	jmp	00117$
   DE06                     413 00267$:
   DE06 A3 63         [ 2]  414 	cpx	#0x63
   DE08 26 09         [ 3]  415 	bne	00268$
   DE0A 8B            [ 2]  416 	pshh
   DE0B 86            [ 2]  417 	pula
   DE0C A1 00         [ 2]  418 	cmp	#0x00
   DE0E 26 03         [ 3]  419 	bne	00268$
   DE10 CC DE D9      [ 3]  420 	jmp	00118$
   DE13                     421 00268$:
   DE13 A3 64         [ 2]  422 	cpx	#0x64
   DE15 26 05         [ 3]  423 	bne	00269$
   DE17 8B            [ 2]  424 	pshh
   DE18 86            [ 2]  425 	pula
   DE19 41 00 03      [ 4]  426 	cbeqa	#0x00,00271$
   DE1C                     427 00269$:
   DE1C 4F            [ 1]  428 	clra
   DE1D 20 02         [ 3]  429 	bra	00270$
   DE1F                     430 00271$:
   DE1F A6 01         [ 2]  431 	lda	#0x01
   DE21                     432 00270$:
   DE21 9E E7 08      [ 4]  433 	sta	8,s
   DE24 9E 6D 08      [ 4]  434 	tst	8,s
   DE27 26 1E         [ 3]  435 	bne	00112$
   DE29 A3 73         [ 2]  436 	cpx	#0x73
   DE2B 26 09         [ 3]  437 	bne	00273$
   DE2D 8B            [ 2]  438 	pshh
   DE2E 86            [ 2]  439 	pula
   DE2F A1 00         [ 2]  440 	cmp	#0x00
   DE31 26 03         [ 3]  441 	bne	00273$
   DE33 CC DE F1      [ 3]  442 	jmp	00119$
   DE36                     443 00273$:
   DE36 A3 75         [ 2]  444 	cpx	#0x75
   DE38 26 05         [ 3]  445 	bne	00274$
   DE3A 8B            [ 2]  446 	pshh
   DE3B 86            [ 2]  447 	pula
   DE3C 41 00 08      [ 4]  448 	cbeqa	#0x00,00112$
   DE3F                     449 00274$:
   DE3F 65 00 78      [ 3]  450 	cphx	#0x0078
   DE42 27 5D         [ 3]  451 	beq	00117$
   DE44 CC DF 11      [ 3]  452 	jmp	00122$
                            453 ;printf.c:87: case 'd' : 
   DE47                     454 00112$:
                            455 ;printf.c:88: num=va_arg(va, unsigned int);
   DE47 95            [ 2]  456 	tsx
   DE48 E6 0D         [ 3]  457 	lda	13,x
   DE4A E7 05         [ 3]  458 	sta	5,x
   DE4C E6 0E         [ 3]  459 	lda	14,x
   DE4E E7 06         [ 3]  460 	sta	6,x
   DE50 E6 08         [ 3]  461 	lda	8,x
   DE52 87            [ 2]  462 	psha
   DE53 8A            [ 2]  463 	pulh
   DE54 9E EE 0A      [ 4]  464 	ldx	10,s
   DE57 E6 01         [ 3]  465 	lda	1,x
   DE59 FE            [ 2]  466 	ldx	,x
   DE5A CF 00 A2      [ 4]  467 	stx	_num
   DE5D C7 00 A3      [ 4]  468 	sta	(_num + 1)
                            469 ;printf.c:89: if (ch=='d' && (int)num<0) {
   DE60 9E 6D 08      [ 4]  470 	tst	8,s
   DE63 27 1A         [ 3]  471 	beq	00114$
   DE65 87            [ 2]  472 	psha
   DE66 9F            [ 1]  473 	txa
   DE67 A0 00         [ 2]  474 	sub	#0x00
   DE69 86            [ 2]  475 	pula
   DE6A 90 13         [ 3]  476 	bge	00114$
                            477 ;printf.c:90: num = -(int)num;
   DE6C 40            [ 1]  478 	nega
   DE6D C7 00 A3      [ 4]  479 	sta	(_num + 1)
   DE70 4F            [ 1]  480 	clra
   DE71 89            [ 2]  481 	pshx
   DE72 9E E2 01      [ 4]  482 	sbc	1,s
   DE75 A7 01         [ 2]  483 	ais	#1
   DE77 C7 00 A2      [ 4]  484 	sta	_num
                            485 ;printf.c:91: out('-');
   DE7A A6 2D         [ 2]  486 	lda	#0x2d
   DE7C CD DC 3D      [ 5]  487 	jsr	_out
   DE7F                     488 00114$:
                            489 ;printf.c:93: divOut(10000);
   DE7F A6 10         [ 2]  490 	lda	#0x10
   DE81 AE 27         [ 2]  491 	ldx	#0x27
   DE83 CD DC 81      [ 5]  492 	jsr	_divOut
                            493 ;printf.c:94: divOut(1000);
   DE86 A6 E8         [ 2]  494 	lda	#0xe8
   DE88 AE 03         [ 2]  495 	ldx	#0x03
   DE8A CD DC 81      [ 5]  496 	jsr	_divOut
                            497 ;printf.c:95: divOut(100);
   DE8D A6 64         [ 2]  498 	lda	#0x64
   DE8F 5F            [ 1]  499 	clrx
   DE90 CD DC 81      [ 5]  500 	jsr	_divOut
                            501 ;printf.c:96: divOut(10);
   DE93 A6 0A         [ 2]  502 	lda	#0x0a
   DE95 5F            [ 1]  503 	clrx
   DE96 CD DC 81      [ 5]  504 	jsr	_divOut
                            505 ;printf.c:97: outDgt(num);
   DE99 C6 00 A3      [ 4]  506 	lda	(_num + 1)
   DE9C CD DC 4F      [ 5]  507 	jsr	_outDgt
                            508 ;printf.c:98: break;
   DE9F 20 70         [ 3]  509 	bra	00122$
                            510 ;printf.c:100: case 'X' : 
   DEA1                     511 00117$:
                            512 ;printf.c:101: uc= ch=='X';
   DEA1 95            [ 2]  513 	tsx
   DEA2 E6 0C         [ 3]  514 	lda	12,x
   DEA4 C7 00 A4      [ 4]  515 	sta	_uc
                            516 ;printf.c:102: num=va_arg(va, unsigned int);
   DEA7 E6 0D         [ 3]  517 	lda	13,x
   DEA9 E7 05         [ 3]  518 	sta	5,x
   DEAB E6 0E         [ 3]  519 	lda	14,x
   DEAD E7 06         [ 3]  520 	sta	6,x
   DEAF E6 08         [ 3]  521 	lda	8,x
   DEB1 87            [ 2]  522 	psha
   DEB2 8A            [ 2]  523 	pulh
   DEB3 9E EE 0A      [ 4]  524 	ldx	10,s
   DEB6 F6            [ 2]  525 	lda	,x
   DEB7 C7 00 A2      [ 4]  526 	sta	_num
   DEBA E6 01         [ 3]  527 	lda	1,x
   DEBC C7 00 A3      [ 4]  528 	sta	(_num + 1)
                            529 ;printf.c:103: divOut(0x1000);
   DEBF 4F            [ 1]  530 	clra
   DEC0 AE 10         [ 2]  531 	ldx	#0x10
   DEC2 CD DC 81      [ 5]  532 	jsr	_divOut
                            533 ;printf.c:104: divOut(0x100);
   DEC5 4F            [ 1]  534 	clra
   DEC6 AE 01         [ 2]  535 	ldx	#0x01
   DEC8 CD DC 81      [ 5]  536 	jsr	_divOut
                            537 ;printf.c:105: divOut(0x10);
   DECB A6 10         [ 2]  538 	lda	#0x10
   DECD 5F            [ 1]  539 	clrx
   DECE CD DC 81      [ 5]  540 	jsr	_divOut
                            541 ;printf.c:106: outDgt(num);
   DED1 C6 00 A3      [ 4]  542 	lda	(_num + 1)
   DED4 CD DC 4F      [ 5]  543 	jsr	_outDgt
                            544 ;printf.c:107: break;
   DED7 20 38         [ 3]  545 	bra	00122$
                            546 ;printf.c:108: case 'c' : 
   DED9                     547 00118$:
                            548 ;printf.c:109: out((char)(va_arg(va, int)));
   DED9 95            [ 2]  549 	tsx
   DEDA E6 0D         [ 3]  550 	lda	13,x
   DEDC E7 05         [ 3]  551 	sta	5,x
   DEDE E6 0E         [ 3]  552 	lda	14,x
   DEE0 E7 06         [ 3]  553 	sta	6,x
   DEE2 E6 0A         [ 3]  554 	lda	10,x
   DEE4 87            [ 2]  555 	psha
   DEE5 8A            [ 2]  556 	pulh
   DEE6 9E EE 0C      [ 4]  557 	ldx	12,s
   DEE9 E6 01         [ 3]  558 	lda	1,x
   DEEB FE            [ 2]  559 	ldx	,x
   DEEC CD DC 3D      [ 5]  560 	jsr	_out
                            561 ;printf.c:110: break;
   DEEF 20 20         [ 3]  562 	bra	00122$
                            563 ;printf.c:111: case 's' : 
   DEF1                     564 00119$:
                            565 ;printf.c:112: p=va_arg(va, char*);
   DEF1 95            [ 2]  566 	tsx
   DEF2 E6 0D         [ 3]  567 	lda	13,x
   DEF4 E7 05         [ 3]  568 	sta	5,x
   DEF6 E6 0E         [ 3]  569 	lda	14,x
   DEF8 E7 06         [ 3]  570 	sta	6,x
   DEFA E6 0A         [ 3]  571 	lda	10,x
   DEFC 87            [ 2]  572 	psha
   DEFD 8A            [ 2]  573 	pulh
   DEFE 9E EE 0C      [ 4]  574 	ldx	12,s
   DF01 F6            [ 2]  575 	lda	,x
   DF02 9E E7 03      [ 4]  576 	sta	3,s
   DF05 E6 01         [ 3]  577 	lda	1,x
   DF07 9E E7 04      [ 4]  578 	sta	4,s
                            579 ;printf.c:113: break;
   DF0A 20 05         [ 3]  580 	bra	00122$
                            581 ;printf.c:114: case '%' :
   DF0C                     582 00120$:
                            583 ;printf.c:115: out('%');
   DF0C A6 25         [ 2]  584 	lda	#0x25
   DF0E CD DC 3D      [ 5]  585 	jsr	_out
                            586 ;printf.c:118: }
   DF11                     587 00122$:
                            588 ;printf.c:119: *bf=0;
   DF11 C6 00 94      [ 4]  589 	lda	_bf
   DF14 CE 00 95      [ 4]  590 	ldx	(_bf + 1)
   DF17 87            [ 2]  591 	psha
   DF18 8A            [ 2]  592 	pulh
   DF19 4F            [ 1]  593 	clra
   DF1A F7            [ 2]  594 	sta	,x
                            595 ;printf.c:120: bf=p;
   DF1B 95            [ 2]  596 	tsx
   DF1C E6 02         [ 3]  597 	lda	2,x
   DF1E C7 00 94      [ 4]  598 	sta	_bf
   DF21 E6 03         [ 3]  599 	lda	3,x
   DF23 C7 00 95      [ 4]  600 	sta	(_bf + 1)
                            601 ;printf.c:121: while (*bf++ && w > 0)
   DF26 E6 01         [ 3]  602 	lda	1,x
   DF28                     603 00124$:
   DF28 CE 00 94      [ 4]  604 	ldx	_bf
   DF2B 89            [ 2]  605 	pshx
   DF2C 8A            [ 2]  606 	pulh
   DF2D CE 00 95      [ 4]  607 	ldx	(_bf + 1)
   DF30 87            [ 2]  608 	psha
   DF31 F6            [ 2]  609 	lda	,x
   DF32 9E E7 09      [ 4]  610 	sta	9,s
   DF35 86            [ 2]  611 	pula
   DF36 AF 01         [ 2]  612 	aix	#1
   DF38 CF 00 95      [ 4]  613 	stx	(_bf + 1)
   DF3B 89            [ 2]  614 	pshx
   DF3C 8B            [ 2]  615 	pshh
   DF3D 88            [ 2]  616 	pulx
   DF3E CF 00 94      [ 4]  617 	stx	_bf
   DF41 88            [ 2]  618 	pulx
   DF42 9E 6D 08      [ 4]  619 	tst	8,s
   DF45 27 06         [ 3]  620 	beq	00168$
   DF47 4D            [ 1]  621 	tsta
   DF48 27 03         [ 3]  622 	beq	00168$
                            623 ;printf.c:122: w--;
   DF4A 4A            [ 1]  624 	deca
   DF4B 20 DB         [ 3]  625 	bra	00124$
                            626 ;printf.c:123: while (w-- > 0) 
   DF4D                     627 00168$:
   DF4D                     628 00127$:
   DF4D 97            [ 1]  629 	tax
   DF4E 4A            [ 1]  630 	deca
   DF4F 5D            [ 1]  631 	tstx
   DF50 27 15         [ 3]  632 	beq	00170$
                            633 ;printf.c:124: putchar(lz ? '0' : ' ');
   DF52 9E 6D 01      [ 4]  634 	tst	1,s
   DF55 27 05         [ 3]  635 	beq	00142$
   DF57 45 00 30      [ 3]  636 	ldhx	#0x0030
   DF5A 20 03         [ 3]  637 	bra	00143$
   DF5C                     638 00142$:
   DF5C 45 00 20      [ 3]  639 	ldhx	#0x0020
   DF5F                     640 00143$:
   DF5F 87            [ 2]  641 	psha
   DF60 9F            [ 1]  642 	txa
   DF61 CD DC 26      [ 5]  643 	jsr	_putchar
   DF64 86            [ 2]  644 	pula
   DF65 20 E6         [ 3]  645 	bra	00127$
                            646 ;printf.c:125: while ((ch= *p++))
   DF67                     647 00170$:
   DF67 9E E6 03      [ 4]  648 	lda	3,s
   DF6A 87            [ 2]  649 	psha
   DF6B 8A            [ 2]  650 	pulh
   DF6C 9E EE 04      [ 4]  651 	ldx	4,s
   DF6F                     652 00130$:
   DF6F F6            [ 2]  653 	lda	,x
   DF70 AF 01         [ 2]  654 	aix	#1
   DF72 4D            [ 1]  655 	tsta
   DF73 26 03         [ 3]  656 	bne	00282$
   DF75 CC DC C6      [ 3]  657 	jmp	00136$
   DF78                     658 00282$:
                            659 ;printf.c:126: putchar(ch);
   DF78 89            [ 2]  660 	pshx
   DF79 8B            [ 2]  661 	pshh
   DF7A CD DC 26      [ 5]  662 	jsr	_putchar
   DF7D 8A            [ 2]  663 	pulh
   DF7E 88            [ 2]  664 	pulx
   DF7F 20 EE         [ 3]  665 	bra	00130$
                            666 ;printf.c:130: va_end(va);
   DF81                     667 00140$:
   DF81 A7 0F         [ 2]  668 	ais	#15
   DF83 81            [ 4]  669 	rts
                            670 	.area CSEG    (CODE)
                            671 	.area CONST   (CODE)
                            672 	.area XINIT   (CODE)
                            673 	.area CABS    (ABS,CODE)
