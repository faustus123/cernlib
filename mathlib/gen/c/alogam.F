*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:01:53  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if (defined(CERNLIB_DOUBLE))&&(defined(CERNLIB_IBM))
      FUNCTION ALOGAM(X)
      ALOGAM = ALGAMA(X)
      END
#endif
