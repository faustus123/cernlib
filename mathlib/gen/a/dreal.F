*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:03:27  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if defined(CERNLIB_QF2C)
      DOUBLE PRECISION FUNCTION DREAL(Z)
      DOUBLE PRECISION Z(2)
      DREAL=Z(1)
      RETURN
      END
#endif
