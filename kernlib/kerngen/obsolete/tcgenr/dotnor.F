*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:53:25  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      FUNCTION DOTNOR(X,Y)
      DIMENSION X(3),Y(3)
      DOTNOR=DOT(X,Y)/SQRT (DOT(X,X)*DOT(Y,Y))
      IF (ABS(DOTNOR).GT.1.) DOTNOR=SIGN(1.,DOTNOR)
      RETURN
      END
