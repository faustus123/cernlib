*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:35  mclareni
* Initial revision
*
*
#include "kerncry/pilot.h"
      FUNCTION JBYTET (MZ,IZW,IZP,NZB)
C
C CERN PROGLIB# M421    JBYTET          .VERSION KERNCRY  1.06  870527
C ORIG. 19/05/87  JZ
C
      JBYTET = MZ .AND. SHIFTR (IZW,IZP-1) .AND. MASK(128-NZB)
      RETURN
      END
#ifdef CERNLIB_TCGEN_JBYTET
#undef CERNLIB_TCGEN_JBYTET
#endif
