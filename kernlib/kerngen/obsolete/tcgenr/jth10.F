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
      FUNCTION JTH10 (IWORD,J)
C
C
      NPOWER=10**(J-1)
      IF (J.EQ.1) NPOWER=1
      JTH10=MOD (IWORD/NPOWER,10)
      RETURN
      END
