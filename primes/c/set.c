#include <string.h>
#include <stdlib.h>

// segments are ordered sequences of data
// basically arrays - meant to be largish and 
// not to grow 
typedef struct {
	void* data;
	size_t size;
 	size_t length;
 	size_t offset;
} segment;

void debug_segment(segment* seg, char* indent){ 
	printf("%sSegment at %p (size %lu):\n%s  %s: %p\n%s  %s: %lu\n%s  %s: %lu\n%s  %s: %lu\n",
		indent, seg, sizeof(segment),
		indent, "data", seg->data,
		indent, "size", seg->size,
		indent, "offset", seg->offset,
		indent, "length", seg->length
	);
}

segment* segment_new( size_t size, size_t length){
	segment* seg = (segment*)malloc(sizeof(segment));
	if( seg == NULL ) return NULL;
	seg->data = calloc( length, size );
	if( seg->data == NULL ){
		free(seg);
		return NULL;
	}
	seg->size = size;
	seg->length = length;
	seg->offset = 0;
	return seg;
}

int segment_full( segment* seg ){
	return ( seg->length == (seg->offset) );
}
// returns new storage location
void* segment_push( segment* seg, void* data ){
	if( segment_full( seg ) ){
		return NULL;
	}
	void* loc;
	memcpy( 
		loc = (seg->data + seg->offset*seg->size), 
		data, 
		seg->size 
	);
	seg->offset++;
	return loc;
};

void* segment_getptr( segment* seg, size_t index){
	if( index >= seg->offset)
		return NULL;
	return seg->data + seg->size * index;
}

// sets are ordered sequences of segments
// kind of like a linked list, but with only
// partial dynamism.
// meant to be able to grow as necessarily 

typedef struct {
	segment** segments;
	size_t offset;
	size_t length;
	size_t segment_size;
	size_t data_size;
	size_t count;
	unsigned int errno;
} set;

#define SET_INIT_FAILED 1
#define SET_ADD_SEGMENT_FAILED 2
#define SET_GROW_FAILED 3
#define SET_EMPTY 4
#define SET_PUSH_FAILED 5

segment* set_current_segment( set* s );
segment* set_grow( set* s);

set* set_new( size_t size, size_t segment_size){
	set* s = (set*)malloc(sizeof(set));
	if( s == NULL){
		s->errno = SET_INIT_FAILED;
		return NULL;	
	}
	s->segment_size = segment_size;
	s->data_size = size;
	s->segments = NULL;
	s->length = 0;
	s->offset = 0;
	s->errno = 0;
	set_grow(s);
	return s;
}

// grow set, return ptr to next segment or NULL ( failure )
segment* set_grow( set* s){
	segment** newsegments = (segment**)realloc(
		(void*)(s->segments), 
		(s->length + 1) * sizeof( segment* )
	);
	if( newsegments == NULL ){	
		s->errno = SET_GROW_FAILED;
		return NULL;
	}
	s->segments = newsegments;
	*(s->segments + s->length) = segment_new( 
		s->data_size, 
		s->segment_size
	);
	if( *( s->segments + s->length ) == NULL ){
		newsegments = (segment**) realloc( 
			(void*)s->segments, 
			s->length * sizeof( segment*)
		);
		if( newsegments != NULL ){
			s->errno = SET_ADD_SEGMENT_FAILED;
			s->segments = newsegments;
		}
		return NULL;
	}
	s->errno = 0;
	return *(s->segments + s->length++);
}

int set_full( set* s ){
	if( s->length == 0 ) return 1;
	return segment_full( set_current_segment( s ) );
}

// pass the current segment.
segment* set_current_segment( set* s ){
	if( s->length == 0 ){
		s->errno = SET_EMPTY;
		return NULL;
	}
	s->errno = 0;
	return *( s->segments + s->offset );
}

void* set_push( set* s, void* data){
	if( set_full( s ) ){
		if(set_grow(s)  == NULL ){
			s->errno = SET_GROW_FAILED;
			return NULL;
		}	
		 s->offset++;
	}
	segment* curseg = set_current_segment(s);
	if( curseg == NULL ){
		return NULL;
	}
	void* dest = segment_push( set_current_segment(s), data);
	if( dest == NULL )
		s->errno = SET_PUSH_FAILED;
	else{
		s->errno = 0;
		s->count++;
	}
	return dest;
}

void debug_set( set* s){
   printf("\033[0;1mSet at %p: \n\033[0m  %.15s: %p\n  %.15s: %lu\n  %.15s: %lu\n  %.15s: %lu\n  %.15s: %lu\n  %.15s: %u\n  %15s: %p :\n\033[0;33m",
   s,
   "semgent ptrs", s->segments,
   "count", s->count,
   "offset", s->offset,
   "length", s->length,
   "segment_size", s->segment_size,
   "errno", s->errno,
	"set_current_segment", set_current_segment(s)
   );
	if( s->length > 0 ){
		debug_segment( set_current_segment(s), "  ");
	}
	printf("\033[0m");
}


void* set_getptr( set* s, size_t index ){
	if( index >= s->count ) {
		return NULL;
	}
	size_t segment = index/s->segment_size;
	size_t segment_index = index % s->segment_size;
	return segment_getptr( *( s->segments + segment), segment_index );
}
