*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:19  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
      SUBROUTINE FCN1(M,N,F,X,IFLAG,NW,W,KEND,KEND2N)
C     THIS SUBROUTINE WILL BE MODIFIED AND USED FOR CONDITIONED MINIMIZ.
      DIMENSION F(M),X(N),W(NW)
      CALL FCN(M,N,F,X,IFLAG)
      RETURN
      END
