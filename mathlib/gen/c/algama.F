*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:01:53  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if (defined(CERNLIB_DOUBLE))&&(!defined(CERNLIB_IBM))
      FUNCTION ALGAMA(X)
      DOUBLE PRECISION DLGAMA,D

      ENTRY ALOGAM(X)

      SROUND(D)=D+(D-SNGL(D))
      ALGAMA=SROUND(DLGAMA(DBLE(X)))
      RETURN
      END
#endif
