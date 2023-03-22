*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:06  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if !defined(CERNLIB_DOUBLE)
      FUNCTION DAWSON(X)

      DAWSON=RDAWSN(X)
      RETURN

      END
#endif
