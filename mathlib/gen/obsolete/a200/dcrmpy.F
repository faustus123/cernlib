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
      SUBROUTINE DCRMPY(D,Z1,Z)
      DOUBLE PRECISION D,Z1(2),Z(2)
      Z(1)=D*Z1(1)
      Z(2)=D*Z1(2)
      RETURN
      END
