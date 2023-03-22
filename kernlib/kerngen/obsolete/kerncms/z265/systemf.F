*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:51:53  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      INTEGER FUNCTION SYSTEMF (NAME)
C
C CERN PROGLIB#    Z265 SYSTEMF         .VERSION KERNCMS  1.05  910308
C ORIG. 08/03/91, Miguel Marquina
C Fortran interface routine to system
C
      CHARACTER    NAME*(*)
 
      LGN  = LNBLNK (NAME)
      CALL VMCMS(NAME(1:LGN),IRC)
      SYSTEMF = IRC
      RETURN
      END
