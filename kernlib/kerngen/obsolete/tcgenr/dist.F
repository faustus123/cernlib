*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:53:24  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      FUNCTION DIST(X,Y)
C
C
      DIMENSION X(3),Y(3)
C
      DIST=SQRT ((X(1)-Y(1))**2+(X(2)-Y(2))**2+(X(3)-Y(3))**2)
      RETURN
      END
