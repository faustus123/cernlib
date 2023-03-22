*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 11:40:51  mclareni
* Initial revision
*
*
#include "kapack/pilot.h"
#if !defined(CERNLIB_IBM)||defined(CERNLIB_QMIBMXA)
      SUBROUTINE KAXAGE(IWAIT)
C
C Routine to wait for given time period IHUNS - in 1/100sec units
C
      CALL SLEEPF(IWAIT/100)
*
      END
#endif
