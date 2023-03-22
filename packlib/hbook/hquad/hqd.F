*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/16 17:07:59  mclareni
* Initial revision
*
*
#include "hbook/pilot.h"
*CMZ :  4.17/01 22/11/92  12.11.50  by  John Allison
*-- Author :
#if defined(CERNLIB_DOUBLE)
      DOUBLE PRECISION FUNCTION HQD (V)
#endif
#if !defined(CERNLIB_DOUBLE)
      REAL FUNCTION HQD (V)
#endif
      REAL V (*)
* Determines sum of multiquadrics.
* V is coordinate vector in plot coordinates.
 
#include "hbook/hcqcom.inc"
#include "hbook/hcqcor.inc"
 
      INTEGER J
#if defined(CERNLIB_DOUBLE)
      DOUBLE PRECISION HQDJ
#endif
#if !defined(CERNLIB_DOUBLE)
      REAL HQDJ
#endif
 
      HQD = 0.
 
      DO 10    J = 1, NSIG
         HQD = HQD + SIGA (J) * HQDJ (V, J)
   10 CONTINUE
 
      END
