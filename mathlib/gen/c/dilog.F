*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:03  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if !defined(CERNLIB_DOUBLE)
      FUNCTION DILOG(X)
      DILOG = RDILOG(X)
      END
#endif
