*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:59  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          CUMPS(N,U,U12,U22,Y,Y2,Z,Z2)
          COMPLEX             U(*),U12(*),U22(*),Y(*),Y2(*),Z(*),Z2(*)
          COMPLEX             A, B, SIGNF
#if !defined(CERNLIB_NUMCDBLE)
          COMPLEX             SUM, F
          F(A,B,SUM)  =  A*B + SUM
#endif
#if defined(CERNLIB_NUMCDBLE)
          COMPLEX*16          SUM, DC, F
          DC(A)       =  DCMPLX(DBLE(REAL(A)),DBLE(AIMAG(A)))
          F(A,B,SUM)  =  DC(A)*DC(B) + SUM
#endif
          SIGNF(A)  =  -A
          IF(N .LE. 0)  RETURN
#include "cujk.inc"
#include "cyj.inc"
#include "czi.inc"
#include "umpa.inc"
