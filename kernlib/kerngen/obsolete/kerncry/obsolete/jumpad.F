*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:45  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      FUNCTION JUMPAD (ITARGT)
C
C CERN PROGLIB# Z042    JUMPAD          .VERSION KERNCRY  1.07  880428
C ORIG. 26/04/88 JZ
C
C-    Get target address for use with JUMPXn

      JUMPAD = LOC (ITARGT)
      END
