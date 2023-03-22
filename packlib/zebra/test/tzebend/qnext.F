*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 10:47:04  mclareni
* Initial revision
*
*
#include "test_include/pilot.h"
      SUBROUTINE QNEXT

C-    Dummy QNEXT for the test run

#include "zebra/zunit.inc"


      WRITE (IQLOG,9001)
 9001 FORMAT (1X/' *******   DUMMY QNEXT REACHED.')

      IF (IQTYPE.NE.0)  WRITE (IQTYPE,9002)
 9002 FORMAT (' STOP IN DUMMY QNEXT.')

      STOP
      END
*      ==================================================
#include "zebra/qcardl.inc"
