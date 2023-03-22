*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:29  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if (defined(CERNLIB_DOUBLE))&&(!defined(CERNLIB_QMIBMVF))
      SUBROUTINE SCATTER(NW,OUT,INDX,HIN)
C
C CERN PROGLIB# F122    SCATTER         .VERSION GEN      2.30  890530
C ORIG. 30/05/89        F. Antonelli IBM, FCA
C
      DIMENSION OUT(*), INDX(*), HIN(*)
C
      DO 10 J=1, NW
        OUT(INDX(J)) = HIN(J)
  10  CONTINUE
C
      END
#endif
