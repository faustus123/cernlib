*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:51:03  mclareni
* Initial revision
*
*
#include "kernapo/pilot.h"
      FUNCTION MSBYT (MZ,IZW,IZP,NZB)
C
C CERN PROGLIB# M421    MSBYT           .VERSION KERNAPO  1.10  870524
C ORIG. 19/05/87  JZ
C

      MSBYT = OR ( AND (IZW
     +                , NOT(LSHFT (RSHFT(NOT(INT4(0)),32-NZB), IZP-1)))
     +          ,  RSHFT (LSHFT(MZ,32-NZB), 33-IZP-NZB) )
      RETURN
      END
#ifdef CERNLIB_TCGEN_MSBYT
#undef CERNLIB_TCGEN_MSBYT
#endif
