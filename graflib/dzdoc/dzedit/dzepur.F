*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/04 16:13:20  mclareni
* Initial revision
*
*
#include "dzdoc/pilot.h"
      SUBROUTINE DZEPUR
*     purge
#include "dzeditkeep.inc"
      CALL KUGETI(NKEEP)
      CALL RZPURG(NKEEP)
*      WRITE(*,*)' Maximum number of cycles purged:',IQUEST(11)
      END
***********************************************************************
 
