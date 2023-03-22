*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:53:26  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      FUNCTION JTHN(IWORD,J,N)
C
C
      NPOWER = N**(J-1)
      IF(J.EQ.1) NPOWER=1
      JTHN = MOD(IWORD/NPOWER,N)
      RETURN
      END
