*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:34  mclareni
* Initial revision
*
*
#include "kerncry/pilot.h"
      SUBROUTINE KERNGT (LUN)
C
C CERN PROGLIB# Z001    KERNGT          .VERSION KERNCRY  1.10  890322
C ORIG. 16/03/89  JZ
C
C--   Store Pam title into /SLATE/ for printing by GSHOWF
C
      COMMON /SLATE/ MCH(40)

      CALL UBLOW (
     + 40H CPP_TITLE                 
     +,  MCH,40)
      CALL GSHOWF (LUN)
      RETURN
      END
#ifdef CERNLIB_TCGEN_KERNGT
#undef CERNLIB_TCGEN_KERNGT
#endif
#include "kerncry/TITLE.kerncry"
