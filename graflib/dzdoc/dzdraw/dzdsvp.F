*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/04 16:13:14  mclareni
* Initial revision
*
*
#include "dzdoc/pilot.h"
      SUBROUTINE DZDSVP(IWID)
      REAL SMALER,DISPSZ(4)
      CALL IGQWK(IWID,'MXDS',DISPSZ)
      SMALER=MIN(DISPSZ(1),DISPSZ(2))
      CALL ISWKVP(IWID,0.,SMALER,0.,SMALER)
      END
************************************************************************
