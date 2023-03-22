*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:01:25  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
      FUNCTION E406F3(X)
C     Here we have to specify an even function
#include "gen/def64.inc"
     +   E406F3,X,NUMTOL
      NUMTOL=1D-10
      IF (ABS(X-0D0) .LT. NUMTOL) THEN
         E406F3=1D0
      ELSE
         E406F3= ATAN(X)/X
      ENDIF
      RETURN
      END

