*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:02  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if defined(CERNLIB_DOUBLE)
      FUNCTION ATANI(X)
#include "gen/def64.inc"
     +    DATANI,D

      SROUND(D)=D+(D-SNGL(D))
      ATANI=SROUND(DATANI(DBLE(X)))
      RETURN
      END
#endif
