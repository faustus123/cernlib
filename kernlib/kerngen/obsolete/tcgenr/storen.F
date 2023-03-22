*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:53:27  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      SUBROUTINE STOREN(IWORD,J,NO,N)
C
C
   10 IF(IWORD.LT.0) IWORD=-IWORD
      IPOWER=N**(J-1)
      IWORD=(IWORD/(N*IPOWER))*(N*IPOWER)
     1      +MOD(NO,N)*IPOWER
     2      +MOD(IWORD,IPOWER)
      RETURN
      END
C
