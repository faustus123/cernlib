*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:03:27  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if (defined(CERNLIB_QF2C))&&(!defined(CERNLIB_LINUX))
      DOUBLE PRECISION FUNCTION DIMAG(Z)
      DOUBLE PRECISION Z(2)
      DIMAG=Z(2)
      RETURN
      END
#endif
