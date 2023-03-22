*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:03:08  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "_gen/pilot.h"
      SUBROUTINE DCSUB(Z1,Z2,Z)
      DOUBLE PRECISION Z1(2),Z2(2),Z(2)
      Z(1)=Z1(1)-Z2(1)
      Z(2)=Z1(2)-Z2(2)
      RETURN
      END
