*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:51:04  mclareni
* Initial revision
*
*
#include "kernapo/pilot.h"
      SUBROUTINE SBYT (IT,IZW,IZP,NZB)
C
C CERN PROGLIB# M421    SBYT            .VERSION KERNAPO  1.00  831212
C ORIG. 12/12/83  JZ
C
      MASK = LSHFT (RSHFT(INT4(-1),32-NZB), IZP-1)

      IZW = OR (AND(NOT(MASK),IZW), AND(MASK,LSHFT(IT,IZP-1)))
      RETURN
      END
#ifdef CERNLIB_TCGEN_SBYT
#undef CERNLIB_TCGEN_SBYT
#endif
