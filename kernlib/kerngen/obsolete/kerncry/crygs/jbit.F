*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:35  mclareni
* Initial revision
*
*
#include "kerncry/pilot.h"
      FUNCTION JBIT (IZW,IZP)
C
C CERN PROGLIB# M421    JBIT            .VERSION KERNCRY  1.16  911111
C ORIG. 24/10/91  JZ
C
      JBIT = SHIFTR(IZW,IZP-1) .AND. 1
      RETURN
      END
#ifdef CERNLIB_TCGEN_JBIT
#undef CERNLIB_TCGEN_JBIT
#endif
