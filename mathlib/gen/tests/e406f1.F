*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:01:25  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
      FUNCTION E406F1(C,N,X)
C     This function calculates the sum of the Chebyshev series,
#include "gen/def64.inc"
     +      E406F1,C(0:128),X,T
      E406F1=C(0)
      DO 500 K=1,N
         T= COS( K*ACOS(X) )
         E406F1=E406F1+(T*C(K))
500   CONTINUE
      RETURN
      END

