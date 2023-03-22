*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:01:58  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
      COMPLEX FUNCTION RGAM(Z,A,B)

      COMPLEX Z,A,B,CLOGAM

      RGAM=EXP(CLOGAM(Z+A)-CLOGAM(Z+B))
      RETURN
      END
