*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:26  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      FUNCTION KILLF (IPID,ISIG)
C
C CERN PROGLIB#         KILLF           .VERSION KERNCVX  1.08  910806
C ORIG. 06/08/91, JZ
C Fortran interface routine to kill
C

      KILLF = KILL (IPID,ISIG)
      RETURN
      END
#ifdef CERNLIB_CCGEN_KILLF
#undef CERNLIB_CCGEN_KILLF
#endif
