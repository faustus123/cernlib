*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:27  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      SUBROUTINE TIMEX (T)
C
C CERN PROGLIB# Z007    TIMEX           .VERSION KERNCVX  1.06  891207
C ORIG. 1/12/89 KP, MM, JZ
C
      REAL*4  ARRAY(2),ETIME

      T = ETIME(ARRAY)
      RETURN
      END
#ifdef CERNLIB_TCGEN_TIMEX
#undef CERNLIB_TCGEN_TIMEX
#endif
#ifdef CERNLIB_CCGEN_TIMEX
#undef CERNLIB_CCGEN_TIMEX
#endif
