*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:53  mclareni
* Initial revision
*
*
#include "kerngent/pilot.h"
      SUBROUTINE PRTEST

#include "kerngent/mkcde.inc"


      IF (NTEST.LE.0)        RETURN
      IF (NFAIL.NE.0)        GO TO 21

      WRITE (ITB,9007) (MTESTV(J),J=1,NTEST)
      NTEST = 0
      RETURN

   21 WRITE (ITB,9027) (MTESTV(J),J=1,NTEST)
      NTEST = 0
      RETURN

 9007 FORMAT (' Tests pass',10I6)
 9027 FORMAT (' TESTS FAIL',10I6)
      END
