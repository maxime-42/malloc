#ifndef _STRUCT_H
#define _STRUCT_H 
#include "constant.h"
#include <stddef.h>

typedef struct					s_pageMemory
{
		t_blockMetadata			*blockMetadata;
		struct	s_pageMemory	*next;
		struct	s_pageMemory	*prev;
}								t_pageMemory;


typedef struct					s_blockMetadata
{
		size_t					size;
		bool					free;
		struct s_blockMetadata	*next;
		struct s_blockMetadata	*prev;
}								t_blockMetadata;



#endif // !_STRUCT_H