*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:45  mclareni
* Initial revision
*
*
#include "kernnumt/pilot.h"
          FUNCTION NRDIST(X,Y)
          REAL     X, Y
#include "kernnumt/sysdat.inc"
          RELERR  =  ABS(X-Y) / AMAX1(ABS(X),ABS(Y))
          NRDIST  =  NINT(RELERR/RELPR)
          RETURN
          END
