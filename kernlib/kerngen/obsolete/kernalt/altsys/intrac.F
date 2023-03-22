*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:50:55  mclareni
* Initial revision
*
*
#include "kernalt/pilot.h"
      LOGICAL FUNCTION INTRAC(DUMMY)
C
C CERN PROGLIB# Z044    INTRAC          .VERSION KERNALT  1.01  880222
C ORIG. 22/02/88  JZ
C
C-    The program is considered interactive if standard input
C-    is connected to the terminal
 
      LOGICAL      ISATTY
 
      INTRAC = ISATTY (5)
      RETURN
      END
#ifdef CERNLIB_CCGEN_INTRAC
#undef CERNLIB_CCGEN_INTRAC
#endif
#ifdef CERNLIB_TCGEN_INTRAC
#undef CERNLIB_TCGEN_INTRAC
#endif
