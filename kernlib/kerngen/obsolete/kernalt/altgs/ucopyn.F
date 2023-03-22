*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:50:54  mclareni
* Initial revision
*
*
#include "kernalt/pilot.h"
      SUBROUTINE UCOPYN (IA,IX,N)
C
C CERN PROGLIB# V301    UCOPYN          .VERSION KERNALT  1.00  880212
C ORIG. 15/02/88 JZ
C
      DIMENSION    IA(99), IX(99)
 
      IF (N.EQ.0)            RETURN
 
      IX(1:N) = -IA(1:N)
      RETURN
      END
#ifdef CERNLIB_TCGEN_UCOPYN
#undef CERNLIB_TCGEN_UCOPYN
#endif
