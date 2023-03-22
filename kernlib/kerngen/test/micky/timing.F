*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:53  mclareni
* Initial revision
*
*
#include "kerngent/pilot.h"
      SUBROUTINE TIMING(TINF)

#include "kerngent/mkcde.inc"

      DIMENSION TINF(4),INF(5)


      CALL TIMED (TIMERD)
      INF(5) = 1000. * TIMERD

      IF (NTEST.NE.0)        CALL PRTEST

      CALL UCOPY (TINF,INF,4)
      WRITE (ITB,9000) INF
      RETURN

 9000 FORMAT (1X,I12,' CALLS TO ',A6,' FOR',I6,1X,A6,'  TOOK',I6,
     F' MILLI-SECONDS.')
      END
