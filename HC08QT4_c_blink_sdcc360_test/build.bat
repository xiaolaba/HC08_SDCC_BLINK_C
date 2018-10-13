@echo. off

:: qt4_blink.c,
:: ref, source code, http://hc08web.de/#examples
:: SDCC manual, http://sdcc.sourceforge.net/doc/sdccman.pdf
:: see page 29, Command line option, select target MCU
:: how to compile

:: xiaolaba, 2018-OCT-12


sdcc -mhc08 --data-loc 0x80 --code-loc 0xEE00 --stack-loc 0xFF qt4_blink.c -o qt4_blink.S19


::goto end

mkdir output
copy *.s19 .\output\
move *.cdb .\output\
move *.lk  .\output\
move *.lst .\output\
move *.map .\output\
move *.rel .\output\
::move *.rst .\output\
move *.sym .\output\
move *.asm .\output\

:: clear screen
cls

@echo.
@echo qt4_blink.rst is the disassembly code and cpu cycle counter list
@echo qt4_blink.s19 is the firmware
:end

pause