*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:53:18  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      SUBROUTINE SLEEPF (ISEC)
C
C CERN PROGLIB#    Z265 SLEEPF          .VERSION KERNIBM  2.33  920229
C ORIG. 08/03/91, Harald Keller / DESY
C Fortran interface to SLEEP
C
      DATA CYCLE/26E-6/

      NCYCS=IFIX(1./CYCLE) * ISEC
      CALL DELAY(NCYCS)
      RETURN
      END
