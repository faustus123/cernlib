*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 10:47:04  mclareni
* Initial revision
*
*
#include "test_include/pilot.h"
      PROGRAM TCMAIN

#include "zebra/zheadp.inc"
#include "zebra/zmach.inc"
#include "zebra/znatur.inc"
#include "zebra/zstate.inc"
#include "zebra/zunit.inc"
#include "test_include/cqc.inc"
#include "zebra/cqbkc.inc"
#include "zebra/mqsys.inc"
#include "test_include/testll.inc"
#include "test_include/mainiq.inc"
C--------------    END CDE                             --------------

      DIMENSION    LISTIN(4)

#include "test_include/tcmaindc.inc"
* Ignoring t=pass

      DATA  LISTIN / 3, 1,-1, 0 /


      CALL MZEBRA (LISTIN)
      CALL MZVERS


      CALL VZERO (IQCOPT,8)

*     INIT OF RECOVERY
*     SET UP OPTIONS

      CALL MZCOTE
      CALL ZEND
      END
*      ==================================================
#include "zebra/qcardl.inc"
