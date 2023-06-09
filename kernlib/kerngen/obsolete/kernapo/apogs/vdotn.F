*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:51:06  mclareni
* Initial revision
*
*
#include "kernapo/pilot.h"
      FUNCTION VDOTN (A,B,N)
C
C CERN PROGLIB# F121    VDOTN           .VERSION KERNAPO  1.17  890626
C ORIG. 30/05/89     FCA
C
      DIMENSION A(*), B(*)

      VDOTN=0.0
      IF(N.GT.0) THEN
        IF(N.GT.20) THEN
          VDEN = VEC_$DOT(A,A,N)*VEC_$DOT(B,B,N)
          IF(VDEN.NE.0.0) VDOTN=VEC_$DOT(A,B,N)/SQRT(VDEN)
        ELSE
          AAMOD = 0.0
          BBMOD = 0.0
          ABMOD = 0.0
          DO 10 J=1, N
            AAMOD = AAMOD + A(J)*A(J)
            BBMOD = BBMOD + B(J)*B(J)
            ABMOD = ABMOD + A(J)*B(J)
  10      CONTINUE
          VDEN = AAMOD * BBMOD
          IF (VDEN.NE.0.0) VDOTN=ABMOD/SQRT(VDEN)
        ENDIF
      ENDIF
      END
#ifdef CERNLIB_TCGEN_VDOTN
#undef CERNLIB_TCGEN_VDOTN
#endif
