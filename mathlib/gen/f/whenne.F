*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:31  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if (defined(CERNLIB_DOUBLE))&&(!defined(CERNLIB_QMIBMVF))
      SUBROUTINE WHENNE(NW,IN,INC,ITARGT,INDX,NFOUND)
C
C CERN PROGLIB# F122    WHENNE          .VERSION GEN      2.30  890530
C ORIG. 30/05/89        F. Antonelli IBM, FCA
C
      DIMENSION IN(*), INDX(*)
C
      NFOUND = 0
      IF(INC.GT.0) THEN
        IBEG = 1
        IEND = (NW-1)*INC+1
      ELSE
        IBEG = (1-NW)*INC+1
        IEND = 1
      END IF
      DO 10 J=IBEG, IEND, INC
        IF(IN(J).NE.ITARGT) THEN
          NFOUND = NFOUND+1
          INDX(NFOUND) = J
        END IF
  10  CONTINUE
C
      END
#endif
