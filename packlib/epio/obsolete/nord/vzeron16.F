*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:21:57  mclareni
* Initial revision
*
*
#include "epio/pilot.h"
#if defined(CERNLIB_ND100B16)
      SUBROUTINE VZERO(IARR,NA)
C. ZERO INTEGER ARRAY
      INTEGER*2 IARR(2),NA,ZERO
      DATA ZERO/0/
      IF(NA.LE.ZERO) GOTO 77777
      DO 1 I=1,NA
    1 IARR(I)=0
77777 RETURN
      END
#endif
