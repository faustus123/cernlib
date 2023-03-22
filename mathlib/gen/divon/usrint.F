*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:03:22  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
      SUBROUTINE USRINT (UMINUS,UPLUS,INTIN,SPRDIN,INTOUT,ERROUT)
      WRITE(6,10)
 10   FORMAT(' DUMMY USER INTEGRATION SUBROUTINE CALLED.',
     1' INCONSISTENT INPUT.')
      STOP
      END
