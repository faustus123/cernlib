*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:51:04  mclareni
* Initial revision
*
*
#include "kernapo/pilot.h"
      SUBROUTINE SBIT0 (IZW,IZP)
C
C CERN PROGLIB# M421    SBIT0           .VERSION KERNAPO  1.00  831212
C ORIG. 12/12/83  JZ
C
      IZW = AND (IZW, NOT(LSHFT(1,IZP-1)))
      RETURN
      END
#ifdef CERNLIB_TCGEN_SBIT0
#undef CERNLIB_TCGEN_SBIT0
#endif
