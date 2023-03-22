*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:51:07  mclareni
* Initial revision
*
*
#include "kernapo/pilot.h"
      SUBROUTINE VZERO(A,N)
C
C CERN PROGLIB# F121    VZERO           .VERSION KERNAPO  1.24  920511
C ORIG. 01/03/85  R.BRUN
C
      INTEGER      A(*)

      IF (N.GT.0) CALL VEC_$ZERO (A,N)
      END
#ifdef CERNLIB_TCGEN_VZERO
#undef CERNLIB_TCGEN_VZERO
#endif
