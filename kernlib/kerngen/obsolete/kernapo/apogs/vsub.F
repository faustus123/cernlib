*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:51:07  mclareni
* Initial revision
*
*
#include "kernapo/pilot.h"
      SUBROUTINE VSUB (A,B,X,N)
C
C CERN PROGLIB# F121    VSUB            .VERSION KERNAPO  1.17  890626
C ORIG. 30/05/89     FCA
C
      DIMENSION A(*), B(*), X(*)

      IF (N.GT.0) CALL VEC_$SUB (A,B,N,X)
      END
#ifdef CERNLIB_TCGEN_VSUB
#undef CERNLIB_TCGEN_VSUB
#endif
