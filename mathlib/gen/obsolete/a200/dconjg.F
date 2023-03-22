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
      SUBROUTINE DCONJG(Z1,Z)
      DOUBLE PRECISION Z1(2),Z(2)
      Z(1)=Z1(1)
      Z(2)=-Z1(2)
      RETURN
      END
