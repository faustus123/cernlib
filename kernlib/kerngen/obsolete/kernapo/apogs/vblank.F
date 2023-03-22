*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:51:06  mclareni
* Initial revision
*
*
#include "kernapo/pilot.h"
      SUBROUTINE VBLANK (IA,N)
C
C CERN PROGLIB# F121    VBLANK          .VERSION KERNAPO  1.24  920511
C ORIG. 01/03/85  R.BRUN
C
      DIMENSION    IA(*)
      PARAMETER    (IBLANK = 16#20202020)

      IF (N.GT.0) CALL VEC_$IINIT (IA,N,IBLANK)
      END
#ifdef CERNLIB_TCGEN_VBLANK
#undef CERNLIB_TCGEN_VBLANK
#endif
