*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:50  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
#if (!defined(CERNLIB_ASSEMB))&&(defined(CERNLIB_OLD))
*CMZ :  1.11/01 24/01/91  11.37.02  by  Rene Brun
*-- Author : V.Berezhnoi
      FUNCTION CIFNCL(NAME,N,P1,P2,P3,P4,P5,P6,P7,P8,P9,P10)
      INTEGER CIFNCL
      EXTERNAL NAME
      IF (N.EQ.0)THEN
      CIFNCL=NAME()
      ELSE
      GO TO (1,2,3,4,5,6,7,8,9,10),N
 1    CIFNCL=NAME(P1)
      GO TO 99
 2    CIFNCL=NAME(P1,P2)
      GO TO 99
 3    CIFNCL=NAME(P1,P2,P3)
      GO TO 99
 4    CIFNCL=NAME(P1,P2,P3,P4)
      GO TO 99
 5    CIFNCL=NAME(P1,P2,P3,P4,P5)
      GO TO 99
 6    CIFNCL=NAME(P1,P2,P3,P4,P5,P6)
      GO TO 99
 7    CIFNCL=NAME(P1,P2,P3,P4,P5,P6,P7)
      GO TO 99
 8    CIFNCL=NAME(P1,P2,P3,P4,P5,P6,P7,P8)
      GO TO 99
 9    CIFNCL=NAME(P1,P2,P3,P4,P5,P6,P7,P8,P9)
      GO TO 99
 10   CIFNCL=NAME(P1,P2,P3,P4,P5,P6,P7,P8,P9,P10)
 99   CONTINUE
      ENDIF
      END
#endif
