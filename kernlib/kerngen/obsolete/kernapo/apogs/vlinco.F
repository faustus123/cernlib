*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:51:06  mclareni
* Initial revision
*
*
#include "kernapo/pilot.h"
      SUBROUTINE VLINCO (A,ALPHA,B,BETA,X,N)
C
C CERN PROGLIB# F121    VLINCO          .VERSION KERNAPO  1.17  890626
C ORIG. 30/05/89     FCA
C
      DIMENSION A(*), B(*), X(*)

      IF(N.GT.0) THEN
        CALL VEC_$MULT_CONSTANT (A,N,ALPHA,X)
        CALL VEC_$MULT_ADD (X,B,N,BETA,X)
      ENDIF
      END
#ifdef CERNLIB_TCGEN_VLINCO
#undef CERNLIB_TCGEN_VLINCO
#endif
