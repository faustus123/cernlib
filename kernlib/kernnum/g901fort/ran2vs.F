*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:49:05  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE RAN2VS(RADIUS,X1,Y1)
  10      X  =  2.*RANF() - 1.
          Y  =  2.*RANF() - 1.
          RR =  X*X + Y*Y
          IF(RR .GT. 1.)  GOTO 10
          SCALE  =  RADIUS / SQRT(RR)
          X1  =  X * SCALE
          Y1  =  Y * SCALE
          RETURN
          END
