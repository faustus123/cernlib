*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 10:46:59  mclareni
* Initial revision
*
*
#include "test_include/pilot.h"
      SUBROUTINE CQDTAB (IFLAG)

C-    Print memory tables for debug printing only



      CALL CQMOTA (-7, IFLAG)
      CALL CQLRTA (-7, IFLAG)
      RETURN
      END
*      ==================================================
#include "zebra/qcardl.inc"
