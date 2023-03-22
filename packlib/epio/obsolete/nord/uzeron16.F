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
      SUBROUTINE UZERO(IARR,N1,N2)
C. ZERO ARRAY FROM N1 TO N2
      INTEGER*2 IARR(2),N1,N2,ZERO
      DATA ZERO/0/
      IF(N1.LE.ZERO .OR. N1.GT.N2) GOTO 77777
      DO 1 I=N1,N2
    1 IARR(I)=0
77777 RETURN
      END
#endif
