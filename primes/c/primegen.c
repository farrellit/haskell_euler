
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "set.c"

typedef long long unsigned int prime_t;

void read_input( set* primeset ){
	long long unsigned input;
	while( !feof(stdin) && scanf( "%llu\n", &input) == 1 ) 
		set_push( primeset, &input);
}

int is_prime( set* primeset, prime_t candidate){
	prime_t max = (prime_t) sqrtl( (long double)candidate);
	prime_t * cmp;
	// skip the first (everything is divisible by 1);
	for( int i = 1; i < primeset->count; i++){
		cmp = set_getptr( primeset, i );
		if( *cmp > max ){
			return 1;
		}
		if( candidate % (*cmp) == 0 ) // found factor
			return 0;
	}
	if( candidate <= 2) return 1;
	fprintf(stderr, "Primeset too small to find possible factor of %llu\n", candidate);
	exit(-1);
}

prime_t next_candidate( prime_t candidate){
	if( candidate >= 3) return candidate + 2;
	else return candidate + 1;
}

int main(int argc, char* argv[]){
	prime_t lim = 0;
	unsigned int showevery = 1000;
	if(argc > 1 ){
		sscanf( argv[1], "%llu", &lim);
		fprintf( stdout, "Finding primes up to limit of %llu\n", lim );
	}
	if( argc > 2){
		sscanf( argv[2], "%u", &showevery);
	}
	fprintf( stdout, "Showing every %i number\n", showevery);
	set* primeset = set_new( sizeof(prime_t), 1024);
	prime_t candidate = 0;
	prime_t next;
	fprintf(stdout,"Loading numbers from stdin...\n");
	read_input( primeset );
	fprintf(stdout,"Loaded %lu prime numbers up to %llu from stdin\n", 
		primeset->count, 
		primeset->count == 0 ? 0 : *( (prime_t*)set_getptr( primeset, primeset->count-1) )
	);
	while( 
		(next=next_candidate( candidate)) > candidate
	){
		if(lim > 0 && next > lim ){
			fprintf(stdout, "Limit %llu reached.\n", lim);
			exit( 0 );
		}
		if( is_prime(primeset, next) ){
			set_push(primeset, &next);
			if( primeset->count % showevery == 0 ) fprintf(stderr, "\rFound prime: %llu ", next);
			printf("%llu\n", next );
		}
		candidate = next;
	}
	fprintf(stderr, "Overflow.\n");
	exit(0);
}
