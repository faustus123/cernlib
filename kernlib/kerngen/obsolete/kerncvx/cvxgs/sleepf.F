*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:27  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      SUBROUTINE SLEEPF (NSECS)
C
C CERN PROGLIB#         SLEEPF          .VERSION KERNCVX  1.08  910806
C ORIG. 06/08/91, JZ
C Fortran interface routine to sleep
C

      CALL SLEEP (NSECS)
      RETURN
      END
#ifdef CERNLIB_CCGEN_SLEEPF
#undef CERNLIB_CCGEN_SLEEPF
#endif
