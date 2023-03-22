*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:53:24  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      FUNCTION BCDWD (NVECT,NCH)
C
C
      COMMON /SLATE/A,B(10),XQX(29)
      DIMENSION NVECT(10)
C
C
      N= NCH
      DO 7 I=1,N
    7 B(I)= AFROMI(NVECT(I))
      CALL UBUNCH (B,BCDWD,N)
      RETURN
      END
