*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:53:29  mclareni
* Initial revision
*
*
#include "kernnxt/pilot.h"
      SUBROUTINE KERNGT (LUN)
C
C CERN PROGLIB# Z001    KERNGT          .VERSION KERNNXT  1.00  901105
C ORIG. 16/03/89  JZ
C
C--   Store Pam title into /SLATE/ for printing by GSHOWF
C
      COMMON /SLATE/ MCH(40)
 
      ENTRY      GSHOW(LUN)
 
      CALL UBLOW (
     + 40H CPP_TITLE                 
     +,  MCH,40)
      CALL GSHOWF (LUN)
      RETURN
      END
#ifdef CERNLIB_TCGEN_KERNGT
#undef CERNLIB_TCGEN_KERNGT
#endif
#ifdef CERNLIB_TCGEN_GSHOW
#undef CERNLIB_TCGEN_GSHOW
#endif
#include "kernnxt/TITLE.kernnxt"
