default: bin/primegen bin
bin/primegen: primegen.c set.c bin
	gcc  -o bin/primegen primegen.c -std=c99 -lm -O2

bin: 
	mkdir bin

bin/primegen_debug: primegen.c set.c bin
	gcc -std=c99 -lm -g -o bin/primegen_debug primegen.c
