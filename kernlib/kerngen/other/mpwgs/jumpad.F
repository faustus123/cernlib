*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:50:04  mclareni
* Initial revision
*
*
#include "kerngen/pilot.h"
      FUNCTION JUMPAD (ITARGT)
C
C CERN PROGLIB# Z042    JUMPAD          .VERSION KERNMPW  1.00  891208
C ORIG. 21/04/88 FCA
C
C-    Get target address for use with JUMPXn
 
      JUMPAD = %LOC (ITARGT)
      END
