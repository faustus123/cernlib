*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:01:54  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if defined(CERNLIB_IBM)
      FUNCTION DLOGAM(X)
#include "gen/imp64.inc"
      DLOGAM = DLGAMA(X)
      END
#endif
