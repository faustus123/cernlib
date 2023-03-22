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
      SUBROUTINE SBIT1 (IX,J)
C
C CERN PROGLIB# M421    SBIT1           .VERSION KERNCVX  1.00  890315
C ORIG. 01/01/89  AGA+MAV, Convex
C

      IX = IBSET(IX,J-1)

      RETURN
      END
#ifdef CERNLIB_TCGEN_SBIT1
#undef CERNLIB_TCGEN_SBIT1
#endif
