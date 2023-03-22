*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:24  mclareni
* Initial revision
*
*
#include "kerndge/pilot.h"
      SUBROUTINE CBYT (IA,LA,IZW,IZP,NZB)
C
C CERN PROGLIB# M421    CBYT            .VERSION KERNDGE  1.01  860217
C ORIG. 03/02/86  JZ
C
C
      CALL MVBITS (IA,LA-1,NZB,IZW,IZP-1)
      RETURN
      END
#ifdef CERNLIB_TCGEN_CBYT
#undef CERNLIB_TCGEN_CBYT
#endif
