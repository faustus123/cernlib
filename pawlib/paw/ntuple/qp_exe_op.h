/*
 *  qp_exe_op.h  --
 *	Interpreter switch for the numeric operations intructions
 *
 *  Original: 20-Jan-1995 11:14
 *
 *  Author:   Maarten Ballintijn <Maarten.Ballintijn@cern.ch>
 *
 */

{
	if ( (opc & FC_VECTOR_BIT) != 0 ) {
/*
 *  OP_TYPE	the type for declarations and casts
 *  OP_DTYPE	The Datatype value for this type
 *  OP_BASE	The base value added to the FC for this type
 */
		Int32		*r, *o1, *o2, *o3;
		int		inc_r, inc_o1, inc_o2, inc_o3;

		switch ( fc ) {
#define	OP_TYPE		bool
#define	OP_DTYPE	D_BOOL
#define	OP_BASE		(D_BOOL * 64)

#include	"qp_exev_op_bool.h"

#undef	OP_TYPE
#undef	OP_DTYPE
#undef	OP_BASE

#define	OP_TYPE		UInt32
#define	OP_DTYPE	D_UINT
#define	OP_BASE		(D_UINT * 64)

#include	"qp_exev_op_num.h"
#include	"qp_exev_op_cmp.h"

#undef	OP_TYPE
#undef	OP_DTYPE
#undef	OP_BASE

#define	OP_TYPE		UInt64
#define	OP_DTYPE	D_ULONG
#define	OP_BASE		(D_ULONG * 64)

#include	"qp_exev_op_num.h"
#include	"qp_exev_op_cmp.h"

#undef	OP_TYPE
#undef	OP_DTYPE
#undef	OP_BASE

#define	OP_TYPE		Int32
#define	OP_DTYPE	D_INT
#define	OP_BASE		(D_INT * 64)

#include	"qp_exev_op_num.h"
#include	"qp_exev_op_cmp.h"

#undef	OP_TYPE
#undef	OP_DTYPE
#undef	OP_BASE

#define	OP_TYPE		Int64
#define	OP_DTYPE	D_LONG
#define	OP_BASE		(D_LONG * 64)

#include	"qp_exev_op_num.h"
#include	"qp_exev_op_cmp.h"

#undef	OP_TYPE
#undef	OP_DTYPE
#undef	OP_BASE

#define	OP_TYPE		Float32
#define	OP_DTYPE	D_FLOAT
#define	OP_BASE		(D_FLOAT * 64)

#include	"qp_exev_op_num.h"
#include	"qp_exev_op_cmp.h"

#undef	OP_TYPE
#undef	OP_DTYPE
#undef	OP_BASE

#define	OP_TYPE		Float64
#define	OP_DTYPE	D_DOUBLE
#define	OP_BASE		(D_DOUBLE * 64)

#include	"qp_exev_op_num.h"
#include	"qp_exev_op_cmp.h"

#undef	OP_TYPE
#undef	OP_DTYPE
#undef	OP_BASE
		default:
			sf_report( "qp_exe_op.h: Unkown Fcode ( %d )\n", fc );
			*errp = R_INTERNAL_ERROR;
			running = FALSE;
			break;
		}
	} else {
/*
 *  OP_TYPE	the type for declarations and casts
 *  OP_DTYPE	The Datatype value for this type
 *  OP_BASE	The base value added to the FC for this type
 */
		Int32		*r, *o1, *o2, *o3;

		switch ( fc ) {

#define	OP_TYPE		bool
#define	OP_DTYPE	D_BOOL
#define	OP_BASE		(D_BOOL * 64)

#include	"qp_exe_op_bool.h"

#undef	OP_TYPE
#undef	OP_DTYPE
#undef	OP_BASE

#define	OP_TYPE		UInt32
#define	OP_DTYPE	D_UINT
#define	OP_BASE		(D_UINT * 64)

#include	"qp_exe_op_num.h"
#include	"qp_exe_op_cmp.h"

#undef	OP_TYPE
#undef	OP_DTYPE
#undef	OP_BASE

#define	OP_TYPE		UInt64
#define	OP_DTYPE	D_ULONG
#define	OP_BASE		(D_ULONG * 64)

#include	"qp_exe_op_num.h"
#include	"qp_exe_op_cmp.h"

#undef	OP_TYPE
#undef	OP_DTYPE
#undef	OP_BASE

#define	OP_TYPE		Int32
#define	OP_DTYPE	D_INT
#define	OP_BASE		(D_INT * 64)

#include	"qp_exe_op_num.h"
#include	"qp_exe_op_cmp.h"

#undef	OP_TYPE
#undef	OP_DTYPE
#undef	OP_BASE

#define	OP_TYPE		Int64
#define	OP_DTYPE	D_LONG
#define	OP_BASE		(D_LONG * 64)

#include	"qp_exe_op_num.h"
#include	"qp_exe_op_cmp.h"

#undef	OP_TYPE
#undef	OP_DTYPE
#undef	OP_BASE

#define	OP_TYPE		Float32
#define	OP_DTYPE	D_FLOAT
#define	OP_BASE		(D_FLOAT * 64)

#include	"qp_exe_op_num.h"
#include	"qp_exe_op_cmp.h"

#undef	OP_TYPE
#undef	OP_DTYPE
#undef	OP_BASE

#define	OP_TYPE		Float64
#define	OP_DTYPE	D_DOUBLE
#define	OP_BASE		(D_DOUBLE * 64)

#include	"qp_exe_op_num.h"
#include	"qp_exe_op_cmp.h"

#undef	OP_TYPE
#undef	OP_DTYPE
#undef	OP_BASE

		default:
			sf_report( "qp_exe_op.h: Unkown Fcode ( %d )\n", fc );
			*errp = R_INTERNAL_ERROR;
			running = FALSE;
			break;
		}
	}
}
