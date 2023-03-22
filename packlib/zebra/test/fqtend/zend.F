*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 10:47:01  mclareni
* Initial revision
*
*
      SUBROUTINE ZEND

#undef CERNLIB_ZEBRA_ZSTATE_INC
#include "zebra/zstate.inc"
#include "zebra/zunit.inc"
C--------------    END CDE                             --------------


      CALL ZPHASE (-1)
      CALL FZENDI (0,'TX')
      CALL FZENDO (0,'TX')
      CALL MZEND

      IF (NQERR.EQ.0)              GO TO 99
      CALL ABEND
   99 CONTINUE
      STOP
      END
*      ==================================================
#include "zebra/qcardl.inc"
