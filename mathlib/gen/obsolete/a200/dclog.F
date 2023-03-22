*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:03:09  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "_gen/pilot.h"
      SUBROUTINE DCLOG(Z,F)
      DOUBLE PRECISION Z(2),F(2),A
      A=ATAN2(Z(2),Z(1))
      F(1)=0.5D0*LOG(Z(1)**2+Z(2)**2)
      F(2)=A
      RETURN
      END
