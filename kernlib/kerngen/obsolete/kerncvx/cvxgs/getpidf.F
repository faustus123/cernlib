*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:23  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      SUBROUTINE GETPIDF (IPID)
C
C CERN PROGLIB#         GETPIDF         .VERSION KERNCVX  1.08  910806
C ORIG. 06/08/91, JZ
C Fortran interface routine to getpid
C
      INTEGER      GETPID

      IPID = GETPID ()
      RETURN
      END
#ifdef CERNLIB_CCGEN_GETPIDF
#undef CERNLIB_CCGEN_GETPIDF
#endif
