;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module printf
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
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _putchar
	.globl _tfp_printf
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DSEG    (PAG)
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
_bf:
	.ds 2
_buf:
	.ds 12
_num:
	.ds 2
_uc:
	.ds 1
_zs:
	.ds 1
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
;Allocation info for local variables in function 'out'
;------------------------------------------------------------
;c                         Allocated to registers a 
;------------------------------------------------------------
;printf.c:33: static void out(char c) {
;	-----------------------------------------
;	 function out
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_out:
;printf.c:34: *bf++ = c;
	ldx	_bf
	pshx
	pulh
	ldx	(_bf + 1)
	sta	,x
	ldhx	#_bf
	inc	1,x
	bne	00103$
	inc	,x
00103$:
	rts
;------------------------------------------------------------
;Allocation info for local variables in function 'outDgt'
;------------------------------------------------------------
;dgt                       Allocated to registers h 
;------------------------------------------------------------
;printf.c:37: static void outDgt(char dgt) {
;	-----------------------------------------
;	 function outDgt
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_outDgt:
	psha
	pulh
;printf.c:38: out(dgt+(dgt<10 ? '0' : (uc ? 'A' : 'a')-10));
	pshh
	pula
	cmp	#0x0a
	bcc	00103$
	clrx
	lda	#0x30
	bra	00104$
00103$:
	lda	_uc
	beq	00105$
	clrx
	lda	#0x41
	bra	00106$
00105$:
	clrx
	lda	#0x61
00106$:
	sub	#0x0a
	psha
	rola	
	clra	
	sbc	#0x00
	tax
	pula
00104$:
	pshh
	add	1,s
	ais	#1
	jsr	_out
;printf.c:39: zs=1;
	lda	#0x01
	sta	_zs
	rts
;------------------------------------------------------------
;Allocation info for local variables in function 'divOut'
;------------------------------------------------------------
;div                       Allocated to stack - sp -4
;dgt                       Allocated to registers 
;------------------------------------------------------------
;printf.c:42: static void divOut(unsigned int div) {
;	-----------------------------------------
;	 function divOut
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 2 bytes.
_divOut:
	psha
	pshx
;printf.c:44: num &= 0xffff; // just for testing the code  with 32 bit ints
;printf.c:45: while (num>=div) {
	clrx
00101$:
	lda	(_num + 1)
	sub	2,s
	lda	_num
	sbc	1,s
	bcs	00112$
;printf.c:46: num -= div;
	lda	(_num + 1)
	sub	2,s
	sta	(_num + 1)
	lda	_num
	sbc	1,s
	sta	_num
;printf.c:47: dgt++;
	aix	#1
	bra	00101$
00112$:
;printf.c:49: if (zs || dgt>0) 
	lda	_zs
	bne	00104$
	tstx
	beq	00107$
00104$:
;printf.c:50: outDgt(dgt);
	txa
	jsr	_outDgt
00107$:
	ais	#2
	rts
;------------------------------------------------------------
;Allocation info for local variables in function 'tfp_printf'
;------------------------------------------------------------
;fmt                       Allocated to stack - sp -13
;va                        Allocated to stack - sp -25
;ch                        Allocated to stack - sp -26
;p                         Allocated to stack - sp -28
;lz                        Allocated to stack - sp -30
;w                         Allocated to stack - sp -29
;sloc0                     Allocated to stack - sp -18
;sloc1                     Allocated to stack - sp -17
;sloc2                     Allocated to stack - sp -20
;sloc3                     Allocated to stack - sp -22
;sloc4                     Allocated to stack - sp -23
;------------------------------------------------------------
;printf.c:53: void tfp_printf(char *fmt, ...)
;	-----------------------------------------
;	 function tfp_printf
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 15 bytes.
_tfp_printf:
	ais	#-15
;printf.c:59: va_start(va,fmt);
	tsx
	aix	#17
	aix	#2
	pshh
	pula
	sta	6,s
	stx	7,s
;printf.c:61: while ((ch=*(fmt++))) {
00136$:
	lda	18,s
	psha
	pulh
	ldx	19,s
	lda	,x
	sta	13,s
	aix	#1
	pshh
	pula
	sta	18,s
	stx	19,s
	tsx
	lda	12,x
	tst	12,x
	bne	00255$
	jmp	00140$
00255$:
;printf.c:62: if (ch!='%') {
	tax
	clrh
	cphx	#0x0025
	beq	00134$
;printf.c:63: putchar(ch);
	jsr	_putchar
	bra	00136$
00134$:
;printf.c:66: char lz=0;
	tsx
	clra
	sta	,x
;printf.c:67: char w=0;
	sta	1,x
;printf.c:68: ch=*(fmt++);
	lda	17,x
	psha
	pulh
	ldx	19,s
	lda	,x
	sta	5,s
	aix	#1
	pshh
	pula
	sta	18,s
	stx	19,s
;printf.c:69: if (ch=='0') {
	ldx	5,s
	clrh
	cphx	#0x0030
	bne	00102$
;printf.c:70: ch=*(fmt++);
	lda	18,s
	psha
	pulh
	ldx	19,s
	lda	,x
	sta	5,s
	aix	#1
	pshh
	pula
	sta	18,s
	stx	19,s
;printf.c:71: lz=1;
	lda	#0x01
	sta	1,s
00102$:
;printf.c:62: if (ch!='%') {
	ldx	5,s
	clrh
;printf.c:73: if (ch>='0' && ch<='9') {
	cphx	#0x0030
	blt	00108$
	cphx	#0x0039
	bgt	00108$
;printf.c:74: w=0;
	tsx
	clra
	sta	1,x
;printf.c:75: while (ch>='0' && ch<='9') {
	lda	17,x
	sta	13,x
	lda	18,x
	sta	14,x
00104$:
;printf.c:62: if (ch!='%') {
	ldx	5,s
	clrh
;printf.c:75: while (ch>='0' && ch<='9') {
	cphx	#0x0030
	blt	00171$
	cphx	#0x0039
	bgt	00171$
;printf.c:76: w=(((w<<2)+w)<<1)+ch-'0';
	tsx
	lda	1,x
	lsla	
	lsla	
	add	1,x
	lsla	
	add	4,x
	sub	#0x30
	sta	1,x
;printf.c:77: ch=*fmt++;
	lda	13,x
	psha
	pulh
	ldx	15,s
	lda	,x
	sta	5,s
	aix	#1
	pshh
	pula
	sta	14,s
	stx	15,s
	tsx
	lda	13,x
	sta	17,x
	lda	14,x
	sta	18,x
	bra	00104$
00171$:
	lda	14,s
	sta	18,s
	lda	15,s
	sta	19,s
00108$:
;printf.c:80: bf=buf;
	lda	#>_buf
	sta	_bf
	lda	#_buf
	sta	(_bf + 1)
;printf.c:81: p=bf;
	lda	#>_buf
	sta	3,s
	lda	#_buf
	sta	4,s
;printf.c:82: zs=0;
	clra
	sta	_zs
;printf.c:83: switch (ch) {
	lda	5,s
	cmp	#0x00
	bne	00262$
	jmp	00140$
00262$:
	cpx	#0x25
	bne	00263$
	pshh
	pula
	cmp	#0x00
	bne	00263$
	jmp	00120$
00263$:
;printf.c:88: num=va_arg(va, unsigned int);
	lda	7,s
	add	#0x02
	sta	15,s
	lda	6,s
	adc	#0
	sta	14,s
;printf.c:83: switch (ch) {
	cpx	#0x58
	bne	00264$
	pshh
	pula
	cbeqa	#0x00,00266$
00264$:
	clra
	bra	00265$
00266$:
	lda	#0x01
00265$:
	sta	13,s
;printf.c:88: num=va_arg(va, unsigned int);
	lda	15,s
	sub	#0x02
	sta	12,s
	lda	14,s
	sbc	#0
	sta	11,s
	lda	12,s
	sta	10,s
	lda	11,s
	sta	9,s
;printf.c:83: switch (ch) {
	tst	13,s
	beq	00267$
	jmp	00117$
00267$:
	cpx	#0x63
	bne	00268$
	pshh
	pula
	cmp	#0x00
	bne	00268$
	jmp	00118$
00268$:
	cpx	#0x64
	bne	00269$
	pshh
	pula
	cbeqa	#0x00,00271$
00269$:
	clra
	bra	00270$
00271$:
	lda	#0x01
00270$:
	sta	8,s
	tst	8,s
	bne	00112$
	cpx	#0x73
	bne	00273$
	pshh
	pula
	cmp	#0x00
	bne	00273$
	jmp	00119$
00273$:
	cpx	#0x75
	bne	00274$
	pshh
	pula
	cbeqa	#0x00,00112$
00274$:
	cphx	#0x0078
	beq	00117$
	jmp	00122$
;printf.c:87: case 'd' : 
00112$:
;printf.c:88: num=va_arg(va, unsigned int);
	tsx
	lda	13,x
	sta	5,x
	lda	14,x
	sta	6,x
	lda	8,x
	psha
	pulh
	ldx	10,s
	lda	1,x
	ldx	,x
	stx	_num
	sta	(_num + 1)
;printf.c:89: if (ch=='d' && (int)num<0) {
	tst	8,s
	beq	00114$
	psha
	txa
	sub	#0x00
	pula
	bge	00114$
;printf.c:90: num = -(int)num;
	nega
	sta	(_num + 1)
	clra
	pshx
	sbc	1,s
	ais	#1
	sta	_num
;printf.c:91: out('-');
	lda	#0x2d
	jsr	_out
00114$:
;printf.c:93: divOut(10000);
	lda	#0x10
	ldx	#0x27
	jsr	_divOut
;printf.c:94: divOut(1000);
	lda	#0xe8
	ldx	#0x03
	jsr	_divOut
;printf.c:95: divOut(100);
	lda	#0x64
	clrx
	jsr	_divOut
;printf.c:96: divOut(10);
	lda	#0x0a
	clrx
	jsr	_divOut
;printf.c:97: outDgt(num);
	lda	(_num + 1)
	jsr	_outDgt
;printf.c:98: break;
	bra	00122$
;printf.c:100: case 'X' : 
00117$:
;printf.c:101: uc= ch=='X';
	tsx
	lda	12,x
	sta	_uc
;printf.c:102: num=va_arg(va, unsigned int);
	lda	13,x
	sta	5,x
	lda	14,x
	sta	6,x
	lda	8,x
	psha
	pulh
	ldx	10,s
	lda	,x
	sta	_num
	lda	1,x
	sta	(_num + 1)
;printf.c:103: divOut(0x1000);
	clra
	ldx	#0x10
	jsr	_divOut
;printf.c:104: divOut(0x100);
	clra
	ldx	#0x01
	jsr	_divOut
;printf.c:105: divOut(0x10);
	lda	#0x10
	clrx
	jsr	_divOut
;printf.c:106: outDgt(num);
	lda	(_num + 1)
	jsr	_outDgt
;printf.c:107: break;
	bra	00122$
;printf.c:108: case 'c' : 
00118$:
;printf.c:109: out((char)(va_arg(va, int)));
	tsx
	lda	13,x
	sta	5,x
	lda	14,x
	sta	6,x
	lda	10,x
	psha
	pulh
	ldx	12,s
	lda	1,x
	ldx	,x
	jsr	_out
;printf.c:110: break;
	bra	00122$
;printf.c:111: case 's' : 
00119$:
;printf.c:112: p=va_arg(va, char*);
	tsx
	lda	13,x
	sta	5,x
	lda	14,x
	sta	6,x
	lda	10,x
	psha
	pulh
	ldx	12,s
	lda	,x
	sta	3,s
	lda	1,x
	sta	4,s
;printf.c:113: break;
	bra	00122$
;printf.c:114: case '%' :
00120$:
;printf.c:115: out('%');
	lda	#0x25
	jsr	_out
;printf.c:118: }
00122$:
;printf.c:119: *bf=0;
	lda	_bf
	ldx	(_bf + 1)
	psha
	pulh
	clra
	sta	,x
;printf.c:120: bf=p;
	tsx
	lda	2,x
	sta	_bf
	lda	3,x
	sta	(_bf + 1)
;printf.c:121: while (*bf++ && w > 0)
	lda	1,x
00124$:
	ldx	_bf
	pshx
	pulh
	ldx	(_bf + 1)
	psha
	lda	,x
	sta	9,s
	pula
	aix	#1
	stx	(_bf + 1)
	pshx
	pshh
	pulx
	stx	_bf
	pulx
	tst	8,s
	beq	00168$
	tsta
	beq	00168$
;printf.c:122: w--;
	deca
	bra	00124$
;printf.c:123: while (w-- > 0) 
00168$:
00127$:
	tax
	deca
	tstx
	beq	00170$
;printf.c:124: putchar(lz ? '0' : ' ');
	tst	1,s
	beq	00142$
	ldhx	#0x0030
	bra	00143$
00142$:
	ldhx	#0x0020
00143$:
	psha
	txa
	jsr	_putchar
	pula
	bra	00127$
;printf.c:125: while ((ch= *p++))
00170$:
	lda	3,s
	psha
	pulh
	ldx	4,s
00130$:
	lda	,x
	aix	#1
	tsta
	bne	00282$
	jmp	00136$
00282$:
;printf.c:126: putchar(ch);
	pshx
	pshh
	jsr	_putchar
	pulh
	pulx
	bra	00130$
;printf.c:130: va_end(va);
00140$:
	ais	#15
	rts
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
