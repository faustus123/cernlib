/*
 *  qp_str_table.c  --
 *	Implement fast lookup table for strings
 *
 *  Original:  6-Nov-1995 14:29
 *
 *  Author:   Maarten Ballintijn <Maarten.Ballintijn@cern.ch>
 *
 */

#include	"qp_report.h"
#include	"qp_str_table.h"


StrTab *
qp_strtab_new(
	int		size
){
	StrTab *	t;

	t = 0;
	qp_assert( t != 0 );

	return t;
}


void
qp_strtab_free(
	StrTab *	strtab
)
{
	free( (void *) strtab );
}
