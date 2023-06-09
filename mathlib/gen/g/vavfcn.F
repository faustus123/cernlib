*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:46  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
      FUNCTION VAVFCN(X,RKA,BE2)
C
      COMMON /VAVILI/ T0,T1,T,OMEGA
      COMMON /FORFCN/ SS,LFCN
      DATA E,PI,RG /5E-4, 3.1415926535898, 0.5772156649015/
C
      GO TO (1,2,3), LFCN
C
C     FOR LFCN=1 FCN IS USED TO DETERMINE THE NUMBER N OF FOURIER
C     COEFFICIENTS IN DISVAV(X,I)
C
    1 RN=5.
      IF(RKA .GE. 0.07) RN=8.
      VAVFCN=RKA*(2.+BE2*RG)-1.596312592
     1   +BE2*RKA*LOG(OMEGA*X/RKA)-0.5*OMEGA*PI*X+2.302585093*RN
      RETURN
C
C     FOR LFCN=2 FCN IS USED TO DETERMINE THE SS-QUANTILE OF THE
C     VAVILOV DISTRIBUTION
C
    2 VAVFCN=DISVAV(X,1)-SS
      RETURN
C
C     FOR LFCN=3 FCN IS USED TO DETERMINE THE RIGHT-HAND ENDPOINT T+
C     OF THE SUPPORT OF DISVAV(X,0)
C
    3 VAVFCN=1.-BE2*(1.-RG)-LOG(E)/RKA-X+BE2*(LOG(ABS(X))+EXPINT(X))
     1    -(1.-BE2)*EXP(-X)
      RETURN
C
      END
