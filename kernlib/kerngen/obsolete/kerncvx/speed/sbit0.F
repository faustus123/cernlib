*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:29  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      SUBROUTINE SBIT0(IX,J)
C
C CERN PROGLIB# M421    SBIT0           .VERSION KERNCVX  1.00  890315
C ORIG. 01/01/89  AGA+MAV, Convex
C

      IX = IBCLR(IX,J-1)

      RETURN
      END
#ifdef CERNLIB_TCGEN_SBIT0
#undef CERNLIB_TCGEN_SBIT0
#endif
