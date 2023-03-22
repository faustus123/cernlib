*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:03:07  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "_gen/pilot.h"
      DOUBLE PRECISION FUNCTION DCABS(Z)
      DOUBLE PRECISION Z(2)
      DCABS=SQRT(Z(1)**2+Z(2)**2)
      RETURN
      END
