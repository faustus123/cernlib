*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:20  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      FUNCTION JUMPAD (ITARGT)
C
C CERN PROGLIB# Z042    JUMPAD          .VERSION KERNSUN  1.00  880922
C ORIG. 22/09/88, JZ
C
C-    Get target address for use with JUMPXn

      JUMPAD = LOC (ITARGT)
      END
