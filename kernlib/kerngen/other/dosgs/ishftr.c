/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  1996/02/15 17:50:00  mclareni
 * Initial revision
 *
 */
#include "kerngen/pilot.h"
#if defined(CERNLIB_QF_F2C)

#include "kerngen/qf_f2c.h"

integer ishftr_(izw, nzb)
integer *izw, *nzb;
{
    if (*nzb > 0)       {return (unsigned) (*izw) >> *nzb;}
    else if (*nzb == 0) {return *izw;}
    else                {return *izw << -(*nzb);}
} /* ishftr_ */

#endif
