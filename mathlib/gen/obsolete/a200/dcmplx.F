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
      SUBROUTINE DCMPLX(X,Y,Z)
      DOUBLE PRECISION X,Y,Z(2)
      Z(1)=X
      Z(2)=Y
      RETURN
      END
