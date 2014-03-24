#include <stdio.h>
#include <stdlib.h>

unsigned long int lattice_paths(unsigned int w, unsigned int h ){
	if( h + w == 0 ) return 0;
	if( h * w == 0 ) return 1;
	if( h == w ) return 2 * lattice_paths( w-1,h);
	return lattice_paths( w-1, h) + lattice_paths( h-1,w);
}

int main( int argc, char* argv[]){
	unsigned int size;
	if( argc != 2 ){
		fprintf(stderr, "Pass one argument, the grid size.\n");
		exit( 1 );
	} else if( sscanf( argv[1], "%u", &size) != 1 ){
		fprintf(stderr, "Bad arg '%s'.  Pass grid size (unsigned int).\b", 
			argv[1]
		);
		exit( 2 );
	}
	printf("Possible traversals: %lu\n", lattice_paths( size, size ) );
}
