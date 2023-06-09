*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:49:06  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE VRAN3S(RADIUS,N,X,Y,Z,T)
          REAL      RADIUS,   X(N),     Y(N),     Z(N),     T(N)
          REAL                A(65),    B(65),    C(65),    W(65)
          SAVE      KAPPA ,   A    ,    B    ,    C    ,    W
          DATA      KAPPA     /  64  /
          IF(N .LT. 1)  RETURN
          DO 11     I  =  1, N
             X(I)  =  2.*RANF() - 1.
             Y(I)  =  2.*RANF() - 1.
             Z(I)  =  2.*RANF() - 1.
             T(I)  =  X(I)**2 + Y(I)**2 + Z(I)**2
  11         CONTINUE
          J  =  0
  20      J  =  J + 1
          IF(J .GT. N)  GOTO 30
          IF(T(J) .LE. 1.)  GOTO 20
  21      KAPPA  =  KAPPA + 1
          IF(KAPPA .GT. 64)  THEN
             DO 22  I  =  1, 64
                A(I)  =  2.*RANF() - 1.
                B(I)  =  2.*RANF() - 1.
                C(I)  =  2.*RANF() - 1.
                W(I)  =  A(I)**2 + B(I)**2 + C(I)**2
  22            CONTINUE
             KAPPA  =  1
          ENDIF
          IF(W(KAPPA) .GT. 1.)  GOTO 21
             X(J)  =  A(KAPPA)
             Y(J)  =  B(KAPPA)
             Z(J)  =  C(KAPPA)
             T(J)  =  W(KAPPA)
          GOTO 20
  30      DO 31     I  =  1, N
             T(I)  =  RADIUS / SQRT(T(I))
             X(I)  =  T(I)*X(I)
             Y(I)  =  T(I)*Y(I)
             Z(I)  =  T(I)*Z(I)
  31         CONTINUE
          RETURN
          END
