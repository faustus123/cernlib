*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:38  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
      SUBROUTINE EISCH4(NM,N,AR,AI,RLB,RUB,MM,M,WR,IERR,WORK)
C     SOME EIGENVALUES OF A COMPLEX HERMITIAN MATRIX
C
      DIMENSION AR(NM,NM),AI(NM,NM),WR(MM),WORK(1)
      CALL HTRIDI(NM,N,AR,AI,WORK,WORK(N+1),WORK(2*N+1),WORK(3*N+1))
      EPS1=0.0
      CALL BISECT(N,EPS1,WORK,WORK(N+1),WORK(2*N+1),RLB,RUB,MM,M,WR,
     X WORK(5*N+1),IERR,WORK(3*N+1),WORK(4*N+1))
      RETURN
      END
