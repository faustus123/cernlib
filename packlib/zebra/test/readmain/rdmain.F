*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 10:47:03  mclareni
* Initial revision
*
*
      PROGRAM RDMAIN

#include "zebra/zheadp.inc"
#include "zebra/zmach.inc"
#include "zebra/znatur.inc"
#include "zebra/zstate.inc"
#include "zebra/zunit.inc"
C--------------    END CDE                             --------------

      DIMENSION    LISTIN(4)


      DATA  LISTIN / 3, 1,-1, 0 /


      CALL MZEBRA (LISTIN)
      CALL MZVERS


      CALL FQREAD
      CALL ZEND
      END
*      ==================================================
#include "zebra/qcardl.inc"
