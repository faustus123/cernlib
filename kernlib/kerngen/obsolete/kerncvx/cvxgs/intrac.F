*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:25  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      LOGICAL FUNCTION INTRAC (DUMMY)
C
C CERN PROGLIB# Z044    INTRAC          .VERSION KERNCVX  1.00  890315
C ORIG. 22/02/88  JZ
C
C-    The program is considered interactive if standard input
C-    is connected to the terminal

      LOGICAL      ISATTY

      INTRAC = ISATTY (5)
      RETURN
      END
#ifdef CERNLIB_TCGEN_INTRAC
#undef CERNLIB_TCGEN_INTRAC
#endif
#ifdef CERNLIB_CCGEN_INTRAC
#undef CERNLIB_CCGEN_INTRAC
#endif
