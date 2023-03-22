*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:50:25  mclareni
* Initial revision
*
*
#include "kerngen/pilot.h"
      FUNCTION JUMPAD (ITARGT)
C
C CERN PROGLIB# Z042    JUMPAD          .VERSION KERNVAX  2.26  880425
C ORIG. 21/04/88 JZ
C
C-    Get target address for use with JUMPXn

      JUMPAD = %LOC (ITARGT)
      END
