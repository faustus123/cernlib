*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:25  mclareni
* Initial revision
*
*
#include "kerndge/pilot.h"
      FUNCTION LOCF (AM)
C
C CERN PROGLIB#         LOCF            .VERSION KERNDGE  1.01  860217
C ORIG. 03/02/86  JZ
C
      DIMENSION AM(9)
 
      LOCF= WORDADDR (AM(1)) /2
      RETURN
      END
#ifdef CERNLIB_TCGEN_LOCF
#undef CERNLIB_TCGEN_LOCF
#endif
