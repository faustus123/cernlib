/*
 *  pawc.h  --
 *	Map the /PAWC/ common block
 *
 *  Original:  7-Nov-1994 22:27
 *
 *  Author:   Maarten Ballintijn <Maarten.Ballintijn@cern.ch>
 *
 */

#ifndef CERN_PAWC
#define CERN_PAWC

#include	"cfortran.h"


typedef struct {
	union {
		int	iq[1];
		float	q[1];
	} u;
} pawc_def;

#define PAWC COMMON_BLOCK(PAWC,pawc)

COMMON_BLOCK_DEF(pawc_def,PAWC);

#endif	/*	CERN_PAWC	*/
