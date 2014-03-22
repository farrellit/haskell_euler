#include <stdio.h>
#include "../set.c"

void main(int argc, char* argv[]){
	printf("creating segment...\n");
	segment* seg = segment_new( sizeof(char), 5 );
	if( segment_full( seg)){
		printf("\033[31mError: segment should not have been full.\033[0m");
		debug_segment( seg, "");
		exit( -1);
	}
	printf("Filling segment...\n");
	char c;
	for( int i = 0; i<5; i++){
		c = 'a' + i;
		printf("\tpushing item %i: %c\n",i, c);
		if( segment_push( seg, &c ) == 0 ){
			printf("\033[31mError adding to segment.\033[0m");
			debug_segment( seg, "" );
			exit( -2);
		}
		debug_segment( seg, "" );
	}
	if( ! segment_full( seg)){
		printf("\033[31mError: segment should have been full.\033[0m");
		debug_segment( seg, "");
	}
	printf("Getting each char back...\n");
	char* cptr;
	for( int i=0; i < 5; i++){
		cptr = (char*)segment_getptr(seg, i );
		printf("\titem %i: %c\n", i, *cptr );
	}

}
