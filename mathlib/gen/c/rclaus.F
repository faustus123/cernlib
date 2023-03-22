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
      FUNCTION RCLAUS(X)
      DOUBLE PRECISION DCLAUS,D
 
      SROUND(D)=D+(D-SNGL(D))
      RCLAUS=SROUND(DCLAUS(DBLE(X)))
      RETURN
      END
#endif
