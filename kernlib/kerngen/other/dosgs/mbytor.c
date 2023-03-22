/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  1996/02/15 17:50:03  mclareni
 * Initial revision
 *
 */
#include "kerngen/pilot.h"
#if defined(CERNLIB_QF_F2C)
/* mbytor.f -- translated by f2c and  been corrected by V.E.Fine  by hand
   You must link the resulting object file with the libraries:
        -lF77 -lI77 -lm -lc   (in that order)
*/

#include "kerngen/qf_f2c.h"

integer mbytor_(mz, izw, izp, nzb)
integer *mz, *izw, *izp, *nzb;
{
    /* System generated locals */
    integer ret_val, i__1, i__2, i__3, i__4;


/* CERN PROGLIB# M421    MBYTOR          .VERSION KERNFOR  4.23  891215 */

/* ORIG. 13/03/89  JZ */

/*     This non-ANSI code is a default which may be slow, if so */
/*     it should be replaced by a machine-specific fast routine */
    i__1 = 32 - *nzb;
    i__2 = *mz << i__1;
    i__3 = 33 - *izp - *nzb;
    i__4 = (unsigned) (i__2) >> i__3;
    ret_val = *izw | i__4;
    return ret_val;
} /* mbytor_ */

#endif
