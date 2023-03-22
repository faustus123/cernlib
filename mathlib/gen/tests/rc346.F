*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:01:18  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if defined(CERNLIB_DOUBLE)
      FUNCTION RC346(R)
      COMMON /RPARAMT/ RAKP,RA,RB,RP,RFMODE

      ENTRY R1EL1(R)
      R1EL1=1/SQRT((1+R**2)*(1+(RAKP*R)**2))
      RETURN

      ENTRY R1EL2(R)
      R1EL2=(RA+RB*R**2)/((1+R**2)*SQRT((1+R**2)*
     +(1+RFMODE*(RAKP*R)**2)))
      RETURN
      END
#endif
