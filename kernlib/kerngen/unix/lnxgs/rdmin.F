*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:50:06  mclareni
* Initial revision
*
*
#include "kerngen/pilot.h"
        SUBROUTINE RDMIN(ISEED)
        COMMON /MCGN/ MCGN

C--       Set the seed
      MCGN = ISEED
      RETURN

C--       Get the seed
      ENTRY RDMOUT (ISEED)
      ISEED = MCGN
      END
