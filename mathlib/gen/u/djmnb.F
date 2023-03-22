*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:01:47  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if !defined(CERNLIB_DOUBLE)
      FUNCTION DJMNB(AJ,AM,AN,BETA)
      DJMNB = RDJMNB(AJ,AM,AN,BETA)
      END
#endif
