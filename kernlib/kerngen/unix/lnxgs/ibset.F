*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:50:06  mclareni
* Initial revision
*
*
#include "kerngen/pilot.h"
      FUNCTION IBSET(IZW,IZP)
      IBSET =  OR (IZW,LSHIFT(1,IZP))
      RETURN
      END
