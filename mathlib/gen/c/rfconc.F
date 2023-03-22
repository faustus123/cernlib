*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:03  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if defined(CERNLIB_DOUBLE)
      FUNCTION RFCONC(X,TAU,M)
#include "gen/def64.inc"
     +     DFCONC,D

      SROUND(D)=D+(D-SNGL(D))

      RFCONC=SROUND(DFCONC(DBLE(X),DBLE(TAU),M))
      RETURN

      ENTRY FCONC(X,TAU,M)

      FCONC=SROUND(DFCONC(DBLE(X),DBLE(TAU),M))
      RETURN

      END
#endif
