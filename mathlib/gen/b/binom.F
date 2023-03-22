*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:01:48  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if defined(CERNLIB_DOUBLE)
      FUNCTION BINOM(X,K)
#include "gen/def64.inc"
     + D,DBINOM

      SROUND(D)=D+(D-SNGL(D))
      BINOM=SROUND(DBINOM(DBLE(X),K))
      RETURN
      END
#endif
