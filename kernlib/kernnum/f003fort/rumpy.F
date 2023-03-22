*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:59  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          RUMPY(N,U,U12,U22,Y,Y2,Z,Z2)
          REAL                U(*),U12(*),U22(*),Y(*),Y2(*),Z(*),Z2(*)
#if defined(CERNLIB_NUMRDBLE)
          REAL                A, B
          DOUBLE PRECISION    SUM, ZERO, F
          F(A,B,SUM)  =  DBLE(A)*DBLE(B) + SUM
          DATA ZERO    / 0.D0 /
#endif
#if !defined(CERNLIB_NUMRDBLE)
          REAL                A, B, SUM, ZERO, F
          F(A,B,SUM)  =  A*B + SUM
          DATA ZERO    / 0. /
#endif
          IF(N .LE. 0)  RETURN
#include "rujk.inc"
#include "ryj.inc"
#include "rzi.inc"
#include "umpy.inc"
