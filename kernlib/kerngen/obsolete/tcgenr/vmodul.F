*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:53:27  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      FUNCTION VMODUL(A)
C
C
      DIMENSION A(3)
      VMODUL=SQRT(A(1)**2+A(2)**2+A(3)**2)
      RETURN
      END
