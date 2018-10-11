::sdcc -mhc08 --stack-auto -c hello_world.c
::sdcc -mhc08 hello_world.c


sdcc -c -mhc08 --stack-auto hello_world.c 
sdcc -c -mhc08 --stack-auto printf.c 
sdcc -mhc08 --code-loc 0xDC00 -o hello_world.S19 hello_world.rel printf.rel  

pause

mkdir output
move *.cdb .\output\
move *.lk  .\output\
move *.lst .\output\
move *.map .\output\
move *.rel .\output\
move *.rst .\output\
move *.sym .\output\
move *.asm .\output\