*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:03:28  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if (defined(CERNLIB_QF2C))&&(!defined(CERNLIB_LINUX))
      SUBROUTINE DCONJG(A,Z)
      DOUBLE PRECISION Z(2),A(2)
      A(1)=Z(1)
      A(2)=-Z(2)
      RETURN
      END
#endif
