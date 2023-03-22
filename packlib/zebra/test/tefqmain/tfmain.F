*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 10:47:03  mclareni
* Initial revision
*
*
      PROGRAM TFMAIN

#include "test_include/cqc.inc"
C--------------    END CDE                             --------------
      DIMENSION    PSEUDO(6200)

      DIMENSION    LISTIN(4)

#include "test_include/tfmaindc.inc"
* Ignoring t=pass

      DATA  LISTIN / 3, 1,-1, 0 /


      CALL MZEBRA (LISTIN)
      CALL MZVERS


      CALL VZERO (IQCOPT,8)

*     INIT OF RECOVERY
*     SET UP OPTIONS

      CALL FQTEST
      CALL ZEND
      END
*      ==================================================
#include "zebra/qcardl.inc"
