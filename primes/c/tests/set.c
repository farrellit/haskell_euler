#include <stdio.h>
#include "../set.c"

int main(int argc, char* argv[]){
	int amt = 10000;
	int growth = amt / 3;
	printf("Creating set, growth rate %i\n", growth);
	set* s = set_new( sizeof(int), growth);
	debug_set( s );
	void* v;
	for( int i = 0; i < amt; i++){
		printf( set_full(s) ? "Set is full\n": "Set is not full\n" );
		v = set_push( s, &i );
		if( v == NULL) {
			printf(" failed to push #%i\n", i);
			debug_set( s );
			exit(s->errno);
		}
		printf("\033[31;1mPushed %i to %p\033[0m\n", i, v);
		debug_set( s );
	}
	for( int i = 0 ; i < amt; i++){
		v = set_getptr( s, i );
		printf("idx %4i @ %p : %i \n", i, v, *((int*)v) );
	}
	exit( 0 );
}
