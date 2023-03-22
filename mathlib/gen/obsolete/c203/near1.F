*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:03:11  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "_gen/pilot.h"
      FUNCTION NEAR1(X)
      I=X
      XI=I
      XX=X-XI
      IF(XX.GE.0.5) GO TO 1
      NEAR1=I
      RETURN
    1 NEAR1=I+1
      RETURN
      END
