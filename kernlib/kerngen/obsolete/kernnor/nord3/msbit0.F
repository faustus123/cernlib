*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:48  mclareni
* Initial revision
*
*
#include "kernnor/pilot.h"
      FUNCTION MSBIT0 (IZW,IZP)
C
C CERN PROGLIB# M421    MSBIT0          .VERSION KERNNOR  2.04  870524
C ORIG. 19/05/87  JZ
C
      MSBIT0 = IAND (IZW, NOT(ISHFT(1,IZP-1)) )
      RETURN
      END
#ifdef CERNLIB_TCGEN_MSBIT0
#undef CERNLIB_TCGEN_MSBIT0
#endif
