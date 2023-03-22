*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 10:47:04  mclareni
* Initial revision
*
*
#include "test_include/pilot.h"
      SUBROUTINE ZEND

#include "zebra/zstate.inc"
#include "zebra/zunit.inc"
C--------------    END CDE                             --------------


      CALL ZPHASE (-3)
      CALL MZEND

      IF (NQERR.EQ.0)              GO TO 99
      CALL ABEND
   99 CONTINUE
      STOP
      END
*      ==================================================
#include "zebra/qcardl.inc"
