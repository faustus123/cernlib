/*
 *  qp_exe_fun_bitop.h  --
 *	Implement the BITPAK bit handling routines
 *
 *  Original: 27-Jan-1995 15:09
 *
 *  Author:   Maarten Ballintijn <Maarten.Ballintijn@cern.ch>
 *
 */


{
	bool	has_vardim;

	has_vardim = (((UInt32) opc) & FC_VECTOR_BIT) != 0 ? TRUE : FALSE ;

	if ( has_vardim ) {
		switch ( fc ) {
		default:
			sf_report( "qp_exe_fun_bitop.h: Unkown Fcode ( %d )\n",
				fc );
			*errp = R_INTERNAL_ERROR;
			running = FALSE;
			break;
		}
	} else {
		Int32		*r, *o1, *o2, *o3, *o4, *o5;

		switch ( fc ) {

#define	OP_TYPE		UInt32
#define	OP_DTYPE	D_UINT
#define	OP_BASE		( 0 )

#include	"qp_exe_fun_bitop_templ.h"

#undef	OP_TYPE
#undef	OP_DTYPE
#undef	OP_BASE

#define	OP_TYPE		UInt64
#define	OP_DTYPE	D_ULONG
#define	OP_BASE		( 32 )

#include	"qp_exe_fun_bitop_templ.h"

#undef	OP_TYPE
#undef	OP_DTYPE
#undef	OP_BASE
		default:
			sf_report( "qp_exe_fun_bitop.h: Unkown Fcode ( %d )\n", fc );
			*errp = R_INTERNAL_ERROR;
			running = FALSE;
			break;
		}
	}
}
