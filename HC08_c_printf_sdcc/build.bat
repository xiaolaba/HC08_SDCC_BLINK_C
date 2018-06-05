sdcc -mhc08 --stack-auto -c hello_world.c
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