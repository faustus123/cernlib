*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:40  mclareni
* Initial revision
*
*
#include "kerncry/pilot.h"
      SUBROUTINE TIMEL (T)
C
C CERN PROGLIB# Z007    TIMEL           .VERSION KERNCRY  1.03  840215
C ORIG. 18/01/84  W.W. SACLAY/DPHPE
C
      CALL TREMAIN (T)
      RETURN
      END
#ifdef CERNLIB_TCGEN_TIMEL
#undef CERNLIB_TCGEN_TIMEL
#endif
