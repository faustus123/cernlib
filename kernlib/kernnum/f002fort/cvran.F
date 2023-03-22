*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:51  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          CVRAN(N,A,B,Z,Z2)
          COMPLEX             A, B, C, Z(*), Z2(*)
          IF(N .LE. 0)  RETURN
          LZJ  =  1
#include "czj.inc"
          C    =  B - A
          DO 10     J  =  1, N
             Z(LZJ)  =  CMPLX(REAL(C)*RANF() + REAL(A),
     +                  AIMAG(C)*RANF() + AIMAG(A))
             LZJ     =  LZJ + JZ
  10         CONTINUE
          RETURN
          END
