*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:20  mclareni
* Initial revision
*
*
#include "cspack/pilot.h"
#if defined(CERNLIB_MMAP)
      SUBROUTINE ZSLISTM(IGOFF)
*.==========>
*.           To list  histograms in shared memory IPAWD (control routine)
*..=========> ( R.Brun)
#include "cspack/hcbook.inc"
*
      CALL ZSLISM(LQ(IGOFF+1))
      END
#endif
