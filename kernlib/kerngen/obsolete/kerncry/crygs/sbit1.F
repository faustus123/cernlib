*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:37  mclareni
* Initial revision
*
*
#include "kerncry/pilot.h"
      SUBROUTINE SBIT1 (IZW,IZP)
C
C CERN PROGLIB# M421    SBIT1           .VERSION KERNCRY  1.16  911111
C ORG. 24/10/91, JZ
C
      IZW =  IZW .OR. SHIFT(MASK(1), IZP)
      RETURN
      END
#ifdef CERNLIB_TCGEN_SBIT1
#undef CERNLIB_TCGEN_SBIT1
#endif
