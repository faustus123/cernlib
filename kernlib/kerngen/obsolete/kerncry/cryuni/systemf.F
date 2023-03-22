*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:42  mclareni
* Initial revision
*
*
#include "kerncry/pilot.h"
      INTEGER FUNCTION SYSTEMF (CMD)
C
C CERN PROGLIB#         SYSTEMF         .VERSION KERNCRY  1.15  910318
C ORIG. 19/06/91, Miguel Marquina
C Fortran interface routine to ISHELL
      CHARACTER*(*) CMD

      SYSTEMF = ISHELL (CMD)
      RETURN
      END
#ifdef CERNLIB_CCGEN_SYSTEMF
#undef CERNLIB_CCGEN_SYSTEMF
#endif
#ifdef CERNLIB_CCGEN_SYSTEI
#undef CERNLIB_CCGEN_SYSTEI
#endif
