*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:46  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
      FUNCTION DINVAV(X)
C
C     DINVAV(X) COMPUTES THE VALUE OF THE INVERSE OF THE CONDITIONAL
C     CUMULATIVE DISTRIBUTION FUNCTION OF THE VAVILOV DISTRIBUTION
C     AT THE POINT X
C
      COMMON /VAVILA/ B(200),S,TT
      COMMON /VAVILI/ T0,T1,T,OMEGA
C
      Z=3.1415926535898*X
      COF=2.*COS(Z)
      C1=0.
      C0=B(1)
C
      DO 1 K = 2,200
      C2=C1
      C1=C0
    1 C0=B(K)+COF*C1-C2
C
      DINVAV=T0+TT*X+C0*SIN(Z)
      RETURN
C
      END
