*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:01:59  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if defined(CERNLIB_DOUBLE)
      FUNCTION RPSIPG(X,K)
#include "gen/def64.inc"
     + D,DPSIPG

      SROUND(D)=D+(D-SNGL(D))
      RPSIPG=SROUND(DPSIPG(DBLE(X),K))
      RETURN

      ENTRY ADIGAM(X)
      ADIGAM=SROUND(DPSIPG(DBLE(X),0))
      END
#endif
