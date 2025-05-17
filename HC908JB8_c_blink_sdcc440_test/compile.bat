sdcc -v --version
:: sdcc 4.40
::sdcc



:: blink.c, source code, http://www.sparetimelabs.com/funwith08/funwith08.php#blinkled
:: SDCC manual, http://sdcc.sourceforge.net/doc/sdccman.pdf
:: see page 29, Command line option, select target MCU
:: how to compile
:: xiaolaba, 2018-JUN-05

mkdir output
::sdcc -mhc08 blink.c
sdcc -mhc08 --stack-loc 0x013F --code-loc 0xDC00 blink_JB8.c -o blink_JB8.s19

echo off
move *.cdb .\output\
move *.lk  .\output\
move *.lst .\output\
move *.map .\output\
move *.rel .\output\
move *.rst .\output\
move *.sym .\output\
move *.asm .\output\
pause