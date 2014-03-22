default: primegen bin
primegen: primegen.c set.c bin
	gcc -std=c99 -lm -O2 -o bin/primegen primegen.c

bin: 
	mkdir bin

primegen_debug: primegen.c set.c bin
	gcc -std=c99 -lm -g -o bin/primegen_debug primegen.c
