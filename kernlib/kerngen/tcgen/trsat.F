*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:49:54  mclareni
* Initial revision
*
*
#include "kerngen/pilot.h"
      SUBROUTINE TRSAT (S,A,B,M,N)
C
C CERN PROGLIB# F112    TRSAT           .VERSION KERNFOR  4.15  861204
C ORIG. 18/12/74 WH
C
#if defined(CERNLIB_INTDOUBL)
      DOUBLE PRECISION SUM
#endif
      DIMENSION S(*),A(*),B(*)
C
      MN = M*N
      INDS = 0
      IB = 0
      I = 0
C
    5 INDS = INDS + I
      IA = 0
C
      DO 40 J=1,N
      IS = INDS
      SUM = 0.
      K = 0
C
   10 IF (K.GT.I)             GO TO 20
      IS = IS + 1
        GO  TO                30
   20 IS = IS + K
   30 IA = IA + 1
      SUM = SUM + S(IS)*A(IA)
      K = K + 1
      IF (K.LT.M)             GO TO 10
      IB = IB + 1
   40 B(IB) = SUM
      I = I + 1
      IF (I.LT.M)             GO TO 5
C
      RETURN
      END
