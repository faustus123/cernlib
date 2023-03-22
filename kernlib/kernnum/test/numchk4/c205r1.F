*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:45  mclareni
* Initial revision
*
*
#include "kernnumt/pilot.h"
      FUNCTION C205R1(RX,I)
      IMPLICIT REAL (A-H,O-Z)
      C205R1=(3*RX-1)*(1.5E0*RX-1)**4*EXP(-5*RX)
      RETURN
 
      ENTRY C205R2(RX,I)
      C205R2=SIN(RX)
      RETURN
      END
