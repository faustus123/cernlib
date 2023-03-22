*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 14:31:32  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "_minuit/pilot.h"
#if defined(CERNLIB_NEVER)
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
#endif
