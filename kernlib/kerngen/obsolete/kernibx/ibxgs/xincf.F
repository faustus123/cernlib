*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:43  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      SUBROUTINE XINCF (LUN,XBV,NXB)
C
C CERN PROGLIB# Z203    XINCF           .VERSION KERNIBX  1.00  900101
C
      DIMENSION    XBV(NXB)
C
      READ (LUN,8000,END=61,ERR=64) XBV
      RETURN
C
   61 NXB = 0
      RETURN
C
   64 NXB = -7
      READ (LUN,8000) N
      RETURN
C
 8000 FORMAT (200(90A4))
      END
#ifdef CERNLIB_XVECT_XINCF
#undef CERNLIB_XVECT_XINCF
#endif
