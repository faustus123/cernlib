*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:40  mclareni
* Initial revision
*
*
#include "kerncry/pilot.h"
      SUBROUTINE DETACH (LUNP)
C
C CERN PROGLIB# K511    DETACH          .VERSION KERNCRY  1.00  830612
C ORIG. 12/06/83 D.LELLOUCH, LPNHE
C

      LUN = LUNP
      CALL FNNUM (LUN)
      CALL RELEASE (IRTC,'DN'L,LUN)
      RETURN
      END
