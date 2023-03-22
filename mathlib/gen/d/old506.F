*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:19  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
      SUBROUTINE MINNEW
C
      ENTRY MINTS
      ENTRY MINTL
      ENTRY MINTSD
      ENTRY MINTLD
C
      EXTERNAL FCN
C
      CALL MINUIT(FCN,0)
      RETURN
      END
