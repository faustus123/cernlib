/*
 *  cern_types.h  --
 *	Separate out the type declaration for storage
 *	size sensitive quantities.
 *
 *  Original: 25-Nov-1994 09:53
 *
 *  Author:   Maarten Ballintijn <Maarten.Ballintijn@cern.ch>
 *
 *  $Id$
 *
 *  $Log$
 *  Revision 1.7  1996/04/23 18:37:54  maartenb
 *  - Add RCS keywords
 *
 *
 */

#ifndef CERN_CERN_TYPES
#define CERN_CERN_TYPES

#include	<float.h>
#include	<limits.h>

#include	"bool.h"


typedef char *			String;

#define	QP_STR_MAX	32

typedef struct _string32_ {
	char	s[QP_STR_MAX];
} String32;


typedef unsigned int		UInt32;

#ifndef UINT32_MAX
#define	UINT32_MAX	UINT_MAX
#endif


/* typedef unsigned long long	UInt64; */
typedef unsigned long 		UInt64;

#ifndef UINT64_MAX
#define	UINT64_MAX	ULONG_MAX
#endif


typedef int			Int32;

#ifndef INT32_MAX
#define	INT32_MAX	INT_MAX
#endif
#ifndef INT32_MIN
#define	INT32_MIN	INT_MIN
#endif


/* typedef long long		Int64; */
typedef long			Int64;

#ifndef INT64_MAX
#define	INT64_MAX	LONG_MAX
#endif
#ifndef INT64_MIN
#define	INT64_MIN	LONG_MIN
#endif


typedef float			Float32;

#define	FLOAT32_MAX	FLT_MAX
#define	FLOAT32_MIN	FLT_MIN

#define	FLOAT_INT_LIMIT	1.0e10	/* a garanteed minimal value with no fraction */


typedef double			Float64;

#define	FLOAT64_MAX	DBL_MAX
#define	FLOAT64_MIN	DBL_MIN

#define	DOUBLE_INT_LIMIT	1.0e20	/* a garanteed minimal value with no fraction */


#ifndef M_PI
#define M_PI	3.14159265358979323846
#endif

#endif	/*	CERN_CERN_TYPES	*/
