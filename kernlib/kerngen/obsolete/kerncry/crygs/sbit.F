*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:36  mclareni
* Initial revision
*
*
#include "kerncry/pilot.h"
      SUBROUTINE SBIT (MZ,IZW,IZP)
C
C CERN PROGLIB# M421    SBIT            .VERSION KERNCRY  1.16  911111
C ORG. 24/10/91, JZ
C
      IZW = (IZW .AND. SHIFT(MASK(65),IZP))
     +            .OR. SHIFT(MZ.AND.MASK(127),IZP-1)
      RETURN
      END
#ifdef CERNLIB_TCGEN_SBIT
#undef CERNLIB_TCGEN_SBIT
#endif
